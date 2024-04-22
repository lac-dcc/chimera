library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
		  use ieee.math_real.log2;
		  use ieee.math_real.ceil;
		  
library work;
        use work.generic_components.all ;


entity fifo_Nx8 is
	generic(N : natural := 128);
	port(
 		clk, resetn, sraz : in std_logic; 
 		wr, rd : in std_logic; 
		empty, full, data_rdy : out std_logic ;
 		data_out : out std_logic_vector(7 downto 0 ); 
 		data_in : in std_logic_vector(7 downto 0 )
	); 
end fifo_Nx8;

architecture behavioral of fifo_Nx8 is
	 constant NBIT : integer := integer(ceil(log2(real(N)))); -- number of bits for addresses
	signal wr_addr, rd_addr, byte_count, ram_addr : std_logic_vector((NBIT - 1) downto 0) ;
	signal wr_data : std_logic_vector(7 downto 0) ;
	signal fullt, emptyt, ready, wri, nclk : std_logic ;
	begin
	
	nclk <= NOT clk ; --shifted clock
	
	ram_8_0 : ram_Nx8
		generic map(N => N, A => NBIT)
		port map ( 
			clk => nclk, --ram samples data on falling edge of clock
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
				if sraz = '1' then
					wr_addr <= (others => '0');
					rd_addr <= (others => '0');
					byte_count <= (others => '0');
					wri<='0';
					ready <= '0' ;
				elsif  wr = '1'  and fullt = '0' then
					ram_addr <= wr_addr ; -- registering address
					if wr_addr < (N - 1) then
						wr_addr <= wr_addr + 1 ; -- inscreasing pointer
					else
						wr_addr <= (others => '0') ;
					end if;
					wr_data <= data_in ; 
					byte_count <= byte_count + 1 ;
					wri<='1';
					ready <= '0' ;
				elsif rd = '1' and wr = '0' and emptyt = '0' then -- write is prioritized aginst read
					wri<='0';
					ram_addr <= rd_addr ; 
					if rd_addr < (N - 1) then
						rd_addr <= rd_addr + 1 ;
					else
						rd_addr <= (others => '0') ;
					end if;
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
				data_rdy <= ready ; -- data is ready on falling edge of clock
			end if;
	end process ;
	
	
	fullt <= '1' when byte_count = (N - 1) else 
			   '0' ;
	
	emptyt <= '1' when byte_count = 0 else
			    '0' ;
				
	full <= fullt ;
	
	empty <= '1' when emptyt = '1' AND ready = '0' else -- empty is active id buffer is empty and no data is being read
				'0' ;
	
end behavioral ;