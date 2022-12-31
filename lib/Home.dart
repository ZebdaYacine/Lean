
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body:  Padding(
        padding:  EdgeInsets.only(top:screenHeight*0.05 ,left: screenWidth*0.05,right: screenWidth*0.05,bottom:screenHeight*0.05 ),
        child: Column(
          children:  [
              FadeInImage.assetNetwork(
                width: 150,
                height: 150,
                placeholder: "lib/images/loading.gif",
                image: "https://www.edigitalagency.com.au/wp-content/uploads/Twitter-logo-png.png",
            ),
            /*const Image(
              /* image: AssetImage('lib/images/twiter.png'),*/
            image: NetworkImage("https://www.edigitalagency.com.au/wp-content/uploads/Twitter-logo-png.png"),
               width: 150,
               height: 150,
             ),*/
            Form(
                child: Center(
                  child:  Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Write your Post',
                              hintText: 'Post content'
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight*0.1),
                          child: ElevatedButton(
                              onPressed: (){
                                onSend(context);
                              },
                              child: Text('Send Post')
                          ),
                        )
                      ]
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  void onSend(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Post Sent!'),
      duration: const Duration(seconds: 2, milliseconds: 500),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
