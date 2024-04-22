--
--  ZPUINO implementation on Gadget Factory 'Papilio One' Board
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
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
use work.papilio_pkg.all;

library unisim;
use unisim.vcomponents.all;

entity ZPUino_Papilio_One_V2_blackbox is
  port (
    CLK:        in std_logic;
    --RST:        in std_logic; -- No reset on papilio
	 
	 --Clock outputs to be used in schematic
	 clk_96Mhz:        out std_logic;	--This is the clock that the system runs on.
	 clk_1Mhz:        out std_logic;		--This is a 1Mhz clock for symbols like the C64 SID chip.
	 clk_osc_32Mhz:   out std_logic;		--This is the 32Mhz clock from external oscillator.

	 -- Connection to the main SPI flash
    SPI_SCK:    out std_logic;
    SPI_MISO:   in std_logic;
    SPI_MOSI:   out std_logic;
    SPI_CS:     inout std_logic;
	 
	 gpio_bus_in : in std_logic_vector(200 downto 0);
	 gpio_bus_out : out std_logic_vector(200 downto 0);
		
	 -- UART (FTDI) connection
    TXD:        out std_logic;
    RXD:        in std_logic;

	 --There are more bits in the address for this wishbone connection
	 wishbone_slot_video_in : in std_logic_vector(100 downto 0);
	 wishbone_slot_video_out : out std_logic_vector(100 downto 0);
	 vgaclkout: out std_logic;	

-- Unfortunately the Xilinx Schematic Editor does not support records, so we have to put all wishbone signals into one array.
-- This is a little cumbersome but is better then dealing with all the signals in the schematic editor.
-- This is what the original record base approach looked like:
--
-- type wishbone_bus_in_type is record
--    wb_clk_i:    std_logic;                     -- Wishbone clock
--    wb_rst_i:    std_logic;                     -- Wishbone reset (synchronous)
--    wb_dat_i:    std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
--    wb_adr_i:    std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
--    wb_we_i:     std_logic;                     -- Wishbone write enable signal
--    wb_cyc_i:    std_logic;                     -- Wishbone cycle signal
--    wb_stb_i:    std_logic;                     -- Wishbone strobe signal
-- end record;
-- 
-- type wishbone_bus_out_type is record
--    wb_dat_o:    std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
--    wb_ack_o:    std_logic;                      -- Wishbone acknowledge out signal
--    wb_inta_o:   std_logic;	 
-- end record; 
--
-- Turning them into an array looks like this:
--
-- wishbone_in : in std_logic_vector(61 downto 0);
--
--  wishbone_in_record.wb_clk_i <= wishbone_in(61);
--  wishbone_in_record.wb_rst_i <= wishbone_in(60);
--  wishbone_in_record.wb_dat_i <= wishbone_in(59 downto 28);
--  wishbone_in_record.wb_adr_i <= wishbone_in(27 downto 3);
--  wishbone_in_record.wb_we_i <= wishbone_in(2);
--  wishbone_in_record.wb_cyc_i <= wishbone_in(1);
--  wishbone_in_record.wb_stb_i <= wishbone_in(0); 
--
-- wishbone_out : out std_logic_vector(33 downto 0);
--
--  wishbone_out(33 downto 2) <= wishbone_out_record.wb_dat_o;
--  wishbone_out(1) <= wishbone_out_record.wb_ack_o;
--  wishbone_out(0) <= wishbone_out_record.wb_inta_o; 

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

	 -- wishbone_slot_15_in : out std_logic_vector(61 downto 0);
	 -- wishbone_slot_15_out : in std_logic_vector(33 downto 0)	 

  );
end entity ZPUino_Papilio_One_V2_blackbox;

