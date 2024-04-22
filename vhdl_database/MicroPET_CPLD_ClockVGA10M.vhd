----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12/30/2020 
-- Design Name: 
-- Module Name:    Clock - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- 	This implements the clock management for 
--		- 50 MHz input clock
--		- 25 MHz pixel clock output (VGA)
--		- 8 MHz memory access (slightly above due to clock shaping)
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.all;


entity Clock is
	  Port (
	   qclk 	: in std_logic;		-- input clock
	   reset	: in std_logic;
	   
	   memclk 	: out std_logic;	-- memory access clock signal
	   
	   clk1m 	: out std_logic;	-- trigger CPU access @ 1MHz
	   clk2m	: out std_logic;	-- trigger CPU access @ 2MHz
	   clk4m	: out std_logic;	-- trigger CPU access @ 4MHz
	   
	   dotclk	: out std_logic;	-- pixel clock for video
	   dot2clk	: out std_logic;	-- half the pixel clock
	   slotclk	: out std_logic;	-- 1 slot = 8 pixel; 1 slot = 2 memory accesses, one for char, one for pixel data (at end of slot)
	   chr_window	: out std_logic;	-- 1 during character fetch window
	   pxl_window	: out std_logic;	-- 1 during pixel fetch window (end of slot)
	   sr_load	: out std_logic		-- load pixel SR on falling edge of dotclk, when this is set
	 );
end Clock;

architecture Behavioral of Clock is

	signal clk_cnt : std_logic_vector(3 downto 0);
	signal cpu_cnt1 : std_logic_vector(3 downto 0);
	signal memclk_int : std_logic;
	
	function To_Std_Logic(L: BOOLEAN) return std_ulogic is
	begin
		if L then
			return('1');
		else
			return('0');
		end if;
	end function To_Std_Logic;

begin

	clk_p: process(qclk, reset, clk_cnt)
	begin
		if (reset = '1') then 
			clk_cnt <= (others => '0');
		elsif rising_edge(qclk) then
			clk_cnt <= clk_cnt + 1;
		end if;
	end process;
	
	-- we need to do some clock shaping on memclk, as three accesses with 120ns (360ns total)
	-- do not fit into 16 pixels with 40ns each (320ns total)
	out_p: process(qclk, reset, clk_cnt)
	begin
		if (reset = '1') then
			memclk <= '0';
			pxl_window <= '0';
			chr_window <= '0';
			sr_load <= '0';
		elsif (falling_edge(qclk)) then
			pxl_window <= '0';
			chr_window <= '0';
			sr_load <= '0';
			
			case (clk_cnt) is
			when "0000" =>
				memclk_int <= '0';
			when "0001" =>
				memclk_int <= '0';
			when "0010" =>
				memclk_int <= '1';
			when "0011" =>
				memclk_int <= '1';
			when "0100" =>
				memclk_int <= '1';
			when "0101" =>
				memclk_int <= '0';
				chr_window <= '1';
			when "0110" =>
				memclk_int <= '0';
				chr_window <= '1';
			when "0111" =>
				memclk_int <= '1';
				chr_window <= '1';
			when "1000" =>
				memclk_int <= '1';
				chr_window <= '1';
			when "1001" =>
				memclk_int <= '1';
				chr_window <= '1';
			when "1010" =>
				memclk_int <= '0';
				pxl_window <= '1';
			when "1011" =>
				memclk_int <= '0';
				pxl_window <= '1';
			when "1100" =>
				memclk_int <= '0';
				pxl_window <= '1';
			when "1101" =>
				memclk_int <= '1';
				pxl_window <= '1';
			when "1110" =>
				memclk_int <= '1';
				pxl_window <= '1';
				--sr_load <= '1';
			when "1111" =>
				memclk_int <= '1';
				sr_load <= '1';
				pxl_window <= '1';
			when others =>
				null;
			end case;
			
			memclk <= memclk_int;
			dotclk <= clk_cnt (0);
			dot2clk <= clk_cnt (1);
			slotclk <= clk_cnt (3);
		end if;
	end process;

	-- count 6 qclk cycles = ~8 MHz, then transform into clk1m/2m/4m
	cpu_cnt1_p: process(reset, cpu_cnt1, memclk_int)
	begin
		if (reset = '1') then
			cpu_cnt1 <= "0000";
		elsif (rising_edge(memclk_int)) then	
			if (cpu_cnt1 = "1001") then
				cpu_cnt1 <= "0000";
			else
				cpu_cnt1 <= cpu_cnt1 + 1;
			end if;
		end if;
	end process;

	-- generate clk1m/2m/4m
	-- note: those are sampled at rising edge of memclk
	cpu_cnt2_p: process(qclk, reset, cpu_cnt1)
	begin
		if (reset = '1') then
			clk4m <= '0';
			clk2m <= '0';
			clk1m <= '0';
		elsif (rising_edge(qclk)) then	
			clk4m <= '0';
			clk2m <= '0';
			clk1m <= '0';
			case (cpu_cnt1) is
			when "0000" =>
				clk1m <= '1';
				clk2m <= '1';
				clk4m <= '1';
			when "0010" =>
				clk4m <= '1';
			when "0100" => 
				clk2m <= '1';
			when "0101" => 
				clk4m <= '1';
			when "1000" =>
				clk4m <= '1';
			when others =>
				null;
			end case;
			
--			clk4m <= To_Std_Logic(cpu_cnt1(1 downto 0) = "00");
--			clk2m <= To_Std_Logic(cpu_cnt1(2 downto 0) = "000");
--			clk1m <= To_Std_Logic(cpu_cnt1(3 downto 0) = "0000");
			
		end if;
	end process;
		
end Behavioral;

