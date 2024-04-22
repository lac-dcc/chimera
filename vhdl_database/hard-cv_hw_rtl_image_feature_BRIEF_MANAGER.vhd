----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    17:01:25 10/09/2012 
-- Design Name: 
-- Module Name:    BRIEF_MANAGER - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work ;
use work.image_pack.all ;
use work.utils_pack.all ;
use work.feature_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BRIEF_MANAGER is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480;
		  DESC_SIZE : natural := 64;
		  NB_LMK : natural := 1;
		  DELAY : natural := 4 );
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 );
-- active search interface
-- each lmk to track should be registered as
--------16bit----------
--------desc_msb-------
---------n*desc--------
--------desc_lsb-------
----------xpos---------
----------ypos---------
---xsize---||---ysize--
----------xcorr--------
----------ycorr--------
--corr_score---||status
	   as_mem_addr : out std_logic_vector(7 downto 0);
		as_mem_data_in : in std_logic_vector(15 downto 0 );
		as_mem_data_out : out std_logic_vector(15 downto 0 );
		as_mem_wr : out std_logic ;
		as_mem_wait : in std_logic ; --mem busy, cannot write

-- feature extractor interface
		feature_descriptor : out std_logic_vector(( DESC_SIZE - 1) downto 0 );
		new_descriptor : out std_logic 	-- latch command 	

);
end BRIEF_MANAGER;

architecture Behavioral of BRIEF_MANAGER is
	constant BRIEF_COM_PATTERN :brief_pattern :=
	((20, 25),(25, 11),(2, 2),(23, 42),(53, 21),(43, 11),(22, 23),(18, 28),(10, 24),
(32, 32),(21, 45),(42, 29),(60, 30),(47, 34),(43, 1),(4, 63),(27, 30),
(10, 29),(32, 33),(7, 21),(55, 50),(32, 13),(9, 50),(42, 20),(10, 10),
(52, 31),(55, 30),(61, 51),(60, 44),(21, 39),(46, 26),(38, 9),(56, 48),
(38, 24),(18, 46),(45, 9),(32, 13),(22, 42),(63, 0),(62, 9),(11, 50),
(41, 2),(16, 38),(54, 12),(18, 11),(51, 0),(37, 25),(9, 29),(9, 48),
(53, 27),(30, 34),(36, 62),(47, 59),(40, 46),(59, 38),(56, 6),(24, 33),
(9, 40),(7, 63),(52, 25),(10, 39),(26, 48),(0, 35),(13, 10),(19, 3),
(37, 49),(37, 10),(48, 21),(5, 24),(3, 0),(63, 59),(7, 23),(28, 16),
(0, 35),(15, 52),(61, 25),(28, 23),(9, 28),(58, 23),(38, 14),(26, 12),
(63, 63),(22, 47),(20, 27),(8, 24),(27, 7),(19, 34),(30, 48),(50, 30),
(19, 1),(19, 16),(27, 47),(39, 36),(11, 34),(59, 50),(48, 21),(62, 47),
(21, 20),(31, 41),(47, 39),(1, 10),(46, 21),(45, 12),(5, 31),(43, 24),
(33, 62),(41, 60),(45, 16),(32, 56),(50, 28),(42, 34),(49, 40),(18, 6),
(60, 49),(48, 43),(24, 49),(54, 6),(6, 35),(18, 11),(2, 61),(36, 35),
(59, 13),(31, 40),(29, 0),(33, 16),(28, 11),(50, 13),(52, 4));

	type loading_states is (WAIT_HSYNC, LOAD_DESC, LOAD_X, LOAD_Y, LOAD_SIZE, WRITE_X, WRITE_Y, WRITE_SCORE);

	signal curr_load_state, next_load_state : loading_states ;

	type lmk_desc_array is array(0 to (NB_LMK - 1)) of std_logic_vector((DESC_SIZE - 1) downto 0);
	type lmk_pos_array is array(0 to (NB_LMK - 1)) of std_logic_vector(15 downto 0);
	type corr_score_array is array(0 to (NB_LMK - 1)) of std_logic_vector((nbit(DESC_SIZE)-1) downto 0);

	signal array_of_desc : lmk_desc_array ;
	signal array_of_posx0 : lmk_pos_array ;
	signal array_of_posx1 : lmk_pos_array ;
	signal array_of_posy0 : lmk_pos_array ;
	signal array_of_posy1 : lmk_pos_array ;
	
	signal array_of_score : corr_score_array ;
	signal array_of_corrx : lmk_pos_array ;
	signal array_of_corry : lmk_pos_array ;
	
	signal array_of_correl_done : std_logic_vector(0 to (NB_LMK-1));
	signal array_of_correl_busy : std_logic_vector(0 to (NB_LMK-1));
	
	signal pixel_in_clk_delayed,pixel_in_hsync_delayed,pixel_in_vsync_delayed :  std_logic; 
 	signal pixel_data_delayed :  std_logic_vector(7 downto 0 );
	
	signalpixel_in_vsync_falling_edge,pixel_in_vsync_rising_edge,pixel_in_vsync_old : std_logic ;
	signalpixel_in_hsync_falling_edge,pixel_in_hsync_rising_edge,pixel_in_hsync_old : std_logic ;

	signal line_count : std_logic_vector((nbit(HEIGHT) - 1) downto 0 ) ;
	signal pixel_count : std_logic_vector((nbit(WIDTH) - 1) downto 0 ) ;
	signal frame_count : std_logic_vector(6 downto 0);


	signal new_descriptor_t : std_logic ;
	signal current_descriptor : std_logic_vector(( DESC_SIZE - 1) downto 0 );
	
	signal sraz_lmk_count, en_lmk_count : std_logic ;
	signal sraz_cycle_count , en_cycle_count : std_logic ;
	signal sraz_addr_count, en_addr_count : std_logic ;
	signal lmk_count : std_logic_vector(3 downto 0);
	signal cycle_count : std_logic_vector(7 downto 0);
