-------------------------------------------------------
-- Author: Hugues CREUSY
--February 2004
-- VHDL model
-- project: M25P16 50 MHz,
-- release: 1.2
-----------------------------------------------------
-- Unit    : Top hierarchy
-----------------------------------------------------
-------------------------------------------------------------
-- These VHDL models are provided "as is" without warranty
-- of any kind, included but not limited to, implied warranty
-- of merchantability and fitness for a particular purpose.
-------------------------------------------------------------


---------------------------------------------------------
--
--			M25P16 SERIAL FLASH MEMORY
--
---------------------------------------------------------

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY STD;
	USE STD.TEXTIO.ALL;
LIBRARY WORK;
	USE WORK.MEM_UTIL_PKG.ALL;

-----------------------------------------------------
--			ENTITY	
-----------------------------------------------------
ENTITY M25P16 IS

GENERIC (	init_file: string := string'("initM25P16.txt");         -- Init file name
		SIZE : positive := 1048576*16;                          -- 16Mbit
		Plength : positive := 256;                              -- Page length (in Byte)
		SSIZE : positive := 524288;                             -- Sector size (in # of bits)
		NB_BPi: positive := 3;                                  -- Number of BPi bits
		signature : STD_LOGIC_VECTOR (7 downto 0):="00010100";  -- Electronic signature
		manufacturerID : STD_LOGIC_VECTOR (7 downto 0):="00100000"; -- Manufacturer ID
		memtype : STD_LOGIC_VECTOR (7 downto 0):="00100000"; -- Memory Type
		density : STD_LOGIC_VECTOR (7 downto 0):="00010101"; -- Density 
		Tc: TIME := 20 ns;                                      -- Minimum Clock period
		Tr: TIME := 50 ns;                                      -- Minimum Clock period for read instruction
		tSLCH: TIME:= 5 ns;                                    -- notS active setup time (relative to C)
		tCHSL: TIME:= 5 ns;                                    -- notS not active hold time
		tCH : TIME := 9 ns;                                    -- Clock high time
		tCL : TIME := 9 ns;                                    -- Clock low time
		tDVCH: TIME:= 2 ns;                                     -- Data in Setup Time
		tCHDX: TIME:= 5 ns;                                     -- Data in Hold Time
		tCHSH : TIME := 5 ns;                                  -- notS active hold time (relative to C)
	 	tSHCH: TIME := 5 ns;                                   -- notS not active setup  time (relative to C)
		tSHSL: TIME := 100 ns;                                  -- /S deselect time
		tSHQZ: TIME := 8 ns;                                   -- Output disable Time
		tCLQV: TIME := 8 ns;                                   -- clock low to output valid
		tHLCH: TIME := 5 ns;                                   -- NotHold active setup time
		tCHHH: TIME := 5 ns;                                   -- NotHold not active hold time
		tHHCH: TIME := 5 ns;                                   -- NotHold not active setup time
		tCHHL: TIME := 5 ns;                                   -- NotHold active hold time
		tHHQX: TIME := 8 ns;                                   -- NotHold high to Output Low-Z
		tHLQZ: TIME := 8 ns;                                   -- NotHold low to Output High-Z
	        tWHSL: TIME := 20 ns;                                   -- Write protect setup time (SRWD=1)
	        tSHWL: TIME := 100 ns;                                 -- Write protect hold time (SRWD=1)
		tDP: TIME := 3 us;                                      -- notS high to deep power down mode
		tRES1: TIME := 30 us;                                    -- notS high to stand-by power mode
		tRES2: TIME := 30 us;                                  --
		tW: TIME := 15 ms;                                      -- write status register cycle time
		tPP: TIME := 5 ms;                                      -- page program cycle time
		tSE: TIME := 10 us;--3 sec;                                     -- sector erase cycle time
		tBE: TIME := 30 us;--40 sec;                                    -- bulk erase cycle time
		tVSL: TIME := 10 us;                                    -- Vcc(min) to /S low
		tPUW: TIME := 10 ms;                                    -- Time delay to write instruction
		Vwi: REAL := 2.5 ;                                      -- Write inhibit voltage (unit: V)
		Vccmin: REAL := 2.7 ;                                   -- Minimum supply voltage
		Vccmax: REAL := 3.6                                     -- Maximum supply voltage
		);

PORT(		VCC: IN REAL;
		C, D, S, W, HOLD : IN std_logic ;
		Q : OUT std_logic);

BEGIN
END M25P16;


---------------------------------------------------------------------
--				ARCHITECTURE
---------------------------------------------------------------------
-- This part implements three components: one of type Internal Logic,
-- one of type Memory Access and one of type ACDC check
---------------------------------------------------------------------
ARCHITECTURE structure OF M25P16 IS
COMPONENT Internal_Logic
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
		tBE:TIME );
 PORT (	C, D, HOLD,W,S: IN std_logic;
	data_to_read: IN std_logic_vector (NB_BIT_DATA-1 downto 0);
	Power_up: IN boolean;
	Q: OUT std_logic;
	p_prog: OUT page (0 TO (Plength-1));
	add_mem: OUT std_logic_vector(NB_BIT_ADD_MEM-1 downto 0);
	write_op,read_op,BE_enable,SE_enable,add_pp_enable,PP_enable:OUT boolean;
	read_enable,data_request: OUT boolean;
	wrsr, srwd_wrsr,write_protect: INOUT boolean
);
END COMPONENT;


COMPONENT Memory_Access	
GENERIC(	init_file: string;
		SIZE : positive;
		Plength : positive;
		SSIZE : positive;
		NB_BIT_DATA: positive;
		NB_BIT_ADD: positive;
		NB_BIT_ADD_MEM: positive);
