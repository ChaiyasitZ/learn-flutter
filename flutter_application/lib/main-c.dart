import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW2',
      home: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 166, 0), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ชัยสิทธิ์ มินทกร',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(125),
              child: Image.network(
                'https://scontent-bkk1-1.xx.fbcdn.net/v/t39.30808-6/448638805_1905766069845169_8694497600872431967_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=101&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=8C9U8-bljcQQ7kNvgHJ_5fl&_nc_zt=23&_nc_ht=scontent-bkk1-1.xx&_nc_gid=AuX3_YxUUB0QLDmlCOxpML7&oh=00_AYDvU6Mka4EzfCSYbyQqltRuXv0rlhYo9KvLHX7uMPBGmw&oe=675FFF94',
                height: 175,
                width: 175,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
