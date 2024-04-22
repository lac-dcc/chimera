-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2016, Fabio Belavenuto (belavenuto@gmail.com)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pio is
	port (
		reset_i			: in  std_logic;
		clock_master_i	: in  std_logic;
		ipl_en_i		: in  std_logic;
		addr_i			: in  std_logic_vector(1 downto 0);
		data_i			: in  std_logic_vector(7 downto 0);
		data_o			: out std_logic_vector(7 downto 0);
		req_i			: in  std_logic;
		cs_n_i			: in  std_logic;
		rd_n_i			: in  std_logic;
		wr_n_i			: in  std_logic;
		port_a_o		: out std_logic_vector(7 downto 0);
		port_b_i		: in  std_logic_vector(7 downto 0);
		port_c_o		: out std_logic_vector(7 downto 0)
	);
end entity;

architecture Behavior of PIO is

	signal port_a_r		: std_logic_vector(7 downto 0);
	signal port_c_r		: std_logic_vector(7 downto 0);

begin

	-- Read request
	data_o	<= port_a_r			when cs_n_i = '0' and rd_n_i = '0' and addr_i = "00"	else
			   port_b_i			when cs_n_i = '0' and rd_n_i = '0' and addr_i = "01"	else
			   port_c_r			when cs_n_i = '0' and rd_n_i = '0' and addr_i = "10"	else
			   (others => '0');

	-- Write request
	process(reset_i, ipl_en_i, clock_master_i)
		variable port_c_addr_v	: integer range 0 to 7;
	begin
		if reset_i = '1' then
			port_a_r	<= (others => ipl_en_i);		-- If IPL enabled, configure all frames to slot 3
			port_c_r	<= (7 => '0', others => '1');	-- MSB=0: beep silent
		elsif rising_edge(clock_master_i) then
			if req_i = '1' and cs_n_i = '0' and wr_n_i = '0' then
				if addr_i = "00" then
					port_a_r <= data_i;
				elsif addr_i = "10" then
					port_c_r <= data_i;
				elsif addr_i = "11" and data_i(7) = '0' then
					port_c_addr_v := to_integer(unsigned(data_i(3 downto 1)));
					port_c_r(port_c_addr_v) <= data_i(0);
				end if;
			end if;
		end if;
	end process;

	-- I/O
	port_a_o <= port_a_r;
	port_c_o <= port_c_r;

end;