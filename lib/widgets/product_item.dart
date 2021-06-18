import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget{


  @override
  Widget build(BuildContext buildContext) {
    final product = Provider.of<Product>(buildContext);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:GridTile(
        child:GestureDetector(
            onTap: (){
              Navigator.of(buildContext).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
            },
            child: Image.network(product.imageUrl,fit: BoxFit.cover),
        ),
        footer:GridTileBar(
          backgroundColor:Colors.black87,
          leading: IconButton(icon:Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
             product.toggleFavorite();
          },
          color: Theme.of(buildContext).accentColor),
          title: Text(product.title,textAlign:TextAlign.center),
          trailing:IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {},
         color: Theme.of(buildContext).accentColor),
        ),
      )
    );
  }

}