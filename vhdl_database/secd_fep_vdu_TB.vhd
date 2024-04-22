-------------------------------------------------------------------------------
--
-- Title       : Test Bench for vdu
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : H:\fpga\secd\fep\vdu_TB.vhd
-- Generated   : 02.07.2006, 08:32
-- From        : h:\fpga\secd\fep\vdu8.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for vdu_tb
--
-------------------------------------------------------------------------------

library ieee,unisim;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity vdu_tb is
end vdu_tb;

architecture TB_ARCHITECTURE of vdu_tb is
	-- Component declaration of the tested unit
	component vdu
	port(
		vdu_clk_in : in std_logic;
		cpu_clk_out : out std_logic;
		ram_clk_out : out std_logic;
		vdu_rst : in std_logic;
		vdu_cs : in std_logic;
		vdu_rw : in std_logic;
		vdu_addr : in std_logic_vector(2 downto 0);
		vdu_data_in : in std_logic_vector(7 downto 0);
		vdu_data_out : out std_logic_vector(7 downto 0);
		vga_red_o : out std_logic;
		vga_green_o : out std_logic;
		vga_blue_o : out std_logic;
		vga_hsync_o : out std_logic;
		vga_vsync_o : out std_logic );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal vdu_clk_in : std_logic;
	signal vdu_rst : std_logic;
	signal vdu_cs : std_logic;
	signal vdu_rw : std_logic;
	signal vdu_addr : std_logic_vector(2 downto 0);
	signal vdu_data_in : std_logic_vector(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal cpu_clk_out : std_logic;
        signal ram_clk_out : std_logic;
	signal vdu_data_out : std_logic_vector(7 downto 0);
	signal vga_red_o : std_logic;
	signal vga_green_o : std_logic;
	signal vga_blue_o : std_logic;
	signal vga_hsync_o : std_logic;
	signal vga_vsync_o : std_logic;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : vdu
		port map (
			vdu_clk_in => vdu_clk_in,
			cpu_clk_out => cpu_clk_out,
                        ram_clk_out => ram_clk_out,
			vdu_rst => vdu_rst,
			vdu_cs => vdu_cs,
			vdu_rw => vdu_rw,
			vdu_addr => vdu_addr,
			vdu_data_in => vdu_data_in,
			vdu_data_out => vdu_data_out,
			vga_red_o => vga_red_o,
			vga_green_o => vga_green_o,
			vga_blue_o => vga_blue_o,
			vga_hsync_o => vga_hsync_o,
			vga_vsync_o => vga_vsync_o
		);

	-- Add your stimulus here ...

  clock_stimulus : process
  begin
    vdu_clk_in <= '1';
    wait for 10 ns;
    vdu_clk_in <= '0';
    wait for 10 ns;
  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_vdu of vdu_tb is
	for TB_ARCHITECTURE
		for UUT : vdu
			use entity work.vdu(arch);
		end for;
	end for;
end TESTBENCH_FOR_vdu;

