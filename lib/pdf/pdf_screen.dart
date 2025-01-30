import 'package:erp_system/pdf/pdf_generator.dart';
import 'package:erp_system/utils.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
class PdfScreen extends StatefulWidget {
   const PdfScreen({super.key,required});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail page'),
      ),
      body: PdfPreview(
       pdfFileName: 'Rishi Dadhich pdf',
        build: (format) => generatePdf(studentlist[listindex]),),
    );
  }
}
