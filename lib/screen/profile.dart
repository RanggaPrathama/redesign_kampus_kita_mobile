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
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        _backgroundBlueCustom(),
                        _notifyReason(),
                        _bodyHeader(),
                        _profileImage(),
                      ],
                    ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                      child: Text("Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),

                  SizedBox(height: 10,),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(FontAwesomeIcons.user, color: Colors.blue),
                            ),
                            title: Text("Profile"),
                            onTap: (){},
                            trailing: Icon(FontAwesomeIcons.chevronRight),
                          ),
                        ),
                        // Divider(
                        //   height: 1,
                        //   color: Colors.grey.shade300,
                        //   thickness: 1,
                        // )
                      ],
                    )
                  ),

                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
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
                                    color: Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(FontAwesomeIcons.doorOpen, color: Colors.red),
                              ),
                              title: Text("Profile"),
                              onTap: (){},
                              trailing: Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                          // Divider(
                          //   height: 1,
                          //   color: Colors.grey.shade300,
                          //   thickness: 1,
                          // )
                        ],
                      )
                  ),
                ]
              ),
            )

        ));
  }

  Widget _backgroundBlueCustom(){
    return   Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.1,
      child: Stack(
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
      ),
    );
  }
  
  
  Widget _notifyReason(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Lottie.asset(
                "assets/image/Animation - 1732767092288.json"),
          ),
          Text(
            "Good Morning ...",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _bodyHeader(){
    return  Container(
        margin: const EdgeInsets.only(top: 120),
        width: MediaQuery.sizeOf(context).width / 1.1,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ]
        ),

        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text("Rangga Prathama N.H")),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("434221028"),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Study Program :"),
                      Text("Teknik Informatika"),
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fakultas :"),
                      Text("Vokasi"),
                    ],
                  ),
                ],
              ),),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 150,
                height: 50,
                child: ElevatedButton(onPressed: (){}, child: Row(children: [
                  Icon(FontAwesomeIcons.idCard, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text("e - KTM", style: TextStyle(color: Colors.white),)
                ],), style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),),
              ),
            )
          ],
        ));
  }

  Widget _profileImage(){
    return    Positioned(
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
