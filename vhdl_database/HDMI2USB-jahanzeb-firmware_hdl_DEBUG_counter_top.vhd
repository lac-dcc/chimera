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

--The debug module collects counters from the system for debugging.
--The following counters will be supported:

-- - Device State
-- - Resolution 
-- - in frame rate
-- - frame rate
-- - frame rate write time
-- - processing time
-- - frame drop count
-- - frame size
-- Use the dubugging program to access the counters

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity debug_top is
  port(
    clk           : in  std_logic;
    clk_50Mhz     : out std_logic;
    rst           : in  std_logic;
    vsync         : in  std_logic;
    no_frame_read : in  std_logic;
    pktend        : in  std_logic;
    jpg_busy      : in  std_logic;
    write_img     : in  std_logic;
    sw            : in  std_logic_vector(7 downto 0);
    uart_en       : out std_logic;
    frame_size    : in  std_logic_vector(23 downto 0);
    de_H0         : in  std_logic;	--Data enable for HDMI0
    vsync_H0      : in  std_logic;
    hsync_H0      : in  std_logic;
    de_H1         : in  std_logic;	--Data enable for HDMI1
    vsync_H1      : in  std_logic;
    hsync_H1      : in  std_logic;
    jpgORraw      : in  std_logic;
    input_source  : in  std_logic_vector(1 downto 0);
    encoding_Q    : in  std_logic_vector(1 downto 0);
    resX          : in  std_logic_vector(15 downto 0);
    resY          : in  std_logic_vector(15 downto 0);
	 eof_jpg       : in std_logic;

    debug_byte  : out std_logic_vector(7 downto 0);
    debug_index : in  integer range 0 to 15;
    uart_byte   : out std_logic_vector(7 downto 0)
    );
end debug_top;

architecture Behavioral of debug_top is

  component counters
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
  end component;

  signal prescaler        : integer range 0 to 50000000;
  signal prescaler1       : integer range 0 to 50000;
  signal clk_ms           : std_logic;
  signal clk_1hz          : std_logic;
  signal proc_time        : std_logic_vector(7 downto 0);
  signal frame_write_time : std_logic_vector(7 downto 0);
  signal frame_rate       : std_logic_vector(7 downto 0);
  signal in_frame_rate    : std_logic_vector(7 downto 0);
  signal frame_drop_cnt   : std_logic_vector(7 downto 0);
  signal switch_case      : std_logic_vector(2 downto 0);
  signal send, send_q     : std_logic;
  signal clk_50Mhz_s      : std_logic;
  signal jpg_busy_s       : std_logic;
  signal cnt              : integer range 0 to 32;
  signal f_data           : std_logic_vector(7 downto 0);
  type f_send_states is (wait_send_edge, send_byte1, send_byte2);
  signal f_send_state     : f_send_states;
  signal uart_en_f        : std_logic;
  signal uart_en1         : std_logic;
  signal device_state     : std_logic_vector(7 downto 0);
  type send_array is array(0 to 15) of std_logic_vector(7 downto 0);
  signal uart_send_array  : send_array;
  signal byte_cnt         : integer range 0 to 15;
  signal debug_byte_q     : std_logic_vector(7 downto 0);
  constant N_BYTES        : integer := 14;

begin

  clk_50Mhz <= clk_50Mhz_s;
  process(clk, rst)
  begin
    if rst = '1' then
      clk_50Mhz_s <= '0';
    elsif rising_edge(clk) then
      clk_50Mhz_s <= not clk_50Mhz_s;
    end if;
  end process;


  clk_gen : process(clk, rst)
  begin
    if rst = '1' then
      clk_1hz    <= '0';
      prescaler  <= 0;
      prescaler1 <= 0;
    elsif rising_edge(clk) then
      if prescaler = 50000000-1 then
        prescaler <= 0;
        clk_1hz   <= not clk_1hz;
      else
        prescaler <= prescaler + 1;
      end if;
      if prescaler1 = 50000 then
        prescaler1 <= 0;
        clk_ms     <= not clk_ms;
      else
        prescaler1 <= prescaler1 + 1;
      end if;
    end if;
  end process clk_gen;

  send         <= clk_1hz;
  device_state <= "0" & (de_H0 or vsync_H0 or hsync_H0) &
                  (de_H1 or vsync_H1 or hsync_H1) &
                  jpgORraw & input_source & encoding_Q;

  uart_send_array(0)  <= X"AA";
  uart_send_array(1)  <= device_state;
  uart_send_array(2)  <= resX(15 downto 8);
  uart_send_array(3)  <= resX(7 downto 0);
  uart_send_array(4)  <= resY(15 downto 8);
  uart_send_array(5)  <= resY(7 downto 0);
  uart_send_array(6)  <= in_frame_rate;
  uart_send_array(7)  <= frame_rate;
  uart_send_array(8)  <= frame_write_time;
  uart_send_array(9)  <= proc_time;
  uart_send_array(10) <= frame_drop_cnt;
  uart_send_array(11) <= frame_size(23 downto 16);
  uart_send_array(12) <= frame_size(15 downto 8);
  uart_send_array(13) <= frame_size(7 downto 0);


  debug_byte <= uart_send_array(debug_index);

  array_send : process(clk_50Mhz_s, rst)
  begin
    if rst = '1' then
      uart_en   <= '0';
      uart_byte <= uart_send_array(0);
      byte_cnt  <= 0;
    elsif rising_edge(clk_50Mhz_s) then
      send_q <= send;
      case byte_cnt is
        when 0 =>
          uart_en <= '0';
          if send_q = '0' and send = '1' then
            uart_en   <= '1';
            uart_byte <= uart_send_array(0);
            byte_cnt  <= byte_cnt+1;
          end if;
        when N_BYTES-1 =>
          uart_en   <= '1';
          uart_byte <= uart_send_array(13);
          byte_cnt  <= 0;
        when others =>
          uart_en   <= '1';
          uart_byte <= uart_send_array(byte_cnt);
          byte_cnt  <= byte_cnt+1;
      end case;
    end if;
  end process;


  Inst_counters : counters port map(
    clk              => clk,
    clk_ms           => clk_ms,
    clk_1hz          => clk_1hz,
    rst              => rst,
    vsync            => vsync,
    no_frame_read    => no_frame_read,
    write_img        => write_img,
    pktend           => eof_jpg,
    jpg_busy         => jpg_busy,
    proc_time        => proc_time,
    frame_write_time => frame_write_time,
    frame_rate       => frame_rate,
    in_frame_rate    => in_frame_rate,
    frame_drop_cnt   => frame_drop_cnt
    );

end Behavioral;

