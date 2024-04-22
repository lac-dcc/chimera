---------------------------------------------------------------------------------
-- Computer_space_sound by Dar (darfpga@aol.fr) (20/11/2017)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Principle :
--
-- * Exact from original design (schematics)
--     saucer_missile_sound from motion board 
--     rocket_missile_sound from motion board 
--     turn_sound from motion board
--
-- * Filtered white noise & spectrum shaping from 8_11.hex files waveform and 
--   spectrum shapes
--
-- Simulation : 
--
-- * White noise
--     pseudo-random generator 17bits (X^17 + X^14 +1) 
--     intialisation with 0xACE1
--     64 taps memory for filtering input
--  
-- * Filtering 
--
--     12 filters 64 taps dft @ fech = 11kHz
--         filters centers : 1,3,5,7,9,11,13,15,17,19,21,23 / 64*11kHz
--         => fc = 172Hz, 516Hz, 860Hz, ... 3953Hz
--         [k_fc : 0 to 11]
--
--     Hamming window weighting
--
--     filter_bank(k_fc)(coeff) = cos(2*pi*fc*coeff/64)*hamming_64(coeff)
--     [coeff : 0 to 63]
--
--     filter_output(k_fc) = sum(pseudo_random(coeff)*filter_bank(k_fc)(coeff))
--                           [sum over coeff 0 to 63]
--     
-- * Noise voices
--
--     Spectrum shaping by linear sum of filter output with specific weighting 
--     for each voice (pond).
--
--     voice(k_voice)  = sum(filter_ouput(k_fc)*pond(k_fc)(k_voice)) 
--                       [sum over k_fc 0 to 11]
--
--
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity computer_space_sound is
port(
 clock_50 : in std_logic;
 reset    : in std_logic;
 
 sound_switch : in std_logic_vector(7 downto 0);
 saucer_missile_sound : in std_logic; 
 rocket_missile_sound : in std_logic; 
 turn_sound           : in std_logic; 
	
 audio_gate : in std_logic;
 
 audio      : out integer range -32768 to 32767
);
end computer_space_sound;

