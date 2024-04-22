--
-- OutputMemory.vhd
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

entity OutputMemory is
	port (
		clk    : in std_logic;
		reset  : in std_logic;
		wr     : in std_logic;
		addr   : in std_logic_vector( 4 downto 0 );
		wdata  : in SIGNED_LI_TYPE;
		rdata  : out SIGNED_LI_TYPE;
		addr2  : in std_logic_vector( 4 downto 0 );
		rdata2 : out SIGNED_LI_TYPE
	);
end entity;

architecture RTL of OutputMemory is

	type SIGNED_LI_ARRAY_TYPE is array (0 to 18) of SIGNED_LI_VECTOR_TYPE;
	signal data_array : SIGNED_LI_ARRAY_TYPE;
	signal init_ch : integer range 0 to 18;
	signal mem_wr_s					: std_logic;
	signal mem_addr_s					: integer;
	signal mem_data_s					: SIGNED_LI_VECTOR_TYPE;
	attribute ram_style				: string;
	attribute ram_style of data_array : signal is "block";

begin

	mem_wr_s		<= '1'					when init_ch /= 18 else wr;
	mem_addr_s	<= init_ch				when init_ch /= 18 else conv_integer(addr);
	mem_data_s	<= (others => '0')	when init_ch /= 18 else CONV_SIGNED_LI_VECTOR(wdata);

	process(clk, reset)
	begin
		if (reset = '1') then
			init_ch <= 0;
		elsif clk'event and clk='1' then
			if mem_wr_s = '1' then
				data_array(mem_addr_s) <= mem_data_s;
			end if;
			rdata <= CONV_SIGNED_LI(data_array(conv_integer(addr)));
			rdata2 <= CONV_SIGNED_LI(data_array(conv_integer(addr2)));
			if init_ch /= 18 then
				init_ch <= init_ch + 1;
			end if;
		end if;
	end process;

end architecture;