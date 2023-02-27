import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key, required this.imageUrl, required this.productTitle, required this.onTap})
      : super(key: key);
  final String imageUrl;
  final String productTitle;
  final VoidCallback onTap;
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap:widget.onTap,
        leading: CachedNetworkImage(
          height: 75,
          width: 50,
          imageUrl: widget.imageUrl,
        ),
        title: Text(widget.productTitle),
        trailing: const Icon(Icons.more_horiz),
      ),
    );
  }
}
