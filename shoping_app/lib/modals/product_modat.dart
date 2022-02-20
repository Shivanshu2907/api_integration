class ProductModal {
  late final String prodImage;
  late final String prodId;
  late final String prod_combo;
  late final String prodCode;
  late final String barCode;
  late final String prodName;
  late final String uom;
  late final String unit_id;
  late final String is_focused;
  late final String group_ids;
  late final String category_ids;
  late final String unit_from_value;
  late final String unit_to_value;
  late final String uom_alternate_name;
  late final String uom_alternate_id;
  late final String under_warranty;
  late final String groupId;
  late final String catId;
  late final String prodHsnId;
  late final String prodHsnCode;
  late final String prodShortName;
  late final String prodPrice;
  late final String prodMrp;
  late final String prodBuy;
  late final String prodSell;
  late final String prodFreeItem;
  late final String prodRkPrice;

  ProductModal({
    required this.uom,
    required this.barCode,
    required this.catId,
    required this.category_ids,
    required this.groupId,
    required this.group_ids,
    required this.is_focused,
    required this.prodBuy,
    required this.prodCode,
    required this.prodFreeItem,
    required this.prodHsnCode,
    required this.prodHsnId,
    required this.prodId,
    required this.prodImage,
    required this.prodMrp,
    required this.prodName,
    required this.prodPrice,
    required this.prodRkPrice,
    required this.prodSell,
    required this.prodShortName,
    required this.prod_combo,
    required this.under_warranty,
    required this.unit_from_value,
    required this.unit_id,
    required this.unit_to_value,
    required this.uom_alternate_id,
    required this.uom_alternate_name,
  });

  ProductModal.fromJSON(Map<String, dynamic> json)
      : prodImage = json['prodImage'],
        prodId = json['prodId'],
        prod_combo = json['prod_combo'],
        prodCode = json['prodCode'],
        barCode = json['barCode'],
        prodName = json['prodName'],
        uom = json['UOM'],
        unit_id = json['unit_id'],
        is_focused = json['is_focused'],
        group_ids = json['group_ids'],
        category_ids = json['category_ids'],
        unit_from_value = json['unit_from_value'],
        unit_to_value = json['unit_to_value'],
        uom_alternate_name = json['uom_alternate_name'],
        uom_alternate_id = json['uom_alternate_id'],
        under_warranty = json['under_warranty'],
        groupId = json['groupId'],
        catId = json['catId'],
        prodHsnId = json['prodHsnId'],
        prodHsnCode = json['prodHsnCode'],
        prodShortName = json['prodShortName'],
        prodPrice = json['prodPrice'],
        prodMrp = json['prodMrp'],
        prodBuy = json['prodBuy'],
        prodSell = json['prodSell'],
        prodFreeItem = json['prodFreeItem'],
        prodRkPrice = json['prodRkPrice'];
}
