----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:37:14 07/01/2013 
-- Design Name: 
-- Module Name:    pid_filter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work ;
use work.utils_pack.all ;



-- inspired by http://crap.gforge.inria.fr/doc2.php
entity pid_filter is
generic(clk_period_ns : integer := 8;
		  pid_period_ns : integer := 20000000); -- 50Hz PID for RC based ESC
port(
	clk, resetn : in std_logic ;
	en : in std_logic ;
	K, AK : in std_logic_vector(15 downto 0);
	B : in std_logic_vector(15 downto 0);
	setpoint : in signed(15 downto 0);
	ENC_A : in std_logic ;
	ENC_B : in std_logic ;
	cmd : out std_logic_vector(15 downto 0);
	dir : out std_logic 
);
end pid_filter;

architecture Behavioral of pid_filter is
constant tick_modulo : integer := (pid_period_ns/clk_period_ns)-1 ;


signal ENC_A_OLD, ENC_A_RE : std_logic ;
signal std_encoder_value : std_logic_vector(15 downto 0) ;
signal encoder_value : signed(15 downto 0) ;


signal tick_count : std_logic_vector(nbit(tick_modulo)-1 downto 0);
signal cycle_count : std_logic_vector(1 downto 0);
signal en_cycle_counter : std_logic ;
signal reload : std_logic ;
signal acc, sum : signed(31 downto 0); 
signal mult_op : unsigned(31 downto 0);
signal op1, op2 : unsigned(15 downto 0);
signal mc, xn, xnn : signed(15 downto 0);

signal xn_sign, xnn_sign, mc_sign, sign, sign_latched : std_logic ;
signal latch_res : std_logic ;
begin

-- encoder management part
process(clk, resetn)
	begin
		if resetn = '0' then
			ENC_A_OLD <= '0';
		elsif clk'event and clk = '1' then
			ENC_A_OLD <= ENC_A ;
		end if ;
	end process ;
	ENC_A_RE <= (ENC_A and (NOT ENC_A_OLD)) and  en;	

encoder_chan : up_down_counter
	 generic map(NBIT => 16)
	 port map( clk => clk,
				  resetn => resetn,
				  sraz => reload,
				  en => ENC_A_RE ,  -- must detect rising edge
				  load => '0',
				  up_downn => ENC_B,
				  E => (others => '0'),
				  Q => std_encoder_value
				  );
	 encoder_value <= signed(std_encoder_value) ;



counter0 : up_down_counter
				generic map(NBIT => nbit(tick_modulo))				
				port map(
					clk => clk,
					resetn => resetn ,
					sraz => '0' ,
					en => '1' ,
					up_downn => '0',
					load => reload,
					E => std_logic_vector(to_unsigned(tick_modulo, nbit(tick_modulo))),
					Q => tick_count
				);
reload	<= '1' when tick_count = 0 else
				'0' ;


cycles_counter : up_down_counter
				generic map(NBIT => 2)				
				port map(
					clk => clk,
					resetn => resetn ,
					sraz => '0' ,
					en => en_cycle_counter ,
					up_downn => '0',
					load => reload,
					E => (others => '1'),
					Q => cycle_count
				);
en_cycle_counter <= '1' when cycle_count /= 0 else
						  '0';
						
process(clk, resetn)
begin
	if resetn = '0' then
		mult_op <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if reload = '1' then
			mult_op <= (others => '0') ;
		else
			mult_op <= op1 * op2 ;
		end if ;
	end if ;
end process ;


sum <= (acc - signed(mult_op)) when sign_latched = '0' else
		 (acc + signed(mult_op)) ;
		 
process(clk, resetn)
begin
	if resetn = '0' then
		acc <= (others => '0') ;
		sign_latched <= '0' ;
	elsif clk'event and clk = '1' then
		if reload = '1' then
			acc <= (others => '0') ;
		else
			acc <=  sum;
		end if ;
		sign_latched <= sign ;
	end if ;
end process ;

with cycle_count select 
op1 <= unsigned(K) when "11",
		 unsigned(AK) when "10",
		 unsigned(B) when "01",
		 (others => '0') when others;
		 
with cycle_count select 
op2 <= unsigned(abs(xn)) when "11",
		 unsigned(abs(xnn)) when "10",
		 unsigned(abs(mc)) when "01",
		 (others => '0') when others;

with cycle_count select 
sign <= xn_sign when "11",
		  (NOT xnn_sign) when "10",
		  mc_sign when "01",
		  '0' when others;

xn_sign <= '1' when xn > 0 else
			  '0' ;
xnn_sign <= '1' when xnn > 0 else
			  '0' ;
mc_sign <= '1' when mc > 0 else
			  '0' ;

process(clk, resetn)
begin
	if resetn = '0' then
		xnn <= (others => '0') ;
		xn <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if reload = '1' then
			xn <= setpoint - encoder_value ;
			xnn <= xn ;
		end if ;
	end if ;
end process ;


delay_latch_res : generic_delay
	generic map( WIDTH => 1, DELAY => 4)
	port map(
		clk => clk, resetn => resetn,
		input(0)	=> reload,
		output(0) => latch_res
);		

process(clk, resetn)
begin
	if resetn = '0' then
		mc <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if latch_res = '1' then
			mc <= acc(25 downto 10) ;
		end if ;
	end if ;
end process ;

cmd <=  (others => '0') when en = '0' else
		  (not  std_logic_vector(mc)) when mc < 0 else
		  std_logic_vector(mc) ;
		  
dir <= '1' when mc < 0 else
		 '0' ;
		 
end Behavioral;

