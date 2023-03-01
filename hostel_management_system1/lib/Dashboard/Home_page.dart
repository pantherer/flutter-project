import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _hostel({required String image, required String title, required String subtitle,required double price}){
    return Container(
      margin:EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            height: 160,
            width: 310,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
          ),
          Container(
            height: 80,
            width: 310,
            decoration: BoxDecoration(
              color: Color(0xfff1f1f1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.purpleAccent,
                        size: 20,
                      ),
                      Container(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(subtitle,style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                            ),
                            Text('\$ $price',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                            ),
                          ],

                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget _searchBar(){
    return Container(
      height: 50,
      width: 300,
      child:Material(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: (
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter location",
                  prefixIcon: Icon(Icons.search,size: 26,),
                  fillColor: Color(0xffe4e4e4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
              ),
            )
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "TipTop",
            style: TextStyle(
              fontSize: 35,
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Icon(Icons.notifications_none_outlined,size: 30,color: Colors.blueGrey,),
        // leading: Text('TipTop'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18,top: 9,bottom: 8),

            child: Center(
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/home1.jpg'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 1200,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Container(
                    height:65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            "Welcome Amul,",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight:FontWeight.w500),
                          ),
                        ),
                        Text(
                          "Where are you plannning to stay?",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight:FontWeight.bold
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _searchBar(),
                      Container(
                        height: 47,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                        ),
                        child: (
                            Icon(Icons.settings,color: Colors.white,)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Hostels Near you",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      children: [
                        _hostel(
                          image:"assets/home1.jpg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 12000,
                        ),
                        _hostel(
                          image:"assets/home1.jpg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 12000,
                        ),
                        _hostel(
                          image:"assets/home1.jpg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 12000,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Recomended hostels",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      children: [
                        _hostel(
                          image:"assets/home2.jpg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 12000,
                        ),
                        _hostel(
                          image:"assets/home3.jpeg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 12000,
                        ),
                        _hostel(
                          image:"assets/home2.jpg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 1200,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "New hostels",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      children: [
                        _hostel(
                          image:"assets/home3.jpeg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 12000,
                        ),
                        _hostel(
                          image:"assets/home2.jpg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 12000,
                        ),
                        _hostel(
                          image:"assets/home2.jpg",
                          title:"City Boys Hostel",
                          subtitle:"NewPlaza ktm",
                          price: 1200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
