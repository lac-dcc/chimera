--
--
--  ZPUINO implementation on Terasic DE0-Nano Board
-- 
--  Copyright 2017 Alvaro Lopes <alvieboy@alvie.com>
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

entity de0_nano_top is
  port (
    -- Clock
    CLOCK_50:       in std_logic;
    -- LED
    LED:            out std_logic_vector(7 downto 0);
    -- Debounced keys
    KEY:            in std_logic_vector(1 downto 0);
    -- DIP switches
    SW:             in std_logic_vector(3 downto 0);
    -- DRAM connections
    DRAM_ADDR:      out std_logic_vector(12 downto 0);
    DRAM_BA:        out std_logic_vector(1 downto 0);
    DRAM_CAS_N:     out std_logic;
    DRAM_CKE:       out std_logic;
    DRAM_CLK:       out std_logic;
    DRAM_CS_N:      out std_logic;
    DRAM_DQ:        inout std_logic_vector(15 downto 0);
    DRAM_DQM:       out std_logic_vector(1 downto 0);
    DRAM_RAS_N:     out std_logic;
    DRAM_WE_N:      out std_logic;
    -- EPCS (serial flash)
    EPCS_ASDO:      out std_logic;
    EPCS_DATA0:     in std_logic;
    EPCS_DCLK:      out std_logic;
    EPCS_NCSO:      out std_logic;
    -- I2C sensor
    G_SENSOR_CS_N:  out std_logic;
    G_SENSOR_INT:   in std_logic;
    I2C_SCLK:       inout std_logic;
    I2C_SDAT:       inout std_logic;
    -- ADC
    ADC_CS_N:       out std_logic;
    ADC_SADDR:      out std_logic;
    ADC_SCLK:       out std_logic;
    ADC_SDAT:       in std_logic;
    -- GPIO Header 0
    GPIO_0:         inout std_logic_vector(33 downto 0);
    GPIO_0_IN:      in std_logic_vector(1 downto 0);
    -- GPIO Header 1
    GPIO_1:         inout std_logic_vector(33 downto 0);
    GPIO_1_IN:      in std_logic_vector(1 downto 0);
    -- GPIO Header 2
    GPIO_2:         inout std_logic_vector(12 downto 0);
    GPIO_2_IN:      in std_logic_vector(2 downto 0)
  );
end entity de0_nano_top;


