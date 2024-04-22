library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity samples is
port(
	 -- Sound related
	 audio_enabled  : in  std_logic;
	 audio_port_0   : in  std_logic_vector( 7 downto 0);
	 audio_port_1   : in  std_logic_vector( 7 downto 0);
	 audio_stop     : in  std_logic_vector(15 downto 0);
	 
	 audio_in       : in  std_logic_vector(15 downto 0);
	 audio_out_L    : out std_logic_vector(15 downto 0);
	 audio_out_R    : out std_logic_vector(15 downto 0);
	 
	 -- Access to samples
	 wave_addr      : out std_logic_vector(24 downto 0);
	 wave_read      : out std_logic;
	 wave_data      : in std_logic_vector(15 downto 0);
	 
	 -- table loading
	 dl_addr        : in  std_logic_vector(24 downto 0);
	 dl_wr          : in  std_logic;
	 dl_data        : in  std_logic_vector( 7 downto 0);
	 dl_download	 : in  std_logic;
	 samples_ok     : out std_logic;
	 
	 -- No Mans Land special
	 NML_Speed      : in  std_logic_vector( 1 downto 0);
	 
	 -- Clocks and things
	 CLK_SYS        : in  std_logic; -- (for loading table)
	 clock          : in  std_logic; -- 43.264 Mhz (this drives the rest)  
	 reset          : in  std_logic  -- high to reset
 );
end samples;

architecture struct of samples is

 -- Clock dividers
 signal wav_clk_cnt  : std_logic_vector(11 downto 0); -- 44kHz divider / sound counter (43.264 Mhz count to 981 (x"3D5") for 44khz clock)
 signal wav_freq_cnt : std_logic_vector(1 downto 0);  -- divide further to give 22Khz (0) and 11Khz (1)
 signal wav_freq_lst : std_logic_vector(1 downto 0);  -- for rising edge checks
 
 -- wave info (aka Table)
 type addr_t is array (0 to 23) of std_logic_vector(23 downto 0);
 type mode_t is array (0 to 23) of std_logic_vector(15 downto 0);
  
 signal wav_addr_start : addr_t;
 signal wav_addr_end   : addr_t;
 signal wav_mode       : mode_t := (others=>(others=>'0'));
 signal table_loaded   : std_logic register := '0';
 
 signal wave_left      : std_logic_vector(15 downto 0) register := (others=>'0'); 
 signal wave_right     : std_logic_vector(15 downto 0) register := (others=>'0'); 
 signal wave_read_ct   : std_logic_vector(2 downto 0) register := (others=>'0'); 
 
 -- sound control info
 signal snd_id : integer;
 signal snd_addr_play  : addr_t := (others=>(others=>'1'));
 signal ports          : std_logic_vector(15 downto 0); 
 signal last_ports     : std_logic_vector(15 downto 0); 
 signal this_ports     : std_logic_vector(15 downto 0); 
 signal next_ports     : std_logic_vector(15 downto 0); 
 signal this_stop      : std_logic_vector(15 downto 0); 
 signal next_stop      : std_logic_vector(15 downto 0); 
 signal next_audio_in  : std_logic_vector(15 downto 0); 
 
 -- Audio variables
 signal audio_sum_l    : signed(19 downto 0);
 signal audio_sum_r    : signed(19 downto 0);
 signal audio_l        : signed(19 downto 0);
 signal audio_r        : signed(19 downto 0);

 -- No Mans Land background noise specific (set port to play sample 15, and it does no mans land background instead)
 signal NML_ID		     : integer;			-- Sample actually playing (8 - 23)
 signal NML_Count      : integer := 0;		-- Next bar to play
 
 begin

----------------
-- Table Load --
----------------

-- wav_mode - 8 bits - if byte = 00 then this bit does not trigger anything
-- bit 0 = 11khz
-- bit 1 = 22khz
-- bit 2 = 44khz
-- bit 4 = 16 bit (off = 8 bit)
-- bit 5 = Stereo (off = mono)
--
-- trigger mode - 8 bits
-- bit 0 = ON  one shot (sample plays once)
-- bit 0 = OFF restarts if bit still active at end (loops)
-- bit 1 = ON  cuts off sample if bit goes low (should it fade?)
-- bit 1 = OFF continues until end of sample reached
-- bit 4 = output LEFT channel
-- bit 5 = output RIGHT channel (set both for MONO/STEREO)

