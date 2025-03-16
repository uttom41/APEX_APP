class MaterialPurchaseResponse {
  final String statusCode;
  final String statusMessage;
  final MaterialPurchaseList materialPurchaseList;

  MaterialPurchaseResponse({
    required this.statusCode,
    required this.statusMessage,
    required this.materialPurchaseList,
  });

  factory MaterialPurchaseResponse.fromJson(Map<String, dynamic> json) {
    return MaterialPurchaseResponse(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
      materialPurchaseList: MaterialPurchaseList.fromJson(json['material_purchase_list']),
    );
  }
}

class MaterialPurchaseList {
  final int currentPage;
  final List<MaterialPurchase> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  MaterialPurchaseList({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory MaterialPurchaseList.fromJson(Map<String, dynamic> json) {
    return MaterialPurchaseList(
      currentPage: json['current_page'],
      data: (json['data'] as List).map((e) => MaterialPurchase.fromJson(e)).toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List).map((e) => Link.fromJson(e)).toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class MaterialPurchase {
  final int id;
  final String lineItemName;
  final String store;
  final String runnersName;
  final double amount;
  final String cardNumber;
  final DateTime transactionDate;

  MaterialPurchase({
    required this.id,
    required this.lineItemName,
    required this.store,
    required this.runnersName,
    required this.amount,
    required this.cardNumber,
    required this.transactionDate,
  });

  factory MaterialPurchase.fromJson(Map<String, dynamic> json) {
    return MaterialPurchase(
      id: json['id'],
      lineItemName: json['line_item_name'],
      store: json['store'],
      runnersName: json['runners_name'],
      amount: (json['amount'] as num).toDouble(),
      cardNumber: json['card_number'],
      transactionDate: DateTime.parse(json['transaction_date']),
    );
  }
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
