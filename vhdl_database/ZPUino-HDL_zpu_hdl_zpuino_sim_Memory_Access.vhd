-------------------------------------------------------
-- Author: Hugues CREUSY
--February 2004
-- VHDL model
-- project: M25P16 50 MHz,
-- release: 1.2
-----------------------------------------------------
-- Unit   : Memory Access 
-----------------------------------------------------

-------------------------------------------------------------
-- These VHDL models are provided "as is" without warranty
-- of any kind, included but not limited to, implied warranty
-- of merchantability and fitness for a particular purpose.
-------------------------------------------------------------


-----------------------------------------------------------
--
--				MEMORY ACCESS
--
-----------------------------------------------------------

LIBRARY IEEE;
	USE IEEE.std_logic_1164.ALL;
LIBRARY STD;
	USE STD.textio.ALL;
LIBRARY work;
	USE WORK.mem_util_pkg.ALL;

-----------------------------------------------------------
--				Entity
-----------------------------------------------------------
-- This entity modelizes the access to the memory array 
----------------------------------------------------------- 
ENTITY Memory_Access IS
GENERIC(	init_file: string;
		SIZE : positive; 
		Plength : positive; 
		SSIZE : positive;
		NB_BIT_DATA: positive;
		NB_BIT_ADD: positive;
		NB_BIT_ADD_MEM: positive
		);
PORT( add_mem: IN std_logic_vector(NB_BIT_ADD_MEM-1 downto 0);
	BE_enable,SE_enable,add_pp_enable,PP_enable,read_enable,data_request: IN boolean;
	p_prog: IN page (0 TO (Plength-1));
	data_to_read: OUT std_logic_vector (NB_BIT_DATA-1 downto 0)
	);

END Memory_Access;


-----------------------------------------------------------------
--				Architecture
-----------------------------------------------------------------
-- The architecture contains one process which executes
-- read and write instructions 
-- on the content. This content is initialized and further
-- saved by two procedures  
-- (write_to_file and read_from_file) in the convenient text file
-----------------------------------------------------------------

ARCHITECTURE Static_Alloc OF Memory_Access IS

CONSTANT bit_to_code_mem:natural:=TO_bit_code(size/NB_BIT_DATA);
CONSTANT top_mem:positive:=size/NB_BIT_DATA-1;
TYPE memoire IS array (0 TO top_mem) OF std_logic_vector(7 downto 0);


--------------------------- PROCEDURES ------------------------
------------------------- READ FROM FILE ----------------------
PROCEDURE read_from_file (	file_name:string;
				memory: out memoire) IS

file data_file : text open read_mode is file_name;
VARIABLE L: line;
VARIABLE LSB,MSB:std_logic_vector(3 downto 0);
VARIABLE dr: string (1 to 2*Plength);
VARIABLE index_m: natural:=0;

BEGIN

