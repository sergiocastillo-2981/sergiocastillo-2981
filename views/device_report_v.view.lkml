view: device_report_v {
  sql_table_name: public.device_report_v ;;

  dimension: channeltype {
    type: string
    sql: ${TABLE}."channeltype" ;;
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

  dimension: deviceid {
    type: string
    # hidden: yes
    sql: ${TABLE}."deviceid" ;;
  }

  dimension: devicetype {
    type: string
    sql: ${TABLE}."devicetype" ;;
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

  dimension: userid {
    type: string
    sql: ${TABLE}."userid" ;;
  }

  measure: count {
    type: count
    drill_fields: [device.deviceid]
  }
}
