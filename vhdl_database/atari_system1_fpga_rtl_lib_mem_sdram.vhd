--	(c) 2020 d18c7db(a)hotmail
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
--

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.math_real.all;

-- Controller for AS4C32M16SB / MT48LC32M16A2 – 4 banks x 8 Meg x 16
-- 100.0MHz clock (10.0ns CL=2)
entity sdram is
	generic (
		-- datasheet time constants in ns for AS4C32M16SB-6TIN speed device
		fCK_Mhz       : real :=      100.0; -- clock freq in MHz
		CAS_Latency   : real :=        2.0; -- CAS Latency typ 2 or 3
		tINIT_ns      : real :=   200000.0; -- see page 44 initialization, Micron typ 100us, Alliance typ. 200us
		tREF_ns       : real :=     7800.0; -- refresh every 64ms/8192 or faster
		tRFC_ns       : real :=       60.0; -- REFRESH period
		tRC_ns        : real :=       60.0; -- ACTIVE-to-ACTIVE command period
		tRCD_ns       : real :=       18.0; -- ACTIVE-to-RD/WR  command period
		tRP_ns        : real :=       18.0; -- PRECHARGE command period
		tMRD_ns       : real :=       12.0  -- LMR command to ACTIVE or REFRESH command period
	);
	port (
		-- controller interface
		I_CLK         : in    std_logic; -- tCK above MUST match this clock!
		I_RST         : in    std_logic; -- active high reset

		I_ADDR        : in    std_logic_vector(22 downto 0); -- max 8M address by 64 bits (chip is 32M x16)
		I_DATA        : in    std_logic_vector(63 downto 0);
		O_DATA        : out   std_logic_vector(63 downto 0);
		I_WE          : in    std_logic; -- active high write enable
		O_RDY         : out   std_logic; -- active high ready, indicates chip is ready to RD/WR

		-- sdram interface
		SDRAM_DQ    : inout std_logic_vector(15 downto 0);
		SDRAM_A     : out   std_logic_vector(12 downto 0);
		SDRAM_BA    : out   std_logic_vector( 1 downto 0);
		SDRAM_DQML  : out   std_logic;
		SDRAM_DQMH  : out   std_logic;
		SDRAM_CLK   : out   std_logic;
		SDRAM_CKE   : out   std_logic;
		SDRAM_nCS   : out   std_logic;
		SDRAM_nRAS  : out   std_logic;
		SDRAM_nCAS  : out   std_logic;
		SDRAM_nWE   : out   std_logic
	);
end sdram;

architecture rtl of sdram is
  constant MODE_REG : std_logic_vector(12 downto 0) := (
    "000" & -- reserved
    '0'   & -- Write Burst 0=programmed bursts, 1=single location access
    "00"  & -- Op Mode 00=standard operation
    "010" & -- CAS Latency 011 above 133MHz else 010
    '0'   & -- burst type 0=sequential 1=interleaved
    "010"   -- burst length 000=1 001=2 010=4 011=8 111=full page when burst type=0
  );

	-- delays in clock cycles rounded up to nearest integer
	constant tINIT         : integer := integer(ceil(tINIT_ns*fCK_Mhz/1000.0));
	constant tRFC          : integer := integer(ceil( tRFC_ns*fCK_Mhz/1000.0));
	constant tRCD          : integer := integer(ceil( tRCD_ns*fCK_Mhz/1000.0));
	constant tREF          : integer := integer(ceil( tREF_ns*fCK_Mhz/1000.0));
	constant tMRD          : integer := integer(ceil( tMRD_ns*fCK_Mhz/1000.0));
	constant tRP           : integer := integer(ceil(  tRP_ns*fCK_Mhz/1000.0));
	constant tRC           : integer := integer(ceil(  tRC_ns*fCK_Mhz/1000.0));
	constant tCASL         : integer := integer(ceil(    CAS_Latency));

	-- SDRAM commands drive pins /CS /RAS /CAS /WE
	constant CMD_LMR       : std_logic_vector(3 downto 0) := "0000";
	constant CMD_REFRESH   : std_logic_vector(3 downto 0) := "0001";
	constant CMD_PRECHARGE : std_logic_vector(3 downto 0) := "0010";
	constant CMD_ACTIVE    : std_logic_vector(3 downto 0) := "0011";
	constant CMD_WRITE     : std_logic_vector(3 downto 0) := "0100";
	constant CMD_READ      : std_logic_vector(3 downto 0) := "0101";
	constant CMD_ENDBURST  : std_logic_vector(3 downto 0) := "0110";
	constant CMD_NOP       : std_logic_vector(3 downto 0) := "0111";

	type state_t is (INIT, MODE, IDLE, ACTV, RDWR, RFSH);
	signal state, state_last : state_t := INIT;
	signal we_last, dq_write : std_logic := '0';
	signal cmd             : std_logic_vector( 3 downto 0) := CMD_NOP;
	signal addr_last       : std_logic_vector(22 downto 0) := (others=>'1');
	signal dq_data         : std_logic_vector(63 downto 0) := (others=>'0');

	-- NOTE: ranges _must_ be large enough for longest possible delay at highest clock freq
	signal cycl_ctr        : integer range 0 to 32767 := 0; -- 200us @160MHz 32000 cycles
	signal rfsh_ctr        : integer range 0 to  2047 := 0; -- 7.8us @160MHz  1250 cycles (8192 refreshes / 64ms = 128k/s)

