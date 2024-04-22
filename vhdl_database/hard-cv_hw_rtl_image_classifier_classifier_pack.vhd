-
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package classifier_pack is

component color_classifier is
port( clk	:	in std_logic ;
		resetn	:	in std_logic ;
		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_y : in std_logic_vector(7 downto 0) ;
		pixel_u : in std_logic_vector(7 downto 0) ;
		pixel_v : in std_logic_vector(7 downto 0) ;
		pixel_class : out std_logic_vector(7 downto 0);
		
		--color lut interface 
		color_index : out std_logic_vector(11 downto 0);
		lut_in : in std_logic_vector(7 downto 0)
);
end component;


component classifier_smoother is
generic(WIDTH: natural := 640;
		  HEIGHT: natural := 480);
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pixel_in_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_data : out std_logic_vector(7 downto 0 )

);
end component;

component classifier_lut is
	generic(INDEX_WIDTH : positive := 12 ; CLASS_WIDTH : positive := 2);
	port(
		clk, resetn : in std_logic ;
		we, cs : in std_logic ;
		bus_addr : in std_logic_vector(15 downto 0);
		data_in : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0);
		class_index : in std_logic_vector(INDEX_WIDTH-1 downto 0);
		class_value : out std_logic_vector(CLASS_WIDTH-1 downto 0)
	);
end component;


component yuv_classifier is
	port(
		clk, resetn : in std_logic ;
		we, cs : in std_logic ;
		bus_addr : in std_logic_vector(15 downto 0);
		data_in : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0);
		
		y_value, u_value, v_value : in std_logic_vector(7 downto 0);
		class_value : out std_logic_vector(2 downto 0)
	);
end component;

component adaptive_pixel_class is
generic(image_width : positive := 320; image_height : positive := 240; nb_class : positive := 16);
port(
	clk : in std_logic; 
	resetn : in std_logic; 
	pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic; 
	pixel_in_data : in std_logic_vector(7 downto 0 ); 
	pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
	pixel_out_data : out std_logic_vector(7 downto 0 ); 
	chist_addr : out std_logic_vector(7 downto 0);
	chist_data : in std_logic_vector(31 downto 0);
	chist_available : in std_logic ;
	chist_reset : out std_logic
);
end component;



end classifier_pack;

package body classifier_pack is

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
 
end classifier_pack;
