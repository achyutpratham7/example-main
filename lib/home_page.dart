import 'package:example/widgets/custom_listtile.dart';
import 'package:example/widgets/my_address.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfff5f6fb),
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ResponsiveBuilder(builder: (context, SizingInformation) {
            return Center(
              child: Container(
                width: width * 0.9,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: width * 0.29,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                const Text(
                                  "Like",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: width * 0.29,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.payment,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                const Text(
                                  "Payments",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: width * 0.29,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.settings,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                const Text(
                                  "Setting",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: ListTile(
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade100),
                                  child: const Icon(Icons.star),
                                ),
                                title: const Text(
                                  "Your Ratings",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                trailing: Wrap(
                                  spacing: 15,
                                  children: [
                                    Container(
                                        height: 30,
                                        width: 30,
                                        color: Colors.grey.shade100,
                                        child: const Icon(Icons.abc)),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.37,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      color: Color(0xffeb5464),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Text(
                                  "Food Orders",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          CustomListtile(
                            width: width,
                            text: 'Your Orders',
                            iconData: Icons.shopify,
                            iconData1: Icons.arrow_forward_ios_outlined,
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 70,
                            color: Color(0xffefeff1),
                          ),
                          CustomListtile(
                            width: width,
                            text: 'Favourite Orders',
                            iconData: Icons.favorite_border_outlined,
                            iconData1: Icons.arrow_forward_ios_outlined,
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 70,
                            color: Color(0xffefeff1),
                          ),
                          InkWell(
                            child: CustomListtile(
                              width: width,
                              text: 'Adress Book',
                              iconData: Icons.add_home_work_rounded,
                              iconData1: Icons.arrow_forward_ios_outlined,
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyAddress(),
                              ));
                            },
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 70,
                            color: Color(0xffefeff1),
                          ),
                          CustomListtile(
                            width: width,
                            text: 'Online Ordering Help',
                            iconData: Icons.help_outline,
                            iconData1: Icons.arrow_forward_ios_outlined,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.37,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      color: Color(0xffeb5464),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                const Text(
                                  "Editions",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          CustomListtile(
                            width: width,
                            text: 'Editions WALLET',
                            iconData: Icons.wallet,
                            iconData1: Icons.arrow_forward_ios_outlined,
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 70,
                            color: Color(0xffefeff1),
                          ),
                          CustomListtile(
                            width: width,
                            text: 'Editions FAQs',
                            iconData: Icons.format_quote_sharp,
                            iconData1: Icons.arrow_forward_ios_outlined,
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 70,
                            color: Color(0xffefeff1),
                          ),
                          CustomListtile(
                            width: width,
                            text: 'hii',
                            iconData: Icons.favorite_border_outlined,
                            iconData1: Icons.arrow_forward_ios_outlined,
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 70,
                            color: Color(0xffefeff1),
                          ),
                          CustomListtile(
                            width: width,
                            text: 'hii',
                            iconData: Icons.favorite_border_outlined,
                            iconData1: Icons.arrow_forward_ios_outlined,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
