import 'package:flutter/widgets.dart';

class CatalogListVehicleImage extends StatelessWidget {
  final double height;
  final Future<ImageProvider> futureImage;
  static const minimumHight = 15.0;

  CatalogListVehicleImage({
    this.height,
    this.futureImage,
  }) : assert(height != null && height > minimumHight);

  @override
  Widget build(BuildContext context) {
    final initialImage = const AssetImage(
      'assets/gif/loadingCar.gif',
    );
    return FutureBuilder(
      future: futureImage,
      builder: (_, snapshot) => Image(
        height: height,
        image: snapshot?.data ?? initialImage,
      ),
      initialData: initialImage,
    );
  }
}
