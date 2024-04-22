-----------------------------------------------------------------------------
--	Filename:	gh_nco.vhd
--
--	Description:
--		a simple "Numerically Controlled Oscillator"
--		  also called a "Direct Digital Synthesizer"
--		      or a "Digitally Controlled Oscillator"
--
--	Copyright (c) 2005, 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/18/05  	g huber  	Initial revision
--	1.1      	02/27/06 	g huber  	add gh_ to parts in file
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_nco is
	GENERIC (freq_word_size: INTEGER := 32;
	         sin_data_size: INTEGER := 16);	-- max value for sin_data_size is 16
	port(
		clk  : in STD_LOGIC;
	 	rst  : in STD_LOGIC; 
		FREQ : in STD_LOGIC_VECTOR(freq_word_size-1 downto 0);
		sin  : out STD_LOGIC_VECTOR(sin_data_size-1 downto 0);
		cos  : out STD_LOGIC_VECTOR(sin_data_size-1 downto 0)
		);
end gh_nco;

architecture a of gh_nco is

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

	signal ACC_data   : STD_LOGIC_VECTOR(freq_word_size-1 DOWNTO 0);

	
begin

u1:	gh_acc  generic map(freq_word_size)
	port map(
		clk => clk,
		rst => rst,
		D => FREQ,
		Q => ACC_data);	
	
u2:	gh_sincos  generic map(sin_data_size)
	port map(
		clk => clk,
		rst => rst,
		add => ACC_data(freq_word_size-1 downto freq_word_size - sin_data_size),
		cos => cos,
		sin => sin);
	
end a;
