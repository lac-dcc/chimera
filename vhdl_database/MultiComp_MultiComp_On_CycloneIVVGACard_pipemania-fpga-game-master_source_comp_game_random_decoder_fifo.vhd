--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    RANDOM_DECODER_FIFO
-- AUTHORS: Vojtěch Jeřábek <xjerab17@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RANDOM_DECODER_FIFO is
    Port(
        CLK           : in  std_logic;
        RST           : in  std_logic;
        GENERATE_NEW  : in  std_logic; -- enable generate one random component
        GENERATE_FIVE : in  std_logic; -- enable generate five random components
        KOMP0         : out std_logic_vector(5 downto 0); -- nejnovejci trubka
        KOMP1         : out std_logic_vector(5 downto 0); --    ||
        KOMP2         : out std_logic_vector(5 downto 0); -- posouva se dolu
        KOMP3         : out std_logic_vector(5 downto 0); --   \/
        KOMP4         : out std_logic_vector(5 downto 0)  -- nejstarsi trubka, vklada se do hraciho pole
    );
end RANDOM_DECODER_FIFO;

architecture Behavioral of RANDOM_DECODER_FIFO is

    signal generate_random      : std_logic;
    signal generate_random_1    : std_logic;
    signal generate_random_2    : std_logic;
    signal fifo_move            : std_logic;
    signal generate_random_five : unsigned(11 downto 0);
    signal fifo_input           : std_logic_vector(3 downto 0);
    signal komp0_sig            : std_logic_vector(5 downto 0);
    signal komp1_sig            : std_logic_vector(5 downto 0);
    signal komp2_sig            : std_logic_vector(5 downto 0);
    signal komp3_sig            : std_logic_vector(5 downto 0);
    signal komp4_sig            : std_logic_vector(5 downto 0);
    signal komp_sig             : std_logic_vector(5 downto 0);

begin

--------------------------------------------------------------------------------
-- vygenerovani 5-ti nahodnych komponent za sebou

    process (CLK, RST)
    begin
        if (RST = '1') then
            generate_random_five <= (others=>'0');
            generate_random_1    <='0';
        elsif(rising_edge(CLK)) then
            if (GENERATE_FIVE='1') then
                generate_random_five <= "000000000001";
                generate_random_1<='0';
            else
                if (generate_random_five=4096) then
                    generate_random_five <= (others=>'0');
                    generate_random_1<='0';
                elsif (generate_random_five=0) then
                    generate_random_1<='0';
                    generate_random_five <= (others=>'0');
                elsif (generate_random_five=237) then
                    generate_random_1<='1';
                    generate_random_five <= generate_random_five + 1;
                elsif (generate_random_five=1638) then
                    generate_random_1<='1';
                    generate_random_five <= generate_random_five + 1;
                elsif (generate_random_five=2484) then
                    generate_random_1<='1';
                    generate_random_five <= generate_random_five + 1;
                elsif (generate_random_five=3186) then
                    generate_random_1<='1';
                    generate_random_five <= generate_random_five + 1;
                elsif (generate_random_five=4001) then
                    generate_random_1<='1';
                    generate_random_five <= generate_random_five + 1;
                else
                    generate_random_1<='0';
                    generate_random_five <= generate_random_five + 1;
                end if;
            end if;
        end if;
    end process;

--------------------------------------------------------------------------------
-- vygenerovani 1 nahodne komponenty

    process (CLK, RST)
    begin
        if (RST = '1') then
            generate_random_2 <= '0';
        elsif (rising_edge(CLK)) then
            if (GENERATE_NEW = '1') then
                generate_random_2 <= '1';
            else
                generate_random_2 <= '0';
            end if;
        end if;
    end process;

--------------------------------------------------------------------------------
-- vygenerovani prirazeni nahodneho cila na KOMP0_sig a posuv ostatnich. KOPM4_sig zanika

    process (CLK, RST)
    begin
        if (RST = '1') then
            komp0_sig <= (others=>'0');
            komp1_sig <= (others=>'0');
            komp2_sig <= (others=>'0');
            komp3_sig <= (others=>'0');
            komp4_sig <= (others=>'0');
        elsif (rising_edge(CLK)) then
            if (fifo_move = '1') then
                komp0_sig <= komp_sig;
                komp1_sig <= komp0_sig;
                komp2_sig <= komp1_sig;
                komp3_sig <= komp2_sig;
                komp4_sig <= komp3_sig;
            end if;
        end if;
    end process;

    KOMP0 <= komp0_sig;
    KOMP1 <= komp1_sig;
    KOMP2 <= komp2_sig;
    KOMP3 <= komp3_sig;
    KOMP4 <= komp4_sig;

--------------------------------------------------------------------------------
-- prepocet kombinacni logiky nahodneho cisla

    with fifo_input select
    komp_sig <= "000001" when "0000",
                "000001" when "0001",
                "010001" when "0010",
                "010001" when "0011", --rovne trubky

                "000010" when "0100",
                "010010" when "0101",
                "100010" when "0110",
                "110010" when "0111", --zahla trubka

                "000011" when "1000",
                "000011" when "1001", --kriz, je 2x kvuli lepsi cetnosti

                "111111" when "1111",
                "000000" when others;

--------------------------------------------------------------------------------
-- instancovani komponenty RANDOM_GENERATOR

    random_generator_i: entity work.RANDOM_GENERATOR
    generic map (
        Number_of_options => 10,
        Flip_Flops        => 4
    )
    port map (
        CLK          => CLK,
        RST          => RST,
        RANDOM_PULSE => generate_random,
        RANDOM_OUT   => fifo_input,
        ENABLE_OUT   => fifo_move
    );

    generate_random <= generate_random_1 OR generate_random_2;

end Behavioral;
