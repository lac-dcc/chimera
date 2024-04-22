-- VHDL SD card interface
-- Reads and writes a single block of data as a data stream
--
--
-- Adapted from design by Steven J. Merrifield, June 2008
--		https://pastebin.com/HW3ru1cC
-- Read states are derived from the Apple II emulator by Stephen Edwards
--		https://github.com/MiSTer-devel/Apple-II_MiSTer
--
-- This version of the code contains modifications copyright by Grant Searle 2013
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
-- Please ask permission from Grant Searle before republishing elsewhere.
-- If you use this file or any part of it, please add an acknowledgement to myself and
-- a link back to my main web site http://searle.hostei.com/grant/
-- and to the "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
--
-- Please check on the above web pages to see if there are any updates before using this file.
-- If for some reason the page is no longer available, please search for "Grant Searle"
-- on the internet to see if I have moved to another web hosting service.
--
-- Grant Searle
-- eMail address available on my main web page link above.
-- Minor changes by foofoobedoo@gmail.com
-- Additional functionality to provide SDHC support by RHKoolaap.
--
-- This design uses the SPI interface and supports "standard capacity" (SDSC) and
-- "high capacity" (SDHC) cards.

-- Address Register
--    0    SDDATA        read/write data
--    1    SDSTATUS      read
--    1    SDCONTROL     write
--    2    SDLBA0        write-only
--    3    SDLBA1        write-only
--    4    SDLBA2        write-only (only bits 6:0 are valid)
--
-- For both SDSC and SDHC (high capacity) cards, the block size is 512bytes (9-bit value) and the
-- SDLBA registers select the block number. SDLBA2 is most significant, SDLBA0 is least significant.
--
-- For SDSC, the read/write address parameter is a 512-byte aligned byte address. ie, it has 9 low
-- address bits explicitly set to 0. 23 of the 24 programmable address bits select the 512-byte block.
-- This gives an address capacity of 2^23 * 512 = 4GB .. BUT maximum SDSC capacity is 2GByte.
--
-- The SDLBA registers are used like this:
--
-- 31 30 29 28.27 26 25 24.23 22 21 20.19 18 17 16.15 14 13 12.11 10 09 08.07 06 05 04.03 02 01 00
--+------- SDLBA2 -----+------- SDLBA1 --------+------- SDLBA0 --------+ 0  0  0  0  0  0  0  0  0
--
-- For SDHC cards, the read/write address parameter is the ordinal number of 512-byte block ie, the
-- 9 low address bits are implicity 0. The 24 programmable address bits select the 512-byte block.
-- This gives an address capacity of 2^24 * 512 = 8GByte. SDHC can be upto 32GByte but this design
-- can only access the low 8GByte (could add SDLBA3 to get the extra address lines if required).
--
-- The SDLBA registers are used like this:
--
-- 31 30 29 28.27 26 25 24.23 22 21 20.19 18 17 16.15 14 13 12.11 10 09 08.07 06 05 04.03 02 01 00
--  0  0  0  0  0  0  0  0+---------- SDLBA2 -----+------- SDLBA1 --------+------- SDLBA0 --------+
--
-- The end result of all this is that the addressing looks the same for SDSC and SDHC cards.
--
-- SDSTATUS (RO)
--    b7     Write Data Byte can be accepted
--    b6     Read Data Byte available
--    b5     Block Busy
--    b4     Init Busy
--    b3     Unused. Read 0
--    b2     Unused. Read 0
--    b1     Unused. Read 0
--    b0     Unused. Read 0
--
-- SDCONTROL (WO)
--    b7:0   0x00 Read block
--           0x01 Write block
--
-- To read a 512-byte block from the SDCARD:
-- Wait until SDSTATUS=0x80 (ensures previous cmd has completed)
-- Write SDLBA0, SDLBA1 SDLBA2 to select block index to read from
-- Write 0 to SDCONTROL to issue read command
-- Loop 512 times:
--     Wait until SDSTATUS=0xE0 (read byte ready, block busy)
--     Read byte from SDDATA
--
-- To write a 512-byte block to the SDCARD:
-- Wait until SDSTATUS=0x80 (ensures previous cmd has completed)
-- Write SDLBA0, SDLBA1 SDLBA2 to select block index to write to
-- Write 1 to SDCONTROL to issue write command
-- Loop 512 times:
--     Wait until SDSTATUS=0xA0 (block busy)
--     Write byte to SDDATA
--
-- At HW level each data transfer is 515 bytes: a start byte, 512 data bytes,
-- 2 CRC bytes. CRC need not be valid in SPI mode, *except* for CMD0.
--
-- SDCARD specification can be downloaded from
-- https://www.sdcard.org/downloads/pls/
-- All you need is the "Part 1 Physical Layer Simplified Specification"
--
-- FAT Filesystem
--		https://www.win.tue.nl/~aeb/linux/fs/fat/fat.html

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity sd_controller is
generic (
        constant CLKEDGE_DIVIDER : integer := 50  -- 50MHz / 50 gives edges at 1MHz ie output
                                                  -- sdSCLK of 500kHz.
);
port (
	-- CPU
	n_reset : in std_logic;
	n_rd : in std_logic;
	n_wr : in std_logic;
	dataIn : in std_logic_vector(7 downto 0);
	dataOut : out std_logic_vector(7 downto 0);
	regAddr : in std_logic_vector(2 downto 0);
	clk : in std_logic;
	-- SD Card SPI connections
	sdCS : out std_logic;
	sdMOSI : out std_logic;
	sdMISO : in std_logic;
	sdSCLK : out std_logic;
	-- LEDs
	driveLED : out std_logic := '1'
);

