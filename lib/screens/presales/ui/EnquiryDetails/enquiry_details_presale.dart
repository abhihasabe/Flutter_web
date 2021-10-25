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

import 'presale_enquiry_mob_history.dart';
import 'presale_enquiry_web_history.dart';


class EnquiryDetailPresale extends StatefulWidget {
  // final int leadId;

  // EnquiryDetailPresale({
  //   Key key,
  //   this.leadId,
  // }) : super(key: key);
  @override
  _EnquiryDetailPresaleState createState() => _EnquiryDetailPresaleState();
}

class _EnquiryDetailPresaleState extends State<EnquiryDetailPresale>
    with TickerProviderStateMixin {


  final ScrollController scrollController = ScrollController();
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
  final TextEditingController numberController = new TextEditingController();
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
  bool? displayMobileLayout;

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

  late AnimationController animationController;
  late Animation<double> topBarAnimation;

  final TextEditingController roleController = new TextEditingController();

  double topBarOpacity = 0.0;
  int _index = 0;
  String? firstName="ss", lastName="ss", role;
  Animation? animation;
  int count = 9;



  @override
  void initState() {
    // TODO: implement initState

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn)));

    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    genderList.clear();
    genderList.add('Male');
    genderList.add('Female');

    firstnameController.text='John.Deo';
    mobileController.text='77866866868';
    emailController.text='paxbat@gmail.com';
    genderController.text='Male';
    numberController.text='DTHJ345788';
    dateController.text='7 sept 2021';
    modelController.text='peugeot';
    productController.text='New peugeot';
    variantController.text='Peugeot 125 cc';

    addressController.text='Pune';
    cityController.text='Pune';
    zipCodeController.text='412105';
    enquirySourceController.text='Dealership';
    enquirySubSourceController.text='Self';
    expPurDateController.text='12/7/2021';
    nextVisitDateController.text='15/8/2021';
    statusController.text='Followup';
    remarkController.text='Test Remark';

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
        pageTitle: "Pre Sale",
        // key: _scaffoldKey,
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
              child: Container(
                child: Column(
                  children: <Widget>[
                    getAppBarUI(),
                    getMainWebViewUI(),
                    // SizedBox(
                    //   height: MediaQuery
                    //       .of(context)
                    //       .padding
                    //       .bottom,
                    // ),

                    getListView(),
                  ],
                ),
              ),
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
                'Enquiry Details',
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
                                labelText: 'Name',
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
                              maxLength: 10,
                              readOnly: true,
                              enabled: false,
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
                                labelText: 'Mobile Number',

                                labelStyle: TextStyle(
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
                          Container(
                            padding:
                            const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10,),
                            child: new TextFormField(
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
                                labelText: 'Email ID',
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
//                isDense: false,.
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Gender',
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
                              controller: cityController,
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
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
                                  labelText: 'Zipcode',
                                ),
                                controller: zipCodeController,
                               ),
                          ),


                          // New Model UI
                          Column(
                            children: [
                              Container(
                                padding:
                                const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextFormField(
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
                                    suffixIcon: Icon(
                                        Icons.keyboard_arrow_down),
                                    labelText: 'Product',
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
                                    readOnly: true,
                                    enabled: false,
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
                                    onTap: () {


                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextFormField(
                                  readOnly: true,
                                  enabled: false,
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
                                    labelText: 'Variant',
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
              padding: const EdgeInsets.only(left:20.0,right: 20,top:20),
              child: Container(

                child: Card(
                  color: Colors.white,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10,),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
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
                                    Flexible(
                                      child: Container(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10, top: 18),
                                        child: new TextFormField(
                                          style: TextStyle(fontSize: fontTextSmaller),
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
                                          controller: addressController,
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
                                            labelText: 'Address',contentPadding: const EdgeInsets.all(6.0),

                                          ),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
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
                                            left: 20, right: 20, bottom: 10),
                                        child: new TextFormField(
                                          style: TextStyle(fontSize: fontTextSmaller),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            labelText: 'Product',
                                            labelStyle: TextStyle(height: 0.5,
                                              color: const Color(0xff8c8c8c)),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            labelText: 'Model',
                                            labelStyle: TextStyle(height: 0.5,
                                                color: const Color(0xff8c8c8c)),
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
                                          style: TextStyle(fontSize: fontTextSmaller),
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            labelText: 'Variant',
                                            labelStyle: TextStyle(height: 0.5,
                                                color: const Color(0xff8c8c8c)),
                                          ),
                                          controller: variantController,
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
                                          style: TextStyle(fontSize: fontTextSmaller),
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            // border: OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //     color: Colors.grey, width: 1.0,),
                                            // ),
                                            // focusedBorder: OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //       color: Colors.black54, width: 1.0),
                                            // ),
                                            labelText: 'City',
                                            labelStyle: TextStyle(height: 0.5,
                                                color: const Color(0xff8c8c8c)),
                                          ),
                                          validator: (String ?value) {
                                            if (value!.isEmpty) {
                                              return 'Place cannot be empty';
                                            }
                                          },
                                          controller: cityController,
                                        ),
                                      ),

                                    ),
                                    Flexible(
                                      child: Container(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: TextFormField(
                                            style: TextStyle(fontSize: fontTextSmaller),
                                            readOnly: true,
                                            enabled: false,
                                            decoration: InputDecoration(
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: Colors.grey, width: 1.0,),
                                              // ),
                                              // focusedBorder: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //       color: Colors.black54, width: 1.0),
                                              // ),
                                              labelText: 'Zipcode',
                                              labelStyle: TextStyle(height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                            controller: zipCodeController,
                                            validator: (String ?value) {
                                              if (value!.isEmpty) {
                                                return 'zipcode cannot be empty';
                                              }
                                            }),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmaller),
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            labelText: 'Enquiry Source',
                                            labelStyle: TextStyle(height: 0.5,
                                                color: const Color(0xff8c8c8c)),
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
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmaller),
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            // border: OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //     color: Colors.grey, width: 1.0,),
                                            // ),
                                            // focusedBorder: OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //       color: Colors.black54, width: 1.0),
                                            // ),
                                            labelText: 'Enquiry Sub-Source',
                                            labelStyle: TextStyle(height: 0.5,
                                                color: const Color(0xff8c8c8c)),
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
                                    Flexible(
                                      child: Container(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmaller),
//                                            enabled: false,
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            labelText: "Expected Purchase*",

                                            labelStyle: TextStyle(height: 0.5,
                                                color: const Color(0xff8c8c8c)),
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
                                  ],
                                ),

                                Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10,),
                                        child: TextFormField(
                                            style: TextStyle(fontSize: fontTextSmaller),
//                                            enabled: false,
                                            readOnly: true,
                                            enabled: false,
                                            decoration: InputDecoration(
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.all(0.0),
                                                // child: Icon(
                                                //   Icons.date_range,
                                                //   color: Colors.black54,
                                                // ),
                                              ),
                                              labelText: "Next Visit date*",
                                              labelStyle: TextStyle(height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
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
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: fontTextSmaller),
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            labelText: 'Status',
                                            labelStyle: TextStyle(height: 0.5,
                                                color: const Color(0xff8c8c8c)),
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

                                Container(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10,top: 0),
                                  child: new TextFormField(

                                    style: TextStyle(fontSize: fontTextSmaller),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    readOnly: true,
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
                              ],
                            ),

                          ]),
                        ),
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
    else {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }
  }
  Widget getListView()
  {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: Card(
          color: Colors.white,
          child: Container(

            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: backgroundColor,
                border: Border.all(color: Colors.black12)
            ),
            child: ListView.builder(
              itemCount: 3,
              padding: const EdgeInsets.only(top: 8),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int i) {
//          final int count = enqList.length > 10 ? 10 : enqList.length;
                final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / 100) * i, 1.0,
                        curve: Curves.fastOutSlowIn)));
                animationController.forward();
                return AnimatedBuilder(
                    animation: animationController,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                        opacity: animation,
                        child: Transform(
                          transform: Matrix4.translationValues(
                              0.0, 50 * (1.0 - animation.value), 0.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,  MaterialPageRoute(
                                    builder: (context) =>EnquiryDetailPresale()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(

                                  child: Stack(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          displayMobileLayout!?
                                          PresaleEnquiryMobHistory():
                                          PresaleEnquiryWebHistory(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),

          ),
        ),
      ),

    );
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