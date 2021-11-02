/*
    ITEMS = טבלת המוצרים שלנו 
    STOCK = טבלת המלאי בסניף
    I.ITEM_ID = מספר המוצר בטבלת המוצרים
    S.ITEM_ID = מספר המוצר בטבלת המלאי
    S.ITEMS_COUNT = כמות במאי בטבלת המוצרים שלנו
    I.PROVIDER_ID = המספר ספק שלנו בטבלת מוצר
*/
-- OPTION ONE
SELECT ITEM_NAME
FROM ITEMS AS I
JOIN STOCK AS S
    ON I.ITEM_ID = S.ITEM_ID
    AND S.ITEMS_COUNT = 0 
WHERE 
    I.PROVIDER_ID = 1001
    AND S.STORE_ID = 503

-- OPTION TWO SUBQURY
SELECT ITEM_NAME
FROM ITEMS AS I
WHERE I.ITEM_ID IN (
        SELECT S.ITEM_ID
        FROM STOCK AS S
        WHERE S.ITEMS_COUNT = 0
            AND S.STORE_ID = 503
    ) AND I.PROVIDER_ID = 1001


-- OPTION 3 SUBQURY
SELECT ITEM_NAME
FROM ITEMS AS I
WHERE I.ITEM_ID = (
        SELECT S.ITEM_ID
        FROM STOCK AS S
        WHERE S.ITEMS_COUNT = 0
            AND S.STORE_ID = 503
    ) AND I.PROVIDER_ID = 1001

