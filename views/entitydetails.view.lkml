view: entitydetails {
  sql_table_name: public.entitydetails ;;
  drill_fields: [entitydetailid]

  dimension: entitydetailid {
    primary_key: yes
    type: number
    sql: ${TABLE}."entitydetailid" ;;
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

  dimension: entity {
    type: string
    sql: ${TABLE}."entity" ;;
  }

  dimension: entityutterance {
    type: string
    sql: ${TABLE}."entityutterance" ;;
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

  measure: count {
    type: count
    drill_fields: [entitydetailid, session.agentname, session.clientsessionid, orchestrator.orchestratorid, entitydetails_report_v.count]
  }
}
