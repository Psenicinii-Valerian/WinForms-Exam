SELECT S.NUME, S.PRENUME, G.NUME AS GRUPA, F.NUME AS FACULTATEA, SS.NUME AS SPECIALITATEA, D.NUME AS DISCIPLINA, L.NUME AS EXAMINATOR, EX.DATA_EXAMINARII,

	   (SELECT COUNT(DISTINCT(S.STUDENT_ID)) FROM STUDENT S INNER JOIN GRUPA GG ON GG.GRUPA_ID = S.GRUPA_ID
									   INNER JOIN NOTA NN ON NN.STUDENT_ID = S.STUDENT_ID
									   INNER JOIN SPECIALITATE SSS ON SSS.SPECIALITATE_ID = GG.SPECIALITATE_ID
									   INNER JOIN EXAMINARE EXX ON EXX.SPECIALITATEA_ID = SSS.SPECIALITATE_ID
									   INNER JOIN DISCIPLINA DD ON DD.DISCIPLINA_ID = EXX.DISCIPLINA_ID
			WHERE G.NUME = GG.NUME AND DD.NUME = D.NUME AND EXX.DATA_EXAMINARII = EXX.DATA_EXAMINARII AND NN.NOTA_ID = N.NOTA_ID) AS STUDENTI 

FROM STUDENT S INNER JOIN GRUPA G ON G.GRUPA_ID = S.GRUPA_ID
			   INNER JOIN NOTA N ON N.STUDENT_ID = S.STUDENT_ID
			   INNER JOIN EXAMINARE EX ON EX.EXAMINARE_ID = N.EXAMINARE_ID
			   INNER JOIN DISCIPLINA D ON D.DISCIPLINA_ID = EX.DISCIPLINA_ID
			   INNER JOIN SPECIALITATE SS ON SS.SPECIALITATE_ID = EX.SPECIALITATEA_ID
			   INNER JOIN FACULTATE F ON F.FACULTATE_ID = SS.FACULTATE_ID
			   INNER JOIN LECTOR L ON L.LECTOR_ID = EX.LECTOR_ID

WHERE (SELECT COUNT(DISTINCT(S.STUDENT_ID)) FROM STUDENT S INNER JOIN GRUPA GG ON GG.GRUPA_ID = S.GRUPA_ID
									   INNER JOIN NOTA NN ON NN.STUDENT_ID = S.STUDENT_ID
									   INNER JOIN SPECIALITATE SSS ON SSS.SPECIALITATE_ID = GG.SPECIALITATE_ID
									   INNER JOIN EXAMINARE EXX ON EXX.SPECIALITATEA_ID = SSS.SPECIALITATE_ID
									   INNER JOIN DISCIPLINA DD ON DD.DISCIPLINA_ID = EXX.DISCIPLINA_ID
			WHERE G.NUME = GG.NUME AND DD.NUME = D.NUME AND EXX.DATA_EXAMINARII = EXX.DATA_EXAMINARII AND NN.NOTA_ID = N.NOTA_ID) > 0

