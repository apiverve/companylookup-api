# Company Lookup API - PHP Package

Company Lookup is a tool for retrieving metadata about SEC-registered public companies. Look up companies by ticker symbol, CIK number, company name, or SIC industry code. Returns company details including exchange, address, phone, and more.

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/companylookup?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/companylookup?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/companylookup?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
