SELECT S.NUME + ' ' + S.PRENUME AS STUDENT, * FROM STUDENT S INNER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID
														  INNER JOIN NOTA N ON N.STUDENT_ID = S.STUDENT_ID
														  INNER JOIN EXAMINARE EX ON EX.EXAMINARE_ID = N.EXAMINARE_ID
														  INNER JOIN LECTOR L ON L.LECTOR_ID = EX.LECTOR_ID
  WHERE S.NUME + ' ' + S.PRENUME = :STUDENT AND S.GEN = :GEN AND S.IDNP = :IDNP AND S.DATA_NASTERII = :DATA_NASTERII AND G.NUME = :NUME AND L.LECTOR_ID = :LECTOR