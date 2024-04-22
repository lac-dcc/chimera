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

library unisim;
use unisim.vcomponents.all;

entity papilio_one_top is
  port (
    CLK:        in std_logic;
    --RST:        in std_logic; -- No reset on papilio

    SPI_SCK:    out std_logic;
    SPI_MISO:   in std_logic;
    SPI_MOSI:   out std_logic;
    SPI_CS:     inout std_logic; 

    Seg7_AN:    out std_logic_vector(3 downto 0);
    Seg7_DP:    out std_logic;
    Seg7_A:     out std_logic;
    Seg7_B:     out std_logic;
    Seg7_C:     out std_logic;
    Seg7_D:     out std_logic;
    Seg7_E:     out std_logic;
    Seg7_F:     out std_logic;
    Seg7_G:     out std_logic;

    ADC_SPI_CS: out std_logic;
    ADC_SPI_MISO:in std_logic;
    ADC_SPI_MOSI:out std_logic;
    ADC_SPI_SCLK:out std_logic;

    VSYNC:  out std_logic;
    HSYNC:  out std_logic;
    BLUE:   out std_logic_vector(1 downto 0);
    GREEN:  out std_logic_vector(2 downto 0);
    RED:    out std_logic_vector(2 downto 0);

    AUDIO:      out std_logic;
    JOY_RIGHT:  in std_logic;
    JOY_LEFT:   in std_logic;
    JOY_DOWN:   in std_logic;
    JOY_UP:     in std_logic;
    JOY_SELECT: in std_logic;
    SWITCH:     in std_logic_vector(7 downto 0);
    LED:       out std_logic_vector(7 downto 0);
    TXD:        out std_logic;
    RXD:        in std_logic

  );
end entity papilio_one_top;

