--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    RANDOM_GENERATOR
-- AUTHORS: Vojtěch Jeřábek <xjerab17@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RANDOM_GENERATOR is
    generic (
        NUMBER_OF_OPTIONS : natural := 12; -- z kolika nahodnych moznosti chete vybirat.
        FLIP_FLOPS        : natural := 4   -- FLIP_FLOPS = (log(Number_of_options)/log(2)) zaokrouhlujte nahoru
    );
    Port (
        CLK          : in  std_logic;
        RST          : in  std_logic;
        RANDOM_PULSE : in  std_logic; -- pro provedeni nahodne generace sem privedte enable signal
        RANDOM_OUT   : out std_logic_vector(FLIP_FLOPS-1 downto 0); -- vygenerovana nahodna hodnota
        ENABLE_OUT   : out std_logic
    );
end RANDOM_GENERATOR;

architecture Behavioral of RANDOM_GENERATOR is

    signal 	counter  : unsigned(FLIP_FLOPS-1 downto 0); -- citac pro vyber nahodneho cisla
    signal 	divider2 : std_logic; -- zde je clk/2

begin

--------------------------------------------------------------------------------
    -- vydeleni CLK dvema

    divider2_p : process (CLK, RST)
    begin
        if (RST = '1') then
            divider2 <= '0';
        elsif (falling_edge(CLK)) then
            divider2 <= NOT divider2;
        end if;
    end process;

--------------------------------------------------------------------------------
    -- na counteru se pocita od nuly do (FLIP_FLOPS-1)

    counter_p : process (CLK, RST)
    begin
        if (RST='1') then
            counter <= (others=>'0');
        elsif (rising_edge(CLK)) then
            if (divider2 = '1') then
                if (counter = (NUMBER_OF_OPTIONS-1)) then
                    counter <= (others=>'0');
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process;

--------------------------------------------------------------------------------
    -- pokud je na RANDOM_PULSE log. 1, objevi se na RANDOM_OUT aktualni
    -- hodnota counteru

    random_out_reg : process (CLK, RST)
    begin
        if (RST='1') then
            RANDOM_OUT <= (others=>'0');
        elsif (rising_edge(CLK)) then
            if (RANDOM_PULSE = '1') then
                RANDOM_OUT <= std_logic_vector(counter);
            end if;
        end if;
    end process;

    enable_out_reg : process (CLK, RST)
    begin
        if (RST='1') then
            ENABLE_OUT <='0';
        elsif (rising_edge(CLK)) then
            if (RANDOM_PULSE = '1') then
                ENABLE_OUT <='1';
            else
                ENABLE_OUT <='0';
            end if;
        end if;
    end process;

end Behavioral;
