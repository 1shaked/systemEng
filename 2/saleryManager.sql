SELECT salery -- SALERY = משכורת בעיברית

FROM WROKERS -- worders = טבלת העובדים

WHERE 
    [WORKER_ROLE] = 'manager' -- כאשר התפקיד הוא מנהל בתכלס אמור להיות תעודות זהות תפקיד אבל במקרה שלנו זה מה שנתנו
    and [Store_ID] = 15 -- המספר סניף שלנו הוא
