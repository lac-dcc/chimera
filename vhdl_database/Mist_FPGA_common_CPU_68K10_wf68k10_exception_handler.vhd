------------------------------------------------------------------------
----                                                                ----
---- WF68K10 IP Core: this is the exception handler module.         ----
----                                                                ----
---- Description:                                                   ----
---- This is the exception handler which is responsible for the     ----
---- interrupt management of the external interrupt and internal    ----
---- exception processing. It manages auto-vectored interrupt       ----
---- cycles, priority resolving and correct vector numbers.         ----
---- For further information concerning the functionality of this   ----
---- module refer to the MC68010 User's Manual and to the MC68K     ----
---- family Programmer's Reference Manual.                          ----
----                                                                ----
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
-- Revision 2K16A 20141201 WF
--   Fixed a bug in PC_LOAD.
-- Revision 2K18A (unreleased) WF
--   Removed REST_BIW_0.
--   Removed FC_OUT.
--   Removed ADR_CPY.
--   Removed PC_OFFSET.
--   Fixed the vector calculation of INT vectors.
--   Fixed faulty modeling in IRQ_FILTER.
--   Implemented the AVEC_FILTER to better meet bus timings.
--   STACK_POS_VAR is initialized earlier to be valid for early asserted ISP_DEC.
--   Update the IRQ mask only for RESET and interrupts.
--   External interrupts are postponed if any system controllers are in initialize operation status.
--   RTE now loads the address offset correctly when entering the handler.
--   Rearranged address error handling.
-- Revision 2K19B 20191224 WF
--   Introduced signal synchronization in the P_D process to avoid malfunction by hazards.
--   The processor VERSION is now 32 bit wide.
-- 

library work;
use work.WF68K10_PKG.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity WF68K10_EXCEPTION_HANDLER is
    generic(VERSION         : std_logic_vector(31 downto 0) := x"20191224");
    port(
        CLK                 : in std_logic;
        RESET               : in bit;
        K6800n              : in std_logic;

        BUSY_MAIN           : in bit;
        BUSY_OPD            : in bit;

        EXH_REQ             : out bit;
        BUSY_EXH            : out bit;

        ADR_IN              : in std_logic_vector(31 downto 0);
        ADR_OFFSET          : out std_logic_vector(31 downto 0);
        CPU_SPACE           : out bit;

        DATA_0              : in std_logic;
        DATA_RD             : out bit;
        DATA_WR             : out bit;
        DATA_IN             : in std_logic_vector(31 downto 0);

        OP_SIZE             : out OP_SIZETYPE; -- Operand size.
        DATA_RDY            : in bit;
        DATA_VALID          : in std_logic;

        OPCODE_RDY          : in bit; -- OPCODE is available.

        STATUS_REG_IN       : in std_logic_vector(15 downto 0);
        SR_CPY              : out std_logic_vector(15 downto 0);
        SR_INIT             : out bit;
        SR_WR               : out bit;

        ISP_DEC             : out bit;
        ISP_LOAD            : out bit;
        PC_INC              : out bit;
        PC_LOAD             : out bit;
        PC_RESTORE          : out bit;

        STACK_FORMAT        : out std_logic_vector(3 downto 0);
        STACK_POS           : out integer range 0 to 31;

        SP_ADD_DISPL        : out bit;
        DISPLACEMENT        : out std_logic_vector(7 downto 0);

        IPIPE_FILL          : out bit;
        IPIPE_FLUSH         : out bit;
        RESTORE_ISP_PC      : out bit;

        HALT_OUTn           : out std_logic;

        -- Interrupt controls:
        INT_TRIG            : in bit;
        IRQ_IN              : in std_logic_vector(2 downto 0);
        IRQ_PEND            : out std_logic_vector(2 downto 0);
        AVECn               : in std_logic;
        IPENDn              : out bit;
        IVECT_OFFS          : out std_logic_vector(9 downto 0); -- Interrupt vector offset.

        -- Trap signals:
        TRAP_AERR           : in bit;
        TRAP_BERR           : in bit;
        TRAP_CHK            : in bit;
        TRAP_DIVZERO        : in bit;
        TRAP_ILLEGAL        : in bit;
        TRAP_CODE_OPC       : in TRAPTYPE_OPC; -- T_1010, T_1111, T_ILLEGAL, T_TRAP, T_PRIV.
        TRAP_VECTOR         : in std_logic_vector(3 downto 0);
        TRAP_V              : in bit;
        EX_TRACE_IN         : in bit;
        VBR_WR              : in bit;
        VBR                 : out std_logic_vector(31 downto 0)     
    );
end entity WF68K10_EXCEPTION_HANDLER;
    
architecture BEHAVIOR of WF68K10_EXCEPTION_HANDLER is
type EX_STATES is (IDLE, BUILD_STACK, CALC_VECT_No, EXAMINE_VERSION, GET_VECTOR, HALTED, INIT, READ_BOTTOM, 
                   REFILL_PIPE, RESTORE_ISP, RESTORE_PC, RESTORE_STATUS, UPDATE_PC, VALIDATE_FRAME);

