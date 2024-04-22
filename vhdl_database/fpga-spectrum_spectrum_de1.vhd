-- ZX Spectrum for Altera DE1
--
-- Copyright (c) 2009-2011 Mike Stirling
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
--
-- * Redistributions in synthesized form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
--
-- * Neither the name of the author nor the names of other contributors may
--   be used to endorse or promote products derived from this software without
--   specific prior written agreement from the author.
--
-- * License is granted for non-commercial use only.  A fee may not be charged
--   for redistributions as source code or in synthesized/hardware form without 
--   specific prior written agreement from the author.
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
-- Sinclair ZX Spectrum
--
-- Terasic DE1 top-level
--
-- (C) 2011 Mike Stirling

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Generic top-level entity for Altera DE1 board
entity spectrum_de1 is
generic (
	-- Model to generate
	-- 0 = 48 K
	-- 1 = 128 K
	-- 2 = +2A/+3
	MODEL				:	integer := 2;
	
	-- ROM offset
	-- The 4MB Flash is used in 16KB banks as a simple mechanism for
	-- different machines to address different parts of the ROM, saving
	-- on re-flashing each time a new machine is run on the board.
	-- This generic sets the upper 8 address bits.
	-- Note that the lower bits may be ignored by the implementation,
	-- e.g. where ROMs are bigger than 16K or where multiple banks
	-- are required.  In this case it is important to ensure that the
	-- ROM images are aligned correctly (such that these ignored bits are 0).
	--
	-- For the Spectrum the ROMs must be 16K, 32K or 64K aligned for
	-- the 48K, 128K and +3 respectively
	-- 48K
	--ROM_OFFSET			:	std_logic_vector(7 downto 0) := "00000000";
	-- 128K
	--ROM_OFFSET			:	std_logic_vector(7 downto 0) := "00000010";
	-- +3
	ROM_OFFSET			:	std_logic_vector(7 downto 0) := "00000100";
	
	-- ROM offset for ZXMMC+ external Flash banks
	-- Currently we decode 16 banks (256K) so this must be 256K aligned
	ZXMMC_ROM_OFFSET	:	std_logic_vector(7 downto 0) := "00010000"
	);
	
port (
	-- Clocks
	CLOCK_24	:	in	std_logic_vector(1 downto 0);
	CLOCK_27	:	in	std_logic_vector(1 downto 0);
	CLOCK_50	:	in	std_logic;
	EXT_CLOCK	:	in	std_logic;
	
	-- Switches
	SW			:	in	std_logic_vector(9 downto 0);
	-- Buttons
	KEY			:	in	std_logic_vector(3 downto 0);
	
	-- 7 segment displays
	HEX0		:	out	std_logic_vector(6 downto 0);
	HEX1		:	out	std_logic_vector(6 downto 0);
	HEX2		:	out	std_logic_vector(6 downto 0);
	HEX3		:	out	std_logic_vector(6 downto 0);
	-- Red LEDs
	LEDR		:	out	std_logic_vector(9 downto 0);
	-- Green LEDs
	LEDG		:	out	std_logic_vector(7 downto 0);
	
	-- VGA
	VGA_R		:	out	std_logic_vector(3 downto 0);
	VGA_G		:	out	std_logic_vector(3 downto 0);
	VGA_B		:	out	std_logic_vector(3 downto 0);
	VGA_HS		:	out	std_logic;
	VGA_VS		:	out	std_logic;
	
	-- Serial
	UART_RXD	:	in	std_logic;
	UART_TXD	:	out	std_logic;
	
	-- PS/2 Keyboard
	PS2_CLK		:	inout	std_logic;
	PS2_DAT		:	inout	std_logic;
	
	-- I2C
	I2C_SCLK	:	inout	std_logic;
	I2C_SDAT	:	inout	std_logic;
	
	-- Audio
	AUD_XCK		:	out		std_logic;
	AUD_BCLK	:	out		std_logic;
	AUD_ADCLRCK	:	out		std_logic;
	AUD_ADCDAT	:	in		std_logic;
	AUD_DACLRCK	:	out		std_logic;
	AUD_DACDAT	:	out		std_logic;
	
	-- SRAM
	SRAM_ADDR	:	out		std_logic_vector(17 downto 0);
	SRAM_DQ		:	inout	std_logic_vector(15 downto 0);
	SRAM_CE_N	:	out		std_logic;
	SRAM_OE_N	:	out		std_logic;
	SRAM_WE_N	:	out		std_logic;
	SRAM_UB_N	:	out		std_logic;
	SRAM_LB_N	:	out		std_logic;
	
	-- SDRAM
	DRAM_ADDR	:	out		std_logic_vector(11 downto 0);
	DRAM_DQ		:	inout	std_logic_vector(15 downto 0);
	DRAM_BA_0	:	in		std_logic;
	DRAM_BA_1	:	in		std_logic;
	DRAM_CAS_N	:	in		std_logic;
	DRAM_CKE	:	in		std_logic;
	DRAM_CLK	:	in		std_logic;
	DRAM_CS_N	:	in		std_logic;
	DRAM_LDQM	:	in		std_logic;
	DRAM_RAS_N	:	in		std_logic;
	DRAM_UDQM	:	in		std_logic;
	DRAM_WE_N	:	in		std_logic;
	
	-- Flash
	FL_ADDR		:	out		std_logic_vector(21 downto 0);
	FL_DQ		:	inout	std_logic_vector(7 downto 0);
	FL_RST_N	:	out		std_logic;
	FL_OE_N		:	out		std_logic;
	FL_WE_N		:	out		std_logic;
	FL_CE_N		:	out		std_logic;
	
	-- SD card (SPI mode)
	SD_nCS		:	out		std_logic;
	SD_MOSI		:	out		std_logic;
	SD_SCLK		:	out		std_logic;
	SD_MISO		:	in		std_logic;
	
	-- GPIO
	GPIO_0		:	inout	std_logic_vector(35 downto 0);
	GPIO_1		:	inout	std_logic_vector(35 downto 0)
	);
