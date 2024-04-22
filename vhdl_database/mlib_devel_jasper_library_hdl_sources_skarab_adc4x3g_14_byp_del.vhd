------------------------------------------------------------------------------
-- FILE NAME            : del.vhd
------------------------------------------------------------------------------
-- COMPANY              : PERALEX ELECTRONICS (PTY) LTD
------------------------------------------------------------------------------
-- COPYRIGHT NOTICE :
--
-- The copyright, manufacturing and patent rights stemming from this document
-- in any form are vested in PERALEX ELECTRONICS (PTY) LTD.
--
-- (c) PERALEX ELECTRONICS (PTY) LTD 2021
--
-- PERALEX ELECTRONICS (PTY) LTD has ceded these rights to its clients
-- where contractually agreed.
------------------------------------------------------------------------------
-- DESCRIPTION :
--	 This component delays a signal for one clock cycle
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity del is
port(
	clk         : in  std_logic;
	input_sig   : in  std_logic;
	delayed_sig : out std_logic);
end del;

architecture del_arch of del is
	signal delayed_sig_i : std_logic := '0';  
begin	

	process (clk)
	begin
		if rising_edge(clk) then
			delayed_sig_i <= input_sig;
		end if;
	end process;
	
	delayed_sig <= delayed_sig_i;
end del_arch;