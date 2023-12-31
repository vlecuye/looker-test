include: "/views/firestore_export/*.view.lkml"
include: "/views/financial_mock_data/*.view.lkml"
# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Financial Demo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.


explore: trades {
  join: company_details {
    sql_on: ${trades.symbol} = ${company_details._symbol_};;
    relationship: many_to_one
  }
  access_filter: {
    field:trades.advisor_id
    user_attribute: advisorid
  }
  }
explore: symbol_shares {}