architecture struct of computer_space_sound is
 subtype nb_filters is integer range 0 to 11;
 subtype nb_coeffs is integer range 0 to 63; 	

 type t_filter_coeffs is array(nb_coeffs) of integer range -128 to 127;
 type t_filter_bank is array(nb_filters) of t_filter_coeffs;
  
 constant filter_bank: t_filter_bank := (
   (10,  10,  11,  12,  14,  15,  17,  18,  20,  20,  20,  20,  18,  15,  11,   6,   0,  -7, -16, -25, -35, -46, -57, -68, -79, -89, -98,-107,-114,-120,-124,-126,-127,-126,-123,-118,-112,-104, -96, -86, -76, -65, -54, -44, -33, -24, -15,  -7,   0,   6,  10,  14,  16,  17,  18,  18,  17,  16,  14,  13,  12,  11,  10,  10), --  2
   (10,  10,   9,   8,   6,   2,  -4, -11, -20, -28, -36, -42, -44, -41, -32, -19,   0,  22,  45,  67,  86,  97, 101,  95,  79,  54,  23, -12, -47, -79,-105,-121,-127,-121,-104, -78, -46, -12,  22,  53,  76,  91,  96,  92,  81,  63,  42,  20,   0, -17, -29, -37, -39, -37, -32, -25, -17, -10,  -3,   1,   5,   7,   9,  10), --  4
   (10,   9,   6,   1,  -6, -13, -20, -23, -20,  -9,   7,  27,  44,  53,  49,  30,   0, -36, -68, -87, -86, -62, -20,  31,  79, 110, 116,  94,  47, -12, -70,-112,-127,-111, -70, -12,  46,  92, 113, 107,  76,  30, -19, -59, -81, -81, -63, -33,   0,  28,  44,  47,  39,  23,   6,  -8, -17, -19, -17, -11,  -5,   1,   6,   9), --  6 
	(10,   8,   2,  -6, -14, -17, -11,   2,  20,  32,  31,  12, -18, -47, -57, -41,   0,  48,  80,  77,  35, -28, -85,-107, -79, -11,  66, 116, 114,  59, -25, -98,-127, -98, -24,  58, 112, 113,  64, -11, -76,-102, -81, -27,  33,  72,  74,  44,   0, -37, -52, -42, -16,  11,  27,  28,  17,   2, -10, -14, -12,  -5,   2,   8), --  8
   (10,   7,  -2, -11, -14,  -5,  11,  24,  20,  -3, -31, -40, -18,  25,  57,  50,   0, -59, -80, -41,  35,  94,  85,  11, -79,-115, -66,  35, 114, 110,  25, -81,-127, -80,  24, 109, 112,  34, -64,-111, -76,  10,  81,  89,  33, -38, -74, -54,   0,  45,  52,  22, -16, -35, -27,  -3,  17,  20,  10,  -4, -12, -10,  -2,   6), -- 10
   (10,   5,  -6, -13,  -6,  11,  20,   7, -20, -31,  -7,  32,  44,   5, -49, -57,   0,  67,  68,  -9, -86, -76,  20, 103,  79, -33,-116, -77,  47, 125,  70, -60,-127, -60,  70, 123,  46, -75,-113, -32,  76,  98,  19, -72, -81,  -8,  63,  62,   0, -52, -44,   5,  39,  29,  -6, -27, -17,   6,  17,   9,  -5, -11,  -6,   5), -- 12
   (10,   3,  -9, -10,   6,  17,   4, -21, -20,  15,  36,   4, -44, -33,  32,  61,   0, -73, -45,  55,  86, -10,-101, -51,  79, 102, -23,-121, -47,  97, 105, -37,-127, -37, 104,  95, -46,-118, -22,  98,  76, -48, -96,  -9,  81,  52, -42, -67,   0,  56,  29, -30, -39,   4,  32,  13, -17, -18,   3,  15,   5,  -9,  -9,   3), -- 14
   (10,   1, -11,  -4,  14,   8, -17, -15,  20,  25, -20, -37,  18,  50, -11, -64,   0,  75,  16, -83, -35,  86,  57, -83, -79,  73,  98, -57,-114,  36, 124, -12,-127, -12, 123,  36,-112, -56,  96,  71, -76, -79,  54,  82, -33, -78,  15,  70,   0, -58, -10,  45,  16, -33, -18,  21,  17, -13, -14,   7,  12,  -3, -10,   1), -- 16
   (10,  -1, -11,   4,  14,  -8, -17,  15,  20, -25, -20,  37,  18, -50, -11,  64,   0, -75,  16,  83, -35, -86,  57,  83, -79, -73,  98,  57,-114, -36, 124,  12,-127,  12, 123, -36,-112,  56,  96, -71, -76,  79,  54, -82, -33,  78,  15, -70,   0,  58, -10, -45,  16,  33, -18, -21,  17,  13, -14,  -7,  12,   3, -10,  -1), -- 18
   (10,  -3,  -9,  10,   6, -17,   4,  21, -20, -15,  36,  -4, -44,  33,  32, -61,   0,  73, -45, -55,  86,  10,-101,  51,  79,-102, -23, 121, -47, -97, 105,  37,-127,  37, 104, -95, -46, 118, -22, -98,  76,  48, -96,   9,  81, -52, -42,  67,   0, -56,  29,  30, -39,  -4,  32, -13, -17,  18,   3, -15,   5,   9,  -9,  -3), -- 20
   (10,  -5,  -6,  13,  -6, -11,  20,  -7, -20,  31,  -7, -32,  44,  -5, -49,  57,   0, -67,  68,   9, -86,  76,  20,-103,  79,  33,-116,  77,  47,-125,  70,  60,-127,  60,  70,-123,  46,  75,-113,  32,  76, -98,  19,  72, -81,   8,  63, -62,   0,  52, -44,  -5,  39, -29,  -6,  27, -17,  -6,  17,  -9,  -5,  11,  -6,  -5), -- 22
   (10,  -7,  -2,  11, -14,   5,  11, -24,  20,   3, -31,  40, -18, -25,  57, -50,   0,  59, -80,  41,  35, -94,  85, -11, -79, 115, -66, -35, 114,-110,  25,  81,-127,  80,  24,-109, 112, -34, -64, 111, -76, -10,  81, -89,  33,  38, -74,  54,   0, -45,  52, -22, -16,  35, -27,   3,  17, -20,  10,   4, -12,  10,  -2,  -6));-- 24

 signal add : integer range -128*64 to 128*64-1;
 type t_filtered_signal is array(nb_filters) of integer range -128*64 to 128*64-1;
 signal filtered_signal :  t_filtered_signal;

 signal noise_cnt : integer range 0 to 8191;
 signal noise_reg : std_logic_vector(63 downto 0); -- pseudo_random shift_register and filter tap

 subtype nb_voices is integer range 0 to 2;
 type t_pond is array(nb_filters) of integer range 0 to 16;
 type t_pond_bank is array(nb_voices) of t_pond;
 constant pond : t_pond_bank := (
  ( 0, 16, 16, 16,  8,  8,  4,  4,  2,  2,  1,  0), -- voice 1 - rocket thrust
  (16,  8,  2,  0,  0,  0,  0,  0,  0,  0,  0,  0), -- voice 2 - back ambiance
  ( 4, 16,  2,  2,  1,  1,  0,  0,  0,  0,  0,  1));-- voice 3 - explosion
 
 signal add_v : integer range -128*64*16 to 128*64*16-1;
 type t_voices is array(nb_voices) of integer range -128*64*16 to 128*64*16-1;
 signal voices : t_voices;
 
 signal ambiance       : integer range -32768 to 32767;
 signal thrust         : integer range -32768 to 32767;
 signal explosion      : integer range -32768 to 32767;
 signal turn           : integer range -32768 to 32767;
 signal saucer_missile : integer range -32768 to 32767;
 signal rocket_missile : integer range -32768 to 32767;
 
 signal explosion_cmd_r : std_logic;
 
