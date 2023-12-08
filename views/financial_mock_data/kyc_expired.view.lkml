# The name of this view in Looker is "Kyc Expired"
view: kyc_expired {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.kyc_expired` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: number
    sql: ${TABLE}.clientID ;;
  }

  dimension: days_since_kyc_expired {
    type: number
    sql: ${TABLE}.days_since_kyc_expired ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_days_since_kyc_expired {
    type: sum
    sql: ${days_since_kyc_expired} ;;  }
  measure: average_days_since_kyc_expired {
    type: average
    sql: ${days_since_kyc_expired} ;;  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.fullName ;;
  }
  measure: count {
    type: count
    drill_fields: [full_name]
  }
}
