--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    CELL_CTRL
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CELL_CTRL is
    Port (
        CLK         : in  std_logic;
        PIXEL_X     : in  std_logic_vector(9 downto 0);
        PIXEL_Y     : in  std_logic_vector(9 downto 0);
        KURZOR_ADDR : in  std_logic_vector(7 downto 0);
        KURZOR      : out std_logic;
        PIXEL_SET_X : out std_logic;
        PIXEL_SET_Y : out std_logic;
        KOMP_SET_X  : out std_logic;
        KOMP_SET_Y  : out std_logic;
        KOMP_ON     : out std_logic;
        KOMP4_IS    : out std_logic;
        ADDR        : out std_logic_vector(7 downto 0);
        KOMP0       : in  std_logic_vector(5 downto 0);
        KOMP1       : in  std_logic_vector(5 downto 0);
        KOMP2       : in  std_logic_vector(5 downto 0);
        KOMP3       : in  std_logic_vector(5 downto 0);
        KOMP4       : in  std_logic_vector(5 downto 0);
        KOMP_OUT    : out std_logic_vector(5 downto 0);
        SCREEN_CODE	: in  std_logic_vector(2 downto 0)  -- game screen code
    );
end CELL_CTRL;

architecture FULL of CELL_CTRL is

    signal pix_x           : std_logic_vector(9 downto 0);
    signal pix_y           : std_logic_vector(9 downto 0);

    signal addr_x          : std_logic_vector(3 downto 0);
    signal addr_y          : std_logic_vector(3 downto 0);
    signal addr_x2         : std_logic_vector(3 downto 0);
    signal addr_y2         : std_logic_vector(3 downto 0);

    signal obj_addr_x      : std_logic_vector(4 downto 0);
    signal obj_addr_x2     : std_logic_vector(4 downto 0);

    signal obj_addr_y      : std_logic_vector(3 downto 0);
    signal obj_addr_y2     : std_logic_vector(3 downto 0);

    signal pix_set_x       : std_logic;
    signal pix_set_y       : std_logic;

    signal sig_kurzor_x    : std_logic_vector(3 downto 0);
    signal sig_kurzor_y    : std_logic_vector(3 downto 0);
    signal kurzor_set_x    : std_logic;
    signal kurzor_set_y    : std_logic;

    signal k_set_x         : std_logic;
    signal k_set_y         : std_logic;

    signal sig_kset_x      : std_logic;
    signal sig_kset_y      : std_logic;

    signal sig_komp_on     : std_logic;
    signal pre_komp_out    : std_logic_vector(5 downto 0);
    signal rom_addr        : std_logic_vector(11 downto 0);
    signal rom_data        : std_logic_vector(8 downto 0);
    signal game_screens    : std_logic_vector(2 downto 0);

