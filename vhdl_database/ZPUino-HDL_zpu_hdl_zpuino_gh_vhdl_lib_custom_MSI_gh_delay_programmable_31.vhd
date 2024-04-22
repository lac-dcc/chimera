-----------------------------------------------------------------------------
--	Filename:	gh_delay_programmable_31.vhd
--
--	Description:
--		a programmable delay line, upto 31 clock delay
--
--	Copyright (c) 2006 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	01/14/06   	G Huber 	Initial revision
--	1.1     	05/22/06  	G Huber 	replace U1 with process
--	1.2      	06/24/06   	G Huber 	fix typo 
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity gh_delay_programmable_31 is
  port(
  		CLK   : in STD_LOGIC;
		rst   : in STD_LOGIC;
		srst  : in STD_LOGIC := '0';
		D     : in STD_LOGIC;
		DELAY : in STD_LOGIC_VECTOR(4 downto 0);
		Q     : out STD_LOGIC
		);
END entity;

architecture a of gh_delay_programmable_31 is

component gh_delay
	generic(clock_delays : INTEGER := 16);
	port(
		clk  : IN STD_logic;
		rst  : IN STD_logic;
		srst : IN STD_logic := '0';
		D    : IN STD_LOGIC;
		Q    : OUT STD_LOGIC
		);
end component;

	signal D_d1   : STD_LOGIC;
	signal D_d2   : STD_LOGIC;
	signal D_d4   : STD_LOGIC;
	signal D_d8   : STD_LOGIC;
	signal D_d16  : STD_LOGIC;

	signal Q_d1   : STD_LOGIC;
	signal Q_d2   : STD_LOGIC;
	signal Q_d4   : STD_LOGIC;
	signal Q_d8   : STD_LOGIC;
	signal Q_d16  : STD_LOGIC;
	
begin
	
	Q <= D     when (DELAY = "00000") else
	     Q_d1  when (DELAY(0) = '1') else
	     Q_d2  when (DELAY(1) = '1') else
	     Q_d4  when (DELAY(2) = '1') else
	     Q_d8  when (DELAY(3) = '1') else
	     Q_d16;

	D_d16 <= D;

	D_d8 <= Q_d16  when (DELAY(4) = '1') else
	        D;
			 
	D_d4 <= Q_d16  when (DELAY(4 downto 3) = "10") else
	        Q_d8   when (DELAY(3) = '1') else
	        D;
		
	D_d2 <= Q_d16  when (DELAY(4 downto 2) = "100") else
	        Q_d8   when (DELAY(3 downto 2) = "10") else
	        Q_d4   when (DELAY(2) = '1') else
	        D;

	D_d1 <= Q_d16  when (DELAY(4 downto 1) = "1000") else
	        Q_d8   when (DELAY(3 downto 1) = "100") else
	        Q_d4   when (DELAY(2 downto 1) = "10") else
	        Q_d2   when (DELAY(1) = '1') else
	        D;
			
----------------------------------------------------------
---- fixed delay lines -----------------------------------
----------------------------------------------------------

process(CLK,rst)
begin
	if (rst = '1') then
		Q_d1 <= '0';
	elsif (rising_edge(CLK)) then
		if (srst = '1') then
			Q_d1 <= '0';
		else
			Q_d1 <= D_d1;
		end if;
	end if;
end process;

U2 : gh_delay
	generic map (clock_delays => 2)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d2,
		Q => Q_d2);
		
U3 : gh_delay
	generic map (clock_delays => 4)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d4,
		Q => Q_d4);
		
U4 : gh_delay
	generic map (clock_delays => 8)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d8,
		Q => Q_d8);		
	
U5 : gh_delay
	generic map (clock_delays => 16)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d16,
		Q => Q_d16);
		
end a;