begin
	O_RDY <= '1' when (state = IDLE) else '0';

	-- assign SDRAM pins
	SDRAM_DQML <= '0'; -- chip DQML pin shorted to A11 on PCB
	SDRAM_DQMH <= '0'; -- chip DQMH pin shorted to A12 on PCB
	SDRAM_CLK  <= not I_CLK; -- delay SDRAM clk 180 degrees
	SDRAM_CKE  <= not I_RST; -- CKE always high except during reset
	SDRAM_BA   <= I_ADDR(1 downto 0) when (state=ACTV) or (state=RDWR) else (others => '0');
	(SDRAM_nCS, SDRAM_nRAS, SDRAM_nCAS, SDRAM_nWE) <= cmd; -- drive chip command lines

	-- 4 banks x 8M x 16, banks=4 (BA1:0), rows=8K (A12:0) cols=1K (A9:0)
	SDRAM_A    <=
		"0010000000000"                   when state = INIT else
		MODE_REG                          when state = MODE else
		I_ADDR(14 downto 2)               when state = ACTV else
		"001" & I_ADDR(22 downto 15) & "00" when state = RDWR else
		(others => '0');

	SDRAM_DQ   <=
		dq_data(63 downto 48) when (dq_write = '1') and (state = RDWR) and (cycl_ctr = 0 ) else
		dq_data(47 downto 32) when (dq_write = '1') and (state = RDWR) and (cycl_ctr = 1 ) else
		dq_data(31 downto 16) when (dq_write = '1') and (state = RDWR) and (cycl_ctr = 2 ) else
		dq_data(15 downto  0) when (dq_write = '1') and (state = RDWR) and (cycl_ctr = 3 ) else
		(others=>'Z');

	p_read : process
	begin
		wait until rising_edge(I_CLK);
		if (dq_write = '0') and (state_last = RDWR) then
			   if (cycl_ctr = tCASL  ) then O_DATA(63 downto 48) <= SDRAM_DQ;
			elsif (cycl_ctr = tCASL+1) then O_DATA(47 downto 32) <= SDRAM_DQ;
			elsif (cycl_ctr = tCASL+2) then O_DATA(31 downto 16) <= SDRAM_DQ;
			elsif (cycl_ctr = tCASL+3) then O_DATA(15 downto  0) <= SDRAM_DQ;
			end if;
		end if;
	end process;

	p_refresh : process
	begin
		wait until rising_edge(I_CLK);
		if (I_RST = '1') or (state = INIT) or ((state = RFSH) and (state_last /= RFSH)) then
			rfsh_ctr <= 0;
		else
			if (rfsh_ctr < 2047) then rfsh_ctr <= rfsh_ctr + 1; end if;
		end if;
	end process;

	-- simple controller state machine
	p_state : process
	begin
		wait until rising_edge(I_CLK);
		state_last <= state;

		if (I_RST = '1') then
			cmd <= CMD_NOP;
			state <= INIT;
		else
			cmd <= CMD_NOP;

			if cycl_ctr < 32767 then cycl_ctr <= cycl_ctr + 1; end if;

			we_last <= I_WE;
			if (we_last = '0') and (I_WE = '1') then
				dq_write <= '1';
				dq_data <= I_DATA;
			end if;

			case state is

				-- #INIT#
				when INIT =>
					-- observe delays outlined on datasheet page 44, (100us then tRP, tRFC, tRFC, tMRD)
					if (cycl_ctr = tINIT) then
						cmd <= CMD_PRECHARGE;
					elsif (cycl_ctr = tINIT + tRP) then
						cmd <= CMD_REFRESH;
					elsif (cycl_ctr = tINIT + tRP + tRFC) then
						cmd <= CMD_REFRESH;
					elsif (cycl_ctr = tINIT + tRP + tRFC + tRFC) then
						cmd <= CMD_LMR;
						state <= MODE;
						cycl_ctr <= 0;
					end if;

				-- #MODE#
				when MODE =>
					if (cycl_ctr >= tMRD) then
						cmd <= CMD_NOP;
						state <= IDLE;
						cycl_ctr <= 0;
					end if;

				-- #IDLE#
				when IDLE =>
					-- observe tRC ACTIVE-to-ACTIVE delay minus the time spent in ACTIVE-to-RDWR
					if (cycl_ctr > tRC-tRCD-tCASL-1) then
						if (I_ADDR /= addr_last) or (dq_write = '1') then
							addr_last <= I_ADDR;
							cmd <= CMD_ACTIVE;
							state <= ACTV;
							cycl_ctr <= 0;
					-- if refresh counter expired
						elsif (rfsh_ctr > tREF) then
							cmd <= CMD_REFRESH;
							state <= RFSH;
							cycl_ctr <= 0;
						end if;
					end if;

				-- #ACTIVE# row and bank
				when ACTV =>
					-- observe tRCD ACTIVE-to-RD/WR delay
					if (cycl_ctr >= tRCD-1) then
						if (dq_write = '1') then
							cmd <= CMD_WRITE;
						else
							cmd <= CMD_READ;
						end if;
						state <= RDWR;
						cycl_ctr <= 0;
					end if;

				-- #RDWR#
				when RDWR =>
					-- observe tCASL CAS Latency
					if (cycl_ctr >= tCASL + 3) then
					-- if a refresh is due soon, go direct to refresh state else idle
						if (rfsh_ctr > tREF-20) then
							cmd <= CMD_REFRESH;
							state <= RFSH;
						else
							cmd <= CMD_NOP;
							state <= IDLE;
						end if;
						dq_write <= '0';
						cycl_ctr <= 0;
					end if;

				-- #REFRESH#
				when RFSH =>
					-- observe tRFC REFRESH delay
					if (cycl_ctr >= tRFC) then
						cmd <= CMD_NOP;
						state <= IDLE;
						cycl_ctr <= 0;
					end if;

				when others =>
					cmd <= CMD_NOP;
					state <= IDLE;
			end case;
		end if;
	end process;
end architecture rtl;
