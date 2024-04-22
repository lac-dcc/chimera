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

package blob_pack is

component blobs is
	generic(NB_BLOB : positive := 32);
	port(
		clk, resetn, sraz : in std_logic ; --standard signals
		blob_index : in std_logic_vector(7 downto 0); -- blob index to madd/merge with
		next_blob_index : out std_logic_vector(7 downto 0); -- available index
		blob_index_to_merge : in std_logic_vector(7 downto 0); -- the blob index to merge
		true_blob_index : out std_logic_vector(7 downto 0); -- blob index after merge
		add_pixel : in std_logic ; -- add pixel to blob
		new_blob : in std_logic ; -- getting new blob
		
		merge_blob : in std_logic ; -- merge blob at blob index with blob index
		pixel_posx, pixel_posy : in std_logic_vector(9 downto 0); -- position of the pixel to add to the blob
		
		
		--output interface
		blob_data : out std_logic_vector(7 downto 0); -- data of blob
		oe : in std_logic ;
		send_blob	:	out std_logic 
	);
 
end component;


component blob_detection is
generic(LINE_SIZE : natural := 640);
port(
 		clk : in std_logic; 
 		resetn: in std_logic; 
 		pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic;
 		pixel_in_data : in std_logic_vector(7 downto 0 );
		blob_data : out std_logic_vector(7 downto 0);
		--memory_interface to copy results onpixel_in_vsync
		mem_addr : out std_logic_vector(15 downto 0);
		mem_data : inout std_logic_vector(15 downto 0);
		mem_wr : out std_logic
		);
end component;


component blob_manager is
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
end component;

component blob_sender is
generic(NB_BLOB : positive	:=	16);
	port(
		clk	:	in std_logic ;
		resetn	:	in std_logic ;
		oe : in std_logic ;
		clear_blob	:	out std_logic ;
		ram_addr	:	out std_logic_vector(7 downto 0);
		ram_data_in		: in std_logic_vector(39 downto 0);
		blob_data : out std_logic_vector(7 downto 0); -- data of blob
		active	:	out std_logic ;
		send_blob	:	out std_logic 
	);
end component;




end blob_pack;

package body blob_pack is

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
 
end blob_pack;
