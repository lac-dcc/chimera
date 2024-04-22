------------------------------------------------------------------------------
-- FILE NAME            : latch.vhd
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
--	 This component is simply a latch.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity latch is
port(
	clk     : in  std_logic;
	rst     : in  std_logic;
	sig     : in  std_logic;
	latched : out std_logic);
end latch;

architecture latch_arch of latch is
    
	signal latched_i : std_logic := '0';
  
begin
	
	latched <= latched_i;
	
    process (clk)
    begin
        if rising_edge(clk) then
			if (rst = '1') then
				latched_i <= '0';
			else
				if (sig = '1') then
					latched_i <= '1';
				end if;
			end if;
        end if;
    end process;
	
end latch_arch;