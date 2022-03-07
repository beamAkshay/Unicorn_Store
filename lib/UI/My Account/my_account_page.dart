import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/UI/My%20Account/account_information_page.dart';
import 'package:unicorn_store/UI/My%20Account/Address%20Manager/address_manager_page.dart';
import 'package:unicorn_store/UI/My%20Account/Order%20History/product_history.dart';
import 'package:unicorn_store/UI/My%20Account/wishlist_page.dart';

import '../size_config.dart';
import '../constant.dart';
import 'Components/my_account_list_tile.dart';

class MyAccountPage extends StatefulWidget {
  static String id = "MyAccountPage_Screen";

  const MyAccountPage({Key? key}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  late AuthenticationBloc authenticationBloc;

  //Creating Instance for User Data
  LoginData? loginData;

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          loginData=state.loginData;
          return Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Accounts",
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
                ListView(
                  shrinkWrap: true,
                  children: [
                    //Order History
                    MyAccountListTile(
                      header: "Orders",
                      leadingIcon: Icons.inventory_2,
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.pushNamed(context, ProductHistory.id);
                      },
                    ),

                    //Account Information
                    MyAccountListTile(
                      header: "Account Information",
                      leadingIcon: Icons.account_circle_rounded,
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.pushNamed(
                            context, AccountInformationPage.id,
                            arguments: {"loginData":loginData});
                      },
                    ),

                    //Address Manager
                    MyAccountListTile(
                      header: "Address Manager",
                      leadingIcon: Icons.location_on_rounded,
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.pushNamed(context, AddressManagerPage.id,arguments: {"loginData":loginData});
                      },
                    ),

                    //Wishlist
                    MyAccountListTile(
                      header: "Wishlist",
                      leadingIcon: Icons.favorite,
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.pushNamed(context, WishlistPage.id,arguments: {"loginData":loginData});
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
