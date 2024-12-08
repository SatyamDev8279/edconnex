import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/post_entity.dart';
import '../../../themes/styles.dart';

class SinglePostCardWidget extends StatefulWidget {
  final PostEntity post;
  const SinglePostCardWidget({super.key, required this.post});

  @override
  State<SinglePostCardWidget> createState() => _SinglePostCardWidgetState();
}

class _SinglePostCardWidgetState extends State<SinglePostCardWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: liWhite,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 70,
                      height: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset(
                              "assets/${widget.post.userProfile}"))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            "${widget.post.username}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert))
                        ],
                      ),
                      Text(
                        "${widget.post.userBio}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 12, color: liMediumGrey),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.access_time_outlined,
                              size: 15, color: liMediumGrey),
                          const SizedBox(width: 2),
                          Text(
                            "${widget.post.createAt}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, color: liMediumGrey),
                          ),
                          const Text(
                              overflow: TextOverflow.ellipsis,
                              " . Edited",
                              style:
                                  TextStyle(fontSize: 12, color: liMediumGrey)),
                          const SizedBox(width: 5),
                          const Icon(FontAwesomeIcons.earth,
                              size: 15, color: liMediumGrey)
                        ],
                      )
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 10),
              Text("${widget.post.description}",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Wrap(
                children: widget.post.tags!.map((tag) {
                  return Text(
                    "$tag",
                    style: const TextStyle(
                        color: liBlue, fontWeight: FontWeight.bold),
                  );
                }).toList(),
              )
            ],
          ),
        ),
        widget.post.postImage!.isEmpty
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage("assets/${widget.post.postImage}"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                padding: EdgeInsets.all(14),
                height: size.height * 0.40,
                width: size.width,
                // width: double.infinity,
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                padding: EdgeInsets.all(14),
                height: 400,
                child: PageView(
                    children: widget.post.postImages!.map((image) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage("assets/$image"),
                            fit: BoxFit.cover)),
                    // width: double.infinity,
                    // color: liMediumGrey,
                    // child: Image.asset("assets/$image", fit: BoxFit.cover),
                  );
                }).toList())),
        const SizedBox(height: 5),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                    child: _singleReactItemWidget(
                        bgColor: Colors.blue.shade200, image: "thumbs_up.png")),
                Positioned(
                    left: 16,
                    child: _singleReactItemWidget(
                        bgColor: Colors.red.shade200, image: "love.png")),
                Positioned(
                    left: 34,
                    child: _singleReactItemWidget(
                        bgColor: Colors.amber.shade200,
                        image: "insightful.png")),
                Positioned(left: 70, child: Text("${widget.post.totalReacts}")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${widget.post.totalComments} comments - ",
                        style: const TextStyle(color: liMediumGrey)),
                    Text("${widget.post.totalReposts} reposts",
                        style: TextStyle(color: liMediumGrey))
                  ],
                )
              ],
            )),
        const SizedBox(height: 15),
        Container(width: double.infinity, height: 1, color: liLightGrey),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _singleActionItemWidget(
                icon: Icons.thumb_up_alt_outlined, title: "Like"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.commentDots, title: "Comment"),
            _singleActionItemWidget(
                icon: FontAwesomeIcons.share, title: "Share"),
          ],
        ),
        const SizedBox(height: 10),
        Container(width: double.infinity, height: 8, color: liLightGrey),
      ],
    );
  }

  _singleActionItemWidget({IconData? icon, String? title}) {
    return Column(
      children: [
        Icon(icon, color: liMediumGrey),
        Text("$title", style: TextStyle(color: liMediumGrey))
      ],
    );
  }

  _singleReactItemWidget({Color? bgColor, String? image}) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: liWhite)),
      child: Image.asset("assets/$image", width: 10, height: 10),
    );
  }
}
