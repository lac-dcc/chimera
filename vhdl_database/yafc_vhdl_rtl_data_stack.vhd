--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library ieee;
use ieee.std_logic_1164.all;

use work.common.all;

entity data_stack is
    port (
        clk     : in  std_logic;
        rst_n   : in  std_logic;
        push    : in  std_logic;
        pop     : in  std_logic;
        tos_sel : in  std_logic_vector(1 downto 0);
        tos_in  : in  word;
        nos_sel : in  std_logic_vector(1 downto 0);
        nos_in  : in  word;
        stk_sel : in  std_logic;
        tos     : out word;             -- Top-Of-Stack
        nos     : out word;             -- Next-On-Stack
        ros     : out word              -- thiRd-On-Stack
        );
end data_stack;

architecture Behavioral of data_stack is

    -----------
    -- Types --
    -----------
    type regs_t is record
        tos : word;
        nos : word;
    end record;

    ---------------
    -- Constants --
    ---------------
    constant c_regs_reset : regs_t := (tos  => (others => '0'),
                                        nos => (others => '0'));

    -------------
    -- Signals --
    -------------
    signal regs, next_regs : regs_t := c_regs_reset;
    signal stack_dout      : word   := (others => '0');
    signal stack_din       : word   := (others => '0');

begin

    -- assign outputs
    tos <= regs.tos;
    nos <= regs.nos;
    ros <= stack_dout;

    -- the formal stack itself
    Inst_stack : entity work.stack(Behavioral)
        PORT MAP(
            clk   => clk,
            rst_n => rst_n,
            push  => push,
            pop   => pop,
            din   => stack_din,
            dout  => stack_dout,
            full  => open,
            empty => open
            );

    -- create registers
    regs_proc : process(clk, rst_n)
    begin
        if rst_n = '0' then
            regs <= c_regs_reset;
        elsif rising_edge(clk) then
            regs <= next_regs;
        end if;
    end process regs_proc;

    -- combinational logic
    comb_proc : process(regs, tos_in, nos_in, tos_sel, nos_sel, stk_sel, stack_dout)
    begin
        -- default is to keep old value
        next_regs <= regs;
        stack_din <= (others => '0');

        -- stack input select
        if stk_sel = '0' then
            stack_din <= regs.nos;
        else
            stack_din <= regs.tos;
        end if;

        -- TOS select
        case tos_sel is
            when "01" =>
                next_regs.tos <= regs.nos;
            when "10" =>
                next_regs.tos <= stack_dout;
            when "11" =>
                next_regs.tos <= tos_in;
            when others =>
                next_regs.tos <= regs.tos;
        end case;

        -- NOS select
        case nos_sel is
            when "01" =>
                next_regs.nos <= regs.tos;
            when "10" =>
                next_regs.nos <= stack_dout;
            when "11" =>
                next_regs.nos <= nos_in;
            when others =>
                next_regs.nos <= regs.nos;
        end case;
        
    end process comb_proc;

end Behavioral;
