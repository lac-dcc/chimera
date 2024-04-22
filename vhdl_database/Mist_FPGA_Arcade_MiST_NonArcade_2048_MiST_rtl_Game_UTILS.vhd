LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.GAME_TYPES.ALL;

-- Definizioni delle funzioni e delle procedure contenute nel package
PACKAGE GAME_UTILS IS
	FUNCTION digit_to_7seg (A: INTEGER RANGE 0 TO 9) 
		RETURN STD_LOGIC_VECTOR;
	FUNCTION reverse (A: STD_LOGIC_VECTOR) 
		RETURN STD_LOGIC_VECTOR;
	FUNCTION checkGameOver (values: GAME_GRID)
		RETURN STD_LOGIC;
	FUNCTION checkVictory (values: GAME_GRID)
		RETURN STD_LOGIC;
	PROCEDURE splitNumber 
	(
		number			: IN INTEGER RANGE 0 TO 9999; 
		X4, X3, X2, X1	: OUT INTEGER RANGE 0 TO 9
	);
	PROCEDURE convertCoord 
	(
		position		: IN INTEGER RANGE 0 TO 16; 
		X, Y			: OUT INTEGER RANGE 0 TO 3
	);
	FUNCTION compare(curr_values: GAME_GRID; next_values: GAME_GRID) 
		RETURN STD_LOGIC; 
END GAME_UTILS;
 
PACKAGE BODY GAME_UTILS IS

-- Conversione da cifra a vettore di bit per 7 segmenti
FUNCTION digit_to_7seg (A: INTEGER RANGE 0 TO 9) RETURN STD_LOGIC_VECTOR IS
	-- Risultato: uscita 7 bit per 7 segmenti
	VARIABLE RESULT: STD_LOGIC_VECTOR(6 downto 0);
BEGIN
	CASE A IS
		-- Logica negativa
		WHEN 0 	=> RESULT := NOT"0111111";
		WHEN 1 	=> RESULT := NOT"0000110";
		WHEN 2 	=> RESULT := NOT"1011011";
		WHEN 3 	=> RESULT := NOT"1001111";
		WHEN 4 	=> RESULT := NOT"1100110";
		WHEN 5 	=> RESULT := NOT"1101101";
		WHEN 6 	=> RESULT := NOT"1111101";
		WHEN 7 	=> RESULT := NOT"0000111";
		WHEN 8 	=> RESULT := NOT"1111111";
		WHEN 9 	=> RESULT := NOT"1101111";
		WHEN -- caso impossibile 
		OTHERS 	=> RESULT := NOT"0000000";
	END CASE;
	RETURN RESULT;
END digit_to_7seg;
		
-- Inversione di un generico vettore
FUNCTION reverse (A: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
	-- Risultato: vettore della stessa dimensione del vettore d'ingresso
	VARIABLE RESULT	: STD_LOGIC_VECTOR(A'RANGE);
	ALIAS AA		: STD_LOGIC_VECTOR(A'REVERSE_RANGE) IS A;
BEGIN
	FOR i IN AA'RANGE LOOP
		RESULT(i) := AA(i);
	END LOOP;
	RETURN RESULT;
END reverse;

-- Funz. che stabilisce se la partita sia stata persa o meno
FUNCTION checkGameOver(values: GAME_GRID) RETURN std_logic IS
	variable full		: STD_LOGIC	:= '1';
	variable mergeable	: STD_LOGIC := '0';
	variable result  	: STD_LOGIC := '0';
BEGIN
	for i in 0 to 3 loop
		for j in 0 to 3 loop
			if(values(i,j) = 0)
			then
				full := '0';
			end if;
		end loop;
	end loop;
	for i in 0 to 2 loop
		for j in 0 to 2 loop
			if(
				(values(i,j) = values(i+1,j)) or
				(values(i,j) = values(i,j+1))
			)
			then
				mergeable := '1';
			end if;
		end loop;
	end loop;
	-- controllo ultima riga
	for i in 1 to 3 loop
		if(
			(values(3,i-1) = values(3,i)) or
			(values(i-1,3) = values(i,3))
		)
		then
			mergeable := '1';
		end if;
	end loop;
	
	result := full and (not mergeable);
	return result;
END FUNCTION checkGameOver;

--Funz. che stabilisce se la partita sia terminata con la vittoria
FUNCTION checkVictory(values: GAME_GRID) RETURN std_logic IS
	variable result			: STD_LOGIC := '0';
	constant victory_score 	: INTEGER RANGE 0 to 3000 := 2048;
BEGIN
	-- Controlla in tutte le celle se sia stato raggiunto il valore necessario per la vittoria
	for i in 0 to 3 loop
		for j in 0 to 3 loop
			if(values(i,j) = victory_score)
			then
				result := '1';
			end if;
		end loop;
	end loop;
	return result;
END FUNCTION checkVictory;

-- Procedura per suddividere un intero 0-9999 nelle sue 4 cifre
PROCEDURE splitNumber (SIGNAL number: IN INTEGER RANGE 0 TO 9999; SIGNAL X4, X3, X2, X1: OUT INTEGER RANGE 0 TO 9) IS
	variable digit4, digit3, digit2, digit1		: INTEGER RANGE 0 TO 9;
	variable temp								: INTEGER RANGE 0 TO 9999;
BEGIN
	temp := number;
	IF(temp > 999)
	THEN
		digit4 	:= temp/1000;
		temp 	:= temp-digit4*1000;
	ELSE
		digit4 	:= 0;
	END IF;
	
	IF(temp > 99)
	THEN
		digit3 	:= temp/100;
		temp 	:= temp-digit3*100;
	ELSE
		digit3 	:= 0;
	END IF;
	
	IF(temp > 9)
	THEN
		digit2 	:= temp/10;
		temp 	:= temp-digit2*10;
	ELSE
		digit2 	:= 0;
	END IF;
	
	digit1 := temp;
	
	X4 <= digit4;
	X3 <= digit3;
	X2 <= digit2;
	X1 <= digit1;
END splitNumber;

-- Procedura per convertire un numero 1-16 nella relativa coordinata (x,y)
PROCEDURE convertCoord (SIGNAL position: IN INTEGER RANGE 0 TO 16; VARIABLE X, Y: OUT INTEGER RANGE 0 TO 3) IS
BEGIN
	case position is
		when 1 =>
			x := 0;
			y := 0;
		when 2 =>
			x := 0;
			y := 1;
		when 3 =>
			x := 0;
			y := 2;
		when 4 =>
			x := 0;
			y := 3;
		when 5 =>
			x := 1;
			y := 0;
		when 6 =>
			x := 1;
			y := 1;
		when 7 =>
			x := 1;
			y := 2;
		when 8 =>
			x := 1;
			y := 3;
		when 9 =>
			x := 2;
			y := 0;
		when 10 =>
			x := 2;
			y := 1;
		when 11 =>
			x := 2;
			y := 2;
		when 12 =>
			x := 2;
			y := 3;
		when 13 =>
			x := 3;
			y := 0;
		when 14 =>
			x := 3;
			y := 1;
		when 15 =>
			x := 3;
			y := 2;
		when 16 =>
			x := 3;
			y := 3;
		when others =>
			NULL;
	end case;
END convertCoord;

FUNCTION compare(curr_values: GAME_GRID; next_values: GAME_GRID) RETURN std_logic IS
variable result : STD_LOGIC := '1';
BEGIN
	for i in 0 to 3 loop
		for j in 0 to 3 loop
			if not (curr_values(i,j) = next_values(i,j))
			then
				result := '0';
			end if;
		end loop;
	end loop;
	return result;
END compare;
END GAME_UTILS;