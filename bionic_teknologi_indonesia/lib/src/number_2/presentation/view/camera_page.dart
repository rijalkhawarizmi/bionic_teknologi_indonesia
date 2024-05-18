import 'dart:io';
import 'package:bionic_teknologi_indonesia/common/custom_button.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:bionic_teknologi_indonesia/core/style/sized_box.dart';
import 'package:bionic_teknologi_indonesia/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:video_player/video_player.dart';
import '../../../../core/utils/objectbox.dart';
import '../../model/contact_model.dart';

class CameraPage extends StatefulWidget {
  static const String cameraRoute = "camera-route";

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();
  late Stream<List<ImageModel>> streamImage;
  VideoPlayerController? _controller;
  int? _playingIndex;
  List<ImageModel> list = [];

  Future<void> _pickAndSaveMedia({required bool isVideo}) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      await saveMedia(objectBox, file, isVideo);
    }
  }

  Future<void> _pickAndSaveMediaVideo({required bool isVideo}) async {
    final pickedFile = await _picker.pickVideo(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      await saveMedia(objectBox, file, isVideo);
    }
  }

  Future<void> saveMedia(ObjectBox objectBox, File media, bool isVideo) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = p.join(directory.path, p.basename(media.path));
    final savedMedia = await media.copy(path);
    final mediaModel = ImageModel(imagePath: savedMedia.path, isVideo: isVideo);
    objectBox.createImage(mediaModel);
  }

  @override
  void initState() {
    super.initState();
    streamImage = objectBox.getImages();
  }

  void _initializeAndPlayVideo(String videoPath, int index) {
    final mediaModel = list[index];
    if (_controller != null) {
      _controller!.dispose();
    }
    _controller = VideoPlayerController.file(File(mediaModel.imagePath))
      ..initialize().then((_) {
        setState(() {
          _playingIndex = index;
          print('hahahah $_playingIndex');
          _controller!.play();
        });
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VerticalSizedBox(
            height: 60,
          ),
          CustomButton(
            onPressed: () {
              _pickAndSaveMedia(isVideo: false);
            },
            text: "pick image",
            colorText: ColorApp.white,
            fontWeight: FontWeight.bold,
          ),
          CustomButton(
            onPressed: () {
              _pickAndSaveMediaVideo(isVideo: true);
            },
            text: "pick video",
            colorText: ColorApp.white,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: StreamBuilder(
                stream: streamImage,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        list = snapshot.data!;
                        final imagePaths = snapshot.data?[index];
                        if (imagePaths!.isVideo) {
                          return VideoPlayerWidget(
                            videoPath: imagePaths.imagePath,
                            id: imagePaths.id,
                          );
                        } else {
                          return Image.file(File(imagePaths.imagePath));
                        }
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  final int id;

  VideoPlayerWidget({required this.videoPath, required this.id});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();
  
    _initializeVideoPlayer();
    _controller.setLooping(true);
  }

  void _initializeVideoPlayer() {
     
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      }).catchError((error) {
        print('Error initializing video player: $error');
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(_controller),
            isPlay
                ? SizedBox()
                : Align(
                    alignment: Alignment.center,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.play();
                            isPlay = true;
                          });
                        },
                        icon: Icon(
                          Icons.play_arrow_outlined,
                          size: 100,
                        )),
                  ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    objectBox.deleteImage(widget.id);
                  },
                  icon: Icon(
                    Icons.play_arrow_outlined,
                    size: 100,
                  )),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
