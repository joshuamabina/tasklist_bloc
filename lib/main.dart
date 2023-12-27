import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListCubit extends Cubit<String> {
  TaskListCubit() : super('No tasks yet!');

  void createTask() => emit('Buy milk.${DateTime.timestamp()}');
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List - BLoC',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.black),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => TaskListCubit(),
        child: TaskList(),
      ),
    );
  }
}

// class Tasks extends StatefulWidget {
//   const Tasks({super.key});
//
//   @override
//   State<Tasks> createState() => _TasksState();
// }

class TaskList extends StatelessWidget {
  final List<Task> _tasks = <Task>[
    Task('Buy milk', isCompleted: true),
    Task('Drink coffee', description: "Sip energy, savor productive moments."),
    Task('Build something amazing')
  ];

  // const TaskList({super.key});

  void _createTask(newTask) {
    // setState(() {
    //   _tasks.add(Task(newTask));
    // });
  }

  void _toggleCompleted(Task item, {String? actionType}) {
    final task =
    _tasks.firstWhereOrNull((element) => element.title == item.title);

    if (task != null) {
      // setState(() {
      //   task.isCompleted = !item.isCompleted;
      // });
    }

    if (actionType == 'Undo' || item.isCompleted == false) return;

    const snackBarMessage = 'Task completed';
    final snackBar = SnackBar(
      content: const Text(snackBarMessage),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          _toggleCompleted(item, actionType: 'Undo');
        },
      ),
    );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tasks"),
      ),
      body: BlocBuilder<TaskListCubit, String>(
        builder: (BuildContext context, String state) {
          return _tasks.isNotEmpty
              ? ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Checkbox(
                    value: _tasks[index].isCompleted,
                    onChanged: (item) => _toggleCompleted(_tasks[index]),
                  ),
                  title: _tasks[index].isCompleted == true
                      ? Text(
                    _tasks[index].title,
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough),
                  )
                      : Text(
                    '$_tasks[index].title+$state',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('Tasks'),
                          ),
                          body: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        style: _tasks[index].isCompleted ==
                                            true
                                            ? const TextStyle(
                                            fontSize: 32,
                                            decoration: TextDecoration
                                                .lineThrough)
                                            : const TextStyle(fontSize: 32),
                                        initialValue: _tasks[index].title,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      TextFormField(
                                        initialValue:
                                        _tasks[index].description,
                                        decoration: const InputDecoration(
                                          hintText: 'Add description',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ],
                                  ))),
                          bottomNavigationBar: BottomAppBar(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: GestureDetector(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: _tasks[index].isCompleted == true
                                        ? const Text('Mark uncompleted',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ))
                                        : const Text('Mark completed',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  onTap: () {
                                    final task = _tasks[index];

                                    String snackBarMessage;
                                    if (task.isCompleted == true) {
                                      task.isCompleted = !task.isCompleted;
                                      snackBarMessage =
                                      'Task marked uncompleted';
                                    } else {
                                      task.isCompleted = !task.isCompleted;
                                      snackBarMessage = 'Task marked completed';
                                    }

                                    // setState(() {});

                                    final snackBar = SnackBar(
                                      content: Text(snackBarMessage),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          // _toggleCompleted(task, actionType: 'Undo');
                                        },
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                ),
                              )),
                        );
                      }),
                    );
                  },
                );
              })
              : const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No tasks yet!',
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext _) {
                return SizedBox(
                  height: 100,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextField(
                                onSubmitted: (value) {
                                  // _createTask(value);
                                  context.read<TaskListCubit>().createTask();
                                  Navigator.of(_).pop();
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'New task',
                                ),
                              ),
                            )
                          ])),
                );
              });
        },
        tooltip: 'New task',
        label: const Text('New task'),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Task {
  final String title;
  final String? description;
  bool isCompleted = false;

  Task(this.title, {this.description, this.isCompleted = false});

  String getTask() => 'Task: $title';
}
