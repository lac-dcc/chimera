----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    22:49:30 03/13/2013 
-- Design Name: 
-- Module Name:    blob_manager - Behavioral 
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
use work.utils_pack.all ;
use work.primitive_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blob_manager is
generic(NB_BLOB : positive := 32);
	port(
		clk, resetn : in std_logic ; --standard signals
		blob_class : in std_logic_vector(7 downto 0);
		blob_index : in std_logic_vector(7 downto 0); -- input blob_index
		blob_index_to_merge : in std_logic_vector(7 downto 0); -- input blob_index to merge
		next_blob_index : out std_logic_vector(7 downto 0); -- next available index
		add_pixel : in std_logic ; -- add pixel to blob
		new_blob : in std_logic ; -- initializing new blob
		merge_blob : in std_logic ; --merging two blobs
		pixel_posx, pixel_posy : in std_logic_vector(9 downto 0); -- position of the pixel to add to the blob
		
		send_blobs : in std_logic ;
		--memory_interface to copy results onpixel_in_vsync
		mem_addr : out std_logic_vector(15 downto 0);
		mem_data : inout std_logic_vector(15 downto 0);
		mem_wr : out std_logic
	);
end blob_manager;

architecture Behavioral of blob_manager is

type manager_state_type is (TRACK, SEND);
signal manager_state, next_manager_state : manager_state_type ;

signal current_blob_posx1, current_blob_posx0 : std_logic_vector(9 downto 0);
signal current_blob_posy1, current_blob_posy0 : std_logic_vector(9 downto 0);
signal blob_to_merge_posx1, blob_to_merge_posx0 : std_logic_vector(9 downto 0);
signal blob_to_merge_posy1, blob_to_merge_posy0 : std_logic_vector(9 downto 0);
signal add_pixel_posx0, add_pixel_posx1 : std_logic_vector(9 downto 0);
signal add_pixel_posy0, add_pixel_posy1 : std_logic_vector(9 downto 0);
signal merge_posx0, merge_posx1 :std_logic_vector(9 downto 0);
signal merge_posy0, merge_posy1 :std_logic_vector(9 downto 0);
signal blob_data_to_write, current_blob_data, blob_to_merge_data : std_logic_vector(47 downto 0);
signal index_in : std_logic_vector(7 downto 0);
signal slv_next_blob_index_tp, next_free_addr, merged_free_addr : std_logic_vector(7 downto 0);
signal current_blob_data_addr_mod, blob_to_merge_data_addr, current_blob_data_addr : std_logic_vector(7 downto 0);
signal index_wr, blob_wr : std_logic ;
signal merge_blob_latched, new_blob_latched, add_pixel_latched : std_logic ;
signal index_addr : std_logic_vector(7 downto 0);
signal done_send, sraz_blob_data_send, en_blob_data_send, sraz_blob_send_counter, en_blob_send_counter : std_logic ;
signal blob_send_count : std_logic_vector(7 downto 0);
signal blob_data_send_count : std_logic_vector(1 downto 0);
signal already_merged : std_logic ;

signal push_addr, pop_addr, en_free_addr_counter, fifo_empty : std_logic ;

signal sraz : std_logic  ;
begin


process(clk, resetn)
begin
	if resetn = '0' then
		merge_blob_latched <= '0';
		add_pixel_latched <= '0';
		new_blob_latched <= '0' ;
	elsif clk'event and clk = '1' then
		merge_blob_latched <= merge_blob ;
		add_pixel_latched <= add_pixel ;
		new_blob_latched <= new_blob ;
	end if ;
end process ;


index_in <= current_blob_data_addr when merge_blob_latched='1' else
				next_free_addr when new_blob='1' and fifo_empty = '1' else
				merged_free_addr when new_blob='1' and fifo_empty = '0' else
				(others => '0');
				
				
index_wr <= '1' when new_blob = '1' else
				'1' when merge_blob_latched = '1' else -- overwriting to point to new mem location
				'0' ;	
-- must add a stack of free addresses that get filled when freeing blobs

index_addr <=  std_logic_vector(blob_index) when new_blob = '1'  else
				   std_logic_vector(blob_index_to_merge) ;

