library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defines.all;
use work.lsu_defs.all;

entity mem_request_switch is

    port
        ( requests_all  : in  request_batch_t
        ; requests_even : out request_batch_part_t
        ; requests_odd  : out request_batch_part_t
        );

end mem_request_switch;

architecture Behavioral of mem_request_switch is

begin

    static_switch:
        for i in request_batch_part_t'range generate
            requests_even(i) <= requests_all(i*2);
            requests_odd(i)  <= requests_all(i*2+1);
        end generate;

end Behavioral;
