import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  double? tax;

  double? total;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Stripe Payment] action in Text widget.
  String? paymentId;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
