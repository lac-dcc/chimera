-- ZX Spectrum for Altera DE1
--
-- Copyright (c) 2009-2011 Mike Stirling
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
--
-- * Redistributions in synthesized form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
--
-- * Neither the name of the author nor the names of other contributors may
--   be used to endorse or promote products derived from this software without
--   specific prior written agreement from the author.
--
-- * License is granted for non-commercial use only.  A fee may not be charged
--   for redistributions as source code or in synthesized/hardware form without 
--   specific prior written agreement from the author.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
--
-- General purpose hardware debugger
--
-- (C) 2011 Mike Stirling
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debugger is
generic (
	-- Set this for a reasonable half flash duration relative to the
	-- clock frequency
	flash_divider	:	natural := 24
	);
port (
	CLOCK		:	in	std_logic;
	nRESET		:	in	std_logic;
	-- CPU clock enable in
	CLKEN_IN	:	in	std_logic;
	-- Gated clock enable back out to CPU
	CLKEN_OUT	:	out	std_logic;
	-- CPU IRQ in
	nIRQ_IN		:	in	std_logic;
	-- Gated IRQ back out to CPU (no interrupts when single stepping)
	nIRQ_OUT	:	out	std_logic;
	
	-- CPU
	A_CPU		:	in	std_logic_vector(15 downto 0);
	R_nW		:	in	std_logic;
	SYNC		:	in	std_logic;
	
	-- Aux bus input for display in hex
	AUX_BUS		:	in	std_logic_vector(15 downto 0);
	
	-- Controls
	-- RUN or HALT CPU
	RUN			:	in	std_logic;
	-- Push button to single-step in HALT mode
	nSTEP		:	in	std_logic;
	-- Push button to cycle display mode
	nMODE		:	in	std_logic;
	-- Push button to cycle display digit in edit mode
	nDIGIT		:	in	std_logic;
	-- Push button to cycle digit value in edit mode
	nSET		:	in	std_logic;
	
	-- Output to display
	DIGIT3		:	out	std_logic_vector(6 downto 0);
	DIGIT2		:	out	std_logic_vector(6 downto 0);
	DIGIT1		:	out	std_logic_vector(6 downto 0);
	DIGIT0		:	out	std_logic_vector(6 downto 0);
	
	LED_BREAKPOINT	:	out	std_logic;
	LED_WATCHPOINT	:	out	std_logic
	);
end entity;

architecture rtl of debugger is

component seg7 is
port (
	D			: in std_logic_vector(3 downto 0);
	Q			: out std_logic_vector(6 downto 0)
);
end component;

-- Current display mode
type mode_t is (modeAddress,modeBreak,modeWatch,modeAux);
signal mode			:	mode_t;
-- Current edit digit
signal digit		:	unsigned(1 downto 0);
-- For flashing selected digit
signal counter		:	unsigned(flash_divider-1 downto 0);
signal flash		:	std_logic;
-- Selected breakpoint address (stop on instruction fetch)
signal breakpoint	:	std_logic_vector(15 downto 0);
-- Selected watchpoint address (stop on write)
signal watchpoint	:	std_logic_vector(15 downto 0);
-- Address of last instruction fetch
signal instr_addr	:	std_logic_vector(15 downto 0);
-- Break flags
signal halt			:	std_logic;
-- Set when a request to resume has been received but before
-- the CPU has run
signal resuming		:	std_logic;

-- Display interface
signal a_display	:	std_logic_vector(15 downto 0);
signal d3_display	:	std_logic_vector(6 downto 0);
signal d2_display	:	std_logic_vector(6 downto 0);
signal d1_display	:	std_logic_vector(6 downto 0);
signal d0_display	:	std_logic_vector(6 downto 0);

-- Registered button inputs
signal r_step_n		:	std_logic;
signal r_mode_n		:	std_logic;
signal r_digit_n	:	std_logic;
signal r_set_n		:	std_logic;

