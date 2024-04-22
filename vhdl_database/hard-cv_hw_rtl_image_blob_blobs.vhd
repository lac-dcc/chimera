----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    12:26:44 03/14/2012 
-- Design Name: 
-- Module Name:    blobs - Behavioral 
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
use ieee.math_real.log2;
use ieee.math_real.ceil;

library work ;
use work.image_pack.all ;
use work.utils_pack.all ;
use work.blob_pack.all ;
use work.primitive_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blobs is
	generic(NB_BLOB : positive := 32);
	port(
		clk, resetn, sraz : in std_logic ; --standard signals
		blob_index : in unsigned(7 downto 0); -- blob index to madd/merge with
		next_blob_index : out unsigned(7 downto 0); -- available index
		blob_index_to_merge : in unsigned(7 downto 0); -- the blob index to merge
		true_blob_index : out unsigned(7 downto 0); -- blob index after merge
		add_pixel : in std_logic ; -- add pixel to blob
		new_blob : in std_logic ; -- getting new blob
		
		merge_blob : in std_logic ; -- merge blob at blob index with blob index
		pixel_posx, pixel_posy : in unsigned(9 downto 0); -- position of the pixel to add to the blob
		
		
		--output interface
		blob_data : out std_logic_vector(7 downto 0); -- data of blob
		oe : in std_logic ;
		send_blob	:	out std_logic 
	);
 
end blobs;


architecture Behavioral of blobs is

type PIXEL_ADD_MAE is (INIT_BLOB1 , INIT_BLOB2, WAIT_PIXEL, LOAD_VALUE, COMPARE_BLOB, NEW_BLOB1, MERGE_BLOB1, MERGE_BLOB2, MERGE_BLOB3,  UPDATE_BLOB);

signal pixel_state : PIXEL_ADD_MAE ;
signal ram0_out, ram0_in : std_logic_vector(39 downto 0);
signal blobxmin, blobxmax, blobymin, blobymax, newxmin, newxmax, newymin, newymax : unsigned(9 downto 0);
signal ram_addr, merge_ram_addr, ram_addr_tp, free_addr, blob_merge_addr, blob_addr  : std_logic_vector(7 downto 0);
signal ram_en, ram_wr, index_wr : std_logic ;
signal blob_index_init, blob_index_tp: unsigned(7 downto 0);
signal index_in : unsigned(7 downto 0);
signal nclk, to_merge : std_logic ;
signal nb_free_index : unsigned (7 downto 0);
signal next_blob_index_tp, unused_blob_index : unsigned (7 downto 0);
signal pos_blob_index, pos_merge_index : unsigned(7 downto 0);
signal blob_index_latched, blob_index_to_merge_latched : std_logic_vector(7 downto 0) ;


signal clear_blob, sender_active : std_logic ;


signal en_free_blob_pointer, en_free_index_counter, en_uninitialized_blob_pointer : std_logic ;
signal load_free_blob_pointer, load_free_index_counter, load_uninitialized_blob_pointer : std_logic ;
signal inc_free_index_counter : std_logic ;
signal slv_nb_free_index, slv_next_blob_index_tp, slv_unused_blob_index : std_logic_vector(7 downto 0) ;

begin 

nclk <= NOT clk ;


pos_blob_index <= unsigned(blob_index) when blob_index = X"00" else
				 unsigned(blob_index) - 1 ;
blob_index_latch : generic_latch 
	 generic map(NBIT => 8)
    port map( clk => nclk,
           resetn => resetn ,
           sraz => '0' ,
           en => add_pixel ,
           d => std_logic_vector(pos_blob_index) ,
           q => blob_index_latched);


pos_merge_index <= unsigned(blob_index_to_merge) when blob_index_to_merge = X"00" else
						 unsigned(blob_index_to_merge) - 1 ;			  
merge_index_latch : generic_latch 
	 generic map(NBIT => 8)
    port map( clk => nclk,
           resetn => resetn,
           sraz => '0' ,
           en => merge_blob ,
           d => std_logic_vector(pos_merge_index) ,
           q => blob_index_to_merge_latched);


blobxmin <= unsigned(ram0_out(9 downto 0)) ; -- top left coordinate
blobxmax <= unsigned(ram0_out(19 downto 10)) ; -- top right coordinate

