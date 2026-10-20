# Company Lookup API

Company Lookup matches stock tickers, CIK numbers, company names, or SIC codes with official SEC registration records. It returns legal entity names, trading exchanges, tax EINs, Standard Industrial Classification codes, and registered business addresses.

[![npm version](https://img.shields.io/npm/v/@apiverve/companylookup.svg)](https://www.npmjs.com/package/@apiverve/companylookup)

This is a JavaScript wrapper for the [Company Lookup API](https://apiverve.com/marketplace/companylookup?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/companylookup
```

Using yarn:
```shell
yarn add @apiverve/companylookup
```

---

## Configuration

Before using the Company Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Company Lookup API documentation is found here: [https://docs.apiverve.com/ref/companylookup](https://docs.apiverve.com/ref/companylookup?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const companylookupAPI = require('@apiverve/companylookup');
const api = new companylookupAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  ticker: "AAPL"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  ticker: "AAPL"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  ticker: "AAPL"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
