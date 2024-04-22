----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:48 05/15/2013 
-- Design Name: 
-- Module Name:    quad_encoder_block - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library work ;
use work.utils_pack.all ;


entity quad_encoder_block is
generic(NBIT : positive := 32; POL : std_logic := '1');
port(
	clk, resetn : in std_logic ;
	en, reset : in std_logic ;
	CHAN_A, CHAN_B : in std_logic ;
	count : out std_logic_vector((NBIT-1) downto 0)
);
end quad_encoder_block;

architecture Behavioral of quad_encoder_block is

signal CHAN_A_OLD, CHAN_A_RE : std_logic ;
signal up_downn : std_logic ;
begin


process(clk, resetn)
	begin
		if resetn = '0' then
			CHAN_A_OLD <= '0';
		elsif clk'event and clk = '1' then
			CHAN_A_OLD <= CHAN_A ;
		end if ;
	end process ;
	CHAN_A_RE <= (CHAN_A and (NOT CHAN_A_OLD)) and en;	
	
	up_downn <= CHAN_B when POL = '1' else
				(NOT CHAN_B) ;
	
	counter : up_down_counter
	generic map(NBIT => NBIT)
	port map( clk => clk,
			  resetn => resetn,
			  sraz => reset,
			  en => CHAN_A_RE,  -- must detect rising edge
			  load => '0',
			  up_downn => up_downn,
			  E => (others => '0'),
			  Q => count
			  );

end Behavioral;

