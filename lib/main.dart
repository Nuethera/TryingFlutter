import 'package:flutter/material.dart';
import 'package:customizable_space_bar/customizable_space_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back_ios_sharp),
                onPressed: () {
                  print("Google search Sliver");
                },
              ),



              /// The part you use this package
              flexibleSpace: CustomizableSpaceBar(
                builder: (context, scrollingRate) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: 13, left: 12 + 40 * scrollingRate),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Contacts",
                        style: TextStyle(
                            fontSize: 42 - 18 * scrollingRate,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),

              /// End of the part
              expandedHeight: 150,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(25),
                        ),

                      ),

                      child: ListTile(
                        title: Text("${index * index}"),
                        subtitle: Text("${index}"),
                        leading: CircleAvatar(child:Icon(Icons.access_alarms_rounded),),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),


        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     print("Clicked");
        //   },
        //   child: Icon(Icons.accessible),
        // ),
        //   floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,


      ),

      debugShowCheckedModeBanner: false,
    );
  }
}
