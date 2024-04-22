--
--
--  ZPUINO implementation on Gadget Factory 'Papilio Pro' Board
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.zpu_config.all;
use work.pad.all;
use work.wishbonepkg.all;
use work.papilio_pkg.all;

entity ZPUino_Papilio_Pro_V2_blackbox is
  port (
    CLK:        in std_logic;
	
	 
	 --Clock outputs to be used in schematic
	 clk_96Mhz:        out std_logic;	--This is the clock that the system runs on.
	 clk_1Mhz:        out std_logic;		--This is a 1Mhz clock for symbols like the C64 SID chip.
	 clk_osc_32Mhz:   out std_logic;		--This is the 32Mhz clock from external oscillator.

    -- Connection to the main SPI flash
    SPI_SCK:    out std_logic;
    SPI_MISO:   in std_logic;
    SPI_MOSI:   out std_logic;
    SPI_CS:     out std_logic;

	 gpio_bus_in : in std_logic_vector(200 downto 0);
	 gpio_bus_out : out std_logic_vector(200 downto 0);

    -- UART (FTDI) connection
    TXD:        out std_logic;
    RXD:        in std_logic;
	
	 -- SDRAM controller
	 sram_wb_clk_i: out std_logic;
	 sram_wb_rst_i: out std_logic;

    sram_wb_dat_o: in std_logic_vector(wordSize-1 downto 0);
    sram_wb_dat_i: out std_logic_vector(wordSize-1 downto 0);
    sram_wb_adr_i: out std_logic_vector(maxAddrBitIncIO downto 0);
    sram_wb_we_i:  out std_logic;
    sram_wb_cyc_i: out std_logic;
    sram_wb_stb_i: out std_logic;
    sram_wb_sel_i: out std_logic_vector(3 downto 0);
    sram_wb_ack_o: in std_logic;
    sram_wb_stall_o: in std_logic;
	
    -- extra clocking
    clk_off_3ns: out std_logic; 	

    -- The LED
    LED:        out std_logic;
	
	 --There are more bits in the address for this wishbone connection
	 wishbone_slot_video_in : in std_logic_vector(100 downto 0);
	 wishbone_slot_video_out : out std_logic_vector(100 downto 0);
	 --vgaclkout: out std_logic;	

	 --Input and output reversed for the master
	 wishbone_slot_5_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_5_out : in std_logic_vector(100 downto 0);
	 
	 wishbone_slot_6_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_6_out : in std_logic_vector(100 downto 0);

	 wishbone_slot_8_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_8_out : in std_logic_vector(100 downto 0);

	 wishbone_slot_9_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_9_out : in std_logic_vector(100 downto 0);

	 wishbone_slot_10_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_10_out : in std_logic_vector(100 downto 0);

	 wishbone_slot_11_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_11_out : in std_logic_vector(100 downto 0);

	 wishbone_slot_12_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_12_out : in std_logic_vector(100 downto 0);

	 wishbone_slot_13_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_13_out : in std_logic_vector(100 downto 0);

	 wishbone_slot_14_in : out std_logic_vector(100 downto 0);
	 wishbone_slot_14_out : in std_logic_vector(100 downto 0)

--	 wishbone_slot_15_in : out std_logic_vector(61 downto 0);
--	 wishbone_slot_15_out : in std_logic_vector(33 downto 0)	 
	
	
 	
  );
end entity ZPUino_Papilio_Pro_V2_blackbox;

architecture behave of ZPUino_Papilio_Pro_V2_blackbox is

  component zpuino_debug_jtag_spartan6 is
  port (
    jtag_data_chain_in: in std_logic_vector(98 downto 0);
    jtag_ctrl_chain_out: out std_logic_vector(11 downto 0)
  );
  end component;

  signal jtag_data_chain_in: std_logic_vector(98 downto 0);
  signal jtag_ctrl_chain_out: std_logic_vector(11 downto 0);

  component clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    clkout1: out std_logic;
    clkout2: out std_logic;
	clk_1Mhz_out: out std_logic;
	clk_osc_32Mhz: out std_logic;
	clk27: out std_logic;
	clk42:   out std_logic;
    rstout: out std_logic
  );
  end component;

  component zpuino_serialreset is
  generic (
    SYSTEM_CLOCK_MHZ: integer := 96
  );
  port (
    clk:      in std_logic;
    rx:       in std_logic;
    rstin:    in std_logic;
    rstout:   out std_logic
  );
  end component zpuino_serialreset;

  component wb_bootloader is
  port (
    wb_clk_i:   in std_logic;
    wb_rst_i:   in std_logic;

    wb_dat_o:   out std_logic_vector(31 downto 0);
    wb_adr_i:   in std_logic_vector(11 downto 2);
    wb_cyc_i:   in std_logic;
    wb_stb_i:   in std_logic;
    wb_ack_o:   out std_logic;
    wb_stall_o: out std_logic;

    wb2_dat_o:   out std_logic_vector(31 downto 0);
    wb2_adr_i:   in std_logic_vector(11 downto 2);
    wb2_cyc_i:   in std_logic;
    wb2_stb_i:   in std_logic;
    wb2_ack_o:   out std_logic;
    wb2_stall_o: out std_logic
  );
  end component;

  signal sysrst:      std_logic;
  signal sysclk:      std_logic;
  signal clkgen_rst:  std_logic;
  signal wb_clk_i:    std_logic;
  signal wb_rst_i:    std_logic;

