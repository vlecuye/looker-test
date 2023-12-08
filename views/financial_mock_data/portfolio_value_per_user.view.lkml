# The name of this view in Looker is "Portfolio Value per User"
view: portfolio_value_per_user {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.portfolio_value_per_user` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Assettype" in Explore.

  dimension: assettype {
    type: string
    sql: ${TABLE}.assettype ;;
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

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}.section ;;
  }

  dimension: sharevalue {
    type: number
    sql: ${TABLE}.sharevalue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sharevalue {
    type: sum
    sql: ${sharevalue} ;;  }
  measure: average_sharevalue {
    type: average
    sql: ${sharevalue} ;;  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userID ;;
  }
  measure: count {
    type: count
  }
}
