-----------------------------------------------------------------------------	
-- ORIGINAL SCAN COUNTERS, SYNC, BLANK, ENABLE, STARS								--
-- For use with Computer Space FPGA emulator.										--
-- Implemented as part of the Sync Star Board.										--
-- Emulates the original timing (sort of progressive NTSC) for:				--
-- > scan counter logic (horizontal and vertical scan counters)				--
-- > count enable/blanking																	--
--	> sync out logic 																			--
-- > star generation circuit																--
--																									--
-- This entity is implementation agnostic												--
--																									--
-- v1.0																							--
-- by Mattias G, 2015																		--
-- Enjoy!																						-- 
-----------------------------------------------------------------------------		

library	ieee;
use 		ieee.std_logic_1164.all; 
use 		ieee.numeric_std.all;
use 		ieee.std_logic_unsigned.all;
library 	work;

--80---------------------------------------------------------------------------|

entity scan_counter is 
	port(
	game_clk											: in std_logic; 	
	hsync												: out std_logic;
	vsync												: out std_logic;
	star_video_out,
	count_enable 									: out std_logic:= '0';
	blank												: out std_logic:= '1';	
	b2_12 											: out std_logic;  
	vertical, horizontal 						: out std_logic_vector (7 downto 0)
	);	
end scan_counter;

architecture scan_counter_architecture of
				 scan_counter is 

-- 8 bit counter used for star generation  
component v74161 is
port ( CLK, CLRN, LDN, ENP, ENT				: in std_logic;
		D												: in unsigned (7 downto 0);
		Q												: out unsigned (7 downto 0);
		RCO											: out std_logic );
end component;	 

-- statemachine
type STATE_TYPE is (sLINE, sSYNC_BLANK);

signal state   									: STATE_TYPE := sSYNC_BLANK;
	 
-- signals for
-- video signalling
signal hcount				  						: integer :=130;
signal vcount										: integer :=1;
signal blank_buffer								: std_logic ;

signal hor_scan_q		 							: std_logic_vector (7 downto 0)
														:= "10000010";	
signal ver_scan_q		 							: std_logic_vector (7 downto 0)
														:= "00000001";	

signal hblank, vblank			  				: std_logic;
											
-- signals for star generation logic
signal b5_10, b1_6, b1_5, b1_4  				: std_logic;
signal b1_3, b1_2, b1_1,b1_9, b2_8 			: std_logic;

signal a1_7, a1_6, a1_4, a1_3, a1_2			: std_logic;
signal a1_1, a1_9, b1_10, a1_15  			: std_logic;

signal SB_16  										: std_logic;
signal b2_6 										: std_logic;

-- initial value for count enable
-- flip-flop			
signal c4_14 										: std_logic :='1';

-- iniital value for rco
signal e1_15_old 									: std_logic :='0';
signal e1_15     									: std_logic :='0';

-- scan counter signals
signal d1_e1_9, c1_f1_9, c1_f1_2				: std_logic;
signal e1_6, d1_4, d1_3							: std_logic;

signal f1_15										: std_logic := '0';
signal b2_4											: std_logic;
signal h1_11										: std_logic;
signal d1_13, d1_12								: std_logic;
signal c1_11, c1_12, c1_14,
		 f1_12, f1_13		 						: std_logic;

signal star_enable 								: std_logic;		 
		 
----------------------------------------------------------------------------//
begin

b2_12 <= game_clk;
b5_10 <= not game_clk;

-----------------------------------------------------------------------------	
-- GENERATE SYNC SIGNAL AND SCAN COUNTER VALUES 									--
--																									--
-- replaces/emulates scan counter logic, count enable/blanking:				--
-- 74161s; D1, E1, C1, F1																	--	
-- 7476 C4 (pin 1,2,3,4, 14, 15,1 6)													--
-- 7404 B2 (pin 3,4 and pin 5,6)															--	
-- 7400 H1 (pin 11,12,13)																	--
--																									--
--	replaces/emulates sync out logic: 													--
--	7420 J2 (j2_12)																			--
-- 7486 J1 (j1_3)																				--
-- 7420 F2 (f2_8)																				--
-- 7486 J1 (j1_11)																			--
-----------------------------------------------------------------------------
-- 5,842 mhz version 

