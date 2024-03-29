import 'package:flutter/material.dart';
import 'dart:developer';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String? routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其他情况则正常打开路由。
          print("open page $routeName");
          return TipRoute(text: "页面没找到");
        });
      },
      //注册路由
      routes: {
        "new_page": (context) => NewRoute(),
        "page_2": (context) => EchoRoute(),
        "text_page": (context) => TextRote(),
        "/": (context) => const MyHomePage(title: "Futter Demo Home Page"),
      },

      // home: const Echo(text: 'Hello World!'),
      // home: const GetStateObjectRoute()
      // home: TapboxA(),
      // home: ParentWidget(),
      // home: ParentWidgetC(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.initValue=2});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int initValue;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState(){
    super.initState();
    _counter = widget.initValue;
  }
  @override
  void didUpdateWidget(MyHomePage oldWidget){
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }
  @override
  void deactivate(){
    super.deactivate();
    print("deactivate");
  }
  @override
  void dispose(){
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      // debugger(when: _counter >= 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(onPressed: (){
              //通过命名路由打开页面
              // Navigator.pushNamed(context, "new_page");
              Navigator.pushNamed(context, "page_2", arguments:"hi");
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context){
              //       return NewRoute();
              //     }));
            },
                child: const Text("open new route")),
            TextButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return RouterTestRoute();
                })
              );
            },
                child: const Text("打开")),
            Image.asset("assets/pic1.jpg"), // [Image.network] and [Image.asset] respectively
            // Image.asset('icons/heart.png', package: 'my_icons'),
            // Image.network("http://47.94.214.38/static/images/favicon.png")
            TextButton(onPressed: (){
              Navigator.pushNamed(context, "text_page");
            }, child: const Text("基础组件"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.blue, //默认为灰色
  }): super(key: key);
  final String text;
  final Color backgroundColor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
       color: backgroundColor,
       child: Text(text),
      )
    );
  }
}

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({Key? key}) : super(key: key);

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}
/**
 * // https://book.flutterchina.club/chapter2/flutter_widget_intro.html#_2-2-7-%E5%9C%A8-widget-%E6%A0%91%E4%B8%AD%E8%8E%B7%E5%8F%96state%E5%AF%B9%E8%B1%A1
 * 1. 在widget树中获取State对象
 * 2. 通过GlobalKey获取State对象
 */

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  //通过GlobalKey获取State对象
  static final GlobalKey<ScaffoldState> _globalKey= GlobalKey();
  // 在widget树中获取State对象
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("子数中获取State对象"),
      ),
      key: _globalKey,
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context){
              return ElevatedButton(
              onPressed: (){
                ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
                state.openDrawer();
              },
              child: const Text("打开抽屉菜单1"),
            );
            }),
            Builder(builder: (context){
              return ElevatedButton(
                  onPressed: (){
                    ScaffoldState state = Scaffold.of(context);
                    state.openDrawer();
                  },
                  child: const Text("打开抽屉菜单2"),);
            }),
            Builder(builder: (context){
              return ElevatedButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("this is snackBar"),
                        backgroundColor: Colors.cyan,
                      ),
                    );
                  },
                  child: const Text("显示SnackBar"));
            }),
            Builder(builder: (context){
                return ElevatedButton(
                  onPressed: (){
                    _globalKey.currentState!.openDrawer();
                  },
                  child: const Text("打开抽屉菜单2"),);
            }),
          ],
        ),
      ),
      drawer:const Drawer(),
    );
  }
}

class CustomWidget extends LeafRenderObjectWidget{
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomObject();
  }
  @override
  void updateRenderObject(BuildContext context, RenderCustomObject  renderObject) {
    // 更新 RenderObject
    super.updateRenderObject(context, renderObject);
  }
}

class RenderCustomObject extends RenderBox{

  @override
  void performLayout(){
    // 实现布局逻辑
  }
  @override
  void paint(PaintingContext context, Offset offset) {
    // 实现绘制
  }
}
//Widget管理自身状态
class TapboxA extends StatefulWidget{
  TapboxA({Key? key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.amberAccent[700],
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


//父Widget管理子Widget的状态
class ParentWidget extends StatefulWidget{

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}
class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChange(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChange,
      ),
    );
  }
}

class TapboxB extends StatelessWidget{
  TapboxB({Key? key, this.active: false, required this.onChanged}):
      super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.green[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

//混合状态管理
class ParentWidgetC extends StatefulWidget{
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxC extends StatefulWidget{
  TapboxC({Key? key, this.active: false, required this.onChanged})
    :super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC>{
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(
            color: Colors.teal,
            width: 10.0,
          ): null,
        ),
        child: Center(
          child: Text(
            widget.active ? 'Active': 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: const Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget{
  TipRoute({
      Key? key,
      required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(onPressed: () => Navigator.pop(context, "我是返回值")
                  , child: Text("返回"))
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Center(
      child: ElevatedButton(
        onPressed: () async{
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context){
                return TipRoute(text: "我是提示-----");
              }));
          print("路由返回值：$result");
        },
        child: Text("打开提示页"),

      ),
    );
  }
}

class EchoRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var args=ModalRoute.of(context)?.settings.arguments;
    Object? text;
    if(args != null){
      text = args.toString();
    }else{
      text = "this is text";
    }
    print(text);
    print(args.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: const Center(
        child: Text("tewt"),
      ),
    );
  }
}


class TextRote extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("基础组件"),
        backgroundColor: Colors.green,
      ),
      body: Center(
            child: Column(
            children: const <Widget>[
                Text("Hello world",
                    textAlign: TextAlign.left,
                  ),
                Text("Hello world! I'm Jack. ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
                Text("Hello world",
                  textScaleFactor: 1.5,
                ),
              Text("Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    backgroundColor: Colors.yellow,
                    decoration:TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed
                ),
              )
            ],
            ),
      ),
      );
  }
  
}