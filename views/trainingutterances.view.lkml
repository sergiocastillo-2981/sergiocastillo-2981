view: trainingutterances {
  sql_table_name: public.trainingutterances ;;

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
  }

  dimension: confidence {
    type: number
    sql: ${TABLE}."confidence" ;;
  }

  dimension: correlationid {
    type: string
    sql: ${TABLE}."correlationid" ;;
  }

  dimension: filterreason {
    type: string
    sql: ${TABLE}."filterreason" ;;
  }

  dimension: messagetext {
    type: string
    sql: ${TABLE}."messagetext" ;;
  }

  dimension: sessionhistoryid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."sessionhistoryid" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: sttscore {
    type: number
    sql: ${TABLE}."sttscore" ;;
  }

  measure: count {
    type: count
    drill_fields: [session.agentname, session.clientsessionid, sessionhistory.sessionhistoryid, sessionhistory.agentname, sessionhistory.surveyname]
  }
}
