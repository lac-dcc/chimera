----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    09:30:41 10/03/2012 
-- Design Name: 
-- Module Name:    generic_delay - Behavioral 
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


library work ;
use work.utils_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_delay is
	generic( WIDTH : positive := 1; DELAY : positive := 1);
	port(
		clk, resetn : std_logic ;
		input	:	in std_logic_vector((WIDTH - 1) downto 0);
		output	:	out std_logic_vector((WIDTH - 1) downto 0)
);		
end generic_delay;

architecture Behavioral of generic_delay is
	type delay_array is array (0 to(DELAY -1)) of std_logic_vector((WIDTH - 1) downto 0) ;
	signal delay_line : delay_array ;
begin

gen_delay : for i in 0 to DELAY generate
	gen_unitary : if i = 0 and DELAY = 1 generate
						latch_unitary : generic_latch
							generic map(NBIT => WIDTH)
							 port map ( clk => clk,
									  resetn => resetn ,
									  sraz => '0' ,
									  en => '1' ,
									  d => input ,
									  q => output);
					end generate ;
	gen_input : if i = 0 and DELAY > 1 generate
						latch_0 : generic_latch
							generic map(NBIT => WIDTH)
							 port map ( clk => clk,
									  resetn => resetn ,
									  sraz => '0' ,
									  en => '1' ,
									  d => input ,
									  q => delay_line(0));
					end generate ;
	gen_delay :if i > 0 and DELAY > 1 and i < DELAY generate
						latch_i : generic_latch
							generic map(NBIT => WIDTH)
							 port map ( clk => clk,
									  resetn => resetn ,
									  sraz => '0' ,
									  en => '1' ,
									  d => delay_line(i-1) ,
									  q => delay_line(i));
					end generate ;
	gen_output :if i = DELAY and DELAY > 1 generate
						latch_delay : generic_latch
							generic map(NBIT => WIDTH)
							 port map ( clk => clk,
									  resetn => resetn ,
									  sraz => '0' ,
									  en => '1' ,
									  d => delay_line(i-1) ,
									  q => output);
					end generate ;
end generate ;
end Behavioral;

