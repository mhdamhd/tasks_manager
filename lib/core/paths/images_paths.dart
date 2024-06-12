/// In this class, we will define the paths to the images in assets.
/// Do not forget to add the paths to the files that contain the images in "pubspec.yaml" in line 63.
///
/// Adding a new path to the class will be done using the following method
/// static const String imageName = '$_baseImagePath/image_name.png';
///
/// Using [ImagesPaths] with: cached_network_image library, or with material [NetworkImage] widget
/// by set path to [NetworkImage] widget, or to [CachedNetworkImage] widget
///
/// Ex: NetworkImage(_path),

// TODO: add images assest pathes here
class ImagesPaths {
  static const String _baseImagesPath = 'assets/images';
  static const String logoPng = '$_baseImagesPath/logo.png';
  static const String failurePng = '$_baseImagesPath/failure.png';
  static const String backGroundImagePng =
      '$_baseImagesPath/background_image.png';
}