begin


noise : process(clock_50, reset)
begin
	if reset = '1' then
		noise_reg <= X"000000000000ACE1";
		noise_cnt <= 0;
	else
		if rising_edge(clock_50) then
			if noise_cnt = 4544 then   -- 11kHz
				noise_cnt <= 0;
				noise_reg <= noise_reg(62 downto 0) & not (noise_reg(16) xor noise_reg(13));
		else
				noise_cnt <= noise_cnt + 1;			
			end if;
		end if;
	end if;
end process;

-- compute filtered noise and voices
filter_and_voice : process(clock_50, reset)
	type t_stage is (s_init, s_filter, s_voice);
	variable stage   : t_stage;
	variable filter  : nb_filters;
	variable coeff   : nb_coeffs;
   variable delta   : integer range -128*64 to 128*64-1;
	variable voice   : nb_voices;
   variable delta_v : integer range -128*64*16 to 128*64*16-1;
	
begin
	if reset = '1' then
		stage := s_init;
	else
	if rising_edge(clock_50) then
		
		case stage is
		
		when s_init =>
			if noise_cnt = 0 then  -- it's time to read the new produced noise sample
				stage := s_filter;
				filter := 0;        -- start with filter 0 and coeff 0
				coeff := 0;
			end if;
			
		when s_filter =>
				   
			if noise_reg(coeff) = '0' then  -- 0/1 => -1/+1 for signed computation
				delta := -filter_bank(filter)(coeff);
			else
				delta :=  filter_bank(filter)(coeff);
			end if;
			
			if coeff = 0 then
				add <= delta;     -- first coeff, reset accumulator
			else
				add <= add+delta; -- accumulator
			end if;
			
			if coeff = 63 then
				filtered_signal(filter) <= add+delta;  -- lacth result = final accumulation
			end if;
			
			if coeff < 63 then          -- scan coeff from 0 to 63
				coeff := coeff + 1;
			else                        -- last coeff go to next filter
				coeff := 0;
				if filter = 11 then      -- last filter go to voice computation
				   stage := s_voice;
					filter := 0;          -- start with filter 0 and voice 0
					voice  := 0;
				else 
					filter := filter + 1; -- scan filter from 0 to 11		
				end if;
			end if;
		
		when s_voice =>

			delta_v := filtered_signal(filter) * pond(voice)(filter);

			if filter = 0 then
				add_v <= delta_v;         -- first filter, reset accumulator
			else
				add_v <= add_v+delta_v;   -- accumulator
			end if;
			
			if filter = 11 then
				voices(voice) <= add_v+delta_v;  -- latch result, final accumulation
			end if;	
			
			if filter < 11 then        -- scan filter from 0 to 11
				filter := filter + 1;
			else                       -- last filter go to next voice
			   filter := 0;
				if voice = 2 then
					stage := s_init;     -- last voice go to wait for next sample
				else
					voice := voice + 1;  -- scan voice from 0 to 2
				end if;	
			end if;			
		
		when others => stage := s_init;
		end case;
		
	end if;	
	end if;	
