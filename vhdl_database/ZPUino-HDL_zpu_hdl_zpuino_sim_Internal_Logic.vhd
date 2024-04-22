-------------------------------------------------------
-- Author: Hugues CREUSY
--February 2004
-- VHDL model
-- project: M25P16 50 MHz,
-- release: 1.2
-----------------------------------------------------
-- Unit   : Internal logic
-----------------------------------------------------
-------------------------------------------------------------
-- These VHDL models are provided "as is" without warranty
-- of any kind, included but not limited to, implied warranty
-- of merchantability and fitness for a particular purpose.
-------------------------------------------------------------


------------------------------------------------------------------
--												 
--				INTERNAL LOGIC					 
--												 
------------------------------------------------------------------

library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
library STD;
	use STD.textio.ALL;
library WORK;
	use WORK.MEM_UTIL_PKG.ALL; 


-----------------------------------------------------------------------
--				Entity					   
-----------------------------------------------------------------------
-- This entity modelizes data reception and treatment by the SPI bus --
-----------------------------------------------------------------------

ENTITY Internal_Logic IS
GENERIC (	SIZE : positive;
		Plength : positive; 
		SSIZE : positive;
		Nb_BPi: positive;
		signature : STD_LOGIC_VECTOR (7 downto 0);
		manufacturerID : STD_LOGIC_VECTOR (7 downto 0);
		memtype : STD_LOGIC_VECTOR (7 downto 0);
		density : STD_LOGIC_VECTOR (7 downto 0);
		NB_BIT_DATA: positive;
		NB_BIT_ADD: positive;
		NB_BIT_ADD_MEM: positive;
		Tc: TIME;
		tSLCH: TIME;
		tCHSL: TIME;
		tCH: TIME;
		tCL: TIME;
		tDVCH: TIME;
		tCHDX: TIME;
		tCHSH: TIME;
		tSHCH: TIME;
		tSHSL: TIME;
		tSHQZ: TIME;
		tCLQV: TIME;
		tHLCH: TIME;
		tCHHH: TIME;
		tHHCH: TIME;
		tCHHL: TIME;
		tHHQX: TIME;
		tHLQZ: TIME;
		tWHSL: TIME;
		tSHWL: TIME;
		tDP:TIME;
		tRES1:TIME;
		tRES2:TIME;
		tW: TIME;
		tPP:TIME;
		tSE:TIME;
		tBE:TIME
	);

 PORT (	C, D,W,S,hold: IN std_logic;
	data_to_read: IN std_logic_vector (NB_BIT_DATA-1 downto 0);
	Power_up: IN boolean;
	Q: OUT std_logic;
	p_prog: OUT page(0 TO (Plength-1));
	add_mem: OUT std_logic_vector(NB_BIT_ADD_MEM-1 downto 0);
	write_op,read_op,BE_enable,SE_enable,add_pp_enable,PP_enable,READ_enable,data_request: OUT boolean;
	wrsr: INOUT boolean;
	srwd_wrsr: INOUT boolean;
	write_protect: INOUT boolean
	);

END Internal_Logic;


-----------------------------------------------------------------------------
--					Architecture					   
-----------------------------------------------------------------------------
-- The architecture contains a process count_bit which counts the bits and --
-- bytes received, a process data_in which latches the data on data_latch. --
-- After that an asynchronous decode process makes data, operation codes   --
-- and adresses treatment, and give instructions to a synchronous process  --
-- (on clock c) which contains further instructions, warnings and failures --
-- concerning each one of the functions.				   --
-----------------------------------------------------------------------------

 ARCHITECTURE behavioral OF Internal_Logic IS 

 
 SIGNAL only_rdsr, only_res,select_ok,raz, byte_ok,add_overflow,add_overflow_1,add_overflow_2: boolean:= false;
 SIGNAL write_protect_toggle: boolean:= false;  
 SIGNAL cpt: integer:=0;
 SIGNAL byte_cpt: integer:=0;
 SIGNAL data_latch: std_logic_vector(NB_BIT_DATA-1 downto 0):="00000000";
 SIGNAL wren, wrdi, rdsr,  read_data,fast_read, pp, se, be, dp, res, rdid: boolean:=false;  --HC 24/09/03
 SIGNAL Q_bis:std_logic:='Z';
 SIGNAL register_bis, status_register,wr_latch: std_logic_vector(7 downto 0):="00000000";
 SIGNAL protect,wr_cycle,hold_cond: boolean:=false;
 SIGNAL inhib_wren,inhib_wrdi,inhib_rdsr,inhib_WRSR,inhib_READ,inhib_PP,
 		inhib_SE,inhib_BE,inhib_DP,inhib_RES, inhib_RDID :boolean:=false; --HC 24/09/03
 SIGNAL reset_WEL,WEL,WIP:std_logic:='0';
 SIGNAL c_int : std_logic;
 
 CONSTANT LSB_TO_CODE_PAGE:natural:=to_bit_code(Plength);
 CONSTANT top_mem:positive:=size/NB_BIT_DATA-1;
 
  SIGNAL t_write_protect_toggle: TIME:=0 ns;

 
 BEGIN
 
 Status_register<=register_bis;

