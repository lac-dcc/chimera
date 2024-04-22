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
use work.wishbonepkg.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity s3e_eval_zpuino is
  port (
    CLK:          in std_logic;
    RST:          in std_logic;
    UART_RX:      in std_logic;
    UART_TX:      out std_logic;

    SPI_MISO:     in std_logic;
    SPI_MOSI:     out std_logic;
    SPI_SCK:      out std_logic;
    SPI_CS:       out std_logic;

    J1:           inout std_logic_vector(3 downto 0);
    J2:           inout std_logic_vector(3 downto 0);
    J4:           inout std_logic_vector(3 downto 0);

    SW:           in std_logic_vector(3 downto 0);

    FX2_IO:       inout std_logic_vector(39 downto 21);

    LED:          out std_logic_vector(7 downto 0);

    AMP_SHDN:     out std_logic;
    AD_CONV:      out std_logic;
    DAC_CS:       out std_logic;
    AMP_CS:       out std_logic;

    LCD_RS:       out std_logic;
    LCD_RW:       out std_logic;
    LCD_DB:       inout std_logic_vector(7 downto 4);
    LCD_E:        out std_logic;

    VGA_BLUE:     out std_logic;
    VGA_GREEN:    out std_logic;
    VGA_HSYNC:    out std_logic;
    VGA_RED:      out std_logic;
    VGA_VSYNC:    out std_logic;


    FPGA_INIT_B:  out std_logic;
    SF_CE0:       out std_logic;
    -- Rotary signals
    ROT_A:        in std_logic;
    ROT_B:        in std_logic;
    ROT_CENTER:   in std_logic;

    DRAM_ADDR     : OUT   STD_LOGIC_VECTOR (12 downto 0);
    DRAM_BA       : OUT   STD_LOGIC_VECTOR (1 downto 0);
    DRAM_CAS_N    : OUT   STD_LOGIC;
    DRAM_CKE      : OUT   STD_LOGIC;
    DRAM_CLK      : OUT   STD_LOGIC;
    DRAM_CLK_N    : OUT   STD_LOGIC;
    DRAM_CS_N     : OUT   STD_LOGIC;
    DRAM_DQ       : INOUT STD_LOGIC_VECTOR(15 downto 0);
    DRAM_DQM      : OUT   STD_LOGIC_VECTOR(1 downto 0);
    DRAM_DQS      : INOUT STD_LOGIC_VECTOR(1 downto 0);
    DRAM_RAS_N    : OUT   STD_LOGIC;
    DRAM_WE_N     : OUT   STD_LOGIC;
    DRAM_CK_FB    : IN STD_LOGIC
  );
end entity s3e_eval_zpuino;