end entity;

architecture rtl of spectrum_de1 is

--------------------------------
-- PLL
-- 24 MHz input
-- 28 MHz master clock output
-- 24 MHz audio clock output+
--------------------------------

component pll_main IS
	PORT
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
end component;

-------------------
-- Clock enables
-------------------

component clocks is
port (
	-- 28 MHz master clock
	CLK				:	in std_logic;
	-- Master reset
	nRESET			:	in std_logic;
	
	-- 1.75 MHz clock enable for sound
	CLKEN_PSG		:	out	std_logic;
	-- 3.5 MHz clock enable (1 in 8)
	CLKEN_CPU		:	out std_logic;
	-- 14 MHz clock enable (out of phase with CPU)
	CLKEN_VID		:	out std_logic
	);
end component;


--------------
-- Debugger
--------------

component debugger is
generic (
	-- Set this for a reasonable half flash duration relative to the
	-- clock frequency
	flash_divider	:	natural := 24
	);
port (
	CLOCK		:	in	std_logic;
	nRESET		:	in	std_logic;
	-- CPU clock enable in
	CLKEN_IN	:	in	std_logic;
	-- Gated clock enable back out to CPU
	CLKEN_OUT	:	out	std_logic;
	-- CPU IRQ in
	nIRQ_IN		:	in	std_logic;
	-- Gated IRQ back out to CPU (no interrupts when single stepping)
	nIRQ_OUT	:	out	std_logic;
	
	-- CPU
	A_CPU		:	in	std_logic_vector(15 downto 0);
	R_nW		:	in	std_logic;
	SYNC		:	in	std_logic;
	
	-- Aux bus input for display in hex
	AUX_BUS		:	in	std_logic_vector(15 downto 0);
	
	-- Controls
	-- RUN or HALT CPU
	RUN			:	in	std_logic;
	-- Push button to single-step in HALT mode
	nSTEP		:	in	std_logic;
	-- Push button to cycle display mode
	nMODE		:	in	std_logic;
	-- Push button to cycle display digit in edit mode
	nDIGIT		:	in	std_logic;
	-- Push button to cycle digit value in edit mode
	nSET		:	in	std_logic;
	
	-- Output to display
	DIGIT3		:	out	std_logic_vector(6 downto 0);
	DIGIT2		:	out	std_logic_vector(6 downto 0);
	DIGIT1		:	out	std_logic_vector(6 downto 0);
	DIGIT0		:	out	std_logic_vector(6 downto 0);
	
	LED_BREAKPOINT	:	out	std_logic;
	LED_WATCHPOINT	:	out	std_logic
	);
end component;

---------
-- CPU
---------

component T80se is
	generic(
		Mode : integer := 0;    -- 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB
		T2Write : integer := 0;  -- 0 => WR_n active in T3, /=0 => WR_n active in T2
		IOWait : integer := 1   -- 0 => Single cycle I/O, 1 => Std I/O cycle
	);
	port(
		RESET_n         : in  std_logic;
		CLK_n           : in  std_logic;
		CLKEN           : in  std_logic;
		WAIT_n          : in  std_logic;
		INT_n           : in  std_logic;
		NMI_n           : in  std_logic;
		BUSRQ_n         : in  std_logic;
		M1_n            : out std_logic;
		MREQ_n          : out std_logic;
		IORQ_n          : out std_logic;
		RD_n            : out std_logic;
		WR_n            : out std_logic;
		RFSH_n          : out std_logic;
		HALT_n          : out std_logic;
		BUSAK_n         : out std_logic;
		A               : out std_logic_vector(15 downto 0);
		DI              : in  std_logic_vector(7 downto 0);
		DO              : out std_logic_vector(7 downto 0)
	);
end component;

--------------
-- ULA port
--------------

