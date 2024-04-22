--
--
--  ZPUINO implementation on Numato MimasV2 Board
-- 
--  Copyright 2015 Alvaro Lopes <alvieboy@alvie.com>
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
library unisim;
use unisim.vcomponents.all;

entity mimasv2_top is
  port (
    clkin:        in std_logic;
    nreset:       in std_logic;

    UART_RX:      in std_logic;
    UART_TX:      out std_logic;

    -- Connection to the main SPI flash
    flash_sck:      out std_logic;
    flash_miso:     in std_logic;
    flash_mosi:     out std_logic;
    flash_cs:       out std_logic;

    mcb3_rzq:         inout std_logic;
    mcb3_dram_we_n:   out std_logic;
    mcb3_dram_udqs:   inout std_logic;
    mcb3_dram_udm:    out std_logic;
    mcb3_dram_ras_n:  out std_logic;
    mcb3_dram_dm:     out std_logic;
    mcb3_dram_dqs:    inout std_logic;
    mcb3_dram_dq:     inout std_logic_vector(15 downto 0);
    mcb3_dram_ck_n:   out std_logic;
    mcb3_dram_ck:     out std_logic;
    mcb3_dram_cke:    out std_logic;
    mcb3_dram_cas_n:  out std_logic;
    mcb3_dram_ba:     out std_logic_vector(1 downto 0);
    mcb3_dram_a:      out std_logic_vector(12 downto 0);
    led:              out std_logic_vector(7 downto 0);

    -- VGA
    hsync:            out std_logic;
    vsync:            out std_logic;
    red:              out std_logic_vector(2 downto 0);
    green:            out std_logic_vector(2 downto 0);
    blue:             out std_logic_vector(1 downto 0);

    -- Audio
    audio:            out std_logic_vector(1 downto 0);

    -- 7-seg
    sevensegment:     out std_logic_vector(7 downto 0);
    sevensegmenten:   out std_logic_vector(2 downto 0);
    -- DP switches
    dpswitch:         in std_logic_vector(7 downto 0);
    -- SD card
    sd_miso:          in std_logic;
    sd_cs:            out std_logic;  -- gpio
    sd_mosi:          out std_logic;
    sd_sck:           out std_logic;

    io_p6:            inout std_logic_vector(7 downto 0);
    io_p7:            inout std_logic_vector(7 downto 0);
    io_p8:            inout std_logic_vector(7 downto 0);
    io_p9:            inout std_logic_vector(7 downto 0)
  );
end entity mimasv2_top;

architecture behave of mimasv2_top is

  component clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    clkout1: out std_logic;
    clkout2: out std_logic;
	  clkvga: out std_logic;
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
    "000000000000000000" &
    "11111111" & "11111111" & "11111111" & "11111111"
  ;
  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "000000000000000000" &
    "11111111" & "11111111" & "11111111" & "11111111"
  ;                        

  -- I/O Signals
  signal slot_cyc:    slot_std_logic_type;
  signal slot_we:     slot_std_logic_type;
  signal slot_stb:    slot_std_logic_type;
  signal slot_read:   slot_cpuword_type;
  signal slot_write:  slot_cpuword_type;
  signal slot_address:slot_address_type;
  signal slot_ack:    slot_std_logic_type;
  signal slot_interrupt: slot_std_logic_type;
  signal slot_ids:  slot_id_type;

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
  signal sram_wb_adr_i:       std_logic_vector(31 downto 0);
  signal sram_wb_cyc_i:       std_logic;
  signal sram_wb_stb_i:       std_logic;
  signal sram_wb_cti_i:       std_logic_vector(2 downto 0);
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


  signal sigmadelta_raw: std_logic_vector(17 downto 0);
  
  signal uart2_tx, uart2_rx: std_logic;  
  
  signal sigmadelta_spp_en:  std_logic_vector(1 downto 0);
  signal clkvga, clkvga_n: std_ulogic;

  signal vga_b:       std_logic_vector(4 downto 0);
  signal vga_r:       std_logic_vector(4 downto 0);
  signal vga_g:       std_logic_vector(5 downto 0);

  signal vgaclk:      std_ulogic;
  signal vgaclk_i:    std_ulogic;
  signal ssenable:    std_logic_vector(3 downto 0);

  signal extrst:      std_logic;
  signal dcmlocked:   std_logic;
  signal mcb_clkin:   std_ulogic;
  signal clkfb_in, clkfb_out: std_ulogic;

  signal scl_pad_i     : std_logic;                    -- i2c clock line input
  signal scl_pad_o     : std_logic;                    -- i2c clock line output
  signal scl_padoen_o  : std_logic;                    -- i2c clock line output enable, active low
  signal sda_pad_i     : std_logic;                    -- i2c data line input
  signal sda_pad_o     : std_logic;                    -- i2c data line output
  signal sda_padoen_o  : std_logic;                    -- i2c data line output enable, active low

