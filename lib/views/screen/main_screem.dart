import 'package:book_ui/views/pages/author_page.dart';
import 'package:book_ui/views/pages/book_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabNames = ["Livre", "Auteur"];
  late int tabIndex;
  void clickOnSetting(BuildContext context) {
    Navigator.of(context).pushNamed("setting");
  }

  clickOnSearchButton(BuildContext context) {
    Navigator.of(context).pushNamed("research", arguments: [tabIndex, tabNames]);
  }

  void _tabListner() {
    if (_tabController.indexIsChanging) {
      tabIndex = _tabController.index;
    }
  }

  @override
  void initState() {
    super.initState();
    tabIndex = 0;
    _tabController = TabController(length: tabNames.length, vsync: this);
    _tabController.addListener(_tabListner);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/img/profil.jpg"),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () => clickOnSearchButton(context),
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
              IconButton(
                  onPressed: () => clickOnSetting(context),
                  icon: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.onPrimary))
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: tabNames
                  .map((tabName) => Tab(
                        text: tabName,
                      ))
                  .toList(),
            ),
          ),
          body: const TabBarView(
            children: <Widget>[BookPage(), AuthorPage()],
          ),
        ));
  }
}
