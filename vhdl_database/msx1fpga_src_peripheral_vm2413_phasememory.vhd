--
-- PhaseMemory.vhd
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

entity PhaseMemory is
	port (
		clk     : in std_logic;
		reset   : in std_logic;
		slot    : in std_logic_vector( 4 downto 0 );
		memwr   : in std_logic;
		memout  : out std_logic_vector (17 downto 0);
		memin   : in  std_logic_vector (17 downto 0)
	);
end PhaseMemory;

architecture RTL of PhaseMemory is

	type PHASE_ARRAY_TYPE is array (0 to 18-1) of std_logic_vector (17 downto 0);
	signal phase_array : PHASE_ARRAY_TYPE;
	signal init_slot : integer range 0 to 18;
	signal mem_wr_s	: std_logic;
	signal mem_addr_s	: integer;
	signal mem_data_s	: std_logic_vector (17 downto 0);
	attribute ram_style		: string;
	attribute ram_style of phase_array : signal is "block";

begin

	mem_wr_s		<= '1'					when init_slot /= 18 else memwr;
	mem_addr_s	<= init_slot			when init_slot /= 18 else conv_integer(slot);
	mem_data_s	<= (others => '0')	when init_slot /= 18 else memin;

	process (clk, reset)
	begin
		if reset = '1' then
			init_slot <= 0;
		elsif rising_edge(clk) then
			if mem_wr_s = '1' then
				phase_array(mem_addr_s) <= mem_data_s;
			end if;
			memout <= phase_array(conv_integer(slot));
			if init_slot /= 18 then
				init_slot <= init_slot + 1;
			end if;
		end if;
	end process;

end RTL;