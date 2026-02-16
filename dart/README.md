# Company Lookup API - Dart/Flutter Client

Company Lookup is a tool for retrieving metadata about SEC-registered public companies. Look up companies by ticker symbol, CIK number, company name, or SIC industry code. Returns company details including exchange, address, phone, and more.

[![pub package](https://img.shields.io/pub/v/apiverve_companylookup.svg)](https://pub.dev/packages/apiverve_companylookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Company Lookup API](https://apiverve.com/marketplace/companylookup?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_companylookup: ^1.1.14
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
    "category": "Large accelerated filer",
    "stateOfIncorporation": "CA",
    "fiscalYearEnd": "0928",
    "ein": "942404110",
    "phone": "408-996-1010",
    "addresses": {
      "mailing": {
        "street1": "ONE APPLE PARK WAY",
        "city": "CUPERTINO",
        "stateOrCountry": "CA",
        "zipCode": "95014"
      },
      "business": {
        "street1": "ONE APPLE PARK WAY",
        "city": "CUPERTINO",
        "stateOrCountry": "CA",
        "zipCode": "95014"
      }
    },
    "formerNames": []
  }
}
```

## API Reference

- **API Home:** [Company Lookup API](https://apiverve.com/marketplace/companylookup?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/companylookup](https://docs.apiverve.com/ref/companylookup?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
