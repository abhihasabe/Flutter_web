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


class CreateEnquiryPresale extends StatefulWidget {
  // final int leadId;

  // CreateEnquiryPresale({
  //   Key key,
  //   this.leadId,
  // }) : super(key: key);
  @override
  _CreateEnquiryPresaleState createState() => _CreateEnquiryPresaleState();
}

class _CreateEnquiryPresaleState extends State<CreateEnquiryPresale>
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
  final TextEditingController dateController = new TextEditingController();
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
  bool? displayMobileLayout;


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
        pageTitle: "Enquiries     Stock Management",
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
        pageTitle: "Enquiries     Stock Management",
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
                'Create Enquiry',
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
                                left: 20, right: 20, bottom: 10, top: 8),
                            child: new TextFormField(
                                      style: TextStyle(fontSize: fontTextSmall),
                              textCapitalization: TextCapitalization.words,
                              maxLines: 1,
                              maxLength: 20,
                              buildCounter: (BuildContext context,
                                  {int ?currentLength,
                                    int ?maxLength,
                                    bool ?isFocused}) =>
                              null,
//                      controller: _textFieldController1comment,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z0-9/_-]"))
                              ],
                              controller: firstnameController,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return 'Name cannot be empty';
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
                                labelText: 'Name*',
                                labelStyle: TextStyle(
                                  color: const Color(0xff8c8c8c),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
                                      style: TextStyle(fontSize: fontTextSmall),
                              maxLength: 10,
                              buildCounter: (BuildContext context,
                                  {int ?currentLength,
                                    int ?maxLength,
                                    bool ?isFocused}) =>
                              null,
                              controller: mobileController,
                              validator:(String ?value){
                                if (value!.length < 10)
                                  return 'Please enter valid mobile number';
                                else
                                  return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9]"))
                              ],
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                // border: OutlineInputBorder(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                labelText: 'Mobile Number*',

                                labelStyle: TextStyle(
                                  color: const Color(0xff8c8c8c),
                                ),
                              ),
                              onChanged: (value)
                              {
                                setState(() {
                                  isLayoutVisible=false;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10,),
                            child: new TextFormField(
                                      style: TextStyle(fontSize: fontTextSmall),
                              maxLines: 1,
                              maxLength: 30,
                              enableInteractiveSelection: false,
                              controller: emailController,
                              buildCounter: (BuildContext context,
                                  {int ?currentLength,
                                    int ?maxLength,
                                    bool ?isFocused}) =>
                              null,
                              validator: (String ?value) {
//                          Pattern pattern =
//                              r'^(([^()[\]\\.,:\s@\"]+(\.[^<>()[\]\\."]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                if (!(regex.hasMatch(value!))) {
                                  return "Please enter valid Email ID";
                                } else {
                                  return null;
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
                                labelText: 'Email ID*',
                                labelStyle: TextStyle(
                                  color: const Color(0xff8c8c8c),
                                ),
                              ),
                            ),
                          ),
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
                                labelText: 'Gender*',
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
                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: new TextFormField(
                                      style: TextStyle(fontSize: fontTextSmall),
                              maxLines: null,
                              textCapitalization: TextCapitalization.words,

//                      controller: _textFieldController1comment,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(
                                        "[a-zA-Z 0-9 ():,.!~@#+=&/\$%_*'-]"))
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
                                labelText: 'Address*',
                                labelStyle: TextStyle(
                                  color: const Color(0xff8c8c8c),
                                ),
                              ),
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
                                labelText: 'City*',
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
                                  labelText: 'Zipcode*',
                                ),
                                controller: cityController,
                                validator: (String ?value) {
                                  if (value!.isEmpty) {
                                    return 'zipcode cannot be empty';
                                  }
                                }),
                          ),


                          // New Model UI
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
//                isDense: false,
                                    suffixIcon: Icon(
                                        Icons.keyboard_arrow_down),
                                    labelText: 'Product*',
                                  ),
                                  controller: productController,
                                  validator: (String ?value) {
                                    if (value!.isEmpty) {
                                      return 'Please Select product';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {

                                  },
                                ),
                              ),
                              Visibility(
                                visible: isModelVisible,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextFormField(
                                      style: TextStyle(fontSize: fontTextSmall),
                                    readOnly: true,
                                    enabled: isModelVisible,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0,),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black54,
                                            width: 1.0),
                                      ),
