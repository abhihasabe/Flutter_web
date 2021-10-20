import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news_app/theme/colors.dart';
import 'package:news_app/theme/dimens.dart';
import 'package:news_app/theme/theme.dart';


class EnquiryDetailWeb extends StatefulWidget {
  // final int leadId;

  // EnquiryDetailWeb({
  //   Key key,
  //   this.leadId,
  // }) : super(key: key);
  @override
  _EnquiryDetailWebState createState() => _EnquiryDetailWebState();
}

class _EnquiryDetailWebState extends State<EnquiryDetailWeb>
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

  int ?enqSrcId,
      enqSubSrcId,
      modelId,
      varId,
      segmentId,
      brandId,
      enqTypeId,
      locId,
      zipId,
      expectedDateId,
      maritalId,
      occupationId;


  String genderLable = "Gender";
  String provienceLable = "Provience";
  String segmentLable = "Segment";
  String modelLable = "Model";
  String variantLable = "Variant";
  String enquirySourceLable = "Enquiry Source";
  String enquirySubSourceLable = "Enquiry Sub Source";
  String cityLable = "City";
  String expPurchaseDateLable = "Expected Purchase Date";

  String brandLable = "Brand";
  String enqTypeLable = "Enquiry Type";
  String maritalTypeLable = "Marital Status";
  String OccupatuionTypeLable = "Occupation";
  String exchangeModelLable = "Model";
  String exchangeVarientLable = "Varient";
  String exchangeYearLable = "Year";

  // leadDetailsResponse leadDetailsList;

  final TextEditingController numberController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();
  final TextEditingController firstnameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController zipCodeController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController remarkController = new TextEditingController();

  final TextEditingController genderController = new TextEditingController();
  final TextEditingController segmentController = new TextEditingController();

  final TextEditingController brandController = new TextEditingController();
  final TextEditingController enqTypeController = new TextEditingController();
  final TextEditingController exchangeModelController = new TextEditingController();
  final TextEditingController exchangeVarientController = new TextEditingController();
  final TextEditingController exchangeYearController = new TextEditingController();

  final TextEditingController provienceController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController placeController = new TextEditingController();
  final TextEditingController expPurDateController =
  new TextEditingController();
  final TextEditingController nextVisitDateController = new TextEditingController();
  final TextEditingController testDriveDateController = new TextEditingController();
  final TextEditingController modelController = new TextEditingController();
  final TextEditingController productController = new TextEditingController();
  final TextEditingController variantController = new TextEditingController();
  final TextEditingController enquirySourceController =
  new TextEditingController();
  final TextEditingController enquirySubSourceController = new TextEditingController();
  final TextEditingController statusController = new TextEditingController();

  final TextEditingController occupationController = new TextEditingController();
  final TextEditingController MaritalStatusController = new TextEditingController();
  final TextEditingController AnnivarsaryDateController = new TextEditingController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  List<String> genderList = [];
  List<String> provienceList = [];


  List<String> cityList = [];
  List<String> zipcodeList = [];


  List<String> modList = [];


  List<String> segList = [];

  bool isEnqSubVisible = false;
  bool isProductVisible = true;
  bool isZipInvalid = false;
  bool isLayoutVisible = false;
  bool isExchangeLayoutVisible = false;
  bool isNewLayoutVisible = false;
  bool isvalidButton = true;
  bool isAnnivarsaryDate = false;

  bool isNextVisitDateVisible = false;
  DateTime ExpPurDate = DateTime.now();
  DateTime NextVisitDate =
  DateTime(DateTime
      .now()
      .year, DateTime
      .now()
      .month, DateTime
      .now()
      .day);

  bool isCheckValue = false;
  bool isTestDateVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    genderList.clear();
    genderList.add('Male');
    genderList.add('Female');

    cityList.clear();

    firstnameController.text='John.Deo';
    mobileController.text='77866866868';
    emailController.text='paxbat@gmail.com';
    genderController.text='Male';
    numberController.text='DTHJ345788';
    dateController.text='7 sept 2021';
    modelController.text='peugeot';
    productController.text='New peugeot';
    variantController.text='Peugeot 125 cc';
    super.initState();
  }


  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//        color: AppTheme.white,
      child: Scaffold(
        key: _scaffoldKey,
//          backgroundColor: AppTheme.background,
        body: SafeArea(
          child: Container(
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
      ),
    );
  }


  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
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
            Container(
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
            ),
            Text(
              'Enquiry Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: MyThemes.FontTitle,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 18),
                                  child: new TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    textCapitalization: TextCapitalization.words,
                                    maxLines: 1,
                                    maxLength: 20,
                                    buildCounter: (BuildContext context,
                                        {int ?currentLength,
                                          int ?maxLength,
                                          bool ?isFocused}) =>
                                    null,
                                    controller: firstnameController,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey, width: 1.0,),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.black54, width: 1.0),
                                      // ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      labelStyle: TextStyle(height: 0.5,
                                        color: const Color(0xff8c8c8c),
                                      ),
                                      labelText: 'Name',contentPadding: const EdgeInsets.all(6.0),

                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 18),
                                  child: new TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    textCapitalization: TextCapitalization.words,
                                    maxLines: 1,
                                    maxLength: 20,
                                    buildCounter: (BuildContext context,
                                        {int ?currentLength,
                                          int ?maxLength,
                                          bool ?isFocused}) =>
                                    null,
                                    controller: firstnameController,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey, width: 1.0,),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.black54, width: 1.0),
                                      // ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      labelStyle: TextStyle(height: 0.5,
                                        color: const Color(0xff8c8c8c),
                                      ),
                                      labelText: 'Name',contentPadding: const EdgeInsets.all(6.0),

                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10,top:18),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    maxLength: 10,
                                    readOnly: true,
                                    enabled: false,
                                    buildCounter: (BuildContext context,
                                        {int ?currentLength,
                                          int ?maxLength,
                                          bool ?isFocused}) =>
                                    null,
                                    controller: mobileController,
                                    decoration: new InputDecoration(
                                      // border: OutlineInputBorder(),
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.grey, width: 1.0),
                                      // ),
                                      //
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.black54, width: 1.0),
                                      // ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      labelText: 'Mobile Number',alignLabelWithHint: true,

                                      labelStyle: TextStyle(height: 0.5,
                                        color: const Color(0xff8c8c8c),
                                      ),
                                    ),
                                    onChanged: (value)
                                    {
                                      setState(() {
                                        isLayoutVisible=false;
                                        isvalidButton=true;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10,top:18),
                                  child: new TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    maxLines: 1,
                                    maxLength: 30,
                                    readOnly: true,
                                    enabled: false,
                                    enableInteractiveSelection: false,
                                    controller: emailController,
                                    buildCounter: (BuildContext context,
                                        {int ?currentLength,
                                          int ?maxLength,
                                          bool ?isFocused}) =>
                                    null,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey, width: 1.0,),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.black54, width: 1.0),
                                      // ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      labelText: 'Email ID',
                                      labelStyle: TextStyle(height: 0.5,
                                        color: const Color(0xff8c8c8c),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10,top:18),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: Colors.grey, width: 1.0,),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.black54, width: 1.0),
