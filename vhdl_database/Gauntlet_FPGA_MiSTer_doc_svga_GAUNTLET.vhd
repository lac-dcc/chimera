--	(c) 2020 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

--	From: https://en.wikipedia.org/wiki/Gauntlet_(1985_video_game)
--	Developer:		Atari Games
--	Publishers:		Atari Games, U.S. Gold
--	Designer:		Ed Logg
--	Platform:		Arcade
--	Release:			October 1985
--	Genres:			Hack and slash, dungeon crawl
--	Mode:				Single-player, 4-player multiplayer
--	Cabinet:			Custom upright
--	Arcade system:	Atari Gauntlet
--	CPU:				Motorola 68010 @ 7.15909 MHz, MOS Technology 6502 @ 1.789772 MHz
--	Sound:			Yamaha YM2151 @ 3.579545, Atari POKEY @ 1.789772 MHz, Texas Instruments TMS5220@ 650.826 kHz
--	Display:			Raster, 336x240 resolution

library ieee;
	use ieee.std_logic_1164.all;

entity FPGA_GAUNTLET is
	port(
		-- System Clock
		I_CLK_28M			: in	std_logic;

		-- Active high reset
		I_RESET				: in	std_logic;

		-- Player controls, active low
		I_P1					: in	std_logic_vector(7 downto 0);
		I_P2					: in	std_logic_vector(7 downto 0);
		I_P3					: in	std_logic_vector(7 downto 0);
		I_P4					: in	std_logic_vector(7 downto 0);

		-- System inputs
		I_SYS					: in	std_logic_vector(4 downto 0);
		I_SLAP_TYPE			: in  integer range 0 to 118; -- slapstic type can be changed dynamically

		O_LEDS				: out	std_logic_vector(4 downto 1);

		-- Audio out
		O_AUDIO_L			: out	std_logic_vector(15 downto 0) := (others=>'0');
		O_AUDIO_R			: out	std_logic_vector(15 downto 0) := (others=>'0');

		-- Monitor output
		O_VIDEO_I			: out	std_logic_vector(3 downto 0);
		O_VIDEO_R			: out	std_logic_vector(3 downto 0);
		O_VIDEO_G			: out	std_logic_vector(3 downto 0);
		O_VIDEO_B			: out	std_logic_vector(3 downto 0);
		O_HSYNC				: out	std_logic;
		O_VSYNC				: out	std_logic;
		O_CSYNC				: out	std_logic;
		O_HBLANK				: out	std_logic;
		O_VBLANK				: out	std_logic;

		-- GFX ROMs, read from non existent ROMs MUST return FFFFFFFF
		O_GP_EN				: out	std_logic := '0';
		O_GP_ADDR			: out	std_logic_vector(17 downto 0) := (others=>'0');
		I_GP_DATA			: in 	std_logic_vector(31 downto 0) := (others=>'0');
		-- CHAR ROM
		O_CP_ADDR			: out	std_logic_vector(13 downto 0) := (others=>'0');
		I_CP_DATA			: in 	std_logic_vector( 7 downto 0) := (others=>'0');
		-- Main Program ROMs
		O_MP_EN				: out	std_logic := '0';
		O_MP_ADDR			: out	std_logic_vector(18 downto 0) := (others=>'0');
		I_MP_DATA			: in 	std_logic_vector(15 downto 0) := (others=>'0');
		-- MO control
		O_4R_ADDR			: out	std_logic_vector( 7 downto 0);
		I_4R_DATA			: in 	std_logic_vector( 3 downto 0);
		-- Audio Program ROMs
		O_AP_EN				: out	std_logic := '0';
		O_AP_ADDR			: out	std_logic_vector(15 downto 0) := (others=>'0');
		I_AP_DATA			: in 	std_logic_vector( 7 downto 0) := (others=>'0')
	);
end FPGA_GAUNTLET;

architecture RTL of FPGA_GAUNTLET is
	signal
		sl_1H,
		sl_2H,
		sl_32V,
		sl_R_Wn,
		sl_LDSn,
		sl_UDSn,
		sl_VCPU,
		sl_SNDNMIn,
		sl_SNDINTn,
		sl_SNDRESn,
		sl_CRAMn,
		sl_VBUSn,
		sl_VRAMn,
		sl_MBUSn,
		sl_VRDTACK,
		sl_VBLANKn,
		sl_HBLANKn,
		sl_VBKACKn,
		sl_VBKINTn,
		sl_HSCRLDn
								: std_logic := '1';
	signal sl_WR68Kn : std_logic := '0';
	signal sl_RD68Kn : std_logic := '0';
	signal slv_phi   : std_logic_vector( 3 downto 0);
	signal
		slv_SBDI,
		slv_SBDO
								: std_logic_vector( 7 downto 0) := (others=>'0');
	signal
		slv_addr
								: std_logic_vector(14 downto 1) := (others=>'0');
	signal
		slv_vdata,
		slv_data
								: std_logic_vector(15 downto 0) := (others=>'0');
