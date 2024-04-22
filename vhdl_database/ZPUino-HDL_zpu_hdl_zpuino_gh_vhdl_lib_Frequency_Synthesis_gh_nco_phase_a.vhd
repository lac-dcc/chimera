-----------------------------------------------------------------------------
--	Filename:	gh_nco_phase_a.vhd
--
--	Description:
--		a "Numerically Controlled Oscillator"
--		  also called a "Direct Digital Synthesizer"
--		      or a "Digitally Controlled Oscillator"
--		with a phase adjust port
--
--	Copyright (c) 2005, 2006, 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions 
--
--	Revision 	History:
--	Revision 	Date      	Author   	Comment
--	-------- 	----------	---------	-----------
--	1.0      	09/18/05  	g huber  	Initial revision
--	2.0     	03/25/06  	g huber  	add gh_ to sincos
--	2.1     	02/03/06  	g huber  	add U3 to to improve performance
--	2.2     	11/25/07  	h lefevre	first _a version, uses gh_sincos_a.vhd
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;

entity gh_nco_phase_a is
	GENERIC (freq_word_size: INTEGER := 32;
	         phase_word_size: INTEGER := 8;	-- can not be bigger than sin_data_size
	         sin_data_size: INTEGER := 16);	-- max value for sin_data_size is 16
	port(
		clk   : in STD_LOGIC;
	 	rst   : in STD_LOGIC; 
		FREQ  : in STD_LOGIC_VECTOR(freq_word_size-1 downto 0);
		PHASE :	in STD_LOGIC_VECTOR(phase_word_size-1 downto 0);
		sin   : out STD_LOGIC_VECTOR(sin_data_size-1 downto 0);
		cos   : out STD_LOGIC_VECTOR(sin_data_size-1 downto 0)
		);
end entity;

architecture a of gh_nco_phase_a is

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

component gh_sincos_a is	
	GENERIC (size: INTEGER := 16);	-- max value for width is 16
	port(
		clk  : in STD_LOGIC;
	 	rst  : in STD_LOGIC; 
		add  : in STD_LOGIC_VECTOR(size-1 downto 0);
		sin  : out STD_LOGIC_VECTOR(size-1 downto 0);
		cos  : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end component gh_sincos_a;

component gh_register is	
	GENERIC (size: INTEGER := 8);
	PORT(	
		clk : IN		STD_LOGIC;
		rst : IN		STD_LOGIC; 
		D   : IN		STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q   : OUT		STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

	signal ACC_data   : STD_LOGIC_VECTOR(freq_word_size-1 downto 0);

	signal sin_phase  : STD_LOGIC_VECTOR(sin_data_size-1 downto 0);
	signal isin_phase : STD_LOGIC_VECTOR(sin_data_size-1 downto 0);
	signal pad_phase  : STD_LOGIC_VECTOR(sin_data_size-phase_word_size-1 downto 0);
	
begin

u1:	gh_acc  generic map(freq_word_size)
	port map(
		clk => clk,
		rst => rst,
		D => FREQ,
		Q => ACC_data);	
		
	pad_phase <= (others => '0');
	isin_phase <= (ACC_data(freq_word_size-1 downto freq_word_size - sin_data_size))
	               + (phase & pad_phase);

u3: gh_register generic map (sin_data_size) 
	           port map (clk,rst,isin_phase,sin_phase);
				  
u2:	gh_sincos_a  generic map(sin_data_size)
	port map(
		clk => clk,
		rst => rst,
		add => sin_phase,
		cos => cos,
		sin => sin);
	
end a;
