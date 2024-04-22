--
-- EnvelopeMemory.vhd
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

entity EnvelopeMemory is
	port (
		clk     : in std_logic;
		reset   : in std_logic;
		waddr   : in std_logic_vector( 4 downto 0 );
		wr      : in std_logic;
		wdata   : in EGDATA_TYPE;
		raddr   : in std_logic_vector( 4 downto 0 );
		rdata   : out EGDATA_TYPE
	);
end entity;

architecture RTL of EnvelopeMemory is

	type EGDATA_ARRAY is array (0 to 18-1) of EGDATA_VECTOR_TYPE;
	signal egdata_set : EGDATA_ARRAY;
	signal init_slot : integer range 0 to 18;
	signal mem_wr_s	: std_logic;
	signal mem_addr_s	: integer;
	signal mem_data_s	: EGDATA_VECTOR_TYPE;
	attribute ram_style        : string;
	attribute ram_style of egdata_set : signal is "block";
begin

	mem_wr_s		<= '1'					when init_slot /= 18 else wr;
	mem_addr_s	<= init_slot			when init_slot /= 18 else conv_integer(waddr);
	mem_data_s	<= (others => '1')	when init_slot /= 18 else CONV_EGDATA_VECTOR(wdata);
	
	process (clk, reset)
		
	begin
		if reset = '1' then
			init_slot <= 0;
		elsif rising_edge(clk) then
			if mem_wr_s = '1' then
				egdata_set(mem_addr_s) <= mem_data_s;
			end if;
			rdata <= CONV_EGDATA(egdata_set(conv_integer(raddr)));
			if init_slot /= 18 then
				init_slot <= init_slot + 1;
			end if;
		end if;
	end process;

end architecture;
