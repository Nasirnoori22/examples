import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';


class Photo extends StatefulWidget {
  const Photo({ Key? key }) : super(key: key);

  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("My Private Photos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GalleryImage(
              imageUrls: [
                "https://media.istockphoto.com/photos/womens-hand-typing-on-mobile-smartphone-live-chat-chatting-on-web-picture-id1217093906?b=1&k=20&m=1217093906&s=170667a&w=0&h=BhzxqKtMYeA3qvnMv8Tvu6xh1X_xssmMOTcKb0BDuOQ=",
                "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
                "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
              ],
            ),
            GalleryImage(
              imageUrls: [
                "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
                "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
                "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
              ],
            ),
            GalleryImage(
              imageUrls: [
                "https://cdn.pixabay.com/photo/2014/11/13/06/12/boy-529067__340.jpg",
                "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
                "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
                
              ],
            ),
            GalleryImage(
              imageUrls: [
                "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
                "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
                "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
                
              ],
            ),
            GalleryImage(
              imageUrls: [
                "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
                "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
                "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
              ],
            ),
            GalleryImage(
              imageUrls: [
                "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
                "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
                "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
                "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
                "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
                "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
                "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
                "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
                "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
                "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
              ],
            ),
          ],
        ),
      ),
    );
  }
}