--------------------------------------------------------------------------------
--
-- Sweet32_v1_tiny_1_cycle.vhd
-- Description: Sweet32 minimal-RISC core (preliminary release 1.00)
-- Version 1.10
-- Creation date: 10th January 2015
--
-- Author: Valentin Angelovski
-- e-mail: info@fleasystems.com
--
--------------------------------------------------------------------------------/
--
-- Copyright (C) 2014 Valentin Angelovski
--
-- This source file may be used and distributed without
-- restriction provided that this copyright statement is not
-- removed from the file and that any derivative work contains
-- the original copyright notice and the associated disclaimer.
--
-- This source file is free software; you can redistribute it
-- and/or modify it under the terms of the GNU Lesser General
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any
-- later version.
--
-- This source is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
-- PURPOSE. See the GNU Lesser General Public License for more
-- details.
--
-- You should have received a copy of the GNU Lesser General
-- Public License along with this source; if not, download it
-- from http://www.opencores.org/lgpl.shtml
--
----------------------------------------------------------------------------------/
--

-- **** SWEET32 CORE INSTRUCTION SET ****
-- Creation Date: 26th November 2014
-- Author: Valentin Angelovski
--
-- ©2014 - Valentin Angelovski
-- (c)2014 - Valentin Angelovski
----------------------------------------------------------
-- opcode                 mnemonic                		cyc  len
-- -------------------    ---------------------    		---  ---
-- 0000 yyyy zzzz xxxx    AND		Rz,Ry,Rx			*1    1
-- 0001 yyyy zzzz xxxx    ADD		Rz,Ry,Rx			*1    1    (Newly-added for release 0.90)
-- 0010 yyyy zzzz xxxx    XOR		Rz,Ry,Rx			*1    1
-- 0011 yyyy 0000 xxxx    TSTSNZ	Rx,Ry				*1    1
-- 0011 yyyy 0100 xxxx    TSTSZ		Rx,Ry				*1    1    (Newly-added for release 1.00)
-- 0011 yyyy 100i iiii    BITSNZ    Rx,#uimm5			*1    1    (Newly-added for release 0.60)
-- 0011 yyyy 110i iiii    BITSZ		Rx,#uimm5			*1    1    (Newly-added for release 1.00)
-- 0100 yyyy zzzz xxxx    SUBSLT    Rz,Rx,Ry			*1    1    (Newly-added for release 0.90)
-- 0101 yyyy zzzz xxxx    MUL		Rz,Ry,Rx			*1    1
-- 0110 rrrr rrrr rrrr    SJMP		#srel12				*1    1
-- 0111 iiii zzzz iiii    LDB		Rz,#uimm8			*1    1	   (Newly-added for release 0.90)
-- 1000 rrrr rrrr rrrr   +MJMP		#srel28				*2    2
-- 1001 iiii zzzz iiii    GETPC		Rz,#simm8			*1    1
-- 1010 iiii zzzz xxxx    INCS		Rz,Rx,#simm4		*1    1
-- 1011 0000 zzzz 0000 	 +LDW		Rz,#uimm16			*3    2
-- 1011 0001 zzzz 0000 	 +LDD		Rz,#simm32			*4    3
-- 1011 0010 zzzz xxxx    SETIV		Rx					*1    1    (Newly-added for release 0.21)
-- 1011 0011 zzzz xxxx    RETI							*1    1
-- 1011 0100 zzzz xxxx    SETCW		Rx					*1    1
-- 1011 0101 zzzz xxxx    RETT							*1    1    (Newly-added for release 0.50)
-- 1011 0110 zzzz xxxx    GETXR		Rz					*1    1    (New for release 0.70)
-- 1011 0111 zzzz xxxx    GETTR		Rz					*1    1    (New for release 0.70)
-- 1100 0000 zzzz xxxx    SWAPB		Rz,Rx				*1    1
-- 1100 0001 zzzz xxxx    SWAPW		Rz,Rx				*1    1
-- 1100 0010 zzzz xxxx    NOT		Rz,Rx				*1    1    (Modified for release 0.90)
-- 1100 0011 zzzz xxxx    LJMP		Rx					*1    1    (Relocated for release 0.90)
-- 1101 0000 zzzz xxxx    LSR		Rz,Rx				*1    1    (Modified for release 0.60)
-- 1101 0001 zzzz xxxx    ASR		Rz,Rx				*1    1 (Newly-added for release 0.60)
-- 1110 yyyy 0000 xxxx    MOVW		[Rx],Ry             *3    1
-- 1110 yyyy 0001 xxxx    MOVD		[Rx],Ry             *4    1
-- 1110 yyyy 0010 xxxx    MOVB		[Rx],Ry             *4    1 (Newly-added for release 0.60)
-- 1111 0000 zzzz xxxx    MOVW		Rz,[Rx]				*4    1    (Newly-added for release 0.40)
-- 1111 0001 zzzz xxxx    MOVD		Rz,[Rx]				*5    1    (Newly-added for release 0.40)
-- 1111 0010 zzzz xxxx    MOVSW		Rz,[Rx]				*4    1 (Newly-added for release 0.50)
-- 1111 0011 zzzz xxxx    MOVB		Rz,[Rx]				*4    1    (Newly-added for release 0.60)

