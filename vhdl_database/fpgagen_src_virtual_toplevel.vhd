-- Copyright (c) 2010 Gregory Estrade (greg@torlus.com)
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

library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
use IEEE.NUMERIC_STD.ALL;

entity Virtual_Toplevel is
	generic (
		colAddrBits : integer := 9;
		rowAddrBits : integer := 13
	);
	port(
		reset : in std_logic;
		MCLK : in std_logic;
		SDR_CLK : in std_logic;

		DRAM_ADDR	: out std_logic_vector(rowAddrBits-1 downto 0);
		DRAM_BA_0	: out std_logic;
		DRAM_BA_1	: out std_logic;
		DRAM_CAS_N	: out std_logic;
		DRAM_CKE	: out std_logic;
		DRAM_CS_N	: out std_logic;
		DRAM_DQ		: inout std_logic_vector(15 downto 0);
		DRAM_LDQM	: out std_logic;
		DRAM_RAS_N	: out std_logic;
		DRAM_UDQM	: out std_logic;
		DRAM_WE_N	: out std_logic;
		
		DAC_LDATA : out std_logic_vector(15 downto 0);
		DAC_RDATA : out std_logic_vector(15 downto 0);
		
		VGA_R		: out std_logic_vector(7 downto 0);
		VGA_G		: out std_logic_vector(7 downto 0);
		VGA_B		: out std_logic_vector(7 downto 0);
		VGA_VS		: out std_logic;
		VGA_HS		: out std_logic;
		VID_15KHZ	: out std_logic;
		
		LED : out std_logic;

		RS232_RXD : in std_logic;
		RS232_TXD : out std_logic;

		ps2k_clk_out : out std_logic;
		ps2k_dat_out : out std_logic;
		ps2k_clk_in : in std_logic;
		ps2k_dat_in : in std_logic;
		
		joya : in std_logic_vector(7 downto 0) := (others =>'1');
		joyb : in std_logic_vector(7 downto 0) := (others =>'1');

		spi_miso		: in std_logic := '1';
		spi_mosi		: out std_logic;
		spi_clk		: out std_logic;
		spi_cs 		: out std_logic
	);
end entity;

architecture rtl of Virtual_Toplevel is
component jt12 port(
	rst	: in std_logic;
	clk : in std_logic;
	din : in std_logic_vector(7 downto 0);
	addr: in std_logic_vector(1 downto 0);
	cs_n: in std_logic;
	wr_n: in std_logic;	
	limiter_en: in std_logic;
	
	dout: out std_logic_vector(7 downto 0);
	snd_right:out std_logic_vector(11 downto 0);
	snd_left:out std_logic_vector(11 downto 0);
	clk_out : out std_logic;
	sample	: out std_logic;	
	-- Mux'ed output
	mux_right	:out std_logic_vector(8 downto 0);
	mux_left	:out std_logic_vector(8 downto 0);
	mux_sample	:out std_logic;
    irq_n:out std_logic
);
end component;

component jt12_amp_stereo port(
	clk : in std_logic;
	sample : in std_logic;
	volume : in std_logic_vector(2 downto 0);
	psg	   : in std_logic_vector(5 downto 0);
	enable_psg: in std_logic;
	fmleft : in std_logic_vector(11 downto 0);
	fmright: in std_logic_vector(11 downto 0);
	postleft: out std_logic_vector(15 downto 0);
	postright: out std_logic_vector(15 downto 0) );	
end component;

component jt12_mixer port(
	clk 		: in std_logic;
	rst			: in std_logic;
	sample 		: in std_logic;
	left_in 	: in std_logic_vector(8 downto 0);
	right_in	: in std_logic_vector(8 downto 0);
	psg			: in std_logic_vector(5 downto 0);
	enable_psg	: in std_logic;
	left_out	: out std_logic_vector(15 downto 0);
	right_out	: out std_logic_vector(15 downto 0) );	
end component;

-- "FLASH"
signal romwr_req : std_logic := '0';
signal romwr_ack : std_logic;
signal romwr_we  : std_logic := '1';
signal romwr_a : unsigned(21 downto 1);
signal romwr_d : std_logic_vector(15 downto 0);
signal romwr_q : std_logic_vector(15 downto 0);

signal romrd_req : std_logic := '0';
signal romrd_ack : std_logic;
signal romrd_a : std_logic_vector(21 downto 3);
signal romrd_q : std_logic_vector(63 downto 0);
signal romrd_a_cached : std_logic_vector(21 downto 3);
signal romrd_q_cached : std_logic_vector(63 downto 0);
type fc_t is ( FC_IDLE, 
	FC_TG68_RD,
	FC_DMA_RD,
	FC_T80_RD
);
signal FC : fc_t;

-- 68000 RAM
signal ram68k_req : std_logic;
signal ram68k_ack : std_logic;
signal ram68k_we : std_logic;
signal ram68k_a : std_logic_vector(15 downto 1);
signal ram68k_d : std_logic_vector(15 downto 0);
signal ram68k_q : std_logic_vector(15 downto 0);
signal ram68k_l_n : std_logic;
signal ram68k_u_n : std_logic;

-- VRAM
signal vram_req : std_logic;
signal vram_ack : std_logic;
signal vram_we : std_logic;
signal vram_a : std_logic_vector(15 downto 1);
signal vram_d : std_logic_vector(15 downto 0);
signal vram_q : std_logic_vector(15 downto 0);
signal vram_l_n : std_logic;
signal vram_u_n : std_logic;


type sdrc_t is ( SDRC_IDLE,
	SDRC_TG68,
	SDRC_DMA, 
	SDRC_T80);
signal SDRC : sdrc_t;

-- Z80 RAM

signal zram_a : std_logic_vector(12 downto 0);
signal zram_d : std_logic_vector(7 downto 0);
signal zram_q : std_logic_vector(7 downto 0);
signal zram_we : std_logic;

signal TG68_ZRAM_SEL		: std_logic;
signal TG68_ZRAM_D			: std_logic_vector(15 downto 0);
signal TG68_ZRAM_DTACK_N	: std_logic;

signal T80_ZRAM_SEL		: std_logic;
signal T80_ZRAM_D			: std_logic_vector(7 downto 0);
signal T80_ZRAM_DTACK_N	: std_logic;

type zrc_t is ( ZRC_IDLE,
	ZRC_ACC1, ZRC_ACC2, ZRC_ACC3
);
signal ZRC : zrc_t;

type zrcp_t is ( ZRCP_T80, ZRCP_TG68 );
signal ZRCP : zrcp_t;

constant useCache : boolean := false;

-- Genesis core
signal NO_DATA		: std_logic_vector(15 downto 0) := x"4E71";	-- SYNTHESIS gp/m68k.c line 12

signal MRST_N		: std_logic;

-- 68K
signal TG68_CLK		: std_logic;
signal TG68_RES_N	: std_logic;
signal TG68_CLKE	: std_logic;
signal TG68_DI		: std_logic_vector(15 downto 0);
signal TG68_IPL_N	: std_logic_vector(2 downto 0);
signal TG68_DTACK_N	: std_logic;
signal TG68_A		: std_logic_vector(31 downto 0);
signal TG68_DO		: std_logic_vector(15 downto 0);
signal TG68_AS_N		: std_logic;
signal TG68_UDS_N	: std_logic;
signal TG68_LDS_N	: std_logic;
signal TG68_RNW		: std_logic;
signal TG68_INTACK	: std_logic;

signal TG68_ENARDREG	: std_logic;
signal TG68_ENAWRREG	: std_logic;

-- Z80
signal T80_RESET_N	: std_logic;
signal T80_CLK_N	: std_logic;
signal T80_CLKEN	: std_logic;
signal T80_WAIT_N	: std_logic;
signal T80_INT_N           : std_logic;
signal T80_NMI_N           : std_logic;
signal T80_BUSRQ_N         : std_logic;
signal T80_M1_N            : std_logic;
signal T80_MREQ_N          : std_logic;
signal T80_IORQ_N          : std_logic;
signal T80_RD_N            : std_logic;
signal T80_WR_N            : std_logic;
signal T80_RFSH_N          : std_logic;
signal T80_HALT_N          : std_logic;
signal T80_BUSAK_N         : std_logic;
signal T80_A               : std_logic_vector(15 downto 0);
signal T80_DI              : std_logic_vector(7 downto 0);
signal T80_DO              : std_logic_vector(7 downto 0);

-- CLOCK GENERATION
signal VCLK			: std_logic;
signal RST_VCLK	: std_logic; -- Reset for blocks using VCLK as clock
signal RST_VCLK_aux : std_logic;
signal VCLKCNT		: std_logic_vector(2 downto 0);
-- signal VCLKCNT		: unsigned(2 downto 0);
signal ZCLK			: std_logic := '0';

signal ZCLKCNT		: std_logic_vector(3 downto 0);

-- FLASH CONTROL
signal TG68_FLASH_SEL		: std_logic;
signal TG68_FLASH_D			: std_logic_vector(15 downto 0);
signal TG68_FLASH_DTACK_N	: std_logic;

signal T80_FLASH_SEL		: std_logic;
signal T80_FLASH_D			: std_logic_vector(7 downto 0);
signal T80_FLASH_DTACK_N	: std_logic;

signal DMA_FLASH_SEL		: std_logic;
signal DMA_FLASH_D			: std_logic_vector(15 downto 0);
signal DMA_FLASH_DTACK_N	: std_logic;

-- SDRAM CONTROL
signal TG68_SDRAM_SEL		: std_logic;
signal TG68_SDRAM_D			: std_logic_vector(15 downto 0);
signal TG68_SDRAM_DTACK_N	: std_logic;

signal T80_SDRAM_SEL		: std_logic;
signal T80_SDRAM_D			: std_logic_vector(7 downto 0);
signal T80_SDRAM_DTACK_N	: std_logic;

signal DMA_SDRAM_SEL		: std_logic;
signal DMA_SDRAM_D			: std_logic_vector(15 downto 0);
signal DMA_SDRAM_DTACK_N	: std_logic;

-- OPERATING SYSTEM ROM
signal TG68_OS_SEL			: std_logic;
signal TG68_OS_D			: std_logic_vector(15 downto 0);
signal TG68_OS_DTACK_N		: std_logic;
signal OS_OEn				: std_logic;

-- CONTROL AREA
signal ZBUSREQ				: std_logic;
signal ZRESET_N				: std_logic;
signal ZBUSACK_N				: std_logic;
signal CART_EN				: std_logic;

