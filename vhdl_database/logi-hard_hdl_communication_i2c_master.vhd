----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:28:10 07/01/2014 
-- Design Name: 
-- Module Name:    i2c_master - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity i2c_master is
generic(i2c_freq_hz : positive := 100_000;
		  clk_freq_hz : positive := 100_000_000);
port(
 		clk : in std_logic; 
 		reset : in std_logic; 
 		slave_addr : in std_logic_vector(6 downto 0 ); 
 		data_in : in std_logic_vector(7 downto 0 );
		
 		i2c_read : in std_logic; 
 		i2c_write : in std_logic; 
		scl : inout std_logic; 
 		sda : inout std_logic; 
		
		data_out : out std_logic_vector(7 downto 0 ); 
		new_data : out std_logic ;
 		ack, nack, busy : out std_logic
	); 
end i2c_master;

architecture Behavioral of i2c_master is
	constant clk_div : positive := ((clk_freq_hz/i2c_freq_hz)/4)-1 ;
	TYPE master_state IS (IDLE, I2C_START, TX_ADDR, ACK_ADDR, TX_BYTE, RX_BYTE, ACK_BYTE, HOLDING, I2C_STOP) ; 
	
	signal cur_state, next_state : master_state ; 

	signal modulo_counter : std_logic_vector(15 downto 0);
	signal end_modulo : std_logic ;
	
	signal cycle_counter : std_logic_vector(1 downto 0);
	signal quarter, half, full : std_logic ;
	
	signal transmit_buffer, receive_buffer, addr_buffer : std_logic_vector(7 downto 0);
	signal bit_counter : std_logic_vector(2 downto 0);
	
	signal write_mode : std_logic ;
	signal sda_unbuf, sda_latched : std_logic ;
	signal sda_shift_reg : std_logic_vector(5 downto 0);
	signal is_acked : std_logic ;
