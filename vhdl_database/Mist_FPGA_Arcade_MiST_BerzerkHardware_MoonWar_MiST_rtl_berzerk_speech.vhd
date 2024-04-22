---------------------------------------------------------------------------------
-- Berzerk speech by Dar - July 2018
---------------------------------------------------------------------------------
-- s14001a speech synthesis based on Mame source code : TSI S14001A emulator v1.32
-- 
-- By Jonathan Gevaryahu ("Lord Nightmare") with help from Kevin Horton ("kevtris")
-- MAME conversion and integration by R. Belmont
-- Clock Frequency control updated by Zsolt Vasvari
-- Other fixes by AtariAce
--
-- Copyright (C) 2006-2013 Jonathan Gevaryahu aka Lord Nightmare
--
--
-- VHDL conversion by Dar
-- 
---------------------------------------------------------------------------------
-- S14001a principle
--
--  Command + start select a word to be played
--  One word is a list of first phoneme address called syllables
--  Each phoneme is composed of an LPC data first bloc address and a phoneme parameter
--  Phoneme parameter gives the mode (mirror/not mirror), silent, last_phoneme,
--  repeat and length of begining counters values.
--
--  Sound is LPC data encoded by bloc of 32 samples (8 bytes and 4 delta value/byte)
-- 
--	 In non mirror mode blocs of LPC data are read consecutively from first to 
--  first+N. with N = (8-repeat) * (16-length)
--
--  In mirror mode blocs of LPC data are read once forward and once backward 
--  repeatedly (8-repeat) times then next bloc is read. Change to next syllable
--  after (16-length)/2 blocs have been read.
--
--  Output is set to silent (value 7) under some circumstances (third and fourth
--  quarter in mirror mode or for one sample after changing read direction).
--
--  Silence can modify output value (in the loop) or not (silence modify 
--  output_sil but not output)
--
--
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity berzerk_speech is
port	(

sw : in  std_logic_vector(9 downto 0);

	clock  : in  std_logic;
	reset  : in  std_logic;
	cs     : in  std_logic;
	wr_n   : in  std_logic;
	addr   : in  std_logic_vector(4 downto 0);
	di     : in  std_logic_vector(7 downto 0);
	busy   : out std_logic;
	sample : out std_logic_vector(11 downto 0)
);
end berzerk_speech;

architecture struct of berzerk_speech is

signal hdiv1       : std_logic_vector(3 downto 0);
signal hdiv2       : std_logic_vector(3 downto 0);

signal ena_hdiv2   : std_logic;

signal ctrl_hdiv1       : std_logic_vector(2 downto 0);
signal ctrl_volume      : std_logic_vector(2 downto 0);
signal ctrl_s14001_cmd  : std_logic_vector(5 downto 0);
signal busy_in          : std_logic;

type vol_type is array(0 to 7) of integer range 0 to 255 ;
constant vol : vol_type := (0, 32, 46, 64, 89, 126, 180, 255); -- resistor ladder 


signal rom_addr : std_logic_vector(11 downto 0);
signal rom_do   : std_logic_vector( 7 downto 0);

type state_t is (waiting_start, reading, next_syllable);
signal state : state_t;

signal syllable_addr  : std_logic_vector(11 downto 0);
signal phoneme_addr   : std_logic_vector(11 downto 0);
signal phoneme_offset : std_logic_vector(11 downto 0);
signal phoneme_param  : std_logic_vector( 7 downto 0);

alias last_phoneme : std_logic is phoneme_param(7);
alias mirror       : std_logic is phoneme_param(6);
alias silence      : std_logic is phoneme_param(5);

signal phoneme_length : std_logic_vector(3 downto 0);
signal phoneme_repeat : std_logic_vector(2 downto 0);
signal length_counter : std_logic_vector(4 downto 0);
signal repeat_counter : std_logic_vector(3 downto 0);
signal output_counter : std_logic_vector(2 downto 0);

signal phoneme_start  : std_logic;
signal read_direction : std_logic;
signal last_offset    : std_logic;

signal output       : signed(4 downto 0); -- actually unsigned between 0 and F, silence = 7
signal output_sil   : signed(4 downto 0); -- actually unsigned between 0 and F, silence = 7
signal start_speech : std_logic;

signal old_delta : std_logic_vector (1 downto 0);
signal cur_delta : std_logic_vector (1 downto 0);

type delta_table_row_t is array(0 to 3,0 to 3) of signed(2 downto 0);
constant delta_table : delta_table_row_t := (
	("101", "101", "111", "111"),
	("111", "111", "000", "000"),
	("000", "000", "001", "001"),
	("001", "001", "011", "011"));

