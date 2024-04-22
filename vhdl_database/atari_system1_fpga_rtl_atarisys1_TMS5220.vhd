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

-- References: TMS5220 datasheet, US Patent US4335277 and TMS5220.cpp from MAME source code.
--
-- IMPORTANT NOTES:
-- 1) This implementation does NOT implement the schematic in US4335277
-- 2) It is based primarily on MAME source code and aims to be "functionally equivalent"
--    to the "TMS5220" chip but not identical in terms of electrical circuit or timing.
-- 3) Not all functionality of TMS5220 is implemented.
--    What works:
--      * Generating speech in "Speak External" mode
--      * Commands "NOP", "Speak External", "Reset"
--      * Interrupt output pin
--      * Output Ready pin
--      * Reading of status bits TS, BL, BE
--    What doesn't work:
--      * Variable frame rate
--      * Commands "Read Byte", "Read and Branch", "Load Address", "Speak", "Load Frame Rate"
--      * Everything to do with TMS6100 external VSM ROM
--      *

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity TMS5220 is
	port (
		-- inputs
		I_OSC    : in  std_logic;                    -- pin  6 typ 640KHz
		I_ENA    : in  std_logic;                    -- active high enable input
		I_WSn    : in  std_logic;                    -- pin 27 Write Select
		I_RSn    : in  std_logic;                    -- pin 28 Read Select
		I_DATA   : in  std_logic;                    -- pin 21 Serial Data In (alt function)
		I_TEST   : in  std_logic;                    -- pin 20 Test use only
		I_DBUS   : in  std_logic_vector(7 downto 0); -- pins 1,26,24,22,19,12,13,14
		-- outputs
		O_DBUS   : out std_logic_vector(7 downto 0); -- pins 1,26,24,22,19,12,13,14
		O_RDYn   : out std_logic;                    -- pin 18 Transfer cycle complete
		O_INTn   : out std_logic;                    -- pin 17 Interrupt

		O_M0     : out std_logic;                    -- pin 15 VSM command bit 0
		O_M1     : out std_logic;                    -- pin 16 VSM command bit 1
		O_ADD8   : out std_logic;                    -- pin 21 VSM Addr (alt function)
		O_ADD4   : out std_logic;                    -- pin 23 VSM Addr
		O_ADD2   : out std_logic;                    -- pin 25 VSM Addr
		O_ADD1   : out std_logic;                    -- pin  2 VSM Addr
		O_ROMCLK : out std_logic;                    -- pin  3 VSM clock

		O_T11    : out std_logic;                    -- pin  7 Sync
		O_IO     : out std_logic;                    -- pin  9 Serial Data Out
		O_PRMOUT : out std_logic;                    -- pin 10 Test use only
		O_SPKR   : out signed(13 downto 0)           -- pin  8 Audio Output
	);
end entity;