type EXCEPTIONS is (EX_NONE, EX_1010, EX_1111, EX_AERR, EX_BERR, EX_CHK, EX_DIVZERO, EX_FORMAT, EX_ILLEGAL,
                    EX_INT, EX_PRIV, EX_RESET, EX_RTE, EX_TRACE, EX_TRAP, EX_TRAPV);

signal ACCESS_ERR           : bit;
signal AVEC                 : bit;
signal DATA_RD_I            : bit;
signal DATA_WR_I            : bit;
signal DOUBLE_BUSFLT        : bit;
signal EXCEPTION            : EXCEPTIONS; -- Currently executed exception.
signal EX_STATE             : EX_STATES := IDLE;
signal NEXT_EX_STATE        : EX_STATES;
signal EX_P_1010            : bit; -- ..._P are the pending exceptions.
signal EX_P_1111            : bit;
signal EX_P_AERR            : bit;
signal EX_P_BERR            : bit;
signal EX_P_CHK             : bit;
signal EX_P_DIVZERO         : bit;
signal EX_P_FORMAT          : bit;
signal EX_P_ILLEGAL         : bit;
signal EX_P_INT             : bit;
signal EX_P_RESET           : bit;
signal EX_P_RTE             : bit;
signal EX_P_PRIV            : bit;
signal EX_P_TRACE           : bit;
signal EX_P_TRAP            : bit;
signal EX_P_TRAPV           : bit;
signal INT_VECT             : std_logic_vector(31 downto 0); -- Interrupt vector.
signal IRQ                  : std_logic_vector(2 downto 0);
signal IRQ_PEND_I           : std_logic_vector(2 downto 0);
signal PIPE_CNT             : std_logic_vector(1 downto 0);
signal PIPE_FULL            : boolean;
signal STACK_CNT            : integer range 0 to 46;
signal STACK_FORMAT_I       : std_logic_vector(3 downto 0);
signal SYS_INIT             : bit;
begin

    BUSY_EXH <= '1' when EX_STATE /= IDLE else '0';

    IRQ_FILTER : process
    -- This logic is intended to avoid spurious IRQs due
    -- to setup / hold violations (IRQ_IN may operate in
    -- a different clock domain).
    variable IRQ_TMP_1 : std_logic_vector(2 downto 0) := "000";
    variable IRQ_TMP_2 : std_logic_vector(2 downto 0) := "000";
    begin
        wait until CLK = '0' and CLK' event;
        if IRQ_TMP_1 = IRQ_TMP_2 then
            IRQ <= IRQ_TMP_2;
        end if;
        IRQ_TMP_2 := IRQ_TMP_1;
        IRQ_TMP_1 := IRQ_IN;
    end process IRQ_FILTER;

    AVEC_FILTER : process
    -- We need a flip flop for the incoming AVECn to meet
    -- the timing requirements of the bus interface. AVECn
    -- is asserted (low active) before DATA_RDY of the
    -- bus interface. AVEC stays asserted until DATA_RDY.
    begin
        wait until CLK = '1' and CLK' event;
        if AVECn = '0' then
            AVEC <= '1';
        elsif DATA_RDY = '1' or RESET = '1' then
            AVEC <= '0';
        end if;
    end process AVEC_FILTER;

    PENDING: process
    -- The exceptions which occurs are stored in this pending register until the
    -- interrupt handler handled the respective exception.
    -- The TRAP_PRIV, TRAP_1010, TRAP_1111, TRAP_ILLEGAL, TRAP_OP and TRAP_V may be a strobe
    -- of 1 clock period. All others must be strobes of 1 clock period..
    variable INT7_TRIG  : boolean;
    variable INT_VAR    : std_logic_vector(2 downto 0);
    variable SR_VAR     : std_logic_vector(2 downto 0);
    begin
        wait until CLK = '1' and CLK' event;
        if RESET = '1' then
            EX_P_RESET <= '1';
        elsif EX_STATE = RESTORE_PC and DATA_RDY = '1' and EXCEPTION = EX_RESET then
            EX_P_RESET <= '0';
        end if;
        --
        if TRAP_BERR = '1' then
            EX_P_BERR <= '1';
        elsif EX_STATE /= IDLE and DATA_RDY = '1' and DATA_VALID = '0' then
            EX_P_BERR <= '1';
        elsif EX_STATE = INIT and EXCEPTION = EX_BERR then
            EX_P_BERR <= '0'; -- Reset in the beginning to enable retriggering.
        elsif SYS_INIT = '1' then
            EX_P_BERR <= '0';
        end if;
        --
        if TRAP_AERR = '1' then
            EX_P_AERR <= '1';
        elsif EX_STATE = BUILD_STACK and EXCEPTION = EX_AERR then
            EX_P_AERR <= '0';
        elsif SYS_INIT = '1' then
            EX_P_AERR <= '0';
        end if;
        --
        if EX_TRACE_IN = '1' then
            EX_P_TRACE <= '1';
        elsif EX_STATE = BUILD_STACK and EXCEPTION = EX_TRACE then
            EX_P_TRACE <= '0';
        elsif SYS_INIT = '1' then
            EX_P_TRACE <= '0';
        end if;
        --
        if IRQ = "111" and SR_VAR = "111" and STATUS_REG_IN(10 downto 8) /= "111" then
            INT7_TRIG := true; -- Trigger by lowering the mask from 7 to any value.
        elsif IRQ = "111" and INT_VAR < "111" then
            INT7_TRIG := true; -- Trigger when level 7 is entered.
        else
            INT7_TRIG := false;
        end if;
        --
        SR_VAR := STATUS_REG_IN(10 downto 8); -- Update after use!
        INT_VAR := IRQ; -- Update after use!
        --
        if SYS_INIT = '1' then -- Reset when disabling the interrupts.
            EX_P_INT <= '0';
            IRQ_PEND_I <= "111"; -- This is required for system startup.
        elsif EX_STATE = GET_VECTOR and DATA_RDY = '1' then
            EX_P_INT <= '0';
        elsif INT7_TRIG = true then -- Level 7 is nonmaskable ...
            EX_P_INT <= '1';
            IRQ_PEND_I <= IRQ;
        elsif INT_TRIG = '1' and STATUS_REG_IN(10 downto 8) < IRQ then
            EX_P_INT <= '1';
            IRQ_PEND_I <= IRQ;
        end if;
        --
        -- The following nine traps never appear at the same time:
        if TRAP_CHK = '1' then
            EX_P_CHK <= '1';
        elsif TRAP_DIVZERO = '1' then
            EX_P_DIVZERO <= '1';
        elsif TRAP_CODE_OPC = T_TRAP then
            EX_P_TRAP <= '1';
        elsif TRAP_V = '1' then
            EX_P_TRAPV <= '1';
        elsif TRAP_CODE_OPC = T_PRIV then
            EX_P_PRIV <= '1';
        elsif TRAP_CODE_OPC = T_1010 then
            EX_P_1010 <= '1';
        elsif TRAP_CODE_OPC = T_1111 then
            EX_P_1111 <= '1';
        elsif TRAP_CODE_OPC = T_ILLEGAL then
            EX_P_ILLEGAL <= '1';
        elsif TRAP_ILLEGAL = '1' then -- Used for BKPT.
            EX_P_ILLEGAL <= '1';
        elsif EX_STATE = VALIDATE_FRAME and DATA_RDY = '1' and DATA_VALID = '1' and NEXT_EX_STATE = IDLE then
            EX_P_FORMAT <= '1';
        elsif EX_STATE = EXAMINE_VERSION and DATA_RDY = '1' and DATA_VALID = '1' and NEXT_EX_STATE = IDLE then
            EX_P_FORMAT <= '1';
        elsif TRAP_CODE_OPC = T_RTE then
            EX_P_RTE <= '1';
        elsif EX_STATE = REFILL_PIPE and NEXT_EX_STATE /= REFILL_PIPE then -- Clear after IPIPE_FLUSH.
            case EXCEPTION is
                when EX_1010 | EX_1111 | EX_CHK | EX_DIVZERO | EX_ILLEGAL | EX_TRAP | EX_TRAPV | EX_FORMAT | EX_PRIV | EX_RTE =>
                    EX_P_CHK <= '0';
                    EX_P_DIVZERO <= '0';
                    EX_P_PRIV <= '0';
                    EX_P_1010 <= '0';
                    EX_P_1111 <= '0';
                    EX_P_ILLEGAL <= '0';
                    EX_P_RTE <= '0';
                    EX_P_TRAP <= '0';
                    EX_P_TRAPV <= '0';
                    EX_P_FORMAT <= '0';
                when others =>
                    null;
            end case;
        -- Clear all possible traps during reset exception because the
        -- signal EXCEPTION is not valid at this time:
        elsif SYS_INIT = '1' then
            EX_P_CHK <= '0';
            EX_P_DIVZERO <= '0';
            EX_P_PRIV <= '0';
            EX_P_1010 <= '0';
            EX_P_1111 <= '0';
            EX_P_ILLEGAL <= '0';
            EX_P_RTE <= '0';
            EX_P_TRAP <= '0';
            EX_P_TRAPV <= '0';
            EX_P_FORMAT <= '0';
        end if;
    end process PENDING;

    ACCESS_ERR <= '1' when EX_STATE = RESTORE_PC and DATA_RDY = '1' and DATA_0 = '1' else -- Odd PC value.
                  '1' when DATA_RDY = '1' and DATA_VALID = '0' else '0'; -- Bus error.

    IRQ_PEND <= IRQ_PEND_I when EXCEPTION = EX_RESET or EXCEPTION = EX_INT else STATUS_REG_IN(10 downto 8);
    IPENDn <= '0' when EX_P_INT = '1' or EX_P_RESET = '1' or EX_P_TRACE = '1' else '1';

    -- This signal is asserted eraly to indicate the respective controller to stay in its idle state.
    -- The exception is then inserted before a new operation has been loaded and processed.
    EXH_REQ <= '0' when EX_STATE /= IDLE else
               '1' when TRAP_CODE_OPC /= NONE else
               '1' when (EX_P_RESET or EX_P_BERR or EX_P_AERR or EX_P_DIVZERO) = '1' else
               '1' when (EX_P_CHK or EX_P_TRAPV or EX_P_TRACE or EX_P_FORMAT or EX_P_INT) = '1' else '0';

    INT_VECTOR: process
    -- This process provides the vector base register handling and 
    -- the interrupt vector number INT_VECT, which is determined 
    -- during interrupt processing.
    variable VECT_No    : std_logic_vector(9 downto 2) := "00000000";
    variable VB_REG     : std_logic_vector(31 downto 0) := x"00000000";
    begin
        wait until CLK = '1' and CLK' event;
        if VBR_WR = '1' then
            VB_REG := DATA_IN;
        elsif SYS_INIT = '1' then
            VB_REG := (others => '0');
        end if;
        --
        if EX_STATE = CALC_VECT_No or EX_STATE = GET_VECTOR then
            case EXCEPTION is
                when EX_RESET       => VECT_No := x"00";
                when EX_BERR        => VECT_No := x"02";
                when EX_AERR        => VECT_No := x"03";
                when EX_ILLEGAL     => VECT_No := x"04";
                when EX_DIVZERO     => VECT_No := x"05";
                when EX_CHK         => VECT_No := x"06";
                when EX_TRAPV       => VECT_No := x"07";
                when EX_PRIV        => VECT_No := x"08";
                when EX_TRACE       => VECT_No := x"09";
                when EX_1010        => VECT_No := x"0A";
                when EX_1111        => VECT_No := x"0B";
                when EX_FORMAT      => VECT_No := x"0E";
                -- The uninitialized interrupt vector number x"0F"
                -- is provided by the peripheral interrupt source
                -- during the auto vector bus cycle.
                when EX_INT =>
                    if DATA_RDY = '1' and AVEC = '1' then
                        VECT_No := x"18" + IRQ_PEND_I; -- Autovector.
                    elsif DATA_RDY = '1' and DATA_VALID = '0' then
                        VECT_No := x"18"; -- Spurious interrupt.
                    elsif DATA_RDY = '1' then
                        -- This is the vector number provided by the device.
                        -- If the returned VECT_No is x"0F" then it is the
                        -- uninitialized interrupt vector due to non initia-
                        -- lized vector register of the peripheral device.
                        VECT_No := DATA_IN(7 downto 0); -- Non autovector.
                    end if;
                when EX_TRAP => VECT_No := x"2" & TRAP_VECTOR;
                when others => VECT_No := (others => '-'); -- Don't care.
            end case;
        end if;
        --
        INT_VECT <= VB_REG + (VECT_No & "00");
        VBR <= VB_REG;
        IVECT_OFFS <= VECT_No & "00";
    end process INT_VECTOR;

    STORE_CURRENT_EXCEPTION: process
    -- The exceptions which occurs are stored in the following flags until the
    -- interrupt handler handled the respective exception.
    -- This process also stores the current processed exception for further use. 
    -- The update takes place in the IDLE EX_STATE.
    begin
        wait until CLK = '1' and CLK' event;
        -- Priority level 0:
        if EX_STATE = IDLE and EX_P_RESET = '1' then
            EXCEPTION <= EX_RESET;
        -- Priority level 1:
        elsif EX_STATE = IDLE and EX_P_AERR = '1' then
            EXCEPTION <= EX_AERR;
        elsif EX_STATE = IDLE and EX_P_BERR = '1' then
            EXCEPTION <= EX_BERR;
        -- Priority level 2:
        -- BREAKPOINT is part of the main controller.
        elsif EX_STATE = IDLE and EX_P_CHK = '1' then
            EXCEPTION <= EX_CHK;
        elsif EX_STATE = IDLE and EX_P_DIVZERO = '1' then
            EXCEPTION <= EX_DIVZERO;
        elsif EX_STATE = IDLE and EX_P_TRAP = '1' then
            EXCEPTION <= EX_TRAP;
        elsif EX_STATE = IDLE and EX_P_TRAPV = '1' then
            EXCEPTION <= EX_TRAPV;
        elsif EX_STATE = IDLE and EX_P_FORMAT = '1' then
            EXCEPTION <= EX_FORMAT;
        -- Priority level 3:
        elsif EX_STATE = IDLE and EX_P_ILLEGAL = '1' then
            EXCEPTION <= EX_ILLEGAL;
        elsif EX_STATE = IDLE and EX_P_RTE = '1' then
            EXCEPTION <= EX_RTE;
        elsif EX_STATE = IDLE and EX_P_1010 = '1' then
            EXCEPTION <= EX_1010;
        elsif EX_STATE = IDLE and EX_P_1111 = '1' then
            EXCEPTION <= EX_1111;
        elsif EX_STATE = IDLE and EX_P_PRIV = '1' then
            EXCEPTION <= EX_PRIV;
        elsif EX_STATE = IDLE and EX_P_TRACE = '1' then
            EXCEPTION <= EX_TRACE;
        elsif EX_STATE = IDLE and EX_P_INT = '1' then
            EXCEPTION <= EX_INT;
        elsif NEXT_EX_STATE = IDLE then
            EXCEPTION <= EX_NONE;
        end if;
    end process STORE_CURRENT_EXCEPTION;

    CPU_SPACE <= '1' when NEXT_EX_STATE = GET_VECTOR else '0';

    ADR_OFFSET <= x"000000" & "00000"  & PIPE_CNT & '0' when EX_STATE = REFILL_PIPE else
                  x"00000004" when NEXT_EX_STATE = RESTORE_PC and EXCEPTION = EX_RESET else
                  x"00000002" when NEXT_EX_STATE = RESTORE_PC else
                  x"00000006" when NEXT_EX_STATE = VALIDATE_FRAME else
                  x"0000001A" when NEXT_EX_STATE = EXAMINE_VERSION else
                  x"0000001E" when NEXT_EX_STATE = READ_BOTTOM else 
                  INT_VECT when NEXT_EX_STATE = UPDATE_PC else x"00000000"; -- Default is top of the stack (STATUS).

    OP_SIZE <= LONG when K6800n = '1' and EX_STATE = INIT and EXCEPTION /= EX_AERR and EXCEPTION /= EX_BERR else -- First access of AERR or BERR is WORD.
               LONG when NEXT_EX_STATE = RESTORE_ISP or NEXT_EX_STATE = RESTORE_PC else
               LONG when NEXT_EX_STATE = UPDATE_PC else
               LONG when K6800n = '0' and NEXT_EX_STATE = BUILD_STACK and (STACK_CNT = 7 or STACK_CNT = 3) and DATA_RDY = '1' else -- Words 7 and 3 are word wide.
               LONG when K6800n = '0' and NEXT_EX_STATE = BUILD_STACK and STACK_CNT /= 7 and STACK_CNT /= 3 else
               LONG when K6800n = '1' and NEXT_EX_STATE = BUILD_STACK and STACK_CNT = 29 and DATA_RDY = '1' else -- Always long access, except word 29.
               LONG when K6800n = '1' and NEXT_EX_STATE = BUILD_STACK and STACK_CNT /= 29 else
               LONG when EX_STATE = UPDATE_PC or NEXT_EX_STATE = RESTORE_PC else
               LONG when NEXT_EX_STATE = EXAMINE_VERSION else
               BYTE when EX_STATE = GET_VECTOR and NEXT_EX_STATE = GET_VECTOR else WORD;

    DISPLACEMENT <= x"08" when STACK_FORMAT_I = x"0" and K6800n = '1' else -- 68K10.
                    x"3A" when STACK_FORMAT_I = x"8" and K6800n = '1' else -- 68K10.
                    x"06" when STACK_FORMAT_I = x"0" else x"0E"; -- 68K00.
                    
    SP_ADD_DISPL <= '1' when EX_STATE = RESTORE_STATUS and DATA_RDY = '1' and DATA_VALID = '1' else '0';

    P_D: process(CLK, DATA_RDY)
    -- These flip flops are necessary to delay
    -- the read and writes during BUILD_STACK
    -- and restoring the system because the
    -- address calculation in the address
    -- section requires one clock.
    -- Important note: to avoid asynchronous reset by data hazards the 
    -- resetting signal is synchronized on the negative clock edge.
    variable DATA_RDY_VAR : bit;
    begin
        if CLK = '0' and CLK' event then
            DATA_RDY_VAR := DATA_RDY;
        end if;
        --
        if DATA_RDY_VAR = '1' then
            DATA_RD <= '0';
        elsif CLK = '1' and CLK' event then
            DATA_RD <= DATA_RD_I;
        end if;

        if DATA_RDY_VAR = '1' then
            DATA_WR <= '0';
        elsif CLK = '1' and CLK' event then
            DATA_WR <= DATA_WR_I;
        end if;
    end process P_D;

    DATA_RD_I <= '0' when DATA_RDY = '1' else
                 '1' when NEXT_EX_STATE = GET_VECTOR else 
                 '1' when NEXT_EX_STATE = VALIDATE_FRAME else 
                 '1' when NEXT_EX_STATE = EXAMINE_VERSION else 
                 '1' when NEXT_EX_STATE = READ_BOTTOM else
                 '1' when NEXT_EX_STATE = RESTORE_ISP else
                 '1' when NEXT_EX_STATE = RESTORE_STATUS else
                 '1' when NEXT_EX_STATE = UPDATE_PC else
                 '1' when NEXT_EX_STATE = RESTORE_PC else '0';

    DATA_WR_I <= '0' when DATA_RDY = '1' else
                 '1' when EX_STATE = BUILD_STACK else '0';

    ISP_LOAD <= '1' when EX_STATE = RESTORE_ISP and DATA_RDY = '1' and DATA_VALID = '1' else '0';
    PC_RESTORE <= '1' when EX_STATE = RESTORE_PC and DATA_RDY = '1' and DATA_VALID = '1' else '0';
    PC_LOAD <= '1' when EXCEPTION /= EX_RESET and EXCEPTION /= EX_RTE and EX_STATE /= REFILL_PIPE and NEXT_EX_STATE = REFILL_PIPE else '0';
    
    IPIPE_FILL <= '1' when EX_STATE = REFILL_PIPE else '0';

    -- This signal forces the PC logic in the address register section to calculate the address
    -- of the next instruction. This address is written on the stack. For the following
    -- instructions the old PC value is stacked: BERR, AERR, ILLEGAL, PRIV, TRACE, 1010, 1111, FORMAT.
    PC_INC <= '1' when EXCEPTION = EX_CHK and EX_STATE /= BUILD_STACK and NEXT_EX_STATE = BUILD_STACK else 
              '1' when EXCEPTION = EX_DIVZERO and EX_STATE /= BUILD_STACK and NEXT_EX_STATE = BUILD_STACK else 
              '1' when EXCEPTION = EX_INT and EX_STATE /= BUILD_STACK and NEXT_EX_STATE = BUILD_STACK else 
              '1' when EXCEPTION = EX_TRAP and EX_STATE /= BUILD_STACK and NEXT_EX_STATE = BUILD_STACK else 
              '1' when EXCEPTION = EX_TRAPV and EX_STATE /= BUILD_STACK and NEXT_EX_STATE = BUILD_STACK else '0';

    ISP_DEC <= '1' when EX_STATE = INIT and EXCEPTION /= EX_RESET and EXCEPTION /= EX_RTE else -- Early due to one clock cycle address calculation.
               '1' when EX_STATE = BUILD_STACK and DATA_RDY = '1' and NEXT_EX_STATE = BUILD_STACK else '0';

    SR_INIT <= '1' when EX_STATE = INIT else '0';
    SR_WR <= '1' when EX_STATE = RESTORE_STATUS and DATA_RDY = '1' and DATA_VALID = '1' else '0';

    SYS_INIT <= '1' when EX_STATE = IDLE and EX_P_RESET = '1' else '0';

    -- The processor gets halted, if a bus error occurs in the stacking or updating states during
    -- the exception processing of a bus error, an address error or a reset.
    HALT_OUTn <= '0' when EX_STATE = HALTED else '1';

    RESTORE_ISP_PC <= '1' when EXCEPTION = EX_RESET and (NEXT_EX_STATE = RESTORE_ISP or EX_STATE = RESTORE_ISP) else
                      '1' when EXCEPTION = EX_RESET and (NEXT_EX_STATE = RESTORE_PC or EX_STATE = RESTORE_PC) else 
                      '1' when NEXT_EX_STATE = UPDATE_PC else '0';

    IPIPE_FLUSH <= '1' when EXCEPTION = EX_RESET and EX_STATE /= REFILL_PIPE else
                   '1' when EXCEPTION /= EX_NONE and EX_STATE /= REFILL_PIPE and NEXT_EX_STATE = REFILL_PIPE else '0';

    DOUBLE_BUSFLT <= '1' when (EXCEPTION = EX_AERR or EXCEPTION = EX_RESET) and EX_STATE = RESTORE_PC and DATA_RDY = '1' and DATA_0 = '1' else -- Odd PC value.
                     '1' when EX_STATE /= IDLE and EXCEPTION = EX_AERR and DATA_RDY = '1' and DATA_VALID = '0' else
                     '1' when EX_STATE /= IDLE and EXCEPTION = EX_BERR and DATA_RDY = '1' and DATA_VALID = '0' else
                     '1' when EX_STATE /= IDLE and EXCEPTION = EX_RESET and DATA_RDY = '1' and DATA_VALID = '0' else '0';

    P_TMP_CPY: process
    -- These registers contain a copy of system relevant state information
    -- which is necessary for restoring the exception. Copies are provided 
    -- for the status register, the program counter and the effective address.
    begin
        wait until CLK = '1' and CLK' event;
        if EX_STATE = IDLE and NEXT_EX_STATE /= IDLE then
            SR_CPY <= STATUS_REG_IN;
        end if;
    end process P_TMP_CPY;

    STACK_CTRL: process
    -- This process controls the stacking of the data to the stack. Depending
    -- on the stack frame format, the number of words written to the stack is 
    -- adjusted to long words. See the DATA_2_PORT multiplexer in the top level
    -- file for more information.
    variable STACK_POS_VAR  : integer range 0 to 31 := 0;
    begin
        wait until CLK = '1' and CLK' event;
        if EX_STATE /= BUILD_STACK and NEXT_EX_STATE = BUILD_STACK then 
            case EXCEPTION is
                when EX_AERR | EX_BERR =>
                    if K6800n = '0' then
                        STACK_POS_VAR := 7; -- 68K00 bus or address error stack format.
                    else
                        STACK_POS_VAR := 29; -- Format 8.
                    end if;
                    STACK_FORMAT_I <= x"8";
                when others =>
                    if K6800n = '0' then
                        STACK_POS_VAR := 3; -- 68K00 3 word stack format.
                    else
                        STACK_POS_VAR := 4; -- Format 0.
                    end if;
                    STACK_FORMAT_I <= x"0";
            end case;
        elsif EX_STATE = VALIDATE_FRAME and DATA_RDY = '1' and DATA_VALID = '1' then
            STACK_FORMAT_I <= DATA_IN(15 downto 12);
        elsif EX_STATE = BUILD_STACK and DATA_RDY = '1' then
            case STACK_POS_VAR is
                when 29 | 7 | 3 => STACK_POS_VAR := STACK_POS_VAR - 1; -- WORD access.
                when others => STACK_POS_VAR := STACK_POS_VAR - 2; -- LONG access.
            end case;
        end if;
        --
        STACK_CNT <= STACK_POS_VAR;
        STACK_POS <= STACK_POS_VAR;
    end process STACK_CTRL;

    STACK_FORMAT <= STACK_FORMAT_I;

    PIPE_STATUS: process
    -- This logic detects the status of the
    -- instruction pipe prefetch in the 
    -- REFILL_PIPE state.
    variable CNT : std_logic_vector(1 downto 0);
    begin
        wait until CLK = '1' and CLK' event;
        if EX_STATE /= REFILL_PIPE then
            PIPE_FULL <= false;
            CNT := "00";
        elsif EX_STATE = REFILL_PIPE and OPCODE_RDY = '1' and CNT < "10" then
            CNT := CNT + '1';
        elsif EX_STATE = REFILL_PIPE and OPCODE_RDY = '1' then
            PIPE_FULL <= true;
        end if;
        PIPE_CNT <= CNT;
    end process PIPE_STATUS;

    EXCEPTION_HANDLER_REG: process
    -- This is the register portion of the 
    -- exception control state machine.
    begin
        wait until CLK = '1' and CLK' event;
        if RESET = '1' then
            EX_STATE <= IDLE;
        else
            EX_STATE <= NEXT_EX_STATE;
        end if;
    end process EXCEPTION_HANDLER_REG;

    EXCEPTION_HANDLER_DEC: process(ACCESS_ERR, BUSY_MAIN, BUSY_OPD, DATA_IN, DATA_VALID, DOUBLE_BUSFLT, EX_STATE, EX_P_RESET, EX_P_AERR, EX_P_BERR, 
                                   EX_P_TRACE, EX_P_INT, EX_P_ILLEGAL, EX_P_1010, EX_P_RTE, EX_P_1111, EX_P_FORMAT, EX_P_PRIV, EX_P_TRAP, EX_P_TRAPV, 
                                   EX_P_CHK, EX_P_DIVZERO, EXCEPTION, DATA_RDY, PIPE_FULL, STACK_CNT, K6800n)
    begin
        case EX_STATE is
            when IDLE =>
                -- The priority of the exception execution is given by the
                -- following construct. Although type 3 commands do not require
                -- a prioritization, there is no drawback using these conditions.
                -- The spurious interrupt and uninitialized interrupt never appear
                -- as basic interrupts and therefore are not an interrupt source.
                -- During IDLE, when an interrupt occurs, the status register copy
                -- control is asserted and the current interrupt controll is given
                -- to the STORE_EXCEPTION process. During bus or address errors,
                -- the status register must be copied immediately to recognize
                -- the current status for RWn etc. (before the faulty bus cycle is
                -- finished).
                if (BUSY_MAIN = '1' or BUSY_OPD = '1') and EX_P_RESET = '0' then
                    NEXT_EX_STATE <= IDLE; -- Wait until the pipelined architecture is ready.
                elsif EX_P_RESET = '1' or EX_P_AERR = '1' or EX_P_BERR = '1' then
                    NEXT_EX_STATE <= INIT;
                elsif EX_P_TRAP = '1' or EX_P_TRAPV = '1' or EX_P_CHK = '1' or EX_P_DIVZERO = '1' then
                    NEXT_EX_STATE <= INIT;
                elsif EX_P_FORMAT = '1' then
                    NEXT_EX_STATE <= INIT;
                elsif EX_P_TRACE = '1' or EX_P_ILLEGAL = '1' or EX_P_1010 = '1' or EX_P_1111 = '1' or EX_P_PRIV = '1' then
                    NEXT_EX_STATE <= INIT;
                elsif EX_P_RTE = '1' then
                    NEXT_EX_STATE <= INIT;
                elsif EX_P_INT = '1' then
                    NEXT_EX_STATE <= INIT;
                else -- No exception.
                    NEXT_EX_STATE <= IDLE;
                end if;
            when INIT =>
                -- In this state, the supervisor mode is switched on (the S bit is set)
                -- and the trace mode is switched off (the T bit is cleared).
                -- Do not service, if halted. The current bus cycle is always finished
                -- in this state. The worst case is a bus error which the finishes the
                -- current bus cycle within the next clock cycle after BERR is asserted.
                case EXCEPTION is
                    when EX_RTE =>
                        -- This state is foreseen to handle the address offset
                        -- correctly in the case the ADR_ATN is already set
                        -- by the main controller. So we have to wait one
                        -- clock cycle to ensure this data hazard.
                        if K6800n = '1' then
                            NEXT_EX_STATE <= VALIDATE_FRAME; -- 68K10.
                        else
                            NEXT_EX_STATE <= RESTORE_PC; -- 68K00.
                        end if;
                    when EX_INT =>
                        NEXT_EX_STATE <= GET_VECTOR;
                    when others =>
                        NEXT_EX_STATE <= CALC_VECT_No;
                end case;
            when GET_VECTOR =>
                -- This state is intended to determine the vector number for the current process.
                if DATA_RDY = '1' then
                    NEXT_EX_STATE <= BUILD_STACK;
                else
                    NEXT_EX_STATE <= GET_VECTOR;
                end if;
            when CALC_VECT_No =>
                -- This state is introduced to control the generation of the vector number
                -- for all exceptions except the external interrupts.
                case EXCEPTION is
                    when EX_RESET => 
                        NEXT_EX_STATE <= RESTORE_ISP; -- Do not stack anything but update the SSP and PC.
                    when others => 
                        NEXT_EX_STATE <= BUILD_STACK;
                end case;
            -- The following states provide writing to the stack pointer or reading
            -- the exception vector address from memory. If there is a bus error
            -- or an address error during the read or write cycles, the processor
            -- proceeds in two different ways:
            -- If the errors occur during a reset, bus error or address error
            -- exception processing, a double bus fault has occured. In
            -- consequence, the processor halts due to catastrophic system failure.
            -- If the errors occur during other exception processings, the current
            -- processing is aborted and this exception handler state machine will
            -- immediately begin with the bus error exception handling.
            when BUILD_STACK =>
                if DOUBLE_BUSFLT = '1' then
                    NEXT_EX_STATE <= HALTED;
                elsif ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif DATA_RDY = '1' and STACK_CNT = 2 then
                    NEXT_EX_STATE <= UPDATE_PC;
                else
                    NEXT_EX_STATE <= BUILD_STACK;
                end if;
            when UPDATE_PC =>
                if DOUBLE_BUSFLT = '1' then
                    NEXT_EX_STATE <= HALTED;
                elsif ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif DATA_RDY = '1' then
                    NEXT_EX_STATE <= REFILL_PIPE;
                else
                    NEXT_EX_STATE <= UPDATE_PC;
                end if;
            when VALIDATE_FRAME =>
                if DATA_RDY = '1' and DATA_VALID = '0' then
                    NEXT_EX_STATE <= IDLE; -- Bus error.
                elsif ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif DATA_RDY = '1' then
                    case DATA_IN(15 downto 12) is
                        when x"0" =>
                            NEXT_EX_STATE <= RESTORE_PC;
                        when x"8" =>
                            NEXT_EX_STATE <= EXAMINE_VERSION;
                        when others =>
                            NEXT_EX_STATE <= IDLE; -- Format error.
                    end case;
                else
                    NEXT_EX_STATE <= VALIDATE_FRAME;
                end if;
            when EXAMINE_VERSION =>
                if ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif DATA_RDY = '1' then
                    if DATA_IN /= VERSION then
                        NEXT_EX_STATE <= IDLE; -- Format error.
                    else
                        NEXT_EX_STATE <= READ_BOTTOM;
                    end if;
                else
                    NEXT_EX_STATE <= EXAMINE_VERSION;
                end if;
            when READ_BOTTOM =>
                if ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif DATA_RDY = '1' then
                    NEXT_EX_STATE <= RESTORE_PC;
                else
                    NEXT_EX_STATE <= READ_BOTTOM;
                end if;
            when RESTORE_STATUS =>
                if DOUBLE_BUSFLT = '1' then
                    NEXT_EX_STATE <= HALTED;
                elsif ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif DATA_RDY = '1' then
                    NEXT_EX_STATE <= REFILL_PIPE;
                else
                    NEXT_EX_STATE <= RESTORE_STATUS;
                end if;
            when RESTORE_ISP =>
                if DOUBLE_BUSFLT = '1' then
                    NEXT_EX_STATE <= HALTED;
                elsif ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif DATA_RDY = '1' then
                    NEXT_EX_STATE <= RESTORE_PC;
                else
                    NEXT_EX_STATE <= RESTORE_ISP;
                end if;
            when RESTORE_PC =>
                if DOUBLE_BUSFLT = '1' then
                    NEXT_EX_STATE <= HALTED; -- Double bus fault.
                elsif ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif EXCEPTION = EX_RESET and DATA_RDY = '1' then
                    NEXT_EX_STATE <= REFILL_PIPE;
                elsif DATA_RDY = '1' then
                    NEXT_EX_STATE <= RESTORE_STATUS;
                else
                    NEXT_EX_STATE <= RESTORE_PC;
                end if;
            when REFILL_PIPE =>
                if DOUBLE_BUSFLT = '1' then
                    NEXT_EX_STATE <= HALTED;
                elsif ACCESS_ERR = '1' then
                    NEXT_EX_STATE <= IDLE;
                elsif PIPE_FULL = true then
                    NEXT_EX_STATE <= IDLE;
                else
                    NEXT_EX_STATE <= REFILL_PIPE;
                end if;
            when HALTED =>
                -- Processor halted, Double bus error!
                NEXT_EX_STATE <= HALTED;
        end case;
    end process EXCEPTION_HANDLER_DEC;
end BEHAVIOR;
