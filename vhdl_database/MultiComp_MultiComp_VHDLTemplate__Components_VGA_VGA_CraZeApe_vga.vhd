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

entity vga is
	port (
		charAddr : out std_LOGIC_VECTOR(10 downto 0);
		charData : in std_LOGIC_VECTOR(7 downto 0);
		dispAddr : out std_LOGIC_VECTOR(10 downto 0);
		dispData : in std_LOGIC_VECTOR(7 downto 0);
 		VIDEO_CLK    	: in  std_logic;
		Vout:      out unsigned(17 downto 0) -- rrrrr,gggggg,bbbbb,hsync,vsync
	);
end vga;

architecture Behavioral of vga is

-------------------------------------------------------------------
--   XGA Signal 1024 x 768 @ 60 Hz timing - USE a 65MHz Pixel Clock
-------------------------------------------------------------------
--Horizontal timing (line)
constant h_Visible_area : integer:=1024;
constant h_Front_porch  : integer:=24;
constant h_Sync_pulse   : integer:=136;
constant h_Back_porch   : integer:=160;
constant h_Whole_line   : integer:=1344;
--Vertical timing (frame)
constant v_Visible_area : integer:=768;
constant v_Front_porch  : integer:=3;
constant v_Sync_pulse   : integer:=6;
constant v_Back_porch   : integer:=29;
constant v_Whole_frame  : integer:=806;
----Scaler Adjustment
constant scaler_width	: integer:=64;
constant scaler_height	: integer:=43;

-------------------------------------------------------------------
--   SVGA Signal 800 x 600 @ 60 Hz timing - USE a 40MHz Pixel Clock
-------------------------------------------------------------------
--Horizontal timing (line)
--constant h_Visible_area : integer:=800;
--constant h_Front_porch  : integer:=40;
--constant h_Sync_pulse   : integer:=128;
--constant h_Back_porch   : integer:=88;
--constant h_Whole_line   : integer:=1056;
----Vertical timing (frame)
--constant v_Visible_area : integer:=600;
--constant v_Front_porch  : integer:=1;
--constant v_Sync_pulse   : integer:=4;
--constant v_Back_porch   : integer:=23;
--constant v_Whole_frame  : integer:=628;
----Scaler Adjustment
--constant scaler_width	: integer:=82;
--constant scaler_height	: integer:=55;

------------------------------------------------------------------------------------
--   VGA Signal 640 x 480 @ 60 Hz Industry standard timing - USE a 25MHz Pixel Clock
------------------------------------------------------------------------------------
--Horizontal timing (line)
--constant h_Visible_area : integer:=640;
--constant h_Front_porch  : integer:=16;
--constant h_Sync_pulse   : integer:=96;
--constant h_Back_porch   : integer:=48;
--constant h_Whole_line   : integer:=800;
----Vertical timing (frame)
--constant v_Visible_area : integer:=480;
--constant v_Front_porch  : integer:=10;
--constant v_Sync_pulse   : integer:=2;
--constant v_Back_porch   : integer:=33;
--constant v_Whole_frame  : integer:=525;
----Scaler Adjustment
--constant scaler_width	: integer:=102;
--constant scaler_height	: integer:=70;

--------------------------------------------------------------------------------------
--   640x480 - (Non Standard 512x480 stretched pixel timing) - USE a 25MHz Pixel Clock
--------------------------------------------------------------------------------------
--Horizontal timing (line)
--constant h_Visible_area : integer:=512;
--constant h_Front_porch  : integer:=26;
--constant h_Sync_pulse   : integer:=82;
--constant h_Back_porch   : integer:=56;
--constant h_Whole_line   : integer:=676;
----Vertical timing (frame)
--constant v_Visible_area : integer:=480;
--constant v_Front_porch  : integer:=10;
--constant v_Sync_pulse   : integer:=2;
--constant v_Back_porch   : integer:=33;
--constant v_Whole_frame  : integer:=525;
----Scaler Adjustment
--constant scaler_width	: integer:=128;
--constant scaler_height	: integer:=64;

