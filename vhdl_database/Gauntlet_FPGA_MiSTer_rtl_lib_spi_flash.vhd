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
-- FLASH SPI driver
-- Inputs:
--   I_FLASH_SO		FLASH chip serial output pin
--   I_FLASH_CLK		driver clock
--   I_FLASH_INIT		active high to init FLASH address and read one byte
--   I_FLASH_ADDR		FLASH address to read byte from
-- Outputs:
--   O_FLASH_CK		FLASH chip clock pin
--   O_FLASH_CS		FLASH chip select active low
--   O_FLASH_SI		FLASH chip serial input pin
--   O_FLASH_WPn		FLASH write enabled input
--   O_FLASH_HOLDn	FLASH hold

--   O_FLASH_DATA		byte read from FLASH chip
--   O_FLASH_DONE		active high to indicate read of first byte complete
--							after this, a new byte is available every 8 clock cycles
--
-- A flash cycle consists of sending out the high speed read command 0x0B
-- followed by a 24 bit address, an 8 bit dummy byte then reading a byte
-- from the FLASH.
--
-- You could then maintain chip select active and continue to clock the
-- FLASH and keep reading bytes from it, as it auto increments the address,
-- or end the cycle by deactivating chip select and a whole new read cycle
-- must be started again
--
-- Data is clocked out from the FPGA and FLASH on falling clock edge
-- Data is latched into the FPGA and FLASH on rising clock edge.
--------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.vcomponents.all;

entity spi_flash is
	port (
		O_FLASH_CK		: out std_logic;
		O_FLASH_CS		: out std_logic;
		O_FLASH_SI		: out std_logic;
		O_FLASH_WPn		: out std_logic;
		O_FLASH_HOLDn	: out std_logic;
		O_FLASH_DONE	: out std_logic := '1';
		O_FLASH_DATA	: out std_logic_vector ( 7 downto 0) := (others => '0');
		I_FLASH_SO		: in  std_logic := '0';
		I_FLASH_CLK		: in  std_logic := '0';
		I_FLASH_INIT	: in  std_logic := '0';
		I_FLASH_ADDR	: in  std_logic_vector (23 downto 0) := (others => '0')
	);
end spi_flash;

architecture RTL of spi_flash is
	signal shift		: std_logic_vector(7 downto 0) := (others => '0');
	signal shift_in	: std_logic_vector(7 downto 0) := (others => '0');
	signal counter		: std_logic_vector(2 downto 0) := (others => '0');
	signal spi_ck_en	: std_logic := '0';
	signal flash_ck_p : std_logic := '1';
	signal flash_ck_n : std_logic := '1';
	type   SPI_STATE_TYPE is (IDLE, START, TX_CMD, TX_AH, TX_AM, TX_AL, TX_DUMMY1, RX_DATA);
	signal spi_state, next_spi_state : SPI_STATE_TYPE;

begin
	flash_ck_p <=     I_FLASH_CLK;
	flash_ck_n <= not I_FLASH_CLK;

	ODDR2_inst : ODDR2 generic map(DDR_ALIGNMENT=>"NONE", INIT=>'0', SRTYPE=>"SYNC")
		port map (Q=>O_FLASH_CK, C0=>flash_ck_p, C1=>flash_ck_n, CE=>spi_ck_en, D0=>'1', D1=>'0', R=>'0', S=>'0');

	O_FLASH_SI <= shift(7);									-- MSB output to spi

	-- advance state machine from state to state
	p_run_sm : process (I_FLASH_CLK, I_FLASH_INIT)
	begin
		if (I_FLASH_INIT = '0') then
			spi_state <= IDLE;								-- Initial state
		elsif rising_edge(I_FLASH_CLK) then
			spi_state <= next_spi_state;					-- next state
		end if;
	end process;

	-- state machine clocks data out to FLASH on falling clock edge
	process(I_FLASH_CLK)
	begin
		if falling_edge(I_FLASH_CLK) then
			case spi_state is
				when IDLE =>												-- idle state
					O_FLASH_DONE  <= '1';								-- FLASH comms done
					O_FLASH_CS    <= '1';								-- CS disabled
					O_FLASH_WPn	  <= '1';								-- write disabled
					O_FLASH_HOLDn <= '1';								-- hold disabled
					spi_ck_en <= '0';										-- Stop clock to FLASH
					next_spi_state <= START;							-- select next state
				when START =>												-- start state
					O_FLASH_DONE  <= '0';								-- FLASH comms not done
					O_FLASH_CS    <= '0';								-- Select FLASH
					O_FLASH_WPn	  <= '1';								-- write enabled
					O_FLASH_HOLDn <= '1';								-- hold deactivated
					shift <= x"0B";										-- High Speed Read command
					spi_ck_en <= '1';										-- enable FLASH clock
					counter <= "000";										-- reset counter
					next_spi_state <= TX_CMD;							-- select next state
				when TX_CMD =>												-- sends 8 bit command
					counter <= counter + 1;								-- count to next bit
					shift <= shift(6 downto 0) & '1';				-- shift other bits left
					if counter = "111" then
						shift <= I_FLASH_ADDR(23 downto 16);		-- load high address to shifter
						next_spi_state <= TX_AH;						-- select next state
					end if;
				when TX_AH =>												-- sends high address bits 23-16
					counter <= counter + 1;								-- count to next bit
					shift <= shift(6 downto 0) & '1';				-- shift other bits left
					if counter = "111" then
						shift <= I_FLASH_ADDR(15 downto 8);			-- load middle address to shifter
						next_spi_state <= TX_AM;						-- select next state
					end if;
				when TX_AM =>												-- sends middle address bits 15-8
					counter <= counter + 1;								-- count to next bit
					shift <= shift(6 downto 0) & '1';				-- shift other bits left
					if counter = "111" then
						shift <= I_FLASH_ADDR(7 downto 0);			-- load low address to shifter
						next_spi_state <= TX_AL;						-- select next state
					end if;
				when TX_AL =>												-- sends low address bits 7-0
					counter <= counter + 1;								-- count to next bit
					shift <= shift(6 downto 0) & '1';				-- shift other bits left
					if counter = "111" then
						shift <= x"ff";									-- load dummy to shifter
						next_spi_state <= TX_DUMMY1;					-- select next state
					end if;
				when TX_DUMMY1 =>											-- sends dummy byte
					counter <= counter + 1;								-- count to next bit
					shift <= shift(6 downto 0) & '1';				-- shift other bits left
					if counter = "111" then
						shift <= x"ff";									-- load dummy to shifter
						O_FLASH_DONE <= '1';								-- FLASH init done
						next_spi_state <= RX_DATA;						-- select next state
					end if;
				when RX_DATA =>											-- reads byte from FLASH
					counter <= counter + 1;								-- count to next bit
					shift_in <= shift_in(6 downto 0) & I_FLASH_SO;	-- shift other bits left
					if counter = "000" then
						O_FLASH_DATA <= shift_in;						-- move byte to data bus
						next_spi_state <= RX_DATA;						-- stay in this state indefinitely
					end if;
				when others =>												-- default
					next_spi_state <= IDLE;
			end case;
		end if;
	end process;

end RTL;