architecture behave of papilio_one_top is

  component clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
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

  component vga_zxspectrum is
  port(
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;

    -- Wishbone MASTER interface
    mi_wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    mi_wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    mi_wb_adr_o: out std_logic_vector(maxAddrBitIncIO downto 0);
    mi_wb_sel_o: out std_logic_vector(3 downto 0);
    mi_wb_cti_o: out std_logic_vector(2 downto 0);
    mi_wb_we_o:  out std_logic;
    mi_wb_cyc_o: out std_logic;
    mi_wb_stb_o: out std_logic;
    mi_wb_ack_i: in std_logic;

    -- VGA signals
    vgaclk:     in std_logic;
    vga_hsync:  out std_logic;
    vga_vsync:  out std_logic;
    vga_b:      out std_logic;
    vga_r:      out std_logic;
    vga_g:      out std_logic;
    vga_bright: out std_logic
  );
  end component;


  signal sysrst:      std_logic;
  signal sysclk:      std_logic;
  signal dbg_reset:   std_logic;
  signal clkgen_rst:  std_logic;
  signal gpio_o:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_i:      std_logic_vector(zpuino_gpio_count-1 downto 0);

  signal rx: std_logic;
  signal tx: std_logic;

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

  signal spi_enabled:  std_logic;

  signal spi2_enabled:  std_logic;
  signal spi2_mosi:  std_logic;
  signal spi2_miso:  std_logic;
  signal spi2_sck:  std_logic;

  signal uart_enabled:  std_logic;

  -- SPP signal is one more than GPIO count
  signal gpio_spp_data: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_spp_read: std_logic_vector(zpuino_gpio_count-1 downto 0);

  --signal gpio_spp_en: std_logic_vector(zpuino_gpio_count-1 downto 1);

  signal timers_interrupt:  std_logic_vector(1 downto 0);
  signal timers_pwm:        std_logic_vector(1 downto 0);

  signal ivecs: std_logic_vector(17 downto 0);

  signal sigmadelta_spp_en:  std_logic_vector(1 downto 0);
  signal sigmadelta_spp_data:  std_logic_vector(1 downto 0);

  signal spi_pf_miso: std_logic;
  signal spi_pf_mosi: std_logic;
  signal spi_pf_sck: std_logic;
  signal uart_tx: std_logic;
  signal uart_rx: std_logic;

  signal wb_clk_i: std_logic;
  signal wb_rst_i: std_logic;

  signal jtag_data_chain_out: std_logic_vector(98 downto 0);
  signal jtag_ctrl_chain_in:  std_logic_vector(11 downto 0);


  signal vgaclk: std_logic;
  signal vga_hsync:   std_logic;
  signal vga_vsync:   std_logic;
  signal vga_b:       std_logic;
  signal vga_r:       std_logic;
  signal vga_g:       std_logic;

  signal v_wb_dat_o: std_logic_vector(wordSize-1 downto 0);
  signal v_wb_dat_i: std_logic_vector(wordSize-1 downto 0);
  signal v_wb_adr_i: std_logic_vector(maxAddrBitIncIO downto 0);
  signal v_wb_we_i:  std_logic;
  signal v_wb_cyc_i: std_logic;
  signal v_wb_stb_i: std_logic;
  signal v_wb_ack_o: std_logic;

  signal sevenseg_data: std_logic_vector(6 downto 0);
  signal sevenseg_dp:  std_logic;
  signal sevenseg_enable: std_logic_vector(3 downto 0);

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
    --sysrst <= clkgen_rst;


  clkgen_inst: clkgen
  port map (
    clkin   => clk,
    rstin   => dbg_reset,
    clkout  => sysclk,
    vgaclkout => vgaclk,
    rstout  => clkgen_rst
  );



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

      m_wb_dat_o    => v_wb_dat_o,
      m_wb_dat_i    => v_wb_dat_i,
      m_wb_adr_i    => v_wb_adr_i,
      m_wb_we_i     => v_wb_we_i,
      m_wb_cyc_i    => v_wb_cyc_i,
      m_wb_stb_i    => v_wb_stb_i,
      m_wb_ack_o    => v_wb_ack_o,

      dbg_reset     => open,
      jtag_data_chain_out => open,--jtag_data_chain_out,
      jtag_ctrl_chain_in  => (others=>'0')--jtag_ctrl_chain_in

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
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(0),
    wb_dat_i     => slot_write(0),
    wb_adr_i   => slot_address(0),
    wb_we_i        => slot_we(0),
    wb_cyc_i      => slot_cyc(0),
    wb_stb_i      => slot_stb(0),
    wb_ack_o      => slot_ack(0),
    wb_inta_o => slot_interrupt(0),

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
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(1),
    wb_dat_i     => slot_write(1),
    wb_adr_i   => slot_address(1),
    wb_we_i      => slot_we(1),
    wb_cyc_i       => slot_cyc(1),
    wb_stb_i       => slot_stb(1),
    wb_ack_o      => slot_ack(1),

    wb_inta_o => slot_interrupt(1),

    enabled   => uart_enabled,
    tx        => uart_tx,
    rx        => uart_rx
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

    spp_data  => gpio_spp_data,
    spp_read  => gpio_spp_read,

    gpio_i      => gpio_i,
    gpio_t      => gpio_t,
    gpio_o      => gpio_o,
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
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(5),
    wb_dat_i     => slot_write(5),
    wb_adr_i   => slot_address(5),
    wb_we_i        => slot_we(5),
    wb_cyc_i        => slot_cyc(5),
    wb_stb_i        => slot_stb(5),
    wb_ack_o      => slot_ack(5),
    wb_inta_o => slot_interrupt(5),

    spp_data  => sigmadelta_spp_data,
    --spp_en    => sigmadelta_spp_en,
    sync_in   => '1'
  );

  --
  -- IO SLOT 6
  --

  slot1: zpuino_spi
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(6),
    wb_dat_i     => slot_write(6),
    wb_adr_i   => slot_address(6),
    wb_we_i        => slot_we(6),
    wb_cyc_i        => slot_cyc(6),
    wb_stb_i        => slot_stb(6),
    wb_ack_o      => slot_ack(6),
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
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o     => slot_read(7),
    wb_dat_i     => slot_write(7),
    wb_adr_i   => slot_address(7),
    wb_we_i     => slot_we(7),
    wb_cyc_i        => slot_cyc(7),
    wb_stb_i        => slot_stb(7),
    wb_ack_o      => slot_ack(7),
    wb_inta_o => slot_interrupt(7)
  );

  --
  -- IO SLOT 8
  --

  vgat: vga_zxspectrum
    port map (
    wb_clk_i    => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o    => slot_read(8),
    wb_dat_i    => slot_write(8),
    wb_adr_i    => slot_address(8),
    wb_we_i     => slot_we(8),
    wb_cyc_i    => slot_cyc(8),
    wb_stb_i    => slot_stb(8),
    wb_ack_o    => slot_ack(8),

    -- Wishbone MASTER interface
    mi_wb_dat_i   => v_wb_dat_o,
    mi_wb_dat_o   => v_wb_dat_i,
    mi_wb_adr_o   => v_wb_adr_i,
    mi_wb_sel_o   => open,
    mi_wb_cti_o   => open,
    mi_wb_we_o    => v_wb_we_i,
    mi_wb_cyc_o   => v_wb_cyc_i,
    mi_wb_stb_o   => v_wb_stb_i,
    mi_wb_ack_i   => v_wb_ack_o,

    vgaclk          => vgaclk,
    vga_hsync       => vga_hsync,
    vga_vsync       => vga_vsync,
    vga_b           => vga_b,
    vga_r           => vga_r,
    vga_g           => vga_g
  );

  --
  -- IO SLOT 9
  --

  slot9: zpuino_sevenseg
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
    wb_inta_o => slot_interrupt(9),

    segdata   => sevenseg_data,
    dot       => sevenseg_dp,
    extra     => open,
    enable    => sevenseg_enable
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

  pins: block
  begin

  pin00: OPAD port map ( I => sevenseg_enable(3), PAD => Seg7_AN(3) );
  pin01: OPAD port map ( I => sevenseg_dp,        PAD => Seg7_DP );
  pin02: OPAD port map ( I => sevenseg_enable(2), PAD => Seg7_AN(2) );
  pin03: OPAD port map ( I => sevenseg_data(4),   PAD => Seg7_E );
  pin04: OPAD port map ( I => sevenseg_data(5),   PAD => Seg7_F);
  pin05: OPAD port map ( I => sevenseg_data(2),   PAD => Seg7_C);
  pin06: OPAD port map ( I => sevenseg_data(3),   PAD => Seg7_D );
  pin07: OPAD port map ( I => sevenseg_data(0),   PAD => Seg7_A );
  pin08: OPAD port map ( I => sevenseg_enable(1), PAD => Seg7_AN(1) );
  pin09: OPAD port map ( I => sevenseg_data(6),   PAD => Seg7_G );
  pin10: OPAD port map ( I => sevenseg_data(1),   PAD => Seg7_B );
  pin11: OPAD port map ( I => sevenseg_enable(0), PAD => Seg7_AN(0) );

  pin12: OPAD port map ( I => gpio_o(0),    PAD => ADC_SPI_CS  );
  pin13: OPAD port map ( I => spi2_mosi,    PAD => ADC_SPI_MOSI );
  spi2_miso <= ADC_SPI_MISO;
  pin15: OPAD port map ( I => spi2_sck,          PAD => ADC_SPI_SCLK );



  pin16: OPAD port map(I => vga_vsync, PAD => VSYNC );
  pin17: OPAD port map(I => vga_hsync, PAD => HSYNC );
  pin18: OPAD port map(I => vga_b,     PAD => BLUE(0) );
  pin19: OPAD port map(I => vga_b,     PAD => BLUE(1) );
  pin20: OPAD port map(I => vga_g,     PAD => GREEN(0) );
  pin21: OPAD port map(I => vga_g,     PAD => GREEN(1) );
  pin22: OPAD port map(I => vga_g,     PAD => GREEN(2) );
  pin23: OPAD port map(I => vga_r,     PAD => RED(0) );
  pin24: OPAD port map(I => vga_r,     PAD => RED(1) );
  pin25: OPAD port map(I => vga_r,     PAD => RED(2) );
  pin26: OPAD port map(I => sigmadelta_spp_data(0), PAD => AUDIO );
  pin27: IPAD port map(O => gpio_i(1),C => sysclk,PAD => JOY_RIGHT );
  pin28: IPAD port map(O => gpio_i(2),C => sysclk,PAD => JOY_LEFT );
  pin29: IPAD port map(O => gpio_i(3),C => sysclk,PAD => JOY_DOWN );
  pin30: IPAD port map(O => gpio_i(4),C => sysclk,PAD => JOY_UP );
  pin31: IPAD port map(O => gpio_i(5),C => sysclk,PAD => JOY_SELECT );

  pin32: IPAD port map(O => gpio_i(6),C => sysclk,PAD => SWITCH(0) );
  pin33: IPAD port map(O => gpio_i(7),C => sysclk,PAD => SWITCH(1) );
  pin34: IPAD port map(O => gpio_i(8),C => sysclk,PAD => SWITCH(2) );
  pin35: IPAD port map(O => gpio_i(9),C => sysclk,PAD => SWITCH(3) );
  pin36: IPAD port map(O => gpio_i(10),C => sysclk,PAD => SWITCH(4) );
  pin37: IPAD port map(O => gpio_i(11),C => sysclk,PAD => SWITCH(5) );
  pin38: IPAD port map(O => gpio_i(12),C => sysclk,PAD => SWITCH(6) );
  pin39: IPAD port map(O => gpio_i(13),C => sysclk,PAD => SWITCH(7) );

  pin40: OPAD port map(I => gpio_o(14),O => gpio_i(14),PAD => LED(0) );
  pin41: OPAD port map(I => gpio_o(15),O => gpio_i(15),PAD => LED(1) );
  pin42: OPAD port map(I => gpio_o(16),O => gpio_i(16),PAD => LED(2) );
  pin43: OPAD port map(I => gpio_o(17),O => gpio_i(17),PAD => LED(3) );
  pin44: OPAD port map(I => gpio_o(18),O => gpio_i(18),PAD => LED(4) );
  pin45: OPAD port map(I => gpio_o(19),O => gpio_i(19),PAD => LED(5) );
  pin46: OPAD port map(I => gpio_o(20),O => gpio_i(20),PAD => LED(6) );
  pin47: OPAD port map(I => gpio_o(21),O => gpio_i(21),PAD => LED(7) );

  end block;

  gpio_i(47 downto 22) <= (others => DontCareValue);

  uart_rx <= rx;
  tx <= uart_tx;


  -- Other ports are special, we need to avoid outputs on input-only pins

  ibufrx:   IPAD port map ( PAD => RXD,        O => rx, C => sysclk );
