import 'package:flutter/material.dart';

// TODO: List UI
// Create a list view and when selecting any of the list,
// another date of selected list should show.

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Navigation(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

// TODO:
// [*] Create Navigation.
// [ ] Clean and create simple container for a list component.
// [ ] Add new item to list view with popup to define the value.
// [ ] Make created list persist.
// [ ] Add card popup to view to edit the list.

class _HomePageState extends State<HomePage> {

  List<String> todo = <String>[];
  final List<String> entries = <String>["A", "B", "C"];
  final List<int> colorCodes = <int>[600, 300, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        //title: const Text("Home"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(2),
        itemCount: todo.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[600],
            child: Center(child: Text("Entry ${todo[index]}"))
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  List<Widget> navbarNavigations = <Widget>[
    const NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: "Home",
    ),
    const NavigationDestination(
      icon: Badge(child: Icon(Icons.notifications_sharp)),
      label: "Notifications",
    ),
    const NavigationDestination(
      icon: Badge(
        label: Text("2"),
        child: Icon(Icons.messenger_sharp),
      ),
      label: "Messages",
    ),
  ];

  @override
  Widget build(BuildContext context){
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: navbarNavigations,
      ),
      body: <Widget>[
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                "Home Page",
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text("Notifications 1"),
                  subtitle: Text("This is a notification"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text("Notifications 2"),
                  subtitle: Text("This is a another notification"),
                ),
              ),
            ],
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                "Home Page",
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
