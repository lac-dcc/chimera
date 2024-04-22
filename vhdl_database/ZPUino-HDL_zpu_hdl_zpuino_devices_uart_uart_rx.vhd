--
--  UART for ZPUINO - Receiver unit
-- 
--  Copyright 2011 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity uart_rx is
  port (
    clk:      in std_logic;
	 	rst:      in std_logic;
    rx:       in std_logic;
    rxclk:    in std_logic;
    read:     in std_logic;
    data:     out std_logic_vector(7 downto 0);
    data_av:  out std_logic
  );
end entity uart_rx;

architecture behave of uart_rx is

  component uart_mv_filter is
  generic (
    bits: natural;
    threshold: natural
  );
  port (
    clk:      in std_logic;
	 	rst:      in std_logic;
    sin:      in std_logic;
    sout:     out std_logic;
    clear:    in std_logic;
    enable:   in std_logic
  );
  end component uart_mv_filter;

  component uart_brgen is
  port (
     clk:     in std_logic;
     rst:     in std_logic;
     en:      in std_logic;
     count:   in std_logic_vector(15 downto 0);
     clkout:  out std_logic
     );
  end component uart_brgen;


signal rxf: std_logic;
signal baudtick: std_logic;
signal rxd: std_logic_vector(7 downto 0);
signal datacount: unsigned(2 downto 0);
signal baudreset: std_logic;
signal filterreset: std_logic;
signal datao: std_logic_vector(7 downto 0);
signal dataready: std_logic;
signal start: std_logic;

signal debug_synctick_q: std_logic;
signal debug_baudreset_q: std_logic;

-- State
type uartrxstate is (
  rx_idle,
  rx_start,
  rx_data,
  rx_end
);

signal state: uartrxstate;

begin

  data <= datao;
  data_av <= dataready;

  rxmvfilter: uart_mv_filter
  generic map (
    bits => 4,
    threshold => 10
  )
  port map (
    clk     => clk,
    rst     => rst,
    sin     => rx,
    sout    => rxf,
    clear   => filterreset,
    enable  => rxclk
  );

  filterreset <= baudreset or baudtick;
  --istart <= start;


  baudgen: uart_brgen
    port map (
      clk   => clk,
      rst   => baudreset,
      en    => rxclk,
      count => x"000f",
      clkout => baudtick
    );

process(clk)
begin
  if rising_edge(clk) then
    if rst='1' then
      state <= rx_idle;
      dataready <= '0';
      baudreset <= '0';
      start<='0';
    else
      baudreset <= '0';
      start<='0';
      if read='1' then
        dataready <= '0';
      end if;
      case state is
        when rx_idle =>
          if rx='0' then       -- Start bit
            state <= rx_start;
            baudreset <= '1';
            start <='1';
          end if;
        when rx_start =>
          if baudtick='1' then
            -- Check filtered output.
            if rxf='0' then
              datacount <= b"111";
              state <= rx_data; -- Valid start bit.
            else
              state <= rx_idle;
            end if;
          end if;
        when rx_data =>
          if baudtick='1' then
            rxd(7) <= rxf;
            rxd(6 downto 0) <= rxd(7 downto 1);
            datacount <= datacount - 1;
            if datacount=0 then
              state <= rx_end;
            end if;
          end if;
        when rx_end =>
          -- Check for framing errors ?

          -- Do fast recovery here.
          if rxf='1' then
            dataready<='1';
            datao <= rxd;
            state <= rx_idle;
          end if;

          if baudtick='1' then
            -- Framing error.
            state <= rx_idle;
          end if;
        when others =>
      end case;
    end if;
  end if;
end process;

end behave;
