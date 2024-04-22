library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;
use work.ram_init.all;

entity ram is
	Port(
		I_clk: in std_logic;
		I_en: in std_logic;
		I_write: in std_logic;
		I_addr: in std_logic_vector(XLEN-1 downto 0);
		I_data: in std_logic_vector(XLEN-1 downto 0);
		O_data: out std_logic_vector(XLEN-1 downto 0);
		O_busy: out std_logic
	);
end ram;


architecture Behavioral of ram is
	type ram_states is (IDLE, READ1, WRITE1, WRITE2);
	signal state: ram_states := IDLE;
	signal read_buf: std_logic_vector(63 downto 0) := X"0000000000000000";
	signal write_buf: std_logic_vector(31 downto 0) := X"00000000";
	signal ram: store_t := RAM_INIT;
begin
	process(I_clk)
		variable word0,word1: std_logic_vector(ADDRLEN-1 downto 0);
		variable byte: std_logic_vector(1 downto 0) := "00";
	begin
		
		if rising_edge(I_clk) and I_en = '1' then
		

			-- address for first word
			word0 := I_addr(word0'length+1 downto 2);
			-- address for second word
			word1 := std_logic_vector(unsigned(word0) + 1);
			-- byte offset
			byte := I_addr(1 downto 0);
			
					
			case state is
				when IDLE =>
					
					if byte = "00" then
						-- aligned access
						if I_write = '0' then
							-- read!
							O_data <= ram(to_integer(unsigned(word0)));
						else
							-- write!
							ram(to_integer(unsigned(word0))) <= I_data;
						end if;
						O_busy <= '0';
					else
						-- unaligned access!
						O_busy <= '1';
						read_buf <= ram(to_integer(unsigned(word0))) & ram(to_integer(unsigned(word1)));
						
						if I_write = '0' then
							-- unaligned read
							state <= READ1;
						else
							-- unaligned write
							state <= WRITE1;
						end if;
					end if;

					
				when READ1 =>
					case byte is
						when "01" => O_data <= read_buf(55 downto 24);
						when "10" => O_data <= read_buf(47 downto 16);
						when others => O_data <= read_buf(39 downto 8);
					end case;
					O_busy <= '0';
					state <= IDLE;

	
				when WRITE1 =>
					-- write first affected word, put other word in buffer
					case byte is
						when "01" =>
							ram(to_integer(unsigned(word0))) <= read_buf(63 downto 56) & I_data(31 downto 8);
							write_buf <= I_data(7 downto 0) & read_buf(23 downto 0);
						when "10" =>
							ram(to_integer(unsigned(word0))) <= read_buf(63 downto 48) & I_data(31 downto 16);
							write_buf <= I_data(15 downto 0) & read_buf(15 downto 0);
						when others =>
							ram(to_integer(unsigned(word0))) <= read_buf(63 downto 40) & I_data(31 downto 24);
							write_buf <= I_data(23 downto 0) & read_buf(7 downto 0);
					end case;
					state <= WRITE2;
					
					
				when WRITE2 =>
					-- write second word
					ram(to_integer(unsigned(word1))) <= write_buf;
					state <= IDLE;
					O_busy <= '0';

				when others =>
					null;

			end case;
				
			
	
		end if;
	end process;
end Behavioral;