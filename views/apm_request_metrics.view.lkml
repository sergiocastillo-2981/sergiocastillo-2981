view: apm_request_metrics {
  sql_table_name: public.apm_request_metrics ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: component {
    type: string
    sql: ${TABLE}."component" ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}."host" ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}."method" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."path" ;;
  }

  dimension: port {
    type: number
    sql: ${TABLE}."port" ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}."protocol" ;;
  }

  dimension_group: starttime {
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
    sql: ${TABLE}."starttime" ;;
  }

  dimension: statuscode {
    type: number
    sql: ${TABLE}."statuscode" ;;
  }

  dimension: statusmessage {
    type: string
    sql: ${TABLE}."statusmessage" ;;
  }

  dimension: timetaken {
    type: number
    sql: ${TABLE}."timetaken" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
