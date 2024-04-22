library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity bus_wb8 is
	Port(
		-- wired to CPU core
		I_en: in std_logic;
		I_op: in busops_t; -- bus opcodes
		I_addr: in std_logic_vector(31 downto 0); -- address
		I_data: in std_logic_vector(31 downto 0); -- data to be stored on write ops
		O_data : out std_logic_vector(31 downto 0);
		O_busy: out std_logic := '0';

		-- wired to outside world, RAM, devices etc.
		-- naming of signals taken from Wishbone B4 spec
		CLK_I: in std_logic := '0';
		ACK_I: in std_logic := '0';
		DAT_I: in std_logic_vector(7 downto 0);
		RST_I: in std_logic := '0';
		ADR_O: out std_logic_vector(31 downto 0);
		DAT_O: out std_logic_vector(7 downto 0);
		CYC_O: out std_logic := '0';
		STB_O: out std_logic := '0';
		WE_O: out std_logic := '0'
	
	);

end bus_wb8;

architecture Behavioral of bus_wb8 is
	type control_states is (IDLE, READ_START, READ_FINISH, WRITE_START, WRITE_FINISH);
	
begin
	process(CLK_I)
		variable state: control_states := IDLE;
		variable buf: std_logic_vector(31 downto 0) := X"00000000";
		variable byte, byte_target: integer range 0 to 3;
		variable zeroextend: std_logic := '0';
	begin

		if rising_edge(CLK_I) then
		
			if I_en = '1' then
				--------------------------------------
				-- when idle, evaluate requested memop
				--------------------------------------
				if state = IDLE then
					O_busy <= '1';
					zeroextend := '0';
					byte := 0; -- start at byte 0
				
					case I_op is
						when BUS_READW =>
							byte_target := 3; -- read 4 bytes
							state := READ_START;
						
						when BUS_READH =>
							byte_target := 1; -- read 2 bytes
							state := READ_START;
							
						when BUS_READHU =>
							byte_target := 1; -- read 2 bytes
							zeroextend := '1';
							state := READ_START;
						
						when BUS_READB =>
							byte_target := 0; -- read 1 byte
							state := READ_START;
							
						when BUS_READBU =>
							byte_target := 0; -- read 1 byte
							zeroextend := '1';
							state := READ_START;
						
						when BUS_WRITEW =>
							byte_target := 3; -- write 4 bytes
							state := WRITE_START;
							
						when BUS_WRITEH =>
							byte_target := 1; -- write 2 bytes
							state := WRITE_START;
						
						when BUS_WRITEB =>
							byte_target := 0; -- write 1 byte
							state := WRITE_START;

					end case;
				end if;
			
				-- compute memory address
				ADR_O <= std_logic_vector(unsigned(I_addr) + byte);
			
				-----------------------------------
				-- execute read or write operations
				-----------------------------------
				case state is
					when READ_START =>
						WE_O <= '0';
						CYC_O <= '1';
						STB_O <= '1';
						state := READ_FINISH;
				
					when READ_FINISH =>
						if ACK_I = '1' then
							STB_O <= '0';

							case byte is
								when 0 =>
									if zeroextend = '1' then
										buf := X"000000" & DAT_I;
									else
										buf := std_logic_vector(resize(signed(DAT_I), buf'length));
									end if;
								when 1 =>
									if zeroextend = '1' then
										buf := X"0000" & DAT_I & buf(7 downto 0);
									else
										buf := std_logic_vector(resize(signed(DAT_I & buf(7 downto 0)), buf'length));
									end if;
								when 2 =>
									buf(23 downto 16) := DAT_I;
								when 3 =>
									buf(31 downto 24) := DAT_I;
							end case;
						
							if byte < byte_target then
								-- we didn't read all bytes yet
								byte := byte + 1;
								state := READ_START;
							else
								-- we read all data, signal to CPU we're ready and go to idle state
								O_busy <= '0';
								-- bus cycle finished
								CYC_O <= '0';
								state := IDLE;
							end if;

						end if;
					
					when WRITE_START =>
						WE_O <= '1';
						CYC_O <= '1';
						STB_O <= '1';
						case byte is
							when 0 =>
								DAT_O <= I_data(7 downto 0);
							when 1 =>
								DAT_O <= I_data(15 downto 8);
							when 2 =>
								DAT_O <= I_data(23 downto 16);
							when 3 =>
								DAT_O <= I_data(31 downto 24);
							end case;
							state := WRITE_FINISH;
				
					when WRITE_FINISH =>
						if ACK_I = '1' then
							WE_O <= '0';
							STB_O <= '0';
					
						if byte < byte_target then
								-- we did not write all bytes yet
								byte := byte + 1;
								state := WRITE_START;
							else
								-- we wrote all data, signal to CPU we're ready and go to idle state
								O_busy <= '0';
								-- bus cycle finished
								CYC_O <= '0';
								state := IDLE;
							end if;
						end if;
				
					when others =>
						null;
		
				end case;
		
			end if;
		
			O_data <= buf;
		
			if RST_I = '1' then
				state := IDLE;
				CYC_O <= '0';
				STB_O <= '0';
				WE_O <= '0';
				O_busy <= '0';
			end if;

		end if;
		
	end process;

end Behavioral;