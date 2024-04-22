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

-- Slots:
-- 0 = Primary: BIOS+BASIC
-- 1 = Expanded:
-- 1.0 = XBasic
-- 1.1 = External slot 1
-- 1.2 = External slot 2
-- 2 = Primary: ESSCI
-- 3 = Expanded:
-- 3.0 = Extension ROM (MSX-Music)
-- 3.1 = RAM
-- 3.2 = MSXSD
-- 3.3 = IPL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.msx_pack.all;

entity msx is
	generic (
		hw_id_g			: integer								:= 0;
		hw_txt_g		: string 								:= "NONE";
		hw_version_g	: std_logic_vector(7 downto 0)			:= X"00";
		video_opt_g		: integer								:= 0;		-- 0 = no dblscan, 1 = dblscan configurable, 2 = dblscan always enabled, 3 = no dblscan and external palette
		ramsize_g		: integer								:= 512;		-- 512, 2048 or 8192
		hw_hashwds_g	: std_logic								:= '0';		-- 0 = Software disk-change, 1 = Hardware disk-change
		opll_en_g		: boolean								:= false
	);
	port (
		-- Resets
		por_i			: in  std_logic;
		softreset_o		: out std_logic;
		reload_o		: out std_logic;
		reset_i			: in  std_logic;
		-- Clocks
		clock_master_i	: in  std_logic;
		clock_vdp_en_i	: in  std_logic;
		clock_cpu_en_i	: in  std_logic;
		clock_psg_en_i	: in  std_logic;
		-- Turbo
		turbo_on_k_i	: in  std_logic;
		turbo_on_o		: out std_logic;
		-- Options
		opt_nextor_i	: in  std_logic;
		opt_mr_type_i	: in  std_logic_vector(1 downto 0);
		opt_vga_on_i	: in  std_logic							:= '0';
		-- RAM
		ram_addr_o		: out std_logic_vector(22 downto 0);	-- 8MB
		ram_data_i		: in  std_logic_vector( 7 downto 0);
		ram_data_o		: out std_logic_vector( 7 downto 0);
		ram_ce_n_o		: out std_logic;
		ram_oe_n_o		: out std_logic;
		ram_we_n_o		: out std_logic;
		-- ROM
		rom_addr_o		: out std_logic_vector(14 downto 0);	-- 32K
		rom_data_i		: in  std_logic_vector( 7 downto 0);
		rom_ce_n_o		: out std_logic;
		rom_oe_n_o		: out std_logic;
		-- External bus
		bus_addr_o		: out std_logic_vector(15 downto 0);
		bus_data_i		: in  std_logic_vector( 7 downto 0);
		bus_data_o		: out std_logic_vector( 7 downto 0);
		bus_rd_n_o		: out std_logic;
		bus_wr_n_o		: out std_logic;
		bus_m1_n_o		: out std_logic;
		bus_iorq_n_o	: out std_logic;
		bus_mreq_n_o	: out std_logic;
		bus_sltsl1_n_o	: out std_logic;
		bus_sltsl2_n_o	: out std_logic;
		bus_wait_n_i	: in  std_logic;
		bus_nmi_n_i		: in  std_logic;
		bus_int_n_i		: in  std_logic;
		-- VDP VRAM
		vram_addr_o		: out std_logic_vector(13 downto 0);	-- 16K
		vram_data_i		: in  std_logic_vector( 7 downto 0);
		vram_data_o		: out std_logic_vector( 7 downto 0);
		vram_ce_n_o		: out std_logic;
		vram_oe_n_o		: out std_logic;
		vram_we_n_o		: out std_logic;
		-- Keyboard
		rows_o			: out std_logic_vector( 3 downto 0);
		cols_i			: in  std_logic_vector( 7 downto 0)		:= (others => '1');
		caps_en_o		: out std_logic;
		keyb_valid_i	: in  std_logic;
		keyb_data_i		: in  std_logic_vector( 7 downto 0);
		keymap_addr_o	: out std_logic_vector( 8 downto 0);
		keymap_data_o	: out std_logic_vector( 7 downto 0);
		keymap_we_n_o	: out std_logic;
		-- Audio
		audio_scc_o		: out signed(14 downto 0);
		audio_psg_o		: out unsigned( 7 downto 0);
		beep_o			: out std_logic;
		opll_mo_o		: out signed(12 downto 0)				:= (others => '0');
		opll_ro_o		: out signed(12 downto 0)				:= (others => '0');
		volumes_o		: out volumes_t;
		-- K7
		k7_motor_o		: out std_logic;
		k7_audio_o		: out std_logic;
		k7_audio_i		: in  std_logic;
		-- Joystick
		joy1_up_i		: in  std_logic;
		joy1_down_i		: in  std_logic;
		joy1_left_i		: in  std_logic;
		joy1_right_i	: in  std_logic;
		joy1_btn1_i		: in  std_logic;
		joy1_btn1_o		: out std_logic;
		joy1_btn2_i		: in  std_logic;
		joy1_btn2_o		: out std_logic;
		joy1_out_o		: out std_logic;
		joy2_up_i		: in  std_logic;
		joy2_down_i		: in  std_logic;
		joy2_left_i		: in  std_logic;
		joy2_right_i	: in  std_logic;
		joy2_btn1_i		: in  std_logic;
		joy2_btn1_o		: out std_logic;
		joy2_btn2_i		: in  std_logic;
		joy2_btn2_o		: out std_logic;
		joy2_out_o		: out std_logic;
		-- Video
		cnt_hor_o		: out std_logic_vector( 8 downto 0);
		cnt_ver_o		: out std_logic_vector( 7 downto 0);
		rgb_r_o			: out std_logic_vector( 3 downto 0);
		rgb_g_o			: out std_logic_vector( 3 downto 0);
		rgb_b_o			: out std_logic_vector( 3 downto 0);
		hsync_n_o		: out std_logic;
		vsync_n_o		: out std_logic;
		ntsc_pal_o		: out std_logic;
		vga_on_k_i		: in  std_logic;
		vga_en_o		: out std_logic;
		scanline_on_k_i	: in  std_logic;
		scanline_en_o	: out std_logic;
		vertfreq_on_k_i	: in  std_logic								:= '0';
		-- SPI/SD
		flspi_cs_n_o	: out std_logic;
		spi2_cs_n_o		: out std_logic;
		spi_cs_n_o		: out std_logic;
		spi_sclk_o		: out std_logic;
		spi_mosi_o		: out std_logic;
		spi_miso_i		: in  std_logic								:= '0';
		sd_pres_n_i		: in  std_logic								:= '0';
		sd_wp_i			: in  std_logic								:= '0';
		-- DEBUG
		D_wait_o		: out std_logic;
		D_slots_o		: out std_logic_vector( 7 downto 0);
		D_ipl_en_o		: out std_logic;
		D_generic_o		: out std_logic
	);

