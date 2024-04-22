------------------------------------------------------------------------
----                                                                ----
---- WF68K10 IP Core: Address register logic.                       ----
----                                                                ----
---- Description:                                                   ----
---- This arithmetical logical unit handles all integer operations. ----
---- The shift operations are computed by a standard shifter within ----
---- up to 32 clock cycles depending on the shift width. The multi- ----
---- plication is modeled as a hardware multiplier which calculates ----
---- the result in one clock cycle. The division requires 32 clock  ----
---- cycles for 32 bit wide operands. The date which is required    ----
---- for the respective operation is stored in registers. The ALU   ----
---- works together with the writeback of the operands as third     ----
---- stage in the pipelined architecture. The handshaking is provi- ----
---- ded by ALU_REQ, ALU_ACK and ALU_BUSY. For more information     ----
---- refer to the MC68010 User' Manual.                             ----
----                                                                ----
---- Author(s):                                                     ----
---- - Wolfgang Foerster, wf@experiment-s.de; wf@inventronik.de     ----
----                                                                ----
------------------------------------------------------------------------
----                                                                ----
---- Copyright © 2014-2019 Wolfgang Foerster Inventronik GmbH.      ----
----                                                                ----
---- This documentation describes Open Hardware and is licensed     ----
---- under the CERN OHL v. 1.2. You may redistribute and modify     ----
---- this documentation under the terms of the CERN OHL v.1.2.      ----
---- (http://ohwr.org/cernohl). This documentation is distributed   ----
---- WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF          ----
---- MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A        ----
---- PARTICULAR PURPOSE. Please see the CERN OHL v.1.2 for          ----
---- applicable conditions                                          ----
----                                                                ----
------------------------------------------------------------------------
-- 
-- Revision History
-- 
-- Revision 2K14B 20141201 WF
--   Initial Release.
-- Revision 2K18A 20180620 WF
--   Bug fix: MOVEM sign extension.
--   Fix for restoring correct values during the DIVS and DIVU in word format.
--   Fixed the SUBQ calculation.
--   Rearranged the Offset for the JSR instruction.
--   EXT instruction uses now RESULT(63 downto 0).
--   Shifter signals now ready if shift width is zero.
--   Fixed wrong condition codes for AND_B, ANDI, EOR, EORI, OR_B, ORI and NOT_B.
--   Fixed writeback issues in the status register logic.
--   Fixed the condition code calculation for NEG and NEGX.
-- Revision 2K19A 20190419 WF
--   Fixed a bug in MULU.W (input operands are now 16 bit wide).
--

library work;
use work.WF68K10_PKG.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity WF68K10_ALU is
    port (
        CLK                 : in std_logic;
        RESET               : in bit;

        LOAD_OP1            : in bit;
        LOAD_OP2            : in bit;
        LOAD_OP3            : in bit;

        OP1_IN              : in Std_Logic_Vector(31 downto 0);
        OP2_IN              : in Std_Logic_Vector(31 downto 0);
        OP3_IN              : in Std_Logic_Vector(31 downto 0);

        BITPOS_IN           : in Std_Logic_Vector(4 downto 0);

        RESULT              : out Std_Logic_Vector(63 downto 0);

        ADR_MODE_IN         : in Std_Logic_Vector(2 downto 0);
        OP_SIZE_IN          : in OP_SIZETYPE;
        OP_IN               : in OP_68K;
        OP_WB               : in OP_68K;
        BIW_0_IN            : in Std_Logic_Vector(11 downto 0);
        BIW_1_IN            : in Std_Logic_Vector(15 downto 0);

        -- The Flags:
        SR_WR               : in bit;
        SR_INIT             : in bit;
        CC_UPDT             : in bit;

        STATUS_REG_OUT	    : out std_logic_vector(15 downto 0);
        ALU_COND            : out boolean;
        
        -- Status and Control:
        ALU_INIT            : in bit; -- Strobe.
        ALU_BSY             : out bit;
        ALU_REQ             : buffer bit;
        ALU_ACK             : in bit;
        IRQ_PEND            : in std_logic_vector(2 downto 0);
        TRAP_CHK            : out bit; -- Trap due to the CHK instruction.
        TRAP_DIVZERO        : out bit -- Trap due to divide by zero.
    );
end entity WF68K10_ALU;
    
architecture BEHAVIOUR of WF68K10_ALU is
type DIV_STATES is (IDLE, INIT, CALC);
type SHIFT_STATES is (IDLE, RUN);
signal ALU_COND_I           : boolean;
signal ADR_MODE             : Std_Logic_Vector(2 downto 0);
signal BITPOS               : integer range 0 to 31;
signal BIW_0                : Std_Logic_Vector(11 downto 0);
signal BIW_1                : Std_Logic_Vector(15 downto 0);
signal CB_BCD               : std_logic;
signal CHK_CMP_COND         : boolean;
signal DIV_RDY              : bit;
signal DIV_STATE            : DIV_STATES := IDLE;
signal MSB                  : integer range 0 to 31;
signal OP                   : OP_68K := UNIMPLEMENTED;
signal OP1                  : Std_Logic_Vector(31 downto 0);
signal OP2                  : Std_Logic_Vector(31 downto 0);
signal OP3                  : Std_Logic_Vector(31 downto 0);
signal OP1_SIGNEXT          : Std_Logic_Vector(31 downto 0);
signal OP2_SIGNEXT          : Std_Logic_Vector(31 downto 0);
signal OP_SIZE              : OP_SIZETYPE := LONG;
signal QUOTIENT             : unsigned(31 downto 0);
signal REMAINDER            : unsigned(31 downto 0);
signal RESULT_BCDOP         : Std_Logic_Vector(7 downto 0);
signal RESULT_BITOP		    : Std_Logic_Vector(31 downto 0);
signal RESULT_INTOP         : Std_Logic_Vector(31 downto 0);
signal RESULT_LOGOP         : Std_Logic_Vector(31 downto 0);
signal RESULT_MUL           : Std_Logic_Vector(63 downto 0);
signal RESULT_SHIFTOP		: Std_Logic_Vector(31 downto 0);
signal RESULT_OTHERS        : Std_Logic_Vector(31 downto 0);
signal SHIFT_STATE	        : SHIFT_STATES;
signal SHIFT_WIDTH          : Std_Logic_Vector(5 downto 0);
signal SHIFT_WIDTH_IN       : Std_Logic_Vector(5 downto 0);
signal SHFT_LOAD            : bit;
signal SHFT_RDY             : bit;
signal SHFT_EN	            : bit;
signal STATUS_REG           : Std_Logic_Vector(15 downto 0);
signal VFLAG_DIV            : std_logic;
signal XFLAG_SHFT           : std_logic;
signal XNZVC                : Std_Logic_Vector(4 downto 0);
begin
    PARAMETER_BUFFER: process
    begin
        wait until CLK = '1' and CLK' event;
        if ALU_INIT = '1' then
            ADR_MODE <= ADR_MODE_IN;
            OP_SIZE <= OP_SIZE_IN;
            OP <= OP_IN;
            BIW_0 <= BIW_0_IN;
            BIW_1 <= BIW_1_IN;
            BITPOS <= To_Integer(unsigned(BITPOS_IN));
            SHIFT_WIDTH <= SHIFT_WIDTH_IN;
        end if;
    end process PARAMETER_BUFFER;

    OPERANDS: process
    -- During instruction execution, the buffers are written
    -- before or during ALU_INIT and copied to the operands
    -- during ALU_INIT.
    variable OP1_BUFFER		: Std_Logic_Vector(31 downto 0);
    variable OP2_BUFFER		: Std_Logic_Vector(31 downto 0);
    variable OP3_BUFFER		: Std_Logic_Vector(31 downto 0);
    begin
        wait until CLK = '1' and CLK' event;

        if LOAD_OP1 = '1' then
            OP1_BUFFER := OP1_IN;
        end if;

        if LOAD_OP2 = '1' then
            OP2_BUFFER := OP2_IN;
        end if;

        if LOAD_OP3 = '1' then
            OP3_BUFFER := OP3_IN;
        end if;
        
        if ALU_INIT = '1' then
            OP1 <= OP1_BUFFER;
            OP2 <= OP2_BUFFER;
            OP3 <= OP3_BUFFER;
        end if;
    end process OPERANDS;

    P_BUSY: process
    begin
        wait until CLK = '1' and CLK' event;
        if ALU_INIT = '1' then
            ALU_BSY <= '1';
        elsif ALU_ACK = '1' or RESET = '1' then
            ALU_BSY <= '0';
        end if;
        -- This signal requests the control state machine to proceed when the ALU is ready.
        if ALU_ACK = '1' then
            ALU_REQ <= '0';
        elsif (OP = ASL or OP = ASR or OP = LSL or OP = LSR or OP = ROTL or OP = ROTR or OP = ROXL or OP = ROXR) and SHFT_RDY = '1' then
            ALU_REQ <= '1';
        elsif (OP = DIVS or OP = DIVU) and DIV_RDY = '1' then
            ALU_REQ <= '1';
        elsif OP_IN = DIVS or OP_IN = DIVU then
            null;
        elsif OP_IN = ASL or OP_IN = ASR or OP_IN = LSL or OP_IN = LSR then
            null;
        elsif OP_IN = ROTL or OP_IN = ROTR or OP_IN = ROXL or OP_IN = ROXR then
            null;
        elsif ALU_INIT = '1' then
            ALU_REQ <= '1';
        end if;
    end process P_BUSY;
    
    with OP_SIZE select
        MSB <= 31 when LONG,
               15 when WORD,
                7 when BYTE;

    SIGNEXT: process(OP, OP1, OP2, OP3, OP_SIZE)
    -- This module provides the required sign extensions.
    begin
        case OP_SIZE is
            when LONG =>
                OP1_SIGNEXT <= OP1;
                OP2_SIGNEXT <= OP2;
            when WORD =>
                for i in 31 downto 16 loop
                    OP1_SIGNEXT(i) <= OP1(15);
                    OP2_SIGNEXT(i) <= OP2(15);
                end loop;
                OP1_SIGNEXT(15 downto 0) <= OP1(15 downto 0);
                OP2_SIGNEXT(15 downto 0) <= OP2(15 downto 0);
            when BYTE =>
                for i in 31 downto 8 loop
                    OP1_SIGNEXT(i) <= OP1(7);
                    OP2_SIGNEXT(i) <= OP2(7);
                end loop;
                OP1_SIGNEXT(7 downto 0) <= OP1(7 downto 0);
                OP2_SIGNEXT(7 downto 0) <= OP2(7 downto 0);
        end case;
    end process SIGNEXT;

    P_BCDOP: process(OP, STATUS_REG, OP1, OP2)
    -- The BCD operations are all byte wide and unsigned.
    variable X_IN_I         : unsigned(0 downto 0);
    variable TEMP0          : unsigned(4 downto 0);
    variable TEMP1          : unsigned(4 downto 0);
    variable Z_0            : unsigned(3 downto 0);
    variable C_0            : unsigned(0 downto 0);
    variable Z_1            : unsigned(3 downto 0);
    variable C_1            : std_logic;
    variable S_0            : unsigned(3 downto 0);
    variable S_1            : unsigned(3 downto 0);
    begin
        X_IN_I(0) := STATUS_REG(4); -- Inverted extended Flag.

        case OP is
            when ABCD =>
                TEMP0 := unsigned('0' & OP2(3 downto 0)) + unsigned('0' & OP1(3 downto 0)) + ("0000" & X_IN_I);
            when NBCD =>
                TEMP0 := unsigned(OP1(4 downto 0)) - unsigned('0' & OP2(3 downto 0)) - ("0000" & X_IN_I);
            when others => -- Valid for SBCD.
                TEMP0 := unsigned('0' & OP2(3 downto 0)) - unsigned('0' & OP1(3 downto 0)) - ("0000" & X_IN_I);
        end case;

        if Std_Logic_Vector(TEMP0) > "01001" then
            Z_0 := "0110";
            C_0 := "1";
        else
            Z_0 := "0000";
            C_0 := "0";
        end if;

        case OP is
            when ABCD =>
                TEMP1 := unsigned('0' & OP2(7 downto 4)) + unsigned('0' & OP1(7 downto 4)) + ("0000" & C_0);
            when NBCD =>
                TEMP1 := unsigned(OP1(4 downto 0)) - unsigned('0' & OP2(7 downto 4)) - ("0000" & X_IN_I);
            when others => -- Valid for SBCD.
                TEMP1 := unsigned('0' & OP2(7 downto 4)) - unsigned('0' & OP1(7 downto 4)) - ("0000" & C_0);
        end case;

        if Std_Logic_Vector(TEMP1) > "01001" then
            Z_1 := "0110";
            C_1 := '1';
        else
            Z_1 := "0000";
            C_1 := '0';
        end if;

        case OP is
            when ABCD =>
                S_1 := TEMP1(3 downto 0) + Z_1;
                S_0 := TEMP0(3 downto 0) + Z_0;
            when others => -- Valid for SBCD, NBCD.
                S_1 := TEMP1(3 downto 0) - Z_1;
                S_0 := TEMP0(3 downto 0) - Z_0;
        end case;           
        --
        CB_BCD <= C_1;
        RESULT_BCDOP(7 downto 4) <= Std_Logic_Vector(S_1);
        RESULT_BCDOP(3 downto 0) <= Std_Logic_Vector(S_0);
    end process P_BCDOP;

    P_BITOP: process(BITPOS, OP, OP2)
    -- Bit manipulation operations.
    begin
        RESULT_BITOP <= OP2; -- The default is the unmanipulated data.
        --
        case OP is
            when BCHG =>
                RESULT_BITOP(BITPOS) <= not OP2(BITPOS);
            when BCLR =>
                RESULT_BITOP(BITPOS) <= '0';
            when BSET =>
                RESULT_BITOP(BITPOS) <= '1';
            when others => 
                RESULT_BITOP <= OP2; -- Dummy, no result required for BTST.
        end case;
    end process P_BITOP;

    DIVISION: process
    variable BITCNT         : integer range 0 to 64;
    variable DIVIDEND       : unsigned(63 downto 0);
    variable DIVISOR        : unsigned(31 downto 0);
    variable QUOTIENT_REST  : unsigned(31 downto 0);
    variable QUOTIENT_VAR   : unsigned(31 downto 0);
    variable REMAINDER_REST : unsigned(31 downto 0);
    variable REMAINDER_VAR  : unsigned(31 downto 0);
    -- Be aware, that the destination and source operands
    -- may be reloaded during the division operation. For
    -- this, we use the restore values in case of an overflow.
    begin
        wait until CLK = '1' and CLK' event;
        DIV_RDY <= '0';
        case DIV_STATE is 
            when IDLE => 
                if ALU_INIT = '1' and (OP_IN = DIVS or OP_IN = DIVU) then 
                    DIV_STATE <= INIT; 
                end if;
            when INIT =>
                if OP = DIVS and OP_SIZE = LONG and BIW_1(10) = '1' and OP3(31) = '1' then -- 64 bit signed negative dividend.
                    DIVIDEND := unsigned(not (OP3 & OP2) + '1');
                elsif (OP = DIVS or OP = DIVU) and OP_SIZE = LONG and BIW_1(10) = '1' then -- 64 bit positive or unsigned dividend.
                    DIVIDEND := unsigned(OP3 & OP2);
                elsif OP = DIVS and OP2(31) = '1' then -- 32 bit signed negative dividend.
                    DIVIDEND := x"00000000" & unsigned(not(OP2) + '1');
                else -- 32 bit positive or unsigned dividend.
                    DIVIDEND := x"00000000" & unsigned(OP2);
                end if;

                if OP = DIVS and OP_SIZE = LONG and OP1(31) = '1' then -- 32 bit signed negative divisor.
                    DIVISOR := unsigned(not OP1 + '1');
                elsif OP_SIZE = LONG then -- 32 bit positive or unsigned divisor.
                    DIVISOR := unsigned(OP1);
                elsif OP = DIVS and OP_SIZE = WORD and OP1(15) = '1' then -- 16 bit signed negative divisor.
                    DIVISOR := x"0000" & unsigned(not OP1(15 downto 0) + '1');
                else -- 16 bit posive or unsigned divisor.
                    DIVISOR := x"0000" & unsigned(OP1(15 downto 0));
                end if;

                VFLAG_DIV <= '0';
                QUOTIENT <= (others => '0');
                QUOTIENT_VAR := (others => '0');
                QUOTIENT_REST := unsigned(OP2);

                REMAINDER <= (others => '0');
                REMAINDER_VAR := (others => '0');

                case OP_SIZE is
                    when LONG => REMAINDER_REST := unsigned(OP3);
                    when others => REMAINDER_REST := unsigned(x"0000" & OP2(31 downto 16));
                end case;

                if OP_SIZE = LONG and BIW_1(10) = '1' then
                    BITCNT := 64;
                else
                    BITCNT := 32;
                end if;

                if DIVISOR = x"00000000" then -- Division by zero.
                    QUOTIENT <= (others => '1');
                    REMAINDER <= (others => '1');
                    DIV_STATE <= IDLE;
                    DIV_RDY <= '1';
                elsif x"00000000" & DIVISOR > DIVIDEND then -- Divisor > dividend.
                    REMAINDER <= DIVIDEND(31 downto 0);
                    DIV_STATE <= IDLE;
                    DIV_RDY <= '1';
                elsif x"00000000" & DIVISOR = DIVIDEND then -- Result is 1.
                    QUOTIENT <= x"00000001";
                    DIV_STATE <= IDLE;
                    DIV_RDY <= '1';
                else
                    DIV_STATE <= CALC;
                end if;
            when CALC =>
                BITCNT := BITCNT - 1;
                --
                if REMAINDER_VAR & DIVIDEND(BITCNT) < DIVISOR then
                    REMAINDER_VAR := REMAINDER_VAR(30 downto 0) & DIVIDEND(BITCNT);
                elsif OP_SIZE = LONG and BITCNT > 31 then -- Division overflow in 64 bit mode.
                    VFLAG_DIV <= '1';
                    DIV_STATE <= IDLE;
                    DIV_RDY <= '1';
                    QUOTIENT <= QUOTIENT_REST;
                    REMAINDER <= REMAINDER_REST;
                elsif OP_SIZE = WORD and BITCNT > 15 then -- Division overflow in 64 bit mode.
                    VFLAG_DIV <= '1';
                    DIV_STATE <= IDLE;
                    DIV_RDY <= '1';
                    QUOTIENT <= QUOTIENT_REST;
                    REMAINDER <= REMAINDER_REST;
                else
                    REMAINDER_VAR := (REMAINDER_VAR(30 downto 0) & DIVIDEND(BITCNT)) - DIVISOR;
                    QUOTIENT_VAR(BITCNT) := '1';
                end if;
                --
                if BITCNT = 0 then
                    -- Adjust signs:
                    if OP = DIVS and OP_SIZE = LONG and BIW_1(10) = '1' and (OP3(31) xor OP1(31)) = '1' then
                        QUOTIENT <= not QUOTIENT_VAR + 1; -- Negative, change sign.
                    elsif OP = DIVS and OP_SIZE = LONG and BIW_1(10) = '0' and (OP2(31) xor OP1(31)) = '1' then
                        QUOTIENT <= not QUOTIENT_VAR + 1; -- Negative, change sign.
                    elsif OP = DIVS and OP_SIZE = WORD and (OP2(31) xor OP1(15)) = '1' then
                        QUOTIENT <= not QUOTIENT_VAR + 1; -- Negative, change sign.
                    else
                        QUOTIENT <= QUOTIENT_VAR;
                    end if;
                    --
                    REMAINDER <= REMAINDER_VAR;
                    DIV_RDY <= '1';
                    DIV_STATE <= IDLE;
                end if;
            end case;
    end process DIVISION;

    P_INTOP: process(OP, OP1, OP1_SIGNEXT, OP2, OP2_SIGNEXT, ADR_MODE, STATUS_REG, RESULT_INTOP)
    -- The integer arithmetics ADD, SUB, NEG and CMP in their different variations are modelled here.
    variable X_IN_I         : Std_Logic_Vector(0 downto 0);
    variable RESULT         : unsigned(31 downto 0);
    begin
        X_IN_I(0) := STATUS_REG(4); -- Extended Flag.
        case OP is
            when ADDA => -- No sign extension for the destination.
                RESULT := unsigned(OP2) + unsigned(OP1_SIGNEXT);
            when ADDQ =>
                case ADR_MODE is
                    when "001" => RESULT := unsigned(OP2) + unsigned(OP1); -- No sign extension for address destination.
                    when others => RESULT := unsigned(OP2_SIGNEXT) + unsigned(OP1);
                end case;
            when SUBQ =>
                case ADR_MODE is
                    when "001" => RESULT := unsigned(OP2) - unsigned(OP1); -- No sign extension for address destination.
                    when others => RESULT := unsigned(OP2_SIGNEXT) - unsigned(OP1);
                end case;
            when ADD | ADDI =>
                RESULT := unsigned(OP2_SIGNEXT) + unsigned(OP1_SIGNEXT);
            when ADDX =>
                RESULT := unsigned(OP2_SIGNEXT) + unsigned(OP1_SIGNEXT) + unsigned(X_IN_I);
            when CMPA | DBcc | SUBA => -- No sign extension for the destination.
                RESULT := unsigned(OP2) - unsigned(OP1_SIGNEXT);
            when CMP | CMPI | CMPM | SUB | SUBI =>
                RESULT := unsigned(OP2_SIGNEXT) - unsigned(OP1_SIGNEXT);
            when SUBX =>
                RESULT := unsigned(OP2_SIGNEXT) - unsigned(OP1_SIGNEXT) - unsigned(X_IN_I);
            when NEG =>
                RESULT := unsigned(OP1_SIGNEXT) - unsigned(OP2_SIGNEXT);
            when NEGX =>
                RESULT := unsigned(OP1_SIGNEXT) - unsigned(OP2_SIGNEXT) - unsigned(X_IN_I);
            when CLR =>
                RESULT := (others => '0');
            when others =>
                RESULT := (others => '0'); -- Don't care.
        end case;
        RESULT_INTOP <= Std_Logic_Vector(RESULT);
    end process P_INTOP;

    P_LOGOP: process(OP, OP1, OP2)
    -- This process provides the logic operations:
    -- AND, OR, XOR and NOT.
    -- The logic operations require no signed / unsigned
    -- modelling.
    begin
        case OP is
            when AND_B | ANDI | ANDI_TO_CCR | ANDI_TO_SR =>
                RESULT_LOGOP <= OP1 and OP2;
            when OR_B | ORI | ORI_TO_CCR | ORI_TO_SR =>
                RESULT_LOGOP <= OP1 or OP2;
            when EOR | EORI | EORI_TO_CCR | EORI_TO_SR =>
                RESULT_LOGOP <= OP1 xor OP2;
            when others => -- NOT_B.
                RESULT_LOGOP <= not OP2;
        end case;
    end process P_LOGOP;

    RESULT_MUL <= Std_Logic_Vector(signed(OP1_SIGNEXT) * signed(OP2_SIGNEXT)) when OP = MULS else
                  Std_Logic_Vector(unsigned(OP1) * unsigned(OP2)) when OP_SIZE = LONG else
                  Std_Logic_Vector(unsigned(x"0000" & OP1(15 downto 0)) * unsigned(x"0000" & OP2(15 downto 0)));

    P_OTHERS: process(ALU_COND_I, BIW_0, OP, OP1, OP2, OP1_SIGNEXT, OP2_SIGNEXT, OP_SIZE)
    -- This process provides the calculation for special operations.
    variable RESULT : unsigned(31 downto 0);
    begin
        RESULT := (others => '0');
        case OP is
            when EXT =>
                case BIW_0(8 downto 6) is
                    when "011" =>
                        for i in 31 downto 16 loop
                            RESULT(i) := OP2(15);
                        end loop;
                        RESULT(15 downto 0) := unsigned(OP2(15 downto 0));
                    when others => -- Word.
                        for i in 15 downto 8 loop
                            RESULT(i) := OP2(7);
                        end loop;
                        RESULT(31 downto 16) := unsigned(OP2(31 downto 16));
                        RESULT(7 downto 0) := unsigned(OP2(7 downto 0));
                end case;
            when JSR =>
                RESULT := unsigned(OP1) + "10"; -- Add offset of two to the Pointer of the last extension word.
            when MOVEQ =>
                for i in 31 downto 8 loop
                    RESULT(i) := OP1(7);
                end loop;
                RESULT(7 downto 0) := unsigned(OP1(7 downto 0));
            when Scc =>
                if ALU_COND_I = true then
                    RESULT := (others => '1');
                else
                    RESULT := (others => '0');
                end if;
            when SWAP =>
                RESULT := unsigned(OP2(15 downto 0)) & unsigned(OP2(31 downto 16));
            when TAS =>
                RESULT := x"000000" & '1' & unsigned(OP2(6 downto 0)); -- Set the MSB.
            when LINK | TST =>
                RESULT := unsigned(OP2);
            when MOVEA | MOVEM | MOVES =>
                RESULT := unsigned(OP1_SIGNEXT);
            when others => -- MOVE_FROM_CCR, MOVE_TO_CCR, MOVE_FROM_SR, MOVE_TO_SR, MOVE, MOVEC, MOVEP, STOP.
                RESULT := unsigned(OP1);
        end case;
        RESULT_OTHERS <= Std_Logic_Vector(RESULT);
    end process P_OTHERS;

    SHFT_LOAD <= '1' when ALU_INIT = '1' and (OP_IN = ASL or OP_IN = ASR) else
                 '1' when ALU_INIT = '1' and (OP_IN = LSL or OP_IN = LSR) else
                 '1' when ALU_INIT = '1' and (OP_IN = ROTL or OP_IN = ROTR) else
                 '1' when ALU_INIT = '1' and (OP_IN = ROXL or OP_IN = ROXR) else '0';

    SHIFT_WIDTH_IN <= "000001" when BIW_0_IN(7 downto 6) = "11" else -- Memory shifts.
                      "001000" when BIW_0_IN(5) = '0' and BIW_0_IN(11 downto 9) = "000" else -- Direct.
                      "000" & BIW_0_IN(11 downto 9) when BIW_0_IN(5) = '0' else -- Direct.
                      OP1_IN(5 downto 0);

    P_SHFT_CTRL: process
    -- The variable shift or rotate length requires a control
    -- to achieve the correct OPERAND manipulation.
    variable BIT_CNT	: std_logic_vector(5 downto 0);
    begin
        wait until CLK = '1' and CLK' event;

        SHFT_RDY <= '0';
        
        if SHIFT_STATE = IDLE then
            if SHFT_LOAD = '1' and SHIFT_WIDTH_IN = "000000" then
                SHFT_RDY <= '1';
            elsif SHFT_LOAD = '1' then
                SHIFT_STATE <= RUN;
                BIT_CNT := SHIFT_WIDTH_IN;
                SHFT_EN <= '1';
            else
                SHIFT_STATE <= IDLE;
                BIT_CNT := (others => '0');
                SHFT_EN <= '0';
            end if;
        elsif SHIFT_STATE = RUN then
            if BIT_CNT = "000001" then
                SHIFT_STATE <= IDLE;
                SHFT_EN <= '0';
                SHFT_RDY <= '1';
            else
                SHIFT_STATE <= RUN;
                BIT_CNT := BIT_CNT - '1';
                SHFT_EN <= '1';
            end if;
        end if;
    end process P_SHFT_CTRL;

    SHIFTER: process
    begin
        wait until CLK = '1' and CLK' event;
        if SHFT_LOAD = '1' then -- Load data in the shifter unit.
            RESULT_SHIFTOP <= OP2_IN; -- Load data for the shift or rotate operations.
        elsif SHFT_EN = '1' then -- Shift and rotate operations:
            case OP is
                when ASL =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= RESULT_SHIFTOP(30 downto 0) & '0';
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & RESULT_SHIFTOP(14 downto 0) & '0';
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & RESULT_SHIFTOP(6 downto 0) & '0';
                    end if;
                when ASR =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= RESULT_SHIFTOP(31) & RESULT_SHIFTOP(31 downto 1);
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & RESULT_SHIFTOP(15) & RESULT_SHIFTOP(15 downto 1);
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & RESULT_SHIFTOP(7) & RESULT_SHIFTOP(7 downto 1);
                    end if;
                when LSL =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= RESULT_SHIFTOP(30 downto 0) & '0';
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & RESULT_SHIFTOP(14 downto 0) & '0';
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & RESULT_SHIFTOP(6 downto 0) & '0';
                    end if;
                when LSR =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= '0' & RESULT_SHIFTOP(31 downto 1);
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & '0' & RESULT_SHIFTOP(15 downto 1);
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & '0' & RESULT_SHIFTOP(7 downto 1);
                    end if;
                when ROTL =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= RESULT_SHIFTOP(30 downto 0) & RESULT_SHIFTOP(31);
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & RESULT_SHIFTOP(14 downto 0) & RESULT_SHIFTOP(15);
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & RESULT_SHIFTOP(6 downto 0) & RESULT_SHIFTOP(7);
                    end if;
                    -- X not affected;
                when ROTR =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= RESULT_SHIFTOP(0) & RESULT_SHIFTOP(31 downto 1);
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & RESULT_SHIFTOP(0) & RESULT_SHIFTOP(15 downto 1);
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & RESULT_SHIFTOP(0) & RESULT_SHIFTOP(7 downto 1);
                    end if;
                    -- X not affected;
                when ROXL =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= RESULT_SHIFTOP(30 downto 0) & XFLAG_SHFT;
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & RESULT_SHIFTOP(14 downto 0) & XFLAG_SHFT;
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & RESULT_SHIFTOP(6 downto 0) & XFLAG_SHFT;
                    end if;
                when ROXR =>
                    if OP_SIZE = LONG then
                        RESULT_SHIFTOP <= XFLAG_SHFT & RESULT_SHIFTOP(31 downto 1);
                    elsif OP_SIZE = WORD then
                        RESULT_SHIFTOP <= x"0000" & XFLAG_SHFT & RESULT_SHIFTOP(15 downto 1);
                    else -- OP_SIZE = BYTE.
                        RESULT_SHIFTOP <= x"000000" & XFLAG_SHFT & RESULT_SHIFTOP(7 downto 1);
                    end if;
                when others => null; -- Unaffected, forbidden.
            end case;
        end if;
    end process SHIFTER;

    P_OUT: process
    begin
        wait until CLK = '1' and CLK' event;
            case OP is
                when ABCD | NBCD | SBCD => 
                    RESULT <= x"00000000000000" & RESULT_BCDOP; -- Byte only.
                when BCHG | BCLR | BSET | BTST =>
                    RESULT <= x"00000000" & RESULT_BITOP;
                when ADD | ADDA | ADDI | ADDQ | ADDX | CLR | CMP | CMPA | CMPI =>
                    RESULT <= x"00000000" & RESULT_INTOP;
                when CMPM | DBcc | NEG | NEGX | SUB | SUBA | SUBI | SUBQ | SUBX =>
                    RESULT <= x"00000000" & RESULT_INTOP;
                when AND_B | ANDI | EOR | EORI | NOT_B | OR_B | ORI =>
                    RESULT <= x"00000000" & RESULT_LOGOP;
                when ANDI_TO_SR | EORI_TO_SR | ORI_TO_SR => -- Used for branch prediction.
                    RESULT <= x"00000000" & RESULT_LOGOP;
                when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                    RESULT <= x"00000000" & RESULT_SHIFTOP;
                when DIVS | DIVU =>
                    case OP_SIZE is
                        when LONG => RESULT <= Std_Logic_Vector(REMAINDER) & Std_Logic_Vector(QUOTIENT);
                        when others => RESULT <= x"00000000" & Std_Logic_Vector(REMAINDER(15 downto 0)) & Std_Logic_Vector(QUOTIENT(15 downto 0));
                    end case;
                when MULS | MULU =>
                    RESULT <= RESULT_MUL;
                when others =>
                    RESULT <= OP2 & RESULT_OTHERS; -- OP2 is used for EXG.
            end case;
    end process P_OUT;

    -- Out of bounds condition:
    CHK_CMP_COND <= true when OP = CHK and OP2_SIGNEXT(MSB) = '1' else -- Negative destination.
                    true when OP = CHK and signed(OP2_SIGNEXT) > signed(OP1_SIGNEXT) else false;

    -- All traps must be modeled as strobes.
    TRAP_CHK <= '1' when ALU_ACK = '1' and OP = CHK and CHK_CMP_COND = true else '0';
    TRAP_DIVZERO <= '1' when ALU_INIT = '1' and (OP_IN = DIVS or OP_IN = DIVU) and OP1_IN = x"00000000" else '0';
    
    COND_CODES: process(BIW_1, BITPOS, CB_BCD, CHK_CMP_COND, CLK, OP1, OP1_SIGNEXT, OP2, OP2_SIGNEXT,
                        MSB, OP, OP_SIZE, QUOTIENT, RESULT_BCDOP, RESULT_INTOP, RESULT_LOGOP, RESULT_MUL, RESULT_SHIFTOP, 
                        RESULT_OTHERS, SHIFT_WIDTH, STATUS_REG, VFLAG_DIV, XFLAG_SHFT)
    -- In this process all the condition codes X (eXtended), N (Negative)
    -- Z (Zero), V (oVerflow) and C (Carry / borrow) are calculated for
    -- all integer operations. Except for the MULS, MULU, DIVS, DIVU the
    -- new conditions are valid one clock cycle after the operation starts.
    -- For the multiplication and the division, the codes are valid after
    -- BUSY is released.
    variable TMP            : std_logic;
    variable Z, RM, SM, DM  : std_logic;
    variable CFLAG_SHFT     : std_logic;
    variable VFLAG_SHFT     : std_logic;
    variable NFLAG_DIV      : std_logic;
    variable NFLAG_MUL      : std_logic;
    variable VFLAG_MUL      : std_logic;
    variable RM_SM_DM       : bit_vector(2 downto 0);
    begin
        -- Shifter C, X and V flags:
        if CLK = '1' and CLK' event then
            if SHFT_LOAD = '1' or SHIFT_WIDTH = "000000" then
                XFLAG_SHFT <= STATUS_REG(4);
            elsif SHFT_EN = '1' then
                case OP is
                    when ROTL | ROTR => 
                        XFLAG_SHFT <= STATUS_REG(4); -- Unaffected.
                    when ASL | LSL | ROXL =>
                        case OP_SIZE is
                            when LONG =>
                                XFLAG_SHFT <= RESULT_SHIFTOP(31);
                            when WORD =>
                                XFLAG_SHFT <= RESULT_SHIFTOP(15);
                            when BYTE =>
                                XFLAG_SHFT <= RESULT_SHIFTOP(7);
                        end case;
                    when others => -- ASR, LSR, ROXR.
                        XFLAG_SHFT <= RESULT_SHIFTOP(0);
                end case;
            end if;
            --
            if (OP = ROXL or OP = ROXR) and SHIFT_WIDTH = "000000" then
                CFLAG_SHFT := STATUS_REG(4);
            elsif SHIFT_WIDTH = "000000" then
                CFLAG_SHFT := '0';
            elsif SHFT_EN = '1' then
                case OP is
                    when ASL | LSL | ROTL | ROXL =>
                        case OP_SIZE is
                            when LONG =>
                                CFLAG_SHFT := RESULT_SHIFTOP(31);
                            when WORD =>
                                CFLAG_SHFT := RESULT_SHIFTOP(15);
                            when BYTE =>
                                CFLAG_SHFT := RESULT_SHIFTOP(7);
                        end case;
                    when others => -- ASR, LSR, ROTR, ROXR
                        CFLAG_SHFT := RESULT_SHIFTOP(0);
                end case;
            end if;
            --
            -- This logic provides a detection of any toggling of the most significant
            -- bit of the shifter unit during the ASL shift process. For all other shift
            -- operations, the V flag is always zero.
            if SHFT_LOAD = '1' or SHIFT_WIDTH = "000000" then
                VFLAG_SHFT := '0';
            elsif SHFT_EN = '1' then
                case OP is
                    when ASL => -- ASR MSB is always unchanged.
                        if OP_SIZE = LONG then
                            VFLAG_SHFT := (RESULT_SHIFTOP(31) xor RESULT_SHIFTOP(30)) or VFLAG_SHFT;
                        elsif OP_SIZE = WORD then
                            VFLAG_SHFT := (RESULT_SHIFTOP(15) xor RESULT_SHIFTOP(14)) or VFLAG_SHFT;
                        else -- OP_SIZE = BYTE.
                            VFLAG_SHFT := (RESULT_SHIFTOP(7) xor RESULT_SHIFTOP(6)) or VFLAG_SHFT;
                        end if;
                when others =>
                    VFLAG_SHFT := '0';
                end case;
            end if;
        end if;

        -- DIVISION:
        if OP_SIZE = LONG and QUOTIENT(31) = '1' then
            NFLAG_DIV := '1';
        elsif OP_SIZE = WORD and QUOTIENT(15) = '1' then
            NFLAG_DIV := '1';
        else
            NFLAG_DIV := '0';
        end if;

        -- Integer operations:
        case OP is
            when ADD | ADDI | ADDQ | ADDX | CMP | CMPA | CMPI | CMPM | NEG | NEGX | SUB | SUBI | SUBQ | SUBX  =>
                RM := RESULT_INTOP(MSB);
                SM := OP1_SIGNEXT(MSB);
                DM := OP2_SIGNEXT(MSB);
            when others =>
                RM := '-'; SM := '-'; DM := '-';
        end case;

        RM_SM_DM := To_Bit(RM) & To_Bit(SM) & To_Bit(DM);

        -- Multiplication:
        if OP_SIZE = LONG and BIW_1(10) = '1' and RESULT_MUL(63) = '1' then -- 64 bit result.
            NFLAG_MUL := '1';
        elsif RESULT_MUL(31) = '1' then -- 32 bit result.
            NFLAG_MUL := '1';
        else
            NFLAG_MUL := '0';
        end if;

        if OP_SIZE = LONG and BIW_1(10) = '0' and OP = MULS and RESULT_MUL(31) = '0' and  RESULT_MUL(63 downto 32) /= x"00000000" then
            VFLAG_MUL := '1';
        elsif OP_SIZE = LONG and BIW_1(10) = '0' and OP = MULS and RESULT_MUL(31) = '1' and RESULT_MUL(63 downto 32) /= x"FFFFFFFF" then
            VFLAG_MUL := '1';
        elsif OP_SIZE = LONG and BIW_1(10) = '0' and OP = MULU and RESULT_MUL(63 downto 32) /= x"00000000" then
            VFLAG_MUL := '1';
        else
            VFLAG_MUL := '0';
        end if;
            
        -- The Z Flag:
        TMP := '0';
        case OP is
            when ADD | ADDI | ADDQ | ADDX | CMP | CMPA | CMPI | CMPM | NEG | NEGX | SUB | SUBI | SUBQ | SUBX  =>
                for i in RESULT_INTOP' range loop
                    if i <= MSB then
                        TMP:= TMP or RESULT_INTOP(i); -- Detect '1'.
                    end if;
                end loop;
                Z := not TMP; -- Invert for Z fLAG .
            when AND_B | ANDI | EOR | EORI | OR_B | ORI | NOT_B =>
                for i in RESULT_LOGOP' range loop
                    if i <= MSB then
                        TMP:= TMP or RESULT_LOGOP(i); -- Detect '1'.
                    end if;
                end loop;
                Z := not TMP; -- Invert for Z fLAG .
            when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                for i in RESULT_SHIFTOP' range loop
                    if i <= MSB then
                        TMP:= TMP or RESULT_SHIFTOP(i); -- Detect '1'.
                    end if;
                end loop;
                Z := not TMP; -- Invert for Z fLAG .
            when BCHG | BCLR | BSET | BTST =>
                Z := not OP2(BITPOS);
            when DIVS | DIVU =>
                if QUOTIENT = x"00000000" then
                    Z := '1';
                else
                    Z := '0';
                end if;
            when EXT | MOVE | SWAP | TST =>
                for i in RESULT_OTHERS' range loop
                    if i <= MSB then
                        TMP:= TMP or RESULT_OTHERS(i); -- Detect '1'.
                    end if;
                end loop;
                Z := not TMP; -- Invert for Z fLAG .
            when MULS | MULU =>
                if OP_SIZE = LONG and BIW_1(10) = '1' and RESULT_MUL = x"0000000000000000" then -- 64 bit result.
                    Z := '1';
                elsif RESULT_MUL(31 downto 0) = x"00000000" then -- 32 bit result.
                    Z := '1';
                else
                    Z := '0';
                end if;
            when TAS =>
                for i in OP2_SIGNEXT' range loop
                    if i <= MSB then
                        TMP := TMP or OP2_SIGNEXT(i); -- Detect '1'.
                    end if;
                end loop;
                Z := not TMP; -- Invert for Z fLAG .
            when others =>
                Z := '0';
        end case;

        case OP is
            when ABCD | NBCD | SBCD =>
                if RESULT_BCDOP = x"00" then -- N and V are undefined, don't care.
                    XNZVC <= CB_BCD & '-' & STATUS_REG(2) & '-' & CB_BCD;
                else
                    XNZVC <= CB_BCD & '-' & '0' & '-' & CB_BCD;
                end if;
            when ADD | ADDI | ADDQ | ADDX =>
                if (SM = '1' and DM = '1') or (RM = '0' and SM = '1') or (RM = '0' and DM = '1') then
                    XNZVC(4) <= '1';
                    XNZVC(0) <= '1';
                else
                    XNZVC(4) <= '0';
                    XNZVC(0) <= '0';
                end if;
                --
                if Z = '1' then
                    if OP = ADDX then
                        XNZVC(3 downto 2) <= '0' & STATUS_REG(2);
                    else
                        XNZVC(3 downto 2) <= "01";
                    end if;
                else
                    XNZVC(3 downto 2) <= RM & '0';
                end if;
                --
                case RM_SM_DM is
                    when "011" => XNZVC(1) <= '1';
                    when "100" => XNZVC(1) <= '1';
                    when others => XNZVC(1) <= '0';
                end case;
            when AND_B | ANDI | EOR | EORI | OR_B | ORI | NOT_B =>
                XNZVC <= STATUS_REG(4) & RESULT_LOGOP(MSB) & Z & "00";
            when ANDI_TO_CCR | EORI_TO_CCR | ORI_TO_CCR =>
                XNZVC <= RESULT_LOGOP(4 downto 0);
            when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                XNZVC <= XFLAG_SHFT & RESULT_SHIFTOP(MSB) & Z & VFLAG_SHFT & CFLAG_SHFT;
            when BCHG | BCLR | BSET | BTST =>
                XNZVC <= STATUS_REG(4 downto 3) & Z & STATUS_REG(1 downto 0);
            when CLR =>
                XNZVC <= STATUS_REG(4) & "0100";
            when SUB | SUBI | SUBQ | SUBX =>
                if (SM = '1' and DM = '0') or (RM = '1' and SM = '1') or (RM = '1' and DM = '0') then
                    XNZVC(4) <= '1';
                    XNZVC(0) <= '1';
                else
                    XNZVC(4) <= '0';
                    XNZVC(0) <= '0';
                end if;                     
                --
                if Z = '1' then
                    if OP = SUBX then
                        XNZVC(3 downto 2) <= '0' & STATUS_REG(2);
                    else
                        XNZVC(3 downto 2) <= "01";
                    end if;
                else
                    XNZVC(3 downto 2) <= RM & '0';
                end if;
                --
                case RM_SM_DM is
                    when "001" => XNZVC(1) <= '1';
                    when "110" => XNZVC(1) <= '1';
                    when others => XNZVC(1) <= '0';
                end case;
            when CMP | CMPA | CMPI | CMPM =>
                XNZVC(4) <= STATUS_REG(4);
                --
                if Z = '1' then
                    XNZVC(3 downto 2) <= "01";
                else
                    XNZVC(3 downto 2) <= RM & '0';
                end if;
                --
                case RM_SM_DM is
                    when "001" => XNZVC(1) <= '1';
                    when "110" => XNZVC(1) <= '1';
                    when others => XNZVC(1) <= '0';
                end case;
                --
                if (SM = '1' and DM = '0') or (RM = '1' and SM = '1') or (RM = '1' and DM = '0') then
                    XNZVC(0) <= '1';
                else
                    XNZVC(0) <= '0';
                end if;                     
            when CHK =>
                if OP2_SIGNEXT(MSB) = '1' then
                    XNZVC <= STATUS_REG(4) & '1' & "000";
                elsif CHK_CMP_COND = true then
                    XNZVC <= STATUS_REG(4) & '0' & "000";
                else
                    XNZVC <= STATUS_REG(4 downto 3) & "000";
                end if;
            when DIVS | DIVU =>
                XNZVC <= STATUS_REG(4) & NFLAG_DIV & Z & VFLAG_DIV & '0';
            when EXT | MOVE | TST =>
                XNZVC <= STATUS_REG(4) & RESULT_OTHERS(MSB) & Z & "00";
            when MOVEQ =>
                if OP1_SIGNEXT(7 downto 0) = x"00" then
                    XNZVC <= STATUS_REG(4) & "0100";
                else
                    XNZVC <= STATUS_REG(4) & OP1_SIGNEXT(7) & "000";
                end if;
            when MULS | MULU =>
                XNZVC <= STATUS_REG(4) & NFLAG_MUL & Z & VFLAG_MUL & '0';
            when NEG | NEGX =>
                XNZVC(4) <= DM or RM;
                --
                if Z = '1' then
                    if OP = NEGX then
                        XNZVC(3 downto 2) <= '0' & STATUS_REG(2);
                    else
                        XNZVC(3 downto 2) <= "01";
                    end if;
                else
                    XNZVC(3 downto 2) <= RM & '0';
                end if;
                --
                XNZVC(1) <= DM and RM;
                XNZVC(0) <= DM or RM;
            when RTR =>
                XNZVC <= OP2(4 downto 0);
            when SWAP =>
                XNZVC <= STATUS_REG(4) & RESULT_OTHERS(MSB) & Z & "00";
            when others => -- TAS, Byte only.
                XNZVC <= STATUS_REG(4) & OP2_SIGNEXT(MSB) & Z & "00";
        end case;
    end process COND_CODES;

    ALU_COND <= ALU_COND_I; -- This signal may not be registerd to meet a correct timing.
    -- Status register conditions: (STATUS_REG(4) = X, STATUS_REG(3) = N, STATUS_REG(2) = Z, STATUS_REG(1) = V, STATUS_REG(0) = C.)
    ALU_COND_I <= true when OP = TRAPV and STATUS_REG(1) = '1' else
                  false when OP = TRAPV else
                  true when BIW_0(11 downto 8) = x"0" else -- True.
                  true when BIW_0(11 downto 8) = x"2" and (STATUS_REG(2) nor STATUS_REG(0)) = '1' else -- High.
                  true when BIW_0(11 downto 8) = x"3" and (STATUS_REG(2) or STATUS_REG(0)) = '1' else -- Low or same.
                  true when BIW_0(11 downto 8) = x"4" and STATUS_REG(0) = '0' else -- Carry clear.
                  true when BIW_0(11 downto 8) = x"5" and STATUS_REG(0) = '1' else -- Carry set.
                  true when BIW_0(11 downto 8) = x"6" and STATUS_REG(2) = '0' else -- Not Equal.
                  true when BIW_0(11 downto 8) = x"7" and STATUS_REG(2) = '1' else -- Equal.
                  true when BIW_0(11 downto 8) = x"8" and STATUS_REG(1) = '0' else -- Overflow clear.
                  true when BIW_0(11 downto 8) = x"9" and STATUS_REG(1) = '1' else -- Overflow set.
                  true when BIW_0(11 downto 8) = x"A" and STATUS_REG(3) = '0' else -- Plus.
                  true when BIW_0(11 downto 8) = x"B" and STATUS_REG(3) = '1' else -- Minus.
                  true when BIW_0(11 downto 8) = x"C" and (STATUS_REG(3) xnor STATUS_REG(1)) = '1' else -- Greater or Equal.
                  true when BIW_0(11 downto 8) = x"D" and (STATUS_REG(3) xor STATUS_REG(1)) = '1' else -- Less than.
                  true when BIW_0(11 downto 8) = x"E" and STATUS_REG(3 downto 1) = "101" else -- Greater than.
                  true when BIW_0(11 downto 8) = x"E" and STATUS_REG(3 downto 1) = "000" else -- Greater than.
                  true when BIW_0(11 downto 8) = x"F" and STATUS_REG(2) = '1' else -- Less or equal.
                  true when BIW_0(11 downto 8) = x"F" and (STATUS_REG(3) xor STATUS_REG(1)) = '1' else false; -- Less or equal.

    P_STATUS_REG: process
    -- This process is the status register with it's related logic.
    -- The status register is written 16 bit wide for MOVE_TO_CCR (the ALU result is 16 bit wide).
    -- The status register is written entirely for ANDI_TO_SR, EORI_TO_SR, ORI_TO_SR.
    -- The status register lower byte is written for ANDI_TO_CCR, EORI_TO_CCR, ORI_TO_CCR.
    variable SREG_MEM : std_logic_vector(15 downto 0) := x"0000";
    begin
        wait until CLK = '1' and CLK' event;
        --
        if CC_UPDT = '1' then
            SREG_MEM(4 downto 0) := XNZVC;
        end if;
        --
        if SR_INIT = '1' then
            SREG_MEM(15 downto 13) := "001"; -- Trace cleared, S = '1'.
            SREG_MEM(10 downto 8) := IRQ_PEND; -- Update IRQ level.
        end if;
        --
        if SR_WR = '1' and OP_IN = RTE then -- Written by the exception handler, no ALU required.
            SREG_MEM := OP1_IN(15 downto 0);
        elsif SR_WR = '1' and (OP_WB = MOVE_TO_CCR or OP_WB = MOVE_TO_SR or OP_WB = STOP) then
            SREG_MEM := RESULT_OTHERS(15 downto 0);
        elsif SR_WR = '1' and (OP_WB = ANDI_TO_CCR or OP_WB = EORI_TO_CCR or OP_WB = ORI_TO_CCR) then
            SREG_MEM(7 downto 5) := RESULT_LOGOP(7 downto 5); -- Bits 4 downto 0 are written via CC_UPDT.
        elsif SR_WR = '1' then -- ANDI_TO_SR, EORI_TO_SR, ORI_TO_SR.
            SREG_MEM := RESULT_LOGOP(15 downto 0);
        end if;
        --
        STATUS_REG <= SREG_MEM; -- Fully populated status register.
        -- STATUS_REG <= SREG_MEM(15 downto 12) & '0' & SREG_MEM(10 downto 8) & "000" & SREG_MEM(4 downto 0); -- Partially populated.
    end process P_STATUS_REG;
    --
    STATUS_REG_OUT <= STATUS_REG;
end BEHAVIOUR;
