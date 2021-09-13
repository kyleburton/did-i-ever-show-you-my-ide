# Overview

#### The Machine of Lum the Mad
> **aka Did I Ever Show You My IDE?**

- Riot Games 2021

What this is not: this is not an advocacy piece for any of: Clojure, Bash, Unix, Emacs, Vim or any other specific program or technology that I use to demonstrate the ideas or concepts in this talk.  If you or your team are not currently using one of these (espeically something like Clojure or Emacs) ... well, to be clear: I'm definitely not advocating for you to adopt them :)

So if that is one of the (many) things that this is not, then what is this?

# The Machine of Lum the Mad

![The Machine of Lum the Mad](https://pbs.twimg.com/media/DRgS6g-VoAAKHiw?format=jpg&name=large)

Image From: [Jeptpack\_7](https://twitter.com/Jetpack\_7/status/943525060492582912/photo/1)

I like the description from the [forgotten realms](https://forgottenrealms.fandom.com/wiki/Machine_of_Lum_the_Mad) wiki:


> The Machine of Lum the Mad was an ancient artifact that had several dials and
> levers. Combinations entered by the users had either very beneficial or
> absolutely disastrous effects on them.

That definitly captures some of the mystery, awe, and whimsy that's often associated the unix environment.


```
> cowsay -f milk "'rm -rf /' is considered harmful even in $(date +%Y) (ask Kyle for the story about fuzzy)"
 _______________________________________
/ 'rm -rf /' is considered harmful even \
| in 2021 (ask Kyle for the story about |
\ fuzzy)                                /
 ---------------------------------------
 \     ____________
  \    |__________|
      /           /\
     /           /  \
    /___________/___/|
    |          |     |
    |  ==\ /== |     |
    |   O   O  | \ \ |
    |     <    |  \ \|
   /|          |   \ \
  / |  \_____/ |   / /
 / /|          |  / /|
/||\|          | /||\/
    -------------|
        | |    | |
       <__/    \__>

```

To me, its philosophical underpinnings are about composition, about discovering the new primitives and recomposing quickly.  Building up from the primitives towards the semantics of your problem space.

I suffer(?) from an uncontrollable urge to fit everything I see, touch and expeirence into a unified model or framework.  So I'm going to be spinning lots of philosophy and models, it's what I do, my hope is that they are valuable for you.

# BREAK / MENTAL PIVOT

So, where do we start?  Let's start with a model :-D

# I've Got 99^99 Problems ...

```
> echo '99^99' | bc | tr -d '\n\\'; echo
369729637649726772657187905628805440595668764281741102430259972423552570455277523421410650010128232727940978889548326540119429996769494359451621570193644014418071060667659301384999779999159200499899
```

I see a few phases to the way we approach developing and evolving our systems:

* problem domain
* soltuion domain
* implementation domain
* execution domain

I think different modes of thinking and (too often) different tooling is best suited for these different phases.

## Problem Domain

Do we know what the problem is we're solving?  Usually we don't, we think we do but as we try to solve it we understand it better.  Can we define it?  If we can't define it we can't solve it, we won't know if a feature or a change to the system will address our problem.  Ideally we understand this clearly, we know that what is part of the problem and that which is not.  Typically we don't hit this ideal and we need to act in the other domains - which crucially teach us more about the problem being solved.  The best and worst part of that is that what we learn changes the first principles or primitives we've used to define the problem and the other domains.  As best as possible we want to tighten this loop and be able to integrate those changes throughout our systems.

#### Tools and Approaches

* Thinking, Brainstorming, TRIZ
* Whiteboards
* Proposal and Analysis Documents
* Throw Away Expiremental Code
* Ad Hoc Analysis of existing Data

## Solution Domain

How do approach solving the problem that we think we have, as best as we understand it?  What data do we need to persist?  What's its life cycle?  What states can our system be in? Where do we need to protect against concurrency?  Where can we benefit from concurrency?  Do we know all algorithms we'll need?  Do we understand all the algorithms we'll need?  Do we need to invent new ones?

Our systems benefit when we can, as best as possible, conceptually separate our solution from implementation details.  The more the solution can be seen and understood by those looking at the system, separated from the constraints and limitations of the implementation, the better we'll be able to understand the system and maintain it.  The fewer errors and mistakes we'll make when operating it, and crucially when we're modifying it.

#### Tools and Approaches

* Design Documents
* Modelling - access patterns, capacity, performance
* Prototypes (iow: More Throw Away Experimental Code)
* Testing, be it performance or capacity

## Implementation Domain

Here we encounter constraints that interfere with both the problem and the solution.  We must chose types, we must consider storage space, memory capacity, bandwidth.  Monetary costs.  This is where we compromise, where we limit, we constrain.  Must we have performance gaurantees that question the fitness of GC?  Can we tolerate runtime type conversion errors?  Must we support unknown data schemas?

This is what, I think, most things that call themselves IDEs focus on and help reduce the iteration time of.

#### Tools and Approaches

* Code Eternal - that which will never be thrown away, at least not without much gnashing of teeth and waving of fists
* IDEs - compilers, linters, build tooling
* Automated Tests: unit, functional, integration
* Continuous Integration and Delivery

## Execution Domain

I see this as a different set of concerns than the implementation domain, here we have the live systems.  We benefit from being visibility into their behavior, being able to see traffic patterns and avaialble capacity.  Our ability to perform ad hoc inspection of live systems is often severly limited.  The more parts of your system that can be enabled, disabled, adjusted, tweaked, optimized or otherwise changed the more power you have, though at the same time the more risk you face.  It is impossible to test all combinations of settings to ensure they will keep the system within it's desired operating parameters, in fact we often look to change our systems in response to untested traffic patterns and workloads!

#### Tools and Approaches

* Telemetry
* Monitoring
* Alerting
* NewRelic's amazing JVM Agent Plugin
* `show full processlist`

# BREAK / MENTAL PIVOT

Why this framing?  Because I'm setting some context for how I want to think about your development environment and the kinds of things you want to do and how you want that environment supporting and influencing you.  I want to seemlessly move back and forth between these domains as I learn more about the problem, I want to propagate those valuable learnings back to the 'earlier' domains.  I don't want to be constrained.  I want my tools to foster and encourage explroation and learning in each of these domains.

I want my iteration time to be as short as possible.  My iterations close over all of these domains - to me iteration is not just within the implementation domain.

... so, lets talk about what an IDE is and if you and I have a similar understanding of what one is ... :)

# IDE - Integrated Development Environment

## Integrated:

  - formed or united into a whole
  - Having different groups treated together as equals in one group
  - To form into one whole; to make entire; to complete; to renew; to restore; to perfect

I really like that last one, it implies change, iteration and improvement, it's almost verb like.  To me, this speaks to composition, and abstraction.  Who doesn't like unity and equality?

As we develop and evolve our systems, it's good food for thought: what do we want `formed or united into a whole`?  The things we'll want will inevitably change over time ...

## Development:

  - The act of developing or disclosing that which is unknown; a gradual unfolding process by which anything is developed, ...; gradual advancement or growth through a series of progressive changes; also, the result of developing, or a developed state
  - a process in which something passes by degrees to a different stage (especially a more advanced or mature stage)

I love that "disclosing that which is unknown" - there are some good themes there: `disclosing the unknown` is about learning and discovery, progresssion and advancement.  I don't want this to be limited to code and tests though, remember, what I want is to move between the problem, soltuion, improvement and execution domains with agencey and efficiency.

If answering a question requires querying a remote database, I want to be able to do that quickly.  If I'm unsure of what an API endpoint returns, I want to query it to get real data that I can look at and analyze - I don't just want to be looking at a type declaration, I want the live data and I want to inspect it and I will want to manipulate it.

## Environment:

  - the totality of surrounding conditions
  - That which environs or surrounds; surrounding conditions, influences, or forces, by which living forms are influenced and modified in their growth and development

Surrounding conditions, influences, that which modifies growth and development.  The key part that relates to this talk / discussion is where this ends, what's its extent?  Do we have the same boundaries?

I'll admit, this could be seen as a bit of hubris or conceit.  A primary thing I'd like us to take away is to unbound this part of how we think about the different parts of our development environment - I want to see you connecting them, brignign the things that should be within easy reach and arranging things so.  If anyone has the power to create new things, it's you, software engineers.

## Unbounded:

  - Having no bound or limit; as, unbounded space; an, unbounded ambition
  - seemingly boundless in amount, number, degree, or especially extent

Where does your IDE begin and end?  Who is the IDE for?  For Java?  For the programming language? The compiler?  NO! It's for you, for the human.  It is for your **_systems_**.

Is MySQL Workbench an IDE?  Yes of sorts, but why is it separate (not integrated) with IntelliJ?  Even if MySQL Workbench is integrated with IntelliJ, it'll be a generic integration that won't take into consideration your systems, it can't possibly be adapted to your workflows, services, to your codebases.

That's the gap that we can't see b/c we're so used to it "just being there", we don't question it because our tools don't encourage us to.

Wouldn't we want to be able to access the data store through the same libraries and apis that our services are using?  That helps create consistency and repeatabiltiy.  It encourages us to build up from our primitves, it's a virtuous cycle.


# BREAK / MENTAL PIVOT

Ok, on the one hand that's a lot of hand-wavy weird philosophical mumbo jumbo.  This is how I think about touching this laptop, my workstation, this is how I want to think about my tools and my environment.

# [The Unix Philosohpy](https://en.wikipedia.org/wiki/Unix_philosophy)

* Make it easy to write, test, and run programs.
* Interactive use instead of batch processing.
* Economy and elegance of design due to size constraints ("salvation through suffering").
* Self-supporting system: all Unix software is maintained under Unix.

I think these lead to composition of smaller bits into larger bits, where you're pulling up the primitives to meet the sematics of your problem space.  In a bit I'm going to try to do some "live coding" and go through the motions demonstrating how I interact with my system.

# Hit the Terminal

The shell is an unbounded tool for interacting with your system - within the semantics of repeatability and automatability.  Everything you type at the terminal **<u>_is_</u>** a shell script.

VIM is an unbounded tool for manipulating text.  It provides primitives (motions and actions) that you compose to achieve your goals.  They typicall able to be composed in ways that scale.

Emacs is an unbounded tool to be extended and assimilate tools for exploring your problem, solution and implementation domians.  "You don't _use_ Emacs, you _extend_ it."  Emacs has deep roots in the Lisp community, the Lisp community values interactive development (but what they mean by interactive development isn't what I think most of us think it means).  [talk about how the CLHS has no 'exit']

Screen is a tool for composing my workspaces.

IntelliJ and Eclipse are amazing tools for writing and debugging code.  IMO they integrate (for me) a too finite set of aspects: manipulating code (they do this amazingly well); compilation (primarily focused on the language tooling); and debugging (mostly focused on artificial execution domains).

I think I've met programmers who don't like "stepping down" out of their Eclipse, IMO this tends to constrain their thinking to the implementation domain.


# Demonstrations

* You'll pick these up over time, especially if we collaborate with each other :)
* things take text, process text and emit text, this is more useful than you might think at first
* What I do with terminals, `named-screen`
* `rclone` why it exists, how it works
* Clojure the JVM and CIDER
* The tools I created recently - the purpose of the completion is to bring the info we need to where we need it when we need it.

## The things you'll see me type at the shell

aka The shells "all stars"

cut, grep, fgrep, tr, sort, uniq, tee, head, tail, jq, wc

You can simulate a lot of what you'd do in SQL at the shell.  The GNU bin utilities are extremely optimized and scale suprisingly well with large amounts of data.

ffn, what it is and why it exists

Generating a "histogram" using `cut`, `sort` `uniq -c` `sort -n`.

## Getting the most out of the terminal

Basic Emacs key bindings work at the shell:

* C-a
* C-e
* C-k
* C-y
* M-f
* M-b
* M-d
* C-n
* C-p
* C-r
* C-M-e

Using `echo` to see what's going to happen before you do it for real.

You build up complex shell piplines one step at a time ... testing each one as you go along.


## Shell Scripting Best Practices

Script it even if you're only going to do it once.  I'd like to talk about the idea of a `./scripts` or `./contrib` directory in our projects.  A spot where we can speak in repetable tools (executable documentation) vs having to read documentation (that we have to continually invest in) or worse yet, rely on the availability of another team member to talk us through things.

Start small!  Like just with the things you typed in your `history`.

The shell has a lot of history and backward compatability.  This is both a blessing and a curse.  It's great b/c if something worked before it's likely to work now.  It's terrible because sometimes bugs and unexpected behavior is eternalized.  Thankfully you can transcend the vast majority of those caess by using the amazing and comprehensive [`shellcheck`](https://github.com/koalaman/shellcheck) tool to lint and otherwise fix your scripts.

Paradoxically staying in one spot helps you learn from your history instead of repating it.

"stacking" multiple commands, make yourself a single button you can "push" to iterate.  Lets have a look at what I did with the recovery controller app and the tests I wrapped around it.

Adapting things that don't want to be adapted.

* involuntarily forcing stdin and stdout on things
* putting things where you want them `<()` and `$()`

```
echo $(echo three) <(echo three)
cat <(echo three)
echo three | cat
```

Always use `$()` please don't ever use \`\`


## Up Your Fancy

if, for, while loops.  Here docs.  Shell scripts generating shell scripts (riak object expiry fixer).


# Where to go from here

* [Bash Cookbook](https://www.oreilly.com/library/view/bash-cookbook-2nd/9781491975329/)
* [Learning the Bash Shell](https://www.oreilly.com/library/view/learning-the-bash/0596009658/)
* [Classic Shell Scripting](https://www.oreilly.com/library/view/classic-shell-scripting/0596005954/)
