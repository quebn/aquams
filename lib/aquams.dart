import "package:flutter/material.dart";
import "structure/module.dart";

// TODO: Major
// [ ] Modules.
// [ ] Analytics.
// [ ] Home.
// [ ] Session.
// [ ] Profile.

// TODO: Minor
// [ ] Add new item to list view with popup to input the value.
// [ ] Add popup to view to edit the list.
// [ ] Make created list persist.

class Aquams extends StatefulWidget {
  const Aquams({super.key});

  @override
  State<Aquams> createState() => _AquamsState();
}

class _AquamsState extends State<Aquams> {
  int currentTab = 0;
  int currentModule = 0;

  final List<Module> modules = const <Module>[
    Module("Area"),
    Module("Accounting"),
    Module("Inventory"),
    Module("Purchase"),
    Module("Sale"),
    Module("HR"),
    Module("Fixed Asset"),
    Module("Project"),
  ];

  @override Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(context),
        title: const Text("AquaMs"),
        actions: getActions(context),
      ),
      drawer: Drawer(
        child: getDrawerContent(context),
      ),
      floatingActionButton: getFloatingActionButton(context),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentTab,
        destinations: getNavigations(),
      ),
      body: <Widget>[
        homePage(theme.textTheme.titleLarge),
        modulesPage(theme.textTheme.titleLarge),
        reportsPage(theme.textTheme.titleLarge),
        profilePage(theme.textTheme.titleLarge),
      ][currentTab],
    );
  }

  // NOTE: AquaMS file should only be responsible
  //  of the events of the ff. app functions:
  //    - Handle Floating Bar
  //    - Switch Tab
  //    - Handle Drawer
  //    - Search
  //  and store the ff. data:
  //    - Current State:
  //    - Default View Data

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

  Widget profilePage(TextStyle? textStyle) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            "Profile",
            style: textStyle,
          ),
        ),
      ),
    );
  }

  final List<Widget> list = <Widget>[
    const Card(
      child: ListTile(
        title: Text("Module 1"),
        subtitle: Text("This is a module"),
      ),
    ),
    const Card(
      child: ListTile(
        title: Text("Module 2"),
        subtitle: Text("This is a another module"),
      ),
    ),
    
  ];
  Widget modulesPage(TextStyle? textStyle) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            modules[currentModule].name,
            style: textStyle,
          ),
        ),
      ),
    );
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
  
  List<Widget> getActions(BuildContext context){
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search_outlined),
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Clicked Search Button")));
        },
      ),
      IconButton(
        icon: const Icon(Icons.notifications_sharp),
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Clicked Notifications Button")));
        },
      ),
    ];
  }

  Widget getLeading(BuildContext context){
    return Builder(
      builder: (context){
        return getLeadingButton(context);
      },
    );
  }

  Widget getLeadingButton(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.density_medium_sharp),
      onPressed: (){
        Scaffold.of(context).openDrawer();
      },
    );
  }  

  List<Widget> getNavigations(){
    return const <Widget>[
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
        selectedIcon: Icon(Icons.person_sharp),
        icon: Icon(Icons.person_outlined),
        label: "Profile",
      ),
    ];
  }

  Widget? getDrawerContent(BuildContext context){
    if (currentTab != 1){
      return null;
    }
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: modules.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
                currentModule = index;
            });
            Scaffold.of(context).closeDrawer();
          },
          child: modules[index].getView(currentModule == index),
        );
      },
    );
  }
  
  Widget? getFloatingActionButton(BuildContext context){
    switch (currentTab){
      default:
        return null;
    }
    //return FloatingActionButton(
    //  elevation: 4,
    //  backgroundColor: Colors.lightBlue,
    //  shape: const CircleBorder(),
    //  onPressed: () {
    //    setState(() {
    //      print("Pressed on PageIndex: $currentTab!");
    //    });
    //  },
    //  child: const Icon(Icons.add_sharp),
    //);
  }
}
