UPDATE users
SET Initials = CONCAT(SUBSTRING(SPLIT_PART(Fullname,' ',1),1,1),SUBSTRING(SPLIT_PART(Fullname,' ',2),1,1));