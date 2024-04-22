----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- This is the top level entity for DE10-Lite.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mmio_types.all;
use work.vid_types.all;

entity toplevel is
  port(
    -- Clocks "3.3-V LVTTL"
    MAX10_CLK1_50 : in std_logic;
    MAX10_CLK2_50 : in std_logic;

    -- DRAM  "3.3-V LVTTL"
    DRAM_ADDR : out std_logic_vector(12 downto 0);
    DRAM_BA : out std_logic_vector(1 downto 0);
    DRAM_CAS_N : out std_logic;
    DRAM_CKE : out std_logic;
    DRAM_CLK : out std_logic;
    DRAM_CS_N : out std_logic;
    DRAM_DQ : inout std_logic_vector(15 downto 0);
    DRAM_LDQM : out std_logic;
    DRAM_RAS_N : out std_logic;
    DRAM_UDQM : out std_logic;
    DRAM_WE_N : out std_logic;

    -- GPIO "3.3-V LVTTL"
    GPIO : inout std_logic_vector(35 downto 0);

    -- HEX0-5  "3.3-V LVTTL"
    HEX0 : out std_logic_vector(6 downto 0);
    HEX1 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX3 : out std_logic_vector(6 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX5 : out std_logic_vector(6 downto 0);
    KEY : in std_logic_vector(1 downto 0);
    LEDR : out std_logic_vector(9 downto 0);

    -- SW "3.3-V LVTTL"
    SW : in std_logic_vector(9 downto 0);

    -- VGA  "3.3-V LVTTL"
    VGA_R : out std_logic_vector(3 downto 0);
    VGA_G : out std_logic_vector(3 downto 0);
    VGA_B : out std_logic_vector(3 downto 0);
    VGA_HS : out std_logic;
    VGA_VS : out std_logic
  );
end toplevel;

architecture rtl of toplevel is
  -- 70 MHz seems to be a good safe bet, but going higher is certainly possible.
  constant C_CPU_CLK_HZ : integer := 70_000_000;

  signal s_reset_n : std_logic;
  signal s_system_rst : std_logic;

  signal s_cpu_pll_locked : std_logic;
  signal s_vga_pll_locked : std_logic;
  signal s_global_async_rst : std_logic;

  signal s_cpu_rst : std_logic;
  signal s_cpu_clk : std_logic;

  signal s_vga_rst : std_logic;
  signal s_vga_clk : std_logic;

  signal s_xram_cyc : std_logic;
  signal s_xram_stb : std_logic;
  signal s_xram_adr : std_logic_vector(29 downto 0);
  signal s_xram_dat_w : std_logic_vector(31 downto 0);
  signal s_xram_we : std_logic;
  signal s_xram_sel : std_logic_vector(3 downto 0);
  signal s_xram_dat : std_logic_vector(31 downto 0);
  signal s_xram_ack : std_logic;
  signal s_xram_stall : std_logic;
  signal s_xram_err : std_logic;

  signal s_io_switches : std_logic_vector(31 downto 0);
  signal s_io_buttons : std_logic_vector(31 downto 0);
  signal s_io_kb_scancode : std_logic_vector(8 downto 0);
  signal s_io_kb_press : std_logic;
  signal s_io_kb_stb : std_logic;
  signal s_io_mousepos : std_logic_vector(31 downto 0);
  signal s_io_mousebtns : std_logic_vector(31 downto 0);
  signal s_io_sdin : std_logic_vector(31 downto 0);
  signal s_io_regs_w : T_MMIO_REGS_WO;
begin
  -- We use SW(9) as reset.
  s_reset_n <= not SW(9);

  -- System reset signal: This is the reset signal from the board. The stabilizer guarantees that
  -- the reset signal will be held high for a certain period.
  reset_stabilizer_1: entity work.reset_stabilizer
    generic map (
      STABLE_COUNT_BITS => 23  -- Hold reset high for 2^23 50 MHz cycles (168 ms).
    )
    port map (
      i_rst_n => s_reset_n,
      i_clk => MAX10_CLK1_50,
      o_rst => s_system_rst
    );

  -- Show the state of s_system_rst on LEDR(9).
  LEDR(9) <= s_system_rst;

  -- Generate the CPU clock signal.
  pll_cpu: entity work.pll
    generic map
    (
      -- CPU clock: 50 MHz * (N / 5) - E.g. for 70 MHz, N = 7.
      CLK_MUL => (C_CPU_CLK_HZ / 10_000_000),
      CLK_DIV => 5
    )
    port map
    (
      i_rst => s_system_rst,
      i_refclk => MAX10_CLK1_50,
      o_clk => s_cpu_clk,
      o_locked => s_cpu_pll_locked
    );

  -- Generate the VGA clock signal.
  -- Pixel frequencies for supported video modes:
  --  1920x1080 @ 60 Hz: 148.500 MHz
  --   1280x720 @ 60 Hz:  74.250 MHz
  --    800x600 @ 60 Hz:  40.000 MHz
  --    640x480 @ 60 Hz:  25.175 MHz
  pll_vga: entity work.pll
    generic map
    (
      -- VGA clock: 50 * (297/100) = 148.5 MHz
      CLK_MUL => 297,
      CLK_DIV => 100
    )
    port map
    (
      i_rst => s_system_rst,
      i_refclk => MAX10_CLK1_50,
      o_clk => s_vga_clk,
      o_locked => s_vga_pll_locked
    );


  -- Reset logic - synchronize the reset signal to the different clock domains.
  s_global_async_rst <= s_system_rst or (not (s_cpu_pll_locked and s_vga_pll_locked));

  reset_conditioner_cpu: entity work.reset_conditioner
    port map (
      i_clk => s_cpu_clk,
      i_async_rst => s_global_async_rst,
      o_rst => s_cpu_rst
    );

  reset_conditioner_vga: entity work.reset_conditioner
    port map (
      i_clk => s_vga_clk,
      i_async_rst => s_global_async_rst,
      o_rst => s_vga_rst
    );

  -- Instantiate the MC1 machine.
  mc1_1: entity work.mc1
    generic map (
      CPU_CLK_HZ => C_CPU_CLK_HZ,
      COLOR_BITS_R => VGA_R'length,
      COLOR_BITS_G => VGA_G'length,
      COLOR_BITS_B => VGA_B'length,
      LOG2_VRAM_SIZE => 17,         -- 2^17 = 128 KiB
      NUM_VIDEO_LAYERS => 2,
      VIDEO_CONFIG => C_1920_1080
    )
    port map (
      -- Control signals.
      i_cpu_rst => s_cpu_rst,
      i_cpu_clk => s_cpu_clk,

      -- VGA interface.
      i_vga_rst => s_vga_rst,
      i_vga_clk => s_vga_clk,
      o_vga_r => VGA_R,
      o_vga_g => VGA_G,
      o_vga_b => VGA_B,
      o_vga_hs => VGA_HS,
      o_vga_vs => VGA_VS,

      -- XRAM interface.
      o_xram_cyc => s_xram_cyc,
      o_xram_stb => s_xram_stb,
      o_xram_adr => s_xram_adr,
      o_xram_dat => s_xram_dat_w,
      o_xram_we => s_xram_we,
      o_xram_sel => s_xram_sel,
      i_xram_dat => s_xram_dat,
      i_xram_ack => s_xram_ack,
      i_xram_stall => s_xram_stall,
      i_xram_err => s_xram_err,

      -- I/O registers.
      i_io_switches => s_io_switches,
      i_io_buttons => s_io_buttons,
      i_io_kb_scancode => s_io_kb_scancode,
      i_io_kb_press => s_io_kb_press,
      i_io_kb_stb => s_io_kb_stb,
      i_io_mousepos => s_io_mousepos,
      i_io_mousebtns => s_io_mousebtns,
      i_io_sdin => s_io_sdin,
      o_io_regs_w => s_io_regs_w
    );

  -- XRAM.
  -- TODO(m): Implement me!
  s_xram_dat <= (others => '0');
  s_xram_ack <= '0';
  s_xram_stall <= '0';
  s_xram_err <= '0';

  -- I/O: Keyboard and mouse input.
  -- TODO(m): Should we support keyboard (PS/2 or USB) via GPIO, for instance?
  s_io_kb_scancode <= (others => '0');
  s_io_kb_press <= '0';
  s_io_kb_stb <= '0';
  s_io_mousepos <= (others => '0');
  s_io_mousebtns <= (others => '0');

  -- I/O: SD card interface.
  -- We map some GPIO pins to SD card I/O.
  s_io_sdin(0) <= GPIO(17);  -- DAT0 / MISO
  s_io_sdin(1) <= '0';       -- DAT1
  s_io_sdin(2) <= '0';       -- DAT2
  s_io_sdin(3) <= GPIO(11);  -- DAT3 / CS
  s_io_sdin(4) <= GPIO(13);  -- CMD  / MOSI
  s_io_sdin(31 downto 5) <= (others => '0');
  GPIO(17) <= s_io_regs_w.SDOUT(0) when s_io_regs_w.SDWE(0) = '1' else 'Z';
  GPIO(11) <= s_io_regs_w.SDOUT(3) when s_io_regs_w.SDWE(3) = '1' else 'Z';
  GPIO(13) <= s_io_regs_w.SDOUT(4) when s_io_regs_w.SDWE(4) = '1' else 'Z';
  GPIO(15) <= s_io_regs_w.SDOUT(5);  -- CLK / SCK

  -- I/O: Input.
  s_io_switches(31 downto 9) <= (others => '0');
  s_io_switches(8 downto 0) <= SW(8 downto 0);
  s_io_buttons(31 downto 2) <= (others => '0');
  s_io_buttons(1 downto 0) <= not KEY;

  -- I/O: Output.
  HEX0 <= not s_io_regs_w.SEGDISP0(6 downto 0);
  HEX1 <= not s_io_regs_w.SEGDISP1(6 downto 0);
  HEX2 <= not s_io_regs_w.SEGDISP2(6 downto 0);
  HEX3 <= not s_io_regs_w.SEGDISP3(6 downto 0);
  HEX4 <= not s_io_regs_w.SEGDISP4(6 downto 0);
  HEX5 <= not s_io_regs_w.SEGDISP5(6 downto 0);
  LEDR(8 downto 0) <= s_io_regs_w.LEDS(8 downto 0);
end rtl;
