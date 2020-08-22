import 'package:flutter/material.dart';
import 'package:noon_app/moules/product_data.dart';
import 'package:noon_app/moules/search_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  //   start();
  }

  void start() async {
    // SearchData data = await SearchData.getData(
    //     'https://www.noon.com/_svc/catalog/api/u/c/fashion');
    // print(data);

    ProductData data1 = await ProductData.getData(
        'https://www.noon.com/_svc/catalog/api/u/double-ended-eyewear-mount-cliwp/N29885950A/p');
    print(data1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(),
      body: FutureBuilder(
        future: SearchData.getData(
            'https://www.noon.com/_svc/catalog/api/u/c/electronics-and-mobiles'),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );

          print(snapshot);
          SearchData data = snapshot.data;
          return Container(
            
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: data.hits.length,
              itemBuilder: (BuildContext context, int index) {
                Hits hit = data.hits[index];
                return ListTile(

                  title: Text(hit?.brand ?? ""),
                  trailing: Text("${hit?.price??0.0} SAR"),
                  subtitle: Image.network('https://k.nooncdn.com/t_desktop-pdp-v1/${hit.imageKey}.jpg'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