//                                       ),
                                      labelText: 'Gender',
                                      labelStyle: TextStyle(height: 0.5,
                                        color: const Color(0xff8c8c8c),
                                      ),
                                    ),
                                    controller: genderController,
                                    validator: (String ?value) {
                                      if (value!.isEmpty) {
                                        return 'Please Select Gender';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 18),
                                  child: new TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    textCapitalization: TextCapitalization.words,
                                    maxLines: 1,
                                    maxLength: 20,
                                    buildCounter: (BuildContext context,
                                        {int ?currentLength,
                                          int ?maxLength,
                                          bool ?isFocused}) =>
                                    null,
                                    controller: numberController,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey, width: 1.0,),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.black54, width: 1.0),
                                      // ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      labelStyle: TextStyle(height: 0.5,
                                        color: const Color(0xff8c8c8c),
                                      ),
                                      labelText: 'No',contentPadding: const EdgeInsets.all(6.0),

                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 18),
                                  child: new TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    textCapitalization: TextCapitalization.words,
                                    maxLines: 1,
                                    maxLength: 20,
                                    buildCounter: (BuildContext context,
                                        {int ?currentLength,
                                          int ?maxLength,
                                          bool ?isFocused}) =>
                                    null,
                                    controller: dateController,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey, width: 1.0,),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.black54, width: 1.0),
                                      // ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(0.0),
                                      ),
                                      labelStyle: TextStyle(height: 0.5,
                                        color: const Color(0xff8c8c8c),
                                      ),
                                      labelText: 'Date',contentPadding: const EdgeInsets.all(6.0),

                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      labelText: 'Product',
                                    ),
                                    controller: productController,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      labelText: 'Model',
                                    ),
                                    controller: modelController,
                                    validator: (String ?value) {
                                      if (value!.isEmpty) {
                                        return 'Please Select Model';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      labelText: 'Variant',
                                    ),
                                    controller: variantController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10,top:18),
                            child: new TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                              maxLines: null,
                              readOnly: true,
                              enabled: false,
                              textCapitalization: TextCapitalization.words,