PORT(	add_mem: IN std_logic_vector(NB_BIT_ADD_MEM-1 downto 0);
	BE_enable,SE_enable,add_pp_enable,PP_enable: IN boolean;
	read_enable,data_request: IN boolean;
	p_prog: IN page (0 TO (Plength-1));
	data_to_read: OUT std_logic_vector (NB_BIT_DATA-1 downto 0));
END COMPONENT;


COMPONENT ACDC_check 
GENERIC (	Tc: TIME;
		Tr: TIME;
		tSLCH: TIME;
		tCHSL: TIME;
		tCH : TIME;
		tCL : TIME;
		tDVCH: TIME;
		tCHDX: TIME;
		tCHSH : TIME;
		tSHCH: TIME;
		tSHSL: TIME;
		tHLCH: TIME;
		tCHHH: TIME;
		tHHCH: TIME;
		tCHHL: TIME;
		tVSL: TIME ;
		tPUW: TIME ;
	        tWHSL: TIME;         
	        tSHWL: TIME;          
		Vwi: REAL;
		Vccmin: REAL;
		Vccmax: REAL);
		
PORT (	VCC: IN REAL;
	C, D, S, HOLD : IN std_logic;
	write_op,read_op: IN boolean;
        wrsr: IN boolean;
        srwd_wrsr: IN boolean;
	write_protect: IN boolean;
	Power_up: OUT boolean);
	
END COMPONENT;


 CONSTANT NOMBRE_BIT_ADRESSE_TOTAL: positive:= 24;
 CONSTANT NOMBRE_BIT_ADRESSE_SPI: positive := 8;
 CONSTANT NOMBRE_BIT_DONNEE_SPI: positive :=8;
 SIGNAL adresse: std_logic_vector(NOMBRE_BIT_ADRESSE_TOTAL-1 DOWNTO 0) ;
 SIGNAL dtr: std_logic_vector(NOMBRE_BIT_DONNEE_SPI-1 DOWNTO 0);
 SIGNAL page_prog:page (0 TO (Plength-1));
 SIGNAL wr_op,rd_op,s_en,b_en,add_pp_en,pp_en,r_en,d_req,wrsr, srwd_wrsr,write_protect,p_up : boolean;
 SIGNAL clck : std_logic;


BEGIN

clck<=C;

SPI_decoder:Internal_Logic
GENERIC MAP(
		SIZE=>SIZE,
		Plength => Plength,
		SSIZE => SSIZE,
		NB_BPi => NB_BPi,
		signature => signature,
		manufacturerID => manufacturerID,
		memtype => memtype,
		density => density,
		NB_BIT_DATA => NOMBRE_BIT_DONNEE_SPI,
		NB_BIT_ADD => NOMBRE_BIT_ADRESSE_SPI,
		NB_BIT_ADD_MEM => NOMBRE_BIT_ADRESSE_TOTAL,
		Tc=>Tc,
		tSLCH => tSLCH,
		tCHSL => tCHSL,
		tCH => tCH,
		tCL => tCL,
		tDVCH => tDVCH,
		tCHDX => tCHDX,
		tCHSH => tCHSH,
		tSHCH => tSHCH,
		tSHSL => tSHSL,
		tSHQZ =>tSHQZ,
		tCLQV => tCLQV,
		tHLCH => tHLCH,
		tCHHH => tCHHH,
		tHHCH => tHHCH,
		tCHHL => tCHHL,
		tHHQX => tHHQX,
		tHLQZ => tHLQZ,
		tWHSL => tWHSL,        
		tSHWL => tSHWL,		
		tDP => tDP,
		tRES1 => tRES1,
		tRES2 => tRES2,
		tW => tW,
		tPP => tPP,
		tSE => tSE,
		tBE => tBE )
PORT MAP(	clck, D,HOLD,W,S,dtr,p_up,Q,page_prog,adresse,wr_op,rd_op,b_en,s_en,add_pp_en,pp_en,r_en,d_req, wrsr, srwd_wrsr,write_protect);
	
Mem_access:Memory_Access
GENERIC MAP(	init_file => init_file,
		SIZE => SIZE,
 		Plength => Plength,
		SSIZE => SSIZE,
		NB_BIT_DATA => NOMBRE_BIT_DONNEE_SPI,
		NB_BIT_ADD => NOMBRE_BIT_ADRESSE_SPI,
		NB_BIT_ADD_MEM => NOMBRE_BIT_ADRESSE_TOTAL)

PORT MAP(	adresse,
		b_en,
		s_en,
		add_pp_en,
		pp_en,
		r_en,
		d_req,
		page_prog,
		dtr);

ACDC_watch:ACDC_check
GENERIC MAP(	Tc => Tc,
		Tr => Tr,
		tSLCH => tSLCH,
		tCHSL => tCHSL,
		tCH => tCH,
		tCL => tCL,
		tDVCH => tDVCH,
		tCHDX => tCHDX,
		tCHSH => tCHSH,
		tSHCH => tSHCH,
		tSHSL => tSHSL,
		tHLCH => tHLCH,
		tCHHH => tCHHH,
		tHHCH => tHHCH,
		tCHHL => tCHHL,
		tVSL => tVSL,
		tPUW => tPUW,
		tWHSL => tWHSL,        
		tSHWL => tSHWL,		
		Vwi => Vwi,
		Vccmin => Vccmin,
		Vccmax => Vccmax )
PORT MAP(	VCC,clck,D,S,HOLD,wr_op,rd_op,wrsr, srwd_wrsr, write_protect,p_up);

END structure;
