view: intentdetails {
  sql_table_name: public.intentdetails ;;
  drill_fields: [intentdetailid]

  dimension: intentdetailid {
    primary_key: yes
    type: number
    sql: ${TABLE}."intentdetailid" ;;
  }

  dimension: confidence {
    type: number
    sql: ${TABLE}."confidence" ;;
  }

  dimension: correlationid {
    type: string
    sql: ${TABLE}."correlationid" ;;
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
      year
    ]
    sql: ${TABLE}."createdAt" ;;
  }

  dimension: intent {
    type: string
    sql: ${TABLE}."intent" ;;
  }


  dimension: trimmed20_intent {
    type: string
    sql: SUBSTRING(${TABLE}."intent",0, 20) ;;
  }

  dimension: orchestratorid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."orchestratorid" ;;
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

  dimension_group: updated {
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
    sql: ${TABLE}."updatedAt" ;;
  }

  measure: unique_intents  {
    type: count_distinct
    sql: ${sessionid} ;;
  }


  measure: count {
    type: count
    drill_fields: [intentdetailid, session.agentname, session.clientsessionid, orchestrator.orchestratorid, intentdetails_report_v.count]
  }
}
