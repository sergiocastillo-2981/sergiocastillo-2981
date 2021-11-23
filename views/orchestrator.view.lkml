view: orchestrator {
  sql_table_name: public.orchestrator ;;
  drill_fields: [orchestratorid]

  dimension: orchestratorid {
    primary_key: yes
    type: number
    sql: ${TABLE}."orchestratorid" ;;
  }

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
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

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: inputtext {
    type: string
    sql: ${TABLE}."inputtext" ;;
  }

  dimension: nodetype {
    type: string
    sql: ${TABLE}."nodetype" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      orchestratorid,
      session.agentname,
      session.clientsessionid,
      discoverydetails.count,
      discoveryrating.count,
      entitydetails.count,
      intentdetails.count,
      nlucategories.count,
      nluconcepts.count,
      nluentities.count,
      nlukeywords.count,
      nlusentiment.count,
      orchestratorview.count,
      tonedetails.count
    ]
  }
}
