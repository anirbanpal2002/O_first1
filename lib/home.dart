import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:officeproject_first/alert.dart';
import 'package:officeproject_first/autocompletesearch.dart';
import 'package:officeproject_first/carousel.dart';
import 'package:officeproject_first/chart.dart';
import 'package:officeproject_first/example1.dart';
import 'package:officeproject_first/fileuploader.dart';
import 'package:officeproject_first/imagecropper.dart';
import 'package:officeproject_first/main.dart';
import 'package:officeproject_first/quiz.dart';
import 'package:officeproject_first/rangeslider.dart';
import 'package:officeproject_first/searchselect.dart';
import 'package:officeproject_first/sensors.dart';
import 'package:officeproject_first/textEditor.dart';
import 'package:officeproject_first/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slectIndex = 0;
  int select = 0;
  // static const List _options = [Text('Hello'), Text('originate'), Text('soft')];
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  List<Widget> getOptions(BuildContext context) {
    return [
      ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.dangerous, size: 40),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 500,
                      child: const Center(
                        child: Text("This is a bottom sheet"),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Text("Press Me", style: TextStyle(color: Colors.white)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
        ),
      ),
      const Text('originate'),
      const Text('soft'),
    ];
  }

  void ontap(int i) {
    setState(() {
      slectIndex = i;
    });
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      imageFile = pickedFile!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Appbar", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.orange,
        ),

        // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //       DrawerHeader(
        //         decoration: BoxDecoration(color: Colors.purple),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             CircleAvatar(
        //               radius: 50,
        //               backgroundImage:
        //                   (imageFile == null)
        //                       ? const AssetImage("assets/Images/linux.jpg")
        //                       : FileImage(File(imageFile!.path))
        //                           as ImageProvider,
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(15.0),
        //               child: Text(
        //                 "User",
        //                 style: GoogleFonts.aBeeZee(
        //                   color: Colors.white,
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Searchable Select',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 17,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(
        //               FontAwesomeIcons.searchengin,
        //               size: 30,
        //               color: Colors.black,
        //             ),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => Example1()),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Toast',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(
        //               FontAwesomeIcons.wizardsOfTheCoast,
        //               size: 30,
        //               color: Colors.black,
        //             ),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => Toast()),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Image cropper',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(FontAwesomeIcons.image, color: Colors.black),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => Imagecropper()),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Text Editor',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(
        //               FontAwesomeIcons.textHeight,
        //               color: Colors.black,
        //             ),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => CustomTextEditor(),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'File Uploader',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(
        //               FontAwesomeIcons.fileArrowUp,
        //               color: Colors.black,
        //             ),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => FileUploader()),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Range Slider',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(
        //               FontAwesomeIcons.sliders,
        //               color: Colors.black,
        //             ),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => Rangeslider()),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Carousel',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(
        //               FontAwesomeIcons.slideshare,
        //               color: Colors.black,
        //             ),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => CarouselWithCustomIndicator(),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Alert',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(FontAwesomeIcons.alipay, color: Colors.black),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => DialogExample(),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           color: Colors.orange,
        //           child: ListTile(
        //             title: Text(
        //               'Chart',
        //               style: GoogleFonts.aBeeZee(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             leading: Icon(
        //               FontAwesomeIcons.chartBar,
        //               color: Colors.black,
        //             ),
        //             trailing: Icon(FontAwesomeIcons.arrowRight),
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => PieChartSample(),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        drawer: Drawer(
          child: Container(
            color: Colors.blue, // Make the whole drawer background blue
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            (imageFile == null)
                                ? const AssetImage("assets/Images/linux.jpg")
                                : FileImage(File(imageFile!.path))
                                    as ImageProvider,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "User",
                          style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.zero, // Removes default ListView padding
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'SearchAble Select',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Example1(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Toast',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.scrollTorah,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Toast()),
                            );
                          },
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Image Cropper',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.imagePortrait,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Imagecropper(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'File Uploader',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.fileArrowUp,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FileUploader(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Range Slider',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Rangeslider(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Alert',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.radiation,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DialogExample(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Carousel',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.chartBar,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PieChartSample(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Carousel',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.play,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => CarouselWithCustomIndicator(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Text Editor',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.textSlash,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomTextEditor(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'ContactListPage',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.list,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactListPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Autocomplete',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.autoprefixer,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Autocompletesearch(),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          title: Text(
                            'Sensor',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.autoprefixer,
                            color: Colors.black,
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MySensor(),
                              ),
                            );
                          },
                        ),
                      ),

                      // Remove empty ListTile() or any unnecessary spacing
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(child: getOptions(context).elementAt(slectIndex)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 45),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ice_skating, size: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.dashboard),
              label: '',
            ),
          ],
          currentIndex: slectIndex,
          selectedItemColor: Colors.white,

          onTap: ontap,
        ),
      ),
    );
  }
}
