view: nlukeywordssummary {
  sql_table_name: public.nlukeywordssummary ;;

  dimension: occurrences {
    type: number
    sql: ${TABLE}."occurrences" ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}."text" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