begin

-- busy output
busy <= busy_in;

-- conversion from 0-F ouput and volume scale to 0-F*256, silence at 7*256.
sample <= std_logic_vector(to_unsigned( 
			((to_integer(output_sil) -7) * vol(to_integer(unsigned(ctrl_volume)))) + 7*256, 12));

-- clock divider
counter : process(clock, reset)
begin
	if reset = '1' then
		hdiv1 <= (others => '0');
		hdiv2 <= (others => '0');
	else
	
		if rising_edge(clock) then

			-- divide between 9 and 16 upon ctrl
			if hdiv1 = "1111" then
				hdiv1 <= "0"&ctrl_hdiv1;
				ena_hdiv2 <= '1';
			else
				hdiv1 <= hdiv1 + '1';
				ena_hdiv2 <= '0';
			end if;

			-- divide by 16 is ok because : IC A5 divide by 8 and s14001a divide by 2 internally
			if ena_hdiv2 = '1' then
				if hdiv2 = "1111" then
					hdiv2 <= (others => '0');
				else
					hdiv2 <= hdiv2 + '1';
				end if;
			end if;
		
		end if;
				
	end if; 
end process;

--control/registers interface with cpu addr/data
ctrl_regs : process(clock, reset)
begin
		
	if reset = '1' then

		ctrl_s14001_cmd  <= (others => '0');
		ctrl_hdiv1       <= (others => '0');
		ctrl_volume      <= (others => '0');
		start_speech     <= '0';
	
	else
		if rising_edge(clock) then
			if busy_in = '1' then 
				start_speech <= '0';
			end if;
		
			if (cs = '1') and (wr_n = '0') and (addr = "00100") then -- 0x44

				if (di(7 downto 6) = "00") and (busy_in = '0') and (start_speech = '0') then 
					ctrl_s14001_cmd <= di(5 downto 0);
					start_speech <= '1';
				end if;
			
				if di(7 downto 6) = "01" then
					ctrl_hdiv1  <= di(2 downto 0);
					ctrl_volume <= di(5 downto 3);
				end if; 	
				
				
			end if;
		end if;
	end if; 
end process;


-- s14001a
phoneme_length <= phoneme_param(4 downto 2)&'0';
phoneme_repeat <= phoneme_param(1 downto 0)&'0';