//                isDense: false,
                                      suffixIcon: Icon(
                                          Icons.keyboard_arrow_down),
                                      labelText: 'Model*',
                                    ),
                                    controller: modelController,
                                    validator: (String ?value) {
                                      if (value!.isEmpty) {
                                        return 'Please Select Model';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onTap: () {


                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
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
                                          color: Colors.black54,
                                          width: 1.0),
                                    ),
//                isDense: false,
                                    suffixIcon: Icon(
                                        Icons.keyboard_arrow_down),
                                    labelText: 'Variant*',
                                  ),
                                  controller: variantController,
                                  validator: (String ?value) {
                                    if (value!.isEmpty) {
                                      return 'Please Select Variant';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {

                                  },
                                ),
                              ),
                            ],
                          ),

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
//                isDense: false,
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Enquiry Source*',
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
                                labelText: 'Enquiry Sub-Source*',
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
                                labelText: 'Status*',
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
                                          left: 20, right: 20, bottom: 10, top: 8),
                                      child: new TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        textCapitalization: TextCapitalization.words,
                                        maxLines: 1,
                                        maxLength: 20,
                                        buildCounter: (BuildContext context,
                                            {int ?currentLength,
                                              int ?maxLength,
                                              bool ?isFocused}) =>
                                        null,
