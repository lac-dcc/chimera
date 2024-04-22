-- g00_audio_interface
--
-- This module implements the interface to the Wolfson
-- WM8731 Audio Codec chip located on the Altera DE1 board
-- The INIT line when asserted writes configuration data into the registers
-- of the codec chip. These set the sampling rate to 48KHz and selects
-- Slave and USB modes for the interface (implying an external 24MHz input clock).
-- This module only implements the audio output. It does not handle audio
-- input, although it could be easily extended to do so.
--
-- Version 1.0
--
-- Designer: James Clark
-- February 26 2008

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY g00_audio_interface IS
	PORT
	(	
		LDATA, RDATA	:      IN signed(23 downto 0); -- parallel external data inputs
		clk, rst, INIT, W_EN : IN std_logic; -- clk should be 24MHz
		pulse_48KHz :          OUT std_logic; -- sample sync pulse
		AUD_MCLK :             OUT std_logic; -- codec master clock input
		AUD_BCLK :             OUT std_logic; -- digital audio bit clock
		AUD_DACDAT :           OUT std_logic; -- DAC data lines
		AUD_DACLRCK :          OUT std_logic; -- DAC data left/right select
		I2C_SDAT :             OUT std_logic; -- serial interface data line
		I2C_SCLK :             OUT std_logic  -- serial interface clock
	);
END g00_audio_interface;

ARCHITECTURE a OF g00_audio_interface IS
TYPE SCI_state IS (sw_init0,sw_init1,s0,s1,s2,sab1,sab2,sab3,sack11,sack12,sack13,
 sack21,sack22,sack23,sack31,sack32,sack33,sw1b1,sw1b2,sw1b3,sw2b1,sw2b2,sw2b3,send);
TYPE SCI_state2 IS (sw_init0,sw_init1,sw_ready,sw_write);

signal Bcount : unsigned(2 downto 0);	
signal BBcount : integer range 0 to 49;
signal Mcount : std_logic;
signal clk_count : integer range 0 to 63;
signal bit_count : integer range 0 to 7;
signal word_count : integer range 0 to 12;
signal LRDATA : std_logic_vector(49 downto 0); -- stores L&R data
signal state : SCI_state;
signal state2 : SCI_state2;
signal SCI_WRITE, SCI_READY : std_logic;
signal SCI_ADDR, SCI_WORD1, SCI_WORD2 : std_logic_vector(7 downto 0);

BEGIN

SCI_ADDR <= "00110100";

-- FSM for controlling audio data transfer to codec
digital_audio_interface: process (clk, rst)
	begin
		if rst='1' then
			Mcount <= '1';
			Bcount <= "100";
			BBcount <= 0;
			pulse_48khz <= '0';
			LRDATA <= (others => '0');
			AUD_MCLK <= '0';
			AUD_BCLK <= '0';
			AUD_DACLRCK <= '0';
			AUD_DACDAT <= '0';
		elsif clk='1' and clk'EVENT then
			Mcount <= not Mcount;
			if Mcount = '1' then
				AUD_MCLK <= '1';
			else -- Mcount = 0
				AUD_MCLK <= '0';
				Bcount <= Bcount - "001";
				if Bcount = "011" then
					AUD_BCLK <= '1'; --BCLK is low for 2, high for 3
				end if; -- Bcount = 3
				if Bcount = "000" then
					AUD_BCLK <= '0';
					Bcount <= "100";
					BBcount <= BBcount - 1;
					if BBcount = 1 then
						pulse_48khz <= '1'; -- use for 48Khz sample sync
						if W_EN = '1' then
							LRDATA <= std_logic_vector(LDATA) & std_logic_vector(RDATA) & "00";
						end if; -- if W_EN
					else 
						pulse_48khz <= '0';
					end if; -- if BBcount
					if BBcount = 0 then
						BBcount <= 49;
					end if; -- if BBcount
					if BBcount = 49 then
						AUD_DACLRCK <= '1';
					else
						AUD_DACLRCK <= '0';
					end if; -- if BBcount
					AUD_DACDAT <= LRDATA(BBcount);
				end if; -- if Bcount = 0
			end if; -- if Mcount
		end if; -- if rst
	end process;
	