WHILE NOT endfile(data_file) LOOP

	readline(data_file,L);
	READ(L,dr);
	deallocate(L);

	FOR i IN 1 TO Plength LOOP
		CASE dr(2*(i-1)+1) IS 
			WHEN '0'=> MSB := "0000";
			WHEN '1'=> MSB := "0001";
			WHEN '2'=> MSB := "0010";
			WHEN '3'=> MSB := "0011";
			WHEN '4'=> MSB := "0100";
			WHEN '5'=> MSB := "0101";
			WHEN '6'=> MSB := "0110";
			WHEN '7'=> MSB := "0111";
			WHEN '8'=> MSB := "1000";
			WHEN '9'=> MSB := "1001";
			WHEN 'A'=> MSB := "1010";
			WHEN 'B'=> MSB := "1011";
			WHEN 'C'=> MSB := "1100";
			WHEN 'D'=> MSB := "1101";
			WHEN 'E'=> MSB := "1110";
			WHEN 'F'=> MSB := "1111";
			WHEN 'a'=> MSB := "1010";
			WHEN 'b'=> MSB := "1011";
			WHEN 'c'=> MSB := "1100";
			WHEN 'd'=> MSB := "1101";
			WHEN 'e'=> MSB := "1110";
			WHEN 'f'=> MSB := "1111";
			WHEN OTHERS => null;
		END CASE;
	
		CASE dr(2*(i-1)+2) IS 
			WHEN '0'=> LSB := "0000";
			WHEN '1'=> LSB := "0001";
			WHEN '2'=> LSB := "0010";
			WHEN '3'=> LSB := "0011";
			WHEN '4'=> LSB := "0100";
			WHEN '5'=> LSB := "0101";
			WHEN '6'=> LSB := "0110";
			WHEN '7'=> LSB := "0111";
			WHEN '8'=> LSB := "1000";
			WHEN '9'=> LSB := "1001";
			WHEN 'A'=> LSB := "1010";
			WHEN 'B'=> LSB := "1011";
			WHEN 'C'=> LSB := "1100";
			WHEN 'D'=> LSB := "1101";
			WHEN 'E'=> LSB := "1110";
			WHEN 'F'=> LSB := "1111";
			WHEN 'a'=> MSB := "1010";
			WHEN 'b'=> MSB := "1011";
			WHEN 'c'=> MSB := "1100";
			WHEN 'd'=> MSB := "1101";
			WHEN 'e'=> MSB := "1110";
			WHEN 'f'=> MSB := "1111";
			WHEN OTHERS => null;
		END CASE;
		memory(index_m):=(MSB(3),MSB(2),MSB(1),MSB(0),LSB(3),LSB(2),LSB(1),LSB(0));
		index_m:=index_m+1;
	END LOOP;
END LOOP;

END read_from_file;
----------------------------------------------------------

---------------- WRITE TO FILE --------------------
PROCEDURE write_to_file (	file_name:string;
				memory:IN memoire) IS

file data_file : text open write_mode is file_name;
VARIABLE L: line;
VARIABLE LSB,MSB:std_logic_vector(3 downto 0);
VARIABLE dr: string (1 to 2*Plength);
VARIABLE index_m:natural:=0;

BEGIN

WHILE (index_m<TOP_MEM) LOOP

	FOR i IN 1 TO Plength LOOP
		FOR j IN 0 TO 3 LOOP
			LSB(j):= memory(index_m)(j);
			MSB(j):= memory(index_m)(j+4);
		END LOOP;
		index_m:=index_m+1;
		CASE MSB IS 
			WHEN "0000" => dr(2*(i-1)+1):='0';
			WHEN "0001" => dr(2*(i-1)+1):='1';
			WHEN "0010" => dr(2*(i-1)+1):='2';
			WHEN "0011" => dr(2*(i-1)+1):='3';
			WHEN "0100" => dr(2*(i-1)+1):='4';
			WHEN "0101" => dr(2*(i-1)+1):='5';
			WHEN "0110" => dr(2*(i-1)+1):='6';
			WHEN "0111" => dr(2*(i-1)+1):='7';
			WHEN "1000" => dr(2*(i-1)+1):='8';
			WHEN "1001" => dr(2*(i-1)+1):='9';
			WHEN "1010" => dr(2*(i-1)+1):='A';
			WHEN "1011" => dr(2*(i-1)+1):='B';
			WHEN "1100" => dr(2*(i-1)+1):='C';
			WHEN "1101" => dr(2*(i-1)+1):='D';
			WHEN "1110" => dr(2*(i-1)+1):='E';
			WHEN "1111" => dr(2*(i-1)+1):='F';
			WHEN OTHERS => null;
		END CASE;

		CASE LSB IS
			WHEN "0000" => dr(2*(i-1)+2):='0';
			WHEN "0001" => dr(2*(i-1)+2):='1';
			WHEN "0010" => dr(2*(i-1)+2):='2';
			WHEN "0011" => dr(2*(i-1)+2):='3';
			WHEN "0100" => dr(2*(i-1)+2):='4';
			WHEN "0101" => dr(2*(i-1)+2):='5';
			WHEN "0110" => dr(2*(i-1)+2):='6';
			WHEN "0111" => dr(2*(i-1)+2):='7';
			WHEN "1000" => dr(2*(i-1)+2):='8';
			WHEN "1001" => dr(2*(i-1)+2):='9';
			WHEN "1010" => dr(2*(i-1)+2):='A';
			WHEN "1011" => dr(2*(i-1)+2):='B';
			WHEN "1100" => dr(2*(i-1)+2):='C';
			WHEN "1101" => dr(2*(i-1)+2):='D';
			WHEN "1110" => dr(2*(i-1)+2):='E';
			WHEN "1111" => dr(2*(i-1)+2):='F';
			WHEN OTHERS => null;
		END CASE;
	END LOOP;

	WRITE(L,dr);
	writeline(data_file,L);
