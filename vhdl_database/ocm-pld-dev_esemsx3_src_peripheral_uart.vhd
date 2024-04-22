--
-- uart.vhd
-- TBBlue / ZX Spectrum Next project
--
-- UART - Victor Trucco
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
-- ticks_per_bit_i = (clock)/(bauds)
-- 28000000 / 9600  = 2916.66   = 28mhz 9600 bps
-- 28000000 / 57600     = 486.11        = 28mhz 57600 bps
-- 28000000 / 115200 = 243.05   = 28mhz 115200 bps
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity UART is
  port(
--      ticks_per_bit_i         : in  integer := 2916;
        uart_prescaler_i        : in  std_logic_vector(13 downto 0);
        clock_i                 : in  std_logic;
        TX_start_i              : in  std_logic;
        TX_byte_i               : in  std_logic_vector(7 downto 0);
        TX_active_o             : out std_logic;
        TX_out_o                : out std_logic;
        TX_byte_finished_o      : out std_logic;
        RX_in_i                 : in  std_logic;
        RX_byte_finished_o      : out std_logic;
        RX_byte_o               : out std_logic_vector(7 downto 0)
  );
end UART;


architecture RTL of UART is

    type tx_states is (STATE_TX_IDLE, STATE_TX_START, STATE_TX_DATA, STATE_TX_STOP, STATE_TX_FINISH);
    type rx_states is (STATE_RX_IDLE, STATE_RX_START, STATE_RX_DATA, STATE_RX_STOP, STATE_RX_FINISH);

    signal rx_current_state_s : rx_states := STATE_RX_IDLE;
    signal tx_current_state_s : tx_states := STATE_TX_IDLE;

    signal tx_clock_counter_s   : integer; -- range 0 to 3000 := 0; -- ATTENTION: MAXIMUM OF TICKS TO WAIT!!!! 2916 for 9600 bps at 28mhz change here to slow speeds
    signal tx_bit_index_s       : integer range 0 to 7 := 0;
    signal tx_data_s            : std_logic_vector(7 downto 0) := (others => '0');
    signal tx_done_s            : std_logic := '0';

    signal rx_clock_counter_s   : integer; -- range 0 to 3000 := 0; -- ATTENTION: MAXIMUM OF TICKS TO WAIT!!!! 2916 for 9600 bps at 28mhz change here to slow speeds
    signal rx_bit_index_s       : integer range 0 to 7 := 0;
    signal rx_byte_s            : std_logic_vector(7 downto 0) := (others => '0');
    signal rx_byte_finished_s   : std_logic := '0';
    signal rx_data_delayed_s    : std_logic := '0';
    signal rx_data_s            : std_logic := '0';

    signal ticks_per_bit_i : integer;
