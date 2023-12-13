# The name of this view in Looker is "Bikeshare Trips"
view: bikeshare_trips {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `austin_bikeshare.bikeshare_trips` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bike ID" in Explore.

  dimension: bike_id {
    type: string
    description: "ID of bike used"
    sql: ${TABLE}.bike_id ;;
  }

  dimension: bike_type {
    type: string
    description: "Type of bike used"
    sql: ${TABLE}.bike_type ;;
  }

  dimension: duration_minutes {
    type: number
    description: "Time of trip in minutes"
    sql: ${TABLE}.duration_minutes ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_minutes {
    type: sum
    sql: ${duration_minutes} ;;  }
  measure: average_duration_minutes {
    type: average
    sql: ${duration_minutes} ;;  }

  dimension: end_station_id {
    type: string
    description: "Numeric reference for end station"
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_station_name {
    type: string
    description: "Station name for end station"
    sql: ${TABLE}.end_station_name ;;
  }

  dimension: start_station_id {
    type: number
    description: "Numeric reference for start station"
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_station_name {
    type: string
    description: "Station name for start station"
    sql: ${TABLE}.start_station_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: start {
    type: time
    description: "Start timestamp of trip"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_time ;;
  }

  dimension: subscriber_type {
    type: string
    description: "Type of the Subscriber"
    sql: ${TABLE}.subscriber_type ;;
  }

  dimension: trip_id {
    type: string
    description: "Numeric ID of bike trip"
    sql: ${TABLE}.trip_id ;;
  }
  measure: count {
    type: count
    drill_fields: [start_station_name, end_station_name]
  }
}
