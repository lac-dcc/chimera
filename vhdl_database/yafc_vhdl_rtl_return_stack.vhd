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

entity return_stack is
    port (
        clk     : in  std_logic;
        rst_n   : in  std_logic;
        push    : in  std_logic;
        pop     : in  std_logic;
        tos_in  : in  word;
        tos_sel : in  std_logic;
        tos     : out word              -- Top-Of-Stack
        );
end return_stack;

architecture Behavioral of return_stack is
    signal tos_i, next_tos : word      := (others => '0');
    signal stack_dout      : word      := (others => '0');
    signal stack_din       : word      := (others => '0');
begin

    -- assign outputs
    tos <= tos_i;

    -- create registers
    regs_proc : process(clk)
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                tos_i <= (others => '0');
            else
                tos_i <= next_tos;
            end if;
        end if;
    end process regs_proc;

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

    -- the only input to the stack is the TOS register
    stack_din <= tos_i;

    -- combinational logic
    comb_proc : process(tos_i, tos_in, tos_sel, stack_dout)
    begin
        -- defaults
        next_tos <= tos_i;

        if tos_sel = '0' then
            next_tos <= tos_in;
        else
            next_tos <= stack_dout;
        end if;
    end process comb_proc;

end Behavioral;
