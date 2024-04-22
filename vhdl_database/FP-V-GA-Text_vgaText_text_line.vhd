----------------------------------------------------------------------------------
-- Company: Visual Pulse
-- Engineer: Eric (MLM)
-- 
-- Create Date:    00:06:24 07/11/2013 
-- Design Name: 
-- Module Name:    text_line - Behavioral 
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

entity text_line is
	generic(
		textPassageLength: integer := 11;
		fontWidth: integer := FONT_WIDTH;
		fontHeight: integer := FONT_HEIGHT
	);
	port (
		clk: in std_logic;
		reset: in std_logic;
		textPassage: in string(1 to textPassageLength) := (others => NUL);
		position: in point_2d := (0, 0); -- top left corner of text
		colorMap: in type_textColorMap(0 to textPassageLength-1) := (others => "111" & "111" & "11");
		
		inArbiterPort: out type_inArbiterPort := init_type_inArbiterPort;
		outArbiterPort: in type_outArbiterPort;
		
		hCount: in integer; -- Pass in the next hCount so that pixel buffer can changed apropriately before applied
		vCount: in integer; -- Pass in the next vCount so that pixel buffer can changed apropriately before applied
		
		drawElement: out type_drawElement := (false, "111" & "111" & "11")
	);

end text_line;