begin

    pix_x <= PIXEL_X;
    pix_y <= PIXEL_Y;

    ----------------------------------------------------------------------------
    -- ZOBRAZOVANI HERNIHO POLE
    ----------------------------------------------------------------------------

    process (CLK)
    begin
        if rising_edge(CLK) then
            case pix_x is
                when "0000000000" => -- 0
                    pix_set_x <= '0';
                    k_set_x   <= '1';
                    addr_x <= (others => '0');
                    obj_addr_x <= std_logic_vector(to_unsigned(0, 5));
                when "0000100000" => -- 32
                    pix_set_x <= '0';
                    k_set_x   <= '1';
                    addr_x <= (others => '0');
                    obj_addr_x <= std_logic_vector(to_unsigned(1, 5));
                when "0001000000" => -- 64
                    pix_set_x <= '0';
                    k_set_x   <= '1';
                    addr_x <= (others => '0');
                    obj_addr_x <= std_logic_vector(to_unsigned(2, 5));
                when "0001100000" => -- 96
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(0, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(3, 5));
                when "0010000000" => -- 128
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(1, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(4, 5));
                when "0010100000" => -- 160
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(2, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(5, 5));
                when "0011000000" => -- 192
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(3, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(6, 5));
                when "0011100000" => -- 224
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(4, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(7, 5));
                when "0100000000" => -- 256
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(5, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(8, 5));
                when "0100100000" => -- 288
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(6, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(9, 5));
                when "0101000000" => -- 320
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(7, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(10, 5));
                when "0101100000" => -- 352
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(8, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(11, 5));
                when "0110000000" => -- 384
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(9, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(12, 5));
                when "0110100000" => -- 416
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(10, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(13, 5));
                when "0111000000" => -- 448
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(11, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(14, 5));
                when "0111100000" => -- 480
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(12, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(15, 5));
                when "1000000000" => -- 512
                    pix_set_x <= '1';
                    k_set_x   <= '1';
                    addr_x <= std_logic_vector(to_unsigned(13, 4));
                    obj_addr_x <= std_logic_vector(to_unsigned(16, 5));
                when "1000100000" => -- 544
                    pix_set_x <= '0';
                    k_set_x   <= '1';
                    addr_x <= (others => '0');
                    obj_addr_x <= std_logic_vector(to_unsigned(17, 5));
                when "1001000000" => -- 576
                    pix_set_x <= '0';
                    k_set_x   <= '1';
                    addr_x <= (others => '0');
                    obj_addr_x <= std_logic_vector(to_unsigned(18, 5));
                when "1001100000" => -- 608
                    pix_set_x <= '0';
                    k_set_x   <= '1';
                    addr_x <= (others => '0');
                    obj_addr_x <= std_logic_vector(to_unsigned(19, 5));
                when others =>
                    pix_set_x <= '0';
                    k_set_x   <= '0';
                    addr_x <= (others => '0');
                    obj_addr_x <= (others => '0');
            end case;
        end if;
    end process;

    process (CLK)
    begin
        if rising_edge(CLK) then
            case pix_y is
                when "0000000000" => -- 0
                    pix_set_y <= '0';
                    k_set_y <= '1';
                    addr_y <= (others => '0');
                    obj_addr_y <= std_logic_vector(to_unsigned(0, 4));
                when "0000100000" => -- 32
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(0, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(1, 4));
                when "0001000000" => -- 64
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(1, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(2, 4));
                when "0001100000" => -- 96
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(2, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(3, 4));
                when "0010000000" => -- 128
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(3, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(4, 4));
                when "0010100000" => -- 160
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(4, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(5, 4));
                when "0011000000" => -- 192
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(5, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(6, 4));
                when "0011100000" => -- 224
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(6, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(7, 4));
                when "0100000000" => -- 256
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(7, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(8, 4));
                when "0100100000" => -- 288
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(8, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(9, 4));
                when "0101000000" => -- 320
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(9, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(10, 4));
                when "0101100000" => -- 352
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(10, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(11, 4));
                when "0110000000" => -- 384
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(11, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(12, 4));
                when "0110100000" => -- 416
                    pix_set_y <= '1';
                    k_set_y <= '1';
                    addr_y <= std_logic_vector(to_unsigned(12, 4));
                    obj_addr_y <= std_logic_vector(to_unsigned(13, 4));
                when "0111000000" => -- 448
                    pix_set_y <= '0';
                    k_set_y <= '1';
                    addr_y <= (others => '0');
                    obj_addr_y <= std_logic_vector(to_unsigned(14, 4));
                when others =>
                    pix_set_y <= '0';
                    k_set_y <= '0';
                    addr_y <= (others => '0');
                    obj_addr_y <= (others => '0');
            end case;
        end if;
    end process;

    process (CLK)
    begin
        if rising_edge(CLK) then
            if (pix_set_x = '1') then
                addr_x2 <= addr_x;
            end if;
        end if;
    end process;

    process (CLK)
    begin
        if rising_edge(CLK) then
            if (pix_set_x = '1' AND pix_set_y = '1') then
                addr_y2 <= addr_y;
            end if;
        end if;
    end process;

    ADDR <= addr_y2 & addr_x2;

    process (CLK)
    begin
        if rising_edge(CLK) then
            if (k_set_x = '1') then
                obj_addr_x2 <= obj_addr_x;
            end if;
        end if;
    end process;

    process (CLK)
    begin
        if rising_edge(CLK) then
            if (k_set_x = '1' AND k_set_y = '1') then
                obj_addr_y2 <= obj_addr_y;
            end if;
        end if;
    end process;

    process (CLK)
    begin
        if rising_edge(CLK) then
            PIXEL_SET_X <= pix_set_x;
            PIXEL_SET_Y <= pix_set_x AND pix_set_y;
            sig_kset_x  <= k_set_x;
            sig_kset_y  <= k_set_x AND k_set_y;
            KOMP_SET_X  <= sig_kset_x;
            KOMP_SET_Y  <= sig_kset_y;
        end if;
    end process;

    sig_kurzor_x <= KURZOR_ADDR(3 downto 0);
    sig_kurzor_y <= KURZOR_ADDR(7 downto 4);

    process (CLK)
    begin
        if rising_edge(CLK) then
            if (pix_set_x = '1') then
                if (sig_kurzor_x = addr_x) then
                    kurzor_set_x <= '1';
                else
                    kurzor_set_x <= '0';
                end if;
            end if;
        end if;
    end process;

    process (CLK)
    begin
        if rising_edge(CLK) then
            if (pix_set_x = '1' AND pix_set_y = '1') then
                if (sig_kurzor_y = addr_y) then
                    kurzor_set_y <= '1';
                else
                    kurzor_set_y <= '0';
                end if;
            end if;
        end if;
    end process;

    KURZOR <= kurzor_set_x AND kurzor_set_y;

    ----------------------------------------------------------------------------
    -- ZOBRAZOVANI OBJEKTU MIMO HERNI POLE VCETNE MEZI HERNICH OBRAZOVEK
    ----------------------------------------------------------------------------

    -- Nastaveni cteci pameti
    rom_addr <= SCREEN_CODE & obj_addr_y2 & obj_addr_x2;

    rom_screen_i : entity work.BRAM_ROM_SCREEN
    port map (
        CLK      => CLK,
        ROM_ADDR => rom_addr,
        ROM_DOUT => rom_data
    );

    pre_komp_out <= rom_data(8 downto 3);

    with rom_data(2 downto 0) select
    KOMP_OUT <= pre_komp_out when "100",
                KOMP0 when "101",
                KOMP1 when "110",
                KOMP2 when "111",
                KOMP3 when "001",
                KOMP4 when "010",
                "000000" when others;

    -- aktivní, když se vykreslují roury mimo herní plochu
    with rom_data(2 downto 0) select
    sig_komp_on <= '1' when "100",
                   '1' when "101",
                   '1' when "110",
                   '1' when "111",
                   '1' when "001",
                   '1' when "010",
                   '0' when others;

    KOMP_ON <= sig_komp_on;
    KOMP4_IS <= '1' when (rom_data(2 downto 0) = "010") else '0';

end FULL;
