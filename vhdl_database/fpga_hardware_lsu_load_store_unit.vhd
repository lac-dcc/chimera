library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.defines.all;
use work.lsu_defs.all;

entity load_store_unit is
  Port ( -- Input wires
         clock : in std_logic;
         request_sram_bus_read_in : in  std_logic;
         request_sram_bus_write_in : in  std_logic;
         register_file_select_in : in barrel_row_t;
         sp_sram_bus_addresses_in : in sp_sram_addresses_t;
         sp_sram_bus_datas_in : in sp_sram_datas_t;

         -- Memory wires
         sram_bus_data_1_inout : inout sram_bus_data_t;
         sram_bus_control_1_out : out sram_bus_control_t;
         sram_bus_data_2_inout : inout sram_bus_data_t;
         sram_bus_control_2_out : out sram_bus_control_t;
         memory_request_out : out std_logic;

         -- Streaming processor wires
         registers_file_select_out : out barrel_row_t;
         registers_write_enable_out : out  std_logic;
         sp_sram_bus_data_out : out sp_sram_datas_t );
end load_store_unit;

architecture Behavioral of load_store_unit is

    signal requests_all       : request_batch_t;

    signal requests_even      : request_batch_part_t;
    signal mem_request_even   : std_logic;
    signal mem_queue_top_even : request_t;
    signal read_response_even : read_response_t;

    signal requests_odd       : request_batch_part_t;
    signal mem_request_odd   : std_logic;
    signal mem_queue_top_odd  : request_t;
    signal read_response_odd  : read_response_t;

    signal mem_request_accept : std_logic;

    signal mem_write_enable      : std_logic;
    signal writeback_barrel_line : barrel_row_t;

    signal sp_sram_bus_data_out_i : sp_sram_datas_t;

    function to_request_batch_t
        ( addresses    : sp_sram_addresses_t
        ; write_data   : sp_sram_datas_t
        )
        return request_batch_t
        is
            variable requests : request_batch_t;
        begin
            for i in sp_sram_addresses_t'range loop
                requests(i) :=
                    ( valid        => '1'
                    , address      => addresses(i)
                    , write_data   => write_data(i)
                    );
            end loop;
            return requests;
    end function;

begin
    -- Set output enable. It's overrided automatically when writing.
    -- (Cannot. Output-enable is not exposed.)

    -- Serialize requests into records.
    requests_all <= to_request_batch_t ( sp_sram_bus_addresses_in
                                       , sp_sram_bus_datas_in
                                       );

    -- Signal for detecting request.
    mem_request_accept <= request_sram_bus_read_in or request_sram_bus_write_in;
    
    -- Signal to request memory access from arbiter
    memory_request_out <= mem_request_odd or mem_request_even;

    global_setup:
        process (clock) begin
            if rising_edge(clock) then
                if mem_request_accept = '1' then
                    mem_write_enable      <= request_sram_bus_write_in;
                end if;

                if request_sram_bus_read_in = '1' then
                  writeback_barrel_line <= register_file_select_in;
                end if;
            end if;
        end process;

    mem_static_switch:
        for i in request_batch_part_t'range generate
            requests_even(i) <= requests_all(i*2);
            requests_odd(i)  <= requests_all(i*2+1);
        end generate;

    mem_queue_even:
        entity work.mem_queue
            port map
                ( clock       => clock
                , accept      => mem_request_accept
                , requests    => requests_even
                , top_request => mem_queue_top_even
                );


    mem_queue_odd:
        entity work.mem_queue
            port map
                ( clock       => clock
                , accept      => mem_request_accept
                , requests    => requests_odd
                , top_request => mem_queue_top_odd
                );


    mem_control_even:
        entity work.mem_control
            port map
                ( clock          => clock
                , request_packet => mem_queue_top_even
                , write_enable   => mem_write_enable
                , read_response  => read_response_even
                , mem_request    => mem_request_even

                , ram_control    => sram_bus_control_1_out
                , ram_data       => sram_bus_data_1_inout
                );


    mem_control_odd:
        entity work.mem_control
            port map
                ( clock          => clock
                , request_packet => mem_queue_top_odd
                , write_enable   => mem_write_enable
                , read_response  => read_response_odd
                , mem_request    => mem_request_odd

                , ram_control    => sram_bus_control_2_out
                , ram_data       => sram_bus_data_2_inout
                );

    -- Deserialize record for output
    process (clock) begin
        if rising_edge(clock) then
            registers_write_enable_out <= read_response_even.valid and read_response_odd.valid;

            sp_sram_bus_data_out_i(0) <= read_response_even.data;
            sp_sram_bus_data_out_i(1) <= read_response_odd.data;

            if sp_sram_datas_t'high > 2 then
              for i in 1 to (sp_sram_datas_t'high/2) loop
                  sp_sram_bus_data_out_i(i*2)   <= sp_sram_bus_data_out_i((i-1)*2);
                  sp_sram_bus_data_out_i(i*2+1) <= sp_sram_bus_data_out_i((i-1)*2+1);
              end loop;
            end if;
        end if;
    end process;

    registers_file_select_out <= writeback_barrel_line;
    sp_sram_bus_data_out <= sp_sram_bus_data_out_i;


end Behavioral;