signal TG68_CTRL_SEL		: std_logic;
signal TG68_CTRL_D			: std_logic_vector(15 downto 0);
signal TG68_CTRL_DTACK_N		: std_logic;

signal T80_CTRL_SEL		: std_logic;
signal T80_CTRL_D			: std_logic_vector(7 downto 0);
signal T80_CTRL_DTACK_N		: std_logic;

-- I/O AREA
signal IO_SEL				: std_logic;
signal IO_A 				: std_logic_vector(4 downto 0);
signal IO_RNW				: std_logic;
signal IO_UDS_N				: std_logic;
signal IO_LDS_N				: std_logic;
signal IO_DI				: std_logic_vector(15 downto 0);
signal IO_DO				: std_logic_vector(15 downto 0);
signal IO_DTACK_N			: std_logic;

signal TG68_IO_SEL		: std_logic;
signal TG68_IO_D			: std_logic_vector(15 downto 0);
signal TG68_IO_DTACK_N		: std_logic;

signal T80_IO_SEL		: std_logic;
signal T80_IO_D			: std_logic_vector(7 downto 0);
signal T80_IO_DTACK_N		: std_logic;

type ioc_t is ( IOC_IDLE, IOC_TG68_ACC, IOC_T80_ACC, IOC_DESEL );
signal IOC : ioc_t;

-- VDP AREA
signal VDP_SEL				: std_logic;
signal VDP_A 				: std_logic_vector(4 downto 0);
signal VDP_RNW				: std_logic;
signal VDP_UDS_N			: std_logic;
signal VDP_LDS_N			: std_logic;
signal VDP_DI				: std_logic_vector(15 downto 0);
signal VDP_DO				: std_logic_vector(15 downto 0);
signal VDP_DTACK_N			: std_logic;

signal TG68_VDP_SEL		: std_logic;
signal TG68_VDP_D			: std_logic_vector(15 downto 0);
signal TG68_VDP_DTACK_N		: std_logic;

signal T80_VDP_SEL		: std_logic;
signal T80_VDP_D			: std_logic_vector(7 downto 0);
signal T80_VDP_DTACK_N		: std_logic;

type vdpc_t is ( VDPC_IDLE, VDPC_TG68_ACC, VDPC_T80_ACC, VDPC_DESEL );
signal VDPC : vdpc_t;

signal INTERLACE	: std_logic;

-- FM AREA
signal FM_SEL			: std_logic;
signal FM_A 			: std_logic_vector(1 downto 0);
signal FM_RNW			: std_logic;
signal FM_UDS_N			: std_logic;
signal FM_LDS_N			: std_logic;
signal FM_DI			: std_logic_vector(7 downto 0);
signal FM_DO			: std_logic_vector(7 downto 0);
signal FM_CLKOUT		: std_logic;
signal FM_SAMPLE		: std_logic;
signal FM_LEFT			: std_logic_vector(11 downto 0);
signal FM_RIGHT			: std_logic_vector(11 downto 0);
signal FM_MUX_LEFT		: std_logic_vector(8 downto 0);
signal FM_MUX_RIGHT		: std_logic_vector(8 downto 0);
signal FM_ENABLE		: std_logic;
signal FM_AMP_LEFT		: std_logic_vector(11 downto 0);
signal FM_AMP_RIGHT		: std_logic_vector(11 downto 0);

-- PSG
signal PSG_SEL			: std_logic;
signal T80_PSG_SEL		: std_logic;
signal TG68_PSG_SEL		: std_logic;
signal PSG_DI			: std_logic_vector(7 downto 0);
signal PSG_SND			: std_logic_vector(5 downto 0);
signal PSG_ENABLE		: std_logic;

--signal FM_DTACK_N			: std_logic;

signal TG68_FM_SEL		: std_logic;
signal TG68_FM_D			: std_logic_vector(15 downto 0);
signal TG68_FM_DTACK_N		: std_logic;

signal T80_FM_SEL		: std_logic;
signal T80_FM_D			: std_logic_vector(7 downto 0);
signal T80_FM_DTACK_N		: std_logic;

type fmc_t is ( FMC_IDLE, FMC_TG68_ACC, FMC_T80_ACC, FMC_DESEL );
signal FMC : fmc_t;


-- BANK ADDRESS REGISTER
signal BAR 					: std_logic_vector(23 downto 15);
signal TG68_BAR_SEL			: std_logic;
signal TG68_BAR_D			: std_logic_vector(15 downto 0);
signal TG68_BAR_DTACK_N		: std_logic;
signal T80_BAR_SEL			: std_logic;
signal T80_BAR_D			: std_logic_vector(7 downto 0);
signal T80_BAR_DTACK_N		: std_logic;

-- INTERRUPTS
signal HINT		: std_logic;
signal HINT_ACK	: std_logic;
signal VINT_TG68	: std_logic;
signal VINT_T80		: std_logic;
signal VINT_TG68_ACK	: std_logic;
signal VINT_T80_ACK	: std_logic;

-- VDP VBUS DMA
signal VBUS_ADDR	: std_logic_vector(23 downto 0);
signal VBUS_UDS_N	: std_logic;
signal VBUS_LDS_N	: std_logic;
signal VBUS_DATA	: std_logic_vector(15 downto 0);		
signal VBUS_SEL		: std_logic;
signal VBUS_DTACK_N	: std_logic;	

-- VDP Video Output
signal VDP_RED		: std_logic_vector(3 downto 0);
signal VDP_GREEN	: std_logic_vector(3 downto 0);
signal VDP_BLUE	: std_logic_vector(3 downto 0);
signal VDP_VS_N	: std_logic;
signal VDP_HS_N	: std_logic;

signal VDP_VGA_RED	: std_logic_vector(3 downto 0);
signal VDP_VGA_GREEN	: std_logic_vector(3 downto 0);
signal VDP_VGA_BLUE	: std_logic_vector(3 downto 0);
signal VDP_VGA_VS_N	: std_logic;
signal VDP_VGA_HS_N	: std_logic;

-- NTSC/RGB Video Output
signal RED			: std_logic_vector(7 downto 0);
signal GREEN			: std_logic_vector(7 downto 0);
signal BLUE			: std_logic_vector(7 downto 0);		
signal VS_N			: std_logic;
signal HS_N			: std_logic;

-- VGA Video Output
signal VGA_RED			: std_logic_vector(7 downto 0);
signal VGA_GREEN			: std_logic_vector(7 downto 0);
signal VGA_BLUE			: std_logic_vector(7 downto 0);		
signal VGA_VS_N			: std_logic;
signal VGA_HS_N			: std_logic;

-- current video signal (switchable between TV and VGA)
signal vga_red_i : std_logic_vector(7 downto 0);
signal vga_green_i : std_logic_vector(7 downto 0);
signal vga_blue_i	: std_logic_vector(7 downto 0);		
signal vga_vsync_i : std_logic;
signal vga_hsync_i : std_logic;

-- Joystick signals
signal JOY_SWAP	: std_logic;
signal JOY_1 		: std_logic_vector(7 downto 0);
signal JOY_2 		: std_logic_vector(7 downto 0);

signal SDR_INIT_DONE	: std_logic;
signal PRE_RESET_N	: std_logic;

type bootStates is (BOOT_READ_1, BOOT_WRITE_1, BOOT_WRITE_2, BOOT_DONE);
signal bootState : bootStates := BOOT_READ_1;

signal host_reset_n : std_logic;
signal host_bootdone : std_logic;
signal rommap : std_logic_vector(1 downto 0);

signal boot_req : std_logic;
signal boot_ack : std_logic;
signal boot_data : std_logic_vector(15 downto 0);
signal FL_DQ : std_logic_vector(15 downto 0);

signal osd_window : std_logic;
signal osd_pixel : std_logic;

type romStates is (ROM_IDLE, ROM_READ);
signal romState : romStates := ROM_IDLE;

signal SW : std_logic_vector(15 downto 0);
signal KEY : std_logic_vector(3 downto 0);

signal gp1emu : std_logic_vector(7 downto 0);
signal gp2emu : std_logic_vector(7 downto 0);

signal MASTER_VOLUME : std_logic_vector(2 downto 0);

-- DEBUG
signal HEXVALUE			: std_logic_vector(15 downto 0);


begin

-- -----------------------------------------------------------------------
-- Global assignments
-- -----------------------------------------------------------------------

-- Reset
PRE_RESET_N <= reset and SDR_INIT_DONE and host_reset_n;
MRST_N <= PRE_RESET_N;

-- Joystick swapping
JOY_SWAP <= SW(2);
JOY_1 <= joyb when JOY_SWAP = '1' else joya;
JOY_2 <= joya when JOY_SWAP = '1' else joyb;

-- SDRAM
DRAM_CKE <= '1';
DRAM_CS_N <= '0';

-- LED
LED <= FM_ENABLE;

-- -----------------------------------------------------------------------
-- SDRAM Controller
-- -----------------------------------------------------------------------		
sdc : entity work.sdram_controller generic map (
	colAddrBits => colAddrBits,
	rowAddrBits => rowAddrBits
) port map(
	clk			=> SDR_CLK,
	
	std_logic_vector(sd_data)	=> DRAM_DQ,
	std_logic_vector(sd_addr)	=> DRAM_ADDR,
	sd_we_n							=> DRAM_WE_N,
	sd_ras_n							=> DRAM_RAS_N,
	sd_cas_n							=> DRAM_CAS_N,
	sd_ba_0							=> DRAM_BA_0,
	sd_ba_1							=> DRAM_BA_1,
	sd_ldqm							=> DRAM_LDQM,
	sd_udqm							=> DRAM_UDQM,
		
	romwr_req	=> romwr_req,
	romwr_ack	=> romwr_ack,
	romwr_we 	=> romwr_we,
	romwr_a		=> std_logic_vector(romwr_a),
	romwr_d		=> romwr_d,
	romwr_q		=> romwr_q,
	
	romrd_req	=> romrd_req,
	romrd_ack	=> romrd_ack,
	romrd_a		=> romrd_a,
	romrd_q		=> romrd_q,

	ram68k_req	=> ram68k_req,
	ram68k_ack	=> ram68k_ack,
	ram68k_we	=> ram68k_we,
	ram68k_a		=> ram68k_a,
	ram68k_d		=> ram68k_d,
	ram68k_q		=> ram68k_q,
	ram68k_u_n	=> ram68k_u_n,
	ram68k_l_n	=> ram68k_l_n,

	vram_req	=> vram_req,
	vram_ack => vram_ack,
	vram_we	=> vram_we,
	vram_a	=> vram_a,
	vram_d	=> vram_d,
	vram_q	=> vram_q,
	vram_u_n => vram_u_n,
	vram_l_n => vram_l_n,
	
	initDone 	=> SDR_INIT_DONE
);

