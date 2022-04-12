class CoinList {
  CoinList({
    this.id,
    this.name,
    this.symbol,
    this.coinType,
    this.percentChange24H,
    //  this.marketCap,
    this.the24High,
    this.the24Low,
    //  this.tradingVolume,
    this.currencySymbol,
    this.price,
    this.logo,
    this.barcodeLink,
    this.address,
    this.userBalance,
    this.fiatBalance,
    this.feePercent,
  });

  String? id;
  String? name;
  String? symbol;
  String? coinType;
  String? percentChange24H;
//  String? marketCap;
  int? the24High;
  int? the24Low;
  // double? tradingVolume;
  String? currencySymbol;
  String? price;
  String? logo;
  String? barcodeLink;
  String? address;
  String? userBalance;
  int? fiatBalance;
  String? feePercent;

  factory CoinList.fromJson(Map<String, dynamic> json) => CoinList(
        id: json["id"],
        name: json["name"] ?? '',
        symbol: json["symbol"],
        coinType: json["coin_type"] ?? '',
        percentChange24H: json["percent_change_24h"],
        the24High: json["24_high"],
        the24Low: json["24_low"],
        currencySymbol: json["currency_symbol"] ?? '',
        price: json["price"],
        logo: json["logo"] ?? ''.toString(),
        barcodeLink: json["barcode_link"],
        address: json["address"],
        userBalance: json["user_balance"],
        fiatBalance: json["fiat_balance"],
        feePercent: json["fee_percent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "coin_type": coinType,
        "percent_change_24h": percentChange24H,
        "24_high": the24High,
        "24_low": the24Low,
        "currency_symbol": currencySymbol,
        "price": price,
        "logo": logo,
        "barcode_link": barcodeLink,
        "address": address,
        "user_balance": userBalance,
        "fiat_balance": fiatBalance,
        "fee_percent": feePercent,
      };
}
