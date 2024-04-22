LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY uart_tx_tb IS
END uart_tx_tb;
 
ARCHITECTURE behavior OF uart_tx_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_tx
    PORT(
         clk : IN  std_logic;
         divider : IN  std_logic_vector(15 downto 0);
         new_data : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic;
         done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal divider : std_logic_vector(15 downto 0) := (others => '0');
   signal new_data : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic;
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

	signal sim_done : boolean := false;
 
	type msg_t is array( 0 to 13 ) of std_logic_vector( 7 downto 0 ) ;
	constant message : msg_t := ( 	"01001000",
												"01100101",
												"01101100",
												"01101100",
												"01101111",
												"00100000",
												"01110111",
												"01101111",
												"01110010",
												"01101100",
												"01100100",
												"00100001",
												"00001101",
												"00001010" );

	signal idx : integer range 0 to message'length+1 := 0;
	type states_t is ( st_idle, st_go0, st_go, st_wait_for_done );
	signal state, state_next : states_t := st_idle;
	signal counter : integer range 0 to 131071 := 0;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_tx PORT MAP (
          clk => clk,
          divider => divider,
          new_data => new_data,
          din => din,
          dout => dout,
          done => done
        );

   -- clock definition
	clk <= '0' when sim_done else not clk after clk_period / 2;

	divider <= "0000001101100100";

   -- Stimulus process
   stim_proc: process
   begin
		while not sim_done loop			
			wait until rising_edge( clk ) ;
		
			state <= state_next;
			new_data <= '0';
			
			case( state ) is
				when st_idle =>
					counter <= counter + 1;
					if counter = 99999 then
						counter <= 0;
						idx <= 0;
						state_next <= st_go0;
					end if ;
				
				when st_go0 =>
					new_data <= '1';
					din <= message( 0 );
					idx <= 1;
					state_next <= st_wait_for_done;
				
				when st_go =>
					if idx = ( message'length-1 ) then
						state_next <= st_idle;
					else
						din <= message( idx );
						idx <= idx + 1;
						state_next <= st_wait_for_done;
					end if ;
					
				when st_wait_for_done =>
					if done = '1' then
						state_next <= st_go ;
					else
						state_next <= st_wait_for_done ;
					end if ;
					
				when others =>
					state_next <= st_idle;
					
			end case;

		end loop ;

      wait;
   end process;

END;