-- -----------------------------------------------------------------------
-- Z80 RAM
-- -----------------------------------------------------------------------
zr : entity work.zram port map (
	address	=> zram_a,
	clock		=> MCLK,
	data		=> zram_d,
	wren		=> zram_we,
	q			=> zram_q
);

-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- Genesis Core
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

-- 68K
tg68 : entity work.TG68 
port map(
	-- clk			=> TG68_CLK,
	clk			=> MCLK,
	reset			=> TG68_RES_N,
	clkena_in	=> TG68_CLKE,
	data_in		=> TG68_DI,
	IPL			=> TG68_IPL_N,
	dtack			=> TG68_DTACK_N,
	addr			=> TG68_A,
	data_out		=> TG68_DO,
	as				=> TG68_AS_N,
	uds			=> TG68_UDS_N,
	lds			=> TG68_LDS_N,
	rw				=> TG68_RNW,
	enaRDreg		=> TG68_ENARDREG,
	enaWRreg		=> TG68_ENAWRREG,
	intack		=> TG68_INTACK
);

-- Z80
t80 : entity work.t80se
port map(
	RESET_n		=> T80_RESET_N,
	CLK_n		=> T80_CLK_N,
	CLKEN		=> T80_CLKEN,
	WAIT_n	=> T80_WAIT_N,
	INT_n		=> T80_INT_N,
	NMI_n		=> T80_NMI_N,
	BUSRQ_n	=> T80_BUSRQ_N,
	M1_n		=> T80_M1_N,
	MREQ_n	=> T80_MREQ_N,
	IORQ_n	=> T80_IORQ_N,
	RD_n		=> T80_RD_N,
	WR_n		=> T80_WR_N,
	RFSH_n	=> T80_RFSH_N,
	HALT_n	=> T80_HALT_N,
	BUSAK_n	=> T80_BUSAK_N,
	A			=> T80_A,
	DI			=> T80_DI,
	DO			=> T80_DO
);

-- OS ROM
os : entity work.os_rom
port map(
	A			=> TG68_A(8 downto 1),
	OEn		=> OS_OEn,
	D			=> TG68_OS_D
);

-- I/O
io : entity work.gen_io
port map(
	RST_N		=> MRST_N,
	CLK			=> VCLK,

	P1_UP		=> not JOY_1(3) and gp1emu(0),
	P1_DOWN	=> not JOY_1(2) and gp1emu(1),
	P1_LEFT	=> not JOY_1(1) and gp1emu(2),
	P1_RIGHT	=> not JOY_1(0) and gp1emu(3),
	P1_A		=> not JOY_1(4) and gp1emu(4),
	P1_B		=> not JOY_1(5) and gp1emu(5),
	P1_C		=> not JOY_1(6) and gp1emu(6),
	P1_START	=> not JOY_1(7) and gp1emu(7),
		
	P2_UP		=> not JOY_2(3) and gp2emu(0),
	P2_DOWN	=> not JOY_2(2) and gp2emu(1),
	P2_LEFT	=> not JOY_2(1) and gp2emu(2),
	P2_RIGHT	=> not JOY_2(0) and gp2emu(3),
	P2_A		=> not JOY_2(4) and gp2emu(4),
	P2_B		=> not JOY_2(5) and gp2emu(5),
	P2_C		=> not JOY_2(6) and gp2emu(6),
	P2_START	=> not JOY_2(7) and gp2emu(7),
		
	SEL		=> IO_SEL,
	A			=> IO_A,
	RNW		=> IO_RNW,
	UDS_N		=> IO_UDS_N,
	LDS_N		=> IO_LDS_N,
	DI			=> IO_DI,
	DO			=> IO_DO,
	DTACK_N		=> IO_DTACK_N
);

-- VDP
vdp : entity work.vdp
port map(
	RST_N		=> MRST_N,
	CLK		=> MCLK,
		
	SEL		=> VDP_SEL,
	A			=> VDP_A,
	RNW		=> VDP_RNW,
	UDS_N		=> VDP_UDS_N,
	LDS_N		=> VDP_LDS_N,
	DI			=> VDP_DI,
	DO			=> VDP_DO,
	DTACK_N		=> VDP_DTACK_N,

	vram_req => vram_req,
	vram_ack => vram_ack,
	vram_we	=> vram_we,
	vram_a	=> vram_a,
	vram_d	=> vram_d,
	vram_q	=> vram_q,
	vram_u_n	=> vram_u_n,
	vram_l_n	=> vram_l_n,
	
	INTERLACE	=> INTERLACE,

	HINT			=> HINT,
	HINT_ACK		=> HINT_ACK,

	VINT_TG68		=> VINT_TG68,
	VINT_T80			=> VINT_T80,
	VINT_TG68_ACK	=> VINT_TG68_ACK,
	VINT_T80_ACK	=> VINT_T80_ACK,
		
	VBUS_ADDR		=> VBUS_ADDR,
	VBUS_UDS_N		=> VBUS_UDS_N,
	VBUS_LDS_N		=> VBUS_LDS_N,
	VBUS_DATA		=> VBUS_DATA,
		
	VBUS_SEL			=> VBUS_SEL,
	VBUS_DTACK_N	=> VBUS_DTACK_N,
	
	R					=> VDP_RED,
	G					=> VDP_GREEN,
	B					=> VDP_BLUE,
	HS					=> VDP_HS_N,
	VS					=> VDP_VS_N,
	
	VGA_R				=> VDP_VGA_RED,
	VGA_G				=> VDP_VGA_GREEN,
	VGA_B				=> VDP_VGA_BLUE,
	VGA_HS			=> VDP_VGA_HS_N,
	VGA_VS			=> VDP_VGA_VS_N
);

-- PSG

u_psg : work.psg
port map(
	clk		=> T80_CLK_N,
	clken	=> T80_CLKEN,
	WR_n	=> not PSG_SEL,
	D_in	=> PSG_DI,
	output	=> PSG_SND
);

-- FM
fm_mixer:jt12_mixer
port map(
	rst			=> not MRST_N,
	clk			=> MCLK,
	sample		=> FM_SAMPLE,
	left_in 	=> FM_MUX_LEFT,
	right_in	=> FM_MUX_RIGHT,
	psg			=> PSG_SND,
	enable_psg	=> PSG_ENABLE,
	left_out	=> DAC_LDATA,
	right_out	=> DAC_RDATA
);
--fm_amp : jt12_amp_stereo
--port map(
--	clk			=> FM_CLKOUT,
--	volume		=> MASTER_VOLUME,
--	sample		=> FM_SAMPLE,
--	psg			=> PSG_SND,
--	enable_psg	=> PSG_ENABLE,
--	fmleft		=> FM_AMP_LEFT,
--	fmright		=> FM_AMP_RIGHT,
--	postleft		=> DAC_LDATA,
--	postright	=> DAC_RDATA
--);

fm : jt12
port map(
	rst		=> RST_VCLK,	-- gen-hw.txt line 328
	clk		=> VCLK,
	clk_out	=> FM_CLKOUT,
	
	limiter_en => not SW(5),
	cs_n	=> not FM_SEL,
	addr	=> FM_A,
	wr_n	=> FM_RNW,
	din			=> FM_DI,
	dout		=> FM_DO,
	mux_left	=> FM_MUX_LEFT,
	mux_right	=> FM_MUX_RIGHT,
	mux_sample	=> FM_SAMPLE
);


-- #############################################################################
-- #############################################################################
-- #############################################################################

-- UNUSED SIGNALS
-- VBUS_DMA_ACK <= '0';
-- VRAM_DTACK_N <= '0';

----------------------------------------------------------------
-- INTERRUPTS CONTROL
----------------------------------------------------------------

-- HINT_ACK <= HINT;
-- VINT_TG68_ACK <= VINT_TG68;
-- VINT_T80_ACK <= VINT_T80;

-- TG68_IPL_N <= "111";
process(MRST_N, MCLK)
begin
	if MRST_N = '0' then
		TG68_IPL_N <= "111";
		T80_INT_N <= '1';
		
		HINT_ACK <= '0';
		VINT_TG68_ACK <= '0';
		VINT_T80_ACK <= '0';
	elsif rising_edge( MCLK ) then
		if HINT = '0' then
			HINT_ACK <= '0';
		end if;
		if VINT_TG68 = '0' then
			VINT_TG68_ACK <= '0';
		end if;
		if VINT_T80 = '0' then
			VINT_T80_ACK <= '0';
		end if;
		if TG68_INTACK = '1' then
			VINT_TG68_ACK <= '1';
		end if;				
		if TG68_INTACK = '1' then
			HINT_ACK <= '1';
		end if;

		if VCLKCNT = "110" then
			if VINT_TG68 = '1' and VINT_TG68_ACK = '0' then
				TG68_IPL_N <= "001";	-- IPL Level 6
				-- if TG68_INTACK = '1' then
					-- VINT_TG68_ACK <= '1';
				-- end if;				
			elsif HINT = '1' and HINT_ACK = '0' then
				TG68_IPL_N <= "011";	-- IPL Level 4
				-- if TG68_INTACK = '1' then
					-- HINT_ACK <= '1';
				-- end if;
			else
				TG68_IPL_N <= "111";
			end if;
			
			if ZCLK = '0' then
				if VINT_T80 = '1' and VINT_T80_ACK = '0' then
					T80_INT_N <= '0';
					if T80_M1_N = '0' and T80_IORQ_N = '0' then
						VINT_T80_ACK <= '1';
					end if;
				else
					T80_INT_N <= '1';
				end if;
			end if;
			
		end if;
			
	end if;
end process;

----------------------------------------------------------------
-- SWITCHES CONTROL
----------------------------------------------------------------
INTERLACE <= '0';


-- #############################################################################
-- #############################################################################
-- #############################################################################

process( MRST_N, VCLK )
begin
	if MRST_N = '0' then
		RST_VCLK <= '1';
		RST_VCLK_aux <= '1';
	elsif rising_edge(VCLK) then
		RST_VCLK_aux <= '0';
		RST_VCLK <= RST_VCLK_aux;
	end if;
