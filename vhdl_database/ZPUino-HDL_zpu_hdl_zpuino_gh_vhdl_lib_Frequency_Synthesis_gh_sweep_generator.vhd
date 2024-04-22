---------------------------------------------------------------------
--	Filename:	gh_sweep_generator.vhd
--			
--	Description:
--		sweep generator 
--
--	Copyright (c) 2005 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 								 
--
--	Revision	History:
--	Revision	Date      	Author   	Comment
--	--------	----------	---------	-----------
--	1.0     	10/01/05  	h lefevre	Initial revision
--	1.1      	03/27/06 	g huber  	add gh_ to parts in file
--
--------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity gh_sweep_generator is
	GENERIC (merge_point: INTEGER := 24);
	Port ( 
		clk        : in std_logic;
		rst        : in std_logic;
		min_freq   : in std_logic_vector(31 downto 0);
		max_freq   : in std_logic_vector(31 downto 0);
		freq_step  : in std_logic_vector(31 downto 0);
		LOAD       : in std_logic;
		sin        : out std_logic_vector(15 downto 0);
		cos        : out std_logic_vector(15 downto 0);
		sweep_end  : out std_logic
		);
end entity;

architecture a of gh_sweep_generator is

component gh_frequency_sweep is
	GENERIC (merge_point: INTEGER := 24);
	PORT(	
		clk        : in std_logic;
		rst        : in std_logic;
		min_freq   : in std_logic_vector(31 downto 0);
		max_freq   : in std_logic_vector(31 downto 0);
		freq_step  : in std_logic_vector(31 downto 0);
		LOAD       : in std_logic;
		phase      : out std_logic_vector(31 downto 0);
		sweep_end  : out std_logic
		);
end component gh_frequency_sweep;

component gh_sincos is	
	GENERIC (size: INTEGER := 16);	-- max value for width is 16
	port(
		clk  : in STD_LOGIC;
	 	rst  : in STD_LOGIC; 
		add  : in STD_LOGIC_VECTOR(size-1 downto 0);
		sin  : out STD_LOGIC_VECTOR(size-1 downto 0);
		cos  : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end component gh_sincos;

	signal phase : std_logic_vector(31 downto 0);

begin

u1:	gh_frequency_sweep
	GENERIC map(merge_point)
	port map(
		clk => clk,
		rst => rst,
		min_freq => min_freq,
		max_freq => max_freq,
		freq_step => freq_step,
		LOAD => LOAD,
		phase => phase,
		sweep_end => sweep_end);	

u2:	gh_sincos  generic map(16)
	port map(
		clk => clk,
		rst => rst,
		add => phase(31 downto 16),
		cos => cos,
		sin => sin);

end architecture;
