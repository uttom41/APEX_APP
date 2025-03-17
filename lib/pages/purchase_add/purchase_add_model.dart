
import 'package:flutter/material.dart';

import '../../core/base_entity.dart';
import '../../core/http/http_session.dart';

class PurchaseAddModel extends BaseEntity<PurchaseAddModel> {

  bool isLoading = true;
  ApiClient apiClient = ApiClient.instance;
  final TextEditingController itemController = TextEditingController();
  final TextEditingController storeController = TextEditingController();
  final TextEditingController runnerController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController cardNoController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

}