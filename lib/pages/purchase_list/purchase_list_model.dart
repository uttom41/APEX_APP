

import 'package:apex_dmit/core/http/http_session.dart';
import 'package:apex_dmit/pages/purchase_list/purchase_entity.dart';

import '../../core/base_entity.dart';

class PurchaseListModel extends BaseEntity<PurchaseListModel> {

  bool isLoading = true;
  ApiClient apiClient = ApiClient.instance;
  MaterialPurchaseResponse? purchaseResponse;

}