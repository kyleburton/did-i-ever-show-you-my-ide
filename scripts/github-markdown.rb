#!/usr/bin/env ruby

# render.rb
require 'github/markdown'
require 'filewatcher'
require 'sinatra'
require 'sinatra/json'


$footer = File.join(File.dirname(__FILE__), 'public_html', 'app.js')
$last_render = 0

def render_markdown(fname)
  $last_render = $last_render + 1
  markdown = GitHub::Markdown.render_gfm File.read(fname)
  return markdown + "<script>" + File.read($footer) + "</script>"
end


fname = ARGV[0]
# server = TCPServer.new 8888

markdown = render_markdown(fname)

Thread.new {
  Filewatcher.new(['.', fname]).watch do |changes|
    puts "RENDERING: fname=#{fname} changes=#{changes}"
    markdown = render_markdown(fname)
    # changes.each do |filename, event|
    #   puts "RENDERING: #{filename} #{event}"
    #   markdown = render_markdown(fname)
    # end
  end
}

# while session = server.accept
#   request = session.gets
#   puts request
#   # require 'pry'; binding.pry
#   # TODO: only return the rendered contet if the request is for '/'
#
#   session.print "HTTP/1.1 200\r\n" # 1
#   session.print "Content-Type: text/html\r\n" # 2
#   session.print "\r\n" # 3
#   session.print markdown
#   session.print "<script>document.krb = document.krb || setInterval(function () { location.reload(); console.log(\"refreshing\") }, 1000)</script>"
#
#   session.close
# end


get '/' do
  markdown
end

get '/last-render' do
  json :last_render => $last_render
end
