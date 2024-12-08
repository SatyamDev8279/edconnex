import 'package:edconnex/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:edconnex/main/home/widgets/single_post_card_widget.dart';
import 'package:edconnex/data/post_entity.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
  final ImagePicker _picker = ImagePicker();

  bool _isShow = true;

  List<PostEntity> postData = PostEntity.postListData;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels > 3) {
        setState(() {
          _isShow = false;
        });
      } else {
        setState(() {
          _isShow = true;
        });
      }
    });
    super.initState();
  }

  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      // Handle the captured photo
      print('Photo captured: ${photo.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          _isShow
              ? Container(
                  width: double.infinity,
                  height: 8,
                  color: liLightGrey,
                )
              : Container(),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: postData.length,
              itemBuilder: (context, index) {
                final post = postData[index];
                return SinglePostCardWidget(post: post);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _openCamera,
          backgroundColor: liLightGrey,
          child: Icon(
            Icons.camera_alt,
          )),
    );
  }
}