begin
	O_HBLANK <= sl_HBLANKn;
	O_VBLANK <= sl_VBLANKn;

	u_main : entity work.MAIN
	port map (
		I_PHI					=> slv_phi,
		I_MCKR				=> I_CLK_28M,
		I_RESET				=> I_RESET,
		I_VBLANKn			=> sl_VBLANKn,
		I_VBKINTn			=> sl_VBKINTn,
		I_VCPU				=> sl_VCPU,
		I_WR68K				=> sl_WR68Kn,
		I_RD68K				=> sl_RD68Kn,
		I_SBD					=> slv_SBDO,
		I_DATA				=> slv_vdata,
		I_SLAP_TYPE			=> I_SLAP_TYPE,
		I_SELFTESTn			=> I_SYS(4),
		I_P1					=> I_P1,
		I_P2					=> I_P2,
		I_P3					=> I_P3,
		I_P4					=> I_P4,

		O_HSCRLDn			=> sl_HSCRLDn,
		O_SNDNMIn			=> sl_SNDNMIn,
		O_SNDINTn			=> sl_SNDINTn,
		O_SNDRESn			=> sl_SNDRESn,
		O_CRAMn				=> sl_CRAMn,
		O_VRAMn				=> sl_VRAMn,
		O_VBUSn				=> sl_VBUSn,
		O_VRDTACK			=> sl_VRDTACK,
		O_VBKACKn			=> sl_VBKACKn,
		O_R_Wn				=> sl_R_Wn,
		O_LDSn				=> sl_LDSn,
		O_UDSn				=> sl_UDSn,

		O_LEDS				=> O_LEDS,
		O_SBD					=> slv_SBDI,
		O_ADDR				=> slv_addr,
		O_DATA				=> slv_data,

		-- external CPU ROMs
		O_MP_EN				=> O_MP_EN,
		O_MP_ADDR			=> O_MP_ADDR,
		I_MP_DATA			=> I_MP_DATA
	);

	u_video : entity work.VIDEO
	port map (
		I_MCKR				=> I_CLK_28M,
		I_ADDR				=> slv_addr,
		I_DATA				=> slv_data,
		I_HSCRLDn			=> sl_HSCRLDn,
		I_CRAMn				=> sl_CRAMn,
		I_VRAMn				=> sl_VRAMn,
		I_VBUSn				=> sl_VBUSn,
		I_VRDTACK			=> sl_VRDTACK,
		I_VBKACKn			=> sl_VBKACKn,
		I_R_Wn				=> sl_R_Wn,
		I_LDSn				=> sl_LDSn,
		I_UDSn				=> sl_UDSn,
		I_SLAP_TYPE			=> I_SLAP_TYPE,
		O_VCPU				=> sl_VCPU,
		O_PHI					=> slv_phi,
		O_1H					=> sl_1H,
		O_2H					=> sl_2H,
		O_32V					=> sl_32V,
		O_VBKINTn			=> sl_VBKINTn,
		O_VBLANKn			=> sl_VBLANKn,
		O_HBLANKn			=> sl_HBLANKn,
		O_DATA				=> slv_vdata,
		O_I					=> O_VIDEO_I,
		O_R					=> O_VIDEO_R,
		O_G					=> O_VIDEO_G,
		O_B					=> O_VIDEO_B,
		O_HSYNC				=> O_HSYNC,
		O_VSYNC				=> O_VSYNC,
		O_CSYNC				=> O_CSYNC,

		-- external GFX ROMs
		O_GP_EN				=> O_GP_EN,
		O_GP_ADDR			=> O_GP_ADDR,
		I_GP_DATA			=> I_GP_DATA,
		O_4R_ADDR			=> O_4R_ADDR,
		I_4R_DATA			=> I_4R_DATA,
		O_CP_ADDR			=> O_CP_ADDR,
		I_CP_DATA			=> I_CP_DATA
	);

	u_audio : entity work.AUDIO
	port map (
		I_PHI					=> slv_phi,
		I_MCKR				=> I_CLK_28M,

		I_1H					=> sl_1H,
		I_2H					=> sl_2H,
		I_32V					=> sl_32V,
		I_VBLANKn			=> sl_VBLANKn,

		I_SNDNMIn			=> sl_SNDNMIn,
		I_SNDINTn			=> sl_SNDINTn,
		I_SNDRESn			=> sl_SNDRESn,

		I_SELFTESTn			=> I_SYS(4),
		I_COIN				=> I_SYS(3 downto 0),	-- 1L, 2, 3, 4R

		I_SBD					=> slv_SBDI,
		O_SBD					=> slv_SBDO,
		O_WR68Kn				=> sl_WR68Kn,
		O_RD68Kn				=> sl_RD68Kn,

		O_CCTR1n				=> open,	-- coin counter open collector active low
		O_CCTR2n				=> open,	-- coin counter open collector active low
		O_AUDIO_L			=> O_AUDIO_L,
		O_AUDIO_R			=> O_AUDIO_R,

		-- external audio ROMs
		O_AP_EN				=> O_AP_EN,
		O_AP_AD				=> O_AP_ADDR,
		I_AP_DI				=> I_AP_DATA
	);

end RTL;