blob_index_ram : dpram_NxN
	generic map(SIZE => 256 , NBIT => 8, ADDR_WIDTH => 8)
	port map(
 		clk => clk,
 		we => index_wr,
 		spo => blob_to_merge_data_addr ,
		dpo => current_blob_data_addr , 
 		di => index_in,  
 		a => index_addr,
		dpra => std_logic_vector(blob_index)
	); 
	
	
push_addr <= '1' when merge_blob_latched = '1' and already_merged = '0' else
				 '0' ;	
pop_addr <= '1' when fifo_empty = '0' and new_blob = '1' else 
				'0' ;
free_addr_fifo : small_fifo
generic map( WIDTH => 8, DEPTH => 8)
port map(clk => clk, resetn => resetn,
	  push => push_addr, pop => pop_addr,
	  full => open, empty => fifo_empty,
	  data_in => blob_to_merge_data_addr,
	  data_out => merged_free_addr
	  );
	
	
	
current_blob_data_addr_mod <= blob_send_count when manager_state = SEND else
										next_free_addr when new_blob='1' and fifo_empty = '1' else
										merged_free_addr when new_blob='1' and fifo_empty = '0' else
										current_blob_data_addr ;
blob_data_ram : dpram_NxN -- 40bit data 1x32bit ram + 1x8 bit ram
	generic map(SIZE => 256 , NBIT => 48, ADDR_WIDTH => 8)
	port map(
 		clk => clk,
 		we => blob_wr,
 		spo => current_blob_data ,
		dpo => blob_to_merge_data ,
 		di => blob_data_to_write,  
 		a => current_blob_data_addr_mod,
		dpra => blob_to_merge_data_addr
	); 
already_merged <= '1' when current_blob_data_addr = blob_to_merge_data_addr else
						'0' ;
	
	
current_blob_posx1 <= 	current_blob_data(39 downto 30);
current_blob_posy1 <= current_blob_data(29 downto 20);
current_blob_posx0 <= current_blob_data(19 downto 10);
current_blob_posy0 <= current_blob_data(9 downto 0);

blob_to_merge_posx1 <= 	blob_to_merge_data(39 downto 30);
blob_to_merge_posy1 <= blob_to_merge_data(29 downto 20);
blob_to_merge_posx0 <= blob_to_merge_data(19 downto 10);
blob_to_merge_posy0 <= blob_to_merge_data(9 downto 0);

add_pixel_posx0 <= std_logic_vector(pixel_posx) when pixel_posx < current_blob_posx0 else
						 current_blob_posx0 ;
add_pixel_posx1 <= std_logic_vector(pixel_posx) when pixel_posx > current_blob_posx1 else
						 current_blob_posx1 ;
add_pixel_posy0 <= std_logic_vector(pixel_posy) when pixel_posy < current_blob_posy0 else
						 current_blob_posy0 ;
add_pixel_posy1 <= std_logic_vector(pixel_posy) when pixel_posy > current_blob_posy1 else
						 current_blob_posy1 ; 
						 
						 
merge_posx0 <= std_logic_vector(pixel_posx) when pixel_posx < current_blob_posx0 and pixel_posx < blob_to_merge_posx0 else
					blob_to_merge_posx0 when blob_to_merge_posx0 < current_blob_posx0 else
					current_blob_posx0 ;
merge_posx1 <= std_logic_vector(pixel_posx) when pixel_posx > current_blob_posx1 and pixel_posx > blob_to_merge_posx1 else
					blob_to_merge_posx1 when blob_to_merge_posx1 > current_blob_posx1 else
					current_blob_posx1 ;
merge_posy0 <= std_logic_vector(pixel_posy) when pixel_posy < current_blob_posy0 and pixel_posy < blob_to_merge_posy0 else
					blob_to_merge_posy0 when blob_to_merge_posy0 < current_blob_posy0 else
					current_blob_posy0 ;
merge_posy1 <= std_logic_vector(pixel_posy) when pixel_posy > current_blob_posy1 and pixel_posy > blob_to_merge_posy1 else
					blob_to_merge_posy1 when blob_to_merge_posy1 > current_blob_posy1 else
					current_blob_posy1 ;						 

	
