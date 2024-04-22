--
--
--  ZPUINO implementation on Gadget Factory 'Papilio DUO' Board
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

entity papilio_duo_top is
  port (
    CLK:        in std_logic;

    -- Connection to the main SPI flash
    FLASH_CK:    out std_logic;
    FLASH_SO:   in std_logic;
    FLASH_SI:   out std_logic;
    FLASH_CS:     out std_logic;

    -- WING connections
    --WING_A:     inout std_logic_vector(15 downto 0);
    --WING_B:     inout std_logic_vector(15 downto 0);
    --WING_C:     inout std_logic_vector(15 downto 0);

    ARDUINO_RESET:  out std_logic;

    -- UART (FTDI) connection
    TXD:        out std_logic;
    RXD:        in std_logic;

    VGA_HSYNC:  out std_logic;
    VGA_VSYNC:  out std_logic;
    VGA_RED:    out std_logic_vector(3 downto 0);
    VGA_GREEN:  out std_logic_vector(3 downto 0);
    VGA_BLUE:   out std_logic_vector(3 downto 0);

    SD_MOSI:    out std_logic;
    SD_MISO:    in  std_logic;
    SD_SCK:     out std_logic;
    SD_nCS:     out std_logic;

    SW_LEFT:    in std_logic;
    SW_UP:      in std_logic;
    SW_DOWN:    in std_logic;
    SW_RIGHT:   in std_logic;
    RESET:      in std_logic;

    -- SRAM connections
    sram_addr:  out std_logic_vector(20 downto 0);
    sram_data:  inout std_logic_vector(7 downto 0);
    sram_ce:    out std_logic;
    sram_we:    out std_logic;
    sram_oe:    out std_logic

  );
end entity papilio_duo_top;

