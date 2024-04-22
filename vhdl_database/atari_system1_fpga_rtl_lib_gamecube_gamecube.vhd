--	(c) 2018 d18c7db(a)hotmail
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
----------------------------------------------------------------------------------
-- 1-wire bidirectional line, idle high
-- 0 bit = 3us low, 1us high
-- 1 bit = 1us low, 3us high
-- every sequence of bytes sent or received is followed by a 1 bit high idle
--	send 3 byte command x400302
-- receive 8 bytes as follows:
--	byte 0 : 0 0 0 Start Y    X      B       A
--	byte 1 : 1 L R Z     D-Up D-Down D-Right D-Left
--	byte 2 : Joy X
--	byte 3 : Joy Y
--	byte 4 : C-Stick X
--	byte 5 : C-Stick Y
--	byte 6 : Left Button
--	byte 7 : Right Button

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity gamecube is
	port (
		clk					: in  std_logic;
		reset					: in  std_logic;
		ready					: out std_logic;
		serio					: inout std_logic;

		but_S					: out std_logic;	-- button Start
		but_X					: out std_logic;	-- button X
		but_Y					: out std_logic;	-- button Y
		but_Z					: out std_logic;	-- button Z

		but_A					: out std_logic;	-- button A
		but_B					: out std_logic;	-- button B
		but_L					: out std_logic;	-- button Left
		but_R					: out std_logic;	-- button Right

		but_DU				: out std_logic;	-- button Dpad up
		but_DD				: out std_logic;	-- button Dpad down
		but_DL				: out std_logic;	-- button Dpad left
		but_DR				: out std_logic;	-- button Dpad right

		joy_X					: out std_logic_vector( 7 downto 0);	-- Joy X analog
		joy_Y					: out std_logic_vector( 7 downto 0);	-- Joy Y analog
		cst_X					: out std_logic_vector( 7 downto 0);	-- C-Stick X analog
		cst_Y					: out std_logic_vector( 7 downto 0);	-- C-Stick Y analog
		ana_L					: out std_logic_vector( 7 downto 0);	-- Left Button analog
		ana_R					: out std_logic_vector( 7 downto 0)		-- Right Button analog
	);
end gamecube;

architecture RTL of gamecube is
	type machine is (
		init, idle, cmd0, cmd1, recv_data
	);
	constant GC_POLL		: std_logic_vector(23 downto 0) := x"400302";
	signal state			: machine;
	signal rxshift			: std_logic_vector(15 downto 0) := (others=>'0');
	signal txshift			: std_logic_vector(15 downto 0) := (others=>'0');
	signal rx				: std_logic_vector(63 downto 0) := (others=>'0');
	signal rx_bit			: integer range 0 to  63 := 0;
	signal counter			: integer range 0 to 511 := 0;
	signal ckcnt			: integer range 0 to   7 := 0;
	signal txcount			: integer range 0 to  15 := 0;
	signal clken			: std_logic := '0';
	signal transmit		: std_logic := '0';
begin
	serio <= txshift(txcount) when transmit = '1' else 'Z';

	-- generate 4MHz clock enable from 28MHz clock
	process (clk)
	begin
		if rising_edge(clk) then
			if ckcnt = 6 then
				ckcnt <= 0;
				clken <= '1';
			else
				ckcnt <= ckcnt + 1;
				clken <= '0';
			end if;
		end if;
	end process;

	ready <= '1' when (state = idle) else '0';

	process(clk, reset)
	begin
		if (reset = '1') then
			transmit <= '0';
			counter	<= 0;
			state		<= init;
			rx			<= (others=>'0');

		elsif (rising_edge(clk)) then
			if (clken = '1') then
				-- shift in I/O
				rxshift <= rxshift(14 downto 0) & serio;

				case state is
					-------------------------------
					-- state machine initial state
					-------------------------------
					when init =>
						transmit		<= '0';
						counter		<= 511;	-- timeout value, 32 bit times
						rx_bit		<= 63;	-- bits to receive
						state			<= idle;

						but_S		<= rx(60);
						but_Y		<= rx(59);
						but_X		<= rx(58);
						but_B		<= rx(57);

						but_A		<= rx(56);
						but_L		<= rx(54);
						but_R		<= rx(53);
						but_Z		<= rx(52);

						but_DU	<= rx(51);
						but_DD	<= rx(50);
						but_DR	<= rx(49);
						but_DL	<= rx(48);

						joy_X		<= rx(47 downto 40);
						joy_Y		<= rx(39 downto 32);
						cst_X		<= rx(31 downto 24);
						cst_Y		<= rx(23 downto 16);
						ana_L		<= rx(15 downto  8);
						ana_R		<= rx( 7 downto  0);

					-------------------------------
					-- check that no other device is driving the I/O line by
					-- waiting for the line to be idle (high) for 32 bit times
					-- this also serves as a delay between consecutive probes
					-------------------------------
					when idle =>
						if serio = '0' then
							-- restart timeout counter if I/O line is active
							counter <= 511;
						else
							-- if time out, move to next state
							if counter = 0 then
								counter	<= 23;	-- number of command bits-1 to send
								txcount	<= 15;	-- number of clocks-1 per bit to transmit
								transmit <= '1';
								state		<= cmd0;
							else
								-- else count down
								counter <= counter - 1;
							end if;
						end if;

					-------------------------------
					-- send command
					-------------------------------
					when cmd0 =>
						if txcount = 0 then
							txcount <= 15;	-- number of clocks-1 per bit to transmit
							if counter = 0 then
								-- after we've sent 24 bits we're done
								state <= cmd1;
							else
								-- count down bits sent
								counter <= counter - 1;
							end if;
						else
							txcount <= txcount - 1;
						end if;

						if GC_POLL(counter) = '1' then
							--	'1' is 1us low followed by 3 us high
							txshift <= x"0FFF";
						else
							-- '0' is 3us low followed by 1 us high
							txshift <= x"000F";
						end if;

					-------------------------------
					-- after every command we must send a '1'
					-------------------------------
					when cmd1 =>
						txshift <= x"0FFF";
						if txcount = 0 then
							-- restart timeout counter
							counter <= 63;
							state <= recv_data;
							-- stop driving I/O line
							transmit <= '0';
						else
							txcount <= txcount - 1;
						end if;

					when recv_data =>
						if counter = 0 then
							-- if timed out and no transition received
							-- abort and restart state machine
							state <= init;
							rx		<= (others=>'0');
						else
							-- timeout count down
							counter <= counter - 1;

							-- if hi to lo transition
							if (rxshift(15 downto 14) = "10") then
								-- restart timeout counter
								counter <= 20;

								if rx_bit = 0 then
									-- if all bits received
									state <= init;
								else
									rx_bit	<= rx_bit - 1;
								end if;

								if    rxshift( 7 downto 0) = x"FF" then
									-- likely pattern is a '1'
									rx <= rx(rx'left-1 downto 0) & '1';
								elsif rxshift(14 downto 7) = x"00" then
									-- likely pattern is a '0'
									rx <= rx(rx'left-1 downto 0) & '0';
								else
									-- probably corrupt or unsynched
									state <= init;
									rx		<= (others=>'0');
								end if;
							end if;
						end if;

					when others =>
						state <= init;
				end case;
			end if;
		end if;
	end process;
end RTL;
