import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blingo2/Routes/routes.dart';
import 'package:blingo2/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:blingo2/Components/continue_button.dart';
import 'package:blingo2/Components/entry_field.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

//Verification page that sends otp to the phone number entered on phone number page
class VerificationPage extends StatelessWidget {
  final VoidCallback onVerificationDone;

  VerificationPage(this.onVerificationDone);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Theme(
              data: Theme.of(context).copyWith(
                cardColor: backgroundColor,
              ),
              child: PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: secondaryColor,
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none),
                onSelected: (dynamic value) {
                  if (value == locale!.changeLanguage) {
                    Navigator.pushNamed(context, PageRoutes.languagePage);
                  } else if (value == locale.help) {
                    Navigator.pushNamed(context, PageRoutes.helpPage);
                  } else if (value == locale.termsOfUse) {
                    Navigator.pushNamed(context, PageRoutes.tncPage);
                  } else if (value == locale.logout) {
                    Phoenix.rebirth(context);
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text(locale!.changeLanguage!),
                      value: locale.changeLanguage,
                      textStyle: TextStyle(color: secondaryColor),
                    ),
                    PopupMenuItem(
                      child: Text(locale.help!),
                      value: locale.help,
                      textStyle: TextStyle(color: secondaryColor),
                    ),
                    PopupMenuItem(
                      child: Text(locale.termsOfUse!),
                      value: locale.termsOfUse,
                      textStyle: TextStyle(color: secondaryColor),
                    ),
                  ];
                },
              ))
        ],
        title: Text(AppLocalizations.of(context)!.verification!),
      ),
      body: FadedSlideAnimation(
        VerificationBody(onVerificationDone),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

//otp verification class
class VerificationBody extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationBody(this.onVerificationDone);

  @override
  _VerificationBodyState createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
  bool isDialogShowing = false;
  int _counter = 20;
  late Timer _timer;

  _startTimer() {
    //shows timer
    _counter = 20; //time counter

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  void verifyPhoneNumber() {
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(left: 20.0, bottom: 16.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '\n' + locale.enterCode! + '+91__________',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 32.0),
          EntryField(
            label: locale.verificationCode,
            initialValue: '_ _ _ _ _ _',
            maxLength: 6,
            keyboardType: TextInputType.number,
          ),
          Spacer(),
          CustomButton(
            text: locale.submit,
            onPressed: () {
              widget.onVerificationDone();
            },
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                locale.resend!,
                style: Theme.of(context).textTheme.headline6,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '$_counter ${locale.sec}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
