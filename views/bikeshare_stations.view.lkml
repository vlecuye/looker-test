# The name of this view in Looker is "Bikeshare Stations"
view: bikeshare_stations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `austin_bikeshare.bikeshare_stations` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: alternate_name {
    type: string
    sql: ${TABLE}.alternate_name ;;
  }

  dimension: city_asset_number {
    type: number
    sql: ${TABLE}.city_asset_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_city_asset_number {
    type: sum
    sql: ${city_asset_number} ;;  }
  measure: average_city_asset_number {
    type: average
    sql: ${city_asset_number} ;;  }

  dimension: council_district {
    type: number
    sql: ${TABLE}.council_district ;;
  }

  dimension: footprint_length {
    type: number
    sql: ${TABLE}.footprint_length ;;
  }

  dimension: footprint_width {
    type: number
    sql: ${TABLE}.footprint_width ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: modified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.modified_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: number_of_docks {
    type: number
    sql: ${TABLE}.number_of_docks ;;
  }

  dimension: power_type {
    type: string
    sql: ${TABLE}.power_type ;;
  }

  dimension: property_type {
    type: string
    sql: ${TABLE}.property_type ;;
  }

  dimension: station_id {
    type: number
    sql: ${TABLE}.station_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
    drill_fields: [alternate_name, name]
  }
}
