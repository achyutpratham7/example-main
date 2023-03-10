import 'package:example/widgets/add_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:share_plus/share_plus.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({super.key});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  String text = '';
  String subject = '';
  List<String> imageNames = [];
  List<String> imagePaths = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "My Addresses",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: ResponsiveBuilder(builder: (context, SizingInformation) {
          return Center(
              child: Container(
                  width: width * 0.9,
                  child: Column(children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddAddress(),
                        ));
                      },
                      child: Container(
                          height: 30,
                          width: width,
                          child: Row(
                            children: [
                              const Icon(Icons.add,
                                  size: 22, color: Color(0xffef4f5f)),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              const Text(
                                "Add address",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xffef4f5f)),
                              )
                            ],
                          )),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Container(
                        height: height * 0.2,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/home.svg",
                                  height: 30,
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                const Text(
                                  "6.1 km",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    "Home",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  const Text(
                                    "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _childPopup(),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      InkWell(
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: SvgPicture.asset(
                                            "assets/images/arrow_forward.svg",
                                            fit: BoxFit.scaleDown,
                                            color: const Color(0xffef4f5f),
                                          ),
                                        ),
                                        onTap: () {
                                          _onShare(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ])));
        }));
  }

  Widget _childPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 1,
            child: Text(
              "Edit",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text(
              "Delete",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          const PopupMenuItem(
            value: 3,
            child: Text(
              "Add Delivery instructions",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.grey)),
          child: const Icon(Icons.more_horiz, color: Color(0xffef4f5f)),
        ),
      );

  void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
      imageNames.removeAt(position);
    });
  }

  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    if (imagePaths.isNotEmpty) {
      final files = <XFile>[];
      for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }
      await Share.shareXFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }

  void _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    ShareResult shareResult;
    if (imagePaths.isNotEmpty) {
      final files = <XFile>[];
      for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }
      shareResult = await Share.shareXFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      shareResult = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  void _onShareXFileFromAssets(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final data = await rootBundle.load('assets/flutter_logo.png');
    final buffer = data.buffer;
    final shareResult = await Share.shareXFiles(
      [
        XFile.fromData(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          name: 'flutter_logo.png',
          mimeType: 'image/png',
        ),
      ],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );

    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  SnackBar getResultSnackBar(ShareResult result) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Share result: ${result.status}"),
          if (result.status == ShareResultStatus.success)
            Text("Shared to: ${result.raw}")
        ],
      ),
    );
  }
}
