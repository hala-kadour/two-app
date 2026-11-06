import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:two_client_app/config/constants/baseuri.dart';
import 'package:two_client_app/config/paths/text_strings.dart';

import 'signature_page.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  final String contractId;

  const PdfViewerPage({
    super.key,
    required this.pdfUrl,
    required this.contractId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextStrings.viewPdf),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_document),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SignaturePage(
                    pdfUrl: "$pdfUri$pdfUrl",
                    contractId: contractId,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SfPdfViewer.network("$pdfUri$pdfUrl"),
    );
  }
}
