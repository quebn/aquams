import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "core/module.dart";
import "accounting/module_view.dart";

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

// NOTE: AquaMS file should only be responsible
//  of the events of the ff. app functions:
//    - Handle Floating Bar
//    - Switch Tab
//    - Handle Drawer
//    - Search
//  and store the ff. data:
//    - Current State:
//    - Default View Data

class Aquams extends StatefulWidget {
  const Aquams({super.key});

  @override
  State<Aquams> createState() => _AquamsState();
}

class _AquamsState extends State<Aquams> {
  int currentTab = 0;
  int currentModule = 0;
  final PageController _pageController = PageController();

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

  bool get isNotMobile{
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform){
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: getLeading(context),
        title: getTitle(context),
        actions: getActions(context),
      ),
      drawer: Drawer(
        //elevation: 0,
        surfaceTintColor: Colors.white,
        width: 250.0,
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
        modulesPage(context),
        reportsPage(theme.textTheme.titleLarge),
        profilePage(theme.textTheme.titleLarge),
      ][currentTab],
    );
  }

  Widget getTitle(BuildContext context){
    if (currentTab == 1){
      return Text(modules[currentModule].name);
    }
    return const Text("Aquams");   
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

  Widget modulesPage(BuildContext context) {
    //Handles Modules View
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageSwap, 
      children: <Widget>[
        tempDisplay(context, "Area"),
        accountingModule(context), 
        tempDisplay(context, "Inventory"),
        tempDisplay(context, "Purchase"),
        tempDisplay(context, "Sale"),
        tempDisplay(context, "HR"),
        tempDisplay(context, "Fixed Asset"),
        tempDisplay(context, "Project"),
      ],
    );
  }

  void _onPageSwap(int currentPage){
    if (isNotMobile){
      return;
    }
    setState(() {
      currentModule = currentPage;
    });
  }

  void _updatePageIndex(BuildContext context){
  }

  Widget tempDisplay(BuildContext context, String text){
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Text(
        text,
        style: theme.textTheme.titleLarge,
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
    var statusBar = MediaQuery.of(context).viewPadding.top;
    return Container(
      margin: EdgeInsets.only(top: statusBar),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: modules.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                  currentModule = index;
                  _pageController.jumpToPage(currentModule);
              });
              Scaffold.of(context).closeDrawer();
            },
            child: modules[index].getView(currentModule == index),
          );
        },
      )
    );
  }
  
  Widget? getFloatingActionButton(BuildContext context){
    switch (currentTab){
      default:
        return null;
    }
  }
}
