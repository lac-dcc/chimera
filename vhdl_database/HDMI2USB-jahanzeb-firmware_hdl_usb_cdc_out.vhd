-- //////////////////////////////////////////////////////////////////////////////
-- /// Copyright (c) 2013, Jahanzeb Ahmad
-- /// All rights reserved.
-- ///
-- // Redistribution and use in source and binary forms, with or without modification, 
-- /// are permitted provided that the following conditions are met:
-- ///
-- ///  * Redistributions of source code must retain the above copyright notice, 
-- ///    this list of conditions and the following disclaimer.
-- ///  * Redistributions in binary form must reproduce the above copyright notice, 
-- ///    this list of conditions and the following disclaimer in the documentation and/or 
-- ///    other materials provided with the distribution.
-- ///
-- ///    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- ///    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
-- ///    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
-- ///    SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
-- ///    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
-- ///    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
-- ///    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-- ///    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
-- ///    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- ///   POSSIBILITY OF SUCH DAMAGE.
-- ///
-- ///
-- ///  * http://opensource.org/licenses/MIT
-- ///  * http://copyfree.org/licenses/mit/license.txt
-- ///
-- //////////////////////////////////////////////////////////////////////////////

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;		 
USE ieee.std_logic_unsigned.all;

entity cdc_out is
  port 
  (
	-- in signals
	fdata		: in std_logic_vector(7 downto 0);
	flag_empty 	: in std_logic;
	faddr		: in std_logic_vector(1 downto 0);
	cdcout		: in std_logic_vector(1 downto 0);
	
	-- out signals
	slrd		: out std_logic;
	cmd			: out std_logic_vector(7 downto 0);
	cmd_en 		: out std_logic;	
	cdc_out_free: out std_logic;	
  
  	-- ifclk,rst
	rst 		: in std_logic;	
	ifclk 		: in std_logic
  );
end entity cdc_out;


architecture rtl of cdc_out is

type states is (s_wait_for_cdc,s_reset,s_read_data,s_free_cdc,s_skip);
signal ps : states;

begin -- architecture

process(ifclk,rst)
begin
if rst = '1' then
	slrd		<= '1';
	cmd			<= (others => '0');
	cmd_en 		<= '0';
	cdc_out_free <= '1';
	ps 		<= s_reset;

elsif falling_edge(ifclk) then

	slrd		<= '1';
	cmd			<= (others => '0');
	cmd_en 		<= '0';
	

	case ps is
	when s_reset =>
		slrd		<= '1';
		cmd			<= (others => '0');
		cmd_en 		<= '0';
		cdc_out_free <= '1';
		ps 		<= s_wait_for_cdc;

	when s_wait_for_cdc =>
		if  faddr = cdcout then
			ps <= s_read_data;			
			cdc_out_free <= '0';
		end if;
		
	when s_read_data =>
		ps <= s_free_cdc;
		if flag_empty = '1' then -- some data in fifo
			slrd <= '0';
			cmd_en <= '1';
			cmd	<= fdata;			
		end if;	

	when s_free_cdc =>
		ps 		<= s_skip;
		cdc_out_free	<= '1';	

	when s_skip =>		
		ps 		<= s_wait_for_cdc;	
	
	when others =>
		ps <= s_reset;
	end case;	


end if;
end process;

end architecture;


