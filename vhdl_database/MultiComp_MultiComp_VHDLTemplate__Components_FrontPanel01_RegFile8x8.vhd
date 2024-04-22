-- --------------------------------------------------------------------
-- Register file
-- 8 of 8-bit registers
-- Registers are reset to 0 at reset
-- --------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RegFile8x8 IS
  PORT 
  (
		i_clk			: IN std_logic;							-- Clock
		i_resetN		: IN std_logic;							-- reset
		i_wrReg		: IN std_logic;							-- Write register strobe
		i_regNum		: IN std_logic_vector(3 DOWNTO 0);	-- Register Number
		i_DataIn		: IN std_logic_vector(7 DOWNTO 0);	-- Data in to Register file
		o_DataOut	: OUT std_logic_vector(7 DOWNTO 0)	-- Data out from Register file
	);
END RegFile8x8;

ARCHITECTURE RegFile8x8_beh OF RegFile8x8 IS

	-- Register file load strobes
	signal w_ldReg0	: std_logic;
	signal w_ldReg1	: std_logic;
	signal w_ldReg2	: std_logic;
	signal w_ldReg3	: std_logic;
	signal w_ldReg4	: std_logic;
	signal w_ldReg5	: std_logic;
	signal w_ldReg6	: std_logic;
	signal w_ldReg7	: std_logic;

	-- Register File (Registers)
	signal w_regFR0	: std_logic_vector(7 DOWNTO 0);
	signal w_regFR1	: std_logic_vector(7 DOWNTO 0);
	signal w_regFR2	: std_logic_vector(7 DOWNTO 0);
	signal w_regFR3	: std_logic_vector(7 DOWNTO 0);
	signal w_regFR4	: std_logic_vector(7 DOWNTO 0);
	signal w_regFR5	: std_logic_vector(7 DOWNTO 0);
	signal w_regFR6	: std_logic_vector(7 DOWNTO 0);
	signal w_regFR7	: std_logic_vector(7 DOWNTO 0);

BEGIN
					
	-- Register file output selection mux
	o_DataOut <=	w_regFR0 when i_regNum = x"0" else
						w_regFR1 when i_regNum = x"1" else
						w_regFR2 when i_regNum = x"2" else
						w_regFR3 when i_regNum = x"3" else
						w_regFR4 when i_regNum = x"4" else
						w_regFR5 when i_regNum = x"5" else
						w_regFR6 when i_regNum = x"6" else
						w_regFR7 when i_regNum = x"7" else
						x"00" 	when i_regNum = x"8" else		-- hard codes reg8 = x00
						x"01" 	when i_regNum = x"9" else		-- hard codes reg8 = x01
						x"FF" 	when i_regNum = x"F";			-- hard codes regF = xFF
	
	-- Register file loads
	w_ldReg0	<= '1' when ((i_wrReg = '1') and (i_regNum = x"0")) else	'0';
	w_ldReg1	<= '1' when ((i_wrReg = '1') and (i_regNum = x"1")) else '0';
	w_ldReg2	<= '1' when ((i_wrReg = '1') and (i_regNum = x"2")) else '0';
	w_ldReg3	<= '1' when ((i_wrReg = '1') and (i_regNum = x"3")) else '0';
	w_ldReg4	<= '1' when ((i_wrReg = '1') and (i_regNum = x"4")) else '0';
	w_ldReg5	<= '1' when ((i_wrReg = '1') and (i_regNum = x"5")) else '0';
	w_ldReg6	<= '1' when ((i_wrReg = '1') and (i_regNum = x"6")) else '0';
	w_ldReg7	<= '1' when ((i_wrReg = '1') and (i_regNum = x"7")) else '0';
	
	regF0 : process (i_clk, w_ldReg0)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR0 <= x"00";
			elsif w_ldReg0 = '1' then
				w_regFR0 <= i_DataIn;
			end if;
		end if;
	END process;
	
	regF1 : process (i_clk, w_ldReg1)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR1 <= x"00";
			elsif w_ldReg1 = '1' then
				w_regFR1 <= i_DataIn;
			end if;
		end if;
	END process;
	
	regF2 : process (i_clk, w_ldReg2)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR2 <= x"00";
			elsif w_ldReg2 = '1' then
				w_regFR2 <= i_DataIn;
			end if;
		end if;
	END process;
	
	regF3 : process (i_clk, w_ldReg3)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR3 <= x"00";
			elsif w_ldReg3 = '1' then
				w_regFR3 <= i_DataIn;
			end if;
		end if;
	END process;
	
	regF4 : process (i_clk, w_ldReg4)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR4 <= x"00";
			elsif w_ldReg4 = '1' then
				w_regFR4 <= i_DataIn;
			end if;
		end if;
	END process;
	
	regF5 : process (i_clk, w_ldReg5)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR5 <= x"00";
			elsif w_ldReg5 = '1' then
				w_regFR5 <= i_DataIn;
			end if;
		end if;
	END process;
	
	regF6 : process (i_clk, w_ldReg6)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR6 <= x"00";
			elsif w_ldReg6 = '1' then
				w_regFR6 <= i_DataIn;
			end if;
		end if;
	END process;
	
	regF7 : process (i_clk, w_ldReg7)
	BEGIN
		IF rising_edge(i_clk) THEN
			IF i_resetN = '0' THEN
				w_regFR7 <= x"00";
			elsif w_ldReg7 = '1' then
				w_regFR7 <= i_DataIn;
			end if;
		end if;
	END process;
	
END RegFile8x8_beh;
