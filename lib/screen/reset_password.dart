import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class ResetData {
  String newPass = '';
}

class TextField {
  final ValueChanged<String> onFieldSubmitted;

  const TextField({
    required this.onFieldSubmitted,
  });
}

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  TextEditingController _passwordController = new TextEditingController();
  final ResetData resetData = new ResetData();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Verifikasi Reset Password",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Container(
              width: 200,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Lottie.asset(
                        "assets/image/Animation - 1715474040543.json"),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Apakah Anda Yakin untuk Reset Password ?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade400),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  backgroundColor: Colors.red),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  backgroundColor: Colors.blue),
              child: Text("Yakin"),
            ),
          ],
        );
      },
    );
  }

  void saveData() {
    if (_formKey.currentState!.validate()) {
      resetData.newPass = _passwordController.text;
      _formKey.currentState!.save();

      // setState(() {
      //   _passwordController.clear();
      // });
    }
  }

  // savePassword() async {
  //   // Data yang akan dikirim dicetak di konsol
  //   final payload = {
  //     "password": resetData.newPass,
  //   };
  //   print("Data yang akan dikirim ke API: $payload");
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${ApiUrl.baseUrlGo}/auth/reset-password"),
  //       headers: {
  //         "Authorization": "Bearer ${global.access_token}",
  //         "Content-Type": "application/x-www-form-urlencoded",
  //       },
  //       body: payload,
  //     );
  //
  //     print("Status Kode: ${response.statusCode}");
  //     print("Respons API: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       final dataReset = jsonDecode(response.body);
  //       if (dataReset['success'] == true) {
  //         alertSuccess(dataReset['message'] ?? 'Password successfully reset.');
  //       } else {
  //         alertError();
  //       }
  //     } else if (response.statusCode == 500) {
  //       Navigator.of(context, rootNavigator: true).pop('dialog');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Server error. Please wait and reload again...'),
  //           duration: Duration(seconds: 5),
  //         ),
  //       );
  //     } else {
  //       alertError();
  //     }
  //   } on SocketException catch (_) {
  //     Navigator.of(context, rootNavigator: true).pop('dialog');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please check your network connection'),
  //         duration: Duration(seconds: 5),
  //       ),
  //     );
  //   }
  // }

  // alertError() {
  //   CoolAlert.show(
  //     context: context,
  //     type: CoolAlertType.error,
  //     title: 'Oops...',
  //     text: 'Data Error',
  //     loopAnimation: true,
  //     animType: CoolAlertAnimType.scale,
  //     width: 100,
  //   );
  // }
  //
  // alertSuccess(String message) {
  //   CoolAlert.show(
  //     context: context,
  //     type: CoolAlertType.success,
  //     title: 'Success!',
  //     text: message,
  //     loopAnimation: true,
  //     animType: CoolAlertAnimType.scale,
  //     width: 100,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password   ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.zero,
                foregroundColor: Colors.blue,
                elevation: 0,
                backgroundColor: Colors.white),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Lottie.asset(
                                "assets/image/Animation - 1729970931471.json",
                                width: 200)),
                      ),
                      Container(
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Tips: Gunakan kombinasi angka, huruf besar, huruf kecil, dan simbol khusus untuk membuat kata sandi yang lebih kuat.",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: TextFormField(
                          controller: _passwordController,
                          style: Theme.of(context).textTheme.bodySmall,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: obscureText ? true : false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            // labelText: "$namaUser",
                            hintText: "New Password ..",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  icon: Icon(obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(Icons.lock),
                            ),
                            //floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                //gapPadding: 10,
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade500, width: 2)),

                            focusedBorder: OutlineInputBorder(
                              //gapPadding: 10,
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Password";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade500),
                              onPressed: _showMyDialog,
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
