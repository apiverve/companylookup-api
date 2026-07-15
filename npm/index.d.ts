declare module '@apiverve/companylookup' {
  export interface companylookupOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface companylookupResponse {
    status: string;
    error: string | null;
    data: CompanyLookupData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CompanyLookupData {
      ticker:               null | string;
      cik:                  null | string;
      name:                 null | string;
      tickers:              (null | string)[];
      exchanges:            (null | string)[];
      entityType:           null | string;
      sic:                  null | string;
      sicDescription:       null | string;
      sector:               null | string;
      category:             null | string;
      stateOfIncorporation: null | string;
      fiscalYearEnd:        null | string;
      ein:                  null | string;
      phone:                null | string;
      addresses:            Addresses;
      formerNames:          any[];
  }
  
  interface Addresses {
      mailing:  Business;
      business: Business;
  }
  
  interface Business {
      street1:        null | string;
      city:           null | string;
      stateOrCountry: null | string;
      zipCode:        null | string;
  }

  export default class companylookupWrapper {
    constructor(options: companylookupOptions);

    execute(callback: (error: any, data: companylookupResponse | null) => void): Promise<companylookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: companylookupResponse | null) => void): Promise<companylookupResponse>;
    execute(query?: Record<string, any>): Promise<companylookupResponse>;
  }
}
