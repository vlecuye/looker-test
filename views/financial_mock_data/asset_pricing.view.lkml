# The name of this view in Looker is "Asset Pricing"
view: asset_pricing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.asset_pricing` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Asset ID" in Explore.

  dimension: asset_id {
    type: string
    sql: ${TABLE}.asset_id ;;
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

  dimension: high_price {
    type: number
    sql: ${TABLE}.high_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_high_price {
    type: sum
    sql: ${high_price} ;;  }
  measure: average_high_price {
    type: average
    sql: ${high_price} ;;  }

  dimension: low_price {
    type: number
    sql: ${TABLE}.low_price ;;
  }
  measure: count {
    type: count
  }
}
