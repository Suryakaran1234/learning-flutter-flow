import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu_item_model.dart';
export 'menu_item_model.dart';

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget({
    super.key,
    required this.item,
  });

  final MenuItemsRecord? item;

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  late MenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuItemModel());

    _model.textController ??= TextEditingController(text: widget.item?.name);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x411D2429),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.isEditing == false)
                            Text(
                              valueOrDefault<String>(
                                widget.item?.name,
                                'No name',
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          if (_model.isEditing == true)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Edit Name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget.item?.description,
                            'No Description',
                          ).maybeHandleOverflow(
                            maxChars: 70,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.isEditing == false)
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: FaIcon(
                                FontAwesomeIcons.edit,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                setState(() {
                                  _model.isEditing = true;
                                });
                              },
                            ),
                          if (_model.isEditing == true)
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.done,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await widget.item!.reference
                                    .update(createMenuItemsRecordData(
                                  name: _model.textController.text,
                                ));
                                setState(() {
                                  _model.isEditing = false;
                                });
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.delete,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.item!.reference.delete();
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 4.0, 8.0),
                    child: Text(
                      formatNumber(
                        widget.item!.price,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.automatic,
                        currency: '',
                      ),
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 0.0,
                    borderWidth: 0.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.chevron_right,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'Checkout',
                        queryParameters: {
                          'item': serializeParam(
                            widget.item,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'item': widget.item,
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