component ula_port is
port (
	CLK		:	in	std_logic;
	nRESET	:	in	std_logic;
	
	-- CPU interface with separate read/write buses
	D_IN	:	in	std_logic_vector(7 downto 0);
	D_OUT	:	out	std_logic_vector(7 downto 0);
	ENABLE	:	in	std_logic;
	nWR		:	in	std_logic;
	
	BORDER_OUT	:	out	std_logic_vector(2 downto 0);
	EAR_OUT		:	out	std_logic;
	MIC_OUT		:	out std_logic;
	
	KEYB_IN		:	in 	std_logic_vector(4 downto 0);
	EAR_IN		:	in	std_logic	
	);
end component;

---------------
-- ULA video
---------------

component video is
port(
	-- Master clock (28 MHz)
	CLK			:	in std_logic;
	-- Video domain clock enable (14 MHz)
	CLKEN		:	in std_logic;
	-- Master reset
	nRESET 		: 	in std_logic;

	-- Mode
	VGA			:	in std_logic;

	-- Memory interface
	VID_A		:	out	std_logic_vector(12 downto 0);
	VID_D_IN	:	in	std_logic_vector(7 downto 0);
	nVID_RD	:	out	std_logic;
	nWAIT		:	out	std_logic;
	
	-- IO interface
	BORDER_IN	:	in	std_logic_vector(2 downto 0);

	-- Video outputs
	R			:	out	std_logic_vector(3 downto 0);
	G			:	out	std_logic_vector(3 downto 0);
	B			:	out	std_logic_vector(3 downto 0);
	nVSYNC		:	out std_logic;
	nHSYNC		:	out std_logic;
	nCSYNC		:	out	std_logic;
	nHCSYNC		:	out std_logic;
	IS_BORDER	: 	out std_logic;
	IS_VALID	:	out std_logic;
	
	-- Clock outputs, might be useful
	PIXCLK		:	out std_logic;
	FLASHCLK	: 	out std_logic;
	
	-- Interrupt to CPU (asserted for 32 T-states, 64 ticks)
	nIRQ		:	out	std_logic
);
end component;

--------------
-- Keyboard
--------------

component keyboard is
port (
	CLK			:	in	std_logic;
	nRESET		:	in	std_logic;

	-- PS/2 interface
	PS2_CLK		:	in	std_logic;
	PS2_DATA	:	in	std_logic;
	
	-- CPU address bus (row)
	A			:	in	std_logic_vector(15 downto 0);
	-- Column outputs to ULA
	KEYB		:	out	std_logic_vector(4 downto 0)
	);
end component;

-----------
-- Sound
-----------

component YM2149 is
  port (
  -- data bus
  I_DA                : in  std_logic_vector(7 downto 0);
  O_DA                : out std_logic_vector(7 downto 0);
  O_DA_OE_L           : out std_logic;
  -- control
  I_A9_L              : in  std_logic;
  I_A8                : in  std_logic;
  I_BDIR              : in  std_logic;
  I_BC2               : in  std_logic;
  I_BC1               : in  std_logic;
  I_SEL_L             : in  std_logic;

  O_AUDIO             : out std_logic_vector(7 downto 0);
  -- port a
  I_IOA               : in  std_logic_vector(7 downto 0);
  O_IOA               : out std_logic_vector(7 downto 0);
  O_IOA_OE_L          : out std_logic;
  -- port b
  I_IOB               : in  std_logic_vector(7 downto 0);
  O_IOB               : out std_logic_vector(7 downto 0);
  O_IOB_OE_L          : out std_logic;
  --
  ENA                 : in  std_logic;
  RESET_L             : in  std_logic;
  CLK                 : in  std_logic
  );
end component;

component i2s_intf is
generic(
	mclk_rate : positive := 12000000;
	sample_rate : positive := 8000;
	preamble : positive := 1; -- I2S
	word_length : positive := 16
	);

port (
	-- 2x MCLK in (e.g. 24 MHz for WM8731 USB mode)
	CLK			:	in	std_logic;
	nRESET		:	in	std_logic;
	
	-- Parallel IO
	PCM_INL		:	out	std_logic_vector(word_length - 1 downto 0);
	PCM_INR		:	out	std_logic_vector(word_length - 1 downto 0);
	PCM_OUTL	:	in	std_logic_vector(word_length - 1 downto 0);
	PCM_OUTR	:	in	std_logic_vector(word_length - 1 downto 0);
	
	-- Codec interface (right justified mode)
	-- MCLK is generated at half of the CLK input
	I2S_MCLK	:	out	std_logic;
	-- LRCLK is equal to the sample rate and is synchronous to
	-- MCLK.  It must be related to MCLK by the oversampling ratio
	-- given in the codec datasheet.
	I2S_LRCLK	:	out	std_logic;
	
	-- Data is shifted out on the falling edge of BCLK, sampled
	-- on the rising edge.  The bit rate is determined such that
	-- it is fast enough to fit preamble + word_length bits into
	-- each LRCLK half cycle.  The last cycle of each word may be 
	-- stretched to fit to LRCLK.  This is OK at least for the 
	-- WM8731 codec.
	-- The first falling edge of each timeslot is always synchronised
	-- with the LRCLK edge.
	I2S_BCLK	:	out	std_logic;
	-- Output bitstream
	I2S_DOUT	:	out	std_logic;
	-- Input bitstream
	I2S_DIN		:	in	std_logic
	);
