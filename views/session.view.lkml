view: session {
  sql_table_name: public.session ;;
  drill_fields: [clientsessionid]

  dimension: clientsessionid {
    primary_key: yes
    type: string
    sql: ${TABLE}."clientsessionid" ;;
  }

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
  }

  dimension: agentname {
    type: string
    sql: ${TABLE}."agentname" ;;
  }

  dimension: businessunitid {
    type: string
    # hidden: yes
    sql: ${TABLE}."businessunitid" ;;
  }

  dimension: callersession {
    type: string
    sql: ${TABLE}."callersession" ;;
  }

  dimension: channelid {
    type: string
    sql: ${TABLE}."channelid" ;;
  }

  dimension: channeltype {
    type: string
    sql: ${TABLE}."channeltype" ;;
  }

  dimension: conversationid {
    type: string
    sql: ${TABLE}."conversationid" ;;
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

  dimension: deviceid {
    type: string
    # hidden: yes
    sql: ${TABLE}."deviceid" ;;
  }

  dimension: dialednumber {
    type: string
    sql: ${TABLE}."dialednumber" ;;
  }

  dimension: dnis {
    type: string
    sql: ${TABLE}."dnis" ;;
  }

  dimension: dwf_product {
    type: string
    sql: ${TABLE}."dwf_product" ;;
  }

  dimension: escalationid {
    type: string
    sql: ${TABLE}."escalationid" ;;
  }

  dimension: escalationreason {
    type: string
    sql: ${TABLE}."escalationreason" ;;
  }

  dimension: sessioncustomattributes {
    type: string
    sql: ${TABLE}."sessioncustomattributes" ;;
  }

  dimension_group: sessionendedat {
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
    sql: ${TABLE}."sessionendedat" ;;
  }

  dimension: sessionendedby {
    type: string
    sql: ${TABLE}."sessionendedby" ;;
  }

  dimension: sessionendedreason {
    type: string
    sql: ${TABLE}."sessionendedreason" ;;
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

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: transcriptid {
    type: string
    sql: ${TABLE}."transcriptid" ;;
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

  dimension: within_business_hours {
    type: yesno
    sql: ${TABLE}."within_business_hours" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      clientsessionid,
      agentname,
      session.agentname,
      session.clientsessionid,
      device.deviceid,
      businessunit.businessunitid,
      appinteraction.count,
      checklist.count,
      discoverydetails.count,
      discoveryrating.count,
      entitydetails.count,
      entitydetails_report_v.count,
      getlatestsession.count,
      intentdetails.count,
      intentdetails_report_v.count,
      interactionsummaries.count,
      nlucategories.count,
      nluconcepts.count,
      nluentities.count,
      nlukeywords.count,
      nlusentiment.count,
      orchestrator.count,
      orchestratorview.count,
      rating.count,
      rating_report_v.count,
      session.count,
      sessionhistory.count,
      sessionhistory_report_v.count,
      session_report_v.count,
      surveyresult.count,
      temp_sessionhistory_cleared.count,
      tonedetails.count,
      trainingutterances.count
    ]
  }
}
