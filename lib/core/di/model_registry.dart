import 'package:apex_dmit/pages/purchase_list/index.dart';

import '../../main.dart';
import '../../pages/login/login_model.dart';

void setupModelLocator() {
  getIt.registerFactory(() => LoginModel());
  getIt.registerFactory(() => PurchaseListModel());
}