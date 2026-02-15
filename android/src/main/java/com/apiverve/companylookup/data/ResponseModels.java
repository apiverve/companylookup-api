// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     CompanyLookupData data = Converter.fromJsonString(jsonString);

package com.apiverve.companylookup.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static CompanyLookupData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(CompanyLookupData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(CompanyLookupData.class);
        writer = mapper.writerFor(CompanyLookupData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// CompanyLookupData.java

package com.apiverve.companylookup.data;

import com.fasterxml.jackson.annotation.*;

public class CompanyLookupData {
    private String ticker;
    private String cik;
    private String name;
    private String[] tickers;
    private String[] exchanges;
    private String entityType;
    private String sic;
    private String sicDescription;
    private String category;
    private String stateOfIncorporation;
    private String fiscalYearEnd;
    private String ein;
    private String phone;
    private Addresses addresses;
    private Object[] formerNames;

    @JsonProperty("ticker")
    public String getTicker() { return ticker; }
    @JsonProperty("ticker")
    public void setTicker(String value) { this.ticker = value; }

    @JsonProperty("cik")
    public String getCik() { return cik; }
    @JsonProperty("cik")
    public void setCik(String value) { this.cik = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("tickers")
    public String[] getTickers() { return tickers; }
    @JsonProperty("tickers")
    public void setTickers(String[] value) { this.tickers = value; }

    @JsonProperty("exchanges")
    public String[] getExchanges() { return exchanges; }
    @JsonProperty("exchanges")
    public void setExchanges(String[] value) { this.exchanges = value; }

    @JsonProperty("entityType")
    public String getEntityType() { return entityType; }
    @JsonProperty("entityType")
    public void setEntityType(String value) { this.entityType = value; }

    @JsonProperty("sic")
    public String getSic() { return sic; }
    @JsonProperty("sic")
    public void setSic(String value) { this.sic = value; }

    @JsonProperty("sicDescription")
    public String getSicDescription() { return sicDescription; }
    @JsonProperty("sicDescription")
    public void setSicDescription(String value) { this.sicDescription = value; }

    @JsonProperty("category")
    public String getCategory() { return category; }
    @JsonProperty("category")
    public void setCategory(String value) { this.category = value; }

    @JsonProperty("stateOfIncorporation")
    public String getStateOfIncorporation() { return stateOfIncorporation; }
    @JsonProperty("stateOfIncorporation")
    public void setStateOfIncorporation(String value) { this.stateOfIncorporation = value; }

    @JsonProperty("fiscalYearEnd")
    public String getFiscalYearEnd() { return fiscalYearEnd; }
    @JsonProperty("fiscalYearEnd")
    public void setFiscalYearEnd(String value) { this.fiscalYearEnd = value; }

    @JsonProperty("ein")
    public String getEin() { return ein; }
    @JsonProperty("ein")
    public void setEin(String value) { this.ein = value; }

    @JsonProperty("phone")
    public String getPhone() { return phone; }
    @JsonProperty("phone")
    public void setPhone(String value) { this.phone = value; }

    @JsonProperty("addresses")
    public Addresses getAddresses() { return addresses; }
    @JsonProperty("addresses")
    public void setAddresses(Addresses value) { this.addresses = value; }

    @JsonProperty("formerNames")
    public Object[] getFormerNames() { return formerNames; }
    @JsonProperty("formerNames")
    public void setFormerNames(Object[] value) { this.formerNames = value; }
}

// Addresses.java

package com.apiverve.companylookup.data;

import com.fasterxml.jackson.annotation.*;

public class Addresses {
    private Business mailing;
    private Business business;

    @JsonProperty("mailing")
    public Business getMailing() { return mailing; }
    @JsonProperty("mailing")
    public void setMailing(Business value) { this.mailing = value; }

    @JsonProperty("business")
    public Business getBusiness() { return business; }
    @JsonProperty("business")
    public void setBusiness(Business value) { this.business = value; }
}

// Business.java

package com.apiverve.companylookup.data;

import com.fasterxml.jackson.annotation.*;

public class Business {
    private String street1;
    private String city;
    private String stateOrCountry;
    private String zipCode;

    @JsonProperty("street1")
    public String getStreet1() { return street1; }
    @JsonProperty("street1")
    public void setStreet1(String value) { this.street1 = value; }

    @JsonProperty("city")
    public String getCity() { return city; }
    @JsonProperty("city")
    public void setCity(String value) { this.city = value; }

    @JsonProperty("stateOrCountry")
    public String getStateOrCountry() { return stateOrCountry; }
    @JsonProperty("stateOrCountry")
    public void setStateOrCountry(String value) { this.stateOrCountry = value; }

    @JsonProperty("zipCode")
    public String getZipCode() { return zipCode; }
    @JsonProperty("zipCode")
    public void setZipCode(String value) { this.zipCode = value; }
}