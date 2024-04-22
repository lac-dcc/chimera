library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_RESPONSE_CHANNEL is
	PORT
        (
        clk			    : in  STD_LOGIC;
        resetn          : in STD_LOGIC;
        go              : in STD_LOGIC;
        done            : out STD_LOGIC;
        error           : out STD_LOGIC;
        transaction_ID  : out STD_LOGIC_VECTOR (3 downto 0);
        BID             : in STD_LOGIC_VECTOR (3 downto 0);
        BRESP	        : in  STD_LOGIC_VECTOR (1 downto 0);
        BVALID		    : in  STD_LOGIC;
        BREADY		    : out  STD_LOGIC
        );
end AXI_WRITE_DATA_RESPONSE_CHANNEL;

architecture Behavioral of AXI_WRITE_DATA_RESPONSE_CHANNEL is

-- Finite State Machine state declarations (enumerated data types)
type main_fsm_type is (reset, idle, running, success, error_detected, complete);

-- Signal declarations
signal current_state, next_state : main_fsm_type := reset;


begin

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
        transaction_ID <= BID;
    end if;
end process;

-- Finite State Machine implementation
state_machine_decisions : process (current_state, BRESP, BVALID, go)
begin
    BREADY <= '1';
    error <= '0';
    done <= '0';
            
    case current_state is
        when reset =>
        next_state <= idle;
    
        when idle =>
            next_state <= idle;
            if go = '1' then
                next_state <= running;
            end if;
            
        when running =>
            next_state <= running;
            BREADY <= '1';
            if BVALID = '1' then
                if BRESP = "00" then
                    next_state <= success;
                else
                    next_state <= error_detected;
                end if;
            end if;
        
        when success =>
            done <= '1';
            next_state <= success;
            if BVALID = '0' then
                if go = '0' then
                    next_state <= idle;
                end if;
            end if;
                                      
        when error_detected =>
            done <= '1';
            error <= '1';
            BREADY <= '0';
            next_state <= error_detected;
            if BVALID = '0' then
                if go = '0' then
                    next_state <= idle;
                end if;
            end if;
        
        when others =>
            BREADY <= '0';
            next_state <= reset;
    end case;
end process;

end Behavioral;