architecture behave of s3e_eval_zpuino is

  component clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    clkddr: out std_logic;
    clkout_90: out std_logic;
    clkout_270: out std_logic;
    clkfb: in std_logic;
    rstout: out std_logic
  );
  end component clkgen;

  component zpuino_serialreset is
  generic (
    SYSTEM_CLOCK_MHZ: integer := 90
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

  component ddr_sdram is
  generic (
    HIGH_BIT: integer := 24;
    MHZ: integer := 96;
    tOPD: time := 2.388 ns;
    tIPD: time := 2.388 ns
  );
  PORT (
    clk: in std_logic;
    clk270: in std_logic;
    clk90: in std_logic;
    clkddr:in std_logic;
    rst: in std_logic;

    DRAM_ADDR     : OUT   STD_LOGIC_VECTOR (12 downto 0);
    DRAM_BA       : OUT   STD_LOGIC_VECTOR (1 downto 0);
    DRAM_CAS_N    : OUT   STD_LOGIC;
    DRAM_CKE      : OUT   STD_LOGIC;
    DRAM_CLK      : OUT   STD_LOGIC;
    DRAM_CLK_N    : OUT   STD_LOGIC;
    DRAM_CS_N     : OUT   STD_LOGIC;
    DRAM_DQ       : INOUT STD_LOGIC_VECTOR(15 downto 0);
    DRAM_DQM      : OUT   STD_LOGIC_VECTOR(1 downto 0);
    DRAM_DQS      : INOUT STD_LOGIC_VECTOR(1 downto 0);
    DRAM_RAS_N    : OUT   STD_LOGIC;
    DRAM_WE_N     : OUT   STD_LOGIC;

    --wb_clk_i: in std_logic;
	 	--wb_rst_i: in std_logic;

    wb_dat_o: out std_logic_vector(31 downto 0);
    wb_dat_i: in std_logic_vector(31 downto 0);
    wb_adr_i: in std_logic_vector(31 downto 0);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_stall_o: out std_logic
   );
  end component;


  signal sysrst:      std_logic;
  signal sysclk:      std_logic;
  signal clkddr:      std_logic;
  signal clkgen_rst:  std_logic;

  signal gpio_o: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_i: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t: std_logic_vector(zpuino_gpio_count-1 downto 0);

  signal rx: std_logic;
  signal tx: std_logic;

  constant spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "0000000000000000000000" &
    "111111111111111" & -- FXIO
    "0" & -- SPI_CS
    "0000" & -- SW
    "1111" & -- JA4
    "1111" & -- JA2
    "1111" ; -- JA1
  constant spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0) :=
    "0000000000000000000000" &
    "111111111111111" & -- FXIO
    "0" & -- SPI_CS
    "0000" & -- SW
    "1111" & -- JA4
    "1111" & -- JA2
    "1111" ; -- JA1
 


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
  signal timers_pwm: std_logic_vector(1 downto 0);

  signal ivecs: std_logic_vector(17 downto 0);

  signal sigmadelta_spp_en:  std_logic_vector(1 downto 0);
  signal sigmadelta_spp_data:  std_logic_vector(1 downto 0);

  signal spi_pf_miso: std_logic;
  signal spi_pf_mosi: std_logic;
  signal spi_pf_sck: std_logic;

  signal wb_clk_i: std_logic;
  signal wb_rst_i: std_logic;

  signal clk270, clk90: std_logic;

  signal dram_wb_ack_o:       std_logic;
  signal dram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal dram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal dram_wb_adr_i:       std_logic_vector(31 downto 0);
  signal dram_wb_cyc_i:       std_logic;
  signal dram_wb_stb_i:       std_logic;
  signal dram_wb_we_i:        std_logic;
  signal dram_wb_stall_o:     std_logic;

  signal np_ram_wb_ack_o:       std_logic;
  signal np_ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal np_ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal np_ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal np_ram_wb_cyc_i:       std_logic;
  signal np_ram_wb_stb_i:       std_logic;
  signal np_ram_wb_we_i:        std_logic;

  signal ram_wb_ack_o:       std_logic;
  signal ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal ram_wb_cyc_i:       std_logic;
  signal ram_wb_stb_i:       std_logic;
  signal ram_wb_we_i:        std_logic;
  signal ram_wb_stall_o:     std_logic;

  signal rom_wb_ack_o:       std_logic;
  signal rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal rom_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal rom_wb_cyc_i:       std_logic;
  signal rom_wb_stb_i:       std_logic;
  signal rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal rom_wb_stall_o:     std_logic;

  signal prom_rom_wb_ack_o:       std_logic;
  signal prom_rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal prom_rom_wb_adr_i:       std_logic_vector(maxAddrBit downto 2);
  signal prom_rom_wb_cyc_i:       std_logic;
  signal prom_rom_wb_stb_i:       std_logic;
  signal prom_rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal prom_rom_wb_stall_o:     std_logic;

  signal sram_wb_ack_o:       std_logic;
  signal sram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal sram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal sram_wb_adr_i:       std_logic_vector(31 downto 0);
  signal sram_wb_cyc_i:       std_logic;
  signal sram_wb_stb_i:       std_logic;
  signal sram_wb_we_i:        std_logic;
  signal sram_wb_stall_o:     std_logic;

  signal sram_rom_wb_ack_o:       std_logic;
  signal sram_rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal sram_rom_wb_adr_i:       std_logic_vector(maxAddrBit downto 2);
  signal sram_rom_wb_cyc_i:       std_logic;
  signal sram_rom_wb_stb_i:       std_logic;
  signal sram_rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal sram_rom_wb_stall_o:     std_logic;


  signal memory_enable: std_logic;

  component wb_rom_ram is
  port (
    ram_wb_clk_i:       in std_logic;
    ram_wb_rst_i:       in std_logic;
    ram_wb_ack_o:       out std_logic;
    ram_wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    ram_wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    ram_wb_adr_i:       in std_logic_vector(maxAddrBitIncIO downto 0);
    ram_wb_cyc_i:       in std_logic;
    ram_wb_stb_i:       in std_logic;
    ram_wb_we_i:        in std_logic;

    rom_wb_clk_i:       in std_logic;
    rom_wb_rst_i:       in std_logic;
    rom_wb_ack_o:       out std_logic;
    rom_wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    rom_wb_adr_i:       in std_logic_vector(maxAddrBitIncIO downto 0);
    rom_wb_cyc_i:       in std_logic;
    rom_wb_stb_i:       in std_logic;
    rom_wb_cti_i:       in std_logic_vector(2 downto 0)
  );
  end component wb_rom_ram;

