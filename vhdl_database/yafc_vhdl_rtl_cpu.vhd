--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

entity yafc is
    port (
        clk       : in  std_logic;
        rst_in    : in  std_logic;
        -- peripheral pins
        tx        : out std_logic;
        rx        : in  std_logic;
        gpio_in  : in  word;
        gpio_out : out word
        );
end entity;

architecture structural of yafc is
    -- I/O signals
    signal io_read, io_write : word      := (others => '0');
    signal io_re, io_we      : std_logic := '0';
    signal io_addr           : address   := (others => '0');
    signal pins_in           : peri_in_pins_t;
    signal pins_out          : peri_out_pins_t;

    -- program counter signals
    signal pc_inc, pc_load : std_logic := '0';
    signal pc              : address   := (others => '0');
    signal pc_next         : address;
    signal insn            : word      := (others => '0');

    -- RAM signals
    signal mem_addr            : address   := (others => '0');
    signal mem_write, mem_read : word      := (others => '0');
    signal mem_we, mem_re      : std_logic := '0';

    -- data stack signals
    signal dpush, dpop        : std_logic                    := '0';
    signal dtos_sel, dnos_sel : std_logic_vector(1 downto 0) := "00";
    signal dtos_in, dnos_in   : word                         := (others => '0');
    signal dstk_sel           : std_logic                    := '0';
    signal dtos, dnos         : word                         := (others => '0');

    -- return stack
    signal rpush, rpop : std_logic := '0';
    signal rtos_sel    : std_logic := '0';
    signal rtos_in     : word      := (others => '0');
    signal rtos        : word      := (others => '0');

    -- logic of ALU
    signal alu_results : alu_results_t := (others => (others => '0'));

    -- Reset
    signal rst_n : std_logic := '0';
begin

    ----------------------------------------------------------------------
    -- TODO:
    --  - Switch to Harvard arch (?)
    --  - Add interrupts
    --  - Make assembler better
    --  - Implement Forth! :-)
    ----------------------------------------------------------------------


    -- async assert, sync deassert
    --reset_conditioner : entity work.reset( Behavioral )
    --  port map (
    --    clk => clk,
    --    rst_i => rst_in,
    --    rst_o => rst_n
    --    );

    ---------------------------------------------------------------------------
    -- assign inputs / outputs
    ---------------------------------------------------------------------------
    rst_n                   <= rst_in;
    pins_in.uart_in_pins.rx <= rx;
    tx                      <= pins_out.uart_out_pins.tx;
    pins_in.gpio_in_pins.input <= gpio_in;
    gpio_out                   <= pins_out.gpio_out_pins.output;

    ---------------------------------------------------------------------------
    -- Peripheral bus
    ---------------------------------------------------------------------------
    peripheral_bus : entity work.peri_bus(Behavioral)
        port map (
            clk      => clk,
            rst_n    => rst_n,
            io_addr  => io_addr,
            io_write => io_write,
            io_we    => io_we,
            io_read  => io_read,
            io_re    => io_re,
            pins_in  => pins_in,
            pins_out => pins_out);

    -------------------------------------------------------------------------------
    -- Main controller
    -------------------------------------------------------------------------------
    controller : entity work.control(Behavioral)
        port map (
            clk         => clk,
            rst_n       => rst_n,
            -- input to controller
            alu_results => alu_results,  -- ALU
            dtos        => dtos,         -- Data Top-of-Stack
            dnos        => dnos,         -- Data Next-on-Stack
            rtos        => rtos,         -- Return Top-of-Stack
            mem_read    => mem_read,     -- memory read bus
            insn        => insn,         -- instruction,
            pc          => pc,           -- PC

            -- data stack
            dpush    => dpush,
            dpop     => dpop,
            dtos_sel => dtos_sel,
            dnos_sel => dnos_sel,
            dtos_in  => dtos_in,
            dnos_in  => dnos_in,
            dstk_sel => dstk_sel,

            -- return stack
            rpush    => rpush,
            rpop     => rpop,
            rtos_sel => rtos_sel,
            rtos_in  => rtos_in,

            -- PC
            pc_inc  => pc_inc,
            pc_load => pc_load,
            pc_next => pc_next,

            -- Memory bus
            mem_addr  => mem_addr,
            mem_write => mem_write,
            mem_we    => mem_we,

            -- I/O bus
            io_read  => io_read,
            io_addr  => io_addr,
            io_write => io_write,
            io_we    => io_we,
            io_re    => io_re
            );

    ---------------------------------------------------------------------------
    -- Arithmetic / Logic Unit
    ---------------------------------------------------------------------------
    inst_alu : entity work.alu(Behavioral)
        port map (
            tos     => dtos,
            nos     => dnos,
            results => alu_results
            );

    ---------------------------------------------------------------------------
    -- Program Counter (PC)
    ---------------------------------------------------------------------------
    prog_cntr : entity work.up_counter(rtl)
        generic map (
            g_width       => c_address_width,
            g_reset_value => "1111010110111"        -- 0x1EB7 (for bootloader)
            --g_reset_value => "0000000000000"
            )
        port map (
            clk   => clk,
            rst_n => rst_n,
            inc   => pc_inc,
            load  => pc_load,
            d     => pc_next,
            q     => pc
            );

    ---------------------------------------------------------------------------
    -- Dual-Port RAM
    --   contains instructions and working memory
    ---------------------------------------------------------------------------
    ram : entity work.dpram(rtl)
        generic map (
            g_data_width => 16,
            g_addr_width => 13,
            g_init       => true,
            g_init_file  => "..\..\examples\bootloader.init"
            )
        port map (
            clk    => clk,
            -- instruction port (read only)
            data_a => (others => '0'),
            addr_a => pc,
            we_a   => '0',
            q_a    => insn,
            -- working memory (read/write)
            addr_b => mem_addr,
            data_b => mem_write,
            we_b   => mem_we,
            q_b    => mem_read
            );

    ---------------------------------------------------------------------------
    -- Main data Stack
    ---------------------------------------------------------------------------
    dstack : entity work.data_stack(Behavioral)
        port map(
            clk     => clk,
            rst_n   => rst_n,
            push    => dpush,
            pop     => dpop,
            tos_sel => dtos_sel,
            tos_in  => dtos_in,
            nos_sel => dnos_sel,
            nos_in  => dnos_in,
            stk_sel => dstk_sel,
            tos     => dtos,
            nos     => dnos,
            ros     => open
            );

    ---------------------------------------------------------------------------
    -- Return stack
    ---------------------------------------------------------------------------
    rstack : entity work.return_stack(Behavioral)
        port map(
            clk     => clk,
            rst_n   => rst_n,
            push    => rpush,
            pop     => rpop,
            tos_sel => rtos_sel,
            tos_in  => rtos_in,
            tos     => rtos
            );

end structural;
