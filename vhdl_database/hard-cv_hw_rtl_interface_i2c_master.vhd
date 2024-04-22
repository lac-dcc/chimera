library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.all ;

entity i2c_master is
	port(
 		clock : in std_logic; 
 		resetn : in std_logic; 
 		slave_addr : in std_logic_vector(6 downto 0 ); 
 		data_in : in std_logic_vector(7 downto 0 );
		data_out : out std_logic_vector(7 downto 0 ); 
 		send : in std_logic; 
 		rcv : in std_logic; 
		hold : in std_logic;
		scl : inout std_logic; 
 		sda : inout std_logic; 

 		dispo, ack_byte, nack_byte : out std_logic
	); 
end i2c_master;

architecture systemc of i2c_master is
	constant QUARTER_BIT : integer := 30; 
	constant HALF_BIT : integer := 60; 
	constant FULL_BIT : integer := 120; 
	TYPE master_state IS (IDLE, I2C_START, TX_ADDR, ACK_ADDR, TX_BYTE, RX_BYTE, ACK, HOLDING, I2C_STOP) ; 
	signal state : master_state ; 
	signal tick_count : std_logic_vector(7 downto 0 ) := (others => '0'); 
	signal bit_count : std_logic_vector(7 downto 0 ) := (others => '0'); 
	signal slave_addr_i : std_logic_vector(7 downto 0 )  := (others => '0'); 
	signal data_i : std_logic_vector(7 downto 0 )  := (others => '0'); 
	signal send_rvcb : std_logic ;
	begin
	
	
	-- run_i2c
	process(resetn, clock)
		 begin
		 if resetn = '0' then
			scl <= 'Z' ;
		 	sda <= 'Z' ;
			state <= idle ;
			tick_count <= (others => '0') ; 
		 	bit_count <= (others => '0') ;
		 elsif clock'event and clock = '1' then
		 	case state is
		 		when idle => 
		 			scl <= 'Z' ;
		 			sda <= 'Z' ;
		 			dispo <= '1' ;
		 			ack_byte <= '0' ;
					nack_byte <= '0' ;
		 			if  (send = '1'  OR  rcv = '1') and scl = '1'  then
		 				slave_addr_i <= (slave_addr & rcv) ; 
		 				send_rvcb <= send ; 
		 				state <= i2c_start ; 
		 				tick_count <= (others => '0') ; 
		 				bit_count <= (others => '0') ;
		 			end if ;
		 		when i2c_start => 
		 			dispo <= '0' ;
		 			ack_byte <= '0' ;
					nack_byte <= '0' ;
		 			if  tick_count < QUARTER_BIT  then
		 				scl <= 'Z' ; 
		 				sda <= 'Z' ; 
		 				tick_count <= (tick_count + 1) ;
		 			elsif  tick_count < HALF_BIT  then
		 				scl <= 'Z' ; 
		 				sda <= '0' ; 
		 				tick_count <= (tick_count + 1) ;
		 			else
		 				tick_count <= (others => '0') ; 
		 				scl <= '0' ; 
		 				state <= tx_addr ;
		 			end if ;
		 		when tx_addr => 
		 			dispo <= '0' ;
		 			ack_byte <= '0' ;
					nack_byte <= '0' ;
		 			if  bit_count < 8  then
                                          
                                          if  tick_count < QUARTER_BIT  then
                                            scl <= '0' ; 
                                            tick_count <= (tick_count + 1) ;
                                          elsif tick_count < HALF_BIT then
                                            scl <= '0';
                                            if  slave_addr_i(7) = '1'  then
                                              sda <= 'Z' ;
                                            else
                                              sda <= '0' ;
                                            end if ; 
                                            if sda = slave_addr_i(7) then
                                              tick_count <= tick_count + 1;  
                                            end if;
                                          elsif  tick_count < FULL_BIT  then
                                            scl <= 'Z' ; 
                                            if  slave_addr_i(7) = '1'  then
                                              sda <= 'Z' ;
                                            else
                                              sda <= '0' ;
                                            end if ;
                                            
                                            if scl = '1' then
                                              tick_count <= (tick_count + 1) ;
                                            end if;
                                          else
                                            slave_addr_i <= (slave_addr_i(6 downto 0) & '0') ; 
                                            bit_count <= (bit_count + 1) ; 
                                            tick_count <= (others => '0') ;
                                          end if ;
		 			else
                                          bit_count <= (others => '0') ; 
                                          scl <= '0' ; 
                                          state <= ack_addr ;
		 			end if ;
		 		when ack_addr => 
		 			dispo <= '0' ;
		 			ack_byte <= '0' ;
		 			if  tick_count < HALF_BIT  then
		 				scl <= '0' ; 
		 				sda <= 'Z' ; 
		 				tick_count <= (tick_count + 1) ;
		 			elsif  tick_count < FULL_BIT  then
		 				scl <= 'Z' ; 
		 				sda <= 'Z' ;
						if (scl = '1') then
							tick_count <= (tick_count + 1) ;
						end if;
		 			else
                                          tick_count <= (others => '0') ; 
                                          if  sda = '0'  then
                                            nack_byte <= '0' ;
                                            if  send_rvcb = '1'  then
                                              data_i <= data_in ; 
                                              state <= tx_byte ;
                                            else
                                              data_out <= data_i ; 
                                              state <= rx_byte ;
                                            end if ;
                                          else
                                            nack_byte <= '1' ;
                                            state <= i2c_stop ;
                                          end if ;
                                        end if ;
		 		when tx_byte => 
		 			dispo <= '0' ;
		 			ack_byte <= '0' ;
					nack_byte <= '0' ;
		 			if  bit_count < 8  then
		 				if  tick_count < QUARTER_BIT  then
                                                  scl <= '0' ; 
                                                  tick_count <= (tick_count + 1) ;
                                                elsif tick_count < HALF_BIT then
                                                  scl <= '0';
                                                  if  data_i(7) = '1'  then
                                                    sda <= 'Z' ;
                                                  else
                                                    sda <= '0' ;
                                                  end if ; 

                                                  if (sda = data_i(7)) then
                                                    tick_count <=  tick_count +1;
                                                  end if;
		 				elsif  tick_count < FULL_BIT  then
                                                  scl <= 'Z' ; 
                                                  if  data_i(7) = '1'  then
                                                    sda <= 'Z' ;
                                                  else
                                                    sda <= '0' ;
                                                  end if ; 
                                                  
                                                  if (scl='1') then
                                                    tick_count <= (tick_count + 1) ;
                                                  end if;
		 				else
		 					data_i <= (data_i(6 downto 0) & '0') ; 
		 					bit_count <= (bit_count + 1) ; 
		 					tick_count <= (others => '0') ;
		 				end if ;
		 			else
		 				bit_count <= (others => '0') ; 
		 				scl <= '0' ; 
		 				state <= ack ;
		 			end if ;
		 		when rx_byte => 
		 			dispo <= '0' ;
		 			ack_byte <= '0' ;
					nack_byte <= '0' ;
		 			if  bit_count < 8  then
		 				if  tick_count < HALF_BIT  then
		 					scl <= '0' ; 
		 					sda <= 'Z' ; 
		 					tick_count <= (tick_count + 1) ;
		 				elsif  tick_count < FULL_BIT  then
		 					scl <= 'Z' ; 
