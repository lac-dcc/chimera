library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.constants.all;
use work.rgbctrl_wb8_init.all;

entity rgbctrl_wb8 is
	generic(
		CLOCKFREQ: integer := (50 * 1000 * 1000) -- frequency (MHz)
	);
	-- signal naming according to Wishbone B4 spec
	port(
		CLK_I: in std_logic;
		STB_I: in std_logic;
		WE_I: in std_logic;
		ADR_I: in std_logic_vector(XLEN-1 downto 0);
		DAT_I: in std_logic_vector(7 downto 0);
		DAT_O: out std_logic_vector(7 downto 0);
		ACK_O: out std_logic;
		
		-- RGB control signal
		O_rgb_ctrl: out std_logic
	);
end rgbctrl_wb8;


architecture Behavioral of rgbctrl_wb8 is
	signal ram: store_t := RAM_INIT;
	attribute ramstyle : string;
	attribute ramstyle of ram : signal is "no_rw_check";
	
	constant TCL: integer := (1000 * 1000 * 1000) / CLOCKFREQ; -- time per clock interval (ns)
	
	-- timing for ws8212b
	constant T0H: integer := 400;	-- high time for 0 bit (ns)
	constant T0L: integer := 800; --  low time for 0 bit (ns)
	constant T1H: integer := 800; -- high time for 1 bit (ns)
	constant T1L: integer := 400; --  low time for 1 bit (ns)
	constant RES: integer := 60000; -- reset time (ns)
	
	constant T0H_CLKS: integer := T0H / TCL; -- clock cycles for 0 bit, high
	constant T0L_CLKS: integer := T0L / TCL; -- clock cycles for 0 bit, low
	constant T1H_CLKS: integer := T1H / TCL; -- clock cycles for 1 bit, high
	constant T1L_CLKS: integer := T1L / TCL; -- clock cycles for 1 bit, low
	constant RES_CLKS: integer := RES / TCL; -- clock cycles for reset, low

	-- counter to keep track of byte address in RAM
	signal next_rgb_addr: integer range 0 to ((2**ADDRLEN) - 1) := 0;
	
	-- register to keep RGB-byte to be serialized
	signal next_rgb_byte: std_logic_vector(7 downto 0) := X"00";
	
		
begin
	-- process to generate RGB control signal
	process(CLK_I)
		-- clock counter for timing
		variable clkcounter: integer range 0 to (RES_CLKS + 1) := 0;
		
		-- variable for current byte
		variable current_byte: std_logic_vector(7 downto 0) := X"00";
		
		-- alias for current bit to be output
		alias current_bit: std_logic is current_byte(7);
		
		-- counter to keep track of number of output bits
		variable bitcounter: integer range 0 to 7 := 0;
		
		-- states for state machine
		type states_t is (GETBYTE, OUT_RESET, SETUP_HIGH, OUT_HIGH, SETUP_LOW, OUT_LOW);
		variable state: states_t := GETBYTE;
	begin
	
		if rising_edge(CLK_I) then
			-- keep rgb control signal low by default
			O_rgb_ctrl <= '0';
		
			-- It's the final countdown... for timing
			clkcounter := clkcounter - 1;
		
			case state is
				when GETBYTE =>
					-- put byte read by the RAM process into our buffer
					current_byte := next_rgb_byte;
					if next_rgb_addr = 0 then
						clkcounter := RES_CLKS;
						state := OUT_RESET;
					else
						state := SETUP_HIGH;
					end if;
					next_rgb_addr <= next_rgb_addr + 1;
					bitcounter := 0;

					
				when OUT_RESET =>
					if clkcounter = 0 then
						-- done waiting!
						state := SETUP_HIGH;
					end if;
				
					
				when SETUP_HIGH =>
					-- determine length of high-output phase
					if current_bit = '0' then
						clkcounter := T0H_CLKS;
					else
						clkcounter := T1H_CLKS;
					end if;				
					state := OUT_HIGH;
				
				when OUT_HIGH =>
					-- output HIGH!
					O_rgb_ctrl <= '1';
					if clkcounter = 0 then
						-- done waiting, progress state machine!
						state := SETUP_LOW;
					end if;

					
				when SETUP_LOW =>
					-- determine length of low-output phase
					if current_bit = '0' then
						clkcounter := T0L_CLKS;
					else
						clkcounter := T1L_CLKS;
					end if;
					state := OUT_LOW;
				
				when OUT_LOW =>
					if clkcounter = 0 then
						-- done waiting, progress!
						-- shift current byte one bit position
						current_byte := current_byte(6 downto 0) & '0';
					
						if bitcounter = 7 then
							-- byte finished, get next byte
							state := GETBYTE;
						else
							-- output next bit of current byte
							state := SETUP_HIGH;
						end if;
						bitcounter := bitcounter + 1;
					end if;

			end case;
		
		
		end if;
	end process;


	-- process to access RAM
	process(CLK_I, STB_I)
		variable ack: std_logic := '0';
	begin
	
		if rising_edge(CLK_I) then
			ack := '0';
		
			if STB_I = '1' then
				if(WE_I = '1') then
					ram(to_integer(unsigned(ADR_I(ADDRLEN-1 downto 0)))) <= DAT_I;
				else
					DAT_O <= ram(to_integer(unsigned(ADR_I(ADDRLEN-1 downto 0))));
				end if;
				ack := '1';
			end if;
			
			-- read RGB-byte and store into a buffer for consumption by the other process
			next_rgb_byte <= ram(next_rgb_addr);
	
		end if;
		
		ACK_O <= STB_I and ack;
		
	end process;
end Behavioral;