architecture behave of ZPUino_Papilio_One_V2_blackbox is

  component clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    clkout_1mhz: out std_logic;
	 clk_osc_32Mhz: out std_logic;
	 vgaclkout: out std_logic;
    rstout: out std_logic
  );
  end component clkgen;

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

  signal sysrst:      std_logic;
  signal sysclk:      std_logic;
  signal sysclk_1mhz: std_logic;
  signal dbg_reset:   std_logic;
  signal clkgen_rst:  std_logic;

  signal gpio_o_reg:      std_logic_vector(zpuino_gpio_count-1 downto 0);

  signal rx: std_logic;
  signal tx: std_logic;

  -- constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    -- "0" &
    -- "0000000000000000" &
    -- "0000000000000000" &
    -- "0000000000000000";
  -- constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    -- "0" &
    -- "0000000000000000" &
    -- "0000000000000000" &
    -- "0000000000000000";

 constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
   "0" &
   "1111111111111111" &
   "1111111111111111" &
   "1111111111111111";
 constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
   "0" &
   "1111111111111111" &
   "1111111111111111" &
   "1111111111111111";

  -- I/O Signals
  signal slot_cyc:   slot_std_logic_type;
  signal slot_we:    slot_std_logic_type;
  signal slot_stb:   slot_std_logic_type;
  signal slot_read:  slot_cpuword_type;
  signal slot_write: slot_cpuword_type;
  signal slot_address:  slot_address_type;
  signal slot_ack:   slot_std_logic_type;
  signal slot_interrupt: slot_std_logic_type;
  signal slot_ids:    slot_id_type;

  signal spi_enabled:  std_logic;

  signal spi2_enabled:  std_logic;
  signal spi2_mosi:  std_logic;
  signal spi2_miso:  std_logic;
  signal spi2_sck:  std_logic;

  signal uart_enabled:  std_logic;

  -- SPP signals

  signal gpio_spp_data: std_logic_vector(PPSCOUNT_OUT-1 downto 0);
  signal gpio_spp_read: std_logic_vector(PPSCOUNT_IN-1 downto 0);

  signal ppsout_info_slot: ppsoutinfotype := (others => -1);
  signal ppsout_info_pin:  ppsoutinfotype;
  signal ppsin_info_slot: ppsininfotype := (others => -1);
  signal ppsin_info_pin:  ppsininfotype;

  signal timers_interrupt:  std_logic_vector(1 downto 0);
  signal timers_pwm: std_logic_vector(1 downto 0);

  signal sigmadelta_spp_en:  std_logic_vector(1 downto 0);
  signal sigmadelta_spp_data:  std_logic_vector(1 downto 0);

  signal spi_pf_miso: std_logic;
  signal spi_pf_mosi: std_logic;
  signal spi_pf_sck: std_logic;

  signal wb_clk_i: std_logic;
  signal wb_rst_i: std_logic;

  signal uart2_tx, uart2_rx: std_logic;

  signal jtag_data_chain_out: std_logic_vector(98 downto 0);
  signal jtag_ctrl_chain_in:  std_logic_vector(11 downto 0);
  
 
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
  signal wishbone_slot_15_in_record  : wishbone_bus_in_type;
  signal wishbone_slot_15_out_record : wishbone_bus_out_type;  

  signal gpio_bus_in_record : gpio_bus_in_type;
  signal gpio_bus_out_record : gpio_bus_out_type;  


  component zpuino_debug_spartan3e is
  port (
    TCK: out std_logic;
    TDI: out std_logic;
    CAPTUREIR: out std_logic;
    UPDATEIR:  out std_logic;
    SHIFTIR:  out std_logic;
    CAPTUREDR: out std_logic;
    UPDATEDR:  out std_logic;
    SHIFTDR:  out std_logic;
    TLR:  out std_logic;
    TDO_IR:   in std_logic;
    TDO_DR:   in std_logic
  );
  end component;

begin

