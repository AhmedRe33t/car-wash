import 'package:carwashing/features/standered_wash/presentation/widgets/utils.dart';
import 'package:flutter/material.dart';

class CustomSliderThem extends StatefulWidget {
   CustomSliderThem({super.key});

  @override
  State<CustomSliderThem> createState() => _CustomSliderThemState();
}

class _CustomSliderThemState extends State<CustomSliderThem> {
     final Color activeColor=Colors.amber;

     final Color inActiveColor=Colors.grey;

     final double thumReduies=14;

     final double tickMarkReduies=14;
     int indexTop=0;

      double valu=0;
    final List<num>nums=[1,2,3];
  @override
  Widget build(BuildContext context) {
    final labels=['1','2','3'];
    return customSlider(labels);
  }

  Column customSlider(List<String> labels) {
    return Column(
    children: [
      Container(
        margin:const EdgeInsets.symmetric(horizontal: 10),

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: 
            Utils.modelBuilder(
              labels, (index,labels){
                final selectedColor=Colors.amber;
                final unselectedColor=Colors.grey;

                final isSelected=index<=indexTop;

                final color=isSelected?selectedColor:unselectedColor;
                return buildLabel(label: labels, width: 30, color: color);
              })
          ,
        ) ,
      ),
      SliderTheme(
        data: SliderThemeData(
          trackHeight: 5,
          inactiveTickMarkColor: inActiveColor,
          inactiveTrackColor: inActiveColor,
          thumbColor: activeColor,
          activeTickMarkColor: activeColor,
          activeTrackColor: activeColor,
          thumbShape: RoundSliderThumbShape(
            disabledThumbRadius: thumReduies,
            enabledThumbRadius: thumReduies,
          ),
          rangeThumbShape: RoundRangeSliderThumbShape(
            disabledThumbRadius: thumReduies,
            enabledThumbRadius: thumReduies
          ),
          tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: tickMarkReduies)
      
        ),
         child: Slider(
          max: 2,
          min: 0,
          //label: valu.round().toString(),
          divisions: 2,
          value:indexTop.toDouble() ,
           onChanged: (value)=>setState(() =>
            
           this.indexTop =value.toInt()))),
    ],
  );
  }
}
Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      Container(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );
