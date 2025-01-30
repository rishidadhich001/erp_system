import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../utils.dart';

Future<Uint8List> generatePdf(Map student) async {
  final netUrl = await networkImage(img);
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      orientation: pw.PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pw.Text('RED & WHITE ', style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold)),
              pw.Text(' Multimidea Education', style: const pw.TextStyle(
                  color: PdfColors.black, fontSize: 30)),
              pw.SizedBox(height: 30),
              pw.Container(
                  height: 200,
                  width: 200,
                  decoration: pw.BoxDecoration(
                    shape: pw.BoxShape.circle,
                    image: pw.DecorationImage(
                      image: student['image'] == null
                          ? netUrl
                          : pw.MemoryImage(student['image']),
                    ),
                  )),
              pw.SizedBox(height: 30),
              pw.Text(student['name'], style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold)),
              pw.Text(student['course'], style: const pw.TextStyle(
                  color: PdfColors.black, fontSize: 30)),
              pw.SizedBox(height: 30),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("Age         :" + student['age'],
                      style: const pw.TextStyle(
                          color: PdfColors.black, fontSize: 30)),
                  pw.SizedBox(height: 20),
                  pw.Text("Phone     :" + student['phone'],
                      style: const pw.TextStyle(
                          color: PdfColors.black, fontSize: 30)),
                  pw.SizedBox(height: 20),
                  pw.Text("Address  : " + student['address'],
                      style: const pw.TextStyle(
                          color: PdfColors.black, fontSize: 30)),
                ],
              ),
              pw.Spacer(),
              pw.Text('Red & White', style: pw.TextStyle(color: PdfColors.black,
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold)),
              pw.Text(' Contact no : +91 94848 42426', style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold)),
            ],
          ),
        );
      },
    ),
  );
  return await pdf.save();
}