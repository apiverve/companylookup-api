# Company Lookup API - PHP Package

Company Lookup matches stock tickers, CIK numbers, company names, or SIC codes with official SEC registration records. It returns legal entity names, trading exchanges, tax EINs, Standard Industrial Classification codes, and registered business addresses.

## Installation

Install via Composer:

```bash
composer require apiverve/companylookup
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Companylookup\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['ticker' => 'AAPL']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Companylookup\Client;
use APIVerve\Companylookup\Exceptions\APIException;
use APIVerve\Companylookup\Exceptions\ValidationException;

try {
    $response = $client->execute(['ticker' => 'AAPL']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/companylookup?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/companylookup?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/companylookup?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
