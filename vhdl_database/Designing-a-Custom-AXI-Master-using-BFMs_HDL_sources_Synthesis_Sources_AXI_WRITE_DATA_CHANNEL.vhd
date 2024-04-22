library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_CHANNEL is
    GENERIC
        (
        data_width      : integer range 32 to 64 := 32
        );
	PORT
		(
		-- User signals
		clk             : in  STD_LOGIC;
		resetn          : in  STD_LOGIC;
		data            : in  STD_LOGIC_VECTOR(data_width-1 downto 0);
		data_valid      : in  std_logic;
		go              : in  STD_LOGIC;
        done            : out STD_LOGIC;
		last_transfer   : in  std_logic;
        data_sent       : out std_logic;
        transaction_ID  : in  STD_LOGIC_VECTOR(3 downto 0);
        
		-- AXI Master signals
		WID			    : out STD_LOGIC_VECTOR(3 downto 0);
		WDATA		    : out STD_LOGIC_VECTOR(data_width-1 downto 0);
		WSTRB		    : out STD_LOGIC_VECTOR((data_width/8)-1 downto 0);
		WLAST           : out STD_LOGIC;
		WVALID		    : out STD_LOGIC;
		WREADY		    : in  STD_LOGIC
		);
end AXI_WRITE_DATA_CHANNEL;



architecture Behavioral of AXI_WRITE_DATA_CHANNEL is

-- Implement a function in VHDL to generate an intentional failure if the user chooses a data width other than 32 or 64 bit
function generate_data_width_error (WIDTH : integer) return boolean is
    variable ReturnBool: boolean;
    variable DATA_WIDTH_TEMP: integer;
    begin
        DATA_WIDTH_TEMP := WIDTH;
        case DATA_WIDTH_TEMP is
                when 32|64 =>
                    ReturnBool := TRUE;
                when others =>
                    assert 0 = DATA_WIDTH_TEMP
                    report "** Invalid Generic value for 'data_width' (Can only be 32 or 64) **"
                    severity FAILURE;
                    ReturnBool := FALSE;
            end case;
        return ReturnBool;
    end generate_data_width_error;


-- Finite State Machine state declarations (enumerated data types)
type main_fsm_type is (reset, idle, running, stalled, complete);

-- Signal declarations
signal width_check : boolean;
signal current_state, next_state : main_fsm_type := reset;
signal capture_transaction_ID : std_logic;
signal clear_transaction_ID : std_logic;
signal send_data_to_wdata : std_logic;


begin
-- Automated data width checking
width_check <= generate_data_width_error(data_width);

-- Concurrent assignments
WDATA <= data when send_data_to_wdata = '1' else (others => '-');

-- Generate Transaction ID signal
transaction_ID_process : process (clk, resetn)
begin
    if resetn = '0' then
        WID <= (others => '0');
    elsif clk'event and clk = '1' then
        if clear_transaction_ID = '1' then
            WID <= (others => '0');
        elsif capture_transaction_ID = '1' then
            WID <= transaction_ID;
        end if;
    end if;
end process;


-- State machine update process
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


-- Finite State Machine implementation
state_machine_decisions : process (current_state, WREADY, go, last_transfer, data_valid)
begin
    WSTRB <= (others => '0');
    WVALID <= '0';
    done <= '0';
    capture_transaction_ID <= '0';
    clear_transaction_ID <= '0';
    data_sent <= '0';
    send_data_to_wdata <= '0';
    WLAST <= '0';
    
        
    case current_state is
        when reset =>
        next_state <= idle;
    
        when idle =>
            next_state <= idle;
            if go = '1' then
                next_state <= running;
                capture_transaction_ID <= '1';
            end if;
        
        when running =>
            next_state <= running;
            send_data_to_wdata <= '1';
            data_sent <= WREADY AND data_valid;
            WSTRB <= (others => '1');
            WVALID <= data_valid;
            WLAST <= last_transfer;
            if last_transfer = '1' then
                if (WREADY = '1') AND (data_valid = '1') then
                    next_state <= complete;
                    clear_transaction_ID <= '1';
                end if;
            end if;
                        
        when complete => 
            done <= '1';
            next_state <= complete;
            if go = '0' then
                next_state <= idle;
            end if;
        
        when others =>
            next_state <= reset;
    end case;
end process;

end Behavioral;

