view: schema_history {
  sql_table_name: public.schema_history ;;

  dimension: checksum {
    type: number
    sql: ${TABLE}."checksum" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: execution_time {
    type: number
    sql: ${TABLE}."execution_time" ;;
  }

  dimension: installed_by {
    type: string
    sql: ${TABLE}."installed_by" ;;
  }

  dimension_group: installed {
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
    sql: ${TABLE}."installed_on" ;;
  }

  dimension: installed_rank {
    type: number
    sql: ${TABLE}."installed_rank" ;;
  }

  dimension: script {
    type: string
    sql: ${TABLE}."script" ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}."success" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}."version" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