-------------------------------------------------------------
-- This process generates the Hold condition when it is valid
 hold_com: PROCESS 
-------------------------------------------------------------
BEGIN
WAIT ON HOLD;
IF (HOLD = '0' AND S='0') THEN
	IF (C='0') THEN
		hold_cond <= true;
		REPORT " HOLD: COMMUNICATION PAUSED "
		SEVERITY NOTE;
	ELSE WAIT ON C,hold;
		IF (C='0') THEN 
		hold_cond <= true;
		REPORT " HOLD: COMMUNICATION PAUSED "
		SEVERITY NOTE;
		END IF;
	END IF;
ELSIF (HOLD = '1') THEN
	IF (C='0') THEN
		hold_cond <= false;	     
		REPORT " HOLD: COMMUNICATION STARTS "
		SEVERITY NOTE;
	ELSE WAIT ON C,hold;
		IF (C='0') THEN
			hold_cond <= false;	     
			REPORT " HOLD: COMMUNICATION STARTS "
			SEVERITY NOTE;
		END IF;
	END IF;
END IF;
END PROCESS hold_com ;

------------------------------------------------------------------------
-- This process inhibits the internal clock when hold condition is valid
horloge: PROCESS
------------------------------------------------------------------------
BEGIN
WAIT ON C;
IF (NOT hold_cond) THEN

C_int<=C;
ELSIF (hold_cond) THEN
C_int<='0';
END IF;
END PROCESS horloge;