end process;

-- CLOCK GENERATION
process( MRST_N, MCLK, VCLKCNT )
begin
	if MRST_N = '0' then
		VCLK <= '1';
		ZCLK <= '0';
		VCLKCNT <= "001"; -- important for SDRAM controller (EDIT: not needed anymore)
		TG68_ENARDREG <= '0';
		TG68_ENAWRREG <= '0';
	elsif rising_edge(MCLK) then
		VCLKCNT <= VCLKCNT + 1;
		if VCLKCNT = "000" then
			ZCLK <= not ZCLK;
		end if;
		if VCLKCNT = "110" then
			VCLKCNT <= "000";
		end if;
		if VCLKCNT <= "011" then
			VCLK <= '1';
		else
			VCLK <= '0';
		end if;
		
		if VCLKCNT = "110" then
			TG68_ENAWRREG <= '1';
		else
			TG68_ENAWRREG <= '0';
		end if;
		
		if VCLKCNT = "011" then
			TG68_ENARDREG <= '1';
		else
			TG68_ENARDREG <= '0';
		end if;
		
	end if;
end process;

process( MRST_N, ZCLK )
begin
	if MRST_N = '0' then
		T80_CLKEN <= '1';
		ZCLKCNT <= (others => '0');
	elsif falling_edge( ZCLK ) then
		ZCLKCNT <= ZCLKCNT + 1;
		T80_CLKEN <= '1';
		if ZCLKCNT = "1110" then
			ZCLKCNT <= (others => '0');
			T80_CLKEN <= '0';
		end if;
	end if;
end process;

-- DMA VBUS
VBUS_DTACK_N <= DMA_FLASH_DTACK_N when DMA_FLASH_SEL = '1'
	else DMA_SDRAM_DTACK_N when DMA_SDRAM_SEL = '1'
	else '0';
VBUS_DATA <= DMA_FLASH_D when DMA_FLASH_SEL = '1'
	else DMA_SDRAM_D when DMA_SDRAM_SEL = '1'
	else x"FFFF";

-- 68K INPUTS
TG68_RES_N <= MRST_N and host_bootdone;
TG68_CLK <= VCLK;
TG68_CLKE <= '1';

TG68_DTACK_N <= TG68_FLASH_DTACK_N when TG68_FLASH_SEL = '1'
	else TG68_SDRAM_DTACK_N when TG68_SDRAM_SEL = '1' 
	else TG68_ZRAM_DTACK_N when TG68_ZRAM_SEL = '1' 
	else TG68_CTRL_DTACK_N when TG68_CTRL_SEL = '1' 
	else TG68_OS_DTACK_N when TG68_OS_SEL = '1' 
	else TG68_IO_DTACK_N when TG68_IO_SEL = '1' 
	else TG68_BAR_DTACK_N when TG68_BAR_SEL = '1' 
	else TG68_VDP_DTACK_N when TG68_VDP_SEL = '1' 
	else TG68_FM_DTACK_N when TG68_FM_SEL = '1' 
	else '0';
TG68_DI(15 downto 8) <= TG68_FLASH_D(15 downto 8) when TG68_FLASH_SEL = '1' and TG68_UDS_N = '0'
	else TG68_SDRAM_D(15 downto 8) when TG68_SDRAM_SEL = '1' and TG68_UDS_N = '0'
	else TG68_ZRAM_D(15 downto 8) when TG68_ZRAM_SEL = '1' and TG68_UDS_N = '0'
	else TG68_CTRL_D(15 downto 8) when TG68_CTRL_SEL = '1' and TG68_UDS_N = '0'
	else TG68_OS_D(15 downto 8) when TG68_OS_SEL = '1' and TG68_UDS_N = '0'
	else TG68_IO_D(15 downto 8) when TG68_IO_SEL = '1' and TG68_UDS_N = '0'
	else TG68_BAR_D(15 downto 8) when TG68_BAR_SEL = '1' and TG68_UDS_N = '0'
	else TG68_VDP_D(15 downto 8) when TG68_VDP_SEL = '1' and TG68_UDS_N = '0'
	else TG68_FM_D(15 downto 8) when TG68_FM_SEL = '1' and TG68_UDS_N = '0'
	else NO_DATA(15 downto 8);
TG68_DI(7 downto 0) <= TG68_FLASH_D(7 downto 0) when TG68_FLASH_SEL = '1' and TG68_LDS_N = '0'
	else TG68_SDRAM_D(7 downto 0) when TG68_SDRAM_SEL = '1' and TG68_LDS_N = '0'
	else TG68_ZRAM_D(7 downto 0) when TG68_ZRAM_SEL = '1' and TG68_LDS_N = '0'
	else TG68_CTRL_D(7 downto 0) when TG68_CTRL_SEL = '1' and TG68_LDS_N = '0'
	else TG68_OS_D(7 downto 0) when TG68_OS_SEL = '1' and TG68_LDS_N = '0'
	else TG68_IO_D(7 downto 0) when TG68_IO_SEL = '1' and TG68_LDS_N = '0'
	else TG68_BAR_D(7 downto 0) when TG68_BAR_SEL = '1' and TG68_LDS_N = '0'
	else TG68_VDP_D(7 downto 0) when TG68_VDP_SEL = '1' and TG68_LDS_N = '0'
	else TG68_FM_D(7 downto 0) when TG68_FM_SEL = '1' and TG68_LDS_N = '0'
	else NO_DATA(7 downto 0);

-- Z80 INPUTS
process(MRST_N, MCLK, ZRESET_N, ZBUSREQ)
begin
	if MRST_N = '0' then
		T80_RESET_N <= '0';
	elsif rising_edge(MCLK) then
		if T80_RESET_N = '0' then
			if ZBUSREQ = '0' and ZRESET_N = '1' then
				T80_RESET_N <= '1';
			end if;
			ZBUSACK_N <= not ZBUSREQ;
		else
			if ZRESET_N = '0' then
				T80_RESET_N <= '0';
			end if;
			ZBUSACK_N <= T80_BUSAK_N;
		end if;
	end if;
end process;

T80_CLK_N <= ZCLK;
--T80_INT_N <= '1';
T80_NMI_N <= '1';
T80_BUSRQ_N <= not ZBUSREQ;

T80_WAIT_N <= not T80_SDRAM_DTACK_N when T80_SDRAM_SEL = '1'
	else not T80_ZRAM_DTACK_N when T80_ZRAM_SEL = '1'
	else not T80_FLASH_DTACK_N when T80_FLASH_SEL = '1'
	else not T80_CTRL_DTACK_N when T80_CTRL_SEL = '1' 
	else not T80_IO_DTACK_N when T80_IO_SEL = '1' 
	else not T80_BAR_DTACK_N when T80_BAR_SEL = '1'
	else not T80_VDP_DTACK_N when T80_VDP_SEL = '1'
	else not T80_FM_DTACK_N when T80_FM_SEL = '1'
	else '1';
T80_DI <= T80_SDRAM_D when T80_SDRAM_SEL = '1'
	else T80_ZRAM_D when T80_ZRAM_SEL = '1'
	else T80_FLASH_D when T80_FLASH_SEL = '1'
	else T80_CTRL_D when T80_CTRL_SEL = '1'
	else T80_IO_D when T80_IO_SEL = '1'
	else T80_BAR_D when T80_BAR_SEL = '1'
	else T80_VDP_D when T80_VDP_SEL = '1'
	else T80_FM_D when T80_FM_SEL = '1'
	else x"FF";

-- OPERATING SYSTEM ROM
TG68_OS_DTACK_N <= '0';
OS_OEn <= '0';
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N )
begin

	if TG68_A(23 downto 22) = "00" 
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
		and TG68_RNW = '1' 
		and CART_EN = '0'
	then
		TG68_OS_SEL <= '1';
	else
		TG68_OS_SEL <= '0';
	end if;

end process;


-- CONTROL AREA
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N)
begin
	if (TG68_A(23 downto 12) = x"A11" or TG68_A(23 downto 12) = x"A14")
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_CTRL_SEL <= '1';
	else
		TG68_CTRL_SEL <= '0';
	end if;

	if T80_A(15) = '1' and (BAR(23 downto 15) & T80_A(14 downto 12) = x"A11" or BAR(23 downto 15) & T80_A(14 downto 12) = x"A14")
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_CTRL_SEL <= '1';		
	else
		T80_CTRL_SEL <= '0';
	end if;
	
	if MRST_N = '0' then
		TG68_CTRL_DTACK_N <= '1';	
		T80_CTRL_DTACK_N <= '1';	
		
		ZBUSREQ <= '0';
		ZRESET_N <= '0';
		CART_EN <= '0';
		
	elsif rising_edge(MCLK) then
		if TG68_CTRL_SEL = '0' then 
			TG68_CTRL_DTACK_N <= '1';
		end if;
		if T80_CTRL_SEL = '0' then 
			T80_CTRL_DTACK_N <= '1';
		end if;
		
		if TG68_CTRL_SEL = '1' and TG68_CTRL_DTACK_N = '1' then
			TG68_CTRL_DTACK_N <= '0';
			if TG68_RNW = '0' then
				-- Write
				if TG68_A(15 downto 8) = x"11" then
					-- ZBUSREQ
					if TG68_UDS_N = '0' then
						ZBUSREQ <= TG68_DO(8);
					end if;
				elsif TG68_A(15 downto 8) = x"12" then
					-- ZRESET_N
					if TG68_UDS_N = '0' then
						ZRESET_N <= TG68_DO(8);
					end if;			
				elsif TG68_A(15 downto 8) = x"41" then
					-- Cartridge Control Register
					if TG68_LDS_N = '0' then
						CART_EN <= TG68_DO(0);
					end if;								
				end if;
			else
				-- Read
				TG68_CTRL_D <= NO_DATA;
				if TG68_A(15 downto 8) = x"11" then
					-- ZBUSACK_N
					TG68_CTRL_D(8) <= ZBUSACK_N;
					TG68_CTRL_D(0) <= ZBUSACK_N;
				end if;
			end if;		
		elsif T80_CTRL_SEL = '1' and T80_CTRL_DTACK_N = '1' then
			T80_CTRL_DTACK_N <= '0';
			if T80_WR_N = '0' then
				-- Write
				if BAR(15) & T80_A(14 downto 8) = x"11" then
					-- ZBUSREQ
					if T80_A(0) = '0' then
						ZBUSREQ <= T80_DO(0);
					end if;
				elsif BAR(15) & T80_A(14 downto 8) = x"12" then
					-- ZRESET_N
					if T80_A(0) = '0' then
						ZRESET_N <= T80_DO(0);
					end if;			
				elsif BAR(15) & T80_A(14 downto 8) = x"41" then
					-- Cartridge Control Register
					if T80_A(0) = '1' then
						CART_EN <= T80_DO(0);
					end if;								
				end if;
			else
				-- Read
				T80_CTRL_D <= x"FF";
				if BAR(15) & T80_A(14 downto 8) = x"11" and T80_A(0) = '0' then
					-- ZBUSACK_N
					T80_CTRL_D(0) <= ZBUSACK_N;
				end if;
			end if;			
		end if;
		
	end if;
	
