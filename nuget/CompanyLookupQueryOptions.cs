using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.CompanyLookup
{
    /// <summary>
    /// Query options for the Company Lookup API
    /// </summary>
    public class CompanyLookupQueryOptions
    {
        /// <summary>
        /// Stock ticker symbol (e.g. AAPL, MSFT, GOOGL)
        /// </summary>
        [JsonProperty("ticker")]
        public string Ticker { get; set; }
    }
}
