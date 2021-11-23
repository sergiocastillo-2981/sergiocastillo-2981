view: interactionsummaries {
  sql_table_name: public.interactionsummaries ;;

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

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}."summary" ;;
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

  dimension: usermodifiedsummary {
    type: string
    sql: ${TABLE}."usermodifiedsummary" ;;
  }

  measure: count {
    type: count
    drill_fields: [session.agentname, session.clientsessionid]
  }
}
