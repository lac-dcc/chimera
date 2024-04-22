-----------------------------------------------------------------------------
--	Filename:	gh_delay_programmable_255_bus.vhd
--
--	Description:
--		a bussed, programmable delay line, upto 255 clock delay
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	--------	-----------
--	1.0      	04/29/07   	G Huber 	Initial revision
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity gh_delay_programmable_255_bus is
	GENERIC (size : INTEGER := 8);
	port(
		CLK   : in STD_LOGIC;
		rst   : in STD_LOGIC;
		srst  : in STD_LOGIC := '0';
		D     : in STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		DELAY : in STD_LOGIC_VECTOR(7 downto 0);
		Q     : out STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
END entity;

architecture a of gh_delay_programmable_255_bus is

component gh_delay_bus
	GENERIC (clock_delays : INTEGER := 16;
	         size : INTEGER := 2); 
	PORT(
		clk  : IN STD_logic;
		rst  : IN STD_logic;
		srst : IN STD_logic := '0';
		D    : IN STD_LOGIC_VECTOR(size-1 DOWNTO 0);
		Q    : OUT STD_LOGIC_VECTOR(size-1 DOWNTO 0)
		);
end component;

	signal D_d1   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal D_d2   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal D_d4   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal D_d8   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal D_d16  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal D_d32  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal D_d64  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal D_d128 : STD_LOGIC_VECTOR(size-1 DOWNTO 0);

	signal Q_d1   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal Q_d2   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal Q_d4   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal Q_d8   : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal Q_d16  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal Q_d32  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal Q_d64  : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	signal Q_d128 : STD_LOGIC_VECTOR(size-1 DOWNTO 0);
	
begin
	
	Q <= D     when (DELAY = x"00") else
	     Q_d1  when (DELAY(0) = '1') else
	     Q_d2  when (DELAY(1) = '1') else
	     Q_d4  when (DELAY(2) = '1') else
	     Q_d8  when (DELAY(3) = '1') else
	     Q_d16 when (DELAY(4) = '1') else
	     Q_d32 when (DELAY(5) = '1') else
	     Q_d64 when (DELAY(6) = '1') else
	     Q_d128;

	D_d128 <= D;
	
	D_d64 <= Q_d128 when (DELAY(7) = '1') else
	         D;

	D_d32 <= Q_d128 when (DELAY(7 downto 6) = "10") else
	         Q_d64  when (DELAY(6) = '1') else
	         D;

	D_d16 <= Q_d128 when (DELAY(7 downto 5) = "100") else
	         Q_d64  when (DELAY(6 downto 5) = "10") else
	         Q_d32  when (DELAY(5) = '1') else
	         D;

	D_d8 <= Q_d128 when (DELAY(7 downto 4) = "1000") else
	        Q_d64  when (DELAY(6 downto 4) = "100") else
	        Q_d32  when (DELAY(5 downto 4) = "10") else
	        Q_d16  when (DELAY(4) = '1') else
	        D;
			 
	D_d4 <= Q_d128 when (DELAY(7 downto 3) = "10000") else
	        Q_d64  when (DELAY(6 downto 3) = "1000") else
	        Q_d32  when (DELAY(5 downto 3) = "100") else
	        Q_d16  when (DELAY(4 downto 3) = "10") else
	        Q_d8   when (DELAY(3) = '1') else
	        D;
		
	D_d2 <= Q_d128 when (DELAY(7 downto 2) = "100000") else
	        Q_d64  when (DELAY(6 downto 2) = "10000") else
	        Q_d32  when (DELAY(5 downto 2) = "1000") else
	        Q_d16  when (DELAY(4 downto 2) = "100") else
	        Q_d8   when (DELAY(3 downto 2) = "10") else
	        Q_d4   when (DELAY(2) = '1') else
	        D;

	D_d1 <= Q_d128 when (DELAY(7 downto 1) = "1000000") else
	        Q_d64  when (DELAY(6 downto 1) = "100000") else
	        Q_d32  when (DELAY(5 downto 1) = "10000") else
	        Q_d16  when (DELAY(4 downto 1) = "1000") else
	        Q_d8   when (DELAY(3 downto 1) = "100") else
	        Q_d4   when (DELAY(2 downto 1) = "10") else
	        Q_d2   when (DELAY(1) = '1') else
	        D;
			
----------------------------------------------------------
---- fixed delay lines -----------------------------------
----------------------------------------------------------
	
U1 : gh_delay_bus
	generic map (clock_delays => 1, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d1,
		Q => Q_d1);

U2 : gh_delay_bus
	generic map (clock_delays => 2, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d2,
		Q => Q_d2);
		
U3 : gh_delay_bus
	generic map (clock_delays => 4, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d4,
		Q => Q_d4);
		
U4 : gh_delay_bus
	generic map (clock_delays => 8, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d8,
		Q => Q_d8);		
	
U5 : gh_delay_bus
	generic map (clock_delays => 16, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d16,
		Q => Q_d16);

U6 : gh_delay_bus
	generic map (clock_delays => 32, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d32,
		Q => Q_d32);
		
U7 : gh_delay_bus
	generic map (clock_delays => 64, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d64,
		Q => Q_d64);
		
U8 : gh_delay_bus
	generic map (clock_delays => 128, size => size)
	port map(
		clk => CLK,
		rst => rst,
		srst => srst,
		D => D_d128,
		Q => Q_d128);

end a;