--------------------------------------------------------------------------------------
--   800x600 - (Non Standard 512x600 stretched pixel timing) - USE a 25MHz Pixel Clock
--------------------------------------------------------------------------------------
--Horizontal timing (line)
--constant h_Visible_area : integer:=512;
--constant h_Front_porch  : integer:=26;
--constant h_Sync_pulse   : integer:=82;
--constant h_Back_porch   : integer:=56;
--constant h_Whole_line   : integer:=676;
----Vertical timing (frame)
--constant v_Visible_area : integer:=600;
--constant v_Front_porch  : integer:=1;
--constant v_Sync_pulse   : integer:=4;
--constant v_Back_porch   : integer:=23;
--constant v_Whole_frame  : integer:=628;
----Scaler Adjustment
--constant scaler_width	: integer:=128;
--constant scaler_height	: integer:=55;


--Calculate combined video timings as constants
constant hWL : unsigned(10 downto 0):=to_unsigned(h_Whole_line,11)-1;
constant vWF : unsigned(9 downto 0):=to_unsigned(v_Whole_frame,10)-1;
constant vVA : unsigned(9 downto 0):=to_unsigned(v_Visible_area,10)-1;
constant hVA : unsigned(10 downto 0):=to_unsigned(h_Visible_area,11)-1;
constant hVAhFP : unsigned(10 downto 0):=to_unsigned(h_Visible_area,11)+to_unsigned(h_Front_porch,11)-1;
constant hVAhFPhSP : unsigned(10 downto 0):=to_unsigned(h_Visible_area,11)+to_unsigned(h_Front_porch,11)+to_unsigned(h_Sync_pulse,11)-1;
constant vVAvFP : unsigned(9 downto 0):=to_unsigned(v_Visible_area,10)+to_unsigned(v_Front_porch,10)-1;
constant vVAvFPvSP : unsigned(9 downto 0):=to_unsigned(v_Visible_area,10)+to_unsigned(v_Front_porch,10)+to_unsigned(v_Sync_pulse,10)-1;

constant BorderCol			: unsigned(15 downto 0):="0000000000011111";
constant ScreenCol			: unsigned(15 downto 0):="0000000000011111";
constant CharCol				: unsigned(15 downto 0):="1111111111111111";

signal Pixel_Colour			: unsigned(15 DOWNTO 0) := "0000000000000000";
signal VGAout					: unsigned(17 downto 0);
signal hcount									: unsigned(10 downto 0):="00000000000";
signal vcount									: unsigned(9 downto 0):="0000000000";
signal X0vp1,    X0vp1_d1, X0vp1_d2		: unsigned(15 downto 0):="0000000000000000";
signal X0vp1_d3, X0vp1_d4, X0vp1_d5		: unsigned(15 downto 0):="0000000000000000";
signal X0vp1_d6, X0vp1_d7, X0vp1_d8		: unsigned(15 downto 0):="0000000000000000";
signal X0vp1_d9, X0vp1_d10					: unsigned(15 downto 0):="0000000000000000";

signal Y0vp1,    Y0vp1_d1, Y0vp1_d2		: unsigned(15 downto 0):="0000000000000000";
signal Y0vp1_d3, Y0vp1_d4, Y0vp1_d5		: unsigned(15 downto 0):="0000000000000000";
signal Y0vp1_d6, Y0vp1_d7, Y0vp1_d8		: unsigned(15 downto 0):="0000000000000000";
signal Y0vp1_d9, Y0vp1_d10					: unsigned(15 downto 0):="0000000000000000";

signal X1vp1, Y1vp1							: unsigned(15 downto 0) := "0000000000000000";

signal VGA				: unsigned(15 downto 0):="0000000000000000";-- rrrrr,gggggg,bbbbb
signal videoon, videov, videoh, hsync, vsync		: std_ulogic:='0';
signal RST				: std_ulogic:='0';

