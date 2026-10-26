/// Response models for the Company Lookup API.

/// API Response wrapper.
class CompanylookupResponse {
  final String status;
  final dynamic error;
  final CompanylookupData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CompanylookupResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CompanylookupResponse.fromJson(Map<String, dynamic> json) => CompanylookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CompanylookupData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Company Lookup API.

class CompanylookupData {
  num? count;
  List<CompanylookupDataCompaniesItem>? companies;

  CompanylookupData({
    this.count,
    this.companies,
  });

  factory CompanylookupData.fromJson(Map<String, dynamic> json) => CompanylookupData(
      count: json['count'],
      companies: (json['companies'] as List?)?.map((e) => CompanylookupDataCompaniesItem.fromJson(e)).toList(),
    );
}

class CompanylookupDataCompaniesItem {
  String? ticker;
  String? cik;
  String? name;
  List<String>? tickers;
  List<String>? exchanges;
  String? entityType;
  String? sic;
  String? sicDescription;
  String? sector;
  String? category;
  String? stateOfIncorporation;
  String? fiscalYearEnd;
  String? ein;
  String? phone;
  CompanylookupDataCompaniesItemAddresses? addresses;
  List<CompanylookupDataCompaniesItemFormernamesItem>? formerNames;

  CompanylookupDataCompaniesItem({
    this.ticker,
    this.cik,
    this.name,
    this.tickers,
    this.exchanges,
    this.entityType,
    this.sic,
    this.sicDescription,
    this.sector,
    this.category,
    this.stateOfIncorporation,
    this.fiscalYearEnd,
    this.ein,
    this.phone,
    this.addresses,
    this.formerNames,
  });

  factory CompanylookupDataCompaniesItem.fromJson(Map<String, dynamic> json) => CompanylookupDataCompaniesItem(
      ticker: json['ticker'],
      cik: json['cik'],
      name: json['name'],
      tickers: (json['tickers'] as List?)?.cast<String>(),
      exchanges: (json['exchanges'] as List?)?.cast<String>(),
      entityType: json['entityType'],
      sic: json['sic'],
      sicDescription: json['sicDescription'],
      sector: json['sector'],
      category: json['category'],
      stateOfIncorporation: json['stateOfIncorporation'],
      fiscalYearEnd: json['fiscalYearEnd'],
      ein: json['ein'],
      phone: json['phone'],
      addresses: json['addresses'] != null ? CompanylookupDataCompaniesItemAddresses.fromJson(json['addresses']) : null,
      formerNames: (json['formerNames'] as List?)?.map((e) => CompanylookupDataCompaniesItemFormernamesItem.fromJson(e)).toList(),
    );
}

class CompanylookupDataCompaniesItemAddresses {
  CompanylookupDataCompaniesItemAddressesMailing? mailing;
  CompanylookupDataCompaniesItemAddressesBusiness? business;

  CompanylookupDataCompaniesItemAddresses({
    this.mailing,
    this.business,
  });

  factory CompanylookupDataCompaniesItemAddresses.fromJson(Map<String, dynamic> json) => CompanylookupDataCompaniesItemAddresses(
      mailing: json['mailing'] != null ? CompanylookupDataCompaniesItemAddressesMailing.fromJson(json['mailing']) : null,
      business: json['business'] != null ? CompanylookupDataCompaniesItemAddressesBusiness.fromJson(json['business']) : null,
    );
}

class CompanylookupDataCompaniesItemAddressesMailing {
  String? street1;
  dynamic street2;
  String? city;
  String? stateOrCountry;
  String? zipCode;
  String? stateOrCountryDescription;
  num? isForeignLocation;
  dynamic foreignStateTerritory;
  dynamic country;
  dynamic countryCode;

  CompanylookupDataCompaniesItemAddressesMailing({
    this.street1,
    this.street2,
    this.city,
    this.stateOrCountry,
    this.zipCode,
    this.stateOrCountryDescription,
    this.isForeignLocation,
    this.foreignStateTerritory,
    this.country,
    this.countryCode,
  });

  factory CompanylookupDataCompaniesItemAddressesMailing.fromJson(Map<String, dynamic> json) => CompanylookupDataCompaniesItemAddressesMailing(
      street1: json['street1'],
      street2: json['street2'],
      city: json['city'],
      stateOrCountry: json['stateOrCountry'],
      zipCode: json['zipCode'],
      stateOrCountryDescription: json['stateOrCountryDescription'],
      isForeignLocation: json['isForeignLocation'],
      foreignStateTerritory: json['foreignStateTerritory'],
      country: json['country'],
      countryCode: json['countryCode'],
    );
}

class CompanylookupDataCompaniesItemAddressesBusiness {
  String? street1;
  dynamic street2;
  String? city;
  String? stateOrCountry;
  String? zipCode;
  String? stateOrCountryDescription;
  dynamic isForeignLocation;
  dynamic foreignStateTerritory;
  dynamic country;
  dynamic countryCode;

  CompanylookupDataCompaniesItemAddressesBusiness({
    this.street1,
    this.street2,
    this.city,
    this.stateOrCountry,
    this.zipCode,
    this.stateOrCountryDescription,
    this.isForeignLocation,
    this.foreignStateTerritory,
    this.country,
    this.countryCode,
  });

  factory CompanylookupDataCompaniesItemAddressesBusiness.fromJson(Map<String, dynamic> json) => CompanylookupDataCompaniesItemAddressesBusiness(
      street1: json['street1'],
      street2: json['street2'],
      city: json['city'],
      stateOrCountry: json['stateOrCountry'],
      zipCode: json['zipCode'],
      stateOrCountryDescription: json['stateOrCountryDescription'],
      isForeignLocation: json['isForeignLocation'],
      foreignStateTerritory: json['foreignStateTerritory'],
      country: json['country'],
      countryCode: json['countryCode'],
    );
}

class CompanylookupDataCompaniesItemFormernamesItem {
  String? name;
  String? from;
  String? to;

  CompanylookupDataCompaniesItemFormernamesItem({
    this.name,
    this.from,
    this.to,
  });

  factory CompanylookupDataCompaniesItemFormernamesItem.fromJson(Map<String, dynamic> json) => CompanylookupDataCompaniesItemFormernamesItem(
      name: json['name'],
      from: json['from'],
      to: json['to'],
    );
}

class CompanylookupRequest {
  String ticker;

  CompanylookupRequest({
    required this.ticker,
  });

  Map<String, dynamic> toJson() => {
      'ticker': ticker,
    };
}
