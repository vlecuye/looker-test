# The name of this view in Looker is "Prospects Metrics"
view: prospects_metrics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.prospects_metrics` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Converted" in Explore.

  dimension: converted {
    type: number
    sql: ${TABLE}.converted ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_converted {
    type: sum
    sql: ${converted} ;;  }
  measure: average_converted {
    type: average
    sql: ${converted} ;;  }

  dimension: current_prospects {
    type: number
    sql: ${TABLE}.current_prospects ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: target_prospects {
    type: number
    sql: ${TABLE}.target_prospects ;;
  }
  measure: count {
    type: count
  }
}
