-- Space Invaders core logic
-- 9.984MHz clock
--
-- Version : 0242
--
-- Copyright (c) 2002 Daniel Wallner (jesus@opencores.org)
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
-- The latest version of this file can be found at:
--      http://www.fpgaarcade.com
--
-- Limitations :
--
-- File history :
--
--      0241 : First release
--
--      0242 : Cleaned up reset logic
--
--      0300 : MikeJ tidyup for audio release

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity invaders is
	port(
		Rst_n           : in  std_logic;
		Clk             : in  std_logic;
		ENA             : out  std_logic;
		Coin            : in  std_logic;
		Sel1Player      : in  std_logic;
		Sel2Player      : in  std_logic;
		Fire            : in  std_logic;
		Paddle          : in  std_logic_vector(7 downto 0);
		DIP             : in  std_logic_vector(8 downto 1);
		RDB             : in  std_logic_vector(7 downto 0);
		IB              : in  std_logic_vector(7 downto 0);
		RWD             : out std_logic_vector(7 downto 0);
		RAB             : out std_logic_vector(12 downto 0);
		AD              : out std_logic_vector(15 downto 0);
		SoundCtrl3      : out std_logic_vector(5 downto 0);
		SoundCtrl4      : out std_logic_vector(5 downto 0);
		SoundCtrl5      : out std_logic_vector(5 downto 0);
		SoundCtrl6      : out std_logic_vector(5 downto 0);
		Rst_n_s         : out std_logic;
		RWE_n           : out std_logic;
		Video           : out std_logic;
		HSync           : out std_logic;
		VSync           : out std_logic
		);
end invaders;

architecture rtl of invaders is

	component mw8080
	port(
		Rst_n           : in  std_logic;
		Clk             : in  std_logic;
		ENA             : out  std_logic;
		RWE_n           : out std_logic;
		RDB             : in  std_logic_vector(7 downto 0);
		RAB             : out std_logic_vector(12 downto 0);
		Sounds          : out std_logic_vector(7 downto 0);
		Ready           : out std_logic;
		GDB             : in  std_logic_vector(7 downto 0);
		IB              : in  std_logic_vector(7 downto 0);
		DB              : out std_logic_vector(7 downto 0);
		AD              : out std_logic_vector(15 downto 0);
		Status          : out std_logic_vector(7 downto 0);
		Systb           : out std_logic;
		Int             : out std_logic;
		Hold_n          : in  std_logic;
		IntE            : out std_logic;
		DBin_n          : out std_logic;
		Vait            : out std_logic;
		HldA            : out std_logic;
		Sample          : out std_logic;
		Wr              : out std_logic;
		Video           : out std_logic;
		HSync           : out std_logic;
		VSync           : out std_logic);
	end component;

	signal GDB0         : std_logic_vector(7 downto 0);
	signal GDB1         : std_logic_vector(7 downto 0);
	signal GDB2         : std_logic_vector(7 downto 0);
	signal S            : std_logic_vector(7 downto 0);
	signal GDB          : std_logic_vector(7 downto 0);
	signal DB           : std_logic_vector(7 downto 0);
	signal Sounds       : std_logic_vector(7 downto 0);
	signal AD_i         : std_logic_vector(15 downto 0);
	signal PortWr       : std_logic_vector(7 downto 1);
	signal EA           : std_logic_vector(2 downto 0);
	signal D5           : std_logic_vector(15 downto 0);
	signal WD_Cnt       : unsigned(7 downto 0);
	signal Sample       : std_logic;
	signal Rst_n_s_i    : std_logic;
