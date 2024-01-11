import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
enum POSITIONS { endDocked,centerFloat,endFloat,centerDocked}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FloatingActionButtonLocation _fabLocation=FloatingActionButtonLocation.centerDocked;
  POSITIONS?_character = POSITIONS.centerDocked;
  bool? _isNotched = false;
  bool? _isMINI = false;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16.0),
      child: Scaffold(appBar: AppBar(title: Center(child: Text("Floating Action Button",style: TextStyle(color: Colors.white,fontSize: 30,),)),
          backgroundColor: Colors.blueGrey),backgroundColor: Colors.black26,
        body: ListView(
          padding: EdgeInsets.all(8),
          children: [
            ListTile(textColor: Colors.blueGrey,
              title: Text("MINI"),
              leading: Checkbox(
                value: _isMINI,
                onChanged: (bool?bool)=><void>{
                  setState(() {
                    _isMINI = bool;
                  }),
                },
              ),
            ),
            ListTile(textColor: Colors.blueGrey,
              title: Text("BOTTOM NOTCH"),
              leading: Checkbox(
                value: _isNotched,
                onChanged: (bool?bool)=> <void>{
                  setState(() {
                    _isNotched = bool;
                  }),
                },
              ),
            ),
            Divider(color: Colors.blueGrey,height: 4),
            ListTile(textColor: Colors.blueGrey,
              title: Text("CENTER DOCKED"),
              leading: Radio(
                value: POSITIONS.centerDocked,
                groupValue: _character,
                onChanged: (POSITIONS?value){
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.centerDocked;
                  });
                },
              ),
            ),
            ListTile(textColor: Colors.blueGrey,
              title: Text("END DOCKED"),
              leading: Radio(
                value: POSITIONS.endDocked,
                groupValue: _character,
                onChanged: (POSITIONS?value){
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.endDocked;
                  });
                },
              ),
            ),
            ListTile(textColor: Colors.blueGrey,
              title: Text("END FLOAT"),
              leading: Radio(
                value: POSITIONS.endFloat,
                groupValue: _character,
                onChanged: (POSITIONS?value){
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.endFloat;
                  });
                },
              ),
            ),
            ListTile(textColor: Colors.blueGrey,
              title: Text("CENTER FLOAT"),
              leading: Radio(
                value: POSITIONS.centerFloat,
                groupValue: _character,
                onChanged: (POSITIONS?value){
                  setState(() {
                    _character = value;
                    _fabLocation = FloatingActionButtonLocation.centerFloat;
                  });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.blueGrey,
          mini:_isMINI!,onPressed: ()=>{},child: Icon(Icons.add,color: Colors.white),
        ),
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: BottomAppBar(
          shape: _isNotched!?CircularNotchedRectangle():null,
          child: Container(
            height: 50.0,
          ),
        ),
      ),
    );
  }
}