blobymin <= unsigned(ram0_out(29 downto 20)) ; -- bottom left coordinate
blobymax <= unsigned(ram0_out(39 downto 30)) ; -- bottom right coordinate
 

next_blob_index <= next_blob_index_tp when nb_free_index > 0 else -- no more free index ...
						 X"00";
		

free_index_counter: up_down_counter 
	 generic map(NBIT => 8 )
    port map( clk => clk,
           resetn => resetn,
           sraz => '0',
			  load => load_free_index_counter ,
			  E => std_logic_vector(to_unsigned(NB_BLOB, 8)),
           en => en_free_index_counter, 
			  up_downn => inc_free_index_counter,
           Q => slv_nb_free_index
			  );		
			  
nb_free_index <= unsigned(slv_nb_free_index);			  
			  
with 	pixel_state select
			load_free_index_counter <= '1'  when INIT_BLOB1,-- load free blob pointer
			'0' when others ;
			
en_free_index_counter <= '1'  when pixel_state = NEW_BLOB1 and nb_free_index > 0 else-- decrement free index
								 '1'  when pixel_state = MERGE_BLOB3 and nb_free_index < 255 else-- increment free index
								 '0'  ;
			
with pixel_state select
			inc_free_index_counter <= '0'  when NEW_BLOB1,-- decrement free index
			'1' when others ;

next_free_blob_pointer: up_down_counter
	 generic map(NBIT => 8 )
    port map( clk => clk,
           resetn => resetn,
			  sraz => '0',
			  load => load_free_blob_pointer,
			  E => std_logic_vector(to_unsigned(1, 8)),
           en => en_free_blob_pointer, 
			  up_downn => '1',
           Q => slv_next_blob_index_tp
			  );
next_blob_index_tp <= unsigned(slv_next_blob_index_tp) ;

with 	pixel_state select
			load_free_blob_pointer <= '1'  when INIT_BLOB1,-- load free blob pointer
			'0' when others ;
			
en_free_blob_pointer <= '1'  when pixel_state = NEW_BLOB1 and nb_free_index > 0 else -- increment free blob pointer
								'0' ;
			
unused_blob_index <= next_blob_index_tp + nb_free_index - 1;			  


with pixel_state select
	blob_index_tp <= blob_index_init when INIT_BLOB2,
						  unused_blob_index when MERGE_BLOB2  ,
						  unsigned(blob_index_to_merge_latched) when MERGE_BLOB3  ,
						  unsigned(blob_index_latched) when others;
						 
	

true_blob_index <= unsigned(ram_addr) ; 

blob_index_ram : dpram_NxN
	generic map(SIZE => 256 , NBIT => 8, ADDR_WIDTH => 8)
	port map(
 		clk => clk,
 		we => index_wr,
 		spo => ram_addr ,
		dpo => merge_ram_addr ,
 		di => std_logic_vector(index_in),  
 		a => std_logic_vector(blob_index_tp),
		dpra => std_logic_vector(blob_index_to_merge_latched)
	); 


