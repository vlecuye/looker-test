include: "/views/*.view.lkml"
include: "/explores/*.explore.lkml"
# Define the database connection to be used for this model.
connection: "financial_demo"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: ax360_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "0 seconds"
}
persist_with: ax360_demo_default_datagroup

explore: bikeshare_stations {}
explore: bikeshare_trips {
  join: bikeshare_stations{
    sql_on: ${bikeshare_stations.station_id} = ${bikeshare_trips.end_station_id} ;;
    relationship: one_to_many
  }
}