end component;

component i2c_loader is
generic (
	-- Address of slave to be loaded
	device_address : integer := 16#1a#;
	-- Number of retries to allow before stopping
	num_retries : integer := 0;
	-- Length of clock divider in bits.  Resulting bus frequency is
	-- CLK/2^(log2_divider + 2)
	log2_divider : integer := 6
);

port (
	CLK			:	in	std_logic;
	nRESET		:	in	std_logic;
	
	I2C_SCL		:	inout	std_logic;
	I2C_SDA		:	inout	std_logic;
	
	IS_DONE		:	out std_logic;
	IS_ERROR	:	out	std_logic
	);
end component;

-------------------
-- MMC interface
-------------------

component zxmmc is
port (
	CLOCK		:	in	std_logic;
	nRESET		:	in	std_logic;
	CLKEN		:	in	std_logic;
	
	-- Bus interface
	ENABLE		:	in	std_logic;
	-- 0 - W  - Card chip selects (active low)
	-- 1 - RW - SPI tx/rx data register
	-- 2 - Not used
	-- 3 - RW - Paging control register
	RS			:	in	std_logic_vector(1 downto 0);
	nWR			:	in	std_logic;
	DI			:	in	std_logic_vector(7 downto 0);
	DO			:	out	std_logic_vector(7 downto 0);
	
	-- SD card interface
	SD_CS0		:	out	std_logic;
	SD_CS1		:	out	std_logic;
	SD_CLK		:	out	std_logic;
	SD_MOSI		:	out	std_logic;
	SD_MISO		:	in	std_logic;
	
	-- Paging control for external RAM/ROM banks
	EXT_WR_EN	:	out	std_logic; -- Enable writes to external RAM/ROM
	EXT_RD_EN	:	out	std_logic; -- Enable reads from external RAM/ROM (overlay internal ROM)
	EXT_ROM_nRAM	:	out	std_logic; -- Select external ROM or RAM banks
	EXT_BANK	:	out	std_logic_vector(4 downto 0); -- Selected bank number
	
	-- DIP switches (reset values for corresponding bits above)
	INIT_RD_EN	:	in	std_logic;
	INIT_ROM_nRAM	:	in	std_logic
	);
end component;

-------------
-- Signals
-------------

-- Master clock - 28 MHz
signal pll_reset		:	std_logic;
signal pll_locked		:	std_logic;
signal clock			:	std_logic;
signal audio_clock		:	std_logic;
signal reset_n			:	std_logic;

-- Clock control
signal psg_clken		:	std_logic;
signal cpu_clken		:	std_logic;
signal vid_clken		:	std_logic;

-- Address decoding
signal ula_enable		:	std_logic; -- all even IO addresses
signal rom_enable		:	std_logic; -- 0x0000-0x3FFF
signal ram_enable		:	std_logic; -- 0x4000-0xFFFF
-- 128K extensions
signal page_enable		:	std_logic; -- all odd IO addresses with A15 and A1 clear (and A14 set in +3 mode)
signal psg_enable		:	std_logic; -- all odd IO addresses with A15 set and A1 clear
-- +3 extensions
signal plus3_enable		:	std_logic; -- A15, A14, A13, A1 clear, A12 set.
-- ZXMMC
signal zxmmc_enable		:	std_logic; -- A4-A0 set

