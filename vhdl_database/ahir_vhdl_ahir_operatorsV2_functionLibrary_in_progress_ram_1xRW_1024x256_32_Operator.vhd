------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library ahir;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;


entity ram_1xRW_1024x256_32_Operator is
	port (clk, reset: in std_logic;
		addr: in std_logic_vector(9 downto 0);
		din:  in std_logic_vector(255 downto 0);
		tagin: in std_logic_vector(31 downto 0);
		byte_mask: in std_logic_vector(31 downto 0);
		init_flag, wr_bar: in std_logic_vector(0 downto 0);
		dout: out std_logic_vector(255 downto 0);
		tagout: out std_logic_vector(31 downto 0);
		sample_req, update_req: in Boolean;
		sample_ack, update_ack: out Boolean;
		);
end entity;

architecture Struct of ram_1xRW_1024x256_32_Operator is
	signal mem_data_in, mem_data_out: std_logic_vector(287 downto 0);
begin
	mem_data_in <= din & tagin;
	dout <= mem_data_out(287 downto 32);
	tagout <= mem_data_out(31 downto 0);

	mb: genericRAMwithByteEnable_1xRW_Operator 
			generic map (addr_width => 10, data_width => 288)
			port map(din => mem_data_in,
				  dout => mem_data_out,
				    byte_enable =>  byte_enable,
				      init_flag => init_flag, 
		 			wr_bar => wr_bar,
				     	  sample_req => sample-req, sample_ack => sample_ack,
					    update_req => update_req, update_ack => update_ack,
					      clk => clk, reset => reset);
				 
end Behave;