begin
	-- Mask CPU clock enable
	CLKEN_OUT <= CLKEN_IN and not halt;
	-- Mask interrupt
	nIRQ_OUT <= nIRQ_IN or not RUN;
	
	-- Route selected address to display
	a_display <= instr_addr when mode = modeAddress else
		breakpoint when mode = modeBreak else
		watchpoint when mode = modeWatch else
		AUX_BUS when mode = modeAux else
		(others => '0');

	-- Generate display digits from binary
	d3 : seg7 port map (a_display(15 downto 12),d3_display);
	d2 : seg7 port map (a_display(11 downto 8),d2_display);
	d1 : seg7 port map (a_display(7 downto 4),d1_display);
	d0 : seg7 port map (a_display(3 downto 0),d0_display);
	
	-- Flash selected digit in edit modes
	DIGIT3 <= d3_display when (mode = modeAddress or mode = modeAux or flash = '1' or digit /= "11") else "1111111";
	DIGIT2 <= d2_display when (mode = modeAddress or mode = modeAux or flash = '1' or digit /= "10") else "1111111";
	DIGIT1 <= d1_display when (mode = modeAddress or mode = modeAux or flash = '1' or digit /= "01") else "1111111";
	DIGIT0 <= d0_display when (mode = modeAddress or mode = modeAux or flash = '1' or digit /= "00") else "1111111";
	
	-- Show mode on LEDs
	LED_BREAKPOINT <= '1' when mode = modeBreak or mode = modeAux else '0';
	LED_WATCHPOINT <= '1' when mode = modeWatch or mode = modeAux else '0';

	-- Flash counter
	process(CLOCK,nRESET)
	begin
		if nRESET = '0' then
			counter <= (others => '0');
			flash <= '0';
		elsif rising_edge(CLOCK) then
			counter <= counter + 1;
			if counter = 0 then
				flash <= not flash;
			end if;
		end if;
	end process;

	-- Register buttons, select input mode and digit
	process(CLOCK,nRESET)
	begin
		if nRESET = '0' then
			r_mode_n <= '1';
			r_digit_n <= '1';
			r_set_n <= '1';
			mode <= modeAddress;
			digit <= (others => '0');
		elsif rising_edge(CLOCK) then
			-- Register buttons
			r_mode_n <= nMODE;
			r_digit_n <= nDIGIT;
			r_set_n <= nSET;
			
			if r_mode_n = '1' and nMODE = '0' then
				-- Increment mode
				if mode = modeAddress then
					mode <= modeBreak;
				elsif mode = modeBreak then
					mode <= modeWatch;
				elsif mode = modeWatch then
					mode <= modeAux;
				else
					mode <= modeAddress;
				end if;
			end if;
			if r_digit_n = '1' and nDIGIT = '0' then
				-- Increment digit
				digit <= digit + 1;
			end if;
		end if;
	end process;
	
	-- Set watchpoint address
	process(CLOCK,nRESET)
	begin
		if nRESET = '0' then
			watchpoint <= (others => '0');
		elsif rising_edge(CLOCK) and mode = modeWatch then
			if r_set_n = '1' and nSET = '0' then
				-- Increment selected digit on each button press
				case digit is
				when "00" => watchpoint(3 downto 0) <= std_logic_vector(unsigned(watchpoint(3 downto 0)) + 1);
				when "01" => watchpoint(7 downto 4) <= std_logic_vector(unsigned(watchpoint(7 downto 4)) + 1);
				when "10" => watchpoint(11 downto 8) <= std_logic_vector(unsigned(watchpoint(11 downto 8)) + 1);
				when "11" => watchpoint(15 downto 12) <= std_logic_vector(unsigned(watchpoint(15 downto 12)) + 1);
				when others => null;
				end case;
			end if;
		end if;
	end process;
	
	-- Set breakpoint address
	process(CLOCK,nRESET)
	begin
		if nRESET = '0' then
			breakpoint <= (others => '0');
		elsif rising_edge(CLOCK) and mode = modeBreak then
			if r_set_n = '1' and nSET = '0' then
				-- Increment selected digit on each button press
				case digit is
				when "00" => breakpoint(3 downto 0) <= std_logic_vector(unsigned(breakpoint(3 downto 0)) + 1);
				when "01" => breakpoint(7 downto 4) <= std_logic_vector(unsigned(breakpoint(7 downto 4)) + 1);
				when "10" => breakpoint(11 downto 8) <= std_logic_vector(unsigned(breakpoint(11 downto 8)) + 1);
				when "11" => breakpoint(15 downto 12) <= std_logic_vector(unsigned(breakpoint(15 downto 12)) + 1);

				when others => null;
				end case;
			end if;
		end if;
	end process;
	
	-- CPU control logic
	process(CLOCK,nRESET)
	begin
		if nRESET = '0' then
			r_step_n <= '1';
			halt <= '0';
			resuming <= '0';
			instr_addr <= (others => '0');
		elsif rising_edge(CLOCK) then
			-- Register single-step button
			r_step_n <= nSTEP;
			
			-- Once the CPU has run we can trigger a new halt
			if CLKEN_IN = '1' then
				resuming <= '0';
			end if;
			
			if SYNC = '1' then
				-- Latch address of instruction fetch
				instr_addr <= A_CPU;
			end if;
			
			-- Check for halt conditions if we are not resuming from a previous halt
			if resuming = '0' then
				if RUN = '0' and SYNC = '1' then
					-- If not in RUN mode then halt on any instruction fetch
					-- (single-step)
					halt <= '1';
				end if;
				if A_CPU = breakpoint and SYNC = '1' then
					-- Halt CPU when instruction fetched from breakpoint address
					halt <= '1';
				end if;
				if A_CPU = watchpoint and SYNC = '0' and R_nW = '0' then
					-- Halt CPU when data write to watchpoint address
					halt <= '1';
				end if;
			end if;
			
			-- Resume or single step when user presses "STEP" button
			if r_step_n = '1' and nSTEP = '0' then
				resuming <= '1';
				halt <= '0';
			end if;
		end if;
	end process;
end architecture;
