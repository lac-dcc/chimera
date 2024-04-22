-- ---------------------------------------------------------------------
-- @file : uart.vhd
-- ---------------------------------------------------------------------
--
-- Last change: KS 05.04.2021 16:53:10
-- @project: microCore
-- @language: VHDL-93
-- @copyright (c): Klaus Schleisiek, All Rights Reserved.
-- @contributors:
--
-- @license: Do not use this file except in compliance with the License.
-- You may obtain a copy of the Public License at
-- https://github.com/microCore-VHDL/microCore/tree/master/documents
-- Software distributed under the License is distributed on an "AS IS"
-- basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
-- See the License for the specific language governing rights and
-- limitations under the License.
--
-- @brief: serial UART - 8N2 format with receive fifo.
--
-- Version Author   Date       Changes
--   210     ks    8-Jun-2020  initial version
--  2300     ks    8-Mar-2021  Converted to NUMERIC_STD
-- ---------------------------------------------------------------------
Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;
USE work.architecture_pkg.ALL;
USE work.functions_pkg.ALL;

ENTITY uart IS GENERIC (
   rate       : NATURAL; -- baud rate
   depth      : NATURAL; -- queue depth
   ramstyle   : STRING   -- normally "registers", "block_ram" for large queues
); PORT (
   uBus       : IN  uBus_port;
   pause      : OUT STD_LOGIC; -- uart pause
   rx_full    : OUT STD_LOGIC; -- rx data buffer full
   rx_read    : IN  STD_LOGIC; -- read rx data buffer
   rx_data    : OUT byte;      -- rx data buffer
   rx_break   : OUT STD_LOGIC; -- break detected
   rx_ovrn    : OUT STD_LOGIC; -- rx overrun, queue = full+1
   tx_empty   : OUT STD_LOGIC; -- data buffer empty
   tx_write   : IN  STD_LOGIC; -- write into data buffer
   tx_data    : IN  byte;      -- output data
   tx_busy    : OUT STD_LOGIC; -- tx uart still busy
-- UART I/O
   dtr        : IN  STD_LOGIC;
   rxd        : IN  STD_LOGIC;
   txd        : OUT STD_LOGIC
); END uart;

ARCHITECTURE rtl OF uart IS

ALIAS  reset       : STD_LOGIC IS uBus.reset;
ALIAS  clk         : STD_LOGIC IS uBus.clk;
ALIAS  clk_en      : STD_LOGIC IS uBus.clk_en;

CONSTANT realbaud  : REAL := real(clk_frequency) / 4.0 / real(rate) + 0.49; -- mit Rundung
CONSTANT baudcnt   : NATURAL := integer(realbaud);
SIGNAL baud_ctr    : NATURAL RANGE 0 TO baudcnt;
SIGNAL baud_en     : STD_LOGIC;
SIGNAL rx_shift    : byte;
SIGNAL rx_ctr      : UNSIGNED(3 DOWNTO 0);
SIGNAL rx_sync     : UNSIGNED(1 DOWNTO 0);
SIGNAL rx_ready    : STD_LOGIC;
SIGNAL rx_write    : STD_LOGIC;

SIGNAL tx_buf      : byte;
SIGNAL tx_shift    : UNSIGNED(8 DOWNTO 0);
SIGNAL tx_ctr      : UNSIGNED(3 DOWNTO 0);
SIGNAL tx_baud     : UNSIGNED(1 DOWNTO 0);
SIGNAL tx_empty_i  : STD_LOGIC;

SIGNAL q_empty     : STD_LOGIC;
SIGNAL q_full      : STD_LOGIC;

BEGIN

ASSERT (real(rate) * 1.015) > real(clk_frequency / 4 / baudcnt) AND
       (real(rate) / 1.015) < real(clk_frequency / 4 / baudcnt)
REPORT "baud rate deviation greater +/- 1.5 %"
SEVERITY warning;

tx_empty <= tx_empty_i;

pause <= (q_empty AND rx_read) OR (NOT tx_empty_i AND tx_write);

-- ---------------------------------------------------------------------
-- receive queue
-- ---------------------------------------------------------------------

rx_full <= NOT q_empty;
rx_write <= rx_ready;

rx_fifo: fifo
GENERIC MAP (8, depth, ramstyle)
PORT MAP (
   reset    => reset,
   clk      => clk,
   push     => rx_write,
   pop      => rx_read,
   empty    => q_empty,
   full     => q_full,
   din      => rx_shift,
   dout     => rx_data
);

-- ---------------------------------------------------------------------
-- UART Receiver
-- ---------------------------------------------------------------------