begin


-- delaying inputs to be in sync with other blocks
delayed_pixels : generic_delay
	generic map( WIDTH => 11 , DELAY => DELAY)
	port map(
		clk => clk, resetn => resetn,
		input(0)	=> pixel_in_clk,
		input(1) =>pixel_in_hsync,
		input(2) =>pixel_in_vsync,
		input(10 downto 3) => pixel_in_data ,	
		output(0)	=> pixel_in_clk_delayed,
		output(1) =>pixel_in_hsync_delayed,
		output(2) =>pixel_in_vsync_delayed,
		output(10 downto 3) => pixel_data_delayed 		 
	);		

brief_0 : BRIEF
	generic map(WIDTH => WIDTH ,
		  HEIGHT => HEIGHT ,
		  WINDOW_SIZE => 8 ,
		  DESCRIPTOR_LENGTH => DESC_SIZE,
		  pattern => BRIEF_COM_PATTERN)
		port map(
			clk => clk,
			resetn => resetn ,
			pixel_in_clk => pixel_in_clk_delayed,pixel_in_hsync =>pixel_in_hsync_delayed,pixel_in_vsync =>pixel_in_vsync_delayed, 
			pixel_in_data => pixel_data_delayed ,
			pixel_out_clk => new_descriptor_t,
			descriptor => feature_descriptor);
	new_descriptor <= new_descriptor_t;
	count_pixels: pixel_counter
		generic map(MAX => WIDTH)
		port map(
			clk => clk,
			resetn=> resetn, 
			pixel_in_clk => new_descriptor_t,pixel_in_hsync =>pixel_in_hsync_delayed , 
			pixel_count => pixel_count);

	count_lines: line_counter 
		generic map(MAX => HEIGHT)
		port map(
			clk => clk,
			resetn => resetn, 
			hsync =>pixel_in_hsync_delayed,pixel_in_vsync =>pixel_in_vsync_delayed, 
			line_count => line_count);


process(clk, resetn)
begin
	if resetn = '0' then
		vsync_old <= '0' ;
		hsync_old <= '0' ;
	elsif clk'event and clk = '1' then
		vsync_old <=pixel_in_vsync_delayed ;
		hsync_old <=pixel_in_hsync_delayed ;
	end if ;
end process ;	
vsync_falling_edge <= (NOTpixel_in_vsync_delayed) andpixel_in_vsync_old ;
vsync_rising_edge <=pixel_in_vsync_delayed and (NOTpixel_in_vsync_old) ;
hsync_falling_edge <= (NOTpixel_in_hsync_delayed) andpixel_in_hsync_old ;
hsync_rising_edge <=pixel_in_hsync_delayed and (NOTpixel_in_hsync_old) ;

			
gen_corr : for i in 0 to (NB_LMK-1) generate
	bief_as_i :  BRIEF_AS
		generic map(WIDTH => WIDTH,
					  HEIGHT => HEIGHT,
					  DESCRIPTOR_SIZE => DESC_SIZE)
		port map(
			clk => clk, 
			resetn => resetn, 
			new_feature => new_descriptor_t,
			line_count => line_count,
			pixel_count => pixel_count,
			curr_descriptor => current_descriptor, 
			descriptor_correl => array_of_desc(i),
			correl_winx0 => array_of_posx0(i),
			correl_winx1 => array_of_posx1(i),
			correl_winy0 => array_of_posy0(i),
			correl_winy1 => array_of_posy1(i),
			
			correl_x	=> array_of_corrx(i),
			correl_y	=> array_of_corry(i),
			correl_score => array_of_score(i),
			correl_done => array_of_correl_done(i),
			correl_busy => array_of_correl_busy(i)
			);
end generate ;




-- need to write two state machines, one to return results and one to gather lmk to track


frame_counter : simple_counter
	 generic map(NBIT => 7) 
    Port map( clk => clk,
           resetn => resetn,
           sraz=> '0',
           en =>pixel_in_vsync_falling_edge,
			  load => '0',
			  E => (others => '0'),
           Q => frame_count
			  );




