import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/Const/Colors.dart';
import 'package:todo_list/Model/Todo.dart';
import 'package:todo_list/widgets/items.dart';
import '../widgets/items.dart';

class Home extends StatelessWidget {
  Home({Key? Key}) : super(key: Key);

  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: Text(
                      'All ToDos',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (ToDo todoo in todosList)
                    TodoItem(
                      todo: todoo,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),

      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ), //customize text field
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: tdBgColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //Align the picture to left
          children: [
            Icon(
              Icons.menu,
              color: tdpink,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius:
                    BorderRadiusDirectional.circular(20), //making dp circular
                child: Image.asset(''),
              ),
            ),
          ],
        ));
  }
}