end process;

-- I/O AREA
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N )
begin
	if TG68_A(23 downto 5) = x"A100" & "000"
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_IO_SEL <= '1';		
	else
		TG68_IO_SEL <= '0';
	end if;

	if T80_A(15) = '1' and BAR & T80_A(14 downto 5) = x"A100" & "000"
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_IO_SEL <= '1';		
	else
		T80_IO_SEL <= '0';
	end if;
	
	if MRST_N = '0' then
		TG68_IO_DTACK_N <= '1';	
		T80_IO_DTACK_N <= '1';	
		
		IO_SEL <= '0';
		IO_RNW <= '1';
		IO_UDS_N <= '1';
		IO_LDS_N <= '1';
		IO_A <= (others => 'Z');

		IOC <= IOC_IDLE;
		
	elsif rising_edge(MCLK) then
		if TG68_IO_SEL = '0' then 
			TG68_IO_DTACK_N <= '1';
		end if;
		if T80_IO_SEL = '0' then 
			T80_IO_DTACK_N <= '1';
		end if;

		case IOC is
		when IOC_IDLE =>
			if TG68_IO_SEL = '1' and TG68_IO_DTACK_N = '1' then
				IO_SEL <= '1';
				IO_A <= TG68_A(4 downto 0);
				IO_RNW <= TG68_RNW;
				IO_UDS_N <= TG68_UDS_N;
				IO_LDS_N <= TG68_LDS_N;
				IO_DI <= TG68_DO;
				IOC <= IOC_TG68_ACC;
			elsif T80_IO_SEL = '1' and T80_IO_DTACK_N = '1' then
				IO_SEL <= '1';
				IO_A <= T80_A(4 downto 0);
				IO_RNW <= T80_WR_N;
				if T80_A(0) = '0' then
					IO_UDS_N <= '0';
					IO_LDS_N <= '1';
				else
					IO_UDS_N <= '1';
					IO_LDS_N <= '0';				
				end if;
				IO_DI <= T80_DO & T80_DO;
				IOC <= IOC_T80_ACC;			
			end if;

		when IOC_TG68_ACC =>
			if IO_DTACK_N = '0' then
				IO_SEL <= '0';
				TG68_IO_D <= IO_DO;
				TG68_IO_DTACK_N <= '0';
				IOC <= IOC_DESEL;
			end if;

		when IOC_T80_ACC =>
			if IO_DTACK_N = '0' then
				IO_SEL <= '0';
				if T80_A(0) = '0' then
					T80_IO_D <= IO_DO(15 downto 8);
				else
					T80_IO_D <= IO_DO(7 downto 0);
				end if;
				T80_IO_DTACK_N <= '0';
				IOC <= IOC_DESEL;
			end if;
		
		when IOC_DESEL =>
			if IO_DTACK_N = '1' then
				IO_RNW <= '1';
				IO_UDS_N <= '1';
				IO_LDS_N <= '1';
				IO_A <= (others => 'Z');

				IOC <= IOC_IDLE;
			end if;
		
		when others => null;
		end case;
	end if;
	
end process;


-- VDP in Z80 address space :
-- Z80:
-- 7F = 01111111 000
-- 68000:
-- 7F = 01111111 000
-- FF = 11111111 000
-- VDP AREA
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N )
begin
	if TG68_A(23 downto 21) = "110" and TG68_A(18 downto 16) = "000"
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_VDP_SEL <= '1';		
	elsif TG68_A(23 downto 16) = x"A0" and TG68_A(14 downto 5) = "1111111" & "000" -- Z80 Address space
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then
		TG68_VDP_SEL <= '1';
	else
		TG68_VDP_SEL <= '0';
	end if;

	if T80_A(15 downto 5) = x"7F" & "000"
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_VDP_SEL <= '1';			
	elsif T80_A(15) = '1' and BAR(23 downto 21) = "110" and BAR(18 downto 16) = "000" -- 68000 Address space
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_VDP_SEL <= '1';		
	else
		T80_VDP_SEL <= '0';
	end if;
	
	if MRST_N = '0' then
		TG68_VDP_DTACK_N <= '1';	
		T80_VDP_DTACK_N <= '1';	
		
		VDP_SEL <= '0';
		VDP_RNW <= '1';
		VDP_UDS_N <= '1';
		VDP_LDS_N <= '1';
		VDP_A <= (others => 'Z');

		VDPC <= VDPC_IDLE;

		HEXVALUE <= x"0000";
		
	elsif rising_edge(MCLK) then
		if TG68_VDP_SEL = '0' then 
			TG68_VDP_DTACK_N <= '1';
		end if;
		if T80_VDP_SEL = '0' then 
			T80_VDP_DTACK_N <= '1';
		end if;

		case VDPC is
		when VDPC_IDLE =>
			if TG68_VDP_SEL = '1' and TG68_VDP_DTACK_N = '1' then
				if TG68_A(4) = '1' then 
					-- PSG (used for debug)
					if TG68_A(3 downto 1) = "000" and TG68_LDS_N = '0' and TG68_RNW = '0' then
						HEXVALUE(15 downto 8) <= TG68_DO(7 downto 0);
					end if;
					if TG68_A(3 downto 1) = "001" and TG68_LDS_N = '0' and TG68_RNW = '0' then
						HEXVALUE(7 downto 0) <= TG68_DO(7 downto 0);
					end if;					
					TG68_VDP_D <= x"FFFF";
					TG68_VDP_DTACK_N <= '0';
				else
					-- VDP
					VDP_SEL <= '1';
					VDP_A <= TG68_A(4 downto 0);
					VDP_RNW <= TG68_RNW;
					VDP_UDS_N <= TG68_UDS_N;
					VDP_LDS_N <= TG68_LDS_N;
					VDP_DI <= TG68_DO;
					VDPC <= VDPC_TG68_ACC;
				end if;				
			elsif T80_VDP_SEL = '1' and T80_VDP_DTACK_N = '1' then
				if T80_A(4) = '1' then
					-- PSG (used for debug)
					if T80_A(3 downto 0) = "0001" and T80_WR_N = '0' then
						HEXVALUE(15 downto 8) <= T80_DO;
					end if;
					if T80_A(3 downto 0) = "0011" and T80_WR_N = '0' then
						HEXVALUE(7 downto 0) <= T80_DO;
					end if;					
					T80_VDP_D <= x"FF";
					T80_VDP_DTACK_N <= '0';
				else
					VDP_SEL <= '1';
					VDP_A <= T80_A(4 downto 0);
					VDP_RNW <= T80_WR_N;
					if T80_A(0) = '0' then
						VDP_UDS_N <= '0';
						VDP_LDS_N <= '1';
					else
						VDP_UDS_N <= '1';
						VDP_LDS_N <= '0';				
					end if;
					VDP_DI <= T80_DO & T80_DO;
					VDPC <= VDPC_T80_ACC;			
				end if;
			end if;

		when VDPC_TG68_ACC =>
			if VDP_DTACK_N = '0' then
				VDP_SEL <= '0';
				TG68_VDP_D <= VDP_DO;
				TG68_VDP_DTACK_N <= '0';
				VDPC <= VDPC_DESEL;
			end if;

		when VDPC_T80_ACC =>
			if VDP_DTACK_N = '0' then
				VDP_SEL <= '0';
				if T80_A(0) = '0' then
					T80_VDP_D <= VDP_DO(15 downto 8);
				else
					T80_VDP_D <= VDP_DO(7 downto 0);
				end if;
				T80_VDP_DTACK_N <= '0';
				VDPC <= VDPC_DESEL;
			end if;

		when VDPC_DESEL =>
			if VDP_DTACK_N = '1' then
				VDP_RNW <= '1';
				VDP_UDS_N <= '1';
				VDP_LDS_N <= '1';
				VDP_A <= (others => 'Z');

				VDPC <= VDPC_IDLE;
			end if;
			
		when others => null;
		end case;
	end if;
	
end process;

-- Z80:
-- 40 = 01000000
-- 5F = 01011111
-- 68000:
-- 40 = 01000000
-- 5F = 01011111
-- C0 = 11000000
-- DF = 11011111
-- FM AREA
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N )
begin
	if TG68_A(23 downto 16) = x"A0" and TG68_A(14 downto 13) = "10"
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_FM_SEL <= '1';		
	else
		TG68_FM_SEL <= '0';
	end if;

	if T80_A(15 downto 13) = "010"
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_FM_SEL <= '1';			
	else
		T80_FM_SEL <= '0';
	end if;
	
	if MRST_N = '0' then
		TG68_FM_DTACK_N <= '1';	
		T80_FM_DTACK_N <= '1';	
		
		FM_SEL <= '0';
		FM_RNW <= '1';
