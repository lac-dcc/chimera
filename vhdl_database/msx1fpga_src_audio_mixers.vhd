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
use work.msx_pack.all;

entity mixers is
	port (
		clock_audio_i	: in  std_logic;
		volumes_i		: in  volumes_t;
		beep_i			: in  std_logic					:= '0';
		ear_i			: in  std_logic					:= '0';
		audio_scc_i		: in  signed(14 downto 0)		:= (others => '0');
		audio_psg_i		: in  unsigned(7 downto 0)		:= (others => '0');
		jt51_left_i		: in  signed(15 downto 0)		:= (others => '0');
		jt51_right_i	: in  signed(15 downto 0)		:= (others => '0');
		opll_mo_i		: in  signed(12 downto 0)		:= (others => '0');
		opll_ro_i		: in  signed(12 downto 0)		:= (others => '0');
		audio_mix_l_o	: out signed(15 downto 0);
		audio_mix_r_o	: out signed(15 downto 0)
	);
end mixers;

-- 32767  0111111111111111
--
-- 16384  0100000000000000
--
-- 1      0000000000000001
-- 0      0000000000000000
-- -1     1111111111111111
--
-- -16384 1100000000000000
--
-- -32767 1000000000000001
-- -32768 1000000000000000

architecture Behavioral of mixers is

	constant beep_con_c	: signed(15 downto 0) := to_signed(16383, 16);
	constant ear_con_c	: signed(15 downto 0) := to_signed(16383, 16);

	signal pcm_l_s			: signed(15 downto 0);
	signal pcm_r_s			: signed(15 downto 0);
	signal beep_con_s		: signed(15 downto 0);
	signal ear_con_s		: signed(15 downto 0);

	signal opll_sum_s		: signed(12 downto 0);

	signal beep_sig_s		: signed(16 + volumes_i.beep'length downto 0);
	signal ear_sig_s		: signed(16 + volumes_i.ear'length downto 0);
	signal psg_sig_s		: signed(16 + volumes_i.psg'length downto 0);
	signal scc_sig_s		: signed(16 + volumes_i.scc'length downto 0);
	signal opll_sig_s		: signed(16 + volumes_i.opll'length downto 0);
	signal jt51_l_sig_s		: signed(16 + volumes_i.aux1'length downto 0);
	signal jt51_r_sig_s		: signed(16 + volumes_i.aux1'length downto 0);

begin

	mixer: process (clock_audio_i)
	begin
		if rising_edge(clock_audio_i) then
			beep_con_s	<= (others => '0');
			ear_con_s	<= (others => '0');
			if beep_i = '1' then
				beep_con_s	<= beep_con_c;
			end if;
			if ear_i = '1' then
				ear_con_s	<= ear_con_c;
			end if;
			opll_sum_s		<= opll_mo_i + opll_ro_i;

			beep_sig_s		<= beep_con_s										* ('0' & signed(volumes_i.beep));
			ear_sig_s		<= ear_con_s										* ('0' & signed(volumes_i.ear));
			psg_sig_s		<= ("00" & signed(audio_psg_i) & "000000")			* ('0' & signed(volumes_i.psg));
			scc_sig_s		<= (audio_scc_i & '0')								* ('0' & signed(volumes_i.scc));
			opll_sig_s		<= (opll_sum_s & "000")								* ('0' & signed(volumes_i.opll));
			jt51_l_sig_s	<= jt51_left_i										* ('0' & signed(volumes_i.aux1));
			jt51_r_sig_s	<= jt51_right_i										* ('0' & signed(volumes_i.aux1));

			pcm_l_s 	<= 	beep_sig_s(beep_sig_s'high     downto beep_sig_s'high-15) + 
							ear_sig_s(ear_sig_s'high       downto ear_sig_s'high-15) + 
							psg_sig_s(psg_sig_s'high       downto psg_sig_s'high-15) + 
							scc_sig_s(scc_sig_s'high       downto scc_sig_s'high-15) + 
							opll_sig_s(opll_sig_s'high     downto opll_sig_s'high-15) +
							jt51_l_sig_s(jt51_l_sig_s'high downto jt51_l_sig_s'high-15);
			--
			pcm_r_s 	<= 	beep_sig_s(beep_sig_s'high     downto beep_sig_s'high-15) + 
							ear_sig_s(ear_sig_s'high       downto ear_sig_s'high-15) + 
							psg_sig_s(psg_sig_s'high       downto psg_sig_s'high-15) + 
							scc_sig_s(scc_sig_s'high       downto scc_sig_s'high-15) + 
							opll_sig_s(opll_sig_s'high     downto opll_sig_s'high-15) +
							jt51_r_sig_s(jt51_r_sig_s'high downto jt51_r_sig_s'high-15);
		end if;
	end process;

	audio_mix_l_o <= pcm_l_s;
	audio_mix_r_o <= pcm_r_s;

end Behavioral;
