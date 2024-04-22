--
--  Testbench for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
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
use work.zpuino_config.all;

entity tb_uart is
end entity;

architecture behave of tb_uart is

  constant period : time := 10.4166666667 ns;
  signal ready: std_logic:='0';

  signal w_clk : std_logic := '0';
  signal w_rst : std_logic := '0';

  component TxUnit is
  port (
     clk_i    : in  std_logic;  -- Clock signal
     reset_i  : in  std_logic;  -- Reset input
     enable_i : in  std_logic;  -- Enable input
     load_i   : in  std_logic;  -- Load input
     txd_o    : out std_logic;  -- RS-232 data output
     busy_o   : out std_logic;  -- Tx Busy
     datai_i  : in  std_logic_vector(7 downto 0)); -- Byte to transmit
  end component TxUnit;


  component uart_brgen is
  port (
     clk:     in std_logic;
     rst:     in std_logic;
     en:      in std_logic;
     count:   in std_logic_vector(15 downto 0);
     clkout:  out std_logic
     );
  end component uart_brgen;

  component zpuino_uart_rx is
  port (
    clk:      in std_logic;
	 	rst:      in std_logic;
    rx:       in std_logic;
    rxclk:    in std_logic;
    read:     in std_logic;
    data:     out std_logic_vector(7 downto 0);
    data_av:  out std_logic
  );
  end component zpuino_uart_rx;

  signal load: std_logic:='0';
  signal RXD: std_logic;
  signal rxclk,txclk: std_logic;

  signal noisecnt: integer;
  signal noisev: std_logic;

  signal noised: std_logic;
begin

  w_clk <= not w_clk after period/2;

  -- Noise generator

  process(w_clk)
  begin
    if rising_edge(w_clk) then
      if w_rst='1' then
        noisecnt<=0;
        noisev<='0';
      else
        if noisecnt>0 then
          noisecnt<=noisecnt-1;
          noised<='X';
          noisev<=RXD;
        else
          if noisev/=RXD then
            noisecnt<=8;
            noised<='X';
            noisev<=RXD;
          else
            noisev<=RXD;
            noised<=RXD;
          end if;
        end if;
      end if;
    end if;
  end process;


  rxclkgen: uart_brgen
    port map (
      clk => w_clk,
      rst => w_rst,
      en => '1',
      count => x"0001",
      clkout => rxclk
    );

  txclkgen: uart_brgen
    port map (
      clk => w_clk,
      rst => w_rst,
      en => rxclk,
      count => x"000f",
      clkout => txclk
    );

  txu: TxUnit
    port map (
      clk_i    => w_clk,
      reset_i  => w_rst,
      enable_i => txclk,
      load_i   => load,
      txd_o    => RXD,
      busy_o   => open,
      datai_i  => b"01010101"
      );

  rxu: zpuino_uart_rx
    port map (
    clk   => w_clk,
	 	rst   => w_rst,
    rx    => noised,
    rxclk => rxclk,
    read  => '0'
  );

  stimuli : process
   begin
      w_rst   <= '0';
      wait for 1 ns;
      w_rst   <= '1';
      wait for 120 ns;
      w_rst   <= '0';
      wait for 300 ns;
      ready <='1';
      load<='1';            
      wait for 20 ns;
      load<='0';
      wait for 3400 ns;
      load <= '1';
      wait for 20 ns;
      load <= '0';
      wait for 10 us;
      report "End" severity failure;
      wait;
   end process;

end behave;