signal CharX			: unsigned (5 downto 0) := "000000";
signal CharY			: unsigned (5 downto 0) := "000000";

signal hcount_d1,hcount_d2,hcount_d3,hcount_d4	: unsigned(10 downto 0):="00000000000";
signal hcount_d5,hcount_d6,hcount_d7,hcount_d8	: unsigned(10 downto 0):="00000000000";
signal hcount_d9,hcount_d10,hcount_d11				: unsigned(10 downto 0):="00000000000";
signal hcount_d12,hcount_d13							: unsigned(10 downto 0):="00000000000";

begin

---------------------------------------------------------
--                                                     --
--              Horizontal pixel counter               --
--                                                     --
---------------------------------------------------------
hcounter: process (VIDEO_CLK, RST)
begin
   if RST='1' then
      hcount <= "0000000000";
	elsif (rising_edge(VIDEO_CLK)) then
      hcount <= hcount + 1;
      if hcount=hWL then
         hcount <= "00000000000";
		end if;
	end if;
end process;

---------------------------------------------------------
--                                                     --
--               Vertical linel counter                --
--                                                     --
---------------------------------------------------------
vcounter: process (VIDEO_CLK, RST)
begin
   if RST='1' then 
      vcount <= "0000000000";
	elsif (rising_edge(VIDEO_CLK)) then
      if hcount_d13 = hWL then
         vcount <= vcount + 1;
         if vcount = vWF then
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
   if vcount > vVA then
		videov <= '0';
   end if;
end process;

process (hcount_d13)
begin
   videoh <= '1';
   if hcount_d13 > hVA then
		videoh <= '0';
   end if;
end process;

---------------------------------------------------------
--                                                     --
--                    Sync Generator                   --
--                                                     --
---------------------------------------------------------
sync: process (VIDEO_CLK, RST)
begin
   if RST='1'  then 
      hsync <= '0';
      vsync <= '0';
	elsif (rising_edge(VIDEO_CLK)) then
      hsync <= '1';
      if (hcount_d13 <= hVAhFPhSP and hcount_d13 >= hVAhFP) then
         hsync <= '0';
      end if;
      vsync <= '1';
      if (vcount <= vVAvFPvSP and vcount >= vVAvFP) then
         vsync <= '0';
      end if;
   end if;
end process;

------------------------------------------------------------
--  Transformation matrix used to decouple the rendering  --
--  from the phisical display resolution                  --
--       (16 bit virtualplane - vp1)                      --
------------------------------------------------------------
process (VIDEO_CLK)
begin
  if rising_edge(VIDEO_CLK) then

			IF vcount = 0 THEN
				X0vp1 <= "0000000000000000";
				Y0vp1 <= "0000000000000000";
				X1vp1 <= "0000000000000000";-- - 0260; -- Move screen right by 260 'micro-units'
				Y1vp1 <= "0000000000000000";-- - 0250; -- Move screen down by 250 'micro-units'
			ELSIF hcount = 0 THEN
				X0vp1 <= X1vp1 - 0;
				Y0vp1 <= Y1vp1 + scaler_height;
				X1vp1 <= X1vp1 - 0;
				Y1vp1 <= Y1vp1 + scaler_height;
			ELSE
				X0vp1 <= X0vp1 + scaler_width;
				Y0vp1 <= Y0vp1 + 0;
			END IF;

  end if;
end process;

