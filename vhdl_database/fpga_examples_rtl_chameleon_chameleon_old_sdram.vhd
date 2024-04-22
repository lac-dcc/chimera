-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2014 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com
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
-- SDRAM controller
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_sdram is
	generic (
		-- SDRAM cols/rows  8/12 = 8 Mbyte, 9/12 = 16 Mbyte, 9/13 = 32 Mbyte
		colAddrBits : integer := 9;
		rowAddrBits : integer := 12;
		
		-- Port settings
		enable_cpu6510_port : boolean := false;
		enable_cache1_port : boolean := false;
		enable_cache2_port : boolean := false;
		enable_vid0_port : boolean := false;
		enable_vid1_port : boolean := false;

		-- Controller settings
		initTimeout : integer := 10000;
		readAutoPrecharge : boolean := true;
	-- SDRAM timing
		casLatency : integer := 3;
		ras_cycles : integer := 2;
		precharge_cycles : integer := 2;
		t_refresh_ms  : real := 64.0;
		t_refresh_ns : real := 60.0;
		t_clk_ns  : real := 10.0       -- Clock cycle time
	);
	port (
-- System
		clk : in std_logic;

		reserve : in std_logic := '0';
		delay_refresh : in std_logic := '0';

-- SDRAM interface
		sd_data : inout unsigned(15 downto 0);
		sd_addr : out unsigned((rowAddrBits-1) downto 0);
		sd_we_n : out std_logic;
		sd_ras_n : out std_logic;
		sd_cas_n : out std_logic;
		sd_ba_0 : out std_logic;
		sd_ba_1 : out std_logic;
		sd_ldqm : out std_logic;
		sd_udqm : out std_logic;

-- first cache port
		cache_req : in std_logic := '0';
		cache_ack : out std_logic;
		cache_we : in std_logic := '0';
		cache_burst : in std_logic := '0';
		cache_a : in unsigned((colAddrBits+rowAddrBits+2) downto 0) := (others => '0');
		cache_d : in unsigned(63 downto 0) := (others => '0');
		cache_q : out unsigned(63 downto 0);

-- second cache port
		cache2_req : in std_logic := '0';
		cache2_ack : out std_logic;
		cache2_we : in std_logic := '0';
		cache2_burst : in std_logic := '0';
		cache2_a : in unsigned((colAddrBits+rowAddrBits+2) downto 0) := (others => '0');
		cache2_d : in unsigned(63 downto 0) := (others => '0');
		cache2_q : out unsigned(63 downto 0);

-- VGA Video read ports
		vid0_req : in std_logic := '0'; -- Toggle for request
		vid0_ack : out std_logic; -- Ack follows req when done
		vid0_addr : unsigned((colAddrBits+rowAddrBits+2) downto 3) := (others => '0');
		vid0_do : out unsigned(63 downto 0);

		vid1_req : in std_logic := '0'; -- Toggle for request
		vid1_ack : out std_logic; -- Ack follows req when done
		vid1_addr : unsigned((colAddrBits+rowAddrBits+2) downto 3) := (others => '0');
		vid1_do : out unsigned(63 downto 0);

-- 6510 port (8 bit port)
		cpu6510_req : in std_logic := '0'; -- toggle to start memory request
		cpu6510_ack : out std_logic; -- will follow 'request' after transfer
		cpu6510_we : in std_logic := '0'; -- 1 write action, 0 read action
		cpu6510_a : in unsigned((colAddrBits+rowAddrBits+2) downto 0) := (others => '0');
		cpu6510_d : in unsigned(7 downto 0) := (others => '0');
		cpu6510_q : out unsigned(7 downto 0);

-- Debug ports
		debugIdle : out std_logic;  -- '1' memory is idle
		debugRefresh : out std_logic -- '1' memory is being refreshed
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_sdram is
	constant refresh_clocks : integer := integer((t_refresh_ns / t_clk_ns) + 0.5);
	constant refresh_interval : integer := integer((t_refresh_ms*1000000.0) / (t_clk_ns * 2.0**rowAddrBits));
	constant refresh_timer_range : integer := refresh_interval*3;

-- ram state machine
	type ramStates is (
		RAM_INIT,
		RAM_INIT_PRECHARGE,
		RAM_SETMODE,
		RAM_IDLE,
		
		RAM_ACTIVE,
		RAM_READ_1,
		RAM_READ_2,
		RAM_READ_3,
		RAM_READ_4,
		RAM_READ_5,
		RAM_WRITE_1,
		RAM_WRITE_2,
		RAM_WRITE_3,
		RAM_WRITE_4,
		RAM_WRITE_ABORT,
		RAM_WRITE_DLY,
		
		RAM_PRECHARGE,
		RAM_PRECHARGE_ALL,
		RAM_AUTOREFRESH
	);
	type ramPorts is (
		PORT_NONE,
		PORT_CACHE_1,
		PORT_CACHE_2,
		PORT_VID0,
		PORT_VID1,
		PORT_CPU6510
	);
	type timer_t is record
			cnt : integer range 0 to 32767;
			run : std_logic;
		end record;
	subtype row_t is unsigned((rowAddrBits-1) downto 0);
	subtype col_t is unsigned((colAddrBits-1) downto 0);

	signal ramState : ramStates := RAM_INIT;
	signal timer : timer_t := (cnt => 0, run => '0');
	
	signal ram_data_reg : unsigned(sd_data'range);

-- Registered sdram signals
	signal sd_data_reg : unsigned(15 downto 0);
	signal sd_data_ena : std_logic := '0';
	signal sd_addr_reg : unsigned((rowAddrBits-1) downto 0);
	signal sd_we_n_reg : std_logic;
	signal sd_ras_n_reg : std_logic;
	signal sd_cas_n_reg : std_logic;
	signal sd_ba_0_reg : std_logic;
	signal sd_ba_1_reg : std_logic;
	signal sd_ldqm_reg : std_logic;
	signal sd_udqm_reg : std_logic;

-- ram acknowledge signals
	signal cache1_ack_reg : std_logic := '0';
	signal cache2_ack_reg : std_logic := '0';
	signal vid0_ack_reg : std_logic := '0';
	signal vid1_ack_reg : std_logic := '0';
	signal cpu6510_ack_reg : std_logic := '0';

-- Active rows in SDRAM
	type bankRowDef is array(0 to 3) of row_t;
	signal bankActive : std_logic_vector(0 to 3) := (others => '0');
	signal bankRow : bankRowDef;

-- Memory auto refresh
	signal refreshTimer : integer range 0 to refresh_timer_range := 0;
	signal refresh_active_reg : std_logic := '0';
	signal refresh_subtract_reg : std_logic := '0';
	signal refresh_required_reg : std_logic := '0';

	signal currentPort : ramPorts;
	signal currentBank : unsigned(1 downto 0);
	signal currentRow : row_t;
	signal currentCol : col_t;
	signal currentWrData : unsigned(63 downto 0);
	signal currentLdqm : std_logic;
	signal currentUdqm : std_logic;
	signal currentWe : std_logic;

	signal nextRamBank : unsigned(1 downto 0);
	signal nextRamRow : row_t;
	signal nextRamCol : col_t;
	signal nextRamPort : ramPorts;
	signal nextWrData : unsigned(63 downto 0);
	signal nextLdqm : std_logic;
	signal nextUdqm : std_logic;
	signal nextWe : std_logic;

	procedure set_timer(signal timer : inout timer_t; constant timeout : in integer) is
	begin
		if timeout > 0 then
			timer.run <= '1';
			timer.cnt <= timeout-1;
		else
			timer.run <= '0';
		end if;
	end procedure;

begin
	ram_data_reg <= sd_data;
	sd_data <= sd_data_reg when sd_data_ena = '1' else (others => 'Z');
	sd_addr <= sd_addr_reg;
	sd_ras_n <= sd_ras_n_reg;
	sd_cas_n <= sd_cas_n_reg;
	sd_we_n <= sd_we_n_reg;
	sd_ba_0 <= sd_ba_0_reg;
	sd_ba_1 <= sd_ba_1_reg;
	sd_ldqm <= sd_ldqm_reg;
	sd_udqm <= sd_udqm_reg;

	cache_ack <= cache1_ack_reg;
	cache2_ack <= cache2_ack_reg;
	vid0_ack <= vid0_ack_reg;
	vid1_ack <= vid1_ack_reg;
	cpu6510_ack <= cpu6510_ack_reg;

-- -----------------------------------------------------------------------
-- Refresh timer
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if refreshTimer < refresh_timer_range-1 then
				refreshTimer <= refreshTimer + 1;
			end if;
			if refresh_subtract_reg = '1' then
				refreshTimer <= refreshTimer - refresh_interval;
			end if;

			refresh_required_reg <= '0';
			if refreshTimer >= refresh_interval then
				-- Suppress refreshes when "reserve" pin is high.
				refresh_required_reg <= not reserve;
			end if;
		end if;
	end process;
	
-- -----------------------------------------------------------------------
-- State machine
-- -----------------------------------------------------------------------
	process(currentPort, cpu6510_req, cpu6510_ack_reg, cache_req, cache1_ack_reg, 
			reserve, cache_a, cache_d, cache_burst, cache_we, vid0_req,
			vid0_ack_reg, vid0_addr)
	begin
		nextRamPort <= PORT_NONE;
		nextRamBank <= "00";
		nextRamRow <= ( others => '0');
		nextRamCol <= ( others => '0');
		nextLdqm <= '0';
		nextUdqm <= '0';
		nextWe <= '0';
		nextWrData <= (others => '-');

		if enable_cpu6510_port and (cpu6510_req /= cpu6510_ack_reg) and (currentPort /= PORT_CPU6510) then
			if cpu6510_we = '1' then
				nextWe <= '1';
				nextLdqm <= cpu6510_a(0);
				nextUdqm <= not cpu6510_a(0);
			end if;
			nextRamPort <= PORT_CPU6510;
			nextRamBank <= cpu6510_a((colAddrBits+rowAddrBits+2) downto (colAddrBits+rowAddrBits+1));
			nextRamRow <= cpu6510_a((colAddrBits+rowAddrBits) downto (colAddrBits+1));
			nextRamCol <= cpu6510_a(colAddrBits downto 1);
			nextWrData(15 downto 0) <= cpu6510_d & cpu6510_d;
		elsif enable_cache1_port and (cache_req /= cache1_ack_reg) and (currentPort /= PORT_CACHE_1) then
			nextRamPort <= PORT_CACHE_1;
			nextRamBank <= cache_a((colAddrBits+rowAddrBits+2) downto (colAddrBits+rowAddrBits+1));
			nextRamRow <= cache_a((colAddrBits+rowAddrBits) downto (colAddrBits+1));
			nextRamCol <= cache_a(colAddrBits downto 1);
			nextWrData <= cache_d;
			if cache_burst = '1' then
				nextRamCol(1 downto 0) <= "00";
			end if;

			if cache_we = '1' then
				nextWe <= '1';
				if cache_burst = '0' then
					nextLdqm <= cache_a(0);
					nextUdqm <= not cache_a(0);
				end if;
			end if;
		elsif enable_cache2_port and (cache2_req /= cache2_ack_reg) and (currentPort /= PORT_CACHE_2) then
			nextRamPort <= PORT_CACHE_2;
			nextRamBank <= cache2_a((colAddrBits+rowAddrBits+2) downto (colAddrBits+rowAddrBits+1));
			nextRamRow <= cache2_a((colAddrBits+rowAddrBits) downto (colAddrBits+1));
			nextRamCol <= cache2_a(colAddrBits downto 1);
			nextWrData <= cache2_d;
			if cache2_burst = '1' then
				nextRamCol(1 downto 0) <= "00";
			end if;

			if cache2_we = '1' then
				nextWe <= '1';
				if cache2_burst = '0' then
					nextLdqm <= cache2_a(0);
					nextUdqm <= not cache2_a(0);
				end if;
			end if;
		elsif reserve = '0' then
			if enable_vid0_port and (vid0_req /= vid0_ack_reg) and (currentPort /= PORT_VID0) then
				nextRamPort <= PORT_VID0;
				nextRamBank <= vid0_addr((colAddrBits+rowAddrBits+2) downto (colAddrBits+rowAddrBits+1));
				nextRamRow <= vid0_addr((colAddrBits+rowAddrBits) downto (colAddrBits+1));
				nextRamCol <= vid0_addr(colAddrBits downto 3) & "00";
			elsif enable_vid1_port and (vid1_req /= vid1_ack_reg) and (currentPort /= PORT_VID1) then
				nextRamPort <= PORT_VID1;
				nextRamBank <= vid1_addr((colAddrBits+rowAddrBits+2) downto (colAddrBits+rowAddrBits+1));
				nextRamRow <= vid1_addr((colAddrBits+rowAddrBits) downto (colAddrBits+1));
				nextRamCol <= vid1_addr(colAddrBits downto 3) & "00";
			end if;
		end if;
	end process;

	process(clk)
		variable done_cache1 : std_logic;
		variable done_cache2 : std_logic;
		variable done_vid0 : std_logic;
		variable done_vid1 : std_logic;
		variable done_cpu6510 : std_logic;
	begin
		done_cache1 := '0';
		done_cache2 := '0';
		done_vid0 := '0';
		done_vid1 := '0';
		done_cpu6510 := '0';
		if rising_edge(clk) then
			refresh_subtract_reg <= '0';
			sd_data_ena <= '0';
			sd_addr_reg <= (others => '0');
			sd_ras_n_reg <= '1';
			sd_cas_n_reg <= '1';
			sd_we_n_reg <= '1';
			
			sd_ldqm_reg <= '0';
			sd_udqm_reg <= '0';
			

			sd_ba_0_reg <= currentBank(0);
			sd_ba_1_reg <= currentBank(1);

			if timer.run = '1' then
				if timer.cnt = 0 then
					timer.run <= '0';
				else
					timer.cnt <= timer.cnt - 1;
				end if;
			else
				case ramState is
				when RAM_INIT =>
					-- Wait for clock to stabilise and PLL locks
					-- Then follow init steps in datasheet:
					--   precharge all banks
					--   perform a few autorefresh cycles (we do 2 of them)
					--   setmode (burst and CAS latency)
					--   after a few clocks ram is ready for use (we wait 10 just to be sure).
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');
					currentLdqm <= '-';
					currentUdqm <= '-';
					currentWe <= '-';

					set_timer(timer, 20000);
					ramState <= RAM_INIT_PRECHARGE;
				when RAM_INIT_PRECHARGE =>
					-- Precharge all banks, part of initialisation sequence.
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');
					currentLdqm <= '-';
					currentUdqm <= '-';
					currentWe <= '-';

					set_timer(timer, 100);
					ramState <= RAM_SETMODE;
					sd_ras_n_reg <= '0';
					sd_we_n_reg <= '0';
					sd_addr_reg(10) <= '1'; -- precharge all banks
				when RAM_SETMODE =>
					-- Set mode bits of RAM, part of initialisation sequence.
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');
					currentLdqm <= '-';
					currentUdqm <= '-';
					currentWe <= '-';

					set_timer(timer, 10);
					ramState <= RAM_IDLE; -- ram is ready for commands after set-mode
					sd_addr_reg <= resize("000000100010", sd_addr'length); -- CAS2, Burstlength 4 (8 bytes, 64 bits)
					if casLatency = 3 then
						sd_addr_reg(6 downto 4) <= "011";
					end if;
					sd_we_n_reg <= '0';
					sd_ras_n_reg <= '0';
					sd_cas_n_reg <= '0';
				when RAM_IDLE =>
					currentPort <= nextRamPort;
					currentBank <= nextRamBank;
					currentRow <= nextRamRow;
					currentCol <= nextRamCol;
					currentLdqm <= nextLdqm;
					currentUdqm <= nextUdqm;
					currentWe <= nextWe;
					currentWrData <= nextWrData;
						
					refresh_active_reg <= '0';

					if nextRamPort /= PORT_NONE then
						ramState <= RAM_READ_1;
						if nextWe = '1' then
							ramState <= RAM_WRITE_1;
						end if;
						if bankActive(to_integer(nextRamBank)) = '0' then
							-- Current bank not active. Activate a row first
							ramState <= RAM_ACTIVE;
						elsif bankRow(to_integer(nextRamBank)) /= nextRamRow then
							-- Wrong row active in bank, do precharge then activate a row.
							ramState <= RAM_PRECHARGE;
						end if;
					elsif (delay_refresh = '0') and (refresh_required_reg = '1') then
						-- Refresh timeout, perform auto-refresh cycle
						refresh_active_reg <= '1';
						refresh_subtract_reg <= '1';
						if bankActive /= "0000" then
							-- There are still rows active, so we precharge them first
							ramState <= RAM_PRECHARGE_ALL;
						else
							ramState <= RAM_AUTOREFRESH;
						end if;
					end if;
				when RAM_ACTIVE =>
					set_timer(timer, ras_cycles);
					ramState <= RAM_READ_1;
					if currentWe = '1' then
						ramState <= RAM_WRITE_1;
					end if;
					sd_addr_reg <= currentRow;
					sd_ras_n_reg <= '0';
					bankRow(to_integer(currentBank)) <= currentRow;
					bankActive(to_integer(currentBank)) <= '1';
				when RAM_READ_1 =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					set_timer(timer, casLatency);
					ramState <= RAM_READ_2;
					sd_addr_reg <= resize(currentCol, sd_addr'length);
					sd_cas_n_reg <= '0';
					if readAutoPrecharge then
						sd_addr_reg(10) <= '1';
						bankActive(to_integer(currentBank)) <= '0';
					end if;
				when RAM_READ_2 =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_READ_3;
					case currentPort is
					when PORT_CACHE_1 =>
						cache_q(15 downto 0) <= ram_data_reg;
					when PORT_CACHE_2 =>
						cache2_q(15 downto 0) <= ram_data_reg;
					when PORT_VID0 =>
						vid0_do(15 downto 0) <= ram_data_reg;
					when PORT_VID1 =>
						vid1_do(15 downto 0) <= ram_data_reg;
					when PORT_CPU6510 =>
						if enable_cpu6510_port then
							cpu6510_q <= ram_data_reg(7 downto 0);
							if cpu6510_a(0) = '1' then
								cpu6510_q <= ram_data_reg(15 downto 8);
							end if;
							done_cpu6510 := '1';
						end if;
					when others =>
						null;
					end case;
				when RAM_READ_3 =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_READ_4;
					case currentPort is
					when PORT_CACHE_1 =>
						cache_q(31 downto 16) <= ram_data_reg;
					when PORT_CACHE_2 =>
						cache2_q(31 downto 16) <= ram_data_reg;
					when PORT_VID0 =>
						vid0_do(31 downto 16) <= ram_data_reg;
					when PORT_VID1 =>
						vid1_do(31 downto 16) <= ram_data_reg;
					when others =>
						null;
					end case;
				when RAM_READ_4 =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_READ_5;
					case currentPort is
					when PORT_CACHE_1 =>
						cache_q(47 downto 32) <= ram_data_reg;
					when PORT_CACHE_2 =>
						cache2_q(47 downto 32) <= ram_data_reg;
					when PORT_VID0 =>
						vid0_do(47 downto 32) <= ram_data_reg;
					when PORT_VID1 =>
						vid1_do(47 downto 32) <= ram_data_reg;
					when others =>
						null;
					end case;
				when RAM_READ_5 =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_IDLE;
					case currentPort is
					when PORT_CACHE_1 =>
						cache_q(63 downto 48) <= ram_data_reg;
						done_cache1 := '1';
					when PORT_CACHE_2 =>
						cache2_q(63 downto 48) <= ram_data_reg;
						done_cache2 := '1';
					when PORT_VID0 =>
						vid0_do(63 downto 48) <= ram_data_reg;
						done_vid0 := '1';
					when PORT_VID1 =>
						vid1_do(63 downto 48) <= ram_data_reg;
						done_vid1 := '1';
					when PORT_CPU6510 =>
						null;
					when others =>
						null;
					end case;
				when RAM_WRITE_1 =>
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_WRITE_2;
					sd_data_ena <= '1';
					sd_we_n_reg <= '0';
					sd_cas_n_reg <= '0';
					sd_addr_reg <= resize(currentCol, sd_addr'length);
					sd_data_reg <= currentWrData(15 downto 0);
					sd_ldqm_reg <= currentLdqm;
					sd_udqm_reg <= currentUdqm;
					if currentLdqm = '1'
					or currentUdqm = '1' then
						-- This is a partial write, abort burst.
						ramState <= RAM_WRITE_ABORT;
--						ramDone := '1';
					end if;
					currentWrData(47 downto 0) <= currentWrData(63 downto 16);
				when RAM_WRITE_2 =>
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_WRITE_3;
					sd_data_ena <= '1';
					sd_data_reg <= currentWrData(15 downto 0);
					currentWrData(47 downto 0) <= currentWrData(63 downto 16);
				when RAM_WRITE_3 =>
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_WRITE_4;
					sd_data_ena <= '1';
					sd_data_reg <= currentWrData(15 downto 0);
					currentWrData(47 downto 0) <= currentWrData(63 downto 16);
				when RAM_WRITE_4 =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					ramState <= RAM_WRITE_DLY;
					sd_data_ena <= '1';
					sd_data_reg <= currentWrData(15 downto 0);
--					currentWrData(47 downto 0) <= currentWrData(63 downto 16);
					case currentPort is
					when PORT_CACHE_1 =>
						done_cache1 := '1';
					when PORT_CACHE_2 =>
						done_cache2 := '1';
					when PORT_VID0 =>
						done_vid0 := '1';
					when PORT_VID1 =>
						done_vid1 := '1';
					when PORT_CPU6510 =>
						done_cpu6510 := '1';
					when others =>
						null;
					end case;
				when RAM_WRITE_ABORT =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					--currentPort <= PORT_NONE;
					ramState <= RAM_WRITE_DLY;
					sd_we_n_reg <= '0';
					case currentPort is
					when PORT_CACHE_1 =>
						done_cache1 := '1';
					when PORT_CACHE_2 =>
						done_cache2 := '1';
					when PORT_VID0 =>
						done_vid0 := '1';
					when PORT_VID1 =>
						done_vid1 := '1';
					when PORT_CPU6510 =>
						done_cpu6510 := '1';
					when others =>
						null;
					end case;
				when RAM_WRITE_DLY =>
					currentWrData <= (others => '-');
					currentBank <= (others => '-');
					currentRow <= (others => '-');
					currentCol <= (others => '-');

					currentPort <= PORT_NONE;
					ramState <= RAM_IDLE;
				when RAM_PRECHARGE =>
					set_timer(timer, precharge_cycles);
					ramState <= RAM_ACTIVE;
					sd_we_n_reg <= '0';
					sd_ras_n_reg <= '0';
					bankActive(to_integer(currentBank)) <= '0';
				when RAM_PRECHARGE_ALL =>
					set_timer(timer, precharge_cycles);
					ramState <= RAM_IDLE;
					if refresh_active_reg = '1' then
						set_timer(timer, 1);
						ramState <= RAM_AUTOREFRESH;
					end if;
					sd_addr_reg(10) <= '1'; -- All banks
					sd_we_n_reg <= '0';
					sd_ras_n_reg <= '0';
					bankActive <= "0000";
				when RAM_AUTOREFRESH =>
					set_timer(timer, refresh_clocks);
					ramState <= RAM_IDLE;
					sd_we_n_reg <= '1';
					sd_ras_n_reg <= '0';
					sd_cas_n_reg <= '0';
				end case;
			end if;

			if enable_cache1_port and (done_cache1 = '1') then
				cache1_ack_reg <= cache_req;
			end if;
			if enable_cache2_port and (done_cache2 = '1') then
				cache2_ack_reg <= cache2_req;
			end if;
			if enable_vid0_port and (done_vid0 = '1') then
				vid0_ack_reg <= vid0_req;
			end if;
			if enable_vid1_port and (done_vid1 = '1') then
				vid1_ack_reg <= vid1_req;
			end if;
			if enable_cpu6510_port and (done_cpu6510 = '1') then
				cpu6510_ack_reg <= cpu6510_req;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Debug and measurement signals
-- -----------------------------------------------------------------------
	debugIdle <= '1' when ((refresh_active_reg = '0') and (ramState = RAM_IDLE)) else '0';
	debugRefresh <= refresh_active_reg;
end architecture;