-- Unpack the wishbone array into a record so the modules code is not confusing.
-- These are backwards for the master.
--  wishbone_slot_video_in_record.wb_clk_i <= wishbone_slot_video_in(61);
--  wishbone_slot_video_in_record.wb_rst_i <= wishbone_slot_video_in(60);
--  wishbone_slot_video_in_record.wb_dat_i <= wishbone_slot_video_in(59 downto 28);
--  wishbone_slot_video_in_record.wb_adr_i <= wishbone_slot_video_in(27 downto 3);
--  wishbone_slot_video_in_record.wb_we_i <= wishbone_slot_video_in(2);
--  wishbone_slot_video_in_record.wb_cyc_i <= wishbone_slot_video_in(1);
--  wishbone_slot_video_in_record.wb_stb_i <= wishbone_slot_video_in(0); 
--  wishbone_slot_video_out(33 downto 2) <= wishbone_slot_video_out_record.wb_dat_o;
--  wishbone_slot_video_out(1) <= wishbone_slot_video_out_record.wb_ack_o;
--  wishbone_slot_video_out(0) <= wishbone_slot_video_out_record.wb_inta_o;  

  wishbone_slot_5_in(61) <= wishbone_slot_5_in_record.wb_clk_i;
  wishbone_slot_5_in(60) <= wishbone_slot_5_in_record.wb_rst_i;
  wishbone_slot_5_in(59 downto 28) <= wishbone_slot_5_in_record.wb_dat_i;
  wishbone_slot_5_in(27 downto 3) <= wishbone_slot_5_in_record.wb_adr_i;
  wishbone_slot_5_in(2) <= wishbone_slot_5_in_record.wb_we_i;
  wishbone_slot_5_in(1) <= wishbone_slot_5_in_record.wb_cyc_i;
  wishbone_slot_5_in(0) <= wishbone_slot_5_in_record.wb_stb_i; 
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
  wishbone_slot_14_out_record.wb_dat_o <= wishbone_slot_14_out(33 downto 2);
  wishbone_slot_14_out_record.wb_ack_o <= wishbone_slot_14_out(1);
  wishbone_slot_14_out_record.wb_inta_o <= wishbone_slot_14_out(0); 

  -- wishbone_slot_15_in(61) <= wishbone_slot_15_in_record.wb_clk_i;
  -- wishbone_slot_15_in(60) <= wishbone_slot_15_in_record.wb_rst_i;
  -- wishbone_slot_15_in(59 downto 28) <= wishbone_slot_15_in_record.wb_dat_i;
  -- wishbone_slot_15_in(27 downto 3) <= wishbone_slot_15_in_record.wb_adr_i;
  -- wishbone_slot_15_in(2) <= wishbone_slot_15_in_record.wb_we_i;
  -- wishbone_slot_15_in(1) <= wishbone_slot_15_in_record.wb_cyc_i;
  -- wishbone_slot_15_in(0) <= wishbone_slot_15_in_record.wb_stb_i; 
  -- wishbone_slot_15_out_record.wb_dat_o <= wishbone_slot_15_out(33 downto 2);
  -- wishbone_slot_15_out_record.wb_ack_o <= wishbone_slot_15_out(1);
  -- wishbone_slot_15_out_record.wb_inta_o <= wishbone_slot_15_out(0);   

  gpio_bus_in_record.gpio_spp_data <= gpio_bus_in(49+(PPSCOUNT_OUT-1) downto 49);
  gpio_bus_in_record.gpio_i <= gpio_bus_in(48 downto 0);

  gpio_bus_out(147) <= gpio_bus_out_record.gpio_clk;
  gpio_bus_out(146 downto 98) <= gpio_bus_out_record.gpio_o;
  gpio_bus_out(97 downto 49) <= gpio_bus_out_record.gpio_t;
  gpio_bus_out(48 downto 0) <= gpio_bus_out_record.gpio_spp_read;

  gpio_bus_out_record.gpio_o <= gpio_o_reg;
  gpio_bus_out_record.gpio_clk <= sysclk;

  wb_clk_i <= sysclk;
  wb_rst_i <= sysrst;
  
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
  
   --Wishbone 15
  -- wishbone_slot_15_in_record.wb_clk_i <= sysclk;
  -- wishbone_slot_15_in_record.wb_rst_i <= sysrst;
  -- slot_read(15) <= wishbone_slot_15_out_record.wb_dat_o;
  -- wishbone_slot_15_in_record.wb_dat_i <= slot_write(15);
  -- wishbone_slot_15_in_record.wb_adr_i <= slot_address(15);
  -- wishbone_slot_15_in_record.wb_we_i <= slot_we(15);
  -- wishbone_slot_15_in_record.wb_cyc_i <= slot_cyc(15);
  -- wishbone_slot_15_in_record.wb_stb_i <= slot_stb(15);
  -- slot_ack(15) <= wishbone_slot_15_out_record.wb_ack_o;
  -- slot_interrupt(15) <= wishbone_slot_15_out_record.wb_inta_o;
  
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
    --sysrst <= clkgen_rst;


  clkgen_inst: clkgen
  port map (
    clkin   => clk,
    rstin   => dbg_reset,
    clkout  => sysclk,
	 vgaclkout => vgaclkout,
    clkout_1mhz => clk_1Mhz,
	 clk_osc_32Mhz => clk_osc_32Mhz,
    rstout  => clkgen_rst
  );

  clk_96Mhz <= sysclk;

  zpuino:zpuino_top
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

      m_wb_dat_o    => open,
      m_wb_dat_i    => (others => 'X'),
      m_wb_adr_i    => (others => 'X'),
      m_wb_we_i     => '0',
      m_wb_cyc_i    => '0',
      m_wb_stb_i    => '0',
      m_wb_ack_o    => open,

      dbg_reset     => dbg_reset,
      jtag_data_chain_out => open,--jtag_data_chain_out,
      jtag_ctrl_chain_in  => (others=>'0')--jtag_ctrl_chain_in

    );

