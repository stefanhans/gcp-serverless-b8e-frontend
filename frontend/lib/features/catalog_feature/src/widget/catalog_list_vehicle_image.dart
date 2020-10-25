import 'package:flutter/widgets.dart';

class CatalogListVehicleImage extends StatelessWidget {
  final Future<ImageProvider> netWorkImage;

  CatalogListVehicleImage(this.netWorkImage);

  @override
  Widget build(BuildContext context) {
    final initialImage = const AssetImage(
      'assets/gif/loadingCar.gif',
    );
    return FutureBuilder(
      future: netWorkImage,
      builder: (_, snapshot) => Image(
        height: 125,
        image: snapshot?.data ?? initialImage,
      ),
      initialData: initialImage,
    );
  }
}
