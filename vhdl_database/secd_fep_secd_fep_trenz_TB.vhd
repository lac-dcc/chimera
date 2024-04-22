-------------------------------------------------------------------------------
--
-- Title       : Test Bench for secd_fep_trenz
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : H:\fpga\secd\fep\secd_fep_trenz_TB.vhd
-- Generated   : 05.07.2006, 19:23
-- From        : h:\fpga\secd\fep\fep_toplevel.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for secd_fep_trenz_tb
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity secd_fep_trenz_tb is
end secd_fep_trenz_tb;

architecture TB_ARCHITECTURE of secd_fep_trenz_tb is
  -- Component declaration of the tested unit
  component secd_fep_trenz
    port(
      utmi_clkout : in std_logic;
      utmi_databus16_8 : out std_logic;
      reset_sw : in std_logic;
      ps2_clk1 : inout std_logic;
      ps2_data1 : inout std_logic;
      fpga_rxd : in std_logic;
      fpga_txd : out std_logic;
      fpga_cts : in std_logic;
      fpga_rts : out std_logic;
      vsync_b : out std_logic;
      hsync_b : out std_logic;
      fpga_b : out std_logic_vector(2 downto 0);
      fpga_g : out std_logic_vector(2 downto 0);
      fpga_r : out std_logic_vector(2 downto 0);
      mm_led : out std_logic;
      led : out std_logic_vector(3 downto 0);
      joy_down : in std_logic;
      joy_fire : in std_logic;
      joy_left : in std_logic;
      joy_right : in std_logic;
      joy_up : in std_logic;
      lcd_e : out std_logic;
      lcd_rw : out std_logic;
      lcd_rs : out std_logic;
      lcd_d : out std_logic_vector(3 downto 0);
      aud_out : out std_logic_vector(4 downto 1);
      ram_a : out std_logic_vector(20 downto 0);
      ram_io : inout std_logic_vector(15 downto 0);
      ram_bhen : out std_logic;
      ram_blen : out std_logic;
      ram_cen : out std_logic;
      ram_oen : out std_logic;
      ram_wen : out std_logic;
      cf_reset : out std_logic;
      cf_irq : in std_logic;
      cf_iord : out std_logic;
      cf_iowr : out std_logic;
      cf_wait : in std_logic;
      cf_dasp : in std_logic;
      cf_pdiag : in std_logic;
      cf_cd1 : in std_logic;
      cf_cd2 : in std_logic;
      iois16 : in std_logic;
      cf_oe : out std_logic;
      cf_pwr_en : out std_logic;
      cf_cs0 : out std_logic;
      cf_cs1 : out std_logic;
      cf_we : out std_logic;
      cf_rew : out std_logic );
  end component;

  -- Stimulus signals - signals mapped to the input and inout ports of tested entity
  signal utmi_clkout : std_logic;
  signal reset_sw : std_logic;
  signal fpga_rxd : std_logic;
  signal fpga_cts : std_logic;
  signal joy_down : std_logic;
  signal joy_fire : std_logic;
  signal joy_left : std_logic;
  signal joy_right : std_logic;
  signal joy_up : std_logic;
  signal cf_irq : std_logic;
  signal cf_wait : std_logic;
  signal cf_dasp : std_logic;
  signal cf_pdiag : std_logic;
  signal cf_cd1 : std_logic;
  signal cf_cd2 : std_logic;
  signal iois16 : std_logic;
  signal ps2_clk1 : std_logic;
  signal ps2_data1 : std_logic;
  signal ram_io : std_logic_vector(15 downto 0);
  -- Observed signals - signals mapped to the output ports of tested entity
  signal utmi_databus16_8 : std_logic;
  signal fpga_txd : std_logic;
  signal fpga_rts : std_logic;
  signal vsync_b : std_logic;
  signal hsync_b : std_logic;
  signal fpga_b : std_logic_vector(2 downto 0);
  signal fpga_g : std_logic_vector(2 downto 0);
  signal fpga_r : std_logic_vector(2 downto 0);
  signal mm_led : std_logic;
  signal led : std_logic_vector(3 downto 0);
  signal lcd_e : std_logic;
  signal lcd_rw : std_logic;
  signal lcd_rs : std_logic;
  signal lcd_d : std_logic_vector(3 downto 0);
  signal aud_out : std_logic_vector(4 downto 1);
  signal ram_a : std_logic_vector(20 downto 0);
  signal ram_bhen : std_logic;
  signal ram_blen : std_logic;
  signal ram_cen : std_logic;
  signal ram_oen : std_logic;
  signal ram_wen : std_logic;
  signal cf_reset : std_logic;
  signal cf_iord : std_logic;
  signal cf_iowr : std_logic;
  signal cf_oe : std_logic;
  signal cf_pwr_en : std_logic;
  signal cf_cs0 : std_logic;
  signal cf_cs1 : std_logic;
  signal cf_we : std_logic;
  signal cf_rew : std_logic;

  -- Add your code here ...

