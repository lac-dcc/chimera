---------------------------------------------------------
-- UK101 Full Screen Display Mode  64x32 Characters	--
--																		--
--																		--
-- Unrestricted release - do with it as you see fit.	--
--																		--
-- Cray Ze Ape - April 21 2019								--
---------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_Insignia_Monitor is
	port (
		charAddr : out std_LOGIC_VECTOR(10 downto 0);
		charData : in std_LOGIC_VECTOR(7 downto 0);
		dispAddr : out std_LOGIC_VECTOR(10 downto 0);
		dispData : in std_LOGIC_VECTOR(7 downto 0);
 		CLOCK_40    	: in  std_logic;
		Vout:      out unsigned(17 downto 0) -- rrrrr,gggggg,bbbbb,hsync,vsync
	);
end vga_Insignia_Monitor;


architecture Behavioral of vga_Insignia_Monitor is

constant BorderCol						: unsigned(15 downto 0):="0000000000000000";	-- Black border
--constant BorderCol						: unsigned(15 downto 0):="0000011111111111";	-- Cyan border
constant ScreenCol						: unsigned(15 downto 0):="0000000000011111";
constant CharCol							: unsigned(15 downto 0):="1111111111111111";

signal Pixel_Colour			: unsigned(15 DOWNTO 0) := "0000000000000000";
signal VGAout					: unsigned(17 downto 0);
signal hcount									: unsigned(10 downto 0):="00000000000";
signal vcount									: unsigned(9 downto 0):="0000000000";
signal X0vp1,    X0vp1_d1, X0vp1_d2		: unsigned(15 downto 0):="0000000000000000";
signal X0vp1_d3, X0vp1_d4					: unsigned(15 downto 0):="0000000000000000";
signal Y0vp1,    Y0vp1_d1, Y0vp1_d2		: unsigned(15 downto 0):="0000000000000000";
signal Y0vp1_d3, Y0vp1_d4					: unsigned(15 downto 0):="0000000000000000";
signal X1vp1, Y1vp1							: unsigned(15 downto 0) := "0000000000000000";

signal VGA				: unsigned(15 downto 0):="0000000000000000";-- rrrrr,gggggg,bbbbb
signal videoon, videov, videoh, hsync, vsync		: std_ulogic:='0';
signal RST				: std_ulogic:='0';

signal CharX			: unsigned (5 downto 0) := "000000";
signal CharY			: unsigned (5 downto 0) := "000000";

begin


---------------------------------------------------------
--                                                     --
--              Horizontal pixel counter               --
--                                                     --
---------------------------------------------------------
hcounter: process (CLOCK_40, RST)
begin
   if RST='1' then
      hcount <= "0000000000";
	elsif (rising_edge(CLOCK_40)) then
      hcount <= hcount + 1;
      if hcount=1055 then
         hcount <= "00000000000";
		end if;
	end if;
end process;

---------------------------------------------------------
--                                                     --
--               Vertical linel counter                --
--                                                     --
---------------------------------------------------------
vcounter: process (CLOCK_40, RST)
begin
   if RST='1' then 
      vcount <= "0000000000";
	elsif (rising_edge(CLOCK_40)) then
      if hcount = 1055 then
         vcount <= vcount + 1;
         if vcount = 627 then
            vcount <= "0000000000";
			end if;
      end if;
   end if;
end process;

---------------------------------------------------------
--                                                     --
--      Enable video when in active display area       --
--                                                     --
---------------------------------------------------------
process (vcount)
begin
   videov <= '1'; 
   if vcount > 599 then
		videov <= '0';
   end if;
end process;

process (hcount)
begin
   videoh <= '1';
   if hcount > 799 then
		videoh <= '0';
   end if;
end process;

---------------------------------------------------------
--                                                     --
--                    Sync Generator                   --
--                                                     --
---------------------------------------------------------
sync: process (CLOCK_40, RST)
begin
   if RST='1'  then 
      hsync <= '0';
      vsync <= '0';
	elsif (rising_edge(CLOCK_40)) then
      hsync <= '1';
		
      --if (hcount <= 957 and hcount >= 829) then		-- adjusted for my monitor/tv - ymmv
	  if (hcount <= 967 and hcount >= 839) then	-- Cra Ze Ape original values for hcount
         hsync <= '0';
      end if;
      vsync <= '1';
	
      --if (vcount <= 598 and vcount >= 592) then		-- adjusted for my monitor/tv - ymmv
	  if (vcount <= 604 and vcount >= 600) then	-- Cra Ze Ape original values for vcount
         vsync <= '0';
      end if;
   end if;
end process;

------------------------------------------------------------
--  Transformation matrix used to decouple the rendering  --
--  from the phisical display resolution                  --
--       (16 bit virtualplane - vp1)                      --
------------------------------------------------------------
process (CLOCK_40)
begin
  if rising_edge(CLOCK_40) then

--
--	UK101 64x32 scaled to full screen
--
			IF vcount = 0 THEN
				X0vp1 <= "0000000000000000";
				Y0vp1 <= "0000000000000000";
				X1vp1 <= "0000000000000000" - 0260; -- Move screen right by 260 'micro-units'
				Y1vp1 <= "0000000000000000" - 0250; --Move screen down by 250 'micro-units'
			ELSIF hcount = 0 THEN
				X0vp1 <= X1vp1 - 0;
				Y0vp1 <= Y1vp1 + 28;
				X1vp1 <= X1vp1 - 0;
				Y1vp1 <= Y1vp1 + 28;
			ELSE
				X0vp1 <= X0vp1 + 42;
				Y0vp1 <= Y0vp1 + 0;
			END IF;


