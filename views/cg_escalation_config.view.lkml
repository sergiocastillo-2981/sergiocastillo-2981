view: cg_escalation_config {
  sql_table_name: public.cg_escalation_config ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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

  dimension: creator {
    type: string
    sql: ${TABLE}."creator" ;;
  }

  dimension: escalation_config {
    type: string
    sql: ${TABLE}."escalation_config" ;;
  }

  dimension: escalation_type {
    type: string
    sql: ${TABLE}."escalation_type" ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}."updatedat" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
