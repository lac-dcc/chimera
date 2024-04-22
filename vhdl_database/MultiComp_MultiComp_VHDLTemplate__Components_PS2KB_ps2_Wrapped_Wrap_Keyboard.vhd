-- Wrapper for the PS/2 keyboard for Multicomp
-- Replaces the keyboard from SBCTerminal code
-- Replace display with 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Wrap_Keyboard IS
port (
		i_CLOCK_50				: IN  STD_LOGIC;  -- input clock
		i_n_reset				: IN  STD_LOGIC;  -- 
		i_kbCS					: IN  STD_LOGIC;  -- 
		i_RegSel					: IN  STD_LOGIC; -- address
		i_rd_Kbd					: IN  STD_LOGIC;  --
		i_ps2_clk				: IN  STD_LOGIC;  --
		i_ps2_data				: IN  STD_LOGIC;  --
		o_kbdDat					: OUT STD_LOGIC_vector(7 downto 0));
end Wrap_Keyboard;

ARCHITECTURE logic OF Wrap_Keyboard IS

	-- Keyboard cotrols
	signal w_kbdStatus		:	std_logic_vector(7 downto 0);
	signal w_kbReadData		:	std_logic_vector(6 downto 0);
	signal q_kbReadData		:	std_logic_vector(7 downto 0);
	signal W_kbDataValid		:	std_logic;
	signal w_latKbDV1			:	std_logic;

	-- Signal Tap Logic Analyzer signals
	attribute syn_keep	: boolean;
	attribute syn_keep of W_kbDataValid			: signal is true;
	attribute syn_keep of w_latKbDV1			: signal is true;
	
BEGIN

	o_kbdDat <= q_kbReadData 	when i_RegSel = '1' else	-- Data at address 1
					w_kbdStatus  	when i_RegSel = '0';			-- Status ar address 0

	-- PS/2 keyboard - ASCII output
	ps2Keyboard : entity work.ps2_keyboard_to_ascii
	port map (
		clk			=> i_CLOCK_50,
		ps2_clk		=> i_PS2_CLK,
		ps2_data		=> i_PS2_DATA,	
		ascii_code	=> w_kbReadData,
		ascii_new	=> W_kbDataValid
	);
	
	-- Latch up the keyboard data when data valid signal is present

	process (i_CLOCK_50, i_n_reset, W_kbDataValid, w_kbReadData, i_rd_Kbd)
	begin
		if i_n_reset = '0' then
			w_latKbDV1 <= '0';
			w_kbdStatus <= x"00";
		elsif rising_edge(i_CLOCK_50)  then
			w_latKbDV1 <= W_kbDataValid;
			if ((W_kbDataValid = '1') and (w_latKbDV1 = '0')) then
				w_kbdStatus <= x"01";			-- set at edge of dataValid
				q_kbReadData <= '0' & w_kbReadData;
			elsif ((i_rd_Kbd = '1') and (i_kbCS = '1') and (i_RegSel = '1')) then	-- Clear when reading data from keyboard
				w_kbdStatus <= x"00";
			end if;
		end if;
	end process;

END logic;
