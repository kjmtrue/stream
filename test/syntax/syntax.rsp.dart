//Auto-generated by RSP Compiler
//Source: syntax.rsp.html
library syntax_rsp;

import 'dart:async';
import 'dart:io';
import 'package:stream/stream.dart';
import 'dart:collection' show LinkedHashMap;

var someExternal = 123;

/** Template, syntax, for rendering the view. */
Future syntax(HttpConnect connect, {foo, bool c:false}) async { //#7
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;

  response.headers..add("age", "129")
    ..add("accept-ranges", foo.acceptRanges); //header#5

  response.headers..add("Cache-Control", "no-cache"); //header#6

  if (!Rsp.init(connect, foo.contentType))
    return new Future.value();

  response.write("""<!DOCTYPE html>
<html>
  <head>
    <title>"""); //#7

  response.write(Rsp.nnx("$foo.name [${foo.title}]")); //#10


  response.write("""</title>
  </head>
  <body>
    <p>This is a test with ""\" and \\ and ""\\".
    <p>Another expresion: \""""); //#10

  response.write(Rsp.nnx(foo.description)); //#14


  response.write(""""
    <p>An empty expression: """); //#14

  response.write("""

    <p>This is not a tag: [:foo ], [:another and [/none].
    <ul>
"""); //#16

  for (var user in foo.friends) { //for#19

    response.write("""      <li>"""); //#20

    response.write(Rsp.nnx(user.name)); //#20


    response.write("""

"""); //#20

    if (user.isCustomer) { //if#21

      response.write("""      <i>!important!</i>
"""); //#22
    } //if

    while (user.hasMore()) { //while#24

      response.write("""        """); //#25

      response.write(Rsp.nnx(user.showMore())); //#25


      response.write("""

"""); //#25
    } //while

    response.write("""      </li>
"""); //#27
  } //for

  response.write("""    </ul>

"""); //#29

  for (var fruit in ["apple", "orange"]) { //for#31
  } //for

  response.write("""

"""); //#33

  if (foo.isCustomer) { //if#34

    response.write("""      *Custmer*
"""); //#35

    await connect.include("/in-if"); //include#36

  } else if (c) { //else#37

    return connect.forward("/x/y/z"); //forward#38

  } else if (foo.isEmployee) { //else#39

    response.write("""      *Employee*
"""); //#40

    return Rsp.nnf(syntax(connect, c: true, foo: "abc")); //forward#41

  } else { //else#42

    response.write("""      *Unknown* [/if] 
"""); //#43
  } //if

  response.write("""

"""); //#45

  var whatever = new StringBuffer(); _cs_.add(connect); //var#46
  connect = new HttpConnect.stringBuffer(connect, whatever); response = connect.response;

  response.write("""    define a variable
"""); //#47

  for (var fruit in ["apple", "orange"]) { //for#48

    response.write("""        """); //#49

    response.write(Rsp.nnx(fruit)); //#49


    response.write("""

"""); //#49
  } //for

  connect = _cs_.removeLast(); response = connect.response;
  whatever = whatever.toString();

  response.write("""

"""); //#52

  await connect.include("/abc"); //include#53

  var _0 = new StringBuffer(); _cs_.add(connect); //var#55
  connect = new HttpConnect.stringBuffer(connect, _0); response = connect.response;

  response.write("""      The content for foo
"""); //#56

  connect = _cs_.removeLast(); response = connect.response;

  await Rsp.nnf(syntax(new HttpConnect.chain(connect), c: true, foo: _0.toString())); //include#54

  response.write("""

"""); //#59

  if (foo.isMeaningful) { //if#60

    response.write("""      something is meaningful
"""); //#61

    return connect.forward(Rsp.cat("/foo?abc", {'first': "1st", 'second': foo})); //forward#62
  } //if

  response.write(Rsp.script(connect, "/script/foo.dart")); //script#64

  response.write("""    <script>
    \$("#j\\q");
    </script>
  </body>
</html>
"""); //#65

  response..write("<script>")..write("foo1")..write("=") //json-js#70
   ..write(Rsp.json(foo.name.length ~/ 2))..writeln('</script>');
  response..write('<script type="text/plain" id="') //json#71
   ..write("foo2")..write('">')
   ..write(Rsp.json(foo.name.length ~/ 2 * "/]".length))..writeln('</script>');

  response.write("""

"""); //#72

  response.write("""

"""); //#74
new LinkedHashMap();

  response.write("""

"""); //#79

  return new Future.value();
}
