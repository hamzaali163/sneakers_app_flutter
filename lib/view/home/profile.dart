import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/round_button.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/utils/general_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final db = FirebaseFirestore.instance.collection("User Data");
  final id = FirebaseAuth.instance.currentUser!.uid;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    final utilsProvider = Provider.of<GeneralUtils>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.navbarscreen);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Raleway-SemiBold',
              color: Color(0xff2B2B2B),
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: null,
      endDrawer: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: db.doc(id).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  dynamic userData = snapshot.data?.data();

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColor.backgroundColor,
                    ));
                  } else if (snapshot.hasError) {
                    const Center(
                      child: Text("Error Occured"),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.only(top: screenheight * 0.05),
                    child: Column(
                      children: [
                        userData!['image'].toString().isEmpty
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                    'images/profile.png',
                                  )),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey,
                                ),
                              )
                            : Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                height: 105,
                                width: 105,
                                child: ClipOval(
                                  child: Image.network(
                                    userData!['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        InkWell(
                          onTap: () async {
                            await utilsProvider.getgalleryimage();
                            await utilsProvider.uploadimage();
                            await utilsProvider
                                .uploadtoFirestore()
                                .onError((error, stackTrace) => {
                                      debugPrint(error.toString()),
                                      GeneralUtils().showerrorflushbar(
                                          error.toString(), context)
                                    });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: screenheight * 0.03),
                            child: const Center(
                              child: Text(
                                'Change Profile Picture',
                                style: TextStyle(
                                    fontFamily: 'Raleway-SemiBold',
                                    color: AppColor.backgroundColor,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenheight * 0.02,
                                left: screenwidth * 0.05),
                            child: const Text(
                              'Your Name',
                              style: TextStyling.formtextstyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenwidth * 0.04,
                              right: screenwidth * 0.04,
                              top: screenheight * 0.01),
                          child: TextFormField(
                            // enabled: false,
                            controller: nameController,
                            decoration: InputDecoration(
                                label: Text(userData['Full name']),
                                labelStyle: TextStyling.hinttext,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: const Color(0xffF7F7F9),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenheight * 0.02,
                                left: screenwidth * 0.05),
                            child: const Text(
                              'Email',
                              style: TextStyling.formtextstyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenwidth * 0.04,
                              right: screenwidth * 0.04,
                              top: screenheight * 0.01),
                          child: TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                label: Text(userData['Email']),
                                labelStyle: TextStyling.hinttext,
                                filled: true,
                                fillColor: const Color(0xffF7F7F9),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenheight * 0.02,
                                left: screenwidth * 0.05),
                            child: const Text(
                              'Password',
                              style: TextStyling.formtextstyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenwidth * 0.04,
                              right: screenwidth * 0.04,
                              top: screenheight * 0.01),
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                                label: const Text('*********'),
                                labelStyle: TextStyling.hinttext,
                                filled: true,
                                fillColor: const Color(0xffF7F7F9),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: screenheight * 0.025,
            ),
            RoundButtonTwo(
                loading: utilsProvider.load,
                onpress: () {
                  if (emailcontroller.text.isNotEmpty &&
                      nameController.text.isNotEmpty) {
                    utilsProvider.showloading(true);

                    db.doc(id).update({
                      'Email': emailcontroller.text.toString(),
                      'Full name': nameController.text.toString()
                    }).then((value) => {
                          utilsProvider.showloading(false),
                          GeneralUtils()
                              .showsuccessflushbar('Profile Updated!', context)
                        });
                  }
                },
                title: 'Submit'),
          ],
        ),
      ),
    );
  }
}
