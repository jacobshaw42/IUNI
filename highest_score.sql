WITH cte AS (
SELECT
    userID,
    Attempt,
    100*SUM(isCorrect::int)/COUNT(isCorrect) AS score_percentage
FROM User_answers
GROUP BY userID, Attempt
ORDER BY userID DESC
),

cte2 AS (
SELECT 
    userID,
    MAX(score_percentage) AS max_score_percentage
FROM cte 
GROUP BY userID
ORDER BY userID DESC
)

SELECT
    users.Fullname,
    cte.Attempt, 
    cte2.max_score_percentage
FROM cte 
JOIN cte2 
    ON cte.userID=cte2.userID 
JOIN users 
    ON users.userID=cte.userID 
WHERE cte.score_percentage=cte2.max_score_percentage;