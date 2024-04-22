--
-- A simulation model of YM2149 (AY-3-8910 with bells on)

-- Copyright (c) MikeJ - Jan 2005
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
-- Clues from MAME sound driver and Kazuhiro TSUJIKAWA
--
-- These are the measured outputs from a real chip for a single Isolated channel into a 1K load (V)
-- vol 15 .. 0
-- 3.27 2.995 2.741 2.588 2.452 2.372 2.301 2.258 2.220 2.198 2.178 2.166 2.155 2.148 2.141 2.132
-- As the envelope volume is 5 bit, I have fitted a curve to the not quite log shape in order
-- to produced all the required values.
-- (The first part of the curve is a bit steeper and the last bit is more linear than expected)
--
-- NOTE, this component uses LINEAR mixing of the three analogue channels, and is only
-- accurate for designs where the outputs are buffered and not simply wired together.
-- The ouput level is more complex in that case and requires a larger table.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;
library work;
  use work.zpuino_config.all;
  use work.zpu_config.all;
  use work.zpupkg.all;
  use work.zpuinopkg.all;
  
entity zpuino_io_YM2149 is
  generic (
    FREQMHZ: integer := 96
  );
  port (
  wb_clk_i:   in std_logic;
  wb_rst_i:   in std_logic;
  wb_dat_i:   in std_logic_vector(wordSize-1 downto 0);
  wb_dat_o:   out std_logic_vector(wordSize-1 downto 0);
  wb_adr_i:   in std_logic_vector(maxIOBit downto minIOBit);
  wb_we_i:    in std_logic;
  wb_cyc_i:   in std_logic;
  wb_stb_i:   in std_logic;
  wb_ack_o:   out std_logic;
  wb_inta_o:  out std_logic;
  id:         out slot_id;
  data_out:   out std_logic_vector(7 downto 0)
  );
end;

architecture RTL of zpuino_io_YM2149 is
  type  array_16x8   is array (0 to 15) of std_logic_vector(7 downto 0);
  type  array_3x12   is array (1 to 3) of std_logic_vector(11 downto 0);

  signal cnt_div              : std_logic_vector(3 downto 0) := (others => '0');
  signal noise_div            : std_logic := '0';
  signal ena_div              : std_logic;
  signal ena_div_noise        : std_logic;
  signal poly17               : std_logic_vector(16 downto 0) := (others => '0');

  -- registers
--  signal addr                 : std_logic_vector(7 downto 0);
--  signal busctrl_addr         : std_logic;
--  signal busctrl_we           : std_logic;
--  signal busctrl_re           : std_logic;

  signal reg                  : array_16x8;
  signal env_reset            : std_logic;
  signal ioa_inreg            : std_logic_vector(7 downto 0);
  signal iob_inreg            : std_logic_vector(7 downto 0);

  signal noise_gen_cnt        : std_logic_vector(4 downto 0);
  signal noise_gen_op         : std_logic;
  signal tone_gen_cnt         : array_3x12 := (others => (others => '0'));
  signal tone_gen_op          : std_logic_vector(3 downto 1) := "000";

  signal env_gen_cnt          : std_logic_vector(15 downto 0);
  signal env_ena              : std_logic;
  signal env_hold             : std_logic;
  signal env_inc              : std_logic;
  signal env_vol              : std_logic_vector(4 downto 0);

  signal tone_ena_l           : std_logic;
  signal tone_src             : std_logic;
  signal noise_ena_l          : std_logic;
  signal chan_vol             : std_logic_vector(4 downto 0);

  signal dac_amp              : std_logic_vector(7 downto 0);
  signal audio_mix            : std_logic_vector(9 downto 0) := (others => '0');
  signal audio_final          : std_logic_vector(9 downto 0) := (others => '0');

  signal O_AUDIO              : std_logic_vector(7 downto 0) := (others => '0');
  signal I_SEL_L              : std_logic;
  signal ENA                  : std_logic;

  signal TEST_tone0: std_logic;
  signal TEST_tone1: std_logic;
  signal TEST_tone2: std_logic;
  signal TEST_chan: unsigned(1 downto 0);

  signal divclken: std_logic := '0';
  signal predivcnt: integer;
  constant PRE_CLOCK_DIVIDER: integer := (FREQMHZ/2)-1;