begin

    ticks_per_bit_i <= to_integer(unsigned(uart_prescaler_i));

    -- OUTs
    TX_byte_finished_o <= tx_done_s;
    RX_byte_finished_o <= rx_byte_finished_s;
    RX_byte_o <= rx_byte_s;

    -- RX process
    process (clock_i)
    begin
         if rising_edge(clock_i) then

            -- delays the incoming bit for one clock cycle
            rx_data_delayed_s <= RX_in_i;
            rx_data_s <= rx_data_delayed_s;

            case rx_current_state_s is

                when STATE_RX_IDLE =>
                    rx_byte_finished_s <= '0';
                    rx_clock_counter_s <= 0;
                    rx_bit_index_s <= 0;

                    if rx_data_s = '0' then  -- Wait for start bit
                        rx_current_state_s <= STATE_RX_START;
                    else
                        rx_current_state_s <= STATE_RX_IDLE;
                    end if;


                when STATE_RX_START =>

                    --wait for the middle of start bit
                    if rx_clock_counter_s = (ticks_per_bit_i - 1) / 2 then
                        if rx_data_s = '0' then

                            rx_clock_counter_s <= 0;
                            rx_current_state_s <= STATE_RX_DATA;

                        else

                            rx_current_state_s <= STATE_RX_IDLE;

                        end if;
                    else

                        rx_clock_counter_s <= rx_clock_counter_s + 1;
                        rx_current_state_s <= STATE_RX_START;

                    end if;


                when STATE_RX_DATA =>

                    -- Wait for the correct number of cycles
                    if rx_clock_counter_s < ticks_per_bit_i - 1 then

                        rx_clock_counter_s <= rx_clock_counter_s + 1;
                        rx_current_state_s <= STATE_RX_DATA;

                    else
                        rx_clock_counter_s <= 0;
                        rx_byte_s(rx_bit_index_s) <= rx_data_s;

                        -- Check if all the byte was sent
                        if rx_bit_index_s < 7 then

                            rx_bit_index_s <= rx_bit_index_s + 1;
                            rx_current_state_s <= STATE_RX_DATA;

                        else

                            rx_bit_index_s <= 0;
                            rx_current_state_s   <= STATE_RX_STOP;

                        end if;
                    end if;

                -- Stop bit = 1
                when STATE_RX_STOP =>

                    -- Wait for the correct number of cycles
                    if rx_clock_counter_s < ticks_per_bit_i - 1 then

                        rx_clock_counter_s <= rx_clock_counter_s + 1;
                        rx_current_state_s <= STATE_RX_STOP;

                    else

                        rx_byte_finished_s <= '1';
                        rx_clock_counter_s <= 0;
                        rx_current_state_s <= STATE_RX_FINISH;

                    end if;


                when STATE_RX_FINISH =>
                    rx_current_state_s <= STATE_RX_IDLE;
                    rx_byte_finished_s   <= '0';


                when others =>
                    rx_current_state_s <= STATE_RX_IDLE;

            end case;
        end if;
    end process;
    -- end RX process

    -- TX process
    process (clock_i)
    begin

        if rising_edge(clock_i) then

            case tx_current_state_s is

                when STATE_TX_IDLE =>
                    TX_active_o <= '0';
                    TX_out_o <= '1';  -- Idle
                    tx_done_s   <= '0';
                    tx_clock_counter_s <= 0;
                    tx_bit_index_s <= 0;

                    if TX_start_i = '1' then
                        tx_data_s <= TX_byte_i;
                        tx_current_state_s <= STATE_TX_START;
                    else
                        tx_current_state_s <= STATE_TX_IDLE;
                    end if;

                -- Start bit = 0
                when STATE_TX_START =>
                    TX_active_o <= '1';
                    TX_out_o <= '0';

                    -- Wait for the correct number of cycles
                    if tx_clock_counter_s < ticks_per_bit_i-1 then
                        tx_clock_counter_s <= tx_clock_counter_s + 1;
                        tx_current_state_s   <= STATE_TX_START;
                    else
                        tx_clock_counter_s <= 0;
                        tx_current_state_s   <= STATE_TX_DATA;
                    end if;


                when STATE_TX_DATA =>
                    TX_out_o <= tx_data_s(tx_bit_index_s);

                    -- Wait for the correct number of cycles
                    if tx_clock_counter_s < ticks_per_bit_i-1 then
                        tx_clock_counter_s <= tx_clock_counter_s + 1;
                        tx_current_state_s   <= STATE_TX_DATA;
                    else
                        tx_clock_counter_s <= 0;

                        -- Send all bit from the byte
                        if tx_bit_index_s < 7 then
                            tx_bit_index_s <= tx_bit_index_s + 1;
                            tx_current_state_s   <= STATE_TX_DATA;
                        else
                            tx_bit_index_s <= 0;
                            tx_current_state_s   <= STATE_TX_STOP;
                        end if;
                    end if;

                -- Stop bit = 1
                when STATE_TX_STOP =>
                    TX_out_o <= '1';

                    -- Wait for the correct number of cycles
                    if tx_clock_counter_s < ticks_per_bit_i-1 then
                        tx_clock_counter_s <= tx_clock_counter_s + 1;
                        tx_current_state_s   <= STATE_TX_STOP;
                    else
                        tx_done_s   <= '1';
                        tx_clock_counter_s <= 0;
                        tx_current_state_s   <= STATE_TX_FINISH;
                    end if;


                when STATE_TX_FINISH =>
                    TX_active_o <= '0';
                    tx_done_s   <= '1';
                    tx_current_state_s   <= STATE_TX_IDLE;


                when others =>
                    tx_current_state_s <= STATE_TX_IDLE;

            end case;
        end if;

    end process;
    -- end of TX process


end RTL;
