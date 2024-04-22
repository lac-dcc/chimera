-- -----------------------------------------------------------------------
--
-- VGA-64
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2012 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/chameleon.html
-- -----------------------------------------------------------------------
--
-- C64 Phi2-clock regeneration and divider
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_phi_clock is
--constant phaseShift : integer := 5; -- Number of cycles that FPGA runs ahead of measured phi.
constant phaseShift : integer := 8; -- Number of cycles that FPGA runs ahead of measured phi.
constant guardBits : integer := 4; -- Extra bits to reduce rounding errors in calculations
signal phi2_n_reg : unsigned(7 downto 0);
signal phiSync : std_logic := '0';

signal locCnt : unsigned(7 downto 0) := (others => '0');
signal fracCnt : unsigned(guardBits-1 downto 0) := (others => '0');
signal c64Cnt : unsigned(7 downto 0) := (others => '0');
signal slvCnt : unsigned(7 downto 0) := (others => '0');

signal avgDelta : signed(8 downto 0) := (others => '0');
signal avgLen : unsigned((7+guardBits) downto 0) := (others => '0');

signal localPreHalf : std_logic := '0';
signal localHalf : std_logic := '0';
signal localPreEnd : std_logic := '0';
signal localEnd : std_logic := '0';

signal localPhi : std_logic := '0';

signal localPost1 : std_logic := '0';
signal localPost2 : std_logic := '0';
signal localPost3 : std_logic := '0';
signal localPost4 : std_logic := '0';
begin
	-- Average phi length
	phiLength <= avgLen((7+guardBits) downto guardBits);
	
	-- Local generated phi
	phiLocal <= localPhi;
	
	-- Cycle counter (add 1 to max-counter for each Mhz system clock)
	-- For 100Mhz the cycle-counter runs to about 97 (NTSC) or 102 (PAL)
	phiCnt <= locCnt;
	phiPreHalf <= localPreHalf;
	phiHalf <= localHalf;
	phiPreEnd <= localPreEnd;
	phiEnd <= localEnd;
	
	phiPost1 <= localPost1;
	phiPost2 <= localPost2;
	phiPost3 <= localPost3;
	phiPost4 <= localPost4;

	-- Input clock synchronizer
	process(clk) is
	begin
		if rising_edge(clk) then
			phiSync <= '0';
			phi2_n_reg <= phi2_n_reg(phi2_n_reg'high-1 downto 0) & phi2_n;
			-- Detect falling edge of phi2 (is rising edge here as phi2_n input is inverted).
			if phi2_n_reg = "00000001" then
				phiSync <= '1';
			end if;
		end if;
	end process;

	-- Determine cycle length
	process(clk) is
	begin
		if rising_edge(clk) then
			no_clock <= '0';
			docking_station <= '0';
			avgDelta <= (others => '0');
			avgLen <= unsigned(signed(avgLen) + avgDelta);
			
			if (not c64Cnt) /= 0 then
				c64Cnt <= c64Cnt + 1;
			else
				-- No Sync? Use internal speed.

				-- Values for avgLen are determined experimentally using the testbench to measure actually speed.
				-- Higher numbers slow down clock. Lower numbers speed clock up. Try a few times until optimum is reached
				-- for particular system clock (100 Mhz at time of writing). Clocks can be accurate to atleast 3 digits with 4 guard bits.
				-- PAL mode 0.985248 Mhz
				avgLen <= to_unsigned(1703, 8+guardBits);
				if mode = '1' then
					-- NTSC mode 1.022727 Mhz
					avgLen <= to_unsigned(1643, 8+guardBits);
				end if;
				if (phi2_n_reg(1) = '1') and (phi2_n_reg(2) = '1') and (phi2_n_reg(3) = '1') then
					docking_station <= '1';
				end if;
				no_clock <= '1';
			end if;
			if phiSync = '1' then
				avgDelta <= signed("0" & c64Cnt) - signed("0" & avgLen((7+guardBits) downto guardBits));
				c64Cnt <= (others => '0');
			end if;
		end if;	
	end process;

	process(clk) is
	begin
		if rising_edge(clk) then
			localPost1 <= localHalf or localEnd;
			localPost2 <= localPost1;
			localPost3 <= localPost2;
			localPost4 <= localPost3;
		end if;
	end process;

	process(clk) is
		variable newFrac : unsigned(fracCnt'high+1 downto fracCnt'low);
	begin
		if rising_edge(clk) then
			localPreHalf <= '0';
			localHalf <= localPreHalf;
			localPreEnd <= '0';
			localEnd <= localPreEnd;
			
			locCnt <= locCnt + 1;
			if slvCnt >=  avgLen((7+guardBits) downto guardBits) then
				slvCnt <= (others => '0');
			else
				slvCnt <= slvCnt + 1;
			end if;

			if (slvCnt + phaseShift) = avgLen((7+guardBits) downto (1+guardBits)) then
				localPreHalf <= '1';
			end if;
			if (slvCnt + phaseShift) = avgLen((7+guardBits) downto guardBits)
			and localPhi = '1' then
				localPreEnd <= '1';
			end if;
			if localHalf = '1' then
				localPhi <= '1';
			end if;
			if localEnd = '1' then
				-- Add fractional part to clock counter to have higher precision
				newFrac := ("0" & fracCnt) + ("0" & (not avgLen(guardBits-1 downto 0)));
				fracCnt <= newFrac(fracCnt'range);

				localPhi <= '0';
				locCnt <= (others => '0');
				slvCnt <= c64Cnt + ("0000000" & newFrac(newFrac'high));
			end if;
		end if;
	end process;
end architecture;
