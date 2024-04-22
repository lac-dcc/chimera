--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    CELL_GENERATOR
-- AUTHORS: Jakub Cabal    <jakubcabal@gmail.com>
--          Ondřej Dujiček <xdujic02@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity KURZOR_CTRL is
    Port (
        CLK          : in  std_logic; -- Vychozi hodinovy signal
        RST          : in  std_logic; -- Vychozi synchronni reset
        KEY_W        : in  std_logic; -- Signal znacici zmacknuti tlacitka W
        KEY_S        : in  std_logic; -- Signal znacici zmacknuti tlacitka S
        KEY_A        : in  std_logic; -- Signal znacici zmacknuti tlacitka A
        KEY_D        : in  std_logic; -- Signal znacici zmacknuti tlacitka D
        KEY_SPACE    : in  std_logic; -- Signal znacici zmacknuti tlacitka SPACE
        KOMP_GEN     : out std_logic; -- Generuj novou nahodnou komponentu
        KURZOR_ADDR  : out std_logic_vector(7 downto 0);  -- Adresa pozice kurzoru
        DATAIN       : in  std_logic_vector(31 downto 0); -- Vstupni data
        DATAOUT      : out std_logic_vector(31 downto 0); -- Vystupni data
        ADDR         : out std_logic_vector(7 downto 0);  -- Vystupni data
        WE           : out std_logic; -- Write enable
        EN           : out std_logic; -- Enable pameti
        ACK          : in  std_logic; -- Potvrzeni zapisoveho nebo cteciho prikazu
        KOMP4        : in  std_logic_vector (5 downto 0);
        CANT_PLACE   : out std_logic;
        CAN_PLACE    : out std_logic;
        SCREEN_CODE  : in  std_logic_vector(2 downto 0); -- game screen code
        GAME_ON      : in  std_logic
    );
end KURZOR_CTRL;

architecture FULL of KURZOR_CTRL is

    type rom_t is array (15 downto 0) of std_logic_vector(15 downto 0);

    constant LEVEL2_MAP : rom_t := (
        "1111111111111111",
        "1111111111111111",
        "1111111111111111",
        "1100001000000000",
        "1100001000000000",
        "1100001000000000",
        "1100001000000000",
        "1100001000000000",
        "1100001000010000",
        "1100001000010000",
        "1100001000010000",
        "1100000000010000",
        "1100000000010000",
        "1100000000010000",
        "1100000000010000",
        "1100000000010000"
    );

    constant LEVEL3_MAP : rom_t := (
        "1111111111111111",
        "1111111111111111",
        "1111111111111111",
        "1100000100000000",
        "1100000100000000",
        "1100000100000000",
        "1111000100111000",
        "1100000100100000",
        "1100000100100000",
        "1100000100100000",
        "1100000100100000",
        "1100000100100000",
        "1100011100100011",
        "1100000000100000",
        "1100000000100000",
        "1100000000100000"
    );

    constant LEVEL4_MAP : rom_t := (
        "1111111111111111",
        "1111111111111111",
        "1111111111111111",
        "1100000100000000",
        "1100100100111100",
        "1100100100000000",
        "1100000100100111",
        "1100000100100000",
        "1100100100100000",
        "1100100100100100",
        "1100000100100100",
        "1100000100100000",
        "1111100100100000",
        "1100000000100100",
        "1100111100100100",
        "1100000000100000"
    );

    signal sig_kurzor_addr   : std_logic_vector(7 downto 0);
    signal kurzor_x          : unsigned(3 downto 0);
    signal kurzor_y          : unsigned(3 downto 0);
    signal uprdownl          : std_logic_vector(3 downto 0);

    signal reset_en          : std_logic;

    signal gen_addr          : unsigned(7 downto 0);
    signal gen_en            : std_logic;
    signal gen_ok            : std_logic;

    signal lvl_gen           : std_logic;

    signal lvl2_row          : std_logic_vector(15 downto 0);
    signal lvl2_wall         : std_logic;
    signal lvl2_komp         : std_logic_vector(1 downto 0);

    signal lvl3_row          : std_logic_vector(15 downto 0);
    signal lvl3_wall         : std_logic;
    signal lvl3_komp         : std_logic_vector(1 downto 0);

    signal lvl4_row          : std_logic_vector(15 downto 0);
    signal lvl4_wall         : std_logic;
    signal lvl4_komp         : std_logic_vector(1 downto 0);

    type state is (wait_on_key, read_cell_data, data_check, pipe_insert,
                   reset_memory, lvl2_gen, lvl3_gen, lvl4_gen);
    signal present_st : state;
    signal next_st    : state;

    constant zeros_22 : std_logic_vector(21 downto 0) := (others => '0');

