----------------------------------------------------------------------------------------------------
-- Copyright (c) 2019 Marcus Geelnard
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
-- This is the top level entity for DE0-CV.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mmio_types.all;
use work.vid_types.all;

entity toplevel is
  port(
    -- RESET_N "3.3-V LVTTL"
    RESET_N : in std_logic;

    -- Clocks "3.3-V LVTTL"
    CLOCK_50 : in std_logic;
    CLOCK2_50 : in std_logic;
    CLOCK3_50 : in std_logic;
    CLOCK4_50 : in std_logic;

    -- DRAM  "3.3-V LVTTL"
    DRAM_CLK : out std_logic;
    DRAM_CKE : out std_logic;
    DRAM_ADDR : out std_logic_vector(12 downto 0);
    DRAM_BA : out std_logic_vector(1 downto 0);
    DRAM_DQ : inout std_logic_vector(15 downto 0);
    DRAM_CS_N : out std_logic;
    DRAM_RAS_N : out std_logic;
    DRAM_CAS_N : out std_logic;
    DRAM_WE_N : out std_logic;
    DRAM_LDQM : out std_logic;
    DRAM_UDQM : out std_logic;

    -- GPIO "3.3-V LVTTL"
    GPIO_0 : inout std_logic_vector(35 downto 0);
    GPIO_1 : inout std_logic_vector(35 downto 0);

    -- HEX0-5  "3.3-V LVTTL"
    HEX0 : out std_logic_vector(6 downto 0);
    HEX1 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX3 : out std_logic_vector(6 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX5 : out std_logic_vector(6 downto 0);
    KEY : in std_logic_vector(3 downto 0);
    LEDR : out std_logic_vector(9 downto 0);

    -- PS2 "3.3-V LVTTL"
    PS2_CLK : inout std_logic;
    PS2_CLK2 : inout std_logic;
    PS2_DAT : inout std_logic;
    PS2_DAT2 : inout std_logic;

    -- SD "3.3-V LVTTL"
    SD_CLK : out std_logic;
    SD_CMD : inout std_logic;
    SD_DATA : inout std_logic_vector(3 downto 0);

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
  -- Clock configuration.
  constant C_USE_GPIO_CLK : boolean := true;
  constant C_SYSTEM_CLK_HZ : integer := 50_000_000;

  -- 70 MHz seems to be a good safe bet, but going higher is certainly possible.
  constant C_CPU_CLK_HZ : integer := 100_000_000;

  -- SDRAM read sample clock is phase-shifted to compensate for signal progpagation delay.
  -- Note: This value has to be chosen carefully (not every value is valid).
  constant C_SDRAM_CLK_PHASE : time := (270.0/360.0) * (1_000 ms / real(C_CPU_CLK_HZ));

  -- Pixel frequencies for supported video modes:
  --  1920x1080 @ 60 Hz: 148.500 MHz
  --   1280x720 @ 60 Hz:  74.250 MHz
  --    800x600 @ 60 Hz:  40.000 MHz
  --    640x480 @ 60 Hz:  25.175 MHz
  constant C_VGA_REF_CLK_HZ : integer := 24_000_000;  -- Good reference freq. for video clocks
  constant C_VGA_CLK_HZ : integer := 148_500_000;

  signal s_system_clk : std_logic;
  signal s_system_rst : std_logic;

  signal s_vga_ref_clk : std_logic;
  signal s_pll_cpu_locked : std_logic;
  signal s_pll_vga_locked : std_logic;
  signal s_global_async_rst : std_logic;

  signal s_cpu_rst : std_logic;
  signal s_cpu_clk : std_logic;

  signal s_vga_rst : std_logic;
  signal s_vga_clk : std_logic;

  signal s_sdram_clk : std_logic;
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
  -- Select the system clock.
  CLOCK_GEN: if C_USE_GPIO_CLK generate
    -- Use GPIO_0(0) as a clock input.
    s_system_clk <= GPIO_0(0);
    GPIO_0(0) <= 'Z';  -- Tri-state the output to use the pin as an input.
  else generate
    -- Use the on-board 50 MHz oscillator.
    s_system_clk <= CLOCK_50;
  end generate;

  -- System reset signal: This is the reset signal from the board. The stabilizer guarantees that
  -- the reset signal will be held high for a certain period.
  reset_stabilizer_1: entity work.reset_stabilizer
    generic map (
      STABLE_COUNT_BITS => 21  -- Hold reset high for 2^21 50 MHz cycles (42 ms).
    )
    port map (
      i_rst_n => RESET_N,
      i_clk => s_system_clk,
      o_rst => s_system_rst
    );

  -- Generate the CPU clock signal and a reference clock to be used by the VGA PLL.
  pll_cpu: entity work.pll
    generic map (
      REFERENCE_CLOCK_FREQUENCY => C_SYSTEM_CLK_HZ,
      NUMBER_OF_CLOCKS => 3,
      OUTPUT_CLOCK_FREQUENCY0 => C_CPU_CLK_HZ,
      OUTPUT_CLOCK_FREQUENCY1 => C_CPU_CLK_HZ,
      PHASE_SHIFT1 => C_SDRAM_CLK_PHASE,
      OUTPUT_CLOCK_FREQUENCY2 => C_VGA_REF_CLK_HZ
    )
    port map
    (
      i_rst => s_system_rst,
      i_refclk => s_system_clk,
      o_clk0 => s_cpu_clk,
      o_clk1 => s_sdram_clk,
      o_clk2 => s_vga_ref_clk,
      o_locked => s_pll_cpu_locked
    );

  -- Generate the VGA clock signal.
  pll_vga: entity work.pll
    generic map (
      REFERENCE_CLOCK_FREQUENCY => C_VGA_REF_CLK_HZ,
      NUMBER_OF_CLOCKS => 1,
      OUTPUT_CLOCK_FREQUENCY0 => C_VGA_CLK_HZ
    )
    port map
    (
      i_rst => s_system_rst,
      i_refclk => s_vga_ref_clk,
      o_clk0 => s_vga_clk,
      o_locked => s_pll_vga_locked
    );

  -- Reset logic - synchronize the reset signal to the different clock domains.
  s_global_async_rst <= s_system_rst or (not (s_pll_cpu_locked and s_pll_vga_locked));

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
      LOG2_VRAM_SIZE => 18,          -- 2^18 = 256 KiB
      XRAM_SIZE => 2**26,            -- 2^26 = 64 MiB
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

  -- XRAM - We use the on-board 32Mx16 SDRAM as XRAM.
  -- Configuration according to ISSI IS42S163220F-7TL specs.
  DRAM_CLK <= s_sdram_clk;
  xram_1: entity work.xram_sdram
    generic map (
      CPU_CLK_HZ => C_CPU_CLK_HZ,
      SDRAM_ADDR_WIDTH => DRAM_ADDR'length,
      SDRAM_DATA_WIDTH => DRAM_DQ'length,
      SDRAM_COL_WIDTH => 10,                -- 1k cols
      SDRAM_ROW_WIDTH => 13,                -- 8k rows
      SDRAM_BANK_WIDTH => 2,                -- 4 banks
      CAS_LATENCY => 2,                     -- 2 below 133 MHz, 3 over 133 MHz
      T_DESL => 200_000.0,                  -- Can be lowered to 100 us?
      T_MRD => 14.0,
      T_RC => 60.0,
      T_RCD => 15.0,
      T_RP => 15.0,
      T_DPL => 14.0,
      T_REF => 64_000_000.0                 -- 8192 refreshes / 64 ms
    )
    port map (
      i_rst  => s_cpu_rst,

      i_wb_clk => s_cpu_clk,
      i_wb_cyc => s_xram_cyc,
      i_wb_stb => s_xram_stb,
      i_wb_adr => s_xram_adr,
      i_wb_dat => s_xram_dat_w,
      i_wb_we => s_xram_we,
      i_wb_sel => s_xram_sel,
      o_wb_dat => s_xram_dat,
      o_wb_ack => s_xram_ack,
      o_wb_stall => s_xram_stall,
      o_wb_err => s_xram_err,

      o_sdram_a => DRAM_ADDR,
      o_sdram_ba => DRAM_BA,
      io_sdram_dq => DRAM_DQ,
      o_sdram_cke => DRAM_CKE,
      o_sdram_cs_n => DRAM_CS_N,
      o_sdram_ras_n => DRAM_RAS_N,
      o_sdram_cas_n => DRAM_CAS_N,
      o_sdram_we_n => DRAM_WE_N,
      o_sdram_dqm(0) => DRAM_LDQM,
      o_sdram_dqm(1) => DRAM_UDQM
    );

  -- I/O: PS/2 keyboard input.
  ps2_keyboard_1: entity work.ps2_keyboard
    generic map (
      clk_freq => C_CPU_CLK_HZ
    )
    port map (
      i_rst => s_cpu_rst,
      i_clk => s_cpu_clk,
      i_ps2_clk => PS2_CLK,
      i_ps2_data => PS2_DAT,
      o_scancode  => s_io_kb_scancode,
      o_press => s_io_kb_press,
      o_stb => s_io_kb_stb
    );

  -- I/O: Mouse input.
  -- TODO(m): Implement me!
  s_io_mousepos <= (others => '0');
  s_io_mousebtns <= (others => '0');

  -- I/O: SD card interface.
  s_io_sdin(0) <= SD_DATA(0);
  s_io_sdin(1) <= SD_DATA(1);
  s_io_sdin(2) <= SD_DATA(2);
  s_io_sdin(3) <= SD_DATA(3);
  s_io_sdin(4) <= SD_CMD;
  s_io_sdin(31 downto 5) <= (others => '0');
  SD_DATA(0) <= s_io_regs_w.SDOUT(0) when s_io_regs_w.SDWE(0) = '1' else 'Z';
  SD_DATA(1) <= s_io_regs_w.SDOUT(1) when s_io_regs_w.SDWE(1) = '1' else 'Z';
  SD_DATA(2) <= s_io_regs_w.SDOUT(2) when s_io_regs_w.SDWE(2) = '1' else 'Z';
  SD_DATA(3) <= s_io_regs_w.SDOUT(3) when s_io_regs_w.SDWE(3) = '1' else 'Z';
  SD_CMD <= s_io_regs_w.SDOUT(4) when s_io_regs_w.SDWE(4) = '1' else 'Z';
  SD_CLK <= s_io_regs_w.SDOUT(5);

  -- I/O: Input.
  s_io_switches(31 downto 10) <= (others => '0');
  s_io_switches(9 downto 0) <= SW;
  s_io_buttons(31 downto 4) <= (others => '0');
  s_io_buttons(3 downto 0) <= not KEY;

  -- I/O: Output.
  HEX0 <= not s_io_regs_w.SEGDISP0(6 downto 0);
  HEX1 <= not s_io_regs_w.SEGDISP1(6 downto 0);
  HEX2 <= not s_io_regs_w.SEGDISP2(6 downto 0);
  HEX3 <= not s_io_regs_w.SEGDISP3(6 downto 0);
  HEX4 <= not s_io_regs_w.SEGDISP4(6 downto 0);
  HEX5 <= not s_io_regs_w.SEGDISP5(6 downto 0);
  LEDR <= s_io_regs_w.LEDS(9 downto 0);
end rtl;
