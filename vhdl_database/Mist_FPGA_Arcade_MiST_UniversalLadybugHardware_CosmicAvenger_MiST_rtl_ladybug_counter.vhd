-------------------------------------------------------------------------------
--
-- Synchronous 8-Bit Binary Counter with preset.
--
-- $Id: ladybug_counter.vhd,v 1.9 2005/10/10 21:59:13 arnim Exp $
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2005, Arnim Laeuger (arnim.laeuger@gmx.net)
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

entity counter is
port (
	ck_i      : in  std_logic;
	ck_en_i   : in  std_logic;
	reset_n_i : in  std_logic;
	load_i    : in  std_logic;
	preset_i  : in  std_logic_vector(7 downto 0);
	q_o       : out std_logic_vector(7 downto 0);
	rise_q_o  : out std_logic_vector(7 downto 0);
	d_o       : out std_logic_vector(7 downto 0);
	co_o      : out std_logic
);
end counter;

architecture rtl of counter is
	signal cnt_q : std_logic_vector(7 downto 0);
	signal cnt_s : std_logic_vector(7 downto 0);
begin

	seq: process (ck_i, reset_n_i)
	begin
		if reset_n_i = '0' then
			cnt_q <= (others => '0');
		elsif rising_edge(ck_i) then
			cnt_q <= cnt_s;
		end if;
	end process seq;

	adder: process (ck_en_i, cnt_q, load_i, preset_i)
	begin
		cnt_s <= cnt_q;

		if ck_en_i = '1' then
			if load_i = '1' then
				cnt_s <= preset_i;
			else
				cnt_s <= cnt_q + 1;
			end if;
		end if;
	end process adder;

	co_o     <= '1' when cnt_q = x"FF" else '0';
	rise_q_o <= cnt_s and not cnt_q;
	q_o      <= cnt_q;
	d_o      <= cnt_s;
end rtl;
