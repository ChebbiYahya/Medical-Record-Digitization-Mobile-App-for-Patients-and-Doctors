import 'package:flutter/material.dart';

import '../../theme/constants.dart';

class AmbulancePage extends StatelessWidget {
  const AmbulancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
            child: Image.asset(
              "assets/images/appbar_image.png",
              height: 40,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nos Ambulances",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kLightBlueColor,
                          //color: kWhiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 3),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: kGreenContaineColor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade500,
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4.0, -4.0),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/ambulance_image.png",
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Ambulance",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 5,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ambulance Avicenne",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Tous les specialitées",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: kDarkGreeyColor),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: kGreeyColor,
                                        //color: kWhiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.local_phone_outlined,
                                            color: kBlueColor,
                                            size: 12,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "90 000 000",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(color: kBlueColor),
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: kDarkGreeyColor,
                                          size: 12,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Bardo, Tunis",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: kDarkGreeyColor),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