--		FM_UDS_N <= '1';
--		FM_LDS_N <= '1';
		FM_A <= (others => 'Z');
		
		FMC <= FMC_IDLE;
		
	elsif rising_edge(MCLK) then
		if TG68_FM_SEL = '0' then 
			TG68_FM_DTACK_N <= '1';
		end if;
		if T80_FM_SEL = '0' then 
			T80_FM_DTACK_N <= '1';
		end if;

		case FMC is
		when FMC_IDLE =>
			if VCLK='0' then
				if TG68_FM_SEL = '1' and TG68_FM_DTACK_N = '1' then
					FM_SEL <= '1';
					FM_A <= TG68_A(1 downto 0);
					FM_RNW <= TG68_RNW;
					if TG68_A(0)='0' then
						FM_DI <= TG68_DO(15 downto 8);
					else
						FM_DI <= TG68_DO(7 downto 0);
					end if;

	--				FM_UDS_N <= TG68_UDS_N;
	--				FM_LDS_N <= TG68_LDS_N;
	--				FM_DI <= TG68_DO(7 downto 0);
					FMC <= FMC_TG68_ACC;
				elsif T80_FM_SEL = '1' and T80_FM_DTACK_N = '1' then
					FM_SEL <= '1';
					FM_A <= T80_A(1 downto 0);
					FM_RNW <= T80_WR_N;
	--				if T80_A(0) = '0' then
	--					FM_UDS_N <= '0';
	--					FM_LDS_N <= '1';
	--				else
	--					FM_UDS_N <= '1';
	--					FM_LDS_N <= '0';				
	--				end if;
					FM_DI <= T80_DO;
					FMC <= FMC_T80_ACC;			
				end if;
			end if;
		when FMC_TG68_ACC =>
			-- sync this to 8MHz clock
			if VCLK = '1' then
				FM_SEL <= '0';
				TG68_FM_D <= (others=>'0');
				if TG68_A(0)='0' then
					TG68_FM_D(15 downto 8) <= FM_DO;
				else
					TG68_FM_D(7 downto 0) <= FM_DO;
				end if;

				TG68_FM_DTACK_N <= '0';
				FMC <= FMC_DESEL;
			end if;

		when FMC_T80_ACC =>
			-- sync this to 8MHz clock
			if VCLK = '1' then
				FM_SEL <= '0';
--				if T80_A(0) = '0' then
--					T80_FM_D <= FM_DO(15 downto 8);
--				else
					T80_FM_D <= FM_DO;
--				end if;
				T80_FM_DTACK_N <= '0';
				FMC <= FMC_DESEL;
			end if;

		when FMC_DESEL =>
--			if FM_DTACK_N = '1' then
				FM_RNW <= '1';
--				FM_UDS_N <= '1';
--				FM_LDS_N <= '1';
				FM_A <= (others => 'Z');

				FMC <= FMC_IDLE;
--			end if;
			
		when others => null;
		end case;
	end if;
	
end process;

-- PSG AREA
-- Z80: 7F11h
-- 68k: C00011
process( MRST_N, MCLK, TG68_AS_N, 
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_WR_N )
begin
	if T80_A = x"7F11" 
		and T80_MREQ_N = '0' and T80_WR_N = '0'
	then
		T80_PSG_SEL <= '1';			
	else
		T80_PSG_SEL <= '0';
	end if;	

	if TG68_A = x"C00011"
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_PSG_SEL <= '1';		
	else
		TG68_PSG_SEL <= '0';
	end if;	
	
	if MRST_N = '0' then
		PSG_SEL<= '0';
	elsif rising_edge(MCLK) then
		if VCLK='0' then
			if TG68_PSG_SEL = '1' then
				PSG_SEL <= '1';
				if TG68_A(0)='0' then
					PSG_DI <= TG68_DO(15 downto 8);
				else
					PSG_DI <= TG68_DO(7 downto 0);
				end if;
			elsif T80_PSG_SEL = '1' then
				PSG_SEL <= '1';
				PSG_DI <= T80_DO;		
			end if;
		end if;
	end if;
	
end process;

-- Z80:
-- 60 = 01100000
-- 7E = 01111110
-- 68000:
-- 60 = 01100000
-- 7E = 01111110
-- E0 = 11100000
-- FE = 11111110
-- BANK ADDRESS REGISTER AND UNUSED AREA IN Z80 ADDRESS SPACE
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N )
begin

	if (TG68_A(23 downto 16) = x"A0" and TG68_A(14 downto 13) = "11" and TG68_A(12 downto 8) /= "11111")
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_BAR_SEL <= '1';		
	else
		TG68_BAR_SEL <= '0';
	end if;

	if (T80_A(15 downto 13) = "011" and T80_A(12 downto 8) /= "11111")
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_BAR_SEL <= '1';
	else
		T80_BAR_SEL <= '0';
	end if;
	
	if MRST_N = '0' then
		TG68_BAR_DTACK_N <= '1';	
		T80_BAR_DTACK_N <= '1';
		
		BAR <= (others => '0');
		
	elsif rising_edge(MCLK) then
		if TG68_BAR_SEL = '0' then 
			TG68_BAR_DTACK_N <= '1';
		end if;
		if T80_BAR_SEL = '0' then 
			T80_BAR_DTACK_N <= '1';
		end if;

		if TG68_BAR_SEL = '1' and TG68_BAR_DTACK_N = '1' then
			if TG68_RNW = '0' then
				if TG68_A(23 downto 16) = x"A0" and TG68_A(14 downto 8) = "1100000" and TG68_UDS_N = '0' then
					BAR <= TG68_DO(8) & BAR(23 downto 16);
				end if;
			else
				TG68_BAR_D <= x"FFFF";
			end if;
			TG68_BAR_DTACK_N <= '0';
		elsif T80_BAR_SEL = '1' and T80_BAR_DTACK_N = '1' then
			if T80_WR_N = '0' then
				if T80_A(15 downto 8) = x"60" then
					BAR <= T80_DO(0) & BAR(23 downto 16);
				end if;
			else
				T80_BAR_D <= x"FF";
			end if;
			T80_BAR_DTACK_N <= '0';
		end if;
	end if;
end process;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- MiST Memory Handling
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

-- FLASH (SDRAM) CONTROL
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N,
	VBUS_SEL, VBUS_ADDR	)
begin

	if TG68_A(23 downto 22) = "00" 
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
		and TG68_RNW = '1' 
		and CART_EN = '1'
	then
		TG68_FLASH_SEL <= '1';
	else
		TG68_FLASH_SEL <= '0';
	end if;

	if T80_A(15) = '1' and BAR(23 downto 22) = "00"
		and T80_MREQ_N = '0' and T80_RD_N = '0' 
	then
		T80_FLASH_SEL <= '1';
	else
		T80_FLASH_SEL <= '0';
	end if;	

	if VBUS_ADDR(23 downto 22) = "00" 
		and VBUS_SEL = '1'
	then
		DMA_FLASH_SEL <= '1';
	else
		DMA_FLASH_SEL <= '0';
	end if;

	if MRST_N = '0' then
		FC <= FC_IDLE;
		
		TG68_FLASH_DTACK_N <= '1';
		T80_FLASH_DTACK_N <= '1';
		DMA_FLASH_DTACK_N <= '1';

		romrd_req <= '0';
		romrd_a_cached <= (others => '1');
		romrd_q_cached <= (others => '0');
		
	elsif rising_edge( MCLK ) then
		if TG68_FLASH_SEL = '0' then 
			TG68_FLASH_DTACK_N <= '1';
		end if;
		if T80_FLASH_SEL = '0' then 
			T80_FLASH_DTACK_N <= '1';
		end if;
		if DMA_FLASH_SEL = '0' then 
			DMA_FLASH_DTACK_N <= '1';
		end if;

		case FC is
		when FC_IDLE =>			
			if VCLKCNT = "001" then
				if TG68_FLASH_SEL = '1' and TG68_FLASH_DTACK_N = '1' then
					-- FF_FL_ADDR <= TG68_A(21 downto 0);
					if useCache and (TG68_A(21 downto 3) = romrd_a_cached(21 downto 3)) then
						case TG68_A(2 downto 1) is
						when "00" =>
							if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q_cached(15 downto 8); end if;
							if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q_cached(7 downto 0); end if;

						when "01" =>
							if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q_cached(31 downto 24); end if;
							if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q_cached(23 downto 16); end if;

						when "10" =>
							if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q_cached(47 downto 40); end if;
							if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q_cached(39 downto 32); end if;

						when "11" =>
							if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q_cached(63 downto 56); end if;
							if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q_cached(55 downto 48); end if;

						when others => null;
						end case;
						TG68_FLASH_DTACK_N <= '0';
					else
						romrd_req <= not romrd_req;
						romrd_a <= TG68_A(21 downto 3);
						romrd_a_cached <= TG68_A(21 downto 3);
						FC <= FC_TG68_RD;
					end if;
				elsif T80_FLASH_SEL = '1' and T80_FLASH_DTACK_N = '1' then
					-- FF_FL_ADDR <= BAR(21 downto 15) & T80_A(14 downto 0);
					if useCache and (BAR(21 downto 15) & T80_A(14 downto 3) = romrd_a_cached(21 downto 3)) then
-- /!\
						case T80_A(2 downto 0) is
						when "001" =>
							T80_FLASH_D <= romrd_q_cached(7 downto 0);
						when "000" =>
							T80_FLASH_D <= romrd_q_cached(15 downto 8);
						when "011" =>
							T80_FLASH_D <= romrd_q_cached(23 downto 16);
						when "010" =>
							T80_FLASH_D <= romrd_q_cached(31 downto 24);
						when "101" =>
							T80_FLASH_D <= romrd_q_cached(39 downto 32);
						when "100" =>
							T80_FLASH_D <= romrd_q_cached(47 downto 40);
						when "111" =>
							T80_FLASH_D <= romrd_q_cached(55 downto 48);
						when "110" =>
							T80_FLASH_D <= romrd_q_cached(63 downto 56);
						when others => null;
						end case;
						T80_FLASH_DTACK_N <= '0';
					else
						romrd_req <= not romrd_req;
						romrd_a <= BAR(21 downto 15) & T80_A(14 downto 3);
						romrd_a_cached <= BAR(21 downto 15) & T80_A(14 downto 3);		
						FC <= FC_T80_RD;
					end if;
				elsif DMA_FLASH_SEL = '1' and DMA_FLASH_DTACK_N = '1' then
					-- FF_FL_ADDR <= VBUS_ADDR(21 downto 0);
					if useCache and (VBUS_ADDR(21 downto 3) = romrd_a_cached(21 downto 3)) then
						case VBUS_ADDR(2 downto 1) is
						when "00" =>
							DMA_FLASH_D <= romrd_q_cached(15 downto 0);
						when "01" =>
							DMA_FLASH_D <= romrd_q_cached(31 downto 16);
						when "10" =>
							DMA_FLASH_D <= romrd_q_cached(47 downto 32);
						when "11" =>
							DMA_FLASH_D <= romrd_q_cached(63 downto 48);
						when others => null;
						end case;
						DMA_FLASH_DTACK_N <= '0';
					else
						romrd_req <= not romrd_req;
						romrd_a <= VBUS_ADDR(21 downto 3);
						romrd_a_cached <= VBUS_ADDR(21 downto 3);
						FC <= FC_DMA_RD;
					end if;					
				end if;				
			end if;
		
		when FC_TG68_RD =>
			if romrd_req = romrd_ack then
				romrd_q_cached <= romrd_q;
				case TG68_A(2 downto 1) is
				when "00" =>
					if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q(15 downto 8); end if;
					if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q(7 downto 0); end if;

				when "01" =>
					if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q(31 downto 24); end if;
					if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q(23 downto 16); end if;

				when "10" =>
					if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q(47 downto 40); end if;
					if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q(39 downto 32); end if;

				when "11" =>
					if TG68_UDS_N = '0' then TG68_FLASH_D(15 downto 8) <= romrd_q(63 downto 56); end if;
					if TG68_LDS_N = '0' then TG68_FLASH_D(7 downto 0) <= romrd_q(55 downto 48); end if;

				when others => null;
				end case;				
				TG68_FLASH_DTACK_N <= '0';
				FC <= FC_IDLE;
			end if;

		when FC_T80_RD =>
			if romrd_req = romrd_ack then
				romrd_q_cached <= romrd_q;
