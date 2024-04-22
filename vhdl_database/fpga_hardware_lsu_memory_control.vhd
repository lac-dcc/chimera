use work.lsu_defs;

entity mem_request_switch is

    port
        ( clock        : std_logic
        ; requests_all : request_batch_t
        ; requests_1   : request_batch_part_t
        ; requests_2   : request_batch_part_t
        );

end mem_request_switch;

architecture Behavioral of mem_request_switch is

begin


end Behavioral;
