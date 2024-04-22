--
-- escci.vhd (based on megaram.vhd from MSX OCM project)
--   Mega-ROM emulation, ASC8K/16K/SCC+(8Mbits)
--   Revision 1.00
--
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
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
--  modified by t.hara
--
-- 2016/09		modified by Fabio Belavenuto <belavenuto@gmail.com>
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity escci is
	port(
		clock_i		: in  std_logic;
		clock_en_i	: in  std_logic;
		reset_i		: in  std_logic;
		--
		addr_i		: in  std_logic_vector(15 downto 0);
		data_i		: in  std_logic_vector( 7 downto 0);
		data_o		: out std_logic_vector( 7 downto 0);
		req_i		: in  std_logic;
		cs_n_i		: in  std_logic;
		rd_n_i		: in  std_logic;
		wr_n_i		: in  std_logic;
		--
		ram_addr_o	: out std_logic_vector(19 downto 0);	-- 1MB
		ram_data_i	: in  std_logic_vector( 7 downto 0);
		ram_ce_n_o	: out std_logic;
		ram_oe_n_o	: out std_logic;
		ram_we_n_o	: out std_logic;
		--
		map_type_i	: in  std_logic_vector( 1 downto 0);  -- "-0" : SCC+, "01" : ASC8K, "11" : ASC16K
		--
		wave_o		: out signed(14 downto 0)
    );
end entity;

architecture Behavior of escci is

	signal cs_n_s		: std_logic;
	signal req_wr_n_s	: std_logic;
	signal SccSel_s		: std_logic_vector( 1 downto 0);
	signal Dec1FFE		: std_logic;
	signal DecSccA		: std_logic;
	signal DecSccB		: std_logic;

	--signal cs_n_dly_s	: std_logic;
	signal wav_copy_s	: std_logic;
	signal wav_cs_n_s	: std_logic;
	signal wav_addr_s	: std_logic_vector( 7 downto 0);
	signal WavDbi		: std_logic_vector( 7 downto 0);

	signal SccBank0		: std_logic_vector( 7 downto 0);
	signal SccBank1		: std_logic_vector( 7 downto 0);
	signal SccBank2		: std_logic_vector( 7 downto 0);
	signal SccBank3		: std_logic_vector( 7 downto 0);
	signal SccModeA		: std_logic_vector( 7 downto 0);		-- regs on 7FFE-7FFF
	signal SccModeB		: std_logic_vector( 7 downto 0);		-- regs on BFFE-BFFF

