import 'package:flutter/material.dart';
import 'package:flutterappbtvn/my_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categories = Category.generateCategories;
  final _controller = ScrollController();
  int indexSelected;

  @override
  void initState() {
    // TODO: implement initState
    indexSelected = 0;
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.position.extentAfter <= 10) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        setState(() {
          categories[indexSelected]
              .subCategories
              .addAll(SubCategory.generateSubCategories);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                'Find your\nConsultation',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(0.3),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((15)),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              listCategories(context),
              SizedBox(
                height: 20,
              ),
              listSubCategories(context),
              SizedBox(
                height: 30,
              ),
              Text('Doctors',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              doctor
            ],
          ),
        ),
      )),
    );
  }

  Widget listCategories(BuildContext context) => Container(
      height: 30.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Category.generateCategories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              for (var i = 0; i < categories.length; i++) {
                if (i == index) {
                  categories[i].isSelected = true;
                  indexSelected = i;
                } else {
                  categories[i].isSelected = false;
                }
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Text(categories[index].name),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: categories[index].isSelected
                      ? Colors.orangeAccent
                      : null),
            ),
          ),
        ),
      ));

  Widget listSubCategories(BuildContext context) => Container(
        height: 250,
        child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: categories[indexSelected].subCategories.length + 1,
            itemBuilder: (context, index) =>
                index < categories[indexSelected].subCategories.length
                    ? Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              color: categories[indexSelected]
                                  .subCategories[index]
                                  .color,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  categories[indexSelected]
                                      .subCategories[index]
                                      .name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  categories[indexSelected]
                                          .subCategories[index]
                                          .numberDoctor
                                          .toString() +
                                      ' Doctors',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                                Spacer(),
                                Image.asset(
                                  categories[indexSelected]
                                      .subCategories[index]
                                      .imagePath,
                                  height: 100,
                                  width: 130,
                                  alignment: Alignment.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 1),
                          ),
                        ),
                      )),
      );

  get doctor => Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orangeAccent),
                child: Image.asset('assets/images/doctor.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Dr. Stefeni Albert',
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 18),
                  ),
                  Text('Heart Speailist')
                ],
              ),
              Spacer(),
              Container(
                width: 48,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orangeAccent),
                alignment: Alignment.center,
                child: Text(
                  'Call',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
}
