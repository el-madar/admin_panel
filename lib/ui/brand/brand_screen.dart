import 'package:admin_panel/ui/widgets/message_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return brandCard(context, index);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).backgroundColor,
          onPressed: () {  },
          child: Icon(Icons.add,),
        ),
      ),
    );
  }
}

Widget brandCard(BuildContext context ,int index){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),

      child:  InkWell(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/832px-No-Image-Placeholder.svg.png",
                      height: 160.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "Brand "+index.toString(),
                          style: TextStyle(fontSize: 16),

                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Icon(Icons.phone),
                            Text(
                              tr('01234567890'),
                              style: TextStyle(fontSize: 12),


                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_sharp ),
                            Text(
                              tr('cairo, Egypt'),
                              style: TextStyle(fontSize: 12),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                           RaisedButton(
                              color: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(10.0),
                              ),
                              onPressed: () async {

                              },
                              textColor: Colors.grey.shade800,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                                child: new Text(
                                  tr('Edit'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.0),
                                ),
                              ),
                            ),

                           RaisedButton(
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(10.0),
                              ),
                              onPressed: () async {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  builder: (context) =>
                                      SingleChildScrollView(
                                          controller: ModalScrollController.of(context),
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(tr('are_yor_sure') +
                                                      tr('delete_request'),
                                                    style: TextStyle(fontSize: 16,
                                                        fontWeight: FontWeight.bold),),
                                                  SizedBox(height: 15,),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Container(
                                                        width:150,
                                                        child: RaisedButton(
                                                          color: Colors.redAccent,
                                                          onPressed: () {
                                                          },
                                                          child: Text(tr('yes')),
                                                        ),
                                                      ),
                                                      Container(width:150,
                                                        child: RaisedButton(onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                          child: Text(tr('cancel')),
                                                        ),
                                                      ),
                                                    ],)
                                                ],
                                              ),
                                            ),)

                                      ),
                                );
                              },
                              textColor: Colors.grey.shade800,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                                child: new Text(
                                  tr('Delete'),
                                  style: TextStyle(

                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {
        },
      ),
    ),
  );
}




