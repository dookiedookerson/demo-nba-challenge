WITH player_game_logs_agg AS (
    SELECT 
        player_id,
        player_name,
        season,
        game_type,
        SUM(field_goals_made) AS field_goals_made,
        SUM(field_goals_attempted) AS field_goals_attempted,
        SUM(field_goals_made) / NULLIF(SUM(field_goals_attempted), 0) AS field_goal_pct,
        SUM(three_point_made) AS three_point_made,
        SUM(three_point_attempted) AS three_point_attempted,
        SUM(three_point_made) / NULLIF(SUM(three_point_attempted), 0) AS three_point_pct,
        SUM(free_throws_made) AS free_throws_made,
        SUM(free_throws_attempted) AS free_throws_attempted,
        SUM(free_throws_made) / NULLIF(SUM(free_throws_attempted), 0) AS free_throw_pct        
        
    FROM 
        {{ ref('stg_player_game_logs') }}
    GROUP BY 
        player_id, player_name, season, game_type
)