--		 					data_i <= (data_i(7 downto 1) & sda) ; 
							if (scl='1') then
								tick_count <= (tick_count + 1) ;
							end if;
		 				else
		 					data_i <= (data_i(6 downto 0) & sda) ; 
		 					bit_count <= (bit_count + 1) ; 
		 					tick_count <= (others => '0') ;
		 				end if ;
		 			else
		 				bit_count <= (others => '0') ; 
		 				scl <= '0' ; 
		 				state <= ack ;
                                                data_out <= data_i;
		 			end if ;
		 		when ack => 
		 			dispo <= '0' ;
		 			ack_byte <= '1' ;
		 			if  tick_count < QUARTER_BIT  then
		 				scl <= '0' ;
                                                sda <= 'Z';
                                                tick_count <= (tick_count + 1) ;
                                        elsif tick_count < HALF_BIT  then
                                                scl <= '0';
                                                if send_rvcb='0' and hold='1'  then
                                                  sda <= '0';
                                                else
                                                  sda <= 'Z';
                                                end if;
		 				tick_count <= (tick_count + 1) ;
		 			elsif  tick_count < FULL_BIT  then
		 				scl <= 'Z' ;
                                                if send_rvcb='0' and hold='1' then
                                                  sda <= '0';
                                                else
                                                  sda <= 'Z';
                                                end if;
						if (scl = '1') then
                                                  tick_count <= (tick_count + 1) ;
						end if;
		 			else
                                          state <= holding;
                                        end if;
                                          
                          when holding =>
                                  ack_byte <= '0';
                                  if hold='0' then                                -- Allow pauses in bursts
                                    tick_count <= (others => '0') ;
                                    sda <= 'Z';
                                    if  ((sda='0' and send = '1'  AND  send_rvcb = '1' ) OR ( rcv = '1'  AND  send_rvcb = '0' )) then
                                      if  send_rvcb = '1'  then
                                        data_i <= data_in ; 
                                        state <= tx_byte ;
                                      else
                                        data_out <= data_i ; 
                                        state <= rx_byte ;
                                      end if ;
                                    else
                                      nack_byte <= '1' ;
                                      state <= i2c_stop ;
                                    end if ;
                                  end if;

                        when i2c_stop => 
                                  ack_byte <= '0' ;
                                  nack_byte <= '0' ;
                                  dispo <= '0' ;
                                  if   tick_count < QUARTER_BIT  then
                                    scl <= '0' ; 
                                    sda <= '0' ; 
                                    tick_count <= (tick_count + 1) ;
                                  elsif  tick_count < (HALF_BIT+QUARTER_BIT)  then
                                    scl <= 'Z' ; 
                                    sda <= '0' ; 
                                    if scl='1' then
                                      tick_count <= (tick_count + 1) ;
                                    end if;
                                  elsif tick_count < FULL_BIT  then
                                    scl <= 'Z' ; 
                                    sda <= 'Z' ; 
                                    if (scl='1' and sda='1') then
                                      tick_count <= (tick_count + 1) ;
                                    end if;
                                  else
                                    scl <= 'Z' ;
                                    sda <= 'Z' ;
                                    state <= idle ;
                                  end if ;
                        end case ;
                 end if;
		 end process;  
	
end systemc ;
