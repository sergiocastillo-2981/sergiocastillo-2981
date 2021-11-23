view: getlatestsession {
  sql_table_name: public.getlatestsession ;;

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
  }

  dimension: agentname {
    type: string
    sql: ${TABLE}."agentname" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  measure: count {
    type: count
    drill_fields: [agentname, session.agentname, session.clientsessionid]
  }
}
