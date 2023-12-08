# The name of this view in Looker is "Recommendations"
view: recommendations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.recommendations` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Action" in Explore.

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: advisor_id {
    type: number
    sql: ${TABLE}.advisorID ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: create {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.createDate ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_priority {
    type: sum
    sql: ${priority} ;;  }
  measure: average_priority {
    type: average
    sql: ${priority} ;;  }

  dimension: recommendation_description {
    type: string
    sql: ${TABLE}.recommendationDescription ;;
  }

  dimension: recommendation_name {
    type: string
    sql: ${TABLE}.recommendationName ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [recommendation_name]
  }
}
