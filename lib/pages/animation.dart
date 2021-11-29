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
    "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f8f7f02d1ae76ec7f52e593%2FApple--iPhone--new-iPhone--iPhone-12--iPhone-12-Pro--iPhone-12-Pro-Max--iPhone-12%2F960x0.jpg%3Ffit%3Dscale",
    "https://pplware.sapo.pt/wp-content/uploads/2020/04/iphone12_5g00.jpg",
    "https://s3-storage.textopus.nl/wp-content/uploads/2020/04/1241839/06085128/iphone-12-new.jpg",
    "https://s.hdnux.com/photos/01/14/75/46/20175275/3/rawImage.jpg",
    "https://www.cronachedellacampania.it/wp-content/uploads/2021/09/iphone13_rosso.jpg",
    "https://images.everyeye.it/img-notizie/iphone-13-13-mini-13-pro-13-pro-max-trapelano-capacita-batterie-v4-540609-900x900.webp",
    "https://www.telefonino.net/app/uploads/2021/07/iPhone-13-2.jpg"
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
        backgroundColor: Colors.black ,
        title: Text('Flutter Image Carousel Slider'),
        elevation: 0,
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
                slideTransform:DepthTransform(),
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