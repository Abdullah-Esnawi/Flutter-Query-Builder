import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:query_builder/api/fetch_data.dart';
import 'package:query_builder/api/model/user_model.dart';
import 'package:query_builder/controller/user_controller.dart';
import 'package:query_builder/view/result_page.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List listItems = [];
  // @override
  // void initState() {
  //   super.initState();
  //   listItems = UserController().filterUsers();
  // }

  UserController _userController = UserController();

  // List<User> filteredUsers = [];
  bool showSecondSection = false;
  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  double _height = 0.0;
  // double _bottom = 0.0;
  TextEditingController _firstFieldController = TextEditingController();
  TextEditingController _secondFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserController>(
      create: (context) => UserController(),
      child: Consumer<UserController>(
        builder: (_, controller, __) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 100, left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Query Builder',
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                            color: Color.fromARGB(255, 38, 38, 38),
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        // Container(
                        //     alignment: Alignment.center,
                        //     width: 28,
                        //     height: 28,
                        //     margin: EdgeInsets.only(left: 12),
                        //     // padding: EdgeInsets.only(right: 5),
                        //     decoration: BoxDecoration(
                        //         border:
                        //             Border.all(color: Colors.red, width: .6),
                        //         borderRadius: BorderRadius.circular(50)),
                        //     child: Center(
                        //       child: IconButton(
                        //         constraints: BoxConstraints(),
                        //         padding: EdgeInsets.zero,
                        //         iconSize: 18.95,
                        //         color: Colors.red,
                        //         // visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                        //         onPressed: () {
                        //           setState(() {
                        //             showSecondSection = false;
                        //             _height = 0;
                        //             _secondFieldController.clear();
                        //           });
                        //         },
                        //          icon:const Icon(Icons.close),
                        //       ),
                        //     ),
                        //   ),
                        Container(
                          alignment: Alignment.center,
                          width: 28,
                          height: 28,
                          // margin: EdgeInsets.only(left: 12),
                          // padding: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: .6),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: IconButton(
                             
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              iconSize: 18.95,
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  showSecondSection = true;
                                  _height = 110;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 247, 247, 247),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: buildDropdown(
                                    updateValue: controller.updateSelectedAttS1,
                                    listItems: controller.userAtt,
                                    selectedItem: controller.selectedAttS1,
                                    controller: controller,
                                    isSection1: true),
                              ),
                              const SizedBox(width: 12),
                              // refactor
                              buildDropdown(
                                  listItems: controller.typeAttributeS1 ==
                                          typeAttS1.Number
                                      ? controller.operatorsNumber
                                      : controller.operatorsString,
                                  selectedItem: controller.selectedOperatorS1,
                                  updateValue:
                                      controller.updateSelectedOperatorS1,
                                  controller: controller,
                                  isSection1: null),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            alignment: Alignment.center,
                            height: 36,
                            padding: EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: Color(0xFFDAD7D7), width: .6)),
                            child: Form(
                              key: _key1,
                              child: TextFormField(
                                controller: _firstFieldController,
                                onChanged: controller.updateFirstField,
                                decoration: const InputDecoration(
                                    isDense: true, border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDropdown(
                        listItems: controller.optionOperators,
                        selectedItem: controller.selectedOptionOperator,
                        updateValue: controller.updateSlctdOptionOperator,
                        controller: controller,
                        isSection1: null),
                    const SizedBox(height: 20),
                    AnimatedContainer(
                      height: _height,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 247, 247, 247),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: buildDropdown(
                                            updateValue:
                                                controller.updateSelectedAttS2,
                                            listItems: controller.userAtt,
                                            selectedItem:
                                                controller.selectedAttS2,
                                            controller: controller,
                                            isSection1: false),
                                      ),
                                      _height == 110
                                          ? const SizedBox(width: 12)
                                          : Container(),
                                      // refactor
                                      buildDropdown(
                                          listItems:
                                              controller.typeAttributeS2 ==
                                                      typeAttS2.Number
                                                  ? controller.operatorsNumber
                                                  : controller.operatorsString,
                                          selectedItem:
                                              controller.selectedOperatorS2,
                                          updateValue: controller
                                              .updateSelectedOperatorS2,
                                          controller: controller,
                                          isSection1: null),
                                    ],
                                  ),
                                ),
                                _height == 110
                                    ? const SizedBox(height: 12)
                                    : Container(),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 36,
                                    padding: EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color: Color(0xFFDAD7D7),
                                            width: .6)),
                                    child: Form(
                                      key: _key2,
                                      child: TextFormField(
                                        controller: _secondFieldController,
                                        onChanged: controller.updateSecondField,
                                        decoration: const InputDecoration(
                                            isDense: true,
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 28,
                            height: 28,
                            margin: EdgeInsets.only(left: 12),
                            // padding: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: .6),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: IconButton(
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.zero,
                                iconSize: 18.95,
                                color: Colors.red,
                                // visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                                onPressed: () {
                                  setState(() {
                                    showSecondSection = false;
                                    _height = 0;
                                    _secondFieldController.clear();
                                  });
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _height == 110 ? const SizedBox(height: 20) : Container(),
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (controller.firstField == null ||
                              controller.selectedAttS1 == null ||
                              controller.selectedOperatorS1 == null ||
                              (controller.secondField == null &&
                                  showSecondSection) ||
                              (controller.selectedAttS2 == null &&
                                  showSecondSection) ||
                              (controller.selectedOperatorS2 == null &&
                                  showSecondSection)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.grey,
                                    clipBehavior: Clip.antiAlias,
                                    content:
                                        Text("Please Enter Correct Query!")));
                          }

                          List<User> filteredUsers =
                              await filterUsers(controller);

                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ResultPage(filteredUsers),
                            ),
                          );
                        },
                        child: const Icon(
                          CupertinoIcons.search,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }

  Container buildDropdown(
      {required List<String> listItems,
      String? selectedItem,
      required Function updateValue,
      bool? isSection1,
      required UserController controller}) {
    return Container(
      height: 36,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Color(0xFFDAD7D7), width: .6),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            isDense: true,
            value: selectedItem == null ? listItems[0] : selectedItem,

            // value: selectedItem ?? 'Age',
            items: listItems.map(buildMenuItem).toList(),
            onChanged: (newValue) {
              if (newValue == null) {
                newValue = listItems[0];
              }
              updateValue(newValue);

              controller.changeOperators(newValue, isSection1: isSection1);
            }),
      ),
    );
  }

  /// TODO: I Will Move This Function To '[UserController]' Class
  Future<List<User>> filterUsers(UserController controller) async {
    List<User> users = await UserData().getUsers();
    List<User> filteredUsers = <User>[];
    List<User> firstFilterResult = <User>[];
    List<User> secondFilterResult = <User>[];

    if (showSecondSection) {
      int indexItem = 0;
      firstFilterResult.addAll(buildConditions(
          controller: controller,
          list: users,
          att: controller.selectedAttS1,
          operator: controller.selectedOperatorS1!,
          inputField: controller.firstField!));

      secondFilterResult.addAll(buildConditions(
          controller: controller,
          list: users,
          att: controller.selectedAttS2,
          operator: controller.selectedOperatorS2!,
          inputField: controller.secondField!));

      for (int i = 0; i < secondFilterResult.length; i++) {
        for (int i = 0; i < firstFilterResult.length; i++) {
          if (secondFilterResult[indexItem].id == firstFilterResult[i].id) {
            filteredUsers.add(firstFilterResult[i]);
          }
        }
        indexItem++;
      }

      if (filteredUsers.isEmpty && controller.selectedOptionOperator == 'OR') {
        filteredUsers.addAll(buildConditions(
            controller: controller,
            list: users,
            att: controller.selectedAttS1,
            operator: controller.selectedOperatorS1!,
            inputField: controller.firstField!));
      }
      return filteredUsers;
    } else {
      filteredUsers.addAll(buildConditions(
          controller: controller,
          list: users,
          att: controller.selectedAttS1,
          operator: controller.selectedOperatorS1!,
          inputField: controller.firstField!));
      return filteredUsers;
    }
  }

  List<User> buildConditions({
    required UserController controller,
    required List<User> list,
    required att,
    required String operator,
    required String inputField,
  }) {
    List<User> filteredUsers = <User>[];
    if (att == 'Age' || att == 'User Id') {
      if (operator == '=') {
        filteredUsers = list.where((element) {
          if (att == 'Age') {
            return element.age == int.parse(inputField);
          } else {
            return element.id == int.parse(inputField);
          }
        }).toList();
      } else if (operator == '<') {
        filteredUsers = list.where((element) {
          if (att == 'Age') {
            return element.age! < int.parse(inputField);
          } else {
            return element.id! < int.parse(inputField);
          }
        }).toList();
      } else if (operator == '>') {
        filteredUsers = list.where((element) {
          if (att == 'Age') {
            return element.age! > int.parse(inputField);
          } else {
            return element.id! > int.parse(inputField);
          }
        }).toList();
      } else if (operator == '!=') {
        filteredUsers = list.where((element) {
          if (att == 'Age') {
            return element.age != int.parse(inputField);
          } else {
            return element.id != int.parse(inputField);
          }
        }).toList();
      }
      return filteredUsers;
    } else if (att != 'Age' || att != 'User Id') {
      print("in Strings");
      if (operator == 'Contains') {
        print("if Starts With true");
        filteredUsers = list.where((element) {
          if (att == 'First Name') {
            return element.firstName!
                .toLowerCase()
                .contains(inputField.toLowerCase());
          } else if (att == 'Last Name') {
            return element.lastName!.contains(inputField.toLowerCase());
          } else if (att == 'Full Name') {
            return element.fullName!.contains(inputField.toLowerCase());
          } else {
            return element.gender!.contains(inputField.toLowerCase());
          }
        }).toList();
      } else if (operator == 'Starts With') {
        print("if Starts With true");
        filteredUsers = list.where((element) {
          if (att == 'First Name') {
            return element.firstName!
                .toLowerCase()
                .startsWith(inputField.toLowerCase());
          } else if (att == 'Last Name') {
            return element.lastName!
                .toLowerCase()
                .startsWith(inputField.toLowerCase());
          } else if (att == 'Full Name') {
            return element.fullName!
                .toLowerCase()
                .startsWith(inputField.toLowerCase());
          } else {
            return element.gender!
                .toLowerCase()
                .startsWith(inputField.toLowerCase());
          }
        }).toList();
      } else if (operator == 'Ends With') {
        print("if Ends With true");
        filteredUsers = list.where((element) {
          if (att == 'First Name') {
            return element.firstName!
                .toLowerCase()
                .endsWith(inputField.toLowerCase());
          } else if (att == 'Last Name') {
            return element.lastName!
                .toLowerCase()
                .endsWith(inputField.toLowerCase());
          } else if (att == 'Full Name') {
            return element.fullName!
                .toLowerCase()
                .endsWith(inputField.toLowerCase());
          } else {
            return element.gender!
                .toLowerCase()
                .endsWith(inputField.toLowerCase());
          }
        }).toList();
      } else if (operator == 'Exact') {
        print("if exact true");
        filteredUsers = list.where((element) {
          if (att == 'First Name') {
            return element.firstName!.toLowerCase() == inputField.toLowerCase();
          } else if (att == 'Last Name') {
            return element.lastName!.toLowerCase() == inputField.toLowerCase();
          } else if (att == 'Full Name') {
            return element.fullName!.toLowerCase() == inputField.toLowerCase();
          } else {
            return element.gender!.toLowerCase() == inputField.toLowerCase();
          }
        }).toList();
      }
      return filteredUsers;
    } else {
      return list;
    }
  }
}
