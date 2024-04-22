----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    10:25:52 03/03/2012 
-- Design Name: 
-- Module Name:    sobel3x3 - Behavioral 
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

library WORK;
use WORK.image_pack.ALL;
use WORK.utils_pack.ALL;
use WORK.primitive_pack.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conv3x3 is
generic(KERNEL : imatNM(0 to 2, 0 to 2) := ((1, 2, 1),(0, 0, 0),(-1, -2, -1));
		  NON_ZERO	: index_array := ((0, 0), (0, 1), (0, 2), (2, 0), (2, 1), (2, 2), (3, 3), (3, 3), (3, 3) ); -- (3, 3) indicate end  of non zero values
		  IS_POWER_OF_TWO : natural := 0 -- (3, 3) indicate end  of non zero values
		  );
port(
 		clk : in std_logic; 
 		resetn : in std_logic; 
 		new_block : in std_logic ;
		block3x3 : in matNM(0 to 2, 0 to 2);
		new_conv : out std_logic ;
		busy : out std_logic ;
 		abs_res : out std_logic_vector(7 downto 0 );
		raw_res : out signed(15 downto 0 )
);
end conv3x3;


architecture RTL of conv3x3 is


signal reset_mac : std_logic ;
signal MAC0_A, MAC0_B, MAC1_A, MAC1_B, MAC2_A, MAC2_B	:	signed(15 downto 0);
signal MAC0_RES, MAC1_RES, MAC2_RES:	signed(31 downto 0);

signal final_res, final_res_latched ,abs_resl : signed(31 downto 0);
signal std_abs_resl : std_logic_vector(31 downto 0);
signal index : std_logic_vector(3 downto 0) := (others => '0');
signal clock_count	:	std_logic_vector(2 downto 0);
signal new_bloc_old, new_block_rising_edge, counter_enable, counter_enable_fast, busy_old, counter_sraz : std_logic ;
signal block3x3_latched : matNM(0 to 2, 0 to 2) ;
begin

process(clk, resetn)
begin
	if resetn = '0' then
		new_bloc_old <= '0' ;
	elsif clk'event and clk = '1' then
		new_bloc_old <= new_block ;
	end if ;
end process ;
new_block_rising_edge <= (not new_bloc_old) and new_block ;


latch_0 : matNxM_latch 
		generic map(N => 3, M => 3)
		port map( clk => clk, 
           resetn => resetn ,
           sraz => '0',
           en => new_block_rising_edge ,
           d => block3x3 ,
           q => block3x3_latched);


counter_enable_fast <= counter_enable OR new_block_rising_edge ;

clock_counter : simple_counter
	 generic map(NBIT =>  3)
    port map( clk => clk,
           resetn => resetn,
           sraz => counter_sraz, 
           en => counter_enable_fast, 
			  load  => '0' ,
			  E => std_logic_vector(to_unsigned(0, 3)),
           Q => clock_count
			  );
counter_sraz <= '1' when clock_count = 3 else
					 '0' ;
--rs lock
process(clk, resetn)
begin
	if resetn = '0' then
		counter_enable <= '0' ;
	elsif clk'event and clk ='1' then
		if new_block_rising_edge = '1' then
			counter_enable <= '1' ;
		elsif counter_sraz = '1' then
			counter_enable <= '0' ;
		end if ;	
	end if ;
end process ;			  
			  


final_res <= MAC0_RES + MAC1_RES + MAC2_RES ;

reset_mac <= (NOT resetn) OR new_block_rising_edge;

mac0: MAC16
port map(clk => clk, reset => reset_mac,
	  add_subb	=> '1' ,
	  A => MAC0_A, B => MAC0_B,
	  RES => MAC0_RES 
);

mac1: MAC16
port map(clk => clk, reset => reset_mac,
	  add_subb	=> '1' ,
	  A => MAC1_A, B => MAC1_B,
	  RES => MAC1_RES 
);

mac2: MAC16
port map(clk => clk, reset => reset_mac,
	  add_subb	=> '1' ,
	  A => MAC2_A, B => MAC2_B,
	  RES => MAC2_RES 
);

