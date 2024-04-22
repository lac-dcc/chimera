------------------------------------------------------------------------------
-- FILE NAME            : tff.vhd
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
--	 This TFF component allows signals to cross clock domains safely.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tff is
port(
	clk    : in  std_logic;
	async  : in  std_logic;
	synced : out std_logic);
end tff;

architecture tff_arch of tff is

	signal reg_z    : std_logic := '0';                
	signal reg_z2   : std_logic := '0';                
	signal reg_z3   : std_logic := '0';  

	attribute ASYNC_REG : string;
	attribute ASYNC_REG of reg_z  : signal is "TRUE";        
	attribute ASYNC_REG of reg_z2 : signal is "TRUE";
	attribute ASYNC_REG of reg_z3 : signal is "TRUE";

	signal synced_i : std_logic := '0';  
  
begin	

	process (clk)
	begin
		if rising_edge(clk) then
			synced_i <= reg_z3;
			reg_z3   <= reg_z2;
			reg_z2   <= reg_z;
			reg_z    <= async;
		end if;
	end process;
	
	synced <= synced_i;
end tff_arch;