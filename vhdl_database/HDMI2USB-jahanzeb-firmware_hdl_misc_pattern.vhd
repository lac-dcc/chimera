-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Format			Pixel Clock	|				Horizontal (in Pixels) 									|				Vertical (in Lines)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 								|	Active Video |	Front Porch	 | Sync Pulse	 | Back Porch  | Total  | 	Active Video	| Front Porch	 | Sync Pulse	| Back Porch | Total
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1024x768,60Hz	65.000		|		1024	 |		24		 |	136			 |   160	   | 1344  	|		768			|	3			 |  6			| 29		 | 806
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Total Horizontal = 1344
-- Total Vertical   = 806

-- O    Total frame time
-- P    Sync length
-- Q    Back porch
-- R    Active video time
-- S    Front porch
         -- ______________________          ________
-- ________|        VIDEO         |________|  VIDEO (next frame)
    -- |-Q-|----------R-----------|-S-|
-- __   ______________________________   ___________
  -- |_|                              |_|
  -- |P|
  -- |---------------O----------------|
  
  -- reff: http://martin.hinner.info/vga/timing.html
  -- reff: http://www.epanorama.net/faq/vga2rgb/calc.html

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;		 
USE ieee.std_logic_unsigned.all;

entity pattern is
generic (
	SIMULATION             	  : string := "FALSE");
port 
(	
	rgb 	: out std_logic_vector(23 downto 0);
	resx  : out std_logic_vector(15 downto 0);
	resy  : out std_logic_vector(15 downto 0);
	de		: out std_logic;
	pclk	: out std_logic;
	vsync	: out std_logic;
	hsync	: out std_logic;
	clk     : in  std_logic;
	rst_n   : in  std_logic
);
end entity pattern;

architecture rtl of pattern is

component patternClk
port
 (
  CLK_IN1           : in     std_logic;
  CLK_OUT1          : out    std_logic
 );
end component;

signal counterX : std_logic_vector(15 downto 0);
signal counterY : std_logic_vector(15 downto 0);
signal resX_i : std_logic_vector(15 downto 0);
signal resY_i : std_logic_vector(15 downto 0);

signal spY : integer;
signal bpY : integer;
signal fpY : integer;


signal spX : integer;
signal bpX : integer;
signal fpX : integer;

signal data : std_logic_vector(23 downto 0);


signal pclk_i : std_logic;
signal vsync_i : std_logic;
signal hsync_i : std_logic;
signal vActive : std_logic;
signal hActive : std_logic;

signal frameCounter : std_logic_vector(5 downto 0) := (others => '0');
signal secondTimeout : std_logic;
signal color : std_logic := '0';
signal barWidth : integer;

-- Color of bars defined here. May be customized
type colorsArray is array (0 to 7) of std_logic_vector(23 downto 0);
constant colors_1 : colorsArray := (X"ffffff", X"000000", X"0000ff", X"00ff00", X"ff0000", X"00ffff", X"ff00ff", X"ffff00");
constant colors_2 : colorsArray := (X"000000", X"ffffff", X"ffff00", X"ff00ff", X"00ffff", X"ff0000", X"00ff00", X"0000ff");

signal colors : colorsArray := colors_1;

begin

RESF: if (SIMULATION = "FALSE" ) generate
	resX_i <= X"0400";
	resY_i <= X"0300";
		
	spY <= 6;
	bpY <= 29;
	fpY <= 3;
	
	spX <= 136;
	bpX <= 160;
	fpX <= 24;
	
	barWidth <= 128;

end generate;
REST: if (SIMULATION = "TRUE" ) generate
	resX_i <= X"0200";
	resY_i <= X"0008";

	spY <= 1;
	bpY <= 2;
	fpY <= 3;
	
	spX <= 16;
	bpX <= 10;
	fpX <= 2;
	
	barWidth <= 64;
	
end generate;


-- rgb 	<= (data(7 downto 0) & data(23 downto 16) & data(15 downto 8));
rgb 	<= data;

resX	<= resX_i;
resY	<= resY_i;
pclk	<= pclk_i;
vsync	<= vsync_i;
hsync	<= hsync_i;

de <= vActive and hActive;

process(rst_n,pclk_i)
begin
	if rst_n = '0' then
	
		data 	 <= (others => '0');
		counterX <= (others => '0');
		counterY <= (others => '0');
		vsync_i <= '0';
		vActive <= '0';
		hsync_i <= '0';
		hActive <= '0';
		
	elsif rising_edge(pclk_i) then
	
		counterX <= counterX + 1;
		
		if counterY = 0 then 
			vsync_i <= '0';
			vActive <= '0';		
		elsif counterY = spY then
			vsync_i <= '1';
		elsif counterY = (spY+bpY) then
			vActive <= '1';		
		elsif counterY = (spY+bpY+CONV_INTEGER(resY_i)) then
			vActive <= '0';		
		elsif counterY = (spY+bpY+CONV_INTEGER(resY_i)+fpY) then
			counterY <= (others => '0');
			data <= (others => '0');
		end if;
	

		if counterX = 0 then 
			hsync_i <= '0';
			hActive <= '0';		
		elsif counterX = spX then
			hsync_i <= '1';
		elsif counterX = (spX+bpX) then
			hActive <= '1';		
		elsif counterX = (spX+bpX+CONV_INTEGER(resX_i)) then
			hActive <= '0';		
		elsif counterX = (spX+bpX+CONV_INTEGER(resX_i)+fpX) then
			counterX <= (others => '0');
			counterY <= counterY +1;
			counterX <= (others => '0');			
		end if;
	
		-- Generate 8 coloured, equally-space, vertical bars
		if vActive = '1' and hActive = '1' then
			if counterX < (spX+bpX+barWidth) then
				data <= colors(0);
			elsif counterX < (spX+bpX+barWidth*2) then
				data <= colors(1);
			elsif counterX < (spX+bpX+barWidth*3) then
				data <= colors(2);
			elsif counterX < (spX+bpX+barWidth*4) then
				data <= colors(3);
			elsif counterX < (spX+bpX+barWidth*5) then
				data <= colors(4);
			elsif counterX < (spX+bpX+barWidth*6) then
				data <= colors(5);
			elsif counterX < (spX+bpX+barWidth*7) then
				data <= colors(6);
			else			
				data <= colors(7);
			end if;
		end if;
		
	end if;
end process;


-- Frame Counter process to count 1 Second
-- Since we have 1024*768@60Hz, 1 second occurs after 60 VSYNC Pulses
frameCount: process(rst_n,vsync_i)
begin
	if rst_n = '0' then
		frameCounter <= (others => '0');
	
	elsif rising_edge(vsync_i) then
		frameCounter <= frameCounter + 1;
		if frameCounter = "111011" then
            secondTimeout <= '1';
            frameCounter <= "000000";
		else
			secondTimeout <= '0';
		end if;
	end if;
end process;

-- Alternate color of bars every second. Next color is complement of previous color.
process(rst_n, secondTimeout)
begin
	if rst_n = '0' then
		color <= '0';
		colors <= colors_1;
	
	elsif rising_edge(secondTimeout) then
		color <= color xor '1';
		if color = '0' then
			colors <= colors_1;
		else
			colors <= colors_2;
		end if;
	end if;
end process;

patternClk_com : patternClk
port map
(
CLK_IN1 => clk,
CLK_OUT1 => pclk_i);

end architecture;