architecture RTL of TMS5220 is
	type IP_ARRAY is array (0 to  7) of integer range     0 to    3; --  2 bits
	type BL_ARRAY is array (0 to  9) of integer range     0 to    7; --  3 bits
	type IX_ARRAY is array (0 to  9) of integer range     0 to   31; --  5 bits
	type EN_ARRAY is array (0 to 15) of integer range     0 to  127; --  7 bits
	type CH_ARRAY is array (0 to 51) of integer range     0 to  127; --  7 bits
	type PI_ARRAY is array (0 to 63) of integer range     0 to  255; --  8 bits
	type KV_ARRAY is array (0 to  9) of integer range  -512 to  511; -- 10 bits
	type MU_ARRAY is array (0 to 10) of integer range -4096 to 4095; -- 13 bits
	type MX_ARRAY is array (0 to  9) of integer range -4096 to 4095; -- 13 bits
	type KT_ARRAY is array (0 to  9, 0 to 31) of integer range -512 to 511; -- 10 bits

	constant FIFO_bits   : integer := 128; -- FIFO size in bits
	constant E_bits      : integer := 4;   -- Energy bits
	constant R_bits      : integer := 1;   -- Repeat bits
	constant P_bits      : integer := 6;   -- Pitch bits
	constant K_bits      : BL_ARRAY := (5, 5, 4, 4, 4, 4, 4, 3, 3, 3); -- K1...K10 bit lengths
	constant ZERO        : std_logic_vector( 7 downto 0) := (others=>'0');

	constant interp_coeff: IP_ARRAY := (0, 3, 3, 3, 2, 2, 1, 1);

	constant energytable : EN_ARRAY := (
		   0,   1,   2,   3,   4,   6,   8,   11,
		  16,  23,  33,  47,  63,  85, 114,   0);

	constant pitchtable  : PI_ARRAY := (
		   0,  15,  16,  17,  18,  19,  20,  21,
		  22,  23,  24,  25,  26,  27,  28,  29,
		  30,  31,  32,  33,  34,  35,  36,  37,
		  38,  39,  40,  41,  42,  44,  46,  48,
		  50,  52,  53,  56,  58,  60,  62,  65,
		  68,  70,  72,  76,  78,  80,  84,  86,
		  91,  94,  98, 101, 105, 109, 114, 118,
		 122, 127, 132, 137, 142, 148, 153, 159);

	constant chirptable  : CH_ARRAY := (
		   0,   3,  15,  40,  76, 108, 113,  80,
		  37,  38,  76,  68,  26,  50,  59,  19,
		  55,  26,  37,  31,  29,   0,   0,   0,
		   0,   0,   0,   0,   0,   0,   0,   0,
		   0,   0,   0,   0,   0,   0,   0,   0,
		   0,   0,   0,   0,   0,   0,   0,   0,
		   0,   0,   0,   0);

	constant ktable      : KT_ARRAY := (
		(-501,-498,-497,-495,-493,-491,-488,-482,-478,-474,-469,-464,-459,-452,-445,-437,
		 -412,-380,-339,-288,-227,-158, -81,  -1,  80, 157, 226, 287, 337, 379, 411, 436), --K1
		(-328,-303,-274,-244,-211,-175,-138, -99, -59, -18,  24,  64, 105, 143, 180, 215,
		  248, 278, 306, 331, 354, 374, 392, 408, 422, 435, 445, 455, 463, 470, 476, 506), --K2
		(-441,-387,-333,-279,-225,-171,-117, -63,  -9,  45,  98, 152, 206, 260, 314, 368,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0), --K3
		(-328,-273,-217,-161,-106, -50,   5,  61, 116, 172, 228, 283, 339, 394, 450, 506,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0), --K4
		(-328,-282,-235,-189,-142, -96, -50,  -3,  43,  90, 136, 182, 229, 275, 322, 368,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0), --K5
		(-256,-212,-168,-123, -79, -35,  10,  54,  98, 143, 187, 232, 276, 320, 365, 409,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0), --K6
		(-308,-260,-212,-164,-117, -69, -21,  27,  75, 122, 170, 218, 266, 314, 361, 409,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0), --K7
		(-256,-161, -66,  29, 124, 219, 314, 409,   0,   0,   0,   0,   0,   0,   0,   0,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0), --K8
		(-256,-176, -96, -15,  65, 146, 226, 307,   0,   0,   0,   0,   0,   0,   0,   0,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0), --K9
		(-205,-132, -59,  14,  87, 160, 234, 307,   0,   0,   0,   0,   0,   0,   0,   0,
			 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0)  --K10
		);

	signal m_IC          : integer range 0 to   7 := 0; -- I0..I7    Interpolation Count
	signal m_PC          : integer range 0 to  12 := 0; -- PC0..PC12 Parameter Count
	signal m_T           : integer range 1 to  20 := 1; -- T1..T20   Time period
	signal m_FIFO_ptr    : integer range 0 to 128 := 0; -- FIFO empty bits
	signal m_pitch_count : integer range 0 to 511 := 0;

	-- indexes
	signal m_new_frame_energy_idx   : integer range 0 to  15 := 0;
	signal m_new_frame_pitch_idx    : integer range 0 to  64 := 0;
	signal m_new_frame_k_idx        : IX_ARRAY := (0, 0, 0, 0, 15, 15, 15, 7, 7, 7);

	signal tmp_new_frame_energy_idx : integer range 0 to  15 := 0;
	signal tmp_new_frame_pitch_idx  : integer range 0 to  64 := 0;
	signal tmp_new_frame_k_idx      : IX_ARRAY := (0, 0, 0, 0, 15, 15, 15, 7, 7, 7);

	signal m_u      : MU_ARRAY := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	signal m_x      : MX_ARRAY := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

	signal
		m_cycA,
		m_RST
								: std_logic := '1';
	signal
		m_CLK,
		m_DDIS,
		m_ENA,
		m_OLDE,
		m_OLDP,
		m_RDB_clr,
		m_RDB_cmd,
		m_RDB_flag,
		m_RST_cmd,
		m_SXT_cmd,
		m_RSn,
		m_RSn_last,
		m_SPEN,
		m_T11,
		m_TALK,
		m_TALK_last,
		m_TALKD,
		m_TALKD_last,
		m_UF,
		m_WSn,
		m_WSn_last,
		m_WR_pending,
		m_buffer_empty,
		m_buffer_empty_last,
		m_buffer_low,
		m_buffer_low_last,
		m_cycB,
		m_inhibit,
		m_io_ready,
		m_irq_pin,
		m_irq_pin_clr,
		m_new_frame_voiced,
		m_new_frame_unvoiced,
		m_new_frame_repeat,
		m_new_frame_zero,
		m_new_frame_stop,
		m_pitch_zero,
		m_zpar,
		m_uv_zpar
								: std_logic := '0';
	signal
		phictr
								: std_logic_vector( 1 downto 0) := (others=>'0');
	signal
		m_PHI
								: std_logic_vector( 4 downto 1) := (others=>'0');
	signal
		m_WR_reg,
		m_DBO,
		m_DBI
								: std_logic_vector( 7 downto 0) := (others=>'0');
	signal
		m_speech
								: std_logic_vector(13 downto 0) := (others=>'0');
	signal
		m_shift
								: std_logic_vector(13 downto 0) := (others=>'0');
	signal
		m_RNG
								: std_logic_vector(12 downto 0) := (others=>'1');
	signal
		m_excitation_data,
		m_previous_energy,
		m_current_energy,
		m_current_pitch,
		this_sample
								: integer range -8192 to 8191 := 0;
	signal
		m_current_k
								: KV_ARRAY := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	signal
		m_FIFO
								: std_logic_vector(127 downto 0) := (others=>'0');
