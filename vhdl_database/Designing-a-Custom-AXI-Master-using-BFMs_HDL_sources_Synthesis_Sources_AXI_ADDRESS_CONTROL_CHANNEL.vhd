library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_ADDRESS_CONTROL_CHANNEL is
	PORT
		(
		-- User signals
		clk               : in  STD_LOGIC;
		resetn            : in  STD_LOGIC;
		go                : in  STD_LOGIC;
		done              : out STD_LOGIC;
        error             : out STD_LOGIC;
        address           : in  STD_LOGIC_VECTOR (31 downto 0);
        burst_length      : in  INTEGER range 1 to 256;
        burst_size        : in  INTEGER range 1 to 128;
        increment_burst   : in  STD_LOGIC;
		
		-- AXI Master signals
		AxID              : out STD_LOGIC_VECTOR (3 downto 0);
		AxADDR		      : out STD_LOGIC_VECTOR (31 downto 0);
		AxLEN             : out STD_LOGIC_VECTOR (7 downto 0);
		AxSIZE            : out STD_LOGIC_VECTOR (2 downto 0);
		AxBURST           : out STD_LOGIC_VECTOR (1 downto 0);
		AxLOCK            : out STD_LOGIC;
		AxCACHE           : out STD_LOGIC_VECTOR (3 downto 0);
		AxPROT            : out STD_LOGIC_VECTOR (2 downto 0);
		AxVALID		      : out STD_LOGIC;
		AxREADY		      : in  STD_LOGIC;
		AxQOS             : out STD_LOGIC_VECTOR (3 downto 0);
		AxREGION          : out STD_LOGIC_VECTOR (3 downto 0)
		);
end AXI_ADDRESS_CONTROL_CHANNEL;


architecture Behavioral of AXI_ADDRESS_CONTROL_CHANNEL is

-- Finite State Machine state declarations (enumerated data types)
type main_fsm_type is (reset, idle, running, error_detected, complete);

-- Signal declarations
signal current_state, next_state : main_fsm_type := reset;
signal address_enable : std_logic;


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

-- Concurrent assignments
AxADDR <= address when address_enable = '1' else (others => '0');
AxID <= (others => '0');  -- Transaction ID = 0
AxLOCK <= '0';  -- Normal transaction
AxCACHE <= (others => '0');  -- Non-bufferable & Non-cacheable
AxPROT <= (others => '0');  -- Normal access, secure access, data access.
AxQOS <= (others => '0');  -- QoS scheme not used.
AxREGION <= (others => '0');  -- Memory region scheme not used; defaulting to region zero.

-- Decode and generate Burst Size output signal
burst_size_process : process (current_state, burst_size)
begin
    if (current_state = running) then
        case burst_size is
            when 1 => AxSIZE <= "000";
            when 2 => AxSIZE <= "001";           
            when 4 => AxSIZE <= "010";           
            when 8 => AxSIZE <= "011";           
            when 16 => AxSIZE <= "100";           
            when 32 => AxSIZE <= "101";           
            when 64 => AxSIZE <= "110";           
            when 128 => AxSIZE <= "111";
            when others => AxSIZE <= "---";
        end case;
    else 
         AxSIZE <= "---";
    end if;
end process;

-- Decode and generate Burst Type output signal
burst_type_process : process (current_state, increment_burst)
begin
    if (current_state = running) then
        case increment_burst is
            when '1' => AxBURST <= "01";
            when '0' => AxBURST <= "00";
            when others => NULL;           
        end case;
    else 
        AxBURST <= "--";
    end if;
end process;

-- Decode and generate Burst Length output signal
burst_length_process : process (current_state, burst_length)
begin
    if (current_state = running) then
        AxLEN <= std_logic_vector(to_unsigned((burst_length-1), 8));
    else
        AxLEN <= (others => '-');
    end if;
end process;

-- Finite State Machine implementation
state_machine_decisions : process (current_state, go, AxREADY, burst_size, burst_length)
begin
    done <= '0';
    address_enable <= '0';
    AxVALID <= '0';
    error <= '0';
    
    case current_state is
        when reset =>
            next_state <= idle;
    
        when idle =>
            next_state <= idle;
            if go = '1' then
                case burst_size is
                    when 1|2|4|8|16|32|64|128 =>
                        case burst_length is
                            when 1 to 256 => next_state <= running;
                            when others => next_state <= error_detected;
                        end case;
                    when others => next_state <= error_detected;
                end case;
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
        
        when error_detected => 
                next_state <= error_detected;
                done <= '1';
                error <= '1';
                if go = '0' then
                    next_state <= idle;
                end if;

        when others =>
            next_state <= reset;
    end case;
end process;


end Behavioral;

