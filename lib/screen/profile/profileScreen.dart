import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleepwellfrontend/screen/profile/assetsIcons/AccountDetails.dart';
import 'package:sleepwellfrontend/screen/profile/assetsIcons/Edit.dart';
import 'package:sleepwellfrontend/screen/profile/assetsIcons/Heart.dart';
import 'package:sleepwellfrontend/screen/profile/assetsIcons/RightAngel.dart';
import 'package:sleepwellfrontend/screen/profile/assetsIcons/SleepReport.dart';
import 'package:sleepwellfrontend/screen/profile/assetsIcons/settings.dart';

import 'assetsIcons/Logout.dart';
import 'assetsIcons/Rewards.dart';
import 'assetsIcons/About.dart';
import 'assetsIcons/Notification.dart';

//Naflan

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 35,
            )),
        // leading: BackButton(
        //   onPressed: () {},
        //),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                          image: AssetImage(
                              "assets/images/ProfileImages/propic.png")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),

                      child: IconButton(
                          onPressed: (() {}),
                          icon: const Icon(
                            Edit.edit,
                            color: Colors.black,
                            size: 25,
                          )),
                      // child: const Icon(
                      //   Edit.edit,
                      //   color: Colors.black,
                      //   size: 20,
                      // ),

                      // child: Image(
                      //     image: AssetImage(
                      //         "assets/images/ProfileImages/edit_icon.png")),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

//this as to be change as a varible ///////
              Text(
                "UserName",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              Text(
                "username123@gmail.com",
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 20),

              ///
              ///menu list
              ///

              ///
              ///Account Details
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(
                    AccountDetails.account_det,
                    color: Colors.black,
                    size: 30,
                  ),

                  // child: Image(
                  //     image: AssetImage(
                  //         "assets/images/ProfileImages/Account_Details.png")),
                ),
                onTap: () {},
                title: Text("Account Details",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      RightAngel.right_open_big,
                      color: Colors.black,
                      size: 25.0,
                    )),
              ),
              const Divider(),

              ///
              ///My Favorite
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Heart.heart,
                    color: Colors.black,
                    size: 30,
                  ),
                  // child: Image(
                  //     image:
                  //         AssetImage("assets/images/ProfileImages/heart.png")),
                ),
                onTap: () {},
                title: Text("My Favorite",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      RightAngel.right_open_big,
                      color: Colors.black,
                      size: 25.0,
                    )),
              ),
              const Divider(),

              ///
              ///Sleep Report
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(SleepReport.graph, color: Colors.black, size: 30),
                  // child: Image(
                  //     image: AssetImage(
                  //         "assets/images/ProfileImages/SleepReport.png")),
                ),
                onTap: () {},
                title: Text("Sleep Report",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      RightAngel.right_open_big,
                      color: Colors.black,
                      size: 25.0,
                    )),
              ),
              const Divider(),

              ///
              ///Rewards
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(Rewards.award, color: Colors.black, size: 30),
                  // child: Image(
                  //     image: AssetImage(
                  //         "assets/images/ProfileImages/Rewards.png")),
                ),
                onTap: () {},
                title: Text("Rewards",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      RightAngel.right_open_big,
                      color: Colors.black,
                      size: 25.0,
                    )),
              ),
              const Divider(),

              ///
              ///Settings
              ///
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Settings.setting,
                    color: Colors.black,
                    size: 30,
                  ),
                  // child: Image(
                  //     image: AssetImage(
                  //         "assets/images/ProfileImages/settings.png")),
                ),
                onTap: () {},
                title: Text("Settings",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      RightAngel.right_open_big,
                      color: Colors.black,
                      size: 25.0,
                    )),
              ),
              const Divider(),

              ///
              ///Nortifications
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child:
                      Icon(Icons.notifications, color: Colors.black, size: 30),
                  // child: Image(
                  //     image: AssetImage(
                  //         "assets/images/ProfileImages/Nortification.png")),
                ),
                onTap: () {},
                title: Text("Nortifications",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      RightAngel.right_open_big,
                      color: Colors.black,
                      size: 25.0,
                    )),
              ),
              const Divider(),

              ///
              ///About sleepWell
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(About.about, color: Colors.black, size: 30),
                  // child: Image(
                  //     image:
                  //         AssetImage("assets/images/ProfileImages/About.png")),
                ),
                onTap: () {},
                title: Text("About sleepWell",
                    style: Theme.of(context).textTheme.bodyLarge),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      RightAngel.right_open_big,
                      color: Colors.black,
                      size: 25.0,
                    )),
              ),
              const Divider(),

              ///
              ///LogOut
              ///

              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.logout, color: Colors.black, size: 30),
                  // child: Image(
                  //     image:
                  //         AssetImage("assets/images/ProfileImages/LogOut.png")),
                ),
                onTap: () {},
                title: Text("LogOut",
                    style: Theme.of(context).textTheme.bodyLarge),
                // trailing: Container(
                //     width: 30,
                //     height: 30,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(100),
                //     ),
                //     child:
                //         const Icon(LineAwesomeIcons.angle_right, size: 20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ///menu list
//               ///
//               ListTile(
//                 leading: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.white,
//                   ),
//                   child: Image(
//                       image: AssetImage("assets\images\Account_Details.png")),
//                 ),
//                 title: Text("Account Details",
//                     style: Theme.of(context).textTheme.bodyMedium),
//                 trailing: Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     child:
//                         const Icon(LineAwesomeIcons.angle_right, size: 20.0)),
//               ),



//////////////////////
///
//               ProfileMenuWidget(
//                 title: 'Account Details',
//                 onPress: () {},
//                 //menuImage: "assets\images\Account_Details.png",
//                 icon: IconlyBold.user_2,
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: 'My Favourite',
//                 icon: IconlyBold.heart,
//                 onPress: () {},
//                 //menuImage: null,
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: 'Sleep report',
//                 icon: IconlyBold.heart,
//                 onPress: () {},
//                 //menuImage: null,
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: 'Rewards',
//                 icon: IconlyBold.arrow_right_circle,
//                 onPress: () {},
//                 //menuImage: null,
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: 'Setting',
//                 icon: IconlyBold.setting,
//                 onPress: () {},
//                 //menuImage: null,
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: 'Nortifications',
//                 icon: IconlyBold.notification,
//                 onPress: () {},
//                 //menuImage: null,
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: 'About SleepWell',
//                 icon: IconlyBold.activity,
//                 onPress: () {},
//                 //menuImage: null,
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: 'LogOut',
//                 icon: IconlyBold.logout,
//                 onPress: () {},
//                 //menuImage: null,
//                 endIcon: false,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfileMenuWidget extends StatelessWidget {
//   const ProfileMenuWidget({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onPress,
//     this.endIcon = true,
//     this.textColor,
//     //required this.menuImage,
//   });

//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final Color? textColor;
//   //final Image menuImage;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onPress,
//       leading: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Colors.white,
//         ),
//         //child: Image(image: AssetImage(menuImage as String)),
//         //child: IconlyIcon(icon, size: 20.0),
//         //child: IconlyIcon(IconlyBold.arrow_down_2, size: 20.0),
//       ),
//       title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
//       trailing: endIcon
//           ? Container(
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: const IconlyIcon(IconlyBold.arrow_right, size: 20.0))
//           : null,
//     );