process (CLK_SYS,dl_download,dl_wr,dl_data)
variable ID : integer;
begin
	if rising_edge(CLK_SYS) then
	
		if dl_download='1' and dl_wr='1' then
		
		   -- routine only plays 15 samples, but No Mans Land has 16 to choose from for background tune (8 - 23)
			ID := to_integer(unsigned(dl_addr(7 downto 3)));
			
			case dl_addr(2 downto 0) is
				when "000" => -- Wave mode
					wav_mode(ID)(7 downto 0) <= dl_data;
					if dl_data(2 downto 0) /= "000" then
						table_loaded <= '1';
					end if;
				when "001" => -- Trigger mode
					wav_mode(ID)(15 downto 8) <= dl_data;
				when "010" => -- Start Address
					wav_addr_start(ID)(23 downto 16) <= dl_data;
				when "011" => -- Start Address
					wav_addr_start(ID)(15 downto 8) <= dl_data;
				when "100" => -- Start Address
					wav_addr_start(ID)(7 downto 0) <= dl_data;
				when "101" => -- End Address
					wav_addr_end(ID)(23 downto 16) <= dl_data;
				when "110" => -- End Address
					wav_addr_end(ID)(15 downto 8) <= dl_data;
				when "111" => -- End Address
					wav_addr_end(ID)(7 downto 0) <= dl_data;
			end case;
		end if;
	end if;
end process;
 
-----------------
-- Wave player --
-----------------

-- current IO bit & sample to be looking at
snd_id <= to_integer(unsigned(wav_clk_cnt(11 downto 5)));
ports  <= audio_port_1 & audio_port_0;
samples_ok <= table_loaded;

--wave_data <= wave_data1 & wave_data1;

-- wave player
process (clock, reset, table_loaded)
variable NewID : integer;
begin
	if table_loaded='1' then
		if reset='1' then
			wav_clk_cnt  <= (others=>'0');
			wav_freq_cnt <= "00";
			snd_addr_play <= (others=>(others=>'1'));
			wave_read    <= '0';
			audio_out_L <= x"0000";
			audio_out_R <= x"0000";
		else 
			-- Use falling edge to interleave commands with SDRAM module
			if falling_edge(clock) then
			
				-- make sure we don't miss any bits being set
				next_ports <= next_ports or ports;
				next_stop  <= next_stop or audio_stop;
				
				-- Devil Zone only sets this for a few cycles, so it needs to be kept until the next active audio cycle
				next_audio_in <= next_audio_in or audio_in;
				
				if snd_id <= 15 then
					if snd_addr_play(snd_id)=x"FFFFFF" then
						-- All Start play on 0 to 1 transition
						if (last_ports(snd_id)='0' and this_ports(snd_id)='1') then
							if snd_id < 15 then
								snd_addr_play(snd_id) <= wav_addr_start(snd_id);
							else
								-- No Mans Land special
								NML_Count <= 1;  											-- Start at first bar, but set count for next one
								NewID := 8 + to_integer(unsigned(NML_Speed));	-- (which is sample 8 + speed setting)
								snd_addr_play(snd_id) <= wav_addr_start(NewID); -- Start address
								NML_ID <= NewID;											-- Save ID
							end if;
						end if;
					else
						-- cut out when signal zero
						if (wav_mode(snd_id)(9)='1' and this_ports(snd_id)='0') then
							snd_addr_play(snd_id) <= x"FFFFFF";
						end if;
						-- cut out when STOP set high
						if (this_stop(snd_id)='1') then
							-- But may just want to restart this sample
							if this_ports(snd_id)='1' then
								snd_addr_play(snd_id) <= wav_addr_start(snd_id);
							else
								snd_addr_play(snd_id) <= x"FFFFFF";
							end if;
						end if;
					end if;
				end if;
				
				-- 44.1kHz base tempo / high bits for scanning sound
				if wav_clk_cnt = x"3D5" then  -- divide 43.264 Mhz by 981 => 44.102kHz
				
					wav_clk_cnt <= (others=>'0');
					wav_freq_lst <= wav_freq_cnt;
					wav_freq_cnt <= wav_freq_cnt + '1';

					-- cycle along ports last / this
					last_ports <= this_ports;
					this_ports <= next_ports;
					next_ports <= ports;

					this_stop  <= next_stop;
					next_stop  <= audio_stop;
					
					-- latch final audio / reset sum
					audio_r <= audio_sum_r;
					audio_l <= audio_sum_l;
					audio_sum_r <= resize(signed(next_audio_in), 20);
					audio_sum_l <= resize(signed(next_audio_in), 20);
					
					next_audio_in <= audio_in;
				else
					wav_clk_cnt <= wav_clk_cnt + 1;
				end if;
				
				if audio_enabled='1' then