begin

	----------------------------------------------------------------
	-- Connect components
	----------------------------------------------------------------
	SccWave : entity work.scc_wave
	port map(
		clock_i 	=> clock_i,
		clock_en_i  => clock_en_i,
		reset_i		=> reset_i,
		cs_n_i     	=> wav_cs_n_s,
		wr_n_i		=> wr_n_i,
		addr_i		=> wav_addr_s,
		data_i		=> data_i,
		data_o		=> WavDbi,
		wave_o		=> wave_o
	);

	-- One pulse to write
	req_wr_n_s	<= '0'	when cs_n_i = '0' and wr_n_i = '0' and req_i = '1'	else '1';

	----------------------------------------------------------------
	-- SCC access decoder
	----------------------------------------------------------------
	process (reset_i, clock_i)
		variable flag_v : std_logic;
	begin
		if reset_i = '1' then
			flag_v	:= '0';
			wav_copy_s	<= '0';
		elsif rising_edge(clock_i) then
			-- SCC wave memory copy (ch.D > ch.E)
			wav_copy_s <= '0';
			if wav_cs_n_s = '0' and req_i = '1' then
				if wr_n_i = '0' and addr_i(7 downto 5) = "011" and DecSccA = '1' and flag_v = '0' then			-- 9860-987F
					flag_v := '1';
				else
					flag_v := '0';
				end if;
			elsif flag_v = '1' then
				wav_copy_s	<= '1';
				flag_v 		:= '0';
			end if;
		end if;
	end process;

	-- Select only in read ou write cycle
	cs_n_s	<= cs_n_i or (rd_n_i and wr_n_i);

	-- RAM request
	ram_ce_n_o	<= cs_n_s	when SccSel_s = "01"	else '1';
	ram_oe_n_o	<= rd_n_i;
	ram_we_n_o	<= wr_n_i;

	ram_addr_o	<=	SccBank0(6 downto 0) & addr_i(12 downto 0) when addr_i(14 downto 13) = "10" else
					SccBank1(6 downto 0) & addr_i(12 downto 0) when addr_i(14 downto 13) = "11" else
					SccBank2(6 downto 0) & addr_i(12 downto 0) when addr_i(14 downto 13) = "00" else
					SccBank3(6 downto 0) & addr_i(12 downto 0);

	-- Mapped I/O port access on 9800-98FFh / B800-B8FFh ... Wave memory
	wav_cs_n_s	<= '0'	when cs_n_s = '0' and req_i = '1'	and SccSel_s(1) = '1'	else
				   '0'	when wav_copy_s = '1'   			and SccSel_s(1) = '1'	else
				   '1';

	-- exchange B8A0-B8BF <> 9880-989F (wave_ch.E) / B8C0-B8DF <> 98E0-98FF (mode register)
	wav_addr_s 	<= "100" & addr_i(4 downto 0)		when wav_copy_s = '1'						else	-- access B88x (copy wave to ch.E)
					addr_i(7 downto 0) xor X"20"	when addr_i(13) = '0' and addr_i(7)  = '1'	else	-- 988x -> B8Ax and 98Ex -> B8Cx
					addr_i(7 downto 0);

	-- SCC data bus control
	data_o		<= ram_data_i			when SccSel_s = "01"	else
					WavDbi				when SccSel_s = "10"	else
					(others => '1');

	-- SCC address decoder
	SccSel_s  <=
				"10" when	-- memory access (scc_wave)
							addr_i(8) = '0' and SccModeB(4) = '0' and map_type_i(0) = '0' and (DecSccA = '1' or DecSccB = '1')	else	-- map_type = SCC
				"01" when	-- memory access (MEGA-ROM)
							-- 4000-7FFFh(R/-, ASC8K/16K)
							(addr_i(15 downto 14) = "01"  and map_type_i(0) = '1'  and                     rd_n_i = '0') or				-- map_type /= SCC
							-- 8000-BFFFh(R/-, ASC8K/16K)
							(addr_i(15 downto 14) = "10"  and map_type_i(0) = '1'  and                     rd_n_i = '0') or				-- map_type /= SCC
							-- 4000-5FFFh(R/W, ASC8K/16K)
							(addr_i(15 downto 13) = "010" and map_type_i(0) = '1'  and SccBank0(7) = '1'               ) or				-- map_type /= SCC
							-- 8000-9FFFh(R/W, ASC8K/16K)
							(addr_i(15 downto 13) = "100" and map_type_i(0) = '1'  and SccBank2(7) = '1'               ) or				-- map_type /= SCC
							-- A000-BFFFh(R/W, ASC8K/16K)
							(addr_i(15 downto 13) = "101" and map_type_i(0) = '1'  and SccBank3(7) = '1'               ) or				-- map_type /= SCC
							-- 4000-5FFFh(R/-, SCC)
							(addr_i(15 downto 13) = "010" and SccModeA(6) = '0'    and                     rd_n_i = '0') or
							-- 6000-7FFFh(R/-, SCC)
							(addr_i(15 downto 13) = "011" and                                              rd_n_i = '0') or
							-- 8000-9FFFh(R/-, SCC)
							(addr_i(15 downto 13) = "100" and                            DecSccA = '0' and rd_n_i = '0') or
							-- A000-BFFFh(R/-, SCC)
							(addr_i(15 downto 13) = "101" and SccModeA(6) = '0' and      DecSccB = '0' and rd_n_i = '0') or
							-- 4000-5FFFh(R/W) ESCC-RAM
							(addr_i(15 downto 13) = "010" and SccModeA(4) = '1'                                        ) or
							-- 6000-7FFDh(R/W) ESCC-RAM
							(addr_i(15 downto 13) = "011" and SccModeA(4) = '1' and Dec1FFE /= '1'                     ) or
							-- 4000-7FFFh(R/W) SNATCHER
							(addr_i(15 downto 14) = "01"  and SccModeB(4) = '1'                                        ) or
							-- 8000-9FFFh(R/W) SNATCHER
							(addr_i(15 downto 13) = "100" and SccModeB(4) = '1'                                        ) or
							-- A000-BFFDh(R/W) SNATCHER
							(addr_i(15 downto 13) = "101" and SccModeB(4) = '1' and Dec1FFE /= '1'                     )		else
            "00";			-- MEGA-ROM bank register access

	-- Mapped I/O port access on 7FFE-7FFFh / BFFE-BFFFh ... Write protect / SPC mode register
	Dec1FFE <= '1' when addr_i(12 downto 1) = "111111111111" else '0';
	-- Mapped I/O port access on 9800-9FFFh ... Wave memory
	DecSccA <= '1' when addr_i(15 downto 11) = "10011" and SccModeB(5) = '0' and SccBank2(5 downto 0) = "111111" else '0';
	-- Mapped I/O port access on B800-BFFFh ... Wave memory
	DecSccB <= '1' when addr_i(15 downto 11) = "10111" and SccModeB(5) = '1' and SccBank3(7) = '1' else '0';

	----------------------------------------------------------------
	-- SCC bank register
	----------------------------------------------------------------
	process( reset_i, clock_i )
	begin
		if reset_i = '1' then
			SccBank0    <= X"00";
			SccBank1    <= X"01";
			SccBank2    <= X"02";
			SccBank3    <= X"03";
			SccModeA    <= (others => '0');
			SccModeB    <= (others => '0');
		elsif rising_edge(clock_i) then

			if map_type_i(0) = '0' then												-- map_type = SCC

				-- Mapped I/O port access on 5000-57FFh ... Bank register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 11) = "01010" and SccModeA(6) = '0' and SccModeA(4) = '0' and SccModeB(4) = '0' then
					SccBank0 <= data_i;
				end if;
				-- Mapped I/O port access on 7000-77FFh ... Bank register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 11) = "01110" and SccModeA(6) = '0' and SccModeA(4) = '0' and SccModeB(4) = '0' then
					SccBank1 <= data_i;
				end if;
				-- Mapped I/O port access on 9000-97FFh ... Bank register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 11) = "10010" and SccModeB(4) = '0' then
					SccBank2 <= data_i;
				end if;
				-- Mapped I/O port access on B000-B7FFh ... Bank register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 11) = "10110" and SccModeA(6) = '0' and SccModeA(4) = '0' and SccModeB(4) = '0' then
					SccBank3 <= data_i;
				end if;
				-- Mapped I/O port access on 7FFE-7FFFh ... Register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 13) = "011"                   and Dec1FFE = '1' and SccModeB(5 downto 4) = "00" then
					SccModeA <= data_i;
				end if;
				-- Mapped I/O port access on BFFE-BFFFh ... Register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 13) = "101"  and Dec1FFE = '1' and SccModeA(6) = '0' and SccModeA(4) = '0' then
					SccModeB <= data_i;
				end if;
			else																	-- map_type /= SCC
				-- Mapped I/O port access on 6000-6FFFh ... Bank register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 12) = "0110" then
					-- ASC8K / 6000-67FFh
					if    map_type_i(1) = '0' and addr_i(11) = '0' then				-- map_type = ASCII8
						SccBank0 <= data_i;
					-- ASC8K / 6800-6FFFh
					elsif map_type_i(1) = '0' and addr_i(11) = '1' then				-- map_type = ASCII8
						SccBank1 <= data_i;
					-- ASC16K / 6000-67FFh
					elsif addr_i(11) = '0' then										-- map_type = ASCII16
						SccBank0 <= data_i(7) & data_i(5 downto 0) & '0';
						SccBank1 <= data_i(7) & data_i(5 downto 0) & '1';
					end if;
				end if;

				-- Mapped I/O port access on 7000-7FFFh ... Bank register write
				if req_wr_n_s = '0' and SccSel_s = "00" and addr_i(15 downto 12) = "0111" then
					-- ASC8K / 7000-77FFh
					if    map_type_i(1) = '0' and addr_i(11) = '0' then				-- map_type = ASCII8
						SccBank2 <= data_i;
					-- ASC8K / 7800-7FFFh
					elsif map_type_i(1) = '0' and addr_i(11) = '1' then				-- map_type = ASCII8
						SccBank3 <= data_i;
					-- ASC16K / 7000-77FFh
					elsif addr_i(11) = '0' then										-- map_type = ASCII16
						SccBank2 <= data_i(7) & data_i(5 downto 0) & '0';
						SccBank3 <= data_i(7) & data_i(5 downto 0) & '1';
					end if;
				end if;

			end if;
		end if;
	end process;

end architecture;