begin
	m_CLK    <= I_OSC;
	m_ENA    <= I_ENA;
	m_WSn    <= I_WSn;
	m_RSn    <= I_RSn;
--	m_data   <= I_DATA; -- FIXME not implemented
--	m_test   <= I_TEST; -- FIXME not implemented
	m_DBI    <= I_DBUS;

	O_DBUS   <= m_DBO;
	O_RDYn   <= not (m_io_ready or (not m_DDIS));
	O_INTn   <= not m_irq_pin;
	O_SPKR   <= to_signed(this_sample, 14);

	-- VSM memory bus driver (not implemented)
	O_M0     <= '1';
	O_M1     <= '1';
	O_ADD8   <= '1';
	O_ADD4   <= '1';
	O_ADD2   <= '1';
	O_ADD1   <= '1';

	-- digital audio out
	O_ROMCLK <= m_PHI(2);
	O_T11    <= m_T11; -- sync pulse
	O_IO     <= m_shift(0); -- serial out
	O_PRMOUT <= '1'; -- for test use, not implemented

	-- Buffer Low, Buffer Empty status flags
	m_buffer_low   <= '1' when m_FIFO_ptr > FIFO_bits/2 else '0';
	m_buffer_empty <= '1' when m_FIFO_ptr = FIFO_bits   else '0';

	-- timing generator, creates the PHI clock phases, the Interval Counter, Parameter Counter, Time Period and cycle A/B flag
	p_TIMING : process(m_CLK, m_ENA)
	begin
		if rising_edge(m_CLK) then
			if (m_ENA = '1') then
				phictr <= phictr + 1;
				if (phictr = "11") then
					-- time period counter
					if (m_T = 20) then
						m_T <= 1;
					else
						m_T <= m_T + 1;
					end if;

					-- cycle A/B selector
					if (m_T = 16) and (m_PC /= 12) then
						m_cycA <= not m_cycA;
						m_cycB <=     m_cycA;
					end if;

					-- parameter counter
					if (m_cycA = '1') and (m_T = 16) and (m_PC = 12) then
						m_PC <= 0;
						-- interval counter
						if (m_IC = 7) then
							m_IC <= 0;
						else
							m_IC <= m_IC  + 1;
						end if;
					elsif (m_cycB = '1') and (m_T = 16) then
						m_PC <= m_PC + 1;
					end if;

				end if;
			end if;
		end if;
	end process;

	m_PHI(1) <=      phictr(1);
	m_PHI(2) <= (not phictr(1));
	m_PHI(3) <= (    phictr(1)) or phictr(0);
	m_PHI(4) <= (not phictr(1)) or phictr(0);

	m_speech <= std_logic_vector(to_signed(this_sample, m_speech'length)); --

	-- ROMCLK __--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
	--           0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19   0   1
	-- T11    __----____________________________________________________________________________----____
	-- I/O    __|LSB|   |   |   |   |   |   |   |   |   |   |   |   |MSB|_______________________________

	-- digital serial output of DAC
	p_SERDO : process
	begin
		wait until falling_edge(m_CLK);
		if (m_PHI(3) = '0') then
			-- unclear from datasheet if T11 is intended to mean time period 11, assume it is so
			if (m_T = 11) then
				m_T11 <= '1';
				m_shift <= m_speech;
			else
				m_T11 <= '0';
				m_shift <= '0' & m_shift(m_shift'left downto 1);
			end if;
		end if;
	end process;

	-- chip is reset on RESET command or when both RS and WS are active
	m_RST <= (m_RST_cmd) or ((not m_WSn) and (not m_RSn));

	-- ready flag "not ready" when FIFO full, else "ready"
	p_READY : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_FIFO_ptr < 8) then
				m_io_ready <= '0';
			else
				m_io_ready <= '1';
			end if;
		end if;
	end process;

	-- read byte flag
	p_RDBF : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_RDB_clr = '1') or (m_RST = '1') then
				m_RDB_flag   <= '0';
			elsif (m_RDB_cmd = '1') then
				m_RDB_flag   <= '1';
			end if;
		end if;
	end process;

	-- IRQ flag
	p_IRQ : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			m_buffer_low_last <= m_buffer_low;
			m_buffer_empty_last <= m_buffer_empty;
			m_TALK_last <= m_TALK;
			if
				(m_TALK_last         = '1' and m_TALK         = '0') or
				(m_buffer_low_last   = '0' and m_buffer_low   = '1') or
				(m_buffer_empty_last = '0' and m_buffer_empty = '1')
			then
				m_irq_pin   <= '1';
			elsif (m_irq_pin_clr = '1') or (m_RST = '1') then
				m_irq_pin   <= '0';
			end if;
		end if;
	end process;

	-- 13 bit LSFR PRNG, taps 12,3,2,0
	p_PRNG : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_RST = '1')