begin

  wb_clk_i <= sysclk;
  wb_rst_i <= sysrst;

  rstgen: zpuino_serialreset
    generic map (
      SYSTEM_CLOCK_MHZ  => 90
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
    clkddr  => clkddr,
    clkout_90  => clk90,
    clkout_270  => clk270,
    clkfb => DRAM_CK_FB,
    rstout  => clkgen_rst
  );

  FPGA_INIT_B<='0';
  SF_CE0<='1';

  VGA_BLUE  <= '0';
  VGA_GREEN <= '0';
  VGA_HSYNC <= '0';
  VGA_RED   <= '0';
  VGA_VSYNC <= '0';

  pin00:  IOPAD port map ( I => gpio_o(0),  O => gpio_i(0),  T => gpio_t(0),  C => sysclk, PAD => J1(0) );
  pin01:  IOPAD port map ( I => gpio_o(1),  O => gpio_i(1),  T => gpio_t(1),  C => sysclk, PAD => J1(1) );
  pin02:  IOPAD port map ( I => gpio_o(2),  O => gpio_i(2),  T => gpio_t(2),  C => sysclk, PAD => J1(2) );
  pin03:  IOPAD port map ( I => gpio_o(3),  O => gpio_i(3),  T => gpio_t(3),  C => sysclk, PAD => J1(3) );

  pin04:  IOPAD port map ( I => gpio_o(4),  O => gpio_i(4),  T => gpio_t(4),  C => sysclk, PAD => J2(0) );
  pin05:  IOPAD port map ( I => gpio_o(5),  O => gpio_i(5),  T => gpio_t(5),  C => sysclk, PAD => J2(1) );
  pin06:  IOPAD port map ( I => gpio_o(6),  O => gpio_i(6),  T => gpio_t(6),  C => sysclk, PAD => J2(2) );
  pin07:  IOPAD port map ( I => gpio_o(7),  O => gpio_i(7),  T => gpio_t(7),  C => sysclk, PAD => J2(3) );

  pin08:  IOPAD port map ( I => gpio_o(8),  O => gpio_i(8),  T => gpio_t(8),  C => sysclk, PAD => J4(0) );
  pin09:  IOPAD port map ( I => gpio_o(9),  O => gpio_i(9),  T => gpio_t(9),  C => sysclk, PAD => J4(1) );
  pin10:  IOPAD port map ( I => gpio_o(10), O => gpio_i(10), T => gpio_t(10), C => sysclk, PAD => J4(2) );
  pin11:  IOPAD port map ( I => gpio_o(11), O => gpio_i(11), T => gpio_t(11), C => sysclk, PAD => J4(3) );

  pin12:  IPAD port map ( O => gpio_i(12),  C => sysclk, PAD => SW(0) );
  pin13:  IPAD port map ( O => gpio_i(13),  C => sysclk, PAD => SW(1) );
  pin14:  IPAD port map ( O => gpio_i(14),  C => sysclk, PAD => SW(2) );
  pin15:  IPAD port map ( O => gpio_i(15),  C => sysclk, PAD => SW(3) );

  pin16:  OPAD port map ( I => gpio_o(16), O => gpio_i(16), PAD => SPI_CS );

  pin17:  IOPAD port map ( I => gpio_o(17), O => gpio_i(17), T => gpio_t(17), C => sysclk, PAD => FX2_IO(21) );
  pin18:  IOPAD port map ( I => gpio_o(18), O => gpio_i(18), T => gpio_t(18), C => sysclk, PAD => FX2_IO(22) );
  pin19:  IOPAD port map ( I => gpio_o(19), O => gpio_i(19), T => gpio_t(19), C => sysclk, PAD => FX2_IO(23) );

  pin20:  IOPAD port map ( I => gpio_o(20), O => gpio_i(20), T => gpio_t(20), C => sysclk, PAD => FX2_IO(24) );
  pin21:  IOPAD port map ( I => gpio_o(21), O => gpio_i(21), T => gpio_t(21), C => sysclk, PAD => FX2_IO(25) );
  pin22:  IOPAD port map ( I => gpio_o(22), O => gpio_i(22), T => gpio_t(22), C => sysclk, PAD => FX2_IO(26) );
  pin23:  IOPAD port map ( I => gpio_o(23), O => gpio_i(23), T => gpio_t(23), C => sysclk, PAD => FX2_IO(27) );
  pin24:  IOPAD port map ( I => gpio_o(24), O => gpio_i(24), T => gpio_t(24), C => sysclk, PAD => FX2_IO(28) );
  pin25:  IOPAD port map ( I => gpio_o(25), O => gpio_i(25), T => gpio_t(25), C => sysclk, PAD => FX2_IO(29) );
  pin26:  IOPAD port map ( I => gpio_o(26), O => gpio_i(26), T => gpio_t(26), C => sysclk, PAD => FX2_IO(30) );
  pin27:  IOPAD port map ( I => gpio_o(27), O => gpio_i(27), T => gpio_t(27), C => sysclk, PAD => FX2_IO(31) );
  pin28:  IOPAD port map ( I => gpio_o(28), O => gpio_i(28), T => gpio_t(28), C => sysclk, PAD => FX2_IO(32) );
  pin29:  IOPAD port map ( I => gpio_o(29), O => gpio_i(29), T => gpio_t(29), C => sysclk, PAD => FX2_IO(33) );
  pin30:  IOPAD port map ( I => gpio_o(30), O => gpio_i(30), T => gpio_t(30), C => sysclk, PAD => FX2_IO(34) );
  pin31:  IOPAD port map ( I => gpio_o(31), O => gpio_i(31), T => gpio_t(31), C => sysclk, PAD => FX2_IO(35) );

  pin32:  OPAD  port map ( I => gpio_o(32), O => gpio_i(32), PAD => LED(0) );
  pin33:  OPAD  port map ( I => gpio_o(33), O => gpio_i(33), PAD => LED(1) );
  pin34:  OPAD  port map ( I => gpio_o(34), O => gpio_i(34), PAD => LED(2) );
  pin35:  OPAD  port map ( I => gpio_o(35), O => gpio_i(35), PAD => LED(3) );
  pin36:  OPAD  port map ( I => gpio_o(36), O => gpio_i(36), PAD => LED(4) );
  pin37:  OPAD  port map ( I => gpio_o(37), O => gpio_i(37), PAD => LED(5) );
  pin38:  OPAD  port map ( I => gpio_o(38), O => gpio_i(38), PAD => LED(6) );
  pin39:  OPAD  port map ( I => gpio_o(39), O => gpio_i(39), PAD => LED(7) );

  pin40:  IOPAD port map ( I => gpio_o(40), O => gpio_i(40), T => gpio_t(40), C => sysclk, PAD => LCD_DB(4) );
  pin41:  IOPAD port map ( I => gpio_o(41), O => gpio_i(41), T => gpio_t(41), C => sysclk, PAD => LCD_DB(5) );
  pin42:  IOPAD port map ( I => gpio_o(42), O => gpio_i(42), T => gpio_t(42), C => sysclk, PAD => LCD_DB(6) );
  pin43:  IOPAD port map ( I => gpio_o(43), O => gpio_i(43), T => gpio_t(43), C => sysclk, PAD => LCD_DB(7) );
  pin44:  OPAD  port map ( I => gpio_o(44), O => gpio_i(44), PAD => LCD_RS );
  pin45:  OPAD  port map ( I => gpio_o(45), O => gpio_i(45), PAD => LCD_RW );
  pin46:  OPAD  port map ( I => gpio_o(46), O => gpio_i(46), PAD => LCD_E );
  pin47:  OPAD  port map ( I => gpio_o(47), O => gpio_i(47), PAD => AMP_SHDN );

  pin48:  IPAD  port map ( O => gpio_i(48),  C => sysclk, PAD => ROT_A );
  pin49:  IPAD  port map ( O => gpio_i(49),  C => sysclk, PAD => ROT_B );
  pin50:  IPAD  port map ( O => gpio_i(50),  C => sysclk, PAD => ROT_CENTER );

  pin51:  OPAD  port map ( I => gpio_o(51), O => gpio_i(51), PAD => AD_CONV );
  pin52:  OPAD  port map ( I => gpio_o(52), O => gpio_i(52), PAD => DAC_CS );
  pin53:  OPAD  port map ( I => gpio_o(53), O => gpio_i(53), PAD => AMP_CS );

  ibufrx: IPAD  port map ( O => rx, C => sysclk, PAD => UART_RX );
  obuftx: OPAD  port map ( I => tx, O=> open, PAD => UART_TX );
  sckpad: OPAD  port map ( I => spi_pf_sck, O => open,  PAD => SPI_SCK );
  mosipad:OPAD  port map ( I => spi_pf_mosi, O => open,  PAD => SPI_MOSI );

  spi_pf_miso <= SPI_MISO;

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
      
      memory_enable => memory_enable,

      ram_wb_ack_i      => np_ram_wb_ack_o,
      ram_wb_stall_i    => '0',--np_ram_wb_stall_o,
      ram_wb_dat_o      => np_ram_wb_dat_i,
      ram_wb_dat_i      => np_ram_wb_dat_o,
      ram_wb_adr_o      => np_ram_wb_adr_i(maxAddrBit downto 0),
      ram_wb_cyc_o      => np_ram_wb_cyc_i,
      ram_wb_stb_o      => np_ram_wb_stb_i,
      ram_wb_we_o       => np_ram_wb_we_i,

      rom_wb_ack_i      => rom_wb_ack_o,
      rom_wb_stall_i      => rom_wb_stall_o,
      rom_wb_dat_i      => rom_wb_dat_o,
      rom_wb_adr_o      => rom_wb_adr_i(maxAddrBit downto 0),
      rom_wb_cyc_o      => rom_wb_cyc_i,
      rom_wb_stb_o      => rom_wb_stb_i,

      jtag_ctrl_chain_in => (others => '0')
    );

  memarb: wbarb2_1
  generic map (
    ADDRESS_HIGH => maxAddrBit,
    ADDRESS_LOW => 2
  )
  port map (
    wb_clk_i      => wb_clk_i,
    wb_rst_i      => wb_rst_i,

    m0_wb_dat_o   => ram_wb_dat_o,
    m0_wb_dat_i   => ram_wb_dat_i,
    m0_wb_adr_i   => ram_wb_adr_i(maxAddrBit downto 2),
    m0_wb_sel_i   => (others => '1'),
    m0_wb_cti_i   => CTI_CYCLE_CLASSIC,
    m0_wb_we_i    => ram_wb_we_i,
    m0_wb_cyc_i   => ram_wb_cyc_i,
    m0_wb_stb_i   => ram_wb_stb_i,
    m0_wb_ack_o   => ram_wb_ack_o,
    m0_wb_stall_o => ram_wb_stall_o,

    m1_wb_dat_o   => sram_rom_wb_dat_o,
    m1_wb_dat_i   => (others => DontCareValue),
    m1_wb_adr_i   => sram_rom_wb_adr_i(maxAddrBit downto 2),
    m1_wb_sel_i   => (others => '1'),
    m1_wb_cti_i   => CTI_CYCLE_CLASSIC,
    m1_wb_we_i    => '0',--rom_wb_we_i,
    m1_wb_cyc_i   => sram_rom_wb_cyc_i,
    m1_wb_stb_i   => sram_rom_wb_stb_i,
    m1_wb_ack_o   => sram_rom_wb_ack_o,
    m1_wb_stall_o => sram_rom_wb_stall_o,

    s0_wb_dat_i   => sram_wb_dat_o,
    s0_wb_dat_o   => sram_wb_dat_i,
    s0_wb_adr_o   => sram_wb_adr_i(maxAddrBit downto 2),
    s0_wb_sel_o   => open,
    s0_wb_cti_o   => open,
    s0_wb_we_o    => sram_wb_we_i,
    s0_wb_cyc_o   => sram_wb_cyc_i,
    s0_wb_stb_o   => sram_wb_stb_i,
    s0_wb_ack_i   => sram_wb_ack_o,
    s0_wb_stall_i => sram_wb_stall_o
  );

  bootmux: wbbootloadermux
  generic map (
    address_high  => maxAddrBit
  )
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,

    sel           => memory_enable,

    -- Master 

    m_wb_dat_o    => rom_wb_dat_o,
    m_wb_dat_i    => (others => DontCareValue),
    m_wb_adr_i    => rom_wb_adr_i(maxAddrBit downto 2),
    m_wb_sel_i    => (others => '1'),
    m_wb_cti_i    => CTI_CYCLE_CLASSIC,
    m_wb_we_i     => '0',
    m_wb_cyc_i    => rom_wb_cyc_i,
    m_wb_stb_i    => rom_wb_stb_i,
    m_wb_ack_o    => rom_wb_ack_o,
    m_wb_stall_o  => rom_wb_stall_o,

    -- Slave 0 signals

    s0_wb_dat_i   => sram_rom_wb_dat_o,
    s0_wb_dat_o   => open,
    s0_wb_adr_o   => sram_rom_wb_adr_i,
    s0_wb_sel_o   => open,
    s0_wb_cti_o   => open,
    s0_wb_we_o    => open,
    s0_wb_cyc_o   => sram_rom_wb_cyc_i,
    s0_wb_stb_o   => sram_rom_wb_stb_i,
    s0_wb_ack_i   => sram_rom_wb_ack_o,
    s0_wb_stall_i => sram_rom_wb_stall_o,

    -- Slave 1 signals

    s1_wb_dat_i   => prom_rom_wb_dat_o,
    s1_wb_dat_o   => open,
    s1_wb_adr_o   => prom_rom_wb_adr_i(11 downto 2),
    s1_wb_sel_o   => open,
    s1_wb_cti_o   => open,
    s1_wb_we_o    => open,
    s1_wb_cyc_o   => prom_rom_wb_cyc_i,
    s1_wb_stb_o   => prom_rom_wb_stb_i,
    s1_wb_ack_i   => prom_rom_wb_ack_o,
    s1_wb_stall_i => prom_rom_wb_stall_o

  );

  npnadapt: wb_master_np_to_slave_p
  generic map (
    ADDRESS_HIGH  => maxAddrBitIncIO,
    ADDRESS_LOW   => 0
  )
  port map (
    wb_clk_i    => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,

    -- Master signals

    m_wb_dat_o  => np_ram_wb_dat_o,
    m_wb_dat_i  => np_ram_wb_dat_i,
    m_wb_adr_i  => np_ram_wb_adr_i,
    m_wb_sel_i  => (others => '1'),
    m_wb_cti_i  => CTI_CYCLE_CLASSIC,
    m_wb_we_i   => np_ram_wb_we_i,
    m_wb_cyc_i  => np_ram_wb_cyc_i,
    m_wb_stb_i  => np_ram_wb_stb_i,
    m_wb_ack_o  => np_ram_wb_ack_o,

    -- Slave signals

    s_wb_dat_i  => ram_wb_dat_o,
    s_wb_dat_o  => ram_wb_dat_i,
    s_wb_adr_o  => ram_wb_adr_i,
    s_wb_sel_o  => open,
    s_wb_cti_o  => open,
    s_wb_we_o   => ram_wb_we_i,
    s_wb_cyc_o  => ram_wb_cyc_i,
    s_wb_stb_o  => ram_wb_stb_i,
    s_wb_ack_i  => ram_wb_ack_o,
    s_wb_stall_i => ram_wb_stall_o
  );


  -- PROM

  prom: wb_bootloader
    port map (
      wb_clk_i    => wb_clk_i,
      wb_rst_i    => wb_rst_i,

      wb_dat_o    => prom_rom_wb_dat_o,
      wb_adr_i    => prom_rom_wb_adr_i(11 downto 2),
      wb_cyc_i    => prom_rom_wb_cyc_i,
      wb_stb_i    => prom_rom_wb_stb_i,
      wb_ack_o    => prom_rom_wb_ack_o,
      wb_stall_o  => prom_rom_wb_stall_o,

      wb2_dat_o    => slot_read(15),
      wb2_adr_i    => slot_address(15)(11 downto 2),
      wb2_cyc_i    => slot_cyc(15),
      wb2_stb_i    => slot_stb(15),
      wb2_ack_o    => slot_ack(15),
      wb2_stall_o  => open
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
    spp_en    => sigmadelta_spp_en,
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

  sram_wb_adr_i(31 downto maxAddrBitIncIO)<=(others => '0');

  ddr: ddr_sdram
  GENERIC map (
    HIGH_BIT => 25,
    MHZ => 90
  )
  PORT map (
    clk         => sysclk,
    clk270      => clk270,
    clk90       => clk90,
    clkddr      => clkddr,
    rst         => sysrst,

    DRAM_ADDR   => DRAM_ADDR,
    DRAM_BA     => DRAM_BA,
    DRAM_CAS_N  => DRAM_CAS_N,
    DRAM_CKE    => DRAM_CKE,
    DRAM_CLK    => DRAM_CLK,
    DRAM_CLK_N  => DRAM_CLK_N,
    DRAM_CS_N   => DRAM_CS_N,
    DRAM_DQ     => DRAM_DQ,
    DRAM_DQM    => DRAM_DQM,
    DRAM_DQS    => DRAM_DQS,
    DRAM_RAS_N  => DRAM_RAS_N,
    DRAM_WE_N   => DRAM_WE_N,

    --wb_clk_i: in std_logic;
	 	--wb_rst_i: in std_logic;

    wb_dat_o    => sram_wb_dat_o,
    wb_dat_i    => sram_wb_dat_i,
    wb_adr_i    => sram_wb_adr_i,
    wb_we_i     => sram_wb_we_i,
    wb_cyc_i    => sram_wb_cyc_i,
    wb_stb_i    => sram_wb_stb_i,
    wb_ack_o    => sram_wb_ack_o,
    wb_stall_o  => sram_wb_stall_o
   );

  process(gpio_spp_read, 
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

    spi2_miso <= gpio_spp_read(0);              -- PPS0 : USPI MISO

  end process;

end behave;