-----------------------------------------------------------------------------	
-- SCAN COUNTER								 												--
-----------------------------------------------------------------------------	
process (game_clk)
begin
if rising_edge (game_clk) then
	
	case state is

		when sSYNC_BLANK =>
			
			star_enable <= '0';
			
			if hcount < 255 then
				hcount <= hcount + 1;
				hor_scan_q <= hor_scan_q + 1;
				if hcount = 159 then hsync <= '1'; end if;
				if hcount = 191 then hsync <= '0'; end if;
			else
				if vcount = 255 then		     -- DarFPGA 2017
					hcount <= 1;              -- | fixed counters w.r.t schematics
					hor_scan_q <= "00000001"; -- | (coherent with motion board explanations)
				else			                 -- |
					hcount <= 0;
					hor_scan_q <= "00000000";
				end if;				
				c4_14 <= '1';						-- CE
				star_enable <= '1';
				state <= sLINE;
				hblank <= '0';
			end if;	

		when sLINE =>

			if hcount < 255 then					-- visible line
				hcount <= hcount + 1;
				hor_scan_q <= hor_scan_q + 1;

			else 										-- last pixel on visible line
				hcount <= 130;						-- load value for blank&sync
				hor_scan_q <= "10000010";
				c4_14 <= '0';						-- BLANK (not CE)
				state <= sSYNC_BLANK;
				
				hblank <= '1';
				if vcount = 239 then vblank <= '1'; end if;
				if vcount = 252 then vsync <= '1'; end if;

				if vcount < 254 then				-- Increase vertical count
					vcount <= vcount + 1;
					ver_scan_q <= ver_scan_q +1;

				elsif vcount = 254 then
					vcount <= vcount + 1;
					ver_scan_q <= ver_scan_q +1;
					f1_15 <= '1';	

				else
					vcount <= 1;
					vblank <= '0';
					vsync <= '0';
					ver_scan_q <= "00000001";
					f1_15 <= '0';
					star_enable <= '0';

				end if;
			end if;	

	end case;
end if;
end process;
	
d1_13 <= hor_scan_q(1);
d1_12 <= hor_scan_q(2);	

c1_14 <= ver_scan_q(0);			
c1_12 <= ver_scan_q(2);
c1_11 <= ver_scan_q(3);

f1_13 <= ver_scan_q(5);
f1_12 <= ver_scan_q(6);
			
-----------------------------------------------------------------------------	
-- Clear signal to star generator														--
-----------------------------------------------------------------------------

b2_6 <= not f1_15;			


-----------------------------------------------------------------------------	
-- COUNT ENABLE & BLANK									 									--
-----------------------------------------------------------------------------	
count_enable	<= c4_14;
blank 			<= hblank or vblank;

-----------------------------------------------------------------------------	
-- SCAN COUNTER VALUES									 									--
-----------------------------------------------------------------------------	
horizontal 	<= hor_scan_q;
vertical 	<= ver_scan_q;

-----------------------------------------------------------------------------	
-- GENERATE STAR VIDEO									 									--
-- Signetics 74161: B1 & A1																--
--	using one 8-bit counter instead of two 4-bit counters							--
--																									--
-- Instead of using c4_14 to drive the ENT (b1_10) a separate enable 		--
-- signal (star_enable) is used in order to overcome a "deviation" in the	--
-- Signetics 74161 chip, that Computer Space uses, from the "standard"		--
-- 74161 implementations.																	--
-- The Signetics 74161 allows one counter increment when ENT is low,			--
-- in the case ENT goes low when the clock is also low.							--
-- "Standard"	74161 (eg TI and others) prohibits increments all the time	--
-- when ENT is low. 																			--
-- The star layout on screen is a result of this deviation in Signetics		--
-- implementation of the 74161 counter. A deviation that took a very long	--
-- time to uncover. It was not until measurement data from	a real			-- 
-- Computer Space Board was compared with standard 74161 chip behaviour		--
-- that this piece of the puzzle was solved.											--	
--																									--	
-- The implementation uses standard 74161 logic and a work-around with a	--
-- delayed ENT signal (star_enable)														--	 
-----------------------------------------------------------------------------
star_counter: v74161
port map(
			clk 	=> b5_10, 
			clrn  => b1_1,
			ldn 	=> b1_9,
			enp  	=> '1',
			ent 	=> b1_10,	
			D(7)  => a1_6,
			D(6)  => '0',
			D(5)  => a1_4,
			D(4)  => a1_3,
			D(3)  => b1_6,
			D(2)  => b1_5,
			D(1)  => b1_4, 
			D(0)  => b1_3, 
			rco 	=> a1_15
			);

b1_6 <= d1_13; 			-- equals to d1_13;
b1_5 <= c1_12;
b1_4 <= c1_11;
b1_3 <= c1_14;

b1_1 <= b2_6; 				-- rco for msb
b1_9 <= b2_8;

b1_10 <= star_enable;	-- using an additional flag
								-- called star_enable
								-- (should be c4_14)
								-- to cater for the fact that
								-- the CS Signetics 74161 has
								-- an odd implementation of
								-- the standard 74161
								-- related to how ENT impact
								-- increment when ENT is set
								-- to low when clock is low

a1_6 <= d1_12;
a1_4 <= f1_13;
a1_3 <= f1_12;

b2_8 <= not a1_15;

star_video_out <=  a1_15;
 
end scan_counter_architecture;
