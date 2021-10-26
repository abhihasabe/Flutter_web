import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news_app/screens/sidebar/app_scaffold.dart';
import 'package:news_app/theme/colors.dart';
import 'package:news_app/theme/dimens.dart';
import 'package:news_app/theme/theme.dart';


class replayticket extends StatefulWidget {
  // final int leadId;

  // CreateEnquiryPresale({
  //   Key key,
  //   this.leadId,
  // }) : super(key: key);
  @override
  _replayticketState createState() => _replayticketState();
}

class _replayticketState extends State<replayticket>
    with TickerProviderStateMixin {


  Animation<double> ?topBarAnimation;
  final ScrollController scrollController = ScrollController();
  AnimationController ?animationController;
  bool isLoading = false;
  bool isInternalServerError = false;
  bool isSearch = false;
  bool isModelVisible = false;
  bool isVarientVisible = false;
  bool isSubSourceReadable = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mobFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  // leadDetailsResponse leadDetailsList;


  final TextEditingController statusController = new TextEditingController();
  final TextEditingController remarkController = new TextEditingController();



  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  List<String> statusList = [];




  bool? displayMobileLayout;


  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    statusList.clear();
    statusList.add('Resolved');
    statusList.add('Pending');



    super.initState();
  }


  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }


  @override
  Widget build(BuildContext context) {
    displayMobileLayout= MediaQuery.of(context).size.width < 600;
    // TODO: implement build
    return displayMobileLayout!?Container(
//        color: AppTheme.white,
      child: AppScaffold(
        key: _scaffoldKey,
        pageTitle: "Help Desk",
//          backgroundColor: AppTheme.background,
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/background.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Form(
            autovalidateMode: _autoValidate,
            key: _formKey,
            child: Column(
              children: <Widget>[
                getAppBarUI(),
                getMainViewUI(),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .padding
                      .bottom,
                )
              ],
            ),
          ),
        ),
      ),
    ):Container(
//        color: AppTheme.white,
      child: AppScaffold(
        key: _scaffoldKey,
        pageTitle: "Help Desk",
//          backgroundColor: AppTheme.background,
        body: Container(
          color: backgroundColor,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/background.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Form(
            autovalidateMode: _autoValidate,
            key: _formKey,
            child: Column(
              children: <Widget>[
                getAppBarUI(),
                getMainWebViewUI(),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .padding
                      .bottom,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget getAppBarUI() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery
                .of(context)
                .padding
                .top, left: 10, right: 0),
        child: Row(
          children: <Widget>[
            displayMobileLayout!?Container(
              alignment: Alignment.centerLeft,
              width: 50,
              height: 60,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ):Container(),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text(
                'Ticket Details  Ticket Followup',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MyThemes.FontTitle,
                ),
              ),
            ),
//            Container(
//              width: AppBar().preferredSize.height + 40,
//              height: AppBar().preferredSize.height,
//            )
          ],
        ),
      ),
    );
  }

  Widget getMainViewUI() {
    if (!isLoading) {
//      if (enquirySourceList != null && enquirySourceList.isNotEmpty) {
      return FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[

                      Column(
                        children: [
                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: fontTextSmall),
                              readOnly: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
//                isDense: false,.
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Status',
                              ),
                              controller: statusController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Please Select Status';
                                } else {
                                  return null;
                                }
                              },

                            ),
                          ),

                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: new TextFormField(
                              style: TextStyle(fontSize: fontTextSmall),
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              //Normal textInputField will be displayed
                              maxLines: null,
                              textInputAction: TextInputAction.next,
                              maxLength: 400,
                              enableInteractiveSelection: false,
                              buildCounter: (BuildContext context,
                                  {int ?currentLength,
                                    int ?maxLength,
                                    bool ?isFocused}) =>
                              null,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(
                                        "[a-zA-Z 0-9 ():,.!~@#+=&/\$%_*'-]"))
                              ],
                              controller: remarkController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Remarks cannot be empty';
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),

                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                labelText: 'Remarks*',
                                labelStyle: TextStyle(
                                  color: const Color(0xff8c8c8c),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, top: 10, bottom: 20),
                                child: SizedBox(
                                  width: 130.0,
                                  height: 40.0,
                                  child: RaisedButton(
                                    color: accentColor,
                                    textColor: buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          36.0),
                                    ),
                                    child: Text(
                                      "SUBMIT",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0),
                                    ),
                                    onPressed: () {
                                      validateLeadDetails();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ]),
                  ),
                ),
              ),
            );
          }
        },
      );
    }
    /*else {
        return Expanded(child: Center(child: Text('No Data Found')));
      }*/
