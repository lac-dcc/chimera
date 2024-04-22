---------------------------------------------------------------------
--	Filename:	gh_Frequency_sweep.vhd
--
--	Description:
--		the guts of a sweep generator 
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	10/01/05  	h lefevre	Initial revision
--
--------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity gh_frequency_sweep is
	GENERIC (merge_point: INTEGER := 24);
	Port ( 
		clk        : in std_logic;
		rst        : in std_logic;
		min_freq   : in std_logic_vector(31 downto 0);
		max_freq   : in std_logic_vector(31 downto 0);
		freq_step  : in std_logic_vector(31 downto 0);
		LOAD       : in std_logic := '0';
		phase      : out std_logic_vector(31 downto 0);
		sweep_end  : out std_logic
		);
end entity;

architecture a of gh_frequency_sweep is

component gh_acc_ld is
	GENERIC (size: INTEGER := 16);
	PORT(	
		CLK      : IN  STD_LOGIC;
		rst      : IN  STD_LOGIC := '0';
		LOAD     : IN  STD_LOGIC := '0'; 
		CE       : IN  STD_LOGIC := '1';
		D        : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component gh_acc_ld;

component gh_acc is
	GENERIC (size: INTEGER := 16);
	PORT(	
		CLK      : IN  STD_LOGIC;
		rst      : IN  STD_LOGIC := '0';
		srst     : IN  STD_LOGIC := '0'; -- 09/05/05
		CE       : IN  STD_LOGIC := '1';
		D        : IN  STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q        : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component gh_acc;

	signal isweep_freq : std_logic_vector(63-merge_point downto 0);
	signal cmp_min_freq : std_logic;
	signal cmp_max_freq : std_logic;
	signal sw_load : std_logic;
	signal next_step : std_logic_vector(63-merge_point downto 0);
	signal sign_extend : std_logic_vector(31-merge_point downto 0);
	constant zero_extend : STD_LOGIC_VECTOR(31-merge_point downto 0) := (others => '0');

begin
 
	sweep_end <= '1' when (cmp_min_freq = '1') else
	             '1' when (cmp_max_freq = '1') else
	             '0';
	
	cmp_min_freq <= '1' when (min_freq > isweep_freq(63-merge_point downto 32-merge_point)) else
	                '0';	

	cmp_max_freq <= '1' when (max_freq < isweep_freq(63-merge_point downto 32-merge_point)) else
	                '0';

---------------------------------------------------------------
---- when the frequency is out of range 
----    (below the min freq or above the max)
----    it is time to reload the frequency 
---------------------------------------------------------------

	sw_load <= '1' when (LOAD = '1') else
	           '1' when (cmp_min_freq = '1') else
	           '1' when (cmp_max_freq = '1') else
	           '0';
			
	sign_extend <= (others => freq_step(31));

---------------------------------------------------------------
----- when load is low, take a frequency step
-----   when a up sweep (the increment value is positive) 
-----          load min_freq
-----   when a down sweep, load the max_freq
---------------------------------------------------------------

	next_step <= (sign_extend & freq_step) when (sw_load = '0') else
	             (min_freq & zero_extend) when (freq_step(31) = '0') else
	             (max_freq & zero_extend);

u1:	gh_acc_ld  generic map(64-merge_point)
	port map(
		clk => clk,
		rst => rst,
		LOAD => sw_load,
		CE => '1',
		D => next_step,
		Q => isweep_freq);				 

---------------------------------------------------------------
----  Here is the Accumulator serving as the NCO  -------------
---------------------------------------------------------------
		
u2:	gh_acc  generic map(32)
	port map(
		clk => clk,
		rst => rst,
		srst => LOAD,
		CE => '1',
		D => isweep_freq(63-merge_point downto 32-merge_point),
		Q => phase);	

end architecture;
