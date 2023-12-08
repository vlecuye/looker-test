# The name of this view in Looker is "Timeseries Stock"
view: timeseries_stock {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.timeseries_stock` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Close" in Explore.

  dimension: close {
    type: number
    sql: ${TABLE}.close ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_close {
    type: sum
    sql: ${close} ;;  }
  measure: average_close {
    type: average
    sql: ${close} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: high {
    type: number
    sql: ${TABLE}.high ;;
  }

  dimension: low {
    type: number
    sql: ${TABLE}.low ;;
  }

  dimension: open {
    type: number
    sql: ${TABLE}.open ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  dimension: volume {
    type: number
    sql: ${TABLE}.volume ;;
  }
  measure: count {
    type: count
  }
}
