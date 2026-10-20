Company Lookup API
============

Company Lookup matches stock tickers, CIK numbers, company names, or SIC codes with official SEC registration records. It returns legal entity names, trading exchanges, tax EINs, Standard Industrial Classification codes, and registered business addresses.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-companylookup.svg)](https://pypi.org/project/apiverve-companylookup/)

This is a Python wrapper for the [Company Lookup API](https://apiverve.com/marketplace/companylookup?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-companylookup
```

Using `pip3`:

```bash
pip3 install apiverve-companylookup
```

---

## Configuration

Before using the Company Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_companylookup.apiClient import CompanylookupAPIClient

# Initialize the client with your APIVerve API key
api = CompanylookupAPIClient("[YOUR_API_KEY]")

query = { "ticker": "AAPL" }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Company Lookup API documentation is found here: [https://docs.apiverve.com/ref/companylookup](https://docs.apiverve.com/ref/companylookup?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_companylookup.apiClient import CompanylookupAPIClient

# Initialize the client with your APIVerve API key
api = CompanylookupAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "ticker": "AAPL" }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `CompanylookupAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_companylookup.apiClient import CompanylookupAPIClient, CompanylookupAPIClientError

api = CompanylookupAPIClient("[YOUR_API_KEY]")

query = { "ticker": "AAPL" }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except CompanylookupAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_companylookup.apiClient import CompanylookupAPIClient, CompanylookupAPIClientError

api = CompanylookupAPIClient("[YOUR_API_KEY]")

query = { "ticker": "AAPL" }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except CompanylookupAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_companylookup.apiClient import CompanylookupAPIClient, CompanylookupAPIClientError

query = { "ticker": "AAPL" }

# Using context manager ensures proper cleanup
with CompanylookupAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except CompanylookupAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_companylookup.apiClient import CompanylookupAPIClient

# Enable debug mode
api = CompanylookupAPIClient("[YOUR_API_KEY]", debug=True)

query = { "ticker": "AAPL" }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_companylookup.apiClient import CompanylookupAPIClient

api = CompanylookupAPIClient("[YOUR_API_KEY]")

query = { "ticker": "AAPL" }

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
