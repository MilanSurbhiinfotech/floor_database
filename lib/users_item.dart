import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floor/db/user_data.dart';

class Useritem extends StatefulWidget {
  UserData userData;
  Function(UserData)? onDelete;
  Function(UserData)? onEdit;

  Useritem(this.userData, {this.onDelete, this.onEdit, Key? key})
      : super(key: key);

  @override
  State<Useritem> createState() => _UseritemState();
}

class _UseritemState extends State<Useritem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2)
      ]),
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : " + widget.userData.name),
              Text("Mobile :" + widget.userData.phone)
            ],
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                child: Icon(Icons.edit),
                onTap: () {
                  widget.onEdit!(widget.userData);
                },
              ),
              SizedBox(
                width: 14,
              ),
              InkWell(
                child: Icon(Icons.delete),
                onTap: () {
                  widget.onDelete!(widget.userData);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