--					-- clip audio
--					if  audio_r(19 downto 2) > 32767 then
--						audio_out_R <= x"7FFF";
--					elsif	audio_r(19 downto 2) < -32768 then 
--						audio_out_R <= x"8000";
--					else
--						audio_out_R <= std_logic_vector(audio_r(17 downto 2));
--					end if;
--
--					if  audio_l(19 downto 2) > 32767 then
--						audio_out_L <= x"7FFF";
--					elsif	audio_l(19 downto 2) < -32768 then 
--						audio_out_L <= x"8000";
--					else
--						audio_out_L <= std_logic_vector(audio_l(17 downto 2));
--					end if;

					audio_out_R <= std_logic_vector(audio_r(17 downto 2));
					audio_out_L <= std_logic_vector(audio_l(17 downto 2));

				else
					audio_out_L <= x"0000";
					audio_out_R <= x"0000";
				end if;

				-- sdram read trigger (and auto refresh period)
				if wav_clk_cnt(4 downto 0) = "00001" then wave_read <= '1';end if;
				if wav_clk_cnt(4 downto 0) = "00011" then wave_read <= '0';end if;
				
				-- select only useful cycles (0-15)
				if snd_id <= 15 then 
				
					-- is this sample present
					if wav_mode(snd_id)(2 downto 0) /= "000" then
				
						if snd_addr_play(snd_id) /= x"FFFFFF" then
		
							---------------
							-- Data read --
							---------------
							
							-- set addr for first byte (but it reads 4 bytes anyway)
							if wav_clk_cnt(4 downto 0) = "00000" then
								wave_addr <= '0' & snd_addr_play(snd_id);
							end if;
						
							if wav_clk_cnt(4 downto 0) = "01000" then -- "11101" then
									-- SDRAM bit : data returned, put into left / right accordingly
									case wav_mode(snd_id)(5 downto 4) is
									
										when "00" => -- 8 bit mono
											if snd_addr_play(snd_id)(0)='0' then
												-- Low byte
												wave_left <= (not wave_data(7)) & wave_data(6 downto 0) & x"00";
												wave_right <= (not wave_data(7)) & wave_data(6 downto 0) & x"00";
											else
												-- high byte
												wave_left <= (not wave_data(15)) & wave_data(14 downto 8) & x"00";
												wave_right <= (not wave_data(15)) & wave_data(14 downto 8) & x"00";
											end if;
											
										when "01" => -- 16 bit mono
											wave_left <= wave_data;											
											wave_right <= wave_data;											
											
										when "10" => -- 8 bit stereo
											wave_left <= (not wave_data(7)) & wave_data(6 downto 0) & x"00";
											wave_right <= (not wave_data(15)) & wave_data(14 downto 8) & x"00";
											
										when "11" => -- 16 bit stereo (won't work with curent SDRAM controller!)
											wave_left <= wave_data;											
											wave_right <= wave_data;											
											
									end case;
							end if;
							
							-- Data all read, add to output counters
							if wav_clk_cnt(4 downto 0) = "01001" then -- "111110" then
							
								-- Left channel
								if wav_mode(snd_id)(12)='1' then
									audio_sum_l <= audio_sum_l + to_integer(signed(wave_left));
								end if;
								
								-- Right channel
								if wav_mode(snd_id)(13)='1' then
									audio_sum_r <= audio_sum_r + to_integer(signed(wave_right));
								end if;
						
								--wave_left  <= x"0000";
								--wave_right <= x"0000";

								-- Increment address depending on frequency and size
								if wav_mode(snd_id)(2)='1' or 
								  (wav_mode(snd_id)(1)='1' and wav_freq_lst(0)='0' and wav_freq_cnt(0)='1') or
								  (wav_mode(snd_id)(0)='1' and wav_freq_lst(1)='0' and wav_freq_cnt(1)='1') then
								  
								  case wav_mode(snd_id)(5 downto 4) is
										when "00" => 
											-- 8 bit mono
											snd_addr_play(snd_id) <= snd_addr_play(snd_id) + 1;
										when "01" | "10" =>
											-- 16 bit mono or 8 bit stereo
											snd_addr_play(snd_id) <= snd_addr_play(snd_id) + 2;
										when "11" =>
											-- 16 bit stereo 
											snd_addr_play(snd_id) <= snd_addr_play(snd_id) + 4;
								  end case;

								end if;
															
							end if;
							
							if wav_clk_cnt(4 downto 0) = "01111" then -- "111111" then
								-- End of Wave data ? 
								if (snd_id < 15) then
									if (snd_addr_play(snd_id) > wav_addr_end(snd_id)) then 	
										-- Restart ?
										if (wav_mode(snd_id)(8)='0' and this_ports(snd_id)='1') then
											-- Loop back to the start
											snd_addr_play(snd_id) <= wav_addr_start(snd_id);
										else
											-- Stop
											snd_addr_play(snd_id) <= x"FFFFFF";
										end if;
									end if;
								else
									if (snd_addr_play(snd_id) > wav_addr_end(NML_ID)) then
											-- No Mans Land special (based on number of bits set in counter)
											case NML_Count is
												when 0 => 					NewID := 8;
												when 1|2|4|8 =>			NewID := 12;
												when 7|11|13 =>        	NewID := 20;
												when others => 			NewID := 16;
											end case;
											
											NewID := NewID + to_integer(unsigned(NML_Speed)); -- Offset for speed									
											snd_addr_play(snd_id) <= wav_addr_start(NewID);   -- Get next start address
											NML_ID <= NewID;											  -- Save ID
											
											if (NML_Count = 13) then	
												NML_Count <= 0;										  -- Loop to beginning
											else
												NML_Count <= NML_Count + 1; 
											end if;
											
										end if;
									end if;
							end if;  -- Wave "01111"
							
						end if; -- Playing

					end if; -- Bit Active
					
				end if; -- useful
				
			end if; -- rising clock

		end if; -- reset
		
	end if; -- table loaded

end process;

end;
