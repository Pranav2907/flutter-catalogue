// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: use_key_in_widget_constructors
class CartPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:"Cart".text.make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],),
      
    );
  }
}

class _CartTotal extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
     final _cart = CartModel();
    return SizedBox(
      height: 200,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        // ignore: deprecated_member_use
        "\$${_cart.totalPrice}".text.xl5.color(context.theme.accentColor).make(),
        30.widthBox,
        ElevatedButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:"Buying not supported yet .".text.make() ));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
          ),
          
          child: "Buy".text.white.make(),
        ).w32(context)
      ],)
    );
  }
}

class _CartList extends StatefulWidget {

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return _cart.items.isEmpty? "Nothing to show ".text.xl3.makeCentered(): ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon: Icon(Icons.remove_circle_outline),
           onPressed: () {
             _cart.remove(_cart.items[index]);
             setState(() {
               
             });
           },
        ),
        title:_cart.items[index].name.text.make() ,
      ),
    );
  }
}