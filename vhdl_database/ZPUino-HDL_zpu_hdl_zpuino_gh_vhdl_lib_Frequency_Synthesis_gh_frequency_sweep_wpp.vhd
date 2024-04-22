---------------------------------------------------------------------
--	Filename:	gh_Frequency_sweep_wpp.vhd
--
--	Description:
--		a sweep generator with ping-pong
--
--	Copyright (c) 2005, 2008 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	10/01/05  	h lefevre	Initial revision
--	2.0     	09/01/08  	h lefevre	initial ping pong version
--
--------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity gh_frequency_sweep_wpp is
	GENERIC (acc_size : INTEGER := 51;
	         step_size : INTEGER := 40;
	         freq_size : INTEGER := 32);
	Port ( 
		clk        : in std_logic;
		rst        : in std_logic;
		sw_en      : in std_logic := '1'; -- sweep enable
		min_freq   : in std_logic_vector(freq_size-1 downto 0);
		max_freq   : in std_logic_vector(freq_size-1 downto 0);
		freq_step  : in std_logic_vector(step_size-1 downto 0);
		ping_pong  : in std_logic := '0';
		LOAD       : in std_logic := '0';
		sweep_freq : out std_logic_vector(freq_size-1 downto 0);
		sweep_end  : out std_logic
		);
end entity;

architecture a of gh_frequency_sweep_wpp is

component gh_acc_ld is
	GENERIC (size: INTEGER := 16);
	PORT(	
		CLK  : IN  STD_LOGIC;
		rst  : IN  STD_LOGIC := '0';
		LOAD : IN  STD_LOGIC := '0'; 
		CE   : IN  STD_LOGIC := '1';
		D    : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q    : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

	signal isweep_freq    : std_logic_vector(acc_size-1 downto 0);
	signal cmp_min_freq   : std_logic;
	signal cmp_max_freq   : std_logic;
	signal sw_load        : std_logic;
	signal load_dly       : std_logic;
	signal load_mode      : std_logic_vector(2 downto 0);
	signal invert         : std_logic;
	signal isweep_end     : std_logic;
	signal sweep_end_dly  : std_logic_vector(3 downto 0);
	signal next_step      : std_logic_vector(acc_size-1 downto 0);
	signal next_step_mode : std_logic_vector(3 downto 0);
	signal sign_extend    : std_logic_vector(acc_size-step_size-1 downto 0);
	signal neg_sweep_step : std_logic_vector(acc_size-1 downto 0);
	constant zero_extend  : STD_LOGIC_VECTOR(acc_size-freq_size-1 downto 0) := (others => '0');
	
begin

	sweep_end <= isweep_end;
	
	cmp_min_freq <= '1' when (min_freq > isweep_freq(acc_size-1 downto acc_size-freq_size)) else
	                '0';	

	cmp_max_freq <= '1' when (max_freq < isweep_freq(acc_size-1 downto acc_size-freq_size)) else
	                '0';
					
process(clk,rst)
begin
	if (rst = '1') then
		isweep_end <= '0';
	elsif (rising_edge(clk)) then
		if ((cmp_min_freq = '1') or (cmp_max_freq = '1')) then
			isweep_end <= '1';
		else
			isweep_end <= '0';
		end if;
	end if;
end process;

---------------------------------------------------------------
---- when the frequency is out of range 
----    (below the min freq or above the max)
----    it is time to reload the frequency - except in ping pong mode
---------------------------------------------------------------

	load_mode <= (LOAD & load_dly & isweep_end);

process(load_mode)
begin
	case (load_mode) is
		when "100" => sw_load <= '0';
		when "101" => sw_load <= '0';
		when "110" => sw_load <= '0';
		when "111" => sw_load <= '0';
		------------------------
		when "001" => sw_load <= '1';
		------------------------
		when others => sw_load <= '0';
	end case;
end process;

---------------------------------------------------------------
----- when load is low, take a frequency step
-----   when a up sweep (the increment value is positive) 
-----          load min_freq
-----   when a down sweep, load the max_freq,
-----   unless ping pong is enabled - where step, or the 2's comp 
-----   of step is (most) always used, based on state of invert bit
---------------------------------------------------------------

	next_step_mode <= (freq_step(step_size-1) & sw_load & ping_pong & invert);
	sign_extend <= (others => freq_step(step_size-1));
	
process(next_step_mode)
begin	
	case (next_step_mode) is
		when "0100" => next_step <= (min_freq & zero_extend);
		when "0101" => next_step <= (min_freq & zero_extend);
		when "0110" => next_step <= (min_freq & zero_extend);
		when "0111" => next_step <= (min_freq & zero_extend);
		------------------------
		when "1100" => next_step <= (max_freq & zero_extend);
		when "1101" => next_step <= (max_freq & zero_extend);
		when "1110" => next_step <= (max_freq & zero_extend);
		when "1111" => next_step <= (max_freq & zero_extend);
		------------------------
		when "0011" => next_step <= neg_sweep_step;	
		when "1011" => next_step <= neg_sweep_step;
		------------------------
		when others => next_step <= (sign_extend & freq_step);
	end case;
end process;
					 
u1:	gh_acc_ld  generic map(acc_size)
	port map(
		clk => clk,
		rst => rst,
		LOAD => sw_load,
		CE => sw_en,
		D => next_step,
		Q => isweep_freq);				 

process(clk,rst)
begin
	if (rst = '1') then
		neg_sweep_step <= (others => '0');
	elsif (rising_edge(clk)) then
		neg_sweep_step <= (x"0" - (sign_extend & freq_step));
	end if;
end process;
		
---------------------------------------------------------------
-- signals added for ping pong control ------------------------
-- load_dly prevents reloading at the end of a ping pong sweep,
--  but will allow a load if a change in end points makes the 
--  current sweep position out of range
---------------------------------------------------------------

process(clk,rst)
begin
	if (rst = '1') then
		invert <= '0';
		sweep_end_dly <= (others => '0');
		load_dly <= '0';
	elsif (rising_edge(clk)) then
		if ((ping_pong = '0') or (sw_load = '1')) then
			invert <= '0';
		elsif ((isweep_end = '1') and (sweep_end_dly = x"0")) then
			invert <= (not invert);
		end if;
		sweep_end_dly(0) <= isweep_end;
		sweep_end_dly(3 downto 1) <= sweep_end_dly(2 downto 0);
		if (sweep_end_dly = x"f") then
			load_dly <= '0';
		else
			load_dly <= '1';
		end if;
	end if;
end process;
		
		
---------------------------------------------------------------
----  output register  -------------
---------------------------------------------------------------
		
process(clk,rst)
begin
	if (rst = '1') then
		sweep_freq <= (others => '0');
	elsif (rising_edge(clk)) then
		if (sw_en = '0') then
			sweep_freq <= (others => '0');
		else
			sweep_freq <= isweep_freq(acc_size-1 downto acc_size-freq_size);
		end if;
	end if;
end process;
	

end architecture;
