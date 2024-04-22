library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity fifo_manager is
    Generic
        (
        data_width : integer range 32 to 64 := 32
        );
    Port
        (
        -- User signals
        clk              : in  std_logic;
        resetn           : in  std_logic;
        data_used        : in std_logic;
        data_valid       : out std_logic;
        fifo_read_enable : out std_logic;
        fifo_empty_flag  : in std_logic;
        data_transferred : out std_logic
        );
end fifo_manager;

architecture Behavioral of fifo_manager is


-- Type declarations
type main_fsm_type is (reset, wait_for_fifo, data_is_valid);

signal current_state, next_state : main_fsm_type;


begin

state_machine_update : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            current_state <= reset;
        else
            current_state <= next_state;
        end if;
    end if;
end process;


state_machine_decisions : process (current_state, data_used, fifo_empty_flag)
begin
    next_state <= reset;
    data_valid <= '0';
    fifo_read_enable <= '0';
    data_transferred <= '0';
    
    
	case current_state is
		when reset =>
			next_state <= wait_for_fifo;

		when wait_for_fifo =>
			next_state <= wait_for_fifo;
            if fifo_empty_flag = '0' then
                fifo_read_enable <= '1';
                next_state <= data_is_valid;
            end if;
            
		when data_is_valid =>
		    next_state <= data_is_valid; 
            data_valid <= '1';
            if data_used = '1' then
                data_transferred <= '1';
                if fifo_empty_flag = '1' then
                    next_state <= wait_for_fifo;
                else
                    fifo_read_enable <= '1';
                end if;
            end if;
		
		when others =>
			next_state <= reset;
	end case;
end process;



end Behavioral;