--
--
-- Build versions
-- **************
-- Version 1.10        22/11/2014        Added unaligned data access support for MOVW and MOVSW opcodes
-- Version 1.00        22/11/2014        Added by Xark: TSTSZ and BITSZ opcodes
-- Version 0.95        19/11/2014        Removed NEG, replaced with NOT opcode. Corrected MOVW opcode
-- Version 0.90        17/11/2014        Added ADD, SUBSLT, LDB. Removed OR, ADDSNC, Relocated AND, LJMP
-- Version 0.70         8/11/2014        Added NEG, GETMX and GETTR opcodes, also added optional 32x32 multiply support
-- Version 0.60         4/11/2014        Added ASR, BITSNZ, modified LSRSC to LSR, added MOVSW (signed word)
-- Version 0.50        21/10/2014        Added rudimentary trace/debug support (needs testing)
-- Version 0.40        17/09/2014        Added MOVD (32bit data move) and modified MOVW ops
-- Version 0.21        10/09/2014        Added fast IRQ support
-- Version 0.10         1/09/2014        Initial pre-release

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
 

entity CPU_SWEET32 is
    generic (
        IMPLEMENT_32x32_MULTIPLY : boolean := false -- False = MUL_16x16, True = MUL_32x32
    );
    port (
        data_i :        in    std_logic_vector(15 downto 0);
        data_o :        out    std_logic_vector(15 downto 0);
        addr_o :        out    std_logic_vector(31 downto 0);
        mem_write_UByte_o :    out    std_logic;
        mem_write_LByte_o :    out    std_logic;
        mem_read_o :    out    std_logic;
        IRQ0 :            in    std_logic;    -- Interrupt request
        clk1 :            in    std_logic;
        rst :            in    std_logic);
end;

