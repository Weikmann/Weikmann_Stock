-- CREATE TABLE, Abgabe WEIKMANN, 6ACIF
CREATE OR REPLACE PROCEDURE PROC_CT_CUSTOMER IS
    V_CNT Number;
BEGIN

    -- set serveroutput on;
    -- execute dbms_output.put_line ('Versuche eine Tabelle Customer ueber PL/SQL zu erstellen!');
    
    SELECT COUNT(*) INTO V_CNT
       FROM ALL_TABLES
            WHERE OWNER = 'DEMO' AND
                  TABLE_NAME = 'CUSTOMER';

      -- execute dbms_output.put_line ('Anzahl der gefundenen CUSTOMER-Tabellen: ' || V_CNT);
      IF V_CNT = 0 THEN
         EXECUTE IMMEDIATE 'CREATE TABLE CUSTOMER
                            (
                            CUSTOMER_ID INTEGER PRIMARY KEY,
                            EMAIL       VARCHAR2(45),
                            FIRSTNAME   VARCHAR2(40),
                            LASTNAME    VARCHAR2(40),
                            GENDER      VARCHAR2(20),
                            BIRTHDAY    DATE,
                            CREDITS     DECIMAL(4)
                            )';
         COMMIT;
      END IF;

      SELECT COUNT(*) INTO V_CNT
         FROM ALL_SEQUENCES
         WHERE SEQUENCE_OWNER = 'DEMO' AND
         SEQUENCE_NAME = 'SEQ_CUSTOMER_ID';

             
    IF V_CNT = 0 THEN
       EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_CUSTOMER_ID
                          START WITH   10000
                          INCREMENT BY 1
                          CACHE        50';
       COMMIT;
    END IF;

END PROC_CT_CUSTOMER;



