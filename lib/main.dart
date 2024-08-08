import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _keyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          key: _keyScaffold,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(140.0),
            child: AppBar(
              title: Text('Flutter AppBarカスタマイズ'),
              backgroundColor: Colors.blueAccent,
              shadowColor: Colors.black,
              elevation: 8,
              centerTitle: true,
              titleTextStyle: TextStyle(fontSize: 18, color: Colors.white),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => _keyScaffold.currentState?.openDrawer(),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print('検索を押下');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // 通知アクション
                  },
                ),
              ],
              bottom: TabBar(
                indicatorColor: Colors.yellow,
                labelColor: Colors.grey,
                indicatorWeight: 16,
                tabs: [
                  Tab(icon: Icon(Icons.directions_car), text: "車"),
                  Tab(icon: Icon(Icons.directions_transit), text: "公共交通"),
                  Tab(icon: Icon(Icons.directions_bike), text: "自転車"),
                  Tab(icon: Icon(Icons.directions_bike), text: "徒歩"),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: Center(child: Text('Drawer')),
          ),
          body: TabBarView(
            children: [
              Image.network('https://toyota.jp/pages/contents/top/image/pr_area/crown/crown_pc_1.jpg'),
              Image.network('https://www.jrview-travel.com/content/sp/tohoku/article/images/ressya_7/img_01.jpg'),
              Image.network('https://ec.daisharin.co.jp/cdn/shop/products/ST-700C-6SCBHD-2YS728_1_2.png?v=1658712903&74hjft6nrqmz9dolyuce'),
              Text('徒歩'),
              Scaffold(
                appBar: AppBar(
                ),
                body: Center(child: Icon(Icons.directions_bike)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}