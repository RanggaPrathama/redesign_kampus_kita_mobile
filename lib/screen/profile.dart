import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:percobaan_tampilan/utils/color.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double heigthHeaderbody = MediaQuery.sizeOf(context).height / 3;
    double heigthBgBlueCustom = MediaQuery.of(context).size.height / 2;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      width: double.infinity,
                      height: heigthHeaderbody * 1.4,
                      child: _backgroundBlueCustom()),
                  _notifyReason(),
                  Container(
                      margin: const EdgeInsets.only(top: 120),
                      width: MediaQuery.sizeOf(context).width / 1.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: _bodyHeader()),
                  _profileImage(),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20))),
              SizedBox(
                height: 10,
              ),
              menuOption(Colors.blue.withOpacity(0.1), Colors.blue,
                  FontAwesomeIcons.user, "Account"),
              menuOption(Colors.blue.withOpacity(0.1), Colors.blue,
                  FontAwesomeIcons.users, "Dosen Wali"),
              menuOption(Colors.blue.withOpacity(0.1), Colors.blue,
                  FontAwesomeIcons.cloudArrowUp, "One Drive"),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Help",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20))),
                  SizedBox(
                    height: 10,
                  ),
              menuOption(Colors.yellow.withOpacity(0.1), Colors.yellow,
                  FontAwesomeIcons.question, "Help Center"),
              menuOption(Colors.yellow.withOpacity(0.1), Colors.yellow,
                  FontAwesomeIcons.guilded, "Procedure Guide"),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Security",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20))),
                  SizedBox(
                    height: 10,
                  ),
              menuOption(Colors.red.withOpacity(0.1), Colors.red,
                  FontAwesomeIcons.lock, "Change Password"),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: Colors.red,
                    ),
                    label: Text("Logout", style: TextStyle(color: Colors.red)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                  child: Text("Version : 22.5.1",
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
            ]),
          ),
        )));
  }

  Widget _backgroundBlueCustom() {
    return Stack(
      children: [
        // Gradasi Latar Belakang
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //TES 2
                Color(0xFF62cff4),
                Color(0xFF2c67f2),
                Color(0xFF3498db),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // Lingkaran Dekor
        Positioned(
          top: -50,
          left: -50,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          right: -50,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            painter: WavePainter(),
            size: Size(double.infinity, 150),
          ),
        ),
      ],
    );
  }

  Widget _notifyReason() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Lottie.asset("assets/image/Animation - 1732767092288.json"),
          ),
          Text(
            "Good Morning ...",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _bodyHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: 200,
              child: Text("Rangga Prathama N.H",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "434221028",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.grey.shade300),
                // ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      child: Icon(FontAwesomeIcons.graduationCap, size: 16,color: Colors.blue.shade400),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fakultas :", style: TextStyle(color: Colors.grey),),
                        Container(
                          width: 115,
                          child: Text("Vokasi",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12,
                            ),),
                        ),
                      ],
                    )
                  ],
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.grey.shade300),
                // ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.blue.withOpacity(0.1),
                        child: Icon(FontAwesomeIcons.university, size: 16,color: Colors.blue.shade400),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Prodi :", style: TextStyle(color: Colors.grey)),
                          Container(
                            width: 115,
                            child: Text("Teknik Informatika",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                              fontSize: 12,
                            ),),
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            width: 150,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.idCard,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "e - KTM",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        )
      ],
    );
  }

  Widget _profileImage() {
    return Positioned(
      top: 40,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://static.vecteezy.com/system/resources/previews/021/548/095/original/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget menuOption(
      Color bgicon, Color iconColor, IconData icon, String title) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Card(
              elevation: 1,
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: bgicon, borderRadius: BorderRadius.circular(10)),
                  child: Icon(icon, color: iconColor),
                ),
                title: Text("$title"),
                onTap: () {},
                trailing: Icon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
            ),
            // Divider(
            //   height: 1,
            //   color: Colors.grey.shade300,
            //   thickness: 1,
            // )
          ],
        ));
  }
}

// Custom Painter untuk Gelombang
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.8,
      size.width * 0.5,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.4,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
