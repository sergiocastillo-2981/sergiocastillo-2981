view: responses {
  sql_table_name: public.responses ;;
  drill_fields: [responseid]

  dimension: responseid {
    primary_key: yes
    type: number
    sql: ${TABLE}."responseid" ;;
  }

  dimension: ccl {
    type: string
    sql: ${TABLE}."ccl" ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }

  dimension: topic {
    type: string
    sql: ${TABLE}."topic" ;;
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
    drill_fields: [responseid]
  }
}
