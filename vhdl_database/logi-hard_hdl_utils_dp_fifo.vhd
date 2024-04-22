----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    15:37:36 06/18/2012 
-- Design Name: 
-- Module Name:    dp_fifo - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
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


library work ;
use work.logi_primitive_pack.all ;
use work.logi_utils_pack.all ;

--! dual port ram based fifo for fast logic to logic communication
entity dp_fifo is
	generic(N : natural := 128 ; --! depth of the fifo
	W : positive := 16; --! width of the fifo
	SYNC_WR : boolean := false;
	SYNC_RD : boolean := false
	);
	port(
 		clk, resetn, sraz : in std_logic; --! system clock, asynchronous and synchronous reset
 		wr, rd : in std_logic; --! fifo write and read signal
		empty, full : out std_logic ; --! fifo stat signals
 		data_out : out std_logic_vector((W - 1) downto 0 ); --! data output of fifo
 		data_in : in std_logic_vector((W - 1) downto 0 ); --! data input of fifo
		nb_available : out unsigned(nbit(N)  downto 0 ) --! number of available tokens in fifo
	); 
end dp_fifo;

architecture Behavioral of dp_fifo is

constant std_fifo_size : std_logic_vector(nbit(N)  downto 0 ) :=  std_logic_vector(to_unsigned(N, nbit(N) + 1));

signal rd_addr, rd_addr_adv, wr_addr: std_logic_vector((nbit(N) - 1) downto 0)  ;
signal nb_free_t, nb_available_t : unsigned(nbit(N) downto 0 ) ;
signal slv_nb_available_t : std_logic_vector(nbit(N) downto 0 ) ;
signal fifo_out, fifo_in : std_logic_vector((W - 1 ) downto 0)  ;
signal rd_old, wr_old, wr_data, rd_data, one_turn, latch_data : std_logic ;
signal rd_rising_edge, wr_rising_edge : std_logic ;
signal rd_falling_edge, wr_falling_edge : std_logic ;

signal en_available_counter, up_downn_available_counter : std_logic ;
signal en_free_counter, up_downn_free_counter, counter_load : std_logic ;

signal fifo_wr, fifo_rd : std_logic ; 

begin

dp_ram0 : dpram_NxN 
	generic map(SIZE => N , NBIT => W, ADDR_WIDTH => nbit(N))
	port map(
 		clk => clk , 
 		we => wr_data ,
 		di =>  data_in ,
		a	=> wr_addr,
 		dpra => rd_addr_adv ,	
		dpo =>  fifo_out 
	); 


data_out <= fifo_out ;
			  
gen_async_rd : if NOT SYNC_RD generate			  		  
	process(resetn, clk)
	begin
		if resetn = '0' then
			rd_old <= '0' ;
		elsif clk'event and clk = '1' then
			rd_old <= rd ;
		end if ;
	end process ;
	rd_falling_edge <= ((NOT rd) AND rd_old);
	fifo_rd <= rd_falling_edge ;
	rd_addr_adv <= rd_addr ;
end generate ;

gen_sync_rd : if SYNC_RD generate			  		  
	fifo_rd <= rd;
	rd_addr_adv <= (rd_addr + 1) when fifo_rd = '1' else
						rd_addr ;
end generate ;


gen_async_wr : if NOT SYNC_WR generate		
process(resetn, clk)
begin
	if resetn = '0' then
		wr_old <= '0' ;
	elsif clk'event and clk = '1' then
		wr_old <= wr ;
	end if ;
end process ;
wr_falling_edge <= ((NOT wr) AND wr_old) ;
fifo_wr <= wr_falling_edge ;
end generate ;

gen_sync_wr : if SYNC_WR generate
fifo_wr <= wr ;
end generate ;

--rd process
process(clk, resetn)
begin
if resetn = '0' then
	rd_addr <= (others => '0') ;
elsif clk'event and clk = '1' then
	if sraz = '1' then
		rd_addr <= (others => '0');
	elsif fifo_rd = '1' and nb_available_t /= 0 then
			rd_addr <= rd_addr + 1;
	end if ;
end if ;
end process ;

-- wr process 
process(clk, resetn)
begin
if resetn = '0' then
	wr_addr <= (others => '0') ;
elsif clk'event and clk = '1' then
	if sraz = '1' then
		wr_addr <= (others => '0');
	elsif fifo_wr = '1' and nb_available_t /= N then
		wr_addr <= wr_addr + 1;
	end if ;
end if ;
end process ;

-- nb available process
process(clk, resetn)
begin
if resetn = '0' then
	nb_available_t <= (others => '0') ;
elsif clk'event and clk = '1' then
	if sraz = '1' then
		nb_available_t <= (others => '0') ;
	elsif fifo_wr = '1' and fifo_rd = '0' and nb_available_t /= N then
		nb_available_t <= nb_available_t + 1 ;
	elsif fifo_rd = '1' and fifo_wr = '0' and nb_available_t /= 0 then
		nb_available_t <= nb_available_t - 1 ;	
	end if ;
end if ;
end process ;


nb_available <= nb_available_t ;



empty <= '1' when nb_available_t = 0 else
			'1' when nb_available_t = 1 and fifo_rd = '1' else -- must check if its useful ...
         '0' ;
			
full <= '1' when nb_available_t = N else
		  '1' when nb_available_t = N - 1 and fifo_wr = '1' else -- must check if its useful ...
		  '0' ;


wr_data <= fifo_wr ;

end Behavioral;

