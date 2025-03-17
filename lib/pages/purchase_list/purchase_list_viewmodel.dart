
import 'package:apex_dmit/core/http/response.dart';
import 'package:apex_dmit/pages/purchase_list/index.dart';
import 'package:flutter/cupertino.dart';

import '../../core/base_viewmodel.dart';

class PurchaseListViewmodel extends BaseViewModel<PurchaseListModel> {
  late PurchaseListModel _entity;
  final ScrollController productGridScrollController = ScrollController();
  @override
  void buildProps() {

  }

  @override
  void initState() {
    _entity = getEntity();
    fetchData();
  }
  MaterialPurchaseResponse? get purchaseResponse => getEntity().purchaseResponse;

  void fetchData() async{
   DResponse data = await _entity.apiClient.get("auth/interview/material-purchase",queryParameters: {"page":1 });
   _entity.purchaseResponse = MaterialPurchaseResponse.fromJson(data.data);
   _entity.isLoading = false;
   updateEntity(_entity);

  }

  void setIsLoading(bool status) {
    _entity.isLoading = status;
    updateEntity(_entity);
  }

  bool get isLoading => getEntity().isLoading;

  void setIsMenuOpen(bool status) {
    _entity.isMenuOpen = status;
    updateEntity(_entity);
  }

  bool get isMenuOpen => getEntity().isMenuOpen;
}