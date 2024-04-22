library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity AXI_READ_DATA_CHANNEL is
    GENERIC
        (
        data_width : integer range 32 to 64 := 32
        );
	PORT
		(
		-- User signals
		clk			        : in  STD_LOGIC;
        resetn              : in  STD_LOGIC;
        data                : out STD_LOGIC_VECTOR (data_width-1 downto 0);
        data_valid          : out STD_LOGIC;
        fifo_ready          : in  STD_LOGIC;
        last_transfer       : out STD_LOGIC;
        go                  : in  STD_LOGIC;
        done                : out STD_LOGIC;
        error               : out STD_LOGIC;
		transaction_ID      : out STD_LOGIC_VECTOR (3 downto 0);
		
		-- AXI Master signals
		RID                 : in  STD_LOGIC_VECTOR (3 downto 0);
		RDATA		        : in  STD_LOGIC_VECTOR (data_width-1 downto 0);
		RRESP		        : in  STD_LOGIC_VECTOR (1 downto 0);
		RLAST		        : in  STD_LOGIC;
		RVALID		        : in  STD_LOGIC;
		RREADY		        : out STD_LOGIC
		);
end AXI_READ_DATA_CHANNEL;


architecture Behavioral of AXI_READ_DATA_CHANNEL is

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
type main_fsm_type is (reset, idle, transaction_OKAY, transaction_ERROR, complete);

-- Signal declarations
signal width_check_OK : BOOLEAN;
signal current_state, next_state : main_fsm_type := reset;
signal capture_transaction_ID : STD_LOGIC;
signal clear_transaction_ID : STD_LOGIC;


begin

-- Automated data width checking
width_check_OK <= generate_data_width_error(data_width);

-- Concurrent assignments
data <= RDATA;

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

-- Generate Transaction ID signal
transaction_ID_process : process (clk, resetn)
begin
    if resetn = '0' then
        transaction_ID <= (others => '0');
    elsif clk'event and clk = '1' then
        if clear_transaction_ID = '1' then
            transaction_ID <= (others => '0');
        elsif capture_transaction_ID = '1' then
            transaction_ID <= RID;
        end if;
    end if;
end process;

-- Finite State Machine implementation
state_machine_decisions : process (current_state, width_check_OK, RVALID, RRESP, RLAST, fifo_ready, go)
begin
	RREADY <= '0';
    capture_transaction_ID <= '0';
    clear_transaction_ID <= '0';
    last_transfer <= '0';
    error <= '0';
    done <= '0';
    data_valid <= '0';
    
    case current_state is
        when reset =>
        next_state <= idle;
    
        when idle =>
            next_state <= idle;
            if go = '1' then
                capture_transaction_ID <= '1';
                case width_check_OK is
                    when TRUE => next_state <= transaction_OKAY;
                    when others => next_state <= transaction_ERROR;
                end case;
            end if;

        when transaction_OKAY =>
            next_state <= transaction_OKAY;
            if RVALID = '1' then
                if RRESP = "00" then
                    data_valid <= '1';
                    if RLAST = '1' then 
                        last_transfer <= '1';
                        next_state <= complete;
                    end if;
        	   else
        	      next_state <= transaction_ERROR; 
        	   end if;
        	end if;
        	RREADY <= fifo_ready;
        
        when transaction_ERROR =>
            next_state <= transaction_ERROR;
            error <= '1';
            clear_transaction_ID <= '1';
            if go = '0' then
                next_state <= idle;
            end if;
                    
        when complete => 
            next_state <= complete;
            clear_transaction_ID <= '1';
            done <= '1';
            if go = '0' then
                next_state <= idle;
            end if;

        when others =>
            next_state <= reset;
    end case;
end process;

end Behavioral;
