import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/res/type.dart';
import 'package:my_notes_with_firebase_mvvm/view/home/home_screen.dart';
import 'package:my_notes_with_firebase_mvvm/view/splash_screen.dart';

class AddNotes extends StatefulWidget {
  final ActionType type;
  final String? title;
  final String? desc;
  const AddNotes({Key? key, required this.type, this.title, this.desc})
      : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  void initState() {
    if (widget.type == ActionType.isView) {
      titleController.text = widget.title!;
      descController.text = widget.desc!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: KColors.kGrey,
              ),
            ),
            Text(
              'Add New Notes',
              style: KStyle.title(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    final desc = descController.text.trim();

                    if (title.isEmpty || desc.isEmpty) {
                      Get.snackbar('No Content', 'Please write Anything',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: KColors.kWhite);
                      return;
                    } else {
                      Get.back();
                    }
                  },
                  icon: Icon(
                    Icons.save,
                    color: KColors.kWhite,
                  )),
            )
          ],
        ),
        SizedBox(
          height: size.height * .9,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: KStyle.title(),
                ),
                Expanded(
                    child: Text(
                  'Description',
                  style: KStyle.content(),
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
