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

entity serial_sim is
  generic(
    CLK_FREQUENCY_G : integer := 78000000;
    BAUD_RATE_G     : integer := 115200
  );
  port(
    clk         : in    std_logic;
    rst         : in    std_logic;
    uart_rx     : in    std_logic;
    uart_tx     : out   std_logic
  );
end entity;

architecture behave of serial_sim is

  constant period : time := 20 ns;
  signal clk_in : std_logic := '0';
  signal rst_in : std_logic := '0';
  --signal gpio:  std_logic_vector(31 downto 0);

  constant CLK_FREQUENCY : integer := 78000000;
  constant RX_OVERSAMPLE : integer := 8;
  constant BAUD_DIV_TX   : integer := CLK_FREQUENCY_G/(1*BAUD_RATE_G);
  constant BAUD_DIV_RX   : integer := CLK_FREQUENCY_G/(RX_OVERSAMPLE*BAUD_RATE_G);
  constant BIT_TIME      : time := (1000000.0/real(BAUD_RATE_G)) * 1 us;
  constant CLK_PERIOD    : time := (1.0 sec)/real(CLK_FREQUENCY_G);


  signal uart_tx_i  : std_logic;
  signal uart_rx_i  : std_logic := '0';
  signal tx_par     : std_logic_vector(7 downto 0);
  signal rx_par     : std_logic_vector(7 downto 0);
  signal rx_new     : std_logic := '0';
  signal tx_begin   : std_logic := '0';
  
  type   byte_t     is  array (natural range <>) of std_logic_vector(7 downto 0);
  constant cmd_list   :  byte_t(0 to 5) := (
    -- CMD:  BOOTLOADER_CMD_VERSION 0x01
--    x"7e", x"7e", x"01", x"1e", x"0e", x"7e"
    -- CMD:  BOOTLOADER_CMD_IDENTIFY 0x02
    x"7e", x"7e", x"02", x"2c", x"95", x"7e"
  );

begin

  clk_in <= not clk_in after CLK_PERIOD/2;


  -- serialize bytes from an array
  -- leave a gap between chars 
  send_chars_p : process
  begin
    tx_begin <= '0';
    -- give ZPU time to boot up first
    wait for 110 us;
    send_chars_lp:
    for i in 0 to cmd_list'high loop
      tx_par   <= cmd_list(i);
      tx_begin <= '1';  -- kick off transmit
      wait for 1 ns;
      tx_begin <= '0';  -- transmit started, avoid infinite loop
      wait for 12*BIT_TIME;  -- give time to xmit char
    end loop send_chars_lp;
    -- indefinite loop, don't send command again
    wait;
  end process send_chars_p;


  -- simple uart transmitter (not synthesizable)
  uart_tx_p : process
  begin
    uart_tx_i   <= '1';
    wait until tx_begin = '1';
    -- 1 start bit
    uart_tx_i   <= '0';
    wait for BIT_TIME;
    -- serialize byte, lsb to msb
    tx_bit_lp:
    for i in 0 to 7 loop
      uart_tx_i   <= tx_par(i);
      wait for BIT_TIME;
    end loop tx_bit_lp;
    -- 2 stop bits
    uart_tx_i   <= '1';
    wait for 2*BIT_TIME;
  end process uart_tx_p;

  -- simple uart receiver (not synthesizable)
  uart_rx_p : process
    variable rx_par_v : std_logic_vector(7 downto 0) := x"00";
  begin
    wait for 10 us;
    rx_new    <= '0';
    rx_par_v  := (others => '0');
    rx_byte_lp:
    loop
      -- wait for start bit
      wait until uart_rx'event and uart_rx = '0';
      -- delay 1/2 bit time from beginning of start bit to middle of start data bit
      wait for 0.5*BIT_TIME;
      -- serialize byte, lsb to msb
      rx_bit_lp:
      for i in 0 to 7 loop
        wait for BIT_TIME;
        rx_par_v(i) := uart_rx;
      end loop rx_bit_lp;
      rx_par   <= rx_par_v;
      -- assert signal to show new char rcvd
      rx_new    <= '1';
      wait for 1.0*BIT_TIME;
      -- deassert signal to show new char rcvd
      rx_new    <= '0';
    end loop rx_byte_lp;
  end process uart_rx_p;


  -- pass internal serial rx/tx to top level
  uart_tx   <= uart_tx_i;
  uart_rx_i <= uart_rx;

end behave;
