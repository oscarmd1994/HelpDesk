import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[700],
            highlightColor: Colors.grey[100],
            child: ShimmerList(),
          ),
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Shimmer.fromColors(
            child: ShimmerLayout(),
            baseColor: Colors.grey[700],
            highlightColor: Colors.grey[100]),
        );
      },
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cW = 280;
    double cH = 50;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: cH,
                width: cW,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: cH,
                width: cW * 0.75,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: cH,
                width: cW * 0.75,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
