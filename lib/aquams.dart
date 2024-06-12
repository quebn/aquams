import "package:flutter/material.dart";

// TODO:
// [*] Create Navigation.
// [*] Clean and Create simple container for a list component.
// [ ] Add new item to list view with popup to input the value.
// [ ] Add popup to view to edit the list.
// [ ] Make created list persist.

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  List<Widget> todoList = <Widget>[];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Colors.lightBlue,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            addItems(currentPageIndex);
          });
        },
        child: const Icon(Icons.add_sharp),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: navbarNavigations,
      ),
      body: <Widget>[
        homePage(theme.textTheme.titleLarge),
        modulesPage(theme.textTheme.titleLarge),
        reportsPage(theme.textTheme.titleLarge),
        todoPage(theme.textTheme.titleLarge),
      ][currentPageIndex],
    );
  }

  Widget homePage(TextStyle? textStyle) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            "Home Page",
            style: textStyle,
          ),
        ),
      ),
    );
  }

  Widget todoPage(TextStyle? textStyle) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print("Tapped $index");
          },
          child: todoList[index],
        );
      },
    );
  }

  final List<Widget> list = <Widget>[
    const Card(
      child: ListTile(
        leading: Icon(Icons.notifications_sharp),
        title: Text("Module 1"),
        subtitle: Text("This is a module"),
      ),
    ),
    const Card(
      child: ListTile(
        leading: Icon(Icons.notifications_sharp),
        title: Text("Module 2"),
        subtitle: Text("This is a another module"),
      ),
    ),
    
  ];
  Widget modulesPage(TextStyle? textStyle) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print("Tapped $index");
          },
          child: list[index],
        );
      },
    );
    //return const Padding(
    //  padding: EdgeInsets.all(8.0),
    //  child: Column(
    //    children: <Widget>[
    //    ],
    //  ),
    //);
  }

  Widget reportsPage(TextStyle? textStyle) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            "Reports",
            style: textStyle,
          ),
        ),
      ),
    );
  }
  
  void addItems(int currentIndex) {
    switch (currentIndex) {
      case 3:
        addTodoItem();
        print(todoList.length);
        break;
      default:
        return;
    }
  }

  void addTodoItem() {
    todoList.insert(0,
      Card(
        child: ListTile(
          leading: const Icon(Icons.task_rounded),
          title: Text("ToDo Item ${todoList.length + 1}"),
          subtitle: const Text("this a todo item!"),
        ),
      ),
    );
  }
}

const List<Widget> navbarNavigations = <Widget>[
  NavigationDestination(
    selectedIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
    label: "Home",
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.library_books_sharp),
    icon: Icon(Icons.library_books_outlined),
    label: "Modules",
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.bar_chart),
    icon: Icon(Icons.bar_chart_outlined), 
    label: "Reports",
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.task),
    icon: Icon(Icons.task_outlined),
    label: "To Do",
  ),
];