--  ibufmiso: IPAD port map ( PAD => SPI_MISO,   O => spi_pf_miso, C => sysclk );
  spi_pf_miso <= SPI_MISO;
  obuftx:   OPAD port map ( I => tx,   PAD => TXD );
  ospiclk:  OPAD port map ( I => spi_pf_sck,   PAD => SPI_SCK );
  ospics:   OPAD port map ( I => gpio_o(48), O => gpio_i(48),   PAD => SPI_CS );
  ospimosi: OPAD port map ( I => spi_pf_mosi,   PAD => SPI_MOSI );


  process(gpio_spp_read, 
          sigmadelta_spp_data,
          timers_pwm,
          spi2_mosi,spi2_sck)
  begin

    gpio_spp_data <= (others => DontCareValue);

--    gpio_spp_data(0)  <= sigmadelta_spp_data(0); -- PPS0 : SIGMADELTA DATA
--    gpio_spp_data(1)  <= timers_pwm(0);          -- PPS1 : TIMER0
--    gpio_spp_data(2)  <= timers_pwm(1);          -- PPS2 : TIMER1
--    gpio_spp_data(3)  <= spi2_mosi;              -- PPS3 : USPI MOSI
--    gpio_spp_data(4)  <= spi2_sck;               -- PPS4 : USPI SCK
--    gpio_spp_data(5)  <= sigmadelta_spp_data(1); -- PPS5 : SIGMADELTA1 DATA

--    spi2_miso         <= gpio_spp_read(0);       -- PPS7 : USPI MISO
  end process;


end behave;