-- ###############################################################################
--			OR (now < 49.975 ms)	-- FIXME remove this line after testing
-- ###############################################################################
			then m_RNG <= (others=>'1');
			-- changes synchronous with T cycle
			elsif (phictr = "11") and (m_TALKD = '1') then
				m_RNG <= m_RNG(11 downto 0) & (m_RNG(12) xor m_RNG(3) xor m_RNG(2) xor m_RNG(0));
			end if;
		end if;
	end process;

	-- Pitch counter
	p_PITCH : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_TALKD = '1') then
				if    (m_cycA = '1') and (m_IC = 7) and (m_PC = 12) and (m_T = 20) and (m_PHI(3) = '0') and (m_inhibit = '1') then
					m_pitch_zero <= '1';
				elsif (m_cycB = '1') and (m_IC = 0) and (m_PC =  0) and (m_T = 20) and (m_PHI(3) = '0') then
					m_pitch_zero <= '0';
				end if;

				-- counter changes synchronous with T cycle 17
				if (phictr = "11") and (m_T = 16) then
					if (m_pitch_count+1 < m_current_pitch) and (m_pitch_zero = '0') then
						m_pitch_count <= m_pitch_count + 1;
					else
						m_pitch_count <= 0;
					end if;
				end if;
			end if;
		end if;
	end process;

	-- read select handler
	p_RDSEL : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			m_RSn_last <= m_RSn;
			m_irq_pin_clr  <= '0';
			-- if read byte flag is set, return byte from VSM, otherwise return status
			if ((m_RSn_last = '1') and (m_RSn = '0') and (m_WSn = '1')) then
				if (m_RDB_flag = '1') then
					m_RDB_clr <= '1';
					m_DBO     <= (others=>'0'); -- return VSM byte FIXME not implemented
				else
					m_RDB_clr     <= '0';
					m_irq_pin_clr <= '1';
					m_DBO         <= (m_TALKD or m_SPEN) & m_buffer_low & m_buffer_empty & "00000"; -- read status
				end if;
			end if;
		end if;
	end process;

	-- update excitation data based on PRNG
	p_EXDAT : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			-- every new PC cycle
			if (m_T = 17) and (m_PHI(3) = '0') then
				if (m_OLDP = '1')  then
					if (m_RNG(0) = '1') then
						m_excitation_data <= -64;
					else
						m_excitation_data <=  64;
					end if;
				else
					if (m_pitch_count > 51) then
						m_excitation_data <= 0;
					else
						m_excitation_data <= chirptable(m_pitch_count);
					end if;
				end if;
			end if;
		end if;
	end process;

	-- enable speech when enough data in FIFO
	p_SPEN : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_RST = '1') or (m_UF = '1') then
				m_SPEN <= '0';
			elsif ((m_new_frame_stop = '1') and (m_cycA = '1') and (m_IC = 0) and (m_PC = 12) and (m_T = 19) and (m_PHI(3) = '0')) then
				m_SPEN <= '0';
			-- if BL transitions from 1 to 0 while SPEN = 0
			elsif (m_buffer_low_last = '1') and (m_buffer_low = '0') and (m_SPEN = '0') then
				m_SPEN <= '1';
			end if;
		end if;
	end process;

	-- captures state of Energy=0 and Pitch=0
	p_PREV : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			-- if Reset or "Speak External" or Write when Decode Disable is on and Speak Enable is off and this write makes BL transition from 1 to 0
			if (m_RST = '1') or (m_SXT_cmd = '1') or ( (m_WR_pending = '1') and (m_DDIS = '1') and (m_SPEN = '0') and (m_buffer_low_last = '1') and (m_buffer_low = '0') ) then
				m_OLDE     <= '1';
				m_OLDP     <= '1';
			elsif (m_TALKD = '1') and (m_cycA = '1') and (m_IC = 7) and (m_PC = 12) and (m_T = 20) and (m_PHI(4) = '0') then
				if (m_new_frame_energy_idx = 0) then
					m_OLDE <= '1';
				else
					m_OLDE <= '0';
				end if;

				if (m_new_frame_pitch_idx = 0) then
					m_OLDP <= '1';
				else
					m_OLDP <= '0';
				end if;
			end if;
		end if;
	end process;

	-- enables or disables speech processing
	p_TALKD : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			-- if RESET command then stop speech
			if (m_RST = '1') then
				m_TALK  <= '0';
				m_TALKD <= '0';
			elsif (m_cycA = '1') and (m_IC = 7) and (m_PC = 12) and (m_T = 16) and (m_PHI(3) = '0')then
				-- if BL transitions from 1 to 0 while SPEN = 0

				if (m_TALK = '0') and (m_SPEN = '1') then
					m_TALK <= '1';
				end if;

				m_TALKD <= m_TALK;
			elsif (m_IC = 0) and (m_PC = 12) and (m_SPEN = '0') then
					m_TALK <= '0';
			end if;
		end if;
	end process;

	-- parameter interpolator
	p_INTERP : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_RST = '1') then
				m_current_energy  <= 0;
				m_current_pitch   <= 0;
			elsif (m_cycB = '1') and (m_T = 20) and (m_PHI(3) = '0') and (m_TALKD = '1') then
				-- Parameter Count cycle B
				case m_PC is
					when 0 =>
						if (m_zpar = '1') then
							m_current_energy <= 0;
						elsif (m_inhibit = '0') or (m_IC = 0) then
							m_current_energy <= m_current_energy +
							to_integer(shift_right(to_signed(energytable(m_new_frame_energy_idx) - m_current_energy,12), interp_coeff(m_IC)));
						end if;
					when 1 =>
						if (m_zpar = '1') then
							m_current_pitch <= 0;
						elsif (m_inhibit = '0') or (m_IC = 0) then
							m_current_pitch <= m_current_pitch +
							to_integer(shift_right(to_signed(pitchtable(m_new_frame_pitch_idx) - m_current_pitch,12) , interp_coeff(m_IC)));
						end if;
					when 2 to 5  =>
						if (m_inhibit = '0') or (m_IC = 0) then
							m_current_k(m_PC-2) <= m_current_k(m_PC-2) +
							to_integer(shift_right(to_signed((ktable((m_PC-2),(m_new_frame_k_idx(m_PC-2))) - m_current_k(m_PC-2)),12) , interp_coeff(m_IC)));
						end if;
					when 6 to 11 =>
						if (m_uv_zpar = '1') then
							m_current_k(m_PC-2) <= 0;
						else
							if (m_inhibit = '0') or (m_IC = 0) then
								m_current_k(m_PC-2) <= m_current_k(m_PC-2) +
								to_integer(shift_right(to_signed((ktable((m_PC-2),(m_new_frame_k_idx(m_PC-2))) - m_current_k(m_PC-2)),12) , interp_coeff(m_IC)));
							end if;
						end if;
