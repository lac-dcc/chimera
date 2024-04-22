library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_ADDRESS_CONTROL_CHANNEL_model is
	PORT
		(
		-- User signals
		clk			: in  STD_LOGIC;
		resetn       : in STD_LOGIC;
		go          : in STD_LOGIC;
		done        : out STD_LOGIC;
        address : in std_logic_vector(31 downto 0);
		
		-- AXI lite Master signals
		AxADDR		: out  STD_LOGIC_VECTOR (31 downto 0);
		AxVALID		: out  STD_LOGIC;
		AxREADY		: in   STD_LOGIC
		);
end AXI_ADDRESS_CONTROL_CHANNEL_model;



architecture Behavioral of AXI_ADDRESS_CONTROL_CHANNEL_model is

type main_fsm_type is (reset, idle, running, complete);

signal current_state, next_state : main_fsm_type := reset;
signal address_enable : std_logic;

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


AxADDR <= address when address_enable = '1' else (others => '0');


state_machine_decisions : process (current_state, go, AxREADY)
begin
    done <= '0';
    address_enable <= '0';
    AxVALID <= '0';
    
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
            address_enable <= '1';
            AxVALID <= '1';
            if AxREADY = '1' then
                next_state <= complete;
            end if;
                        
        when complete => 
            next_state <= complete;
            done <= '1';
            if go = '0' then
                next_state <= idle;
            end if;
        
        when others =>
            next_state <= reset;
    end case;
end process;


end Behavioral;

