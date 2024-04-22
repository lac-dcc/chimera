-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_sound.vhd,v 1.6 2007/02/05 22:08:59 arnim Exp $
--
-- Sound Generator
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
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
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.i8244_sound_pack.all;

entity i8244_sound is

  port (
    clk_i     : in  std_logic;
    clk_en_i  : in  boolean;
    res_i     : in  boolean;
    hbl_i     : in  std_logic;
    cpu2snd_i : in  cpu2snd_t;
    snd_int_o : out boolean;
    snd_o     : out std_logic;
    snd_vec_o : out std_logic_vector(3 downto 0)
  );

end i8244_sound;


library ieee;
use ieee.numeric_std.all;

architecture rtl of i8244_sound is

  signal snd_q : std_logic_vector(23 downto 0);
  signal snd_s : std_logic;
  signal hbl_q : std_logic;

  constant pre_3k9_max_c : unsigned(3 downto 0) := to_unsigned( 3, 4);
  constant pre_0k9_max_c : unsigned(3 downto 0) := to_unsigned(15, 4);
  signal   prescaler_q   : unsigned(3 downto 0);

  constant shift_cnt_max_c : unsigned(4 downto 0) := to_unsigned(23, 5);
  signal   shift_cnt_q     : unsigned(4 downto 0);

  signal noise_lfsr_q : std_logic_vector(15 downto 0);

  signal int_q : boolean;

  signal chop_cnt_q : unsigned(3 downto 0);
  signal chop_q     : std_logic;

begin

  -----------------------------------------------------------------------------
  -- Process seq
  --
  -- Purpose:
  --   Implements the sequential elements.
  --
  seq: process (clk_i, res_i)
    variable shift_en_v : boolean;
  begin
    if res_i then
      snd_q       <= (others => '0');
      hbl_q       <= '0';
      shift_cnt_q <= shift_cnt_max_c;
      int_q       <= false;
      prescaler_q <= pre_3k9_max_c;
      chop_cnt_q  <= (others => '0');
      chop_q      <= '0';
      -- set LSB of noise LFSR
      noise_lfsr_q    <= (others => '0');
      noise_lfsr_q(0) <= '1';

    elsif rising_edge(clk_i) then
      if clk_en_i then
        -- default: interrupt off
        int_q <= false;

        -- flag for edge detection
        hbl_q <= hbl_i;

        shift_en_v := false;
        -- prescaler
        if hbl_i = '1' and hbl_q = '0' then  -- detect rising edge on hbl
          if prescaler_q = 0 then
            case cpu2snd_i.freq is
              when SND_FREQ_HIGH =>
                prescaler_q <= pre_3k9_max_c;
              when SND_FREQ_LOW =>
                prescaler_q <= pre_0k9_max_c;
            end case;

            -- and shift one bit
            if cpu2snd_i.enable then
              shift_en_v := true;
            end if;
          else
            prescaler_q <= prescaler_q - 1;
          end if;
        end if;


        -- operate shift register
        if shift_en_v then
          if shift_cnt_q = 0 then
            -- start all over
            shift_cnt_q <= shift_cnt_max_c;

            -- generate interrupt
            int_q <= true;
          else
            shift_cnt_q <= shift_cnt_q - 1;
            snd_q(22 downto 0) <= snd_q(23 downto 1);
            snd_q(23) <= snd_q(0);
          end if;

          -- and update noise LFSR register by shifting it up
          noise_lfsr_q(noise_lfsr_q'length-1 downto 1) <=
            noise_lfsr_q(noise_lfsr_q'length-2 downto 0);
          -- insert tapped bits at vacant position 0
          noise_lfsr_q(0) <= noise_lfsr_q(15) xor noise_lfsr_q(13) xor
                             noise_lfsr_q(0);
        end if;

        -- chopper
        if chop_cnt_q = unsigned(cpu2snd_i.volume) then
          chop_q <= '1';
        end if;
        if chop_cnt_q = 0 then
          chop_cnt_q <= (others => '1');
          chop_q     <= '0';
        else
          chop_cnt_q <= chop_cnt_q - 1;
        end if;

      end if;

      -- parallel load from CPU interface
      case cpu2snd_i.reg_sel is
        when SND_REG_0 =>
          snd_q(23 downto 16) <= cpu2snd_i.din;
        when SND_REG_1 =>
          snd_q(15 downto  8) <= cpu2snd_i.din;
        when SND_REG_2 =>
          snd_q( 7 downto  0) <= cpu2snd_i.din;
        when others =>
          null;
      end case;
    end if;
  end process seq;
  --
  -----------------------------------------------------------------------------


  -- overlay noise bit on shift register output
  snd_s <=   snd_q(0) xor noise_lfsr_q(15)
           when cpu2snd_i.noise else
             snd_q(0);


  -----------------------------------------------------------------------------
  -- Output mapping
  -----------------------------------------------------------------------------
  snd_int_o <= int_q;
  snd_o     <= snd_s and chop_q;
  snd_vec_o <=   cpu2snd_i.volume
               when snd_s = '1' and cpu2snd_i.enable else
                 (others => '0');

end rtl;