uart_rx_proc : PROCESS(reset, clk)
BEGIN
   IF  reset = '1' AND ASYNC_RESET  THEN
      rx_sync <= (OTHERS => '0');
      rx_ctr <= (OTHERS => '0');
      rx_shift <= (OTHERS => '0');
      rx_ready <= '0';
      rx_break <= '0';
      rx_ovrn <= '0';
   ELSIF  rising_edge(clk)  THEN
      IF  rx_write = '1'  THEN
         rx_ready <= '0';
      END IF;
      IF  rx_read = '1'  THEN
         rx_ovrn <= '0';
      END IF;
      IF  baud_en = '1'  THEN
         rx_sync <= rx_sync+1;
         CASE  rx_ctr  IS
         WHEN "0000" => IF  rxd = '0' AND dtr = '1'  THEN  -- start bit?
                           rx_sync <= "00";          -- synchronize on start bit
                           rx_ctr <= rx_ctr+1;
                        END IF;
         WHEN "1010" => IF  rx_sync = "00"  THEN     -- sample point reached?
                           rx_ctr <= rx_ctr+1;
                           IF  rxd = '1'  THEN       -- is stop bit present?
                              rx_ctr <= "0000";      -- back into "inactive" mode
                              IF  q_full = '1' AND rx_read = '0'  THEN
                                 rx_ovrn <= '1';
                              ELSE
                                 rx_ready <= '1';
                              END IF;
                           END IF;
                        END IF;
         WHEN "1011" => rx_break <= '1';
                        IF  rxd = '1'  THEN          -- eventually, is this a potential stop bit?
                           rx_ctr <= "0000";         -- then start new cycle
                           rx_break <= '0';
                        END IF;
         WHEN OTHERS => IF  rx_sync = "00"  THEN     -- receive next bit
                           rx_ctr <= rx_ctr+1;
                           rx_shift <= rxd & rx_shift(7 DOWNTO 1);
                        END IF;
         END CASE;
      END IF;
      IF  reset = '1' AND NOT ASYNC_RESET  THEN
         rx_sync <= (OTHERS => '0');
         rx_ctr <= (OTHERS => '0');
         rx_shift <= (OTHERS => '0');
         rx_ready <= '0';
         rx_break <= '0';
         rx_ovrn <= '0';
      END IF;
   END IF;
END PROCESS uart_rx_proc ;

-- ---------------------------------------------------------------------
-- UART Transmitter
-- ---------------------------------------------------------------------

txd <= tx_shift(0);

uart_tx_proc : PROCESS (reset, clk)
BEGIN
   IF  reset = '1' AND ASYNC_RESET  THEN
      tx_shift <= (OTHERS => '1');
      tx_ctr <= (OTHERS => '0');
      tx_baud <= (OTHERS => '0');
      tx_buf <= (OTHERS => '0');
      tx_empty_i <= '1';
      tx_busy <= '0';
   ELSIF  rising_edge(clk)  THEN
      IF  clk_en = '1' AND tx_write = '1' AND tx_empty_i = '1'  THEN   -- lade tx_buf wenn er leer ist
         tx_buf <= tx_data;
         tx_empty_i <= '0';
      END IF;
      IF  baud_en = '1'  THEN
         tx_baud <= tx_baud+1;
         IF  tx_baud = "00"  THEN
            tx_shift <= '1' & tx_shift(8 DOWNTO 1);    -- immer ein Bit rausschieben.
            CASE  tx_ctr  IS
            WHEN "0000" =>                             -- es wird gerade nicht gesendet
               tx_busy <= '0';
               IF  tx_empty_i = '0'  THEN                -- und der tx_buf voll ist...
                  tx_empty_i <= '1';
                  tx_shift <= tx_buf & '0';            -- dann geht es los.
                  tx_ctr <= tx_ctr+1;
                  tx_busy <= '1';                      -- transmitter is currently sending
               END IF;
--            WHEN "1001" => tx_ctr <= "0000";           -- 1 stop bit
            WHEN "1010" => tx_ctr <= "0000";           -- 2 stop bits
            WHEN OTHERS => tx_ctr <= tx_ctr+1;         -- noch nicht alle Bits gesendet...
            END CASE;
         END IF;
      END IF;
      IF  reset = '1' AND NOT ASYNC_RESET  THEN
         tx_shift <= (OTHERS => '1');
         tx_ctr <= (OTHERS => '0');
         tx_baud <= (OTHERS => '0');
         tx_buf <= (OTHERS => '0');
         tx_empty_i <= '1';
         tx_busy <= '0';
      END IF;
   END IF;
END PROCESS uart_tx_proc ;

-- ---------------------------------------------------------------------
-- baud rate
-- ---------------------------------------------------------------------

baud_rate_proc : PROCESS (reset, clk)
BEGIN
   IF  reset = '1' AND ASYNC_RESET  THEN
      baud_en <= '0';
      baud_ctr <= 0;
   ELSIF  rising_edge(clk)  THEN
      baud_en <= '0';
      IF  baud_ctr = baudcnt - 1  THEN
         baud_en <= '1';
         baud_ctr <= 0;
      ELSE
         baud_ctr <= baud_ctr + 1;
      END IF;
      IF  reset = '1' AND NOT ASYNC_RESET  THEN
         baud_en <= '0';
         baud_ctr <= 0;
      END IF;
   END IF;
END PROCESS baud_rate_proc ;

END rtl;
