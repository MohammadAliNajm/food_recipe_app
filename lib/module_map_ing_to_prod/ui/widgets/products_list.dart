import 'package:flutter/material.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/response/map_ingredients_response.dart';

import '../../../module_products/ui/widgets/product_card.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key, required this.products}) : super(key: key);
  final List<Product> products;
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        productTitle: widget.products[index].title,
                        onTap: () {}
                        );
                  },
                );;
  }
}
