view: eventlog {
  sql_table_name: public.eventlog ;;

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

  dimension: logid {
    type: number
    value_format_name: id
    sql: ${TABLE}."logid" ;;
  }

  dimension: logsource {
    type: string
    sql: ${TABLE}."logsource" ;;
  }

  dimension: payload {
    type: string
    sql: ${TABLE}."payload" ;;
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
    drill_fields: []
  }
}
