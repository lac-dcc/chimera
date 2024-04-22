
--
--
-- COMANDS
--
-- 0x10 - Receive data from Master and save to SRAM
-- 0x20 - Send a single byte from a string to master
--
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_pump is
generic
(
	STR_LEN		: integer := 0
);
port 
(
	str_i			: in string (1 to STR_LEN);
	---
	reset_i		: in  std_logic;
	spi_clk_i	: in  std_logic; 
	spi_ss_i		: in  std_logic := '1'; 
	spi_miso_o	: out  std_logic; 
	spi_mosi_i	: in  std_logic; 
	---
	sram_a_o		: out std_logic_vector(18 downto 0);
	sram_d_o		: out std_logic_vector(7 downto 0);
	sram_we_n_o	: out std_logic := '1'
);
end data_pump;

architecture debug_arch of data_pump is

   signal cnt 		: std_logic_vector(3 downto 0) := "0000";
   signal sbuf		: std_logic_vector(6 downto 0);
	
	constant ACK	: std_logic_vector(7 downto 0) := X"4B"; -- letter K - 0x4b
  	
   signal addr_s	: std_logic_vector(18 downto 0) := (others => '1');
	signal byte_s	: std_logic_vector(7 downto 0);
	signal cmd_s	: std_logic_vector(7 downto 0);
	signal cmd_miso_s	: std_logic_vector(7 downto 0);
	signal we_n_s	: std_logic;
	
	signal letter_s: std_logic_vector(7 downto 0);
	
	signal byte_cnt : integer := 1;
	
	signal clock : std_logic;
	
begin
	


	-- SPI MODE 0 : incoming data on Rising, outgoing on Falling
	process(spi_clk_i)
	begin
	
	
		if falling_edge(spi_clk_i) then
		
				--each time the SS goes down, we will receive a command from the SPI master
				if(spi_ss_i = '1') then -- not selected
				
						spi_miso_o <= 'Z';
				  
				else
				
						case cmd_s is
						
								when x"20" => -- return next byte from the config string
									
										letter_s <= std_logic_vector(to_unsigned(character'pos(str_i(byte_cnt)),8));
										
										if (byte_cnt <= STR_LEN) then
											spi_miso_o <= letter_s(to_integer(unsigned(not cnt(2 downto 0))));
										else
											spi_miso_o <= '0';
										end if;
							
								when others => -- just an ACK
									spi_miso_o <= ACK(to_integer(unsigned(not cnt(2 downto 0))));
									
						end case;
				
				end if;
		end if;
	end process;
	
	--combine the clocks to check for multiple rising
	clock <= spi_clk_i or spi_ss_i;

	-- SPI MODE 0 : incoming data on Rising, outgoing on Falling
	process(clock)
	begin
		if rising_edge(clock) then
				
				we_n_s <= '1';
			
				--each time the SS goes down, we will receive a command from the SPI master
				if(spi_ss_i = '1') then -- not selected
				
						cnt <= "0000";
						byte_cnt <= 1;
						
				else
				
						sbuf(6 downto 1) <= sbuf(5 downto 0);
						sbuf(0) <= spi_mosi_i;
				
				
						-- first 8 bits is the command, the rest, the payload
						if (cnt < "1111") then -- 15
							cnt <= cnt + 1;
						else
							cnt <= "1000"; -- 8

						end if;
						
				
						if (cnt = "0111") then -- 7
							cmd_s <= sbuf(6 downto 0) & spi_mosi_i;
						end if;
					
						
						if (cnt = "1111") then
								case cmd_s is
									when x"10" => --receive data from Master and save to SRAM
										byte_s(7 downto 1) <= sbuf; 
										byte_s(0) <= spi_mosi_i;
										we_n_s <= '0';
										addr_s <= addr_s + 1;
										
									when x"20" => --return next byte from the config string
										byte_cnt <= byte_cnt + 1;
										
									when others => null;
								end case;
						end if;
					
				end if;	
					
		
		end if;
	end process;
	
	sram_a_o		<= addr_s;
	sram_d_o		<= byte_s;
	sram_we_n_o	<= we_n_s;

end debug_arch;