blob_data_to_write <=(others => '0') when manager_state = SEND else
							 blob_class & std_logic_vector(pixel_posx) & std_logic_vector(pixel_posy) & std_logic_vector(pixel_posx) & std_logic_vector(pixel_posy) when new_blob = '1' else
							 blob_class & add_pixel_posx1 & add_pixel_posy1 & add_pixel_posx0 & add_pixel_posy0 when merge_blob_latched = '1' and already_merged = '1' else
							 blob_class & merge_posx1 & merge_posy1 & merge_posy0 & merge_posx0 when merge_blob_latched = '1' else
							 blob_class & add_pixel_posx1 & add_pixel_posy1 & add_pixel_posx0 & add_pixel_posy0 when add_pixel_latched = '1' else
							 (others => '0');
							 
--blob data structure
-- blob class 8 bit
-- posx1 10 bit	
-- posy1 10 bit
-- posx0 10 bit
-- posy0 10 bit						 
							 

blob_wr <= '1' when new_blob = '1' else
			  '1' when merge_blob_latched = '1' else
			  '1' when add_pixel_latched = '1' else
			  '1' when blob_data_send_count = 2 else
			  '0' ;

next_free_index_pointer: simple_counter
	 generic map(NBIT => 8 )
    port map( clk => clk,
           resetn => resetn,
			  sraz => '0',
			  load => sraz,
			  E => std_logic_vector(to_unsigned(1, 8)),
           en => new_blob, 
           Q => slv_next_blob_index_tp
			  );
next_blob_index <= slv_next_blob_index_tp;

next_free_addr_counter: simple_counter
	 generic map(NBIT => 8 )
    port map( clk => clk,
           resetn => resetn,
			  sraz => sraz,
			  load => sraz,
			  E => (others => '0'),
           en => en_free_addr_counter, 
           Q => next_free_addr
			  );
en_free_addr_counter <= new_blob when fifo_empty = '1' else
								'0' ;



process(clk, resetn)
	begin
	if resetn = '0' then
		manager_state <= TRACK ;
	elsif clk'event and clk = '1' then
		manager_state <= next_manager_state ;
	end if ;
end process ;

process(send_blobs, done_send, manager_state)
	begin
	next_manager_state <= manager_state ;
	case manager_state is
		when TRACK =>
			if send_blobs = '1' then
				next_manager_state <= SEND;
			end if ;
		when SEND =>
				if done_send = '1' then
					next_manager_state <= TRACK;
				end if;
	end case ;
end process;

sraz <= '1'  when manager_state = SEND and next_manager_state = TRACK else
		  '0';

blob_send_counter: simple_counter
	 generic map(NBIT => 8 )
    port map( clk => clk,
           resetn => resetn,
			  sraz => sraz_blob_send_counter,
			  load => '0',
			  en => en_blob_send_counter, 
			  E => (others => '0'),
           Q => blob_send_count
	 );

with manager_state select
	sraz_blob_send_counter <= '1' when TRACK,
										'0' when others ;
	
en_blob_send_counter <= '1' when blob_data_send_count = 2 else
								'0' ;	

blob_data_send_counter: simple_counter
	 generic map(NBIT => 2 )
    port map( clk => clk,
           resetn => resetn,
			  sraz => sraz_blob_data_send,
			  load => '0',
			  en => en_blob_data_send, 
			  E => "00",
           Q => blob_data_send_count
	 ); 

with manager_state select
	sraz_blob_data_send <= '1' when TRACK,
								  '0' when others ;
with manager_state select
	en_blob_data_send <= '1' when SEND,
								'0' when others ;
	
mem_data <= current_blob_data(15 downto 0) when blob_data_send_count = 0 else
				current_blob_data(31 downto 16) when blob_data_send_count = 1 else
				current_blob_data(47 downto 32) ;
				
mem_addr(9 downto 0) <= blob_send_count & blob_data_send_count;
mem_addr(15 downto 10) <= (others => '0');


mem_wr <= '1' when manager_state = SEND and blob_data_send_count < 3 else
			 '0' ;
	
done_send <= '1' when blob_data_send_count = 2 and blob_send_count = (NB_BLOB-1) else
		  '0' ;
		  
		  
--TODO: store freed blob data addr into indexing ram
--TODO: zeroed freed blob data

end Behavioral;

