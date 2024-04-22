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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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
use work.image_pack.all ;
use work.primitive_pack.all ;
use work.feature_pack.all ;


entity HARRIS_LINE_ACC_SMALL is
generic(NB_LINE : positive := 4; WIDTH : positive :=320);
port(clk, resetn : in std_logic ;
	  rewind_acc	:	in std_logic ;
	  wr_acc	:	in std_logic ;
	  gradx_square_in, grady_square_in, gradxy_in: in signed(15 downto 0);
	  gradx_square_out, grady_square_out, gradxy_out: out vec_16s(0 to (NB_LINE - 1))
	  );
end HARRIS_LINE_ACC_SMALL;

architecture RTL of HARRIS_LINE_ACC_SMALL is

signal grads_ram_in : std_logic_vector(0 to (16*NB_LINE)-1) ;
signal grads_ram_out : std_logic_vector(0 to (16*NB_LINE)-1) ;
signal gradx_square_ram_out, grady_square_ram_out, gradxy_ram_out : std_logic_vector(0 to (16*NB_LINE)-1) ;

signal gradx_square_in_latched, grady_square_in_latched, gradxy_in_latched:  signed(15 downto 0);
signal gradx_square_ram_latched, grady_square_ram_latched, gradxy_ram_latched:  vec_16s(0 to (NB_LINE - 1));

signal  pixel_address : std_logic_vector(nbit(WIDTH) - 1 downto 0);

signal  ram_address_read, ram_address_write : std_logic_vector(nbit(WIDTH * 3) - 1 downto 0);
signal  cycle_count : std_logic_vector(1 downto 0);
signal wr_ram, en_counter, en_pixel_count, sraz_counter : std_logic ;
signal offset : std_logic_vector(nbit(WIDTH * 3) - 1 downto 0) ;
begin

	process(clk, resetn)
	begin
		if resetn = '0' then
			grady_square_in_latched <= (others => '0') ; 
			gradxy_in_latched <= (others => '0') ;
		elsif clk'event and clk = '1' then
			if wr_acc = '1' then
				grady_square_in_latched <= grady_square_in ; 
				gradxy_in_latched <= gradxy_in ;
			end if ;
		end if ;
	end process ;


	gen_ram_in0 : for i in 0 to (NB_LINE - 2) generate
		with cycle_count select
			grads_ram_in(((i+1)*16) to ((i+2)*16)-1) <= std_logic_vector(gradx_square_ram_latched (i)) when "00" ,
																	  std_logic_vector(grady_square_ram_latched (i)) when "01" ,
																	  std_logic_vector(gradxy_ram_latched(i)) when others ;
	end generate ;
										
	with cycle_count select	
			grads_ram_in(0 to 15) <= std_logic_vector(gradx_square_in) when "00",
											 std_logic_vector(grady_square_in_latched) when "01",
											 std_logic_vector(gradxy_in_latched) when others ;
	

	ram_grads: dpram_NxN
	generic map(SIZE => (WIDTH * 3) , NBIT => (16 * NB_LINE), ADDR_WIDTH => nbit(WIDTH * 3))
	port map(
		clk => clk,  
		we => wr_ram,  
		di =>  grads_ram_in,
		a	=> ram_address_write,
		dpra => ram_address_read,
		spo => open,
		dpo => grads_ram_out	
	); 
	
--ram_address_write <= cycle_count & pixel_address ;
--
--ram_address_read(((nbit(WIDTH) + 2) - 1) downto ((nbit(WIDTH) + 2) - 2)) <= cycle_count ;
--
--ram_address_read(((nbit(WIDTH) + 2) - 3) downto 0) <= (pixel_address + 1) when  pixel_address < (WIDTH - 1) else
--							(others => '0');
											
ram_address_write <= pixel_address + offset;

ram_address_read <= (ram_address_write + 1) when  pixel_address < (WIDTH - 1) else
						  offset;

wr_ram <= wr_acc when  cycle_count = 0 else
			 '1' when cycle_count /= 3 else
			 '0' ;

en_counter <= '1' when cycle_count /= 0 else
				  '1' when wr_acc = '1' else
				  '0' ;
sraz_counter <= '1' when cycle_count = 3 else
					 '0' ;
en_pixel_count <= '1' when cycle_count = 3 else
						'0' ;

cycle_count0	: simple_counter 
	 generic map(NBIT => 2)
    Port map( clk => clk,
           resetn => resetn ,
           sraz => sraz_counter,
           en => en_counter,
			  load => '0' ,
			  E => "00",
           Q => cycle_count
			  );

process(clk, resetn)
begin
	if resetn = '0' then
		offset <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if offset = (2*WIDTH) then
			offset  <= (others => '0') ;
		elsif wr_ram = '1' then
			offset <= offset + WIDTH ;
		end if ;
	end if ;
end process ;

pixel_counter0 : pixel_counter
		generic map(MAX => WIDTH)
		port map(
			clk => clk,
			resetn => resetn,
			pixel_in_clk => en_pixel_count,pixel_in_hsync => rewind_acc,
			pixel_count => pixel_address
			);


gen_out : for i in 0 to (NB_LINE - 1) generate
	process(clk, resetn)
	begin
		if resetn = '0' then
			gradx_square_ram_latched(i) <= (others => '0');
			grady_square_ram_latched(i) <= (others => '0');
			gradxy_ram_latched(i) <= (others => '0'); 
		elsif clk'event and clk = '1' then
			if cycle_count = 1 then
				gradx_square_ram_latched(i) <= signed(grads_ram_out((i * 16) to (((i+1) * 16) - 1))) ;
			elsif cycle_count = 2 then
				grady_square_ram_latched(i) <= signed(grads_ram_out((i * 16) to (((i+1) * 16) - 1))) ;
			elsif cycle_count = 3 then
				gradxy_ram_latched(i) <= signed(grads_ram_out((i * 16) to (((i+1) * 16) - 1))) ;
			end if ;
		end if ;
	end process ;
end generate;

gradx_square_out <= gradx_square_ram_latched ;
grady_square_out <= grady_square_ram_latched ;
gradxy_out <= gradxy_ram_latched ;


end RTL;