-- FSM to control initialization of codec configuration registers	
SCI_INIT_FSM: process(clk, rst)
	begin
		if rst='1' then
			state2 <= sw_init0;
			word_count <= 0;
			SCI_WRITE <= '0';
		elsif clk='1' and clk'EVENT then
			SCI_WRITE <= '0';
			case state2 is
			when sw_init0 => -- wait for INIT to go low
				word_count <= 0;
				if INIT = '0' then
					state2 <= sw_init1;
				end if; -- if INIT='0'
			when sw_init1 => -- wait for INIT to go high
				if INIT = '1' then
					state2 <= sw_ready;
				end if; -- if INIT='1'
			when sw_ready => -- wait for SCI_READY to go high
				if SCI_READY = '1' then
					state2 <= sw_write;
				end if; -- if SCI_READY='1'
			when sw_write => -- write the next word	
				if word_count < 8 then
					state2 <= sw_ready; -- wait for next ready cycle
					word_count <= word_count + 1;
					SCI_WRITE <= '1'; -- begin writing of next word
					case word_count is
					when 0 =>
						SCI_WORD1 <= "00010010"; -- inactivate interface
						SCI_WORD2 <= "00000000";
					when 1 =>
						SCI_WORD1 <= "00000001"; -- set register R0
						SCI_WORD2 <= "10010111";
					when 2 =>
						SCI_WORD1 <= "00001000"; -- set register R4
						SCI_WORD2 <= "00010010";
					when 3 =>
						SCI_WORD1 <= "00001010"; -- set register R5
						SCI_WORD2 <= "00010110";
					when 4 =>
						SCI_WORD1 <= "00001100"; -- set register R6
						SCI_WORD2 <= "01100011";
					when 5 =>
						SCI_WORD1 <= "00001110"; -- set register R7
						SCI_WORD2 <= "00001011";
					when 6 =>
						SCI_WORD1 <= "00010000"; -- set register R8
						SCI_WORD2 <= "00000001"; -- sets USB mode
					when 7 =>
						SCI_WORD1 <= "00010010"; -- reactivate interface
						SCI_WORD2 <= "00000001";
					when others =>
					end case; -- case word_count	
				else 
						state2 <= sw_init0; -- go back to start	
				end if; -- if word_count
			end case; -- case state2
		end if; -- if rst		
	end process; -- SCI_INIT_FSM
	
