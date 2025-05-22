import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:two_screen_flutter_app/controller/controller.dart';
import 'package:two_screen_flutter_app/models/products_model.dart';
import 'package:two_screen_flutter_app/widgets/details_screen_widgets/custom_container.dart';

class DetailsScreen extends StatefulWidget {
  final ProductsModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  app bar-like row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  Expanded(
                    child: Text(
                      widget.product.name,
                      style: GoogleFonts.podkova(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Deep link Button
                  IconButton(
                    onPressed: () {
                      controller.shareProductLink(widget.product.id);
                    },
                    icon: Icon(Icons.share),
                  ),
                ],
              ),
              //  SizedBox with horizontal ListView
              ImageSlider(widget: widget),

              SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Product Info
                    CustomContainer(
                      child: Column(
                        children: [
                          Text(
                            widget.product.name,
                            style: GoogleFonts.podkova(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Ratings: ${widget.product.ratings} ⭐️',
                            style: GoogleFonts.podkova(fontSize: 18),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    /// Variants
                    CustomContainer(
                      child: Column(
                        children: [
                          Text(
                            'Variants:',
                            style: GoogleFonts.podkova(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...widget.product.variants.map(
                            (v) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Text(
                                '${v.name} — Price: \$${v.price}, MRP: \$${v.mrp}',
                                style: GoogleFonts.podkova(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    CustomContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity:',
                            style: GoogleFonts.podkova(fontSize: 18),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.decreaseQuantity();
                                },
                                icon: Icon(Icons.remove),
                              ),

                              Obx(
                                () => Text(
                                  '${controller.quantity.value}',
                                  style: GoogleFonts.podkova(fontSize: 16),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.increaseQuantity(
                                    widget.product.variants[0].quantity ?? 99,
                                  );
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),

                          Text(
                            '${widget.product.variants[0].price} available',
                            style: GoogleFonts.podkova(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, required this.widget});

  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.image.length,
        itemBuilder: (context, idx) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height * 0.7, // increase from 0.4
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 20),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.product.image[idx],
                        width:
                            MediaQuery.sizeOf(context).width *
                            0.95, // aur zyada width
                        height:
                            MediaQuery.sizeOf(context).height *
                            0.42, // aur zyada height
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
