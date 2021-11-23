view: orchestratorview {
  sql_table_name: public.orchestratorview ;;

  dimension: agentextensionid {
    type: string
    sql: ${TABLE}."agentextensionid" ;;
  }

  dimension: agentname {
    type: string
    sql: ${TABLE}."agentname" ;;
  }

  dimension: assistant_confidence {
    type: number
    sql: ${TABLE}."assistant_confidence" ;;
  }

  dimension: assistant_intent {
    type: string
    sql: ${TABLE}."assistant_intent" ;;
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

  dimension: ced {
    type: string
    sql: ${TABLE}."ced" ;;
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

  dimension: eventtype {
    type: string
    sql: ${TABLE}."eventtype" ;;
  }

  dimension: inputtext {
    type: string
    sql: ${TABLE}."inputtext" ;;
  }

  dimension: iscaller {
    type: string
    sql: ${TABLE}."iscaller" ;;
  }

  dimension: localcallid {
    type: number
    value_format_name: id
    sql: ${TABLE}."localcallid" ;;
  }

  dimension_group: localtimestamp {
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
    sql: ${TABLE}."localtimestamp" ;;
  }

  dimension: nodetype {
    type: string
    sql: ${TABLE}."nodetype" ;;
  }

  dimension: orchestratorid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."orchestratorid" ;;
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

  dimension: sttscore {
    type: number
    sql: ${TABLE}."sttscore" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      agentname,
      businessunit.businessunitid,
      device.deviceid,
      session.agentname,
      session.clientsessionid,
      orchestrator.orchestratorid
    ]
  }
}