raw_res <= FINAL_RES(15 downto 0) ; -- should not overflow
std_abs_resl <= std_logic_vector(abs(FINAL_RES));
abs_res <= std_abs_resl(10 downto 3); -- need to check division factor

 

MAC0_A(15 downto 9) <= (others => '0');
with clock_count select
	MAC0_A(8 downto 0) <= block3x3(0,0) when "000",
								 block3x3_latched(0,1) when "001" ,
								 block3x3_latched(0,2) when "010" ,
								 (others => '0') when others ;

MAC1_A(15 downto 9) <= (others => '0');
with clock_count select
	MAC1_A(8 downto 0) <= block3x3(1,0) when "000",
								 block3x3_latched(1,1) when "001" ,
								 block3x3_latched(1,2) when "010" ,
								 (others => '0') when others ;
								 
MAC2_A(15 downto 9) <= (others => '0');
with clock_count select
	MAC2_A(8 downto 0) <= block3x3(2,0) when "000",
								 block3x3_latched(2,1) when "001" ,
								 block3x3_latched(2,2) when "010" ,
								 (others => '0') when others ;


with clock_count select
	MAC0_B <=  to_signed(KERNEL(0,0), 16) when "000",
				  to_signed(KERNEL(0,1), 16) when "001" ,
				  to_signed(KERNEL(0,2), 16) when "010" ,
				 (others => '0') when others ;


with clock_count select
	MAC1_B <=  to_signed(KERNEL(1,0), 16) when "000",
				  to_signed(KERNEL(1,1), 16) when "001" ,
				  to_signed(KERNEL(1,2), 16) when "010" ,
				 (others => '0') when others ;
								 
with clock_count select
	MAC2_B <=  to_signed(KERNEL(2,0), 16) when "000",
				  to_signed(KERNEL(2,1), 16) when "001" ,
				  to_signed(KERNEL(2,2), 16) when "010" ,
				 (others => '0') when others ;

	process(clk, resetn)
	begin
		if resetn = '0' then
			busy_old <= '0' ;
		elsif clk'event and clk = '1' then
			busy_old <= counter_enable ;
		end if ;
	end process ;
	new_conv <= (NOT counter_enable) and busy_old  ;

	busy <= counter_enable ;


end RTL;


