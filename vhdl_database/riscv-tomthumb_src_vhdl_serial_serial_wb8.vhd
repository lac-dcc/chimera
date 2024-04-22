library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity serial_wb8 is
	generic(
		CLOCKFREQ: integer;
		BAUDRATE: integer
	);
	port(
		-- naming according to Wishbone B4 spec
		ADR_I: in std_logic_vector(31 downto 0);
		CLK_I: in std_logic;
		DAT_I: in std_logic_vector(7 downto 0);
		STB_I: in std_logic;
		WE_I: in std_logic;
		ACK_O: out std_logic;
		DAT_O: out std_logic_vector(7 downto 0);	
	
		-- serial interface (receive, transmit)
		I_rx: in std_logic;
		O_tx: out std_logic
	);
end serial_wb8;


architecture Behavioral of serial_wb8 is
	constant baudclocks: integer := CLOCKFREQ/BAUDRATE;
	
	type read_states is (READ_IDLE, READING);
	signal readstate: read_states := READ_IDLE;
	
	type write_states is (WRITE_IDLE, WRITING);
	signal writestate: write_states := WRITE_IDLE;
	
	signal dowrite: boolean := false;
	signal writebuf: std_logic_vector(7 downto 0) := X"00";
	signal readbuf: std_logic_vector(7 downto 0) := X"00";
	signal read_ready: boolean := false;
begin


	process(CLK_I)
		variable readclkcnt: integer range 0 to baudclocks;
		variable readbitcnt: integer range 0 to 9;
		variable input: std_logic_vector(7 downto 0);
		variable edge_filter: std_logic_vector(3 downto 0);
		
		variable writeclkcnt: integer range 0 to baudclocks;
		variable writebitcnt: integer range 0 to 10;

	begin
		if rising_edge(CLK_I) then
	
			-- reading
			case readstate is
				when READ_IDLE =>
					edge_filter := I_rx & edge_filter(3 downto 1);
					if edge_filter = "0000" then
						readstate <= READING;
						readclkcnt := 0;
						readbitcnt := 0;
						edge_filter := "1111";
					end if;
				
				when READING =>
					if readclkcnt = baudclocks/2 then -- sample mid-baud
						if readbitcnt /= 9 then
							input := I_rx & input(7 downto 1);
						else
							readbuf <= input;
							read_ready <= true;
							readstate <= READ_IDLE;
						end if;
						readbitcnt := readbitcnt + 1;
					end if;
					readclkcnt := readclkcnt + 1;
					if readclkcnt = baudclocks then
						readclkcnt := 0;
					end if;
					
			end case;

			-- writing
			case writestate is
				when WRITE_IDLE =>
					O_tx <= '1'; -- idle, high logic level
					if dowrite then
						writestate <= WRITING;
						writeclkcnt := 0;
						writebitcnt := 0;
						O_tx <= '0'; -- start bit: zero
					end if;
				
				when WRITING =>
					writeclkcnt := writeclkcnt + 1;
					if writeclkcnt = baudclocks then -- write next bit after one baud period
						writeclkcnt := 0;
						O_tx <= writebuf(0);
						if writebitcnt = 10 then
							writestate <= WRITE_IDLE;
							dowrite <= false;
						end if;
						writebuf <= '1' & writebuf(7 downto 1);
						writebitcnt := writebitcnt + 1;
					end if;
					
			end case;
			
			
			
			if STB_I = '1' then
				case ADR_I(1 downto 0) is
					when "00" => -- data register
						if(WE_I = '1') then
							-- accept new data to write
							writebuf <= DAT_I;
							dowrite <= true;
						else
							-- deliver received data
							DAT_O <= readbuf;
							read_ready <= false;
						end if;
						
					when "01" => -- receive status register
						DAT_O <= X"00";
						if read_ready then
							-- signal non-zero when something fresh is in
							-- the read buffer
							DAT_O(0) <= '1';
						end if;
					
					when "10" => -- send status register
						DAT_O <= X"00";
						if not dowrite then
							-- signal "ready" when not sending
							DAT_O(0) <= '1';
						end if;
				
				
					when others =>
						null;
				end case;

				-- signal valid data
				ACK_O <= '1';
			else
				-- signal invalid data when not selected
				ACK_O <= '0';
			end if;
			
			

		end if;
	end process;

	
end Behavioral;