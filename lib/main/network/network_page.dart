import 'package:edconnex/data/network_entity.dart';
import 'package:edconnex/main/network/network1_page.dart';
import 'package:edconnex/themes/styles.dart';
import 'package:flutter/material.dart';

import 'widgets/single_network_user_widget.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  List<NetworkEntity> networkData = NetworkEntity.networkData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: liWhite,
        elevation: 0,
        foregroundColor: liLightGrey,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageNetworkPage()),
            );
          },
        ),
        title: const Text(
          'Invitations',
          style: TextStyle(color: liBlack, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: liBlack),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: liWhite,
      body: SingleChildScrollView(
          child: Column(children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       IconButton(
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => ManageNetworkPage()));
        //           },
        //           icon: Icon(Icons.arrow_back)),
        //       const Text(
        //         "Invitations",
        //         style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //             color: liBlue),
        //       ),
        //       IconButton(
        //         onPressed: () {},
        //         icon: const Icon(
        //           Icons.arrow_forward_ios,
        //           color: liMediumGrey,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        Container(
          width: double.infinity,
          height: 8,
          color: liLightGrey,
        ),
        const SizedBox(
          height: 15,
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: networkData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            final network = networkData[index];
            return SingleNetworkUserWidget(network: network);
          },
        )
      ])),
    );
  }
}