begin

  ram : entity idt71V416 port map (
    a0 => ram_a(0),
    a1 => ram_a(1),
    a2 => ram_a(2),
    a3 => ram_a(3),
    a4 => ram_a(4),
    a5 => ram_a(5),
    a6 => ram_a(6),
    a7 => ram_a(7),
    a8 => ram_a(8),
    a9 => ram_a(9),
    a10 => ram_a(10),
    a11 => ram_a(11),
    a12 => ram_a(12),
    a13 => ram_a(13),
    a14 => ram_a(14),
    a15 => ram_a(15),
    a16 => ram_a(16),
    a17 => ram_a(17),
    d0 => ram_io(0),
    d1 => ram_io(1),
    d2 => ram_io(2),
    d3 => ram_io(3),
    d4 => ram_io(4),
    d5 => ram_io(5),
    d6 => ram_io(6),
    d7 => ram_io(7),
    d8 => ram_io(8),
    d9 => ram_io(9),
    d10 => ram_io(10),
    d11 => ram_io(11),
    d12 => ram_io(12),
    d13 => ram_io(13),
    d14 => ram_io(14),
    d15 => ram_io(15),
    bheneg => ram_bhen,
    bleneg => ram_blen,
    oeneg => ram_oen,
    weneg => ram_wen,
    ceneg => ram_cen);

  -- Unit Under Test port map
  UUT : secd_fep_trenz
    port map (
      utmi_clkout => utmi_clkout,
      utmi_databus16_8 => utmi_databus16_8,
      reset_sw => reset_sw,
      ps2_clk1 => ps2_clk1,
      ps2_data1 => ps2_data1,
      fpga_rxd => fpga_rxd,
      fpga_txd => fpga_txd,
      fpga_cts => fpga_cts,
      fpga_rts => fpga_rts,
      vsync_b => vsync_b,
      hsync_b => hsync_b,
      fpga_b => fpga_b,
      fpga_g => fpga_g,
      fpga_r => fpga_r,
      mm_led => mm_led,
      led => led,
      joy_down => joy_down,
      joy_fire => joy_fire,
      joy_left => joy_left,
      joy_right => joy_right,
      joy_up => joy_up,
      lcd_e => lcd_e,
      lcd_rw => lcd_rw,
      lcd_rs => lcd_rs,
      lcd_d => lcd_d,
      aud_out => aud_out,
      ram_a => ram_a,
      ram_io => ram_io,
      ram_bhen => ram_bhen,
      ram_blen => ram_blen,
      ram_cen => ram_cen,
      ram_oen => ram_oen,
      ram_wen => ram_wen,
      cf_reset => cf_reset,
      cf_irq => cf_irq,
      cf_iord => cf_iord,
      cf_iowr => cf_iowr,
      cf_wait => cf_wait,
      cf_dasp => cf_dasp,
      cf_pdiag => cf_pdiag,
      cf_cd1 => cf_cd1,
      cf_cd2 => cf_cd2,
      iois16 => iois16,
      cf_oe => cf_oe,
      cf_pwr_en => cf_pwr_en,
      cf_cs0 => cf_cs0,
      cf_cs1 => cf_cs1,
      cf_we => cf_we,
      cf_rew => cf_rew
      );

  -- Add your stimulus here ...

  stimulus : process
  begin
    reset_sw <= '0';
    wait for 300 ns;
    reset_sw <= '1';
    wait;
  end process;

  clock_stimulus : process
  begin
    utmi_clkout <= '1';
    wait for 16.5 ns;
    utmi_clkout <= '0';
    wait for 16.5 ns;
  end process;

  fpga_cts <= '0';
  fpga_rxd <= '0';

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_secd_fep_trenz of secd_fep_trenz_tb is
  for TB_ARCHITECTURE
    for UUT : secd_fep_trenz
      use entity work.secd_fep_trenz(rtl);
    end for;
  end for;
end TESTBENCH_FOR_secd_fep_trenz;

