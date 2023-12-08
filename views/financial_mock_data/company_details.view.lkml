# The name of this view in Looker is "Company Details"
view: company_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `financial_mock_data.company_details` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called " 200 Day Moving Average" in Explore.

  dimension: _200_day_moving_average {
    type: number
    sql: ${TABLE}._200DayMovingAverage ;;
  }

  dimension: _50_day_moving_average {
    type: number
    sql: ${TABLE}._50DayMovingAverage ;;
  }

  dimension: _52_week_high {
    type: number
    sql: ${TABLE}._52WeekHigh ;;
  }

  dimension: _52_week_low {
    type: number
    sql: ${TABLE}._52WeekLow ;;
  }

  dimension: _symbol_ {
    type: string
    sql: ${TABLE}._Symbol_ ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: analyst_target_price {
    type: number
    sql: ${TABLE}.AnalystTargetPrice ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_analyst_target_price {
    type: sum
    sql: ${analyst_target_price} ;;  }
  measure: average_analyst_target_price {
    type: average
    sql: ${analyst_target_price} ;;  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.AssetType ;;
  }

  dimension: beta {
    type: number
    sql: ${TABLE}.Beta ;;
  }

  dimension: book_value {
    type: number
    sql: ${TABLE}.BookValue ;;
  }

  dimension: cik {
    type: number
    sql: ${TABLE}.CIK ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.Currency ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: diluted_epsttm {
    type: number
    sql: ${TABLE}.DilutedEPSTTM ;;
  }

  dimension: dividend_date {
    type: string
    sql: ${TABLE}.DividendDate ;;
  }

  dimension: dividend_per_share {
    type: number
    sql: ${TABLE}.DividendPerShare ;;
  }

  dimension: dividend_yield {
    type: number
    sql: ${TABLE}.DividendYield ;;
  }

  dimension: ebitda {
    type: string
    sql: ${TABLE}.EBITDA ;;
  }

  dimension: eps {
    type: number
    sql: ${TABLE}.EPS ;;
  }

  dimension: evto_ebitda {
    type: string
    sql: ${TABLE}.EVToEBITDA ;;
  }

  dimension: evto_revenue {
    type: string
    sql: ${TABLE}.EVToRevenue ;;
  }

  dimension: ex_dividend_date {
    type: string
    sql: ${TABLE}.ExDividendDate ;;
  }

  dimension: exchange {
    type: string
    sql: ${TABLE}.Exchange ;;
  }

  dimension: fiscal_year_end {
    type: string
    sql: ${TABLE}.FiscalYearEnd ;;
  }

  dimension: forward_pe {
    type: string
    sql: ${TABLE}.ForwardPE ;;
  }

  dimension: gross_profit_ttm {
    type: number
    sql: ${TABLE}.GrossProfitTTM ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: latest_quarter {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.LatestQuarter ;;
  }

  dimension: market_capitalization {
    type: number
    sql: ${TABLE}.MarketCapitalization ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: operating_margin_ttm {
    type: number
    sql: ${TABLE}.OperatingMarginTTM ;;
  }

  dimension: pegratio {
    type: number
    sql: ${TABLE}.PEGRatio ;;
  }

  dimension: peratio {
    type: number
    sql: ${TABLE}.PERatio ;;
  }

  dimension: price_to_book_ratio {
    type: number
    sql: ${TABLE}.PriceToBookRatio ;;
  }

  dimension: price_to_sales_ratio_ttm {
    type: number
    sql: ${TABLE}.PriceToSalesRatioTTM ;;
  }

  dimension: profit_margin {
    type: number
    sql: ${TABLE}.ProfitMargin ;;
  }

  dimension: quarterly_earnings_growth_yoy {
    type: number
    sql: ${TABLE}.QuarterlyEarningsGrowthYOY ;;
  }

  dimension: quarterly_revenue_growth_yoy {
    type: number
    sql: ${TABLE}.QuarterlyRevenueGrowthYOY ;;
  }

  dimension: return_on_assets_ttm {
    type: number
    sql: ${TABLE}.ReturnOnAssetsTTM ;;
  }

  dimension: return_on_equity_ttm {
    type: number
    sql: ${TABLE}.ReturnOnEquityTTM ;;
  }

  dimension: revenue_per_share_ttm {
    type: number
    sql: ${TABLE}.RevenuePerShareTTM ;;
  }

  dimension: revenue_ttm {
    type: number
    sql: ${TABLE}.RevenueTTM ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.Sector ;;
  }

  dimension: shares_outstanding {
    type: number
    sql: ${TABLE}.SharesOutstanding ;;
  }

  dimension: trailing_pe {
    type: number
    sql: ${TABLE}.TrailingPE ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
