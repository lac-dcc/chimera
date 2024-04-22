---------------------------------------------------------------------
--	Filename:	gh_filter_AB_interpolation.vhd
--
--	Description:
--		AB interpolation filter (sigal data path to AB poly-phase data path)
--		  low pass filter with coefficients of [.03125 .5 .9375 .5 .03125]
--		  uses shift and add (uses no multipliers)
--		   aprox responce
--		   -0.01 dB @ .9% sample rate
--		   -1 dB @ 9% sample rate
--		   -3 dB @ 15% sample rate
--		   -30 dB @ 44% sample rate
--		   -80 dB @ 49.53% sample rate
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author   	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	10/14/07  	H LeFevre	Initial revision
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_signed.all;

entity gh_filter_AB_interpolation is
	GENERIC (size: INTEGER :=16);
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		ce  : in STD_LOGIC:='1';
		D   : in STD_LOGIC_VECTOR(size-1 downto 0);
		QA  : out STD_LOGIC_VECTOR(size-1 downto 0);
		QB  : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end entity;

architecture a of gh_filter_AB_interpolation is

	signal iD     : STD_LOGIC_VECTOR(size downto 0);
	signal iD_d2  : STD_LOGIC_VECTOR(size downto 0);
	signal iD_d16 : STD_LOGIC_VECTOR(size downto 0);
	signal iD_d32 : STD_LOGIC_VECTOR(size downto 0);
	
	signal t0_d32 : STD_LOGIC_VECTOR(size downto 0);
	signal t1_d32 : STD_LOGIC_VECTOR(size downto 0);
	signal t0_d2 : STD_LOGIC_VECTOR(size downto 0);
	signal t1_d2 : STD_LOGIC_VECTOR(size downto 0);
	signal t1_A  : STD_LOGIC_VECTOR(size downto 0);
	signal t0_A  : STD_LOGIC_VECTOR(size downto 0);

	signal iQA   : STD_LOGIC_VECTOR(size downto 0);
	signal iQB   : STD_LOGIC_VECTOR(size downto 0);
	signal rQA   : STD_LOGIC_VECTOR(size downto 0);
	signal rQB   : STD_LOGIC_VECTOR(size downto 0);
	
begin
	
	QA <= rQA(size downto 1);
	QB <= rQB(size downto 1);
		
	iD     <= D & '0';
	iD_d2  <= D(size-1) & D;
	iD_d16 <= D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 3);
	iD_d32 <= D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 4);

process (clk,rst)
begin
	if (rst = '1')	then
		t0_d32 <= (others => '0');
		t1_d32 <= (others => '0');
		t0_d2 <= (others => '0');
		t1_d2 <= (others => '0');
		t0_A <= (others => '0');
		t1_A <= (others => '0');
		iQA <= (others => '0');
		iQB <= (others => '0');
		rQA <= (others => '0');
		rQB <= (others => '0');
	elsif (rising_edge(CLK)) then
		if (ce = '1') then
			t0_d32 <= iD_d32;
			t1_d32 <= t0_d32;
			t0_d2 <= iD_d2;
			t1_d2 <= t0_d2;
			t0_A <= (iD - iD_d16);
			t1_A <= (t0_A + t1_d32);
			iQA <= (t0_d32 + t1_A);
			iQB <= (t0_d2 + t1_d2);
			rQA <= (iQA + x"1");
			rQB <= (iQB + x"1");
		end if;
	end if;
end process;

end a;
