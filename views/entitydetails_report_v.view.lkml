view: entitydetails_report_v {
  sql_table_name: public.entitydetails_report_v ;;

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

  dimension: entity {
    type: string
    sql: ${TABLE}."entity" ;;
  }

  dimension: entitydetailid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."entitydetailid" ;;
  }

  dimension: entityutterance {
    type: string
    sql: ${TABLE}."entityutterance" ;;
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
    drill_fields: [entitydetails.entitydetailid, session.agentname, session.clientsessionid]
  }
}