--  signal gpio_o:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_t:      std_logic_vector(zpuino_gpio_count-1 downto 0);
--  signal gpio_i:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_o_reg:      std_logic_vector(48 downto 0);

  -- constant spp_cap_in: std_logic_vector(48 downto 0) :=
    -- "0" &                -- SPI CS 
    -- "0000000000000000" &  -- Wing C
    -- "0000000000000000" &  -- Wing B
    -- "0000000000000000";   -- Wing A

  -- constant spp_cap_out: std_logic_vector(48 downto 0) :=
    -- "0" &                -- SPI CS 
    -- "0000000000000000" &  -- Wing C
    -- "0000000000000000" &  -- Wing B
    -- "0000000000000000";   -- Wing A

 constant spp_cap_in: std_logic_vector(48 downto 0) :=
   "0" &                -- SPI CS 
   "1111111111111111" &  -- Wing C
   "1111111111111111" &  -- Wing B
   "1111111111111111";   -- Wing A

 constant spp_cap_out: std_logic_vector(48 downto 0) :=
   "0" &                -- SPI CS 
   "1111111111111111" &  -- Wing C
   "1111111111111111" &  -- Wing B
   "1111111111111111";   -- Wing A

  -- I/O Signals
  signal slot_cyc:    slot_std_logic_type;
  signal slot_we:     slot_std_logic_type;
  signal slot_stb:    slot_std_logic_type;
  signal slot_read:   slot_cpuword_type;
  signal slot_write:  slot_cpuword_type;
  signal slot_address:slot_address_type;
  signal slot_ack:    slot_std_logic_type;
  signal slot_interrupt: slot_std_logic_type;
  signal slot_ids:    slot_id_type;

  -- 2nd SPI signals
  signal spi2_mosi:   std_logic;
  signal spi2_miso:   std_logic;
  signal spi2_sck:    std_logic;

  -- GPIO Periperal Pin Select
  signal gpio_spp_data: std_logic_vector(PPSCOUNT_OUT-1 downto 0);
  signal gpio_spp_read: std_logic_vector(PPSCOUNT_IN-1 downto 0);
  signal ppsout_info_slot: ppsoutinfotype := (others => 0);
  signal ppsout_info_pin:  ppsoutinfotype;
  signal ppsin_info_slot: ppsininfotype := (others => 0);
  signal ppsin_info_pin:  ppsininfotype;

  -- Timer connections
  signal timers_interrupt:  std_logic_vector(1 downto 0);
  signal timers_pwm:        std_logic_vector(1 downto 0);

  -- Sigmadelta output
  signal sigmadelta_spp_data: std_logic_vector(1 downto 0);

  -- main SPI signals
  signal spi_pf_miso: std_logic;
  signal spi_pf_mosi: std_logic;
  signal spi_pf_sck:  std_logic;

  -- UART signals
  signal rx: std_logic;
  signal tx: std_logic;
  signal sysclk_sram_we, sysclk_sram_wen: std_ulogic;

  signal ram_wb_ack_o:       std_logic;
  signal ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal ram_wb_cyc_i:       std_logic;
  signal ram_wb_stb_i:       std_logic;
  signal ram_wb_sel_i:       std_logic_vector(3 downto 0);
  signal ram_wb_we_i:        std_logic;
  signal ram_wb_stall_o:     std_logic;

  signal np_ram_wb_ack_o:       std_logic;
  signal np_ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal np_ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal np_ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal np_ram_wb_cyc_i:       std_logic;
  signal np_ram_wb_stb_i:       std_logic;
  signal np_ram_wb_sel_i:       std_logic_vector(3 downto 0);
  signal np_ram_wb_we_i:        std_logic;

  -- signal sram_wb_ack_o:       std_logic;
  -- signal sram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  -- signal sram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  -- signal sram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  -- signal sram_wb_cyc_i:       std_logic;
  -- signal sram_wb_stb_i:       std_logic;
  -- signal sram_wb_we_i:        std_logic;
  -- signal sram_wb_sel_i:       std_logic_vector(3 downto 0);
  -- signal sram_wb_stall_o:     std_logic;

  signal rom_wb_ack_o:       std_logic;
  signal rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal rom_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal rom_wb_cyc_i:       std_logic;
  signal rom_wb_stb_i:       std_logic;
  signal rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal rom_wb_stall_o:     std_logic;

  signal sram_rom_wb_ack_o:       std_logic;
  signal sram_rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal sram_rom_wb_adr_i:       std_logic_vector(maxAddrBit downto 2);
  signal sram_rom_wb_cyc_i:       std_logic;
  signal sram_rom_wb_stb_i:       std_logic;
  signal sram_rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal sram_rom_wb_stall_o:     std_logic;

  signal prom_rom_wb_ack_o:       std_logic;
  signal prom_rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal prom_rom_wb_adr_i:       std_logic_vector(maxAddrBit downto 2);
  signal prom_rom_wb_cyc_i:       std_logic;
  signal prom_rom_wb_stb_i:       std_logic;
  signal prom_rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal prom_rom_wb_stall_o:     std_logic;

  signal memory_enable: std_logic;

  component sdram_ctrl is
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(maxIOBit downto minIOBit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_sel_i: in std_logic_vector(3 downto 0);
    wb_ack_o: out std_logic;
    wb_stall_o: out std_logic;

    -- extra clocking
    clk_off_3ns: in std_logic;

    -- SDRAM signals
     DRAM_ADDR   : OUT   STD_LOGIC_VECTOR (11 downto 0);
     DRAM_BA      : OUT   STD_LOGIC_VECTOR (1 downto 0);
     DRAM_CAS_N   : OUT   STD_LOGIC;
     DRAM_CKE      : OUT   STD_LOGIC;
     DRAM_CLK      : OUT   STD_LOGIC;
     DRAM_CS_N   : OUT   STD_LOGIC;
     DRAM_DQ      : INOUT STD_LOGIC_VECTOR(15 downto 0);
     DRAM_DQM      : OUT   STD_LOGIC_VECTOR(1 downto 0);
     DRAM_RAS_N   : OUT   STD_LOGIC;
     DRAM_WE_N    : OUT   STD_LOGIC
  
  );
  end component sdram_ctrl;

  component wb_master_np_to_slave_p is
  generic (
    ADDRESS_HIGH: integer := maxIObit;
    ADDRESS_LOW: integer := maxIObit
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;

    -- Master signals

    m_wb_dat_o: out std_logic_vector(31 downto 0);
    m_wb_dat_i: in std_logic_vector(31 downto 0);
    m_wb_adr_i: in std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    m_wb_sel_i: in std_logic_vector(3 downto 0);
    m_wb_cti_i: in std_logic_vector(2 downto 0);
    m_wb_we_i:  in std_logic;
    m_wb_cyc_i: in std_logic;
    m_wb_stb_i: in std_logic;
    m_wb_ack_o: out std_logic;

    -- Slave signals

    s_wb_dat_i: in std_logic_vector(31 downto 0);
    s_wb_dat_o: out std_logic_vector(31 downto 0);
    s_wb_adr_o: out std_logic_vector(ADDRESS_HIGH downto ADDRESS_LOW);
    s_wb_sel_o: out std_logic_vector(3 downto 0);
    s_wb_cti_o: out std_logic_vector(2 downto 0);
    s_wb_we_o:  out std_logic;
    s_wb_cyc_o: out std_logic;
    s_wb_stb_o: out std_logic;
    s_wb_ack_i: in std_logic;
    s_wb_stall_i: in std_logic
  );
  end component;
  
  signal sigmadelta_spp_en:  std_logic_vector(1 downto 0);
  signal sysclk_1mhz: std_logic;  
  
  signal wishbone_slot_video_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_video_out_record : wishbone_bus_out_type;
  signal wishbone_slot_5_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_5_out_record : wishbone_bus_out_type;
  signal wishbone_slot_6_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_6_out_record : wishbone_bus_out_type;
  signal wishbone_slot_8_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_8_out_record : wishbone_bus_out_type;
  signal wishbone_slot_9_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_9_out_record : wishbone_bus_out_type;
  signal wishbone_slot_10_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_10_out_record : wishbone_bus_out_type;
  signal wishbone_slot_11_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_11_out_record : wishbone_bus_out_type;
  signal wishbone_slot_12_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_12_out_record : wishbone_bus_out_type;
  signal wishbone_slot_13_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_13_out_record : wishbone_bus_out_type;
  signal wishbone_slot_14_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_14_out_record : wishbone_bus_out_type;
