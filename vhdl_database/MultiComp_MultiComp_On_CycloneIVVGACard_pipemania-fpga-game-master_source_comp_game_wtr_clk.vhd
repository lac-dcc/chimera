--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    WTR_CLK
-- AUTHORS: Ondřej Dujíček  <xdujic02@stud.feec.vutbr.cz>
--          Vojtěch Jeřábek <xjerab17@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity WTR_CLK is
    generic (
        FLIP_FLOPS : natural := 26
    );
    Port (
        CLK        : in  std_logic;
        RST        : in  std_logic;
        CLOCK_DEFI : in  std_logic_vector(FLIP_FLOPS-1 downto 0);
        ENABLE_OUT : out std_logic
    );
end WTR_CLK;

architecture Behavioral of WTR_CLK is

    signal counter_p : std_logic_vector(FLIP_FLOPS-1 downto 0);

begin

    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                ENABLE_OUT <= '1';
                counter_p  <= (others=>'0');
            else
                if (counter_p = clock_defi) then
                    ENABLE_OUT <= '1';
                    counter_p  <= (others=>'0');
                else
                    ENABLE_OUT <= '0';
                    counter_p  <= counter_p+1;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
