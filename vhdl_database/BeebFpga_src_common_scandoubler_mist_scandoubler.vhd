--
-- scandoubler.vhd
--
-- Copyright (c) 2015 Till Harbaum <till@harbaum.org>
--
-- Migrated to VHDL by David Banks
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http:--www.gnu.org/licenses/>.

-- TODO: Delay vsync one line
library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mist_scandoubler is
    generic (
        WIDTH     : integer
    );
    port (
        -- system interface
        clk       : in  std_logic;  -- 32MHz
        clk_en    : in  std_logic;  -- 32MHz
        clk_16    : in  std_logic;  -- from shifter
        clk_16_en : in  std_logic;

        -- shifter video interface
        hs_in     : in  std_logic;
        vs_in     : in  std_logic;
        r_in      : in  std_logic_vector(WIDTH - 1 downto 0);
        g_in      : in  std_logic_vector(WIDTH - 1 downto 0);
        b_in      : in  std_logic_vector(WIDTH - 1 downto 0);

        -- output interface
        hs_out    : out std_logic;
        vs_out    : out std_logic;
        r_out     : out std_logic_vector(WIDTH - 1 downto 0);
        g_out     : out std_logic_vector(WIDTH - 1 downto 0);
        b_out     : out std_logic_vector(WIDTH - 1 downto 0);

        is15k     : out std_logic
    );
end entity;

architecture rtl of mist_scandoubler is

-- scan doubler output register
signal sd_out : std_logic_vector(WIDTH * 3 - 1 downto 0);

-- --------------------- create output signals -----------------
-- latch everything once more to make it glitch free

-- 2 lines of 1024 pixels 3*4 bit RGB
type ram_type is array (2047 downto 0) of std_logic_vector (WIDTH * 3 - 1 downto 0);
signal sd_buffer : ram_type;

-- use alternating sd_buffers when storing/reading data
signal vsD : std_logic;
signal line_toggle : std_logic;


-- total hsync time (in 16MHz cycles), hs_total reaches 1024
signal hs_max  : std_logic_vector(9 downto 0);
signal hs_rise : std_logic_vector(9 downto 0);
signal hcnt    : std_logic_vector(9 downto 0);

signal hsD     : std_logic;
signal sd_hcnt : std_logic_vector(9 downto 0);
signal hs_sd   : std_logic;

signal vs      : std_logic;
signal hs      : std_logic;

begin

    hs_out <= hs;
    vs_out <= vs;

    process(clk)
    begin
        if rising_edge(clk) then
            if clk_en = '1' then
                hs <= hs_sd;
                vs <= vs_in;
                r_out <= sd_out(WIDTH * 3 - 1 downto WIDTH * 2);
                g_out <= sd_out(WIDTH * 2 - 1 downto WIDTH * 1);
                b_out <= sd_out(WIDTH * 1 - 1 downto WIDTH * 0);
            end if;
        end if;
    end process;

-- ==================================================================
-- ======================== the line buffers ========================
-- ==================================================================

    process(clk_16)
    begin
        if rising_edge(clk_16) then
            if clk_16_en = '1' then
                vsD <= vs_in;
                if vsD /= vs_in then
                    line_toggle <= '0';
                end if;
                -- begin of incoming hsync
                if hsD = '1' and hs_in = '0' then
                    line_toggle <= not line_toggle;
                end if;
            end if;
        end if;
    end process;

    process(clk_16)
    begin
        if rising_edge(clk_16) then
            if clk_16_en = '1' then
                sd_buffer(conv_integer(line_toggle & hcnt)) <= r_in & g_in & b_in;
            end if;
        end if;
    end process;

-- ==================================================================
-- =================== horizontal timing analysis ===================
-- ==================================================================

-- signal detection of 15khz if hsync frequency is less than 20KHz
    is15k <= '1' when hs_max > (16000000/20000) else '0';

    process(clk_16)
    begin
        if rising_edge(clk_16) then
            if clk_16_en = '1' then
                hsD <= hs_in;
                -- falling edge of hsync indicates start of line
                if hsD = '1' and hs_in = '0' then
                    hs_max <= hcnt;
                    hcnt <= (others => '0');
                else
                    hcnt <= hcnt + 1;
                end if;
                -- save position of rising edge
                if hsD = '0' and hs_in = '1' then
                    hs_rise <= hcnt;
                end if;
            end if;
        end if;
    end process;

-- ==================================================================
-- ==================== output timing generation ====================
-- ==================================================================


-- timing generation runs 32 MHz (twice the input signal analysis speed)
    process(clk)
    begin
        if rising_edge(clk) then
            if clk_en = '1' then
                -- output counter synchronous to input and at twice the rate
                sd_hcnt <= sd_hcnt + 1;
                if hsD = '1' and hs_in = '0' then
                    sd_hcnt <= hs_max;
                end if;
                if sd_hcnt = hs_max then
                    sd_hcnt <= (others => '0');
                end if;
                -- replicate horizontal sync at twice the speed
                if sd_hcnt = hs_max then
                    hs_sd <= '0';
                end if;
                if sd_hcnt = hs_rise then
                    hs_sd <= '1';
                end if;
                -- read data from line sd_buffer
                sd_out <= sd_buffer(conv_integer((not line_toggle) & sd_hcnt));
            end if;
        end if;
    end process;

end architecture;
