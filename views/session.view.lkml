view: session {
  sql_table_name: public.session ;;
  drill_fields: [clientsessionid]

  dimension: clientsessionid {
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
    primary_key: yes
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

##---- Sergio Added Dimensions and Measures

  dimension: brand {

    case: {
      when: {
        sql: ${TABLE}.channelid = 'd99d7d02-2271-4435-b7b5-3cc3045901c0' ;;
        label: "PC"
      }
      when: {
        sql: ${TABLE}.channelid = 'd0fc6f88-7cc6-42b4-a40c-3a86d45ac73a' ;;
        label: "CV"
      }
      when: {
        sql: ${TABLE}.channelid = '791be684-d6d8-4e90-bce5-6a68efd0223e';;
        label: "CUPRA"
      }
      when: {
        sql: ${TABLE}.channelid = '8de83e63-c1d3-4c0e-b593-13942da49fdc' ;;
        label: "SEAT"
      }
      when: {
        sql: ${TABLE}.channelid = '49d2d7c6-c1a0-4576-86bd-d0a9bc013dca' ;;
        label: "SKODA"
      }

      when: {
        sql: ${TABLE}.channelid = 'e6eaa2b1-ca11-466c-83c8-ac65b9b7e625' ;;
        label: "AUDI"
      }
      else: "UNKNOWN"
    }

  }

  dimension: handle_time {
    type: number
    sql: coalesce(floor(extract(EPOCH from  sessionendedat-"createdAt")),0) ;;
  }

  #This dimension can be used to replace_handle_time, its more powerful and versatile, also can be displayed in multiple formats.
  dimension_group: handle {
    type: duration
    intervals: [second,minute,hour,day]
    #sql_start: ${TABLE}."createdAt" ;;
    sql_start: ${created_raw} ;;
    #sql_end: ${TABLE}.sessionendedat ;;
    sql_end: ${sessionendedat_raw} ;;
  }

  measure: sum_ca_handle_time {
    type: sum
    sql: ${handle_time} ;;
    filters: [dwf_product: "CA"]
  }

  measure: avg_ca_handle_time {
    type: number
    sql: 1.0*${sum_ca_handle_time} /${count_ca_sessions} ;;

  }

  measure: avg_ca_handle_time_hms {
    type: number
    sql: (1.0*${sum_ca_handle_time} /${count_ca_sessions})/86400.0 ;;
    value_format: "HH:MM:SS"

  }

  measure: count_ca_sessions {
    type: count_distinct
    sql: ${sessionid} ;;
    filters: [dwf_product: "CA"]

  }

  measure: avg_count_messages {
    type: number
    sql: 1.0*${sessionhistory.count_ca_messages} / ${count_ca_sessions}  ;;
  }

  measure: count_escalations {
    type: count
    filters: [dwf_product: "CA",escalationreason: "-NULL"]
  }


  measure: count_self_service {
    type: number
    sql: ${sessionhistory.count_engagements}-${count_escalations} ;;
  }



  measure: percent_escalations {
    type: number
    sql: 1.0*${count_escalations}/nullif(${sessionhistory.count_engagements},0) ;;
    value_format_name: percent_2
  }

  measure: percent_self_service {
    type: number
    sql: 1.0*${count_self_service}/nullif(${sessionhistory.count_engagements},0) ;;
    value_format_name: percent_2
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