architecture behave of de0_nano_top is

  signal sysrst:      std_logic;
  signal sysclk:      std_logic;
  signal clkgen_rst:  std_logic;
  signal wb_clk_i:    std_logic;
  signal wb_rst_i:    std_logic;

  signal gpio_o:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_i:      std_logic_vector(zpuino_gpio_count-1 downto 0);

  constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "000000000000000000000000000000000000000000000000" &
    "1111111111111111" & "1111111111111111" & "1111111111111111";

  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "000000000000000000000000000000000000000000000000" &
    "1111111111111111" & "1111111111111111" & "1111111111111111";

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

  signal sram_wb_ack_o:       std_logic;
  signal sram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal sram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal sram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal sram_wb_cyc_i:       std_logic;
  signal sram_wb_stb_i:       std_logic;
  signal sram_wb_we_i:        std_logic;
  signal sram_wb_sel_i:       std_logic_vector(3 downto 0);
  signal sram_wb_stall_o:     std_logic;

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

  signal m_wb_ack_o:       std_logic;
  signal m_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal m_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal m_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal m_wb_cyc_i:       std_logic;
  signal m_wb_stb_i:       std_logic;
  signal m_wb_we_i:        std_logic;
  signal m_wb_cti_i:       std_logic_vector(2 downto 0);
  signal m_wb_stall_o:     std_logic;

  signal memory_enable: std_logic;

  signal uart2_rx: std_logic;
  signal uart2_tx: std_logic;

  signal ramwbi:  wb_mosi_type;
  signal ramwbo:  wb_p_miso_type;


  alias SPI_MISO: std_logic is EPCS_DATA0;
  alias SPI_MOSI: std_logic is EPCS_ASDO;
  alias SPI_SCK:  std_logic is EPCS_DCLK;
  alias SPI_CS:   std_logic is EPCS_NCSO;

  alias CLK:      std_ulogic is CLOCK_50;

  signal scl_pad_i     : std_logic;                    -- i2c clock line input
  signal scl_pad_o     : std_logic;                    -- i2c clock line output
  signal scl_padoen_o  : std_logic;                    -- i2c clock line output enable, active low
  signal sda_pad_i     : std_logic;                    -- i2c data line input
  signal sda_pad_o     : std_logic;                    -- i2c data line output
  signal sda_padoen_o  : std_logic;                    -- i2c data line output enable, active low

  signal scl2_pad_i     : std_logic;                    -- i2c clock line input
  signal scl2_pad_o     : std_logic;                    -- i2c clock line output
  signal scl2_padoen_o  : std_logic;                    -- i2c clock line output enable, active low
  signal sda2_pad_i     : std_logic;                    -- i2c data line input
  signal sda2_pad_o     : std_logic;                    -- i2c data line output
  signal sda2_padoen_o  : std_logic;                    -- i2c data line output enable, active low



  alias RXD:        std_logic is GPIO_0(0);
  alias TXD:        std_logic is GPIO_0(1);
  alias WING_C_0:   std_logic is GPIO_0(2);
  alias WING_C_1:   std_logic is GPIO_0(3);
  -- GPIO0(4) is unconnected on adaptor board
  alias WING_C_3:   std_logic is GPIO_0(5);
  alias WING_C_2:   std_logic is GPIO_0(6);
  alias WING_C_5:   std_logic is GPIO_0(7);
  alias WING_C_4:   std_logic is GPIO_0(8);
  alias RGB_G0:     std_logic is GPIO_0(9);

  alias WING_C_7:   std_logic is GPIO_0(10);
  alias WING_C_6:   std_logic is GPIO_0(11);
  alias WING_C_9:   std_logic is GPIO_0(12);
  alias RGB_R0:     std_logic is GPIO_0(13);
  alias WING_C_8:   std_logic is GPIO_0(14);
  alias RGB_B0:     std_logic is GPIO_0(15);
  alias RGB_R1:     std_logic is GPIO_0(16);
  alias RGB_G1:     std_logic is GPIO_0(17);
  alias RGB_A:      std_logic is GPIO_0(18);
  alias RGB_B1:     std_logic is GPIO_0(19);

  alias WING_C_10:  std_logic is GPIO_0(20);
  alias WING_C_11:  std_logic is GPIO_0(21);
  alias RGB_B:      std_logic is GPIO_0(22);
  alias RGB_C:      std_logic is GPIO_0(23);
  alias WING_C_12:  std_logic is GPIO_0(24);
  alias WING_C_13:  std_logic is GPIO_0(25);
  alias RGB_D:      std_logic is GPIO_0(26);
  alias RGB_CLK:    std_logic is GPIO_0(27);
  alias RGB_STB:    std_logic is GPIO_0(28);
  alias RGB_OE:     std_logic is GPIO_0(29);
  -- GPIO0(30) is unconnected on adaptor board
  alias WING_C_14:  std_logic is GPIO_0(31);
  alias WING_C_15:  std_logic is GPIO_0(32);
  -- GPIO0(33) is unconnected on adaptor board

  alias WING_B_0:   std_logic is GPIO_1(33);
  alias WING_B_1:   std_logic is GPIO_1(31);
  alias WING_B_2:   std_logic is GPIO_1(29);
  alias WING_B_3:   std_logic is GPIO_1(27);
  alias WING_B_4:   std_logic is GPIO_1(25);
  alias WING_B_5:   std_logic is GPIO_1(23);
  alias WING_B_6:   std_logic is GPIO_1(21);
  alias WING_B_7:   std_logic is GPIO_1(19);
  alias WING_B_8:   std_logic is GPIO_1(17);
  alias WING_B_9:   std_logic is GPIO_1(15);
  alias WING_B_10:  std_logic is GPIO_1(13);
  alias WING_B_11:  std_logic is GPIO_1(11);
  alias WING_B_12:  std_logic is GPIO_1(9);
  alias WING_B_13:  std_logic is GPIO_1(7);
  alias WING_B_14:  std_logic is GPIO_1(5);
  alias WING_B_15:  std_logic is GPIO_1(3);

  alias WING_A_0:   std_logic is GPIO_1(2);
  alias WING_A_1:   std_logic is GPIO_1(4);
  alias WING_A_2:   std_logic is GPIO_1(6);
  alias WING_A_3:   std_logic is GPIO_1(8);
  alias WING_A_4:   std_logic is GPIO_1(10);
  alias WING_A_5:   std_logic is GPIO_1(12);
  alias WING_A_6:   std_logic is GPIO_1(14);
  alias WING_A_7:   std_logic is GPIO_1(16);
  alias WING_A_8:   std_logic is GPIO_1(18);
  alias WING_A_9:   std_logic is GPIO_1(20);
  alias WING_A_10:  std_logic is GPIO_1(22);
  alias WING_A_11:  std_logic is GPIO_1(24);
  alias WING_A_12:  std_logic is GPIO_1(26);
  alias WING_A_13:  std_logic is GPIO_1(28);
  alias WING_A_14:  std_logic is GPIO_1(30);
  alias WING_A_15:  std_logic is GPIO_1(32);



  signal clk16: std_logic;

  signal PRi:         std_logic_vector(1 downto 0);
  signal PGi:         std_logic_vector(1 downto 0);
  signal PBi:         std_logic_vector(1 downto 0);
  signal PSELAi:      std_logic;
  signal PSELBi:      std_logic;
  signal PSELCi:      std_logic;
  signal PSELDi:      std_logic;
  signal POEi:        std_logic;
  signal PSTBi:       std_logic;
  signal PCLKi:       std_logic_vector(0 downto 0);


  signal LEDi: std_logic_vector(7 downto 0);

