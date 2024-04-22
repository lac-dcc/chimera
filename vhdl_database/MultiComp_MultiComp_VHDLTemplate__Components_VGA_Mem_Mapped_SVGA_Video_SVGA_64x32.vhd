-- ____________________________________________________________________________________
-- This is from Grant Searle's Multicomp project
-- Grant's main web site is: http://searle.hostei.com/grant/    
-- and "multicomp" page http://searle.hostei.com/grant/Multicomp/index.html
-- Implements Grant Searle's modifications for 64x32 screens as described here:
-- http://searle.hostei.com/grant/uk101FPGA/index.html#Modification3
-- ____________________________________________________________________________________
-- Additional modifications for SVGA output
-- Implements a memory mapped display
-- Uses 2K of Dual Ported RAM in an Altera FPGA
-- 64x32 display
-- 800x600 SVGA output
-- 

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity Video_SVGA_64x32 is
	port (
		charAddr 	: out std_LOGIC_VECTOR(10 downto 0);
		charData 	: in std_LOGIC_VECTOR(7 downto 0);
		dispAddr 	: out std_LOGIC_VECTOR(10 downto 0);
		dispData 	: in std_LOGIC_VECTOR(7 downto 0);
		clk    	 	: in  std_logic;								-- 25.6 MHz clock
		video			: out std_logic;
		vSync 		: out std_logic;
		hSync  		: out  std_logic;
		hAct			: out  std_logic
   );
end Video_SVGA_64x32;

architecture rtl of Video_SVGA_64x32 is

	signal n_hSync   : std_logic := '1';	-- Active low horizontal sync
	signal n_vSync   : std_logic := '1';	-- Active low vertical sync

	signal horizCount: STD_LOGIC_VECTOR(9 DOWNTO 0); 
	signal vertLineCount: STD_LOGIC_VECTOR(9 DOWNTO 0); 

begin

	vSync <= n_vSync;
	hSync <= n_hSync;
	
	dispAddr <= vertLineCount(8 downto 4) & horizCount(8 downto 3);
	charAddr <= dispData & vertLineCount(3 downto 1);
	
	PROCESS (clk)
	BEGIN
	
-- Memory Mapped VGA Character Display
--		8X8 fonts
--		64x32 characters displayed per screen
-- Video Timing
--		Horizontal Line Timing Details
--			SVGA (spec - http://www.tinyvga.com/vga-timing/800x600@60Hz)
--				Pixel clock		40 MHz 
--				Entire line		1056 clocks	26.4 uS
--				Active pixels	800 clocks	20.0 uS	37.87 KHz
--				Sync Width		128 clocks	3.2 uS
--				F.Porch+border	40 clocks	1 uS
--				B.Porch+border	88 clocks	2.2 uS
--			Using FPGA
--				Pixel clock		25.6 MHz
--				Entire line		676 clocks	26.4 uS
--				Active pixels	512 clocks	20.0 uS	37.87 KHz
--				Sync Width		82 clocks	3.203 uS
--				F.Porch+border	26 clocks	1.016 uS
--				B.Porch+border	56 clocks	2.18 uS
-- 	Vertical Timing
--			SVGA (spec)
--				628 lines
--				600 active lines
--				1 lines front porch
--				4 lines vertical sync
--				23 lines back porch
--			FPGA (same as SVGA)
--				628 lines
--				600 active lines
--				1 lines front porch
--				4 lines vertical sync
--				23 lines back porch

		if rising_edge(clk) then
			if horizCount < 675 THEN
				horizCount <= horizCount + 1;		-- End of horizontal line
			else
				horizCount<= (others => '0');
				if vertLineCount > 629 then		-- End of frame
					vertLineCount <= (others => '0');
				else
					vertLineCount <= vertLineCount+1;
				end if;
			end if;
			-- Horizontal Sync
			if (horizCount >= 535) and (horizCount < 617) then
				n_hSync <= '0';
			else
				n_hSync <= '1';
			end if;
			-- Vertical Sync
			if vertLineCount > 550 and vertLineCount < 555 then
				n_vSync <= '0';
			else
				n_vSync <= '1';
			end if;
			-- Video Output Mux/Shift Register
			if horizCount(9)='0' and vertLineCount(9)='0' then
				video <= charData(7-to_integer(unsigned(horizCount(3 downto 0))));	-- 8:1 mux
				hAct <= '1';	-- white-on-blue
--				hAct <= '0';	-- amber
			else
				video <= '0';
				hAct <= '0';
			end if;
		end if;
	END PROCESS;	
  
 end rtl;
