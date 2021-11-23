view: temp_sessionhistory_cleared {
  sql_table_name: public.temp_sessionhistory_cleared ;;

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

  measure: count {
    type: count
    drill_fields: [session.agentname, session.clientsessionid]
  }
}
