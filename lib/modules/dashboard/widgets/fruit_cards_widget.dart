import 'package:flutter/material.dart';
import 'package:flutter_take_home_test/lib.dart';

class FruitCardsWidget extends StatefulWidget {
  final FruitsData? data;

  const FruitCardsWidget({Key? key, this.data}) : super(key: key);

  @override
  State<FruitCardsWidget> createState() => _FruitCardsWidgetState();
}

class _FruitCardsWidgetState extends State<FruitCardsWidget> {
  List<Fruit> _fruits = [];
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _fruits = widget.data?.fruits ?? [];
  }

  void _onTapFruitCard(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getImage(String fruitName) {
    var imageRef = widget.data?.imagesReferences;

    switch (fruitName) {
      case "apple":
        return imageRef?.apple ?? "";

      case "manggo":
        return imageRef?.manggo ?? "";

      case "banana":
        return imageRef?.banana ?? "";

      case "avocado":
        return imageRef?.avocado ?? "";

      case "melon":
        return imageRef?.melon ?? "";
    }

    return "";
  }

  String _getFrequentFruits() {
    var frequent = {};

    for (int i = 0; i < _fruits.length; i++) {
      if (!frequent.containsKey(_fruits[i].name)) {
        frequent[_fruits[i].name] = 1;
      } else {
        frequent[_fruits[i].name] += 1;
      }
    }

    var frequentList = frequent.keys.toList()
      ..sort((a, b) => frequent[b].compareTo(frequent[a]));

    return "${frequentList[0]} total is ${frequent[frequentList[0]]}";
  }

  void _onPressNormalButton() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(_getFrequentFruits()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: _fruits.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _onTapFruitCard(index);
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_fruits[index].name ?? ""),
                      Text("Total Rp. ${_fruits[index].price ?? 0}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        AppDimens.verticalSpace16,
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: _selectedIndex == -1
                      ? const SizedBox()
                      : Image.network(
                          _getImage(_fruits[_selectedIndex].name ?? ""),
                          fit: BoxFit.fitHeight,
                          errorBuilder: (_, __, ___) {
                            return Image.network(
                              defaultImage,
                              fit: BoxFit.fitWidth,
                            );
                          },
                          loadingBuilder: (_, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                ),
              ),
              AppDimens.verticalSpace16,
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      _onPressNormalButton();
                    },
                    child: const Text("Normal"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