END LOOP;

END write_to_file;
----------------------------------------------------

BEGIN			-- architecture body begins here

----------------------------------------------------
--			PROCESS MEMORY 			
----------------------------------------------------
memory: PROCESS

VARIABLE content:memoire;
VARIABLE deb_zone, int_add:natural:=0;
VARIABLE cut_add:std_logic_vector(bit_to_code_mem-1 downto 0);
VARIABLE int_add_mem:natural:=to_bit_code(size/NB_BIT_DATA);
VARIABLE first_run:boolean:=true;
VARIABLE message, my_file: LINE;

BEGIN

---------------------------------
-- initialisation of memory array
---------------------------------

IF (first_run) THEN
	WRITE (message,string'("Trying to load "));
	WRITE (message, init_file);
	writeline(output, message);

	read_from_file(init_file,content);
	first_run:=false;
END IF;


WAIT ON add_pp_enable,pp_enable, be_enable, se_enable, data_request,read_enable;

-----------------------------------------------------------
-- To ignore don't care MSB of the address
-----------------------------------------------------------
IF ( (se_enable'event AND se_enable) 
	OR (add_pp_enable'event AND add_pp_enable)
		OR (read_enable'event AND read_enable) ) THEN
	FOR i IN 0 TO bit_to_code_mem-1 LOOP
		cut_add(i):=add_mem(i);
	END LOOP;
END IF;
-----------------------------------------------------------
-- Read instruction
-----------------------------------------------------------
IF (data_request'event AND data_request AND read_enable) THEN
	int_add:=to_natural(cut_add);
	IF (int_add>top_mem) THEN 
		FOR i IN 0 TO bit_to_code_mem-1 LOOP
			cut_add(i):='0';
		END LOOP;
		int_add:=0;
	END IF;
	data_to_read<=content(int_add);
	cut_add:=add_inc(cut_add);	-- to increase the adress
END IF;
IF (READ_enable'event AND (NOT read_enable)) THEN
	FOR i IN 0 TO NB_BIT_DATA-1 LOOP
		data_to_read(i)<='0';
	END LOOP;
END IF;
----------------------------------------------------------
-- Page program instruction
-- To find the first adress of the memory to be programmed
----------------------------------------------------------
IF (add_pp_enable'event AND add_pp_enable) THEN
	int_add_mem:=to_natural(cut_add);
	int_add:=top_mem+1;
	WHILE int_add>int_add_mem LOOP
		int_add:=int_add-Plength;
	END LOOP;
END IF;

------------------------------------------------------
-- Sector erase instruction
-- To find the first adress of the sector to be erased
------------------------------------------------------
IF (se_enable'event AND se_enable) THEN
	int_add:=add_sector(cut_add,SIZE/NB_BIT_DATA,SSIZE/NB_BIT_DATA);
END IF;

------------------------------------------------------
-- Write or erase cycle execution
------------------------------------------------------
IF (pp_enable'event AND (pp_enable)) THEN
	FOR i IN 0 TO (Plength-1) LOOP
		content (int_add+i):=p_prog(i) AND content(int_add+i);
	END LOOP;
	-- write_to_file(init_file,content);
END IF;

IF (be_enable'event AND (NOT be_enable)) THEN
	FOR i IN 0 TO top_mem LOOP
		content(i):="11111111";
	END LOOP;
	-- write_to_file(init_file,content);
END IF;
IF (se_enable'event AND (NOT se_enable)) THEN
	FOR i IN int_add TO (int_add+SSIZE/NB_BIT_DATA-1) LOOP
		content(i):="11111111";
	END LOOP;
	-- write_to_file(init_file,content);	
END IF;

END PROCESS memory;
END static_alloc;