begin

	process(clk, reset)
	begin
		if reset = '1' then
			modulo_counter <= std_logic_vector(to_unsigned(clk_div, 16));
			cycle_counter <= (others => '0');
		elsif clk'event and clk = '1' then
			if cur_state = IDLE then
					modulo_counter <= std_logic_vector(to_unsigned(clk_div, 16));
					cycle_counter <= (others => '0');
			elsif modulo_counter = 0 then
					modulo_counter <= std_logic_vector(to_unsigned(clk_div, 16));
					cycle_counter <= cycle_counter + 1;
			else
				modulo_counter <= modulo_counter - 1 ;
			end if ;
		end if ;
	end process ;
	end_modulo  <= '1' when modulo_counter = 0 else
						'0' ;
			
	quarter <= '1' when cycle_counter = 1 else
				  '1' when cycle_counter = 3 else
				  '0' ;
				  
	half <= '1' when cycle_counter = 2 else
			  '0' ;
			  
	full <= '1' when cycle_counter = 3 and  end_modulo = '1' else
			  '0' ;
			  
			  
	process(clk, reset)
	begin
		if reset = '1' then
			cur_state <= IDLE ;
		elsif clk'event and clk = '1' then
			cur_state <= next_state ;
		end if ;
	end process ;
	
	process(cur_state, bit_counter, write_mode, cycle_counter, end_modulo, quarter, half, full, i2c_write, i2c_read, sda)
	begin
		next_state <= cur_state ;
		case (cur_state) is
			when IDLE =>
				if i2c_write = '1' then
					next_state <= I2C_START ;
				elsif i2c_read = '1' then
					next_state <= I2C_START ;
				end if ;
			when I2C_START =>
				if full = '1' then
					next_state <= TX_ADDR ;
				end if ;
			when TX_ADDR =>
				if full = '1' and bit_counter = 7 then
					next_state <= ACK_ADDR ;
				end if ;
			when ACK_ADDR =>
				if full = '1' and is_acked = '1' and write_mode = '1' then
					next_state <= TX_BYTE ;
				elsif full = '1' and is_acked = '1' and write_mode = '0' then
					next_state <= RX_BYTE ;
				elsif full = '1' and is_acked = '0' then
					next_state <= I2C_STOP ;
				end if ;
			when TX_BYTE =>
				if full = '1' and bit_counter = 7 then
					next_state <= ACK_BYTE ;
				end if ;
			when RX_BYTE =>
				if full = '1' and bit_counter = 7 then
					next_state <= ACK_BYTE ;
				end if ;
			when ACK_BYTE =>
				if full = '1' and i2c_write = '1' and is_acked = '1' then -- 
					next_state <= TX_BYTE ;
				elsif full = '1' and i2c_read = '1' then
					next_state <= RX_BYTE ;
				elsif full = '1' then
					next_state <= I2C_STOP ;
				end if ;	
			when I2C_STOP =>
				if full = '1' then
					next_state <= IDLE ;
				end if ;
			when others => 
		end case ;
	end process ;
	
	scl <= 'Z' when cur_state = I2C_START and cycle_counter < 2 else
			 '0' when cur_state = I2C_START and cycle_counter >= 2 else
			 'Z' when cur_state = IDLE else
			 '0' when cycle_counter < 2 else
			 'Z' ;
			 
   sda_unbuf <= '0' when cur_state = I2C_START else
			 '0' when cur_state = I2C_STOP and cycle_counter <= 2 else
			 '1' when cur_state = I2C_STOP and cycle_counter > 2 else -- need to make sure its enough ...
			 '1' when cur_state = IDLE else
			 '1' when cur_state = TX_ADDR and addr_buffer(7) = '1' else
			 '0' when cur_state = TX_ADDR and addr_buffer(7) = '0' else
			 '1' when cur_state = TX_BYTE and transmit_buffer(7) = '1' else
			 '0' when cur_state = TX_BYTE and transmit_buffer(7) = '0' else
			 '0' when cur_state = ACK_BYTE and write_mode = '0' and i2c_read = '1' else
			 '1' ;
			 
	process(clk, reset)
	begin
		if reset = '1' then
			sda_shift_reg <= (others => '1');
		elsif clk'event and clk = '1'  then
			sda_shift_reg(0) <= sda_unbuf ;
			sda_shift_reg(sda_shift_reg'high downto 1) <= sda_shift_reg(sda_shift_reg'high-1 downto 0);
		end if ;
	end process ;
	
	sda <= 'Z' when cur_state = ACK_BYTE and write_mode = '1' else
			 '0' when sda_shift_reg(sda_shift_reg'high) = '0' else
			 'Z' ;
	
	
	process(clk, reset)
	begin
		if reset = '1' then
			is_acked <= '0' ;
		elsif clk'event and clk = '1'  then
			if (cur_state = ACK_BYTE or cur_state = ACK_ADDR ) and sda = '0' then
				is_acked <= '1' ;
			elsif cur_state /= ACK_BYTE then
				is_acked <= '0' ;
			end if ;
		end if ;
	end process ;
	
	ack <= '1' when cur_state = ACK_BYTE and  is_acked = '1' and full = '1' else
			 '1' when cur_state = ACK_BYTE and  next_state = RX_BYTE else
			 '1' when cur_state = ACK_ADDR and is_acked = '1' and full = '1' else
			 '0' ;
					
	nack <= 		 '1' when cur_state = ACK_BYTE and write_mode = '1' and full='1' and is_acked = '0' else
					 '1' when cur_state = ACK_ADDR and full='1' and is_acked = '0' else
					 '0' ;
					
	busy <= '0' when cur_state = IDLE else
				'1' ;
				
	new_data <= '1' when cur_state = ACK_BYTE and write_mode = '0' else
					'0' ;

	process(clk, reset)
	begin
		if reset = '1' then
			transmit_buffer <=  (others => '0') ;
			receive_buffer <=  (others => '0') ;
			addr_buffer <=  (others => '0') ;
			bit_counter <=  (others => '0') ;
		elsif clk'event and clk = '1'  then

			if (cur_state = IDLE and i2c_write = '1') or i2c_read = '1' then
				addr_buffer <= slave_addr & i2c_read ;
			elsif cur_state = TX_ADDR and full = '1' then
				addr_buffer(7 downto 1) <= addr_buffer(6 downto 0);
			end if;


			if cur_state = IDLE and i2c_write = '1' then
				transmit_buffer <= data_in ;
			elsif cur_state = TX_BYTE and full = '1' then
				transmit_buffer(7 downto 1) <= transmit_buffer(6 downto 0);
				transmit_buffer(0) <= '0' ;
			elsif cur_state = ACK_BYTE and i2c_write = '1' and is_acked = '1' then
				transmit_buffer <= data_in;
			end if;
			
			
			if cur_state = IDLE then
				receive_buffer <= (others => '0') ;
			elsif cur_state = RX_BYTE and half = '1' then
				receive_buffer(7 downto 1) <= receive_buffer(6 downto 0);
				receive_buffer(0) <= sda ;
			end if;
			
			
			if cur_state = IDLE or cur_state = ACK_BYTE or cur_state = ACK_ADDR then
				bit_counter <=  (others => '0') ;
			elsif (cur_state = TX_ADDR or cur_state = TX_BYTE) and full = '1' then
				bit_counter <=  bit_counter + 1 ;
			end if;
			
			
		end if ;
	end process ;



	process(clk, reset)
	begin
		if reset = '1' then
			write_mode <= '0' ;
		elsif clk'event and clk = '1' then
			if cur_state = IDLE and i2c_write = '1' then
				write_mode <= '1' ;
			elsif cur_state = I2C_STOP then
				write_mode <= '0' ;
			end if;
		end if ;
	end process ;

	


end Behavioral;

