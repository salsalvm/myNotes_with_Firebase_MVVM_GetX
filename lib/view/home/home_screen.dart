import 'dart:math';

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

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

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
              color: KColors.kWhite,
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
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) => controller.notes == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: KColors.kWarnning,
                      ),
                    )
                  : controller.notes.isEmpty
                      ? Center(
                          child: Text(
                            KString.noNotes,
                            style: KStyle.heading(
                              color: KColors.kGrey,
                            ),
                          ),
                        )
                      : SizedBox(
                          child: GridView.builder(
                              itemCount: controller.notes.length,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                childAspectRatio: 1 / 1,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    color: KColors.kWhite.withOpacity(.9),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 140,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          KColors.kBlack,
                                                      context: context,
                                                      builder: (ctx) {
                                                        return AddNotes(
                                                          type:
                                                              ActionType.isView,
                                                          desc: controller
                                                                  .notes[index]
                                                              ['desc'],
                                                          title: controller
                                                                  .notes[index]
                                                              ['title'],
                                                          id: controller
                                                                  .notes[index]
                                                              ['id'],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: KColors.kWarnning,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .deleteDataFromFirebase(
                                                            controller.notes[
                                                                index]['id']);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: KColors.kError,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Flexible(
                                            child: Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              '${controller.notes[index]}',
                                              style: KStyle.title(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Flexible(
                                              child: Text(
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            '${controller.notes[index]['desc']}',
                                            style: KStyle.title(
                                                color: KColors.kGrey),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
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
                        return const AddNotes(
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
