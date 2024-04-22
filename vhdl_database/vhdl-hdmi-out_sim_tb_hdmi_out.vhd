-- author: Furkan Cayci, 2018
-- description: hdmi out testbench

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_hdmi_out is
end tb_hdmi_out;

architecture rtl of tb_hdmi_out is

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    constant clk_period : time := 8 ns;
    constant reset_time : time :=   20 * clk_period;
    constant hsync_time : time := 1648 * clk_period;
    constant frame_time : time :=  750 * hsync_time;

    -- interface ports / generics
    -- enable GHDL simulation support
    -- set this to false when using Vivado
    --   OSERDESE2 is normally used for 7-series
    --   but since it is encrypted, GHDL cannot simulate it
    --   Thus, this will downgrade it to OSERDESE1
    --   for simulation under GHDL
    constant SERIES6     : boolean := true;     -- use OSERDES1/2
    constant RESOLUTION  : string  := "HD720P"; -- HD720P, SVGA, VGA
    constant GEN_PATTERN : boolean := false;    -- generate pattern or objects
    constant GEN_PIX_LOC : boolean := true;     -- generate location counters for x / y coordinates
    constant OBJECT_SIZE : natural := 16;       -- size of the objects. should be higher than 11
    constant PIXEL_SIZE  : natural := 24;       -- RGB pixel total size. (R + G + B)

    signal clk_p, clk_n : std_logic;
    signal data_p, data_n : std_logic_vector(2 downto 0);

begin

    uut0: entity work.hdmi_out
      generic map(RESOLUTION=>RESOLUTION, GEN_PATTERN=>GEN_PATTERN,
        GEN_PIX_LOC=>GEN_PIX_LOC, OBJECT_SIZE=>OBJECT_SIZE,
        PIXEL_SIZE=>PIXEL_SIZE, SERIES6=>SERIES6)
      port map(clk=>clk, rst=>rst, clk_p=>clk_p, clk_n=>clk_n,
        data_p=>data_p, data_n=>data_n);

    -- clock generate
    process
    begin
        --for i in 0 to 2 * frame_time / clk_period loop
            wait for clk_period/2;
            clk <= not clk;
        --end loop;
        --wait;
    end process;

    process
    begin
        -- report serdes status
        if SERIES6 then
            report "using OSERDES1 (for series 6)";
        else
            report "using OSERDES2 (for series 7)";
        end if;

        rst <= '1';
        wait for reset_time;
        rst <= '0';
        wait for frame_time;
        wait;
    end process;

end rtl;
