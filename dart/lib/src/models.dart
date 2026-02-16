/// Response models for the Company Lookup API.

/// API Response wrapper.
class CompanylookupResponse {
  final String status;
  final dynamic error;
  final CompanylookupData? data;

  CompanylookupResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory CompanylookupResponse.fromJson(Map<String, dynamic> json) => CompanylookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CompanylookupData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Company Lookup API.

class CompanylookupData {
  String? ticker;
  String? cik;
  String? name;
  List<String>? tickers;
  List<String>? exchanges;
  String? entityType;
  String? sic;
  String? sicDescription;
  String? category;
  String? stateOfIncorporation;
  String? fiscalYearEnd;
  String? ein;
  String? phone;
  CompanylookupDataAddresses? addresses;
  List<dynamic>? formerNames;

  CompanylookupData({
    this.ticker,
    this.cik,
    this.name,
    this.tickers,
    this.exchanges,
    this.entityType,
    this.sic,
    this.sicDescription,
    this.category,
    this.stateOfIncorporation,
    this.fiscalYearEnd,
    this.ein,
    this.phone,
    this.addresses,
    this.formerNames,
  });

  factory CompanylookupData.fromJson(Map<String, dynamic> json) => CompanylookupData(
      ticker: json['ticker'],
      cik: json['cik'],
      name: json['name'],
      tickers: (json['tickers'] as List?)?.cast<String>(),
      exchanges: (json['exchanges'] as List?)?.cast<String>(),
      entityType: json['entityType'],
      sic: json['sic'],
      sicDescription: json['sicDescription'],
      category: json['category'],
      stateOfIncorporation: json['stateOfIncorporation'],
      fiscalYearEnd: json['fiscalYearEnd'],
      ein: json['ein'],
      phone: json['phone'],
      addresses: json['addresses'] != null ? CompanylookupDataAddresses.fromJson(json['addresses']) : null,
      formerNames: (json['formerNames'] as List?)?.cast<dynamic>(),
    );
}

class CompanylookupDataAddresses {
  CompanylookupDataAddressesMailing? mailing;
  CompanylookupDataAddressesBusiness? business;

  CompanylookupDataAddresses({
    this.mailing,
    this.business,
  });

  factory CompanylookupDataAddresses.fromJson(Map<String, dynamic> json) => CompanylookupDataAddresses(
      mailing: json['mailing'] != null ? CompanylookupDataAddressesMailing.fromJson(json['mailing']) : null,
      business: json['business'] != null ? CompanylookupDataAddressesBusiness.fromJson(json['business']) : null,
    );
}

class CompanylookupDataAddressesMailing {
  String? street1;
  String? city;
  String? stateOrCountry;
  String? zipCode;

  CompanylookupDataAddressesMailing({
    this.street1,
    this.city,
    this.stateOrCountry,
    this.zipCode,
  });

  factory CompanylookupDataAddressesMailing.fromJson(Map<String, dynamic> json) => CompanylookupDataAddressesMailing(
      street1: json['street1'],
      city: json['city'],
      stateOrCountry: json['stateOrCountry'],
      zipCode: json['zipCode'],
    );
}

class CompanylookupDataAddressesBusiness {
  String? street1;
  String? city;
  String? stateOrCountry;
  String? zipCode;

  CompanylookupDataAddressesBusiness({
    this.street1,
    this.city,
    this.stateOrCountry,
    this.zipCode,
  });

  factory CompanylookupDataAddressesBusiness.fromJson(Map<String, dynamic> json) => CompanylookupDataAddressesBusiness(
      street1: json['street1'],
      city: json['city'],
      stateOrCountry: json['stateOrCountry'],
      zipCode: json['zipCode'],
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
