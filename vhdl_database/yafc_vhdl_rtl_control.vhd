--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.common.all;
use work.opcodes.all;

entity control is
    port (
        -- entity control
        clk   : in std_logic;
        rst_n : in std_logic;

        -- ALU
        alu_results : in alu_results_t;

        -- data stack
        dtos     : in  word;
        dnos     : in  word;
        dtos_in  : out word;
        dnos_in  : out word;
        dpush    : out std_logic;
        dpop     : out std_logic;
        dtos_sel : out std_logic_vector(1 downto 0);
        dnos_sel : out std_logic_vector(1 downto 0);
        dstk_sel : out std_logic;

        -- return stack
        rtos     : in  word;
        rtos_in  : out word;
        rpush    : out std_logic;
        rpop     : out std_logic;
        rtos_sel : out std_logic;

        -- program counter
        pc      : in  address;
        pc_next : out address;
        pc_inc  : out std_logic;
        pc_load : out std_logic;

        -- instruction
        insn : in word;

        -- working memory
        mem_read  : in  word;
        mem_write : out word;
        mem_addr  : out address;
        mem_we    : out std_logic;

        -- I/O
        io_read  : in  word;
        io_addr  : out address;
        io_write : out word;
        io_we    : out std_logic;
        io_re    : out std_logic
        );
end control;

architecture Behavioral of control is
    -- internal signals
    signal stall, stall_i : std_logic := '0';
