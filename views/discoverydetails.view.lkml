view: discoverydetails {
  sql_table_name: public.discoverydetails ;;

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

  dimension: discoveryid {
    type: number
    value_format_name: id
    sql: ${TABLE}."discoveryid" ;;
  }

  dimension: discoveryutterance {
    type: string
    sql: ${TABLE}."discoveryutterance" ;;
  }

  dimension: documentid {
    type: string
    sql: ${TABLE}."documentid" ;;
  }

  dimension: matchingdocuments {
    type: string
    sql: ${TABLE}."matchingdocuments" ;;
  }

  dimension: orchestratorid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."orchestratorid" ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}."question" ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}."rating" ;;
  }

  dimension: recommendedanswer {
    type: string
    sql: ${TABLE}."recommendedanswer" ;;
  }

  dimension: reviewtext {
    type: string
    sql: ${TABLE}."reviewtext" ;;
  }

  dimension: sessionid {
    type: string
    # hidden: yes
    sql: ${TABLE}."sessionid" ;;
  }

  dimension: sourcetitle {
    type: string
    sql: ${TABLE}."sourcetitle" ;;
  }

  dimension: sourceurl {
    type: string
    sql: ${TABLE}."sourceurl" ;;
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
    drill_fields: [session.agentname, session.clientsessionid, orchestrator.orchestratorid]
  }
}
