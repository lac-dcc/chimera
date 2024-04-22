----------------------------------------------------------------------------------
-- Company: Visual Pulse
-- Engineer: Eric (MLM)
-- 
-- Create Date:    09:33:28 07/11/2013 
-- Design Name: 
-- Module Name:    vgaText_top - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- note this line.The package is compiled to this directory by default.
-- so don't forget to include this directory. 
library work;
-- this line also is must.This includes the particular package into your program.
use work.commonPak.all;


entity vgaText_top is
	port(
		clk: in std_logic;
		reset: in std_logic; -- SW0
		Led: out std_logic_vector(7 downto 0);
		
		hsync: out std_logic;
		vsync: out std_logic;
		Red: out std_logic_vector(2 downto 0);
		Green: out std_logic_vector(2 downto 0);
		Blue: out std_logic_vector(2 downto 1)
	);
end vgaText_top;

architecture Behavioral of vgaText_top is
	
	-- Start out at the end of the display range, 
	-- so we give a sync pulse to kick things off
	signal hCount: integer := 640;
	signal vCount: integer := 480;
	
	signal nextHCount: integer := 641;
	signal nextVCount: integer := 480;
	
	
	constant NUM_TEXT_ELEMENTS: integer := 3;
	signal inArbiterPortArray: type_inArbiterPortArray(0 to NUM_TEXT_ELEMENTS-1) := (others => init_type_inArbiterPort);
	signal outArbiterPortArray: type_outArbiterPortArray(0 to NUM_TEXT_ELEMENTS-1) := (others => init_type_outArbiterPort);
	
	signal drawElementArray: type_drawElementArray(0 to NUM_TEXT_ELEMENTS-1) := (others => init_type_drawElement);

	signal led_reg: std_logic_vector(7 downto 0) := (others => '0');
begin

	Led <= led_reg;
	
	
	fontLibraryArbiter: entity work.blockRamArbiter
	generic map(
		numPorts => NUM_TEXT_ELEMENTS
	)
	port map(
		clk => clk,
		reset => reset,
		inPortArray => inArbiterPortArray,
		outPortArray => outArbiterPortArray
	);


	textDrawElement: entity work.text_line
	generic map (
		textPassageLength => 11
	)
	port map(
		clk => clk,
		reset => reset,
		textPassage => "Hello World",
		position => (50, 50),
		colorMap => (10 downto 0 => "111" & "111" & "11"),
		inArbiterPort => inArbiterPortArray(0),
		outArbiterPort => outArbiterPortArray(0),
		hCount => nextHCount,
		vCount => nextVCount,
		drawElement => drawElementArray(0)
	);
	
	
	textDrawElement2: entity work.text_line
	generic map (
		textPassageLength => 5
	)
	port map(
		clk => clk,
		reset => reset,
		textPassage => SOH & " : " & STX,
		position => (50, 200),
		colorMap => (4 downto 0 => "111" & "111" & "11"),
		inArbiterPort => inArbiterPortArray(1),
		outArbiterPort => outArbiterPortArray(1),
		hCount => nextHCount,
		vCount => nextVCount,
		drawElement => drawElementArray(1)
	);
	
	textDrawElement3: entity work.text_line
	generic map (
		textPassageLength => 8
	)
	port map(
		clk => clk,
		reset => reset,
		textPassage => "I " & "<3" & " You",
		position => (70, 125),
		colorMap => (7 downto 4 => "111" & "111" & "11", 3 downto 2 => "111" & "000" & "00", 1 downto 0 => "111" & "111" & "11"),
		inArbiterPort => inArbiterPortArray(2),
		outArbiterPort => outArbiterPortArray(2),
		hCount => nextHCount,
		vCount => nextVCount,
		drawElement => drawElementArray(2)
	);
	
	
	vgasignal: process(clk)
		variable divide_by_2 : std_logic := '0';
		variable rgbDrawColor : std_logic_vector(7 downto 0) := (others => '0');
	begin
		
		if rising_edge(clk) then
			if reset = '1' then
				hsync <= '1';
				vsync <= '1';
				
				-- Start out at the end of the display range, 
				-- so we give a sync pulse to kick things off
				hCount <= 640;
				vCount <= 480;
				nextHCount <= 641;
				nextVCount <= 480;
				
				rgbDrawColor := (others => '0');
				
				divide_by_2 := '0';
			else
				
				-- Running at 25 Mhz (50 Mhz / 2)
				if divide_by_2 = '1' then
					
					if(hCount = 799) then
						hCount <= 0;
						
						if(vCount = 524) then
							vCount <= 0;
						else
							vCount <= vCount + 1;
						end if;
					else
						hCount <= hCount + 1;
					end if;
					
					
					-- Make sure we got the rollover covered
					if (nextHCount = 799) then	
						nextHCount <= 0;
						
						-- Make sure we got the rollover covered
						if (nextVCount = 524) then	
							nextVCount <= 0;
						else
							nextVCount <= vCount + 1;
						end if;
					else
						nextHCount <= hCount + 1;
					end if;
					
					
					
					if (vCount >= 490 and vCount < 492) then
						vsync <= '0';
					else
						vsync <= '1';
					end if;
					
					if (hCount >= 656 and hCount < 752) then
						hsync <= '0';
					else
						hsync <= '1';
					end if;
					
					
					-- If in display range
					if (hCount < 640 and vCount < 480) then
						
						
						
						-- Draw stack:
						-- Default is black
						rgbDrawColor := "000" & "000" & "00";
						
						
						
						-- Draw bounding left line - 2px
						if hCount >= 0 and hCount < 2 then
							rgbDrawColor := "111" & "111" & "00";
						-- Draw bounding right line - 2px
						elsif hCount <= 639 and hCount > 637 then
							rgbDrawColor := "111" & "111" & "00";
						end if;
						
						
						-- Draw bounding top line - 2px
						if vCount >= 0 and vCount < 2 then
							rgbDrawColor := "111" & "111" & "00";
						-- Draw bounding bottom line - 2px
						elsif vCount <= 479 and vCount > 477 then
							rgbDrawColor := "111" & "111" & "00";
						end if;
						
						
						-- Text Draw Stack
						-----------------
						for i in drawElementArray'range loop
							if drawElementArray(i).pixelOn then
								rgbDrawColor := drawElementArray(i).rgb;
							end if;
						end loop;
						
						
						-- Show your colors
						Red <= rgbDrawColor(7 downto 5);
						Green <= rgbDrawColor(4 downto 2);
						Blue <= rgbDrawColor(1 downto 0);
						
						
					else
						Red <= "000";
						Green <= "000";
						Blue <= "00";
					end if;
			
				end if;
				divide_by_2 := not divide_by_2;
			end if;
		end if;
	end process;
	
	
	-- Just a basic process that scrolls the leds
	-- If in reset, leds are off
	runLeds: process(clk)
		variable prescalerCount: integer := 0;
		variable prescaler: integer := 6250000;
	begin
		if rising_edge(clk) then
			if reset = '1' then
				prescalerCount := 0;
			
				led_reg <= (others => '0');
			else
				if prescalerCount >= prescaler then
					if led_reg = "00000000" then
						led_reg <= "00000001";
					else
						led_reg <= led_reg(6 downto 0) & "0";
					end if;
					
					prescalerCount := 0;
				end if;
				
				prescalerCount := prescalerCount + 1;
			end if;
		end if;
	end process;
	
	

end Behavioral;

