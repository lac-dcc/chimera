--	(c) 2012 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

--------------------------------------------------------------------------------
--	Bootstrap driver
--
--	This will read the contents of the SPI FLASH from address stored in constant
--	'user_address' and write them to the external SRAM starting at address 0
--	On completion, it will raise 'O_BS_DONE' which could be used as a reset signal
--	by the user
--------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity bootstrap is
	generic (
		user_address	: std_logic_vector(23 downto 0) := x"000000";
		user_length		: std_logic_vector(23 downto 0) := x"000002"
	);
	port (
		I_CLK				: in  std_logic;	-- clock
		I_RESET			: in  std_logic;	-- reset input

		-- FLASH interface
		I_FLASH_SO		: in  std_logic;
		O_FLASH_CK		: out std_logic;
		O_FLASH_CS		: out std_logic;
		O_FLASH_SI		: out std_logic;
		O_FLASH_WPn		: out std_logic;
		O_FLASH_HOLDn	: out std_logic;

		-- SRAM interface
		O_A				: out std_logic_vector (20 downto 0);
		O_DOUT			: out std_logic_vector (15 downto 0) := (others => '0');
		O_nCS				: out std_logic := '0';
		O_nWE				: out std_logic := '1';
		O_nOE				: out std_logic := '1';

		O_BHEn			: out std_logic := '1';
		O_BLEn			: out std_logic := '1';

		--
		O_BS_DONE		: out std_logic := '0'	-- low when FLASH is being copied to SRAM, can be used by user as active low reset
	);
end bootstrap;

architecture RTL of bootstrap is
	--
	-- bootstrap signals
	--
	signal flash_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal flash_init			: std_logic := '0';	-- when low places FLASH driver in init state
	signal flash_done			: std_logic := '0';	-- FLASH init finished when high

	signal bs_BHLEn			: std_logic_vector( 1 downto 0) := (others => '1');
	-- bootstrap control of SRAM, these signals connect to SRAM when boostrap_busy = '1'
	signal bs_A					: std_logic_vector(20 downto 0) := (others => '0');

	-- for bootstrap state machine
	type	BS_STATE_TYPE is (
				INIT, START_READ_FLASH, READ_FLASH,
				FLASH0, FLASH1, FLASH2, FLASH3, FLASH4, FLASH5, FLASH6, FLASH7, FLASH8,
				WAIT0, WAIT1, WAIT2, WAIT3, WAIT4, WAIT5, WAIT6, WAIT7, WAIT8
			);
	signal bs_state : BS_STATE_TYPE;

