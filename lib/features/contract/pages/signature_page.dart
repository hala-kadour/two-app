import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/core/widgets/buttons/elevated-button/main_gray_button.dart';
import 'package:two_client_app/core/widgets/buttons/elevated-button/main_green_button.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

class SignaturePage extends StatefulWidget {
  final String pdfUrl;
  final String contractId;
  const SignaturePage({
    super.key,
    required this.pdfUrl,
    required this.contractId,
  });

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TextStrings.signaturePage)),
      body: BlocListener<AppBloc, AppState>(
        listenWhen: (previous, current) =>
            previous.signContractStatus != current.signContractStatus,
        listener: (context, state) {
          AppBlocStateHandling().signContract(state, context);
        },
        child: Column(
          children: [
            Expanded(
              child: Signature(
                controller: _controller,
                backgroundColor: Colors.grey[200]!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: MainGrayButton(
                      text: TextStrings.clear,
                      onpressed: () => _controller.clear(),
                    ),
                  ),
                  PaddingConfig.w16,
                  Expanded(
                    child: MainGreenButton(
                      text: TextStrings.save,
                      onpressed: () async {
                        final bytes = await _controller.toPngBytes();

                        final imageB64 = base64Encode(bytes!);

                        context.read<AppBloc>().add(
                          SignContractEvent(
                            signature: imageB64,
                            contractId: widget.contractId,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