architecture CPU_ARCH of CPU_SWEET32 is

	constant OPCODE_OR		: std_logic_vector(3 downto 0):=	"0000";
	constant OPCODE_AND		: std_logic_vector(3 downto 0):=	"0001";
	constant OPCODE_XOR	 	: std_logic_vector(3 downto 0):=	"0010";
	constant OPCODE_COMPARE : std_logic_vector(3 downto 0):=	"0011";
	constant OPCODE_SUBSLT	: std_logic_vector(3 downto 0):=	"0100";
	constant OPCODE_MUL16	: std_logic_vector(3 downto 0):=	"0101";
	constant OPCODE_SJMP12	: std_logic_vector(3 downto 0):=	"0110";
	constant OPCODE_LDB		: std_logic_vector(3 downto 0):=	"0111";
	constant OPCODE_MJMP28	: std_logic_vector(3 downto 0):=	"1000";
	constant OPCODE_GETPC	: std_logic_vector(3 downto 0):=	"1001";
	constant OPCODE_INCS	: std_logic_vector(3 downto 0):=	"1010";
	constant OPCODE_LDD	 	: std_logic_vector(3 downto 0):=	"1011";
	constant OPCODE_SWAP	: std_logic_vector(3 downto 0):=	"1100";
	constant OPCODE_LSRASR	: std_logic_vector(3 downto 0):=	"1101";
	constant OPCODE_MOVMR	: std_logic_vector(3 downto 0):=	"1110";
	constant OPCODE_MOVRM	: std_logic_vector(3 downto 0):=	"1111";

	type mult_width_t is array (boolean) of integer;
	constant mult_width : mult_width_t := (false => 32, true => 63);	-- accumulator'left for 32 or 64 bit multiply
	constant accum_left	: integer	:= mult_width(IMPLEMENT_32x32_MULTIPLY);

	type cpu_states is (DECODE_OP, EXECUTE_MOV_IM, EXECUTE_MOV_RM, EXECUTE_MOV_MR);
	signal cpu_state : cpu_states := DECODE_OP;

	constant HI		: std_logic := '1';
	constant LO		: std_logic := '0';
	constant ONE	: std_logic := '1';
	constant ZERO	: std_logic := '0';
	constant HIZ	: std_logic := 'Z';

	signal	pc					: signed(31 downto 0);				-- Current program address
	signal	Next_opcode_addr	: signed(31 downto 0);				-- Next program address
	signal	signed_rel12		: signed(11 downto 0);
	signal	core_a_data			: std_logic_vector(31 downto 0);	-- Rx
	signal	core_b_data			: std_logic_vector(31 downto 0);	-- Ry

	signal	accumulator			: std_logic_vector(accum_left downto 0);	-- Core accumulator
	signal	temp_register		: std_logic_vector(15 downto 0);

	signal	CPU_Regfile_Wr_En	: std_logic := '0';			 		-- 16x32bit regfile Write enable
	signal	xfer_state			: std_logic_vector(2 downto 0); 		-- Data xfer state counter

	signal	interrupt_address	: std_logic_vector(31 downto 0);		-- Interrupt return reg
	signal	interrupt_return	: std_logic_vector(31 downto 0);	-- Interrupt return reg
	signal	interrupt_enable	: std_logic := '0';
	signal	interrupt_trigger	: std_logic := '0';
	signal	interrupt_ack		: std_logic := '0';
 
	signal	trace_enable		: std_logic := '0';
	signal	trace_trigger		: std_logic := '0';
	signal	trace_ack			: std_logic := '0';
	signal	trace_flip			: std_logic := '0';
	signal	trace_return		: std_logic_vector(31 downto 0);	-- Interrupt return reg

	signal	signed_op			: std_logic := '0';
	signal	IRQ_inhibit			: std_logic := '0'; -- Used to disable the IRQ for extended math ops
	signal	unaligned_word		: std_logic := '0'; 
	
	signal	clk2				: std_logic := '0';
 