-- /!\
				case T80_A(2 downto 0) is
				when "001" =>
					T80_FLASH_D <= romrd_q(7 downto 0);
				when "000" =>
					T80_FLASH_D <= romrd_q(15 downto 8);
				when "011" =>
					T80_FLASH_D <= romrd_q(23 downto 16);
				when "010" =>
					T80_FLASH_D <= romrd_q(31 downto 24);
				when "101" =>
					T80_FLASH_D <= romrd_q(39 downto 32);
				when "100" =>
					T80_FLASH_D <= romrd_q(47 downto 40);
				when "111" =>
					T80_FLASH_D <= romrd_q(55 downto 48);
				when "110" =>
					T80_FLASH_D <= romrd_q(63 downto 56);
				when others => null;
				end case;
				T80_FLASH_DTACK_N <= '0';
				FC <= FC_IDLE;
			end if;
		
		when FC_DMA_RD =>
			if romrd_req = romrd_ack then
				romrd_q_cached <= romrd_q;
				case VBUS_ADDR(2 downto 1) is
				when "00" =>
					DMA_FLASH_D <= romrd_q(15 downto 0);
				when "01" =>
					DMA_FLASH_D <= romrd_q(31 downto 16);
				when "10" =>
					DMA_FLASH_D <= romrd_q(47 downto 32);
				when "11" =>
					DMA_FLASH_D <= romrd_q(63 downto 48);
				when others => null;
				end case;
				DMA_FLASH_DTACK_N <= '0';
				FC <= FC_IDLE;
			end if;
				
		when others => null;
		end case;
	
	end if;

end process;





-- SDRAM (68K RAM) CONTROL
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N,
	VBUS_SEL, VBUS_ADDR)
begin
	if TG68_A(23 downto 21) = "111" -- 68000 RAM
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_SDRAM_SEL <= '1';
	else
		TG68_SDRAM_SEL <= '0';
	end if;

	if T80_A(15) = '1' and BAR(23 downto 21) = "111" -- 68000 RAM
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_SDRAM_SEL <= '1';
	else
		T80_SDRAM_SEL <= '0';
	end if;

	if VBUS_ADDR(23 downto 21) = "111" -- 68000 RAM
		and VBUS_SEL = '1' 
	then
		DMA_SDRAM_SEL <= '1';
	else
		DMA_SDRAM_SEL <= '0';
	end if;

	if MRST_N = '0' then
		TG68_SDRAM_DTACK_N <= '1';
		T80_SDRAM_DTACK_N <= '1';
		DMA_SDRAM_DTACK_N <= '1';

		ram68k_req <= '0';
		
		SDRC <= SDRC_IDLE;
		
	elsif rising_edge(MCLK) then
		if TG68_SDRAM_SEL = '0' then 
			TG68_SDRAM_DTACK_N <= '1';
		end if;	
		if T80_SDRAM_SEL = '0' then 
			T80_SDRAM_DTACK_N <= '1';
		end if;	
		if DMA_SDRAM_SEL = '0' then 
			DMA_SDRAM_DTACK_N <= '1';
		end if;	

		case SDRC is
		when SDRC_IDLE =>
			if VCLKCNT = "001" then
				if TG68_SDRAM_SEL = '1' and TG68_SDRAM_DTACK_N = '1' then
					ram68k_req <= not ram68k_req;
					ram68k_a <= TG68_A(15 downto 1);
					ram68k_d <= TG68_DO;
					ram68k_we <= not TG68_RNW;
					ram68k_u_n <= TG68_UDS_N;
					ram68k_l_n <= TG68_LDS_N;
					SDRC <= SDRC_TG68;
				elsif T80_SDRAM_SEL = '1' and T80_SDRAM_DTACK_N = '1' then
					ram68k_req <= not ram68k_req;
					ram68k_a <= BAR(15) & T80_A(14 downto 1);
					ram68k_d <= T80_DO & T80_DO;
					ram68k_we <= not T80_WR_N;
					ram68k_u_n <= T80_A(0);
					ram68k_l_n <= not T80_A(0);
					SDRC <= SDRC_T80;
				elsif DMA_SDRAM_SEL = '1' and DMA_SDRAM_DTACK_N = '1' then
					ram68k_req <= not ram68k_req;
					ram68k_a <= VBUS_ADDR(15 downto 1);
					ram68k_we <= '0';
					ram68k_u_n <= '0';
					ram68k_l_n <= '0';					
					SDRC <= SDRC_DMA;
				end if;
			end if;

		when SDRC_TG68 =>
			if ram68k_req = ram68k_ack then
				TG68_SDRAM_D <= ram68k_q;
				TG68_SDRAM_DTACK_N <= '0';
				SDRC <= SDRC_IDLE;
			end if;
		
		when SDRC_T80 =>
			if ram68k_req = ram68k_ack then
				if T80_A(0) = '0' then
					T80_SDRAM_D <= ram68k_q(15 downto 8);
				else
					T80_SDRAM_D <= ram68k_q(7 downto 0);
				end if;
				T80_SDRAM_DTACK_N <= '0';
				SDRC <= SDRC_IDLE;
			end if;

		when SDRC_DMA =>
			if ram68k_req = ram68k_ack then
				DMA_SDRAM_D <= ram68k_q;
				DMA_SDRAM_DTACK_N <= '0';
				SDRC <= SDRC_IDLE;
			end if;
		
		when others => null;
		end case;
		
	end if;

end process;





-- Z80 RAM CONTROL
process( MRST_N, MCLK, TG68_AS_N, TG68_RNW,
	TG68_A, TG68_DO, TG68_UDS_N, TG68_LDS_N,
	BAR, T80_A, T80_MREQ_N, T80_RD_N, T80_WR_N,
	VBUS_SEL, VBUS_ADDR)
begin
	if TG68_A(23 downto 16) = x"A0" -- Z80 Address Space
		and TG68_A(14) = '0' -- Z80 RAM (gen-hw.txt lines 89 and 272-273)
		and TG68_AS_N = '0' and (TG68_UDS_N = '0' or TG68_LDS_N = '0') 
	then	
		TG68_ZRAM_SEL <= '1';
	else
		TG68_ZRAM_SEL <= '0';
	end if;

	if T80_A(15 downto 14) = "00" -- Z80 RAM
		and T80_MREQ_N = '0' and (T80_RD_N = '0' or T80_WR_N = '0')
	then
		T80_ZRAM_SEL <= '1';
	else
		T80_ZRAM_SEL <= '0';
	end if;
	
	if MRST_N = '0' then
		TG68_ZRAM_DTACK_N <= '1';
		T80_ZRAM_DTACK_N <= '1';
	
		zram_we <= '0';
		zram_a <= (others => '0');
	
		ZRC <= ZRC_IDLE;
	
	elsif rising_edge(MCLK) then
		if TG68_ZRAM_SEL = '0' then 
			TG68_ZRAM_DTACK_N <= '1';
		end if;	
		if T80_ZRAM_SEL = '0' then 
			T80_ZRAM_DTACK_N <= '1';
		end if;	

		case ZRC is
		when ZRC_IDLE =>
			if VCLKCNT = "001" then
				if TG68_ZRAM_SEL = '1' and TG68_ZRAM_DTACK_N = '1' then
					if TG68_UDS_N = '0' then
						zram_a <= TG68_A(12 downto 1) & "0";
						zram_d <= TG68_DO(15 downto 8);
					else
						zram_a <= TG68_A(12 downto 1) & "1";
						zram_d <= TG68_DO(7 downto 0);
					end if;
					zram_we <= not TG68_RNW;
					ZRCP <= ZRCP_TG68;
					ZRC <= ZRC_ACC1;
				elsif T80_ZRAM_SEL = '1' and T80_ZRAM_DTACK_N = '1' then
					zram_a <= T80_A(12 downto 0);
					zram_d <= T80_DO;
					zram_we <= not T80_WR_N;
					ZRCP <= ZRCP_T80;
					ZRC <= ZRC_ACC1;
				end if;
			end if;
		when ZRC_ACC1 =>
			zram_we <= '0';
			ZRC <= ZRC_ACC2;
		when ZRC_ACC2 =>
			ZRC <= ZRC_ACC3;
		when ZRC_ACC3 =>
			case ZRCP is
			when ZRCP_TG68 =>
				TG68_ZRAM_D <= zram_q & zram_q;
				TG68_ZRAM_DTACK_N <= '0';
			when ZRCP_T80 =>
				T80_ZRAM_D <= zram_q;
				T80_ZRAM_DTACK_N <= '0';				
			end case;
			ZRC <= ZRC_IDLE;
		when others => null;
		end case;
	end if;

end process;


-- #############################################################################
-- #############################################################################
-- #############################################################################

-- Boot process

FL_DQ<=boot_data;

process( SDR_CLK )
begin
	if rising_edge( SDR_CLK ) then
		if PRE_RESET_N = '0' then
				
			boot_req <='0';
			
			romwr_req <= '0';
			romwr_a <= to_unsigned(0, 21);
			bootState<=BOOT_READ_1;
			
		else
			case bootState is 
				when BOOT_READ_1 =>
					boot_req<='1';
					if boot_ack='1' then
						boot_req<='0';
						bootState <= BOOT_WRITE_1;
					end if;
					if host_bootdone='1' then
						boot_req<='0';
						bootState <= BOOT_DONE;
					end if;
				when BOOT_WRITE_1 =>
					romwr_d <= FL_DQ;
					romwr_req <= not romwr_req;
					bootState <= BOOT_WRITE_2;
				when BOOT_WRITE_2 =>
					if romwr_req = romwr_ack then
						romwr_a <= romwr_a + 1;
						bootState <= BOOT_READ_1;
					end if;
				when others => null;
			end case;	
		end if;
	end if;
