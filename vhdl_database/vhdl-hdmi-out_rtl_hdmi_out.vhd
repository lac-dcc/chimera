-- author: Furkan Cayci, 2018
-- description: hdmi out top module
--    consists of the timing module, clock manager and tgb to tdms encoder
--    three different resolutions are added, selectable from the generic
--    objectbuffer is added that displays 2 controllable 1 stationary objects
--    optional pattern generator is added

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;

entity hdmi_out is
    generic (
        RESOLUTION   : string  := "HD1080P"; -- HD1080P, HD720P, SVGA, VGA
        GEN_PATTERN  : boolean := false; -- generate pattern or objects
        GEN_PIX_LOC  : boolean := true; -- generate location counters for x / y coordinates
        OBJECT_SIZE  : natural := 16; -- size of the objects. should be higher than 11
        PIXEL_SIZE   : natural := 24; -- RGB pixel total size. (R + G + B)
        SERIES6      : boolean := false -- disables OSERDESE2 and enables OSERDESE1 for GHDL simulation (7 series vs 6 series)
    );
    port(
        clk, rst : in std_logic;
        -- tmds output ports
        clk_p : out std_logic;
        clk_n : out std_logic;
        data_p : out std_logic_vector(2 downto 0);
        data_n : out std_logic_vector(2 downto 0)
    );
end hdmi_out;

architecture rtl of hdmi_out is

    signal pixclk, serclk : std_logic;
    signal video_active   : std_logic := '0';
    signal video_data     : std_logic_vector(PIXEL_SIZE-1 downto 0);
    signal vsync, hsync   : std_logic := '0';
    signal pixel_x        : std_logic_vector(OBJECT_SIZE-1 downto 0);
    signal pixel_y        : std_logic_vector(OBJECT_SIZE-1 downto 0);
    signal object1x       : std_logic_vector(OBJECT_SIZE-1 downto 0) := std_logic_vector(to_unsigned(500, OBJECT_SIZE));
    signal object1y       : std_logic_vector(OBJECT_SIZE-1 downto 0) := std_logic_vector(to_unsigned(140, OBJECT_SIZE));
    signal object2x       : std_logic_vector(OBJECT_SIZE-1 downto 0) := std_logic_vector(to_unsigned(240, OBJECT_SIZE));
    signal object2y       : std_logic_vector(OBJECT_SIZE-1 downto 0) := std_logic_vector(to_unsigned(340, OBJECT_SIZE));
    signal backgrnd_rgb   : std_logic_vector(PIXEL_SIZE-1 downto 0) := x"FFFF00"; -- yellow

begin

    -- generate 1x pixel and 5x serial clocks
    timing_hd1080p: if RESOLUTION = "HD1080P" generate
    begin
    clock: entity work.clock_gen(rtl)
      generic map (CLKIN_PERIOD=>8.000, CLK_MULTIPLY=>59, CLK_DIVIDE=>5, CLKOUT0_DIV=>2, CLKOUT1_DIV=>10) -- 1080p
      port map (clk_i=>clk, clk0_o=>serclk, clk1_o=>pixclk);
    end generate;

    timing_hd720p: if RESOLUTION = "HD720P" generate
    begin
    clock: entity work.clock_gen(rtl)
        generic map (CLKIN_PERIOD=>8.000, CLK_MULTIPLY=>59, CLK_DIVIDE=>5, CLKOUT0_DIV=>4, CLKOUT1_DIV=>20) -- 720p
        port map (clk_i=>clk, clk0_o=>serclk, clk1_o=>pixclk);
    end generate;

    timing_vga: if RESOLUTION = "SVGA" generate
    begin
    clock: entity work.clock_gen(rtl)
        generic map (CLKIN_PERIOD=>8.000, CLK_MULTIPLY=>8, CLK_DIVIDE=>1, CLKOUT0_DIV=>5, CLKOUT1_DIV=>25) -- 800x600
        port map (clk_i=>clk, clk0_o=>serclk, clk1_o=>pixclk);
    end generate;

    timing_svga: if RESOLUTION = "VGA" generate
    begin
    clock: entity work.clock_gen(rtl)
        generic map (CLKIN_PERIOD=>8.000, CLK_MULTIPLY=>8, CLK_DIVIDE=>1, CLKOUT0_DIV=>8, CLKOUT1_DIV=>40) -- 640x480
        port map (clk_i=>clk, clk0_o=>serclk, clk1_o=>pixclk );
    end generate;

    -- video timing
    timing: entity work.timing_generator(rtl)
        generic map (RESOLUTION => RESOLUTION, GEN_PIX_LOC => GEN_PIX_LOC, OBJECT_SIZE => OBJECT_SIZE)
        port map (clk=>pixclk, hsync=>hsync, vsync=>vsync, video_active=>video_active, pixel_x=>pixel_x, pixel_y=>pixel_y);

    -- tmds signaling
    tmds_signaling: entity work.rgb2tmds(rtl)
        generic map (SERIES6=>SERIES6)
        port map (rst=>rst, pixelclock=>pixclk, serialclock=>serclk,
        video_data=>video_data, video_active=>video_active, hsync=>hsync, vsync=>vsync,
        clk_p=>clk_p, clk_n=>clk_n, data_p=>data_p, data_n=>data_n);

    -- pattern generator
    gen_patt: if GEN_PATTERN = true generate
    begin
    pattern: entity work.pattern_generator(rtl)
        port map (clk=>pixclk, video_active=>video_active, rgb=>video_data);
    end generate;

    -- game object buffer
    gen_obj: if GEN_PATTERN = false generate
    begin
    objbuf: entity work.objectbuffer(rtl)
        generic map (OBJECT_SIZE=>OBJECT_SIZE, PIXEL_SIZE =>PIXEL_SIZE)
        port map (video_active=>video_active, pixel_x=>pixel_x, pixel_y=>pixel_y,
        object1x=>object1x, object1y=>object1y,
        object2x=>object2x, object2y=>object2y,
        backgrnd_rgb=>backgrnd_rgb, rgb=>video_data);
    end generate;

end rtl;
