--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    DEBOUNCER
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEBOUNCER is
    Port (
        CLK  : in  std_logic; -- Clock
        RST  : in  std_logic; -- High active asynchronous reset
        DIN  : in  std_logic; -- Data input
        DOUT : out std_logic  -- Debounced data output
    );
end DEBOUNCER;

architecture FULL of DEBOUNCER is

    signal data_shreg   : std_logic_vector(3 downto 0);
    signal data_deb_reg : std_logic;

begin

    DOUT <= data_deb_reg;

    process (CLK, RST)
    begin
        if (RST = '1') then
            data_shreg   <= (others => '0');
            data_deb_reg <= '0';
        elsif (rising_edge(CLK)) then
            data_shreg   <= data_shreg(2 downto 0) & DIN;
            data_deb_reg <= data_shreg(0) AND data_shreg(1) AND
                            data_shreg(2) AND data_shreg(3);
        end if;
    end process;

end FULL;
