--
-- FeedbackMemory.vhd
--
-- Copyright (c) 2006 Mitsutaka Okazaki (brezza@pokipoki.org)
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.vm2413.all;

--
-- This module represents a store for feedback data of all OPLL channels. The feedback
-- data is written by the OutputGenerator module. Then the value written is
-- read from the Operator module.
--
entity FeedbackMemory is
	port (
		clk    : in std_logic;
		reset  : in std_logic;
		wr     : in std_logic;
		waddr  : in integer range 0 to 9-1;
		wdata  : in SIGNED_LI_TYPE;
		raddr  : in integer range 0 to 9-1;
		rdata  : out SIGNED_LI_TYPE
	);
end entity;

architecture RTL of FeedbackMemory is

	type SIGNED_LI_ARRAY_TYPE is array (0 to 9-1) of SIGNED_LI_VECTOR_TYPE;
	signal data_array : SIGNED_LI_ARRAY_TYPE;
	signal init_ch : integer range 0 to 9;
	signal mem_addr_s	: integer range 0 to 9-1;
	signal mem_data_s	: SIGNED_LI_VECTOR_TYPE;
	signal mem_wr_s		: std_logic;
	attribute ram_style        : string;
	attribute ram_style of data_array : signal is "block";

begin

	mem_addr_s	<= init_ch			when init_ch /= 9	else waddr;
	mem_data_s	<= (others=>'0')	when init_ch /= 9	else CONV_SIGNED_LI_VECTOR(wdata);
	mem_wr_s		<= '1'				when init_ch /= 9	else wr;

	process(clk, reset)
	begin
		if reset = '1' then
			init_ch <= 0;
		elsif clk'event and clk='1' then
			if mem_wr_s='1' then
				data_array(mem_addr_s) <= mem_data_s;
			end if;
			rdata <= CONV_SIGNED_LI(data_array(raddr));
			if init_ch /= 9 then
				init_ch <= init_ch + 1;
			end if;
		end if;
	end process;

end architecture;