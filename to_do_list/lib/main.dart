import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do List App",
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todos = [];
  TextEditingController _controller = TextEditingController();

  void _addTodo() {
    setState(() {
      _todos.add(_controller.text);
      _controller.clear();
    });
  }

  void _removeTodoItmes(int index) {
    setState(() {
      _todos.remove(index);
    });
  }

  Widget _buildTodoItem(String todo, int index){
      return ListTile(
        title: Text(todo),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: ()=> _removeTodoItmes(index),
        ),
      );
  }

  Widget _buidTodoItems(String todo,int index){
      return ListTile(
        title: Text(todo),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _removeTodoItmes(index),
        ),
      );
  }
  Widget _buildTodoList(){
    return ListView.builder(
        itemBuilder: (BuildContext context, int index){
          if(index < _todos.length){
            return _buildTodoItem(_todos[index], index);
          }
          return null;
        },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List App"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Add a task",
              ),
              onSubmitted: (String task) {
                _addTodo();
              },
            ),
            SizedBox(height: 15.0),
            Expanded(child: _buildTodoList())
          ],
        ),
      ),
    );
  }
}
