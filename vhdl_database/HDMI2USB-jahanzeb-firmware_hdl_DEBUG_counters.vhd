-- //////////////////////////////////////////////////////////////////////////////
-- /// Copyright (c) 2014, Ajit Mathew <ajitmathew04@gmail.com>
-- /// All rights reserved.
-- ///
-- // Redistribution and use in source and binary forms, with or without modification, 
-- /// are permitted provided that the following conditions are met:
-- ///
-- ///  * Redistributions of source code must retain the above copyright notice, 
-- ///    this list of conditions and the following disclaimer.
-- ///  * Redistributions in binary form must reproduce the above copyright notice, 
-- ///    this list of conditions and the following disclaimer in the documentation and/or 
-- ///    other materials provided with the distribution.
-- ///
-- ///    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- ///    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
-- ///    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
-- ///    SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
-- ///    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
-- ///    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
-- ///    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-- ///    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
-- ///    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- ///   POSSIBILITY OF SUCH DAMAGE.
-- ///
-- ///
-- ///  * http://opensource.org/licenses/MIT
-- ///  * http://copyfree.org/licenses/mit/license.txt
-- ///
-- //////////////////////////////////////////////////////////////////////////////
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counters is
  port(
    clk              : in  std_logic;
    clk_ms           : in  std_logic;
    clk_1hz          : in  std_logic;
    rst              : in  std_logic;
    vsync            : in  std_logic;
    no_frame_read    : in  std_logic;
    write_img        : in  std_logic;
    pktend           : in  std_logic;
    jpg_busy         : in  std_logic;
    proc_time        : out std_logic_vector(7 downto 0);
    frame_write_time : out std_logic_vector(7 downto 0);
    frame_rate       : out std_logic_vector(7 downto 0);
    in_frame_rate    : out std_logic_vector(7 downto 0);
    frame_drop_cnt   : out std_logic_vector(7 downto 0)
    );
end counters;

architecture Behavioral of counters is
  signal f_cnt          : std_logic_vector(7 downto 0);
  signal w_time         : std_logic_vector(7 downto 0);
  signal p_time         : std_logic_vector(7 downto 0);
  signal frame_rate_cnt : std_logic_vector(7 downto 0);
  signal in_frame_cnt   : std_logic_vector(7 downto 0);
  signal write_img_q    : std_logic;
  signal jpg_busy_q     : std_logic;
  signal clk_1hz_q      : std_logic;
  signal pktend_q       : std_logic;
  signal vsync_q        : std_logic;

begin

  -- Counts the number of frames dropped
  f_drop_cntr : process(vsync, rst)
  begin
    if rst = '1' then
      f_cnt <= (others => '0');
    elsif rising_edge(vsync) then
      if no_frame_read = '1' then
        f_cnt <= f_cnt+1;
      else
        f_cnt <= (others => '0');
      end if;
    end if;
  end process;

  latch : process(no_frame_read, rst)
  begin
    if rst = '1' then
      frame_drop_cnt <= (others => '0');
    elsif falling_edge(no_frame_read) then
      frame_drop_cnt <= f_cnt;
    end if;
  end process;

  --Counts the milliseconds it took to clock frame into DDR
  frame_write_cntr : process(clk_ms, rst)
  begin
    if rst = '1' then
      w_time           <= (others => '0');
      frame_write_time <= (others => '0');
      write_img_q      <= '0';
    elsif rising_edge(clk_ms) then
      write_img_q <= write_img;
      if write_img = '1' then
        w_time <= w_time+1;
      elsif write_img_q = '1' then
        frame_write_time <= w_time;
        w_time           <= (others => '0');
      end if;
    end if;
  end process;

  --Counts the milliseconds it took to process the frame once written into ddr
  processing_time : process(clk_ms, rst)
  begin
    if rst = '1' then
      p_time     <= (others => '0');
      proc_time  <= (others => '0');
      jpg_busy_q <= '0';
    elsif rising_edge(clk_ms) then
      jpg_busy_q <= jpg_busy;
      if jpg_busy = '1' then
        p_time <= p_time+1;
      elsif jpg_busy_q = '1' then
        proc_time <= p_time;
        p_time    <= (others => '0');
      end if;
    end if;
  end process;

  --Output frame rate
  out_frame_cntr : process(clk, rst)
  begin
    if rst = '1' then
      frame_rate_cnt <= (others => '0');
    elsif rising_edge(clk) then
      clk_1hz_q <= clk_1hz;
      pktend_q  <= pktend;
      if (clk_1hz_q = '0' and clk_1hz = '1')then
        frame_rate_cnt <= (others => '0');
      elsif (pktend_q = '0' and pktend = '1') then
        frame_rate_cnt <= frame_rate_cnt+1;
      end if;
    end if;
  end process;

  process(clk_1hz, rst)
  begin
    if rst = '1' then
      frame_rate <= (others => '0');
    elsif rising_edge(clk_1hz) then
      frame_rate <= frame_rate_cnt;
    end if;
  end process;

  --input frame rate
  input_frame_cntr : process(clk, rst)
  begin
    if rst = '1' then
      in_frame_cnt <= (others => '0');
      vsync_q      <= '0';
    elsif rising_edge(clk) then
      vsync_q <= vsync;
      if (clk_1hz_q = '0' and clk_1hz = '1') then
        in_frame_cnt <= (others => '0');
      elsif(vsync_q = '0' and vsync = '1') then
        in_frame_cnt <= in_frame_cnt+1;
      end if;
    end if;
  end process;

  process(clk_1hz, rst)
  begin
    if rst = '1' then
      in_frame_rate <= (others => '0');
    elsif rising_edge(clk_1hz) then
      in_frame_rate <= in_frame_cnt;
    end if;
  end process;


end Behavioral;