--  dbgport: zpuino_debug_jtag
--    port map (
--      jtag_data_chain_in => jtag_data_chain_out,
--      jtag_ctrl_chain_out => jtag_ctrl_chain_in,

--      TCK         => TCK,
--      TDI         => TDI,
--      CAPTUREIR   => CAPTUREIR,
--      UPDATEIR    => UPDATEIR,
--      SHIFTIR     => SHIFTIR,
--      CAPTUREDR   => CAPTUREDR,
--      UPDATEDR    => UPDATEDR,
--      SHIFTDR     => SHIFTDR,
--      TLR         => TLR,

--      TDO_IR      => TDO_IR,
--      TDO_DR      => TDO_DR
 --   );


--  dbgport_s3e: zpuino_debug_spartan3e
--    port map (
--
--      TCK         => TCK,
--      TDI         => TDI,
--      CAPTUREIR   => CAPTUREIR,
--      UPDATEIR    => UPDATEIR,
--      SHIFTIR     => SHIFTIR,
 --     CAPTUREDR   => CAPTUREDR,
  --    UPDATEDR    => UPDATEDR,
 --     SHIFTDR     => SHIFTDR,
--      TLR         => TLR,
--
--      TDO_IR      => TDO_IR,
--      TDO_DR      => TDO_DR
--
 --   );




  --
  --
  -- ----------------  I/O connection to devices --------------------
  --
  --

  --
  -- IO SLOT 4
  --

  slot4: zpuino_spi
  port map (
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(4),
    wb_dat_i  => slot_write(4),
    wb_adr_i  => slot_address(4),
    wb_we_i   => slot_we(4),
    wb_cyc_i  => slot_cyc(4),
    wb_stb_i  => slot_stb(4),
    wb_ack_o  => slot_ack(4),
    -- Taken by timer controller, wb_inta_o => slot_interrupt(4),
    id        => slot_ids(4),

    mosi      => spi_pf_mosi,
    miso      => spi_pf_miso,
    sck       => spi_pf_sck,
    enabled   => spi_enabled
  );

  --
  -- IO SLOT 1
  --

  uart_inst: zpuino_uart
  port map (
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(1),
    wb_dat_i  => slot_write(1),
    wb_adr_i  => slot_address(1),
    wb_we_i   => slot_we(1),
    wb_cyc_i  => slot_cyc(1),
    wb_stb_i  => slot_stb(1),
    wb_ack_o  => slot_ack(1),
    wb_inta_o => slot_interrupt(1),
    id        => slot_ids(1),

    enabled   => uart_enabled,
    tx        => tx,
    rx        => rx
  );

  --
  -- IO SLOT 2
  --

  gpio_inst: zpuino_gpio
  generic map (
    gpio_count => zpuino_gpio_count
  )
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(2),
    wb_dat_i     => slot_write(2),
    wb_adr_i   => slot_address(2),
    wb_we_i        => slot_we(2),
    wb_cyc_i       => slot_cyc(2),
    wb_stb_i       => slot_stb(2),
    wb_ack_o      => slot_ack(2),
    wb_inta_o => slot_interrupt(2),
    id        => slot_ids(2),
    spp_data  => gpio_spp_data(PPSCOUNT_OUT-1 downto 0),
    spp_read  => gpio_bus_out_record.gpio_spp_read(PPSCOUNT_IN-1 downto 0),

    gpio_i      => gpio_bus_in_record.gpio_i,
    gpio_t      => gpio_bus_out_record.gpio_t,
    gpio_o      => gpio_o_reg,
    spp_cap_in   => spp_cap_in,
    spp_cap_out  => spp_cap_out
  );

  --
  -- IO SLOT 3
  --

  timers_inst: zpuino_timers
  generic map (
    A_TSCENABLED        => true,
    A_PWMCOUNT          => 1,
    A_WIDTH             => 16,
    A_PRESCALER_ENABLED => true,
    A_BUFFERS           => true,
    B_TSCENABLED        => false,
    B_PWMCOUNT          => 1,
    B_WIDTH             => 24,
    B_PRESCALER_ENABLED => false,
    B_BUFFERS           => false
  )
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(3),
    wb_dat_i     => slot_write(3),
    wb_adr_i   => slot_address(3),
    wb_we_i        => slot_we(3),
    wb_cyc_i        => slot_cyc(3),
    wb_stb_i        => slot_stb(3),
    wb_ack_o      => slot_ack(3),

    wb_inta_o => slot_interrupt(3), -- We use two interrupt lines
    wb_intb_o => slot_interrupt(4), -- so we borrow intr line from slot 4
    id        => slot_ids(3),
    pwm_a_out   => timers_pwm(0 downto 0),
    pwm_b_out   => timers_pwm(1 downto 1)
  );

  --
  -- IO SLOT 5
  --

  -- sigmadelta_inst: zpuino_sigmadelta
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i    => wb_rst_i,
    -- wb_dat_o      => slot_read(5),
    -- wb_dat_i     => slot_write(5),
    -- wb_adr_i   => slot_address(5),
    -- wb_we_i        => slot_we(5),
    -- wb_cyc_i        => slot_cyc(5),
    -- wb_stb_i        => slot_stb(5),
    -- wb_ack_o      => slot_ack(5),
    -- wb_inta_o => slot_interrupt(5),
    -- id        => slot_id(5),
    -- spp_data  => sigmadelta_spp_data,
    -- spp_en    => sigmadelta_spp_en,
    -- sync_in   => '1'
  -- );

  -- --
  -- -- IO SLOT 6
  -- --

  -- slot6: zpuino_spi
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i    => wb_rst_i,
    -- wb_dat_o      => slot_read(6),
    -- wb_dat_i     => slot_write(6),
    -- wb_adr_i   => slot_address(6),
    -- wb_we_i        => slot_we(6),
    -- wb_cyc_i        => slot_cyc(6),
    -- wb_stb_i        => slot_stb(6),
    -- wb_ack_o      => slot_ack(6),
    -- wb_inta_o => slot_interrupt(6),
    -- id        => slot_id(6),

    -- mosi      => spi2_mosi, -- PPS OUT PIN 0
    -- miso      => spi2_miso, -- PPS IN  PIN 0
    -- sck       => spi2_sck,  -- PPS OUT PIN 1
    -- enabled   => open
  -- );



  --
  -- IO SLOT 7
  --

  crc16_inst: zpuino_crc16
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o     => slot_read(7),
    wb_dat_i     => slot_write(7),
    wb_adr_i   => slot_address(7),
    wb_we_i     => slot_we(7),
    wb_cyc_i        => slot_cyc(7),
    wb_stb_i        => slot_stb(7),
    wb_ack_o      => slot_ack(7),
    wb_inta_o => slot_interrupt(7),
    id        => slot_ids(7)
  );

  --
  -- IO SLOT 8 (optional)
  --

  -- adc_inst: zpuino_empty_device
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i    => wb_rst_i,
    -- wb_dat_o      => slot_read(8),
    -- wb_dat_i     => slot_write(8),
    -- wb_adr_i   => slot_address(8),
    -- wb_we_i    => slot_we(8),
    -- wb_cyc_i      => slot_cyc(8),
    -- wb_stb_i      => slot_stb(8),
    -- wb_ack_o      => slot_ack(8),
    -- wb_inta_o =>  slot_interrupt(8),
    -- id        => slot_id(8)
  -- );

  -- --
  -- -- IO SLOT 9
  -- --

  -- slot9: zpuino_empty_device
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i       => wb_rst_i,
    -- wb_dat_o      => slot_read(9),
    -- wb_dat_i     => slot_write(9),
    -- wb_adr_i   => slot_address(9),
    -- wb_we_i        => slot_we(9),
    -- wb_cyc_i        => slot_cyc(9),
    -- wb_stb_i        => slot_stb(9),
    -- wb_ack_o      => slot_ack(9),
    -- wb_inta_o => slot_interrupt(9),
    -- id        => slot_id(9)
  -- );

  -- --
  -- -- IO SLOT 10
  -- --

  -- slot10: zpuino_empty_device
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i       => wb_rst_i,
    -- wb_dat_o      => slot_read(10),
    -- wb_dat_i     => slot_write(10),
    -- wb_adr_i   => slot_address(10),
    -- wb_we_i        => slot_we(10),
    -- wb_cyc_i        => slot_cyc(10),
    -- wb_stb_i        => slot_stb(10),
    -- wb_ack_o      => slot_ack(10),
    -- wb_inta_o => slot_interrupt(10),
    -- id        => slot_id(10)
  -- );

  --
  -- IO SLOT 11
  --

  -- slot11: zpuino_uart
  -- generic map (
    -- bits => 4
  -- )
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i    => wb_rst_i,
    -- wb_dat_o      => slot_read(11),
    -- wb_dat_i     => slot_write(11),
    -- wb_adr_i   => slot_address(11),
    -- wb_we_i      => slot_we(11),
    -- wb_cyc_i       => slot_cyc(11),
    -- wb_stb_i       => slot_stb(11),
    -- wb_ack_o      => slot_ack(11),

    -- wb_inta_o => slot_interrupt(11),
    -- id        => slot_id(11),
    -- tx        => uart2_tx,
    -- rx        => uart2_rx
  -- );

  --
  -- IO SLOT 12
  --

  -- slot12: zpuino_empty_device
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i       => wb_rst_i,
    -- wb_dat_o      => slot_read(12),
    -- wb_dat_i     => slot_write(12),
    -- wb_adr_i   => slot_address(12),
    -- wb_we_i        => slot_we(12),
    -- wb_cyc_i        => slot_cyc(12),
    -- wb_stb_i        => slot_stb(12),
    -- wb_ack_o      => slot_ack(12),
    -- wb_inta_o => slot_interrupt(12),
    -- id        => slot_id(12)
  -- );

  --
  -- IO SLOT 13
  --

  -- slot13: zpuino_empty_device
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i       => wb_rst_i,
    -- wb_dat_o      => slot_read(13),
    -- wb_dat_i     => slot_write(13),
    -- wb_adr_i   => slot_address(13),
    -- wb_we_i        => slot_we(13),
    -- wb_cyc_i        => slot_cyc(13),
    -- wb_stb_i        => slot_stb(13),
    -- wb_ack_o      => slot_ack(13),
    -- wb_inta_o => slot_interrupt(13),
    -- id        => slot_id(13)
  -- );

  --
  -- IO SLOT 14
  --

  -- slot14: zpuino_empty_device
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i       => wb_rst_i,
    -- wb_dat_o      => slot_read(14),
    -- wb_dat_i     => slot_write(14),
    -- wb_adr_i   => slot_address(14),
    -- wb_we_i        => slot_we(14),
    -- wb_cyc_i        => slot_cyc(14),
    -- wb_stb_i        => slot_stb(14),
    -- wb_ack_o      => slot_ack(14),
    -- wb_inta_o => slot_interrupt(14),
    -- id        => slot_id(14)
  -- );

  --
  -- IO SLOT 15
  --

  -- slot15: zpuino_empty_device
  -- port map (
    -- wb_clk_i       => wb_clk_i,
	 	-- wb_rst_i       => wb_rst_i,
    -- wb_dat_o      => slot_read(15),
    -- wb_dat_i     => slot_write(15),
    -- wb_adr_i   => slot_address(15),
    -- wb_we_i        => slot_we(15),
    -- wb_cyc_i        => slot_cyc(15),
    -- wb_stb_i        => slot_stb(15),
    -- wb_ack_o      => slot_ack(15),
    -- wb_inta_o => slot_interrupt(15),
    -- id        => slot_id(15)
  -- );


