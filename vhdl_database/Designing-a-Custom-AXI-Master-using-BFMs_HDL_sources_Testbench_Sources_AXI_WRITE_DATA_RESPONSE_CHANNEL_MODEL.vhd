library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_RESPONSE_CHANNEL_MODEL is
	PORT
        (
        clk             : in  STD_LOGIC;
        resetn          : in STD_LOGIC;
		go              : in STD_LOGIC;
        done            : out  STD_LOGIC;
        transaction_ID  : in  STD_LOGIC_VECTOR (3 downto 0);
        BID             : out STD_LOGIC_VECTOR (3 downto 0);
        BRESP           : out STD_LOGIC_VECTOR (1 downto 0);
        BVALID          : out STD_LOGIC;
        BREADY          : in  STD_LOGIC
        );
end AXI_WRITE_DATA_RESPONSE_CHANNEL_MODEL;



architecture Behavioral of AXI_WRITE_DATA_RESPONSE_CHANNEL_MODEL is

-- Type Declarations
type main_fsm_type is (idle, running, complete);

-- Signal Declarations
signal current_state, next_state, previous_state : main_fsm_type := idle;


begin

state_machine_update : process (clk)
begin
    if clk'event and clk = '1' then
        if resetn = '0' then
            current_state <= idle;
        else
            current_state <= next_state;
        end if;
    end if;
end process;

state_machine_decisions : process (current_state, go, BREADY)
begin
    BID <= (others => '0');
    BRESP <= (others => '0');
    BVALID <= '0';
    done <= '0';
    
    case current_state is
        when idle =>
            next_state <= idle;
            if go = '1' then
                next_state <= running;
            end if;
    
        when running =>
            next_state <= running;
            BID <= transaction_ID;
            BVALID <= '1';
            BRESP <= "00";
            if BREADY <= '1' then
                next_state <= complete;
            end if;
            
        when complete =>
            next_state <= complete;
            done <= '1';
            if go = '0' then
                next_state <= idle;
            end if;

        when others =>
            next_state <= idle;
    end case;
end process;


end Behavioral;

