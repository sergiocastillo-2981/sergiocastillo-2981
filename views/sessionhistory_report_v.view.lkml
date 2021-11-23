view: sessionhistory_report_v {
  sql_table_name: public.sessionhistory_report_v ;;

  dimension: answer_given {
    type: yesno
    sql: ${TABLE}."answer_given" ;;
  }

  dimension: ccl {
    type: string
    sql: ${TABLE}."ccl" ;;
  }

  dimension: ced {
    type: string
    sql: ${TABLE}."ced" ;;
  }

  dimension: correlationid {
    type: string
    sql: ${TABLE}."correlationid" ;;
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

  dimension: data {
    type: string
    sql: ${TABLE}."data" ;;
  }

  dimension: dialednumber {
    type: string
    sql: ${TABLE}."dialednumber" ;;
  }

  dimension: dnis {
    type: string
    sql: ${TABLE}."dnis" ;;
  }

  dimension: eventtype {
    type: string
    sql: ${TABLE}."eventtype" ;;
  }

  dimension: filterreason {
    type: string
    sql: ${TABLE}."filterreason" ;;
  }

  dimension: fromtype {
    type: string
    sql: ${TABLE}."fromtype" ;;
  }

  dimension: localcallid {
    type: number
    value_format_name: id
    sql: ${TABLE}."localcallid" ;;
  }

  dimension: messagetext {
    type: string
    sql: ${TABLE}."messagetext" ;;
  }

  dimension: partytype {
    type: string
    sql: ${TABLE}."partytype" ;;
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

  dimension: skillgroupid {
    type: number
    value_format_name: id
    sql: ${TABLE}."skillgroupid" ;;
  }

  dimension: sttlatency {
    type: number
    sql: ${TABLE}."sttlatency" ;;
  }

  dimension: sttscore {
    type: number
    sql: ${TABLE}."sttscore" ;;
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
    drill_fields: [sessionhistory.sessionhistoryid, sessionhistory.agentname, sessionhistory.surveyname, session.agentname, session.clientsessionid]
  }
}
