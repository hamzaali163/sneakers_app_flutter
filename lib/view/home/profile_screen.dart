// import 'package:ecommerce_app/model/userModel.dart';
// import 'package:ecommerce_app/respository/components/app_styles.dart';
// import 'package:ecommerce_app/utils/general_utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final emailcontroller = TextEditingController();
//   final namecontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();
//   final id = FirebaseAuth.instance.currentUser!.uid;
//   final picker = ImagePicker();

//   FirebaseAuth authenticate = FirebaseAuth.instance;
//   String Name = '';

//   @override
//   void initState() {
//     super.initState();

//     // ignore: unused_local_variable
//     final utilsProvider =
//         Provider.of<UserModel>(context, listen: false).getfirsestoredata();
//   }

//   void getdata() async {
//     try {
//       final userdata = await FirebaseFirestore.instance
//           .collection('User Data')
//           .doc(id)
//           .get();

//       setState(() {
//         Name = userdata.get('Full name');
//       });

//       debugPrint('email1');
//       debugPrint(Name);
//       debugPrint(userdata.get('Email'));
//       debugPrint(id);
//     } catch (error, stackTrace) {
//       print(error.toString());
//       print('Stack trace: $stackTrace');
//       // Handle the error as needed
//     }
//   }

//   Widget build(BuildContext context) {
//     final utilsProvider = Provider.of<UserModel>(context, listen: true);

//     double screenheight = MediaQuery.of(context).size.height;
//     double screenwidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ... (rest of your code remains unchanged)

//             Center(
//               child: Consumer<UserModel>(
//                 builder: (context, value, child) {
//                   return Container(
//                       height: 100,
//                       width: 102,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: value.userimage.isEmpty
//                           ? Container(
//                               height: 100,
//                               width: 100,
//                               decoration: const BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                                 color: Colors.grey,
//                               ),
//                               child: const Icon(
//                                 Icons.person,
//                                 color: Colors.black,
//                               ),
//                             )
//                           // ignore: sized_box_for_whitespace
//                           : Container(
//                               height: 100,
//                               child: Image.network(
//                                 value.userimage,
//                                 fit: BoxFit.fill,
//                               ),
//                             ));
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Consumer<GeneralUtils>(
//               builder: (context, value1, child) {
//                 return InkWell(
//                   onTap: () async {
//                     // await value1.getgalleryimage();
//                     await value1.uploadimage();
//                     await value1
//                         .uploadtoFirestore()
//                         .onError((error, stackTrace) => {
//                               debugPrint(error.toString()),
//                               GeneralUtils()
//                                   .showerrorflushbar(error.toString(), context)
//                             });
//                   },
//                   child: const Center(
//                     child: Text(
//                       'Change Profile Picture',
//                       style: TextStyle(
//                           fontFamily: 'Raleway-SemiBold',
//                           color: AppColor.backgroundColor,
//                           fontSize: 16),
//                     ),
//                   ),
//                 );
//               },
//             ),

//             utilsProvider.useremail.isEmpty
//                 ? const Center(
//                     child: CircularProgressIndicator(
//                     strokeWidth: 4,
//                     color: AppColor.backgroundColor,
//                   ))
//                 : Padding(
//                     padding: EdgeInsets.only(
//                         top: screenheight * 0.08, left: screenwidth * 0.08),
//                     child: const Text(
//                       'Your Name',
//                       style: TextStyling.formtextstyle,
//                     ),
//                   ),
//             Padding(
//               padding: EdgeInsets.only(
//                   left: screenwidth * 0.04,
//                   right: screenwidth * 0.04,
//                   top: screenheight * 0.01),
//               child: TextFormField(
//                 enabled: false,
//                 decoration: InputDecoration(
//                     label: Text(utilsProvider.username),
//                     labelStyle: TextStyling.hinttext,
//                     filled: true,
//                     fillColor: const Color(0xffF7F7F9),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(12))),
//               ),
//             ),

//             Padding(
//               padding: EdgeInsets.only(
//                   top: screenheight * 0.02, left: screenwidth * 0.08),
//               child: const Text(
//                 'Email',
//                 style: TextStyling.formtextstyle,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   left: screenwidth * 0.04,
//                   right: screenwidth * 0.04,
//                   top: screenheight * 0.01),
//               child: TextFormField(
//                 enabled: false,
//                 decoration: InputDecoration(
//                     label: Text(utilsProvider.useremail),
//                     labelStyle: TextStyling.hinttext,
//                     filled: true,
//                     fillColor: const Color(0xffF7F7F9),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(12))),
//               ),
//             ),

//             Padding(
//               padding: EdgeInsets.only(
//                   top: screenheight * 0.02, left: screenwidth * 0.08),
//               child: const Text(
//                 'Password',
//                 style: TextStyling.formtextstyle,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   left: screenwidth * 0.04,
//                   right: screenwidth * 0.04,
//                   top: screenheight * 0.01),
//               child: TextFormField(
//                 enabled: false,
//                 decoration: InputDecoration(
//                     label: const Text('*************'),
//                     labelStyle: TextStyling.hinttext,
//                     filled: true,
//                     fillColor: const Color(0xffF7F7F9),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(12))),
//               ),
//             ),

//             // ... (rest of your code remains unchanged)
//           ],
//         ),
//       ),
//     );
//   }
// }
