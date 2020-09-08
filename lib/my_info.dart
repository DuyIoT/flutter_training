import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          profile,
          SizedBox(
            height: 25,
          ),
          Text(
            'About',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Duy earned an IT from Ha Noi University of Mining and Geology, where he was a Fuqua Scholar, and a Bachelor of Science degree in Industrial Engineering from Auburn University.',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(
            height: 25,
          ),
          aboutView,
          SizedBox(
            height: 20,
          ),
          Text(
            "Activity",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          activityView,
        ],
      ),
    )));
  }

  get profile => Container(
        height: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage('assets/images/IMG_0547.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mr. Đặng Xuân Duy ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          'iOS Developer',
                          style: TextStyle(color: Colors.grey, fontSize: 22),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        contactButton(Icons.mail, Colors.orange),
                        contactButton(Icons.call, Colors.red),
                        contactButton(Icons.video_call, Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  get aboutView => Container(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: addressView('Address',
                                '13F Keangnam Hanoi Landmark 72 Tower, Plot E6, Pham Hung Road, Nam Tu Liem Dist., Ha Noi'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Icon(
                            Icons.schedule,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: addressView('Daily Practict',
                                'Monday - Friday Open still 7PM'))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('assets/images/maps.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  get activityView => Row(
        children: <Widget>[
          Expanded(
              child: activityItems(
                  Colors.orange, Colors.orangeAccent, 'List Of Schedule')),
          Expanded(
              child: activityItems(
                  Colors.grey, Colors.black12, 'Dev\'s Daily Post')),
        ],
      );

  Widget contactButton(IconData icon, Color color) => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color.withOpacity(0.4)),
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      );

  Widget addressView(String title, String description) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6)),
          ),
          Text(
            description,
          )
        ],
      );

  Widget activityItems(Color color, Color subColor, String title) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: subColor),
                    child: Icon(
                      Icons.description,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  ))
            ],
          ),
        ),
      );
}