s14001a: process(clock, reset)
begin
	if reset = '1' then
		state <= waiting_start;
	else
		if rising_edge(clock) then
			if ena_hdiv2 = '1' then
				-- using hdiv2 as a sub-state counter
				-- computation are done during sub-state 0-14
				-- new sample is ready on sub-state 15
				-- next state is set on sub-state transition from 15 to 0

				case state is
				
					when waiting_start =>
					
						output <= "00111";
						
						case hdiv2 is
						
							-- wait for start, set busy when done
							when X"0" =>
								busy_in <= '0';
								if start_speech = '1' then
									busy_in <= '1';
								end if;
								
							-- compute syllable addr from word cmd	
							when X"1" =>
								rom_addr <= "00000"&ctrl_s14001_cmd&'0';
								
							when X"2" =>	
								syllable_addr(11 downto 4) <= rom_do;
								rom_addr <= "00000"&ctrl_s14001_cmd&'1';
								
							when X"3" =>
								syllable_addr(3 downto 0) <= rom_do(7 downto 4);
							
							--	init playing speech
							when X"F" =>
								if busy_in = '1' then
									state <= reading;
									phoneme_start <= '1';
									phoneme_offset <= (others =>'0');
								end if;
								
							when others => null;
						end case;
						
					when reading =>
						case hdiv2 is
						
							-- get phoneme addr and parameter
							when X"0" =>
								rom_addr <= syllable_addr;
								
							when X"1" =>
								phoneme_addr <= rom_do&"0000";
								rom_addr <= syllable_addr + '1';
								
							when X"2" =>
								phoneme_param <= rom_do;
								rom_addr <= phoneme_addr + phoneme_offset(11 downto 2);
								
							when X"3" =>
								-- start with a new phoneme
								if phoneme_start = '1' then 
									length_counter <= '0'&phoneme_length;
									repeat_counter <= '0'&phoneme_repeat;
									read_direction <= '1';
									old_delta <= "10";
									output_counter <= (others =>'0');
									phoneme_start <= '0';
									phoneme_offset <= (others =>'0');
									output <= "00111";
								end if;
								
								-- get LPC data
								case phoneme_offset(1 downto 0) is
									when "00"   => cur_delta <= rom_do(7 downto 6);
									when "01"   => cur_delta <= rom_do(5 downto 4);
									when "10"   => cur_delta <= rom_do(3 downto 2);
									when others => cur_delta <= rom_do(1 downto 0);
								end case;
								
							-- compute new ouput from previous value and new LPC data	
							when X"4" =>
								if read_direction = '1' then
									if ((mirror = '1') and (output_counter(1) = '1')) or (silence = '1') then
										output <= "00111" + delta_table(to_integer(unsigned(cur_delta)), 2);
									else
										output <= output + delta_table(to_integer(unsigned(cur_delta)),to_integer(unsigned(old_delta)));
									end if;
								else
									if phoneme_offset(4 downto 0) = "11111" then								
										if (output_counter(1) = '1') or (silence = '1') then
											output <= "00111";
										else
											-- keep last value
										end if;
									else
										if (output_counter(1) = '1') or (silence = '1') then
											output <= "00111" - delta_table(2, to_integer(unsigned(cur_delta)));
										else	
											output <= output - delta_table(to_integer(unsigned(old_delta)),to_integer(unsigned(cur_delta)));
										end if;
									end if;
								end if;
								
								old_delta <= cur_delta;

								-- increase or decrease phoneme_offset (one offset = one sample)
								-- last offset when 32 samples have been read either forward or backward
								last_offset <= '0';
								if read_direction = '1' then
									if phoneme_offset(4 downto 0) = "11111" then
										last_offset <= '1';
										if mirror = '0' then
											phoneme_offset <= phoneme_offset + '1';
										end if;
									else
										phoneme_offset <= phoneme_offset + '1';
									end if;
								else
									if phoneme_offset(4 downto 0) = "00000" then
										last_offset <= '1';
									else
										phoneme_offset <= phoneme_offset - '1';
									end if;
								end if;
							
							-- increase repeat counter every 32 samples
							when X"5" =>
								if last_offset = '1' then
									repeat_counter <= repeat_counter + '1';
									output_counter <= output_counter + '1';
									last_offset <= '0';
								end if;
								
								-- limit ouput to 0 - F
								if output > "01111" then output <= "01111"; end if;
								if output < "00000" then output <= "00000"; end if;
								
							-- manage read_direction and phoneme advance (+8bytes = next 32 samples)
							-- upon mirror condition 
							when X"6" =>
								if mirror = '1' then
									if repeat_counter = 8 then
										repeat_counter <= '0'&phoneme_repeat;
										if length_counter(0) = '1' then
											phoneme_offset <= phoneme_offset + "100000";
										end if;
										if length_counter = 15 then 
											-- will be 16 after on next state
										else
											if output_counter(0) = '1' then
												read_direction <= '0';
											else
												read_direction <= '1';
											end if;
										end if;
										length_counter <= length_counter + 1;
									else
										if output_counter(0) = '1' then
											read_direction <= '0';
										else
											read_direction <= '1';
										end if;										
									end if;
								else -- not in mirror mode
									if repeat_counter = 8 then
										repeat_counter <= '0'&phoneme_repeat;
										if length_counter = 15 then 
											-- will be 16 after this state
										end if;
										length_counter <= length_counter + 1;
									end if;
								end if;
							
						   -- goto next syllable when length counter reach 16
							when X"F" =>
								if length_counter = 16 then
									state <= next_syllable;
								end if;
								
							when others => null;
							
						end case;
						
					when next_syllable =>
					
						case hdiv2 is
						
							-- prepare for next syllable 
							when X"0" =>
								syllable_addr <= syllable_addr + 2;
								phoneme_offset <= (others =>'0');								
								phoneme_start <= '1';
							
						   -- one silent sample during syllable change
							when X"4" =>
								output <= "00111";

							-- terminate if last phoneme reached	
							when X"F" =>
								if last_phoneme = '1' then 
									state <= waiting_start;
								else
									state <= reading;
								end if;
								
							when others => null;
						end case;
						
					when others => null;
					
				end case; -- case state
				
				-- set silent final output during 2 last quarter when in mirror mode
				if hdiv2 = X"6" then								
					if ((mirror = '1') and (output_counter(1) = '1')) or (silence = '1') then
						output_sil <= "00111";
					else
						output_sil <= output;
					end if;
				end if;
	
			end if;
		end if;		
	end if;
end process;
	
-- program roms 
speech_rom : entity work.MoonWar_speech_rom
port map (
	addr  => rom_addr(11 downto 0),
	clk   => clock,
	data  => rom_do
);

	
end architecture;