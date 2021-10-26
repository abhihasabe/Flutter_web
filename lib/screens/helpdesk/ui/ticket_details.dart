import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news_app/screens/helpdesk/ui/replay_ticket.dart';
import 'package:news_app/screens/helpdesk/ui/ticketdetails_mob.dart';
import 'package:news_app/screens/helpdesk/ui/ticketdetails_web.dart';
import 'package:news_app/screens/sidebar/app_scaffold.dart';
import 'package:news_app/theme/colors.dart';
import 'package:news_app/theme/dimens.dart';
import 'package:news_app/theme/theme.dart';

class TicketDetails extends StatefulWidget {
  // final int leadId;

  // EnquiryDetailPresale({
  //   Key key,
  //   this.leadId,
  // }) : super(key: key);
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails>
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

  int? enqSrcId,
      enqSubSrcId,
      modelId,
      varId,
      segmentId,
      brandId,
      enqTypeId,
      locId,
      zipId,
      maritalId,
      occupationId;

  String provienceLable = "Provience";
  String segmentLable = "Segment";
  String modelLable = "Model";
  String variantLable = "Variant";
  String enquirySourceLable = "Enquiry Source";
  String enquirySubSourceLable = "Enquiry Sub Source";
  String cityLable = "City";

  String brandLable = "Brand";
  String enqTypeLable = "Enquiry Type";
  String maritalTypeLable = "Marital Status";
  String OccupatuionTypeLable = "Occupation";
  String exchangeModelLable = "Model";
  String exchangeVarientLable = "Varient";
  String exchangeYearLable = "Year";

  // leadDetailsResponse leadDetailsList;

  final TextEditingController ticketnoController = new TextEditingController();
  final TextEditingController moduleController = new TextEditingController();
  final TextEditingController submoduleController = new TextEditingController();
  final TextEditingController statusController = new TextEditingController();
  final TextEditingController datecreatedController =
      new TextEditingController();
  final TextEditingController createdbyController = new TextEditingController();
  final TextEditingController modifieddateController =
      new TextEditingController();
  final TextEditingController modifiedbyController =
      new TextEditingController();
  final TextEditingController subjectController = new TextEditingController();
  final TextEditingController remarkController = new TextEditingController();
  final TextEditingController segmentController = new TextEditingController();

  final TextEditingController brandController = new TextEditingController();
  final TextEditingController enqTypeController = new TextEditingController();
  final TextEditingController exchangeModelController =
      new TextEditingController();
  final TextEditingController exchangeVarientController =
      new TextEditingController();
  final TextEditingController exchangeYearController =
      new TextEditingController();

  final TextEditingController provienceController = new TextEditingController();
  final TextEditingController placeController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();

  final TextEditingController nextVisitDateController =
      new TextEditingController();
  final TextEditingController testDriveDateController =
      new TextEditingController();

  final TextEditingController occupationController =
      new TextEditingController();
  final TextEditingController MaritalStatusController =
      new TextEditingController();
  final TextEditingController AnnivarsaryDateController =
      new TextEditingController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

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
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  bool isCheckValue = false;
  bool isTestDateVisible = false;

  late AnimationController animationController;
  late Animation<double> topBarAnimation;

  final TextEditingController roleController = new TextEditingController();

  double topBarOpacity = 0.0;
  int _index = 0;
  String? firstName = "ss", lastName = "ss", role;
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

    ticketnoController.text = 'DTHJ3859889';
    moduleController.text = 'ASD';
    submoduleController.text = 'Asdfg';
    statusController.text = 'Pending';
    datecreatedController.text = '01 Apr 2021';
    createdbyController.text = 'Jon Deo';
    modifieddateController.text = '10 Sept 2021';
    modifiedbyController.text = 'Pax Bat';
    subjectController.text = 'Promotion not applied on last order';

    remarkController.text =
        'The pattern of narrative development that aims to make vivid a place, object,character,or group, description is one of four rhetorical modes,along with exposition';

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    displayMobileLayout = MediaQuery.of(context).size.width < 600;
    // TODO: implement build

