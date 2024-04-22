library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_CHANNEL_MODEL is
    GENERIC
        (
        data_width : INTEGER range 32 to 64 := 32
        );
	PORT
		(
		-- User signals
		clk			    : in  STD_LOGIC;
        resetn          : in  STD_LOGIC;
        go              : out STD_LOGIC;
        data            : out STD_LOGIC_vector(data_width-1 downto 0);
        data_valid      : out STD_LOGIC;
        data_sent       : in  STD_LOGIC;
        last_transfer   : out STD_LOGIC;
        transaction_ID  : out STD_LOGIC_VECTOR (3 downto 0);
        done            : in  STD_LOGIC;
        
        -- AXI Master signals
        WID             : in  STD_LOGIC_VECTOR (3 downto 0);
        WDATA           : in  STD_LOGIC_VECTOR (data_width-1 downto 0);
        WSTRB           : out STD_LOGIC_VECTOR((data_width/8)-1 downto 0);
        WLAST           : in  STD_LOGIC;
        WVALID          : in  STD_LOGIC;
        WREADY          : out STD_LOGIC
		);
end AXI_WRITE_DATA_CHANNEL_MODEL;



architecture Behavioral of AXI_WRITE_DATA_CHANNEL_MODEL is

-- Type Declaration
type main_fsm_type is (idle, single_beat_mode, burst_mode, delay, complete);

-- Simulation constants
constant delay_value : INTEGER := 30;
constant burst_initial_address : STD_LOGIC_VECTOR(31 downto 0) := X"ABCD1000";

-- Signal declarations
signal current_state, next_state, previous_state : main_fsm_type := idle;
signal control_counter : INTEGER range 0 to 256;
signal reset_control_counter : STD_LOGIC;
signal enable_control_counter : STD_LOGIC;


begin

state_machine_update : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            previous_state <= idle;
            current_state <= idle;
        else
            current_state <= next_state;
            if (next_state /= current_state) then
                case current_state is
                    when idle => NULL;
                    when complete => NULL;
                    when others => previous_state <= current_state;
                end case;
            end if;
        end if;
    end if;
end process;

control_counter_process : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            control_counter <= 0;
        elsif reset_control_counter = '1' then
            control_counter <= 0;
        elsif enable_control_counter = '1' then
            control_counter <= control_counter + 1;
        end if;
    end if;
end process;


wready_simulation : process
begin
    WREADY <= '0';
    wait until WVALID = '1';
    wait for 8 ns;
    wait until clk = '1';
    WREADY <= '1';
    wait for 35 ns;
    wait until clk = '1';
    WREADY <= '0';
    wait for 12 ns;
    wait until clk = '1';
    WREADY <= '1';
    wait for 27 ns;
    wait until clk = '1';
end process;


state_machine_decisions : process (current_state, previous_state, done, resetn, control_counter, data_sent)
begin
    go <= '0';
    last_transfer <= '0';
    data <= X"00000000";
    data_valid <= '0';
    transaction_ID <= (others => '0');
    enable_control_counter <= '0';
    reset_control_counter <= '0';
    
    case current_state is
        when idle =>
            next_state <= delay;
            reset_control_counter <= '1';

        when delay =>
            next_state <= delay;
            enable_control_counter <= '1';    
            if control_counter = delay_value then
                reset_control_counter <= '1';
                enable_control_counter <= '0';
                case previous_state is
                    when idle => next_state <= single_beat_mode;
                    when single_beat_mode => next_state <= burst_mode;
                    when others => next_state <= idle;
                end case;
            end if;

        when single_beat_mode =>
            next_state <= single_beat_mode;
            data <= X"DEADBEEF";
            data_valid <= '1';
            last_transfer <= '1';
            go <= '1';
            if done = '1' then
                data <= X"00000000";
                data_valid <= '0';
                last_transfer <= '0';
                go <= '0';
                last_transfer <= '0';
                next_state <= delay;
            end if;
        
        when burst_mode =>
                next_state <= burst_mode;
                data <= STD_LOGIC_VECTOR((unsigned(burst_initial_address) + control_counter));
                data_valid <= '1';
                go <= '1';
                if control_counter >= 7 then
                    last_transfer <= '1';
                    if done = '1' then
                        data <= X"00000000";
                        data_valid <= '0';
                        last_transfer <= '0';
                        go <= '0';
                        last_transfer <= '0';
                        next_state <= complete;
                    end if;
                else
                    if data_sent = '1' then
                        enable_control_counter <= '1';
                    end if;
                end if;
            
        when complete =>
            next_state <= complete;

        when others =>
            next_state <= idle;
    end case;
end process;

end Behavioral;

