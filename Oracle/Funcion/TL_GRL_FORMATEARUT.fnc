CREATE OR REPLACE FUNCTION SITLA.TL_GRL_FORMATEARUT( 
    IN_RUT_LITIGANTE    IN  VARCHAR
,   IN_RUT_DV           IN  VARCHAR
)


RETURN VARCHAR AS 

/*--***************************************************************************
  Nombre    : TL_GRL_FORMATEARUT
  Proposito : Dar formato a rut
  
  Control   : Modificaciones
  ___________________________________________________________________________ 
  Referencia      fecha             autor                         Descripcion
  ___________________________________________________________________________
  (01)           30-07-2019      Julio Courbis              Creacion  de la funcion
  
  Observaciones:

--****************************************************************************/ 
    
    AUX_RUT VARCHAR(15);

BEGIN 

    SELECT  CASE
        WHEN    
            LENGTH(IN_RUT_LITIGANTE)   >   6
                THEN
                    SUBSTR(IN_RUT_LITIGANTE,0,LENGTH(IN_RUT_LITIGANTE)-6)||'.'||SUBSTR(IN_RUT_LITIGANTE,LENGTH(IN_RUT_LITIGANTE)-5,3)||'.'||SUBSTR(IN_RUT_LITIGANTE,LENGTH(IN_RUT_LITIGANTE)-2,3)
        WHEN    
            LENGTH(IN_RUT_LITIGANTE)   BETWEEN 4   AND 6
                THEN
                    SUBSTR(IN_RUT_LITIGANTE,0,LENGTH(IN_RUT_LITIGANTE)-3)||'.'||SUBSTR(IN_RUT_LITIGANTE,LENGTH(IN_RUT_LITIGANTE)-2,3)
        ELSE
                TO_CHAR(IN_RUT_LITIGANTE)
        END ||'-'|| IN_RUT_DV  
    INTO    AUX_RUT            
    FROM    DUAL;     
        
    RETURN  AUX_RUT;
END;
/

