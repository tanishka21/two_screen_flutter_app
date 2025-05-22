import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:two_screen_flutter_app/models/products_model.dart';
import 'package:two_screen_flutter_app/screens/detail_screen/details_screen.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Products Screen',
          style: GoogleFonts.podkova(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text('${data.error}'));
            } else if (data.hasData) {
              var items = data.data!.toList();
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300,
                ),
                itemBuilder:
                    (context, index) => Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                            // offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => DetailsScreen(product: items[index]));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Products Images
                              Image.network(
                                (items[index].image.first),
                                width: 300,
                                height: 180,
                                fit: BoxFit.fill,
                              ),

                              Spacer(),
                              Text(
                                items[index].name,
                                style: GoogleFonts.podkova(
                                  color: Color.fromARGB(255, 123, 120, 120),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Ratings: ${items[index].ratings} ⭐️',
                                style: GoogleFonts.podkova(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }
          },
        ),
      ),
    );
  }

  Future<Iterable<ProductsModel>> readJsonData() async {
    final jsonData = await rootBundle.loadString("jsonfile/products.json");
    final list = json.decode(jsonData) as List<dynamic>;
    print(list);
    return list.map((e) => ProductsModel.fromJson(e));
  }
}
