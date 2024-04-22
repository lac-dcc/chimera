--
--  ZPUINO implementation on Spartan3E Evaluation Board from Xilinx
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

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity nexys2_zpuino is
  port (
    CLK         : in    std_logic;
    RST         : in    std_logic;
    UART_RX     : in    std_logic;
    UART_TX     : out   std_logic;
    --GPIO      : inout std_logic_vector(zpuino_gpio_count-1 downto 0);
    JA          : inout std_logic_vector(7 downto 0);
    JB          : inout std_logic_vector(7 downto 0);
    JC          : inout std_logic_vector(7 downto 0);
    JD          : inout std_logic_vector(3 downto 0);

    BTN         : in    std_logic_vector(2 downto 0);

    -- 7-seg
    SEG_CA      : out   std_logic;
    SEG_CB      : out   std_logic;
    SEG_CC      : out   std_logic;
    SEG_CD      : out   std_logic;
    SEG_CE      : out   std_logic;
    SEG_CF      : out   std_logic;
    SEG_CG      : out   std_logic;
    SEG_DP      : out   std_logic;
    SEG_AN      : out   std_logic_vector(3 downto 0);

    PS2_CLK     : in    std_logic;
    PS2_DATA    : in    std_logic;

    FPGA_INIT_B : out   std_logic;

    LED         : out   std_logic_vector(3 downto 0);

    IO          : inout std_logic_vector(40 downto 1);

    -- VGA interface
    VGA_RED     : out   std_logic_vector(2 downto 0);
    VGA_GRN     : out   std_logic_vector(2 downto 0);
    VGA_BLU     : out   std_logic_vector(2 downto 1);
    VGA_HS      : out   std_logic;
    VGA_VS      : out   std_logic

  );
end entity nexys2_zpuino;

architecture behave of nexys2_zpuino is

  component clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
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
  signal clkgen_rst:  std_logic;

  signal gpio_o: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_i: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t: std_logic_vector(zpuino_gpio_count-1 downto 0);

  signal rx: std_logic;
  signal tx: std_logic;

    -- I/O Signals
  signal slot_cyc:   slot_std_logic_type;
  signal slot_we:    slot_std_logic_type;
  signal slot_stb:   slot_std_logic_type;
  signal slot_read:  slot_cpuword_type;
  signal slot_write: slot_cpuword_type;
  signal slot_address:  slot_address_type;
  signal slot_ack:   slot_std_logic_type;
  signal slot_interrupt: slot_std_logic_type;

--  signal spi_enabled:  std_logic;

  signal spi2_enabled:  std_logic;
  signal spi2_mosi:  std_logic;
  signal spi2_miso:  std_logic;
  signal spi2_sck:  std_logic;

