--
-- SN76489 Complex Sound Generator
-- Matthew Hagerty
-- July 2020
-- https://dnotq.io
--

-- Released under the 3-Clause BSD License:
--
-- Copyright 2020 Matthew Hagerty (matthew <at> dnotq <dot> io)
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- 3. Neither the name of the copyright holder nor the names of its
-- contributors may be used to endorse or promote products derived from this
-- software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.

--
-- A huge amount of effort has gone into making this core as accurate as
-- possible to the real IC, while at the same time making it usable in all
-- digital SoC designs, i.e. retro-computer and game systems, etc.  Design
-- elements from the real IC were used and implemented when possible, with any
-- work-around or changes noted along with the reasons.
--
-- Synthesized and FPGA proven:
--
--   * Xilinx Spartan-6 LX16, SoC 21.477MHz system clock, 3.58MHz clock-enable.
--
--
-- References:
--
--   * The SN76489 datasheet
--   * Insight gained from the AY-3-8910/YM-2149 die-shot and reverse-engineered
--     schematics (similar audio chips from the same era).
--   * Real hardware (SN76489 in a ColecoVision game console).
--   * Chip quirks, use, and abuse details from friends and retro enthusiasts.
--
--
-- Generates:
--
--   * Unsigned 12-bit output for each channel.
--   * Unsigned 14-bit summation of the four channels.
--   * Signed 14-bit PCM summation of the four channels, with each channel
--     converted to -/+ zero-centered level or -/+ full-range level.
--
-- The tone counters are period-limited to prevent the very high frequency
-- outputs that the original IC is capable of producing.  Frequencies above
-- 20KHz cause problems in all-digital systems with sampling rates around
-- 44.1KHz to 48KHz.  The primary use of these high frequencies was as a
-- carrier for amplitude modulated (AM) audio.  The high frequency would be
-- filtered out by external electronics, leaving only the low frequency audio.
--
-- When the tone counters are limited, the output square-wave is disabled, but
-- the amplitude can still be changed, which allows the A.M. technique to still
-- work in a digital Soc.
--
-- I/O requires at least two clock-enable cycles.  This could be modified to
-- operate faster, i.e. based on the input-clock directly.  All inputs are
-- registered at the system-clock rate.
--
-- Optionally simulates the original 32-clock (clock-enable) I/O cycle.
--
-- The SN76489 does not have an external reset and the original IC "wakes up"
-- generating a tone.  This implementation sets the default output level to
-- full attenuation (silent output).  If the original functionality is desired,
-- modify the channel period and level register initial values.

--
-- Basic I/O interface use:
--
--   Set-up data on data_i.
--   Set ce_n_i and wr_n_i low.
--   Observe ready_o and wait for it to become high.
--   Set wr_n_i high, if done writing to the chip set ce_n_i high.

--
-- Version history:
--
-- July 21 2020
--   V1.0.  Release.  SoC tested.
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sn76489_audio is
generic                 -- 0 = normal I/O, 32 clocks per write
                        -- 1 = fast I/O, around 2 clocks per write
   ( FAST_IO_G          : std_logic := '0'

                        -- Minimum allowable period count (see comments further
                        -- down for more information), recommended:
                        --  6  18643.46Hz First audible count.
                        -- 17   6580.04Hz Counts at 16 are known to be used for
                        --                amplitude-modulation.
   ; MIN_PERIOD_CNT_G   : integer := 6
);
port
   ( clk_i              : in     std_logic -- System clock
   ; en_clk_psg_i       : in     std_logic -- PSG clock enable
   ; ce_n_i             : in     std_logic -- chip enable, active low
   ; wr_n_i             : in     std_logic -- write enable, active low
   ; ready_o            : out    std_logic -- low during I/O operations
   ; data_i             : in     std_logic_vector(7 downto 0)
   ; ch_a_o             : out    unsigned(11 downto 0)
   ; ch_b_o             : out    unsigned(11 downto 0)
   ; ch_c_o             : out    unsigned(11 downto 0)
   ; noise_o            : out    unsigned(11 downto 0)
   ; mix_audio_o        : out    unsigned(13 downto 0)
   ; pcm14s_o           : out    unsigned(13 downto 0)
);
end sn76489_audio;