-- 128K paging register (with default values for systems that don't have it)
signal page_reg_disable	:	std_logic := '1'; -- bit 5
signal page_rom_sel		:	std_logic := '0'; -- bit 4
signal page_shadow_scr	:	std_logic := '0'; -- bit 3
signal page_ram_sel		:	std_logic_vector(2 downto 0) := "000"; -- bits 2:0

-- +3 extensions (with default values for systems that don't have it)
signal plus3_printer_strobe	:	std_logic := '0'; -- bit 4
signal plus3_disk_motor	:	std_logic := '0'; -- bit 3
signal plus3_page		:	std_logic_vector(1 downto 0) := "00"; -- bits 2:1
signal plus3_special	:	std_logic := '0'; -- bit 0

-- RAM bank actually being accessed
signal ram_page			:	std_logic_vector(2 downto 0);

-- Debugger connections
signal debug_cpu_clken	:	std_logic;
signal debug_irq_in_n	:	std_logic;
signal debug_fetch		:	std_logic;
signal debug_aux		:	std_logic_vector(15 downto 0);

-- SRAM bus high/low byte mux
signal sram_di			:	std_logic_vector(7 downto 0);

-- CPU signals
signal cpu_wait_n	:	std_logic;
signal cpu_irq_n	:	std_logic;
signal cpu_nmi_n	:	std_logic;
signal cpu_busreq_n	:	std_logic;
signal cpu_m1_n		:	std_logic;
signal cpu_mreq_n	:	std_logic;
signal cpu_ioreq_n	:	std_logic;
signal cpu_rd_n		:	std_logic;
signal cpu_wr_n		:	std_logic;
signal cpu_rfsh_n	:	std_logic;
signal cpu_halt_n	:	std_logic;
signal cpu_busack_n	:	std_logic;
signal cpu_a		:	std_logic_vector(15 downto 0);
signal cpu_di		:	std_logic_vector(7 downto 0);
signal cpu_do		:	std_logic_vector(7 downto 0);

-- ULA port signals
signal ula_do		:	std_logic_vector(7 downto 0);
signal ula_border	:	std_logic_vector(2 downto 0);
signal ula_ear_out	:	std_logic;
signal ula_mic_out	:	std_logic;
signal ula_ear_in	:	std_logic;
signal ula_rom_sel	:	std_logic;
signal ula_shadow_vid	:	std_logic;
signal ula_ram_page	:	std_logic_vector(2 downto 0);

-- ULA video signals
signal vid_a		:	std_logic_vector(12 downto 0);
signal vid_di		:	std_logic_vector(7 downto 0);
signal vid_rd_n		:	std_logic;
signal vid_wait_n	:	std_logic;
signal vid_r_out	:	std_logic_vector(3 downto 0);
signal vid_g_out	:	std_logic_vector(3 downto 0);
signal vid_b_out	:	std_logic_vector(3 downto 0);
signal vid_vsync_n	:	std_logic;
signal vid_hsync_n	:	std_logic;
signal vid_csync_n	:	std_logic;
signal vid_hcsync_n	:	std_logic;
signal vid_is_border	:	std_logic;
signal vid_is_valid	:	std_logic;
signal vid_pixclk	:	std_logic;
signal vid_flashclk	:	std_logic;
signal vid_irq_n	:	std_logic;

-- Keyboard
signal keyb			:	std_logic_vector(4 downto 0);

-- Sound (PSG default values for systems that don't have it)
signal psg_do		:	std_logic_vector(7 downto 0) := "11111111";
signal psg_bdir		:	std_logic;
signal psg_bc1		:	std_logic;
signal psg_aout		:	std_logic_vector(7 downto 0) := "00000000";
signal pcm_lrclk	:	std_logic;
signal pcm_outl		:	std_logic_vector(15 downto 0);
signal pcm_outr		:	std_logic_vector(15 downto 0);
signal pcm_inl		:	std_logic_vector(15 downto 0);
signal pcm_inr		:	std_logic_vector(15 downto 0);

-- ZXMMC interface
signal zxmmc_do		:	std_logic_vector(7 downto 0);

signal zxmmc_sclk	:	std_logic;
signal zxmmc_mosi	:	std_logic;
signal zxmmc_miso	:	std_logic;
signal zxmmc_cs0	:	std_logic;

-- ZXMMC+ external ROM/RAM interface (for ResiDOS)
signal zxmmc_wr_en	:	std_logic;
signal zxmmc_rd_en	:	std_logic;
signal zxmmc_rom_nram	:	std_logic;
signal zxmmc_bank	:	std_logic_vector(4 downto 0);

begin
	-- 28 MHz master clock
	pll: pll_main port map (
		pll_reset,
		CLOCK_24(0),
		clock,
		audio_clock,
		pll_locked
		);
		
	-- Clock enable logic
	clken: clocks port map (
		clock,
		reset_n,
		psg_clken,
		cpu_clken,
		vid_clken
		);
		
--	-- Hardware debugger block (single-step, breakpoints)
--	debug:	debugger port map (
--		clock,
--		reset_n,
--		cpu_clken,
--		debug_cpu_clken,
--		debug_irq_in_n,
--		cpu_irq_n,
--		cpu_a(15 downto 0), cpu_wr_n, debug_fetch,
--		debug_aux,
--		SW(8), -- RUN
--		KEY(3), -- STEP
--		KEY(2), -- MODE
--		KEY(1), -- DIGIT
--		KEY(0), -- SET
--		HEX3, HEX2, HEX1, HEX0,
--		LEDR(3), -- BREAKPOINT
--		LEDR(2) -- WATCHPOINT
--		);
--	debug_fetch <= not (cpu_m1_n or cpu_mreq_n);
--	-- VSYNC interrupt routed through debugger
--	debug_irq_in_n <= vid_irq_n;	
		
	-- CPU
	cpu: T80se port map (
		reset_n, clock, cpu_clken, --debug_cpu_clken,
		cpu_wait_n, cpu_irq_n, cpu_nmi_n,
		cpu_busreq_n, cpu_m1_n,
		cpu_mreq_n, cpu_ioreq_n,
		cpu_rd_n, cpu_wr_n,
		cpu_rfsh_n, cpu_halt_n, cpu_busack_n,
		cpu_a, cpu_di, cpu_do
		);
	-- VSYNC interrupt routed to CPU
	cpu_irq_n <= vid_irq_n;
	-- Unused CPU input signals
	cpu_wait_n <= '1';
	cpu_nmi_n <= '1';
	cpu_busreq_n <= '1';
		
	-- Keyboard
	kb:	keyboard port map (
		clock, reset_n,
		PS2_CLK, PS2_DAT,
		cpu_a, keyb
		);
		
	-- ULA port
	ula: ula_port port map (
		clock, reset_n,
		cpu_do, ula_do,
		ula_enable, cpu_wr_n,
		ula_border,
		ula_ear_out, ula_mic_out,
		keyb,
		ula_ear_in
		);
		
	-- ULA video
	vid: video port map (
		clock, vid_clken, reset_n,
		SW(7),
		vid_a, vid_di, vid_rd_n, vid_wait_n,
		ula_border,
		vid_r_out, vid_g_out, vid_b_out,
		vid_vsync_n, vid_hsync_n,
		vid_csync_n, vid_hcsync_n,
		vid_is_border, vid_is_valid,
		vid_pixclk, vid_flashclk,
		vid_irq_n
		);
		
	-- Sound
	sound_128k: if model /= 0 generate
		-- PSG only on 128K and above
		psg : YM2149 port map (
			cpu_do, psg_do, open,
			'0', -- /A9 pulled down internally
			'1', -- A8 pulled up on Spectrum
			psg_bdir,
			'1', -- BC2 pulled up on Spectrum
			psg_bc1,
			'1', -- /SEL is high for AY-3-8912 compatibility
			psg_aout,
			(others => '0'), open, open, -- port A unused (keypad and serial on Spectrum 128K)
			(others => '0'), open, open, -- port B unused (non-existent on AY-3-8912)
			psg_clken,
			reset_n,
			clock
			);
		psg_bdir <= psg_enable and cpu_rd_n;
		psg_bc1 <= psg_enable and cpu_a(14);
	end generate;
	
	i2s: i2s_intf port map (
		audio_clock, reset_n,
		pcm_inl, pcm_inr,
		pcm_outl, pcm_outr,
		AUD_XCK, pcm_lrclk,
		AUD_BCLK, AUD_DACDAT, AUD_ADCDAT
		);
	AUD_DACLRCK <= pcm_lrclk;
	AUD_ADCLRCK <= pcm_lrclk;
	
	i2c: i2c_loader 
		generic map (
			log2_divider => 7
		)
		port map (
			clock, reset_n,
			I2C_SCLK, I2C_SDAT,
			LEDR(1), -- IS_DONE
			LEDR(0) -- IS_ERROR
		);
		
	-- ZXMMC interface
	mmc: zxmmc port map (
		clock, reset_n, cpu_clken,
		zxmmc_enable, cpu_a(6 downto 5), -- A6/A5 selects register
		cpu_wr_n, cpu_do, zxmmc_do,
		zxmmc_cs0, open,
		zxmmc_sclk, zxmmc_mosi, zxmmc_miso,
		zxmmc_wr_en, zxmmc_rd_en, zxmmc_rom_nram,
		zxmmc_bank,
		SW(1), SW(0)
		);
	SD_nCS <= zxmmc_cs0;
	SD_SCLK <= zxmmc_sclk;
	SD_MOSI <= zxmmc_mosi;
	zxmmc_miso <= SD_MISO;
	GPIO_0(0) <= zxmmc_cs0;
	GPIO_0(1) <= zxmmc_sclk;
	GPIO_0(2) <= zxmmc_mosi;
	GPIO_0(3) <= zxmmc_miso;
		
	-- Asynchronous reset
	-- PLL is reset by external reset switch
	pll_reset <= not SW(9);
	-- System is reset by external reset switch or PLL being out of lock
	reset_n <= not (pll_reset or not pll_locked);
	
	-- Address decoding.  Z80 has separate IO and memory address space
	-- IO ports (nominal addresses - incompletely decoded):
	-- 0xXXFE R/W = ULA
	-- 0x7FFD W   = 128K paging register
	-- 0xFFFD W   = 128K AY-3-8912 register select
	-- 0xFFFD R   = 128K AY-3-8912 register read
	-- 0xBFFD W   = 128K AY-3-8912 register write
	-- 0x1FFD W   = +3 paging and control register
	-- 0x2FFD R   = +3 FDC status register
	-- 0x3FFD R/W = +3 FDC data register
	-- 0xXXXF R/W = ZXMMC interface
	-- FIXME: Revisit this - could be neater
	ula_enable <= (not cpu_ioreq_n) and not cpu_a(0); -- all even IO addresses
	psg_enable <= (not cpu_ioreq_n) and cpu_a(0) and cpu_a(15) and not cpu_a(1);
	zxmmc_enable <= (not cpu_ioreq_n) and cpu_a(4) and cpu_a(3) and cpu_a(2) and cpu_a(1) and cpu_a(0);
	addr_decode_128k: if model /= 2 generate
		page_enable <= (not cpu_ioreq_n) and cpu_a(0) and not (cpu_a(15) or cpu_a(1));
	end generate;
	addr_decode_plus3: if model = 2 generate
		-- Paging register address decoding is slightly stricter on the +3
		page_enable <= (not cpu_ioreq_n) and cpu_a(0) and cpu_a(14) and not (cpu_a(15) or cpu_a(1));
		plus3_enable <= (not cpu_ioreq_n) and cpu_a(0) and cpu_a(12) and not (cpu_a(15) or cpu_a(14) or cpu_a(13) or cpu_a(1));
	end generate;
	
	-- ROM is enabled between 0x0000 and 0x3fff except in +3 special mode
	rom_enable <= (not cpu_mreq_n) and not (plus3_special or cpu_a(15) or cpu_a(14));
	-- RAM is enabled for any memory request when ROM isn't enabled
	ram_enable <= not (cpu_mreq_n or rom_enable);
	ram_page_128k: if model /= 2 generate
		-- 128K has pageable RAM at 0xc000
		ram_page <=
			page_ram_sel when cpu_a(15 downto 14) = "11" else -- Selectable bank at 0xc000
			cpu_a(14) & cpu_a(15 downto 14); -- A=bank: 00=XXX, 01=101, 10=010, 11=XXX
	end generate;
	ram_page_plus3: if model = 2 generate
		-- +3 has various additional modes in addition to "normal" mode, which is
		-- the same as the 128K
		-- Extra modes assign RAM banks as follows:
		-- plus3_page    0000    4000    8000    C000
		-- 00            0       1       2       3
		-- 01            4       5       6       7
		-- 10            4       5       6       3
		-- 11            4       7       6       3
		-- NORMAL        ROM     5       2       PAGED
		ram_page <=
			page_ram_sel when plus3_special = '0' and cpu_a(15 downto 14) = "11" else
			cpu_a(14) & cpu_a(15 downto 14) when plus3_special = '0' else
			"0" & cpu_a(15 downto 14) when plus3_special = '1' and plus3_page = "00" else
			"1" & cpu_a(15 downto 14) when plus3_special = '1' and plus3_page = "01" else
			(not(cpu_a(15) and cpu_a(14))) & cpu_a(15 downto 14) when plus3_special = '1' and plus3_page = "10" else
			(not(cpu_a(15) and cpu_a(14))) & (cpu_a(15) or cpu_a(14)) & cpu_a(14);
	end generate;
		
	-- CPU data bus mux
	cpu_di <=
		-- System RAM
		sram_di when ram_enable = '1' else
		-- External (ZXMMC+) RAM at 0x0000-0x3fff when enabled
		-- This overlays the internal ROM
		sram_di when rom_enable = '1' and zxmmc_rd_en = '1' and zxmmc_rom_nram = '0' else
		-- Internal ROM or external (ZXMMC+) ROM at 0x0000-0x3fff
		FL_DQ when rom_enable = '1' else
		-- IO ports
		ula_do when ula_enable = '1' else
		psg_do when psg_enable = '1' else
		zxmmc_do when zxmmc_enable = '1' else
		-- Idle bus
		(others => '1');
	
	-- ROMs are in external flash starting at 0x20000
	-- (lower addresses contain the BBC ROMs)
	FL_RST_N <= reset_n;
	FL_CE_N <= '0';
	FL_OE_N <= '0';
	FL_WE_N <= '1';
	rom_48k: if model = 0 generate
		-- 48K
		FL_ADDR <= 
			-- Overlay external ROMs when enabled
			ZXMMC_ROM_OFFSET(7 downto 4) & zxmmc_bank(3 downto 0) & cpu_a(13 downto 0)
			when zxmmc_rd_en = '1' else
			-- Otherwise access the internal ROM
			ROM_OFFSET & cpu_a(13 downto 0);
	end generate;
	rom_128k: if model = 1 generate
		-- 128K
		FL_ADDR <= 
			-- Overlay external ROMs when enabled
			ZXMMC_ROM_OFFSET(7 downto 4) & zxmmc_bank(3 downto 0) & cpu_a(13 downto 0)
			when zxmmc_rd_en = '1' else
			-- Otherwise access the internal ROMs
			ROM_OFFSET(7 downto 1) & page_rom_sel & cpu_a(13 downto 0);
	end generate;
	rom_plus3: if model = 2 generate
		-- +3
		FL_ADDR <= 
			-- Overlay external ROMs when enabled
			ZXMMC_ROM_OFFSET(7 downto 4) & zxmmc_bank(3 downto 0) & cpu_a(13 downto 0)
			when zxmmc_rd_en = '1' else
			-- Otherwise access the internal ROMs		
			ROM_OFFSET(7 downto 2) & plus3_page(1) & page_rom_sel & cpu_a(13 downto 0);
	end generate;

	-- SRAM bus
	SRAM_CE_N <= '0';
	SRAM_OE_N <= '0';
	-- SRAM high/low byte mux
	sram_di <= SRAM_DQ(15 downto 8) when cpu_a(0) = '1' else
		SRAM_DQ(7 downto 0); -- CPU data input
	vid_di <= SRAM_DQ(15 downto 8) when vid_a(0) = '1' else
		SRAM_DQ(7 downto 0); -- Video data input
	
	-- Synchronous outputs to SRAM
	process(clock,reset_n)
	variable ext_ram_write : std_logic; -- External RAM (ZXMMC+)
	variable int_ram_write : std_logic; -- Internal RAM
	variable sram_write : std_logic;
	begin
		ext_ram_write := (rom_enable and zxmmc_wr_en and not zxmmc_rom_nram) and not cpu_wr_n;
		int_ram_write := ram_enable and not cpu_wr_n;
		sram_write := int_ram_write or ext_ram_write;
	
		if reset_n = '0' then
			SRAM_WE_N <= '1';
			SRAM_UB_N <= '1';
			SRAM_LB_N <= '1';
			SRAM_DQ <= (others => 'Z');
		elsif rising_edge(clock) then
			-- Default to inputs
			SRAM_DQ <= (others => 'Z');
			
			-- Register SRAM signals to outputs (clock must be at least 2x CPU clock)
			if vid_clken = '1' then
				-- Fetch data from previous CPU cycle
				-- Select upper or lower byte depending on LSb of address
				SRAM_UB_N <= not cpu_a(0);
				SRAM_LB_N <= cpu_a(0);
				SRAM_WE_N <= not sram_write;
				if rom_enable = '0' then
					-- Normal RAM access at 0x4000-0xffff
					-- 16-bit address
					SRAM_ADDR <= "00" & ram_page & cpu_a(13 downto 1);
				else
					-- ZXMMC+ external RAM access (16 banks of 16KB)
					-- at 0x0000-0x3fff
					-- 16-bit address
					SRAM_ADDR <= "1" & zxmmc_bank(3 downto 0) & cpu_a(13 downto 1);
				end if;
				if sram_write = '1' then
					SRAM_DQ(15 downto 8) <= cpu_do;
					SRAM_DQ(7 downto 0) <= cpu_do;
				end if;
			else
				-- Fetch data from previous display cycle
				-- Because we have time division instead of bus contention
				-- we don't bother using the vid_rd_n signal from the ULA
				-- No writes here so just enable both upper and lower bytes and let
				-- the bus mux select the right one
				SRAM_UB_N <= '0';
				SRAM_LB_N <= '0';
				SRAM_WE_N <= '1';
				if page_shadow_scr = '1' then
					-- Video from bank 7 (128K/+3)
					-- 16-bit address, LSb selects high/low byte
					SRAM_ADDR <= "001110" & vid_a(12 downto 1);
				else
					-- Video from bank 5
					-- 16-bit address, LSb selects high/low byte
					SRAM_ADDR <= "001010" & vid_a(12 downto 1);
				end if;
			end if;
		end if;
	end process;
	
	page_reg_128k: if model /= 0 generate
		-- 128K paging register
		process(clock,reset_n)
		begin
			if reset_n = '0' then
				page_reg_disable <= '0';
				page_rom_sel <= '0';
				page_shadow_scr <= '0';
				page_ram_sel <= (others => '0');
			elsif rising_edge(clock) then
				if page_enable = '1' and page_reg_disable = '0' and cpu_wr_n = '0' then
					page_reg_disable <= cpu_do(5);
					page_rom_sel <= cpu_do(4);
					page_shadow_scr <= cpu_do(3);
					page_ram_sel <= cpu_do(2 downto 0);
				end if;
			end if;
		end process;
	end generate;
	
	plus3_reg: if model = 2 generate
		-- +3 paging and control register
		process(clock,reset_n)
		begin
			if reset_n = '0' then
				plus3_printer_strobe <= '0';
				plus3_disk_motor <= '0';
				plus3_page <= (others => '0');
				plus3_special <= '0';
			elsif rising_edge(clock) then
				-- FIXME: Does this get disabled by the page_reg_disable bit?
				if plus3_enable = '1' and cpu_wr_n = '0' then
					plus3_printer_strobe <= cpu_do(4);
					plus3_disk_motor <= cpu_do(3);
					plus3_page <= cpu_do(2 downto 1);
					plus3_special <= cpu_do(0);
				end if;
			end if;
		end process;
	end generate;
	
	-- Connect audio to PCM interface
	pcm_outl <= ula_ear_out & psg_aout & ula_mic_out & "000000";
	pcm_outr <= ula_ear_out & psg_aout & ula_mic_out & "000000";
	
	-- Hysteresis for EAR input (should help reliability)
	process(clock)
	variable in_val : integer;
	begin
		in_val := to_integer(signed(pcm_inl));
		
		if rising_edge(clock) then
			if in_val < -15 then
				ula_ear_in <= '0';
			elsif in_val > 15 then
				ula_ear_in <= '1';
			end if;
		end if;
	end process;
	
	-- Connect ULA to video output
	VGA_R <= vid_r_out;
	VGA_G <= vid_g_out;
	VGA_B <= vid_b_out;
	VGA_HS <= vid_hcsync_n;
	VGA_VS <= vid_vsync_n;
end architecture;
