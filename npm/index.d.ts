declare module '@apiverve/companylookup' {
  export interface companylookupOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface companylookupResponse {
    status: string;
    error: string | null;
    data: CompanyLookupData;
    code?: number;
  }


  interface CompanyLookupData {
      ticker:               string;
      cik:                  string;
      name:                 string;
      tickers:              string[];
      exchanges:            string[];
      entityType:           string;
      sic:                  string;
      sicDescription:       string;
      category:             string;
      stateOfIncorporation: string;
      fiscalYearEnd:        string;
      ein:                  string;
      phone:                string;
      addresses:            Addresses;
      formerNames:          any[];
  }
  
  interface Addresses {
      mailing:  Business;
      business: Business;
  }
  
  interface Business {
      street1:        string;
      city:           string;
      stateOrCountry: string;
      zipCode:        string;
  }

  export default class companylookupWrapper {
    constructor(options: companylookupOptions);

    execute(callback: (error: any, data: companylookupResponse | null) => void): Promise<companylookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: companylookupResponse | null) => void): Promise<companylookupResponse>;
    execute(query?: Record<string, any>): Promise<companylookupResponse>;
  }
}
