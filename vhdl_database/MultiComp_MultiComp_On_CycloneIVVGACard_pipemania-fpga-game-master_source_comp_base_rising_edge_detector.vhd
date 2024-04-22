--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    RISING_EDGE_DETECTOR
-- AUTHORS: Tomáš Bannert <xbanne00@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RISING_EDGE_DETECTOR is
    Port (
        CLK    : in  std_logic; -- HODINOVY SIGNAL
        VSTUP  : in  std_logic; -- VSTUP
        VYSTUP : out std_logic  -- VYSTUP
    );
end RISING_EDGE_DETECTOR;

architecture Behavioral of RISING_EDGE_DETECTOR is

    signal a : std_logic; -- POMOCNY SIGNAL
    signal b : std_logic; -- POMOCNY SIGNAL
    signal c : std_logic; -- POMOCNY SIGNAL

begin

    process (CLK) -- 2 D FLIP-FLOPS
    begin
        if(rising_edge(CLK)) then
            a <= VSTUP;
            VYSTUP <= b;
        end if;
    end process;

    c <= VSTUP XOR a; -- XOR GATE
    b <= VSTUP AND c; -- AND GATE

end Behavioral;
