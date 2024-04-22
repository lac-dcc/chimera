----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    12:36:27 10/16/2012 
-- Design Name: 
-- Module Name:    HARRIS_RESPONSE - Behavioral 
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

library work ;
use work.utils_pack.all ;
use work.image_pack.all ;

entity HARRIS_RESPONSE is
	port(
	clk, resetn : in std_logic ;
	en : in std_logic ;
	xgrad_square_sum, ygrad_square_sum, xygrad_sum : in signed(15 downto 0);
	dv	:	out std_logic ;
	harris_response : out std_logic_vector(15 downto 0)
	);
end HARRIS_RESPONSE;

architecture Behavioral of HARRIS_RESPONSE is
	signal stage1, stage2, stage3 : std_logic ; --pipeline stages enable signal
	signal det0, det1, det0_latched, det1_latched, det, det_latched : signed(31 downto 0);
	signal trace, trace_latched : signed(15 downto 0);
	signal trace_square, trace_square_latched : signed(31 downto 0);
	signal harris_val : signed(15 downto 0);
	signal harris_val_long : signed(31 downto 0);
begin
		trace <= xgrad_square_sum + ygrad_square_sum ; -- first stage --16bit
		det0 <= ygrad_square_sum * xgrad_square_sum; --32bit, is positive
		det1 <= xygrad_sum * xygrad_sum; -- 32 bit, is positive
		
		
		
		trace_square <= trace_latched * trace_latched ; -- second stage --32bit
		det <= det0_latched - det1_latched ; --32 bit, must check on det range
		
		harris_val_long <= det_latched - SHIFT_RIGHT(trace_square_latched, 4) ; -- final stage --32 bit
																							  -- trace is always positive
	
		
		process(clk, resetn)
		begin
			if resetn = '0' then
				harris_response <= (others => '0') ;
			elsif clk'event and clk ='1' then
				if stage2 = '1' then
					harris_response <= std_logic_vector(harris_val_long(25 downto 10)) ;
				end if ;
			end if ;
		end process ;
		
		
		
		process(clk, resetn)
		begin
			if resetn = '0' then
				stage1 <= '0' ;
				stage2 <= '0' ;
				stage3 <= '0' ;
			elsif clk'event and clk ='1' then
				stage1 <= en ;
				stage2 <= stage1 ;
				stage3 <= stage2 ;
			end if ;
		end process ;
		
		process(clk, resetn)
		begin
			if resetn = '0' then
				trace_latched <= (others => '0') ;
				det0_latched <= (others => '0') ;
				det1_latched <= (others => '0') ;
				det_latched <= (others => '0') ;
				trace_square_latched <= (others => '0') ;
			elsif clk'event and clk ='1' then
				trace_latched <= trace ;
				det0_latched <= det0 ;
				det1_latched <= det1 ;
				det_latched <= det ;
				trace_square_latched <= trace_square ;
			end if ;
		end process ;
		
		
		dv <= stage3 ;

end Behavioral;