begin
	O_A		<= bs_A;
	O_BHEn	<= bs_BHLEn(1);
	O_BLEn	<= bs_BHLEn(0);

	-- FLASH chip SPI driver
	u_flash : entity work.spi_flash
	port map (
		O_FLASH_CK		=> O_FLASH_CK,	-- to FLASH chip SPI clock
		O_FLASH_CS		=> O_FLASH_CS,	-- to FLASH chip select
		O_FLASH_SI		=> O_FLASH_SI,	-- to FLASH chip SPI input
		O_FLASH_WPn		=> O_FLASH_WPn,
		O_FLASH_HOLDn	=> O_FLASH_HOLDn,
		O_FLASH_DONE	=> flash_done,
		O_FLASH_DATA	=> flash_data,

		I_FLASH_SO		=> I_FLASH_SO,	-- to FLASH chip SPI output
		I_FLASH_CLK		=> I_CLK,
		I_FLASH_INIT	=> flash_init,
		I_FLASH_ADDR	=> user_address
	);

	--	The bootstrap reads "byte wide" data from FLASH and writes them
	--	to "word wide" external SRAM according to this layout:
	--	FLASH        ->  SRAM
	--	D7..0   ADDR     D15..8 D7..0   ADDR
	--	  1A  -   0K     1L     1A     0K
	--	  1B  -  32K     1MN    1B    32K
	--	  2A  -  64K     2L     2A    64K
	--	  2B  -  96K     2MN    2B    96K
	--	  7B  - 128K     7A     7B   128K
	--	  9B  - 160K     9A     9B   160K
	--	  10B - 192K     10A    10B  176K
	--	  16S - 208K     16R    16S  208K
	--                              240K
	--	  1L  - 240K
	--	  1MN - 272K
	--	  2L  - 304K
	--	  2MN - 336K
	--	  7A  - 368K
	--	  9A  - 400K
	--	  10A - 432K
	--	  16R - 448K
	--         464K

	state_bootstrap : process(I_CLK, I_RESET)
	begin
		if I_RESET = '1' then							-- external reset pin
			bs_state <= INIT;								-- move state machine to INIT state
			bs_BHLEn <= "11";								-- reset disables both byte lanes
		elsif rising_edge(I_CLK) then
			case bs_state is
				when INIT =>
					bs_BHLEn <= bs_BHLEn - 1;			-- select byte lane 00=both, 01=high, 10=low, 11=none
					O_BS_DONE <= '0';						-- indicate bootstrap in progress (holds user in reset)
					flash_init <= '0';					-- signal FLASH to begin init
					bs_A   <= (others => '1');			-- SRAM address all ones (becomes zero on first increment)
					O_nCS <= '0';							-- SRAM always selected during bootstrap
					O_nOE <= '1';							-- SRAM output disabled during bootstrap
					O_nWE <= '1';							-- SRAM write enable inactive default state
					bs_state <= START_READ_FLASH;
				when START_READ_FLASH =>
					flash_init <= '1';					-- allow FLASH to exit init state
					if flash_done = '0' then			-- wait for FLASH init to begin
						bs_state <= READ_FLASH;
					end if;
				when READ_FLASH =>
					if flash_done = '1' then			-- wait for FLASH init to complete
						bs_state <= WAIT0;
					end if;

				when WAIT0 =>								-- wait for the first FLASH byte to be available
					bs_state <= WAIT1;
				when WAIT1 =>
					bs_state <= WAIT2;
				when WAIT2 =>
					bs_state <= WAIT3;
				when WAIT3 =>
					bs_state <= WAIT4;
				when WAIT4 =>
					bs_state <= WAIT5;
				when WAIT5 =>
					bs_state <= WAIT6;
				when WAIT6 =>
					bs_state <= WAIT7;
				when WAIT7 =>
					bs_state <= WAIT8;
				when WAIT8 =>
					bs_state <= FLASH0;

				-- every 8 clock cycles we have a new byte from FLASH
				-- use this ample time to write it to SRAM, we just have to toggle nWE
				when FLASH0 =>
					bs_A <= bs_A + 1;						-- increment SRAM address
					bs_state <= FLASH1;					-- idle
				when FLASH1 =>
					if bs_BHLEn(1) = '0' then O_DOUT(15 downto 8) <= flash_data; else O_DOUT(15 downto 8) <= (others => 'Z'); end if;	-- place byte on hi SRAM data bus
					if bs_BHLEn(0) = '0' then O_DOUT( 7 downto 0) <= flash_data; else O_DOUT( 7 downto 0) <= (others => 'Z'); end if;	-- place byte on lo  SRAM data bus
					bs_state <= FLASH2;					-- idle
				when FLASH2 =>
					O_nWE <= '0';							-- SRAM write enable
					bs_state <= FLASH3;
				when FLASH3 =>
					bs_state <= FLASH4;					-- idle
				when FLASH4 =>
					bs_state <= FLASH5;					-- idle
				when FLASH5 =>
					bs_state <= FLASH6;					-- idle
				when FLASH6 =>
					O_nWE <= '1';							-- SRAM write disable
					bs_state <= FLASH7;
				when FLASH7 =>
					if bs_A = user_length - 1 then	-- when we've reached end address
						if bs_BHLEn = "01" then			--	and we've written both byte lanes
							O_BS_DONE <= '1';				-- indicate bootstrap is done
							bs_state <= FLASH8;			-- remain in this state until reset
						else
							bs_A   <= (others => '1');	-- SRAM address all ones (becomes zero on first increment)
							bs_BHLEn <= bs_BHLEn - 1;	-- select next byte lane 00=both, 01=high, 10=low, 11=none
							bs_state <= FLASH0;			-- go write the next byte lane
						end if;
					else
						bs_state <= FLASH0;				-- else loop back
					end if;
				when FLASH8 =>
					flash_init <= '0';					-- place FLASH in init state
					O_BS_DONE <= '1';						-- indicate bootstrap is done
					bs_BHLEn <= "11";						-- disable byte lanes
					O_nCS <= '1';							-- deselect chip
					O_nOE <= '1';							-- disable output
					O_nWE <= '1';							-- disable write
				when others =>	null;						-- catch all, never reached
			end case;
		end if;
	end process;
end RTL;
