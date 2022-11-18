import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/res/type.dart';
import 'package:my_notes_with_firebase_mvvm/view/home/widgets/add_notes.dart';
import 'package:my_notes_with_firebase_mvvm/view_model/authentication_controller.dart';
import 'package:my_notes_with_firebase_mvvm/view_model/home_controller.dart';

TextEditingController descController = TextEditingController();
TextEditingController titleController = TextEditingController();

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    intializeApp();
    super.initState();
  }

  HomeController? data;

  List notes = [];
  intializeApp() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    data = HomeController();
    data!.getDatasFromFirebase().then((value) => {
          setState(() {
            notes = value!;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.canPop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: KColors.kBlack,
            )),
        centerTitle: true,
        title: Text(
          '${authController.userName}  ${KString.myNotes}',
          style: KStyle.heading(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                authController.signOut(context: context);
              },
              icon: const Icon(
                Icons.logout,
                color: KColors.kBlack,
              ))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              child: GridView.builder(
                  itemCount: notes.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1.2 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // showModalBottomSheet(
                        //   isScrollControlled: true,
                        //   backgroundColor: KColors.kBlack,
                        //   context: context,
                        //   builder: (ctx) {
                        //     return AddNotes(
                        //       type: ActionType.isView,
                        //       desc: controller.noteList[index].desc,
                        //       title: controller.noteList[index].title,
                        //     );
                        //   },
                        // );
                        // Get.to(

                        // );
                      },
                      child: Card(
                        color: KColors.kWarnning,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                'controller.noteList[index].title',
                                style: KStyle.title(),
                              )),
                              Flexible(
                                  child: Text(
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                'controller.noteList[index].desc',
                                style: KStyle.title(),
                              )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 10),
              child: Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: KColors.kBlack,
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: KColors.kBlack,
                      context: context,
                      builder: (ctx) {
                        return AddNotes(
                          type: ActionType.isAdd,
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AuthController authController = Get.put(AuthController());
}
