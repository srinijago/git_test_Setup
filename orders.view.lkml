view: orders {
  sql_table_name: demo_db.orders ;;

  parameter: is_order_new {
    type: yesno
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "Click me to go to a Dashboard"
      url: "/dashboards/3411?Date={{ _filters['orders.created_date'] }}&Order={{ value }}&User={{ users.id._value}}"
    }
    link: {
      label: "Click me to go to an Explore"
      url: "/explore/david_c_ecom/order_items?fields=users.first_name,users.last_name,users.age,users.city,users.country,users.gender&f[orders.created_date]={{ _filters['orders.created_date'] }}&f[users.id]={{ users.id._value}}&f[orders.id]={{ value }}"
    }
  }

  #my new comment is back

  dimension: action_calc {
    type: number
    sql: case when ${status} = 'complete' then 1
      when ${status} = 'pending' then 2
      else 3 end ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      second,
      year,
      day_of_week,
      month_num
    ]
    sql: ${TABLE}.created_at ;;
  }

#  Excel date value formats don't work in the LookML
#   dimension: date_formatted {
#     type: date
#     sql: ${TABLE}.created_at ;;
#     value_format: "m/dd/yyyy"
#   }

  dimension_group: time_since_created {
    type: duration
    sql_start: ${created_raw} ;;
    sql_end: NOW() ;;
    intervals: [year,month,day,hour,minute]
    group_label: "Test2"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: case_lookml_field {
    case: {
      when: {
        label: "Complete or Cancelled"
        sql: ${status} = "complete" OR ${status} = "cancelled" ;;
      }
      when: {
        label: "Pending"
        sql: ${status} = "pending" ;;
      }
      else: "Boom Shakalaka"
    }
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count_formatted {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    html: {% if orders.status._value == 'complete' and value > 10 %}
          <font color="green">{{ rendered_value }}</font>
          {% else %}
          <font color="black">{{ rendered_value }}</font>
          {% endif %}
          ;;
  }

  measure: 9k {
    type: sum
    sql: 9000 ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";"
  }

  measure: negative_9k {
    type: sum
    sql: -9000 ;;
    value_format: "[abs(>=1000000)]0.00,,\"M\";[abs(>=1000)]0.00,\"K\";"
  }

  measure: count {
    type: count
  }

  measure: count_distinct {
    type: count_distinct
    sql: COALESCE(${id},0) ;;
  }

  measure: count_with_drill {
    type: count
    drill_fields: [id,user_id,status]
  }

  measure: distinct_order_count_month {
    type: count_distinct
    sql: ${id} ;;
    label: "Number of Orders in Last Month"
    filters: {
      field: created_month
      value: "1 month"
    }
  }

  measure: distinct_order_count_sixmo {
    type: count_distinct
    sql: ${id} ;;
    label: "Number of Orders in Last 6 Months"
    filters: {
      field: created_month
      value: "6 Months"
    }
  }

  measure: min_range {
    type: date
    sql: MIN(${created_raw}) ;;
    hidden: yes
  }

  measure: max_range {
    type: date
    sql: MAX(${created_raw}) ;;
    hidden: yes
  }

  measure: date_range {
    type: string
    sql: CONCAT(${min_range}, " to ", ${max_range}) ;;
  }

  # date filtered measures require dimension group timeframe too i.e. created_date/_month/_hour
  measure: test_count_filters_45_days {
    type: count
    filters: {
      field: created_date
      value: "45 days"
    }
  }

#   Can't filter a measure by another measure
#   measure: filtered_count_on_measure {
#     type: count_distinct
#     sql: ${user_id} ;;
#     filters: {
#       field: count
#       value: ">6"
#     }
#   }

  measure: status_filtered_measure_count {
    type: count
    filters: {
      field: status
      value: "complete,null"
    }
  }

  measure: percent_of_orders {
    type: number
    sql: (${distinct_order_count_month}/${distinct_order_count_sixmo}) *100;;
    value_format: "0.00\%"
  }

  dimension: log_call {
    type: string
    sql: ${id};;
    action: {
      label: "Looker Test"
#url: "https://htmovk6mqi.execute-api.us-west-1.amazonaws.com/DEV"
      url: "https://hooks.zapier.com/hooks/catch/6236013/o6c87v2/"
      form_param: {
        name: "call_disposition"
        type: select
        label: "Call Disposition"
        required: yes
        option: {
          label: "Patient Reached"
          name: "reached"
        }
        option: {
          label: "Patient Reached, Callback Requested"
          name: "reached_callback_requested"
        }
        option: {
          label: "Patient Not Reached"
          name: "not_reached"
        }
        option: {
          label: "Patient Not Reached (Voicemail Left)"
          name: "not_reached_voicemail"
        }
        option: {
          label: "Phone Number Disconnected (Phone One)"
          name: "phone_one_disconnected"
        }
        option: {
          label: "Phone Number Disconnected (Phone Two)"
          name: "phone_two_disconnected"
        }
      }
      form_param: {
        name: "awv_scheduled"
        type: select
        label: "AWV Scheduled?"
        required: no
        default: ""
        option: {
          label: "AWV Scheduled by Florence"
          name: "2"
        }
        option: {
          label: "AWV Already Scheduled by Practice"
          name: "3"
        }
        option: {
          label: "AWV Not Scheduled — patient wants to schedule later"
          name: "4"
        }
        option: {
          label: "AWV Not Scheduled — patient doesn't want an AWV"
          name: "5"
        }
        option: {
          label: "AWV Not Scheduled — patient moved out of area"
          name: "6"
        }
        option: {
          label: "AWV Not Scheduled — patient is seeing different local PCP now"
          name: "7"
        }
      }
      form_param: {
        name: "awv_month"
        type: select
        label: "If AWV Scheduled, Month"
        required: no
        option: {
          label: "January"
          name: "1"
        }
        option: {
          label: "February"
          name: "2"
        }
        option: {
          label: "March"
          name: "3"
        }
        option: {
          label: "April"
          name: "4"
        }
        option: {
          label: "May"
          name: "5"
        }
        option: {
          label: "June"
          name: "6"
        }
        option: {
          label: "July"
          name: "7"
        }
        option: {
          label: "August"
          name: "8"
        }
        option: {
          label: "September"
          name: "9"
        }
        option: {
          label: "October"
          name: "10"
        }
        option: {
          label: "November"
          name: "11"
        }
        option: {
          label: "December"
          name: "12"
        }
      }
      form_param: {
        name: "awv_day"
        type: select
        label: "If AWV Scheduled, Day"
        required: no
        option: {
          label: "1"
          name: "1"
        }
        option: {
          label: "2"
          name: "2"
        }
        option: {
          label: "3"
          name: "3"
        }
        option: {
          label: "4"
          name: "4"
        }
        option: {
          label: "5"
          name: "5"
        }
        option: {
          label: "6"
          name: "6"
        }
        option: {
          label: "7"
          name: "7"
        }
        option: {
          label: "8"
          name: "8"
        }
        option: {
          label: "9"
          name: "9"
        }
        option: {
          label: "10"
          name: "10"
        }
        option: {
          label: "11"
          name: "11"
        }
        option: {
          label: "12"
          name: "12"
        }
        option: {
          label: "13"
          name: "13"
        }
        option: {
          label: "14"
          name: "14"
        }
        option: {
          label: "15"
          name: "15"
        }
        option: {
          label: "16"
          name: "16"
        }
        option: {
          label: "17"
          name: "17"
        }
        option: {
          label: "18"
          name: "18"
        }
        option: {
          label: "19"
          name: "19"
        }
        option: {
          label: "20"
          name: "20"
        }
        option: {
          label: "21"
          name: "21"
        }
        option: {
          label: "22"
          name: "22"
        }
        option: {
          label: "23"
          name: "23"
        }
        option: {
          label: "24"
          name: "24"
        }
        option: {
          label: "25"
          name: "25"
        }
        option: {
          label: "26"
          name: "26"
        }
        option: {
          label: "27"
          name: "27"
        }
        option: {
          label: "28"
          name: "28"
        }
        option: {
          label: "29"
          name: "29"
        }
        option: {
          label: "30"
          name: "30"
        }
        option: {
          label: "31"
          name: "31"
        }
      }
      form_param: {
        name: "awv_year"
        type: select
        label: "If AWV Scheduled, Year"
        required: no
        option: {
          label: "2019"
          name: "2019"
        }
        option: {
          label: "2020"
          name: "2020"
        }
      }
      form_param: {
        name: "bpm_consent"
        type: select
        label: "BPM Consent"
        required: no
        option: {
          label: "Yes"
          name: "1"
        }
        option: {
          label: "No"
          name: "0"
        }
      }
      form_param: {
        name: "ccm_consent"
        type: select
        label: "CCM Consent"
        required: no
        option: {
          label: "Yes"
          name: "1"
        }
        option: {
          label: "No"
          name: "0"
        }
      }
      form_param: {
        name: "transportation_interest"
        type: select
        label: "Transportation Interest"
        required: no
        option: {
          label: "Yes"
          name: "1"
        }
        option: {
          label: "No"
          name: "0"
        }
      }
      form_param: {
        name: "street_address"
        type: string
        label: "Patient's Street Address"
        required: no
        #default: "{{ beneficiary_current_address.street_address._value }}"
      }
      form_param: {
        name: "city"
        type: string
        label: "Patient's City"
        required: no
        #default: "{{ beneficiary_current_address.city._value }}"
      }
      form_param: {
        name: "state"
        type: string
        label: "Patient's State (2 Letter Code)"
        required: no
        #default: "{{ beneficiary_current_address.state._value }}"
      }
      form_param: {
        name: "zip_code"
        type: string
        label: "Patient's 5 Digit Zip Code"
        required: no
        #default: "{{ beneficiary_current_address.zip_code._value }}"
      }
      form_param: {
        name: "notes"
        type: textarea
        label: "Notes"
        required: no
      }
      # param: {
      #   name: "primary_care_doctor"
      #   value: "{{ npi_lookup.CLINICIAN_PRESENTATION_NAME._value }}"
      # }
      # param: {
      #   name: "mbid"
      #   value: "{{ beneficiary_demographics.mbid._value }}"
      # }
      # param: {
      #   name: "first_name"
      #   value: "{{ beneficiary_demographics.first_name._value }}"
      # }
      # param: {
      #   name: "last_name"
      #   value: "{{ beneficiary_demographics.last_name._value }}"
      # }
      # param: {
      #   name: "dob"
      #   value: "{{ beneficiary_demographics.birth_date._value }}"
      # }
      # param: {
      #   name: "careos_token"
      #   value: "care0S18_f34g3rg"
      # }
      # param: {
      #   name: "address_in_db"
      #   value: "ADDRESS"
      # }
      user_attribute_param: {
        name: "user attribute param name test"
        user_attribute: name
      }
      param: {
        name: "param name test"
        value: "{{ _user_attributes['first_name'] }} {{ _user_attributes['last_name'] }}"
      }
    }
  }
}
