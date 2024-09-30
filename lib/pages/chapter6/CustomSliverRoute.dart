import 'package:flutter/cupertino.dart';
import 'package:flutter_project/components/SliverFlexibleHeader.dart';

class CustomSliverRoute extends StatefulWidget {
  @override
  _CustomSliverRouteState createState() => _CustomSliverRouteState();
}

class _CustomSliverRouteState extends State<CustomSliverRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverFlexibleHeader(
            visibleExtent: 200,
            builder: (context, availableHeight) {
              return GestureDetector(
                onTap: () => print('tap'),
                child: Image(
                  image: AssetImage('assets/images/sea.jpg'),
                  width: 50,
                  height: availableHeight,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                ),
              );
            })
      ],
    );
  }
}
