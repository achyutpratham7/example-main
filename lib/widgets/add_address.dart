import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  PanelController panelControl = PanelController();
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
        body: SlidingUpPanel(
          controller: panelControl,
          minHeight: 120,
          maxHeight: 350,
          backdropColor: Colors.black12,
          isDraggable: false,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          onPanelOpened: () {
            setState(() {});
          },
          onPanelClosed: () {
            setState(() {});
          },
          panelBuilder: (sc) {
            return panelControl.isPanelClosed
                ? dragsheet()
                : bottomsheet(context);
          },
          body: Stack(
            children: [
              Container(
                height: height,
                color: Colors.blueAccent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
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
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(10),
                                width: 18,
                                child: SvgPicture.asset(
                                  "assets/images/search-dot.svg",
                                  color: const Color(0xffef4f5f),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 210),
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              width: 1.0, color: Color(0xffef4f5f)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      icon: Icon(
                        Icons.my_location,
                        color: Color(0xffef4f5f),
                      ),
                      label: Text(
                        "Use current location",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffef4f5f)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget dragsheet() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                // bottomsheet(context);
                panelControl.open();
              },
              child: const Text(
                "Enter complete address",
                style: TextStyle(fontSize: 18),
              )),
        )
      ],
    );
  }

  Widget bottomsheet(context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Text(
                "Enter complete address",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              label: Text("Complete Address"),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
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
              label: const Text("Floor(Optional)"),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Colors.black), //<-- SEE HERE
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
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
              label: const Text("Nearby Landmark(optional)"),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0.8, color: Colors.black54), //<-- SEE HERE
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
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
                panelControl.close();
              },
              child: const Text(
                "Save Address",
                style: TextStyle(fontSize: 18),
              )),
        )
      ],
    );
  }
}