begin

	Rst_n_s <= Rst_n_s_i;
	RWD <= DB;
	AD <= AD_i;

	process (Rst_n, Clk)
		variable Rst_n_r : std_logic;
	begin
		if Rst_n = '0' then
			Rst_n_r := '0';
			Rst_n_s_i <= '0';
		elsif Clk'event and Clk = '1' then
			Rst_n_s_i <= Rst_n_r;
			if WD_Cnt = 255 then
				Rst_n_s_i <= '0';
			end if;
			Rst_n_r := '1';
		end if;
	end process;

	process (Rst_n_s_i, Clk)
		variable Old_S0 : std_logic;
	begin
		if Rst_n_s_i = '0' then
			WD_Cnt <= (others => '0');
			Old_S0 := '1';
		elsif Clk'event and Clk = '1' then
			if Sounds(0) = '1' and Old_S0 = '0' then
				WD_Cnt <= WD_Cnt + 1;
			end if;
			if PortWr(6) = '1' then
				WD_Cnt <= (others => '0');
			end if;
			Old_S0 := Sounds(0);
		end if;
	end process;

	u_mw8080: mw8080
		port map(
			Rst_n => Rst_n,--Rst_n_s_i,
			Clk => Clk,
			ENA => ENA,
			RWE_n => RWE_n,
			RDB => RDB,
			IB => IB,
			RAB => RAB,
			Sounds => Sounds,
			Ready => open,
			GDB => GDB,
			DB => DB,
			AD => AD_i,
			Status => open,
			Systb => open,
			Int => open,
			Hold_n => '1',
			IntE => open,
			DBin_n => open,
			Vait => open,
			HldA => open,
			Sample => Sample,
			Wr => open,
			Video => Video,
			HSync => HSync,
			VSync => VSync);

	with AD_i(9 downto 8) select
		GDB <= GDB0 when "00",
				GDB1 when "01",
				GDB2 when "10",
				S when others;

	GDB0 <= Paddle;

	GDB1(0) <= '1';-- Unused ?
	GDB1(1) <= '1';-- Unused ?
	GDB1(2) <= '1';-- Unused ?
	GDB1(3) <= '1';-- Unused ?
	GDB1(4) <= not Sel2Player;
	GDB1(5) <= not Sel1Player;
	GDB1(6) <= not Coin;
	GDB1(7) <= '1';-- Unused ?

	GDB2(0) <= '0';--Game_Time
	GDB2(1) <= '0';--Game_Time
	GDB2(2) <= '0';--Coinage
	GDB2(3) <= '0';--Coinage
	GDB2(4) <= '0';--Extended Time At
	GDB2(5) <= '0';--Extended Time At
	GDB2(6) <= '0';--Springboard Alignment
	GDB2(7) <= '0';--unused

	PortWr(1) <= '1' when AD_i(10 downto 8) = "001" and Sample = '1' else '0';
	PortWr(2) <= '1' when AD_i(10 downto 8) = "010" and Sample = '1' else '0';
	PortWr(3) <= '1' when AD_i(10 downto 8) = "011" and Sample = '1' else '0';
	PortWr(4) <= '1' when AD_i(10 downto 8) = "100" and Sample = '1' else '0';
	PortWr(5) <= '1' when AD_i(10 downto 8) = "101" and Sample = '1' else '0';
	PortWr(6) <= '1' when AD_i(10 downto 8) = "110" and Sample = '1' else '0';
	PortWr(7) <= '1' when AD_i(10 downto 8) = "111" and Sample = '1' else '0';

	process (Rst_n_s_i, Clk)
		variable OldSample : std_logic;
	begin
		if Rst_n_s_i = '0' then
			D5 <= (others => '0');
			EA <= (others => '0');
			SoundCtrl3 <= (others => '0');
			SoundCtrl4 <= (others => '0');
			SoundCtrl5 <= (others => '0');
			SoundCtrl6 <= (others => '0');
			OldSample := '0';
		elsif Clk'event and Clk = '1' then
			if PortWr(1) = '1' then
				EA <= DB(2 downto 0);
			end if;
			if PortWr(3) = '1' then
				SoundCtrl3 <= DB(5 downto 0);--audio_1_w
			end if;
			if PortWr(2) = '1' and OldSample = '0' then
				D5(15 downto 8) <= DB;
				D5(7 downto 0) <= D5(15 downto 8);
			end if;
			if PortWr(5) = '1' then
				SoundCtrl5 <= DB(5 downto 0);--tone_generator_lo_w
			end if;
			if PortWr(6) = '1' then
				SoundCtrl6 <= DB(5 downto 0);--midway_tone_generator_hi_w
			end if;	
			if PortWr(7) = '1' then
				SoundCtrl4 <= DB(5 downto 0);--audio_2_w
			end if;
			OldSample := Sample;
		end if;
	end process;

	with EA select
		S <= D5(15 downto 8) when "000",
			 D5(14 downto 7) when "001",
			 D5(13 downto 6) when "010",
			 D5(12 downto 5) when "011",
			 D5(11 downto 4) when "100",
			 D5(10 downto 3) when "101",
			 D5( 9 downto 2) when "110",
			 D5( 8 downto 1) when others;

end;
