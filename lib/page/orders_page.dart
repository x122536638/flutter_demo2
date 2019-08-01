
import 'package:flutter/material.dart';
import 'package:flutter_app_client/customView/orders_page_widget/order_item.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  Widget buildItem(BuildContext context, int index) {
    return  OrderItem();


      Container(
      height: 100,
      color: Colors.red[index *100],
    );
  }
    @override
  Widget build(BuildContext context) {
    return Container(
      
      
      child:


      ListView.builder(itemBuilder: buildItem,itemCount: 5,),
    );
  }
}
