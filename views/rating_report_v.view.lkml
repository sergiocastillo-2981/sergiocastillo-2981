view: rating_report_v {
  sql_table_name: public.rating_report_v ;;

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}."comments" ;;
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

  dimension: ratingid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."ratingid" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."score" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
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
    drill_fields: [rating.ratingid, session.agentname, session.clientsessionid]
  }
}
