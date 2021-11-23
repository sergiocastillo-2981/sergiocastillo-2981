view: appinteraction {
  sql_table_name: public.appinteraction ;;
  drill_fields: [appinteractionid]

  dimension: appinteractionid {
    primary_key: yes
    type: number
    sql: ${TABLE}."appinteractionid" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
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

  dimension_group: eventtime {
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
    sql: ${TABLE}."eventtime" ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}."metadata" ;;
  }

  dimension: partytype {
    type: string
    sql: ${TABLE}."partytype" ;;
  }

  dimension: referencevalue {
    type: string
    sql: ${TABLE}."referencevalue" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}."subcategory" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  measure: count {
    type: count
    drill_fields: [appinteractionid, session.agentname, session.clientsessionid]
  }
}
