
import 'package:flutter/material.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_items.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../constant.dart';
import 'Components/items_inside_single_order.dart';

class OrderDetails extends StatelessWidget {
  static String id = "Order_Details";
   OrderDetails({Key? key}) : super(key: key);

  var productDataList;

  late List<OrderItems>? orderItems;

  @override
  Widget build(BuildContext context) {
    productDataList=ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    orderItems=productDataList["productDataList"];
    return Scaffold(
      appBar: const BuildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item in this order",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(25.0),
                        color: kDefaultHeaderFontColor)),
                const Divider(
                  color: kDefaultBorderColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),
              
              
              //List of the Product Inside Single Orders
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: orderItems!.length,
                  itemBuilder: (context, index) {
                  return ItemsInsideSingleOrder(orderItems: orderItems![index],);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