architecture rtl of sn76489_audio is

   -- Registered I/O.
   signal ce_n_r              : std_logic := '1';
   signal wr_n_r              : std_logic := '1';
   signal din_r               : unsigned(7 downto 0) := x"00";
   signal ready_r             : std_logic := '1';
   signal ready_x             : std_logic;

   -- I/O FSM.
   type   io_state_t is (IO_IDLE, IO_OP, IO_WAIT);
   signal io_state_r          : io_state_t := IO_IDLE;
   signal io_state_x          : io_state_t;
   signal io_cnt_r            : unsigned(4 downto 0) := (others => '0');
   signal io_cnt_x            : unsigned(4 downto 0);
   signal en_reg_wr_s         : std_logic;

   -- Register file.
   signal reg_addr_r          : unsigned(2 downto 0) := (others => '0');
   signal reg_sel_s           : unsigned(2 downto 0);

   signal ch_a_period_r       : unsigned(9 downto 0) := (others => '0');
   signal ch_a_period_x       : unsigned(9 downto 0);
   signal ch_a_level_r        : unsigned(11 downto 0) := (others => '0');
   signal ch_a_level_x        : unsigned(11 downto 0);

   signal ch_b_period_r       : unsigned(9 downto 0) := (others => '0');
   signal ch_b_period_x       : unsigned(9 downto 0);
   signal ch_b_level_r        : unsigned(11 downto 0) := (others => '0');
   signal ch_b_level_x        : unsigned(11 downto 0);

   signal ch_c_period_r       : unsigned(9 downto 0) := (others => '0');
   signal ch_c_period_x       : unsigned(9 downto 0);
   signal ch_c_level_r        : unsigned(11 downto 0) := (others => '0');
   signal ch_c_level_x        : unsigned(11 downto 0);

   signal noise_ctrl_r        : std_logic := '0';
   signal noise_ctrl_x        : std_logic;
   signal noise_shift_r       : unsigned(1 downto 0) := (others => '0');
   signal noise_shift_x       : unsigned(1 downto 0);
   signal noise_level_r       : unsigned(11 downto 0) := (others => '0');
   signal noise_level_x       : unsigned(11 downto 0);
   signal noise_rst_r         : std_logic := '0';
   signal noise_rst_x         : std_logic;

   -- Clock conditioning counters and enables.
   signal clk_div16_r         : unsigned(3 downto 0) := (others => '0');
   signal clk_div16_x         : unsigned(3 downto 0);
   signal en_cnt_r            : std_logic := '0';
   signal en_cnt_x            : std_logic;

   -- Channel tone counters.
   signal ch_a_cnt_r          : unsigned(9 downto 0) := (others => '0');
   signal ch_a_cnt_x          : unsigned(9 downto 0);
   signal flatline_a_s        : std_logic;
   signal tone_a_r            : std_logic := '1';
   signal tone_a_x            : std_logic;

   signal ch_b_cnt_r          : unsigned(9 downto 0) := (others => '0');
   signal ch_b_cnt_x          : unsigned(9 downto 0);
   signal flatline_b_s        : std_logic;
   signal tone_b_r            : std_logic := '1';
   signal tone_b_x            : std_logic;

   signal ch_c_cnt_r          : unsigned(9 downto 0) := (others => '0');
   signal ch_c_cnt_x          : unsigned(9 downto 0);
   signal flatline_c_s        : std_logic;
   signal tone_c_r            : std_logic := '1';
   signal tone_c_x            : std_logic;
   signal c_ff_r              : std_logic := '1';
   signal c_ff_x              : std_logic;

   -- Noise counter.
   signal noise_cnt_r         : unsigned(6 downto 0) := (others => '0');
   signal noise_cnt_x         : unsigned(6 downto 0);
   signal noise_ff_r          : std_logic := '1';
   signal noise_ff_x          : std_logic;

   -- 15-bit Noise LFSR.
   signal noise_lfsr_r        : std_logic_vector(14 downto 0) := b"100_0000_0000_0000";
   signal noise_lfsr_x        : std_logic_vector(14 downto 0);
   signal noise_fb_s          : std_logic;
   signal noise_s             : std_logic;

   -- Amplitude / Attenuation control.
   signal level_a_s           : unsigned(11 downto 0);
   signal level_b_s           : unsigned(11 downto 0);
   signal level_c_s           : unsigned(11 downto 0);
   signal level_n_s           : unsigned(11 downto 0);

   -- DAC.
   signal dac_a_r             : unsigned(11 downto 0) := (others => '0');
   signal dac_b_r             : unsigned(11 downto 0) := (others => '0');
   signal dac_c_r             : unsigned(11 downto 0) := (others => '0');
   signal dac_n_r             : unsigned(11 downto 0) := (others => '0');
   signal sum_audio_r         : unsigned(13 downto 0) := (others => '0');

   -- Digital to Analogue Output-level lookup table ROM.
   --
   -- The 4-bit level from the channel register is used as an index into a
   -- calculated table of values that represent the equivalent voltage.
   --
   -- The output scale is amplitude logarithmic.
   --
   -- ln10 = Natural logarithm of 10, ~= 2.302585
   -- amp  = Amplitude in voltage, 0.2, 1.45, etc.
   -- dB   = decibel value in dB, -1.5, -3, etc.
   --
   -- dB  = 20 * log(amp) / ln10
   -- amp = 10 ^ (dB / 20)
   --
   -- -1.5dB = 0.8413951416
   -- -2.0dB = 0.7943282347
   -- -3.0dB = 0.7079457843
   --
   -- The datasheet defines 16 attenuation steps that are -2.0dB apart.
   --
   -- 1V reference values based on sixteen 2.0dB steps:
   --
   -- 1.0000, 0.7943, 0.6310, 0.5012, 0.3981, 0.3162, 0.2512, 0.1995,
   -- 0.1585, 0.1259, 0.1000, 0.0794, 0.0631, 0.0501, 0.0398, 0.0316
   --
   -- A 7-bit number (0..128) can support a scaled version of the reference
   -- list without having any duplicate values, but the difference is small at
   -- the bottom-end.  Duplicate values means several volume levels produce the
   -- same output level, and is not accurate.
   --
   -- Using using a 12-bit output value means the four channels can be summed
   -- into a 14-bit value without overflow, and leaves room for adjustments if
   -- converting to something like 16-bit PCM.  The 12-bit values also provide
   -- a nicer curve, and are easier to initialize in VHDL.
   --
   -- The lowest volume level needs to go to 0 in a digital SoC to prevent
   -- noise that would be filtered in a real system with external electronics.

   signal dac_level_s         : unsigned(11 downto 0);

   type dacrom_type is array (0 to 15) of unsigned(11 downto 0);
   signal dacrom_ar           : dacrom_type := (
      -- 4095,3253,2584,2052,1630,1295,1029, 817,
      --  649, 516, 409, 325, 258, 205, 163, 129 (forced to 0)
      x"FFF",x"CB5",x"A18",x"804",x"65E",x"50F",x"405",x"331",
      x"289",x"204",x"199",x"145",x"102",x"0CD",x"0A3",x"000");

   -- PCM signed 14-bit.
   signal sign_a_r            : unsigned(11 downto 0) := (others => '0');
   signal sign_a_x            : unsigned(11 downto 0);
   signal sign_b_r            : unsigned(11 downto 0) := (others => '0');
   signal sign_b_x            : unsigned(11 downto 0);
   signal sign_c_r            : unsigned(11 downto 0) := (others => '0');
   signal sign_c_x            : unsigned(11 downto 0);
   signal sign_n_r            : unsigned(11 downto 0) := (others => '0');
   signal sign_n_x            : unsigned(11 downto 0);
   signal pcm14s_r            : unsigned(13 downto 0) := (others => '0');

