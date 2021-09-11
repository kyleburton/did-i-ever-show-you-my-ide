(function () {
  var krb = {last_render: null};

  krb.reqListener = function () {
    console.log(this.responseText);
    var prev_render = krb.last_render;
    krb.last_render = JSON.parse(this.responseText);

    if (!prev_render) {
      return;
    }

    if (prev_render.last_render !== krb.last_render.last_render ) {
      console.log(
        "krb.reqListener: last_render changed from %o to %o, reloading ...",
        prev_render.last_render,
        krb.last_render.last_render
      );
      location.reload();
      return
    }

    console.log(
      "krb.reqListener: no change %o",
      krb.last_render.last_render
    );

  }

  krb.checkLastRender = function () {
    var oReq = new XMLHttpRequest();
    oReq.addEventListener("load", krb.reqListener);
    oReq.open("GET", "/last-render");
    oReq.send();
  }

  krb.krbReload = function () {
    krb.checkLastRender();
  }


  krb.init = function () {
    document.krbInterval = document.krbInterval || setInterval(krb.krbReload, 250);
  }


  krb.init();
}())
