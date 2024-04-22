--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    BRAM_SYNC_TDP
-- AUTHORS: Jakub Cabal <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

-- BRAM_SYNC_TDP is optimized for Altera Cyclone IV BRAM!

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BRAM_SYNC_TDP is
    Generic (
        DATA_WIDTH : integer := 32; -- Sirka datoveho vstupu a vystupu
        ADDR_WIDTH : integer := 9   -- Sirka adresove sbernice, urcuje take pocet polozek v pameti (2^ADDR_WIDTH)
    );
    Port (
        CLK       : in  std_logic;
        -- Port A
        WE_A      : in  std_logic;
        ADDR_A    : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        DATAIN_A  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        DATAOUT_A : out std_logic_vector(DATA_WIDTH-1 downto 0);
        -- Port B
        WE_B      : in  std_logic;
        ADDR_B    : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        DATAIN_B  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        DATAOUT_B : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end BRAM_SYNC_TDP;

architecture FULL of BRAM_SYNC_TDP is

    type ram_t is array((2**ADDR_WIDTH)-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
    shared variable ram : ram_t := (others => (others => '0'));

begin

    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (WE_A = '1') then
                ram(to_integer(unsigned(ADDR_A))) := DATAIN_A;
            end if;
            DATAOUT_A <= ram(to_integer(unsigned(ADDR_A)));
        end if;
    end process;

    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (WE_B = '1') then
                ram(to_integer(unsigned(ADDR_B))) := DATAIN_B;
            end if;
            DATAOUT_B <= ram(to_integer(unsigned(ADDR_B)));
        end if;
    end process;

end FULL;