begin

  TEST_chan <= unsigned( cnt_div(1 downto 0) );
  TEST_tone0<=tone_gen_op(1);
  TEST_tone1<=tone_gen_op(2);
  TEST_tone2<=tone_gen_op(3);

  id <= x"02" & x"01"; -- Vendor: FPGAArcade  Product: YM2149
  -- wishbone signals  
  wb_ack_o <= wb_cyc_i and wb_stb_i;
  wb_inta_o <= '0';
  
  I_SEL_L <= '1';
  ENA <= '1';
  data_out <= O_AUDIO;

  p_wdata                : process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
       reg <= (others => (others => '0'));
      else
        if wb_cyc_i='1' and wb_we_i='1' and wb_stb_i='1' then
          reg(conv_integer(wb_adr_i(5 downto 2))) <= wb_dat_i(7 downto 0);
        end if;
      end if;

    -- Envelope reset
    env_reset <= '0';
    if (wb_we_i = '1' and wb_cyc_i='1' and wb_stb_i='1') and (wb_adr_i(5 downto 2) = x"D") then
      env_reset <= '1';
      end if;

    end if;
  end process;

  p_rdata                : process(wb_adr_i, reg)
  begin
    wb_dat_o <= (others => '0'); -- 'X'
--    if (busctrl_re = '1') then -- not necessary, but useful for putting 'X's in the simulator
    case wb_adr_i(5 downto 2) is
        when x"0" => wb_dat_o(7 downto 0) <= reg(0) ;
        when x"1" => wb_dat_o(7 downto 0) <= "0000" & reg(1)(3 downto 0) ;
        when x"2" => wb_dat_o(7 downto 0) <= reg(2) ;
        when x"3" => wb_dat_o(7 downto 0) <= "0000" & reg(3)(3 downto 0) ;
        when x"4" => wb_dat_o(7 downto 0) <= reg(4) ;
        when x"5" => wb_dat_o(7 downto 0) <= "0000" & reg(5)(3 downto 0) ;
        when x"6" => wb_dat_o(7 downto 0) <= "000"  & reg(6)(4 downto 0) ;
        when x"7" => wb_dat_o(7 downto 0) <= reg(7) ;
        when x"8" => wb_dat_o(7 downto 0) <= "000"  & reg(8)(4 downto 0) ;
        when x"9" => wb_dat_o(7 downto 0) <= "000"  & reg(9)(4 downto 0) ;
        when x"A" => wb_dat_o(7 downto 0) <= "000"  & reg(10)(4 downto 0) ;
        when x"B" => wb_dat_o(7 downto 0) <= reg(11);
        when x"C" => wb_dat_o(7 downto 0) <= reg(12);
        when x"D" => wb_dat_o(7 downto 0) <= "0000" & reg(13)(3 downto 0);
        when others => null;
      end case;
  end process;
  --

  --
  -- First divider.
  --

  predivider: process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        divclken <= '0';
        predivcnt <= PRE_CLOCK_DIVIDER;
      else
        divclken<='0';
        if predivcnt=0 then
          divclken<='1';
          predivcnt <= PRE_CLOCK_DIVIDER;
        else
          predivcnt <= predivcnt -1 ;
        end if;
      end if;
    end if;
  end process;


 p_divider              : process
 begin
   wait until rising_edge(wb_clk_i);
   -- / 8 when SEL is high and /16 when SEL is low
   if (ENA = '1') then
     ena_div <= '0';
     ena_div_noise <= '0';
     if divclken='1' then
     if (cnt_div = "0000") then
       cnt_div <= (not I_SEL_L) & "111";
       ena_div <= '1';

       noise_div <= not noise_div;
       if (noise_div = '1') then
         ena_div_noise <= '1';
       end if;
     else
         cnt_div <= cnt_div - "1";
     end if;
     end if;
   end if;
 end process;

  p_noise_gen            : process
    variable noise_gen_comp : std_logic_vector(4 downto 0);
    variable poly17_zero : std_logic;
  begin
    wait until rising_edge(wb_clk_i);


    if (reg(6)(4 downto 0) = "00000") then
      noise_gen_comp := "00000";
    else
      noise_gen_comp := (reg(6)(4 downto 0) - "1");
    end if;

    poly17_zero := '0';
    if (poly17 = "00000000000000000") then poly17_zero := '1'; end if;

    if (ENA = '1') then

      if (ena_div_noise = '1') then -- divider ena

        if (noise_gen_cnt >= noise_gen_comp) then
          noise_gen_cnt <= "00000";
          poly17 <= (poly17(0) xor poly17(2) xor poly17_zero) & poly17(16 downto 1);
        else
          noise_gen_cnt <= (noise_gen_cnt + "1");
        end if;
      end if;
    end if;
  end process;
  noise_gen_op <= poly17(0);

  p_tone_gens            : process
    variable tone_gen_freq : array_3x12;
    variable tone_gen_comp : array_3x12;
  begin
    wait until rising_edge(wb_clk_i);

    -- looks like real chips count up - we need to get the Exact behaviour ..
    tone_gen_freq(1) := reg(1)(3 downto 0) & reg(0);
    tone_gen_freq(2) := reg(3)(3 downto 0) & reg(2);
    tone_gen_freq(3) := reg(5)(3 downto 0) & reg(4);
    -- period 0 = period 1
    for i in 1 to 3 loop
      if (tone_gen_freq(i) = x"000") then
        tone_gen_comp(i) := x"000";
      else
        tone_gen_comp(i) := (tone_gen_freq(i) - "1");
      end if;
    end loop;

    if (ENA = '1') then
      for i in 1 to 3 loop
        if (ena_div = '1') then -- divider ena

          if (tone_gen_cnt(i) >= tone_gen_comp(i)) then
            tone_gen_cnt(i) <= x"000";
            tone_gen_op(i) <= not tone_gen_op(i);
          else
            tone_gen_cnt(i) <= (tone_gen_cnt(i) + "1");
          end if;
        end if;
      end loop;
    end if;
  end process;

  p_envelope_freq        : process
    variable env_gen_freq : std_logic_vector(15 downto 0);
    variable env_gen_comp : std_logic_vector(15 downto 0);
  begin
    wait until rising_edge(wb_clk_i);

    env_gen_freq := reg(12) & reg(11);
    -- envelope freqs 1 and 0 are the same.
    if (env_gen_freq = x"0000") then
      env_gen_comp := x"0000";
    else
      env_gen_comp := (env_gen_freq - "1");
    end if;

    if (ENA = '1') then
      env_ena <= '0';
      if (ena_div = '1') then -- divider ena
        if (env_gen_cnt >= env_gen_comp) then
          env_gen_cnt <= x"0000";
          env_ena <= '1';
        else
          env_gen_cnt <= (env_gen_cnt + "1");
        end if;
      end if;

    end if;
  end process;

  p_envelope_shape       : process(env_reset, wb_clk_i)
    variable is_bot    : boolean;
    variable is_bot_p1 : boolean;
    variable is_top_m1 : boolean;
    variable is_top    : boolean;
  begin
        -- envelope shapes
        -- C AtAlH
        -- 0 0 x x  \___
        --
        -- 0 1 x x  /___
        --
        -- 1 0 0 0  \\\\
        --
        -- 1 0 0 1  \___
        --
        -- 1 0 1 0  \/\/
        --           ___
        -- 1 0 1 1  \
        --
        -- 1 1 0 0  ////
        --           ___
        -- 1 1 0 1  /
        --
        -- 1 1 1 0  /\/\
        --
        -- 1 1 1 1  /___
  if rising_edge(wb_clk_i) then
    if (env_reset = '1') then
      -- load initial state
      if (reg(13)(2) = '0') then -- attack
        env_vol <= "11111";
        env_inc <= '0'; -- -1
      else
        env_vol <= "00000";
        env_inc <= '1'; -- +1
      end if;
      env_hold <= '0';

    else
      --if divclken='1' then
      is_bot    := (env_vol = "00000");
      is_bot_p1 := (env_vol = "00001");
      is_top_m1 := (env_vol = "11110");
      is_top    := (env_vol = "11111");

      if (ENA = '1') then
        if (env_ena = '1') then
          if (env_hold = '0') then
            if (env_inc = '1') then
              env_vol <= (env_vol + "00001");
            else
              env_vol <= (env_vol + "11111");
            end if;
          end if;

          -- envelope shape control.
          if (reg(13)(3) = '0') then
            if (env_inc = '0') then -- down
              if is_bot_p1 then env_hold <= '1'; end if;
            else
              if is_top then env_hold <= '1'; end if;
            end if;
          else
            if (reg(13)(0) = '1') then -- hold = 1
              if (env_inc = '0') then -- down
                if (reg(13)(1) = '1') then -- alt
                  if is_bot    then env_hold <= '1'; end if;
                else
                  if is_bot_p1 then env_hold <= '1'; end if;
                end if;
              else
                if (reg(13)(1) = '1') then -- alt
                  if is_top    then env_hold <= '1'; end if;
                else
                  if is_top_m1 then env_hold <= '1'; end if;
                end if;
              end if;

            elsif (reg(13)(1) = '1') then -- alternate
              if (env_inc = '0') then -- down
                if is_bot_p1 then env_hold <= '1'; end if;
                if is_bot    then env_hold <= '0'; env_inc <= '1'; end if;
              else
                if is_top_m1 then env_hold <= '1'; end if;
                if is_top    then env_hold <= '0'; env_inc <= '0'; end if;
              end if;
            end if;

          end if;
        end if;
      end if;
    end if;
    end if;
  end process;

  p_chan_mixer           : process(cnt_div, reg, tone_gen_op)
  begin
    tone_ena_l  <= '1'; tone_src <= '1';
    noise_ena_l <= '1'; chan_vol <= "00000";
    case cnt_div(1 downto 0) is
      when "00" =>
        tone_ena_l  <= reg(7)(0); tone_src <= tone_gen_op(1); chan_vol <=  reg(8)(4 downto 0);
        noise_ena_l <= reg(7)(3);
      when "01" =>
        tone_ena_l  <= reg(7)(1); tone_src <= tone_gen_op(2); chan_vol <=  reg(9)(4 downto 0);
        noise_ena_l <= reg(7)(4);
      when "10" =>
        tone_ena_l  <= reg(7)(2); tone_src <= tone_gen_op(3); chan_vol <= reg(10)(4 downto 0);
        noise_ena_l <= reg(7)(5);
      when "11" => null; -- tone gen outputs become valid on this clock
      when others => null;
    end case;
