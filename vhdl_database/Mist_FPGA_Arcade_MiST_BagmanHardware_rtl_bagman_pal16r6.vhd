---------------------------------------------------------------------------------
-- bagman_pal16r6 - Dar - Feb 2014
---------------------------------------------------------------------------------
-- Pal contents comes from MAME src/machine/bagman.c fusemap.

-- MAME show a complete pal16r6 simulation from fusemap. In a different way I use 
-- the fusemap to read and recreate the logical equations
--
-- pin 19 : o0 = !(!qO.q1.!q2.q3.!q4.!q5)
-- pin 18 : d0 = o0.(!q0)
-- pin 17 : d1 = o0.(!q1.!q0 + q1.q0)
-- pin 16 : d2 = o0.(!q2 (!q0.!q1) + q2.(q0+q1) )
-- pin 15 : d3 = o0.(!q3.(!q0.!q1.!q2) + q3(q0+q1+q2))
-- pin 14 : d4 = o0.(!q4.(!q0.!q1.!q2.!q3) + q4(q0+q1+q2+q3))
-- pin 13 : d5 = o0.(!q5.(!q0.!q1.!q2.!q3.!q4) + q5(q0+q1+q2+q3+q4))
-- pin 12 : o1 = !i7

-- Externaly pin 12 (o1) and pin 9 (i7) are connected to through a RC network which
-- creates an oscillator. Pin 1 (clk) is also connected to pin 12 so that the pal
-- receives a clock signal. The clock frequency depend only in RC values and pal
-- technology. 

-- Pin 2 (i0) to pin 8 (i6) are connected to the cpu address 0 to 6. But are not 
-- used by the logical equations. So their values are ignored.

-- Looking more precisely to the equations we get :
--
-- dn = o0.(!qn.sn + qn.!sn)
-- with sn = !q(n-1).s(n-1)
-- and sO = 1
--
-- Ones can identify some kind of adder/counter with a reset control (o0).
-- After simulating it comes that it is a 6 bits count down counter which is
-- resetted when reaching 10 (o0= "001010") : 63, 62, ..., 11, 10, 0, 63, ...

-- What is it used for ? Cpu can read the d(5..0) value when addressing the pal
-- (!rd4). If constant value is send back to the cpu it can be seen that guards
-- seems to go straight forward to an end of corridor and then disappears. 
-- Cpu seems to wait for a new value to give guards a new destination. With its
-- free RC oscillator it acts like a random generator to randomize guards 
-- pathways. I choose to use vsync for the clock so that the random number depend
-- on when the cricuit has been started while cpu read depend on the game play 
-- (player activity, at least start player 1 ).
--
-- Clock scheme within MAME seems to be missing. Updates may produce a changing 
-- value.
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity bagman_pal16r6 is
port(
	clk  : in std_logic;
	addr : in std_logic_vector(6 downto 0);
	data : out std_logic_vector(5 downto 0)
);
end bagman_pal16r6;

architecture struct of bagman_pal16r6 is

signal count : integer range 0 to 63 := 47; -- no matter

begin

data <= std_logic_vector(to_unsigned(count,6));

process(clk)
begin
	if rising_edge(clk) then
		if (count = 10) then
			count <= 0;
		elsif (count = 0) then
			count <= 63;
		else
			count <= count - 1;
		end if;
	end if;
end process;

end architecture;