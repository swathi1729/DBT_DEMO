with trips as (
    select 
    RIDE_ID,
    RIDEABLE_TYPE,
    date(to_timestamp(STARTED_AT)) as trip_date,
    START_STATIO_ID as START_STATION_ID,
    END_STATION_NAME as END_STATION_NAME,
    MEMBER_CSUAL as MEMBER_CASUAL,
    timestampdiff(second,to_timestamp(STARTED_AT),to_timestamp(ENDED_AT)) as trip_duration_secs,
    *
    from {{ source('demo', 'bike') }}
    limit 10
)
select * from trips