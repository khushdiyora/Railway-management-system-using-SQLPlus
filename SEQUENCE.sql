-- Assuming USERS is a sequence, you should query the sequence for the current value
-- This will depend on how the sequence is named; replace 'USERS' with your actual sequence name
SELECT USERS.CURRVAL FROM DUAL; 
-- Or to get the next value
SELECT USERS.NEXTVAL FROM DUAL;
