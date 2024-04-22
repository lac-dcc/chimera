----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    16:45:50 10/16/2012 
-- Design Name: 
-- Module Name:    HARRIS_LINE_ACC - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library work;
use work.utils_pack.all ;
use work.primitive_pack.all ;
use work.image_pack.all ;
use work.feature_pack.all ;


entity HARRIS_LINE_ACC is
generic(NB_LINE : positive := 4; WIDTH : positive :=320);
port(clk, resetn : in std_logic ;
	  rewind_acc	:	in std_logic ;
	  wr_acc	:	in std_logic ;
	  gradx_square_in, grady_square_in, gradxy_in: in signed(15 downto 0);
	  gradx_square_out, grady_square_out, gradxy_out: out vec_16s(0 to (NB_LINE - 1))
	  );
end HARRIS_LINE_ACC;

architecture RTL of HARRIS_LINE_ACC is

signal gradx_square_ram_in, grady_square_ram_in, gradxy_ram_in : std_logic_vector(0 to (16*NB_LINE)-1) ;
signal gradx_square_ram_out, grady_square_ram_out, gradxy_ram_out : std_logic_vector(0 to (16*NB_LINE)-1) ;
signal  pixel_address : std_logic_vector(nbit(WIDTH) - 1 downto 0);

begin


	gradx_square_ram_in((1*16) to (NB_LINE*16)-1) <= gradx_square_ram_out (0 to ((NB_LINE - 1)*16)-1);
	gradx_square_ram_in(0 to 15) <= std_logic_vector(gradx_square_in) ;
	
	grady_square_ram_in((1*16) to (NB_LINE*16)-1) <= grady_square_ram_out (0 to ((NB_LINE - 1)*16)-1);
	grady_square_ram_in(0 to 15) <=  std_logic_vector(grady_square_in) ;
	
	gradxy_ram_in((1*16) to (NB_LINE*16)-1) <= gradxy_ram_out (0 to ((NB_LINE - 1)*16)-1);
	gradxy_ram_in(0 to 15) <=  std_logic_vector(gradxy_in);

	ram_gradx : dpram_NxN
	generic map(SIZE => WIDTH+1, NBIT => 16*NB_LINE, ADDR_WIDTH => nbit(WIDTH))
	port map(
		clk => clk,  
		we => wr_acc,  
		di =>  gradx_square_ram_in,
		a	=> pixel_address,
		dpra => std_logic_vector(to_unsigned(0, nbit(WIDTH))),
		spo => gradx_square_ram_out,
		dpo => open	
	); 
	
	ram_grady : dpram_NxN
	generic map(SIZE => WIDTH+1, NBIT => 16*NB_LINE, ADDR_WIDTH => nbit(WIDTH))
	port map(
		clk => clk,  
		we => wr_acc,  
		di =>  grady_square_ram_in,
		a	=> pixel_address,
		dpra => std_logic_vector(to_unsigned(0, nbit(WIDTH))),
		spo => grady_square_ram_out,
		dpo =>  open		
	); 


	ram_gradxy : dpram_NxN
	generic map(SIZE => WIDTH+1, NBIT => 16*NB_LINE, ADDR_WIDTH => nbit(WIDTH))
	port map(
		clk => clk,  
		we => wr_acc,  
		di =>  gradxy_ram_in,
		a	=> pixel_address,
		dpra => std_logic_vector(to_unsigned(0, nbit(WIDTH))),
		spo => gradxy_ram_out	,
		dpo =>  open		
	); 

pixel_counter0 : pixel_counter
		generic map(MAX => WIDTH)
		port map(
			clk => clk,
			resetn => resetn,
			pixel_in_clk => wr_acc,pixel_in_hsync => rewind_acc,
			pixel_count => pixel_address
			);


gen_out : for i in 0 to (NB_LINE - 1) generate
	gradx_square_out(i) <= signed(gradx_square_ram_out((i * 16) to (((i+1) * 16) - 1))) ;
	grady_square_out(i) <= signed(grady_square_ram_out((i * 16) to (((i+1) * 16) - 1))) ;
	gradxy_out(i) <= signed(gradxy_ram_out((i * 16) to (((i+1) * 16) - 1))) ;
end generate;


end RTL;