begin

  wb_clk_i <= sysclk;
  wb_rst_i <= sysrst;

  extrst <= (not nreset);

  rstgen: zpuino_serialreset
    generic map (
      SYSTEM_CLOCK_MHZ  => 96
    )
    port map (
      clk       => sysclk,
      rx        => rx,
      rstin     => extrst,
      rstout    => sysrst
    );
  leddev: if false generate
  led(0) <= sysrst;

  lb: block
    signal counter: unsigned(25 downto 0) := (others => '0');
  begin
    process(sysclk)
    begin
      if rising_edge(sysclk) then
        counter <= counter + 1;
      end if;
    end process;
        led(1) <= counter(counter'high);
  end block;

  led(2) <= rx;
  led(3) <= tx;
  led(4) <= clkgen_rst;
  led(7 downto 5)<=(others =>'0');
  end generate;

  buffers: block
  begin
    pin00:    IOPAD port map ( PAD => io_p6(7),   O => gpio_i(0), T => gpio_t(0), I => gpio_o(0), C => sysclk );
    pin01:    IOPAD port map ( PAD => io_p6(6),   O => gpio_i(1), T => gpio_t(1), I => gpio_o(1), C => sysclk );
    pin02:    IOPAD port map ( PAD => io_p6(5),   O => gpio_i(2), T => gpio_t(2), I => gpio_o(2), C => sysclk );
    pin03:    IOPAD port map ( PAD => io_p6(4),   O => gpio_i(3), T => gpio_t(3), I => gpio_o(3), C => sysclk );
    pin04:    IOPAD port map ( PAD => io_p6(3),   O => gpio_i(4), T => gpio_t(4), I => gpio_o(4), C => sysclk );
    pin05:    IOPAD port map ( PAD => io_p6(2),   O => gpio_i(5), T => gpio_t(5), I => gpio_o(5), C => sysclk );
    pin06:    IOPAD port map ( PAD => io_p6(1),   O => gpio_i(6), T => gpio_t(6), I => gpio_o(6), C => sysclk );
    pin07:    IOPAD port map ( PAD => io_p6(0),   O => gpio_i(7), T => gpio_t(7), I => gpio_o(7), C => sysclk );

    pin08:    IOPAD port map ( PAD => io_p7(7),   O => gpio_i(8), T => gpio_t(8), I => gpio_o(8), C => sysclk );
    pin09:    IOPAD port map ( PAD => io_p7(6),   O => gpio_i(9), T => gpio_t(9), I => gpio_o(9), C => sysclk );
    pin10:    IOPAD port map ( PAD => io_p7(5),   O => gpio_i(10), T => gpio_t(10), I => gpio_o(10), C => sysclk );
    pin11:    IOPAD port map ( PAD => io_p7(4),   O => gpio_i(11), T => gpio_t(11), I => gpio_o(11), C => sysclk );
    pin12:    IOPAD port map ( PAD => io_p7(3),   O => gpio_i(12), T => gpio_t(12), I => gpio_o(12), C => sysclk );
    pin13:    IOPAD port map ( PAD => io_p7(2),   O => gpio_i(13), T => gpio_t(13), I => gpio_o(13), C => sysclk );
    pin14:    IOPAD port map ( PAD => io_p7(1),   O => gpio_i(14), T => gpio_t(14), I => gpio_o(14), C => sysclk );
    pin15:    IOPAD port map ( PAD => io_p7(0),   O => gpio_i(15), T => gpio_t(15), I => gpio_o(15), C => sysclk );

    pin16:    IOPAD port map ( PAD => io_p8(7),   O => gpio_i(16), T => gpio_t(16), I => gpio_o(16), C => sysclk );
    pin17:    IOPAD port map ( PAD => io_p8(6),   O => gpio_i(17), T => gpio_t(17), I => gpio_o(17), C => sysclk );
    pin18:    IOPAD port map ( PAD => io_p8(5),   O => gpio_i(18), T => gpio_t(18), I => gpio_o(18), C => sysclk );
    pin19:    IOPAD port map ( PAD => io_p8(4),   O => gpio_i(19), T => gpio_t(19), I => gpio_o(19), C => sysclk );
    pin20:    IOPAD port map ( PAD => io_p8(3),   O => gpio_i(20), T => gpio_t(20), I => gpio_o(20), C => sysclk );
    pin21:    IOPAD port map ( PAD => io_p8(2),   O => gpio_i(21), T => gpio_t(21), I => gpio_o(21), C => sysclk );
    pin22:    IOPAD port map ( PAD => io_p8(1),   O => gpio_i(22), T => gpio_t(22), I => gpio_o(22), C => sysclk );
    pin23:    IOPAD port map ( PAD => io_p8(0),   O => gpio_i(23), T => gpio_t(23), I => gpio_o(23), C => sysclk );

    pin24:    IOPAD port map ( PAD => io_p9(7),   O => gpio_i(24), T => gpio_t(24), I => gpio_o(24), C => sysclk );
    pin25:    IOPAD port map ( PAD => io_p9(6),   O => gpio_i(25), T => gpio_t(25), I => gpio_o(25), C => sysclk );
    pin26:    IOPAD port map ( PAD => io_p9(5),   O => gpio_i(26), T => gpio_t(26), I => gpio_o(26), C => sysclk );
    pin27:    IOPAD port map ( PAD => io_p9(4),   O => gpio_i(27), T => gpio_t(27), I => gpio_o(27), C => sysclk );
    pin28:    IOPAD port map ( PAD => io_p9(3),   O => gpio_i(28), T => gpio_t(28), I => gpio_o(28), C => sysclk );
    pin29:    IOPAD port map ( PAD => io_p9(2),   O => gpio_i(29), T => gpio_t(29), I => gpio_o(29), C => sysclk );
    pin30:    IOPAD port map ( PAD => io_p9(1),   O => gpio_i(30), T => gpio_t(30), I => gpio_o(30), C => sysclk );
    pin31:    IOPAD port map ( PAD => io_p9(0),   O => gpio_i(31), T => gpio_t(31), I => gpio_o(31), C => sysclk );
    --
    -- LED
    --
    ledgen:   for i in 0 to 7 generate
      ledbuf:   OPAD port map ( I => gpio_o(32+i), PAD => led(i) );
    end generate;

    --
    -- DP switches
    --
    gpgen:   for i in 0 to 7 generate
      gpbuf:   IPAD port map ( O => gpio_i(40+i), C => sysclk, PAD => dpswitch(i) );
    end generate;

    ibufrx:   IPAD port map ( PAD => UART_RX,  O => rx,           C => sysclk );
    obuftx:   OPAD port map ( I => tx,           PAD => UART_TX );
    ibufmiso: IPAD port map ( PAD => flash_miso, O => spi_pf_miso,  C => sysclk );
    ospiclk:  OPAD port map ( I => spi_pf_sck,   PAD => flash_sck );
    ospics:   OPAD port map ( I => gpio_o(48),   PAD => flash_cs );
    osdcs:    OPAD port map ( I => gpio_o(49),   PAD => sd_cs );
    ospimosi: OPAD port map ( I => spi_pf_mosi,  PAD => flash_mosi );


  end block;

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
      m_wb_cti_i    => m_wb_cti_i,
      m_wb_ack_o    => m_wb_ack_o,
      m_wb_stall_o  => m_wb_stall_o,

      wb_ack_i      => sram_wb_ack_o,
      wb_stall_i    => sram_wb_stall_o,
      wb_dat_o      => sram_wb_dat_i,
      wb_dat_i      => sram_wb_dat_o,
      wb_adr_o      => sram_wb_adr_i(maxAddrBit downto 0),
      wb_cyc_o      => sram_wb_cyc_i,
      wb_stb_o      => sram_wb_stb_i,
      wb_cti_o      => sram_wb_cti_i,
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

    spp_data      => audio,
    spp_en        => open,
    sync_in       => '1'
  );

  --
  -- IO SLOT 6
  --

  slot6: zpuino_sevenseg
  generic map (
    BITS => 2,
    EXTRASIZE => 1,
    FREQ_PER_DISPLAY => 120,
    MHZ => 100,
    INVERT => true
  )
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
    extra         => open,
    dot           => sevensegment(7),
    segdata       => sevensegment(6 downto 0),
    enable        => ssenable
  );
  sevensegmenten <= ssenable(3 downto 1);



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
                        
  slot10: zpuino_spi
  generic map (
    INTERNAL_SPI => false
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
    wb_inta_o     => slot_interrupt(10),
    id            => slot_ids(10),

    mosi          => sd_mosi,
    miso          => sd_miso,
    sck           => sd_sck,
    enabled       => open
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
  vga_slot13: entity work.vga_generic
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
    mi_wb_cti_o   => m_wb_cti_i,
    mi_wb_we_o    => m_wb_we_i,
    mi_wb_cyc_o   => m_wb_cyc_i,
    mi_wb_stb_o   => m_wb_stb_i,
    mi_wb_ack_i   => m_wb_ack_o,
    mi_wb_stall_i => m_wb_stall_o,

    clk_42mhz       => vgaclk,
    vga_hsync       => hsync,
    vga_vsync       => vsync,
    vga_b           => vga_b,
    vga_r           => vga_r,
    vga_g           => vga_g
  );
  blue <= vga_b(1 downto 0);
  green <= vga_g(2 downto 0);
  red <= vga_r(2 downto 0);

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

  memctrl_inst: entity work.memctrl_wb
  generic map (
      C3_COMPENSATION     => "INTERNAL",
      C3_CLK_BUFFER_INPUT  => true,
      C3_CLKFBOUT_MULT    => 8,
      C3_CLKOUT0_DIVIDE   => 2,    -- 400 MHz for DDR (4x)
      C3_CLKOUT1_DIVIDE   => 2,    -- 400 MHz for DDR (4x)
      C3_CLKOUT2_DIVIDE   => 8,    -- 100 MHz for system
      C3_CLKOUT3_DIVIDE   => 8,     -- 100 MHz for DDR memory
      C3_CLKOUT4_DIVIDE   => 19    -- 42 MHz for VGA
  )

  port map (
      syscon.clk    => wb_clk_i,
  	 	syscon.rst    => wb_rst_i,

      wbo.dat    => sram_wb_dat_o,
      wbo.ack    => sram_wb_ack_o,
      wbo.stall  => sram_wb_stall_o,
      wbo.err    => open,
      wbo.rty    => open,
      wbo.int    => open,
      wbo.tag    => open,

      wbi.dat    => sram_wb_dat_i,
      wbi.adr    => sram_wb_adr_i,
      wbi.we     => sram_wb_we_i,
      wbi.cyc    => sram_wb_cyc_i,
      wbi.stb    => sram_wb_stb_i,
      wbi.sel    => sram_wb_sel_i,
      wbi.cti    => sram_wb_cti_i,
      wbi.bte    => BTE_BURST_16BEATWRAP, -- Hardcoded.
      wbi.tag    => x"00000000",

      mcb3_dram_dq    =>      mcb3_dram_dq,
      mcb3_dram_a     =>      mcb3_dram_a,
      mcb3_dram_ba    =>      mcb3_dram_ba,
      mcb3_dram_cke   =>      mcb3_dram_cke,
      mcb3_dram_ras_n =>      mcb3_dram_ras_n,
      mcb3_dram_cas_n =>      mcb3_dram_cas_n,
      mcb3_dram_we_n  =>      mcb3_dram_we_n,
      mcb3_dram_dm    =>      mcb3_dram_dm,
      mcb3_dram_udqs  =>      mcb3_dram_udqs,
      mcb3_rzq        =>      mcb3_rzq,
      mcb3_dram_udm   =>      mcb3_dram_udm,
      mcb3_dram_dqs   =>      mcb3_dram_dqs,
      mcb3_dram_ck    =>      mcb3_dram_ck,
      mcb3_dram_ck_n  =>      mcb3_dram_ck_n,

      clkin     => mcb_clkin,
      rstin     => '0',
      clkout    => sysclk,
      clk4      => vgaclk_i,
      rstout    => clkgen_rst
  );
  vgabuf: BUFG port map ( I => vgaclk_i, O => vgaclk );

  mcb_clkin <= clkin;

  -- VGA is off
  --hsync <= '0';
  --vsync <= '0';
  --red <= (others => '0');
  --green <= (others => '0');
  --blue <= (others => '0');

  process(gpio_spp_read, spi_pf_mosi, spi_pf_sck,
          sigmadelta_spp_data,timers_pwm,
          spi2_mosi,spi2_sck)
  begin

    gpio_spp_data <= (others => DontCareValue);

    gpio_spp_data(0)  <= timers_pwm(0);            -- PPS1 : TIMER0
    ppsout_info_slot(0) <= 3; -- Slot 3
    ppsout_info_pin(0) <= 0;  -- PPS OUT pin 0 (TIMER 0)

    gpio_spp_data(1)  <= timers_pwm(1);            -- PPS2 : TIMER1
    ppsout_info_slot(1) <= 3; -- Slot 3
    ppsout_info_pin(1) <= 1;  -- PPS OUT pin 1 (TIMER 0)

    gpio_spp_data(2)  <= uart2_tx;   -- PPS6 : UART2 TX
    ppsout_info_slot(2) <= 8; -- Slot 8
    ppsout_info_pin(2) <= 0;  -- PPS OUT pin 0 (Channel 1)

    uart2_rx          <= gpio_spp_read(0);         -- PPS1 : UART2 RX
    ppsin_info_slot(0) <= 8;                    -- Slot 8
    ppsin_info_pin(0) <= 0;                     -- 

  end process;

end behave;
