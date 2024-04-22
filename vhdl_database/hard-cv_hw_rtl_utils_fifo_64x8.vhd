library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.camera.ram_8x64 ;

entity fifo_64x8 is
	port(
 		clk, resetn : in std_logic; 
 		wr, rd : in std_logic; 
		empty, full, data_rdy : out std_logic ;
 		data_out : out std_logic_vector(7 downto 0 ); 
 		data_in : in std_logic_vector(7 downto 0 )
	); 
end fifo_64x8;

architecture systemc of fifo_64x8 is
 
	signal wr_addr, rd_addr, byte_count, ram_addr : std_logic_vector(6 downto 0) ;
	signal wr_data : std_logic_vector(7 downto 0) ;
	signal fullt, emptyt, ready, wri, eni : std_logic ;
	begin
	
	ram_8_0 : ram_8x64
		port map ( 
			clk => NOT clk, 
			addr => ram_addr, 
			di => wr_data, 
			do => data_out, 
			en => '1',
			we => wri
		); 
		
	-- fifo process
	process(clk, resetn)
		 begin
			if resetn = '0' then
				wr_addr <= (others => '0');
				rd_addr <= (others => '0');
				byte_count <= (others => '0');
				ready <= '0' ;
		 	elsif  clk'event and clk = '1' then
				if  wr = '1'  and fullt = '0' then
					ram_addr <= wr_addr ; 
					wr_addr <= wr_addr + 1 ;
					wr_data <= data_in ;
					byte_count <= byte_count + 1 ;
					wri<='1';
					ready <= '0' ;
				elsif rd = '1' and wr = '0' and emptyt = '0' then
					ram_addr <= rd_addr ; 
					rd_addr <= rd_addr + 1 ;
					byte_count <= byte_count - 1 ;
					ready <='1';
				else 
					wri<='0';
					ready <= '0' ;
				end if ;
			end if;
	end process;
	
	process(clk, resetn)
		 begin
			if resetn = '0' then
				data_rdy <= '0' ;
		 	elsif  clk'event and clk = '0' then
				data_rdy <= ready ;
			end if;
	end process ;
	
	
	fullt <= '1' when byte_count = 127 else
			   '0' ;
	
	emptyt <= '1' when byte_count = 0 else
			    '0' ;
				
	full <= fullt ;
	
	empty <= '1' when emptyt = '1' AND ready = '0' else
				'0' ;
	
end systemc ;