//    }
    else {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }
  }

  Widget getMainWebViewUI() {
    if (!isLoading) {
//      if (enquirySourceList != null && enquirySourceList.isNotEmpty) {
      return FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top:20.0,left: 40,right: 40),
              child: Card(
                color: Colors.white,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                        style: TextStyle(fontSize: fontTextSmall),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                                          labelText: 'Status',
                                        ),
                                        controller: statusController,
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Please Select Status';
                                          } else {
                                            return null;
                                          }
                                        },
                                        /* onTap: () {
                                      SelectItemDialog.showModal<String>(
                                        context,
                                        label: "Select Gender",
                                        titleStyle: TextStyle(color: Colors.black),
                                        showSearchBox: false,
                                        selectedValue: genderLable,
                                        items: genderList,
                                        onChange: (String selected) {
                                          setState(() {
                                            genderLable = (selected.isEmpty
                                                ? 'Select Gender'
                                                : selected);
                                            genderController.text = genderLable;
                                          });
                                        },
                                      );
                                    },*/
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10,top: 0),
                                  child: new TextFormField(

                                    style: TextStyle(fontSize: fontTextSmall),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    readOnly: false,
                                    //Normal textInputField will be displayed
                                    maxLines: null,
                                    textInputAction: TextInputAction.next,
                                    maxLength: 800,
                                    enableInteractiveSelection: false,
                                    buildCounter: (BuildContext context,
                                        {int ?currentLength,
                                          int ?maxLength,
                                          bool ?isFocused}) =>
                                    null,

                                    controller: remarkController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0,),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black54, width: 1.0),
                                      ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      labelText: 'Remarks/Comment',
                                      labelStyle: TextStyle(height: 0.5,
                                          color: const Color(0xff8c8c8c)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 48.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 0.0, top: 4),
                                      child: Text(
                                        'Attachments',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0, top: 10, bottom: 20),
                                          child: SizedBox(
                                            width: 120.0,
                                            height: 35.0,
                                            child: RaisedButton(
                                              color: Colors.lightBlue,
                                              textColor: Colors.white,
                                              child: Text(
                                                "Upload",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.0),
                                              ),
                                              onPressed: () {
                                                validateLeadDetails();
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 0.0, top: 4),
                                          child: Icon(
                                            Icons.image,color: Colors.red,size: 21,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 4.0, top: 4),
                                          child: Icon(
                                            Icons.picture_as_pdf,color: Colors.red,size: 21,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 10, bottom: 20),
                                    child: SizedBox(
                                      width: 120.0,
                                      height: 35.0,
                                      child: RaisedButton(
                                        color: Colors.grey,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(
                                              8.0),
                                        ),
                                        child: Text(
                                          "Cancel",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0),
                                        ),
                                        onPressed: () {
                                          validateLeadDetails();
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 10, bottom: 20),
                                    child: SizedBox(
                                      width: 120.0,
                                      height: 35.0,
                                      child: RaisedButton(
                                        color: primaryColor,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(
                                              8.0),
                                        ),
                                        child: Text(
                                          "Submit",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0),
                                        ),
                                        onPressed: () {
                                          validateLeadDetails();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      );
    }
    /*else {
        return Expanded(child: Center(child: Text('No Data Found')));
      }*/
//    }
    else {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }
  }

  Future<void> validateLeadDetails() async {
    if (_formKey.currentState!.validate()) {
      // UIhelper.dismissKeyboard(context);
    } else {
      setState(() {
        {
          print('invalid');
          setState(() => _autoValidate = AutovalidateMode.always);
        }
      });
    }
  }


}