end sd_controller;

architecture rtl of sd_controller is
type states is (
	rst,
	init,
	cmd0,
	cmd8,
	cmd55,
	acmd41,
	poll_cmd,
	cmd58,
	cardsel,
	idle,	-- wait for read or write pulse
	read_block_cmd,
	read_block_wait,
	read_block_data,
	send_cmd,
	send_regreq,
	receive_ocr_wait,
	receive_byte_wait,
	receive_byte,
	write_block_cmd,
	write_block_init,		-- initialise write command
	write_block_data,		-- loop through all data bytes
	write_block_byte,		-- send one byte
	write_block_wait		-- wait until not busy
);


-- one start byte, plus 512 bytes of data, plus two ff end bytes (crc)
constant write_data_size : integer := 515;


signal state, return_state : states;
signal sclk_sig : std_logic := '0';
signal cmd_out : std_logic_vector(55 downto 0);
-- at different times holds 8-bit data, 8-bit R1 response or 40-bit R7 response
signal recv_data : std_logic_vector(39 downto 0);

signal clkCount : std_logic_vector(5 downto 0);
signal clkEn : std_logic;
signal status : std_logic_vector(7 downto 0) := x"00";

signal block_read : std_logic := '0';
signal block_write : std_logic := '0';
signal block_start_ack : std_logic := '0';

signal cmd_mode : std_logic := '1';
signal response_mode : std_logic := '1';
signal data_sig : std_logic_vector(7 downto 0) := x"00";
signal din_latched : std_logic_vector(7 downto 0) := x"00";
signal dout : std_logic_vector(7 downto 0) := x"00";

signal sdhc : std_logic := '0';

signal sd_read_flag : std_logic := '0';
signal host_read_flag : std_logic := '0';

signal sd_write_flag : std_logic := '0';
signal host_write_flag : std_logic := '0';

signal init_busy : std_logic := '1';
signal block_busy : std_logic := '0';

signal address: std_logic_vector(31 downto 0) :=x"00000000";

signal led_on_count : integer range 0 to 200;

