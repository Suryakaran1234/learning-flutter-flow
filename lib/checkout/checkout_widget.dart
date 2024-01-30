import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({
    super.key,
    required this.item,
  });

  final MenuItemsRecord? item;

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  late CheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tax = functions.getTwoDecimalPlaces(widget.item!.price * 0.13);
        _model.total = widget.item!.price + (_model.tax!);
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'My Cart',
            style: FlutterFlowTheme.of(context).displaySmall,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Below are the items in your cart.',
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x320E151B),
                                    offset: Offset(0.0, 1.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget.item?.name,
                                                  'No Name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              ),
                                            ),
                                            Text(
                                              formatNumber(
                                                widget.item!.price,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: '',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 16.0, 24.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Price Breakdown',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Taxes',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                Text(
                                  formatNumber(
                                    _model.tax,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 4.0, 24.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Total',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 36.0,
                                      icon: const Icon(
                                        Icons.info_outlined,
                                        color: Color(0xFF57636C),
                                        size: 18.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  formatNumber(
                                    _model.total,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x320E151B),
                    offset: Offset(0.0, -2.0),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final paymentResponse = await processStripePayment(
                      context,
                      amount: ((_model.total!) * 100).toInt(),
                      currency: 'CAD',
                      customerEmail: currentUserEmail,
                      customerName: currentUserDisplayName,
                      description: widget.item!.name,
                      allowGooglePay: false,
                      allowApplePay: false,
                      buttonColor: FlutterFlowTheme.of(context).primary,
                      buttonTextColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    );
                    if (paymentResponse.paymentId == null &&
                        paymentResponse.errorMessage != null) {
                      showSnackbar(
                        context,
                        'Error: ${paymentResponse.errorMessage}',
                      );
                    }
                    _model.paymentId = paymentResponse.paymentId ?? '';

                    setState(() {});
                  },
                  child: Text(
                    'Checkout${formatNumber(
                      _model.total,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                      currency: '',
                    )}',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