--					when 12 => -- no PC12 during cycle B
					when others => null;
				end case;
			end if;
		end if;
	end process;

	-- lattice filter is fed with impulse data and generates speech samples
	p_LATFLT : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_RST = '1') then
				m_previous_energy <= 0;
				m_u <= (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
				m_x <= (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			elsif (m_TALKD = '1')  and (m_PHI(4) = '0') then
				-- Parameter Count cycle B
				case m_T is
					when  1 =>
						m_u(10) <= to_integer(shift_right(to_signed(m_previous_energy * m_excitation_data, 22), 3));
					when  2 =>
						m_u( 9) <= m_u(10) - to_integer(shift_right(to_signed(m_current_k( 9) * m_x( 9),   22), 9));
						m_previous_energy <= m_current_energy;
					when  3 =>
						m_u( 8) <= m_u( 9) - to_integer(shift_right(to_signed(m_current_k( 8) * m_x( 8),   22), 9));
					when  4 =>
						m_x( 9) <= m_x( 8) + to_integer(shift_right(to_signed(m_current_k( 8) * m_u( 8),   22), 9));
						m_u( 7) <= m_u( 8) - to_integer(shift_right(to_signed(m_current_k( 7) * m_x( 7),   22), 9));
					when  5 =>
						m_x( 8) <= m_x( 7) + to_integer(shift_right(to_signed(m_current_k( 7) * m_u( 7),   22), 9));
						m_u( 6) <= m_u( 7) - to_integer(shift_right(to_signed(m_current_k( 6) * m_x( 6),   22), 9));
					when  6 =>
						m_x( 7) <= m_x( 6) + to_integer(shift_right(to_signed(m_current_k( 6) * m_u( 6),   22), 9));
						m_u( 5) <= m_u( 6) - to_integer(shift_right(to_signed(m_current_k( 5) * m_x( 5),   22), 9));
					when  7 =>
						m_x( 6) <= m_x( 5) + to_integer(shift_right(to_signed(m_current_k( 5) * m_u( 5),   22), 9));
						m_u( 4) <= m_u( 5) - to_integer(shift_right(to_signed(m_current_k( 4) * m_x( 4),   22), 9));
					when  8 =>
						m_x( 5) <= m_x( 4) + to_integer(shift_right(to_signed(m_current_k( 4) * m_u( 4),   22), 9));
						m_u( 3) <= m_u( 4) - to_integer(shift_right(to_signed(m_current_k( 3) * m_x( 3),   22), 9));
					when  9 =>
						m_x( 4) <= m_x( 3) + to_integer(shift_right(to_signed(m_current_k( 3) * m_u( 3),   22), 9));
						m_u( 2) <= m_u( 3) - to_integer(shift_right(to_signed(m_current_k( 2) * m_x( 2),   22), 9));
					when 10 =>
						m_x( 3) <= m_x( 2) + to_integer(shift_right(to_signed(m_current_k( 2) * m_u( 2),   22), 9));
						m_u( 1) <= m_u( 2) - to_integer(shift_right(to_signed(m_current_k( 1) * m_x( 1),   22), 9));
					when 11 =>
						m_x( 2) <= m_x( 1) + to_integer(shift_right(to_signed(m_current_k( 1) * m_u( 1),   22), 9));
						m_u( 0) <= m_u( 1) - to_integer(shift_right(to_signed(m_current_k( 0) * m_x( 0),   22), 9));
					when 12 =>
						m_x( 1) <= m_x( 0) + to_integer(shift_right(to_signed(m_current_k( 0) * m_u( 0),   22), 9));
						m_x( 0) <= m_u( 0);
						this_sample <= m_u( 0);
					when others => null;
				end case;
			end if;
		end if;
	end process;

	-- command processing
	p_CMD : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if ((m_WSn_last = '1') and (m_WSn = '0') and (m_RSn = '1')) then
				m_RDB_cmd  <= '0';
				m_RST_cmd  <= '0';
				m_SXT_cmd  <= '0';
				if (m_DDIS = '0') then
					-- FIXME implement all commands
					-- command mode
					case m_DBI(6 downto 4) is
						when "000" => -- NOP
						when "001" => -- Read Byte
							m_RDB_cmd <= '1';
						when "010" => -- NOP
						when "011" => -- Read and Branch
						when "100" => -- Load Address
						when "101" => -- Speak
						when "110" => -- Speak External
							m_SXT_cmd <= '1';
						when "111" => -- Reset
							m_RST_cmd <= '1';
						when others => null;
					end case;
				end if;
			end if;
		end if;
	end process;

	-- Decode Disable when set, the chip is in Speak External mode
	p_DDIS : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			m_TALKD_last <= m_TALKD;
			if (m_RST = '1') or (m_TALKD_last= '1' and m_TALKD= '0') then
				m_DDIS <= '0'; -- clear on RESET or falling edge of TALKD
			elsif (m_SXT_cmd  = '1') then
				m_DDIS <= '1'; -- set when Speak External command
			end if;
		end if;
	end process;

	-- inhibits parameter interpolator
	p_INHIBIT : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_RST = '1') then
				m_inhibit <= '1';
			elsif (m_cycA = '1') and (m_IC = 0) and (m_PC = 12) and (m_T = 19) and (m_PHI(3) = '0') and (m_TALKD = '1') then
				if (
					((m_OLDP = '0') and (tmp_new_frame_pitch_idx   = 0)) or
					((m_OLDP = '1') and (tmp_new_frame_pitch_idx  /= 0)) or
					((m_OLDE = '1') and (tmp_new_frame_energy_idx /= 0)) or
					((m_OLDP = '1') and (tmp_new_frame_energy_idx  = 0))
				) then
					m_inhibit <= '1';
				else
					m_inhibit <= '0';
				end if;
			end if;
		end if;
	end process;

	-- parameter zeroing controls
	p_ZPAR : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			if (m_RST = '1') or ((m_DDIS = '0') and (m_SXT_cmd <= '1')) or
				((m_WSn_last = '1') and (m_WSn = '0') and (m_RSn = '1') and (m_DDIS = '1') and (m_SPEN = '0') and (m_FIFO_ptr > 64) and (m_FIFO_ptr < 73))
			then
				m_zpar    <= '1';
				m_uv_zpar <= '1';
			end if;
			if (m_cycA = '1') and (m_IC = 0) and (m_PC = 12) and (m_T = 19) and (m_PHI(3) = '0') and (m_TALKD = '1') then
				m_zpar <= '0';
				if (tmp_new_frame_pitch_idx = 0) and (tmp_new_frame_energy_idx /= 0) and (tmp_new_frame_energy_idx /= 15) then
					m_uv_zpar <= '1';
				else
					m_uv_zpar <= '0';
				end if;
			end if;
		end if;
	end process;

	-- FIFO and parameter parser
	p_FIFO : process
	begin
		wait until rising_edge(m_CLK);
		if (m_ENA = '1') then
			m_WSn_last <= m_WSn;
			m_UF       <= '0'; -- FIFO underflow flag

			if (m_RST = '1') or ((m_DDIS = '0') and (m_SXT_cmd <= '1')) then
				m_FIFO_ptr        <= FIFO_bits;
				m_FIFO            <= (others => '0');
			-- if write select and speak external mode and there is room in FIFO
			elsif (m_DDIS = '1') and (m_WSn_last = '1') and (m_WSn = '0') and (m_RSn = '1') and (m_FIFO_ptr > 7) then
				m_WR_reg <= m_DBI(0)&m_DBI(1)&m_DBI(2)&m_DBI(3)&m_DBI(4)&m_DBI(5)&m_DBI(6)&m_DBI(7);
				m_WR_pending <= '1';
			end if;

			if (m_RST = '1') or ((m_DDIS = '0') and (m_SXT_cmd <= '1')) or
				((m_WSn_last = '1') and (m_WSn = '0') and (m_RSn = '1') and (m_DDIS = '1') and (m_SPEN = '0') and (m_FIFO_ptr > 64) and (m_FIFO_ptr < 73))
			then
				m_new_frame_energy_idx <= 0;
				m_new_frame_pitch_idx  <= 0;
				m_new_frame_k_idx      <= (0, 0, 0, 0, 15, 15, 15, 7, 7, 7);
				tmp_new_frame_k_idx    <= (0, 0, 0, 0, 15, 15, 15, 7, 7, 7);

			-- parse LPC bitstream
			elsif (m_cycA = '1') and (m_IC = 0) and (m_T = 19) and (m_PHI(3) = '0') and (m_TALKD = '1') then
				-- Parameter Count cycle A
				case m_PC is
					when 0 =>  -- Energy 4 bits
						if (m_FIFO_ptr <= FIFO_bits - E_bits) then
							m_FIFO_ptr <= m_FIFO_ptr + E_bits;
							m_FIFO <= m_FIFO(FIFO_bits - 1 - E_bits downto 0) & ZERO(E_bits downto 1);
							tmp_new_frame_energy_idx <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - E_bits)));

							if (   m_FIFO(FIFO_bits - 1 downto FIFO_bits - E_bits) = "0000") then
								m_new_frame_zero     <= '1'; -- zero frame
							elsif (m_FIFO(FIFO_bits - 1 downto FIFO_bits - E_bits) = "1111") then
								m_new_frame_stop     <= '1'; -- stop frame
							else
								m_new_frame_zero     <= '0';
								m_new_frame_stop     <= '0';
								m_new_frame_voiced   <= '1'; -- assume voiced
							end if;
						else
							m_UF <= '1'; -- FIFO underflow
						end if;
					when 1 =>  -- Repeat 1 bit, Pitch 6 bits
						if ((m_new_frame_zero = '0') and (m_new_frame_stop = '0')) then
							if (m_FIFO_ptr <= FIFO_bits - P_bits - R_bits) then
								m_FIFO_ptr <= m_FIFO_ptr + P_bits + R_bits;
								m_FIFO <= m_FIFO(FIFO_bits - 1 - P_bits - R_bits downto 0) & ZERO(P_bits + R_bits downto 1);
								m_new_frame_repeat <= m_FIFO(FIFO_bits - 1);
								tmp_new_frame_pitch_idx <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 - R_bits downto FIFO_bits - R_bits - P_bits)));
								if (m_FIFO(FIFO_bits - 1 - R_bits downto FIFO_bits - R_bits - P_bits) = "000000") then
									m_new_frame_voiced   <= '0';
									m_new_frame_unvoiced <= '1'; -- unvoiced frame
								end if;
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
-- Quartus compiler, unlike Xilinx, is unable to deal with "when 2|3|4|5" type cases, so we expand everything
					-- K1-K4  5 bits
					when 2 =>
						if ((m_new_frame_repeat = '0') and ((m_new_frame_voiced = '1') or (m_new_frame_unvoiced = '1'))) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 3 =>
						if ((m_new_frame_repeat = '0') and ((m_new_frame_voiced = '1') or (m_new_frame_unvoiced = '1'))) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 4 =>
						if ((m_new_frame_repeat = '0') and ((m_new_frame_voiced = '1') or (m_new_frame_unvoiced = '1'))) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 5 =>
						if ((m_new_frame_repeat = '0') and ((m_new_frame_voiced = '1') or (m_new_frame_unvoiced = '1'))) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
