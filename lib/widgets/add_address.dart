import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Select location",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ResponsiveBuilder(builder: (context, SizingInformation) {
          return Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: height,
                color: Colors.amber,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    cursorColor: Color(0xffef4f5f),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        hintText: 'Search for area,street name...',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            "assets/images/search-dot.svg",
                            color: const Color(0xffef4f5f),
                          ),
                          width: 18,
                        )),
                  ),
                ),
              ),
              _UseCurrentLocation(),
              dragsheet(),
            ],
          );
        }));
  }

  Widget dragsheet() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      maxChildSize: 0.2,
      minChildSize: 0.1,
      builder: (context, scrollController) => ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
            color: Colors.white,
            child: ListView(
              controller: scrollController,
              children: [
                SizedBox(
                  height: height * 0.005,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Color(0xffef4f5f),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Thaltej",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Ahemdabad",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Center(
                      child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fixedSize: Size(width * 0.9, 50),
                              backgroundColor: const Color(0xffef4f5f),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            bottomsheet(context);
                          },
                          child: const Text(
                            "Enter complete adress",
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget _UseCurrentLocation() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 100,
          width: width * 0.7,
          color: Colors.blue,
        ),
      ),
    );
  }

  Future bottomsheet(context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      context: context,
      // color is applied to main screen when modal bottom screen is displayed

      backgroundColor: Colors.white,
      //elevates modal bottom screen
      elevation: 10,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        // UDE : SizedBox instead of Container for whitespaces
        return SizedBox(
          height: height * 0.44,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Enter complete address",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Complete Address"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Floor(Optional)"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Nearby Landmark(optional)"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: Size(width * 0.9, 50),
                            backgroundColor: const Color(0xffef4f5f),
                            foregroundColor: Colors.white),
                        onPressed: () {
                          bottomsheet(context);
                        },
                        child: const Text(
                          "Enter complete adress",
                          style: TextStyle(fontSize: 18),
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
