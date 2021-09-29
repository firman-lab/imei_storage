import 'package:flutter/material.dart';
import 'package:imei_storage/Widget/data_tile.dart';
import '../theme.dart';

class DataPage extends StatelessWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Oppss no data yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'You have never done transaction',
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        color: backgroundColor3,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          children: [
            DataTile(),
          ],
        ),
      );
    }

    return Scaffold(
      body: content(),
    );
  }
}
