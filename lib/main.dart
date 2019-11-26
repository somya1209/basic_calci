import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'CALCI'),
      debugShowCheckedModeBanner: false,
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int fnum=0,secnum=0;
  String res,op,displaytext='';


  Widget calc(String btnval){
   if(btnval=="C")
     {displaytext='';
     fnum=0;
     secnum=0;
     res='';}
   else if(btnval=='+' ||btnval=='-' ||btnval=='x' ||btnval=='/')
     {
       fnum=int.parse(displaytext);
       res='';
       op=btnval;
     }
   else if(btnval=='='){
     secnum=int.parse(displaytext);
     if(op=='+')
       res=(fnum+secnum).toString();
     if(op=='-')
       res=(fnum-secnum).toString();
     if(op=='x')
       res=(fnum*secnum).toString();
     if(op=='/')
       res=(fnum~/secnum).toString();

   }
   else{
     res=int.parse(displaytext+btnval).toString();
   }
   setState(() {
     displaytext=res;
   });

  }

Widget customButton(btnval){

  return Expanded(

    child: Padding(
      padding: const EdgeInsets.only(
          bottom:1.0,
      left:1.0,
      right: 1.0),
      child: RaisedButton(
        color: Colors.black38,

        child: Text('$btnval',
        style: TextStyle(
          color: Colors.lightGreenAccent.withOpacity(0.8),

          fontWeight: FontWeight.w400,
          fontSize: 30
        ),),
        onPressed: ()=>calc(btnval),
        highlightElevation: 10.0,
        splashColor: Colors.lightGreenAccent,


      ),
    ),

  );
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Center(

          child: Column(


            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(

                child:Padding(
                  padding: const EdgeInsets.only(
                     right: 50,
                  bottom: 50),

                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '$displaytext',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white30,

                    ),
                    )
                  ),
                ),
              ),

              Row(
                children: <Widget>[
                  customButton('9'),
                  customButton('8'),
                  customButton('7'),
                  customButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton('6'),
                  customButton('5'),
                  customButton('4'),
                  customButton('-')

                ],
              ),
              Row(
                children: <Widget>[
                  customButton('3'),
                  customButton('2'),
                  customButton('1'),
                  customButton('x'),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton('C'),
                  customButton('0'),
                  customButton('='),
                  customButton('/'),
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}
