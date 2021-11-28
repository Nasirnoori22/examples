import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter/material.dart';


class AnimationPage extends StatefulWidget {
  const AnimationPage({ Key? key }) : super(key: key);

  @override
  
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];
  final List<String> image = [
    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80"
  ];
  bool _isPlaying = true;

  CarouselSliderController? _sliderController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 500,
            child: CarouselSlider.builder(
                controller: _sliderController,
                unlimitedMode: true,
                initialPage: 0,
                slideBuilder: (index) {
                  return Container(
                    alignment: Alignment.center,
                    color: colors[index],
                    child:  Image(
                      fit: BoxFit.cover,
                      height: 500,
                      image: NetworkImage(
                        image[index]
                      ),
                    ),
                  );
                },
                slideTransform: CubeTransform(),
                slideIndicator: CircularSlideIndicator(
                  padding: EdgeInsets.only(bottom: 32),
                ),
                itemCount: colors.length),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
            child: Align(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 240, maxWidth: 600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 48,
                      icon: Icon(Icons.skip_previous),
                      onPressed: () {
                        _sliderController!.previousPage();
                      },
                    ),
                    IconButton(
                      iconSize: 64,
                      icon: Icon(
                        _isPlaying
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                      onPressed: () {
                        setState(() {
                            _isPlaying = !_isPlaying;
                            _sliderController!.setAutoSliderEnabled(_isPlaying);
                          },
                        );
                      },
                    ),
                    IconButton(
                      iconSize: 48,
                      icon: Icon(Icons.skip_next),
                      onPressed: () {
                        _sliderController!.nextPage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}