end entity;

architecture Behavior of msx is

	-- Reqs
	signal req_mem_s			: std_logic;
	signal req_io_s				: std_logic;

	-- Turbo
	signal turbo_on_s			: std_logic			:= '0';

	-- Reset
	signal reset_n_s			: std_logic;
	signal softreset_s			: std_logic;

	-- CPU signals
	signal int_n_s				: std_logic;
	signal iorq_n_s				: std_logic;
	signal m1_n_s           	: std_logic;
	signal wait_n_s				: std_logic;
	signal rd_n_s				: std_logic;
	signal wr_n_s				: std_logic;
	signal mreq_n_s				: std_logic;
	signal rfsh_n_s				: std_logic;
	signal cpu_addr_s			: std_logic_vector(15 downto 0);
	signal d_to_cpu_s			: std_logic_vector( 7 downto 0);
	signal d_from_cpu_s			: std_logic_vector( 7 downto 0);

	-- M1 wait state
	signal m1_wait_n_s			: std_logic;
	signal m1_wait_ff_s			: std_logic_vector(1 downto 0);

	-- Address Decoder
	signal io_access_n_s		: std_logic;
	signal io_read_n_s			: std_logic;
	signal io_write_n_s			: std_logic;

	-- Memory
	signal prim_slot_n_s		: std_logic_vector( 3 downto 0)		:= "1111";
	signal pslot_s				: std_logic_vector( 1 downto 0)		:= "00";

	signal d_from_exp1_s		: std_logic_vector( 7 downto 0);
	signal slot1_exp_n_s		: std_logic_vector( 3 downto 0)		:= "1111";
	signal exp1_has_data_s		: std_logic;

	signal d_from_exp3_s		: std_logic_vector( 7 downto 0);
	signal slot3_exp_n_s		: std_logic_vector( 3 downto 0)		:= "1111";
	signal exp3_has_data_s		: std_logic;

	signal brom_cs_n_s			: std_logic;
	signal extrom_cs_n_s		: std_logic;
	signal xb2rom_cs_n_s		: std_logic;
	signal ram_cs_n_s			: std_logic;
	signal use_rom_in_ram_s		: std_logic;
	signal hw_memsize_s			: std_logic_vector( 7 downto 0);

	-- IPL
	signal ipl_en_s				: std_logic;
	signal iplrom_addr_s		: std_logic_vector(12 downto 0);
	signal d_from_iplrom_s		: std_logic_vector( 7 downto 0);
	signal ipl_cs_n_s			: std_logic;
	signal iplrom_cs_n_s		: std_logic;
	signal iplram_cs_n_s		: std_logic;
	signal iplram_bw_s			: std_logic;
	signal ipl_rampage_s		: std_logic_vector( 8 downto 0);

	-- Mapper
	signal mp_mask_s			: std_logic_vector( 7 downto 0);
	signal mp_invmask_s			: std_logic_vector( 7 downto 0);
	signal mp_page_s			: std_logic_vector( 7 downto 0);
	signal mp_bank0_s			: std_logic_vector( 7 downto 0);
	signal mp_bank1_s			: std_logic_vector( 7 downto 0);
	signal mp_bank2_s			: std_logic_vector( 7 downto 0);
	signal mp_bank3_s			: std_logic_vector( 7 downto 0);
	signal mp_cs_n_s			: std_logic;
	signal d_from_mp_s			: std_logic_vector( 7 downto 0);

	-- VDP18
	signal d_from_vdp_s     	: std_logic_vector( 7 downto 0);
	signal vdp_rd_n_s			: std_logic;
	signal vdp_wr_n_s			: std_logic;
	signal vdp_wait_n_s			: std_logic;
	signal vdp_int_n_s			: std_logic;
	signal vga_en_s				: std_logic;
	signal scanline_en_s		: std_logic;
	signal ntsc_pal_s			: std_logic		:= '0';
	signal vertfreq_csw_s		: std_logic;
	signal vertfreq_d_s			: std_logic;

	-- PSG
	signal psg_cs_n_s			: std_logic;
	signal d_from_psg_s			: std_logic_vector( 7 downto 0);
	signal psg_port_a_s			: std_logic_vector( 7 downto 0)	:= (others => '1');
	signal psg_port_b_s			: std_logic_vector( 7 downto 0);

	-- Joystick
	alias  joy_sel_a			: std_logic is psg_port_b_s(6);
	signal joy_sigs_s			: std_logic_vector(5 downto 0);

	-- PIO
	signal d_from_pio_s			: std_logic_vector( 7 downto 0);
	signal pio_cs_n_s			: std_logic;
	signal pio_port_a_s			: std_logic_vector( 7 downto 0);
	signal pio_port_c_s			: std_logic_vector( 7 downto 0);
	alias  pio_rows_coded_a		: std_logic_vector( 3 downto 0) is pio_port_c_s(3 downto 0);
	alias  pio_motoron_a		: std_logic is pio_port_c_s(4);
	alias  pio_k7out_a			: std_logic is pio_port_c_s(5);
	alias  pio_caps_a			: std_logic is pio_port_c_s(6);
	alias  pio_beep_a			: std_logic is pio_port_c_s(7);

	-- Switched I/O ports
	signal swp_cs_n_s			: std_logic;
	signal d_from_swp_s			: std_logic_vector( 7 downto 0);

	-- MSXSSD
	signal nextor_en_s			: std_logic						:= '0';
	signal spi_has_data_s		: std_logic						:= '0';
	signal spi_wait_n_s			: std_logic						:= '1';
	signal d_from_spi_s			: std_logic_vector( 7 downto 0);
	signal nxt_rom_page_s		: std_logic_vector( 2 downto 0)	:= (others => '0');
	signal nxt_rom_cs_n_s		: std_logic						:= '1';
	signal nxt_rom_wr_n_s		: std_logic						:= '1';

	-- SCC/Megaram
	signal mram_cs_n_s			: std_logic;
	signal d_from_mram_s		: std_logic_vector( 7 downto 0);
	signal mr_type_s			: std_logic_vector( 1 downto 0);
	signal mr_ram_addr_s		: std_logic_vector(19 downto 0);
	signal mr_ram_ce_n_s		: std_logic;
	signal mr_audio_s			: signed(14 downto 0);
	signal mr_audio_std_s		: std_logic_vector(14 downto 0);

	-- OPLL
	signal opll_cs_n_s			: std_logic						:= '1';
	signal opll_wait_n_s		: std_logic						:= '1';