--architecture FSM of conv3x3 is
--
--type compute_state	is	(WAIT_PIXEL, COMPUTE, END_PIPELINE1, END_PIPELINE2);
--
--signal convolution_state : compute_state ;
--
--signal reset_mac : std_logic ;
--signal MAC1_A, MAC1_B, MAC2_A, MAC2_B	:	signed(15 downto 0);
--signal MAC1_RES, MAC2_RES:	signed(31 downto 0);
--
--signal final_res, abs_resl : signed(31 downto 0);
--signal index : std_logic_vector(3 downto 0) := (others => '0');
--begin
--
--final_res <= MAC1_RES + MAC2_RES ;
--
--is_power_of_two0 : IF IS_POWER_OF_TWO = 1 GENERATE
--	mac1: SAC16
--	port map(clk => clk, sraz => reset_mac,
--	  A => MAC1_A, B => MAC1_B,
--	  RES => MAC1_RES 
--	);
--
--	mac2: SAC16
--	port map(clk => clk, sraz => reset_mac, 
--		  A => MAC2_A, B => MAC2_B,
--		  RES => MAC2_RES 
--	);
--END GENERATE is_power_of_two0 ;
--
--is_power_of_two1 : IF IS_POWER_OF_TWO = 0 GENERATE
--mac1: MAC16
--port map(clk => clk, sraz => reset_mac,
--	  add_subb	=> '1' ,
--	  reset_acc => '0',
--	  A => MAC1_A, B => MAC1_B,
--	  RES => MAC1_RES 
--);
--
--mac2: MAC16
--port map(clk => clk, sraz => reset_mac,
--	  add_subb	=> '1' ,
--	  reset_acc => '0',
--	  A => MAC2_A, B => MAC2_B,
--	  RES => MAC2_RES 
--);
--END GENERATE is_power_of_two1 ;
--
----compute matrix convolution with non-zero matrix elts
--process(clk, resetn)
--begin
--if resetn = '0' then 
--	reset_mac <= '1' ;
--	new_conv <= '0' ;
--	busy <= '0' ;
--	index <= (others => '0') ;
--elsif clk'event and clk = '1'  then
--	case convolution_state is
--		when WAIT_PIXEL =>
--			reset_mac <= '1' ;
--			new_conv <= '0' ;
--			busy <= '0' ;
--			index <= (others => '0') ;
--			if new_block = '1'  then
--				new_conv <= '0' ;
--				busy <= '1' ;
--				reset_mac <= '0' ;
--				MAC1_A(8 downto 0) <= block3x3(NON_ZERO(conv_integer(index))(0))(NON_ZERO(conv_integer(index))(1)) ;
--				MAC1_B <= to_signed(KERNEL(NON_ZERO(conv_integer(index))(0))(NON_ZERO(conv_integer(index))(1)), 16) ;
--				if NON_ZERO(conv_integer(index+1))(0) < 3 then
--					MAC2_A(8 downto 0) <= block3x3(NON_ZERO(conv_integer(index+1))(0))(NON_ZERO(conv_integer(index+1))(1)) ;
--					MAC2_B <= to_signed(KERNEL(NON_ZERO(conv_integer(index+1))(0))(NON_ZERO(conv_integer(index+1))(1)), 16) ;
--					index <= index + 2;
--				else
--					MAC2_A(8 downto 0) <= (others => '0');
--					MAC2_B <= (others => '0') ;
--					index <= index + 1;
--				end if;
--				convolution_state <= COMPUTE ;
--			end if;
--		when COMPUTE =>
--			busy <= '1' ;
--			new_conv <= '0' ;
--			if NON_ZERO(conv_integer(index))(0) < 3 then
--				reset_mac <= '0' ;
--				MAC1_A(8 downto 0) <= block3x3(NON_ZERO(conv_integer(index))(0))(NON_ZERO(conv_integer(index))(1)) ;
--				MAC1_B <= to_signed(KERNEL(NON_ZERO(conv_integer(index))(0))(NON_ZERO(conv_integer(index))(1)), 16) ;
--				if NON_ZERO(conv_integer(index+1))(0) < 3 then
--					MAC2_A(8 downto 0) <= block3x3(NON_ZERO(conv_integer(index+1))(0))(NON_ZERO(conv_integer(index+1))(1)) ;
--					MAC2_B <= to_signed(KERNEL(NON_ZERO(conv_integer(index+1))(0))(NON_ZERO(conv_integer(index+1))(1)), 16) ;
--					index <= index + 2;
--				else
--					MAC2_A(8 downto 0) <= (others => '0');
--					MAC2_B <= (others => '0') ;
--					index <= index + 1;
--				end if;
--			else
--				MAC2_A(8 downto 0) <= (others => '0'); --zeroing to stop mac operations
--				MAC2_B <= (others => '0') ;
--				MAC1_A(8 downto 0) <= (others => '0');
--				MAC1_B <= (others => '0') ;
--				convolution_state <= END_PIPELINE1 ;
--			end if;
--		when END_PIPELINE1 => -- accumulator is pipelined
--			busy <= '1' ;
--			new_conv <= '0' ;
--			convolution_state <= END_PIPELINE2 ;
--		when END_PIPELINE2 => -- accumulator is pipelined
--			busy <= '0' ;
--			new_conv <= '1' ;
--			raw_res <= FINAL_RES(15 downto 0) ; -- should not overflow
--			abs_resl <= abs(FINAL_RES) ;
--			convolution_state <= WAIT_PIXEL ;
--		when others => 
--			convolution_state <= WAIT_PIXEL ;
--	end case ;
--end if;
--end process;
--
--abs_res <= std_logic_vector(abs_resl(7 downto 0));
--
--MAC1_A(15 downto 9) <= (others => '0');
--MAC2_A(15 downto 9) <= (others => '0');
--
--end FSM;




