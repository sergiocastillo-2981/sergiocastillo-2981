view: getagentsession {
  sql_table_name: public.getagentsession ;;

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
