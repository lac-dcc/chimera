library ieee;
use ieee.std_logic_1164.all;
use work.lsu_defs.all;

entity mem_queue is

    port
        ( clock        : in  std_logic
        ; accept       : in  std_logic
        ; requests     : in  request_batch_part_t
        ; top_request  : out request_t
        );

end mem_queue;

architecture Behavioral of mem_queue is

    type queue_t is array (-1 to request_batch_part_t'high) of request_t;
    signal queue : queue_t;

begin

    top_request <= queue(queue_t'high);

    queue(-1) <= ( valid       => '0'
                 , address     => (others => '-')
                 , write_data  => (others => '-')
                 );

    shift_registers:
        for i in request_batch_part_t'range generate
            mem_queue_cell:
                entity work.mem_queue_cell
                    port map
                        ( clock   => clock
                        , set     => accept 
                        , set_val => requests(i)
                        , source  => queue(i-1) 
                        , output  => queue(i)
                        );
        end generate;

end Behavioral;
