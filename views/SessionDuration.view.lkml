view: session_duration {
  derived_table: {
      sql:  select sc.sessionid,sc."createdAt" as sessionStart,se."createdAt" as sessionEnd, age(se."createdAt", sc."createdAt") as sessionDuration
           ,extract(EPOCH from(se."createdAt"-sc."createdAt")) as sessionDurationSS
          from (

            select ss.sessionid,sh.eventtype,sh."createdAt"
            from session ss join sessionhistory sh on ss.sessionid = sh.sessionid
            where 1=1
            and dwf_product = 'CA'
            and sh.eventtype = 'sessionCreated'
          )sc
          left join
          (
            select ss.sessionid,sh.eventtype,sh."createdAt"
            from session ss join sessionhistory sh on ss.sessionid = sh.sessionid
            where 1=1
            and dwf_product = 'CA'
            and sh.eventtype = 'sessionEnded'
          )se on sc.sessionid = se.sessionid
          where se.sessionid is not null
          ;;
      }

  dimension: session_duration_time {
    description: "Session Duration on Time format"
    type: number
    sql: ${TABLE}.sessionDuration ;;
  }

  dimension: session_duration_ss {
    description: "Session Duration on Seconds format"
    type: number
    sql: ${TABLE}.sessionDurationSS ;;
  }

}


  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }


# view: sessionduration {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }


#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
