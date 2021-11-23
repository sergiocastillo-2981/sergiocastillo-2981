view: intentdetails_report_v {
  sql_table_name: public.intentdetails_report_v ;;

  dimension: confidence {
    type: number
    sql: ${TABLE}."confidence" ;;
  }

  dimension: correlationid {
    type: string
    sql: ${TABLE}."correlationid" ;;
  }

  dimension_group: createdat {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."createdat" ;;
  }

  dimension: intent {
    type: string
    sql: ${TABLE}."intent" ;;
  }

  dimension: intentdetailid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."intentdetailid" ;;
  }

  dimension: response_index {
    type: number
    sql: ${TABLE}."response_index" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension_group: updatedat {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."updatedat" ;;
  }

  measure: count {
    type: count
    drill_fields: [intentdetails.intentdetailid, session.agentname, session.clientsessionid]
  }
}
