
import 'package:flutter/material.dart';
import 'package:todo_app/data%20base%20helper.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final todoController = TextEditingController();
   bool validated = true;
   String errormessage = "";
   String todoAdded = "";
   final dbHelper =DbHelper.instance;
   var mytodo=[];
   List <Widget>ListOfCard =[];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
      builder: ( context,snap){

      if(snap.hasData ==null){
        return  const Center(
          child: Text("NO DATA"),
        );
      }else {
        if(mytodo.isEmpty){
          return Scaffold(
            appBar: AppBar(
              title: const Text('MY TASKS'),
            ),

            body: const Center(
              child: Text("NO TASKS AVAILABLE" , style: TextStyle(
                fontSize: 25.0,

              ),),

            ),

            floatingActionButton: FloatingActionButton(
              onPressed: ShowAlertDialog,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add),
            ),
          );
        }
        else{
          Scaffold(
            appBar: AppBar(
              title: const Text('MY TASKS'),
            ),

            body: SingleChildScrollView(
              child: Column(
                children: ListOfCard,

              ),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: ShowAlertDialog,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add),
            ),
          );
        }
      };
      return const Text("No widget to build");

    },
        future: query (),
    );
  }
  void  ShowAlertDialog(){
    todoController.text="";
  showDialog(
      context: context,
      builder: (context){
      return StatefulBuilder(
          builder: (context ,setState){
            return AlertDialog(
             title: const Text("add a task"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                  autofocus: true,
                    controller: todoController,
                    style: const TextStyle(
                      fontSize: 15.0,

                    ),
                    decoration: InputDecoration(
                      errorText:validated ? null:errormessage
                    ),
                    onChanged: (value){
                         value=todoAdded;
                    },
                  ),
                 const SizedBox(height: 10.0,),
                  MaterialButton(onPressed: (){
                    if(todoController.text.isEmpty){
                      setState((){
                            errormessage ="Can NOT be empty";
                            validated=false;
                          }
                      );
                    }else if (todoController.text.length>500){
                      setState((){
                        errormessage = "too many characters";
                        validated=false;

                      });
                    } else {
                      addTodo();
                    }

                  },
                    color: Colors.purple,
                  child: const Text(
                    'add',
                    style: TextStyle(color: Colors.white),

                  ),
                  )
                ],
              ),
            );
          }
      );
      });
  }
  void addTodo() async{
    Map<String,dynamic> todo ={
      DbHelper.columnName : todoAdded
    };
    final id = await dbHelper.insert(todo);
    Navigator.of(context,rootNavigator: true).pop();
    todoAdded ="";
    setState(() {
      validated = true;
      errormessage = "";
    });
  }


  Future <bool> query() async{
    mytodo=[];
    ListOfCard = [];
     var ListOfTodo =  await dbHelper?.queryAllTodos();
     ListOfTodo?.forEach((task){
       mytodo.add(task.toString());
       ListOfCard.add(
         Card(
           elevation: 5.0,
           margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
           child:Container(
             padding: const EdgeInsets.all(5.0),
             child: ListTile(
               title: Text(task['todo'],style:
                 const TextStyle(
                   fontSize: 18.0,
                 ),
                 ),
               trailing: IconButton(
                 onPressed: (){
                   dbHelper?.delete(task['_id']);
                   print("task deleted");
                   setState(() {

                   });
                 },
                       icon:const Icon(Icons.delete,color:Colors.red ,) ,
               ),
             ),
           ) ,
         )
       );
     });


    return Future.value(true);
  }
}

