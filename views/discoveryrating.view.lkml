view: discoveryrating {
  sql_table_name: public.discoveryrating ;;
  drill_fields: [discoveryratingid]

  dimension: discoveryratingid {
    primary_key: yes
    type: number
    sql: ${TABLE}."discoveryratingid" ;;
  }

  dimension: agentid {
    type: string
    sql: ${TABLE}."agentid" ;;
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

  dimension: discoveryid {
    type: number
    value_format_name: id
    sql: ${TABLE}."discoveryid" ;;
  }

  dimension: documentid {
    type: string
    sql: ${TABLE}."documentid" ;;
  }

  dimension: orchestratorid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."orchestratorid" ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}."rating" ;;
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
    drill_fields: [discoveryratingid, orchestrator.orchestratorid, session.agentname, session.clientsessionid]
  }
}
