{%- set file_path = env_var("DBT_FED_SRC_EXT_FILE_PATH", "/fed_holdings.csv") -%}
{%- set external_stage_name = env_var("DBT_FED_SRC_EXT_STG", "fed_data") -%}
{%- set database = env_var("DBT_FED_SRC_FILE_FRT_DB", target.database) -%}
{%- set schema = env_var("DBT_FED_SRC_FILE_FRT_SCH", target.schema) -%}
{%- set file_format = env_var("DBT_FED_SRC_FILE_FRT_NAME", "FED_HOLDING_CSV_FILE_FORMAT") -%}

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
FROM @{{source('fed_staging',external_stage_name)}}{{file_path}} (file_format => {{ database }}.{{ schema }}.FED_HOLDING_CSV_FILE_FORMAT) t