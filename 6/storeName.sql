/*
    S.STORE_NAME = שם חנות
    STORES = טבלת החנויות
    STOCK - טבלת המוצרים
    T.ITEMS_COUNT = מספר המוצרים שבמלאי מטבלת המלאי
    T.STORE_ID = מספר החנות מטבלת המלאי
    I.ITEM_ID = מספר מוצר מטבלת המוצרים
    I.SPPLAYER_ID = מספר ספק
*/
-- FIRST OPTION
SELECT S.STORE_NAME
FROM STORES AS S
JOIN STOCK AS T ON 
    T.ITEMS_COUNT = 0 
    AND T.STORE_ID = S.STORE_ID
JOIN ITEMS AS I ON 
    I.ITEM_ID = T.ITEM_ID 
    AND I.SPPLAYER_ID != 1506


-- OPTION TWO SUBQURY
SELECT S.STORE_NAME
FROM STORES AS S
WHERE S.STORE_ID IN (
        SELECT T.STORE_ID
        FROM STOCK AS T
        WHERE T.ITEMS_COUNT = 0
            AND  T.ITEM_ID IN (
                SELECT I.ITEM_ID
                FROM ITEMS AS I
                WHERE I.SPPLAYER_ID != 1506
            )
    ) 

-- OPTION THREE WHERE AND JOIN 
SELECT S.STORE_NAME
FROM STORES AS S
JOIN STOCK AS T ON 
    T.STORE_ID = S.STORE_ID
JOIN ITEMS AS I ON 
    I.ITEM_ID = T.ITEM_ID 
WHERE 
    T.ITEMS_COUNT = 0 
    I.SPPLAYER_ID != 1506

    