--  signal uart_enabled:  std_logic;

  -- SPP signal is one more than GPIO count
  signal gpio_spp_data: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_spp_read: std_logic_vector(zpuino_gpio_count-1 downto 0);

  signal timers_pwm: std_logic_vector(1 downto 0);

  signal sigmadelta_spp_data:  std_logic_vector(1 downto 0);

  -- For busy-implementation

  signal spi_pf_miso: std_logic;
  signal spi_pf_mosi: std_logic;
  signal spi_pf_sck: std_logic;

  signal wb_clk_i: std_logic;
  signal wb_rst_i: std_logic;


  -- a 1 in mask bit indicates input capability
  constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    -- 32 bit word 2 (29 bits used)
    "00000000000000000000000000000" & -- FX2-IO11 - FX2-IO39
    -- 32 bit word 1
    "0000000000" & -- FX2-IO1 - FX2-IO10
    "00" &         -- PS2 CLK/DATA
    "0000" &      -- 4x7-seg LED display, digit anodes, order = AN0-AN3
    "00000000" &  -- 4x7-seg LED display, segment cathodes, order = A,B,C,D,E,F,DP
    "00000000" &  -- Individual LEDs 0-7
    -- 32 bit word 0
    "1" &         -- FX2-IO40
    "000" &       -- pushbuttns BTN1-BTN3
    "1111" &      -- JD dual PMOD connector, pins 1-4 only
    "11111111" &  -- JC dual PMOD connector, pins 1-4, 7-10
    "11111111" &  -- JB dual PMOD connector, pins 1-4, 7-10
    "11111111";   -- JA dual PMOD connector, pins 1-4, 7-10

  -- a 1 in mask bit indicates output capability
  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    -- 32 bit word 2 (29 bits used)
    "00000000000000000000000000000" & -- FX2-IO11 - FX2-IO39
    -- 32 bit word 1
    "0000000000" & -- FX2-IO1 - FX2-IO10
    "00" &         -- PS2 CLK/DATA
    "0000" &      -- 4x7-seg LED display, digit anodes, order = AN0-AN3
    "00000000" &  -- 4x7-seg LED display, segment cathodes, order = A,B,C,D,E,F,DP
    "00000000" &  -- Individual LEDs 0-7
    -- 32 bit word 0
    "1" &         -- FX2-IO40
    "000" &       -- pushbuttns BTN1-BTN3
    "1111" &      -- JD dual PMOD connector, pins 1-4 only
    "11111111" &  -- JC dual PMOD connector, pins 1-4, 7-10
    "11111111" &  -- JB dual PMOD connector, pins 1-4, 7-10
    "11111111";   -- JA dual PMOD connector, pins 1-4, 7-10