begin

    U10 : entity work.Regfile
    port map(
        Data_In => accumulator(31 downto 0),             -- Register Rz input
        Addrs_In => unsigned(data_i(7 downto 4)),        -- Register Rz address
        Addrs1_Out => unsigned(data_i(3 downto 0)),        -- Register Ra address
        Addrs2_Out => unsigned(data_i(11 downto 8)),    -- Register Rb address
        Wr_En    => CPU_Regfile_Wr_En,                    -- Enable writes to regfile
        Clk => clk2,                                    -- input clock
        Data1_Out    => core_a_data,                        -- Register Ra output
        Data2_Out    => core_b_data                         -- Register Rb output
        );



    process(clk1)
    begin

	clk2 <= NOT clk1;

    if rising_edge(clk1) then --Process rising edge of CPU clock

        -- PC / Adress path
        if (rst = '0') then

            cpu_state    <= DECODE_OP;    -- CPU = opcode fetch state by defaut
            pc <= X"00000000"; -- clear program counter
            CPU_Regfile_Wr_En <= '0';
            mem_write_UByte_o <= '0';
            mem_write_LByte_o <= '0';

            mem_read_o <= '1';
			unaligned_word <= '0';
            interrupt_enable <= '0';
            interrupt_trigger <= '0';
            trace_flip <= '0';
            trace_trigger <= '0';
            IRQ_inhibit <= '0';
        else


            case cpu_state is        -- Sweet32 control FSM
                when DECODE_OP =>    -- CPU Instruction decode state

                    CPU_Regfile_Wr_En <= '1';
                    mem_write_UByte_o <= '0';
                    mem_write_LByte_o <= '0';
                    mem_read_o <= '1';
                    IRQ_inhibit <= '0';
                    pc <= pc + 2;

                    -- Trace/debug interrupt event handler
                   -- if (trace_enable = '1' and trace_trigger = '0' and trace_flip = '1') then -- Trace interrupt check
                    --    trace_trigger <= '1';
                    --    trace_return <= std_logic_vector(pc);
                    --    pc <= x"00000004";
                    --    CPU_Regfile_Wr_En <= '0';
                    --    trace_flip <= '0';

                    -- External IRQ interrupt event handler
                    --els
					if IRQ0 = '1' and interrupt_enable = '1' and interrupt_trigger = '0' AND IRQ_inhibit = '0'    and trace_flip = '0' then -- Level triggered IRQ
                        interrupt_trigger <= '1';
                        interrupt_return <= std_logic_vector(pc);
                        pc <= signed(interrupt_address);
                        CPU_Regfile_Wr_En <= '0';

                    -- Instruction decode logic begins here
                    else
                      --  if(trace_enable = '1') then -- Only needed when the trace interrupt is enabled!
                      --      trace_flip <= '1';
                      --  end if;

                        case data_i(15 downto 12) is -- READ LEVEL1 OPCODE

                            when OPCODE_OR => -- AND .
                                accumulator(31 downto 0) <= core_a_data AND core_b_data;

                            when OPCODE_AND => -- ADD .
                                accumulator(31 downto 0) <= core_a_data + core_b_data;

                            when OPCODE_XOR => -- XOR .
                                accumulator(31 downto 0) <= core_a_data XOR core_b_data;

                            when OPCODE_COMPARE => -- TSTSNZ/TSTSZ .
                            CPU_Regfile_Wr_En <= '0'; -- Result not saved!
                            if (data_i(7) = '0') then
                                if (data_i(6) = '0' AND (core_b_data AND core_a_data) /= x"00000000") OR
                                    (data_i(6) = '1' AND (core_b_data AND core_a_data) = x"00000000") then -- Xark TSTSZ
                                    pc <= pc + 4; -- Skip next opcode based on zero/non-zero
                                end if;
                            else    -- BITSNZ/BITSZ .
                                if (core_b_data(to_integer(unsigned(data_i(4 downto 0)))) = NOT data_i(6)) then    -- Xark BITSZ
                                    pc <= pc + 4; -- Skip next opcode based on bit
                                end if;
                            end if;

                            when OPCODE_SUBSLT => -- SUBSLT .
                                accumulator(32 downto 0) <= ('0' & core_a_data) - ('0' & core_b_data);
                                if((('0' & core_a_data) - ('0' & core_b_data)) >= X"100000000") then
                                    pc <= pc + 4; -- Skip next opcode if Carry = 1 (underflow)
                                end if;

                            when OPCODE_MUL16 => -- MUL 16x16 .
                                if IMPLEMENT_32x32_MULTIPLY=true then
                                    accumulator <= core_a_data * core_b_data;
                                    IRQ_inhibit <= '1';
                                else
                                    accumulator(31 downto 0) <= core_a_data(15 downto 0) * core_b_data(15 downto 0); --(Comment out if using 32x32 multiplier)
                                end if;

                            when OPCODE_SJMP12 => -- 12bit SJMP .
                                pc <= pc + signed(data_i(11 downto 0) & '0');
                                CPU_Regfile_Wr_En <= '0';

                            when OPCODE_LDB => -- LDB .
                                accumulator(31 downto 8) <= x"000000";
                                accumulator(7 downto 4) <= data_i(11 downto 8);
                                accumulator(3 downto 0) <= data_i(3 downto 0);

                            when OPCODE_MJMP28 => -- 28bit MJMP .
                                cpu_state <= EXECUTE_MOV_IM;
                                CPU_Regfile_Wr_En <= '0';
                                xfer_state <= "111";
                                signed_rel12 <= signed(data_i(11 downto 0));

                            when OPCODE_GETPC => -- GETPC .
                                accumulator(31 downto 0) <= std_logic_vector(pc + signed(data_i(11 downto 8) & data_i(3 downto 0) & '0'));

                            when OPCODE_INCS => -- INCS .
                                accumulator(31 downto 0) <= std_logic_vector(signed(core_b_data) + signed(data_i(3 downto 0)));

                            when OPCODE_LDD => -- LOAD IMM16/32 .
                                CPU_Regfile_Wr_En <= '0';
                                case data_i(11 downto 8) is
                                    when "0000" =>    --LOAD IMM16
                                        accumulator(31 downto 16) <= "0000000000000000";
                                        cpu_state <= EXECUTE_MOV_IM;
                                        xfer_state <= "100";
                                    when "0001" =>    -- LOAD IMM32
                                        cpu_state <= EXECUTE_MOV_IM;
                                        xfer_state <= "000";
                                    when "0010" =>    -- LOAD IRQ VECTOR
                                        interrupt_address <= core_a_data;
                                    when "0011" =>    -- INTERRUPT RETURN
                                        PC <= signed(interrupt_return);
                                        interrupt_trigger <= '0';
                                        --trace_flip <= '0';
                                    when "0100" =>    -- Set CPU control word
                                        interrupt_enable <= core_a_data(0);
                                        trace_enable <= core_a_data(31);
                                        trace_flip <= '0';
                                --    when "0101" =>    -- TRACE RETURN
                                --        PC <= signed(trace_return);
                                --        trace_trigger <= '0';
                                --        trace_flip <= '0';
                                --    when "0110" =>    -- GET UPPER 32bit MATH RESULT (Un-comment if using 32x32 multiplier)
                                --        if IMPLEMENT_32x32_MULTIPLY=true then
                                --            accumulator(31 downto 0) <= accumulator(63 downto 32);
                                --            IRQ_inhibit <= '0';
                                 --           CPU_Regfile_Wr_En <= '1';
                                 --       else
                                 --           null;
                                --        end if;
                                 --   when "0111" =>    -- GET Trace Return address
                                 --       accumulator(31 downto 0) <= trace_return;
                                 --       CPU_Regfile_Wr_En <= '1';
                                    when others => null;
                                end case;


                            when OPCODE_SWAP => 
                                case data_i(11 downto 8) is
                                    when "0000" =>    --SWAPB _
                                        accumulator(31 downto 16) <= core_a_data(31 downto 16);
                                        accumulator(15 downto 8) <= core_a_data(7 downto 0);
                                        accumulator(7 downto 0) <= core_a_data(15 downto 8);
                                    when "0001" =>    --SWAPW _
                                        accumulator(31 downto 16) <= core_a_data(15 downto 0);
                                        accumulator(15 downto 0) <= core_a_data(31 downto 16);
                                    when "0010" =>    --NOT
                                        accumulator(31 downto 0) <= NOT core_a_data;
                                    when "0011" => -- LJMP
                                        pc <= signed(core_a_data(31 downto 1) & '0');
                                        CPU_Regfile_Wr_En <= '0';
                                    when others => null;
                                end case;

                            when OPCODE_LSRASR => 
                                accumulator(30 downto 0) <= core_a_data(31 downto 1);
                                case data_i(11 downto 8) is
                                    when "0000" =>    --Logical Shift Right
                                        accumulator(31) <= '0';

                                    when "0001" =>    --Arithmetic Shift Right
                                        accumulator(31) <= core_a_data(31);
                                    when others => null;
                                end case;

                            when OPCODE_MOVMR =>
                                pc <= signed(core_a_data(31 downto 1) & '0');
                                cpu_state <= EXECUTE_MOV_MR;
                                mem_write_UByte_o <= '1';
                                mem_write_LByte_o <= '1';
                                mem_read_o <= '0';
                                CPU_Regfile_Wr_En <= '0';
                                Next_opcode_addr <= pc;    -- Update Program counter
                                case data_i(7 downto 4) is
                                    when "0000" =>    --MOVW
										unaligned_word <= core_a_data(0);
										if (core_a_data(0) = '0') then
											data_o <= core_b_data(15 downto 0);
											xfer_state <= "001";
										else -- Non-aligned word access
										
											mem_write_UByte_o <= '1';
											mem_write_LByte_o <= '0';
											data_o(7 downto 0) <= core_b_data(15 downto 8);
											data_o(15 downto 8) <= core_b_data(7 downto 0);
											xfer_state <= "000";
										end if;
                                    when "0001" =>    --MOVD --  Little-endian
                                        data_o <= core_b_data(15 downto 0); -- Remember - Big endian data transfer = Upper-word 1st!
                                        temp_register <= core_b_data(31 downto 16); -- OPCD_REGB_REGZ_REGA
                                        xfer_state <= "000";
                                    when "0010" =>    --MOVB
                                        if(core_a_data(0) = '1') then    --  little endian
                                            mem_write_LByte_o <= '0';
                                            data_o(15 downto 8) <= core_b_data(7 downto 0);
                                        else
                                            mem_write_UByte_o <= '0';
                                            data_o(7 downto 0) <= core_b_data(7 downto 0);
                                        end if;
                                        xfer_state <= "001";
                                    when others => null;
                                end case;

                            when OPCODE_MOVRM =>
                                pc <= signed(core_a_data(31 downto 1) & '0');
                                cpu_state <= EXECUTE_MOV_RM; -- FROM 16BIT MEMORY MOVE
                                CPU_Regfile_Wr_En <= '0';
                                Next_opcode_addr <= pc;    -- Update Program counter
                                case data_i(11 downto 8) is
                                    when "0000" | "0010" =>    --MOVW /MOVSW
										accumulator(31 downto 16) <= "0000000000000000";
										
										unaligned_word <= core_a_data(0);
										
										if (core_a_data(0) = '0') then
											xfer_state <= "001";
										else -- Non-aligned word access
											xfer_state <= "000";
										end if;
										if(data_i(9) = '1') then -- MOVSW decode
											signed_op <= '1';
										end if;
										
                                    when "0001" =>    --MOVD
                                        xfer_state <= "000";

                                    when "0011" =>    --MOVB
                                        pc <= signed(core_a_data);
                                        xfer_state <= "011";
                                        accumulator(31 downto 8) <= "000000000000000000000000";
                                    when others => null;
                                end case;
                            when others =>
                        end case;
                end if;
                when EXECUTE_MOV_IM => -- Data immediate transfer state
                    case xfer_state is

                        when "000" =>    -- #immediate_32 entry point
                            pc <= pc + 2;
                            accumulator(15 downto 0) <= data_i(15 downto 0);
                            xfer_state <= "001";
                        when "001" =>
                            accumulator(31 downto 16) <= data_i(15 downto 0);
                            pc <= pc - 4;
                            xfer_state <= "010";
                        when "010" =>    -- #immediate_32 entry point
                            pc <= pc + 6;
                            CPU_Regfile_Wr_En <= '1';
                            cpu_state <= DECODE_OP;
                        when "100" =>
                            accumulator(15 downto 0) <= data_i(15 downto 0);
                            pc <= pc - 2;
                            xfer_state <= "101";
                        when "101" =>    -- #immediate_32 entry point
                            pc <= pc + 4;
                            CPU_Regfile_Wr_En <= '1';
                            cpu_state <= DECODE_OP;

                        when "111" =>
                            pc    <= pc + signed(std_logic_vector(signed_rel12) & data_i(15 downto 0) & '0');
                            cpu_state <= DECODE_OP;
                        when others => null;
                    end case;

                when EXECUTE_MOV_RM => -- Ext. Memory data transfer state
                    case xfer_state is
                        when "000" =>    -- #immediate_32 entry point
                            pc <= pc + 2;
							if(unaligned_word = '0') then
								accumulator(15 downto 0) <= data_i(15 downto 0);
							else
								temp_register(7 downto 0) <= data_i(15 downto 8);
							end if;
                            xfer_state <= "100";
                        when "001" =>
                            if(signed_op = '1') then
                                accumulator(31 downto 16) <= data_i(15) & data_i(15) & data_i(15) & data_i(15) &
                                data_i(15) & data_i(15) & data_i(15) & data_i(15) &
                                data_i(15) & data_i(15) & data_i(15) & data_i(15) &
                                data_i(15) & data_i(15) & data_i(15) & data_i(15);
                                signed_op <= '0';
                            end if;
                            accumulator(15 downto 0) <= data_i(15 downto 0);
                            pc <= Next_opcode_addr;    -- Update Program counter
                            xfer_state <= "010";
                        when "010" =>
                            CPU_Regfile_Wr_En <= '1';
                            pc <= pc + 2; 
							unaligned_word <= '0';
                            cpu_state <= DECODE_OP;
                        when "011" =>
                            if (pc(0) = '1') then    -- little endian
                                accumulator(7 downto 0) <= data_i(15 downto 8);
                            else
                                accumulator(7 downto 0) <= data_i(7 downto 0);
                            end if;
                            pc <= Next_opcode_addr;    -- Update Program counter
                            xfer_state <= "010";
                        when "100" =>
							if(unaligned_word = '0') then -- MOVD
								accumulator(31 downto 16) <= data_i(15 downto 0);
							else -- non-aligned MOVW
								accumulator(7 downto 0) <= temp_register(7 downto 0);
								accumulator(15 downto 8) <= data_i(7 downto 0);
								
								if(signed_op = '1') then -- non-aligned MOVW
									accumulator(31 downto 16) <= data_i(15) & data_i(15) & data_i(15) & data_i(15) &
									data_i(15) & data_i(15) & data_i(15) & data_i(15) &
									data_i(15) & data_i(15) & data_i(15) & data_i(15) &
									data_i(15) & data_i(15) & data_i(15) & data_i(15);
									signed_op <= '0';
								end if;
								
							end if;
                            pc <= Next_opcode_addr;    -- Update Program counter
                            xfer_state <= "010";
                        when others => null;
                    end case;

                when EXECUTE_MOV_MR => -- Ext. Memory data transfer state
                    case xfer_state is
                        -- mem[Reg] <- Reg State machine
                        -- 32-bit move
                        when "000" =>    -- 32bit mem word[Rx] = Rz
                            pc <= pc + 2;
							if(unaligned_word = '0') then
								data_o <= temp_register;
							else
								mem_write_UByte_o <= '0';
								mem_write_LByte_o <= '1';
							end if;
                            xfer_state <= "001";
                        when "001" =>
                            mem_write_LByte_o <= '0';
                            mem_write_UByte_o <= '0';
                            pc <= Next_opcode_addr + 2;    -- Update Program counter
                            cpu_state <= DECODE_OP;
                            mem_read_o <= '1';
							unaligned_word <= '0';
                        when others => null;
                    end case;


                when others => null;
            end case;
        end if;

     end if;
    end process;

    -- Combinatorial Logic goes here
    addr_o    <= std_logic_vector(pc);

end architecture CPU_ARCH; 
