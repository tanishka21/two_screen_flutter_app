import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        "https://urbanjungle.shop/cdn/shop/products/45_Degree_Angle_1_3841f29f-f30f-43db-b366-3930bc3b1071.jpg?v=1744619981&width=1200";

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          // productController.setSelectedProduct(product);
          // Get.toNamed('/product_detail/${product.id}');
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                ),
              ),
              const SizedBox(width: 16),
              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' product.name',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          // index < product.ratings
                          //     ? Icons.star
                          //     : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        );
                      }),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Starting",
                      // 'Starting from \$${product.variants.isNotEmpty ? product.variants.first.price.toStringAsFixed(2) : 'N/A'}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // return Container(
      //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //   height: MediaQuery.sizeOf(context).height * 0.75,
      //   width: MediaQuery.sizeOf(context).width * 0.5,
      //   decoration: BoxDecoration(
      //     color: Colors.grey,
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: [
      //         ClipRRect(
      //           borderRadius: BorderRadius.circular(10),
      //           child: Image.network(
      //             fit: BoxFit.fill,
      //             height: MediaQuery.sizeOf(context).height * 0.24,
      //             width: MediaQuery.sizeOf(context).width * 0.45,
      //             "https://urbanjungle.shop/cdn/shop/products/45_Degree_Angle_1_3841f29f-f30f-43db-b366-3930bc3b1071.jpg?v=1744619981&width=1200",
      //           ),
      //         ),
      //         SizedBox(height: 10),
      //         Text(
      //           "Laptop Backpack",
      //           style: GoogleFonts.podkova(
      //             fontSize: 18,
      //             fontWeight: FontWeight.w600,
      //           ),
      //         ),
      //         SizedBox(height: 5),
      //         StarRating(
      //           rating: 3,
      //           starCount: 5,
      //           size: 25,
      //           borderColor: const Color.fromARGB(255, 71, 71, 71),
      //           color: const Color.fromARGB(255, 240, 170, 64),
      //         ),
      //       ],
      //     ),
      //   ),
      // );
    );
  }
}
