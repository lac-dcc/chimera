---------------------------------------------------------------------
--	Filename:	gh_filter_compensation_4dB.vhd
--
--	Description:
--		a 3rd order FIR compensation Filter - 
--		   with coefficients of [-.09375 .8125 -.09375]
--		   has gain of -4 dB (at DC) to +0 dB (at .5 sample rate)
--		   uses shift and add (uses no multipliers)
--
--	Copyright (c) 2007 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author   	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	10/14/07  	h LeFevre	Initial revision
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_signed.all;

entity gh_filter_compensation_4dB is
	GENERIC (size: INTEGER :=16);
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		ce  : in STD_LOGIC:='1';
		D   : in STD_LOGIC_VECTOR(size-1 downto 0);
		Q   : out STD_LOGIC_VECTOR(size-1 downto 0)
		);
end entity;

architecture a of gh_filter_compensation_4dB is

	signal iD     : STD_LOGIC_VECTOR(size downto 0);
	signal iD_d8  : STD_LOGIC_VECTOR(size downto 0);
	signal iD_d16 : STD_LOGIC_VECTOR(size downto 0);
	signal iD_d32 : STD_LOGIC_VECTOR(size downto 0);
	signal t0_A   : STD_LOGIC_VECTOR(size downto 0);
	signal t0_B   : STD_LOGIC_VECTOR(size downto 0); 
	signal t1_B   : STD_LOGIC_VECTOR(size downto 0);
	signal iQ     : STD_LOGIC_VECTOR(size downto 0);
	
begin
	
	Q <= iQ(size downto 1);
	
process (clk,rst)
begin
	if (rst = '1')	then
		iD <= D & '0';
		iD_d8 <= (others => '0');
		iD_d16 <= (others => '0');
		iD_d32 <= (others => '0');
		t0_A <= (others => '0');
		t0_B <= (others => '0');
		t1_B <= (others => '0');
		iQ <=  (others => '0');
	elsif (rising_edge(CLK)) then
		if (ce = '1') then
			iD  <= D & '0' - t0_A;
			iD_d8 <= D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 2);
			iD_d16 <= D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 3);
			iD_d32 <= D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 4);
			t0_A <= (D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 3))
			      + (D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 4));
			t0_B <= (D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 2))
			      + (D(size-1) & D(size-1) & D(size-1) & D(size-1) & D(size-1 downto 3));
			t1_B <= iD - t0_B;
			iQ <= t1_B - t0_A;
		end if;
	end if;
end process;

end a;
