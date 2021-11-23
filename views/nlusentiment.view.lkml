view: nlusentiment {
  sql_table_name: public.nlusentiment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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

  dimension: score {
    type: number
    sql: ${TABLE}."score" ;;
  }

  dimension: sentiment {
    type: string
    sql: ${TABLE}."sentiment" ;;
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
    drill_fields: [id, session.agentname, session.clientsessionid, orchestrator.orchestratorid]
  }
}
