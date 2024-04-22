library ieee;
use ieee.std_logic_1164.all;
use work.lsu_defs.all;

entity mem_queue_cell is

    port
        ( clock   : in  std_logic
        ; set     : in  std_logic
        ; set_val : in  request_t
        ; source  : in  request_t
        ; output  : out request_t
        );

end mem_queue_cell;

-- On clock-rise, latch source, unless set_val is active.
-- If it is, latch set_val.
--
-- This intended use for this entity is to build a shift
-- register converting a parallel signal to serial.
architecture Behavioral of mem_queue_cell is

begin

    cell_update:
        process (clock) begin
            if rising_edge(clock) then
                if set = '1' then
                    output <= set_val;
                else
                    output <= source;
                end if;
            end if;
        end process;

end Behavioral;
