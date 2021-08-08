import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(Assignment());
}

Color DayCardColor = const Color(0XFFA7A7A7);
Color DateCardColor = const Color(0XFF4F4F4F);
Color DateColor = const Color(0XFF121212);
Color LightGrey = const Color(0xFFF1F2F3);
Color Green = const Color(0XFF85C454);
Color LightBlue = const Color(0XFFC6E5F7);

Row _buildMoodColumn(String percent, String mood, String moodName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 13),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 40,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: LightGrey,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: const Offset(4, 4),
                          blurRadius: 8
                      )
                    ],
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(percent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Green,
                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(mood,
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(moodName,
              style: TextStyle(
                fontSize: 11,
              ),
              ),
            ),
          ],
        ),
      )
    ],
  );

}

Row _buildColumnDull(String moodDull, String moodNameDull) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 13),
        child: Column(
          children: [
            Opacity(
              opacity: 0.4,
              child: Container(
                height: 80,
                width: 40,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: LightGrey,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(4, 4),
                            blurRadius: 8
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Green,
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(moodDull,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(moodNameDull,
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Column _buildDate(Color bgColor, Color textColor, String day, String date) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 13, top: 18, bottom: 18),
        child: Container(
            height: 70,
            width: 40,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Text(day,
                    style: TextStyle(
                      color: DayCardColor,
                      fontSize: 15,
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(date,
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor,
                    ),
                    ),
                  ),
                ],
              ),

            )),
      ),

    ],
  );
}

Row _buildTime(String time, String emotion) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 14, top: 15, bottom: 15),
        child: Text(time,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 50, bottom: 15, top: 15, left: 35 ),
        child: Text(emotion,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        ),
      )
    ],
  );
}

Container _scrollCard(String image) {
  return Container(
    margin: EdgeInsets.only(left: 13, top: 10, bottom: 20),
    height: 128,
    width: 208,
    child: Image(
      image: AssetImage(image),
      ),
    );
}

class Assignment extends StatelessWidget {

  Widget titleContainer = Container(
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20, left: 13),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Text('Your Feelings History',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
  
  Widget moodRow = Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20, bottom: 8, top: 20),
        child: Text('Your feelings from last 30 days',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      Row(
        children: [
          _buildMoodColumn('30%', '⚡', 'Energetic'),
          _buildMoodColumn('10%', '😩', 'Sad'),
          _buildMoodColumn('40%', '😃', 'Happy'),
          _buildMoodColumn('1%', '😡', 'Angry'),
          _buildColumnDull('🍃', 'Calm'),
          _buildColumnDull('😖', 'Bored'),
          _buildColumnDull('🥰', 'Love'),
        ],
      ),
      Divider(
        color: Colors.black12,
      )
    ],
  );

  Widget dateRow = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 13),
        child: Container(
          width: 78,
          decoration: BoxDecoration(
            color: LightBlue,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('10 Jun 2021',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      Row(
        children: [
          _buildDate(DateCardColor, LightGrey, 'Mo', '10'),
          _buildDate(Colors.transparent, DateColor, 'Tu', '11'),
          _buildDate(Colors.transparent, DateColor, 'We', '12'),
          _buildDate(Colors.transparent, DateColor, 'Th', '13'),
          _buildDate(Colors.transparent, DateColor, 'Fr', '14'),
          _buildDate(Colors.transparent, DateColor, 'Sa', '15'),
          _buildDate(Colors.transparent, DateColor, 'Su', '16'),
        ],
      ),
      Divider(
        color: Colors.black12,
      )
    ],
  );

  Widget timeColumn = Column(
    children: [
      _buildTime('9 AM - 12 PM', '🥰Love'),
      _buildTime(' 1 PM -  4 PM', '😡Angry'),
      _buildTime(' 4 PM -  6 PM', '😡Angry'),
      Divider(
        color: Colors.black12,
      )
    ],
  );

  Widget contentColumn = Column(
    children: <Widget> [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
          child: Text(
            'You May Find This Interesting',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit euismod risus elementum magna scelerisque nunc sed varius. Tellus quis tristique adipiscing sed metus, sit ac adipiscing. Leo aenean sed eu purus maecenas posuere ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),

    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  titleContainer,
                  moodRow,
                  dateRow,
                  timeColumn,
                  contentColumn,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _scrollCard('assets/image1.jpg'),
                        _scrollCard('assets/image2.jpg'),
                      ],
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

  }



}

