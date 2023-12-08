# The name of this view in Looker is "Timeseries Portfolio Value"
view: timeseries_portfolio_value {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.timeseries_portfolio_value` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Asset Category" in Explore.

  dimension: asset_category {
    type: string
    sql: ${TABLE}.asset_category ;;
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.asset_type ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: esg_score {
    type: number
    sql: ${TABLE}.esg_score ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_esg_score {
    type: sum
    sql: ${esg_score} ;;  }
  measure: average_esg_score {
    type: average
    sql: ${esg_score} ;;  }

  dimension: risk_score {
    type: number
    sql: ${TABLE}.risk_score ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
  }
}
