library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_WRITE_DATA_CHANNEL_model is
	PORT
		(
		-- User signals
		clk			: in  STD_LOGIC;
		resetn       : in STD_LOGIC;
		data          : in STD_LOGIC_VECTOR(31 downto 0);
		go          : in STD_LOGIC;
        done      : out STD_LOGIC;
		
		-- AXI write data channel signals
		WDATA			: out  STD_LOGIC_VECTOR(31 downto 0);
		WSTRB			: out  STD_LOGIC_VECTOR(3 downto 0);
		WVALID		: out  STD_LOGIC;
		WREADY		: in  STD_LOGIC
		);
end AXI_WRITE_DATA_CHANNEL_model;



architecture Behavioral of AXI_WRITE_DATA_CHANNEL_model is

type main_fsm_type is (reset, idle, running, complete);

signal current_state, next_state : main_fsm_type := reset;
signal output_data : std_logic;



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


WDATA <= data when output_data = '1' else X"00000000";

state_machine_decisions : process (current_state, WREADY, go)
begin
    WSTRB <= "0000";
    WVALID <= '0';
    output_data <= '0';
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
            output_data <= '1';
            WSTRB <= "1111";
            WVALID <= '1';
            if WREADY = '1' then
                next_state <= complete;
            else
                next_state <= running;
            end if;
                          
        when complete => 
            done <= '1';
            if go = '0' then
                next_state <= idle;
            else
                next_state <= complete;
            end if;
        
        when others =>
            next_state <= reset;
    end case;
end process;

end Behavioral;

