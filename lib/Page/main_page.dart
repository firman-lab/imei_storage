import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:imei_storage/Page/data_page.dart';
import 'package:imei_storage/Service/controller.dart';
import 'package:imei_storage/Model/model.dart';
import 'package:imei_storage/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController productController = TextEditingController();
  TextEditingController imeiController = TextEditingController();

  void _submitForm() {
    // if (_formKey.currentState!.validate()) {
    ImeiModel imeiModel =
        ImeiModel(productController.text, imeiController.text);

    FormController formController = FormController();
    print('Submitting Imei');

    formController.submitForm(imeiModel, (String response) {
      print("Response: $response");
      if (response == FormController.STATUS_SUCCESS) {
        // Feedback is saved succesfully in Google Sheets.
        print("Imei Submitted");
      } else {
        // Error Occurred while saving data in Google Sheets.
        print("Error Occurred!");
      }
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'IMEI Storage',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Keep Your Product Safe',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            )
          ],
        ),
      );
    }

    Widget productName() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Product',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Center(
                child: TextFormField(
                  controller: productController,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Product name',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget imei() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'IMEI Number',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Center(
                child: TextFormField(
                  controller: imeiController,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Imei',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonAdd() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 60),
        child: TextButton(
          onPressed: _submitForm,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
          ),
          child: Text(
            'Add Imei Product',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    Widget list() {
      return Container(
        margin: EdgeInsets.only(
          right: 16,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/data');
          },
          backgroundColor: primaryColor,
          child: Icon(Icons.list_alt_rounded),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              productName(),
              imei(),
              buttonAdd(),
            ],
          ),
        ),
      ),
      floatingActionButton: list(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