--  signal wishbone_slot_15_in_record  : wishbone_bus_in_type;
--  signal wishbone_slot_15_out_record : wishbone_bus_out_type;  

  signal gpio_bus_in_record : gpio_bus_in_type;
  signal gpio_bus_out_record : gpio_bus_out_type;   
  
  -- Papilio Note: Place your signal statements here. #Signal  

begin
-- Unpack the wishbone array into a record so the modules code is not confusing.
-- These are backwards for the master.
 -- wishbone_slot_video_in_record.wb_clk_i <= wishbone_slot_video_in(61);
 -- wishbone_slot_video_in_record.wb_rst_i <= wishbone_slot_video_in(60);
 -- wishbone_slot_video_in_record.wb_dat_i <= wishbone_slot_video_in(59 downto 28);
 -- wishbone_slot_video_in_record.wb_adr_i <= wishbone_slot_video_in(27 downto 3);
 -- wishbone_slot_video_in_record.wb_we_i <= wishbone_slot_video_in(2);
 -- wishbone_slot_video_in_record.wb_cyc_i <= wishbone_slot_video_in(1);
 -- wishbone_slot_video_in_record.wb_stb_i <= wishbone_slot_video_in(0); 
 -- wishbone_slot_video_out(33 downto 2) <= wishbone_slot_video_out_record.wb_dat_o;
 -- wishbone_slot_video_out(1) <= wishbone_slot_video_out_record.wb_ack_o;
 -- wishbone_slot_video_out(0) <= wishbone_slot_video_out_record.wb_inta_o;  

  wishbone_slot_5_in(61) <= wishbone_slot_5_in_record.wb_clk_i;
  wishbone_slot_5_in(60) <= wishbone_slot_5_in_record.wb_rst_i;
  wishbone_slot_5_in(59 downto 28) <= wishbone_slot_5_in_record.wb_dat_i;
  wishbone_slot_5_in(27 downto 3) <= wishbone_slot_5_in_record.wb_adr_i;
  wishbone_slot_5_in(2) <= wishbone_slot_5_in_record.wb_we_i;
  wishbone_slot_5_in(1) <= wishbone_slot_5_in_record.wb_cyc_i;
  wishbone_slot_5_in(0) <= wishbone_slot_5_in_record.wb_stb_i; 
  wishbone_slot_5_out_record.wb_id_o <= wishbone_slot_5_out(49 downto 34);
  wishbone_slot_5_out_record.wb_dat_o <= wishbone_slot_5_out(33 downto 2);
  wishbone_slot_5_out_record.wb_ack_o <= wishbone_slot_5_out(1);
  wishbone_slot_5_out_record.wb_inta_o <= wishbone_slot_5_out(0); 
  
  wishbone_slot_6_in(61) <= wishbone_slot_6_in_record.wb_clk_i;
  wishbone_slot_6_in(60) <= wishbone_slot_6_in_record.wb_rst_i;
  wishbone_slot_6_in(59 downto 28) <= wishbone_slot_6_in_record.wb_dat_i;
  wishbone_slot_6_in(27 downto 3) <= wishbone_slot_6_in_record.wb_adr_i;
  wishbone_slot_6_in(2) <= wishbone_slot_6_in_record.wb_we_i;
  wishbone_slot_6_in(1) <= wishbone_slot_6_in_record.wb_cyc_i;
  wishbone_slot_6_in(0) <= wishbone_slot_6_in_record.wb_stb_i; 
  wishbone_slot_6_out_record.wb_id_o <= wishbone_slot_6_out(49 downto 34);
  wishbone_slot_6_out_record.wb_dat_o <= wishbone_slot_6_out(33 downto 2);
  wishbone_slot_6_out_record.wb_ack_o <= wishbone_slot_6_out(1);
  wishbone_slot_6_out_record.wb_inta_o <= wishbone_slot_6_out(0); 

  wishbone_slot_8_in(61) <= wishbone_slot_8_in_record.wb_clk_i;
  wishbone_slot_8_in(60) <= wishbone_slot_8_in_record.wb_rst_i;
  wishbone_slot_8_in(59 downto 28) <= wishbone_slot_8_in_record.wb_dat_i;
  wishbone_slot_8_in(27 downto 3) <= wishbone_slot_8_in_record.wb_adr_i;
  wishbone_slot_8_in(2) <= wishbone_slot_8_in_record.wb_we_i;
  wishbone_slot_8_in(1) <= wishbone_slot_8_in_record.wb_cyc_i;
  wishbone_slot_8_in(0) <= wishbone_slot_8_in_record.wb_stb_i; 
  wishbone_slot_8_out_record.wb_id_o <= wishbone_slot_8_out(49 downto 34);
  wishbone_slot_8_out_record.wb_dat_o <= wishbone_slot_8_out(33 downto 2);
  wishbone_slot_8_out_record.wb_ack_o <= wishbone_slot_8_out(1);
  wishbone_slot_8_out_record.wb_inta_o <= wishbone_slot_8_out(0); 

  wishbone_slot_9_in(61) <= wishbone_slot_9_in_record.wb_clk_i;
  wishbone_slot_9_in(60) <= wishbone_slot_9_in_record.wb_rst_i;
  wishbone_slot_9_in(59 downto 28) <= wishbone_slot_9_in_record.wb_dat_i;
  wishbone_slot_9_in(27 downto 3) <= wishbone_slot_9_in_record.wb_adr_i;
  wishbone_slot_9_in(2) <= wishbone_slot_9_in_record.wb_we_i;
  wishbone_slot_9_in(1) <= wishbone_slot_9_in_record.wb_cyc_i;
  wishbone_slot_9_in(0) <= wishbone_slot_9_in_record.wb_stb_i; 
  wishbone_slot_9_out_record.wb_id_o <= wishbone_slot_9_out(49 downto 34);
  wishbone_slot_9_out_record.wb_dat_o <= wishbone_slot_9_out(33 downto 2);
  wishbone_slot_9_out_record.wb_ack_o <= wishbone_slot_9_out(1);
  wishbone_slot_9_out_record.wb_inta_o <= wishbone_slot_9_out(0); 

  wishbone_slot_10_in(61) <= wishbone_slot_10_in_record.wb_clk_i;
  wishbone_slot_10_in(60) <= wishbone_slot_10_in_record.wb_rst_i;
  wishbone_slot_10_in(59 downto 28) <= wishbone_slot_10_in_record.wb_dat_i;
  wishbone_slot_10_in(27 downto 3) <= wishbone_slot_10_in_record.wb_adr_i;
  wishbone_slot_10_in(2) <= wishbone_slot_10_in_record.wb_we_i;
  wishbone_slot_10_in(1) <= wishbone_slot_10_in_record.wb_cyc_i;
  wishbone_slot_10_in(0) <= wishbone_slot_10_in_record.wb_stb_i; 
  wishbone_slot_10_out_record.wb_id_o <= wishbone_slot_10_out(49 downto 34);
  wishbone_slot_10_out_record.wb_dat_o <= wishbone_slot_10_out(33 downto 2);
  wishbone_slot_10_out_record.wb_ack_o <= wishbone_slot_10_out(1);
  wishbone_slot_10_out_record.wb_inta_o <= wishbone_slot_10_out(0); 

  wishbone_slot_11_in(61) <= wishbone_slot_11_in_record.wb_clk_i;
  wishbone_slot_11_in(60) <= wishbone_slot_11_in_record.wb_rst_i;
  wishbone_slot_11_in(59 downto 28) <= wishbone_slot_11_in_record.wb_dat_i;
  wishbone_slot_11_in(27 downto 3) <= wishbone_slot_11_in_record.wb_adr_i;
  wishbone_slot_11_in(2) <= wishbone_slot_11_in_record.wb_we_i;
  wishbone_slot_11_in(1) <= wishbone_slot_11_in_record.wb_cyc_i;
  wishbone_slot_11_in(0) <= wishbone_slot_11_in_record.wb_stb_i; 
  wishbone_slot_11_out_record.wb_id_o <= wishbone_slot_11_out(49 downto 34);
  wishbone_slot_11_out_record.wb_dat_o <= wishbone_slot_11_out(33 downto 2);
  wishbone_slot_11_out_record.wb_ack_o <= wishbone_slot_11_out(1);
  wishbone_slot_11_out_record.wb_inta_o <= wishbone_slot_11_out(0); 

  wishbone_slot_12_in(61) <= wishbone_slot_12_in_record.wb_clk_i;
  wishbone_slot_12_in(60) <= wishbone_slot_12_in_record.wb_rst_i;
  wishbone_slot_12_in(59 downto 28) <= wishbone_slot_12_in_record.wb_dat_i;
  wishbone_slot_12_in(27 downto 3) <= wishbone_slot_12_in_record.wb_adr_i;
  wishbone_slot_12_in(2) <= wishbone_slot_12_in_record.wb_we_i;
  wishbone_slot_12_in(1) <= wishbone_slot_12_in_record.wb_cyc_i;
  wishbone_slot_12_in(0) <= wishbone_slot_12_in_record.wb_stb_i; 
  wishbone_slot_12_out_record.wb_id_o <= wishbone_slot_12_out(49 downto 34);
  wishbone_slot_12_out_record.wb_dat_o <= wishbone_slot_12_out(33 downto 2);
  wishbone_slot_12_out_record.wb_ack_o <= wishbone_slot_12_out(1);
  wishbone_slot_12_out_record.wb_inta_o <= wishbone_slot_12_out(0); 

  wishbone_slot_13_in(61) <= wishbone_slot_13_in_record.wb_clk_i;
  wishbone_slot_13_in(60) <= wishbone_slot_13_in_record.wb_rst_i;
  wishbone_slot_13_in(59 downto 28) <= wishbone_slot_13_in_record.wb_dat_i;
  wishbone_slot_13_in(27 downto 3) <= wishbone_slot_13_in_record.wb_adr_i;
  wishbone_slot_13_in(2) <= wishbone_slot_13_in_record.wb_we_i;
  wishbone_slot_13_in(1) <= wishbone_slot_13_in_record.wb_cyc_i;
  wishbone_slot_13_in(0) <= wishbone_slot_13_in_record.wb_stb_i; 
  wishbone_slot_13_out_record.wb_id_o <= wishbone_slot_13_out(49 downto 34);
  wishbone_slot_13_out_record.wb_dat_o <= wishbone_slot_13_out(33 downto 2);
  wishbone_slot_13_out_record.wb_ack_o <= wishbone_slot_13_out(1);
  wishbone_slot_13_out_record.wb_inta_o <= wishbone_slot_13_out(0); 

  wishbone_slot_14_in(61) <= wishbone_slot_14_in_record.wb_clk_i;
  wishbone_slot_14_in(60) <= wishbone_slot_14_in_record.wb_rst_i;
  wishbone_slot_14_in(59 downto 28) <= wishbone_slot_14_in_record.wb_dat_i;
  wishbone_slot_14_in(27 downto 3) <= wishbone_slot_14_in_record.wb_adr_i;
  wishbone_slot_14_in(2) <= wishbone_slot_14_in_record.wb_we_i;
  wishbone_slot_14_in(1) <= wishbone_slot_14_in_record.wb_cyc_i;
  wishbone_slot_14_in(0) <= wishbone_slot_14_in_record.wb_stb_i; 
  wishbone_slot_14_out_record.wb_id_o <= wishbone_slot_14_out(49 downto 34);
  wishbone_slot_14_out_record.wb_dat_o <= wishbone_slot_14_out(33 downto 2);
  wishbone_slot_14_out_record.wb_ack_o <= wishbone_slot_14_out(1);
  wishbone_slot_14_out_record.wb_inta_o <= wishbone_slot_14_out(0); 

  gpio_bus_in_record.gpio_spp_data <= gpio_bus_in(49+(PPSCOUNT_OUT-1) downto 49); -- Subtract two pins for the Timer PPS pins
  --gpio_bus_in_record.gpio_spp_data <= gpio_bus_in(97 downto 49);
  gpio_bus_in_record.gpio_i <= gpio_bus_in(48 downto 0);

  gpio_bus_out(147) <= gpio_bus_out_record.gpio_clk;
  gpio_bus_out(146 downto 98) <= gpio_bus_out_record.gpio_o;
  gpio_bus_out(97 downto 49) <= gpio_bus_out_record.gpio_t;
  gpio_bus_out(PPSCOUNT_IN-1 downto 0) <= gpio_bus_out_record.gpio_spp_read;
  --gpio_bus_out(48 downto 0) <= gpio_bus_out_record.gpio_spp_read;

  gpio_bus_out_record.gpio_o <= gpio_o_reg;
  gpio_bus_out_record.gpio_clk <= sysclk;
  LED <= '0';

  wb_clk_i <= sysclk;
  wb_rst_i <= sysrst;
  sram_wb_clk_i <= sysclk;
  sram_wb_rst_i <= sysrst;
  
  --Wishbone 5
  wishbone_slot_5_in_record.wb_clk_i <= sysclk;
  wishbone_slot_5_in_record.wb_rst_i <= sysrst;
  slot_read(5) <= wishbone_slot_5_out_record.wb_dat_o;
  slot_ids(5) <= wishbone_slot_5_out_record.wb_id_o;
  wishbone_slot_5_in_record.wb_dat_i <= slot_write(5);
  wishbone_slot_5_in_record.wb_adr_i <= slot_address(5);
  wishbone_slot_5_in_record.wb_we_i <= slot_we(5);
  wishbone_slot_5_in_record.wb_cyc_i <= slot_cyc(5);
  wishbone_slot_5_in_record.wb_stb_i <= slot_stb(5);
  slot_ack(5) <= wishbone_slot_5_out_record.wb_ack_o;
  slot_interrupt(5) <= wishbone_slot_5_out_record.wb_inta_o;
  
  --Wishbone 6
  wishbone_slot_6_in_record.wb_clk_i <= sysclk;
  wishbone_slot_6_in_record.wb_rst_i <= sysrst;
  slot_read(6) <= wishbone_slot_6_out_record.wb_dat_o;
  slot_ids(6) <= wishbone_slot_6_out_record.wb_id_o;
  wishbone_slot_6_in_record.wb_dat_i <= slot_write(6);
  wishbone_slot_6_in_record.wb_adr_i <= slot_address(6);
  wishbone_slot_6_in_record.wb_we_i <= slot_we(6);
  wishbone_slot_6_in_record.wb_cyc_i <= slot_cyc(6);
  wishbone_slot_6_in_record.wb_stb_i <= slot_stb(6);
  slot_ack(6) <= wishbone_slot_6_out_record.wb_ack_o;
  slot_interrupt(6) <= wishbone_slot_6_out_record.wb_inta_o;
  
   --Wishbone 8
  wishbone_slot_8_in_record.wb_clk_i <= sysclk;
  wishbone_slot_8_in_record.wb_rst_i <= sysrst;
  slot_read(8) <= wishbone_slot_8_out_record.wb_dat_o;
  slot_ids(8) <= wishbone_slot_8_out_record.wb_id_o;
  wishbone_slot_8_in_record.wb_dat_i <= slot_write(8);
  wishbone_slot_8_in_record.wb_adr_i <= slot_address(8);
  wishbone_slot_8_in_record.wb_we_i <= slot_we(8);
  wishbone_slot_8_in_record.wb_cyc_i <= slot_cyc(8);
  wishbone_slot_8_in_record.wb_stb_i <= slot_stb(8);
  slot_ack(8) <= wishbone_slot_8_out_record.wb_ack_o;
  slot_interrupt(8) <= wishbone_slot_8_out_record.wb_inta_o;
  
   --Wishbone 9
  wishbone_slot_9_in_record.wb_clk_i <= sysclk;
  wishbone_slot_9_in_record.wb_rst_i <= sysrst;
  slot_read(9) <= wishbone_slot_9_out_record.wb_dat_o;
  slot_ids(9) <= wishbone_slot_9_out_record.wb_id_o;
  wishbone_slot_9_in_record.wb_dat_i <= slot_write(9);
  wishbone_slot_9_in_record.wb_adr_i <= slot_address(9);
  wishbone_slot_9_in_record.wb_we_i <= slot_we(9);
  wishbone_slot_9_in_record.wb_cyc_i <= slot_cyc(9);
  wishbone_slot_9_in_record.wb_stb_i <= slot_stb(9);
  slot_ack(9) <= wishbone_slot_9_out_record.wb_ack_o;
  slot_interrupt(9) <= wishbone_slot_9_out_record.wb_inta_o;

  --Wishbone 10
  wishbone_slot_10_in_record.wb_clk_i <= sysclk;
  wishbone_slot_10_in_record.wb_rst_i <= sysrst;
  slot_read(10) <= wishbone_slot_10_out_record.wb_dat_o;
  slot_ids(10) <= wishbone_slot_10_out_record.wb_id_o;
  wishbone_slot_10_in_record.wb_dat_i <= slot_write(10);
  wishbone_slot_10_in_record.wb_adr_i <= slot_address(10);
  wishbone_slot_10_in_record.wb_we_i <= slot_we(10);
  wishbone_slot_10_in_record.wb_cyc_i <= slot_cyc(10);
  wishbone_slot_10_in_record.wb_stb_i <= slot_stb(10);
  slot_ack(10) <= wishbone_slot_10_out_record.wb_ack_o;
  slot_interrupt(10) <= wishbone_slot_10_out_record.wb_inta_o;
  
   --Wishbone 11
  wishbone_slot_11_in_record.wb_clk_i <= sysclk;
  wishbone_slot_11_in_record.wb_rst_i <= sysrst;
  slot_read(11) <= wishbone_slot_11_out_record.wb_dat_o;
  slot_ids(11) <= wishbone_slot_11_out_record.wb_id_o;
  wishbone_slot_11_in_record.wb_dat_i <= slot_write(11);
  wishbone_slot_11_in_record.wb_adr_i <= slot_address(11);
  wishbone_slot_11_in_record.wb_we_i <= slot_we(11);
  wishbone_slot_11_in_record.wb_cyc_i <= slot_cyc(11);
  wishbone_slot_11_in_record.wb_stb_i <= slot_stb(11);
  slot_ack(11) <= wishbone_slot_11_out_record.wb_ack_o;
  slot_interrupt(11) <= wishbone_slot_11_out_record.wb_inta_o;
  
   --Wishbone 12
  wishbone_slot_12_in_record.wb_clk_i <= sysclk;
  wishbone_slot_12_in_record.wb_rst_i <= sysrst;
  slot_read(12) <= wishbone_slot_12_out_record.wb_dat_o;
  slot_ids(12) <= wishbone_slot_12_out_record.wb_id_o;
  wishbone_slot_12_in_record.wb_dat_i <= slot_write(12);
  wishbone_slot_12_in_record.wb_adr_i <= slot_address(12);
  wishbone_slot_12_in_record.wb_we_i <= slot_we(12);
  wishbone_slot_12_in_record.wb_cyc_i <= slot_cyc(12);
  wishbone_slot_12_in_record.wb_stb_i <= slot_stb(12);
  slot_ack(12) <= wishbone_slot_12_out_record.wb_ack_o;
  slot_interrupt(12) <= wishbone_slot_12_out_record.wb_inta_o;
  
   --Wishbone 13
  wishbone_slot_13_in_record.wb_clk_i <= sysclk;
  wishbone_slot_13_in_record.wb_rst_i <= sysrst;
  slot_read(13) <= wishbone_slot_13_out_record.wb_dat_o;
  slot_ids(13) <= wishbone_slot_13_out_record.wb_id_o;
  wishbone_slot_13_in_record.wb_dat_i <= slot_write(13);
  wishbone_slot_13_in_record.wb_adr_i <= slot_address(13);
  wishbone_slot_13_in_record.wb_we_i <= slot_we(13);
  wishbone_slot_13_in_record.wb_cyc_i <= slot_cyc(13);
  wishbone_slot_13_in_record.wb_stb_i <= slot_stb(13);
  slot_ack(13) <= wishbone_slot_13_out_record.wb_ack_o;
  slot_interrupt(13) <= wishbone_slot_13_out_record.wb_inta_o;
  
   --Wishbone 14
  wishbone_slot_14_in_record.wb_clk_i <= sysclk;
  wishbone_slot_14_in_record.wb_rst_i <= sysrst;
  slot_read(14) <= wishbone_slot_14_out_record.wb_dat_o;
  slot_ids(14) <= wishbone_slot_14_out_record.wb_id_o;
  wishbone_slot_14_in_record.wb_dat_i <= slot_write(14);
  wishbone_slot_14_in_record.wb_adr_i <= slot_address(14);
  wishbone_slot_14_in_record.wb_we_i <= slot_we(14);
  wishbone_slot_14_in_record.wb_cyc_i <= slot_cyc(14);
  wishbone_slot_14_in_record.wb_stb_i <= slot_stb(14);
  slot_ack(14) <= wishbone_slot_14_out_record.wb_ack_o;
  slot_interrupt(14) <= wishbone_slot_14_out_record.wb_inta_o;

  rstgen: zpuino_serialreset
    generic map (
      SYSTEM_CLOCK_MHZ  => 96
    )
    port map (
      clk       => sysclk,
      rx        => rx,
      rstin     => clkgen_rst,
      rstout    => sysrst
    );

  clkgen_inst: clkgen
  port map (
    clkin   => clk,
    rstin   => '0'  ,
    clkout  => sysclk,
    clkout1  => sysclk_sram_we,
    clkout2  => sysclk_sram_wen,
	clk_1Mhz_out => clk_1Mhz,
	clk_osc_32Mhz => clk_osc_32Mhz,
	clk27 => wishbone_slot_video_out(98),
	clk42 => wishbone_slot_video_out(97),
    rstout  => clkgen_rst
  );
	clk_96Mhz <= sysclk;


  -- Other ports are special, we need to avoid outputs on input-only pins

  ibufrx:   IPAD port map ( PAD => RXD,        O => rx,           C => sysclk );
  ibufmiso: IPAD port map ( PAD => SPI_MISO,   O => spi_pf_miso,  C => sysclk );

  obuftx:   OPAD port map ( I => tx,           PAD => TXD );
  ospiclk:  OPAD port map ( I => spi_pf_sck,   PAD => SPI_SCK );
  ospics:   OPAD port map ( I => gpio_o_reg(48),   PAD => SPI_CS );
  ospimosi: OPAD port map ( I => spi_pf_mosi,  PAD => SPI_MOSI );
  --oled:     OPAD port map ( I => gpio_o_reg(49),   PAD => LED );

  zpuino:zpuino_top_icache
    port map (
      clk           => sysclk,
	 	  rst           => sysrst,

      slot_cyc      => slot_cyc,
      slot_we       => slot_we,
      slot_stb      => slot_stb,
      slot_read     => slot_read,
      slot_write    => slot_write,
      slot_address  => slot_address,
      slot_ack      => slot_ack,
      slot_interrupt=> slot_interrupt,
      slot_id       => slot_ids,

      pps_in_slot   => ppsin_info_slot,
      pps_in_pin    => ppsin_info_pin,

      pps_out_slot => ppsout_info_slot,
      pps_out_pin  => ppsout_info_pin,	  
	  
      m_wb_dat_o    => wishbone_slot_video_out(31 downto 0),
      m_wb_dat_i    => wishbone_slot_video_in(31 downto 0),
      m_wb_adr_i    => wishbone_slot_video_in(77 downto 50),
      m_wb_we_i     => wishbone_slot_video_in(100),
      m_wb_cyc_i    => wishbone_slot_video_in(99),
      m_wb_stb_i    => wishbone_slot_video_in(98),
      m_wb_ack_o    => wishbone_slot_video_out(100),
      m_wb_stall_o  => wishbone_slot_video_out(99),
      m_wb_cti_i    => CTI_CYCLE_CLASSIC,

      wb_ack_i      => sram_wb_ack_o,
      wb_stall_i    => sram_wb_stall_o,
      wb_dat_o      => sram_wb_dat_i,
      wb_dat_i      => sram_wb_dat_o,
      wb_adr_o      => sram_wb_adr_i(maxAddrBit downto 0),
      wb_cyc_o      => sram_wb_cyc_i,
      wb_stb_o      => sram_wb_stb_i,
      wb_sel_o      => sram_wb_sel_i,
      wb_we_o       => sram_wb_we_i,

      -- No debug unit connected
      dbg_reset     => open,
      jtag_data_chain_out => open,            --jtag_data_chain_in,
      jtag_ctrl_chain_in  => (others => '0') --jtag_ctrl_chain_out
    );

  --
  -- IO SLOT 1
  --

  uart_inst: zpuino_uart
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(1),
    wb_dat_i      => slot_write(1),
    wb_adr_i      => slot_address(1),
    wb_we_i       => slot_we(1),
    wb_cyc_i      => slot_cyc(1),
    wb_stb_i      => slot_stb(1),
    wb_ack_o      => slot_ack(1),
    wb_inta_o     => slot_interrupt(1),
    id            => slot_ids(1),

    enabled       => open,
    tx            => tx,
    rx            => rx
  );

  --
  -- IO SLOT 2
  --

  gpio_inst: zpuino_gpio
  generic map (
    gpio_count => zpuino_gpio_count
  )
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(2),
    wb_dat_i      => slot_write(2),
    wb_adr_i      => slot_address(2),
    wb_we_i       => slot_we(2),
    wb_cyc_i      => slot_cyc(2),
    wb_stb_i      => slot_stb(2),
    wb_ack_o      => slot_ack(2),
    wb_inta_o     => slot_interrupt(2),
    id            => slot_ids(2),

    spp_data  => gpio_bus_in_record.gpio_spp_data(PPSCOUNT_OUT-1 downto 0),
    spp_read  => gpio_bus_out_record.gpio_spp_read(PPSCOUNT_IN-1 downto 0),

    gpio_i      => gpio_bus_in_record.gpio_i,
    gpio_t      => gpio_bus_out_record.gpio_t,
    gpio_o        => gpio_o_reg,
    spp_cap_in    => spp_cap_in,
    spp_cap_out   => spp_cap_out
  );

  --
  -- IO SLOT 3
  --

  timers_inst: zpuino_timers
  generic map (
    A_TSCENABLED        => true,
    A_PWMCOUNT          => 1,
    A_WIDTH             => 32,
    A_PRESCALER_ENABLED => true,
    A_BUFFERS           => true,
    B_TSCENABLED        => false,
    B_PWMCOUNT          => 1,
    B_WIDTH             => 24,
    B_PRESCALER_ENABLED => true,
    B_BUFFERS           => false
  )
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(3),
    wb_dat_i      => slot_write(3),
    wb_adr_i      => slot_address(3),
    wb_we_i       => slot_we(3),
    wb_cyc_i      => slot_cyc(3),
    wb_stb_i      => slot_stb(3),
    wb_ack_o      => slot_ack(3),
    id            => slot_ids(3),

    wb_inta_o     => slot_interrupt(3), -- We use two interrupt lines
    wb_intb_o     => slot_interrupt(4), -- so we borrow intr line from slot 4

    pwm_a_out   => timers_pwm(0 downto 0),
    pwm_b_out   => timers_pwm(1 downto 1)
  );

  --
  -- IO SLOT 4
  --

  slot4: zpuino_spi
  generic map (
    INTERNAL_SPI => true
  )
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(4),
    wb_dat_i      => slot_write(4),
    wb_adr_i      => slot_address(4),
    wb_we_i       => slot_we(4),
    wb_cyc_i      => slot_cyc(4),
    wb_stb_i      => slot_stb(4),
    wb_ack_o      => slot_ack(4),
    -- wb_inta_o     => slot_interrupt(4), -- Used by the Timers.
    id            => slot_ids(4),

    mosi          => spi_pf_mosi,
    miso          => spi_pf_miso,
    sck           => spi_pf_sck,
    enabled       => open
  );

  --
  -- IO SLOT 5
  --

  -- sigmadelta_inst: zpuino_sigmadelta
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(5),
    -- wb_dat_i      => slot_write(5),
    -- wb_adr_i      => slot_address(5),
    -- wb_we_i       => slot_we(5),
    -- wb_cyc_i      => slot_cyc(5),
    -- wb_stb_i      => slot_stb(5),
    -- wb_ack_o      => slot_ack(5),
    -- wb_inta_o     => slot_interrupt(5),
    -- id            => slot_ids(5),

    -- spp_data      => sigmadelta_spp_data,
    -- spp_en        => open,
    -- sync_in       => '1'
  -- );

  --
  -- IO SLOT 6
  --

  -- slot1: zpuino_spi
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(6),
    -- wb_dat_i      => slot_write(6),
    -- wb_adr_i      => slot_address(6),
    -- wb_we_i       => slot_we(6),
    -- wb_cyc_i      => slot_cyc(6),
    -- wb_stb_i      => slot_stb(6),
    -- wb_ack_o      => slot_ack(6),
    -- wb_inta_o     => slot_interrupt(6),
    -- id            => slot_ids(6),

    -- mosi          => spi2_mosi,
    -- miso          => spi2_miso,
    -- sck           => spi2_sck,
    -- enabled       => open
  -- );



  --
  -- IO SLOT 7
  --

  crc16_inst: zpuino_crc16
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(7),
    wb_dat_i      => slot_write(7),
    wb_adr_i      => slot_address(7),
    wb_we_i       => slot_we(7),
    wb_cyc_i      => slot_cyc(7),
    wb_stb_i      => slot_stb(7),
    wb_ack_o      => slot_ack(7),
    wb_inta_o     => slot_interrupt(7),
    id            => slot_ids(7)
  );

  clk_off_3ns <= sysclk_sram_we;
  
  --
  -- IO SLOT 8
  --

  -- slot8: zpuino_uart
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(8),
    -- wb_dat_i      => slot_write(8),
    -- wb_adr_i      => slot_address(8),
    -- wb_we_i       => slot_we(8),
    -- wb_cyc_i      => slot_cyc(8),
    -- wb_stb_i      => slot_stb(8),
    -- wb_ack_o      => slot_ack(8),
    -- wb_inta_o     => slot_interrupt(8),
    -- id            => slot_ids(8),
    -- tx            => uart2_tx,
    -- rx            => uart2_rx
  -- );

  -- sram_inst: sdram_ctrl
    -- port map (
      -- wb_clk_i    => wb_clk_i,
  	 	-- wb_rst_i    => wb_rst_i,
      -- wb_dat_o    => sram_wb_dat_o,
      -- wb_dat_i    => sram_wb_dat_i,
      -- wb_adr_i    => sram_wb_adr_i(maxIObit downto minIObit),
      -- wb_we_i     => sram_wb_we_i,
      -- wb_cyc_i    => sram_wb_cyc_i,
      -- wb_stb_i    => sram_wb_stb_i,
      -- wb_sel_i    => sram_wb_sel_i,
      -- wb_ack_o    => sram_wb_ack_o,
      -- wb_stall_o  => sram_wb_stall_o,

      -- clk_off_3ns => sysclk_sram_we,
      -- DRAM_ADDR   => DRAM_ADDR(11 downto 0),
      -- DRAM_BA     => DRAM_BA,
      -- DRAM_CAS_N  => DRAM_CAS_N,
      -- DRAM_CKE    => DRAM_CKE,
      -- DRAM_CLK    => DRAM_CLK,
      -- DRAM_CS_N   => DRAM_CS_N,
      -- DRAM_DQ     => DRAM_DQ,
      -- DRAM_DQM    => DRAM_DQM,
      -- DRAM_RAS_N  => DRAM_RAS_N,
      -- DRAM_WE_N   => DRAM_WE_N
    -- );

    -- DRAM_ADDR(12) <= '0';

  --
  -- IO SLOT 9
  --

  -- slot9: zpuino_empty_device
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(9),
    -- wb_dat_i      => slot_write(9),
    -- wb_adr_i      => slot_address(9),
    -- wb_we_i       => slot_we(9),
    -- wb_cyc_i      => slot_cyc(9),
    -- wb_stb_i      => slot_stb(9),
    -- wb_ack_o      => slot_ack(9),
    -- wb_inta_o     => slot_interrupt(9),
    -- id            => slot_ids(9)
  -- );


  -- --
  -- -- IO SLOT 10
  -- --

  -- slot10: zpuino_empty_device
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(10),
    -- wb_dat_i      => slot_write(10),
    -- wb_adr_i      => slot_address(10),
    -- wb_we_i       => slot_we(10),
    -- wb_cyc_i      => slot_cyc(10),
    -- wb_stb_i      => slot_stb(10),
    -- wb_ack_o      => slot_ack(10),
    -- wb_inta_o     => slot_interrupt(10),
    -- id            => slot_ids(10)
  -- );

  -- --
  -- -- IO SLOT 11
  -- --

  -- slot11: zpuino_empty_device
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(11),
    -- wb_dat_i      => slot_write(11),
    -- wb_adr_i      => slot_address(11),
    -- wb_we_i       => slot_we(11),
    -- wb_cyc_i      => slot_cyc(11),
    -- wb_stb_i      => slot_stb(11),
    -- wb_ack_o      => slot_ack(11),
    -- wb_inta_o     => slot_interrupt(11),
    -- id            => slot_ids(11)
  -- );

  -- --
  -- -- IO SLOT 12
  -- --

  -- slot12: zpuino_empty_device
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(12),
    -- wb_dat_i      => slot_write(12),
    -- wb_adr_i      => slot_address(12),
    -- wb_we_i       => slot_we(12),
    -- wb_cyc_i      => slot_cyc(12),
    -- wb_stb_i      => slot_stb(12),
    -- wb_ack_o      => slot_ack(12),
    -- wb_inta_o     => slot_interrupt(12),
    -- id            => slot_ids(12)
  -- );

  -- --
  -- -- IO SLOT 13
  -- --

  -- slot13: zpuino_empty_device
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(13),
    -- wb_dat_i      => slot_write(13),
    -- wb_adr_i      => slot_address(13),
    -- wb_we_i       => slot_we(13),
    -- wb_cyc_i      => slot_cyc(13),
    -- wb_stb_i      => slot_stb(13),
    -- wb_ack_o      => slot_ack(13),
    -- wb_inta_o     => slot_interrupt(13),
    -- id            => slot_ids(13)
  -- );

  -- --
  -- -- IO SLOT 14
  -- --

  -- slot14: zpuino_empty_device
  -- port map (
    -- wb_clk_i      => wb_clk_i,
	 	-- wb_rst_i      => wb_rst_i,
    -- wb_dat_o      => slot_read(14),
    -- wb_dat_i      => slot_write(14),
    -- wb_adr_i      => slot_address(14),
    -- wb_we_i       => slot_we(14),
    -- wb_cyc_i      => slot_cyc(14),
    -- wb_stb_i      => slot_stb(14),
    -- wb_ack_o      => slot_ack(14),
    -- wb_inta_o     => slot_interrupt(14),
    -- id            => slot_ids(14)
  -- );

  --
  -- IO SLOT 15 - do not use
  --

  process(gpio_spp_read, timers_pwm)
  begin

    --gpio_bus_in_record.gpio_spp_data <= (others => DontCareValue);

    -- PPS Outputs
    -- gpio_spp_data(0)  <= sigmadelta_spp_data(0);   -- PPS0 : SIGMADELTA DATA
    -- ppsout_info_slot(0) <= 5; -- Slot 5
    -- ppsout_info_pin(0) <= 0;  -- PPS OUT pin 0 (Channel 0)
	
    ppsout_info_slot(0) <= 3; -- Slot 3
    ppsout_info_pin(0) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    ppsout_info_slot(1) <= 3; -- Slot 3
    ppsout_info_pin(1) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    ppsout_info_slot(2) <= 3; -- Slot 3
    ppsout_info_pin(2) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    ppsout_info_slot(3) <= 3; -- Slot 3
    ppsout_info_pin(3) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    ppsout_info_slot(4) <= 3; -- Slot 3
    ppsout_info_pin(4) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    ppsout_info_slot(5) <= 3; -- Slot 3
    ppsout_info_pin(5) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    --gpio_bus_in_record.gpio_spp_data(6)  <= timers_pwm(0);            -- PPS1 : TIMER0
    ppsout_info_slot(6) <= 3; -- Slot 3
    ppsout_info_pin(6) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    --gpio_bus_in_record.gpio_spp_data(7)  <= timers_pwm(1);            -- PPS2 : TIMER1
    ppsout_info_slot(7) <= 3; -- Slot 3
    ppsout_info_pin(7) <= 1;  -- PPS OUT pin 1 (TIMER 0)

    -- gpio_spp_data(3)  <= spi2_mosi;                -- PPS3 : USPI MOSI
    -- ppsout_info_slot(3) <= 6; -- Slot 6
    -- ppsout_info_pin(3) <= 0;  -- PPS OUT pin 0 (MOSI)

    -- gpio_spp_data(4)  <= spi2_sck;                 -- PPS4 : USPI SCK
    -- ppsout_info_slot(4) <= 6; -- Slot 6
    -- ppsout_info_pin(4) <= 1;  -- PPS OUT pin 1 (SCK)

    -- gpio_spp_data(5)  <= sigmadelta_spp_data(1);   -- PPS5 : SIGMADELTA1 DATA
    -- ppsout_info_slot(5) <= 5; -- Slot 5
    -- ppsout_info_pin(5) <= 1;  -- PPS OUT pin 0 (Channel 1)

    -- gpio_spp_data(6)  <= uart2_tx;   -- PPS6 : UART2 TX
    -- ppsout_info_slot(6) <= 8; -- Slot 8
    -- ppsout_info_pin(6) <= 0;  -- PPS OUT pin 0 (Channel 1)

    -- PPS inputs
    -- spi2_miso         <= gpio_spp_read(0);         -- PPS0 : USPI MISO
    -- ppsin_info_slot(0) <= 6;                    -- USPI is in slot 6
    -- ppsin_info_pin(0) <= 0;                     -- PPS pin of USPI is 0

    -- uart2_rx          <= gpio_spp_read(1);         -- PPS1 : UART2 RX
    -- ppsin_info_slot(1) <= 8;                    -- USPI is in slot 6
    -- ppsin_info_pin(1) <= 0;                     -- PPS pin of USPI is 0

  end process;


end behave;