begin

    -- create register for stall
    regs : process(clk, rst_n)
    begin
        if rst_n = '0' then
            stall <= '0';
        elsif rising_edge(clk) then
            stall <= stall_i;
        end if;
    end process regs;

    -- instruction decoding
    decode : process(alu_results, dnos, dtos, insn, io_read, mem_read, pc,
                     rtos, stall)
        variable mcode : mcode;
        variable fcode : fcode;

        -- Procedures
        procedure pop_dstack is
        begin
            dtos_sel <= "01";
            dnos_sel <= "10";
            dpop     <= '1';
        end procedure pop_dstack;
    begin
        -- default values
        dpush     <= '0';
        dpop      <= '0';
        dtos_sel  <= "00";
        dnos_sel  <= "00";
        dtos_in   <= (others => '0');
        dnos_in   <= (others => '0');
        dstk_sel  <= '0';
        rpush     <= '0';
        rpop      <= '0';
        rtos_sel  <= '0';
        rtos_in   <= rtos;              -- this feedback is necessary to store
                                        -- the value
        pc_inc    <= '1';
        pc_load   <= '0';
        pc_next   <= (others => '0');
        mem_addr  <= (others => '0');
        mem_write <= (others => '0');
        mem_we    <= '0';
        stall_i   <= '0';
        io_re     <= '0';
        io_we     <= '0';
        io_addr   <= dtos(c_address_width-1 downto 0);
        io_write  <= (others => '0');

        -- grab the major code and function code
        mcode := insn(14 downto 13);
        fcode := insn(12 downto 8);

        -- stalling or executing?
        if stall = '1' then
            stall_i <= '0';  -- only ever need one cycle of stalling right now
        else
            -- decode the instruction
            if insn(insn'high) = '1' then  -- literal
                dtos_in  <= insn(insn'high-1) & insn(insn'high-1 downto 0);  -- sign-extend the literal by 1 bit
                dtos_sel <= "11";
                dnos_sel <= "01";
                dpush    <= '1';
                -- if it's a new literal that's going on the stack, it could be an address to read from memory
                mem_addr <= insn(c_address_width-1 downto 0);
            else
                -- otherwise the memory address to use will come from the top of the D stack
                mem_addr <= dtos(c_address_width-1 downto 0);

                -- which major code is this instruction?
                case mcode is
                    
                    when m_jump =>      -- unconditional jump
                        pc_load <= '1';
                        pc_next <= insn(c_address_width-1 downto 0);
                        stall_i <= '1';
                        
                    when m_0bra =>      -- conditional jump (0branch)
                        if dtos = "0000000000000000" then
                            pc_load <= '1';
                            pc_next <= insn(c_address_width-1 downto 0);
                            stall_i <= '1';
                        end if;
                        pop_dstack;
                        
                    when m_call =>      -- call a word
                        pc_load <= '1';
                        pc_next <= insn(c_address_width-1 downto 0);
                        rtos_in <= "000" & pc;
                        rpush   <= '1';
                        stall_i <= '1';

                    when m_func =>      -- function

                        -- execute the function
                        case fcode is
                            when f_add =>  -- add
                                dtos_in  <= alu_results.add_result;
                                dtos_sel <= "11";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when f_sub =>  -- subtract
                                dtos_in  <= alu_results.sub_result;
                                dtos_sel <= "11";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when f_sla =>  -- arithmetic left shift
                                dtos_in  <= alu_results.sll_result;
                                dtos_sel <= "11";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when f_sra =>  -- arithmetic right shift
                                dtos_in  <= alu_results.srl_result;
                                dtos_sel <= "11";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when f_dup =>  -- dup
                                dtos_sel <= "00";
                                dnos_sel <= "01";
                                dstk_sel <= '0';
                                dpush    <= '1';
                                
                            when f_not =>  -- not
                                dtos_sel <= "11";
                                dtos_in  <= not dtos;
                                
                            when f_ftc =>  -- fetch   @
                                dtos_in  <= mem_read;
                                dtos_sel <= "11";
                                
                            when f_dtr =>  -- >R   "to R"
                                rpush    <= '1';
                                rtos_in  <= dtos;
                                dtos_sel <= "01";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when f_str =>  -- store   ! [assembler MUST insert a drop after this]
                                mem_addr  <= dtos(c_address_width-1 downto 0);
                                mem_write <= dnos;
                                mem_we    <= '1';
                                pop_dstack;
                                
                            when f_pop =>  -- drop
                                pop_dstack;
                                
                            when f_rtd =>  -- R>  "from R"
                                rtos_sel <= '1';
                                rpop     <= '1';
                                dtos_in  <= rtos;
                                dtos_sel <= "11";
                                dnos_sel <= "01";
                                dpush    <= '1';
                                
                            when f_rot =>  -- rot ( a b c -- b c a )
                                dtos_sel <= "10";
                                dnos_sel <= "01";
                                dpush    <= '1';
                                dpop     <= '1';
                                
                            when f_nrt =>  -- -rot ( a b c -- c b a )
                                dtos_sel <= "01";
                                dnos_sel <= "10";
                                dstk_sel <= '1';
                                dpush    <= '1';
                                dpop     <= '1';
                                
                            when f_swp =>  -- swap ( a b -- b a )
                                dtos_sel <= "01";
                                dnos_sel <= "01";
                                
                            when f_nip =>  -- nip  ( a b c -- a c )
                                dtos_sel <= "00";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when f_tck =>  -- tuck ( a b -- b a b )
                                dtos_sel <= "00";
                                dnos_sel <= "00";
                                dstk_sel <= '1';
                                dpush    <= '1';
                                
                            when f_ovr =>  -- over ( a b -- a b a )
                                dtos_sel <= "01";
                                dnos_sel <= "01";
                                dpush    <= '1';
                                
                            when f_equ =>  -- = ( a b -- t/f )
                                dtos_in  <= alu_results.eq_result;
                                dtos_sel <= "11";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when f_ioo =>  -- io! ( n a -- ) [assembler MUST (well, should probably) insert a drop after this]
                                io_write <= dnos;
                                io_we    <= '1';
                                pop_dstack;
                                
                            when f_ioi =>  -- io@ ( a -- n )
                                io_addr  <= dtos(c_address_width-1 downto 0);
                                io_re    <= '1';
                                dtos_sel <= "11";
                                dtos_in  <= io_read;
                            
                            when f_or =>    -- or ( a b -- a|b)
                                dtos_in  <= alu_results.or_result;
                                dtos_sel <= "11";
                                dnos_sel <= "10";
                                dpop     <= '1';
                            
                            when f_and =>   -- and ( a b -- a&b)
                                dtos_in  <= alu_results.and_result;
                                dtos_sel <= "11";
                                dnos_sel <= "10";
                                dpop     <= '1';
                                
                            when others =>  -- NOP
                                null;
                                
                        end case;  -- case( fcode )

                        ------------------------
                        -- check for subcodes --
                        ------------------------

                        -- ret (return from word)
                        if insn(s_ret) = '1' then
                            rtos_sel <= '1';
                            rpop     <= '1';
                            pc_load  <= '1';
                            pc_next  <= rtos(c_address_width-1 downto 0);
                            stall_i  <= '1';
                        end if;
                        
                    when others =>
                        null;
                end case;  -- case( mcode )
            end if;  -- insn( insn'high ) = 0
        end if;  -- if stall
    end process decode;
end Behavioral;