begin
	clock_enable: process(clk)
	begin
		if rising_edge(clk) then
			if clkCount < (CLKEDGE_DIVIDER - 1) then
				clkCount <= clkCount + 1;
			else
				clkCount <= (others=>'0');
			end if;
		end if;
	end process;

	clkEn <= '1' when clkCount = 0 else '0';

	wr_adrs_reg: process(n_wr)
	begin
	-- sdsc address 0..8 (first 9 bits) always zero because each sector is 512 bytes
		if rising_edge(n_wr) then
			if sdhc = '0' then	-- SDSC card
				if regAddr = "010" then
					address(16 downto 9) <= dataIn;
				elsif regAddr = "011" then
					address(24 downto 17) <= dataIn;
				elsif regAddr = "100" then
					address(31 downto 25) <= dataIn(6 downto 0);
				end if;
			else	-- SDHC card
			-- SDHC address is the 512 bytes block address. starts at bit 0
				if regAddr = "010" then
					address(7 downto 0) <= dataIn;	-- 128 k
				elsif regAddr = "011" then
					address(15 downto 8) <= dataIn;	-- 32 M
				elsif regAddr = "100" then
					address(23 downto 16) <= dataIn;	-- addresses upto 8 G
				end if;
			end if;
		end if;
	end process;

        -- output data is MUXed externally based on CS so only need to
        -- drive 0 by default if dataOut is being ORed externally
	dataOut <= dout   when regAddr = "000" else
		   status when regAddr = "001" else
		   x"00";

	wr_dat_reg: process(n_wr)
	begin
		if rising_edge(n_wr) then
			if (regAddr = "000") and (sd_write_flag = host_write_flag) then
				din_latched <= dataIn;
				host_write_flag <= not host_write_flag;
			end if;
		end if;
	end process;

	rd_dat_reg: process(n_rd)
	begin
		if rising_edge(n_rd) then
			if (regAddr = "000") and (sd_read_flag /= host_read_flag) then
				host_read_flag <= not host_read_flag;
			end if;
		end if;
	end process;

	wr_cmd_reg: process(n_wr, block_start_ack,init_busy)
	begin
		if init_busy='1' or block_start_ack='1' then
			block_read <= '0';
			block_write <= '0';
		elsif rising_edge(n_wr) then
			if regAddr = "001" and dataIn = "00000000" then
				block_read <= '1';
			end if;
			if regAddr = "001" and dataIn = "00000001" then
				block_write <= '1';
			end if;
		end if;
	end process;

	fsm: process(clk, clkEn, n_reset)
		variable byte_counter : integer range 0 to write_data_size;
		variable bit_counter : integer range 0 to 160;
	begin
		if (n_reset='0') then
			state <= rst;
			sclk_sig <= '0';
			sdCS <= '1';
		elsif rising_edge(clk) and clkEn = '1' then

			case state is

				when rst =>
					sd_read_flag <= host_read_flag;
					sd_write_flag <= host_write_flag;
					sclk_sig <= '0';
					cmd_out <= (others => '1');
					byte_counter := 0;
					cmd_mode <= '1';	-- 0=data, 1=command
					response_mode <= '1';	-- 0=data, 1=command
					bit_counter := 160;
					sdCS <= '1';
					state <= init;
					init_busy <= '1';
					block_start_ack <= '0';

				when init =>		-- cs=1, send 80 clocks, cs=0
					if (bit_counter = 0) then
						sdCS <= '0';
						state <= cmd0;
					else
						bit_counter := bit_counter - 1;
						sclk_sig <= not sclk_sig;
					end if;

				when cmd0 =>
					cmd_out <= x"ff400000000095";	-- GO_IDLE_STATE here, Select SPI
					bit_counter := 55;
					return_state <= cmd8;
					state <= send_cmd;

				when cmd8 =>
					cmd_out <= x"ff48000001aa87";	-- SEND_IF_COND
					bit_counter := 55;
					return_state <= cmd55;
					state <= send_regreq;

				-- cmd55 is the "prefix" command for ACMDs
				when cmd55 =>
					cmd_out <= x"ff770000000001";	-- APP_CMD
					bit_counter := 55;
					return_state <= acmd41;
					state <= send_cmd;

				when acmd41 =>
					cmd_out <= x"ff694000000077";	-- SD_SEND_OP_COND
					bit_counter := 55;
					return_state <= poll_cmd;
					state <= send_cmd;

				when poll_cmd =>
					if (recv_data(0) = '0') then
						state <= cmd58;
					else
						-- still busy; go round and do it again
						state <= cmd55;
					end if;

				when cmd58 =>
					cmd_out <= x"ff7a00000000fd";	-- READ_OCR
					bit_counter := 55;
					return_state <= cardsel;
					state <= send_regreq;

				when cardsel =>
					if (recv_data(31) = '0' ) then	-- power up not completed
						state <= cmd58;
					else
						sdhc <= recv_data(30);	-- CCS bit - autodetects the card type SDSC/SDHC
						state <= idle;
					end if;

				when idle =>
					sd_read_flag <= host_read_flag;
					sd_write_flag <= host_write_flag;
					sclk_sig <= '0';
					cmd_out <= (others => '1');
					data_sig <= (others => '1');
					byte_counter := 0;
					cmd_mode <= '1';	-- 0=data, 1=command
					response_mode <= '1';	-- 0=data, 1=command

					block_busy <= '0';
					init_busy <= '0';
					dout <= (others => '0');

					if (block_read = '1') then
						state <= read_block_cmd;
						block_start_ack <= '1';
					elsif (block_write='1') then
						state <= write_block_cmd;
						block_start_ack <= '1';
					else
						state <= idle;
					end if;

				when read_block_cmd =>
					block_busy <= '1';
					block_start_ack <= '0';
					cmd_out <= x"ff" & x"51" & address & x"ff";     -- CMD17 read single block
					bit_counter := 55;
					return_state <= read_block_wait;
					state <= send_cmd;

				-- wait until data token read (= 11111110)
				when read_block_wait =>
					if (sclk_sig='0' and sdMISO='0') then
						state <= receive_byte;
						byte_counter := 513; -- data plus crc
						bit_counter := 8; -- ???????????????????????????????
						return_state <= read_block_data;
					end if;
					sclk_sig <= not sclk_sig;

				when read_block_data =>
					if (byte_counter = 1) then -- crc byte 1 - ignore
						byte_counter := byte_counter - 1;
						return_state <= read_block_data;
						bit_counter := 7;
						state <= receive_byte;
					elsif (byte_counter = 0) then -- crc byte 2 - ignore
						bit_counter := 7;
						return_state <= idle;
						state <= receive_byte;
					elsif (sd_read_flag /= host_read_flag) then
						state <= read_block_data; -- stay here until previous byte read
					else
						byte_counter := byte_counter - 1;
						return_state <= read_block_data;
						bit_counter := 7;
						state <= receive_byte;
					end if;

				when send_cmd =>
					if (sclk_sig = '1') then	-- sending command
						if (bit_counter = 0) then	-- command sent
							state <= receive_byte_wait;
						else
							bit_counter := bit_counter - 1;
							cmd_out <= cmd_out(54 downto 0) & '1';
						end if;
					end if;
					sclk_sig <= not sclk_sig;

				when send_regreq =>
					if (sclk_sig = '1') then	-- sending command
						if (bit_counter = 0) then	-- command sent
							state <= receive_ocr_wait;
						else
							bit_counter := bit_counter - 1;
							cmd_out <= cmd_out(54 downto 0) & '1';
						end if;
					end if;
					sclk_sig <= not sclk_sig;

				when receive_ocr_wait =>
					if (sclk_sig = '0') then
						if (sdMISO = '0') then	-- wait for zero bit
							recv_data <= (others => '0');
							bit_counter := 38;	-- already read bit 39
							state <= receive_byte;
						end if;
					end if;
					sclk_sig <= not sclk_sig;

				when receive_byte_wait =>
					if (sclk_sig = '0') then
						if (sdMISO = '0') then	-- wait for start bit
							recv_data <= (others => '0');
							if (response_mode='0') then	-- data mode
								bit_counter := 3;	-- already read bits 7..4
							else	-- command mode
								bit_counter := 6;	-- already read bit 7 (start bit)
							end if;
							state <= receive_byte;
						end if;
					end if;
					sclk_sig <= not sclk_sig;

				-- read 8-bit data or 8-bit R1 response or 40-bit R7 response
				when receive_byte =>
					if (sclk_sig = '0') then
						recv_data <= recv_data(38 downto 0) & sdMISO;	-- read next bit
						if (bit_counter = 0) then
							state <= return_state;
							-- if real data received then flag it (byte counter = 0 for both crc bytes)
							if return_state= read_block_data and byte_counter > 0 then
								sd_read_flag <= not sd_read_flag;
								dout <= recv_data(7 downto 0);
							end if;
						else
							bit_counter := bit_counter - 1;
						end if;
					end if;
					sclk_sig <= not sclk_sig;

				when write_block_cmd =>
					block_busy <= '1';
					block_start_ack <= '0';
					cmd_mode <= '1';
					cmd_out <= x"ff" & x"58" & address & x"ff";	-- CMD24 write single block
					bit_counter := 55;
					return_state <= write_block_init;
					state <= send_cmd;

				when write_block_init =>
					cmd_mode <= '0';
					byte_counter := write_data_size;
					state <= write_block_data;

				when write_block_data =>
					if byte_counter = 0 then
						state <= receive_byte_wait;
						return_state <= write_block_wait;
						response_mode <= '0';
					else
						if ((byte_counter = 2) or (byte_counter = 1)) then
							data_sig <= x"ff"; -- two crc bytes
							bit_counter := 7;
							state <= write_block_byte;
							byte_counter := byte_counter - 1;
						elsif byte_counter = write_data_size then
							data_sig <= x"fe"; -- start byte, single block
							bit_counter := 7;
							state <= write_block_byte;
							byte_counter := byte_counter - 1;
						elsif host_write_flag /= sd_write_flag then -- only send if flag set
							data_sig <= din_latched;
							bit_counter := 7;
							state <= write_block_byte;
							byte_counter := byte_counter - 1;
							sd_write_flag <= not sd_write_flag;
						end if;
					end if;

				when write_block_byte =>
					if (sclk_sig = '1') then
						if bit_counter=0 then
							state <= write_block_data;
						else
							data_sig <= data_sig(6 downto 0) & '1';
							bit_counter := bit_counter - 1;
						end if;
					end if;
					sclk_sig <= not sclk_sig;

				when write_block_wait =>
					cmd_mode <= '1';
					response_mode <= '1';
					if sclk_sig='0' then
						if sdMISO='1' then
							state <= idle;
						end if;
					end if;
					sclk_sig <= not sclk_sig;

				when others =>
					state <= idle;
			end case;
		end if;
	end process;

	sdSCLK <= sclk_sig;
	sdMOSI <= cmd_out(55) when cmd_mode='1' else data_sig(7);

	status(7) <= '1' when host_write_flag=sd_write_flag else '0'; -- tx byte empty when equal
	status(6) <= '0' when host_read_flag=sd_read_flag else '1'; -- rx byte ready when not equal
	status(5) <= block_busy;
	status(4) <= init_busy;

	-- Make sure the drive LED is on for a visible amount of time
	ctl_led: process (clk, block_busy,init_busy)
	begin
		if block_busy='1' or init_busy = '1' then
			led_on_count <= 200; -- ensure on for at least 200ms (assuming 1MHz clk)
			driveLED <= '0';
		elsif (rising_edge(clk)) then
			if led_on_count>0 then
				led_on_count <= led_on_count-1;
				driveLED <= '0';
			else
				driveLED <= '1';
			end if;
		end if;
	end process;

end rtl;