---------------------------------------------------------
--                                                     --
-- Multi tap shifters to match delays - Mem, Reg, Etc. --
--                                                     --
---------------------------------------------------------
process (VIDEO_CLK)
begin
  if rising_edge(VIDEO_CLK) then
		
		X0vp1_d10 <= X0vp1_d9;-- OR "000000000000000"&videoh; -- This little kludge prvents
		X0vp1_d9 <= X0vp1_d8;                              -- inferred RAM based shifters
		X0vp1_d8 <= X0vp1_d7;                              -- and saves precious blockram
		X0vp1_d7 <= X0vp1_d6;
		X0vp1_d6 <= X0vp1_d5;
		X0vp1_d5 <= X0vp1_d4;
		X0vp1_d4 <= X0vp1_d3;
		X0vp1_d3 <= X0vp1_d2;
		X0vp1_d2 <= X0vp1_d1;
		X0vp1_d1 <= X0vp1;

		Y0vp1_d10 <= Y0vp1_d9;-- OR "000000000000000"&videoh; -- This little kludge prvents
		Y0vp1_d9 <= Y0vp1_d8;                              -- inferred RAM based shifters
		Y0vp1_d8 <= Y0vp1_d7;                              -- and saves precious blockram
		Y0vp1_d7 <= Y0vp1_d6;
		Y0vp1_d6 <= Y0vp1_d5;
		Y0vp1_d5 <= Y0vp1_d4;
		Y0vp1_d4 <= Y0vp1_d3;
		Y0vp1_d3 <= Y0vp1_d2;
		Y0vp1_d2 <= Y0vp1_d1;
		Y0vp1_d1 <= Y0vp1;
		
		hcount_d13 <= hcount_d12;-- OR "0000000000"&videoh; -- This little kludge prvents
		hcount_d12 <= hcount_d11;                        -- inferred RAM based shifters
		hcount_d11 <= hcount_d10;                        -- and saves precious blockram
		hcount_d10 <= hcount_d9;
		hcount_d9 <= hcount_d8;
		hcount_d8 <= hcount_d7;
		hcount_d7 <= hcount_d6;
		hcount_d6 <= hcount_d5;
		hcount_d5 <= hcount_d4;
		hcount_d4 <= hcount_d3;
		hcount_d3 <= hcount_d2;
		hcount_d2 <= hcount_d1;
		hcount_d1 <= hcount;

  end if;
end process;

---------------------------------------------------------
--                                                     --
--  Find screen memory address for X/Y Char position   --
--             (64 x 32 character screen)              --
--                                                     --
---------------------------------------------------------
process (VIDEO_CLK)

	VARIABLE Xchar : unsigned(7 DOWNTO 0) := "00000000";
	VARIABLE Ychar : unsigned(6 DOWNTO 0) := "0000000";
	VARIABLE Xe0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";
	VARIABLE Ye0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";

BEGIN
	IF (rising_edge(VIDEO_CLK)) THEN

		Ye0vp1 := (Y0vp1_d6 - 100)/128;
		Xe0vp1 := (X0vp1_d6 - 80)/128;
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
process (VIDEO_CLK)

	VARIABLE pixels : unsigned(2 DOWNTO 0) := "000";
	VARIABLE Xe0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";
	VARIABLE Ye0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";

BEGIN
	IF (rising_edge(VIDEO_CLK)) THEN

		Ye0vp1 := (Y0vp1_d8 - 100)/128;	-- Use Y0vp1_d3 when using RAM based shifter, Y0vp1_d3 when using logic (the kludge).
		Xe0vp1 := (X0vp1_d8 - 80)/128;		-- Use X0vp1_d3 when using RAM based shifter, X0vp1_d2 when using logic (the kludge).
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
DrawApp : PROCESS (VIDEO_CLK, RST)

	VARIABLE pixels : unsigned(2 DOWNTO 0) := "000";
	VARIABLE Xe0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";
	VARIABLE Ye0vp1 : unsigned(15 DOWNTO 0) := "0000000000000000";

BEGIN
	IF (rising_edge(VIDEO_CLK)) THEN

		Ye0vp1 := (Y0vp1_d10 - 100)/128;
		Xe0vp1 := (X0vp1_d10 - 80)/128;
		pixels := Xe0vp1(2 DOWNTO 0);
		Pixel_Colour <= BorderCol;
		IF Ye0vp1 >= 0 AND Ye0vp1 <= 255 AND Xe0vp1 >= 0 AND Xe0vp1 <= 511 THEN
			Pixel_Colour <= ScreenCol;
			IF charData(to_integer(NOT pixels)) = '1' THEN
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
