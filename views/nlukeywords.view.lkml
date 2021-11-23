view: nlukeywords {
  sql_table_name: public.nlukeywords ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: count_nlukeywords {
    type: number
    sql: ${TABLE}."count" ;;
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

  dimension: partytype {
    type: string
    sql: ${TABLE}."partytype" ;;
  }

  dimension: relevance {
    type: number
    sql: ${TABLE}."relevance" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}."text" ;;
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
    drill_fields: [id, orchestrator.orchestratorid, session.agentname, session.clientsessionid]
  }
}
