view: surveyresult {
  sql_table_name: public.surveyresult ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
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

  dimension: result {
    type: string
    sql: ${TABLE}."result" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
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

  dimension: csat {
    type: number
    sql: result->'rating' ;;
  }

  measure: count {
    type: count
    drill_fields: [id, session.agentname, session.clientsessionid]
  }
}
