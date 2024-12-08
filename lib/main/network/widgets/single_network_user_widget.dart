import 'package:edconnex/data/network_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../themes/styles.dart';

class SingleNetworkUserWidget extends StatefulWidget {
  final NetworkEntity network;
  const SingleNetworkUserWidget({super.key, required this.network});

  @override
  State<SingleNetworkUserWidget> createState() =>
      _SingleNetworkUserWidgetState();
}

class _SingleNetworkUserWidgetState extends State<SingleNetworkUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(color: liLightGrey),
                child: Image.asset("assets/${widget.network.userBgImage}",
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("${widget.network.username}",
                      maxLines: 1, overflow: TextOverflow.ellipsis)),
              const SizedBox(height: 5),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("${widget.network.userBio}",
                      maxLines: 1, overflow: TextOverflow.ellipsis)),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.group),
                    SizedBox(width: 10),
                    Expanded(
                        child: Text(
                      "${widget.network.mutualConnections} mutual connections",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: liMediumGrey),
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: liBlue),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text("Connect",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: liBlue))),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                    color: liMediumGrey, shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                      "assets/${widget.network.userProfileImage}",
                      fit: BoxFit.cover),
                )),
          )
        ],
      ),
    );
  }
}
