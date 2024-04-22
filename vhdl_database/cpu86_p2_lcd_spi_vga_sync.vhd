--
-- Copyright 2011, Kevin Lindsey
-- See LICENSE file for licensing information
--
-- Based on code from P. P. Chu, "FPGA Prototyping by VHDL Examples: Xilinx Spartan-3 Version", 2008
-- Chapters 12-13
--
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity vga_sync is
	port(
		clock: in std_logic;
		reset: in std_logic;
		hsync, vsync: out std_logic;
		video_on: out std_logic;
		pixel_tick: out std_logic;
		pixel_x, pixel_y: out std_logic_vector(9 downto 0)
	);
end vga_sync;

architecture arch of vga_sync is
signal h_sync_reg, v_sync_reg, video_on_reg: std_logic := '0';
signal v_count_reg: std_logic_vector(9 downto 0);
signal h_count_reg: std_logic_vector(9 downto 0);
	-- VGA 640x480
constant thp : integer := 6; -- hsync 156
constant htotal : integer := 850; -- screen size, with back porch 900
constant tvp : integer := 34; -- vsync 1
constant vtotal : integer := 560; -- screen size, with back porch 560

begin
	-- registers
	process(clock)
	begin
        if rising_edge(clock) then
				video_on_reg <= '1';
            if h_count_reg < (thp) then
                h_sync_reg <= '0';
					video_on_reg <= '0';
            else
                h_sync_reg <= '1';
            end if;
            if v_count_reg < tvp then
                v_sync_reg <= '0';
					video_on_reg <= '0';
            else
                v_sync_reg <= '1';
            end if;
            if h_count_reg = htotal then
                h_count_reg <= (others => '0');
                if v_count_reg = vtotal then
                    v_count_reg <= (others => '0');
                else
                    v_count_reg <= v_count_reg + 1;
                end if;
            else
                h_count_reg <= h_count_reg + 1;
            end if;
			end if;
	end process;
	
	
	-- video on/off
--	video_on <= h_sync_reg and v_sync_reg;
	video_on <= video_on_reg;
		
	-- output signals
	hsync <= h_sync_reg;
	vsync <= v_sync_reg;
	pixel_x <= std_logic_vector(h_count_reg)-thp-104;
	pixel_y <= std_logic_vector(v_count_reg)-tvp;
--	pixel_tick <= p_tick;
end arch;
