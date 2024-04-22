--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    TOP
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP is
    Generic (
        SOUND_ENABLE : boolean := false -- Enable / disable sound
    );
    Port (
        CLK        : in  std_logic; -- Clock - 50 MHz
        ASYNC_RST  : in  std_logic; -- High active asynchronous reset
        -- PS2 INTERFACE
        PS2_CLK    : in  std_logic; -- PS2 CLK
        PS2_DATA   : in  std_logic; -- PS2 DATA
        -- VGA INTERFACE
        VGA_RED    : out std_logic_vector(4 downto 0); -- VGA RED
        VGA_GREEN  : out std_logic_vector(5 downto 0); -- VGA GREEN
        VGA_BLUE   : out std_logic_vector(4 downto 0); -- VGA BLUE
        VGA_H_SYNC : out std_logic; -- VGA H-SYNC
        VGA_V_SYNC : out std_logic; -- VGA V-SYNC
        -- SOUND OUTPUT
        SOUND      : out std_logic; -- Sound output
        -- CTRL LEDS
        LED_GWIN   : out std_logic; -- LED GAME WIN
        LED_GOVER  : out std_logic  -- LED GAME OVER
    );
end TOP;

architecture FULL of TOP is

    -- reset signals
    signal ASYNC_RST_deb        : std_logic;
    signal reset                : std_logic;

    -- keys signals
    signal sig_key_w            : std_logic;
    signal sig_key_s            : std_logic;
    signal sig_key_a            : std_logic;
    signal sig_key_d            : std_logic;
    signal sig_key_space        : std_logic;

    -- pixels signals
    signal pix_x                : std_logic_vector(9 downto 0);
    signal pix_y                : std_logic_vector(9 downto 0);
    signal pix_x1               : std_logic_vector(9 downto 0);
    signal pix_y1               : std_logic_vector(9 downto 0);
    signal pix_x2               : std_logic_vector(9 downto 0);
    signal pix_y2               : std_logic_vector(9 downto 0);

    -- cell ctrl signals
    signal sig_pix_set_x        : std_logic;
    signal sig_pix_set_y        : std_logic;
    signal sig_komp_set_x       : std_logic;
    signal sig_komp_set_y       : std_logic;
    signal sig_komp_on          : std_logic;
    signal sig_komp4_is         : std_logic;
    signal sig_komp_out         : std_logic_vector(5 downto 0);

    -- video signals
    signal sig_hsync            : std_logic;
    signal sig_vsync            : std_logic;
    signal sig_hsync1           : std_logic;
    signal sig_vsync1           : std_logic;
    signal sig_hsync2           : std_logic;
    signal sig_vsync2           : std_logic;
    signal sig_hsync3           : std_logic;
    signal sig_vsync3           : std_logic;
    signal sig_hsync4           : std_logic;
    signal sig_vsync4           : std_logic;
    signal sig_rgb              : std_logic_vector(2 downto 0);

    -- memory signals
    signal sig_addr_cell_ctrl   : std_logic_vector(7 downto 0);
    signal sig_addr_cell_ctrl_2 : std_logic_vector(8 downto 0);
    signal sig_dout_cell_gen    : std_logic_vector(31 downto 0);

    signal sig_we_hub           : std_logic;
    signal sig_addr_hub         : std_logic_vector(7 downto 0);
    signal sig_addr_hub_2       : std_logic_vector(8 downto 0);
    signal sig_dout_hub         : std_logic_vector(31 downto 0);
    signal sig_din_hub          : std_logic_vector(31 downto 0);

    -- memory hub signals
    signal hub_we_a             : std_logic;
    signal hub_en_a             : std_logic;
    signal hub_addr_a           : std_logic_vector(7 downto 0);
    signal hub_din_a            : std_logic_vector(31 downto 0);
    signal hub_dout_a           : std_logic_vector(31 downto 0);
    signal hub_ack_a            : std_logic;

    signal hub_we_b             : std_logic;
    signal hub_en_b             : std_logic;
    signal hub_addr_b           : std_logic_vector(7 downto 0);
    signal hub_din_b            : std_logic_vector(31 downto 0);
    signal hub_dout_b           : std_logic_vector(31 downto 0);
    signal hub_ack_b            : std_logic;

    -- kurzor signals
    signal sig_kurzor           : std_logic;
    signal sig_kurzor_addr      : std_logic_vector(7 downto 0);

    -- roura generator signals
    signal sig_komp0            : std_logic_vector(5 downto 0);
    signal sig_komp1            : std_logic_vector(5 downto 0);
    signal sig_komp2            : std_logic_vector(5 downto 0);
    signal sig_komp3            : std_logic_vector(5 downto 0);
    signal sig_komp4            : std_logic_vector(5 downto 0);
    signal sig_gen_new          : std_logic;
    signal sig_gen_five         : std_logic;

    -- sounds signals
    signal sound_place_pipe     : std_logic;
    signal sound_cant_place     : std_logic;
    signal sound_win            : std_logic;
    signal sound_lose           : std_logic;

    -- game ctrl
    signal sig_lvl1             : std_logic;
    signal sig_lvl2             : std_logic;
    signal sig_lvl3             : std_logic;
    signal sig_lvl4             : std_logic;
    signal sig_screen_code      : std_logic_vector(2 downto 0);
    signal sig_game_on          : std_logic;
    signal sig_win              : std_logic;
    signal sig_lose             : std_logic;
    signal sig_load_water       : std_logic_vector(7 downto 0);
    signal rst_wtr_ctrl         : std_logic;
    signal wtr_ctrl_start       : std_logic;

