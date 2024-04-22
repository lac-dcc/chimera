--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    CELL_GENERATOR
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CELL_GENERATOR is
    Port (
        CLK            : in  std_logic;
        RST            : in  std_logic;
        TYP_ROURY      : in  std_logic_vector(3 downto 0);
        NATOCENI_ROURY : in  std_logic_vector(1 downto 0);
        ROURA_VODA1    : in  std_logic_vector(5 downto 0);
        ROURA_VODA2    : in  std_logic_vector(5 downto 0);
        ZDROJ_VODY1    : in  std_logic_vector(3 downto 0);
        ZDROJ_VODY2    : in  std_logic_vector(3 downto 0);
        KURZOR         : in  std_logic;
        PIXEL_X2       : in  std_logic_vector(9 downto 0);
        PIXEL_Y2       : in  std_logic_vector(9 downto 0);
        PIXEL_SET_X    : in  std_logic;
        PIXEL_SET_Y    : in  std_logic;
        KOMP_SET_X     : in  std_logic;
        KOMP_SET_Y     : in  std_logic;
        KOMP_ON        : in  std_logic;
        KOMP4_IS       : in  std_logic;
        KOMP_IN        : in  std_logic_vector(5 downto 0);
        GAME_ON        : in  std_logic;
        LOAD_WATER     : in  std_logic_vector(7 downto 0);
        RGB            : out std_logic_vector(2 downto 0)
    );
end CELL_GENERATOR;

architecture FULL of CELL_GENERATOR is

    signal cell_x_l             : unsigned(9 downto 0);
    signal cell_x_r             : unsigned(9 downto 0);
    signal cell_y_t             : unsigned(9 downto 0);
    signal cell_y_b             : unsigned(9 downto 0);
    signal rom_addr             : std_logic_vector(8 downto 0);
    signal img_row              : unsigned(4 downto 0);
    signal img_col              : unsigned(4 downto 0);
    signal sig_komp_in          : std_logic_vector(5 downto 0);
    signal rom_data             : std_logic_vector(31 downto 0);
    signal rom_bit              : std_logic;
    signal sq_cell_on           : std_logic;
    signal sig_kurzor           : std_logic;
    signal sig_komp_on          : std_logic;
    signal pix_x                : unsigned(9 downto 0);
    signal pix_y                : unsigned(9 downto 0);
    signal pix_x2               : unsigned(9 downto 0);
    signal pix_y2               : unsigned(9 downto 0);
    signal sig_typ_roury        : std_logic_vector(3 downto 0);
    signal sig_typ_roury2       : std_logic_vector(3 downto 0);
    signal sig_natoceni_roury   : std_logic_vector(1 downto 0);
    signal load_water_lenght    : unsigned(9 downto 0);
    signal load_water_on        : std_logic;

    signal roura_water_lr       : std_logic;
    signal roura_water_rl       : std_logic;
    signal roura_water_bt       : std_logic;
    signal roura_water_tb       : std_logic;

    signal roura_water_h        : std_logic;
    signal roura_water_v        : std_logic;
    signal roura_water_lenght_1 : unsigned(9 downto 0);
    signal roura_water_lenght_2 : unsigned(9 downto 0);
    signal roura_water_lenght_h : unsigned(9 downto 0);
    signal roura_water_lenght_v : unsigned(9 downto 0);
    signal mini_water_lenght    : unsigned(9 downto 0);
    signal first_water_lenght   : unsigned(9 downto 0);
    signal last_water_lenght    : unsigned(9 downto 0);
    signal roura_water_h_offset : unsigned(9 downto 0);
    signal roura_water_v_offset : unsigned(9 downto 0);

    signal white_point_is_reg  : std_logic;

    signal water_is            : std_logic;
    signal water_is_reg        : std_logic;
    signal game_field_text     : std_logic;
    signal game_field_text_reg : std_logic;
    signal wall_is             : std_logic;
    signal wall_is_reg         : std_logic;
    signal kurzor_is           : std_logic;
    signal kurzor_is_reg       : std_logic;

    signal sq_cell_on_reg      : std_logic;
    signal rom_bit_reg         : std_logic;
    signal komp4_is_reg        : std_logic;

