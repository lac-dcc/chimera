library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity mem is
	Port(
		-- wired to CPU core
		I_clk: in std_logic;
		I_en: in std_logic;
		I_op: in std_logic_vector(2 downto 0); -- memory opcodes
		I_iaddr: in std_logic_vector(31 downto 0); -- instruction address, provided by PCU
		I_daddr: in std_logic_vector(31 downto 0); -- data address, provided by ALU
		I_data: in std_logic_vector(31 downto 0); -- data to be stored on write ops
		I_mem_imem: in std_logic := '0'; -- denotes if instruction memory is accessed (signal from control unit)
		O_data : out std_logic_vector(31 downto 0);
		O_busy: out std_logic := '0';

		-- wired to outside world, RAM, devices etc.
		O_memen: out std_logic := '0';
		O_memaddr: out std_logic_vector(31 downto 0);
		O_memdata: out std_logic_vector(31 downto 0);
		I_memdata: in std_logic_vector(31 downto 0);
		O_memwrite: out std_logic := '0';
		I_membusy: in std_logic := '0'
	);

end mem;

architecture Behavioral of mem is
	type control_states is (IDLE, READW, READH, READB, WRITEW, WRITEH1, WRITEH2, WRITEB1, WRITEB2);
	signal state: control_states := IDLE;
	signal buf: std_logic_vector(31 downto 0) := X"00000000";
begin
	process(I_clk)
	begin
		if rising_edge(I_clk) and I_en = '1' then
		
			case state is
			
				when IDLE =>
					case I_op is
						when MEMOP_READW =>
							O_memwrite <= '0';
							O_memen <= '1';
							O_busy <= '1';
							if I_mem_imem = '1' then
								-- read from instruction memory
								O_memaddr <= I_iaddr;
							else
								-- read from data memory/devices
								O_memaddr <= I_daddr;
							end if;
							state <= READW;
						
						when MEMOP_READH =>
							O_memwrite <= '0';
							O_memen <= '1';
							O_busy <= '1';
							O_memaddr <= I_daddr;
							state <= READH;
							
						when MEMOP_READB =>
							O_memwrite <= '0';
							O_memen <= '1';
							O_busy <= '1';
							O_memaddr <= I_daddr;
							state <= READB;
						
						when MEMOP_WRITEW =>
							-- visible endianess of this architecture is little endian!
							O_memdata <= I_data(7 downto 0) & I_data(15 downto 8) & I_data(23 downto 16) & I_data(31 downto 24);
							O_memwrite <= '1';
							O_memen <= '1';
							O_busy <= '1';
							O_memaddr <= I_daddr;
							state <= WRITEW;
							
						when MEMOP_WRITEH =>
							O_busy <= '1';
							O_memwrite <= '0';
							O_memen <= '1';
							O_memaddr <= I_daddr;
							state <= WRITEH1;

						when MEMOP_WRITEB =>
							O_busy <= '1';
							O_memwrite <= '0';
							O_memen <= '1';
							O_memaddr <= I_daddr;
							state <= WRITEB1;
						
						when others =>
							-- FIXME: Support the other mem ops!
							null;
					end case;
				
				when READW =>
					if I_membusy = '0' then
						O_memen <= '0';
						O_busy <= '0';
						O_data <= I_memdata(7 downto 0) & I_memdata(15 downto 8) & I_memdata(23 downto 16) & I_memdata(31 downto 24);
						state <= IDLE;
					end if;
				
				when READH =>
					if I_membusy = '0' then
						O_memen <= '0';
						O_busy <= '0';
						O_data <= std_logic_vector(resize(signed(I_memdata(23 downto 16) & I_memdata(31 downto 24)), O_data'length));
						state <= IDLE;
					end if;

				when READB =>
					if I_membusy = '0' then
						O_memen <= '0';
						O_busy <= '0';
						O_data <= std_logic_vector(resize(signed(I_memdata(31 downto 24)), O_data'length));
						state <= IDLE;
					end if;
				
				when WRITEW =>
					if I_membusy = '0' then
						O_memen <= '0';
						O_memwrite <= '0';
						O_busy <= '0';
						state <= IDLE;
					end if;
				
				when WRITEH1 =>
					if I_membusy = '0' then
						-- combine new word and write to memory
						O_memdata <= I_data(7 downto 0) & I_data(15 downto 8) & I_memdata(15 downto 0);
						O_memwrite <= '1';
						state <= WRITEH2;
					end if;
					
				when WRITEH2 =>
					if I_membusy = '0' then
						O_memwrite <= '0';
						O_busy <= '0';
						state <= IDLE;
					end if;
					
				when WRITEB1 =>
					if I_membusy = '0' then
						-- combine new word and write to memory
						O_memdata <= I_data(7 downto 0) & I_memdata(23 downto 0);
						O_memwrite <= '1';
						state <= WRITEB2;
					end if;
					
				when WRITEB2 =>
					if I_membusy = '0' then
						O_memwrite <= '0';
						O_busy <= '0';
						state <= IDLE;
					end if;
				
		
			end case;
		
		end if;
	end process;

end Behavioral;