end process;	   

-- quick ADSR to control explosion level enveloppe
thrust_level : process(clock_50, reset)
	type t_stage is (s_wait, s_attack, s_decay, s_sustain, s_release);
	variable stage : t_stage := s_wait;
	constant attack   : integer range 0 to 32767 := 500;
   constant decay    : integer range 0 to 32767 := 2000; 
	constant sustain  : integer range 0 to 32767 := 0;	
	constant release  : integer range 0 to 32767 := 10000;	
	constant inc_1    : integer range 0 to 32767 := 65;  -- (    0-32767)/500   ~= 65
	constant dec_1    : integer range 0 to 32767 := 10;  -- (32767-20000)/2000  ~= 7
	constant dec_2    : integer range 0 to 32767 := 1;   -- (12767-0    )/10000 ~= 1
	variable level    : integer range 0 to 32767 := 0; 
	variable timer    : integer range 0 to 32767 := 0;
	variable update_level : std_logic;
begin
	if reset = '1' then
		stage := s_wait;
		explosion_cmd_r <= '0';
	else
		if rising_edge(clock_50) then

			update_level := '0'; 
			if noise_cnt = 0 then  -- it's time to update timer
				update_level := '1';
				if timer > 0 then
					timer := timer - 1;
				end if;
			end if;
		
			case stage is
			
			when s_wait =>  -- wait for explosion trigger
				level := 0;
				explosion_cmd_r <= sound_switch(4);
				if explosion_cmd_r = '0' and sound_switch(4) = '1' then
					stage := s_attack;
					timer := attack; -- set attack duration
				end if;
				
			when s_attack =>  -- increment level during attack
				if update_level = '1' then
					if level < (32767-inc_1) then -- ensure no overflow
						level := level + inc_1;
					else
						level := 32767;
					end if;
				end if;
				if timer = 0 then stage := s_decay; timer := decay; end if; -- set decay duration

			when s_decay =>  -- decrement level during decay
				if update_level = '1' then
					if level > dec_1 then  -- ensure no underflow
						level := level - dec_1;
					else
						level := 0;
					end if;
				end if;
				if timer = 0 then stage := s_sustain; timer := sustain; end if; -- set sustain duration
				
			when s_sustain => -- no level change during sustain
				if timer = 0 then stage := s_release; end if; -- set release duration
				
			when s_release => -- decrement level during release
				if update_level = '1' then
					if level > dec_2 then  -- ensure no underflow
						level := level - dec_2;
					else
						level := 0; -- release ends when level reachs 0
						stage := s_wait;
					end if;
				end if;
				
			when others => stage := s_wait;
			
			end case;
		
		explosion <= ((voices(2)/2)*level)/32768; -- apply enveloppe
		
		end if;
		
	end if;
	
end process;
  
-- sound_switch(1):  rocket rotate
-- sound_switch(2):  rocket thrust
-- sound_switch(3):  rocket missile
-- sound_switch(4):  explosion
-- sound_switch(5):  saucer missile
-- sound_switch(7):  background ambience (Not use)
  
ambiance  <= voices(1)/16; -- divide by power of two 

thrust    <= voices(0)/8  when sound_switch(2) = '1' else 0; -- divide by power of two 

turn <=    0 when sound_switch(1) = '0' else
		  -500 when turn_sound = '0' else
		   500;

saucer_missile <=    0 when sound_switch(5) = '0' else
						-500 when saucer_missile_sound = '0' else
						 500; 
		
rocket_missile <=    0 when sound_switch(3) = '0' else
						-500 when rocket_missile_sound = '0' else
						 500; 
					 
audio <= ambiance + thrust + explosion + turn + saucer_missile + rocket_missile when audio_gate = '1' else 0;
	
    
end struct;
