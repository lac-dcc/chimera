--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    RESET_SYNC
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RESET_SYNC is
    Port (
        CLK       : in  std_logic; -- Clock
        ASYNC_RST : in  std_logic; -- High active async reset input
        OUT_RST   : out std_logic  -- High active sync async reset output
    );
end RESET_SYNC;

architecture FULL of RESET_SYNC is

    signal meta_reg  : std_logic;
    signal reset_reg : std_logic;

begin

    process (CLK, ASYNC_RST)
    begin
        if (ASYNC_RST = '1') then
            meta_reg  <= '1';
            reset_reg <= '1';
        elsif (rising_edge(CLK)) then
            meta_reg  <= '0';
            reset_reg <= meta_reg;
        end if;
    end process;

    OUT_RST <= reset_reg;

end FULL;