lmk_counter : simple_counter
	 generic map(NBIT => 4) 
    Port map( clk => clk,
           resetn => resetn,
           sraz=> sraz_lmk_count,
           en => en_lmk_count,
			  load => '0',
			  E => (others => '0'),
           Q => lmk_count
			  );
			  
cycle_counter : simple_counter
	 generic map(NBIT => 8) 
    Port map( clk => clk,
           resetn => resetn,
           sraz=> sraz_cycle_count,
           en => en_cycle_count,
			  load => '0',
			  E => (others => '0'),
           Q => cycle_count
			  );
			  
addr_counter : simple_counter
	 generic map(NBIT => 8) 
    Port map( clk => clk,
           resetn => resetn,
           sraz=> sraz_addr_count,
           en => en_addr_count,
			  load => '0',
			  E => (others => '0'),
           Q => as_mem_addr
			  );

process (clk,resetn)
begin
	if (resetn='0') then
	  curr_load_state <= WAIT_HSYNC;  --default state on reset.
	elsif clk'event and clk = '1' then
	  curr_load_state <= next_load_state;   --state change.
	end if;
end process;

--state machine process.
process (curr_load_state,vsync_falling_edge, cycle_count, lmk_count, as_mem_wait)
begin
  next_load_state <= curr_load_state ;
  case curr_load_state is
	when WAIT_HSYNC => 
		ifpixel_in_vsync_falling_edge = '1' then
			next_load_state <= LOAD_DESC ;
		end if;
	when LOAD_DESC => 
		if cycle_count = DESC_SIZE/16 then
			next_load_state <= LOAD_X ;
		end if;
	when LOAD_X => 
			next_load_state <= LOAD_Y ;
	when LOAD_Y => 
			next_load_state <= WRITE_X ;
	when WRITE_X =>
			if as_mem_wait = '0' then
				next_load_state <= WRITE_Y ;
			end if ;
	when WRITE_Y =>
			next_load_state <= WRITE_SCORE ;
	when WRITE_SCORE =>
			if as_mem_wait = '0' and lmk_count = (NB_LMK-1) then
				next_load_state <= WAIT_HSYNC ;
			elsif as_mem_wait = '0' then
				next_load_state <= LOAD_DESC ;
			end if;
	when others => next_load_state <= WAIT_HSYNC ;		
  end case;
end process;


with curr_load_state select
	sraz_lmk_count <= '1' when WAIT_HSYNC ,
							'0' when others ;
with curr_load_state select
	sraz_cycle_count <= '0' when LOAD_DESC ,
							'1' when others ;
with curr_load_state select
	en_cycle_count <= '0' when WAIT_HSYNC ,
							'1' when others ;


en_lmk_count <= (not as_mem_wait) when curr_load_state = WRITE_SCORE and lmk_count < (NB_LMK-1) else
						 '0' ;

with curr_load_state select
	sraz_addr_count <= '1' when WAIT_HSYNC ,
							'0' when others ;
en_addr_count <= '1' ;
		
with curr_load_state select
			as_mem_wr <=  '1' when WRITE_SCORE ,
							  array_of_correl_done(conv_integer(lmk_count)) when WRITE_X ,
							  array_of_correl_done(conv_integer(lmk_count)) when WRITE_Y ,
							  '0' when others ;
with curr_load_state select -- writing the frame count allow software to discriminate when was matched the feature
			as_mem_data_out <=  '0' & frame_count & array_of_score(conv_integer(lmk_count))& array_of_correl_done(conv_integer(lmk_count)) when WRITE_SCORE ,
							   array_of_corrx(conv_integer(lmk_count)) when WRITE_X ,
							   array_of_corry(conv_integer(lmk_count)) when WRITE_Y ,
							   (others => '0') when others ;

-- loading data into registers
process(clk, resetn)
begin
if resetn = '0' then
elsif clk'event and clk = '1' then
	if array_of_correl_busy(conv_integer(lmk_count)) = '0' then -- not loading if correl is ongoing
		if curr_load_state = LOAD_DESC  then
			array_of_desc(conv_integer(lmk_count))(DESC_SIZE-1 downto 8) <= array_of_desc(conv_integer(lmk_count))(DESC_SIZE-9 downto 0);
			array_of_desc(conv_integer(lmk_count))(15 downto 0) <= as_mem_data_in;
		end if;
		if curr_load_state = LOAD_X then
			array_of_posx0(conv_integer(lmk_count)) <= as_mem_data_in ;
		end if;
		if curr_load_state = LOAD_Y then
			array_of_posy0(conv_integer(lmk_count)) <= as_mem_data_in ;
		end if;
		if curr_load_state = LOAD_SIZE then
			array_of_posx1(conv_integer(lmk_count)) <= array_of_posx0(conv_integer(lmk_count)) + as_mem_data_in(7 downto 0) ;
			array_of_posy1(conv_integer(lmk_count)) <= array_of_posy0(conv_integer(lmk_count)) + as_mem_data_in(15 downto 8) ;
		end if;
	end if ;
end if ;
end process ;


end Behavioral;

