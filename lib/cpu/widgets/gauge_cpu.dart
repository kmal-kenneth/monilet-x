// import 'package:flutter/material.dart';
// import 'package:monilet/ui/palette.dart';
// // import 'package:syncfusion_flutter_gauges/gauges.dart';

// class GaugeCpu extends StatelessWidget {
//   final double used;
//   final int frequency;
//   final int cores;

//   const GaugeCpu({
//     Key? key,
//     this.used = 0.0,
//     this.frequency = 0,
//     this.cores = 0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150,
//       width: 150,
//       child: SfRadialGauge(
//         axes: <RadialAxis>[
//           RadialAxis(
//               annotations: <GaugeAnnotation>[
//                 GaugeAnnotation(
//                     widget: Text('${used.toInt()}',
//                         style:
//                             TextStyle(fontSize: 26, color: Palette.grey[100])),
//                     angle: 270,
//                     positionFactor: 0.1),
//                 GaugeAnnotation(
//                     widget: Text('$cores',
//                         style:
//                             TextStyle(fontSize: 14, color: Palette.grey[300])),
//                     angle: 90,
//                     positionFactor: 0.3),
//                 GaugeAnnotation(
//                     widget: Text(
//                       buildFrequencyLabel(frequency),
//                       style: TextStyle(fontSize: 14, color: Palette.grey[200]),
//                       textAlign: TextAlign.center,
//                     ),
//                     angle: 90,
//                     positionFactor: 0.8)
//               ],
//               axisLabelStyle: GaugeTextStyle(
//                 color: Palette.grey[300],
//                 fontSize: 11,
//                 fontWeight: FontWeight.bold,
//               ),
//               axisLineStyle: AxisLineStyle(
//                 color: Palette.grey[800],
//                 cornerStyle: CornerStyle.bothCurve,
//                 thickness: 3,
//               ),
//               interval: 20,
//               labelOffset: 12,
//               majorTickStyle: MajorTickStyle(
//                   color: Palette.grey[300], thickness: 1, length: 4),
//               maximumLabels: 1,
//               minorTicksPerInterval: 3,
//               minorTickStyle: MinorTickStyle(
//                   color: Palette.grey[600], thickness: 1, length: 2),
//               startAngle: 140,
//               endAngle: 40,
//               tickOffset: 3,
//               pointers: <GaugePointer>[
//                 RangePointer(
//                   value: used,
//                   width: 3,
//                   enableAnimation: true,
//                   cornerStyle: CornerStyle.bothCurve,
//                   gradient: Palette.baseGradient,
//                 )
//               ]),
//         ],
//         enableLoadingAnimation: true,
//       ),
//     );
//   }

//   String buildFrequencyLabel(int frequency) {
//     if (frequency > 1000) {
//       return '${(frequency / 1000).toStringAsFixed(2)} GHz';
//     }
//     return '$frequency MHz';
//   }
// }
