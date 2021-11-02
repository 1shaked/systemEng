/*
STORES = סניפים טבלה
WORKERS = טבלת העובדים
W.STORE_ID = מספר חנות 
S.ADDRESS = כתובת החנות
W.ADDRESS = כתובת העובד
 אפשר להשתמש ורצוי ב 
 in 
 במקום ב = פה מכיון שבחלק גדול מה
    sql 
    הוא לא יקבל את זה כי יש פה אוסף של עובדים אבל חלק כן יעבדו טוב רשמתי את שני האופציות
*/
-- OPTION ONE
SELECT STORE_ID 
FROM STORES AS S
WHERE S.ADDRESS LIKE '%גבעת שמואל%' 
AND S.STORE_ID = (
    SELECT W.STORE_ID
    FROM WORKERS AS W
    WHERE W.ADDRESS LIKE '%פתח תקווה%'
) -- you can also wrote here AND S.STORE_ID in (...)

-- OPTION TWO
SELECT STORE_ID 
FROM STORES AS S
JOIN WORKERS AS W
    ON W.STORE_ID = S.STORE_ID
    AND W.ADDRESS LIKE '%פתח תקווה%'
WHERE S.ADDRESS LIKE '%גבעת שמואל%'


-- OPTION 3 ONLY TO BE COMPATIBLE WITH ALL SQL  VERSIONS
SELECT STORE_ID 
FROM STORES AS S
WHERE S.ADDRESS LIKE '%גבעת שמואל%' 
AND S.STORE_ID in (
    SELECT W.STORE_ID
    FROM WORKERS AS W
    WHERE W.ADDRESS LIKE '%פתח תקווה%'
)