--
--	Example of huge text
--
--			IF vcount = 0 THEN
--				X0vp1 <= "0000000000000000";
--				Y0vp1 <= "0000000000000000";
--				X1vp1 <= "0000000000000000";
--				Y1vp1 <= "0000000000000000";
--			ELSIF hcount = 0 THEN
--				X0vp1 <= X1vp1 - 0;
--				Y0vp1 <= Y1vp1 + 9;
--				X1vp1 <= X1vp1 - 0;
--				Y1vp1 <= Y1vp1 + 9;
--			ELSE
--				X0vp1 <= X0vp1 + 9;
--				Y0vp1 <= Y0vp1 + 0;
--			END IF;
		
--
--	Example of rotated screen
--
--			IF vcount = 0 THEN
--				X0vp1 <= "0000000000000000";
--				Y0vp1 <= "0000000000000000";
--				X1vp1 <= "0000000000000000" + 2000;
--				Y1vp1 <= "0000000000000000" - 8000;
--			ELSIF hcount = 0 THEN
--				X0vp1 <= X1vp1 - 11;
--				Y0vp1 <= Y1vp1 + 40;
--				X1vp1 <= X1vp1 - 11;
--				Y1vp1 <= Y1vp1 + 40;
--			ELSE
--				X0vp1 <= X0vp1 + 45;
--				Y0vp1 <= Y0vp1 + 11;
--			END IF;

  end if;
end process;

---------------------------------------------------------
--                                                     --
-- Multi tap shifters to match delays - Mem, Reg, Etc. --
--                                                     --
---------------------------------------------------------
process (CLOCK_40)
begin
  if rising_edge(CLOCK_40) then
		
		X0vp1_d4 <= X0vp1_d3 OR "000000000000000"&videoh;-- This little kludge prvents
		X0vp1_d3 <= X0vp1_d2;                            -- inferred RAM based shifters
		X0vp1_d2 <= X0vp1_d1;                            -- and saves precious blockram
		X0vp1_d1 <= X0vp1;

		Y0vp1_d4 <= Y0vp1_d3;
		Y0vp1_d3 <= Y0vp1_d2;
		Y0vp1_d2 <= Y0vp1_d1;
		Y0vp1_d1 <= Y0vp1;
		
  end if;
end process;

---------------------------------------------------------
--                                                     --
--  Find screen memory address for X/Y Char position   --
--             (64 x 32 character screen)              --
--                                                     --
---------------------------------------------------------
process (CLOCK_40)

	VARIABLE Xchar : unsigned(7 DOWNTO 0) := "00000000";
	VARIABLE Ychar : unsigned(6 DOWNTO 0) := "0000000";
	VARIABLE Xe0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";
	VARIABLE Ye0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";

BEGIN
	IF (rising_edge(CLOCK_40)) THEN

		Ye0vp1 := (Y0vp1 - 100)/64;
		Xe0vp1 := (X0vp1 - 80)/64;
		Xchar := Xe0vp1 (10 DOWNTO 3);
		Ychar := Ye0vp1 (9 DOWNTO 3);

		IF Ye0vp1 >= 0 AND Ye0vp1 <= 255 AND Xe0vp1 >= 0 AND Xe0vp1 <= 511 THEN
				dispAddr <= std_logic_vector(Ychar*64+Xchar)(10 DOWNTO 0);
		END IF;
	END IF;
END PROCESS;

---------------------------------------------------------
--                                                     --
--  Find address of required character in chargenROM   --
--                                                     --
---------------------------------------------------------
process (CLOCK_40)

	VARIABLE pixels : unsigned(2 DOWNTO 0) := "000";
	VARIABLE Xe0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";
	VARIABLE Ye0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";

BEGIN
	IF (rising_edge(CLOCK_40)) THEN

		Ye0vp1 := (Y0vp1_d2 - 100)/64;	-- Use Y0vp1_d3 when using RAM based shifter, Y0vp1_d3 when using logic (the kludge).
		Xe0vp1 := (X0vp1_d2 - 80)/64;		-- Use X0vp1_d3 when using RAM based shifter, X0vp1_d2 when using logic (the kludge).
		pixels := Ye0vp1(2 DOWNTO 0);
		IF Ye0vp1 >= 0 AND Ye0vp1 <= 255 AND Xe0vp1 >= 0 AND Xe0vp1 <= 511 THEN
				charAddr <= std_logic_vector(dispData) & std_logic_vector(pixels);
		END IF;
	END IF;
END PROCESS;

---------------------------------------------------------
--                                                     --
--               Display character pixels              --
--                                                     --
---------------------------------------------------------
DrawApp : PROCESS (CLOCK_40, RST)

	VARIABLE pixels : unsigned(2 DOWNTO 0) := "000";
	VARIABLE Xe0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";
	VARIABLE Ye0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";

BEGIN
	IF (rising_edge(CLOCK_40)) THEN

		Ye0vp1 := (Y0vp1_d4 - 100)/64;
		Xe0vp1 := (X0vp1_d4 - 80)/64;
		pixels := Xe0vp1(2 DOWNTO 0);
		Pixel_Colour <= BorderCol;
		IF Ye0vp1 >= 0 AND Ye0vp1 <= 255 AND Xe0vp1 >= 0 AND Xe0vp1 <= 511 THEN
			Pixel_Colour <= ScreenCol;
			IF charData(to_integer(NOT pixels(2 DOWNTO 0))) = '1' THEN
				Pixel_Colour <= CharCol;
			END IF;
		END IF;

	END IF;
END PROCESS;

---------------------------------------------------------
--                                                     --
--                Drive the VGA display                --
--                                                     --
---------------------------------------------------------
   videoon				<= videoh and videov;
	VGA					<= Pixel_Colour;
   Vout(17 downto 2)	<= VGA and videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon&videoon;
	Vout(1 downto 0)	<= hsync & vsync;

end Behavioral;
