-------------------------------------------------------------------------------
-- Title      : MC613
-- Project    : PS2 Basic Protocol
-- Details    : www.ic.unicamp.br/~corte/mc613/
--							www.computer-engineering.org/ps2protocol/
-------------------------------------------------------------------------------
-- File       : ps2_base.vhd
-- Author     : Thiago Borges Abdnur
-- Company    : IC - UNICAMP
-- Last update: 2010/04/12
-------------------------------------------------------------------------------
-- Description: 
-- PS2 basic control
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ps2_iobase is
	port(
		enable_i		: in    std_logic;							-- Enable
		clock_i			: in    std_logic;							-- system clock
		reset_i			: in    std_logic;							-- Reset when '1'
		ps2_data_io		: inout std_logic;							-- PS2 data pin
		ps2_clk_io		: inout std_logic;							-- PS2 clock pin
		data_rdy_i		: in    std_logic;							-- Rise this to signal data is ready to be sent to device
		data_i			: in    std_logic_vector(7 downto 0);	-- Data to be sent to device
		data_rdy_o		: out   std_logic;							-- '1' when data from device has arrived
		data_o			: out   std_logic_vector(7 downto 0)	-- Data from device
	);
end;

architecture rtl of ps2_iobase is

	signal clk_syn_s			: std_logic;
	signal dat_syn_s			: std_logic;
	signal clk_nedge_s		: std_logic;
	signal timeout_q			: unsigned(15 downto 0)	:= X"0000";

	signal sdata_s				: std_logic_vector(7 downto 0);
	signal hdata_s				: std_logic_vector(7 downto 0);
	signal parchecked_s		: std_logic;
	signal sigsending_s		: std_logic;
	signal sigsendend_s		: std_logic;
	signal sigclkreleased	: std_logic;
	signal sigclkheld			: std_logic;

begin

	-- Synchronizing signals
	process (reset_i, clock_i)
		variable clk_sync_v : std_logic_vector(1 downto 0);
		variable dat_sync_v : std_logic_vector(1 downto 0);
	begin
		if reset_i = '1' then
			clk_sync_v := "00";
			dat_sync_v := "00";
		elsif rising_edge(clock_i) then
			clk_sync_v := clk_sync_v(0) & ps2_clk_io;
			dat_sync_v := dat_sync_v(0) & ps2_data_io;
		end if;
		clk_syn_s <= clk_sync_v(1);
		dat_syn_s <= dat_sync_v(1);
	end process;

	-- Detect edge
	process (reset_i, clock_i)
		variable edge_detect_v : std_logic_vector(15 downto 0);
	begin
		if reset_i = '1' then
			edge_detect_v	:= (others => '0');
		elsif rising_edge(clock_i) then
			edge_detect_v := edge_detect_v(14 downto 0) & clk_syn_s;
		end if;

		clk_nedge_s <= '0';
		if edge_detect_v = X"F000" then
			clk_nedge_s <= '1';
		end if;
	end process;

	-- Receive
	process (reset_i, sigsending_s, clock_i)
		variable count_v : integer range 0 to 11;
	begin
		if reset_i = '1' or sigsending_s = '1' then
			sdata_s			<= (others => '0');
			parchecked_s	<= '0';
			count_v			:= 0;
		elsif rising_edge(clock_i) then

			parchecked_s <= '0';

			if clk_nedge_s = '1' then

				timeout_q <= (others => '0');

				if count_v = 0 then
					-- Idle state, check for start bit (0) only and don't
					-- start counting bits until we get it
					if dat_syn_s = '0' then
						-- This is a start bit
						count_v := count_v + 1;
					end if;
				else
					-- Running.  8-bit data comes in LSb first followed by
					-- a single stop bit (1)
					if count_v < 9 then
						sdata_s(count_v - 1) <= dat_syn_s;
					end if;
					if count_v = 9 then
						if (not (sdata_s(0) xor sdata_s(1) xor sdata_s(2) xor sdata_s(3) xor sdata_s(4) xor sdata_s(5) xor sdata_s(6) xor sdata_s(7))) = dat_syn_s then
							parchecked_s <= '1';
						end if;
					end if;
					count_v := count_v + 1;
					if count_v = 11 then
						count_v := 0;
					end if;
				end if;
			else
				if count_v /= 0 then
					timeout_q <= timeout_q + 1;
					if timeout_q = X"FFFF" then
						count_v := 0;
					end if;
				end if;
			end if;
		end if;
	end process;

	data_rdy_o	<= enable_i and parchecked_s;
	data_o 		<= sdata_s;

	-- Edge triggered send register
	-- Host input data register
	process (sigsendend_s, reset_i, clock_i)
	begin
		if reset_i = '1' or sigsendend_s = '1' then
			sigsending_s	<= '0';
			hdata_s			<= (others => '0');
		elsif rising_edge(clock_i) then
			if data_rdy_i = '1' then
				sigsending_s	<= '1';
				hdata_s			<= data_i;
			end if;
		end if;
	end process;

	-- PS2 clock control
	process (enable_i, reset_i, sigsendend_s, clock_i)
		constant US100CNT	: integer := 3570 / 10;
		variable count_v	: integer range 0 to US100CNT + 101;
	begin
		if enable_i = '0' or reset_i = '1' or sigsendend_s = '1' then
			ps2_clk_io		<= 'Z';
			sigclkreleased	<= '1';
			sigclkheld		<= '0';
			count_v				:= 0;
		elsif rising_edge(clock_i) then
			if sigsending_s = '1' then
				if count_v < US100CNT + 50 then
					count_v        := count_v + 1;
					ps2_clk_io     <= '0';
					sigclkreleased <= '0';
					sigclkheld     <= '0';
				elsif count_v < US100CNT + 100 then
					count_v        := count_v + 1;
					ps2_clk_io     <= '0';
					sigclkreleased <= '0';
					sigclkheld     <= '1';
				else
					ps2_clk_io     <= 'Z';
					sigclkreleased <= '1';
					sigclkheld     <= '0';
				end if;
			end if;
		end if;
	end process;

	-- Sending control
	TOPS2:
	process (enable_i, reset_i, sigsending_s, sigclkheld, clock_i)
		variable count_v	: integer range 0 to 11;
	begin
		if enable_i = '0' or reset_i = '1' or sigsending_s = '0' then
			ps2_data_io		<= 'Z';
			sigsendend_s	<= '0';			
			count_v			:= 0;
		elsif sigclkheld = '1' then
			ps2_data_io		<= '0';
			sigsendend_s 	<= '0';
			count_v			:= 0;
		elsif rising_edge(clock_i) then

			if clk_nedge_s = '1' and sigclkreleased = '1' and sigsending_s = '1' then

				if count_v >= 0 and count_v < 8 then
					ps2_data_io		<= hdata_s(count_v);
					sigsendend_s	<= '0';
				end if;
				if count_v = 8 then
					ps2_data_io <= (not (hdata_s(0) xor hdata_s(1) xor hdata_s(2) xor hdata_s(3) xor hdata_s(4) xor hdata_s(5) xor hdata_s(6) xor hdata_s(7)));
					sigsendend_s  <= '0';
				end if;
				if count_v = 9 then
					ps2_data_io		<= 'Z';
					sigsendend_s	<= '0';
				end if;			
				if count_v = 10 then				
					ps2_data_io		<= 'Z';
					sigsendend_s	<= '1';
					count_v			:= 0;
				end if;
				count_v := count_v + 1;

			end if;
		end if;		
	end process;

end architecture;