-- FSM controlling the serial transfer of data to the I2C interface
-- to the codec configuration registers.	
SCI_FSM: process (clk, rst)
	begin
		if rst='1' then
			state <= sw_init0;
			bit_count <= 7;
			clk_count <= 0;
			SCI_READY <= '1';
		elsif clk='1' and clk'EVENT then
			I2C_SDAT <= '1'; -- default output values
			I2C_SCLK <= '1';
			case state is
			when sw_init0 => -- wait for SCI_WRITE to go low
				if SCI_WRITE='0' then
					state <= sw_init1;
				end if; -- if SCI_WRITE='1'
			when sw_init1 => -- wait for SCI_WRITE to go high
				if SCI_WRITE='1' then
					SCI_READY <= '0';
					state <= s0;
				end if; -- if SCI_WRITE='0'
			when s0 => -- begin start phase, both I2C_SDAT and I2C_SCLK are high
				clk_count <= clk_count + 1;
				if clk_count = 15 then -- this phase lasts for 16 clocks
					state <= s1;
				end if; -- if clk_count
			when s1 => -- second part of start phase, I2C_SDAT goes low, while I2C_SCLK stays high
				clk_count <= clk_count + 1;
				I2C_SDAT <= '0';
				if clk_count = 47 then -- this phase lasts for 32 clocks
					clk_count <= 0;
					state <= s2;
				end if; -- if clk_count
			when s2 => -- end of start phase, both I2C_SDAT and I2C_SCLK are low
				clk_count <= clk_count + 1;
				I2C_SDAT <= '0';
				I2C_SCLK <= '0';
				if clk_count = 15 then -- this phase lasts for 16 clocks
					bit_count <= 7;
					state <= sab1;
					SCI_READY <= '0'; -- indicate we are busy for the next while
				end if; -- if clk_count
			when sab1 => -- send 8 address bits, MSB first, first phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_ADDR(bit_count);
				I2C_SCLK <= '0';
				if clk_count = 31 then
					state <= sab2;
				end if; -- if clk_count
			when sab2 => -- send 8 address bits, MSB first, second phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_ADDR(bit_count);
				I2C_SCLK <= '1';
				if clk_count = 63 then
					state <= sab3;
					clk_count <= 0;
				end if; -- if clk_count
			when sab3 => -- send 8 address bits, MSB first, third phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_ADDR(bit_count);
				I2C_SCLK <= '0';
				if clk_count = 15 then
					if bit_count = 0 then
						state <= sack11; -- finished all 8 bits, wait for ack
						bit_count <= 7;
					else
						state <= sab1; -- write next bit
						bit_count <= bit_count - 1;
					end if; -- if bit_count
				end if; -- if clk_count
			when sack11 =>
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z'; -- float the tristate data line
				I2C_SCLK <= '0';
				if clk_count = 31 then
					state <= sack12;
					clk_count <= 0;
				end if; -- if clk_count
			when sack12 => 
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z';
				I2C_SCLK <= '1';
				if clk_count = 31 then
					state <= sack13;
					clk_count <= 0;
				end if; -- if clk_count
			when sack13 => -- last phase of acknowledge cycle
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z';
				I2C_SCLK <= '0';
				if clk_count = 15 then
					state <= sw1b1;
				end if; -- if clk_count
			when sw1b1 => -- send 8 bits of first word, MSB first, first phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_WORD1(bit_count);
				I2C_SCLK <= '0';
				if clk_count = 31 then
					state <= sw1b2;
				end if; -- if clk_count
			when sw1b2 => -- send 8 bits, MSB first, second phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_WORD1(bit_count);
				I2C_SCLK <= '1';
				if clk_count = 63 then
					state <= sw1b3;
					clk_count <= 0;
				end if; -- if clk_count
			when sw1b3 => -- send 8 address bits, MSB first, third phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_WORD1(bit_count);
				I2C_SCLK <= '0';
				if clk_count = 15 then
					if bit_count = 0 then
						state <= sack21; -- finished all 8 bits, wait for ack
						bit_count <= 7;
					else
						state <= sw1b1; -- write next bit
						bit_count <= bit_count - 1;
					end if; -- if bit_count
				end if; -- if clk_count
			when sack21 =>
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z'; -- float the tristate data line
				I2C_SCLK <= '0';
				if clk_count = 31 then
					state <= sack22;
					clk_count <= 0;
				end if; -- if clk_count
			when sack22 => 
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z';
				I2C_SCLK <= '1';
				if clk_count = 31 then
					state <= sack23;
					clk_count <= 0;
				end if; -- if clk_count
			when sack23 => -- last phase of acknowledge cycle
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z';
				I2C_SCLK <= '0';
				if clk_count = 15 then
					state <= sw2b1;
				end if; -- if clk_count			
			when sw2b1 => -- send 8 bits of second word, MSB first, first phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_WORD2(bit_count);
				I2C_SCLK <= '0';
				if clk_count = 31 then
					state <= sw2b2;
				end if; -- if clk_count
			when sw2b2 => -- send 8 bits, MSB first, second phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_WORD2(bit_count);
				I2C_SCLK <= '1';
				if clk_count = 63 then
					state <= sw2b3;
					clk_count <= 0;
				end if; -- if clk_count
			when sw2b3 => -- send 8 address bits, MSB first, third phase
				clk_count <= clk_count + 1;
				I2C_SDAT <= SCI_WORD2(bit_count);
				I2C_SCLK <= '0';
				if clk_count = 15 then
					if bit_count = 0 then
						state <= sack31; -- finished all 8 bits, wait for ack
						bit_count <= 7;
					else
						state <= sw2b1; -- write next bit
						bit_count <= bit_count - 1;
					end if; -- if bit_count
				end if; -- if clk_count
			when sack31 =>
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z'; -- float the tristate data line
				I2C_SCLK <= '0';
				if clk_count = 31 then
					state <= sack32;
					clk_count <= 0;
				end if; -- if clk_count
			when sack32 => 
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z';
				I2C_SCLK <= '1';
				if clk_count = 31 then
					state <= sack33;
					clk_count <= 0;
				end if; -- if clk_count
			when sack33 => -- last phase of acknowledge cycle
				clk_count <= clk_count + 1;
				I2C_SDAT <= 'Z';
				I2C_SCLK <= '0';
				if clk_count = 15 then
					state <= send;
				end if; -- if clk_count
			when send => -- last step, raise SCLK, keeping SDAT low for 16 cycles
				clk_count <= clk_count + 1;
				I2C_SDAT <= '0';
				I2C_SCLK <= '1';
				if clk_count = 31 then
					SCI_READY <= '1';
					state <= sw_init0; -- go back to start, wait for new write command
				end if; -- if clk_count
			end case;
		end if; -- if rst	
	end process;
	
end a;