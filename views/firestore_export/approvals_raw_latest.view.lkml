# The name of this view in Looker is "Approvals Raw Latest"
view: approvals_raw_latest {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `firestore_export.approvals_raw_latest` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Data" in Explore.

  dimension: data {
    type: string
    description: "The full JSON representation of the current document state."
    sql: ${TABLE}.data ;;
    html: <a href="banana">{{rendered_value}}}</a>" ;;
    link:{
      label: "test"
      url: "/banane"
    }
  }

  dimension: status {
    type: string
    sql: SELECT JSON_VALUE(${data}, '$.status') AS status
  }
  dimension: document_id {
    type: string
    description: "The document id as defined in the firestore database."
    sql: ${TABLE}.document_id ;;
  }
  dimension: document_name {
    type: string
    description: "The full name of the changed document, for example, projects/collection/databases/(default)/documents/users/me)."
    sql: ${TABLE}.document_name ;;
  }

  dimension: event_id {
    type: string
    description: "The ID of the most-recent document change event that triggered the Cloud Function created by the extension. Empty for imports."
    sql: ${TABLE}.event_id ;;
  }

  dimension: old_data {
    type: string
    description: "The full JSON representation of the document state before the indicated operation is applied."
    sql: ${TABLE}.old_data ;;
  }

  dimension: operation {
    type: string
    description: "One of CREATE, UPDATE, IMPORT."
    sql: ${TABLE}.operation ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestamp {
    type: time
    description: "The commit timestamp of this change in Cloud Firestore. If the operation is IMPORT, this timestamp is epoch to ensure that any operation on an imported document supersedes the IMPORT."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [document_name]
  }
}
