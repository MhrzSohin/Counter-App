import 'package:counter_app/bloc/user_data_fetching/user_data_bloc.dart';
import 'package:counter_app/bloc/user_data_fetching/user_data_events.dart';
import 'package:counter_app/bloc/user_data_fetching/user_data_state.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});
  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserDataBloc>(context).add(UserDataFetchingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "User Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<UserDataBloc, UserDataState>(
        listener: (context, state) {
          // if (state.postStatus == PostStatus.success) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text("User Data Fetched Successfully"),
          //     backgroundColor: Colors.lightGreen,
          //   ));
          // }
        },
        builder: (context, state) {
          if (state.postStatus == PostStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                final userData = state.userList[index];
                return Card(
                  elevation: 5,
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.only(left: 18),
                    shape: const Border(),
                    collapsedBackgroundColor:
                        const Color.fromARGB(255, 255, 254, 254),
                    title: Text(
                      userData.name.toString(),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    // childrenPadding:
                    // const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                    "Username : ${userData.username.toString()}"),
                                Text("Email : ${userData.email.toString()}"),
                                Text("Phone No.: ${userData.phone.toString()}"),
                                Text(
                                    "Webiste : ${userData.website.toString()}"),
                              ])
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              state.userList.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete_rounded))
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
