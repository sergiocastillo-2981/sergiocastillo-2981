view: tonedetails {
  sql_table_name: public.tonedetails ;;
  drill_fields: [tonedetailid]

  dimension: tonedetailid {
    primary_key: yes
    type: number
    sql: ${TABLE}."tonedetailid" ;;
  }

  dimension: confidence {
    type: number
    sql: ${TABLE}."confidence" ;;
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

  dimension: orchestratorid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."orchestratorid" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: tone {
    type: string
    sql: ${TABLE}."tone" ;;
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
    drill_fields: [tonedetailid, orchestrator.orchestratorid, session.agentname, session.clientsessionid]
  }
}