end process;

 p_op_mixer : process
    variable chan_mixed : std_logic;
    variable chan_amp : std_logic_vector(4 downto 0);
  
begin
  wait until rising_edge(wb_clk_i);

  if (ENA = '1' and divclken='1') then

    chan_mixed := (tone_ena_l or tone_src) and (noise_ena_l or noise_gen_op);
    chan_amp := (others => '0');
    
    if (chan_mixed = '1') then
      if (chan_vol(4) = '0') then
        if (chan_vol(3 downto 0) = "0000") then -- nothing is easy ! make sure quiet is quiet
          chan_amp := "00000";
        else
          chan_amp := chan_vol(3 downto 0) & '1'; -- make sure level 31 (env) = level 15 (tone)
        end if;
      else
        chan_amp := env_vol(4 downto 0);
      end if;
    end if;

    dac_amp <= x"00";
    case chan_amp is
      when "11111" => dac_amp <= x"FF";
      when "11110" => dac_amp <= x"D9";
      when "11101" => dac_amp <= x"BA";
      when "11100" => dac_amp <= x"9F";
      when "11011" => dac_amp <= x"88";
      when "11010" => dac_amp <= x"74";
      when "11001" => dac_amp <= x"63";
      when "11000" => dac_amp <= x"54";
      when "10111" => dac_amp <= x"48";
      when "10110" => dac_amp <= x"3D";
      when "10101" => dac_amp <= x"34";
      when "10100" => dac_amp <= x"2C";
      when "10011" => dac_amp <= x"25";
      when "10010" => dac_amp <= x"1F";
      when "10001" => dac_amp <= x"1A";
      when "10000" => dac_amp <= x"16";
      when "01111" => dac_amp <= x"13";
      when "01110" => dac_amp <= x"10";
      when "01101" => dac_amp <= x"0D";
      when "01100" => dac_amp <= x"0B";
      when "01011" => dac_amp <= x"09";
      when "01010" => dac_amp <= x"08";
      when "01001" => dac_amp <= x"07";
      when "01000" => dac_amp <= x"06";
      when "00111" => dac_amp <= x"05";
      when "00110" => dac_amp <= x"04";
      when "00101" => dac_amp <= x"03";
      when "00100" => dac_amp <= x"03";
      when "00011" => dac_amp <= x"02";
      when "00010" => dac_amp <= x"02";
      when "00001" => dac_amp <= x"01";
      when "00000" => dac_amp <= x"00";
      when others => null;
    end case;


    if (cnt_div(1 downto 0) = "10") then
      audio_mix   <= (others => '0');
      audio_final <= audio_mix;
    else
      audio_mix   <= audio_mix + ("00" & dac_amp);
    end if;
  end if;

  if (wb_rst_i='1') then
    O_AUDIO(7 downto 0) <= "00000000";
  else
    if divclken='1' then
      if (audio_final(9) = '0') then
        O_AUDIO(7 downto 0) <= audio_final(8 downto 1);
      else -- clip
        O_AUDIO(7 downto 0) <= x"FF";
      end if;
    end if;
  end if;
end process;

end architecture RTL;
