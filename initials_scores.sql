SELECT 
    u.Initials,
    ans.Attempt, 
    100*SUM(ans.isCorrect::int)/count(ans.isCorrect) score_percentage
FROM User_answers ans
JOIN users u
    ON u.userID=ans.userID
GROUP BY ans.Attempt,u.Initials;