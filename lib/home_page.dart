import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floor/db/user_data.dart';
import 'package:flutter_floor/home_cubit.dart';
import 'package:flutter_floor/home_state.dart';
import 'package:flutter_floor/users_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  HomeCubit _homeCubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _homeCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text((state is HomeComplete)
                ? "Total users " + state.userList.length.toString()
                : "Users"),
          ),
          body: getWidget(state!),
          floatingActionButton: FloatingActionButton(
            onPressed: _showDialog,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget getWidget(Object state) {
    if (state is HomeLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is HomeComplete) {
      return ListView.builder(
        itemCount: state.userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Useritem(state.userList[index], onDelete: (user) {
            _homeCubit.deleteUsers(user);
            _homeCubit.getUsers();
          }, onEdit: (user) {
            _showDialog(userData: user);
          });
        },
      );
    } else {
      return Container();
    }
  }

  void _showBottomsheet({UserData? data}) {
    if (data != null) {
      nameController.text = data.name.toString();
      phoneController.text = data.phone.toString();
    }
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.all(8),
                      child: const Text(
                        "Add User",
                        style: TextStyle(fontSize: 22),
                      )),
                  TextField(
                    decoration: const InputDecoration(hintText: "Enter name"),
                    controller: nameController,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter Mobile No"),
                    controller: phoneController,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 18)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () async {
                        if (data == null) {
                          var user = UserData(
                              name: nameController.text.toString(),
                              phone: phoneController.text.toString());
                          _homeCubit.addUsers(user);
                        } else {
                          var user = UserData(
                              name: nameController.text.toString(),
                              phone: phoneController.text.toString());
                          _homeCubit.updateUsers(user);
                          print(user.name.toString() +
                              " = " +
                              user.phone.toString());
                        }
                        _homeCubit.getUsers();
                        Navigator.pop(context);
                      },
                      child: Text(data == null ? "Submit" : "Update",
                          style: TextStyle(fontSize: 16)))
                ],
              ),
            ),
          );
        });
  }

  void _showDialog({UserData? userData}) {
    if (userData != null) {
      nameController.text = userData.name.toString();
      phoneController.text = userData.phone.toString();
    }

    showDialog(
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(14),
                        margin: EdgeInsets.all(8),
                        child: const Text(
                          "Add User",
                          style: TextStyle(fontSize: 22),
                        )),
                    TextField(
                      decoration: const InputDecoration(hintText: "Enter name"),
                      controller: nameController,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Enter Mobile No"),
                      controller: phoneController,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 18)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () async {
                          if (userData == null) {
                            var user = UserData(
                                name: nameController.text.toString(),
                                phone: phoneController.text.toString());
                            _homeCubit.addUsers(user);
                          } else {

                            userData.name = nameController.text.toString();
                            userData.phone = phoneController.text.toString();
                            _homeCubit.updateUsers(userData);

                          }
                          _homeCubit.getUsers();
                          Navigator.pop(context);
                        },
                        child: Text(_homeCubit == null ? "Submit" : "Update",
                            style: TextStyle(fontSize: 16)))
                  ],
                ),
              ),
            ),
          );
        },
        context: context);
  }
}