architecture behave of papilio_duo_top is

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

  signal gpio_o:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t:      std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_i:      std_logic_vector(zpuino_gpio_count-1 downto 0);

  constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "00" &                -- SPI CS and LED
    "1111111111111111" &  -- Wing C
    "0000000000000000" &  -- Wing B
    "1111111111111111";   -- Wing A

  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "00" &                -- SPI CS and LED
    "1111111111111111" &  -- Wing C
    "0000000000000000" &  -- Wing B
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
  signal ppsout_info_slot: ppsoutinfotype := (others => -1);
  signal ppsout_info_pin:  ppsoutinfotype;
  signal ppsin_info_slot: ppsininfotype := (others => -1);
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
  signal sram_wb_sel_i:       std_logic_vector(3 downto 0);
  signal sram_wb_we_i:        std_logic;
  signal sram_wb_stall_o:     std_logic;

  signal spiwb_wb_ack_o:       std_logic;
  signal spiwb_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal spiwb_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal spiwb_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal spiwb_wb_cyc_i:       std_logic;
  signal spiwb_wb_stb_i:       std_logic;
  signal spiwb_wb_sel_i:       std_logic_vector(3 downto 0);
  signal spiwb_wb_we_i:        std_logic;

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

  component spiwb is
  port (
    nCS:  in std_logic;
    SCK:  in std_logic;
    MOSI: in std_logic;
    MISO: out std_logic;
    MISOTRIS: out std_logic;

    clk:    in std_logic;
    rst:    in std_logic;

    wb_we_o:  out std_logic;
    wb_cyc_o:  out std_logic;
    wb_stb_o:  out std_logic;
    wb_adr_o:  out std_logic_vector(maxIObit downto minIObit);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_ack_i: in std_logic
  );
  end component;

  component vga_generic is
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
    id:       out slot_id;

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
    mi_wb_stall_i: in std_logic;

    -- VGA signals
    clk_42mhz:     in std_logic;
    vga_hsync:  out std_logic;
    vga_vsync:  out std_logic;
    vga_b:      out std_logic_vector(4 downto 0);
    vga_r:      out std_logic_vector(4 downto 0);
    vga_g:      out std_logic_vector(5 downto 0)
  );
  end component;

  signal m_wb_ack_o:       std_logic;
  signal m_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal m_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal m_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal m_wb_cyc_i:       std_logic;
  signal m_wb_stb_i:       std_logic;
  signal m_wb_we_i:        std_logic;
  signal m_wb_cti_i:       std_logic_vector(2 downto 0);
  signal m_wb_stall_o:     std_logic;


  signal uart2_rx: std_logic;
  signal uart2_tx: std_logic;  

  signal avrspimiso, avrspimisotris: std_logic;
  signal clk42: std_ulogic;
  signal vga_b:       std_logic_vector(4 downto 0);
  signal vga_r:       std_logic_vector(4 downto 0);
  signal vga_g:       std_logic_vector(5 downto 0);

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
    rstin   => '0'  ,
    clkout  => sysclk,
    clkout1  => sysclk_sram_we,
    clkout2  => sysclk_sram_wen,
    clk42    => clk42,
    rstout  => clkgen_rst
  );



  -- Other ports are special, we need to avoid outputs on input-only pins

  ibufrx:   IPAD port map ( PAD => RXD,        O => rx,           C => sysclk );
  ibufmiso: IPAD port map ( PAD => FLASH_SO,   O => spi_pf_miso,  C => sysclk );

  obuftx:   OPAD port map ( I => tx,           PAD => TXD );
  ospiclk:  OPAD port map ( I => spi_pf_sck,   PAD => FLASH_CK );
  ospics:   OPAD port map ( I => gpio_o(48),   PAD => FLASH_CS );
  ospimosi: OPAD port map ( I => spi_pf_mosi,  PAD => FLASH_SI );
  --oled:     OPAD port map ( I => gpio_o(49),   PAD => LED );

  osdcs:    OPAD port map ( I => gpio_o(0),   PAD => SD_nCS );

  -- Buttons
  iswup:   IPAD port map ( PAD => SW_UP,        O => gpio_i(1),           C => sysclk );
  iswdown: IPAD port map ( PAD => SW_DOWN,      O => gpio_i(2),           C => sysclk );
  iswleft: IPAD port map ( PAD => SW_LEFT,      O => gpio_i(3),           C => sysclk );
  iswright:IPAD port map ( PAD => SW_RIGHT,     O => gpio_i(4),           C => sysclk );
  iswrst:  IPAD port map ( PAD => RESET,        O => gpio_i(5),           C => sysclk );


  --WING_A(12)<='Z' when avrspimisotris='1' else avrspimiso;


  --spiwb_inst: spiwb
  --  port map (
  --    nCS   => WING_A(10), --AVR_nCS,
  --    SCK   => WING_A(13), --AVR_SCK,
  --    MOSI  => WING_A(11), --AVR_MOSI,
  --    MISO  =>    avrspimiso, --WING_A(12), --AVR_MISO,
  --    MISOTRIS  => avrspimisotris,--WING_A(12), --AVR_MISO,
  --    clk   => sysclk,
  --    rst   => sysrst,
  --
  --    wb_we_o   => spiwb_wb_we_i,
  --    wb_cyc_o  => spiwb_wb_cyc_i,
  --    wb_stb_o  => spiwb_wb_stb_i,
  --    wb_adr_o  => spiwb_wb_adr_i(maxIObit downto 2),
  --    wb_dat_i  => spiwb_wb_dat_o,
  --    wb_dat_o  => spiwb_wb_dat_i,
  --    wb_ack_i  => spiwb_wb_ack_o
  --
  -- );


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
	  
      m_wb_dat_o    => m_wb_dat_o,
      m_wb_dat_i    => m_wb_dat_i,
      m_wb_adr_i    => m_wb_adr_i,
      m_wb_we_i     => m_wb_we_i,
      m_wb_cyc_i    => m_wb_cyc_i,
      m_wb_stb_i    => m_wb_stb_i,
      m_wb_cti_i    => CTI_CYCLE_CLASSIC,
      m_wb_ack_o    => m_wb_ack_o,
      m_wb_stall_o  => m_wb_stall_o,

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
    sck           => spi_pf_sck,
    enabled       => open
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

    mosi          => SD_MOSI,
    miso          => SD_MISO,
    sck           => SD_SCK,
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

  sram_inst: sram_ctrl8
    generic map (
      WIDTH_BITS => 21
    )
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
      --wb_cti_i    => CTI_CYCLE_CLASSIC,
      wb_ack_o    => sram_wb_ack_o,
      wb_stall_o  => sram_wb_stall_o,

      -- SRAM signals
      sram_addr   => sram_addr,
      sram_data   => sram_data,
      sram_ce     => sram_ce,
      sram_we     => sram_we,
      sram_oe     => sram_oe,
      clk_we      =>sysclk_sram_we,
      clk_wen     =>sysclk_sram_wen
    );

  --
  -- IO SLOT 9
  --

  --
  -- IO SLOT 9
  --

  slot9: zpuino_empty_device
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
    id            => slot_ids(9)
  );


  --
  -- IO SLOT 10
  --

  slot10: zpuino_empty_device
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
    wb_inta_o     => slot_interrupt(10),
    id            => slot_ids(10)
  );

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

  slot12: zpuino_empty_device
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
    id            => slot_ids(12)
  );

  --
  -- IO SLOT 13
  --

  vga: vga_generic
    port map (
    wb_clk_i    => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o    => slot_read(13),
    wb_dat_i    => slot_write(13),
    wb_adr_i    => slot_address(13),
    wb_we_i     => slot_we(13),
    wb_cyc_i    => slot_cyc(13),
    wb_stb_i    => slot_stb(13),
    wb_ack_o    => slot_ack(13),
    id          => slot_ids(13),

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

    clk_42mhz       => clk42,
    vga_hsync       => vga_hsync,
    vga_vsync       => vga_vsync,
    vga_b           => vga_b,
    vga_r           => vga_r,
    vga_g           => vga_g
  );

  VGA_RED <= vga_r(4 downto 1);
  VGA_GREEN <= vga_g(5 downto 2);
  VGA_BLUE <= vga_b(4 downto 1);

  --
  -- IO SLOT 14
  --

  slot14: zpuino_empty_device
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,
    wb_dat_o      => slot_read(14),
    wb_dat_i      => slot_write(14),
    wb_adr_i      => slot_address(14),
    wb_we_i       => slot_we(14),
    wb_cyc_i      => slot_cyc(14),
    wb_stb_i      => slot_stb(14),
    wb_ack_o      => slot_ack(14),
    wb_inta_o     => slot_interrupt(14),
    id            => slot_ids(14)
  );

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
    gpio_spp_data(1)  <= timers_pwm(0);            -- PPS1 : TIMER0
    gpio_spp_data(2)  <= timers_pwm(1);            -- PPS2 : TIMER1
    --gpio_spp_data(3)  <= spi2_mosi;                -- PPS3 : USPI MOSI
    --gpio_spp_data(4)  <= spi2_sck;                 -- PPS4 : USPI SCK
    gpio_spp_data(5)  <= sigmadelta_spp_data(1);   -- PPS5 : SIGMADELTA1 DATA

    -- PPS inputs
    --spi2_miso         <= gpio_spp_read(0);         -- PPS0 : USPI MISO

  end process;

  ARDUINO_RESET <= '0';

end behave;