begin

    pix_x2 <= unsigned(PIXEL_X2);
    pix_y2 <= unsigned(PIXEL_Y2);

    sig_komp_on <= KOMP_ON;
    sig_komp_in <= KOMP_IN;

    process (CLK)
    begin
        if rising_edge(CLK) then
            pix_x <= pix_x2;
            pix_y <= pix_y2;
            sig_kurzor <= KURZOR;
            sig_typ_roury2 <= sig_typ_roury;
        end if;
    end process;

    -- Nastaveni X souradnic pro okraje
    process (CLK, RST)
    begin
        if (RST = '1') then
            cell_x_l <= (others => '0');
            cell_x_r <= (others => '0');
        elsif (rising_edge(CLK)) then
            if (PIXEL_SET_X = '1' AND GAME_ON = '1') then
                cell_x_l <= pix_x;
                cell_x_r <= pix_x + 31;
            elsif (KOMP_SET_X = '1' AND KOMP_ON = '1') then
                cell_x_l <= pix_x;
                cell_x_r <= pix_x + 31;
            end if;
        end if;
    end process;

    -- Nastaveni Y souradnic pro okraje
    process (CLK, RST)
    begin
        if (RST = '1') then
            cell_y_t <= (others => '0');
            cell_y_b <= (others => '0');
        elsif (rising_edge(CLK)) then
            if (PIXEL_SET_Y = '1' AND GAME_ON = '1') then
                cell_y_t <= pix_y;
                cell_y_b <= pix_y + 31;
            elsif (KOMP_SET_Y = '1' AND KOMP_ON = '1') then
                cell_y_t <= pix_y;
                cell_y_b <= pix_y + 31;
            end if;
        end if;
    end process;

    -- volba natoceni roury
    sig_natoceni_roury <= sig_komp_in(5 downto 4) when (KOMP_ON = '1')
                                                  else NATOCENI_ROURY;

    -- volba typu roury
    sig_typ_roury <= sig_komp_in(3 downto 0) when (KOMP_ON = '1')
                                             else TYP_ROURY;

    -- Pripraveni souradnic obrazku, rorace obrazku
    pipe_rotate : process (sig_natoceni_roury, pix_x, pix_y, cell_y_t, cell_x_l)
    begin
        case sig_natoceni_roury is
            when "00" => -- zahnuta zleva dolu 00
                img_row <= pix_y(4 downto 0) - cell_y_t(4 downto 0);
                img_col <= 31 - (pix_x(4 downto 0) - cell_x_l(4 downto 0));
            when "01" => -- zahnuta zleva nahoru 01
                img_col <= 31 - (pix_y(4 downto 0) - cell_y_t(4 downto 0));
                img_row <= 31 - (pix_x(4 downto 0) - cell_x_l(4 downto 0));
            when "10" => -- zahnuta zprava nahoru 10
                img_row <= 31 - (pix_y(4 downto 0) - cell_y_t(4 downto 0));
                img_col <= pix_x(4 downto 0) - cell_x_l(4 downto 0);
            when others => -- zahnuta zprava dolu 11
                img_row <= pix_y(4 downto 0) - cell_y_t(4 downto 0);
                img_col <= pix_x(4 downto 0) - cell_x_l(4 downto 0);
        end case;
    end process;

    -- Read ROM address
    rom_addr <= sig_typ_roury & std_logic_vector(img_row);

    rom_cell_i : entity work.BRAM_ROM_CELL
    port map (
        CLK      => CLK,
        ROM_ADDR => rom_addr,
        ROM_DOUT => rom_data
    );

    -- Vyber konkretniho bitu ve vyctenem radku obrazku
    rom_bit <= rom_data(to_integer(img_col));

    -- Rika nam ze vykreslujeme pixeli, ktere se nachazi v policku
    sq_cell_on <= '1' when ((cell_x_l <= pix_x) and (pix_x <= cell_x_r) and
                            (cell_y_t <= pix_y) and (pix_y <= cell_y_b))
                      else '0';

    ----------------------------------------------------------------------------
    -- ZOBRAZOVANI VODY V BOCNI ODPOCITAVACI TRUBCE
    ----------------------------------------------------------------------------

    load_water_lenght <= "00" & (unsigned(LOAD_WATER));

    -- vykresleni vody ktera odpocitava kontrolu trubek
    load_water_on <= '1' when ((35 <= pix_x) and (pix_x <= 60) and
                               ((319 - load_water_lenght) <= pix_y) and
                               (pix_y <= 319))
                         else '0';

    ----------------------------------------------------------------------------
    -- ZOBRAZOVANI VODY V TRUBKACH
    ----------------------------------------------------------------------------

    -- zleva doprava
    roura_water_lr <= '1' when (((cell_x_l + roura_water_h_offset) <= pix_x) and
                                (pix_x <= (cell_x_l + roura_water_h_offset + roura_water_lenght_h)) and
                                ((cell_y_t + 14) <= pix_y) and (pix_y <= (cell_y_t + 17)))
                          else '0';

    -- zprava doleva
    roura_water_rl <= '1' when ((((cell_x_r - roura_water_h_offset) - roura_water_lenght_h) <= pix_x) and
                                (pix_x <= (cell_x_r - roura_water_h_offset)) and
                                ((cell_y_t + 14) <= pix_y) and (pix_y <= (cell_y_t + 17)))
                          else '0';

    -- zdola nahoru
    roura_water_bt <= '1' when (((cell_x_l + 14) <= pix_x) and (pix_x <= (cell_x_l + 17)) and
                                (((cell_y_b - roura_water_v_offset) - roura_water_lenght_v) <= pix_y) and
                                (pix_y <= (cell_y_b - roura_water_v_offset)))
                          else '0';

    -- zprava doleva
    roura_water_tb <= '1' when (((cell_x_l + 14) <= pix_x) and (pix_x <= (cell_x_l + 17)) and
                                ((cell_y_t + roura_water_v_offset) <= pix_y) and
                                (pix_y <= (cell_y_t + roura_water_v_offset + roura_water_lenght_v)))
                          else '0';

    process (ROURA_VODA1, mini_water_lenght)
    begin
      if (ROURA_VODA1(5) = '1') then
          first_water_lenght <= "0000001111";
          last_water_lenght  <= mini_water_lenght;
      else
          first_water_lenght <= mini_water_lenght;
          last_water_lenght  <= (others => '0');
      end if;
    end process;

    roura_water_lenght_1 <= "00000" & (unsigned(ROURA_VODA1(5 downto 1)));
    roura_water_lenght_2 <= "00000" & (unsigned(ROURA_VODA2(5 downto 1)));
    mini_water_lenght    <= "000000" & (unsigned(ROURA_VODA1(4 downto 1)));

    process (ZDROJ_VODY1, sig_typ_roury2, ROURA_VODA1, roura_water_lr,
             roura_water_rl, roura_water_lenght_1, first_water_lenght,
             last_water_lenght)
    begin
        if ((sig_typ_roury2 = "0001" OR sig_typ_roury2 = "0011") AND ROURA_VODA1(0) = '1' AND ZDROJ_VODY1 = "0001") then
            roura_water_h <= roura_water_lr;
            roura_water_lenght_h <= roura_water_lenght_1;
            roura_water_h_offset <= to_unsigned(0, 10);
        elsif ((sig_typ_roury2 = "0001" OR sig_typ_roury2 = "0011") AND ROURA_VODA1(0) = '1' AND ZDROJ_VODY1 = "0010") then
            roura_water_h <= roura_water_rl;
            roura_water_lenght_h <= roura_water_lenght_1;
            roura_water_h_offset <= to_unsigned(0, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND (ZDROJ_VODY1 = "0101" OR ZDROJ_VODY1 = "0110")) then
            roura_water_h <= roura_water_lr;
            roura_water_lenght_h <= first_water_lenght;
            roura_water_h_offset <= to_unsigned(0, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND (ZDROJ_VODY1 = "0111" OR ZDROJ_VODY1 = "1000")) then
            roura_water_h <= roura_water_rl;
            roura_water_lenght_h <= first_water_lenght;
            roura_water_h_offset <= to_unsigned(0, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND ROURA_VODA1(5) = '1' AND (ZDROJ_VODY1 = "1001" OR ZDROJ_VODY1 = "1011")) then
            roura_water_h <= roura_water_lr;
            roura_water_lenght_h <= last_water_lenght;
            roura_water_h_offset <= to_unsigned(16, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND ROURA_VODA1(5) = '1' AND (ZDROJ_VODY1 = "1010" OR ZDROJ_VODY1 = "1100")) then
            roura_water_h <= roura_water_rl;
            roura_water_lenght_h <= last_water_lenght;
            roura_water_h_offset <= to_unsigned(16, 10);
        else
            roura_water_h <= '0';
            roura_water_lenght_h <= roura_water_lenght_1;
            roura_water_h_offset <= to_unsigned(0, 10);
        end if;
    end process;

    process (ZDROJ_VODY1, ZDROJ_VODY2, sig_typ_roury2, ROURA_VODA1, ROURA_VODA2,
             roura_water_tb, roura_water_bt, roura_water_lenght_2,
             first_water_lenght, last_water_lenght)
    begin
        if ((sig_typ_roury2 = "0001" OR sig_typ_roury2 = "0011") AND ROURA_VODA2(0) = '1' AND ZDROJ_VODY2 = "0011") then
            roura_water_v <= roura_water_bt;
            roura_water_lenght_v <= roura_water_lenght_2;
            roura_water_v_offset <= to_unsigned(0, 10);
        elsif ((sig_typ_roury2 = "0001" OR sig_typ_roury2 = "0011") AND ROURA_VODA2(0) = '1' AND ZDROJ_VODY2 = "0100") then
            roura_water_v <= roura_water_tb;
            roura_water_lenght_v <= roura_water_lenght_2;
            roura_water_v_offset <= to_unsigned(0, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND ROURA_VODA1(5) = '1' AND (ZDROJ_VODY1 = "0101" OR ZDROJ_VODY1 = "0111")) then
            roura_water_v <= roura_water_bt;
            roura_water_lenght_v <= last_water_lenght;
            roura_water_v_offset <= to_unsigned(16, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND ROURA_VODA1(5) = '1' AND (ZDROJ_VODY1 = "0110" OR ZDROJ_VODY1 = "1000")) then
            roura_water_v <= roura_water_tb;
            roura_water_lenght_v <= last_water_lenght;
            roura_water_v_offset <= to_unsigned(16, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND (ZDROJ_VODY1 = "1010" OR ZDROJ_VODY1 = "1001")) then
            roura_water_v <= roura_water_bt;
            roura_water_lenght_v <= first_water_lenght;
            roura_water_v_offset <= to_unsigned(0, 10);
        elsif (sig_typ_roury2 = "0010" AND ROURA_VODA1(0) = '1' AND (ZDROJ_VODY1 = "1011" OR ZDROJ_VODY1 = "1100")) then
            roura_water_v <= roura_water_tb;
            roura_water_lenght_v <= first_water_lenght;
            roura_water_v_offset <= to_unsigned(0, 10);
        else
            roura_water_v <= '0';
            roura_water_lenght_v <= roura_water_lenght_2;
            roura_water_v_offset <= to_unsigned(0, 10);
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- RIZENI SIGNALU RBG
    ----------------------------------------------------------------------------

    process (CLK)
    begin
        if (rising_edge(CLK)) then
            -- bílé body v rozích obrazovky
            if ((pix_x = 0 AND pix_y = 0) OR (pix_x = 0 AND pix_y = 478) OR
            (pix_x = 638 AND pix_y = 0) OR (pix_x = 639 AND pix_y = 479)) then
                white_point_is_reg <= '1';
            else
                white_point_is_reg <= '0';
            end if;
        end if;
    end process;

    water_is <= (load_water_on and GAME_ON) or -- voda nacitani
                (roura_water_h and sq_cell_on and GAME_ON and not sig_komp_on) or  -- voda roura nevertikalni
                (roura_water_v and sq_cell_on and GAME_ON and not sig_komp_on); -- voda roura vertikalni

    with sig_typ_roury2 select
    game_field_text <= '1' when "0000",
                       '1' when "1001",
                       '1' when "1101",
                       '1' when "1110",
                       '1' when "1111",
                       '0' when others;

    wall_is <= '1' when (sig_typ_roury2 = "1100") else '0';

    kurzor_is <= sig_kurzor and not sig_komp_on;

    process (CLK)
    begin
        if rising_edge(CLK) then
            sq_cell_on_reg      <= sq_cell_on;
            rom_bit_reg         <= rom_bit;
            water_is_reg        <= water_is;
            game_field_text_reg <= game_field_text;
            komp4_is_reg        <= KOMP4_IS;
            wall_is_reg         <= wall_is;
            kurzor_is_reg       <= kurzor_is;
        end if;
    end process;

    -- Nastaveni zobrazovane barvy
    rbg_reg : process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (white_point_is_reg = '1') then -- bílé body v rozích obrazovky
                RGB <= "111";
            elsif (water_is_reg = '1') then -- vykreslování vody
                RGB <= "011";
            elsif (sq_cell_on_reg = '1' AND rom_bit_reg = '1') then
                if (kurzor_is_reg = '1') then -- kurzor
                    RGB <= "101";
                elsif (game_field_text_reg = '1') then -- herni pole a text
                    RGB <= "111";
                elsif (wall_is_reg = '1') then -- zed
                    RGB <= "100";
                elsif (komp4_is_reg = '1') then -- roura k vložení
                    RGB <= "010";
                else -- jiné roury
                    RGB <= "001";
                end if;
            else -- černé pozadí
                RGB <= "000";
            end if;
        end if;
    end process;

end FULL;
