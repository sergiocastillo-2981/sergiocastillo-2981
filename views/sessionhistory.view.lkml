view: sessionhistory {
  sql_table_name: public.sessionhistory ;;
  drill_fields: [sessionhistoryid]

  dimension: sessionhistoryid {
    primary_key: yes
    type: number
    sql: ${TABLE}."sessionhistoryid" ;;
  }

  dimension: agentname {
    type: string
    sql: ${TABLE}."agentname" ;;
  }

  dimension: ainlu {
    type: string
    sql: ${TABLE}."ainlu" ;;
  }

  dimension: assistantthreshold {
    type: number
    sql: ${TABLE}."assistantthreshold" ;;
  }

  dimension: ccl {
    type: string
    sql: ${TABLE}."ccl" ;;
  }

  dimension: ced {
    type: string
    sql: ${TABLE}."ced" ;;
  }

  dimension: clientsessionid {
    type: string
    sql: ${TABLE}."clientsessionid" ;;
  }

  dimension: context {
    type: string
    sql: ${TABLE}."context" ;;
  }

  dimension: conversationid {
    type: string
    sql: ${TABLE}."conversationid" ;;
  }

  dimension: correlationid {
    type: string
    sql: ${TABLE}."correlationid" ;;
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

  dimension: escalationadded {
    type: string
    sql: ${TABLE}."escalationadded" ;;
  }

  dimension_group: escalationbegintime {
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
    sql: ${TABLE}."escalationbegintime" ;;
  }

  dimension_group: escalationendtime {
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
    sql: ${TABLE}."escalationendtime" ;;
  }

  dimension: escalationtext {
    type: string
    sql: ${TABLE}."escalationtext" ;;
  }

  dimension_group: eventtime {
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
    sql: ${TABLE}."eventtime" ;;
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

  dimension: surveyname {
    type: string
    sql: ${TABLE}."surveyname" ;;
  }

  dimension: surveyscore {
    type: number
    sql: ${TABLE}."surveyscore" ;;
  }

  dimension: to {
    type: string
    sql: ${TABLE}."to" ;;
  }

  dimension: transcriptflag {
    type: string
    sql: ${TABLE}."transcriptflag" ;;
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

  dimension: workflow {
    type: string
    sql: ${TABLE}."workflow" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

 ##--Sergios Added Measures and Dimensions

##  measure: count_engagements {
##    type: count_distinct
##    sql: ${sessionid} ;;
##    filters: [session.dwf_product: "CA",partytype: "customer",messagetext: "-Hi"]
##  }

  measure: count_engagements {
    type: count_distinct
    sql:  CASE WHEN ${session.dwf_product} = 'CA' and ${partytype} = 'customer' and messagetext<>'Hi'
    THEN ${session.sessionid}
    ELSE NULL
    END ;;
  }

  measure: count_ca_user_messages {
    type: count
    filters: [session.dwf_product: "CA",partytype: "customer",eventtype: "messageReceived"]
  }

  measure: count_ca_messages {
    type: count
    filters: [session.dwf_product: "CA",partytype: "customer,agent,bot"]
  }

  measure: avg_ca_messages {
    type: number
    sql: 1.0*${count_ca_messages} / nullif( ${session.count_ca_sessions} ,0) ;;
    value_format: "0.##"

  }



  dimension: source_url {
    type: string
    sql: (${data}->'userMeta')->>'origin' ;;
  }

  dimension: user_returning {
    type: string
    sql: ((${data}->'commonContext')->'user.returning')->>'value'  ;;
  }

  dimension: referrer {
    type: string
    sql:  (${data}->'userMeta')->>'referrer' ;;
  }

 #measure: count_escalations {
  #  type: count_distinct
  #  sql: ${TABLE}.sessionid ;;
  #  filters: [eventtype: "escalationConnected"]
  #}

  #measure: percent_escalations {
  #  type: number
  #  sql: 1.0*${count_escalations}/nullif(${session.count_ca_sessions},0) ;;
  #  value_format_name: percent_2
  #}


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      sessionhistoryid,
      agentname,
      surveyname,
      session.agentname,
      session.clientsessionid,
      sessionhistory_report_v.count,
      trainingutterances.count
    ]
  }
}
