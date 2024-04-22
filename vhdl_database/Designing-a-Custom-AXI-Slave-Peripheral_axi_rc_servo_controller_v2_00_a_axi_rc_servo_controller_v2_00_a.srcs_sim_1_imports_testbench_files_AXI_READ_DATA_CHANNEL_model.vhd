library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_READ_DATA_CHANNEL_model is
	PORT
		(
		-- User signals
		clk			: in  STD_LOGIC;
        resetn       : in STD_LOGIC;
        data : out std_logic_vector(31 downto 0);
		
		-- AXI Master signals
		RDATA			: in  STD_LOGIC_VECTOR (31 downto 0);
		RRESP			: in  STD_LOGIC_VECTOR (1 downto 0);
		RVALID		: in  STD_LOGIC;
		RREADY		: out  STD_LOGIC
		);
end AXI_READ_DATA_CHANNEL_model;



architecture Behavioral of AXI_READ_DATA_CHANNEL_model is

type main_fsm_type is (reset, idle, transaction_OKAY, transaction_ERROR, complete);

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



data <= RDATA when RVALID = '1' else X"00000000";

state_machine_decisions : process (current_state, RVALID, RRESP)
begin
	RREADY <= '0';
    
    case current_state is
        when reset =>
        next_state <= idle;
    
        when idle =>
            next_state <= idle;
        if RVALID = '1' then
            if RRESP = "00" then next_state <= transaction_OKAY;
            else next_state <= transaction_ERROR;
            end if; 
        end if;
        
        when transaction_OKAY =>
            next_state <= complete;
        	RREADY <= '1';
        
        when transaction_ERROR =>
            next_state <= complete;
        	RREADY <= '1';
                    
        when complete => 
            next_state <= complete;
            if RVALID = '0' then
                next_state <= idle;
            end if;
        
        when others =>
            next_state <= reset;
    end case;
end process;


end Behavioral;

