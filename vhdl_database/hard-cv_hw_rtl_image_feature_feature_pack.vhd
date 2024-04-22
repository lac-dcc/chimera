--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


library work;
use work.utils_pack.all;

package feature_pack is

type linear_coord_duplet is array (0 to 1) of integer ;
type brief_pattern is array (natural range<>) of linear_coord_duplet ;
type vec_16s is array(natural range<>) of signed(15 downto 0);


component BRIEF is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480;
		  WINDOW_SIZE : positive := 8;
		  DESCRIPTOR_LENGTH : positive := 64;
		  PATTERN : brief_pattern );
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
			pixel_in_data : in std_logic_vector(7 downto 0 ); 
			pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
			descriptor :  out std_logic_vector((DESCRIPTOR_LENGTH - 1) downto 0) );
end component;

component BRIEF_AS is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480;
		  DESCRIPTOR_SIZE : natural := 64);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			new_feature : in std_logic;
			line_count : in std_logic_vector((nbit(HEIGHT) - 1) downto 0 ) ;
			pixel_count : in std_logic_vector((nbit(WIDTH) - 1) downto 0 ) ;
			curr_descriptor : in std_logic_vector((DESCRIPTOR_SIZE - 1) downto 0) ;  
			descriptor_correl :  in std_logic_vector((DESCRIPTOR_SIZE - 1) downto 0) ;
			correl_winx0 :  in std_logic_vector(15 downto 0) ;
			correl_winx1 :  in std_logic_vector(15 downto 0) ;
			correl_winy0 :  in std_logic_vector(15 downto 0) ;
			correl_winy1 :  in std_logic_vector(15 downto 0) ;
			
			correl_x	: out std_logic_vector(15 downto 0);
			correl_y	: out std_logic_vector(15 downto 0);
			correl_score : out std_logic_vector(nbit(DESCRIPTOR_SIZE)-1 downto 0);
			correl_done :  out std_logic ;
			correl_busy : out std_logic
			);
end component;

component BRIEF_MANAGER is
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
--------16bit---------
--------desc_msb------
---------n*desc-------
----------xpos1-------
----------xpos2-------
----------ypos1-------
----------ypos2-------
	   as_mem_addr : out std_logic_vector(7 downto 0);
		as_mem_data_in : in std_logic_vector(15 downto 0 );
		as_mem_data_out : out std_logic_vector(15 downto 0 );
		as_mem_wr : out std_logic ;
		as_mem_wait : in std_logic ;

-- feature extractor interface
		feature_descriptor : out std_logic_vector(( DESC_SIZE - 1) downto 0 );
		new_descriptor : out std_logic 	-- latch command 	
);
end component;

component HARRIS_16SADDER is
generic(NB_VAL : positive := 5);
port(
		clk, resetn : in std_logic ;
		val_array : in vec_16s(0 to (NB_VAL-1));
		result : out signed(15 downto 0)
);
end component;

component HARRIS is
generic(WIDTH : positive := 640 ; HEIGHT : positive := 480; WINDOW_SIZE : positive := 5; DS_FACTOR : natural := 1);
port (
		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		harris_out : out std_logic_vector(15 downto 0 )
);
end component;

component HARRIS_LINE_ACC is
generic(NB_LINE : positive := 4; WIDTH : positive :=320);
port(clk, resetn : in std_logic ;
	  rewind_acc	:	in std_logic ;
	  wr_acc	:	in std_logic ;
	  gradx_square_in, grady_square_in, gradxy_in: in signed(15 downto 0);
	  gradx_square_out, grady_square_out, gradxy_out: out vec_16s(0 to (NB_LINE - 1))
	  );
end component;

component HARRIS_LINE_ACC_SMALL is
generic(NB_LINE : positive := 4; WIDTH : positive :=320);
port(clk, resetn : in std_logic ;
	  rewind_acc	:	in std_logic ;
	  wr_acc	:	in std_logic ;
	  gradx_square_in, grady_square_in, gradxy_in: in signed(15 downto 0);
	  gradx_square_out, grady_square_out, gradxy_out: out vec_16s(0 to (NB_LINE - 1))
	  );
end component;

component HARRIS_RESPONSE is
	port(
	clk, resetn : in std_logic ;
	en : in std_logic ;
	xgrad_square_sum, ygrad_square_sum, xygrad_sum : in signed(15 downto 0);
	dv	:	out std_logic ;
	harris_response : out std_logic_vector(15 downto 0)
	);
end component;

component HARRIS_TESSELATION is
	generic(WIDTH : positive := 640 ;
			HEIGHT : positive := 480; 
			TILE_NBX : positive := 8 ; 
			TILE_NBY : positive := 6 ; 
			IGNORE_STRIPES : positive := 5;
			DESCRIPTOR_SIZE :  positive :=  128);
	port (
			clk : in std_logic; 
			resetn : in std_logic; 
			pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
			feature_desc_in : in std_logic_vector(DESCRIPTOR_SIZE-1 downto 0);
			harris_score_in : in std_logic_vector(15 downto 0 ); 
			feature_coordx	:	out std_logic_vector(7 downto 0 ) ;
			feature_coordy	:	out std_logic_vector(7 downto 0 ) ;
			feature_desc_out : out std_logic_vector((DESCRIPTOR_SIZE -1) downto 0) ;
			harris_score_out	: 	out std_logic_vector(15 downto 0 );
			end_of_block	:	out std_logic 
	);
end component;

component feature2fifo is
generic(FEATURE_SIZE : positive := 128);
port(
	clk, resetn : in std_logic ;
	feature_desc : in std_logic_vector((FEATURE_SIZE - 1) downto 0);
	new_feature_desc : in std_logic ; 
	
	harris_posx, harris_posy, harris_score : in std_logic_vector(15 downto 0);
	new_max : in std_logic ;
	write_feature : in std_logic ;
	
	--fifo interface
	fifo_data : out std_logic_vector(15 downto 0);
	fifo_wr : out std_logic 

);
end component;

end feature_pack;

package body feature_pack is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end feature_pack;
