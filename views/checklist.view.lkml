view: checklist {
  sql_table_name: public.checklist ;;
  drill_fields: [checklistid]

  dimension: checklistid {
    primary_key: yes
    type: string
    sql: ${TABLE}."checklistid" ;;
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

  dimension: groupid {
    type: string
    sql: ${TABLE}."groupid" ;;
  }

  dimension: issatisfied {
    type: yesno
    sql: ${TABLE}."issatisfied" ;;
  }

  dimension: listofsteps {
    type: string
    sql: ${TABLE}."listofsteps" ;;
  }

  dimension: processname {
    type: string
    sql: ${TABLE}."processname" ;;
  }

  dimension: projectid {
    type: string
    sql: ${TABLE}."projectid" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
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
    drill_fields: [checklistid, processname, session.agentname, session.clientsessionid, checkliststeps.count]
  }
}
