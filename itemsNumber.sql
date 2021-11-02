SELECT ITEM_NAME
FROM ITEMS AS I

JOIN STOCK AS S
    ON I.ITEM_ID = S.ITEM_ID
    

WHERE 
    PROVIDER_ID = 1001
    AND ITEMS_COUNT = 0 
    AND S.STORE_ID = 503

