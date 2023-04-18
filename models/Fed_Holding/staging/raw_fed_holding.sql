{%- set table_name = '/fed_holdings.csv' -%}

select 
    t.$1::DATE AS AsOfDate,
    REPLACE(t.$2, '\'', '')::VARCHAR(11) AS CUSIP,
    t.$3::VARCHAR(15) AS SecurityType,
    t.$4::VARCHAR(30) AS SecurityDescription,
    t.$5::VARCHAR(10) AS Term,
    t.$6::DATE AS MaturityDate,
    t.$7::VARCHAR(10) AS Issuer,
    t.$8::FLOAT AS SpreadPct,
    t.$9::FLOAT AS CouponPct,
    t.$10::FLOAT AS CurrentFaceValue,
    t.$11::FLOAT AS ParValue,
    t.$12::FLOAT AS InflationCompensation,
    t.$13::FLOAT AS PercentOutstanding,
    t.$14::FLOAT AS ChangeFromPriorWeek,
    t.$15::FLOAT AS ChangeFromPriorYear,
    t.$16::VARCHAR(1) AS isAggregated
FROM @{{source('staging','fed_data')}}{{table_name}} (file_format => FED_HOLDING_CSV_FILE_FORMAT) t