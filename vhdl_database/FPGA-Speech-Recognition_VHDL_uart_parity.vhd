library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART_PARITY is
    Generic (
        DATA_WIDTH  : integer := 8;
        PARITY_TYPE : string  := "none" -- legal values: "none", "even", "odd", "mark", "space"
    );
    Port (
        DATA_IN     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        PARITY_OUT  : out std_logic
    );
end UART_PARITY;

architecture FULL of UART_PARITY is

begin

    -- -------------------------------------------------------------------------
    -- PARITY BIT GENERATOR
    -- -------------------------------------------------------------------------

    even_parity_g : if (PARITY_TYPE = "even") generate

        process (DATA_IN)
        	variable parity_temp : std_logic;
        begin
            parity_temp := '0';
            for i in DATA_IN'range loop
                parity_temp := parity_temp XOR DATA_IN(i);
            end loop;
            PARITY_OUT <= parity_temp;
        end process;

    end generate;

    odd_parity_g : if (PARITY_TYPE = "odd") generate

        process (DATA_IN)
        	variable parity_temp : std_logic;
        begin
            parity_temp := '1';
            for i in DATA_IN'range loop
                parity_temp := parity_temp XOR DATA_IN(i);
            end loop;
            PARITY_OUT <= parity_temp;
        end process;

    end generate;

    mark_parity_g : if (PARITY_TYPE = "mark") generate

        PARITY_OUT <= '1';

    end generate;

    space_parity_g : if (PARITY_TYPE = "space") generate

        PARITY_OUT <= '0';

    end generate;

end FULL;
