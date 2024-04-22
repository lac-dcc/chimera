--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    BRAM_SYNC_TDP_TB
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BRAM_SYNC_TDP_TB is
end BRAM_SYNC_TDP_TB;

architecture behavior of BRAM_SYNC_TDP_TB is

    -- CLK and RST
    signal CLK       : STD_LOGIC := '0';
    signal WE_A      : STD_LOGIC := '0';

    -- Block memory signals
    signal ADDR_A    : STD_LOGIC_VECTOR(9 downto 0)  := (others => '0');
    signal DATAIN_A  : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal DATAOUT_A : STD_LOGIC_VECTOR(15 downto 0);

    -- Clock period definitions
    constant CLK_period : time := 10 ns;

begin

    uut : entity work.BRAM_SYNC_TDP
    port map (
        -- Port A
        CLK       => CLK,
        WE_A      => WE_A,
        ADDR_A    => ADDR_A,
        DATAIN_A  => DATAIN_A,
        DATAOUT_A => DATAOUT_A,
        -- Port B
        WE_A      => '0',
        ADDR_A    => (others => '0'),
        DATAIN_A  => (others => '0'),
        DATAOUT_A => open
    );

    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    sim_proc : process
    begin

        wait for 100 ns;

        wait until rising_edge(CLK);
        WE_A <= '1';
        ADDR_A <= "0000011111";
        DATAIN_A <= "1111111111000000";

        wait until rising_edge(CLK);
        WE_A <= '0';
        ADDR_A <= "0000011110";

        wait until rising_edge(CLK);
        WE_A <= '0';
        ADDR_A <= "0000011111";

        wait;
    end process;

end;