architecture Behavioral of text_line is

	signal pixelBuffer : boolean;
	signal RGBBuffer : std_logic_vector(7 downto 0) := "111" & "111" & "11";

	
	
	signal dataSetUp: boolean := false;
	
	-- This stuff is for the block ram pseudo frame buffer for this element
	----------------------------
	-- Holds the address we intend to use/used
	signal bRam_addrReg: std_logic_vector(log2_float((textPassage'length * fontHeight)-1) downto 0) := (others => '0');
	-- Holds the most recent data we just got
	signal bRam_dataOutReg: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	-- Are we writing to the ram
	signal bRam_writeEnableReg: std_logic := '0';
	-- What are we putting in there
	signal bRam_dataInReg: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	
	signal initMem_bRam_addrReg: std_logic_vector(log2_float((textPassage'length * fontHeight)-1) downto 0) := (others => '0');
	signal drawing_bRam_addrReg: std_logic_vector(log2_float((textPassage'length * fontHeight)-1) downto 0) := (others => '0');
begin
	
	drawElement.pixelOn <= pixelBuffer;
	drawElement.rgb <= RGBBuffer;

	-- This is the basically the database
	-- Accessed by address
	blockRam: entity work.basicBlockRAM
	generic map(
		numElements => textPassage'length * fontHeight,
		dataWidth => 8
	)
	port map(
		clkA => clk,
		writeEnableA => bRam_writeEnableReg,
		addrA => bRam_addrReg, -- Last 4 bits (3 downto 0) is the row address. The other bits are for index of character
		dataOutA => bRam_dataOutReg,
		dataInA => bRam_dataInReg
	);
	
	
	-- Resolve personal RAM addr
	bRam_addrReg <= (others => '0') when reset = '1' else
					initMem_bRam_addrReg when not dataSetup else drawing_bRam_addrReg;
	
	

	initializeMemory: process(clk)
		variable nextData: boolean := true;
		variable curr_addr: integer range 0 to 15 := 0; -- The current row of the character we are working on
		variable curr_char: integer range 1 to textPassage'length := 1; -- Strings start at 1
	begin
		if rising_edge(clk) then
			if reset = '1' then
				inArbiterPort <= init_type_inArbiterPort;
				
				initMem_bRam_addrReg <= (others => '0');
				
				bRam_writeEnableReg <= '0';
				bRam_dataInReg <= (others => '0');
				
				-- Reset addr and char index
				curr_addr := 0;
				curr_char := 1;
				
				-- Make the first arbiter addr as the the first row of the first character
				inArbiterPort.addr <= std_logic_vector(to_unsigned(character'pos(textPassage(curr_char)), 7)) & std_logic_vector(to_unsigned(curr_addr, 4));
				
				-- Reset this. Used for for this catpure...
				nextData := false;
				dataSetUp <= false;
			else
				-- Here is where we capture all the data
				------------------------------------------
				
				if not dataSetUp then
					inArbiterPort.dataRequest <= true;
					bRam_writeEnableReg <= '0';
					
					-- If we are not waiting for data 
					-- and we have not already set it to true
					if not outArbiterPort.dataWaiting and not nextData then
						nextData := true;
					end if;
					
					if nextData and outArbiterPort.dataWaiting then
						
						nextData := false;

						-- We use curr_char-1 because it is 1 based instead of 0
						initMem_bRam_addrReg <= std_logic_vector(to_unsigned((curr_char-1), initMem_bRam_addrReg'length-4)) & std_logic_vector(to_unsigned(curr_addr, 4));
						-- Put it into our personal ram
						bRam_dataInReg <= outArbiterPort.data;
						bRam_writeEnableReg <= '1';
						
							
						-- Check whether we got a full char (16 rows)
						-- by checking whether the next address is greater than what we want
						if curr_addr+1 > fontHeight-1 then
							-- We are onward to the next...
							curr_char := curr_char + 1;
							curr_addr := 0;
							
							-- Now check if we got ALL of the data (all chars)
							-- Remember: curr_char is 1 based
							if curr_char > textPassage'length then
								-- All data set
								dataSetUp <= true;
								
								-- Roll this back over, even though we are done
								curr_char := 1;
								
								-- We are done writing to the personal ram
								bRam_writeEnableReg <= '0';
								
								-- We are done requesting from the main ram
								inArbiterPort.dataRequest <= false;
								
								-- Set the address at the beginning for the drawing.
								initMem_bRam_addrReg <= (others => '0');
							end if;
							
						else
							-- Actually Roll to the next address
							curr_addr := curr_addr + 1;
							
						end if;
						
						-- And change the main ram address to grab another
						inArbiterPort.addr <= std_logic_vector(to_unsigned(character'pos(textPassage(curr_char)), 7)) & std_logic_vector(to_unsigned(curr_addr, 4));
						
						
					end if;
				else
					inArbiterPort.dataRequest <= false;
				end if;
			
			end if;
			
		end if;
		
			
	end process;
	
	
	drawing: process(clk)
		variable inX: boolean := false;
		variable inY: boolean := false;
		
		variable next_bRam_addr: std_logic_vector(log2_float((textPassage'length * fontHeight)-1) downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			if reset = '1' then
				drawing_bRam_addrReg <= (others => '0');
				
				inX := false;
				inY := false;
			else
				-- By Default pixelBuffer is off
				-- If we need to turn it on, we can do it below
				pixelBuffer <= false;
				
				-- If we are drawing in the horizontal range of this line element
				if hCount >= position.x and hCount < position.x + (fontWidth * textPassage'length) then
					inX := true;
				else
					inX := false;
					
					-- Reset the character index of the addr to the first character
					drawing_bRam_addrReg(drawing_bRam_addrReg'length-1 downto 4) <= (others => '0');
				end if;
				
				-- If we are drawing in the vertical range of this line element
				if vCount >= position.y and vCount < position.y + fontHeight then
					inY := true;
				else
					inY := false;
					
					-- Reset the character row to the first row
					drawing_bRam_addrReg(3 downto 0) <= (others => '0');
				end if;
				
				
				
				if inX and inY then
					
					if bRam_dataOutReg(fontWidth-1 - ((hCount - position.x) mod fontWidth)) = '1' then
						RGBBuffer <= colorMap((hCount - position.x)/fontWidth);
						pixelBuffer <= true;
					end if;
					
					
					-- Set the addr to the next string we need
					-- Accounts for current character and current row
					-- +1 to hCount as that will be the next
					-- and it takes one clock cycle for the data to come
					-- next_bRam_addr := std_logic_vector(to_unsigned((hCount+2 - position.x)/fontWidth, bRam_addrReg'length-4)) & std_logic_vector(to_unsigned(vCount - position.y, 4));
					
					if (hCount+1 - position.x)/fontWidth < textPassage'length then
						next_bRam_addr := std_logic_vector(to_unsigned((hCount+1 - position.x)/fontWidth, bRam_addrReg'length-4)) & std_logic_vector(to_unsigned(vCount - position.y, 4));
					else
						next_bRam_addr := (drawing_bRam_addrReg'length-1 downto 4 => '0') & std_logic_vector(to_unsigned(vCount+1 - position.y, 4));
					end if;
					
					drawing_bRam_addrReg <= next_bRam_addr;
					
--					if to_integer(unsigned(next_bRam_addr)) < (textPassage'length * fontHeight) then
--						drawing_bRam_addrReg <= next_bRam_addr;
--					else
--						-- Rollover
--						-- addr_that_is_greater - max_addr
--						--drawing_bRam_addrReg <= std_logic_vector(to_unsigned(to_integer(unsigned(next_bRam_addr)) - (textPassage'length * fontHeight)-1, bRam_addrReg'length));
--					
--						--drawing_bRam_addrReg <= (bRam_addrReg'length-1 downto 4 => '0') & std_logic_vector(to_unsigned(vCount - position.y, 4));
--						drawing_bRam_addrReg <= (others => '0');
--					end if;
					
				end if;
				
			end if;
		end if;
	end process;

end Behavioral;

