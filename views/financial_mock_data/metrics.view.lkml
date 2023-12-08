# The name of this view in Looker is "Metrics"
view: metrics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.metrics` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Advisor ID" in Explore.

  dimension: advisor_id {
    type: number
    sql: ${TABLE}.advisorID ;;
  }

  dimension: current {
    type: number
    sql: ${TABLE}.`current` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_current {
    type: sum
    sql: ${current} ;;  }
  measure: average_current {
    type: average
    sql: ${current} ;;  }

  dimension: dashboard_id {
    type: number
    sql: ${TABLE}.dashboardID ;;
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

  dimension: metric_type {
    type: string
    sql: ${TABLE}.metricType ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}.target ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }
  measure: count {
    type: count
  }
}
