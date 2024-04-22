--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    FALLING_EDGE_DETECTOR
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FALLING_EDGE_DETECTOR is
    Port (
        CLK    : in  std_logic; -- Hodinovy signal
        VSTUP  : in  std_logic; -- Vstup na detekci sestupne hrany
        VYSTUP : out std_logic  -- Aktivni, pokud byla detekovana sestupna hrana
    );
end FALLING_EDGE_DETECTOR;

architecture FULL of FALLING_EDGE_DETECTOR is

    signal predchozi_vstup : std_logic;
    signal sig_vystup      : std_logic;

begin

    -- Registr, ktery uchovava hodnotu vstupu z predchoziho taktu
    process (CLK)
    begin
        if (rising_edge(CLK)) then
            predchozi_vstup <= VSTUP;
            VYSTUP          <= sig_vystup;
        end if;
    end process;

    sig_vystup <= NOT vstup AND predchozi_vstup;

end FULL;
