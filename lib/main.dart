import 'package:flutter/material.dart';


main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        darkTheme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home:  HomeActivity());
  }
}

class HomeActivity extends StatelessWidget {
   HomeActivity({super.key});

//SnackBar
  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
//Button Style
  final ButtonStyle buttonStyle=ElevatedButton.styleFrom(
       padding: EdgeInsets.all(20),
       foregroundColor: Colors.black45,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.circular(40))
       )
   );
//Alert Dialogue

  MyAlert(context){
    return showDialog(context: context, builder: (BuildContext context){
      return Expanded(
          child: AlertDialog(
            title: Text("Alert"),
            content: Text("Do You Want to Delete"),
            actions: [
              TextButton(onPressed: (){MySnackBar("Delete Success", context); Navigator.of(context).pop();}, child: Text("Yes")),
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
            ],
          )
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: const Text("Hello", style: TextStyle(color: Colors.white ),),
        elevation: 20,
        backgroundColor: Colors.amber,
        toolbarHeight: 60,

        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actions: [
          IconButton(onPressed: (){MySnackBar("I am Home", context);}, icon: Icon(Icons.home),color: Colors.white,),
          IconButton(onPressed: (){MySnackBar("I am Settings", context);}, icon: Icon(Icons.settings),color: Colors.white,),
          IconButton(onPressed: (){MySnackBar("I am Search", context);}, icon: Icon(Icons.search),color: Colors.white,),
          IconButton(onPressed: (){MySnackBar("I am Message", context);}, icon: Icon(Icons.message),color: Colors.white,)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        //child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.amber,
        icon: Icon(Icons.label, color: Colors.white,),
        label: Text("Hello",style: TextStyle(color: Colors.white),),

        onPressed: (){
          MySnackBar("This is Floating Action Bar", context);
        },

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page_rounded),label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: (int index){

          if(index==0){
            MySnackBar("I Am Home Bottom Menu", context);
          }

          if(index==1){
            MySnackBar("I Am  Contact Bottom Menu", context);
          }

          if(index==2){
            MySnackBar("I Am  Profile Bottom Menu", context);
          }

        },

      ),
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(
              padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  //decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text("Sirajul Islam"),
                  accountEmail: Text("info@siraajul.com"),
                  currentAccountPicture: Image.network("https://avatars.githubusercontent.com/u/28106814?s=400&u=70f1627dbcd1b5690cdbd5c42ae5911e58d79299&v=4"),
                  onDetailsPressed: (){MySnackBar("This is My Profile", context);},
                )
            ),
            ListTile(title: Text("Home"),leading: Icon(Icons.home),onTap: (){MySnackBar("Home", context);},),
            ListTile(leading:Icon(Icons.contact_page_rounded),title: Text("Contact"),onTap: (){MySnackBar("Contact", context);},),
            ListTile(title: Text("Messege"),leading: Icon(Icons.message),onTap: (){MySnackBar("I am Message", context);},),
            ListTile(title: Text("Phone"),leading: Icon(Icons.phone),onTap: (){MySnackBar("I am Phone", context);},),
            ListTile(title: Text("Address"),leading: Icon(Icons.location_on),onTap: (){MySnackBar("I am Address", context);},)
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  //decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text("Sirajul Islam"),
                  accountEmail: Text("info@siraajul.com"),
                  currentAccountPicture: Image.network("https://avatars.githubusercontent.com/u/28106814?s=400&u=70f1627dbcd1b5690cdbd5c42ae5911e58d79299&v=4"),
                  onDetailsPressed: (){MySnackBar("This is My Profile", context);},
                )
            ),
            ListTile(title: Text("Home"),leading: Icon(Icons.home),onTap: (){MySnackBar("Home", context);},),
            ListTile(title: Text("Contact"),leading:Icon(Icons.contact_page_rounded),onTap: (){MySnackBar("Contact", context);},),
            ListTile(title: Text("Messege"),leading: Icon(Icons.message),onTap: (){MySnackBar("I am Message", context);},),
            ListTile(title: Text("Phone"),leading: Icon(Icons.phone),onTap: (){MySnackBar("I am Phone", context);},),
            ListTile(title: Text("Address"),leading: Icon(Icons.location_on),onTap: (){MySnackBar("I am Address", context);},)
          ],
        ),
      ),
      /*body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(height: 100,width: 100,child: Image.network("src"),),
          Container(height: 100,width: 100,child: Image.network("src"),),
          Container(height: 100,width: 100,child: Image.network("src"),),


        ],
      ),*/
      body: Center(
        child: ElevatedButton(child: Text("Click Me !"),onPressed: (){MyAlert(context);},),
      )

    );
  }
}
