import '/components/menu_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_list_widget.dart' show ProductListWidget;
import 'package:flutter/material.dart';

class ProductListModel extends FlutterFlowModel<ProductListWidget> {
  ///  Local state fields for this page.

  bool isEditing = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for menuItem dynamic component.
  late FlutterFlowDynamicModels<MenuItemModel> menuItemModels;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuItemModels = FlutterFlowDynamicModels(() => MenuItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuItemModels.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    priceFocusNode?.dispose();
    priceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
