----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    15:25:29 03/01/2013 
-- Design Name: 
-- Module Name:    feature2fifo - Behavioral 
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


library work ;
use work.utils_pack.all ;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity feature2fifo is
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
end feature2fifo;

architecture Behavioral of feature2fifo is
type write_states is (WAIT_NEW_FEATURE, WRITE_SCORE, WRITE_POSX, WRITE_POSY, WRITE_DESC);
signal curr_write_state, next_write_state : write_states ;
signal feature_desc_latched, feature_desc_shifted : std_logic_vector((FEATURE_SIZE - 1) downto 0);
signal harris_posx_latched, harris_posy_latched, harris_score_latched : std_logic_vector(15 downto 0);

signal sraz_cycle_count, en_cycle_count : std_logic ;
signal cycle_count : std_logic_vector(7 downto 0);

begin

process(clk, resetn)
begin
	if resetn = '0' then
		harris_posx_latched <= (others => '0');
		harris_posy_latched <= (others => '0');
		harris_score_latched <= (others => '0');
	elsif clk'event and clk = '1' then
		if new_max = '1' then
			harris_posx_latched <= harris_posx;
			harris_posy_latched <= harris_posy;
			harris_score_latched <= harris_score;
		end if ;
	end if ;
end process ;


process(clk, resetn)
begin
	if resetn = '0' then
		feature_desc_latched <= (others => '0');
	elsif clk'event and clk = '1' then
		if new_max = '1' and new_feature_desc = '1' then
			feature_desc_latched <= feature_desc;
		end if ;
	end if ;
end process ;

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
			  
			  
process (clk,resetn)
begin
	if (resetn ='0') then
	  curr_write_state <= WAIT_NEW_FEATURE;  --default state on reset.
	elsif clk'event and clk = '1' then
	  curr_write_state <= next_write_state;   --state change.
	end if;
end process;

--state machine process.
process (curr_write_state, write_feature, cycle_count)
begin
  next_write_state <= curr_write_state ;
  case curr_write_state is
	when WAIT_NEW_FEATURE => 
		if write_feature = '1' then
			next_write_state <= WRITE_SCORE ;
		end if;
	when WRITE_SCORE => 
			next_write_state <= WRITE_POSX ;
	when WRITE_POSX => 
			next_write_state <= WRITE_POSY ;
	when WRITE_DESC => 
			if cycle_count >= (FEATURE_SIZE/16) then -- needs to generate square write signal
				next_write_state <= WAIT_NEW_FEATURE ;
			end if;
	when others => next_write_state <= WAIT_NEW_FEATURE ;
  end case;
end process;



process (clk,resetn)
begin
	if (resetn ='0') then
	  feature_desc_shifted <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if curr_write_state = WAIT_NEW_FEATURE then
			feature_desc_shifted <= feature_desc_latched ;
		elsif curr_write_state = WRITE_DESC then
			feature_desc_shifted((FEATURE_SIZE-16-1) downto 0) <= feature_desc_latched(FEATURE_SIZE-1 downto 16) ;
		end if;
	end if;
end process;


with curr_write_state select
	en_cycle_count <= '1' when WRITE_DESC,
							  '0' when others ;
with curr_write_state select
	sraz_cycle_count <= '0' when WRITE_DESC,
							  '1' when others ;
							  
							  
with curr_write_state select
fifo_wr <= '0' when WRITE_SCORE,
			  '1' when WRITE_POSX,
			  '1' when WRITE_POSY,
			  '1' when WRITE_DESC,
			  '0' when others ;
			  
with curr_write_state select 
	fifo_data <= 	harris_score_latched when WRITE_SCORE,
						harris_posx_latched when WRITE_POSX,
						harris_posy_latched when WRITE_POSY,
						feature_desc_shifted(15 downto 0) when others ;



end Behavioral;

