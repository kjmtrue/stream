//Auto-generated by RSP Compiler
//Source: example/hello-templating/home.rsp.html
part of hello_templating;

/** Template, home, for rendering the view. */
void home(HttpConnect connect) { //2
  var _cs_ = new List<HttpConnect>(), request = connect.request, response = connect.response;

  if (!connect.isIncluded)
    response.headers.contentType = new ContentType.fromString("""text/html; charset=utf-8""");

  response.write("""
<!DOCTYPE html>
<html>
  <head>
    <title>Stream: Hello Templating</title>
    <link href="theme.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
"""); //#2

  var _0 = new StringBuffer(); _cs_.add(connect); //var#10
  connect = new HttpConnect.buffer(connect, _0); response = connect.response;

  connect.include("""/header.html""", success: () { //#11

    connect = _cs_.removeLast(); response = connect.response;

    response.write("""

"""); //#13

    var _1 = new StringBuffer(); _cs_.add(connect); //var#14
    connect = new HttpConnect.buffer(connect, _1); response = connect.response;

    sidebar(connect.server.connectForInclusion(connect, success: () { //#15

      connect = _cs_.removeLast(); response = connect.response;

      response.write("""

"""); //#17

      var _2 = new StringBuffer(); _cs_.add(connect); //var#18
      connect = new HttpConnect.buffer(connect, _2); response = connect.response;

      connect.include("""/footer.html""", success: () { //#19

        connect = _cs_.removeLast(); response = connect.response;

        response.write("""

"""); //#21

        var _3 = new StringBuffer(); _cs_.add(connect); //var#22
        connect = new HttpConnect.buffer(connect, _3); response = connect.response;

        response.write("""
  <h1>Hello Templating</h1>
  <p>In this example, we demostrate how to define the shared layout (aka., the template), define page fragments and assemble them into a complete page. It is based on the so-called *Composite View* pattern.</p>
  <p>For more information, please refer to <a href="http://docs.rikulo.org/stream/latest/RSP/Fundamentals/Templating-_Composite_View_Pattern.html">Templating: Composite View Pattern</a>.</p>
"""); //#23

        connect = _cs_.removeLast(); response = connect.response;

        classic(connect.server.connectForInclusion(connect, success: () { //#9

          response.write("""
  </body>
</html>
"""); //#28

          connect.close();
        }), header: _0.toString(), sidebar: _1.toString(), footer: _2.toString(), body: _3.toString()); //end-of-include
      }); //end-of-include
    })); //end-of-include
  }); //end-of-include
}
