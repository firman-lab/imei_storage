import 'package:flutter/material.dart';
import 'package:imei_storage/theme.dart';

class DataTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor3,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(
            '00899877266365',
            style: primaryTextStyle.copyWith(
              fontSize: 21,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Realme C20',
            style: primaryTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 16,
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2b2939),
          )
        ],
      ),
    );
  }
}
