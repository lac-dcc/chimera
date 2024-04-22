-- Additional modifications for XVGA output
-- Implements a memory mapped display
-- Uses 2K of Dual Ported RAM in an Altera FPGA
-- 64x32 display
-- 1024x768 XVGA output
-- http://www.tinyvga.com/vga-timing/1024x768@60Hz
-- 

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity Video_XVGA_64x32 is
	port (
		resSel		: in std_logic := '1';		-- Resolution 1 = 64x32, 0 = 48x16
		charAddr 	: out std_LOGIC_VECTOR(10 downto 0);
		charData 	: in std_LOGIC_VECTOR(7 downto 0);
		dispAddr 	: out std_LOGIC_VECTOR(10 downto 0);
		dispData 	: in std_LOGIC_VECTOR(7 downto 0);
		clk    	 	: in  std_logic;								-- 65 MHz Video Clock
		video			: out std_logic;
		vSync 		: out std_logic;
		hSync  		: out  std_logic;
		hAct			: out  std_logic
   );
end Video_XVGA_64x32;

architecture rtl of Video_XVGA_64x32 is

	signal n_hSync   : std_logic := '1';	-- Active low horizontal sync
	signal n_vSync   : std_logic := '1';	-- Active low vertical sync

	signal horizCount: STD_LOGIC_VECTOR(10 DOWNTO 0);
	signal vertLineCount: STD_LOGIC_VECTOR(9 DOWNTO 0);
	signal theCharRow: STD_LOGIC_VECTOR(7 DOWNTO 0);		-- 32 rows of characters x 8 rows per character
	signal prescaleRow: STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

	vSync <= n_vSync;
	hSync <= n_hSync;
	
	dispAddr <= theCharRow(7 downto 3) & horizCount(9 downto 4);
	charAddr <= dispData & theCharRow(2 downto 0);
		
	PROCESS (clk, prescaleRow)
	BEGIN
	
-- Memory Mapped XVGA Character Display
--		8X8 fonts
--		64x32 characters displayed per screen
-- Video Timing
--		Horizontal Line Timing Details
--			XVGA (spec - http://www.tinyvga.com/vga-timing/800x600@60Hz)
--				Pixel clock		65 MHz 
--				Entire line		1344 clocks	20.6 uS		48.363 KHz
--				Active pixels	1024 clocks	15.75 uS
--				Sync Width		136 clocks	2.09 uS
--				F.Porch+border	24 clocks	0.36 uS
--				B.Porch+border	160 clocks	2.46 uS
-- 	Vertical Timing
--			SVGA (spec)
--				768 lines
--				806 active lines
--				3 lines front porch
--				6 lines vertical sync
--				29 lines back porch

		if rising_edge(clk) then
			if horizCount < 1344 THEN
				horizCount <= horizCount + 1;		-- End of horizontal line
			else
				horizCount <= (others => '0');
				if vertLineCount > 805 then		-- End of frame
					vertLineCount <= (others => '0');
					theCharRow <= (others => '0');
					prescaleRow <= (others => '0');
				else 
					vertLineCount <= vertLineCount+1;
					-- Prescale row counter 768 rows / 32 rows / 8 lines/row = 3 rows pre-scale
					if resSel = '1' then
						
						if prescaleRow = "010" then 
							prescaleRow <= "000";
							theCharRow <= theCharRow+1;
						else
							prescaleRow <= prescaleRow+1;
						end if;
					else
						-- Prescale row counter 768 rows / 16 rows / 8 lines/row = 6 rows pre-scale
						if prescaleRow = "101" then 
							prescaleRow <= "000";
							theCharRow <= theCharRow+1;
						else
							prescaleRow <= prescaleRow+1;
						end if;
					end if;
				end if;
			end if;
			-- Horizontal Sync
			if (horizCount >= 1044) and (horizCount < 1068) then
				n_hSync <= '0';
			else
				n_hSync <= '1';
			end if;
			-- Vertical Sync
			if vertLineCount > 771 and vertLineCount < 774 then
				n_vSync <= '0';
			else
				n_vSync <= '1';
			end if;
			-- Video Output Mux/Shift Register
			if horizCount(10)='0' and vertLineCount < 769 then
				video <= charData(7-to_integer(unsigned(horizCount(4 downto 1))));	-- 8:1 mux
				hAct <= '1';	-- white-on-blue
			else
				video <= '0';
				hAct <= '0';
			end if;
		end if;
	END PROCESS;	
  
 end rtl;
