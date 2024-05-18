import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()

class ImageModel{
  int id=0;
  String imagePath;
  bool isVideo;

  ImageModel({this.id=0,required this.imagePath,required this.isVideo});
}