begin

    ----------------------------------------------------------------------------
    -- RIZENI KURZORU
    ----------------------------------------------------------------------------

    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (GAME_ON = '1') then
                if (KEY_W = '1' AND kurzor_y > 0) then
                    kurzor_y <= kurzor_y - 1;
                elsif (KEY_S = '1' AND kurzor_y < 12) then
                    kurzor_y <= kurzor_y + 1;
                elsif (KEY_A = '1' AND kurzor_x > 0) then
                    kurzor_x <= kurzor_x - 1;
                elsif (KEY_D = '1' AND kurzor_x < 13) then
                    kurzor_x <= kurzor_x + 1;
                end if;
            else
                kurzor_x <= "0000";
                kurzor_y <= "0000";
            end if;
        end if;
    end process;

    sig_kurzor_addr <= std_logic_vector(kurzor_y & kurzor_x);
    KURZOR_ADDR     <= sig_kurzor_addr;

    ----------------------------------------------------------------------------
    -- VKLADANI ROUR - STAVOVY AUTOMAT
    ----------------------------------------------------------------------------

    -- Pametova cast stavoveho automatu
    process (CLK, RST)
    begin
        if (RST = '1') then
            present_st <= reset_memory;
        elsif (rising_edge(CLK)) then
            if (SCREEN_CODE = "000") then
                present_st <= reset_memory;
            else
                present_st <= next_st;
            end if;
        end if;
    end process;

    -- Rozhodovaci cast stavoveho automatu
    process (present_st, KEY_SPACE, ACK, DATAIN, GAME_ON, SCREEN_CODE, gen_ok)
    begin
        case present_st is

            when wait_on_key => -- cekani na stisk klavesy
                if (KEY_SPACE = '1' AND GAME_ON = '1') then
                    next_st <= read_cell_data;
                elsif (SCREEN_CODE = "100") then
                    next_st <= lvl2_gen;
                elsif (SCREEN_CODE = "101") then
                    next_st <= lvl3_gen;
                elsif (SCREEN_CODE = "110") then
                    next_st <= lvl4_gen;
                else
                    next_st <= wait_on_key;
                end if;

            when read_cell_data => -- vycteni dat o vybranem policku
                if (ACK = '1') then
                    next_st <= data_check;
                elsif (SCREEN_CODE = "100") then
                    next_st <= lvl2_gen;
                elsif (SCREEN_CODE = "101") then
                    next_st <= lvl3_gen;
                elsif (SCREEN_CODE = "110") then
                    next_st <= lvl4_gen;
                else
                    next_st <= read_cell_data;
                end if;

            when data_check => -- kontrola vyctenych dat
                if (DATAIN(3 downto 0) = "0000") then
                    next_st <= pipe_insert;
                elsif (SCREEN_CODE = "100") then
                    next_st <= lvl2_gen;
                elsif (SCREEN_CODE = "101") then
                    next_st <= lvl3_gen;
                elsif (SCREEN_CODE = "110") then
                    next_st <= lvl4_gen;
                else
                    next_st <= wait_on_key;
                end if;

            when pipe_insert => -- vlozeni trubky (zapis dat do pameti)
                if (ACK = '1') then
                    next_st <= wait_on_key;
                elsif (SCREEN_CODE = "100") then
                    next_st <= lvl2_gen;
                elsif (SCREEN_CODE = "101") then
                    next_st <= lvl3_gen;
                elsif (SCREEN_CODE = "110") then
                    next_st <= lvl4_gen;
                else
                    next_st <= pipe_insert;
                end if;

            when reset_memory => -- resetovani pameti
                if (gen_ok = '1') then
                    next_st <= wait_on_key;
                else
                    next_st <= reset_memory;
                end if;

            when lvl2_gen => -- generovani lvl2
                if (gen_ok = '1') then
                    next_st <= wait_on_key;
                else
                    next_st <= lvl2_gen;
                end if;

            when lvl3_gen => -- generovani lvl3
                if (gen_ok = '1') then
                    next_st <= wait_on_key;
                else
                    next_st <= lvl3_gen;
                end if;

            when lvl4_gen => -- generovani lvl4
                if (gen_ok = '1') then
                    next_st <= wait_on_key;
                else
                    next_st <= lvl4_gen;
                end if;

            when others =>
                next_st <= wait_on_key;

        end case;
    end process;

    -- Vystupni cast stavoveho automatu
    process (present_st, KOMP4, sig_kurzor_addr, uprdownl, DATAIN,
             gen_addr, lvl2_komp, lvl3_komp, lvl4_komp)
    begin
        case present_st is

            when wait_on_key =>
                EN       <= '0';
                WE       <= '0';
                ADDR     <= sig_kurzor_addr;
                DATAOUT  <= (others=>'0');
                KOMP_GEN <= '0';
                reset_en <= '0';
                lvl_gen  <= '0';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '0';

            when read_cell_data =>
                EN       <= '1';
                WE       <= '0';
                ADDR     <= sig_kurzor_addr;
                DATAOUT  <= (others=>'0');
                KOMP_GEN <= '0';
                reset_en <= '0';
                lvl_gen  <= '0';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '0';

            when data_check =>
                EN       <= '0';
                WE       <= '0';
                ADDR     <= sig_kurzor_addr;
                DATAOUT  <= (others=>'0');
                KOMP_GEN <= '0';
                reset_en <= '0';
                lvl_gen  <= '0';
                CAN_PLACE  <= '0';
                if (DATAIN(3 downto 0) = "0000") then
                    CANT_PLACE <= '0';
                else
                    CANT_PLACE <= '1';
                end if;

            when pipe_insert =>
                EN       <= '1';
                WE       <= '1';
                ADDR     <= sig_kurzor_addr;
                DATAOUT  <= zeros_22 & uprdownl & KOMP4;
                KOMP_GEN <= '1';
                reset_en <= '0';
                lvl_gen  <= '0';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '1';

            when reset_memory =>
                EN       <= '1';
                WE       <= '1';
                ADDR     <= std_logic_vector(gen_addr);
                DATAOUT  <= (others=>'0');
                KOMP_GEN <= '0';
                reset_en <= '1';
                lvl_gen  <= '0';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '0';

            when lvl2_gen => -- generovani levlu 2
                EN       <= '1';
                WE       <= '1';
                ADDR     <= std_logic_vector(gen_addr);
                DATAOUT  <= "0000000000000000000000000000" & lvl2_komp & "00";
                KOMP_GEN <= '0';
                reset_en <= '0';
                lvl_gen  <= '1';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '0';

            when lvl3_gen => -- generovani levlu 3
                EN       <= '1';
                WE       <= '1';
                ADDR     <= std_logic_vector(gen_addr);
                DATAOUT  <= "0000000000000000000000000000" & lvl3_komp & "00";
                KOMP_GEN <= '0';
                reset_en <= '0';
                lvl_gen  <= '1';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '0';

            when lvl4_gen => -- generovani levlu 4
                EN       <= '1';
                WE       <= '1';
                ADDR     <= std_logic_vector(gen_addr);
                DATAOUT  <= "0000000000000000000000000000" & lvl4_komp & "00";
                KOMP_GEN <= '0';
                reset_en <= '0';
                lvl_gen  <= '1';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '0';

            when others =>
                EN      <= '0';
                WE      <= '0';
                ADDR    <= sig_kurzor_addr;
                DATAOUT <= (others=>'0');
                KOMP_GEN <= '0';
                reset_en <= '0';
                lvl_gen  <= '0';
                CANT_PLACE <= '0';
                CAN_PLACE  <= '0';

        end case;
    end process;

    with KOMP4 select
        uprdownl <= "0011" when "100010", -- zahnuta zprava nahoru
                    "1100" when "000010", -- zahnuta zleva dolu
                    "1001" when "010010", -- zahnuta zleva nahoru
                    "0110" when "110010", -- zahnuta zprava dolu
                    "1010" when "000001", -- rovna zleva doprava
                    "0101" when "010001", -- rovna zhora dolu
                    "1111" when "000011", -- krizova
                    "0000" when others;
                    --LDRU

    ----------------------------------------------------------------------------
    -- GENERATE ADDRESS COUNTER AND OK FLAG
    ----------------------------------------------------------------------------

    gen_en <= lvl_gen or reset_en;

    process (CLK)
    begin
        if rising_edge(CLK) then
            if (gen_en = '1') then
                gen_addr <= gen_addr + 1;
            else
                gen_addr <= (others=>'0');
            end if;
        end if;
    end process;

    gen_ok <= '1' when (gen_addr = "11111111") else '0';

    ----------------------------------------------------------------------------
    -- LEVEL 2 ROM
    ----------------------------------------------------------------------------

    lvl2_row  <= LEVEL2_MAP(to_integer(gen_addr(7 downto 4)));
    lvl2_wall <= lvl2_row(to_integer(gen_addr(3 downto 0)));
    lvl2_komp <= "11" when (lvl2_wall = '1') else "00";

    ----------------------------------------------------------------------------
    -- LEVEL 3 ROM
    ----------------------------------------------------------------------------

    lvl3_row  <= LEVEL3_MAP(to_integer(gen_addr(7 downto 4)));
    lvl3_wall <= lvl3_row(to_integer(gen_addr(3 downto 0)));
    lvl3_komp <= "11" when (lvl3_wall = '1') else "00";

    ----------------------------------------------------------------------------
    -- LEVEL 4 ROM
    ----------------------------------------------------------------------------

    lvl4_row  <= LEVEL4_MAP(to_integer(gen_addr(7 downto 4)));
    lvl4_wall <= lvl4_row(to_integer(gen_addr(3 downto 0)));
    lvl4_komp <= "11" when (lvl4_wall = '1') else "00";

end FULL;
