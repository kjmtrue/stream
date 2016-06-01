//Auto-generated by RSP Compiler
//Source: ../includerView.rsp.html
part of features;

/** Template, includerView, for rendering the view. */
Future includerView(HttpConnect connect) async { //#2
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return null;
final infos = {
  "fruits": ["apple", "orange", "lemon"],
  "cars": ["bmw", "audi", "honda"]
};

  response.write("""

<html>
  <head>
    <title>Test of Include</title>
    <link href="/theme.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <ul>
      <li>You shall see something inside the following two boxes.</li>
    </ul>
    <div style="border: 1px solid blue">
"""); //#7

  await connect.include("/frag.html"); //include#18

  response.write("""    </div>
    <div style="border: 1px solid red">
"""); //#19

  await Rsp.nnf(fragView(new HttpConnect.chain(connect), infos: infos)); //include#21

  response.write("""    </div>
    <div style="border: 1px solid red">
"""); //#22

  var _0 = new StringBuffer(), _1 = connect; //var#25
  connect = new HttpConnect.stringBuffer(connect, _0); response = connect.response;

  response.write("""  <h1>This is a header</h1>
  <p>Passed from the includer for showing """); //#26

  response.write(Rsp.nnx(infos)); //#27


  response.write("""</p>
"""); //#27

  connect = _1; _1 = null; response = connect.response;

  var _2 = new StringBuffer(), _3 = connect; //var#29
  connect = new HttpConnect.stringBuffer(connect, _2); response = connect.response;

  response.write("""  <h2>This is a footer</h2>
  <p>It also includes another page:</p>
"""); //#30

  await connect.include("/frag.html"); //include#32

  connect = _3; _3 = null; response = connect.response;

  await Rsp.nnf(fragView(new HttpConnect.chain(connect), infos: infos, header: _0.toString(), footer: _2.toString())); //include#24

  response.write("""    </div>
  </body>
</html>
"""); //#35

  return null;
}