-----------------------------------------------------------------
-- This process inhibits data output when hold condition is valid
data_output: PROCESS
-----------------------------------------------------------------
BEGIN
WAIT ON hold_cond,Q_bis,S;
IF (hold_cond'event) THEN
	IF (hold_cond) THEN
		Q<='Z' after tHLQZ;
	ELSIF (NOT hold_cond) THEN
		Q<=Q_bis after tHHQX;
	END IF;
ELSIF (NOT hold_cond) THEN
	Q<=Q_bis;
END IF;

END PROCESS data_output;


------------------------------------------------------------
-- This process increments 2 counters:  one bit counter (cpt)
--					one byte counter (byte_cpt)
count_bit: PROCESS
------------------------------------------------------------
VARIABLE count_enable: boolean := false;
BEGIN
WAIT ON C_int,raz;

IF (raz or NOT select_ok) THEN
	cpt <= 0;
	byte_cpt <= 0;
	count_enable := false;
ELSE
	IF (C_int = '1') THEN 
	-- count enable is an intermediate variable which allows cpt to be
	-- constant during a whole period
		count_enable := true;
	END IF;
	
	IF(count_enable AND C_int'event AND C_int = '0')THEN 
		cpt <= (cpt +1)  MOD 8;
	END IF;

	IF(C_int = '0' AND byte_ok)THEN 
		byte_cpt <= (byte_cpt+1);
	END IF;
END IF;
END PROCESS count_bit;


-----------------------------------------------------------------------
-- This process latches every byte of data received and returns byte_ok 
data_in: PROCESS
-----------------------------------------------------------------------
VARIABLE data: std_logic_vector (7 downto 0):="00000000";
BEGIN
WAIT ON C_int,Select_ok;
	IF (NOT select_ok) then 
		raz<=true;
		byte_ok<=false;
		data_latch<="00000000";
		data:="00000000";
	ELSIF (C_int'event and C_int='1') THEN
			raz<=false;
			IF (cpt=0) THEN
				data_latch<="00000000";
				byte_ok<=false;
			END IF;
			data(7-cpt):=D;
			IF (cpt=7) THEN 
				byte_ok<=true;
				data_latch<=data;
			END IF;
	END IF;
END PROCESS data_in;

---------------------------------------------------------------
----------------- ASYNCHRONOUS DECODE PROCESS -----------------
---------------------------------------------------------------

decode : PROCESS

VARIABLE LSB_adress:std_logic_vector(LSB_to_code_page-1 downto 0);
VARIABLE j:natural:=0;
VARIABLE adress:std_logic_vector (nb_bit_add_mem-1 downto 0);
VARIABLE adress_1, adress_2, adress_3: std_logic_vector(7 downto 0);
VARIABLE bit_to_code_mem:natural:=TO_bit_code(size/NB_BIT_DATA);
VARIABLE cut_add:std_logic_vector(bit_to_code_mem-1 downto 0);
VARIABLE register_temp:std_logic_vector ((NB_BIT_DATA-1) downto 0);
VARIABLE int_add:natural:=0;
VARIABLE first_run: boolean:=true;
VARIABLE message: LINE;
VARIABLE BP:std_logic_vector(NB_BPi-1 downto 0);
VARIABLE SR_MASK:std_logic_vector(7 downto 0):="10000000";

CONSTANT page_ini:std_logic_vector ((NB_BIT_DATA-1) downto 0):="11111111";

----------------------------------------------------------------------
-- Read and write status register procedures

-- PROCEDURE read_status (file_name:STRING; status: OUT std_logic_vector(7 downto 0)) IS
-- file data_file : text open read_mode is file_name;
-- VARIABLE L:LINE;
-- VARIABLE bit_status:bit_vector(7 downto 0);
-- BEGIN
-- 	readline (data_file,L);
-- 	READ(L,bit_status);
-- 	status:=to_StdLogicVector(bit_status) AND SR_Mask;
-- END read_status;
 
-- PROCEDURE write_status (file_name:STRING; status: IN std_logic_vector(7 downto 0)) IS
-- file data_file : text open write_mode is file_name;
-- VARIABLE L:LINE;
-- VARIABLE bit_status: bit_vector(7 downto 0);
-- BEGIN
-- 	bit_status:=to_BitVector(status);
-- 	WRITE(L,bit_status);
-- 	writeline (data_file,L);
-- END write_status;
---------------------------------------------------------------------

BEGIN

----------------------------------------------------------
-- Status Register initialization
----------------------------------------------------------
-- IF first_run THEN
-- 	WRITE (message,string'("Trying to load status_register.txt"));
-- 	writeline (output,message);
-- 	read_status("status_register.txt",register_temp);
-- 	register_bis<=register_temp;
-- 	first_run:=false;
-- END IF;


-------------------------------------------
-- wait statements
-------------------------------------------
WAIT ON Power_up,byte_ok,wr_cycle,WEL,reset_WEL,WIP,
	inhib_WRSR,inhib_READ,inhib_PP,inhib_SE,
	inhib_BE,inhib_rdsr,inhib_DP,inhib_RES, inhib_RDID;

---------------------------
-- status register mask ini
---------------------------
FOR i IN 0 TO NB_BPi-1 LOOP
SR_Mask(i+2):='1';
END LOOP;

-------------------------------------------
-- adresses initialization and reset
-------------------------------------------
IF (byte_cpt=0) THEN
	FOR i IN 0 TO NB_BIT_ADD-1 LOOP
		adress_1(i):='0';
		adress_2(i):='0';
		adress_3(i):='0';
	END LOOP;
	FOR i IN 0 TO NB_BIT_ADD_MEM-1 LOOP
		adress(i):='0';
	END LOOP;
	add_mem<=adress;
END IF;

----------------------------------
-- page to program reset (FFh)
----------------------------------
IF (NOT PP) THEN
FOR i IN 0 TO (Plength-1) LOOP
	P_prog(i)<=page_ini;
END LOOP;
END IF;

-----------------------------------------------------------
-- op_code decode
-----------------------------------------------------------
IF ((byte_ok'event AND byte_ok) AND (byte_cpt=0)) THEN
	IF (data_latch="00000110") THEN 
		IF(only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE wren<=true;
			write_op<=true;
		END IF;
	ELSIF (data_latch="00000100") THEN
		IF(only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE wrdi<=true;
			write_op<=true;
		END IF;
	ELSIF (data_latch="00000101") THEN
		IF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE rdsr<=true;
		END IF;
	ELSIF (data_latch="00000001") THEN
		IF(only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE wrsr<=true;
			write_op<=true;
		END IF;
	ELSIF (data_latch="00000011") THEN 
		IF (only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE read_data<=true;
			read_op<=true;
		END IF;
	ELSIF (data_latch="00001011") THEN 
		IF (only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE fast_read<=true;
		END IF;
	ELSIF (data_latch="00000010") THEN
		IF (only_rdsr) THEN
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE pp<=true;
			write_op<=true;
		END IF;
	ELSIF (data_latch="11011000") THEN
		IF (only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE se<=true;
			write_op<=true;
		END IF;
	ELSIF (data_latch="11000111") THEN
		IF (only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE be<=true;
			write_op<=true;
			FOR i IN 0 TO NB_BPi-1 LOOP
 				BP(i):=status_register(i+2);
			END LOOP;
			IF (BP/="000") THEN
				protect<=true;
				write_op <= false;
			END IF;
		END IF;
	ELSIF (data_latch="10111001") THEN
		IF (only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE dp<=true;
		END IF;
	ELSIF (data_latch="10101011") THEN
		IF (only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSE res<=true;
		END IF;
	ELSIF (data_latch="10011111") THEN -- HC 24/09/03
		IF (only_rdsr) THEN 
			REPORT "This Opcode is not decoded during a Prog. Cycle"
			SEVERITY ERROR;
		ELSIF (only_res) THEN
			REPORT "This Opcode is not decoded during a DEEP POWER DOWN"
			SEVERITY ERROR;
		ELSE rdid<=true;
		END IF;
	
	
	ELSE 	report " False instruction, please retry "
	severity ERROR;
	END IF;
END IF;

-----------------------------------------------------------------------
-- addresses and data reception and treatment
-----------------------------------------------------------------------
IF ((byte_ok'event AND byte_ok)AND(byte_cpt=1)AND(NOT only_rdsr)AND(NOT (only_res))) THEN

	IF (((read_data) or (fast_read) or (se) or (pp)) AND (NOT rdsr)) THEN adress_1:=data_latch;
	ELSIF (wrsr AND (NOT rdsr)) THEN 
		wr_latch<=data_latch;
	END IF;

END IF;

IF ((byte_ok'event AND byte_ok)AND(byte_cpt=2)AND(NOT only_rdsr)AND(NOT (only_res))) THEN

	IF (((read_data) or (fast_read) or (se) or (pp)) AND (NOT rdsr)) THEN 
		adress_2:=data_latch;
	END IF;

END IF; 

IF ((byte_ok'event AND byte_ok)AND(byte_cpt=3)AND(NOT only_rdsr)AND(NOT (only_res))) THEN

	IF (((read_data) or (fast_read) or (se) or (pp)) AND (NOT rdsr)) THEN adress_3:=data_latch;
		FOR i IN 0 TO (NB_BIT_ADD-1) LOOP
			adress(i):=adress_3(i);
			adress(i+NB_BIT_ADD):=adress_2(i);
			adress(i+2*NB_BIT_ADD):=adress_1(i);
			add_mem<=adress;
		END LOOP;
		FOR i in (LSB_TO_CODE_PAGE-1) downto 0 LOOP
			LSB_adress(i):=adress(i);
		END LOOP;
	END IF;

	IF ((se or pp) AND (NOT rdsr)) THEN
		
		-------------------------------------------
		-- To ignore "don't care MSB" of the adress
		------------------------------------------- 
		FOR i IN 0 TO bit_to_code_mem-1 LOOP
			cut_add(i):=adress(i);
		END LOOP;

		int_add:=to_natural(cut_add);
		
		--------------------------------------------------
		-- Sector protection detection
		--------------------------------------------------
		FOR i IN 0 TO NB_BPi-1 LOOP
 			BP(i):=status_register(i+2);
		END LOOP;

		IF (BP="111" or BP="110") THEN 
			protect<=true;
			write_op <= false;
		ELSIF BP="101" THEN
			IF int_add>=((TOP_MEM+1)/2) THEN
				protect<=true;
				write_op <= false;
			END IF;
		ELSIF BP="100" THEN
			IF int_add>=((TOP_MEM+1)*3/4) THEN
				protect<=true;
				write_op <= false;
			END IF;
		ELSIF BP="011" THEN
			IF int_add>=((TOP_MEM+1)*7/8) THEN
				protect<=true;
				write_op <= false;
			END IF;
		ELSIF BP="010" THEN
			IF int_add>=((TOP_MEM+1)*15/16) THEN
				protect<=true;
				write_op <= false;
			END IF;
		ELSIF BP="001" THEN
			IF int_add>=((TOP_MEM+1)*31/32) THEN
				protect<=true;
				write_op <= false;
			END IF;
		ELSE protect<=false;
		END IF;

	END IF;
END IF;

-----------------------------------------------------------------------------
-- PAGE PROGRAM
-- The adress's LSBs necessary to code a whole page are converted to a natural
-- and used to fullfill the page buffer p_prog the same way as the memory page
-- will be fullfilled.
----------------------------------------------------------------------------
IF (byte_ok'event and byte_ok and (byte_cpt>=4)AND(PP)AND(NOT only_rdsr)AND(NOT rdsr)) THEN
	j:=(byte_cpt - 1 - NB_BIT_ADD_MEM/NB_BIT_ADD + to_natural(LSB_adress)) MOD(Plength);
	p_prog(j)<=data_latch;
END IF;
----------------------------------------------
--- READ INSTRUCTIONS
----------------------------------------------
-- to inhib READ instruction
IF (inhib_read) THEN
	read_op <= false;
	READ_data<=false;
	fast_READ<=false;
	READ_enable<=false;
	data_request<=false;
END IF;
-- to launch adress treatment in memory access
IF ( ((byte_ok'event AND byte_ok) AND READ_data AND (byte_cpt=3))
	OR ((byte_ok'event AND byte_ok) AND fast_READ AND (byte_cpt=4)) ) THEN
	READ_enable<=true;
END IF;
-- to send a request for the data pointed by the adress
IF ( ((byte_ok'event AND byte_ok) AND READ_data AND (byte_cpt>=3) )
	OR ((byte_ok'event AND byte_ok) AND fast_READ AND (byte_cpt>=4)) ) THEN
	data_request<=true;
END IF;
IF ( (READ_data AND (byte_cpt>3) AND (NOT byte_ok)) OR
	(fast_READ AND (byte_cpt>4) AND (NOT byte_ok)) ) THEN
	data_request<=false;
END IF;




--------------------------------------------------------
-- STATUS REGISTER INSTRUCTIONS
--------------------------------------------------------
-- WREN/WRDI instructions
-------------------------
IF (WEL'event AND WEL='1') THEN
	register_bis(1)<='1';
END IF;

IF (inhib_wren'event and inhib_wren) THEN
	WREN<=false;
	write_op<=false;
END IF;

IF (inhib_wrdi'event and inhib_wrdi) THEN
	WRDI<=false;
	write_op<=false;
END IF;

------------------------
-- RESET WEL instruction
------------------------
IF (reset_WEL'event AND reset_WEL='1') THEN
	register_bis(1)<='0';
END IF;

IF (Power_up'event AND Power_up) THEN
	register_bis(1)<='0';
END IF;

---------------------
-- WRSR instructions
---------------------
IF (wr_cycle'event AND (wr_cycle))THEN
	REPORT "Write status register cycle has begun"
	severity NOTE;
	register_bis<=((register_bis) or ("00000011"));
END IF;

IF (wr_cycle'event AND (NOT wr_cycle)) THEN
	REPORT "Write status register cycle is finished"
	severity NOTE;
	register_bis<=((wr_latch) and SR_Mask);
	-- register_temp:=wr_latch and SR_Mask;
	-- write_status("status_register.txt",register_temp);
	wrsr<=false;
END IF;

IF (inhib_WRSR'event and inhib_WRSR) THEN 
	wrsr<=false; 
END IF;

IF (NOT wrsr) THEN 
wr_latch<="00000000";
END IF;

--------
-- PROG
--------
IF (WIP'event AND WIP='1') THEN
	register_bis(0)<='1';
END IF;
IF (WIP'event AND WIP='0') THEN
	register_bis(0)<='0';
	write_op<=false;
END IF;

--------------------
-- rdsr instruction
--------------------
IF (inhib_rdsr'event AND inhib_rdsr) THEN
	rdsr<=false;
END IF;



------------------------------------------------------------
-- BULK/SECTOR ERASE INSTRUCTIONS
------------------------------------------------------------
IF (inhib_BE) THEN
	protect<=false;
	BE<=false;
END IF;
IF (inhib_SE) THEN
	protect<=false;
	SE<=false;
END IF;

------------------------------------------------------------
-- PAGE PROGRAM INSTRUCTIONS
------------------------------------------------------------
IF (inhib_PP) THEN
	protect<=false;
	PP<=false;
END IF;


------------------------------------------------------------
-- DEEP POWER DOWN
-- RELEASE FROM DEEP POWER DOWN AND READ ELECTRONIC SIGNATURE
-------------------------------------------------------------
IF (inhib_DP)   THEN DP <=false; END IF;
IF (inhib_RES) THEN RES<=false; END IF;


-----------------------------
-- Read Jedec ID                     --HC 24/03/09
-----------------------------
IF (inhib_RDID) THEN RDID <= FALSE; END IF;


END PROCESS decode;

----------------------------------------------------------
-----------------	SYNCHRONOUS PROCESS	----------------
----------------------------------------------------------

sync_instructions: PROCESS

VARIABLE i,j,k:natural:=0;

BEGIN
WAIT ON C_int, select_ok;

 WEL<='0';
 reset_WEL<='0';

---------------------------------------------
-- READ_data
---------------------------------------------

IF ((NOT READ_data) AND (NOT fast_read)) THEN
 inhib_READ<=false;
END IF;

IF (((byte_cpt=0) 
	or (byte_cpt=1) 
		or (byte_cpt=2) 
			or (byte_cpt=3 AND cpt/=7))
	 AND READ_data AND (NOT select_ok)) THEN
	REPORT "Instruction canceled because the chip is deselected"
	SEVERITY WARNING;
	inhib_READ<=true;
END IF;

IF (READ_data AND ((byte_cpt=3 AND cpt=7) OR (byte_cpt>=4))) THEN
	IF (NOT select_ok) THEN
		inhib_READ<=true;
		i:=0;
		Q_bis<='Z' after tSHQZ;
	
	ELSIF (C_int'event AND C_int='0')THEN
		Q_bis<=data_to_read(7-i) after tCLQV;
		i:=(i+1) mod 8;
	END IF;
END IF;

--------------------------------------------------------------------
-- Fast_Read
--------------------------------------------------------------------

IF (((byte_cpt=0) 
	or (byte_cpt=1) 
		or (byte_cpt=2)
			or (byte_cpt=3) 
				or (byte_cpt=4 AND cpt/=7))
	 AND fast_READ AND (NOT select_ok)) THEN
	REPORT "Instruction canceled because the chip is deselected"
	SEVERITY WARNING;
	inhib_READ<=true;
END IF;

IF (fast_READ AND ((byte_cpt=4 AND cpt=7) OR (byte_cpt>=5))) THEN
	IF (NOT select_ok) THEN
		inhib_READ<=true;
		i:=0;
		Q_bis<='Z' after tSHQZ;
	
	ELSIF (C_int'event AND C_int='0')THEN
		Q_bis<=data_to_read(7-i) after tCLQV;
		i:=(i+1) mod 8;
	END IF;
END IF;

-------------------------------------------
--	Write_enable 
-------------------------------------------
 IF (NOT WREN) THEN
	inhib_WREN<=false;
 END IF;

 IF (WREN AND (NOT only_rdsr) AND (NOT only_res)) THEN
	IF (C_int'event AND C_int='1') THEN 
		inhib_wren<=true;
		report "Instruction canceled because the chip is still selected."
		severity WARNING;
	ELSIF (NOT select_ok) THEN
		WEL<=('1');
		inhib_wren<=true;
	END IF;
 END IF;

---------------------------------------------
--	Write_disable
---------------------------------------------

IF (NOT WRDI) THEN
	inhib_WRDI<=false;
END IF;

IF (WRDI  AND (NOT only_rdsr) AND (NOT only_res)) THEN	
	IF (C_int'event AND C_int='1') THEN 
		inhib_wrdi<=true;
		report "Instruction canceled because the chip is still selected."
		severity WARNING;
	ELSIF (NOT select_ok) THEN
		reset_WEL<=('1');
		inhib_wrdi<=true;
	END IF;
END IF;


-------------------------------------------
--	Write_status_register
-------------------------------------------
IF (NOT WRSR) THEN
inhib_WRSR<=false;
END IF; 
IF (WRSR AND (NOT only_rdsr) AND (NOT only_res)) THEN
	IF (byte_cpt=1 AND (cpt /=7 OR not byte_ok) AND (NOT wr_cycle)) THEN
		IF (NOT select_ok) THEN
			REPORT "Instruction canceled because the chip is deselected"
			SEVERITY WARNING;
			inhib_WRSR<=true;
		END IF;

	ELSIF (byte_cpt=1 AND cpt=7 AND byte_ok) THEN
		IF (write_protect) THEN
			REPORT "Instruction canceled because status register is hardware protected"
			SEVERITY warning; 
			inhib_WRSR<=true;
		ELSIF (select_ok'event AND (NOT select_ok)) THEN
			IF (status_register(1)='0') THEN
				REPORT "Instruction canceled because WEL is reset"
				SEVERITY WARNING; 
				inhib_WRSR<=true;
			ELSE	wr_cycle<=true;
				WIP <= '1';
				WAIT FOR tW;
				WIP <= '0';
				wr_cycle<=false;
			END IF;

		END IF;
	ELSIF (byte_cpt=2)THEN
		IF ((C_int'event AND C_int='1') AND (NOT rdsr)) THEN
			REPORT "Instruction canceled because the chip is still selected"
			SEVERITY WARNING;
			inhib_WRSR<=true;
		ELSIF (select_ok'event AND (NOT select_ok)) THEN
			IF (status_register(1)='0') THEN
				REPORT "Instruction canceled because WEL is reset"
				SEVERITY WARNING; 
				inhib_WRSR<=true;
			ELSE	wr_cycle<=true;
				WIP <= '1';
				WAIT FOR tW;
				WIP <= '0';
				wr_cycle<=false;
			END IF;
		END IF;
	END IF;
END IF;


---------------------------------------------
--	Bulk_erase
---------------------------------------------

IF (NOT BE) THEN
 inhib_BE<=false;
END IF;
 IF (BE AND (NOT only_rdsr) AND (NOT only_res)) THEN
	IF (C_int'event AND C_int='1') THEN
		REPORT "Instruction canceled because the chip is still selected"
			SEVERITY WARNING;
			inhib_BE<=true;
	ELSIF (NOT select_ok) THEN
		IF (status_register(1)='0') THEN
			REPORT "Instruction canceled because WEL is reset"
			SEVERITY WARNING;
			BE_enable<=false;
			inhib_BE<=true;
		ELSIF (protect AND BE) THEN 
			REPORT "Instruction canceled because at least one sector is protected"
			SEVERITY WARNING;
			BE_enable<=false;
			inhib_BE<=true;
		ELSE	REPORT "Bulk erase cycle has begun"
			severity NOTE;
			BE_enable<=true;
			WIP<='1';
			WAIT for tBE;
			REPORT "Bulk erase cycle is finished"
			severity NOTE;
			BE_enable<=false;
			inhib_BE<=true;
			WIP<='0';
			reset_WEL<='1';
		END IF;
	END IF;
 END IF;

---------------------------------------------
--	Sector_erase
---------------------------------------------

IF (NOT SE) THEN
 inhib_SE<=false;
END IF;
IF ((byte_cpt=0 or byte_cpt=1 or byte_cpt=2 or (byte_cpt=3 AND (cpt/=7 OR not byte_ok)))
	AND SE AND (NOT only_rdsr) AND (NOT only_res)) THEN
	IF (NOT select_ok) THEN
		REPORT "Instruction canceled because the chip is deselected"
		SEVERITY WARNING;
		inhib_SE<=true;
	END IF;
END IF;
IF ((byte_cpt=4 OR (byte_cpt=3 AND cpt=7 AND byte_ok)) AND SE AND (NOT only_RDSR) AND (NOT only_res)) THEN
	IF (byte_cpt=4 AND (C_int'event AND C_int='1')) THEN
		REPORT "Instruction canceled because the chip is still selected"
		SEVERITY WARNING;
		inhib_SE<=true;
	ELSIF (NOT select_ok) THEN
		IF (status_register(1)='0') THEN
			REPORT "Instruction canceled because WEL is reset"
			SEVERITY warning;
			SE_enable<=false;
			inhib_SE<=true;
		ELSIF (protect AND SE) THEN
			REPORT "Instruction canceled because the SE sector is protected"
			SEVERITY WARNING;
			SE_enable<=false;
			inhib_SE<=true;
		ELSE	REPORT "Sector erase cycle has begun"
			severity NOTE;
			SE_enable<=true;
			WIP<='1';
			WAIT for 100 us;--tSE;
			REPORT "Sector erase cycle is finished"
			severity NOTE;
			SE_enable<=false;
			inhib_SE<=true;
			WIP<='0';
			reset_WEL<='1';
		END IF;
	END IF;
 END IF;


---------------------------------------------
--	Page_Program
---------------------------------------------

IF (NOT PP) THEN
 inhib_PP<=false;
 add_pp_enable<=false;
 pp_enable<=false;
END IF;
IF ((byte_cpt=0 or byte_cpt=1 or byte_cpt=2 or byte_cpt=3 or (byte_cpt=4 AND (cpt/=7 OR NOT byte_ok))) 
	AND PP AND (NOT only_rdsr) AND (NOT only_res) AND (NOT select_ok)) THEN
	REPORT "Instruction canceled because the chip is deselected"
	SEVERITY WARNING;
	inhib_PP<=true;
END IF;

IF ((byte_cpt=5 OR (byte_cpt=4 AND cpt=7)) AND PP AND (NOT only_rdsr) AND (NOT only_res)) THEN
	add_pp_enable<=true;
	IF (status_register(1)='0') THEN
		REPORT "Instruction canceled because WEL is reset"
		SEVERITY warning;
		PP_enable<=false;
		inhib_PP<=true;
	ELSIF (protect AND PP) THEN
		REPORT "Instruction canceled because the PP sector is protected"
		SEVERITY WARNING;
		PP_enable<=false;
		inhib_PP<=true;
	END IF;
	IF (select_ok'event AND (NOT select_ok) AND PP) THEN
		REPORT "Page program cycle has begun"
		severity NOTE;
		WIP<='1';
		WAIT for tPP;
		REPORT "Page program cycle is finished"
		SEVERITY NOTE;
		PP_enable<=true;
		WIP<='0';
		inhib_PP<=true;
		reset_WEL<='1';
	END IF;
END IF;
IF (byte_cpt>5 AND PP AND (NOT only_rdsr) AND (NOT only_res) AND byte_ok) THEN
	IF (select_ok'event AND (NOT select_ok)) THEN
		REPORT "Page program cycle has begun"
		severity NOTE;
		WIP<='1';
			WAIT for tPP;
		REPORT "Page program cycle is finished"
		SEVERITY NOTE;
		PP_enable<=true;
		WIP<='0';
		inhib_PP<=true;
		reset_WEL<='1';
	END IF;
END IF;
IF (byte_cpt>5 AND PP AND (NOT only_rdsr) AND (NOT only_res) AND (NOT byte_ok)) THEN
	IF (select_ok'event AND (NOT select_ok)) THEN
		REPORT "Instruction canceled because the chip is deselected"
		SEVERITY WARNING;
		inhib_PP<=true;
		PP_enable<=false;
	END IF;
END IF;

-------------------------------------------
--	Deep Power Down
-------------------------------------------
 IF (NOT DP) THEN
	inhib_DP<=false;
	only_res<=false;
 END IF;	
	
 IF (DP	AND (NOT only_rdsr) AND (NOT only_res) AND (NOT RES)) THEN
	IF (C_int'event AND C_int='1') THEN 
		report "Instruction canceled because the chip is still selected."
		severity WARNING;
		inhib_DP<=true;
		only_res<=false;
	ELSIF (select_ok'event AND (NOT select_ok)) THEN
		REPORT "Chip is entering deep power down mode"
		SEVERITY NOTE;
	-- useful when chip is selected again to inhib every op_code except RES
	-- and to check tDP
		only_res<=true; 
	END IF;
 END IF;

-----------------------------------------------------------------------
--	Release from Deep Power Down Mode and Read Electronic Signature
-----------------------------------------------------------------------
 IF (NOT RES) THEN
	inhib_RES<=false;
	j:=0;
 END IF;	
	
 IF (RES AND (byte_cpt=1 and cpt=0) AND (NOT only_rdsr) AND (NOT select_ok) )  THEN 
       IF (only_res) THEN  -- HC 22/09/03
		REPORT "The chip is releasing from DEEP POWER DOWN"
		SEVERITY NOTE;
		inhib_RES<=false, true after tRES1;
		inhib_DP<=false, true after tRES1;
       ELSE 
               inhib_RES<=true; --HC 22/09/03
		inhib_DP<=true;  --HC 22/09/03
       END IF;
       
 ELSIF (((byte_cpt=1 AND cpt>0) OR (byte_cpt=2) OR (byte_cpt=3) OR (byte_cpt=4 AND (cpt<7 OR NOT byte_ok)))
	AND RES AND (NOT only_rdsr) AND (NOT select_ok)) THEN
	REPORT "Electronic Signature must be read at least once. Instruction not valid"
	severity ERROR;

 ELSIF (((byte_cpt=4 AND cpt=7 AND byte_ok) OR (byte_cpt>4)) AND RES AND (NOT only_rdsr)AND (NOT select_ok)) THEN
	IF ( only_res) THEN  -- HC 22/09/03
            inhib_RES<=true after tRES2;
	    inhib_DP<=true after tRES2;
	    REPORT "The Chip is releasing from DEEP POWER DOWN" SEVERITY NOTE;
	ELSE
	    inhib_RES<=true after tRES2; -- HC 22/09/03
	    inhib_DP<=true after tRES2;   -- HC 22/09/03
	END IF;
	Q_bis<='Z';

 ELSIF (((byte_cpt=3 AND cpt=7) OR byte_cpt>=4) 
	AND RES AND (NOT only_rdsr) AND (C_int'event AND C_int='0')) THEN
	Q_bis<=signature(7-j) after tCLQV;
	j:=(j+1) mod 8;
 END IF;




-----------------------------------------------------------------------
--	Read Jedec Signature                                   -- HC 24/09/03
-----------------------------------------------------------------------
IF (NOT RDID) THEN
	inhib_RDID<=false;
END IF;	
IF ((byte_cpt=0) AND RDID AND (NOT select_ok))
          THEN REPORT "Instuction canceled because the chip is deselected" SEVERITY WARNING;
          inhib_RDID <= true;
END IF;
IF (RDID AND ((byte_cpt=0 AND cpt=7) OR (byte_cpt>=1))) THEN
    IF (NOT select_ok) THEN 
    inhib_RDID <= true; 
    k:=0; 
    Q_bis <='Z' after tSHQZ;
    ELSIF (C_int'event AND C_int='0' AND byte_cpt<=1) THEN 
    Q_bis <= manufacturerID(7-k) after tCLQV;
    k:=(k+1) MOD 8;
    ELSIF (C_int'event AND C_int='0' AND byte_cpt=2) THEN 
    Q_bis <= memtype(7-k) after tCLQV;
    k:=(k+1) MOD 8;
    ELSIF (C_int'event AND C_int='0' AND byte_cpt=3) THEN 
    Q_bis <= density(7-k) after tCLQV;
    k:=(k+1) MOD 8;
    ELSIF (C_int'event AND C_int='0' AND byte_cpt>3) THEN 
    Q_bis <= '0' after tCLQV;
   END IF;
END IF;
          


END PROCESS sync_instructions;



---------------------------------------------------------
-- This process shifts out status register on data output
Read_status_register: PROCESS
---------------------------------------------------------
VARIABLE j:integer:=0;

BEGIN

   WAIT ON C_int,select_ok, rdsr;

 	IF (NOT rdsr) THEN
		inhib_rdsr<=false;
 	END IF;


	IF (RDSR AND (NOT select_ok)) THEN 
		j:=0;
		Q_bis<= 'Z' after tSHQZ;
		inhib_rdsr<=true;
	ELSIF (RDSR AND (C_int'event AND C_int='0')) THEN
		Q_bis<=status_register(7-j) after tCLQV;
		j:=(j+1) mod 8;
	END IF;

END PROCESS read_status_register;




----------------------------------------------------------------------------------------
-- This process checks select and deselect conditions. Some other conditions are tested:
-- prog cycle, deep power down mode and read electronic signature.
 pin_S: PROCESS
----------------------------------------------------------------------------------------

 BEGIN
 WAIT ON S;
 
 IF (S='0') THEN
	IF (RES AND only_res) THEN -- HC 22/09/03
		REPORT "The chip must be deselected during tRES"
		severity ERROR;
	ELSIF (DP) THEN
		IF (NOT only_res'stable(tDP)) THEN
			REPORT "The chip must be deselected during tDP"
			severity ERROR;
		ELSE
			REPORT "Only a read electronic signature instruction will be valid !"
			SEVERITY NOTE;
		END IF;
	END IF;

IF Power_up THEN select_ok<=true;
END IF;
	
	IF(pp or wrsr or be or se) THEN 
		REPORT "Only a read status register instruction will be valid !"
		SEVERITY NOTE;
		only_rdsr<=true;
	END IF;
END IF;

IF (S='1') THEN
	select_ok<=false;
	only_rdsr<=false;
END IF;
END PROCESS pin_S;

----------------------------------------------------------------
-- This Process detects the hardware protection mode
HPM_detect: PROCESS 
----------------------------------------------------------------
BEGIN
	WAIT ON W,C_int;
	IF (W = '0'AND status_REGISTER(7) ='1') THEN
		write_protect <= true;
	END IF;
	IF (W = '1') THEN
		write_protect <= false; 
	END IF;
END PROCESS HPM_detect ;

----------------------------------------------------------------------
-- This process detects if Write_protect toggles during an instruction 
write_protect_toggle_detect: PROCESS
----------------------------------------------------------------------
BEGIN
 WAIT ON select_ok,write_protect;
IF (write_protect AND select_ok) THEN
     write_protect_toggle <= true;
    IF (now /= 0 ns) THEN t_write_protect_toggle <= now; END IF;
END IF;
IF (NOT select_ok) THEN write_protect_toggle <= false; END IF;
END PROCESS write_protect_toggle_detect;

---------------------------------------------------------------------
-- This process returns an error if SRWD=1 and Wc is swithed during a 
-- WRSR instruction
---------------------------------------------------------------------
wc_error_detect: PROCESS
BEGIN
WAIT ON wrsr, write_protect_toggle;
IF (wrsr AND write_protect_toggle) THEN
   IF (NOW /= 0 ns) THEN 
   REPORT "It is not allowed to switch the Wc pin during a WRSR instruction"
   severity FAILURE;
   END IF; 
END IF;
IF (wrsr AND (status_REGISTER(7) ='1')) THEN
   srwd_wrsr <= TRUE; -- becomes one when WRSR is decoded and WIP=1
END IF;
IF (NOT wrsr) THEN srwd_wrsr <= FALSE; END IF;
END PROCESS wc_error_detect;


END behavioral;
