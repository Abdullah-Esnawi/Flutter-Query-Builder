import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:query_builder/api/fetch_data.dart';
import 'package:query_builder/api/model/user_model.dart';
import 'package:query_builder/controller/user_controller.dart';

class ResultPage extends StatelessWidget {
  List<User> filteredUsers;
  ResultPage(
    this.filteredUsers,
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserController>(
      create: (context) => UserController(),
      child: Consumer<UserController>(
        builder: (_, model, __) {
          return Scaffold(
              backgroundColor: Color.fromRGBO(221, 221, 221, 1),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 29.12, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:const Icon(
                          Icons.arrow_back_rounded,
                          color: Color.fromRGBO(38, 38, 38, 1),
                        ),
                      ),
                      const SizedBox(height: 27.13),
                      Text(
                        'Users',
                        style: GoogleFonts.outfit(
                          fontSize: 32,
                          color: Color.fromARGB(255, 38, 38, 38),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 27.13),
                      Expanded(
                          child: filteredUsers.isNotEmpty
                              ? ListView.builder(
                                  itemBuilder: ((context, index) {
                                    var item = filteredUsers[index];
                                    return Card(
                                      margin: EdgeInsets.only(bottom: 13),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      // elevation: 3,
                                      color: Colors.white,
                                      child: ListTile(
                                          visualDensity: const VisualDensity(
                                              horizontal: 0, vertical: 0),
                                          dense: true,
                                          contentPadding:const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 11),
                                          title: Text(
                                            '${item.fullName}',
                                            style:const TextStyle(
                                                fontSize: 17,
                                               
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 38, 38, 38)),
                                          ),
                                          subtitle: Text(
                                            '${item.gender}',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 38, 38, 38)),
                                          ),
                                          leading: const Icon(
                                            CupertinoIcons
                                                .person_alt_circle_fill,
                                            size: 50,
                                          )),
                                    );
                                  }),
                                  itemCount: filteredUsers.length,
                                )
                              : const Center(
                                  child: Text('No Users Have this Info'),
                                )),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
