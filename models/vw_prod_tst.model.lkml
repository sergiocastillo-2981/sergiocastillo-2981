#connection: "vw_eu_prod_surrey"

#new connection
connection: "dwf_vw_prod_gcp"

# include all the views
include: "/views/**/*.view"
include: "/TEST_VW.dashboard"

datagroup: vw_prod_tst_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: vw_prod_tst_default_datagroup

#This is a sample on how to use access_grant.SC
access_grant: can_see_business_hours{
  user_attribute: department
  allowed_values: ["reporting_mgmt"] ##only users with department=reporting_mgmt will have access
}


explore: session {
  view_name: session
  join: device {
    type: left_outer
    sql_on: ${session.deviceid} = ${device.deviceid} ;;
    relationship: many_to_one
  }

  join: sessionhistory {
    type: left_outer
    sql_on: ${session.sessionid} = ${sessionhistory.sessionid} ;;
    relationship: one_to_many
  }

  join: intentdetails {
    type: left_outer
    sql_on: ${sessionhistory.correlationid} = ${intentdetails.correlationid} ;;
    relationship: many_to_one
  }

  join: surveyresult {
    type: left_outer
    sql_on: ${session.sessionid} = ${surveyresult.sessionid} ;;
    relationship: one_to_one
  }
}


explore: my_ext_exp {
  extends: [session]
  #view_label: "Sessions Skoda"

  access_filter: {
    field: session.brand
    user_attribute: department
  }

}


explore: rating {
  join: orchestrator {
    type: left_outer
    sql_on: ${rating.correlationid} = ${orchestrator.correlationid} ;;
    relationship: one_to_one
  }
}

explore: sessionhistory {
  join: session {
    type: left_outer
    sql_on: ${sessionhistory.sessionid} = ${session.sessionid} ;;
    relationship: many_to_one
  }

  join: device {
    type: left_outer
    sql_on: ${session.deviceid} = ${device.deviceid} ;;
    relationship: many_to_one
  }

  join: businessunit {
    type: left_outer
    sql_on: ${session.businessunitid} = ${businessunit.businessunitid} ;;
    relationship: many_to_one
  }
}

explore: cg_channel_config {
  label:  "Channels"
  join:  session {
    sql_on: ${cg_channel_config.id} = ${session.channelid} ;;
    relationship: many_to_one
  }
  join: sessionhistory {
    sql_on: ${sessionhistory.sessionid} = ${session.sessionid} ;;
    relationship: one_to_many
  }
}

# explore: session_duration {
#  join: session {
#  type:  left_outer
#  sql_on: ${session_duration.sessionid} = ${session.sessionid};;
#  relationship: many_to_one
#  }
# }
