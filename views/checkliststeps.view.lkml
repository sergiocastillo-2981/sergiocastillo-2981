view: checkliststeps {
  sql_table_name: public.checkliststeps ;;

  dimension: checklistid {
    type: string
    # hidden: yes
    sql: ${TABLE}."checklistid" ;;
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

  dimension: issatisfied {
    type: yesno
    sql: ${TABLE}."issatisfied" ;;
  }

  dimension_group: statisfieddate {
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
    sql: ${TABLE}."statisfieddate" ;;
  }

  dimension: stepid {
    type: string
    sql: ${TABLE}."stepid" ;;
  }

  dimension: stepname {
    type: string
    sql: ${TABLE}."stepname" ;;
  }

  dimension: timeoutsecs {
    type: number
    sql: ${TABLE}."timeoutsecs" ;;
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
    drill_fields: [stepname, checklist.checklistid, checklist.processname]
  }
}
