import 'package:fibonacci_display/entities/fibonacci_number_entity.dart';
import 'package:fibonacci_display/enums/fibonacci_type.dart';
import 'package:fibonacci_display/utils/fibonacci_util.dart';
import 'package:fibonacci_display/widgets/fibo_bottom_sheet.dart';
import 'package:fibonacci_display/widgets/fibonacci_card.dart';
import 'package:flutter/material.dart';

class FibonacciDisplayScreen extends StatefulWidget {
  const FibonacciDisplayScreen({super.key});

  @override
  State<FibonacciDisplayScreen> createState() => _FibonacciDisplayScreenState();
}

class _FibonacciDisplayScreenState extends State<FibonacciDisplayScreen> {
  List<FibonacciNumberEntity> mainFiboList = List.empty(growable: true);
  Map<FibonacciType, List<FibonacciNumberEntity>> fibosTypeBottomSheetMap = {};
  FibonacciNumberEntity? selectedItem;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _initMainFiboList();
    _initSheetMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("fibonacci display"),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: mainFiboList.length,
        itemBuilder: (context, index) {
          final item = mainFiboList[index];

          return FibonacciCard(
            key: item.key,
            fibo: item,
            isSelected: item.key == selectedItem?.key,
            onTap: () async {
              setState(() {
                _handleCardTapped(item, index);
              });
            },
          );
        },
      ),
    );
  }

  void _initMainFiboList() {
    mainFiboList = List.from(FibonacciUtil.getFibonacciNumbers());
  }

  void _initSheetMap() {
    final allType = FibonacciType.values.toList();

    for (var type in allType) {
      fibosTypeBottomSheetMap.addAll({type: []});
    }
  }

  void _handleCardTapped(FibonacciNumberEntity item, int index) {
    mainFiboList.removeWhere((fibo) => fibo.key == item.key);
    fibosTypeBottomSheetMap[item.type]!.add(item);

    showModalBottomSheet(
      context: context,
      builder: (context) => FiboBottomSheet(
        widgets: [
          ...fibosTypeBottomSheetMap[item.type]!.map((fibo) => FibonacciCard(
              fibo: fibo,
              isSelected: fibo.key == item.key,
              onTap: () {
                setState(() {
                  final indexForInsert = mainFiboList
                      .indexWhere((mainFibo) => mainFibo.number >= fibo.number);

                  if (indexForInsert == -1) {
                    mainFiboList.add(fibo);
                  } else {
                    mainFiboList.insert(indexForInsert, fibo);
                  }

                  fibosTypeBottomSheetMap[item.type]!
                      .removeWhere((e) => e.key == fibo.key);

                  selectedItem = fibo;
                  _scrollToItem(indexForInsert);
                });

                Navigator.pop(context);
              }))
        ],
      ),
    );
  }

  void _scrollToItem(int itemIndex) {
    final contentSize = _scrollController.position.viewportDimension +
        _scrollController.position.maxScrollExtent;

    final target = contentSize * itemIndex / mainFiboList.length;
    _scrollController.position.animateTo(
      target,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}
