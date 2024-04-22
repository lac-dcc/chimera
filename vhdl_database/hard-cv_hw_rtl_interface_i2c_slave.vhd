library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.all ;

entity i2c_slave is
	port(
 		data : inout std_logic_vector(7 downto 0 ); 
 		index : inout std_logic_vector(7 downto 0 ); 
 		rd, wr : out std_logic; 
 		scl : in std_logic; 
 		sda : inout std_logic
	); 
end i2c_slave;

architecture systemc of i2c_slave is
	constant SLAVE_WRITE_ADDR : std_logic_vector(6 downto 0) := "1000010"; 
	constant SLAVE_READ_ADDR : std_logic_vector(6 downto 0) := "1000011"; 
	TYPE slave_state IS (DETECT_START, RX_ADDR, ACK_ADDR, ACK_BYTE, DETECT_ACK, NACK, TX_BYTE, RX_BYTE, DETECT_STOP) ; 
	signal state : slave_state ; 
	signal data_i : std_logic_vector(7 downto 0 ) ; 
	signal tx_rxb, new_bit : std_logic ; 
	signal bit_count : std_logic_vector(7 downto 0 ) ;
	begin
	
	
	-- run_i2c
	process(scl, sda)
		 begin
		 	case state is
		 		when detect_start => 
		 			rd <= '0' ;
		 			wr <= '0' ;
		 			if  scl = 'Z'  AND  sda = '0'  then
		 				state <= rx_addr ; 
		 				new_bit <= '0' ;
		 			end if ;
		 		when rx_addr => 
		 			if  bit_count < 8  then
		 				if  scl = '0'  then
		 					sda <= 'Z' ; 
		 					data_i <= (data_i(6 downto 0) & '0') ; 
		 					new_bit <= '1' ;
		 				elsif  scl = 'Z'  AND  new_bit = '1'  then
		 					new_bit <= '0' ; 
		 					bit_count <= (bit_count + 1) ; 
		 					if  sda = 'Z'  then
		 						data_i <= (data_i(7 downto 1) & '1') ;
		 					else
		 						data_i <= (data_i(7 downto 1) & '0') ;
		 					end if ;
		 				end if ;
		 			else
		 				if  data_i = SLAVE_READ_ADDR  then
		 					tx_rxb <= '1' ; 
		 					state <= ack_addr ;
		 				elsif  data_i = SLAVE_WRITE_ADDR  then
		 					tx_rxb <= '0' ; 
		 					state <= ack_addr ;
		 				else
		 					state <= nack ;
		 				end if ; 
		 				new_bit <= '0' ; 
		 				bit_count <= (others => '0') ;
		 			end if ;
		 		when ack_addr => 
		 			data <= data_i ;
		 			if  NOT new_bit = '1'  then
		 				if  scl = '0'  then
		 					sda <= '0' ; 
		 					new_bit <= '1' ;
		 				else
		 					new_bit <= '1' ;
		 				end if ;
		 			else
		 				new_bit <= '0' ; 
		 				state <= rx_byte ;
		 			end if ;
		 		when tx_byte => 
		 			rd <= '0' ;
		 			if  bit_count < 8  then
		 				if  scl = '0'  AND  NOT new_bit = '1'  then
		 					new_bit <= '1' ; 
		 					data_i <= (data_i(6 downto 0) & '0') ; 
		 					bit_count <= (bit_count + 1) ;
		 				elsif  scl = 'Z'  AND  new_bit = '1'  then
		 					new_bit <= '0' ;
		 				end if ;
		 			else
		 				bit_count <= (others => '0') ; 
		 				state <= detect_ack ;
		 			end if ;
		 			if  data_i(7) = '1'  then
		 				sda <= 'Z' ;
		 			else
		 				sda <= 'Z' ;
		 			end if ;
		 		when rx_byte => 
		 			wr <= '0' ;
		 			if  bit_count < 8  then
		 				if  scl = '0'  then
		 					sda <= 'Z' ; 
		 					data_i <= (data_i(6 downto 0) & '0') ; 
		 					new_bit <= '1' ;
		 				elsif  scl = 'Z'  AND  new_bit = '1'  then
		 					new_bit <= '0' ; 
		 					bit_count <= (bit_count + 1) ; 
		 					if  sda = 'Z'  then
		 						data_i <= (data_i(7 downto 1) & '1') ;
		 					else
		 						data_i <= (data_i(7 downto 1) & '0') ;
		 					end if ;
		 				else
		 					if  data_i(0) = '0'  AND  sda = 'Z'  then
		 						bit_count <= (others => '0') ; 
		 						index <= (others => '0') ; 
		 						sda <= 'Z' ; 
		 						state <= detect_start ;
		 					end if ;
		 				end if ;
		 			else
		 				if  scl = '0'  then
		 					sda <= '0' ;
		 				end if ; 
		 				bit_count <= (others => '0') ; 
		 				index <= (index + 1) ; 
		 				state <= ack_byte ;
		 			end if ;
		 		when ack_byte => 
		 			data <= data_i ;
		 			wr <= '1' ;
		 			if  scl = 'Z'  then
		 				new_bit <= '0' ; 
		 				state <= rx_byte ;
		 			end if ;
		 		when nack => 
		 			sda <= 'Z' ;
		 		when detect_stop => 

		 		when others => 
		 			state <= detect_start ;
		 	end case ;
		 end process;  
	
end systemc ;