begin

  wb_clk_i <= sysclk;
  wb_rst_i <= sysrst;

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
    rstin   => rst,
    clkout  => sysclk,
    rstout  => clkgen_rst
  );

  FPGA_INIT_B<='0';

  pin00: IOPAD port map(I => gpio_o(0), O => gpio_i(0), T => gpio_t(0), C => sysclk,PAD => JA(0) );
  pin01: IOPAD port map(I => gpio_o(1), O => gpio_i(1), T => gpio_t(1), C => sysclk,PAD => JA(1) );
  pin02: IOPAD port map(I => gpio_o(2), O => gpio_i(2), T => gpio_t(2), C => sysclk,PAD => JA(2) );
  pin03: IOPAD port map(I => gpio_o(3), O => gpio_i(3), T => gpio_t(3), C => sysclk,PAD => JA(3) );
  pin04: IOPAD port map(I => gpio_o(4), O => gpio_i(4), T => gpio_t(4), C => sysclk,PAD => JA(4) );
  pin05: IOPAD port map(I => gpio_o(5), O => gpio_i(5), T => gpio_t(5), C => sysclk,PAD => JA(5) );
  pin06: IOPAD port map(I => gpio_o(6), O => gpio_i(6), T => gpio_t(6), C => sysclk,PAD => JA(6) );
  pin07: IOPAD port map(I => gpio_o(7), O => gpio_i(7), T => gpio_t(7), C => sysclk,PAD => JA(7) );

  pin08: IOPAD port map(I => gpio_o(8), O => gpio_i(8), T => gpio_t(8), C => sysclk,PAD => JB(0) );
  pin09: IOPAD port map(I => gpio_o(9), O => gpio_i(9), T => gpio_t(9), C => sysclk,PAD => JB(1) );
  pin10: IOPAD port map(I => gpio_o(10),O => gpio_i(10),T => gpio_t(10),C => sysclk,PAD => JB(2) );
  pin11: IOPAD port map(I => gpio_o(11),O => gpio_i(11),T => gpio_t(11),C => sysclk,PAD => JB(3) );
  pin12: IOPAD port map(I => gpio_o(12),O => gpio_i(12),T => gpio_t(12),C => sysclk,PAD => JB(4) );
  pin13: IOPAD port map(I => gpio_o(13),O => gpio_i(13),T => gpio_t(13),C => sysclk,PAD => JB(5) );
  pin14: IOPAD port map(I => gpio_o(14),O => gpio_i(14),T => gpio_t(14),C => sysclk,PAD => JB(6) );
  pin15: IOPAD port map(I => gpio_o(15),O => gpio_i(15),T => gpio_t(15),C => sysclk,PAD => JB(7) );

  pin16: IOPAD port map(I => gpio_o(16),O => gpio_i(16),T => gpio_t(16),C => sysclk,PAD => JC(0) );
  pin17: IOPAD port map(I => gpio_o(17),O => gpio_i(17),T => gpio_t(17),C => sysclk,PAD => JC(1) );
  pin18: IOPAD port map(I => gpio_o(18),O => gpio_i(18),T => gpio_t(18),C => sysclk,PAD => JC(2) );
  pin19: IOPAD port map(I => gpio_o(19),O => gpio_i(19),T => gpio_t(19),C => sysclk,PAD => JC(3) );
  pin20: IOPAD port map(I => gpio_o(20),O => gpio_i(20),T => gpio_t(20),C => sysclk,PAD => JC(4) );
  pin21: IOPAD port map(I => gpio_o(21),O => gpio_i(21),T => gpio_t(21),C => sysclk,PAD => JC(5) );
  pin22: IOPAD port map(I => gpio_o(22),O => gpio_i(22),T => gpio_t(22),C => sysclk,PAD => JC(6) );
  pin23: IOPAD port map(I => gpio_o(23),O => gpio_i(23),T => gpio_t(23),C => sysclk,PAD => JC(7) );

  pin24: IOPAD port map(I => gpio_o(24),O => gpio_i(24),T => gpio_t(24),C => sysclk,PAD => JD(0) );
  pin25: IOPAD port map(I => gpio_o(25),O => gpio_i(25),T => gpio_t(25),C => sysclk,PAD => JD(1) );
  pin26: IOPAD port map(I => gpio_o(26),O => gpio_i(26),T => gpio_t(26),C => sysclk,PAD => JD(2) );
  pin27: IOPAD port map(I => gpio_o(27),O => gpio_i(27),T => gpio_t(27),C => sysclk,PAD => JD(3) );

  pin28: IPAD port map(O => gpio_i(28),C => sysclk,PAD => BTN(0) );
  pin29: IPAD port map(O => gpio_i(29),C => sysclk,PAD => BTN(1) );
  pin30: IPAD port map(O => gpio_i(30),C => sysclk,PAD => BTN(2) );

  pin31: IOPAD port map(I => gpio_o(31),O => gpio_i(31),T => gpio_t(31),C => sysclk,PAD => IO(40) );

  -- LEDS

  pin32: OPAD port map(I => gpio_o(32), O => gpio_i(32),PAD => LED(0) );
  pin33: OPAD port map(I => gpio_o(33), O => gpio_i(33),PAD => LED(1) );
  pin34: OPAD port map(I => gpio_o(34), O => gpio_i(34),PAD => LED(2) );
  pin35: OPAD port map(I => gpio_o(35), O => gpio_i(35),PAD => LED(3) );
