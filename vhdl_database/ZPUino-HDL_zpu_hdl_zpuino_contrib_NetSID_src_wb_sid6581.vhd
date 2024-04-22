--
-- ZPUino WB wrapper around NetSID.
--
-- Copyright 2010-2012 Alvaro Lopes - alvieboy@alvie.com
-- 
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE ZPU PROJECT ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation
-- are those of the authors and should not be interpreted as representing
-- official policies, either expressed or implied, of the ZPU Project.


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

library work;
use work.zpuino_config.all;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity wb_sid6581 is
  port (
    wb_clk_i: in std_logic;
    wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    id:       out slot_id;

    clk_1MHZ: in std_logic;
    audio_data: out std_logic_vector(17 downto 0)

  );
end entity wb_sid6581;

architecture rtl of wb_sid6581 is

  component sid6581 is
  port (
    clk_1MHz    : in std_logic;    -- main SID clock signal
    clk32        : in std_logic;    -- main clock signal
    clk_DAC      : in std_logic;    -- DAC clock signal, must be as high as possible for the best results
    reset        : in std_logic;    -- high active signal (reset when reset = '1')
    cs          : in std_logic;    -- "chip select", when this signal is '1' this model can be accessed
    we          : in std_logic;    -- when '1' this model can be written to, otherwise access is considered as read

    addr        : in std_logic_vector(4 downto 0);  -- address lines
    di          : in std_logic_vector(7 downto 0);  -- data in (to chip)
    do          : out std_logic_vector(7 downto 0);  -- data out  (from chip)

    pot_x        : in std_logic;  -- paddle input-X
    pot_y        : in std_logic;  -- paddle input-Y
    audio_out    : out std_logic;    -- this line holds the audio-signal in PWM format
    audio_data  : out std_logic_vector(17 downto 0)
  );
  end component;


  signal cs:    std_logic;  
  signal addr:  std_logic_vector(4 downto 0);
  signal di:    std_logic_vector(7 downto 0);
  signal do:    std_logic_vector(7 downto 0);
  signal ack_i: std_logic;

begin

  id <= x"03" & x"01"; -- Vendor: ZPUino Contrib   Product: SID6581
  wb_dat_o(wordSize-1 downto 8) <= (others => '0');
  wb_dat_o(7 downto 0) <= do;

  cs        <= (wb_stb_i and wb_cyc_i) and not ack_i;
  di        <= wb_dat_i(7 downto 0);
  addr      <= wb_adr_i(6 downto 2);
  wb_ack_o  <= ack_i;

  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        ack_i<='0';
      else
        ack_i<='0';
        if ack_i='0' then
          if wb_stb_i='1' and wb_cyc_i='1' then
            ack_i <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;


  sid: sid6581
  port map (
    clk_1MHz    => clk_1MHz,
    clk32        => wb_clk_i,
    clk_DAC      => '0',
    reset        => wb_rst_i,
    cs          => cs,
    we          => wb_we_i,

    addr        => addr,
    di          => di,
    do          => do,

    pot_x        => 'X',
    pot_y        => 'X',
    audio_out    => open,
    audio_data  => audio_data
  );

end rtl;
