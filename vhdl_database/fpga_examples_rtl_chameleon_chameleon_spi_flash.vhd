-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2013 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/chameleon.html
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- Read data from SPI boot flash
-- The Chaco tool can upload additional binary data (.bin file) after
-- the actual FPGA core (.rbf file). This entity can be used to read
-- this extra data from the flash. For this it needs the "slot" where
-- the core is started. This is obtained from the USB microcontroller
-- (use the chameleon_usb).
-- Additionally a flash_offset and amount can be given to only
-- read selected parts of the data.
--
-- On a start trigger pulse it will read the first 3 bytes in the given
-- slot to obtain the location of the data. Then it adds the flash_offset
-- to that value and reads "amount" of data. The data is given on the "q"
-- output together with a address count on "a". The start value of the
-- "a" address can be set with the input on "start_addr".
--
-- Make sure that the start trigger is given after the chameleon_usb entity
-- has had time to read the slot number. There is a valid signal output
-- on that entity to check this. Otherwise it will still read data, but
-- from the wrong slot.
--
-- -----------------------------------------------------------------------
-- clk          - system clock
-- slot         - slot number to use for reading data from the flash
-- start        - trigger to start reading the data. "slot" must be valid
-- start_addr   - start value of "a"
-- flash_offset - additional offset within the data
-- amount       - amount of bytes to read from flash
-- busy         - Becomes high one clock after start is given.
--                Stays high as long as reads are pending.
--                Can be used to halt or reset a soft CPU while it is
--                waiting for data from flash.
-- cs_n         - Chipselect for the flash. There is a 256 cycle delay
--                after a change of this signal to give the mux-multiplexer
--                time to transfer the signal and the flash time to initialize.
-- spi_req      - Toggles to request a SPI transfer of 8 bits.
-- spi_ack      - Acknowlege on the spi_req (should toggle when request is complete)
-- spi_d        - Byte to send over SPI bus
-- spi_q        - Byte received from SPI bus
-- req          - Toggles to request a byte write into memory
-- ack          - Acknowledge for req. It should toggle to current req's value when write is complete.
-- a            - Address counter to write consecutive bytes to memory
-- q            - Current byte to write to memory.
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_spi_flash is
	generic (
		a_bits : integer := 25
	);
	port (
		clk : in std_logic;
		slot : in unsigned(3 downto 0);
		start : in std_logic;
		
		start_addr : in unsigned((a_bits-1) downto 0);
		flash_offset : in unsigned(23 downto 0);
		amount : in unsigned(23 downto 0);

		busy : out std_logic;
		
		cs_n : out std_logic;
		spi_req : out std_logic;
		spi_ack : in std_logic;
		spi_d : out unsigned(7 downto 0);
		spi_q : in unsigned(7 downto 0);
		
		req : out std_logic;
		ack : in std_logic;
		a : out unsigned((a_bits-1) downto 0);
		q : out unsigned(7 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_spi_flash is
	type state_t is (STATE_IDLE,
		STATE_CS, STATE_CMD, STATE_AH, STATE_AM, STATE_AL, STATE_DUMMY,
		STATE_OFFSH, STATE_OFFSM, STATE_OFFSL, STATE_END, STATE_DATA, STATE_INC);
	signal state : state_t := STATE_IDLE;
	signal header : std_logic := '1'; -- 1=reading header, 0=reading data
	signal timer : unsigned(7 downto 0) := (others => '0');
	signal flash_a : unsigned(23 downto 0);

	signal cs_n_reg : std_logic := '1';
	signal spi_req_reg : std_logic := '0';

	signal req_reg : std_logic := '0';
	signal a_reg : unsigned(a'range);
	signal amount_cnt : unsigned(amount'range);
begin
	busy <= '0' when state = STATE_IDLE else '1';
	cs_n <= cs_n_reg;
	spi_req <= spi_req_reg;
	req <= req_reg;
	a <= a_reg;
	q <= spi_q;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if (timer = 0) and (spi_req_reg = spi_ack) and (req_reg = ack) then
				case state is
				when STATE_IDLE =>
					cs_n_reg <= '1';
				when STATE_CS =>
					cs_n_reg <= '0';
					timer <= (others => '1');
					state <= STATE_CMD;
				when STATE_CMD =>
					spi_d <= X"03"; -- Read command
					spi_req_reg <= not spi_req_reg;
					state <= STATE_AH;
				when STATE_AH =>
					spi_d <= flash_a(23 downto 16);
					spi_req_reg <= not spi_req_reg;
					state <= STATE_AM;
				when STATE_AM =>
					spi_d <= flash_a(15 downto 8);
					spi_req_reg <= not spi_req_reg;
					state <= STATE_AL;
				when STATE_AL =>
					spi_d <= flash_a(7 downto 0);
					spi_req_reg <= not spi_req_reg;
					state <= STATE_DUMMY;
				when STATE_DUMMY =>
					-- Dummy access to get first byte out of the flash
					spi_d <= (others => '1');
					spi_req_reg <= not spi_req_reg;
					if header = '0' then
						state <= STATE_DATA;
					else
						-- Read the offset of the data in the slot from the flash
						state <= STATE_OFFSH;
					end if;
				when STATE_OFFSH =>
					spi_d <= (others => '1');
					spi_req_reg <= not spi_req_reg;
					flash_a(19 downto 16) <= spi_q(3 downto 0);
					state <= STATE_OFFSM;
				when STATE_OFFSM =>
					spi_d <= (others => '1');
					spi_req_reg <= not spi_req_reg;
					flash_a(15 downto 8) <= spi_q;
					state <= STATE_OFFSL;
				when STATE_OFFSL =>
					flash_a(7 downto 0) <= spi_q;
					state <= STATE_END;
				when STATE_END =>
					flash_a <= flash_a + flash_offset;
					cs_n_reg <= '1';
					timer <= (others => '1');
					header <= '0';
					state <= STATE_CS;
				when STATE_DATA =>
					state <= STATE_IDLE;
					if amount_cnt /= 0 then
						req_reg <= not req_reg;
						amount_cnt <= amount_cnt - 1;
						state <= STATE_INC;
					end if;
				when STATE_INC =>
					spi_d <= (others => '1');
					spi_req_reg <= not spi_req_reg;
					a_reg <= a_reg + 1;
					state <= STATE_DATA;
				end case;
			else
				timer <= timer - 1;
			end if;

			if start = '1' then
				header <= '1';
				flash_a <= slot & X"00000";
				a_reg <= start_addr;
				amount_cnt <= amount;
				state <= STATE_CS;
			end if;
		end if;
	end process;

end architecture;