end process;


-- Control module:

mycontrolmodule : entity work.CtrlModule
	generic map (
		sysclk_frequency => 1080 -- Sysclk frequency * 10
	)
	port map (
		clk => MCLK,
		osdclk => SDR_CLK,
		reset_n => reset,

		-- SPI signals
		spi_miso	=> spi_miso,
		spi_mosi => spi_mosi,
		spi_clk => spi_clk,
		spi_cs => spi_cs,
		
		-- UART
		rxd => RS232_RXD,
		txd => RS232_TXD,
		
		-- DIP switches
		dipswitches => SW,

		-- PS2 keyboard
		ps2k_clk_in => ps2k_clk_in,
		ps2k_dat_in => ps2k_dat_in,
		ps2k_clk_out => ps2k_clk_out,
		ps2k_dat_out => ps2k_dat_out,
		
		-- Host control
		host_reset_n => host_reset_n,
		host_bootdone => host_bootdone,
		
		-- Host boot data
		host_bootdata => boot_data,
		host_bootdata_req => boot_req,
		host_bootdata_ack => boot_ack,
		rommap => rommap,
		
		-- Video signals for OSD
		vga_hsync => vga_hsync_i,
		vga_vsync => vga_vsync_i,
		osd_window => osd_window,
		osd_pixel => osd_pixel,
		
		vol_master => MASTER_VOLUME,
		
		-- Gamepad emulation
		gp1emu => gp1emu,
		gp2emu => gp2emu
);


overlay : entity work.OSD_Overlay
	port map
	(
		clk => SDR_CLK,
		red_in => vga_red_i,
		green_in => vga_green_i,
		blue_in => vga_blue_i,
		window_in => '1',
		osd_window_in => osd_window,
		osd_pixel_in => osd_pixel,
		hsync_in => vga_hsync_i,
		red_out => VGA_R,
		green_out => VGA_G,
		blue_out => VGA_B,
		window_out => open,
		scanline_ena => SW(1)
	);

-- Route VDP signals to outputs
RED <= VDP_RED & VDP_RED;
GREEN <= VDP_GREEN & VDP_GREEN;
BLUE <= VDP_BLUE & VDP_BLUE;
HS_N <= VDP_HS_N;
VS_N <= VDP_VS_N;

VGA_RED <= VDP_VGA_RED & VDP_VGA_RED;
VGA_GREEN <= VDP_VGA_GREEN & VDP_VGA_GREEN;
VGA_BLUE <= VDP_VGA_BLUE & VDP_VGA_BLUE;
VGA_HS_N <= VDP_VGA_HS_N;
VGA_VS_N <= VDP_VGA_VS_N;

-- Select between VGA and TV output	
vga_red_i <= RED when SW(0)='1' else VGA_RED;
vga_green_i <= GREEN when SW(0)='1' else VGA_GREEN;
vga_blue_i <= BLUE when SW(0)='1' else VGA_BLUE;
vga_hsync_i <= HS_N when SW(0)='1' else VGA_HS_N;
vga_vsync_i <= VS_N when SW(0)='1' else VGA_VS_N;
VGA_HS <= vga_hsync_i;
VGA_VS <= vga_vsync_i;
VID_15KHZ <= SW(0);

-- Audio control
PSG_ENABLE <= not SW(3);
FM_ENABLE <= not SW(4);
FM_AMP_LEFT <= FM_LEFT when FM_ENABLE='1' else (others => '0');
FM_AMP_RIGHT <= FM_RIGHT when FM_ENABLE='1' else (others => '0');

-- #############################################################################
-- #############################################################################
-- #############################################################################
-- #############################################################################
-- #############################################################################
-- #############################################################################

-- DEBUG

-- synthesis translate_off
process( MCLK )
	file F		: text open write_mode is "gen.out";
	variable L	: line;
	variable rom_q : std_logic_vector(15 downto 0);
begin
	if rising_edge( MCLK ) then

		-- ROM ACCESS
		if FC = FC_TG68_RD and romrd_req = romrd_ack then
			write(L, string'("68K "));
			write(L, string'("RD"));
			write(L, string'(" ROM     ["));
			hwrite(L, TG68_A(23 downto 0));
			write(L, string'("] = ["));
			rom_q := x"FFFF";
			case TG68_A(2 downto 1) is
			when "00" =>
				if TG68_UDS_N = '0' then rom_q(15 downto 8) := romrd_q(15 downto 8); end if;
				if TG68_LDS_N = '0' then rom_q(7 downto 0) := romrd_q(7 downto 0); end if;

			when "01" =>
				if TG68_UDS_N = '0' then rom_q(15 downto 8) := romrd_q(31 downto 24); end if;
				if TG68_LDS_N = '0' then rom_q(7 downto 0) := romrd_q(23 downto 16); end if;

			when "10" =>
				if TG68_UDS_N = '0' then rom_q(15 downto 8) := romrd_q(47 downto 40); end if;
				if TG68_LDS_N = '0' then rom_q(7 downto 0) := romrd_q(39 downto 32); end if;

			when "11" =>
				if TG68_UDS_N = '0' then rom_q(15 downto 8) := romrd_q(63 downto 56); end if;
				if TG68_LDS_N = '0' then rom_q(7 downto 0) := romrd_q(55 downto 48); end if;

			when others => null;
			end case;				
			if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
				hwrite(L, rom_q);
			elsif TG68_UDS_N = '0' then
				hwrite(L, rom_q(15 downto 8));
				write(L, string'("  "));
			else
				write(L, string'("  "));
				hwrite(L, rom_q(7 downto 0));
			end if;								
			write(L, string'("]"));
			writeline(F,L);			
		end if;		

	
		-- 68K RAM ACCESS
		if SDRC = SDRC_TG68 and ram68k_req = ram68k_ack then
			write(L, string'("68K "));
			if TG68_RNW = '0' then
				write(L, string'("WR"));
			else
				write(L, string'("RD"));
			end if;
			write(L, string'(" RAM-68K ["));
			hwrite(L, TG68_A(23 downto 0));
			write(L, string'("] = ["));
			if TG68_RNW = '0' then
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, TG68_DO);
				elsif TG68_UDS_N = '0' then
					hwrite(L, TG68_DO(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, TG68_DO(7 downto 0));
				end if;				
			else
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, ram68k_q);
				elsif TG68_UDS_N = '0' then
					hwrite(L, ram68k_q(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, ram68k_q(7 downto 0));
				end if;								
			end if;
			write(L, string'("]"));
			writeline(F,L);			
		end if;		

		
		-- Z80 RAM ACCESS
		if ZRC = ZRC_ACC3 and ZRCP = ZRCP_TG68 then
			write(L, string'("68K "));
			if TG68_RNW = '0' then
				write(L, string'("WR"));
			else
				write(L, string'("RD"));
			end if;
			write(L, string'(" RAM-Z80 ["));
			hwrite(L, TG68_A(23 downto 0));
			write(L, string'("] = ["));
			if TG68_RNW = '0' then
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, TG68_DO);
				elsif TG68_UDS_N = '0' then
					hwrite(L, TG68_DO(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, TG68_DO(7 downto 0));
				end if;				
			else
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, zram_q & zram_q);
				elsif TG68_UDS_N = '0' then
					hwrite(L, zram_q);
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, zram_q);
				end if;				
			end if;
			write(L, string'("]"));
			writeline(F,L);			
		end if;		

		
		-- 68K CTRL ACCESS
		if TG68_CTRL_SEL = '1' and TG68_CTRL_DTACK_N = '1' then
			write(L, string'("68K "));
			if TG68_RNW = '0' then
				write(L, string'("WR"));
			else
				write(L, string'("RD"));
			end if;
			write(L, string'("    CTRL ["));
			hwrite(L, TG68_A(23 downto 0));
			write(L, string'("] = ["));
			if TG68_RNW = '0' then
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, TG68_DO);
				elsif TG68_UDS_N = '0' then
					hwrite(L, TG68_DO(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, TG68_DO(7 downto 0));
				end if;				
			else
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					write(L, string'("????"));
				elsif TG68_UDS_N = '0' then
					write(L, string'("??"));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					write(L, string'("??"));
				end if;								
			end if;
			write(L, string'("]"));
			writeline(F,L);							
		end if;

		-- 68K I/O ACCESS
		if IOC = IOC_TG68_ACC and IO_DTACK_N = '0' then
			write(L, string'("68K "));
			if TG68_RNW = '0' then
				write(L, string'("WR"));
			else
				write(L, string'("RD"));
			end if;
			write(L, string'("     I/O ["));
			hwrite(L, TG68_A(23 downto 0));
			write(L, string'("] = ["));
			if TG68_RNW = '0' then
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, TG68_DO);
				elsif TG68_UDS_N = '0' then
					hwrite(L, TG68_DO(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, TG68_DO(7 downto 0));
				end if;				
			else
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, IO_DO);
				elsif TG68_UDS_N = '0' then
					hwrite(L, IO_DO(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, IO_DO(7 downto 0));
				end if;								
			end if;
			write(L, string'("]"));
			writeline(F,L);					
		end if;
		
		-- 68K VDP ACCESS
		if VDPC = VDPC_TG68_ACC and VDP_DTACK_N = '0' then
			write(L, string'("68K "));
			if TG68_RNW = '0' then
				write(L, string'("WR"));
			else
				write(L, string'("RD"));
			end if;
			write(L, string'("     VDP ["));
			hwrite(L, TG68_A(23 downto 0));
			write(L, string'("] = ["));
			if TG68_RNW = '0' then
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, TG68_DO);
				elsif TG68_UDS_N = '0' then
					hwrite(L, TG68_DO(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, TG68_DO(7 downto 0));
				end if;				
			else
				if TG68_UDS_N = '0' and TG68_LDS_N = '0' then
					hwrite(L, VDP_DO);
				elsif TG68_UDS_N = '0' then
					hwrite(L, VDP_DO(15 downto 8));
					write(L, string'("  "));
				else
					write(L, string'("  "));
					hwrite(L, VDP_DO(7 downto 0));
				end if;								
			end if;
			write(L, string'("]"));
			writeline(F,L);					
		end if;
		
	end if;
end process;
-- synthesis translate_on

end rtl;