begin

  wb_clk_i <= sysclk;
  wb_rst_i <= sysrst;

  rstgen: entity work.zpuino_serialreset
    generic map (
      SYSTEM_CLOCK_MHZ  => 96
    )
    port map (
      clk       => sysclk,
      rx        => rx,
      rstin     => clkgen_rst,
      rstout    => sysrst
    );

  clkgen_inst: entity work.clkgen
  port map (
    clkin   => clk,
    rstin   => '0'  ,
    clkout  => sysclk,
    clk16   => clk16,
    rstout  => clkgen_rst
  );

  iopads: block
  begin

  -- first 2 GPIO reserved for UART


  wa00: IOPAD port map(I => gpio_o(0),O => gpio_i(0),T => gpio_t(0),C => sysclk,PAD => WING_A_0 );
  wa01: IOPAD port map(I => gpio_o(1),O => gpio_i(1),T => gpio_t(1),C => sysclk,PAD => WING_A_1 );
  wa02: IOPAD port map(I => gpio_o(2),O => gpio_i(2),T => gpio_t(2),C => sysclk,PAD => WING_A_2 );
  wa03: IOPAD port map(I => gpio_o(3),O => gpio_i(3),T => gpio_t(3),C => sysclk,PAD => WING_A_3 );
  wa04: IOPAD port map(I => gpio_o(4),O => gpio_i(4),T => gpio_t(4),C => sysclk,PAD => WING_A_4 );
  wa05: IOPAD port map(I => gpio_o(5),O => gpio_i(5),T => gpio_t(5),C => sysclk,PAD => WING_A_5 );
  wa06: IOPAD port map(I => gpio_o(6),O => gpio_i(6),T => gpio_t(6),C => sysclk,PAD => WING_A_6 );
  wa07: IOPAD port map(I => gpio_o(7),O => gpio_i(7),T => gpio_t(7),C => sysclk,PAD => WING_A_7 );
  wa08: IOPAD port map(I => gpio_o(8),O => gpio_i(8),T => gpio_t(8),C => sysclk,PAD => WING_A_8 );
  wa09: IOPAD port map(I => gpio_o(9),O => gpio_i(9),T => gpio_t(9),C => sysclk,PAD => WING_A_9 );
  wa10: IOPAD port map(I => gpio_o(10),O => gpio_i(10),T => gpio_t(10),C => sysclk,PAD => WING_A_10 );
  wa11: IOPAD port map(I => gpio_o(11),O => gpio_i(11),T => gpio_t(11),C => sysclk,PAD => WING_A_11 );
  wa12: IOPAD port map(I => gpio_o(12),O => gpio_i(12),T => gpio_t(12),C => sysclk,PAD => WING_A_12 );
  wa13: IOPAD port map(I => gpio_o(13),O => gpio_i(13),T => gpio_t(13),C => sysclk,PAD => WING_A_13 );
  --wa14: IOPAD port map(I => gpio_o(14),O => gpio_i(14),T => gpio_t(14),C => sysclk,PAD => WING_A_14 );
  --wa15: IOPAD port map(I => gpio_o(15),O => gpio_i(15),T => gpio_t(15),C => sysclk,PAD => WING_A_15 );

  wb00: IOPAD port map(I => gpio_o(16),O => gpio_i(16),T => gpio_t(16),C => sysclk,PAD => WING_B_0 );
  wb01: IOPAD port map(I => gpio_o(17),O => gpio_i(17),T => gpio_t(17),C => sysclk,PAD => WING_B_1 );
  wb02: IOPAD port map(I => gpio_o(18),O => gpio_i(18),T => gpio_t(18),C => sysclk,PAD => WING_B_2 );
  wb03: IOPAD port map(I => gpio_o(19),O => gpio_i(19),T => gpio_t(19),C => sysclk,PAD => WING_B_3 );
  wb04: IOPAD port map(I => gpio_o(20),O => gpio_i(20),T => gpio_t(20),C => sysclk,PAD => WING_B_4 );
  wb05: IOPAD port map(I => gpio_o(21),O => gpio_i(21),T => gpio_t(21),C => sysclk,PAD => WING_B_5 );
  wb06: IOPAD port map(I => gpio_o(22),O => gpio_i(22),T => gpio_t(22),C => sysclk,PAD => WING_B_6 );
  wb07: IOPAD port map(I => gpio_o(23),O => gpio_i(23),T => gpio_t(23),C => sysclk,PAD => WING_B_7 );
  wb08: IOPAD port map(I => gpio_o(24),O => gpio_i(24),T => gpio_t(24),C => sysclk,PAD => WING_B_8 );
  wb09: IOPAD port map(I => gpio_o(25),O => gpio_i(25),T => gpio_t(25),C => sysclk,PAD => WING_B_9 );
  wb10: IOPAD port map(I => gpio_o(26),O => gpio_i(26),T => gpio_t(26),C => sysclk,PAD => WING_B_10 );
  wb11: IOPAD port map(I => gpio_o(27),O => gpio_i(27),T => gpio_t(27),C => sysclk,PAD => WING_B_11 );
  wb12: IOPAD port map(I => gpio_o(28),O => gpio_i(28),T => gpio_t(28),C => sysclk,PAD => WING_B_12 );
  wb13: IOPAD port map(I => gpio_o(29),O => gpio_i(29),T => gpio_t(29),C => sysclk,PAD => WING_B_13 );
  wb14: IOPAD port map(I => gpio_o(30),O => gpio_i(30),T => gpio_t(30),C => sysclk,PAD => WING_B_14 );
  wb15: IOPAD port map(I => gpio_o(31),O => gpio_i(31),T => gpio_t(31),C => sysclk,PAD => WING_B_15 );

  wc00: IOPAD port map(I => gpio_o(32),O => gpio_i(32),T => gpio_t(32),C => sysclk,PAD => WING_C_0 );
  wc01: IOPAD port map(I => gpio_o(33),O => gpio_i(33),T => gpio_t(33),C => sysclk,PAD => WING_C_1 );
  wc02: IOPAD port map(I => gpio_o(34),O => gpio_i(34),T => gpio_t(34),C => sysclk,PAD => WING_C_2 );
  wc03: IOPAD port map(I => gpio_o(35),O => gpio_i(35),T => gpio_t(35),C => sysclk,PAD => WING_C_3 );
  wc04: IOPAD port map(I => gpio_o(36),O => gpio_i(36),T => gpio_t(36),C => sysclk,PAD => WING_C_4 );
  wc05: IOPAD port map(I => gpio_o(37),O => gpio_i(37),T => gpio_t(37),C => sysclk,PAD => WING_C_5 );
  wc06: IOPAD port map(I => gpio_o(38),O => gpio_i(38),T => gpio_t(38),C => sysclk,PAD => WING_C_6 );
  wc07: IOPAD port map(I => gpio_o(39),O => gpio_i(39),T => gpio_t(39),C => sysclk,PAD => WING_C_7 );
  wc08: IOPAD port map(I => gpio_o(40),O => gpio_i(40),T => gpio_t(40),C => sysclk,PAD => WING_C_8 );
  wc09: IOPAD port map(I => gpio_o(41),O => gpio_i(41),T => gpio_t(41),C => sysclk,PAD => WING_C_9 );
  wc10: IOPAD port map(I => gpio_o(42),O => gpio_i(42),T => gpio_t(42),C => sysclk,PAD => WING_C_10 );
  wc11: IOPAD port map(I => gpio_o(43),O => gpio_i(43),T => gpio_t(43),C => sysclk,PAD => WING_C_11 );
  wc12: IOPAD port map(I => gpio_o(44),O => gpio_i(44),T => gpio_t(44),C => sysclk,PAD => WING_C_12 );
  wc13: IOPAD port map(I => gpio_o(45),O => gpio_i(45),T => gpio_t(45),C => sysclk,PAD => WING_C_13 );
  wc14: IOPAD port map(I => gpio_o(46),O => gpio_i(46),T => gpio_t(46),C => sysclk,PAD => WING_C_14 );
  wc15: IOPAD port map(I => gpio_o(47),O => gpio_i(47),T => gpio_t(47),C => sysclk,PAD => WING_C_15 );

  -- Other ports are special, we need to avoid outputs on input-only pins

  ibufrx:   IPAD port map ( PAD => RXD,        O => rx,           C => sysclk );
  obuftx:   OPAD port map ( I => tx,           PAD => TXD );

  ibufmiso: IPAD port map ( PAD => SPI_MISO,   O => spi_pf_miso,  C => sysclk );
  ospiclk:  OPAD port map ( I => spi_pf_sck,   PAD => SPI_SCK );
  ospics:   OPAD port map ( I => gpio_o(79),   PAD => SPI_CS );
  ospimosi: OPAD port map ( I => spi_pf_mosi,  PAD => SPI_MOSI );

  --oled0:    OPAD port map ( I => gpio_o(80),   PAD => LED(0) );
  --oled1:    OPAD port map ( I => gpio_o(81),   PAD => LED(1) );
  --oled2:    OPAD port map ( I => gpio_o(82),   PAD => LED(2) );
  --oled3:    OPAD port map ( I => gpio_o(83),   PAD => LED(3) );
  --oled4:    OPAD port map ( I => gpio_o(84),   PAD => LED(4) );
  --oled5:    OPAD port map ( I => gpio_o(85),   PAD => LED(5) );
  --oled6:    OPAD port map ( I => gpio_o(86),   PAD => LED(6) );
  --oled7:    OPAD port map ( I => gpio_o(87),   PAD => LED(7) );

  -- KEY in
  kin0:     IPAD port map ( O => gpio_i(88),   C => sysclk, PAD => KEY(0) );
  kin1:     IPAD port map ( O => gpio_i(89),   C => sysclk, PAD => KEY(1) );

  -- DIP switches
  dip0:     IPAD port map ( O => gpio_i(90),   C => sysclk, PAD => SW(0) );
  dip1:     IPAD port map ( O => gpio_i(91),   C => sysclk, PAD => SW(1) );
  dip2:     IPAD port map ( O => gpio_i(92),   C => sysclk, PAD => SW(2) );
  dip3:     IPAD port map ( O => gpio_i(93),   C => sysclk, PAD => SW(3) );
  -- Misc select lines

  gssel:    OPAD port map ( I => gpio_o(94),   PAD => G_SENSOR_CS_N );
  adcsel:   OPAD port map ( I => gpio_o(95),   PAD => ADC_CS_N );


  end block;


  zpuino: entity work.zpuino_top_icache
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

      m_wb_dat_o    => m_wb_dat_o,
      m_wb_dat_i    => m_wb_dat_i,
      m_wb_adr_i    => m_wb_adr_i,
      m_wb_we_i     => m_wb_we_i,
      m_wb_cyc_i    => m_wb_cyc_i,
      m_wb_stb_i    => m_wb_stb_i,
      m_wb_ack_o    => m_wb_ack_o,
      m_wb_stall_o  => m_wb_stall_o,
      m_wb_cti_i    => CTI_CYCLE_CLASSIC,

      --wb_ack_i      => ramwbo.ack,
      --wb_stall_i    => ramwbo.stall,
      --wb_dat_i      => ramwbo.dat,
      --wb_dat_o      => ramwbi.dat,
      --wb_adr_o      => ramwbi.adr(maxAddrBit downto 0),
      --wb_cyc_o      => ramwbi.cyc,
      --wb_cti_o      => ramwbi.cti,
      --wb_stb_o      => ramwbi.stb,
      --wb_sel_o      => ramwbi.sel,
      --wb_we_o       => ramwbi.we,

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


  ram:  entity work.ocram
    generic map (
      address_bits => 12
    )
    port map (
      syscon.clk  => wb_clk_i,
      syscon.rst  => wb_rst_i,
      wbi         => ramwbi,
      wbo         => ramwbo
   );	


  --sysclk_sram_we <= not wb_clk_i;
  sysclk_sram_we <= wb_clk_i;

  sram_inst: entity work.sdram_ctrl
    port map (
      wb_clk_i    => wb_clk_i,
      wb_rst_i    => wb_rst_i,
      wb_dat_o    => sram_wb_dat_o,
      wb_dat_i    => sram_wb_dat_i,
      wb_adr_i    => sram_wb_adr_i(maxIObit downto minIObit),
      wb_we_i     => sram_wb_we_i,
      wb_cyc_i    => sram_wb_cyc_i,
      wb_stb_i    => sram_wb_stb_i,
      wb_sel_i    => sram_wb_sel_i,
      wb_ack_o    => sram_wb_ack_o,
      wb_stall_o  => sram_wb_stall_o,

      clk_off_3ns => sysclk_sram_we,
      DRAM_ADDR   => DRAM_ADDR(11 downto 0),
      DRAM_BA     => DRAM_BA,
      DRAM_CAS_N  => DRAM_CAS_N,
      DRAM_CKE    => DRAM_CKE,
      DRAM_CLK    => DRAM_CLK,
      DRAM_CS_N   => DRAM_CS_N,
      DRAM_DQ     => DRAM_DQ,
      DRAM_DQM    => DRAM_DQM,
      DRAM_RAS_N  => DRAM_RAS_N,
      DRAM_WE_N   => DRAM_WE_N
    );

  DRAM_ADDR(12) <= '0';


  --
  -- IO SLOT 1
  --

  uart_inst: zpuino_uart
  generic map (
    bits  => 8
  )
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

    spp_data      => gpio_spp_data,
    spp_read      => gpio_spp_read,

    gpio_i        => gpio_i,
    gpio_t        => gpio_t,
    gpio_o        => gpio_o,
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
    sck           => spi_pf_sck
  );

  --
  -- IO SLOT 5
  --

  sigmadelta_inst: zpuino_sigmadelta
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(5),
    wb_dat_i      => slot_write(5),
    wb_adr_i      => slot_address(5),
    wb_we_i       => slot_we(5),
    wb_cyc_i      => slot_cyc(5),
    wb_stb_i      => slot_stb(5),
    wb_ack_o      => slot_ack(5),
    wb_inta_o     => slot_interrupt(5),
    id            => slot_ids(5),

    spp_data      => sigmadelta_spp_data,
    spp_en        => open,
    sync_in       => '1'
  );

  --
  -- IO SLOT 6
  --

  slot1: zpuino_spi
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(6),
    wb_dat_i      => slot_write(6),
    wb_adr_i      => slot_address(6),
    wb_we_i       => slot_we(6),
    wb_cyc_i      => slot_cyc(6),
    wb_stb_i      => slot_stb(6),
    wb_ack_o      => slot_ack(6),
    wb_inta_o     => slot_interrupt(6),
    id            => slot_ids(6),

    mosi          => spi2_mosi,
    miso          => spi2_miso,
    sck           => spi2_sck,
    enabled       => open
  );



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

  --
  -- IO SLOT 8
  --

  slot8: zpuino_uart
  generic map (
    bits  => 3
  )
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(8),
    wb_dat_i      => slot_write(8),
    wb_adr_i      => slot_address(8),
    wb_we_i       => slot_we(8),
    wb_cyc_i      => slot_cyc(8),
    wb_stb_i      => slot_stb(8),
    wb_ack_o      => slot_ack(8),
    wb_inta_o     => slot_interrupt(8),
    id            => slot_ids(8),
    tx            => uart2_tx,
    rx            => uart2_rx
  );

  --
  -- IO SLOT 9
  --

  slot9: entity work.zpuino_pwmblock
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(9),
    wb_dat_i      => slot_write(9),
    wb_adr_i      => slot_address(9),
    wb_we_i       => slot_we(9),
    wb_cyc_i      => slot_cyc(9),
    wb_stb_i      => slot_stb(9),
    wb_ack_o      => slot_ack(9),
    wb_inta_o     => slot_interrupt(9),
    id            => slot_ids(9),
    pwmout        => LEDi
  );

  LED <= LEDi;

  --
  -- IO SLOT 10
  --

  rgbctrl: entity work.zpuino_rgbctrl2
  generic map (
    WIDTH_BITS        => 7,
    PWM_WIDTH         => 7,
    CLOCK_POLARITY    => '1',
    STROBE_POLARITY   => '1',
    OE_POLARITY       => '0',
    DATA_INVERT       => false,
    COLUMN_INVERT     => false,
    NUMCLOCKS         => 1,
    VSUBPANELS        => 2
  )
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(10),
    wb_dat_i      => slot_write(10),
    wb_adr_i      => slot_address(10),
    wb_we_i       => slot_we(10),
    wb_cyc_i      => slot_cyc(10),
    wb_stb_i      => slot_stb(10),
    wb_ack_o      => slot_ack(10),
    wb_inta_o => slot_interrupt(10),

    -- Wishbone MASTER interface
    mi_wb_dat_i   => m_wb_dat_o,
    mi_wb_dat_o   => m_wb_dat_i,
    mi_wb_adr_o   => m_wb_adr_i(maxAddrBitIncIO downto 0),
    mi_wb_sel_o   => open,
    mi_wb_cti_o   => open,
    mi_wb_we_o    => m_wb_we_i,
    mi_wb_cyc_o   => m_wb_cyc_i,
    mi_wb_stb_o   => m_wb_stb_i,
    mi_wb_ack_i   => m_wb_ack_o,
    mi_wb_stall_i => m_wb_stall_o,

    displayclk => clk16,

    R       => PRi(1 downto 0),
    G       => PGi(1 downto 0),
    B       => PBi(1 downto 0),
    CLK     => PCLKi,
    COL(0)  => PSELAi,
    COL(1)  => PSELBi,
    COL(2)  => PSELCi,
    COL(3)  => PSELDi,
    STB     => PSTBi,
    OE      => POEi
  );
  slot_ids(10) <= x"88" & x"20";

  clkpad: OPAD port map ( I => PCLKi(0), PAD => RGB_CLK );

  rpad0: OPAD port map ( I => PRi(0), O => RGB_R0 );
  gpad0: OPAD port map ( I => PGi(0), O => RGB_G0 );
  bpad0: OPAD port map ( I => PBi(0), O => RGB_B0 );

  rpad1: OPAD port map ( I => PRi(1), O => RGB_R1 );
  gpad1: OPAD port map ( I => PGi(1), O => RGB_G1 );
  bpad1: OPAD port map ( I => PBi(1), O => RGB_B1 );

  pselapad: OPAD port map ( I => PSELAi, PAD => RGB_A );
  pselbpad: OPAD port map ( I => PSELBi, PAD => RGB_B );
  pselcpad: OPAD port map ( I => PSELCi, PAD => RGB_C );
  pseldpad: OPAD port map ( I => PSELDi, PAD => RGB_D );

  stbpad: OPAD port map ( I => PSTBi, PAD => RGB_STB );

  oepad: OPAD port map ( I => POEi, PAD => RGB_OE );


  --
  -- IO SLOT 11
  --

  slot11: zpuino_empty_device
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(11),
    wb_dat_i      => slot_write(11),
    wb_adr_i      => slot_address(11),
    wb_we_i       => slot_we(11),
    wb_cyc_i      => slot_cyc(11),
    wb_stb_i      => slot_stb(11),
    wb_ack_o      => slot_ack(11),
    wb_inta_o     => slot_interrupt(11),
    id            => slot_ids(11)
  );

  --
  -- IO SLOT 12
  --

  slot12: zpuino_spi
  port map (
    wb_clk_i      => wb_clk_i,
     wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(12),
    wb_dat_i      => slot_write(12),
    wb_adr_i      => slot_address(12),
    wb_we_i       => slot_we(12),
    wb_cyc_i      => slot_cyc(12),
    wb_stb_i      => slot_stb(12),
    wb_ack_o      => slot_ack(12),
    wb_inta_o     => slot_interrupt(12),
    id            => slot_ids(12),

    mosi          => ADC_SADDR,
    miso          => ADC_SDAT,
    sck           => ADC_SCLK,
    enabled       => open
  );

  --
  -- IO SLOT 13
  --

  slot13: entity work.i2c_master_top
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(13)(7 downto 0),
    wb_dat_i      => slot_write(13)(7 downto 0),
    wb_adr_i      => slot_address(13)(4 downto 2),
    wb_we_i       => slot_we(13),
    wb_cyc_i      => slot_cyc(13),
    wb_stb_i      => slot_stb(13),
    wb_ack_o      => slot_ack(13),
    wb_inta_o     => slot_interrupt(13),
    id            => slot_ids(13),

    scl_pad_i     => scl_pad_i,
    scl_pad_o     => scl_pad_o,                    -- i2c clock line output
    scl_padoen_o  => scl_padoen_o,                    -- i2c clock line output enable, active low
    sda_pad_i     => sda_pad_i,                    -- i2c data line input
    sda_pad_o     => sda_pad_o,                    -- i2c data line output
    sda_padoen_o  => sda_padoen_o                     -- i2c data line output enable, active low

  );
  slot_read(13)(31 downto 8)<=(others => '0');

  i2c_buf0: entity work.IOBUF port map(I => scl_pad_o, O => scl_pad_i, T => scl_padoen_o, IO => I2C_SCLK );
  i2c_buf1: entity work.IOBUF port map(I => sda_pad_o, O => sda_pad_i, T => sda_padoen_o, IO => I2C_SDAT );




  --
  -- IO SLOT 14
  --

  slot14: entity work.i2c_master_top
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(14)(7 downto 0),
    wb_dat_i      => slot_write(14)(7 downto 0),
    wb_adr_i      => slot_address(14)(4 downto 2),
    wb_we_i       => slot_we(14),
    wb_cyc_i      => slot_cyc(14),
    wb_stb_i      => slot_stb(14),
    wb_ack_o      => slot_ack(14),
    wb_inta_o     => slot_interrupt(14),
    id            => slot_ids(14),

    scl_pad_i     => scl2_pad_i,
    scl_pad_o     => scl2_pad_o,                    -- i2c clock line output
    scl_padoen_o  => scl2_padoen_o,                    -- i2c clock line output enable, active low
    sda_pad_i     => sda2_pad_i,                    -- i2c data line input
    sda_pad_o     => sda2_pad_o,                    -- i2c data line output
    sda_padoen_o  => sda2_padoen_o                     -- i2c data line output enable, active low

  );
  slot_read(14)(31 downto 8)<=(others => '0');

  i2c2_buf0: entity work.IOBUF port map(I => scl2_pad_o, O => scl2_pad_i, T => scl2_padoen_o, IO => GPIO_1(32) );
  i2c2_buf1: entity work.IOBUF port map(I => sda2_pad_o, O => sda2_pad_i, T => sda2_padoen_o, IO => GPIO_1(30) );

  --
  -- IO SLOT 15 - do not use
  --

  process(gpio_spp_read, spi_pf_mosi, spi_pf_sck,
          sigmadelta_spp_data,timers_pwm,
          spi2_mosi,spi2_sck)
  begin

    gpio_spp_data <= (others => DontCareValue);

    -- PPS Outputs
    gpio_spp_data(0)  <= sigmadelta_spp_data(0);   -- PPS0 : SIGMADELTA DATA
    ppsout_info_slot(0) <= 5; -- Slot 5
    ppsout_info_pin(0) <= 0;  -- PPS OUT pin 0 (Channel 0)

    gpio_spp_data(1)  <= timers_pwm(0);            -- PPS1 : TIMER0
    ppsout_info_slot(1) <= 3; -- Slot 3
    ppsout_info_pin(1) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    gpio_spp_data(2)  <= timers_pwm(1);            -- PPS2 : TIMER1
    ppsout_info_slot(2) <= 3; -- Slot 3
    ppsout_info_pin(2) <= 1;  -- PPS OUT pin 1 (TIMER 0)

    gpio_spp_data(3)  <= spi2_mosi;                -- PPS3 : USPI MOSI
    ppsout_info_slot(3) <= 6; -- Slot 6
    ppsout_info_pin(3) <= 0;  -- PPS OUT pin 0 (MOSI)

    gpio_spp_data(4)  <= spi2_sck;                 -- PPS4 : USPI SCK
    ppsout_info_slot(4) <= 6; -- Slot 6
    ppsout_info_pin(4) <= 1;  -- PPS OUT pin 1 (SCK)

    gpio_spp_data(5)  <= sigmadelta_spp_data(1);   -- PPS5 : SIGMADELTA1 DATA
    ppsout_info_slot(5) <= 5; -- Slot 5
    ppsout_info_pin(5) <= 1;  -- PPS OUT pin 0 (Channel 1)

    gpio_spp_data(6)  <= uart2_tx;   -- PPS6 : UART2 TX
    ppsout_info_slot(6) <= 8; -- Slot 8
    ppsout_info_pin(6) <= 0;  -- PPS OUT pin 0 (Channel 1)

    -- PPS inputs
    spi2_miso         <= gpio_spp_read(0);         -- PPS0 : USPI MISO
    ppsin_info_slot(0) <= 6;                    -- USPI is in slot 6
    ppsin_info_pin(0) <= 0;                     -- PPS pin of USPI is 0

    uart2_rx          <= gpio_spp_read(1);         -- PPS1 : UART2 RX
    ppsin_info_slot(1) <= 8;                    -- USPI is in slot 6
    ppsin_info_pin(1) <= 0;                     -- PPS pin of USPI is 0

  end process;


end behave;