begin

	-- CPU
	cpu: entity work.T80s
	generic map (
		mode_g		=> 0,
		iowait_g	=> 1,
		nmos_g		=> true
	)
	port map (
		r800_mode_i => '0',
		reset_n_i	=> reset_n_s,
		clock_i		=> clock_master_i,
		clock_en_i	=> clock_cpu_en_i,
		address_o	=> cpu_addr_s,
		data_i		=> d_to_cpu_s,
		data_o		=> d_from_cpu_s,
		wait_n_i	=> wait_n_s,
		int_n_i		=> int_n_s,
		nmi_n_i		=> '1',--bus_nmi_n_i,
		m1_n_o		=> m1_n_s,
		mreq_n_o	=> mreq_n_s,
		iorq_n_o	=> iorq_n_s,
		rd_n_o		=> rd_n_s,
		wr_n_o		=> wr_n_s,
		refresh_n_o	=> rfsh_n_s,
		halt_n_o	=> open,
		busrq_n_i	=> '1',
		busak_n_o	=> open
	);

	-- IPL ROM
	ipl: entity work.ipl_rom
	port map (
		clock_i		=> clock_master_i,
		clock_en_i	=> clock_cpu_en_i,
		addr_i		=> iplrom_addr_s,
		data_o		=> d_from_iplrom_s
	);

	-- VDP
	vdp: entity work.vdp18_core
	generic map (
		video_opt_g		=> video_opt_g,
		start_on_g		=> true
	)
	port map (
		clock_i			=> clock_master_i,
		clk_en_10m7_i	=> clock_vdp_en_i,
		por_i			=> por_i,
		reset_i			=> reset_i,
		csr_n_i			=> vdp_rd_n_s,
		csw_n_i			=> vdp_wr_n_s,
		mode_i			=> cpu_addr_s(1 downto 0),
		int_n_o			=> vdp_int_n_s,
		cd_i			=> d_from_cpu_s,
		cd_o			=> d_from_vdp_s,
		wait_n_o		=> vdp_wait_n_s,
		vram_ce_n_o		=> vram_ce_n_o,
		vram_oe_n_o		=> vram_oe_n_o,
		vram_we_n_o		=> vram_we_n_o,
		vram_a_o		=> vram_addr_o,
		vram_d_o		=> vram_data_o,
		vram_d_i		=> vram_data_i,
		vga_en_i		=> vga_en_s,
		scanline_en_i	=> scanline_en_s,
		cnt_hor_o		=> cnt_hor_o,
		cnt_ver_o		=> cnt_ver_o,
		rgb_r_o			=> rgb_r_o,
		rgb_g_o			=> rgb_g_o,
		rgb_b_o			=> rgb_b_o,
		hsync_n_o		=> hsync_n_o,
		vsync_n_o		=> vsync_n_o,
		ntsc_pal_i		=> ntsc_pal_s,
		vertfreq_csw_o	=> vertfreq_csw_s,
		vertfreq_d_o	=> vertfreq_d_s
	);

	-- PSG
	psg: entity work.YM2149s
	port map (
		clock_master_i		=> clock_master_i,
		clock_en_i			=> clock_psg_en_i,	-- clock enable 3.57 MHz
		reset_i				=> reset_i,
		ayymmode_i			=> '0',
		-- data bus
		data_i				=> d_from_cpu_s,
		data_o				=> d_from_psg_s,
		-- control
		addr_i				=> cpu_addr_s(1 downto 0),
		req_i				=> req_io_s,				-- one pulse only
		cs_n_i				=> psg_cs_n_s,
		rd_n_i				=> rd_n_s,
		wr_n_i				=> wr_n_s,
		-- I/O ports
		port_a_i			=> psg_port_a_s,
		port_b_o			=> psg_port_b_s,
		-- audio channels out
		audio_ch_a_o		=> open,
		audio_ch_b_o		=> open,
		audio_ch_c_o		=> open,
		audio_ch_mix_o		=> audio_psg_o
	);

	-- PIO (82C55)
	pio: entity work.pio
	port map (
		reset_i			=> reset_i,
		clock_master_i	=> clock_master_i,
		ipl_en_i		=> ipl_en_s,
		addr_i			=> cpu_addr_s(1 downto 0),
		data_i			=> d_from_cpu_s,
		data_o			=> d_from_pio_s,
		req_i			=> req_io_s,				-- one pulse only
		cs_n_i			=> pio_cs_n_s,
		rd_n_i			=> rd_n_s,
		wr_n_i			=> wr_n_s,
		port_a_o		=> pio_port_a_s,
		port_b_i		=> cols_i,
		port_c_o		=> pio_port_c_s
	);

	-- Glue logic

	-- Generate req_mem_s
	req_mem: process (reset_i, clock_master_i)
		variable blk_mem_v	: boolean;

	begin
		if reset_i = '1' then
			req_mem_s <= '0';
			blk_mem_v := false;
		elsif rising_edge(clock_master_i) then
			req_mem_s <= '0';
			if mreq_n_s = '0' and not blk_mem_v then
				req_mem_s <= '1';
				blk_mem_v := true;
			elsif mreq_n_s = '1' then
				blk_mem_v := false;
			end if;
		end if;
	end process;

	-- Generate req_io_s
	req_io: process (reset_i, clock_master_i)
		variable blk_io_v	: boolean;
	begin
		if reset_i = '1' then
			req_io_s <= '0';
			blk_io_v := false;
		elsif rising_edge(clock_master_i) then
			req_io_s <= '0';
			if iorq_n_s = '0' and m1_n_s = '1' and not blk_io_v then
				req_io_s <= '1';
				blk_io_v := true;
			elsif iorq_n_s = '1' then
				blk_io_v := false;
			end if;
		end if;
	end process;

	-- Slot expander prim slot 1
	exp1: entity work.exp_slot
	port map (
		reset_i			=> reset_i,
		clock_i			=> clock_master_i,
		ipl_en_i		=> '0',
		addr_i			=> cpu_addr_s,
		data_i			=> d_from_cpu_s,
		data_o			=> d_from_exp1_s,
		has_data_o		=> exp1_has_data_s,
		req_i			=> req_mem_s,
		sltsl_n_i		=> prim_slot_n_s(1),
		rd_n_i			=> rd_n_s,
		wr_n_i			=> wr_n_s,
		expsltsl_n_o	=> slot1_exp_n_s
	);
	
	-- Slot expander prim slot 3
	exp3: entity work.exp_slot
	port map (
		reset_i			=> reset_i,
		clock_i			=> clock_master_i,
		ipl_en_i		=> ipl_en_s,
		addr_i			=> cpu_addr_s,
		data_i			=> d_from_cpu_s,
		data_o			=> d_from_exp3_s,
		has_data_o		=> exp3_has_data_s,
		req_i			=> req_mem_s,
		sltsl_n_i		=> prim_slot_n_s(3),
		rd_n_i			=> rd_n_s,
		wr_n_i			=> wr_n_s,
		expsltsl_n_o	=> slot3_exp_n_s
	);

	-- Memory configuration
	hw_memsize_s(7)				<= use_rom_in_ram_s;
	hw_memsize_s(6 downto 3)	<= "0000";
	hw_memsize_s(2 downto 0)	<= "000" when ramsize_g = 512	else
								   "010" when ramsize_g = 2048	else
								   "100";

	-- Switched I/O ports
	swiop: entity work.swioports
	port map (
		por_i				=> por_i,
		reset_i				=> reset_i,
		clock_i				=> clock_master_i,
		--
		addr_i				=> cpu_addr_s(3 downto 0),
		req_i				=> req_io_s,
		cs_n_i				=> swp_cs_n_s,
		rd_n_i				=> rd_n_s,
		wr_n_i				=> wr_n_s,
		data_i				=> d_from_cpu_s,
		data_o				=> d_from_swp_s,
		--
		hw_id_i				=> std_logic_vector(to_unsigned(hw_id_g, 8)),
		hw_txt_i			=> hw_txt_g,
		hw_version_i		=> hw_version_g,
		hw_memsize_i		=> hw_memsize_s,
		hw_hashwds_i		=> hw_hashwds_g,
		nextor_en_i 		=> opt_nextor_i,
		mr_type_i			=> opt_mr_type_i,
		vga_on_i			=> opt_vga_on_i,
		turbo_on_k_i		=> turbo_on_k_i,
		vga_on_k_i			=> vga_on_k_i,
		scanline_on_k_i		=> scanline_on_k_i,
		vertfreq_on_k_i		=> vertfreq_on_k_i,
		vertfreq_csw_i		=> vertfreq_csw_s,
		vertfreq_d_i		=> vertfreq_d_s,
		keyb_valid_i		=> keyb_valid_i,
		keyb_data_i			=> keyb_data_i,
		--
		nextor_en_o			=> nextor_en_s,
		mr_type_o			=> mr_type_s,
		turbo_on_o			=> turbo_on_s,
		reload_o			=> reload_o,
		softreset_o			=> softreset_s,
		vga_en_o			=> vga_en_s,
		scanline_en_o		=> scanline_en_s,
		ntsc_pal_o			=> ntsc_pal_s,
		keymap_addr_o		=> keymap_addr_o,
		keymap_data_o		=> keymap_data_o,
		keymap_we_n_o		=> keymap_we_n_o,
		volumes_o			=> volumes_o
	);

	-- MSX SD interface (Nextor ROM + SPI)
	msxsd0: entity work.msxsd
	port map (
		enable_i		=> nextor_en_s,
		clock_i			=> clock_master_i,
		clock_en_i		=> '1',
		reset_i			=> reset_i,
		addr_i			=> cpu_addr_s,
		data_i			=> d_from_cpu_s,
		data_o			=> d_from_spi_s,
		spi_has_data_o	=> spi_has_data_s,
		wait_n_o		=> spi_wait_n_s,
		sltsl_n_i		=> slot3_exp_n_s(2),
		wr_n_i			=> wr_n_s,
		rd_n_i			=> rd_n_s,
		-- Memory
		rom_cs_n_o		=> nxt_rom_cs_n_s,
		rom_wr_n_o		=> nxt_rom_wr_n_s,
		rom_page_o		=> nxt_rom_page_s,
		-- SD card interface
		spi_cs_n_o(2)	=> flspi_cs_n_o,
		spi_cs_n_o(1)	=> spi2_cs_n_o,
		spi_cs_n_o(0)	=> spi_cs_n_o,
		spi_sclk_o		=> spi_sclk_o,
		spi_mosi_o		=> spi_mosi_o,
		spi_miso_i		=> spi_miso_i,
		sd_wp_i			=> sd_wp_i,
		sd_pres_n_i		=> sd_pres_n_i
	);

	-- ESCCI
	escci: entity work.escci
	port map (
		clock_i		=> clock_master_i,
		clock_en_i	=> clock_psg_en_i,	-- clock enable 3.57 MHz
		reset_i		=> reset_i,
		--
		addr_i		=> cpu_addr_s,
		data_i		=> d_from_cpu_s,
		data_o		=> d_from_mram_s,
		req_i		=> req_mem_s,
		cs_n_i		=> mram_cs_n_s,
		rd_n_i		=> rd_n_s,
		wr_n_i		=> wr_n_s,
		--
		ram_addr_o	=> mr_ram_addr_s,
		ram_data_i	=> ram_data_i,
		ram_ce_n_o	=> mr_ram_ce_n_s,
		ram_oe_n_o	=> open,
		ram_we_n_o	=> open,
		--
		map_type_i	=> mr_type_s,		-- "-0" : SCC+, "01" : ASC8K, "11" : ASC16K
		-- Audio Out
		wave_o		=> audio_scc_o
	);

	popll: if opll_en_g generate		
		opll1 : entity work.OPLL 
		port map (
			clock_i		=> clock_master_i,
			clock_en_i	=> clock_psg_en_i,
			reset_i		=> reset_i,
			data_i		=> d_from_cpu_s,
			addr_i		=> cpu_addr_s(0),
			cs_n_i      => opll_cs_n_s,
			we_n_i      => wr_n_s,
			wait_n_o	=> opll_wait_n_s,
			melody_o	=> opll_mo_o,
			rythm_o		=> opll_ro_o
		);
	end generate;

	-- Glue
	softreset_o		<= softreset_s;
	reset_n_s		<= not reset_i;
	ipl_en_s		<= not iplram_bw_s;

	beep_o			<= pio_beep_a;
	rows_o			<= pio_rows_coded_a;
	caps_en_o		<= not pio_caps_a;
	turbo_on_o		<= turbo_on_s;

	wait_n_s		<= m1_wait_n_s and bus_wait_n_i and vdp_wait_n_s and spi_wait_n_s;-- and opll_wait_n_s;
	int_n_s			<= bus_int_n_i and vdp_int_n_s;

	-- K7 and Joystick
	k7_motor_o		<= pio_motoron_a;
	k7_audio_o		<= pio_k7out_a;
	psg_port_a_s	<= k7_audio_i & '0' & joy_sigs_s;	-- bit 6: Keyboard layout (1=JIS, 0=ANSI)
	joy_sigs_s		<= joy1_btn2_i & joy1_btn1_i & joy1_right_i & joy1_left_i & joy1_down_i & joy1_up_i		when joy_sel_a = '0' else
						joy2_btn2_i & joy2_btn1_i & joy2_right_i & joy2_left_i & joy2_down_i & joy2_up_i;
	joy1_btn1_o		<= '0' when psg_port_b_s(0) = '0'	else 'Z';
	joy1_btn2_o		<= '0' when psg_port_b_s(1) = '0'	else 'Z';
	joy2_btn1_o		<= '0' when psg_port_b_s(2) = '0'	else 'Z';
	joy2_btn2_o		<= '0' when psg_port_b_s(3) = '0'	else 'Z';
	joy1_out_o	 	<= psg_port_b_s(4);
	joy2_out_o	 	<= psg_port_b_s(5);

	-- M1 Wait-state (off when turbo on)
	m1_wait_state: process (mreq_n_s, rfsh_n_s, clock_master_i, clock_cpu_en_i)
	begin
		if mreq_n_s = '1' or rfsh_n_s = '0' then
			m1_wait_ff_s	<= "10";
		elsif rising_edge(clock_master_i) and clock_cpu_en_i = '1' then
			if turbo_on_s = '0' then
				m1_wait_ff_s(1)	<=      m1_n_s or m1_wait_ff_s(0);
				m1_wait_ff_s(0)	<= not (m1_n_s or m1_wait_ff_s(0));
			else
				m1_wait_ff_s	<= "10";
			end if;
		end if;
	end process;

	m1_wait_n_s		<= m1_wait_ff_s(1);


	-- I/O
	io_access_n_s	<= '0'	when iorq_n_s = '0' and m1_n_s = '1'								else '1';
	io_read_n_s		<= '0'	when iorq_n_s = '0' and m1_n_s = '1' and rd_n_s = '0'				else '1';
	io_write_n_s	<= '0'	when iorq_n_s = '0' and m1_n_s = '1' and wr_n_s = '0'				else '1';

	swp_cs_n_s		<= '0'	when io_access_n_s = '0' and cpu_addr_s(7 downto 4) = "0100"		else '1';	-- Switched I/O ports => 40-4F
	opll_cs_n_s		<= '0'	when io_access_n_s = '0' and cpu_addr_s(7 downto 1) = "0111110"		else '1';	-- OPLL			=> 7C-7D
	vdp_wr_n_s		<= '0'	when io_write_n_s  = '0' and cpu_addr_s(7 downto 2) = "100110"		else '1';	-- VDP write	=> 98-9B
	vdp_rd_n_s		<= '0'	when io_read_n_s   = '0' and cpu_addr_s(7 downto 2) = "100110"		else '1';	-- VDP read		=> 98-9B
	pio_cs_n_s		<= '0'  when io_access_n_s = '0' and cpu_addr_s(7 downto 2) = "101010"		else '1';	-- PPI 			=> A8-AB
	psg_cs_n_s		<= '0'	when io_access_n_s = '0' and cpu_addr_s(7 downto 2) = "101000"		else '1';	-- PSG			=> A0-A3
	mp_cs_n_s		<= '0'	when io_access_n_s = '0' and cpu_addr_s(7 downto 2) = "111111"		else '1';	-- Mapper		=> FC-FF

	-- Mem
	ram_cs_n_s		<= '0'	when slot3_exp_n_s(1) = '0'											else '1';	-- RAM 0000-FFFF
	mram_cs_n_s		<= '0'	when prim_slot_n_s(2) = '0'											else '1';	-- ESCCI slot 2

	-- IPL
	iplram_cs_n_s	<= '0'	when slot3_exp_n_s(3) = '0' and cpu_addr_s(15 downto 13) /= "000"	else '1';	-- IPL RAM range 2000-FFFF
	ipl_cs_n_s		<= '0'	when slot3_exp_n_s(3) = '0'											else '1';

	-- ROMs
	iplrom_cs_n_s	<= '0'	when slot3_exp_n_s(3) = '0' and cpu_addr_s(15 downto 13) = "000"	else '1';	-- 0000-1FFF
	brom_cs_n_s		<= '0'	when prim_slot_n_s(0) = '0' and cpu_addr_s(15) = '0'				else '1';	-- 0000-7FFF
	extrom_cs_n_s	<= '0'	when slot3_exp_n_s(0) = '0' and cpu_addr_s(15 downto 14) = "01"		else '1';	-- 4000-7FFF
	xb2rom_cs_n_s	<= '0'	when slot1_exp_n_s(0) = '0' and cpu_addr_s(15 downto 14) = "01"		else '1';	-- 4000-7FFF

	iplrom_addr_s	<= cpu_addr_s(12 downto 0);

	-- MUX data CPU
	d_to_cpu_s <=
			-- MEM
			d_from_iplrom_s		when iplrom_cs_n_s = '0' and rd_n_s = '0'		else
			ram_data_i			when iplram_cs_n_s = '0' and rd_n_s = '0'		else
			rom_data_i			when brom_cs_n_s = '0' and rd_n_s = '0'			else
			ram_data_i			when extrom_cs_n_s = '0' and rd_n_s = '0'		else
			ram_data_i			when xb2rom_cs_n_s = '0' and rd_n_s = '0'		else
			ram_data_i			when ram_cs_n_s = '0' and rd_n_s = '0'			else
			ram_data_i			when nxt_rom_cs_n_s = '0' and rd_n_s = '0'		else
			d_from_spi_s		when spi_has_data_s = '1' 						else			
			d_from_exp1_s		when exp1_has_data_s = '1'						else
			d_from_exp3_s		when exp3_has_data_s = '1'						else
			d_from_mram_s		when mram_cs_n_s = '0' and rd_n_s = '0'			else
			-- I/O
			d_from_swp_s		when swp_cs_n_s = '0' and rd_n_s = '0'			else			
			d_from_vdp_s		when vdp_rd_n_s = '0' and rd_n_s = '0'			else
			d_from_psg_s		when psg_cs_n_s = '0' and rd_n_s = '0'			else
			d_from_pio_s		when pio_cs_n_s = '0' and rd_n_s = '0'			else
			d_from_mp_s			when mp_cs_n_s = '0' and rd_n_s = '0'			else
			bus_data_i;

	-- Slot control
	with cpu_addr_s(15 downto 14) select pslot_s <= 
		pio_port_a_s(7 downto 6)	when "11",
		pio_port_a_s(5 downto 4)	when "10",
		pio_port_a_s(3 downto 2)	when "01",
		pio_port_a_s(1 downto 0)	when others;

	prim_slot_n_s(0)	<= '0' when mreq_n_s = '0' and rfsh_n_s = '1' and pslot_s = "00"		else '1';
	prim_slot_n_s(1)	<= '0' when mreq_n_s = '0' and rfsh_n_s = '1' and pslot_s = "01"		else '1';
	prim_slot_n_s(2)	<= '0' when mreq_n_s = '0' and rfsh_n_s = '1' and pslot_s = "10"		else '1';
	prim_slot_n_s(3)	<= '0' when mreq_n_s = '0' and rfsh_n_s = '1' and pslot_s = "11"		else '1';

	-- Mapper
	process(reset_i, clock_master_i)
	begin
		if reset_i = '1' then
			mp_bank0_s	<= "00000011";
			mp_bank1_s	<= "00000010";
			mp_bank2_s	<= "00000001";
			mp_bank3_s	<= "00000000";
		elsif rising_edge(clock_master_i) then
			if mp_cs_n_s = '0' and wr_n_s = '0' and req_io_s = '1' then
				case cpu_addr_s(1 downto 0) is
					when "00"   => mp_bank0_s <= d_from_cpu_s;
					when "01"   => mp_bank1_s <= d_from_cpu_s;
					when "10"   => mp_bank2_s <= d_from_cpu_s;
					when others => mp_bank3_s <= d_from_cpu_s;
				end case;
			end if;
		end if;
	end process;

	mp_invmask_s	<= not mp_mask_s;

	-- Mapper read
	d_from_mp_s <=	mp_bank0_s or mp_invmask_s when cpu_addr_s(1 downto 0) = "00" else
					mp_bank1_s or mp_invmask_s when cpu_addr_s(1 downto 0) = "01" else
					mp_bank2_s or mp_invmask_s when cpu_addr_s(1 downto 0) = "10" else
					mp_bank3_s or mp_invmask_s;

	-- Mapper page
	mp_page_s	<=	mp_bank0_s and mp_mask_s when cpu_addr_s(15 downto 14) = "00" else
					mp_bank1_s and mp_mask_s when cpu_addr_s(15 downto 14) = "01" else
					mp_bank2_s and mp_mask_s when cpu_addr_s(15 downto 14) = "10" else
					mp_bank3_s and mp_mask_s;

	-- RAM
	ram_data_o		<= d_from_cpu_s;
	ram_ce_n_o		<= ram_cs_n_s and iplram_cs_n_s and nxt_rom_cs_n_s and mr_ram_ce_n_s and
						(not use_rom_in_ram_s or brom_cs_n_s) and
						(not use_rom_in_ram_s or extrom_cs_n_s) and
						(not use_rom_in_ram_s or xb2rom_cs_n_s);

	ram_oe_n_o		<= rd_n_s;

	ram_we_n_o		<= '0' when wr_n_s = '0' and (ram_cs_n_s = '0' or mr_ram_ce_n_s = '0')	else
					   '0' when wr_n_s = '0' and iplram_cs_n_s = '0' and iplram_bw_s = '0'	else
					   '0' when wr_n_s = '0' and nxt_rom_wr_n_s = '0'						else				-- Nextor extra RAM
					   '1';

	-- IPLRAM block write
	process (por_i, clock_master_i)
	begin
		if por_i = '1' then
			iplram_bw_s <= '0';
		elsif rising_edge(clock_master_i) then
			if req_io_s = '1' and pio_cs_n_s = '0' and wr_n_s = '0' then
				iplram_bw_s <= '1';
			end if;
		end if;
	end process;

	use_rom_in_ram_s <= '1'	when hw_id_g = 4 or hw_id_g = 5 or ramsize_g /= 512	else '0';

	memctl: entity work.memoryctl
	generic map (
		ramsize_g				=> ramsize_g
	)
	port map (
		cpu_addr_i				=> cpu_addr_s,
		use_rom_in_ram_i		=> use_rom_in_ram_s,
		--
		rom_cs_n_i				=> brom_cs_n_s,
		extrom_cs_n_i			=> extrom_cs_n_s,
		xb2rom_cs_n_i			=> xb2rom_cs_n_s,
		nxt_rom_cs_n_i			=> nxt_rom_cs_n_s,
		nxt_rom_page_i			=> nxt_rom_page_s,
		ipl_cs_n_i				=> ipl_cs_n_s,
		ipl_rampage_i			=> ipl_rampage_s,
		mr_ram_cs_n_i			=> mr_ram_ce_n_s,
		mr_ram_addr_i			=> mr_ram_addr_s,
		ram_cs_n_i				=> ram_cs_n_s,
		ram_page_i				=> mp_page_s,
		--
		ram_addr_o				=> ram_addr_o,
		mapper_mask_o			=> mp_mask_s
	);

	-- IPL rampage write
	process (reset_i, clock_master_i)
	begin
		if reset_i = '1' then
			ipl_rampage_s <= (others => '1');
		elsif rising_edge(clock_master_i) then
			if req_mem_s = '1' and mreq_n_s = '0' and wr_n_s = '0' and ipl_cs_n_s = '0' and 
			 (cpu_addr_s = X"3FFE" or cpu_addr_s = X"3FFF") then

				if cpu_addr_s(0) = '0' then
					ipl_rampage_s(7 downto 0)	<= d_from_cpu_s;
				else
					ipl_rampage_s(8)			<= d_from_cpu_s(0);
				end if;

			end if;
		end if;
	end process;

	-- ROM
	rom_addr_o		<= cpu_addr_s(14 downto 0);
	rom_ce_n_o		<= brom_cs_n_s;
	rom_oe_n_o		<= rd_n_s;

	-- BUS
	bus_addr_o		<= cpu_addr_s;
	bus_data_o		<= d_from_cpu_s;
	bus_rd_n_o		<= rd_n_s;
	bus_wr_n_o		<= wr_n_s;
	bus_m1_n_o		<= m1_n_s;
	bus_iorq_n_o	<= iorq_n_s;
	bus_mreq_n_o	<= mreq_n_s;
	bus_sltsl1_n_o	<= slot1_exp_n_s(1);
	bus_sltsl2_n_o	<= slot1_exp_n_s(2);

	vga_en_o		<= vga_en_s;
	scanline_en_o	<= scanline_en_s;
	ntsc_pal_o		<= ntsc_pal_s;

	-- Debug
	D_slots_o		<= pio_port_a_s;
	D_wait_o		<= spi_wait_n_s;
	D_ipl_en_o		<= ipl_en_s;
	D_generic_o		<= spi_has_data_s;

end architecture;