    return displayMobileLayout!
        ? Container(
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
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container(
//        color: AppTheme.white,
            child: AppScaffold(
              key: _scaffoldKey,
              pageTitle: "Ticket  Ticket Details",
//          backgroundColor: AppTheme.background,
              body: SafeArea(
                child: Container(
                  color: Colors.white,
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
                'Ticket Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MyThemes.FontTitle,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(color: textColor, fontSize: 16, letterSpacing: 1)),
                        backgroundColor: MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: ()
                      {
                        Navigator.push(context,  MaterialPageRoute(
                            builder: (context) =>replayticket()));
                      },
                      child: Container(
                        height: 35,
                        width: 175,
                        alignment: Alignment.center,
                        child:
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Text('Replay', style: TextStyle(color: textDarkColor)),]),
                      ),
                    ),
                  ],
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
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10, top: 8),
                            child: new TextFormField(
                              readOnly: true,
                              enabled: false,
                              textCapitalization: TextCapitalization.words,
                              maxLines: 1,
                              maxLength: 20,
                              buildCounter: (BuildContext context,
                                      {int? currentLength,
                                      int? maxLength,
                                      bool? isFocused}) =>
                                  null,
//                      controller: _textFieldController1comment,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z0-9/_-]"))
                              ],
                              controller: ticketnoController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Ticket no cannot be empty';
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(0.0),
                                ),
                                labelText: 'Ticket No',
                                labelStyle: TextStyle(
                                  color: const Color(0xff8c8c8c),
                                ),
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
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
//                isDense: false,
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Module',
                              ),
                              controller: moduleController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Select Module';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {},
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
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Sub Module',
                              ),
                              controller: submoduleController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Select Submodule';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {},
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
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                labelText: 'Status',
                              ),
                              controller: statusController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Select status';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {},
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: TextFormField(
//                                            enabled: false,
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
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
                                labelText: "Date Created",
                                labelStyle: TextStyle(),
                              ),
                              controller: datecreatedController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Select date';
                                }
                                return null;
                              },
                              onTap: () async {
                                setState(() {
                                  isNextVisitDateVisible = true;
                                });
                              },
                            ),
                          ),

                          // New Model UI
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextFormField(
                                  readOnly: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black54, width: 1.0),
                                    ),
//                isDense: false,
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    labelText: 'Created By',
                                  ),
                                  controller: createdbyController,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please Select name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {},
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextFormField(
//                                            enabled: false,
                                  readOnly: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
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
                                    labelText: "Date Modified",
                                    labelStyle: TextStyle(),
                                  ),
                                  controller: modifieddateController,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Select date';
                                    }
                                    return null;
                                  },
                                  onTap: () async {
                                    setState(() {
                                      isNextVisitDateVisible = true;
                                    });
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
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black54, width: 1.0),
                                    ),
//                isDense: false,
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    labelText: 'Modified By',
                                  ),
                                  controller: modifiedbyController,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please Select name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),

                          Visibility(
                            visible: isNextVisitDateVisible,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 10,
                              ),
                              child: TextFormField(
//                                            enabled: false,
                                  readOnly: true,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
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
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Select date';
                                    }
                                    return null;
                                  },
                                  onTap: () async {}),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.only(
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
                                      {int? currentLength,
                                      int? maxLength,
                                      bool? isFocused}) =>
                                  null,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z 0-9 ():,.!~@#+=&/\$%_'-]"))
                              ],
                              controller: remarkController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Remarks cannot be empty';
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
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
                                      borderRadius:
                                          new BorderRadius.circular(36.0),
                                    ),
                                    child: Text(
                                      "Replay",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                    onPressed: () {},
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
    } else {
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
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20
                ),
                child: Container(
                  child: Card(
                    color: Colors.white,
                    child:Expanded(
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
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 10, top: 18),
                                          child: new TextFormField(
                                            style: TextStyle(fontSize: fontTextSmaller),
                                            readOnly: true,
                                            enabled: false,
                                            textCapitalization:
                                            TextCapitalization.words,
                                            maxLines: 1,
                                            maxLength: 20,
                                            buildCounter: (BuildContext context,
                                                {int? currentLength,
                                                  int? maxLength,
                                                  bool? isFocused}) =>
                                            null,
                                            controller: ticketnoController,
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
                                              labelStyle: TextStyle(
                                                height: 0.5,
                                                color: const Color(0xff8c8c8c),
                                              ),
                                              labelText: 'Ticket No',
                                              contentPadding: const EdgeInsets.all(6.0),
                                            ),
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
                                              labelText: 'Module',
                                              labelStyle: TextStyle(
                                                  height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                            controller: moduleController,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'Please Select Module';
                                              } else {
                                                return null;
                                              }
                                            },
                                            onTap: () {},
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
                                              labelText: 'Sub Module',
                                              labelStyle: TextStyle(
                                                  height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                            controller: submoduleController,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'Please Select Sub Module';
                                              } else {
                                                return null;
                                              }
                                            },
                                            onTap: () {},
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
                                              labelText: 'Status',
                                              labelStyle: TextStyle(
                                                  height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                            controller: statusController,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'Please Select status';
                                              } else {
                                                return null;
                                              }
                                            },
                                            onTap: () {},
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
                                          child: new TextFormField(
                                            style: TextStyle(fontSize: fontTextSmaller),
                                            readOnly: true,
                                            enabled: false,
                                            textCapitalization:
                                            TextCapitalization.words,
                                            maxLines: 1,
                                            maxLength: 20,
                                            buildCounter: (BuildContext context,
                                                {int? currentLength,
                                                  int? maxLength,
                                                  bool? isFocused}) =>
                                            null,
                                            controller: datecreatedController,
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
                                              labelStyle: TextStyle(
                                                height: 0.5,
                                                color: const Color(0xff8c8c8c),
                                              ),
                                              labelText: 'Date Created',
                                              contentPadding: const EdgeInsets.all(6.0),
                                            ),
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
                                              labelText: 'Created By',
                                              labelStyle: TextStyle(
                                                  height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                            controller: createdbyController,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 10),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: fontTextSmaller),
