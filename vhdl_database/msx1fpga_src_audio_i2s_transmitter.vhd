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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity i2s_transmitter is
	generic (
		mclk_rate		: positive := 24576000;		-- sample_rate * word_length * 2 * x || x in [2,4,8,16,32...]?
		sample_rate		: positive := 96000;
		preamble			: integer := 0;				-- 0=Left-justified, 1=I2S
		word_length		: positive := 16
	);
	port (
		clock_i			: in  std_logic;				-- 2x MCLK in
		reset_i			: in  std_logic;
		-- Parallel input
		pcm_l_i			: in  std_logic_vector(word_length - 1 downto 0);
		pcm_r_i			: in  std_logic_vector(word_length - 1 downto 0);

		i2s_mclk_o		: out std_logic;				-- MCLK is generated at half of the CLK input
		i2s_lrclk_o		: out std_logic;				-- LRCLK is equal to the sample rate and is synchronous to MCLK.
		i2s_bclk_o		: out std_logic;
		i2s_d_o			: out std_logic
	);
end entity;

architecture rtl of i2s_transmitter is

	constant ratio_mclk_fs	: positive := (mclk_rate / sample_rate);	-- 24 MHz / 96KHz = 256
	constant lrdivider_top	: positive := ratio_mclk_fs - 1;
	constant bdivider_top	: positive := (ratio_mclk_fs / 4 / (preamble + word_length) * 2) - 1;
	constant nbits				: positive := preamble + word_length;

	subtype lrdivider_t	is integer range 0 to lrdivider_top;
	subtype bdivider_t	is integer range 0 to bdivider_top;
	subtype bitcount_t	is integer range 0 to nbits;

	signal lrdivider			: lrdivider_t; 
	signal bdivider			: bdivider_t;
	signal bitcount			: bitcount_t;

	signal mclk_r				: std_logic;
	signal lrclk_r				: std_logic;
	signal bclk_r				: std_logic;

	-- Shift register is long enough for the number of data bits
	-- plus the preamble, plus an extra bit on the right to register
	-- the incoming data
	signal shiftreg : std_logic_vector(nbits downto 0);

begin

	i2s_mclk_o	<= mclk_r;
	i2s_lrclk_o	<= lrclk_r;
	i2s_bclk_o	<= bclk_r;
	i2s_d_o		<= shiftreg(nbits); -- data goes out MSb first

	process(reset_i, clock_i)
	begin
		if reset_i = '1' then
			-- Preload down-counters for clock generation
			lrdivider	<= lrdivider_top;
			bdivider		<= bdivider_top;
			bitcount		<= nbits;
			
			mclk_r		<= '0';
			lrclk_r		<= '0';
			bclk_r		<= '0';
			shiftreg		<= (others => '0');

		elsif rising_edge(clock_i) then
			-- Generate MCLK at half input clock rate
			mclk_r <= not mclk_r;
			
			-- Generate LRCLK at rate specified by codec configuration
			if lrdivider = 0 then
				-- LRCLK divider has reached 0 - start again from the top
				lrdivider <= lrdivider_top;
				
				-- Generate LRCLK edge and sync the BCLK counter
				lrclk_r <= not lrclk_r;
				bclk_r <= '0';
				bitcount <= nbits; -- 1 extra required for setup
				bdivider <= bdivider_top;
				
				-- Load shift register with output data padding preamble
				-- with 0s.  Load output buses with input word from the 
				-- previous timeslot.
				shiftreg(nbits downto nbits - preamble + 1) <= (others => '0');
				if lrclk_r = '0' then
					-- Next channel to output is RIGHT.  Load this into the
					-- shift register at the start of a cycle, left justified
					shiftreg(word_length downto 1) <= pcm_r_i;
				else
					-- Next channel is LEFT
					shiftreg(word_length downto 1) <= pcm_l_i;
				end if;
			else
				-- Decrement the LRCLK counter
				lrdivider <= lrdivider - 1;
				
				-- Generate BCLK at a suitable rate to fit the required number
				-- of bits into each timeslot.  Data is changed on the falling edge,
				-- sampled on the rising edge
				if bdivider = 0 then
					-- If all bits have been output for this phase then
					-- stop and wait to sync back up with LRCLK
					if bitcount > 0 then
						-- Reset
						bdivider <= bdivider_top;
						
						-- Toggle BCLK
						bclk_r <= not bclk_r;
						if bclk_r = '0' then
							-- Rising edge - decrement bit counter
							bitcount <= bitcount - 1;
						else
							-- Falling edge - shift out next bit
							shiftreg(nbits downto 1) <= shiftreg(nbits - 1 downto 0);
						end if;
					end if;
				else
					-- Decrement the BCLK counter
					bdivider <= bdivider - 1;
				end if;
			end if;
			
		end if;
	end process;

end architecture;