begin

    LED_GWIN  <= sig_win;
    LED_GOVER <= sig_lose;

    VGA_RED   <= sig_rgb(2) & sig_rgb(2) & sig_rgb(2) & sig_rgb(2) & sig_rgb(2);
    VGA_GREEN <= sig_rgb(1) & sig_rgb(1) & sig_rgb(1) & sig_rgb(1) & sig_rgb(1) & sig_rgb(1);
    VGA_BLUE  <= sig_rgb(0) & sig_rgb(0) & sig_rgb(0) & sig_rgb(0) & sig_rgb(0);

    VGA_V_SYNC <= sig_vsync4;
    VGA_H_SYNC <= sig_hsync4;

    ----------------------------------------------------------------------------
    -- RESET DEBOUNCER AND SYNCHRONIZER
    ----------------------------------------------------------------------------

    ASYNC_RST_debouncer_i: entity work.DEBOUNCER
    port map(
        CLK  => CLK,
        RST  => '0',
        DIN  => not ASYNC_RST,
        DOUT => ASYNC_RST_deb -- Debounced Asynchronous Reset
    );

    reset_sync_i: entity work.RESET_SYNC
    port map(
        CLK       => CLK,
        ASYNC_RST => ASYNC_RST_deb,
        OUT_RST   => reset -- Synchronized Asynchronous Reset
    );

    ----------------------------------------------------------------------------
    -- PS2 DRIVER
    ----------------------------------------------------------------------------

    ps2_i: entity work.PS2
    port map(
        CLK       => CLK,
        RST       => reset,
        PS2C      => PS2_CLK,
        PS2D      => PS2_DATA,
        KEY_W     => sig_key_w,
        KEY_S     => sig_key_s,
        KEY_A     => sig_key_a,
        KEY_D     => sig_key_d,
        KEY_SPACE => sig_key_space
    );

    ----------------------------------------------------------------------------
    -- VIDEO GENERATOR
    ----------------------------------------------------------------------------

    -- VGA driver
    vga_sync_i: entity work.VGA_SYNC
    port map(
        CLK      => CLK,
        RST      => reset,
        PIXEL_X  => pix_x,
        PIXEL_Y  => pix_y,
        HSYNC    => sig_hsync,
        VSYNC    => sig_vsync
    );

    cell_ctrl_i: entity work.CELL_CTRL
    port map(
        CLK         => CLK,
        PIXEL_X     => pix_x,
        PIXEL_Y     => pix_y,
        KURZOR_ADDR => sig_kurzor_addr,
        KURZOR      => sig_kurzor,
        PIXEL_SET_X => sig_pix_set_x,
        PIXEL_SET_Y => sig_pix_set_y,
        KOMP_SET_X  => sig_komp_set_x,
        KOMP_SET_Y  => sig_komp_set_y,
        KOMP_ON     => sig_komp_on,
        KOMP4_IS    => sig_komp4_is,
        ADDR        => sig_addr_cell_ctrl,
        KOMP0       => sig_komp0,
        KOMP1       => sig_komp1,
        KOMP2       => sig_komp2,
        KOMP3       => sig_komp3,
        KOMP4       => sig_komp4,
        KOMP_OUT    => sig_komp_out,
        SCREEN_CODE => sig_screen_code
    );

    sig_addr_cell_ctrl_2 <= '0' & sig_addr_cell_ctrl;

    cell_generator_i: entity work.CELL_GENERATOR
    port map(
        CLK            => CLK,
        RST            => reset,
        TYP_ROURY      => sig_dout_cell_gen(3 downto 0),
        NATOCENI_ROURY => sig_dout_cell_gen(5 downto 4),
        ROURA_VODA1    => sig_dout_cell_gen(15 downto 10),
        ROURA_VODA2    => sig_dout_cell_gen(21 downto 16),
        ZDROJ_VODY1    => sig_dout_cell_gen(25 downto 22),
        ZDROJ_VODY2    => sig_dout_cell_gen(29 downto 26),
        KURZOR         => sig_kurzor,
        PIXEL_X2       => pix_x2,
        PIXEL_Y2       => pix_y2,
        PIXEL_SET_X    => sig_pix_set_x,
        PIXEL_SET_Y    => sig_pix_set_y,
        KOMP_SET_X     => sig_komp_set_x,
        KOMP_SET_Y     => sig_komp_set_y,
        KOMP_ON        => sig_komp_on,
        KOMP4_IS       => sig_komp4_is,
        KOMP_IN        => sig_komp_out,
        GAME_ON        => sig_game_on,
        LOAD_WATER     => sig_load_water,
        RGB            => sig_rgb
    );

    -- pixels and sync shift registers
    vga_shreg_p: process (CLK)
    begin
        if (rising_edge(CLK)) then
            sig_hsync1 <= sig_hsync;
            sig_hsync2 <= sig_hsync1;
            sig_hsync3 <= sig_hsync2;
            sig_hsync4 <= sig_hsync3;

            sig_vsync1 <= sig_vsync;
            sig_vsync2 <= sig_vsync1;
            sig_vsync3 <= sig_vsync2;
            sig_vsync4 <= sig_vsync3;

            pix_x1 <= pix_x;
            pix_x2 <= pix_x1;

            pix_y1 <= pix_y;
            pix_y2 <= pix_y1;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- OBVODY RIDICI KURZOR A V KLADANI ROUR
    ----------------------------------------------------------------------------

    kurzor_ctrl_i: entity work.KURZOR_CTRL
    port map(
        CLK         => CLK,
        RST         => reset,
        KEY_W       => sig_key_w,
        KEY_S       => sig_key_s,
        KEY_A       => sig_key_a,
        KEY_D       => sig_key_d,
        KEY_SPACE   => sig_key_space,
        KOMP_GEN    => sig_gen_new,
        KURZOR_ADDR => sig_kurzor_addr,
        DATAIN      => hub_dout_a,
        DATAOUT     => hub_din_a,
        ADDR        => hub_addr_a,
        EN          => hub_en_a,
        WE          => hub_we_a,
        ACK         => hub_ack_a,
        KOMP4       => sig_komp4,
        CANT_PLACE  => sound_cant_place,
        CAN_PLACE   => sound_place_pipe,
        SCREEN_CODE => sig_screen_code,
        GAME_ON     => sig_game_on
    );

    random_decoder_fifo_i: entity work.RANDOM_DECODER_FIFO
    port map(
        CLK           => CLK,
        RST           => reset,
        GENERATE_NEW  => sig_gen_new,  -- po poslani enable signalu se obevi nova komponenta
        GENERATE_FIVE => sig_gen_five, -- po poslani enable signalu se obevi 5 novych komponent
        KOMP0         => sig_komp0,
        KOMP1         => sig_komp1,
        KOMP2         => sig_komp2,
        KOMP3         => sig_komp3,
        KOMP4         => sig_komp4
    );

    ----------------------------------------------------------------------------
    -- PAMETI
    ----------------------------------------------------------------------------

    -- BRAM pamet pro stavy policek
    bram_i: entity work.BRAM_SYNC_TDP
    generic map(
        DATA_WIDTH => 32, -- Sirka datoveho vstupu a vystupu
        ADDR_WIDTH => 9   -- Sirka adresove sbernice, urcuje take pocet polozek v pameti (2^ADDR_WIDTH)
    )
    port map(
        CLK       => CLK,
        -- Port A
        WE_A      => sig_we_hub,
        ADDR_A    => sig_addr_hub_2,
        DATAIN_A  => sig_din_hub,
        DATAOUT_A => sig_dout_hub,
        -- Port B - Pouziva ho pouze VGA radic a to pouze ke cteni
        WE_B      => '0',
        ADDR_B    => sig_addr_cell_ctrl_2,
        DATAIN_B  => (others => '0'),
        DATAOUT_B => sig_dout_cell_gen
    );

    -- Rozdvojka pameti
    mem_hub_i: entity work.MEM_HUB
    port map(
        CLK    => CLK,
        RST    => reset,
        -- Port A
        EN_A   => hub_en_a,
        WE_A   => hub_we_a,
        ADDR_A => hub_addr_a,
        DIN_A  => hub_din_a,
        DOUT_A => hub_dout_a,
        ACK_A  => hub_ack_a,
        -- Port B
        EN_B   => hub_en_b,
        WE_B   => hub_we_b,
        ADDR_B => hub_addr_b,
        DIN_B  => hub_din_b,
        DOUT_B => hub_dout_b,
        ACK_B  => hub_ack_b,
        -- Port to memory
        WE     => sig_we_hub,
        ADDR   => sig_addr_hub,
        DIN    => sig_din_hub,
        DOUT   => sig_dout_hub
    );

    sig_addr_hub_2 <= '0' & sig_addr_hub;

    wtr_ctrl_i: entity work.WTR_CTRL
    port map(
        CLK            => CLK,
        RST            => rst_wtr_ctrl,
        ADR            => hub_addr_b,
        CELL_IN        => hub_dout_b,
        CELL_OUT       => hub_din_b,
        WE_OUT         => hub_we_b,
        RE_OUT         => hub_en_b,
        WIN_BIT        => sig_win,
        KNLG_next      => hub_ack_b,
        START          => wtr_ctrl_start,
        fail_out       => sig_lose
    );

    ----------------------------------------------------------------------------
    -- SOUND
    ----------------------------------------------------------------------------

    enable_sound_g: if (SOUND_ENABLE = true) generate
        sound_i: entity work.MUZIKA
        port map(
            CLK        => CLK,
            RST        => reset,
            PLACE_PIPE => sound_place_pipe,
            CANT_PLACE => sound_cant_place,
            WIN_LEVEL  => sound_win,
            GAME_OVER  => sound_lose,
            MUSIC      => SOUND
        );

        rised_sound_1_i: entity work.RISING_EDGE_DETECTOR
        port map(
            CLK    => CLK,
            VSTUP  => sig_win,
            VYSTUP => sound_win
        );

        rised_sound_2_i: entity work.RISING_EDGE_DETECTOR
        port map(
            CLK    => CLK,
            VSTUP  => sig_lose,
            VYSTUP => sound_lose
        );
    end generate;

    disable_sound_g: if (SOUND_ENABLE = false) generate
        SOUND <= '0';
    end generate;

    ----------------------------------------------------------------------------
    -- GAME CTRL
    ----------------------------------------------------------------------------

    game_ctrl_i: entity work.GAME_CTRL
    port map(
        CLK         => CLK,
        RST         => reset,
        WIN         => sig_win,
        LOSE        => sig_lose,
        KEY_W       => sig_key_w,
        KEY_S       => sig_key_s,
        KEY_A       => sig_key_a,
        KEY_D       => sig_key_d,
        GEN5_EN     => sig_gen_five,
        SCREEN_CODE => sig_screen_code,
        GAME_ON     => sig_game_on,
        WATER       => sig_load_water
    );

    rst_wtr_ctrl   <= reset or not sig_game_on;
    wtr_ctrl_start <= '1' when (sig_load_water = "11111111") else '0';

end FULL;
