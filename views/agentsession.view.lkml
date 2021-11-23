view: agentsession {
  sql_table_name: public.agentsession ;;
  drill_fields: [agentsessionid]

  dimension: agentsessionid {
    primary_key: yes
    type: number
    sql: ${TABLE}."agentsessionid" ;;
  }

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
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

  dimension: jwttoken {
    type: string
    sql: ${TABLE}."jwttoken" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
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

  dimension: useragent {
    type: string
    sql: ${TABLE}."useragent" ;;
  }

  measure: count {
    type: count
    drill_fields: [agentsessionid]
  }
}
