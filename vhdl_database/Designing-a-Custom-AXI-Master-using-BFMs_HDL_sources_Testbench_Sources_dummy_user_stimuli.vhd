library IEEE;
use IEEE.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity dummy_user is
    Generic
        (
        data_width : integer range 32 to 64 := 32
        );
    Port
        (
        -- User signals
        clk                 : in  std_logic;
        resetn              : in  std_logic;
        go                  : out std_logic;
        error               : in  std_logic;
        RNW                 : out std_logic;
        busy                : in  std_logic;
        done                : in  std_logic;
        address             : out std_logic_vector(31 downto 0);
        write_data          : out std_logic_vector(data_width-1 downto 0);
        read_data           : in  std_logic_vector(data_width-1 downto 0);
        burst_length        : out std_logic_vector(7 downto 0); -- number of beats in a burst
        burst_size          : out std_logic_vector(6 downto 0); -- number of byte lanes in each beat
        increment_burst     : out std_logic; -- 1 = incrementing addresses, 0 = mailbox / fifo style writes
        clear_data_fifos    : out std_logic;
        write_fifo_en       : out std_logic;
        write_fifo_empty    : in  std_logic;
        write_fifo_full     : in  std_logic;
        read_fifo_en        : out std_logic;
        read_fifo_empty     : in  std_logic;
        read_fifo_full      : in  std_logic
        );
end dummy_user;

architecture Behavioral of dummy_user is

-- Type declarations
type main_fsm_type is (reset_state, idle, fill_write_fifo, empty_read_fifo, read_transaction, write_transaction, adjust_burst_length, complete, delay, wait_for_done_error, temp_wait, error_state);
type previous_state_array is array (1 to 9) of main_fsm_type;

signal current_state : main_fsm_type := reset_state;
signal next_state : main_fsm_type := reset_state;
signal previous_states : previous_state_array;
signal transaction_address : std_logic_vector(31 downto 0);
signal burst_size_integer : integer := 0;
signal fifo_write_counter : integer := 0;
signal fifo_write_loop : integer := 0;
signal counter : integer range 0 to 1024 := 0;
signal clear_counter : std_logic;
signal enable_counter : std_logic;
signal burst_length_counter : integer range 0 to 256 := 0;
signal clear_burst_length_counter : std_logic;
signal enable_burst_length_counter : std_logic;
signal fifo_counter : integer range 0 to 256 := 0;
signal clear_fifo_counter : std_logic;
signal enable_fifo_counter : std_logic;

constant delay_length : integer := 100;
--constant MAXIMUM_BURST_LENGTH : integer := 255;
constant MAXIMUM_BURST_LENGTH : integer := 1;

begin

-- Concurrent assignments
burst_length <= std_logic_vector(to_unsigned((burst_length_counter), burst_length'length));
burst_size <= std_logic_vector(to_unsigned((burst_size_integer), burst_size'length));
address <= transaction_address;


state_machine_update : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            current_state <= reset_state;
            previous_states <= (others => reset_state);
        else
            current_state <= next_state;
            if current_state /= next_state then
                previous_states(1) <= current_state;
                for i in previous_states'LOW+1 to previous_states'HIGH loop
                    previous_states(i) <= previous_states(i-1);
                end loop;           
            end if;
        end if;
    end if;
end process;

counter_process : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            counter <= 0;
        elsif clear_counter = '1' then
            counter <= 0;
        elsif enable_counter = '1' then
            counter <= counter + 1;
        end if;
    end if;
end process;

burst_length_counter_process : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            burst_length_counter <= 0;
        elsif clear_burst_length_counter = '1' then
            burst_length_counter <= 0;
        elsif enable_burst_length_counter = '1' then
            burst_length_counter <= burst_length_counter + 1;
        end if;
    end if;
end process;

fifo_counter_process : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            fifo_counter <= 0;
        elsif clear_fifo_counter = '1' then
            fifo_counter <= 0;
        elsif enable_fifo_counter = '1' then
            fifo_counter <= fifo_counter + 1;
        end if;
    end if;
end process;


state_machine_decisions : process (current_state, error, busy, done, write_fifo_empty, write_fifo_full, read_fifo_empty, read_fifo_full, counter, fifo_counter, burst_length_counter, previous_states)
begin
    clear_counter <= '0';
    clear_burst_length_counter <= '0';
    enable_counter <= '0';
    enable_burst_length_counter <= '0';
    clear_fifo_counter <= '0';
    enable_fifo_counter <= '0';
    go <= '0';
    RNW <= '0';
    transaction_address <= (others => '0');
    write_data <= (others => '0');
    burst_size_integer <= 4;  -- size in bytes!!
    increment_burst <= '1';
    clear_data_fifos <= '0';
    write_fifo_en <= '0';
    read_fifo_en <= '0';

	case current_state is
		when reset_state =>
			next_state <= reset_state;
            clear_counter <= '1';
            clear_burst_length_counter <= '1';
            clear_fifo_counter <= '1';
            next_state <= idle;

		when idle =>
			next_state <= idle;
            if busy = '0' then
                next_state <= delay;
            end if;
                
		when write_transaction =>
            next_state <= write_transaction;
            if write_fifo_full = '0' then
                write_fifo_en <= '1';
                write_data <= X"ABCD0000" OR std_logic_vector(to_unsigned(fifo_counter, 32));
                enable_fifo_counter <= '1';
                if fifo_counter = 1 then
                    transaction_address <= X"40000000";
                    RNW <= '0';
                    go <= '1';
                end if;
                if fifo_counter > burst_length_counter then
                   enable_fifo_counter <= '0';
                   clear_fifo_counter <= '1';
                   write_fifo_en <= '0';
                   next_state <= wait_for_done_error; 
                end if;
            end if;

		when wait_for_done_error =>
            next_state <= wait_for_done_error;
            if error = '1' then
                next_state <= error_state;
            elsif done = '1' then
                next_state <= delay;
            else
                case previous_states(1) is
                    when read_transaction =>
                        if read_fifo_empty = '0' then
                            read_fifo_en <= '1';
                        end if;
                    when write_transaction => NULL;
                    when others => next_state <= error_state;
                end case;
            end if;
		  
		when adjust_burst_length =>
            clear_fifo_counter <= '1';
            if burst_length_counter < MAXIMUM_BURST_LENGTH then
                enable_burst_length_counter <= '1';
                next_state <= write_transaction;
            else
                next_state <= temp_wait;
            end if;
            
		when delay =>
            next_state <= delay;
            enable_counter <= '1';
            if counter >= delay_length then
                enable_counter <= '0';
                clear_counter <= '1';
                case previous_states(1) is
                    when idle => next_state <= write_transaction;
                    when adjust_burst_length =>
                        case previous_states(3) is 
                            when write_transaction => next_state <= write_transaction;
                            when read_transaction => next_state <= read_transaction;
                            when others => next_state <= error_state;
                        end case;
                    when wait_for_done_error =>
                        case previous_states(2) is
                            when write_transaction => next_state <= read_transaction;
                            when read_transaction => next_state <= adjust_burst_length;
                            when others => next_state <= error_state;
                        end case;
                    when others => next_state <= error_state;
                end case;
            end if;

        when read_transaction =>
            next_state <= read_transaction;
            if busy = '0' then
                transaction_address <= X"C0001000";
                RNW <= '1';
                go <= '1';
                next_state <= wait_for_done_error; 
            end if;

		when temp_wait =>
            next_state <= temp_wait;
    
        when error_state => 
            next_state <= error_state;

		when others =>
			next_state <= reset_state;
	end case;
end process;



end Behavioral;