//                                            enabled: false,
                                            readOnly: true,
                                            enabled: false,
                                            decoration: InputDecoration(
                                              labelText: "Date Modified",
                                              labelStyle: TextStyle(
                                                  height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                            controller: modifieddateController,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'Select date';
                                              }
                                              return null;
                                            },
                                            onTap: () async {
                                              setState(() {
                                                isNextVisitDateVisible = true;
                                              });
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
                                              labelText: 'Modified By',
                                              labelStyle: TextStyle(
                                                  height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                            controller: modifiedbyController,
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
                                              left: 20, right: 20, bottom: 10, top: 18),
                                          child: new TextFormField(
                                            style: TextStyle(fontSize: fontTextSmaller),
                                            readOnly: true,
                                            enabled: false,
                                            textCapitalization:
                                            TextCapitalization.words,
                                            maxLines: 1,
                                            maxLength: 20,
                                            buildCounter: (BuildContext context,
                                                {int? currentLength,
                                                  int? maxLength,
                                                  bool? isFocused}) =>
                                            null,
                                            controller: subjectController,
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
                                              labelStyle: TextStyle(
                                                height: 0.5,
                                                color: const Color(0xff8c8c8c),
                                              ),
                                              labelText: 'Subject',
                                              contentPadding: const EdgeInsets.all(6.0),
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
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 10, top: 0),
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
                                                {int? currentLength,
                                                  int? maxLength,
                                                  bool? isFocused}) =>
                                            null,

                                            controller: remarkController,

                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black54, width: 1.0),
                                              ),
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.all(0.0),
                                              ),
                                              labelText: 'Remarks/Comment',
                                              labelStyle: TextStyle(
                                                  height: 0.5,
                                                  color: const Color(0xff8c8c8c)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 0.0, top: 4),
                                              child: Icon(
                                                Icons.picture_as_pdf,color: Colors.red,size: 21,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),


                                  // Row(
                                  //   crossAxisAlignment: CrossAxisAlignment.end,
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: <Widget>[
                                  //     Padding(
                                  //       padding: const EdgeInsets.only(
                                  //           right: 20.0, top: 10, bottom: 20),
                                  //       child: SizedBox(
                                  //         width: 144.0,
                                  //         height: 46.0,
                                  //         child: RaisedButton(
                                  //           color: accentColor,
                                  //           textColor: Colors.white,
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius: new BorderRadius.circular(
                                  //                 36.0),
                                  //           ),
                                  //           child: Text(
                                  //             "Replay",
                                  //             textAlign: TextAlign.center,
                                  //             style: const TextStyle(
                                  //                 color: Colors.white,
                                  //                 fontSize: 16.0),
                                  //           ),
                                  //           onPressed: () {
                                  //           },
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ]),
                          ),
                        )
                      ),
                    )
                  ),
                ),
              );
          }
        },
      );
    } else {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }
  }

  Widget getListView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: Card(
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                color: backgroundColor, border: Border.all(color: Colors.grey)),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TicketDetails()));
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
                                        hdticketmobdetails():
                                        hdticketwebdetails(),
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