xy_pixel_ram0: dpram_NxN
	generic map(SIZE => NB_BLOB , NBIT => 40, ADDR_WIDTH => 8)
	port map(
 		clk => clk, 
 		we => ram_wr,
		dpra => (others => '0'),
 		spo => ram0_out ,
 		di => ram0_in,  
 		a => ram_addr_tp
	); 
	
	ram_addr_tp <= blob_addr when sender_active = '1' else
						free_addr when pixel_state = MERGE_BLOB2 else
						--merge_ram_addr when pixel_state = MERGE_BLOB1 else
						merge_ram_addr when pixel_state = COMPARE_BLOB else
						ram_addr ;
	
	ram_en <= '1' ;
	ram_wr <= '1' when pixel_state = UPDATE_BLOB else
				 --'1' when pixel_state = MERGE_BLOB3 else -- to be tested, clears blob data
				 clear_blob ;
	ram0_in <= std_logic_vector(newymax) & std_logic_vector(newymin) & std_logic_vector(newxmax) & std_logic_vector(newxmin) when pixel_state = UPDATE_BLOB else
			  (others => '0') ;
				  
	
	 --blob_add
	process(clk, resetn)
	begin
	if resetn = '0' then
		blob_index_init <= (others => '0');
		index_in <= (others => '0');
		to_merge <= '0' ;
		pixel_state <= INIT_BLOB1 ;
	elsif clk'event and clk = '1' then
		if sraz = '1' then
			to_merge <= '0' ;
			blob_index_init <= (others => '0'); -- initializing index ram 
			index_in <= (others => '0');
			index_wr <= '1' ;
			to_merge <= '0' ;
			pixel_state <= INIT_BLOB1 ;
		else
			case pixel_state is
				when INIT_BLOB1 =>
					index_wr <= '1' ;
					to_merge <= '0' ;
					if index_in = NB_BLOB then
						index_in <= (others => '0');
						pixel_state <= WAIT_PIXEL ;
					else
						pixel_state <= INIT_BLOB2 ;
					end if;
				when INIT_BLOB2 =>
					index_in <= index_in + 1 ;
					blob_index_init <= blob_index_init + 1 ;
					index_wr <= '0' ;
					to_merge <= '0' ;
					pixel_state <= INIT_BLOB1 ;
				when WAIT_PIXEL =>
					index_wr <= '0' ;
					to_merge <= '0' ;
					if add_pixel = '1' then
						if new_blob = '1' and nb_free_index > 0 then
							pixel_state <= NEW_BLOB1 ;
						else
							if merge_blob = '1' then
								to_merge <= '1' ;
							else
								to_merge <= '0' ;
							end if ;
							pixel_state <= LOAD_VALUE ;
						end if ;
					end if ;
				when LOAD_VALUE => --load blob value from ram
					pixel_state <= COMPARE_BLOB ;
				when COMPARE_BLOB => -- compare and load merge value from ram 
					index_wr <= '0' ;
					if pixel_posx < blobxmin then
						newxmin <= pixel_posx ;
					else
						newxmin <= blobxmin ;
					end if;
					if pixel_posx > blobxmax then
						newxmax <= pixel_posx ;
					else
						newxmax <= blobxmax ;
					end if;
					if pixel_posy < blobymin then
						newymin <= pixel_posy ;
					else
						newymin <= blobymin ;
					end if; 
					if pixel_posy > blobymax then
						newymax <= pixel_posy ;
					else
						newymax <= blobymax ;
					end if;
					if to_merge = '1' then
						pixel_state <= MERGE_BLOB1 ;
					else
						pixel_state <= UPDATE_BLOB ;
					end if ;
				when MERGE_BLOB1 =>
					index_wr <= '0' ;
					to_merge <= '0' ;
					if blobxmin < newxmin then
						newxmin <= blobxmin ;
					end if;
					if blobxmax > newxmax then
						newxmax <= blobxmax ;
					end if;
					if blobymin < newymin then
						newymin <= blobymin ;
					end if; 
					if blobymax > newymax then
						newymax <= blobymax ;
					end if;
					index_in <= unsigned(merge_ram_addr) ; -- merging addr
					free_addr <= ram_addr ; -- free ram addr
					if merge_ram_addr /= ram_addr then -- not already merged, writing merge address and freeing index
						index_wr <= '1' ;
						pixel_state <= MERGE_BLOB2 ;
					else
						index_wr <= '0' ; -- already merged
						pixel_state <= UPDATE_BLOB ;
					end if;
				when MERGE_BLOB2 =>
					index_wr <= '1' ;
					index_in <= unsigned(free_addr) ; -- writing free addr to index table
					pixel_state <= MERGE_BLOB3 ;
				when MERGE_BLOB3 =>
					index_wr <= '0' ;
					pixel_state <= UPDATE_BLOB ;
				when NEW_BLOB1 =>
					newxmin <= pixel_posx ;
					newxmax <= pixel_posx ;
					newymin <= pixel_posy ;
					newymax <= pixel_posy ;
					index_wr <= '0' ;
					pixel_state <= UPDATE_BLOB ;
				when UPDATE_BLOB =>
					index_wr <= '0' ;
					if add_pixel = '0' then
						pixel_state <= WAIT_PIXEL ;
					end if;
				when others =>
			end case ;
		end if;
	end if ;
	end process;
	
	
	
	blob_sender0 : blob_sender 
	generic map(NB_BLOB => NB_BLOB)
	port map(
		clk	=> clk, 
		resetn	=> resetn,
		oe => oe,
		clear_blob => clear_blob, 
		ram_addr	=> blob_addr ,
		ram_data_in		=> ram0_out ,
		blob_data => blob_data ,
		active => sender_active,
		send_blob => send_blob
	);
	
					 

	
	
end Behavioral;