begin

   -- Register the input data at the full clock rate.
   process ( clk_i ) begin
   if rising_edge(clk_i) then
      ce_n_r  <= ce_n_i;
      wr_n_r  <= wr_n_i;
      din_r   <= unsigned(data_i);
      -- Ready is very fast so the external CPU will see the signal
      -- in time to extend the I/O operation.
      ready_r <= ready_x;
   end if;
   end process;

   -- Registered output.
   ready_o <= ready_r;


   -- -----------------------------------------------------------------------
   --
   -- External bus cycle FSM.
   --
   -- The SN76489 can only be written (registers cannot be read back), and
   -- only when the chip is selected.
   --
   -- A write operation takes 32 clock cycles.  A fast-IO mode is available
   -- if legacy timing is not important.

   bus_io : process
   ( ce_n_r, wr_n_r
   , io_state_r, io_cnt_r, ready_r
   ) begin

      io_state_x  <= io_state_r;
      io_cnt_x    <= io_cnt_r;
      ready_x     <= ready_r;
      en_reg_wr_s <= '0';

      case io_state_r is

      when IO_IDLE =>
         -- Wait for CE_n and WR_n.
         if ce_n_r = '0' and wr_n_r = '0' then
            io_state_x <= IO_OP;
            ready_x <= '0';

            if FAST_IO_G = '1' then
               -- No delay.
               io_cnt_x <= (others => '0');
            else
               -- The real IC takes 32 cycles for an I/O operation.
               io_cnt_x <= to_unsigned(31, io_cnt_x'length);
            end if;
         end if;

      when IO_OP =>
         if io_cnt_r = 0 then
            io_state_x  <= IO_WAIT;
            en_reg_wr_s <= '1';
            ready_x     <= '1';
         else
            io_cnt_x <= io_cnt_r - 1;
         end if;

      when IO_WAIT =>
         -- The CPU must end the write-cycle; fine if CE_n is still asserted.
         if wr_n_r = '1' then
            io_state_x <= IO_IDLE;
         end if;

      end case;
   end process;


   process
   ( clk_i, en_clk_psg_i
   ) begin
   if rising_edge(clk_i) then
      if en_clk_psg_i = '1' then
         io_state_r  <= io_state_x;
         io_cnt_r    <= io_cnt_x;
      end if;
   end if;
   end process;


   -- -----------------------------------------------------------------------
   --
   -- Registers.  Setting the channel tone period requires two writes to set
   -- the full 10-bit value.  Bit numbering is n..0, which is *BACKWARDS* from
   -- TI's bit numbering during this era.
   --
   --     7654 3210
   -- R0  1000 PPPP  Channel A tone period 3..0.
   --     0-PP PPPP  Channel A tone period 9..4.
   -- R1  1001 AAAA  Channel A attenuation.
   -- R2  1010 PPPP  Channel B tone period 3..0.
   --     0-PP PPPP  Channel B tone period 9..4.
   -- R3  1011 AAAA  Channel B attenuation.
   -- R4  1100 PPPP  Channel C tone period 3..0.
   --     0-PP PPPP  Channel C tone period 9..4.
   -- R5  1101 AAAA  Channel C attenuation.
   -- R6  1110 -F--  Noise feedback, 0=periodic, 1=white noise
   --     1110 --SS  Noise shift rate, 00=N/512, 01=N/1024, 10=N/2048, 11=Channel C
   -- R7  1111 AAAA  Noise attenuation.

   -- The register last written is latched, so any bytes written with a '0' in
   -- the MS-bit will go to the same register.

   -- The output-level is converted to the equivalent DAC value and stored as
   -- as the look-up result, rather than the 4-bit level index.  This allows
   -- sharing of the ROM lookup table, and uses less FPGA resources.

   dac_level_s <= dacrom_ar(to_integer(unsigned(din_r(3 downto 0))));

   register_file : process
   ( din_r, reg_addr_r, reg_sel_s, dac_level_s, en_reg_wr_s
   , ch_a_period_r, ch_a_level_r
   , ch_b_period_r, ch_b_level_r
   , ch_c_period_r, ch_c_level_r
   , noise_ctrl_r,  noise_level_r, noise_shift_r
   ) begin

      -- Register writes go to the specified register, data writes go to the
      -- previously written register.
      if din_r(7) = '0' then
         reg_sel_s <= reg_addr_r;
      else
         reg_sel_s <= din_r(6 downto 4);
      end if;

      ch_a_period_x  <= ch_a_period_r;
      ch_a_level_x   <= ch_a_level_r;
      ch_b_period_x  <= ch_b_period_r;
      ch_b_level_x   <= ch_b_level_r;
      ch_c_period_x  <= ch_c_period_r;
      ch_c_level_x   <= ch_c_level_r;

      noise_ctrl_x   <= noise_ctrl_r;
      noise_shift_x  <= noise_shift_r;
      noise_level_x  <= noise_level_r;
      noise_rst_x    <= '0';


      case reg_sel_s is

      when "000" =>
         if din_r(7) = '0' then
            ch_a_period_x <= din_r(5 downto 0) & ch_a_period_r(3 downto 0);
         else
            ch_a_period_x <= ch_a_period_r(9 downto 4) & din_r(3 downto 0);
         end if;

      when "001" =>
         ch_a_level_x <= dac_level_s;

      when "010" =>
         if din_r(7) = '0' then
            ch_b_period_x <= din_r(5 downto 0) & ch_b_period_r(3 downto 0);
         else
            ch_b_period_x <= ch_b_period_r(9 downto 4) & din_r(3 downto 0);
         end if;

      when "011" =>
         ch_b_level_x <= dac_level_s;

      when "100" =>
         if din_r(7) = '0' then
            ch_c_period_x <= din_r(5 downto 0) & ch_c_period_r(3 downto 0);
         else
            ch_c_period_x <= ch_c_period_r(9 downto 4) & din_r(3 downto 0);
         end if;

      when "101" =>
         ch_c_level_x <= dac_level_s;

      when "110" =>
         noise_ctrl_x  <= din_r(2);
         noise_shift_x <= din_r(1 downto 0);
         -- Writing to the noise control register resets the LFSR to its
         -- initialization value.
         noise_rst_x   <= en_reg_wr_s;

      --   "111"
      when others =>
         noise_level_x <= dac_level_s;

         null;
      end case;
   end process;


   process
   ( clk_i, en_clk_psg_i
   ) begin
   if rising_edge(clk_i) then
      if en_clk_psg_i = '1' then

         noise_rst_r <= noise_rst_x;

         if en_reg_wr_s = '1' then
            -- Latch the register when the write specifies a register.
            reg_addr_r     <= reg_sel_s;

            ch_a_period_r  <= ch_a_period_x;
            ch_a_level_r   <= ch_a_level_x;
            ch_b_period_r  <= ch_b_period_x;
            ch_b_level_r   <= ch_b_level_x;
            ch_c_period_r  <= ch_c_period_x;
            ch_c_level_r   <= ch_c_level_x;

            noise_ctrl_r   <= noise_ctrl_x;
            noise_shift_r  <= noise_shift_x;
            noise_level_r  <= noise_level_x;
         end if;

      end if;
   end if;
   end process;


   -- -----------------------------------------------------------------------
   --
   -- Clock conditioning.  Reduce the input clock to provide the divide by
   -- sixteen clock-phases.
   --

   clk_div16_x <= clk_div16_r + 1;
   en_cnt_x    <= '1' when clk_div16_r = 0 else '0';

   process
   ( clk_i, en_clk_psg_i
   ) begin
   if rising_edge(clk_i) then
      if en_clk_psg_i = '1' then
         clk_div16_r <= clk_div16_x;
         en_cnt_r    <= en_cnt_x;
      end if;
   end if;
   end process;


   -- -----------------------------------------------------------------------
   --
   -- Channel tone counters.  The counters *always* count.
   --
   -- The counters count *down* and load the period when they reach zero.  The
   -- zero-check-and-load are all part of the same cycle.  An implementation in
   -- C might look like this:
   --
   -- {
   --   if ( counter == 0 ) {
   --     tone = !tone;
   --     counter = period;
   --   }
   --
   --   counter--;
   -- }
   --
   -- With the period work-around described below:
   --
   -- {
   --   if ( counter == 0 )
   --   {
   --     if ( period > 0 and period < 6 ) {
   --       tone = 1;
   --     } else {
   --       tone = !tone;
   --     }
   --
   --     counter = period;
   --   }
   --
   --   counter--;
   -- }
   --
   -- This also demonstrates why changing the tone period will not take effect
   -- until the next cycle of the counter.  Interestingly, the same counter is
   -- used in the AY-3-8910 and YM-2149, only slightly modified to count up
   -- (actually, in silicon both up and down counters are present
   -- simultaneously) and reset on a >= period condition.
   --

   -- Amplitude Modulation.
   --
   -- With a typical 3.5MHz to 4.0MHz (max) input clock, the main-clock divide
   -- by sixteen produces a 223.72KHz clock into the tone counters.  With small
   -- period counts, frequencies *well over* the human hearing range can be
   -- produced.
   --
   -- The problem with the frequencies over 20KHz is, in a digital SoC the high
   -- frequencies do not filter out like they do when the output is connected
   -- to an external low-pass filter and inductive load (speaker), like they
   -- are with the real IC.
   --
   -- In an all digital system with digital audio, the generated frequencies
   -- should never be more than the Nyquist frequency (twice the sample rate).
   -- Typical sample rates are 44.1KHz or 48KHz, so any frequency over 20KHz
   -- should not be output (and is not audible to a human anyway).
   --
   -- The work-around here is to flat-line the toggle flip-flop for any tone
   -- counter with a period that produces a frequency over the Nyquist rate.
   -- This change still allows the technique of modulating the output with
   -- rapid volume level changes.
   --
   -- Based on a typical PSG clock of 3.58MHz for a Z80-based system, the
   -- period counts that cause frequencies above 20KHz are:
   --
   -- f = CLK / (32 * Count)
   --
   -- Clk  3,579,545Hz   2.793651ns
   --
   -- Cnt  Frequency     Period
   --   1 111860.78Hz    8.9396us
   --   2  55930.39Hz   17.8793us
   --   3  37286.92Hz   26.8190us
   --   4  27965.19Hz   35.7587us
   --   5  22372.15Hz   44.6984us
   -- ---------------------------
   --   6  18643.46Hz   53.6381us  First audible count.
   --   7  15980.11Hz   62.5777us
   --   8  13982.59Hz   71.5174us
   --   9  12428.97Hz   80.4571us
   --  10  11186.07Hz   89.3968us
   --  11  10169.16Hz   98.3365us
   --  12   9321.73Hz  107.2762us
   --  13   8604.67Hz  116.2158us
   --  14   7990.05Hz  125.1555us
   --  15   7457.38Hz  134.0952us
   --  16   6991.29Hz  143.0349us  Used by some software for level-modulation.
   -- ---------------------------
   --  17   6580.04Hz  151.9746us
   -- ...
   --   0    109.23Hz    9.1542ms  A count of zero is the maximum period.
   --
   -- While a count of 6 is technically the Nyquist cut-off, some game software
   -- is known to use a period of 16 as the base frequency for the amplitude
   -- modulation hack.  While audible, the 7KHz tone is not very musical, and
   -- causes a harsh (if not painful) undertone to the sound being created with
   -- the amplitude modulation.
   --
   -- Suffice to say, setting the flat-line cut-off to 16 should not affect the
   -- audio for most software in any negative way, but can help some software
   -- sound better.


   -- A channel counter and tone flip-flop.
   ch_a_cnt_x <=
      -- Load uses count-enable next-state look-ahead when counter is 0.
      ch_a_period_r  when (en_cnt_x = '1' and ch_a_cnt_r = 0) else
      -- Counting uses the current-state.
      ch_a_cnt_r - 1 when  en_cnt_r = '1' else
      ch_a_cnt_r;

   flatline_a_s <=
      '1' when ch_a_period_r > 0 and ch_a_period_r < MIN_PERIOD_CNT_G else
      '0';

   tone_a_x <=
      -- Flat-line the output for counts that produce frequencies > 20KHz.
      '1' when flatline_a_s = '1' else
      -- Toggle channel tone flip-flop when the counter reaches 0.
      -- Same look-ahead condition as the counter-load.
      not tone_a_r when (en_cnt_x = '1' and ch_a_cnt_r = 0) else
      tone_a_r;

   -- B channel counter and tone flip-flop.
   ch_b_cnt_x <=
      ch_b_period_r when (en_cnt_x = '1' and ch_b_cnt_r = 0) else
      ch_b_cnt_r - 1  when  en_cnt_r = '1' else
      ch_b_cnt_r;

   flatline_b_s <=
      '1' when ch_b_period_r > 0 and ch_b_period_r < MIN_PERIOD_CNT_G else
      '0';

   tone_b_x <=
      '1' when flatline_b_s = '1' else
      not tone_b_r when (en_cnt_x = '1' and ch_b_cnt_r = 0) else
      tone_b_r;

   -- C channel counter and tone flip-flop.
   ch_c_cnt_x <=
      ch_c_period_r when (en_cnt_x = '1' and ch_c_cnt_r = 0) else
      ch_c_cnt_r - 1  when  en_cnt_r = '1' else
      ch_c_cnt_r;

   flatline_c_s <=
      '1' when ch_c_period_r > 0 and ch_c_period_r < MIN_PERIOD_CNT_G else
      '0';

   tone_c_x <= flatline_c_s or c_ff_r;

   -- The work-around to limit high frequency outputs interferes with Channel-C
   -- being able to clock the noise shift register.  This is a work-around to
   -- that work-around, to always have an output from Channel-C that can be
   -- used to clock the noise shift register.
   c_ff_x <=
      not c_ff_r when (en_cnt_x = '1' and ch_c_cnt_r = 0) else
      c_ff_r;


   process
   ( clk_i, en_clk_psg_i
   ) begin
   if rising_edge(clk_i) then

      if en_clk_psg_i = '1' then
         ch_a_cnt_r <= ch_a_cnt_x;
         tone_a_r   <= tone_a_x;

         ch_b_cnt_r <= ch_b_cnt_x;
         tone_b_r   <= tone_b_x;

         ch_c_cnt_r <= ch_c_cnt_x;
         tone_c_r   <= tone_c_x;
         c_ff_r     <= c_ff_x;
      end if;

   end if;
   end process;


   -- -----------------------------------------------------------------------
   --
   -- Noise period counter.  A continuous counter to further divide the input
   -- clock by 32, 64, or 128.  The output goes to a selector, controlled by the
   -- noise register, to choose one of the three rates, or the output flip-flop
   -- of channel C, to drive the LFSR.

   noise_cnt_x <=
      noise_cnt_r + 1 when en_cnt_r = '1' else
      noise_cnt_r;

   with noise_shift_r select
   noise_ff_x <=                     -- N = PSG input clock, typical 3.58MHz.
      noise_cnt_r(4) when      "00", -- N /  512 = approx 6991.2988Hz  143.034us
      noise_cnt_r(5) when      "01", -- N / 1024 = approx 3495.6494Hz  286.069us
      noise_cnt_r(6) when      "10", -- N / 2048 = approx 1747.8247Hz  572.139us
      c_ff_r when others; --   "11"  -- Channel C tone as the clock.


   -- The noise can be periodic or white depending on the feedback-bit in the
   -- noise control register.  0 = periodic, which just disables the XOR of the
   -- LFSR and loops the single initialization bit through the shift register.
   --
   -- Noise 15-bit right-shift LFSR with taps at 0 and 1, LS-bit is the output.
   -- Reset loads the LFSR with 0x4000 to prevent lock-up.  The same pattern
   -- can be obtained with a left-shift, taps at 13 and 14, MS-bit output.
   --
   -- Accurate implementation in C, no branching:
   --
   --   uint32_t lfsr;
   --   uint8_t  noise_bit;
   --
   --   // A 15-input NOR gate ensures init with 100_0000_0000_0000
   --   lfsr = (1 << 14);
   --
   --   // Taps at 0 and 1, mask result.
   --   int32_t fb = ((lfsr >> 0) ^ (lfsr >> 1)) & 1;
   --
   --   // Right-shift, feedback bit to the most-significant bit.
   --   lfsr = (lfsr >> 1) | (fb << 14);
   --
   --   noise_bit = (lfsr & 1);
   --

   noise_fb_s <=
      (noise_ctrl_r and noise_lfsr_r(1)) xor noise_lfsr_r(0);
   noise_lfsr_x <= noise_fb_s & noise_lfsr_r(14 downto 1);
   noise_s <= noise_lfsr_r(0);


   process
   ( clk_i, en_clk_psg_i, noise_rst_r
   ) begin
   if rising_edge(clk_i) then

      -- ** NOTE: This reset is active high.
      if noise_rst_r = '1' then
         noise_cnt_r  <= (others => '0');
         noise_ff_r   <= '1';
         noise_lfsr_r <= b"100_0000_0000_0000";

      elsif en_clk_psg_i = '1' then
         noise_cnt_r <= noise_cnt_x;
         noise_ff_r  <= noise_ff_x;
         -- Look-ahead rising-edge detect the noise flip-flop.
         if noise_ff_r = '0' and noise_ff_x = '1' then
            noise_lfsr_r <= noise_lfsr_x;
         end if;
      end if;

   end if;
   end process;


   -- -----------------------------------------------------------------------
   --
   -- Amplitude / Attenuation control.  The amplitude of each channel is
   -- controlled by the channel's 4-bit attenuation register.
   --
   -- The "level" in the SN76489 is an amount of attenuation, and the channel's
   -- level has already been converted into its DAC level.  When the tone
   -- flip-flop is '0', the most attenuation (minimum DAC level) is output.

   level_a_s <=
      (others => '0') when tone_a_r = '0' else
      ch_a_level_r;

   level_b_s <=
      (others => '0') when tone_b_r = '0' else
      ch_b_level_r;

   level_c_s <=
      (others => '0') when tone_c_r = '0' else
      ch_c_level_r;

   level_n_s <=
      (others => '0') when noise_s = '0' else
      noise_level_r;


   -- -----------------------------------------------------------------------
   --
   -- Output registers and unsigned summation.  If the level had not already
   -- been converted to the output level, this would also be the DAC section.
   --

   ch_a_o  <= dac_a_r;
   ch_b_o  <= dac_b_r;
   ch_c_o  <= dac_c_r;
   noise_o <= dac_n_r;
   mix_audio_o <= sum_audio_r;

   process
   ( clk_i, en_clk_psg_i
   ) begin
   if rising_edge(clk_i) then
   if en_clk_psg_i = '1' then

      dac_a_r <= level_a_s;
      dac_b_r <= level_b_s;
      dac_c_r <= level_c_s;
      dac_n_r <= level_n_s;

      -- Sum the audio channels.
      sum_audio_r <= ("00" & level_a_s) + ("00" & level_b_s) +
                     ("00" & level_c_s) + ("00" & level_n_s);
   end if;
   end if;
   end process;


   -- -----------------------------------------------------------------------
   --
   -- Signed zero-centered 14-bit PCM.
   --

   -- Make a -/+ level value depending on the tone state.  When the flat-line
   -- work-around for frequencies over the Nyquist rate is in effect, adjust
   -- the unsigned level-range to a signed-level range.
   --
   -- signed_level =
   --    level - (range / 2) when flat-line
   --
   -- otherwise, -/+ zero-centered square-wave:
   --
   -- signed_level =
   --  -(level / 2)          when tone == 0
   --   (level / 2)          when tone == 1

   sign_a_x <=
      ch_a_level_r - x"800"                   when flatline_a_s = '1' else
      ("1" & (not ch_a_level_r(11 downto 1))) + 1 when tone_a_r = '0' else
      ("0" &      ch_a_level_r(11 downto 1));

   sign_b_x <=
      ch_b_level_r - x"800"                   when flatline_b_s = '1' else
      ("1" & (not ch_b_level_r(11 downto 1))) + 1 when tone_b_r = '0' else
      ("0" &      ch_b_level_r(11 downto 1));

   sign_c_x <=
      ch_c_level_r - x"800"                   when flatline_c_s = '1' else
      ("1" & (not ch_c_level_r(11 downto 1))) + 1 when tone_c_r = '0' else
      ("0" &      ch_c_level_r(11 downto 1));

   sign_n_x <=
      ("1" & (not noise_level_r(11 downto 1))) + 1 when noise_s = '0' else
      ("0" &      noise_level_r(11 downto 1));


   pcm14s_o <= pcm14s_r;


   process
   ( clk_i, en_clk_psg_i
   ) begin
   if rising_edge(clk_i) then
   if en_clk_psg_i = '1' then

      sign_a_r <= sign_a_x;
      sign_b_r <= sign_b_x;
      sign_c_r <= sign_c_x;
      sign_n_r <= sign_n_x;

      -- Sum to signed 14-bit and left-align to signed 16-bit.
      pcm14s_r <=
         (sign_a_r(11) & sign_a_r(11) & sign_a_r) +
         (sign_b_r(11) & sign_b_r(11) & sign_b_r) +
         (sign_c_r(11) & sign_c_r(11) & sign_c_r) +
         (sign_n_r(11) & sign_n_r(11) & sign_n_r);

   end if;
   end if;
   end process;

end rtl;
