library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defines.all;

entity video_fifo is

    port
        ( clock_write   : in     std_logic
        ; clock_read    : in     std_logic
        
        ; write_accept  : buffer std_logic
        ; write_enable  : in     std_logic
        ; write_data    : in     word_t
        
        ; read_data     : out    word_t
        );

end video_fifo;

architecture Behavioral of video_fifo is
    subtype ram_cell_t is std_logic_vector(15 downto 0);
    type ram_t is array (0 to 127) of ram_cell_t;

    signal ram : ram_t;
    
    signal write_position : unsigned(6 downto 0) := to_unsigned(0, 7);
    signal read_position  : unsigned(6 downto 0) := to_unsigned(0, 7);
begin

    choke_process:
        process (write_position, read_position)
        begin
            if write_position = read_position then
                write_accept <= '0';
            else
                write_accept <= '1';
            end if;
        end process;

    write_process:
        process (clock_write)
        begin
            if rising_edge(clock_write) then
                if write_accept = '1' and write_enable = '1' then
                    ram(to_integer(write_position)) <= write_data;

                    write_position <= write_position + 1;
                end if;
            end if;
        end process;

    read_process:
        process (clock_read) begin
            if rising_edge(clock_read) then
                read_data <= ram(to_integer(read_position));

                read_position <= read_position + 1;
            end if;
        end process;

end Behavioral;
