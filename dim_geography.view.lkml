view: dim_geography {
  sql_table_name: stars.DimGeography ;;

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country_region_code {
    type: string
    sql: ${TABLE}.CountryRegionCode ;;
  }

  dimension: region {
    type: string
    case: {
      when: {
        sql: ${english_country_region_name} IN ('United States','Canada') ;;
        label: "North America"
      }
      when: {
        sql:  ${english_country_region_name} IN  ('Germany', 'France', 'United Kingdom') ;;
        label: "Europe"
      }
      when: {
        sql:  ${english_country_region_name} = 'Australia' ;;
        label: "Australia"
      }
    }
  }

  dimension: english_country_region_name {
    type: string
    sql: ${TABLE}.EnglishCountryRegionName ;;
  }

  dimension: french_country_region_name {
    type: string
    sql: ${TABLE}.FrenchCountryRegionName ;;
  }

  dimension: geography_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.GeographyKey ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }

  dimension: spanish_country_region_name {
    type: string
    sql: ${TABLE}.SpanishCountryRegionName ;;
  }

  dimension: state_province_code {
    type: string
    sql: ${TABLE}.StateProvinceCode ;;
  }

  dimension: state_province_name {
    type: string
    sql: ${TABLE}.StateProvinceName ;;
  }

  measure: count {
    type: count
    drill_fields: [state_province_name, english_country_region_name, spanish_country_region_name, french_country_region_name]
  }
}