--  pin36: OPAD port map(I => gpio_o(36), PAD => LED(4) );
--  pin37: OPAD port map(I => gpio_o(37), PAD => LED(5) );
--  pin38: OPAD port map(I => gpio_o(38), PAD => LED(6) );
--  pin39: OPAD port map(I => gpio_o(39), PAD => LED(7) );

  -- Connected to Nexys 2 onBoard 7seg display

  pin40: OPAD port map(I => gpio_o(40), O => gpio_i(40),PAD => SEG_CA );
  pin41: OPAD port map(I => gpio_o(41), O => gpio_i(41),PAD => SEG_CB );
  pin42: OPAD port map(I => gpio_o(42), O => gpio_i(42),PAD => SEG_CC );
  pin43: OPAD port map(I => gpio_o(43), O => gpio_i(43),PAD => SEG_CD );
  pin44: OPAD port map(I => gpio_o(44), O => gpio_i(44),PAD => SEG_CE );
  pin45: OPAD port map(I => gpio_o(45), O => gpio_i(45),PAD => SEG_CF );
  pin46: OPAD port map(I => gpio_o(46), O => gpio_i(46),PAD => SEG_CG );
  pin47: OPAD port map(I => gpio_o(47), O => gpio_i(47),PAD => SEG_DP );
  pin48: OPAD port map(I => gpio_o(48), O => gpio_i(48),PAD => SEG_AN(0) );
  pin49: OPAD port map(I => gpio_o(49), O => gpio_i(49),PAD => SEG_AN(1) );
  pin50: OPAD port map(I => gpio_o(50), O => gpio_i(50),PAD => SEG_AN(2) );
  pin51: OPAD port map(I => gpio_o(51), O => gpio_i(51),PAD => SEG_AN(3) );

  pin52: IPAD port map(O => gpio_i(52), C => sysclk, PAD => PS2_CLK );
  pin53: IPAD port map(O => gpio_i(53), C => sysclk, PAD => PS2_DATA );

  pin54: IOPAD port map(I => gpio_o(54),O => gpio_i(54),T => gpio_t(54),C => sysclk,PAD => IO(1) );
  pin55: IOPAD port map(I => gpio_o(55),O => gpio_i(55),T => gpio_t(55),C => sysclk,PAD => IO(2) );
  pin56: IOPAD port map(I => gpio_o(56),O => gpio_i(56),T => gpio_t(56),C => sysclk,PAD => IO(3) );
  pin57: IOPAD port map(I => gpio_o(57),O => gpio_i(57),T => gpio_t(57),C => sysclk,PAD => IO(4) );
  pin58: IOPAD port map(I => gpio_o(58),O => gpio_i(58),T => gpio_t(58),C => sysclk,PAD => IO(5) );
  pin59: IOPAD port map(I => gpio_o(59),O => gpio_i(59),T => gpio_t(59),C => sysclk,PAD => IO(6) );
  pin60: IOPAD port map(I => gpio_o(60),O => gpio_i(60),T => gpio_t(60),C => sysclk,PAD => IO(7) );
  pin61: IOPAD port map(I => gpio_o(61),O => gpio_i(61),T => gpio_t(61),C => sysclk,PAD => IO(8) );

  pin62: IOPAD port map(I => gpio_o(62),O => gpio_i(62),T => gpio_t(62),C => sysclk,PAD => IO(9) );
  pin63: IOPAD port map(I => gpio_o(63),O => gpio_i(63),T => gpio_t(63),C => sysclk,PAD => IO(10) );
  pin64: IOPAD port map(I => gpio_o(64),O => gpio_i(64),T => gpio_t(64),C => sysclk,PAD => IO(11) );
  pin65: IOPAD port map(I => gpio_o(65),O => gpio_i(65),T => gpio_t(65),C => sysclk,PAD => IO(12) );
  pin66: IOPAD port map(I => gpio_o(66),O => gpio_i(66),T => gpio_t(66),C => sysclk,PAD => IO(13) );
  pin67: IOPAD port map(I => gpio_o(67),O => gpio_i(67),T => gpio_t(67),C => sysclk,PAD => IO(14) );
  pin68: IOPAD port map(I => gpio_o(68),O => gpio_i(68),T => gpio_t(68),C => sysclk,PAD => IO(15) );
  pin69: IOPAD port map(I => gpio_o(69),O => gpio_i(69),T => gpio_t(69),C => sysclk,PAD => IO(16) );

  pin70: IOPAD port map(I => gpio_o(70),O => gpio_i(70),T => gpio_t(70),C => sysclk,PAD => IO(17) );
  pin71: IOPAD port map(I => gpio_o(71),O => gpio_i(71),T => gpio_t(71),C => sysclk,PAD => IO(18) );
  pin72: IOPAD port map(I => gpio_o(72),O => gpio_i(72),T => gpio_t(72),C => sysclk,PAD => IO(19) );
  pin73: IOPAD port map(I => gpio_o(73),O => gpio_i(73),T => gpio_t(73),C => sysclk,PAD => IO(20) );
  pin74: IOPAD port map(I => gpio_o(74),O => gpio_i(74),T => gpio_t(74),C => sysclk,PAD => IO(21) );
  pin75: IOPAD port map(I => gpio_o(75),O => gpio_i(75),T => gpio_t(75),C => sysclk,PAD => IO(22) );
  pin76: IOPAD port map(I => gpio_o(76),O => gpio_i(76),T => gpio_t(76),C => sysclk,PAD => IO(23) );
  pin77: IOPAD port map(I => gpio_o(77),O => gpio_i(77),T => gpio_t(77),C => sysclk,PAD => IO(24) );

  pin78: IOPAD port map(I => gpio_o(78),O => gpio_i(78),T => gpio_t(78),C => sysclk,PAD => IO(25) );
  pin79: IOPAD port map(I => gpio_o(79),O => gpio_i(79),T => gpio_t(79),C => sysclk,PAD => IO(26) );
  pin80: IOPAD port map(I => gpio_o(80),O => gpio_i(80),T => gpio_t(80),C => sysclk,PAD => IO(27) );
  pin81: IOPAD port map(I => gpio_o(81),O => gpio_i(81),T => gpio_t(81),C => sysclk,PAD => IO(28) );
  pin82: IOPAD port map(I => gpio_o(82),O => gpio_i(82),T => gpio_t(82),C => sysclk,PAD => IO(29) );
  pin83: IOPAD port map(I => gpio_o(83),O => gpio_i(83),T => gpio_t(83),C => sysclk,PAD => IO(30) );
  pin84: IOPAD port map(I => gpio_o(84),O => gpio_i(84),T => gpio_t(84),C => sysclk,PAD => IO(31) );
  pin85: IOPAD port map(I => gpio_o(85),O => gpio_i(85),T => gpio_t(85),C => sysclk,PAD => IO(32) );

  pin86: IOPAD port map(I => gpio_o(86),O => gpio_i(86),T => gpio_t(86),C => sysclk,PAD => IO(33) );
  pin87: IOPAD port map(I => gpio_o(87),O => gpio_i(87),T => gpio_t(87),C => sysclk,PAD => IO(34) );
  pin88: IOPAD port map(I => gpio_o(88),O => gpio_i(88),T => gpio_t(88),C => sysclk,PAD => IO(35) );
  pin89: IOPAD port map(I => gpio_o(89),O => gpio_i(89),T => gpio_t(89),C => sysclk,PAD => IO(36) );
  pin90: IOPAD port map(I => gpio_o(90),O => gpio_i(90),T => gpio_t(90),C => sysclk,PAD => IO(37) );
  pin91: IOPAD port map(I => gpio_o(91),O => gpio_i(91),T => gpio_t(91),C => sysclk,PAD => IO(38) );
  pin92: IOPAD port map(I => gpio_o(92),O => gpio_i(92),T => gpio_t(92),C => sysclk,PAD => IO(39) );

  ibufrx: IPAD port map ( PAD => UART_RX,  O => rx,  C => sysclk );
  obuftx: OPAD port map ( I => tx,   PAD => UART_TX );

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

      m_wb_dat_o    => open,
      m_wb_dat_i    => (others => 'X'),
      m_wb_adr_i    => (others => 'X'),
      m_wb_we_i     => '0',
      m_wb_cyc_i    => '0',
      m_wb_stb_i    => '0',
      m_wb_ack_o    => open,

      jtag_ctrl_chain_in => (others => '0')
    );

  --
  --
  -- ----------------  I/O connection to devices --------------------
  --
  --

  --
  -- IO SLOT 0
  --

  slot0: zpuino_spi
  port map (
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(0),
    wb_dat_i  => slot_write(0),
    wb_adr_i  => slot_address(0),
    wb_we_i   => slot_we(0),
    wb_cyc_i  => slot_cyc(0),
    wb_stb_i  => slot_stb(0),
    wb_ack_o  => slot_ack(0),
    wb_inta_o => slot_interrupt(0),

    mosi      => spi_pf_mosi,
    miso      => spi_pf_miso,
    sck       => spi_pf_sck,
    enabled   => open--spi_enabled
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

    enabled   => open,--uart_enabled,
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
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(2),
    wb_dat_i  => slot_write(2),
    wb_adr_i  => slot_address(2),
    wb_we_i   => slot_we(2),
    wb_cyc_i  => slot_cyc(2),
    wb_stb_i  => slot_stb(2),
    wb_ack_o  => slot_ack(2),
    wb_inta_o => slot_interrupt(2),

    spp_data  => gpio_spp_data,
    spp_read  => gpio_spp_read,

    gpio_i      => gpio_i,
    gpio_t      => gpio_t,
    gpio_o      => gpio_o,
    spp_cap_in  => spp_cap_in,
    spp_cap_out => spp_cap_out
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
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(3),
    wb_dat_i  => slot_write(3),
    wb_adr_i  => slot_address(3),
    wb_we_i   => slot_we(3),
    wb_cyc_i  => slot_cyc(3),
    wb_stb_i  => slot_stb(3),
    wb_ack_o  => slot_ack(3),

    wb_inta_o => slot_interrupt(3), -- We use two interrupt lines
    wb_intb_o => slot_interrupt(4), -- so we borrow intr line from slot 4

    pwm_a_out   => timers_pwm(0 downto 0),
    pwm_b_out   => timers_pwm(1 downto 1)
  );

  --
  -- IO SLOT 4  - DO NOT USE (it's already mapped to Interrupt Controller)
  --

  --
  -- IO SLOT 5
  --

  sigmadelta_inst: zpuino_sigmadelta
  port map (
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(5),
    wb_dat_i  => slot_write(5),
    wb_adr_i  => slot_address(5),
    wb_we_i   => slot_we(5),
    wb_cyc_i  => slot_cyc(5),
    wb_stb_i  => slot_stb(5),
    wb_ack_o  => slot_ack(5),
    wb_inta_o => slot_interrupt(5),

    spp_data  => sigmadelta_spp_data,
    spp_en    => open,--sigmadelta_spp_en,
    sync_in   => '1'
  );

  --
  -- IO SLOT 6
  --

  slot1: zpuino_spi
  port map (
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(6),
    wb_dat_i  => slot_write(6),
    wb_adr_i  => slot_address(6),
    wb_we_i   => slot_we(6),
    wb_cyc_i  => slot_cyc(6),
    wb_stb_i  => slot_stb(6),
    wb_ack_o  => slot_ack(6),
    wb_inta_o => slot_interrupt(6),

    mosi      => spi2_mosi,
    miso      => spi2_miso,
    sck       => spi2_sck,
    enabled   => spi2_enabled
  );



  --
  -- IO SLOT 7
  --

  crc16_inst: zpuino_crc16
  port map (
    wb_clk_i  => wb_clk_i,
    wb_rst_i  => wb_rst_i,
    wb_dat_o  => slot_read(7),
    wb_dat_i  => slot_write(7),
    wb_adr_i  => slot_address(7),
    wb_we_i   => slot_we(7),
    wb_cyc_i  => slot_cyc(7),
    wb_stb_i  => slot_stb(7),
    wb_ack_o  => slot_ack(7),
    wb_inta_o => slot_interrupt(7)
  );

  --
  -- IO SLOT 8 (optional)
  --

  adc_inst: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(8),
    wb_dat_i     => slot_write(8),
    wb_adr_i   => slot_address(8),
    wb_we_i    => slot_we(8),
    wb_cyc_i      => slot_cyc(8),
    wb_stb_i      => slot_stb(8),
    wb_ack_o      => slot_ack(8),
    wb_inta_o =>  slot_interrupt(8)
  );

  --
  -- IO SLOT 9
  --

  slot9: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(9),
    wb_dat_i     => slot_write(9),
    wb_adr_i   => slot_address(9),
    wb_we_i        => slot_we(9),
    wb_cyc_i        => slot_cyc(9),
    wb_stb_i        => slot_stb(9),
    wb_ack_o      => slot_ack(9),
    wb_inta_o => slot_interrupt(9)
  );

  --
  -- IO SLOT 10
  --

  slot10: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(10),
    wb_dat_i     => slot_write(10),
    wb_adr_i   => slot_address(10),
    wb_we_i        => slot_we(10),
    wb_cyc_i        => slot_cyc(10),
    wb_stb_i        => slot_stb(10),
    wb_ack_o      => slot_ack(10),
    wb_inta_o => slot_interrupt(10)
  );

  --
  -- IO SLOT 11
  --

  slot11: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(11),
    wb_dat_i     => slot_write(11),
    wb_adr_i   => slot_address(11),
    wb_we_i        => slot_we(11),
    wb_cyc_i        => slot_cyc(11),
    wb_stb_i        => slot_stb(11),
    wb_ack_o      => slot_ack(11),
    wb_inta_o => slot_interrupt(11)
  );

  --
  -- IO SLOT 12
  --

  slot12: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(12),
    wb_dat_i     => slot_write(12),
    wb_adr_i   => slot_address(12),
    wb_we_i        => slot_we(12),
    wb_cyc_i        => slot_cyc(12),
    wb_stb_i        => slot_stb(12),
    wb_ack_o      => slot_ack(12),
    wb_inta_o => slot_interrupt(12)
  );

  --
  -- IO SLOT 13
  --

  slot13: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(13),
    wb_dat_i     => slot_write(13),
    wb_adr_i   => slot_address(13),
    wb_we_i        => slot_we(13),
    wb_cyc_i        => slot_cyc(13),
    wb_stb_i        => slot_stb(13),
    wb_ack_o      => slot_ack(13),
    wb_inta_o => slot_interrupt(13)
  );

  --
  -- IO SLOT 14
  --

  slot14: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(14),
    wb_dat_i     => slot_write(14),
    wb_adr_i   => slot_address(14),
    wb_we_i        => slot_we(14),
    wb_cyc_i        => slot_cyc(14),
    wb_stb_i        => slot_stb(14),
    wb_ack_o      => slot_ack(14),
    wb_inta_o => slot_interrupt(14)
  );

  --
  -- IO SLOT 15
  --

  slot15: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(15),
    wb_dat_i     => slot_write(15),
    wb_adr_i   => slot_address(15),
    wb_we_i        => slot_we(15),
    wb_cyc_i        => slot_cyc(15),
    wb_stb_i        => slot_stb(15),
    wb_ack_o      => slot_ack(15),
    wb_inta_o => slot_interrupt(15)
  );


  process(
          gpio_spp_read, spi_pf_mosi, spi_pf_sck,
          sigmadelta_spp_data,timers_pwm,
          spi2_mosi,spi2_sck)
  begin

    gpio_spp_data <= (others => DontCareValue);

    gpio_spp_data(0) <= sigmadelta_spp_data(0); -- PPS0 : SIGMADELTA DATA
    gpio_spp_data(1) <= timers_pwm(0);          -- PPS1 : TIMER0
    gpio_spp_data(2) <= timers_pwm(1);          -- PPS2 : TIMER1
    gpio_spp_data(3) <= spi2_mosi;              -- PPS3 : USPI MOSI
    gpio_spp_data(4) <= spi2_sck;               -- PPS4: USPI SCK
    gpio_spp_data(5) <= sigmadelta_spp_data(1); -- PPS5 : SIGMADELTA1 DATA

    spi2_miso <= gpio_spp_read(0);              -- PPS7 : USPI MISO

  end process;
  
  -- stub off VGA signals for now
  VGA_RED     <= (others => '0');
  VGA_GRN     <= (others => '0');
  VGA_BLU     <= (others => '0');
  VGA_HS      <= '0';
  VGA_VS      <= '0';


end behave;
