# Company Lookup API - Dart/Flutter Client

Company Lookup matches stock tickers, CIK numbers, company names, or SIC codes with official SEC registration records. It returns legal entity names, trading exchanges, tax EINs, Standard Industrial Classification codes, and registered business addresses.

[![pub package](https://img.shields.io/pub/v/apiverve_companylookup.svg)](https://pub.dev/packages/apiverve_companylookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Company Lookup API](https://apiverve.com/marketplace/companylookup?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_companylookup: ^1.2.3
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_companylookup/apiverve_companylookup.dart';

void main() async {
  final client = CompanylookupClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'ticker': 'AAPL'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "count": 1,
    "companies": [
      {
        "ticker": "AAPL",
        "cik": "0000320193",
        "name": "Apple Inc.",
        "tickers": [
          "AAPL"
        ],
        "exchanges": [
          "Nasdaq"
        ],
        "entityType": "operating",
        "sic": "3571",
        "sicDescription": "Electronic Computers",
        "sector": "Manufacturing",
        "category": "Large accelerated filer",
        "stateOfIncorporation": "CA",
        "fiscalYearEnd": "0926",
        "ein": "942404110",
        "phone": "(408) 996-1010",
        "addresses": {
          "mailing": {
            "street1": "ONE APPLE PARK WAY",
            "street2": null,
            "city": "CUPERTINO",
            "stateOrCountry": "CA",
            "zipCode": "95014",
            "stateOrCountryDescription": "CA",
            "isForeignLocation": 0,
            "foreignStateTerritory": null,
            "country": null,
            "countryCode": null
          },
          "business": {
            "street1": "ONE APPLE PARK WAY",
            "street2": null,
            "city": "CUPERTINO",
            "stateOrCountry": "CA",
            "zipCode": "95014",
            "stateOrCountryDescription": "CA",
            "isForeignLocation": null,
            "foreignStateTerritory": null,
            "country": null,
            "countryCode": null
          }
        },
        "formerNames": [
          {
            "name": "APPLE INC",
            "from": "2007-01-10T05:00:00.000Z",
            "to": "2019-08-05T04:00:00.000Z"
          },
          {
            "name": "APPLE COMPUTER INC",
            "from": "1994-01-26T05:00:00.000Z",
            "to": "2007-01-04T05:00:00.000Z"
          },
          {
            "name": "APPLE COMPUTER INC/ FA",
            "from": "1997-07-28T04:00:00.000Z",
            "to": "1997-07-28T04:00:00.000Z"
          }
        ]
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Company Lookup API](https://apiverve.com/marketplace/companylookup?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/companylookup](https://docs.apiverve.com/ref/companylookup?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