//                      controller: _textFieldController1comment,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(
                                        "[a-zA-Z 0-9 ():,.!~@#+=&/\$%_'-]"))
                              ],
                              controller: addressController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Address cannot be empty';
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
                                labelText: 'Address',
                                labelStyle: TextStyle(height: 0.5,
                                  color: const Color(0xff8c8c8c),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10,top:18),
                            child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                labelText: 'City',
                              ),
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Place cannot be empty';
                                }
                              },
                              controller: placeController,
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                                readOnly: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0,),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black54, width: 1.0),
                                  ),
                                  labelText: 'Zipcode',
                                ),
                                controller: cityController,
                                validator: (String ?value) {
                                  if (value!.isEmpty) {
                                    return 'zipcode cannot be empty';
                                  }
                                }),
                          ),




                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
//                isDense: false,
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Enquiry Source',
                              ),
                              controller: enquirySourceController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Please Select Enquiry Source';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {

                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Enquiry Sub-Source',
                              ),
                              controller: enquirySubSourceController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Please Select Enquiry Sub-Source';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {

                              },
                            ),
                          ),

                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
//                                            enabled: false,
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                /*suffixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.date_range,
                                  color: Colors.black54,
                                ),
                              ),*/
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: "Expected Purchase*",
                                labelStyle: TextStyle(),
                              ),
                              controller: expPurDateController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Select date';
                                }
                                return null;
                              },
                              onTap: () async {
                                setState(() {
                                  isNextVisitDateVisible=true;
                                });
                              },
                            ),
                          ),
                          Visibility(
                            visible: isNextVisitDateVisible,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10,),
                              child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
//                                            enabled: false,
                                  readOnly: true,
                                  enabled: false,
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
                                      child: Icon(
                                        Icons.date_range,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    labelText: "Next Visit date*",
                                    labelStyle: TextStyle(),
                                  ),
                                  controller: nextVisitDateController,
                                  validator: (String ?value) {
                                    if (value!.isEmpty) {
                                      return 'Select date';
                                    }
                                    return null;
                                  },
                                  onTap: () async {
                                  }),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
                                    style: TextStyle(fontSize: fontTextSmall),
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Status',
                              ),
                              controller: statusController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Please Select status';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {

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
                                        "[a-zA-Z 0-9 ():,.!~@#+=&/\$%_'-]"))
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
                                labelText: 'Remarks',
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
                                  width: 144.0,
                                  height: 46.0,
                                  child: RaisedButton(
                                    color: accentColor,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          36.0),
                                    ),
                                    child: Text(
                                      "Replay",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0),
                                    ),
                                    onPressed: () {
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