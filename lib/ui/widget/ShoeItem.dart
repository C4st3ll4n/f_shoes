import 'package:flutter/material.dart';
import 'package:fshoes/model/Shoe.dart';
import 'package:simple_animations/simple_animations.dart';

class ShoeItem extends StatefulWidget {
  final Shoe shoe;
  final int currentIndex;
  final int index;

  const ShoeItem({Key key, this.shoe, this.currentIndex = 0, this.index = 0})
      : super(key: key);

  @override
  _ShoeItemState createState() => _ShoeItemState();
}

class _ShoeItemState extends State<ShoeItem> {
  MultiTrackTween tween;

  @override
  void initState() {
    super.initState();

    tween = MultiTrackTween(
      [
        Track("rotate").add(
            Duration(milliseconds: 300), Tween<double>(begin: -0.6, end: 0.0),
            curve: Curves.easeInCubic),
        Track("position").add(
            Duration(milliseconds: 300), Tween<double>(begin: -100, end: -20),
            curve: Curves.easeInOutCubic),
        Track("scale").add(
            Duration(milliseconds: 200), Tween<double>(begin: 0, end: 1),
            curve: Curves.easeInCubic),
        Track("opacity").add(
            Duration(milliseconds: 100), Tween<double>(begin: 0, end: 1),
            curve: Curves.easeInCubic),
        Track("transform-rotate").add(
            Duration(milliseconds: 200), Tween<double>(begin: 0.5, end: 0),
            curve: Curves.easeInCubic),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          ControlledAnimation(
            playback: widget.index == widget.currentIndex
                ? Playback.PLAY_FORWARD
                : Playback.PLAY_REVERSE,
            duration: tween.duration,
            tween: tween,
            builder: (ctx, anim) {
              return Transform(
                child: Hero(
                  tag: 'Circle' + widget.shoe.name,
                  child: Container(
                    width: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: RadialGradient(colors: [
                          widget.shoe.color.withOpacity(0.4),
                          widget.shoe.color
                        ])),
                  ),
                ),
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(anim['transform-rotate'])
                  ..rotateY(anim['transform-rotate']),
              );
            },
          ),
          ControlledAnimation(
            playback: widget.index == widget.currentIndex
                ? Playback.PLAY_FORWARD
                : Playback.PLAY_REVERSE,
            duration: tween.duration,
            tween: tween,
            builder: (ctx, anim) {
              return Transform(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Hero(
                                tag: 'Marca' + widget.shoe.name,
                                child: Text(
                                  widget.shoe.name.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                          Hero(
                            tag: 'favorite' + widget.shoe.name,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                          Hero(
                            tag: 'Nome' + widget.shoe.name,
                            child: Text(
                              widget.shoe.name.toUpperCase(),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Hero(
                            tag: 'Preco' + widget.shoe.name,
                            child: Text(
                              widget.shoe.price.toUpperCase(),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(anim['transform-rotate'])
                  ..rotateY(anim['transform-rotate']),
              );
            },
          ),
          ControlledAnimation(
            playback: widget.index == widget.currentIndex
                ? Playback.PLAY_FORWARD
                : Playback.PLAY_REVERSE,
            duration: tween.duration,
            tween: tween,
            builder: (ctx, anim) {
              return Positioned(
                right: anim['position'],
                child: Opacity(
                  opacity: anim['opacity'],
                  child: Transform.scale(
                    scale: anim['scale'],
                    child: Transform.rotate(
                      angle: anim['rotate'],
                      child: Hero(
                        tag: 'img' + widget.shoe.name,
                        child: Image.network(
                          widget.shoe.img,
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
