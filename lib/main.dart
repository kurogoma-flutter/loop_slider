import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Loop Slider'),
    );
  }
}

final List<String> images = [
  'assets/kodai_sacabambaspis.png',
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const _CarouselSlider(),
          Container(
            height: 180,
            width: 120,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                )
              ],
            ),
            child: InkWell(
              onTap: () {
                // ボトムシート表示
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const _BottomSheetWidget(),
                );
              },
              child: const Center(
                child: Text(
                  'Click me!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            width: double.maxFinite,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _CarouselSlider extends StatelessWidget {
  const _CarouselSlider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: SizedBox(
        height: 180,
        child: CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return _CarouselCard(image: images[itemIndex]);
          },
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.35, // カルーセルの横幅を管理します
          ),
        ),
      ),
    );
  }
}

class _CarouselCard extends StatelessWidget {
  const _CarouselCard({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

/// ボトムシートの定義
class _BottomSheetWidget extends StatelessWidget {
  const _BottomSheetWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.maxFinite,
      // 上だけ丸める
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Color.fromARGB(42, 255, 255, 255),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            _CarouselSlider(),
          ],
        ),
      ),
    );
  }
}
