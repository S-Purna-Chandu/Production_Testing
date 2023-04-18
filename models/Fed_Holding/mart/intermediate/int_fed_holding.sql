{{ config(
    unique_key = 'CUSIP, As_Of_Date'
) }}

SELECT
    ROW_NUMBER() OVER(ORDER BY AsOfDate) AS ID,
    AsOfDate,
    CUSIP,
    SecurityType,
    SecurityDescription,
    Term,
    MaturityDate,
    Issuer,
    SpreadPct,
    CouponPct,
    CurrentFaceValue,
    ParValue,
    InflationCompensation,
    PercentOutstanding,
    ChangeFromPriorWeek,
    ChangeFromPriorYear,
    isAggregated,
    CURRENT_TIMESTAMP() as CreatedDate,
    CURRENT_USER() as CreatedBy,
    CURRENT_TIMESTAMP() as ModifiedDate,
    CURRENT_USER() as ModifiedBy
FROM {{ ref('raw_fed_holding') }}
-- {% if is_incremental() %}

--   -- this filter will only be applied on an incremental run
--   where As_Of_Date > (SELECT MAX(As_Of_Date) FROM {{ this }})

-- {% endif %}