-- Quartus compiler, unlike Xilinx, is unable to deal with "when 6|7|8|9|10|11" type cases, so we expand everything, again!
					-- K5-K10  4 bits
					when 6 =>
						if ((m_new_frame_repeat = '0') and (m_new_frame_voiced = '1')) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 7 =>
						if ((m_new_frame_repeat = '0') and (m_new_frame_voiced = '1')) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 8 =>
						if ((m_new_frame_repeat = '0') and (m_new_frame_voiced = '1')) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 9 =>
						if ((m_new_frame_repeat = '0') and (m_new_frame_voiced = '1')) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 10 =>
						if ((m_new_frame_repeat = '0') and (m_new_frame_voiced = '1')) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;
					when 11 =>
						if ((m_new_frame_repeat = '0') and (m_new_frame_voiced = '1')) then
							if (m_FIFO_ptr <= FIFO_bits - K_bits(m_PC-2)) then
								m_FIFO_ptr <= m_FIFO_ptr + K_bits(m_PC-2);
								m_FIFO <= m_FIFO(FIFO_bits - 1 - K_bits(m_PC-2) downto 0) & ZERO(K_bits(m_PC-2) downto 1);
								tmp_new_frame_k_idx(m_PC-2) <= to_integer(unsigned(m_FIFO(FIFO_bits - 1 downto FIFO_bits - K_bits(m_PC-2))));
							else
								m_UF <= '1'; -- FIFO underflow
							end if;
						end if;

					when 12 => -- timing cycle
						m_new_frame_voiced   <= '0';
						m_new_frame_unvoiced <= '0';
						m_new_frame_zero     <= '0';
						m_new_frame_stop     <= '0';
						m_new_frame_energy_idx <= tmp_new_frame_energy_idx;
						m_new_frame_pitch_idx  <= tmp_new_frame_pitch_idx;
						m_new_frame_k_idx(0)   <= tmp_new_frame_k_idx(0);
						m_new_frame_k_idx(1)   <= tmp_new_frame_k_idx(1);
						m_new_frame_k_idx(2)   <= tmp_new_frame_k_idx(2);
						m_new_frame_k_idx(3)   <= tmp_new_frame_k_idx(3);
						m_new_frame_k_idx(4)   <= tmp_new_frame_k_idx(4);
						m_new_frame_k_idx(5)   <= tmp_new_frame_k_idx(5);
						m_new_frame_k_idx(6)   <= tmp_new_frame_k_idx(6);
						m_new_frame_k_idx(7)   <= tmp_new_frame_k_idx(7);
						m_new_frame_k_idx(8)   <= tmp_new_frame_k_idx(8);
						m_new_frame_k_idx(9)   <= tmp_new_frame_k_idx(9);
					when others => null;
				end case;
			-- insert data into FIFO
			elsif (m_WR_pending = '1') then
				m_WR_pending <= '0';
				m_FIFO(m_FIFO_ptr - 1 downto m_FIFO_ptr - 8) <= m_WR_reg;
				m_FIFO_ptr <= m_FIFO_ptr - 8; -- update counter of empty bits in FIFO
			end if;
		end if;
	end process;
end architecture;
