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
    required_access_grants: [can_see_business_hours] ##Added for testing purposes
  }

##---- Sergio Added Dimensions ,Measures  -----------#####
##----                                       -----------#####


  dimension: brand {

    case: {
      when: {
        sql: ${TABLE}.channelid = '16ae3b75-cd57-4fa7-ba1f-2fc21f17688a' ;;
        label: "PC"
      }
      when: {
        sql: ${TABLE}.channelid = 'ec542df8-78e6-4a77-99b5-972bb316f153' ;;
        label: "CV"
      }
      when: {
        sql: ${TABLE}.channelid = '9ce2abef-6c70-4960-ad70-f210e9edc0a3';;
        label: "CUPRA"
      }
      when: {
        sql: ${TABLE}.channelid = '5544c829-8496-440f-a604-213a1630f1ee' ;;
        label: "SEAT"
      }
      when: {
        sql: ${TABLE}.channelid = '83ff2ed8-ea89-4a00-a697-85f21fbd7d8c' ;;
        label: "SKODA"
      }
      when: {
        sql: ${TABLE}.channelid = 'b0adbb4f-1e79-4993-86d0-093e8973bbbe' ;;
        label: "AUDI"
      }
      else: "UNKNOWN"
    }

  }

  dimension: handle_time {
    type: number
    sql: coalesce(floor(extract(EPOCH from  sessionendedat-"createdAt")),0) ;;
  }

  #pending create handle_time using DATEDIFF

  #SC.This dimension can be used to replace_handle_time, its more powerful and versatile, also can be displayed in multiple formats.
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

  measure: count_escalations {
    type: count
    filters: [dwf_product: "CA",escalationreason: "-NULL"]
  }

  measure: per_bot_sessions_contained {
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${count_escalations} / nullif(${count_ca_sessions},0)  ;;
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
