include: "/views/*.view.lkml"
# Define the database connection to be used for this model.
connection: "financial_demo"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: ax360_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
persist_with: ax360_demo_default_datagroup

explore: bikeshare_stations {}
explore: bikeshare_trips {}
