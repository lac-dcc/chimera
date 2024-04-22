-- -----------------------------------------------------------------------
--
--                                 FPGA 64
--
--     A fully functional commodore 64 implementation in a single FPGA
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
-- -----------------------------------------------------------------------
--
-- fpga64_scandoubler.vhd
--
-- -----------------------------------------------------------------------
--
-- Converts 15.6 Khz PAL/NTSC screen to 31 Khz VGA screen by doubling
-- each scanline.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.all;

entity scandoubler is
	port (
		clk				: in    std_logic;
		hSyncPolarity	: in    std_logic := '0';
		vSyncPolarity	: in    std_logic := '0';
		enable_in		: in    std_logic;
		scanlines_in	: in    std_logic := '0';
		video_in			: in    std_logic_vector(7 downto 0);
		vsync_in			: in    std_logic;
		hsync_in			: in    std_logic;
		video_out		: out   std_logic_vector(7 downto 0);
		vsync_out		: out   std_logic;
		hsync_out		: out   std_logic
	);
end scandoubler;

architecture rtl of scandoubler is
	constant hSyncLength : integer := 63;
	constant lineLengthBits : integer := 11;

	component sd_ram
		PORT
		(
			clock				: IN   STD_LOGIC  := '1';
			data				: IN   STD_LOGIC_VECTOR (7 DOWNTO 0);
			rdaddress		: IN   STD_LOGIC_VECTOR (10 DOWNTO 0);
			wraddress		: IN   STD_LOGIC_VECTOR (10 DOWNTO 0);
			wren				: IN   STD_LOGIC  := '0';
			q					: OUT  STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;

	signal prescale		: unsigned(0 downto 0);
	signal impar			: std_logic;

	signal startIndex		: unsigned(10 downto 0) := (others => '0');
	signal endIndex		: unsigned(10 downto 0) := (others => '0');
	signal readIndex		: unsigned(10 downto 0) := (others => '0');
	signal writeIndex 	: unsigned(10 downto 0) := (others => '0');
	signal oldHSync		: std_logic             := '0';
	signal oldVSync		: std_logic             := '0';
	signal hSyncCount		: integer range 0 to hSyncLength;
	signal vSyncCount		: integer range 0 to 15;
	signal lineLength		: unsigned(lineLengthBits downto 0);
	signal lineLengthCnt	: unsigned((lineLengthBits+1) downto 0);
	signal nextLengthCnt	: unsigned((lineLengthBits+1) downto 0);

	signal ramD          : unsigned(7 downto 0);
	signal ramQ          : unsigned(7 downto 0);
	signal ramQReg       : unsigned(7 downto 0);
begin
	lineRam: sd_ram
		port map (
			clock       => clk,
			data        => std_logic_vector(ramD),
			rdaddress   => std_logic_vector(readIndex),
			wraddress   => std_logic_vector(writeIndex),
			wren        => '1',
			unsigned(q) => ramQ
		);

	ramD <= unsigned(video_in);
	nextLengthCnt <= lineLengthCnt + 1;
	
	process(clk)
	begin
		if rising_edge(clk) then
			prescale <= prescale + 1;
			lineLengthCnt <= nextLengthCnt;

			if prescale(0) = '0' and hsync_in = '1' then
				if enable_in = '1' then
					writeIndex <= writeIndex + 1;
				end if;
			end if;

			if hSyncCount /= 0 then
				hSyncCount <= hSyncCount - 1;
			end if;

			if hSyncCount = 0 then
				readIndex <= readIndex + 1;
			end if;

			if lineLengthCnt = lineLength then
				readIndex <= startIndex;
				hSyncCount <= hSyncLength;
				prescale <= (others => '0');
				impar <= '1';
			end if;

			oldHSync <= hsync_in;
			if (oldHSync = '1') and (hsync_in = '0') then
				-- Calculate length of the scanline/2
				-- The scandoubler adds a second sync half way to double the lines.
				lineLength <= lineLengthCnt((lineLengthBits+1) downto 1);
				lineLengthCnt <= to_unsigned(0, lineLengthBits+2);

				readIndex   <= endIndex;
				startIndex  <= endIndex;
				endIndex    <= writeIndex;
				hSyncCount  <= hSyncLength;
				prescale    <= (others => '0');
				impar			<= '0';

				oldVSync <= vsync_in;
				if (vsync_in = '1') and (oldVSync = '0') then
					vSyncCount <= 15;
				elsif vSyncCount /= 0 then
					vSyncCount <= vSyncCount - 1;
				end if;
			end if;
		end if;
	end process;

	-- Video out
	process(clk)
	begin
		if rising_edge(clk) then
			ramQReg   <= ramQ;
			video_out <= std_logic_vector(ramQReg);
			if vSyncCount /= 0 or (scanlines_in = '1' and impar = '1') then
				video_out <= (others => '0');
			end if;
		end if;
	end process;

	-- Horizontal sync
	process(clk)
	begin
		if rising_edge(clk) then
			hsync_out  <= not hSyncPolarity;
			if hSyncCount /= 0 then
				hsync_out <= hSyncPolarity;
			end if;
		end if;
	end process;

	-- Vertical sync
	process(clk)
	begin
		if rising_edge(clk) then
			vsync_out <= not vSyncPolarity;
			if (vSyncCount = 9) or (vSyncCount = 10) then
				vsync_out <= vSyncPolarity;
			end if;
		end if;
	end process;
end architecture;
