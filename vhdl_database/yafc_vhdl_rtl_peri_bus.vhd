--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.common.all;
use work.uart_pkg.all;
use work.gpio_pkg.all;

entity peri_bus is
    port (
        clk      : in  std_logic;
        rst_n    : in  std_logic;
        -- bus signals
        io_addr  : in  address;
        io_write : in  word;
        io_we    : in  std_logic;
        io_read  : out word;
        io_re    : in  std_logic;
        -- pins into and out of peripherals
        pins_in  : in  peri_in_pins_t;
        pins_out : out peri_out_pins_t
        );
end peri_bus;

architecture Behavioral of peri_bus is
    signal io_read_i : word := (others => '0');  -- internal io_read signal

    -- UART
    signal uart_in_pins  : uart_in_pins_t;
    signal uart_out_pins : uart_out_pins_t;
    signal uart_in_regs  : uart_in_regs_t;
    signal uart_out_regs : uart_out_regs_t;
    -- GPIO
    signal gpio_in_pins  : gpio_in_pins_t;
    signal gpio_out_pins : gpio_out_pins_t;
    signal gpio_in_regs  : gpio_in_regs_t;
    signal gpio_out_regs : gpio_out_regs_t;
begin

    ---------------------------------------------------------------------------
    -- Note: All data types with 'in' and 'out' in the name are named from
    -- the point of view of the peripheral.  Those data types flow in and
    -- out of the peripheral, and out and in to the bus.
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- Assign inputs & outputs
    ---------------------------------------------------------------------------
    uart_in_pins           <= pins_in.uart_in_pins;
    pins_out.uart_out_pins <= uart_out_pins;
    gpio_in_pins           <= pins_in.gpio_in_pins;
    pins_out.gpio_out_pins <= gpio_out_pins;
    io_read                <= io_read_i;

    -------------------------------------------------------------------------------
    -- UART
    -------------------------------------------------------------------------------

    inst_uart : entity work.uart(Behavioral)
        generic map (
            CLOCK_FREQ => 100000000,
            BAUD       => 115200)
        port map (
            clk      => clk,
            rst_n    => rst_n,
            regs_in  => uart_in_regs,
            regs_out => uart_out_regs,
            pins_in  => uart_in_pins,
            pins_out => uart_out_pins);

    ---------------------------------------------------------------------------
    -- GPIO
    ---------------------------------------------------------------------------

    inst_gpio : entity work.gpio(rtl)
        port map (
            clk      => clk,
            rsT_n    => rst_n,
            regs_in  => gpio_in_regs,
            regs_out => gpio_out_regs,
            pins_in  => gpio_in_pins,
            pins_out => gpio_out_pins);

    ---------------------------------------------------------------------------
    -- Periheral Bus I/O space
    ---------------------------------------------------------------------------

    -- Reads from peripherals
    io_reads : process(io_addr, io_re, uart_out_regs, gpio_out_regs)
    begin
        -- default value
        io_read_i <= (others => '0');

        if io_re = '1' then
            case (io_addr) is

                ----------
                -- UART --
                ----------

                -- TODO: pack these into fewer registers
                when "0000000000000" => io_read_i <= "000000000000000" & uart_out_regs.rx_busy;
                when "0000000000001" => io_read_i <= "000000000000000" & uart_out_regs.tx_busy;
                when "0000000000010" => io_read_i <= "00000000" & uart_out_regs.rx_data;

                ----------
                -- GPIO --
                ----------
                when "0000000010000" => io_read_i <= "00000000" & gpio_out_regs.output(7 downto 0);

                -- Default value
                when others => io_read_i <= (others => '0');
                               
            end case;  -- io_addr
        end if;  -- io_re = '1'
    end process io_reads;

    -- writes to peripherals
    io_writes : process(clk)
    begin
        if rising_edge(clk) then

            -- reset any registers here that are "self-resetting" (i.e., tx start)
            uart_in_regs.start <= '0';

            -- check the write-enable
            if io_we = '1' then
                case (io_addr) is

                    ----------
                    -- UART --
                    ----------
                    
                    when "0000000000000" => uart_in_regs.start   <= io_write(0);
                    when "0000000000001" => uart_in_regs.tx_data <= io_write(7 downto 0);

                    ----------
                    -- GPIO --
                    ----------

                    when "0000000010000" => gpio_in_regs.input <= io_write;

                    -- Do nothing for other addresses
                    when others => null;
                                            
                end case;
            end if;  -- io_we = '1'
        end if;  -- rising_edge
    end process io_writes;

end Behavioral;