--	ym2149_audio_dac <= ym2149_audio_data & "0000000000";
--
--   mixer: zpuino_io_audiomixer
--         port map (
--     clk     => wb_clk_i,
--     rst     => wb_rst_i,
--     ena     => '1',
--     
--     data_in1  => sid_audio_data,
--     data_in2  => ym2149_audio_dac,
--     data_in3  => sigmadelta_raw,
--     
--     audio_out => platform_audio_sd
--     );


--  pin00: IOPAD port map(I => gpio_o(0), O => gpio_i(0), T => gpio_t(0), C => sysclk,PAD => WING_A(0) );
--  pin01: IOPAD port map(I => gpio_o(1), O => gpio_i(1), T => gpio_t(1), C => sysclk,PAD => WING_A(1) );
--  pin02: IOPAD port map(I => gpio_o(2), O => gpio_i(2), T => gpio_t(2), C => sysclk,PAD => WING_A(2) );
--  pin03: IOPAD port map(I => gpio_o(3), O => gpio_i(3), T => gpio_t(3), C => sysclk,PAD => WING_A(3) );
--  pin04: IOPAD port map(I => gpio_o(4), O => gpio_i(4), T => gpio_t(4), C => sysclk,PAD => WING_A(4) );
--  pin05: IOPAD port map(I => gpio_o(5), O => gpio_i(5), T => gpio_t(5), C => sysclk,PAD => WING_A(5) );
--  pin06: IOPAD port map(I => gpio_o(6), O => gpio_i(6), T => gpio_t(6), C => sysclk,PAD => WING_A(6) );
--  pin07: IOPAD port map(I => gpio_o(7), O => gpio_i(7), T => gpio_t(7), C => sysclk,PAD => WING_A(7) );
--  pin08: IOPAD port map(I => gpio_o(8), O => gpio_i(8), T => gpio_t(8), C => sysclk,PAD => WING_A(8) );
--  pin09: IOPAD port map(I => gpio_o(9), O => gpio_i(9), T => gpio_t(9), C => sysclk,PAD => WING_A(9) );
--  pin10: IOPAD port map(I => gpio_o(10),O => gpio_i(10),T => gpio_t(10),C => sysclk,PAD => WING_A(10) );
--  pin11: IOPAD port map(I => gpio_o(11),O => gpio_i(11),T => gpio_t(11),C => sysclk,PAD => WING_A(11) );
--  pin12: IOPAD port map(I => gpio_o(12),O => gpio_i(12),T => gpio_t(12),C => sysclk,PAD => WING_A(12) );
--  pin13: IOPAD port map(I => gpio_o(13),O => gpio_i(13),T => gpio_t(13),C => sysclk,PAD => WING_A(13) );
--  pin14: IOPAD port map(I => gpio_o(14),O => gpio_i(14),T => gpio_t(14),C => sysclk,PAD => WING_A(14) );
--  pin15: IOPAD port map(I => gpio_o(15),O => gpio_i(15),T => gpio_t(15),C => sysclk,PAD => WING_A(15) );
--
--  pin16: IOPAD port map(I => gpio_o(16),O => gpio_i(16),T => gpio_t(16),C => sysclk,PAD => WING_B(0) );
--  pin17: IOPAD port map(I => gpio_o(17),O => gpio_i(17),T => gpio_t(17),C => sysclk,PAD => WING_B(1) );
--  pin18: IOPAD port map(I => gpio_o(18),O => gpio_i(18),T => gpio_t(18),C => sysclk,PAD => WING_B(2) );
--  pin19: IOPAD port map(I => gpio_o(19),O => gpio_i(19),T => gpio_t(19),C => sysclk,PAD => WING_B(3) );
--  pin20: IOPAD port map(I => gpio_o(20),O => gpio_i(20),T => gpio_t(20),C => sysclk,PAD => WING_B(4) );
--  pin21: IOPAD port map(I => gpio_o(21),O => gpio_i(21),T => gpio_t(21),C => sysclk,PAD => WING_B(5) );
--  pin22: IOPAD port map(I => gpio_o(22),O => gpio_i(22),T => gpio_t(22),C => sysclk,PAD => WING_B(6) );
--  pin23: IOPAD port map(I => gpio_o(23),O => gpio_i(23),T => gpio_t(23),C => sysclk,PAD => WING_B(7) );
--  pin24: IOPAD port map(I => gpio_o(24),O => gpio_i(24),T => gpio_t(24),C => sysclk,PAD => WING_B(8) );
--  pin25: IOPAD port map(I => gpio_o(25),O => gpio_i(25),T => gpio_t(25),C => sysclk,PAD => WING_B(9) );
--  pin26: IOPAD port map(I => gpio_o(26),O => gpio_i(26),T => gpio_t(26),C => sysclk,PAD => WING_B(10) );
--  pin27: IOPAD port map(I => gpio_o(27),O => gpio_i(27),T => gpio_t(27),C => sysclk,PAD => WING_B(11) );
--  pin28: IOPAD port map(I => gpio_o(28),O => gpio_i(28),T => gpio_t(28),C => sysclk,PAD => WING_B(12) );
--  pin29: IOPAD port map(I => gpio_o(29),O => gpio_i(29),T => gpio_t(29),C => sysclk,PAD => WING_B(13) );
--  pin30: IOPAD port map(I => gpio_o(30),O => gpio_i(30),T => gpio_t(30),C => sysclk,PAD => WING_B(14) );
--  pin31: IOPAD port map(I => gpio_o(31),O => gpio_i(31),T => gpio_t(31),C => sysclk,PAD => WING_B(15) );
--
--  pin32: IOPAD port map(I => gpio_o(32),O => gpio_i(32),T => gpio_t(32),C => sysclk,PAD => WING_C(0) );
--  pin33: IOPAD port map(I => gpio_o(33),O => gpio_i(33),T => gpio_t(33),C => sysclk,PAD => WING_C(1) );
--  pin34: IOPAD port map(I => gpio_o(34),O => gpio_i(34),T => gpio_t(34),C => sysclk,PAD => WING_C(2) );
--  pin35: IOPAD port map(I => gpio_o(35),O => gpio_i(35),T => gpio_t(35),C => sysclk,PAD => WING_C(3) );
--  pin36: IOPAD port map(I => gpio_o(36),O => gpio_i(36),T => gpio_t(36),C => sysclk,PAD => WING_C(4) );
--  pin37: IOPAD port map(I => gpio_o(37),O => gpio_i(37),T => gpio_t(37),C => sysclk,PAD => WING_C(5) );
--  pin38: IOPAD port map(I => gpio_o(38),O => gpio_i(38),T => gpio_t(38),C => sysclk,PAD => WING_C(6) );
--  pin39: IOPAD port map(I => gpio_o(39),O => gpio_i(39),T => gpio_t(39),C => sysclk,PAD => WING_C(7) );
--  pin40: IOPAD port map(I => gpio_o(40),O => gpio_i(40),T => gpio_t(40),C => sysclk,PAD => WING_C(8) );
--  pin41: IOPAD port map(I => gpio_o(41),O => gpio_i(41),T => gpio_t(41),C => sysclk,PAD => WING_C(9) );
--  pin42: IOPAD port map(I => gpio_o(42),O => gpio_i(42),T => gpio_t(42),C => sysclk,PAD => WING_C(10) );
--  pin43: IOPAD port map(I => gpio_o(43),O => gpio_i(43),T => gpio_t(43),C => sysclk,PAD => WING_C(11) );
--  pin44: IOPAD port map(I => gpio_o(44),O => gpio_i(44),T => gpio_t(44),C => sysclk,PAD => WING_C(12) );
--  pin45: IOPAD port map(I => gpio_o(45),O => gpio_i(45),T => gpio_t(45),C => sysclk,PAD => WING_C(13) );
--  pin46: IOPAD port map(I => gpio_o(46),O => gpio_i(46),T => gpio_t(46),C => sysclk,PAD => WING_C(14) );
--  pin47: IOPAD port map(I => gpio_o(47),O => gpio_i(47),T => gpio_t(47),C => sysclk,PAD => WING_C(15) );


  -- Other ports are special, we need to avoid outputs on input-only pins

  ibufrx:   IPAD port map ( PAD => RXD,        O => rx, C => sysclk );
  ibufmiso: IPAD port map ( PAD => SPI_MISO,   O => spi_pf_miso, C => sysclk );
  obuftx:   OPAD port map ( I => tx,   PAD => TXD );
  ospiclk:  OPAD port map ( I => spi_pf_sck,   PAD => SPI_SCK );
  ospics:   OPAD port map ( I => gpio_o_reg(48),   PAD => SPI_CS );
  ospimosi: OPAD port map ( I => spi_pf_mosi,   PAD => SPI_MOSI );


  gpio_spp_data(5 downto 0) <= gpio_bus_in_record.gpio_spp_data(5 downto 0);
  
  process(gpio_spp_read, timers_pwm)
  begin

    --gpio_bus_in_record.gpio_spp_data <= (others => DontCareValue);

    -- PPS Outputs
    -- gpio_spp_data(0)  <= sigmadelta_spp_data(0);   -- PPS0 : SIGMADELTA DATA
    -- ppsout_info_slot(0) <= 5; -- Slot 5
    -- ppsout_info_pin(0) <= 0;  -- PPS OUT pin 0 (Channel 0)
	
    ppsout_info_slot(0) <= 20; -- Slot 
    ppsout_info_pin(0) <= 0;  -- PPS OUT pin

    ppsout_info_slot(1) <= 20; -- Slot
    ppsout_info_pin(1) <= 0;  -- PPS OUT pin 

    ppsout_info_slot(2) <= 20; -- Slot
    ppsout_info_pin(2) <= 0;  -- PPS OUT pin

    ppsout_info_slot(3) <= 20; -- Slot
    ppsout_info_pin(3) <= 0;  -- PPS OUT pin

    ppsout_info_slot(4) <= 20; -- Slot
    ppsout_info_pin(4) <= 0;  -- PPS OUT pin 

    ppsout_info_slot(5) <= 20; -- Slot
    ppsout_info_pin(5) <= 0;  -- PPS OUT pin

    gpio_spp_data(6)  <= timers_pwm(0);            -- PPS1 : TIMER0
    ppsout_info_slot(6) <= 3; -- Slot 3
    ppsout_info_pin(6) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    gpio_spp_data(7)  <= timers_pwm(1);            -- PPS2 : TIMER1
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
