library std;
use std.env.stop;

library ieee;
context ieee.ieee_std_context;

use work.VGA_config.all;

entity tb_vga is
  generic (
    SCREEN : natural := 22
  );
end entity;

architecture arch of tb_vga is

  constant clk_period : time := (1.0/real(VGA_configs(SCREEN).clk)) * 1 ms;
  signal clk, rst, save_video: std_logic := '0';

  type vga_t is record
    hsync: std_logic;
    vsync: std_logic;
    rgb:   std_logic_vector(2 downto 0);
  end record;

  signal vga: vga_t;

begin

  clk <= not clk after clk_period/2;

  proc_main: process
  begin
    report "start simulation" severity note;
    rst <= '1';
    wait for 10*clk_period;
    rst <= '0';
    wait for 100 ms;
    report "end simulation" severity note;
    save_video <= '1';
    wait for 200 ns;
    stop(0);
    wait;
  end process;

  VIRT_VGA: entity work.VGA_screen
    generic map (
      G_SCREEN => SCREEN
    )
    port map (
      RST   => rst,
      HSYNC => vga.hsync,
      VSYNC => vga.vsync,
      RGB   => vga.rgb,
      VID   => save_video
    );

  UUT: entity work.Design_Top(demo)
    generic map (
      G_SCREEN => SCREEN
    )
    port map (
      CLK   => clk,
      EN    => '1',
      RST   => rst,
      HSYNC => vga.hsync,
      VSYNC => vga.vsync,
      RGB   => vga.rgb
    );

end architecture;
