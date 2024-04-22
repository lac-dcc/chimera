--
-- midi.vhd
-- SM-X - MIDI - Victor Trucco
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
-- 1.0 - Minimal MIDI - Initial support for MIDRY.COM
--
--

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.ALL;

entity midi is
    port(
            clk_i       : in    std_logic;
            reset_i     : in    std_logic;
            iorq_i      : in    std_logic;
            wrt_i       : in    std_logic;
            rd_i        : in    std_logic;
            tx_i        : in    std_logic;
            rx_o        : out   std_logic;
            adr_i       : in    std_logic_vector( 15 downto 0 );
            db_i        : in    std_logic_vector(  7 downto 0 );
            db_o        : out   std_logic_vector(  7 downto 0 ) := (others => 'Z');
            tx_active_o : out   std_logic := '0'
 );
end midi;

architecture Behavior of midi is

-- TYPES for state machine of each part of the design
type    tx_states   is (STATE_TX_IDLE, STATE_TX_DATA, STATE_TX_FINISH);

-- UART TX operations
signal  my_tx_state             : tx_states := STATE_TX_IDLE;
signal  uart_tx_o               : std_logic := '0';
signal  uart_tx_active_i        : std_logic;
signal  out_tx_data             : std_logic_vector(7 downto 0) := (others => '0');

-- I/O port selection
signal  address_e8              : STD_LOGIC := '1';
signal  address_e9              : STD_LOGIC := '1';
signal  select_e8w              : STD_LOGIC := '1';
signal  select_e9r              : STD_LOGIC := '1';


-- Interrupt
signal  interrupt_enabled       : STD_LOGIC := '0';
signal  int_interrupt_enabled   : STD_LOGIC := '0';

signal  TxEM                    : STD_LOGIC := '1';


begin


    U1 : entity work.UART
    port map
    (                                                                    -- (21 477 272           ) / 31250 = 687.27    =  31250 bps
        uart_prescaler_i    => std_logic_vector( to_unsigned(687, 14) ), -- (50 000 000 * 55 / 128) / 31250 = 687.50    =  31250 bps
        TX_start_i          => uart_tx_o,
        TX_byte_i           => out_tx_data,
        TX_active_o         => uart_tx_active_i,
        RX_byte_finished_o  => open,
        RX_byte_o           => open,
        TX_out_o            => rx_o,
        RX_in_i             => tx_i,
        clock_i             => clk_i
    );



    address_e8 <= '0' when adr_i (7 downto 0) = x"e8" else '1';
    address_e9 <= '0' when adr_i (7 downto 0) = x"e9" else '1';
    select_e8w <= ( address_e8 or ( wrt_i ) or ( iorq_i ) );
    select_e9r <= ( address_e9 or ( rd_i ) or ( iorq_i ) );


    process (clk_i)
    begin
        if rising_edge(clk_i) then

            -- RESET of cartridge
            if (reset_i = '0') then

                my_tx_state <= STATE_TX_IDLE;
                TxEM <= '1';

            else

                tx_active_o <= uart_tx_active_i;
                TxEM <= not uart_tx_active_i;

                if (select_e8w = '0') then


                        case my_tx_state is


                            -- First step: get the data that should be sent
                            when STATE_TX_IDLE =>
                            if uart_tx_active_i = '0' then
                                    -- Copy the data to the UART tx Data signal
                                    out_tx_data <= db_i;
                                    -- Signal UART that it should start transferring data
                                    uart_tx_o <= '1';
                                    -- Ready for the next state
                                    my_tx_state <= STATE_TX_DATA;
                                end if;

                            -- Second step, guarantee UART get our command, wait one clock
                            when STATE_TX_DATA =>
                                -- UART got our command, Ready for the next state
                                my_tx_state <= STATE_TX_FINISH;

                            -- Final step:
                            when STATE_TX_FINISH =>
                                uart_tx_o <= '0';
                                my_tx_state <= STATE_TX_IDLE;

                            when others =>
                                -- Real bad, stop everything
                                my_tx_state <= STATE_TX_IDLE;
                                uart_tx_o <= '0';

                        end case;

                elsif (select_e9r = '0') then
                        --The UART Status register
                        --bit 7 DSR: Data set ready
                        --      This bit is connected to the DSR input of the UART, which in the GT is connected to the output of counter 2 of the timer.
                        --bit 6 BRK: Break detect. A break signal is detected by checking the stop bit. If it has been 0 twice in a row, there is a break signal. Normally, the stop bit can only become 0 if the transmitter has set the SBRK bit of the command register. Break signals are not used in the MIDI protocol.
                        --      0 = no break signal detected
                        --      1 = break signal detected
                        --bit 5 FE: Framing error. A framing error is caused by a break signal or an error in the data transfer. With MIDI, a FE is always caused by an error in the data transfer, because break signals are not used.
                        --      0 = no framing error
                        --      1 = stop bit was 0
                        --bit 4 OE: Overrun error
                        --      0 = no overrun error
                        --      1 = the UART has received a new character while the CPU was not ready reading the previous character.
                        --bit 3 PE: Parity error. Since parity is not checked in the MIDI protocol, this bit is always 0 when transferring MIDI data.
                        --      0 = no parity error
                        --      1 = wrong parity
                        --bit 2 TxEM: Transmitter empty. If TxEM is 1, the TxEM will become 0 as soon as the CPU has written a new value to the data port.
                        --      0 = the UART is sending data
                        --      1 = the UART is ready sending the last byte
                        --bit 1 RxRDY: Receiver ready. This status bit is also connected to the RxRDY output of the UART, which in the GT, is combined with the RTS signal and connected to the interrupt input of the CPU.
                        --      0 = no byte received
                        --      1 = byte received
                        --bit 0 TxRDY: Transmitter ready. The TxRDY status bit is always equal to the TxEM status bit.
                        --                  The difference between these two bits is that the TxEM bit is directly connected to the TxEM output of the UART,
                        --                  and the TxRDY bit is masked with two other bits before it is connected to the TxRDY output of the UART.
                        --                  For the MSX programmer, this difference is irrelevant because these two UART outputs are not used in the GT.
                        --      0 = the UART is not ready to send a new byte
                        --      1 = the UART is ready to send a new byte


                        db_o <= "00000" & TxEM & '0' & TxEM;

                else

                        db_o <= x"FF";

                end if;

            end if;
        end if;
    end process;
end Behavior;
