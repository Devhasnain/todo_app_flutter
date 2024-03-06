class Todo {
  int ? id;
  String ? text;
  bool isDone;

  Todo({
    required this.id,
    required this.text,
    this.isDone = false
});
  static List<Todo> todoList(){
    return [
      Todo(id: 1, text: "This is what i have to do.", isDone: true),
      Todo(id: 2, text: "i have to do.", isDone: false),
      Todo(id: 3, text: "Bla bal I have to do what .", isDone: false),
      Todo(id: 4, text: "What is have to do.", isDone: false),
      Todo(id: 5, text: "What is am doing", isDone: false),
      Todo(id: 6, text: "This is what i have to do.", isDone: false),
      Todo(id: 7, text: "This is ave to do.", isDone: false),
      Todo(id: 8, text: "This is what i have to do.", isDone: false),
      Todo(id: 9, text: "This is  do.", isDone: false),
      Todo(id: 10, text: "This is what i have to do.", isDone: false),

    ];
  }
}