//                      controller: _textFieldController1comment,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[a-zA-Z0-9/_-]"))
                                        ],
                                        controller: firstnameController,
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Name cannot be empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                          ),
                                          labelText: 'Name*',
                                          labelStyle: TextStyle(
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
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        maxLength: 10,
                                        buildCounter: (BuildContext context,
                                            {int ?currentLength,
                                              int ?maxLength,
                                              bool ?isFocused}) =>
                                        null,
                                        controller: mobileController,
                                        validator:(String ?value){
                                          if (value!.length < 10)
                                            return 'Please enter valid mobile number';
                                          else
                                            return null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]"))
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: new InputDecoration(
                                          // border: OutlineInputBorder(),

                                          suffixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                          ),
                                          labelText: 'Mobile Number*',

                                          labelStyle: TextStyle(
                                            color: const Color(0xff8c8c8c),
                                          ),
                                        ),
                                        onChanged: (value)
                                        {
                                          setState(() {
                                            isLayoutVisible=false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding:
                                      const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 10,),
                                      child: new TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        maxLines: 1,
                                        maxLength: 30,
                                        enableInteractiveSelection: false,
                                        controller: emailController,
                                        buildCounter: (BuildContext context,
                                            {int ?currentLength,
                                              int ?maxLength,
                                              bool ?isFocused}) =>
                                        null,
                                        validator: (String ?value) {
//                          Pattern pattern =
//                              r'^(([^()[\]\\.,:\s@\"]+(\.[^<>()[\]\\."]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(
                                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                          if (!(regex.hasMatch(value!))) {
                                            return "Please enter valid Email ID";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                          ),
                                          labelText: 'Email ID*',
                                          labelStyle: TextStyle(
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
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                                          labelText: 'Gender*',
                                        ),
                                        controller: genderController,
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Please Select Gender';
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
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: new TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        maxLines: null,
                                        textCapitalization: TextCapitalization.words,

//                      controller: _textFieldController1comment,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(
                                                  "[a-zA-Z 0-9 ():,.!~@#+=&/\$%_*'-]"))
                                        ],
                                        controller: addressController,
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Address cannot be empty';
                                          }
                                        },
                                        decoration: InputDecoration(

                                          suffixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                          ),
                                          labelText: 'Address*',
                                          labelStyle: TextStyle(
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
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        readOnly: false,
                                        decoration: InputDecoration(
                                          labelText: 'City*',
                                        ),
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Place cannot be empty';
                                          }
                                        },
                                        controller: placeController,
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
                                          readOnly: false,
                                          decoration: InputDecoration(
                                            labelText: 'Zipcode*',
                                          ),
                                          controller: cityController,
                                          validator: (String ?value) {
                                            if (value!.isEmpty) {
                                              return 'zipcode cannot be empty';
                                            }
                                          }),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container
                                      (
                                      padding:
                                      const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                              Icons.keyboard_arrow_down),
                                          labelText: 'Product*',
                                        ),
                                        controller: productController,
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Please Select product';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onTap: () {

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
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        readOnly: true,
                                        enabled: isModelVisible,
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                              Icons.keyboard_arrow_down),
                                          labelText: 'Model*',
                                        ),
                                        controller: modelController,
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Please Select Model';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onTap: () {


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
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                              Icons.keyboard_arrow_down),
                                          labelText: 'Variant*',
                                        ),
                                        controller: variantController,
                                        validator: (String ?value) {
                                          if (value!.isEmpty) {
                                            return 'Please Select Variant';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onTap: () {

                                        },
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
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                                          labelText: 'Enquiry Source*',
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
                                  ),
                                  Flexible(child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                                          labelText: 'Enquiry Sub-Source*',
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
                                  ),
                                ],
                              ),
                              Row(
                                children: [

                                  Flexible(
                                    child: Container(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
//                                            enabled: false,
                                        readOnly: true,
                                        decoration: InputDecoration(
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
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 10,),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
//                                            enabled: false,
                                          readOnly: true,
                                          decoration: InputDecoration(
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
                                            /*  DateTime selectedDate = DateTime.now();
                                        final DateTime picked = await showRoundedDatePicker(
                                          context: context,
                                          theme: ThemeData(
                                            colorScheme: ColorScheme.light(
                                                primary: AppTheme.primaryColor),
                                            buttonTheme: ButtonThemeData(
                                                textTheme: ButtonTextTheme
                                                    .primary),
                                            primaryColor: Colors.white70,
                                            accentColor: AppTheme.primaryColor,
                                            textTheme: TextTheme(
                                              bodyText2:
                                              TextStyle(
                                                  color: AppTheme.primaryColor),
                                              caption:
                                              TextStyle(
                                                  color: AppTheme.primaryColor),
                                            ),
                                            disabledColor: Colors.grey,
                                            accentTextTheme: TextTheme(
                                              bodyText2:
                                              TextStyle(
                                                  color: AppTheme.primaryColor),
                                            ),
                                          ),
                                          // initialDate: DateTime(DateTime.now().year,
                                          //     DateTime.now().month, DateTime.now().day + 1),
                                          // firstDate: DateTime(DateTime.now().year,
                                          //     DateTime.now().month, DateTime.now().day + 1),
                                          // lastDate: DateTime(3000),

                                          initialDate: NextVisitDate,
                                          firstDate: NextVisitDate,
                                          lastDate: ExpPurDate,

                                          borderRadius: 16,
                                        );
                                        if (picked != null &&
                                            picked != selectedDate ||
                                            picked == selectedDate) {
                                          setState(() {
                                            selectedDate = picked;
                                            final dateFormatter5 = DateFormat(
                                                'yyyy-MM-dd');
                                            String picked1 = dateFormatter5
                                                .format(picked);
                                            print(picked1);
                                            nextVisitDateController.value =
                                                TextEditingValue(
                                                    text: picked1.toString()
                                                        .split(" ")[0]);
                                          });
                                        } else {}
                                      }*/
                                          }),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmall),
                                        readOnly: true,
                                        decoration: InputDecoration(

                                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                                          labelText: 'Status*',
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