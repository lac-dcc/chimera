library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vgasig is
    Port ( clock : in std_logic;
           reset : in std_logic;
           hsyncb : buffer std_logic;
           vsyncb : out std_logic;
           enable : out std_logic;
           Xaddr : out std_logic_vector(9 downto 0);
           Yaddr : out std_logic_vector(9 downto 0));
end vgasig;

architecture Behavioral of vgasig is

constant H_PIXELS: INTEGER:=640;
constant H_FRONT: INTEGER:=16;
constant H_BACK: INTEGER:=48;
constant H_SYNCTIME: INTEGER:=96;
constant H_PERIOD: INTEGER:= H_SYNCTIME + H_PIXELS + H_FRONT + H_BACK;

-- vertical timing signals
constant V_LINES: INTEGER:=480;
constant V_FRONT: INTEGER:=11;
constant V_BACK: INTEGER:=32;
constant V_SYNCTIME: INTEGER:=2;
constant V_PERIOD: INTEGER:= V_SYNCTIME + V_LINES + V_FRONT + V_BACK;

signal hcnt: std_logic_vector(9 downto 0);							-- horizontal pixel counter
signal vcnt: std_logic_vector(9 downto 0);							-- vertical line counter
begin

-- control the reset, increment and overflow of the horizontal pixel count
A: process(clock, reset)
begin
	-- reset asynchronously clears horizontal counter
	if reset = '0' then
		hcnt <= (others => '0');
	-- horiz. counter increments on rising edge of dot clock
	elsif (clock'event and clock = '1') then
		-- horiz. counter restarts after the horizontal period (set by the constants)
		if hcnt < H_PERIOD then
			hcnt <= hcnt + 1;
		else
			hcnt <= (others => '0');
		end if;
	end if;
end process;

-- control the reset, increment and overflow of the vertical line counter after every horizontal line
B: process(hsyncb, reset)
begin
	-- reset asynchronously clears line counter
	if reset='0' then
		vcnt <= (others => '0');
	-- vert. line counter increments after every horiz. line
	elsif (hsyncb'event and hsyncb = '1') then
		-- vert. line counter rolls-over after the set number of lines (set by the constants)
		if vcnt < V_PERIOD then
			vcnt <= vcnt + 1;
		else
			vcnt <= (others => '0');
		end if;
	end if;
end process;

-- set the horizontal sync high time and low time according to the constants
C: process(clock, reset)
begin
	-- reset asynchronously sets horizontal sync to inactive
	if reset = '0' then
		hsyncb <= '1';
	-- horizontal sync is recomputed on the rising edge of every dot clock
	elsif (clock'event and clock = '1') then
		-- horiz. sync is low in this interval to signal start of a new line
		if (hcnt >= (H_PIXELS + H_FRONT) and hcnt < (H_PIXELS + H_SYNCTIME + H_FRONT)) then
			hsyncb <= '0';
		else
			hsyncb <= '1';
		end if;
	end if;
end process;

-- set the vertical sync high time and low time according to the constants
D: process(hsyncb, reset)
begin
	-- reset asynchronously sets vertical sync to inactive
	if reset = '0' then
		vsyncb <= '1';
	-- vertical sync is recomputed at the end of every line of pixels
	elsif (hsyncb'event and hsyncb = '1') then
		-- vert. sync is low in this interval to signal start of a new frame
		if (vcnt >= (V_LINES + V_FRONT) and vcnt < (V_LINES + V_SYNCTIME + V_FRONT)) then
			vsyncb <= '0';
		else
			vsyncb <= '1';
		end if;
	end if;
end process;

-- whether it should latch the current data or not
-- (always with a 50MHz clock - blanking is handled on the RAMDAC by asserting a signal)
--latch <= NOT reset;

-- asserts the blaking signal (active low)
E: process (clock)
begin
	if clock'EVENT and clock = '1' then
		-- if we are outside the visible range on the screen then tell the RAMDAC to blank
		-- in this section by putting enable low
		if hcnt >= H_PIXELS or vcnt >= V_LINES then
			enable <= '0';
		 else 
		 	enable <= '1';
		 end if;
	end if;
end process;

-- The video RAM address is built from the lower 9 bits of the vertical
-- line counter and bits 7-2 of the horizontal pixel counter.
-- Allows easy access for the current address of the current pixel in RAM
H:
Xaddr <= hcnt;
Yaddr <= vcnt;

end Behavioral;
