library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_RESPONSE_CHANNEL_model is
	PORT
        (
        clk			: in  STD_LOGIC;
        resetn       : in STD_LOGIC;
        BRESP	    : in  STD_LOGIC_VECTOR (1 downto 0);
        BVALID		: in  STD_LOGIC;
        BREADY		: out  STD_LOGIC
        );
end AXI_WRITE_DATA_RESPONSE_CHANNEL_model;

architecture Behavioral of AXI_WRITE_DATA_RESPONSE_CHANNEL_model is

type main_fsm_type is (reset, idle, success, error, complete);

signal current_state, next_state : main_fsm_type := reset;



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




state_machine_decisions : process (current_state, BRESP, BVALID)
begin
    BREADY <= '0';
            
    case current_state is
        when reset =>
        next_state <= idle;
    
        when idle =>
            next_state <= idle;
            BREADY <= '1';
            if BVALID = '1' then
                if BRESP = "00" then
                    next_state <= success;
                else
                    next_state <= error;
                end if;
            end if;
        
        when success =>
            next_state <= complete;
                          
        when error =>
            next_state <= complete;

        when complete => 
            next_state <= complete;
            if BVALID = '0' then
                next_state <= idle;
            end if;
        
        when others =>
            next_state <= reset;
    end case;
end process;

end Behavioral;

