------------------------------------------------------------------------
----                                                                ----
---- WF68K30L IP Core: this is the main controller to handle all    ----
---- integer instructions.                                          ----
----                                                                ----
---- Description:                                                   ----
---- This controller handles all integer instructions and provides  ----
---- all required system control signals. The instructions are      ----
---- requested from the instruction prefetch unit in the opcode     ----
---- decoder unit. The data is mostly written to the ALU and after- ----
---- wards from the ALU to the writeback logic. This pipelined      ----
---- structure requires a correct management of data in use. Any    ----
---- address or data registers or memory addresses which are in use ----
---- are marked by a flag not to be used befor written back. Any    ----
---- time data or address reegisters or the effective address are   ----
---- in the writeback pipe, the respective use flag is evaluated.   ----
---- Instructions like MOVE read unused source and the destination  ----
---- is written, when the ALU and writeback controller 'free'.      ----
---- Instructions like ADD, SUB etc. read unused source and desti-  ----
---- nations and write back the destination, when the operands are  ----
---- not used any more and the ALU and writeback controller are not ----
---- in use by another operation.                                   ----
---- The main controller is the second pipeline stage of the CPU.   ----
---- The pipelining structure also requires some special treatment  ----
---- for the system control instructions as described as follows:   ----
------------------------------------------------------------------------
---- System Control Instructions:                                   ----
---- There are several instructions which require the instruction   ----
---- pipe to be flushed as described in the following. For further  ----
---- information refer to the 68Kxx data sheets.                    ----
----                                                                ----
---- 1. TRAP generating:                                            ----
----     The following instructions result in a pipe flush when the ----
----     exception handler takes control over the system:           ----
----     BKPT, CHK, ILLEGAL, TRAP, TRAPV                            ----
----     There are some other indirect conditions flushing the pipe ----
----     such as the STOP which is invoked by an external interrupt.----
----                                                                ----
---- 2. Privilege violations:                                       ----
----     Some instructions may result in a privilege violation      ----
----     when executed in user space. The result will be a          ----
----     privilege violation trap and the ipipe is flushed when     ----
----     the exception handler takes over. The instructions are:    ----
----     ANDI_TO_SR, EORI_TO_SR, ORI_TO_SR, MOVEC, MOVES, MOVE_USP, ----
----     MOVE_FROM_SR, MOVE_TO_SR, RESET, RTE and STOP              ----
----                                                                ----
---- 3. Branches and Jumps:                                         ----
----    In case of branches and jumps and the respective return     ----
----    operations it is required to flush the instruction pipe.    ---- 
----    If PC value changes due to any branch or jump, it is neces- ----
----    sary to flush the instruction pipe to invalidate already    ----
----    loaded 'old' instructions. This affects:                    ----
----    BRA, BSR, Bcc, DBcc, JMP, JSR and the returns:              ----
----    RTD, RTR, RTS, RTE and also STOP.                           ----
----                                                                ----
------------------------------------------------------------------------
---- Data hazards:                                                  ----
----    To avoid malfunction by using old data several things have  ----
----    to be taken into account:                                   ----
----    1. Operations manipulating the system registers must wait   ----
----      in the end of the operation until the ALU has updated     ----
----      the condition codes. These operations are ANDI_TO_SR,     ----
----      EORI_TO_SR, ORI_TO_SR, MOVE_TO_SR and MOVEC.              ----
----    2. Operations using the staus register must not start until ----
----      the ALU has updated the condition codes. These operations ----
----      are MOVE_FROM_CCR, MOVE_FROM_SR and MOVEC.                ----
----    3. Operations using the stack pointer must not start until  ----
----      the stack pointer is updated by the previous operation.   ----
----      Operations using the stack pointer are RTD, RTR, RTS,     ----
----      MOVEC, MOVE_USP and UNLK.                                 ----
----    4. Operations manipulating the stack pointer without using  ----
----      the ALU must not start until the stack is written by the  ----
----      previous operation. Stack pointer manipulating operations ----
----      are BSR, JSR, LINK and PEA.                               ----
------------------------------------------------------------------------
----                                                                ----
---- Remarks:                                                       ----
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
-- Revision 2K16A 20160620 WF
--   Fixed a bug in the MOVEM operation.
-- Revision 2K18A (unreleased) WF
--   Fixed a bug in MOVE An,-(Ay). Thanks to Gary Bingham for the support.
--   Fixed wrong PEA behaviour.
--   Fixed the displacement for LINK.
--   Fixed AR_MARK_USED in LINK.
--   Fixed the operation size for MOVEQ.
--   ADDQ, SUBQ Fix: address registers are always written long.
--   ADDI, ANDI, EORI, ORI, SUBI: address is not marked used if destination is Dn.
--   ADDI, ANDI, EORI, ORI, SUBI: data register is marked used if destination is Dn.
--   EXG: rearranged logic to meet the new top level multiplexers.
--   LINK, UNLK: wait in START_OP until the ALU is ready (avoids possible data hazards).
--   LINK, UNLK: fixed the write back operation size.
--   MOVEM: Fixed predecrement mode for consecutive MOVEM -(An).
--   MOVEP: MOVEP_PNTR is now correct for consecutive MOVEP.
--   MOVEP: avoid structural hazard in SWITCH_STATE by waiting for ALU.
--   EOR: fixed a bug in the writeback mechanism.
--   BSR, JSR: EXEC_WB state machine waits now for ALU_INIT. Avoid structural / data hazard.
--   The instruction pipe is not flushed for ANDI_TO_CCR, EORI_TO_CCR, ORI_TO_CCR.
--   The instruction pipe is not flushed for MOVE_FROM_CCR, MOVE_TO_CCR, MOVE_FROM_SR, MOVE_USP, MOVEC.
--   Modifications in the FETCH state machine to avoid several data hazards for MOVEM, MOVE_FROM_CCR, MOVE_FROM_SR.
--   Modifications in the FETCH state machine to avoid several data hazards for ANDI_TO_CCR, ANDI_TO_SR, EORI_TO_CCR, EORI_TO_SR, ORI_TO_CCR, ORI_TO_SR.
--   We have to stop a pending operation in case of a pending interrupt. This is done by rejecting OW_RDY.
--   TOP, CONTROL, Exception Handler Opcode Decoder: Rearranged PC_INC and ipipe flush logic.
--   Write the undecremented Register for MOVE Ax, -(Ax).
--   LINK A7 and PEA(A7) stacks the undecremented A7.
--   Control: LINK A7 and PEA(A7) stacks the undecremented A7.
--   Bus interface: Rearranged the DATA_RDY vs. BUS_FLT logic.
--   UNMARK is now asserted in the end of the write cycle. This avoids data hazards.
--   Fixed a MOVEC writeback issue (use BIW_WB... instead of BIW_...).
--   Fixed a USP writeback issue (use BIW_WB... instead of BIW_...).
--   Introduced a switch NO_PIPELINE.
--   MOVEM-Fix: the effective address in memory to register is stored (STORE_AEFF) not to be overwritten in case the addressing register is also loaded.
--   DBcc: fixed a data hazard for DBcc_COND evaluation by waiting on the ALU result.
--   Fixed DR_WR_1 locking against AR_WR_2.
--   IPIPE is flushed, when there is a memory space change in the end of xx_TO_SR operations.
--   To handle correct addressing, ADR_OFFSET is now cleared right in the end of the respective operation.
--   Fixed a bug in EOR writing back in register direct mode.
--   ADDQ and SUBQ: fixed (An)+ mode. An increments now.
--   Fixed DIVS, DIVU in memory address modes (wrong control flow).
--   ADDQ and SUBQ: fixed condition code control UPDT_CC.
--   Fixed a data hazard bug using addressing modes with index register.
--   Implemented the 68K10 loop mechanism.
--   Fixed several pipelinig issues (hazards).
-- Revision 2K19A 20190419 WF
--   Introdeced a new state CALC_AEFF which results in no need of ADR_ATN and a twice highre fmax.
-- Revision 2K19B 20191224 WF
--   NOP explicitely synchronizes the instruction pipe now.
--   The controller must be BUSY when an opword is loaded and we have to wait in START_OP (avoids other controllers to reload the opword, see OW_REQ).
--   Control: BUSY is now asserted when an opword is loaded and we have to wait in START_OP (avoids other controllers to reload the opword, see OW_REQ).
--   Removed a data hazard condition (A7) for JSR, PEA, LINK and UNLK in the beginning of the operation.
--

use work.WF68K30L_PKG.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity WF68K30L_CONTROL is
    generic(NO_PIPELINE     : boolean := false); -- If true the controller work in scalar mode.
    port (
        CLK                 : in std_logic; -- System clock.
        RESET_CPU           : in bit; -- CPU reset.
    
        BUSY                : out bit; -- Main controller finished an execution.
        BUSY_EXH            : in bit;
        EXH_REQ             : in bit;
        INT_TRIG            : out bit;

        OW_REQ              : out bit; -- Operation words request.
        OW_VALID            : in std_logic; -- Operation words is valid.
        EW_REQ              : out bit; -- Extension word request.
        EW_ACK              : in bit; -- Extension word available.
        OPD_ACK             : in bit; -- Opcode has new data.

        ADR_MARK_USED       : out bit;
        ADR_IN_USE          : in bit;
        ADR_OFFSET          : out std_logic_vector(5 downto 0);

        DATA_RD             : out bit;
        DATA_WR             : out bit;
        DATA_RDY            : in bit;
        DATA_VALID          : in std_logic;
        RMC                 : out bit;

        FETCH_MEM_ADR       : out bit;
        LOAD_OP1            : out bit;
        LOAD_OP2            : out bit;
        LOAD_OP3            : out bit;
        STORE_ADR_FORMAT    : out bit;
        STORE_D16           : out bit;
        STORE_D32_LO        : out bit;
        STORE_D32_HI        : out bit;
        STORE_DISPL         : out bit;
        STORE_OD_HI         : out bit;
        STORE_OD_LO         : out bit;
        STORE_ABS_HI        : out bit;
        STORE_ABS_LO        : out bit;
        STORE_IDATA_B2      : out bit;
        STORE_IDATA_B1      : out bit;
        STORE_MEM_ADR       : out bit;
        STORE_AEFF          : out bit;

        -- System control signals:
        OP                  : in OP_68K;
        OP_SIZE             : out OP_SIZETYPE;
        BIW_0               : in std_logic_vector(13 downto 0);
        BIW_1               : in std_logic_vector(15 downto 0);
        BIW_2               : in std_logic_vector(15 downto 0);
        EXT_WORD            : in std_logic_vector(15 downto 0);

        ADR_MODE            : out std_logic_vector(2 downto 0);
        AMODE_SEL           : out std_logic_vector(2 downto 0);
        USE_DREG            : out bit;
        HILOn               : out bit;

        OP_WB               : out OP_68K;
        OP_SIZE_WB          : out OP_SIZETYPE;
        BIW_0_WB_73         : out std_logic_vector(7 downto 3); -- Used for EXG.

        AR_MARK_USED        : out bit;
        USE_APAIR           : out boolean;
        AR_IN_USE           : in bit;
        AR_SEL_RD_1         : out std_logic_vector(2 downto 0);
        AR_SEL_RD_2         : out std_logic_vector(2 downto 0);
        AR_SEL_WR_1         : out std_logic_vector(2 downto 0);
        AR_SEL_WR_2         : out std_logic_vector(2 downto 0);
        AR_INC              : out bit;
        AR_DEC              : out bit;
        AR_WR_1             : out bit;
        AR_WR_2             : out bit;

        DR_MARK_USED        : out bit;
        USE_DPAIR           : out boolean;
        DR_IN_USE           : in bit;
        DR_SEL_WR_1         : out std_logic_vector(2 downto 0);
        DR_SEL_WR_2         : out std_logic_vector(2 downto 0);
        DR_SEL_RD_1         : out std_logic_vector(2 downto 0);
        DR_SEL_RD_2         : out std_logic_vector(2 downto 0);
        DR_WR_1             : out bit;
        DR_WR_2             : out bit;

        UNMARK              : out bit;

        DISPLACEMENT        : out std_logic_vector(31 downto 0);
        PC_ADD_DISPL        : out bit;
        PC_LOAD             : out bit;
        PC_INC_EXH          : in bit;

        SP_ADD_DISPL        : out bit;

        DFC_WR              : out bit;
        DFC_RD              : out bit;
        SFC_WR              : out bit;
        SFC_RD              : out bit;

        VBR_WR              : out bit;
        VBR_RD              : out bit;

        ISP_RD              : out bit;
        ISP_WR              : out bit;
        MSP_RD              : out bit;
        MSP_WR              : out bit;
        USP_RD              : out bit;
        USP_WR              : out bit;

        IPIPE_FLUSH         : out bit; -- Abandon the instruction pipeline.

        ALU_INIT            : out bit;
        ALU_BSY             : in bit;
        ALU_REQ             : in bit;
        ALU_ACK             : out bit;

        BKPT_CYCLE          : out bit;
        BKPT_INSERT         : out bit;

        LOOP_BSY            : in bit;
        LOOP_SPLIT          : out boolean;
        LOOP_EXIT           : out bit;

        BF_OFFSET           : in Std_Logic_Vector(2 downto 0);
        BF_WIDTH            : in Std_Logic_Vector(5 downto 0);

        SR_WR               : out bit;
        MOVEM_ADn           : out bit;
        MOVEP_PNTR          : out integer range 0 to 3;
        CC_UPDT             : out bit;
        TRACE_MODE          : in std_logic_vector(1 downto 0);
        VBIT                : in std_logic;
        ALU_COND            : in boolean;
        DBcc_COND           : in boolean;
        BRANCH_ATN          : in bit;
        RESET_STRB          : out bit;
        BERR                : out bit;
        STATUSn             : out bit;
        EX_TRACE            : out bit;
        TRAP_cc             : out bit;
        TRAP_ILLEGAL        : out bit; -- Used for BKPT.
        TRAP_V              : out bit
    );
end entity WF68K30L_CONTROL;

architecture BEHAVIOUR of WF68K30L_CONTROL is
type BF_BYTEMATRIX is array (0 to 7, 1 to 32) of integer range 1 to 5;
-- The BF_BYTES constant selects the number of bytes required for read
-- or write during the bit field operations. This table is valid for
-- positive and negative offsets when using the twos complement in
-- the offset field.
constant BF_BYTES_I : BF_BYTEMATRIX := 
    ((1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4),
     (1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5),
     (1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5),
     (1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5),
     (1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5),
     (1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5),
     (1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5),
     (1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5));
--
type FETCH_STATES is (START_OP, CALC_AEFF, FETCH_DISPL, FETCH_EXWORD_1, FETCH_D_LO, FETCH_D_HI, FETCH_OD_HI, FETCH_OD_LO, FETCH_ABS_HI, 
                      FETCH_ABS_LO, FETCH_IDATA_B2, FETCH_IDATA_B1, FETCH_MEMADR, FETCH_OPERAND, INIT_EXEC_WB, SLEEP, SWITCH_STATE);
type EXEC_WB_STATES is (IDLE, EXECUTE, ADR_PIPELINE, WRITEBACK, WRITE_DEST);
signal FETCH_STATE          : FETCH_STATES;
signal NEXT_FETCH_STATE     : FETCH_STATES;
signal EXEC_WB_STATE        : EXEC_WB_STATES;
signal NEXT_EXEC_WB_STATE   : EXEC_WB_STATES;
signal ADR_MARK_USED_I		: bit;
signal ADR_MODE_I           : std_logic_vector(2 downto 0);
signal ALU_INIT_I           : bit;
signal ALU_TRIG             : bit;
signal AR_DEC_I             : bit;
signal AR_WR_I              : bit;
signal AR_WR_II             : bit;
signal BF_BYTES             : integer range 0 to 5;
signal BF_HILOn             : bit;
signal BF_OFFSET_I          : integer range 0 to 7;
signal BF_WIDTH_I           : integer range 1 to 32;
signal BIW_0_WB             : std_logic_vector(11 downto 0);
signal BIW_1_WB             : std_logic_vector(15 downto 0);
signal DATA_RD_I            : bit;
signal DATA_WR_I            : bit;
signal EW_RDY               : bit;
signal INIT_ENTRY           : bit;
signal IPIPE_FLUSH_I        : bit;
signal LOOP_EXIT_I          : bit;
signal MEM_INDIRECT         : bit;
signal MEMADR_RDY           : bit;
signal MOVEM_ADn_I          : bit;
signal MOVEM_ADn_WB         : bit;
signal MOVEM_COND           : boolean;
signal MOVEM_FIRST_RD       : boolean;
signal MOVEM_INH_WR         : boolean;
signal MOVEM_LAST_WR        : boolean;
signal MOVEM_PNTR           : std_logic_vector(3 downto 0);
signal MOVEP_PNTR_I         : integer range 0 to 3;
signal OD_REQ_16            : std_logic;
signal OD_REQ_32            : std_logic;
signal OP_SIZE_I            : OP_SIZETYPE;
signal OP_WB_I              : OP_68K := UNIMPLEMENTED;
signal OW_RDY               : bit;
signal PC_ADD_DISPL_I       : bit;
signal PC_LOAD_I            : bit;
signal PHASE2               : boolean;
signal RD_RDY               : bit;
signal READ_CYCLE           : bit;
signal SBIT_I               : bit;
signal SR_WR_I              : bit;
signal UPDT_CC              : bit;
signal WR_RDY               : bit;
signal WRITE_CYCLE          : bit;
-- Debugging:
signal OP_TEST              : bit;
begin
    BUSY <= '1' when OPD_ACK = '1' else -- Early indication.
            '1' when OW_RDY = '1' and OP /= ILLEGAL and OP /= RTE and OP /= TRAP and OP /= UNIMPLEMENTED else -- In progress MAIN is now busy.
            '1' when LOOP_BSY = '1' else -- Finish the DBcc loop.
            '1' when ALU_BSY = '1' else -- Busy, wait.
            '1' when FETCH_STATE /= START_OP else '0'; -- Main controller is busy.

    -- The interrupt must not be activated when the controller is in its START_OP
    -- state and fetches new OPWORDS. so we define the trigger for the interrupt
    -- in the end of the FETCH phase. The SLEEP state is important for STOP.
    INT_TRIG <= '1' when FETCH_STATE = INIT_EXEC_WB or FETCH_STATE = SLEEP else '0';

    OW_REQ <= '0' when BUSY_EXH = '1' else
              '0' when EXH_REQ = '1' and LOOP_BSY = '0' else -- Non interrupt exception requests, loop has priority.
              '0' when OPD_ACK = '1' or OW_RDY = '1' else
              '1' when NO_PIPELINE = true and FETCH_STATE = START_OP and ALU_BSY = '0' else
              '1' when NO_PIPELINE = false and FETCH_STATE = START_OP else '0';

    DATA_AVAILABLE: process
    -- These flip flops store the information whether the data required in the different
    -- states is available or not. This is necessary in case of delayed cycles for
    -- example if the required address register is not ready to be read.
    begin
        wait until CLK = '1' and CLK' event;
        if RESET_CPU = '1' then
            OW_RDY <= '0';
        elsif FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP then
            OW_RDY <= '0'; -- Reset.
        elsif FETCH_STATE = START_OP and (OP = ILLEGAL or OP = RTE or OP = TRAP or OP = UNIMPLEMENTED) and BUSY_EXH = '1' then
            OW_RDY <= '0'; -- Done.
        elsif OPD_ACK = '1' then
            OW_RDY <= '1'; -- Set.
        end if;

        if FETCH_STATE = START_OP then
            EW_RDY <= '0';
        elsif FETCH_STATE = FETCH_DISPL and NEXT_FETCH_STATE /= FETCH_DISPL then
            EW_RDY <= '0';
        elsif FETCH_STATE = FETCH_EXWORD_1 and NEXT_FETCH_STATE /= FETCH_EXWORD_1 then
            EW_RDY <= '0';
        elsif FETCH_STATE = FETCH_D_LO and NEXT_FETCH_STATE /= FETCH_D_LO then
            EW_RDY <= '0';
        elsif FETCH_STATE = FETCH_IDATA_B1 and NEXT_FETCH_STATE /= FETCH_IDATA_B1 then
            EW_RDY <= '0';
        elsif (FETCH_STATE = FETCH_DISPL or FETCH_STATE = FETCH_EXWORD_1 or FETCH_STATE = FETCH_IDATA_B1 or FETCH_STATE = FETCH_D_LO) and EW_ACK = '1' then
            EW_RDY <= '1';
        end if;
        
        if FETCH_STATE = START_OP then
            MEMADR_RDY <= '0';
        elsif FETCH_STATE = FETCH_MEMADR and NEXT_FETCH_STATE /= FETCH_MEMADR then
            MEMADR_RDY <= '0';
        elsif FETCH_STATE = FETCH_MEMADR and DATA_RDY = '1' then
            MEMADR_RDY <= '1';
        end if;
    end process DATA_AVAILABLE;

    EW_REQ <= '0' when EW_ACK = '1' or EW_RDY = '1' else
              '1' when FETCH_STATE = FETCH_DISPL or FETCH_STATE = FETCH_EXWORD_1 else 
              '1' when FETCH_STATE = FETCH_D_HI or FETCH_STATE = FETCH_D_LO else 
              '1' when FETCH_STATE = FETCH_OD_HI or FETCH_STATE = FETCH_OD_LO else
              '1' when FETCH_STATE = FETCH_ABS_HI or FETCH_STATE = FETCH_ABS_LO else
              '1' when FETCH_STATE = FETCH_IDATA_B2 or FETCH_STATE = FETCH_IDATA_B1 else
              '1' when FETCH_STATE /= FETCH_DISPL and NEXT_FETCH_STATE = FETCH_DISPL else
              '1' when FETCH_STATE /= FETCH_EXWORD_1 and NEXT_FETCH_STATE = FETCH_EXWORD_1 else
              '1' when FETCH_STATE /= FETCH_D_HI and NEXT_FETCH_STATE = FETCH_D_HI else
              '1' when FETCH_STATE /= FETCH_D_LO and NEXT_FETCH_STATE = FETCH_D_LO else
              '1' when FETCH_STATE /= FETCH_OD_HI and NEXT_FETCH_STATE = FETCH_OD_HI else
              '1' when FETCH_STATE /= FETCH_OD_LO and NEXT_FETCH_STATE = FETCH_OD_LO else
              '1' when FETCH_STATE /= FETCH_ABS_HI and NEXT_FETCH_STATE = FETCH_ABS_HI else
              '1' when FETCH_STATE /= FETCH_ABS_LO and NEXT_FETCH_STATE = FETCH_ABS_LO else
              '1' when FETCH_STATE /= FETCH_IDATA_B2 and NEXT_FETCH_STATE = FETCH_IDATA_B2 else
              '1' when FETCH_STATE /= FETCH_IDATA_B1 and NEXT_FETCH_STATE = FETCH_IDATA_B1 else '0';

    CYCLECONTROL: process
    -- This process contros the read and write signals, if
    -- asserted simultaneously. In this way, a read cycle is
    -- not interrupted by a write cycle and vice versa.
    begin
        wait until CLK = '1' and CLK' event;
        if DATA_RDY = '1' then
            WRITE_CYCLE <= '0';
            READ_CYCLE <= '0';
        elsif DATA_WR_I = '1' then
            WRITE_CYCLE <= '1';
            READ_CYCLE <= '0';
        elsif DATA_RD_I = '1' then
            READ_CYCLE <= '1';
            WRITE_CYCLE <= '0';
        end if;
    end process CYCLECONTROL;

    RD_RDY <= DATA_RDY when READ_CYCLE = '1' else '0';
    WR_RDY <= DATA_RDY when WRITE_CYCLE = '1' else '0';

    INIT_ENTRY <= '1' when FETCH_STATE /= INIT_EXEC_WB and NEXT_FETCH_STATE = INIT_EXEC_WB else '0';
    
    DATA_RD <= DATA_RD_I;
    DATA_RD_I <= '0' when DATA_WR_I = '1' and READ_CYCLE = '0' and WRITE_CYCLE = '0' else -- Write is prioritized.
                 '0' when WRITE_CYCLE = '1' else -- Do not read during a write cycle.
                 '0' when ADR_IN_USE = '1' else -- Avoid data hazards.
                 '0' when DATA_RDY = '1' or MEMADR_RDY = '1' else
                 '1' when FETCH_STATE = FETCH_MEMADR else
                 '1' when FETCH_STATE = FETCH_OPERAND else '0';

    DATA_WR <= DATA_WR_I;
    DATA_WR_I <= '0' when READ_CYCLE = '1' else -- Do not write during a read cycle.
                 '0' when DATA_RDY = '1' else
                 '1' when EXEC_WB_STATE = WRITE_DEST else '0';

    RMC <= '1' when (OP = CAS or OP = CAS2 or OP = TAS) and FETCH_STATE /= START_OP else '0';

    ALU_ACK <= '1' when EXEC_WB_STATE = EXECUTE and NEXT_EXEC_WB_STATE = IDLE else
               '1' when EXEC_WB_STATE = WRITEBACK else
               '0' when (OP_WB_I = BFCHG or OP_WB_I = BFCLR) and EXEC_WB_STATE = WRITE_DEST and BF_BYTES = 5 else
               '0' when (OP_WB_I = BFINS or OP_WB_I = BFSET) and EXEC_WB_STATE = WRITE_DEST and BF_BYTES = 5 else
               '1' when EXEC_WB_STATE = WRITE_DEST and WR_RDY = '1' else '0';

    FETCH_MEM_ADR <= '1' when FETCH_STATE = FETCH_MEMADR else '0';
    STORE_MEM_ADR <= '1' when FETCH_STATE = FETCH_MEMADR and RD_RDY = '1' and DATA_VALID = '1' else '0';

    -- Store the extension word right in the end due to used data and/or address registers.
    STORE_ADR_FORMAT <= '1' when FETCH_STATE = FETCH_EXWORD_1 and NEXT_FETCH_STATE /= FETCH_EXWORD_1 else '0';

    STORE_D16 <= '1' when FETCH_STATE = FETCH_DISPL and EW_ACK = '1' else '0';
    STORE_D32_LO <= '1' when FETCH_STATE = FETCH_D_LO and EW_ACK = '1' else '0';
    STORE_D32_HI <= '1' when FETCH_STATE = FETCH_D_HI and EW_ACK = '1' else '0';

	STORE_DISPL <= '1' when OP = MOVEP and FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP and BIW_0(7 downto 6) < "10" else -- Memory to register.
                   '1' when OP = MOVEP and FETCH_STATE = SWITCH_STATE else '0'; -- Register to memory.

    STORE_OD_HI <= '1' when FETCH_STATE = FETCH_OD_HI and EW_ACK = '1' else '0';
    STORE_OD_LO <= '1' when FETCH_STATE = FETCH_OD_LO and EW_ACK = '1' else '0';

    STORE_ABS_HI <= '1' when FETCH_STATE = FETCH_ABS_HI and EW_ACK = '1' else '0';
    STORE_ABS_LO <= '1' when FETCH_STATE = FETCH_ABS_LO and EW_ACK = '1' else '0';

    STORE_IDATA_B2 <= '1' when FETCH_STATE = FETCH_IDATA_B2 and EW_ACK = '1' else '0';
    STORE_IDATA_B1 <= '1' when FETCH_STATE = FETCH_IDATA_B1 and EW_ACK = '1' else '0';

    LOAD_OP1 <= '1' when OP = BFINS and INIT_ENTRY = '1' else -- Load insertion pattern.
                '1' when (OP = CHK2 or OP = CMP2) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and PHASE2 = false else 
                '1' when OP = CMPM and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and PHASE2 = true else
                '1' when OP = MOVE and BIW_0(8 downto 6) = "100" and BIW_0(5 downto 3) = "001" and BIW_0(11 downto 9) = BIW_0(2 downto 0) and INIT_ENTRY = '1' else -- Load early to write the undecremented Register for Ax, -(Ax).
				'1' when OP = MOVES and FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP and ADR_MODE_I = "100" and BIW_1(15) = '1' and BIW_1(11) = '1' and BIW_1(14 downto 12) = BIW_0(2 downto 0) else -- Load the adressing register before decrementing.
                '1' when OP = PEA and FETCH_STATE = SWITCH_STATE and PHASE2 = true else -- Load early not to stack the decremented value.
                '0' when OP = BFINS or OP = CHK2 or OP = CMP2 or OP = CMPM or OP = PEA else
                '0' when OP = MOVE and BIW_0(8 downto 6) = "100" and BIW_0(5 downto 3) = "001" and BIW_0(11 downto 9) = BIW_0(2 downto 0) else
                '0' when OP = MOVES and ADR_MODE_I = "100" and BIW_1(15) = '1' and BIW_1(11) = '1' and BIW_1(14 downto 12) = BIW_0(2 downto 0) else -- Do not load the decremented addressing register.
                '0' when OP = PEA and ADR_MODE_I = "001" and BIW_0(2 downto 0) = "111" else
                '1' when ALU_INIT_I = '1' else '0';

    LOAD_OP2 <= '1' when (OP = ABCD or OP = SBCD) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and PHASE2 = false else
                '1' when (OP = ADDX or OP = SUBX) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and PHASE2 = false else
                '1' when (OP = ABCD or OP = SBCD) and FETCH_STATE = INIT_EXEC_WB and BIW_0(3) = '0' else -- Register direct.
                '1' when (OP = ADDX or OP = SUBX) and FETCH_STATE = INIT_EXEC_WB and BIW_0(3) = '0' else -- Register direct.
                '1' when (OP = BFCHG or OP = BFCLR) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '0' else
                '1' when (OP = BFINS or OP = BFSET) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '0' else
                '1' when (OP = BFEXTS or OP = BFEXTU) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '0' else
                '1' when (OP = BFFFO or OP = BFTST) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '0' else
                '1' when OP = CMPM and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and PHASE2 = false else
                '1' when OP = LINK and BIW_0(2 downto 0) = "111" and FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP else -- Load early not to stack the decremented address register.
                '0' when OP = ABCD or OP = SBCD or OP = ADDX or OP = SUBX or OP = CMPM else
                '0' when OP = BFCHG or OP = BFCLR or OP = BFEXTS or OP = BFEXTU or OP = BFFFO or OP = BFINS or OP = BFSET or OP = BFTST else
                '0' when OP = LINK and BIW_0(2 downto 0) = "111" else
                '1' when INIT_ENTRY = '1' else '0';

    LOAD_OP3 <= '1' when (OP = BFCHG or OP = BFCLR or OP = BFINS or OP = BFSET) and BIW_0(5 downto 3) = "000" and INIT_ENTRY = '1' else 
                '1' when (OP = BFEXTS or OP = BFEXTU or OP = BFFFO or OP = BFTST) and BIW_0(5 downto 3) = "000" and INIT_ENTRY = '1' else 
                '1' when (OP = BFCHG or OP = BFCLR) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '1' else
                '1' when (OP = BFINS or OP = BSET) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '1' else
                '1' when (OP = BFEXTS or OP = BFEXTU) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '1' else
                '1' when (OP = BFFFO or OP = BFTST) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and BF_HILOn = '1' else
                '1' when OP = CAS2 and INIT_ENTRY = '1' and PHASE2 = false else -- Memory operand 2.
                '1' when (OP = CHK2 or OP = CMP2) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' and PHASE2 = true else
                '1' when (OP = DIVS or OP = DIVU) and OP_SIZE_I = LONG and BIW_1(10) = '1' and INIT_ENTRY = '1' else '0'; -- 64 bit operand.

    SR_WR <= SR_WR_I;
    SR_WR_I <= '1' when (OP_WB_I = ANDI_TO_SR or OP_WB_I = EORI_TO_SR or OP_WB_I = ORI_TO_SR) and EXEC_WB_STATE = WRITEBACK else 
               '1' when (OP_WB_I = MOVE_TO_CCR or OP_WB_I = MOVE_TO_SR) and EXEC_WB_STATE = WRITEBACK else
               '1' when OP_WB_I = STOP and EXEC_WB_STATE = WRITEBACK else '0';

    HILOn <= '1' when OP_WB_I = CAS2 and FETCH_STATE = FETCH_OPERAND and PHASE2 = false else
             '1' when OP_WB_I = CAS2 and EXEC_WB_STATE = WRITEBACK and PHASE2 = false else
             '0' when OP = CAS2 else BF_HILOn; -- Select destinations.

    -- Addressing mode:
    ADR_MODE <= ADR_MODE_I;
    ADR_MODE_I <= "010" when OP = BSR or OP = CAS2 or OP = LINK or OP = UNLK else -- (An), (Dn).
                  "010" when OP = RTD or OP = RTR or OP = RTS else -- (An).
                  "011" when OP = CMPM else -- (An)+
                  "100" when OP = ABCD or OP = SBCD else -- -(An).
                  "100" when OP = ADDX or OP = SUBX else -- -(An).
                  "100" when OP = PACK or OP = UNPK else -- -(An).
                  "101" when OP = MOVEP else -- (d16, An).
                  -- The following two conditions change the address mode right in the end of the fetch phase. 
                  "010" when (OP = JSR or OP = PEA) and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' else -- (A7).
                  BIW_0(8 downto 6) when OP = MOVE and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' else
                  BIW_0(8 downto 6) when OP = MOVE and PHASE2 = true else
                  BIW_0(5 downto 3); 

    -- This is the selector for the address mode "111".
    AMODE_SEL <= BIW_0(11 downto 9) when OP = MOVE and (NEXT_FETCH_STATE = INIT_EXEC_WB or FETCH_STATE = INIT_EXEC_WB) else
                 BIW_0(11 downto 9) when OP = MOVE and PHASE2 = true else BIW_0(2 downto 0);
    
    -- Used for the addressing modes and as source selector.
    -- In case of the addressing modes, the selector mus be valid one clock cycle before the bus cycle
    -- starts due to the pipeline stage for ADR_REG in the address register section.
    AR_SEL_RD_1 <= BIW_0(11 downto 9) when (OP = ABCD or OP = SBCD) and FETCH_STATE = START_OP else
                   BIW_0(11 downto 9) when (OP = ABCD or OP = SBCD) and FETCH_STATE = CALC_AEFF and PHASE2 = false else
                   BIW_0(11 downto 9) when (OP = ABCD or OP = SBCD) and FETCH_STATE = FETCH_OPERAND and PHASE2 = false and RD_RDY = '0' else -- Destination first.
                   BIW_0(11 downto 9) when (OP = ABCD or OP = SBCD) and FETCH_STATE = INIT_EXEC_WB else
                   BIW_0(11 downto 9) when (OP = ADDX or OP = SUBX) and FETCH_STATE = START_OP else
                   BIW_0(11 downto 9) when (OP = ADDX or OP = SUBX) and FETCH_STATE = CALC_AEFF and PHASE2 = false else
                   BIW_0(11 downto 9) when (OP = ADDX or OP = SUBX) and FETCH_STATE = FETCH_OPERAND and PHASE2 = false and RD_RDY = '0' else -- Destination first.
                   BIW_0(11 downto 9) when (OP = ADDX or OP = SUBX) and FETCH_STATE = INIT_EXEC_WB else
                   BIW_0(11 downto 9) when OP = CMPM and FETCH_STATE = FETCH_OPERAND and PHASE2 = false else -- Fetch destination.
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = FETCH_MEMADR and PHASE2 = true else
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = START_OP and BIW_0(5 downto 3) < "010" and BIW_0(8 downto 6) /= "000" else  -- Dn, An.
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = CALC_AEFF and PHASE2 = true else
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and BIW_0(8 downto 6) = "100" and BIW_0(5 downto 3) /= "011" else -- All except (An)+,-(An).
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = FETCH_IDATA_B1 and BIW_0(8 downto 6) /= "000" else
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = FETCH_ABS_LO and BIW_0(8 downto 6) /= "000" and PHASE2 = false else
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = SWITCH_STATE and BIW_0(8 downto 6) /= "000" else
                   BIW_0(11 downto 9) when OP = MOVE and FETCH_STATE = INIT_EXEC_WB and BIW_0(8 downto 6) /= "000" else
                   BIW_1(14 downto 12) when OP = MOVEC and BIW_0(0) = '1' else -- MOVEC: general register to control register.
                   "111" when OP = BSR or OP = MOVEC else -- Stack pointers.
                   BIW_0(11 downto 9) when (OP = PACK or OP = UNPK) and FETCH_STATE = START_OP and BIW_0(3) = '0' and DR_IN_USE = '0' else -- Destination address.
                   BIW_0(11 downto 9) when (OP = PACK or OP = UNPK) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' else -- Destination address.
                   BIW_0(11 downto 9) when (OP = PACK or OP = UNPK) and FETCH_STATE = INIT_EXEC_WB else -- Destination address.
                   BIW_1(14 downto 12) when OP = CAS2 and FETCH_STATE = START_OP else -- Address operand.
                   BIW_1(14 downto 12) when OP = CAS2 and FETCH_STATE = FETCH_OPERAND and PHASE2 = false else -- Address operand.
                   BIW_2(14 downto 12) when OP = CAS2 and FETCH_STATE = CALC_AEFF else -- Address operand.
                   BIW_2(14 downto 12) when OP = CAS2 and FETCH_STATE = FETCH_OPERAND else -- Address operand.
                   BIW_1(14 downto 12) when OP_WB_I = CAS2 and (EXEC_WB_STATE = EXECUTE or EXEC_WB_STATE = ADR_PIPELINE) else -- Address operand.
                   BIW_2(14 downto 12) when OP_WB_I = CAS2 and EXEC_WB_STATE = WRITE_DEST else -- Address operand.
                   "111" when (OP = JSR or OP = LINK) and FETCH_STATE = START_OP else -- Select the SP to decrement.
                   "111" when OP = PEA and FETCH_STATE = SWITCH_STATE and PHASE2 = true else -- Select the SP to decrement.
                   "111" when (OP = JSR or OP = LINK or OP = PEA) and FETCH_STATE = INIT_EXEC_WB else -- Writeback address is the SP.
                   "111" when OP = RTD or OP = RTR or OP = RTS else -- Stack pointer.
                   "111" when OP = UNLK and (FETCH_STATE = START_OP or FETCH_STATE = CALC_AEFF or FETCH_STATE = FETCH_OPERAND) else -- Check in START_OP to avoid dataz hazards!
                   BIW_0(2 downto 0) when OP = ABCD or OP = ADD or OP = ADDA or OP = ADDI or OP = ADDQ or OP = ADDX or OP = AND_B or OP = ANDI else
                   BIW_0(2 downto 0) when OP = ASL or OP = ASR or OP = BCHG or OP = BCLR or OP = BSET or OP = BTST or OP = BFCHG or OP = BFCLR else 
                   BIW_0(2 downto 0) when OP = BFEXTS or OP = BFEXTU or OP = BFFFO or OP = BFINS or OP = BFSET or OP = BFTST else 
                   BIW_0(2 downto 0) when OP = CAS or OP = CHK or OP = CHK2 or OP = CLR or OP = CMP or OP = CMPA or OP = CMPI or OP = CMPM or OP = CMP2 else
                   BIW_0(2 downto 0) when OP = DIVS or OP = DIVU or OP = EOR or OP = EORI or OP = EXG or OP = JMP or OP = JSR or OP = LEA or OP = LINK or OP = LSL or OP = LSR else
                   BIW_0(2 downto 0) when OP = MOVE or OP = MOVEA or OP = MOVE_FROM_CCR or OP = MOVE_FROM_SR or OP = MOVE_TO_CCR or OP = MOVE_TO_SR else
                   BIW_0(2 downto 0) when OP = MOVE_USP or OP = MOVEM or OP = MOVEP or OP = MOVES or OP = MULS or OP = MULU else
                   BIW_0(2 downto 0) when OP = NBCD or OP = NEG or OP = NEGX or OP = NOT_B or OP = OR_B or OP = ORI or OP = PACK or OP = PEA else
                   BIW_0(2 downto 0) when OP = ROTL or OP = ROTR or OP = ROXL or OP = ROXR or OP = SBCD or OP = Scc or OP = SUB or OP = SUBA else
                   BIW_0(2 downto 0) when OP = SUBI or OP = SUBQ or OP = SUBX or OP = TAS or OP = TST or OP = UNLK or OP = UNPK else "000";

    -- Always the destination.
    AR_SEL_WR_1 <= BIW_0(2 downto 0) when OP = ADDQ or OP = SUBQ else
                   BIW_0(2 downto 0) when OP = EXG and BIW_0(7 downto 3) = "10001" else -- Data and Address register.
                   BIW_1(14 downto 12) when OP = MOVEC or OP = MOVES else
                   "111" when OP = UNLK and FETCH_STATE = START_OP else
                   BIW_0(2 downto 0) when OP = LINK else
                   MOVEM_PNTR(2 downto 0) when OP = MOVEM else
                   BIW_0(2 downto 0) when OP = MOVE_USP else
                   BIW_0(11 downto 9); -- ADDA, EXG, LEA, MOVE, MOVEA, SUBA.
    
    AR_WR_1 <= AR_WR_I;
    AR_WR_I <= '1' when OP = LINK and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' else
               '1' when OP = UNLK and FETCH_STATE = SWITCH_STATE and NEXT_FETCH_STATE /= SWITCH_STATE else -- Write An to SP.
               '0' when EXEC_WB_STATE /= WRITEBACK else
               '1' when OP_WB_I = ADDA or OP_WB_I = SUBA else
               '1' when (OP_WB_I = ADDQ or OP_WB_I = SUBQ) and BIW_0_WB(5 downto 3) = "001" else
               '1' when OP_WB_I = EXG and BIW_0_WB(7 downto 3) = "01001" else -- Two address registers.
               '1' when OP_WB_I = EXG and BIW_0_WB(7 downto 3) = "10001" else -- Data and Address register.
               '1' when OP_WB_I = LEA else
               '1' when OP_WB_I = MOVE_USP and BIW_0_WB(3) = '1' else
               '1' when OP_WB_I = MOVEA else
               '1' when OP_WB_I = MOVEC and BIW_1_WB(15) = '1' and BIW_0_WB(0) = '0' else -- To general register.
               '1' when OP_WB_I = MOVES and BIW_1_WB(15) = '1' else
               '1' when OP_WB_I = MOVEM and MOVEM_ADn_WB = '1' else '0';

    AR_SEL_RD_2 <= BIW_1(14 downto 12) when OP = CHK2 or OP = CMP2 else
                   MOVEM_PNTR(2 downto 0) when OP = MOVEM else -- This is the non addressing output.
                   BIW_1(14 downto 12) when OP = MOVES else
                   BIW_0(2 downto 0) when OP = ADDQ or OP = MOVE or OP = SUBQ or OP = TST else
                   BIW_0(2 downto 0) when OP = EXG and BIW_0(7 downto 3) = "10001" else -- Data and address register.
                   BIW_0(11 downto 9) when OP = ADDA or OP = CMPA or OP = EXG or OP = SUBA else "000";

    AR_SEL_WR_2 <= BIW_0(2 downto 0); -- Used for EXG, UNLK.

    AR_WR_2 <= AR_WR_II;
    AR_WR_II <= '1' when OP_WB_I = UNLK and EXEC_WB_STATE = WRITEBACK else -- Write (SP) to An.
                '1' when OP_WB_I = EXG and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(7 downto 3) = "01001" else '0'; -- Two address registers.

    AR_INC <= '1' when (OP = ADD or OP = CMP or OP = SUB) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = ADDA or OP = CMPA or OP = SUBA) and ADR_MODE_I = "011" and FETCH_STATE = FETCH_OPERAND and DATA_RDY = '1' else
              '1' when (OP = ADDI or OP = CMPI or OP = SUBI) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = ADDQ or OP = SUBQ) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = AND_B or OP = EOR or OP = OR_B) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = ANDI or OP = EORI or OP = ORI) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = ASL or OP = ASR or OP = LSL or OP = LSR) and BIW_0(7 downto 3) = "11011" and ALU_INIT_I = '1' else
              '1' when (OP = ROTL or OP = ROTR or OP = ROXL or OP = ROXR) and BIW_0(7 downto 3) = "11011" and ALU_INIT_I = '1' else
              '1' when (OP = BCHG or OP = BCLR or OP = BSET or OP = BTST) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = CAS or OP = TAS) and ADR_MODE_I = "011" and FETCH_STATE = INIT_EXEC_WB and NEXT_FETCH_STATE /= INIT_EXEC_WB else
              '1' when (OP = CHK or OP = CLR or OP = TST or OP = Scc) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = NBCD or OP = NEG or OP = NEGX or OP = NOT_B) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when OP = CMPM and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' else
              '1' when (OP = MULS or OP = MULU or OP = DIVS or OP = DIVU) and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when (OP = MOVE_FROM_CCR or OP = MOVE_FROM_SR) and ADR_MODE_I = "011" and FETCH_STATE = INIT_EXEC_WB and NEXT_FETCH_STATE /= INIT_EXEC_WB else 
              '1' when (OP = MOVE_TO_CCR or OP = MOVE_TO_SR) and ADR_MODE_I = "011" and FETCH_STATE = INIT_EXEC_WB and NEXT_FETCH_STATE /= INIT_EXEC_WB else 
              '1' when OP = MOVE and ADR_MODE_I = "011" and FETCH_STATE = FETCH_OPERAND and NEXT_FETCH_STATE /= FETCH_OPERAND else
              '1' when OP = MOVE and BIW_0(8 downto 6) = "011" and FETCH_STATE = INIT_EXEC_WB and NEXT_FETCH_STATE /= INIT_EXEC_WB else
              '1' when OP = MOVEA and ADR_MODE_I = "011" and FETCH_STATE = INIT_EXEC_WB and NEXT_FETCH_STATE /= INIT_EXEC_WB else
              '1' when OP = MOVEM and ADR_MODE_I = "011" and ALU_INIT_I = '1' else
              '1' when OP = MOVES and ADR_MODE_I = "011" and ALU_INIT_I = '1' else 
              '1' when (OP = UNLK or OP = RTD or OP = RTR or OP = RTS) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' else '0';

    with OP select
        AR_DEC_I <= '1' when ABCD | ADD | ADDA | ADDI | ADDQ | ADDX | AND_B | ANDI | ASL | ASR | BCHG | BCLR | BSET | BTST | CHK | CMP | CMPA | CMPI | 
                             DIVS | DIVU | EOR | EORI | LSL | LSR | MOVE | MOVEA | MOVE_TO_CCR | MOVE_TO_SR | MOVES | MULS | MULU | NBCD | NEG | NEGX | 
                             NOT_B | OR_B | ORI | ROTL | ROTR | ROXL | ROXR | SBCD | SUB | SUBA | SUBI | SUBQ | SUBX | TAS | TST, '0' when others;

    AR_DEC <= AR_DEC_I when ADR_MODE_I = "100" and FETCH_STATE /= CALC_AEFF and NEXT_FETCH_STATE = CALC_AEFF else
              '1' when (OP = BSR or OP = JSR or OP = LINK) and FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP else
              '1' when (OP = CLR or OP = Scc) and ADR_MODE_I = "100" and INIT_ENTRY = '1' else
              '1' when OP = MOVE and BIW_0(8 downto 6) = "100" and BIW_0(5 downto 3) /= "011" and INIT_ENTRY = '1' else -- (An)+, -(An)
              '1' when OP = MOVE and BIW_0(8 downto 6) = "100" and FETCH_STATE = SWITCH_STATE else -- Needed for source (An)+ mode.
              '1' when OP = MOVEM and ADR_MODE_I = "100" and INIT_ENTRY = '1' else -- Decrement before the first bus access. 
              '1' when OP = MOVEM and ADR_MODE_I = "100" and ALU_INIT_I = '1' and MOVEM_LAST_WR = false else -- After the last bus access the address register is not decremented.
              '1' when (OP = MOVE_FROM_CCR or OP = MOVE_FROM_SR) and ADR_MODE_I = "100" and INIT_ENTRY = '1' else
              '1' when OP = MOVES and ADR_MODE_I = "100" and BIW_1(11) = '1' and INIT_ENTRY = '1' else
              '1' when (OP = PACK or OP = UNPK) and BIW_0(3) = '1' and INIT_ENTRY = '1' else
              -- PEA: decrement late in SWITCH_STATE not to decremented address register for PEA (xx,A7,yy) address modi.
              '1' when OP = PEA and FETCH_STATE = SWITCH_STATE and PHASE2 = true else '0';

    DR_SEL_RD_1 <= EXT_WORD(14 downto 12) when FETCH_STATE = FETCH_EXWORD_1 else -- Index register
                   BIW_0(11 downto 9) when (OP = ADD or OP = SUB) and BIW_0(8) = '1' else
                   BIW_0(11 downto 9) when (OP = AND_B or OP = EOR or OP = OR_B) and BIW_0(8) = '1' else
                   BIW_0(11 downto 9) when OP = BCHG or OP = BCLR or OP = BSET or OP = BTST else
                   BIW_0(11 downto 9) when OP = ASL or OP = ASR or OP = LSL or OP = LSR else
                   BIW_0(11 downto 9) when OP = ROTL or OP = ROTR or OP = ROXL or OP = ROXR else
                   BIW_0(2 downto 0) when (OP = BFCHG or OP = BFCLR or OP = BFEXTS or OP = BFEXTU) and FETCH_STATE = START_OP and BIW_0(5 downto 3) = "000" else
                   BIW_0(2 downto 0) when (OP = BFCHG or OP = BFCLR or OP = BFEXTS or OP = BFEXTU) and FETCH_STATE = START_OP and BIW_0(5 downto 3) = "001" else
                   BIW_0(2 downto 0) when (OP = BFCHG or OP = BFCLR or OP = BFEXTS or OP = BFEXTU) and FETCH_STATE = FETCH_ABS_LO else
                   BIW_0(2 downto 0) when (OP = BFFFO or OP = BFINS or OP = BFSET or OP = BFTST) and FETCH_STATE = START_OP and BIW_0(5 downto 3) = "000" else
                   BIW_0(2 downto 0) when (OP = BFFFO or OP = BFINS or OP = BFSET or OP = BFTST) and FETCH_STATE = START_OP and BIW_0(5 downto 3) = "001" else
                   BIW_0(2 downto 0) when (OP = BFFFO or OP = BFINS or OP = BFSET or OP = BFTST) and FETCH_STATE = FETCH_ABS_LO else
                   BIW_1(8 downto 6) when (OP = BFCHG or OP = BFCLR or OP = BFEXTS or OP = BFEXTU) else -- Width value.
                   BIW_1(8 downto 6) when (OP = BFFFO or OP = BFINS or OP = BFSET or OP = BFTST) else -- Width value.
                   BIW_1(2 downto 0) when OP = CAS else -- Compare operand.
                   BIW_1(14 downto 12) when OP = CAS2 and FETCH_STATE = START_OP else -- Address operand.
                   BIW_1(14 downto 12) when OP = CAS2 and FETCH_STATE = FETCH_OPERAND and PHASE2 = false else -- Address operand.
                   BIW_2(14 downto 12) when OP = CAS2 and FETCH_STATE = CALC_AEFF else -- Address operand.
                   BIW_2(14 downto 12) when OP = CAS2 and FETCH_STATE = FETCH_OPERAND else -- Address operand.
                   BIW_1(14 downto 12) when OP_WB_I = CAS2 and BIW_1(15) = '0' and (EXEC_WB_STATE = EXECUTE or EXEC_WB_STATE = ADR_PIPELINE) else -- Address operand.
                   BIW_2(14 downto 12) when OP_WB_I = CAS2 and BIW_2(15) = '0' and EXEC_WB_STATE = WRITE_DEST else -- Address operand.
                   BIW_1(2 downto 0) when OP = CAS2 and PHASE2 = false else -- Compare operand.
                   BIW_2(2 downto 0) when OP = CAS2 else -- Compare operand.
                   BIW_1(2 downto 0) when (OP = DIVS or OP = DIVU) and FETCH_STATE /= INIT_EXEC_WB and BIW_0(8 downto 6) = "001" else -- LONG 64.
                   MOVEM_PNTR(2 downto 0) when OP = MOVEM else
                   BIW_0(11 downto 9) when OP = MOVEP else
                   BIW_1(14 downto 12) when OP = MOVEC or OP = MOVES else
                   BIW_0(2 downto 0) when OP = ADD or OP = AND_B or OP = OR_B or OP = SUB else 
                   BIW_0(2 downto 0) when OP = ABCD or OP = ADDA or OP = ADDX or OP = CHK or OP = CMP or OP = CMPA else
                   BIW_0(11 downto 9) when OP = EXG and BIW_0(7 downto 3) = "10001" else -- Data and address register.
                   BIW_0(2 downto 0) when OP = DIVS or OP = DIVU or OP = EXG else
                   BIW_0(2 downto 0) when OP = MOVE or OP = MOVEA or OP = MOVE_TO_CCR or OP = MOVE_TO_SR or OP = MULS or OP = MULU or OP= PACK else
                   BIW_0(2 downto 0) when OP = SBCD or OP = SUBA or OP = SUBX or OP = UNPK else "000";

    DR_SEL_WR_1 <= BIW_1(14 downto 12) when OP = BFEXTS or OP = BFEXTU or OP = BFFFO else 
                   BIW_1(14 downto 12) when OP = MOVEC or OP = MOVES else
                   BIW_0(11 downto 9) when OP = ABCD or OP = SBCD else
                   BIW_0(11 downto 9) when OP = ADDX or OP = SUBX else
                   BIW_0(11 downto 9) when OP = ADD or OP = SUB else
                   BIW_0(11 downto 9) when OP = AND_B or OP = OR_B else
                   BIW_0(11 downto 9) when (OP = DIVS or OP = DIVU) and OP_SIZE_I = WORD else
                   BIW_1(14 downto 12) when OP = DIVS or OP = DIVU else
                   BIW_0(11 downto 9) when (OP = MULS or OP = MULU) and OP_SIZE_I = WORD else
                   BIW_1(14 downto 12) when OP = MULS or OP = MULU else -- Low order result and operand.
                   BIW_0(11 downto 9) when OP = EXG else
                   BIW_0(11 downto 9) when OP = MOVE or OP = MOVEP or OP = MOVEQ else
                   BIW_0(11 downto 9) when OP = PACK or OP = UNPK else
                   BIW_1(2 downto 0) when OP = CAS else -- Compare operand.
                   BIW_1(2 downto 0) when OP_WB_I = CAS2 and EXEC_WB_STATE = EXECUTE else -- Compare operand 1.
                   BIW_2(2 downto 0) when OP_WB_I = CAS2 and EXEC_WB_STATE = WRITEBACK else -- Compare operand 2.
                   MOVEM_PNTR(2 downto 0) when OP = MOVEM else
                   BIW_0(2 downto 0);

    DR_WR_1 <= '1' when OP_WB_I = EXG and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(7 downto 3) = "10001" else -- Address- and data register.
               '0' when AR_WR_I = '1' else -- This is the locking AR against DR.
               '0' when AR_WR_II = '1' else -- This is the locking AR against DR.
               '0' when OP_WB_I = ANDI_TO_SR or OP_WB_I = EORI_TO_SR or OP_WB_I = ORI_TO_SR else
               '0' when OP_WB_I = MOVE_TO_CCR or OP_WB_I = MOVE_TO_SR else
               '0' when OP_WB_I = MOVE_USP else -- USP is written.
               '0' when OP_WB_I = MOVEC and BIW_0_WB(0) = '1' else -- To control register.
               '0' when OP_WB_I = STOP else -- SR is written but not DR.
               '1' when EXEC_WB_STATE = WRITEBACK else '0';

    DR_SEL_RD_2 <= BIW_0(11 downto 9) when OP = ABCD or OP = SBCD or OP = ADDX or OP = SUBX else
                   BIW_0(2 downto 0) when (OP = ADD or OP = AND_B or OP = OR_B or OP = SUB) and BIW_0(8) = '1' else 
                   BIW_0(11 downto 9) when OP = ADD or OP = CMP or OP = SUB or OP = AND_B or OP = OR_B else
                   BIW_0(11 downto 9) when OP = CHK or OP = EXG else
                   BIW_1(14 downto 12) when OP = BFINS and FETCH_STATE = START_OP and BIW_0(5 downto 3) = "000" else
                   BIW_1(14 downto 12) when OP = BFINS and FETCH_STATE = START_OP and BIW_0(5 downto 3) = "001" else
                   BIW_1(14 downto 12) when OP = BFINS and FETCH_STATE = FETCH_ABS_LO else
                   BIW_1(8 downto 6) when OP = CAS else -- Update operand.
                   BIW_1(8 downto 6) when OP = CAS2 and PHASE2 = false else -- Update operand.
                   BIW_2(8 downto 6) when OP = CAS2 else -- Update operand.
                   BIW_1(14 downto 12) when OP = CHK2 or OP = CMP2 else
                   BIW_0(11 downto 9) when (OP = DIVS or OP = DIVU) and BIW_0(7) = '1' else -- WORD size.
                   BIW_1(14 downto 12) when (OP = DIVS or OP = DIVU) else -- Quotient low portion.
                   BIW_0(11 downto 9) when (OP = MULS or OP = MULU) and BIW_0(7) = '1' else -- WORD size.
                   BIW_1(14 downto 12) when (OP = MULS or OP = MULU) else
                   BIW_0(2 downto 0) when OP = BCHG or OP = BCLR or OP = BSET or OP = BTST else
                   BIW_0(2 downto 0) when OP = ADDI or OP = ADDQ or OP = ANDI or OP = BCHG or OP = BCLR or OP = BSET or OP = BTST or OP = CMPI else
                   BIW_0(2 downto 0) when OP = DBcc or OP = EOR or OP = EORI or OP = EXT or OP = EXTB or OP = NBCD or OP = NEG or OP = NEGX else
                   BIW_0(2 downto 0) when OP = NOT_B or OP = ORI or OP = SUBI or OP = SUBQ or OP = SWAP or OP = TAS or OP = TST else
                   BIW_0(2 downto 0) when OP = ASL or OP = ASR or OP = LSL or OP = LSR else
                   BIW_0(2 downto 0) when OP = ROTL or OP = ROTR or OP = ROXL or OP = ROXR else "000";

    DR_SEL_WR_2 <= BIW_0(2 downto 0) when OP = EXG else BIW_1(2 downto 0); -- Default is for DIVS and DIVU, MULS, MULU.

    -- Normally source register. Writte in a few exceptions.
    DR_WR_2 <= '1' when OP_WB_I = EXG and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(7 downto 3) = "01000" else -- Two data registers.
               '1' when OP_WB_I = DIVS and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(8 downto 6) = "001" and BIW_1_WB(14 downto 12) /= BIW_1_WB(2 downto 0) else
               '1' when OP_WB_I = DIVU and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(8 downto 6) = "001" and BIW_1_WB(14 downto 12) /= BIW_1_WB(2 downto 0) else
               '1' when OP_WB_I = MULS and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(8 downto 6) = "000" and BIW_1_WB(10) = '1' and BIW_1_WB(14 downto 12) /= BIW_1_WB(2 downto 0) else
               '1' when OP_WB_I = MULU and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(8 downto 6) = "000" and BIW_1_WB(10) = '1' and BIW_1_WB(14 downto 12) /= BIW_1_WB(2 downto 0) else '0';

    USE_DREG <= '1' when OP = CAS2 and BIW_1(15) = '0' and PHASE2 = false else
                '1' when OP = CAS2 and BIW_2(15) = '0' else
                '1' when (OP = CHK2 or OP = CMP2) and BIW_1(15) = '0' and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and PHASE2 = true else -- Select destination register.
                '1' when (OP = CHK2 or OP = CMP2) and BIW_1(15) = '0' and ALU_INIT_I = '1' else '0'; -- Store compare information

    WB_BUFFER: process
    -- This process stores the data for the 
    -- WRITEBACK or the WRITE_DEST procedure.
    -- The MOVEM condition is foreseen to bring
    -- the ADn_WB and the PNTR_WB right in time
    -- befor the address or data registers are
    -- marked used.
    begin
        wait until CLK = '1' and CLK' event;
        if (OP_WB_I = BFCHG or OP_WB_I = BFCLR or OP_WB_I = BFINS or OP_WB_I = BFSET) and EXEC_WB_STATE = WRITE_DEST and WR_RDY = '1' and BF_BYTES = 5 then 
            -- This condition may not overwhelm the ALU_INIT_I sowe have to wait in INIT_EXEC_WB for the 
            -- bit field operations until the last bus cycle finishes.
            OP_SIZE_WB <= BYTE; -- Remaining Byte.
        elsif OP = LINK and FETCH_STATE = START_OP and NEXT_FETCH_STATE = SWITCH_STATE then
            OP_SIZE_WB <= OP_SIZE_I; -- Bring this information early because the registers are written early.
        elsif ALU_INIT_I = '1' then
            if OP = DIVS or OP = DIVU or OP = MULS or OP = MULU then
                OP_SIZE_WB <= LONG;
            elsif OP = MOVEM and BIW_0(10) = '1' then -- Memory to register.
                OP_SIZE_WB <= LONG; -- Registers are always written long.
            else
                OP_SIZE_WB <= OP_SIZE_I; -- Store right in the end before data processing starts.
            end if;

            MOVEM_ADn_WB <= MOVEM_ADn_I;
            OP_WB_I <= OP;
            BIW_0_WB <= BIW_0(11 downto 0);
            BIW_1_WB <= BIW_1;
        end if;
    end process WB_BUFFER;

    OP_WB <= OP_WB_I;
    BIW_0_WB_73 <= BIW_0_WB(7 downto 3);

    OP_SIZE <= OP_SIZE_I;
    OP_SIZE_I <= LONG when FETCH_STATE = FETCH_MEMADR and RD_RDY = '0' else -- (RD_RDY: release early to provide correct OP_SIZE.
                 LONG when (OP = ADDA or OP = CMPA or OP = SUBA) and BIW_0(8 downto 7) = "11" else
                 LONG when (OP = BCHG or OP = BCLR or OP = BTST or OP = BSET) and BIW_0(5 downto 3) = "000" else
                 LONG when (OP = BFCHG or OP = BFCLR or OP = BFINS or OP = BFSET) and BIW_0(5 downto 3) = "000" else
                 LONG when (OP = BFEXTS or OP = BFEXTU or OP = BFFFO or OP = BFTST) and BIW_0(5 downto 3) = "000" else
                 LONG when (OP = BFCHG or OP = BFCLR or OP = BFINS or OP = BFSET) and BF_BYTES > 2 else
                 LONG when (OP = BFEXTS or OP = BFEXTU or OP = BFFFO or OP = BFTST) and BF_BYTES > 2 else
                 LONG when OP = EXT and BIW_0(8 downto 6) = "011" else
                 LONG when OP = BSR or OP = EXG or OP = EXTB or OP = JSR or OP = LEA or OP = LINK or OP = PEA or OP = SWAP or OP = UNLK else
                 LONG when (OP = CAS or OP = CAS2) and BIW_0(10 downto 9) = "11" else
                 LONG when OP = CHK and BIW_0(8 downto 7) = "10" else
                 LONG when (OP = CHK2 or OP = CMP2) and BIW_0(10 downto 9) = "10" else
                 LONG when (OP = MOVE or OP = MOVEA) and BIW_0(13 downto 12) = "10" else
                 LONG when OP = MOVEC or OP = MOVEQ or OP = MOVE_USP or OP = RTD or OP = RTS else
                 LONG when OP = MOVEM and BIW_0(6) = '1' else
                 LONG when OP = MOVEP and FETCH_STATE = INIT_EXEC_WB and BIW_0(7 downto 6) < "10" else -- Writeback to registers is long (see top level multiplexer).
                 LONG when (OP = DIVS or OP = DIVU or OP = MULS or OP = MULU) and BIW_0(7) = '0' else
                 LONG when OP = RTR and PHASE2 = true else -- Read PC.
                 WORD when (OP = ADDA or OP = CMPA or OP = SUBA) and BIW_0(8 downto 7) = "01" else
                 WORD when (OP = ASL or OP = ASR) and BIW_0(7 downto 6) = "11" else -- Memory shifts.
                 WORD when OP = ANDI_TO_SR or OP = EORI_TO_SR or OP = ORI_TO_SR else
                 WORD when (OP = BFCHG or OP = BFCLR or OP = BFINS or OP = BFSET) and BF_BYTES = 2 else
                 WORD when (OP = BFEXTS or OP = BFEXTU or OP = BFFFO or OP = BFTST) and BF_BYTES = 2 else
                 WORD when OP = BKPT and FETCH_STATE = FETCH_OPERAND and DATA_RD_I = '1' else
                 WORD when (OP = CAS or OP = CAS2) and BIW_0(10 downto 9) = "10" else
                 WORD when OP = CHK and BIW_0(8 downto 7) = "11" else
                 WORD when (OP = CHK2 or OP = CMP2) and BIW_0(10 downto 9) = "01" else
                 WORD when OP = DBcc or OP = EXT else
                 WORD when (OP = LSL or OP = LSR) and BIW_0(7 downto 6) = "11" else -- Memory shifts.
                 WORD when (OP = MOVE or OP = MOVEA) and BIW_0(13 downto 12) = "11" else
                 WORD when OP = MOVE_FROM_CCR or OP = MOVE_TO_CCR else
                 WORD when OP = MOVE_FROM_SR or OP = MOVE_TO_SR else
                 WORD when OP = MOVEM or OP = RTR else
                 WORD when OP = DIVS or OP = DIVU or OP = MULS or OP = MULU else
                 WORD when OP = PACK and (NEXT_FETCH_STATE = FETCH_OPERAND or FETCH_STATE = FETCH_OPERAND) and INIT_ENTRY = '0' else -- Read data is word wide.
                 WORD when (OP = ROTL or OP = ROTR) and BIW_0(7 downto 6) = "11" else -- Memory shifts.
                 WORD when (OP = ROXL or OP = ROXR) and BIW_0(7 downto 6) = "11" else -- Memory shifts.
                 WORD when OP = UNPK and (INIT_ENTRY = '1' or FETCH_STATE = INIT_EXEC_WB) else -- Writeback data is a word.
                 BYTE when OP = ABCD or OP = NBCD or OP = SBCD else
                 BYTE when OP = ANDI_TO_CCR or OP = EORI_TO_CCR or OP = ORI_TO_CCR else
                 BYTE when OP = BCHG or OP = BCLR or OP = BTST or OP = BSET else
                 BYTE when OP = BFCHG or OP = BFCLR or OP = BFINS or OP = BFSET else
                 BYTE when OP = BFEXTS or OP = BFEXTU or OP = BFFFO or OP = BFTST else
                 BYTE when OP = CAS and BIW_0(10 downto 9) = "01" else
                 BYTE when (OP = CHK2 or OP = CMP2) and BIW_0(10 downto 9) = "00" else
                 BYTE when OP = MOVE or OP = MOVEP else
                 BYTE when OP = PACK else -- Writeback data is a byte.
                 BYTE when OP = Scc or OP = TAS else
                 BYTE when OP = UNPK else -- Read data is byte wide.
                 -- The following are default settings for all other OP_SIZE relevant operations.
                 BYTE when BIW_0(7 downto 6) = "00" else
                 WORD when BIW_0(7 downto 6) = "01" else LONG;

    BKPT_CYCLE <= '1' when OP = BKPT and FETCH_STATE = FETCH_OPERAND and DATA_RD_I = '1' else '0';
    BKPT_INSERT <= '1' when OP = BKPT and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' else '0';

    -- All traps must be modeled as strobes. Be aware that the TRAP_cc is released right in the end of the TRAPcc operation.
    -- This is necessary to meet the timing requirements (BUSY_EXH, IPIPE_FLUSH, PC_INC) to provide the next PC address. See
    -- the exception handler unit for more details.
    TRAP_ILLEGAL <= '1' when OP = BKPT and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '0' else '0';

    TRAP_cc <= '1' when OP = TRAPcc and ALU_COND = true and FETCH_STATE = SLEEP and NEXT_FETCH_STATE = START_OP else '0';
    TRAP_V <= '1' when OP = TRAPV and ALU_COND = true and FETCH_STATE = SLEEP and NEXT_FETCH_STATE = START_OP else '0';

    BERR <= '0' when FETCH_STATE = START_OP and EXEC_WB_STATE = IDLE else -- Disable when controller is not active.
            '0' when OP = BKPT else -- No bus error during breakpoint cycle.
            '1' when DATA_RDY = '1' and DATA_VALID = '0' else
            '1' when OPD_ACK = '1' and OW_VALID = '0' else
            '1' when EW_ACK = '1' and OW_VALID = '0' else '0';

    SFC_RD <= '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(11 downto 0) = x"000" else '0';
    SFC_WR <= '1' when OP_WB_I = MOVEC and BIW_0_WB(0) = '1' and BIW_1(11 downto 0) = x"000" and EXEC_WB_STATE = WRITEBACK else '0';

    DFC_RD <= '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(11 downto 0) = x"001" else '0';
    DFC_WR <= '1' when OP_WB_I = MOVEC and BIW_0(0) = '1' and BIW_1_WB(11 downto 0) = x"001" and EXEC_WB_STATE = WRITEBACK else '0';

    VBR_RD <= '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(11 downto 0) = x"801" else '0';
    VBR_WR <= '1' when OP_WB_I = MOVEC and BIW_0_WB(0) = '1' and BIW_1_WB(11 downto 0) = x"801" and EXEC_WB_STATE = WRITEBACK else '0';

    ISP_RD <= '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(11 downto 0) = x"804" else '0';
    ISP_WR <= '1' when OP_WB_I = MOVEC and BIW_0_WB(0) = '1' and BIW_1_WB(11 downto 0) = x"804" and EXEC_WB_STATE = WRITEBACK else '0';

    MSP_RD <= '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(11 downto 0) = x"803" else '0';
    MSP_WR <= '1' when OP_WB_I = MOVEC and BIW_0_WB(0) = '1' and BIW_1_WB(11 downto 0) = x"803" and EXEC_WB_STATE = WRITEBACK else '0';

    USP_RD <= '1' when OP = MOVE_USP and BIW_0(3) = '1' else
              '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(11 downto 0) = x"800" else '0';
    USP_WR <= '1' when OP_WB_I = MOVE_USP and EXEC_WB_STATE = WRITEBACK and BIW_0_WB(3) = '0' else
              '1' when OP_WB_I = MOVEC and BIW_0_WB(0) = '1' and BIW_1_WB(11 downto 0) = x"800" and EXEC_WB_STATE = WRITEBACK else '0';

    P_DISPLACEMENT: process
    variable DISPL_VAR : std_logic_vector(31 downto 0);
    begin
        wait until CLK = '1' and CLK' event;
        case OP is
            when Bcc | BRA | BSR =>
                case BIW_0(7 downto 0) is
                    when x"FF" =>
                        DISPL_VAR := BIW_1 & BIW_2;
                    when x"00" =>
                        for i in 16 to 31 loop
                            DISPL_VAR(i) := BIW_1(15);
                        end loop;
                        DISPL_VAR(15 downto 0) := BIW_1;
                    when others =>
                        for i in 8 to 31 loop
                            DISPL_VAR(i) := BIW_0(7);
                        end loop;
                        DISPL_VAR(7 downto 0) := BIW_0(7 downto 0);
                end case;
            when DBcc | MOVEP | RTD =>
                for i in 16 to 31 loop
                    DISPL_VAR(i) := BIW_1(15);
                end loop;
                DISPL_VAR(15 downto 0) := BIW_1;
            when others => -- Used for LINK.
                case BIW_0(11 downto 3) is
                    when "100000001" => -- Long.
                        DISPL_VAR := BIW_1 & BIW_2;
                    when others => -- Word.
                        for i in 16 to 31 loop
                            DISPL_VAR(i) := BIW_1(15);
                        end loop;
                        DISPL_VAR(15 downto 0) := BIW_1;
                end case;
        end case;
        --
        case OP is
            when LINK | MOVEP => DISPLACEMENT <= DISPL_VAR;
            when others => DISPLACEMENT <= DISPL_VAR + "10";
        end case;
    end process P_DISPLACEMENT;

    PC_ADD_DISPL <= PC_ADD_DISPL_I;
    PC_ADD_DISPL_I <= '1' when OP = Bcc and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP and ALU_COND = true else
                      '1' when (OP = BRA or OP = BSR) and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else 
                      '1' when OP = DBcc and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP and ALU_COND = false and DBcc_COND = false else '0';
    
    PC_LOAD <= PC_LOAD_I;
    PC_LOAD_I <= '1' when (OP = JMP or OP = JSR) and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else
                 '1' when (OP = RTD or OP = RTR or OP = RTS) and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else '0';

    -- The pipe is flushed for the system control instructions. Be aware, that the operations resulting in an exception
    -- like the CHK or TRAP operations flush the pipe via the exception handler.
    -- Context switch may occur from:
    --   changing the PC value (branches etc.)
    --   changing the RAM space (status register MSBs).
    --   changing Function codes or the active stack pointer.
    IPIPE_FLUSH <= IPIPE_FLUSH_I;
    IPIPE_FLUSH_I <= '1' when (OP = BRA or OP = BSR) and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else
                     '1' when OP = Bcc and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP and ALU_COND = true else
                     '1' when OP = DBcc and LOOP_BSY = '0' and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP and ALU_COND = false and DBcc_COND = false else
                     '1' when OP = DBcc and LOOP_EXIT_I = '1' and (ALU_COND = true or DBcc_COND = true) else -- Flush the pipe after a finished loop.
                     '1' when (OP = ANDI_TO_SR or OP = EORI_TO_SR or OP = MOVE_TO_SR or OP = ORI_TO_SR) and FETCH_STATE = SLEEP and NEXT_FETCH_STATE = START_OP else
                     '1' when (OP = JMP or OP = JSR) and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else
                     '1' when OP = MOVEC and BIW_0(0) = '1' and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else -- Writing control registers.
                     '1' when (OP = RTD or OP = RTR or OP = RTS) and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else '0';

    SP_ADD_DISPL <= '1' when OP = LINK and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' else 
                    '1' when OP = RTD and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and DATA_VALID = '1' else '0';

    ALU_TRIG <= '0' when ALU_BSY = '1' or FETCH_STATE /= INIT_EXEC_WB else
                '0' when (OP = CHK2 or OP = CMP2 or OP = CMPM) and PHASE2 = false else
                '0' when OP = MOVE and PHASE2 = true else -- no ALU required after second portion of address calculation.
                '0' when OP = MOVEM and MOVEM_COND = false else
                '0' when OP = MOVEM and BIW_0(10) = '1' and MOVEM_FIRST_RD = false else -- Do not load before the first read access.
                '0' when OP = RTR and PHASE2 = true else '1'; -- RTR: not when PC is loaded.

    -- This is the signal loading the operands into the ALU registers:
    ALU_INIT <= ALU_INIT_I;
    with OP select
        ALU_INIT_I <= ALU_TRIG when ABCD | ADD | ADDA | ADDI | ADDQ | ADDX | AND_B | ANDI | ANDI_TO_CCR | ANDI_TO_SR | ASL | ASR | Bcc | BCHG |
                                    BCLR | BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST | BSET | BSR | BTST | CAS | CAS2 | 
                                    CHK | CHK2 | CLR | CMP | CMPA | CMPI | CMPM | CMP2 | DBcc | DIVS | DIVU | EOR | EORI | EORI_TO_CCR | EORI_TO_SR |
                                    EXG | EXT | EXTB | JSR | LEA | LINK | LSL | LSR | MOVE | MOVEA | MOVE_FROM_CCR | MOVE_TO_CCR | MOVE_FROM_SR | 
                                    MOVE_TO_SR | MOVE_USP | MOVEC | MOVEM | MOVEQ | MOVEP | MOVES | MULS | MULU | NBCD | NEG | NEGX | NOT_B | OR_B | 
                                    ORI | ORI_TO_CCR | ORI_TO_SR | PACK | PEA | ROTL | ROTR | ROXL | ROXR | RTR | SBCD | Scc | SUB | SUBA | SUBI | 
                                    SUBQ | SUBX | SWAP | STOP | TAS | TRAPV | TRAPcc | TST | UNLK | UNPK, '0' when others;

    ADR_FORMAT: process
    begin
        wait until CLK = '1' and CLK' event;
        if FETCH_STATE = FETCH_EXWORD_1 and EW_ACK = '1' and EXT_WORD(8) = '1' then
            case EXT_WORD(1 downto 0) is
                when "11" =>
                    MEM_INDIRECT <= '1';
                    OD_REQ_32 <= '1';
                    OD_REQ_16 <= '0';
                when "10" =>
                    MEM_INDIRECT <= '1';
                    OD_REQ_32 <= '0';
                    OD_REQ_16 <= '1';
                when "01" =>
                    MEM_INDIRECT <= '1';
                    OD_REQ_32 <= '0';
                    OD_REQ_16 <= '0';
                when others =>
                    MEM_INDIRECT <= '0';
                    OD_REQ_32 <= '0';
                    OD_REQ_16 <= '0';
            end case;
        end if;
    end process ADR_FORMAT;

    UPDT_CC <= '0' when (OP_WB_I = ADDQ or OP_WB_I = SUBQ) and BIW_0_WB(5 downto 3) = "001" else -- No update for ADDQ and SUBQ when destination is an address register.
               '0' when OP = CAS2 and FETCH_STATE = INIT_EXEC_WB and EXEC_WB_STATE = WRITEBACK else -- First 'Z' flag was zero, do not update the second access.
               '0' when OP = CAS2 and FETCH_STATE = INIT_EXEC_WB and EXEC_WB_STATE = WRITE_DEST and PHASE2 = true else ALU_REQ; -- Suppress third update.

    with OP_WB_I select
    CC_UPDT <= UPDT_CC when ABCD | ADD | ADDI | ADDQ | ADDX | AND_B | ANDI | ANDI_TO_CCR | ASL | ASR | BCHG | BCLR |
                            BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST | BSET | BTST |
                            CAS | CAS2 | CHK | CHK2 | CLR | CMP | CMPA | CMPI | CMPM | CMP2 | DIVS | DIVU |
                            EOR | EORI | EORI_TO_CCR | EXT | EXTB | LSL | LSR | MOVE | MOVEQ | MULS | MULU | NBCD |
                            NEG | NEGX | NOT_B | OR_B | ORI | ORI_TO_CCR | ROTL | ROTR | ROXL | ROXR | RTR | SBCD |
                            SUB | SUBI | SUBQ | SUBX | SWAP | TAS | TST, '0' when others;

    ADR_MARK_USED_I <= '1' when OP = MOVE and FETCH_STATE = INIT_EXEC_WB and PHASE2 = true else -- Destination address calculation done.
                       '0' when FETCH_STATE /= INIT_EXEC_WB or ALU_BSY = '1' else -- Deactivate except in the end of INIT_EXEC_WB.
                       '1' when OP = BFCHG or OP = BFCLR or OP = BFINS or OP = BFSET or OP = BSR  or OP = JSR or OP = LINK or OP = PEA  else
                       '1' when (OP = ADDI or OP = ANDI or OP = EOR or OP = EORI or OP = ORI or OP = SUBI) and BIW_0(5 downto 3) /= "000" else
                       '1' when (OP = ABCD or OP = SBCD or OP = ADDX or OP = SUBX) and BIW_0(3) = '1' else
                       '1' when (OP = ADD or OP = AND_B or OP = OR_B or OP = SUB) and BIW_0(8) = '1' else
                       '1' when (OP = ADDQ or OP = BCHG or OP = BCLR or OP = BSET or OP = CLR or OP = MOVE_FROM_CCR or OP = MOVE_FROM_SR) and BIW_0(5 downto 3) > "001"  else
                       '1' when (OP = NBCD or OP = NEG or OP = NEGX or OP = NOT_B or OP = Scc or OP = SUBQ or OP = TAS) and BIW_0(5 downto 3) > "001"  else
                       '1' when (OP = ASL or OP = ASR or OP = LSL or OP = LSR) and BIW_0(7 downto 6) = "11" else -- Memory shifts.
                       '1' when (OP = ROTL or OP = ROTR or OP = ROXL or OP = ROXR) and BIW_0(7 downto 6) = "11" else -- Memory shifts.
                       '1' when OP = MOVE and PHASE2 = false and BIW_0(8 downto 6) /= "000" and BIW_0(8 downto 6) < "101" else -- We do not need destination address calculation access.
                       '1' when OP = MOVEM and BIW_0(10) = '0' and MOVEM_COND = true else -- Register to memory.
                       '1' when OP = MOVEP and BIW_0(7 downto 6) > "01" else -- Register to Memory.
                       '1' when OP = MOVES and BIW_1(11) = '1' else -- Register to memory.
                       '1' when (OP = PACK or OP = UNPK) and BIW_0(3) = '1' else '0';

    ADR_MARK_USED <= '1' when (OP_WB_I = BFCHG or OP_WB_I = BFCLR) and EXEC_WB_STATE = WRITE_DEST and WR_RDY = '1' and BF_BYTES = 5 else
                     '1' when (OP_WB_I = BFINS or OP_WB_I = BFSET) and EXEC_WB_STATE = WRITE_DEST and WR_RDY = '1' and BF_BYTES = 5 else
                     '1' when OP_WB_I = CAS and EXEC_WB_STATE = EXECUTE and ALU_COND = true else
                     '1' when OP_WB_I = CAS2 and EXEC_WB_STATE = ADR_PIPELINE and ALU_COND = true else
                     '1' when OP_WB_I = CAS2 and EXEC_WB_STATE = WRITE_DEST and WR_RDY = '1' and PHASE2 = false else ADR_MARK_USED_I;

    AR_MARK_USED <= '1' when OP = UNLK and FETCH_STATE /= SWITCH_STATE and NEXT_FETCH_STATE = SWITCH_STATE else -- This is for An to SP.
                    '1' when OP = LINK and FETCH_STATE = SWITCH_STATE and NEXT_FETCH_STATE /= SWITCH_STATE else -- This is for SP to An.
                    '0' when FETCH_STATE /= INIT_EXEC_WB or NEXT_FETCH_STATE = INIT_EXEC_WB else -- Deactivate except in the end of INIT_EXEC_WB.
                    '1' when OP = ADDA or OP = SUBA else
                    '1' when (OP = ADDQ or OP = SUBQ) and BIW_0(5 downto 3) = "001" else
                    '1' when OP = EXG and BIW_0(7 downto 3) /= "01000" else
                    '1' when OP = LEA else
                    '1' when OP = MOVE_USP else
                    '1' when OP = MOVEM and BIW_0(10) = '1' and MOVEM_ADn_I = '1' and MOVEM_COND = true else -- Memory to register.
                    '1' when OP = MOVEA else
                    '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(15) = '1' else -- Destination is Ax.
                    '1' when OP = MOVES and BIW_1(15) = '1' and BIW_1(11) = '0' else
                    '1' when OP = UNLK else '0';

    DR_MARK_USED <= '1' when OP_WB_I = CAS and EXEC_WB_STATE = EXECUTE and ALU_COND = false else
                    '1' when OP_WB_I = CAS2 and EXEC_WB_STATE = EXECUTE and ALU_COND = false else
                    '1' when OP_WB_I = CAS2 and EXEC_WB_STATE = WRITEBACK and PHASE2 = false else
                    '0' when FETCH_STATE /= INIT_EXEC_WB or NEXT_FETCH_STATE = INIT_EXEC_WB else -- Deactivate except in the end of INIT_EXEC_WB.
                    '1' when (OP = ABCD or OP = SBCD) and BIW_0(3) = '0' else
                    '1' when (OP = ADDX or OP = SUBX) and BIW_0(3) = '0' else
                    '1' when (OP = ADDQ or OP = SUBQ) and BIW_0(5 downto 3) = "000" else
                    '1' when (OP = ADD or OP = SUB) and BIW_0(8) = '0' else
                    '1' when (OP = ADDI or OP = ANDI or OP = EOR or OP = EORI or OP = ORI or OP = SUBI) and BIW_0(5 downto 3) = "000" else
                    '1' when (OP = AND_B or OP = OR_B) and BIW_0(8) = '0' else
                    '1' when (OP = ASL or OP = ASR) and BIW_0(7 downto 6) /= "11" else
                    '1' when (OP = LSL or OP = LSR) and BIW_0(7 downto 6) /= "11" else
                    '1' when (OP = ROTL or OP = ROTR) and BIW_0(7 downto 6) /= "11" else
                    '1' when (OP = ROXL or OP = ROXR) and BIW_0(7 downto 6) /= "11" else
                    '1' when (OP = BCHG or OP = BCLR or OP = BSET) and BIW_0(5 downto 3) = "000" else
                    '1' when (OP = BFCHG or OP = BFCLR or OP = BFINS or OP = BFSET) and BIW_0(5 downto 3) = "000" else
                    '1' when OP = BFEXTS or OP = BFEXTU or OP = BFFFO else
                    '1' when (OP = CLR or OP = TAS or OP = Scc) and BIW_0(5 downto 3) = "000" else
                    '1' when OP = DBcc or OP = DIVS or OP = DIVU or OP = MULS or OP = MULU else
                    '1' when OP = EXG and BIW_0(7 downto 3) /= "01001" else
                    '1' when OP = EXT or OP = EXTB or OP = SWAP else
                    '1' when OP = MOVE and BIW_0(8 downto 6) = "000" else
                    '1' when (OP = MOVE_FROM_CCR or OP = MOVE_FROM_SR) and BIW_0(5 downto 3) = "000" else
                    '1' when OP = MOVEM and BIW_0(10) = '1' and MOVEM_ADn_I = '0' and MOVEM_COND = true else -- Memory to register.
                    '1' when OP = MOVEP and BIW_0(7 downto 6) < "10" else -- Memory to register.
                    '1' when OP = MOVEC and BIW_0(0) = '0' and BIW_1(15) = '0' else -- Destination is Dx.
                    '1' when OP = MOVEQ else
                    '1' when OP = MOVES and BIW_1(15) = '0' and BIW_1(11) = '0' else
                    '1' when (OP = NBCD or OP = NEG or OP = NEGX or OP = NOT_B) and BIW_0(5 downto 3) = "000" else
                    '1' when (OP = PACK or OP = UNPK) and BIW_0(3) = '0' else '0';

    UNMARK <= '1' when EXEC_WB_STATE /= IDLE and NEXT_EXEC_WB_STATE = IDLE else '0'; -- Release a pending write cycle when done.

    -- These signals indicates, that two registers are prepared to be written. In this case, the values
    -- in both of these registers are invalidated before the writeback.
    USE_APAIR <= true when OP = EXG and BIW_0(7 downto 3) = "01001" else false;
    USE_DPAIR <= true when OP = EXG and BIW_0(7 downto 3) = "01000" else
                 true when (OP = DIVS or OP = DIVU) and OP_SIZE_I = LONG and BIW_1(14 downto 12) /= BIW_1(2 downto 0) else
                 true when (OP = MULS or OP = MULU) and OP_SIZE_I = LONG and BIW_1(10) = '1' and BIW_1(14 downto 12) /= BIW_1(2 downto 0) else false;

    LOOP_EXIT <= LOOP_EXIT_I;
    LOOP_EXIT_I <= '1' when OP /= DBcc and LOOP_BSY = '1' and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP and EXH_REQ = '1' else -- Exception! break the loop.
                   '1' when OP = DBcc and LOOP_BSY = '1' and FETCH_STATE = SLEEP and NEXT_FETCH_STATE = START_OP and (ALU_COND = true or DBcc_COND = true) else '0'; -- 68010 loop mechanism.

    LOOP_CTRL: process
    -- This flip flop indicates, if a DBcc loop operation has finished if the exception handler indicates an interrupt. 
    -- If so, no action is required. If the loop is split (when not finished) the exception handler may not increment 
    -- the PC to hold the value of the loop operation.
    begin
        wait until CLK = '1' and CLK' event;
        if FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP then
            LOOP_SPLIT <= false;
        elsif PC_INC_EXH = '1' then
            LOOP_SPLIT <= false;
        elsif OP /= DBcc and EXH_REQ = '1' and LOOP_BSY = '1' and FETCH_STATE = SLEEP and NEXT_FETCH_STATE = START_OP then
            LOOP_SPLIT <= true;
        end if;
    end process LOOP_CTRL;
    

    BF_OFFSET_I <= To_Integer(unsigned(BF_OFFSET));
    BF_WIDTH_I <= To_Integer(unsigned(BF_WIDTH));

    RESET_STRB <= '1' when OP = RESET and INIT_ENTRY = '1' else '0';

    EX_TRACE <= '0' when OP = ILLEGAL or OP = UNIMPLEMENTED else
                '1' when TRACE_MODE = "10" and OPD_ACK = '1' and FETCH_STATE = START_OP and OP = TRAP else
                '1' when TRACE_MODE = "10" and FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP else
                '1' when TRACE_MODE = "01" and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and OP = TRAP else
                '1' when TRACE_MODE = "01" and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and OP = TRAPcc and ALU_COND = true else
                '1' when TRACE_MODE = "01" and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and OP = TRAPV and VBIT = '1' else
                '1' when TRACE_MODE = "01" and SR_WR_I = '1' else -- Status register manipulations.
                '1' when TRACE_MODE = "01" and (PC_ADD_DISPL_I or PC_LOAD_I) = '1' else '0'; -- All branches and jumps.

    P_STATUSn: process
    -- This logic is registered to enhance the system performance concerning fmax.
    begin
        wait until CLK = '1' and CLK' event;
        if FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP then
            STATUSn <= '0';
        else
            STATUSn <= '1';
        end if;
    end process P_STATUSn;

    ADDRESS_OFFSET: process
    variable ADR_OFFS_VAR: std_logic_vector(5 downto 0) := "000000";
    begin
        wait until CLK = '1' and CLK' event;
        if FETCH_STATE = START_OP then
            ADR_OFFS_VAR := "000000";
        else
            case OP is
                when BFCHG | BFCLR | BFINS | BFSET =>
                    if FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and BF_BYTES = 5 then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "100"; -- Another Byte required.
                    elsif INIT_ENTRY = '1' then
                        ADR_OFFS_VAR := "000000"; -- Restore.
                    elsif FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and BF_BYTES = 5 then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "100"; -- Another Byte required.
                    end if;
                when BFEXTS | BFEXTU | BFFFO | BFTST =>
                    if FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and BF_BYTES = 5 then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "100"; -- Another Byte required.
                    end if;
                when CHK2 | CMP2 =>
                    if FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and OP_SIZE_I = LONG then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "100";
                    elsif FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' and OP_SIZE_I = WORD then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "10";
                    elsif FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + '1';
                    end if;
                when MOVEM =>
                    if ADR_MODE_I = "011" or ADR_MODE_I = "100" then -- (An)+, -(An).
                        null; -- Offset comes from addressing register.
                    elsif BIW_0(10) = '1' and MOVEM_FIRST_RD = false then
                        null; -- Do not increment before the first bus access.
                    elsif MOVEM_COND = true and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and OP_SIZE_I = LONG then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "100"; -- Register to memory.
                    elsif MOVEM_COND = true and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "10"; -- Register to memory.
                    end if;
                when MOVEP =>
                    if FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' then
                        ADR_OFFS_VAR := ADR_OFFS_VAR + "10";
                    end if;
                when others => null;
            end case;
        end if;
        ADR_OFFSET <= ADR_OFFS_VAR;
    end process ADDRESS_OFFSET;

    BITFIELD_CONTROL: process
    begin
        wait until CLK = '1' and CLK' event;
        if FETCH_STATE = START_OP then
            case OP is
                when BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST =>
                    if NEXT_FETCH_STATE = INIT_EXEC_WB then
                        BF_BYTES <= 4; -- Register access.
                    else
                        BF_BYTES <= BF_BYTES_I(BF_OFFSET_I, BF_WIDTH_I);
                    end if;
                    BF_HILOn <= '1';
                when others => null;
            end case;
        elsif FETCH_STATE = FETCH_OPERAND then
            if RD_RDY = '1' and BF_BYTES = 5 then
                BF_BYTES <= 1;
                BF_HILOn <= '0';
            elsif RD_RDY = '1' then
                BF_BYTES <= BF_BYTES_I(BF_OFFSET_I, BF_WIDTH_I); -- Restore.
                BF_HILOn <= '1'; -- Restore.
            end if;
        elsif EXEC_WB_STATE = WRITE_DEST then
            if WR_RDY = '1' and BF_BYTES = 5 then
                BF_BYTES <= 1;
                BF_HILOn <= '0';
            elsif WR_RDY = '1' then
                BF_HILOn <= '1'; -- Restore.
            end if;
        end if;
    end process BITFIELD_CONTROL;

    MOVEM_CONTROL: process(ADR_MODE_I, CLK, BIW_0, BIW_1, OP, RESET_CPU, FETCH_STATE, NEXT_FETCH_STATE, ALU_BSY, MOVEM_PNTR)
    variable INDEX      : integer range 0 to 15 := 0;
    variable MOVEM_PVAR : std_logic_vector(3 downto 0) := x"0";
    variable BITS       : std_logic_vector(4 downto 0);
    begin
        if CLK = '1' and CLK' event then
            if FETCH_STATE = START_OP then
                MOVEM_PVAR := x"0";
            elsif FETCH_STATE = INIT_EXEC_WB and MOVEM_COND = false and MOVEM_PVAR < x"F" and ALU_BSY = '0' then
                MOVEM_PVAR := MOVEM_PVAR + '1'; -- No data to write.
            elsif BIW_0(10) = '1' and MOVEM_FIRST_RD = true and FETCH_STATE = INIT_EXEC_WB and MOVEM_PVAR < x"F" and ALU_BSY = '0' then
                MOVEM_PVAR := MOVEM_PVAR + '1'; -- Data has not been read.
            elsif BIW_0(10) = '0' and FETCH_STATE = INIT_EXEC_WB and MOVEM_PVAR < x"F" and ALU_BSY = '0' then
                MOVEM_PVAR := MOVEM_PVAR + '1'; -- Data has been written.
            end if;

            if OP = MOVEM and ALU_INIT_I = '1' and ADR_MODE_I = "011" and MOVEM_ADn_I = '1' and MOVEM_PNTR(2 downto 0) = BIW_0(2 downto 0) then
                MOVEM_INH_WR <= true; -- Do not write the addressing register.
            elsif ALU_INIT_I = '1' then 
                MOVEM_INH_WR <= false;
            end if;
        
            if FETCH_STATE = START_OP then
                MOVEM_FIRST_RD <= false;
            elsif OP = MOVEM and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' then
                MOVEM_FIRST_RD <= true;
            end if;
            
            if RESET_CPU = '1' or (FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP) then
                BITS := "00000";
                MOVEM_LAST_WR <= false;
            elsif OP = MOVEM and FETCH_STATE = START_OP and NEXT_FETCH_STATE /= START_OP and ADR_MODE_I = "100" then -- -(An).
                for i in 0 to 15 loop
                    BITS := BITS + BIW_1(i); -- Count number of '1's.
                end loop;
                MOVEM_LAST_WR <= false;
            elsif OP = MOVEM and ALU_INIT_I = '1' and BITS > "00001" then
                BITS := BITS - '1';
            elsif OP = MOVEM and BITS = "00001" then
                MOVEM_LAST_WR <= true;
            end if;

            -- During the MOVEM instruction in memory to register operation and addressing modes "010", "101","110" the effective address might be
            -- affected, if the addressing register is active in the register list mask. To deal with it, the effective address is stored until the
            -- MOVEM has read all registers from memory addressed by the initial addressing register (old value).
            -- This logic is modeled synchronously (one clock latency) due to the one clock delay of the address calculation.
            if OP /= MOVEM or BIW_0(10) /= '1' or (ADR_MODE_I /= "010" and ADR_MODE_I /= "101" and ADR_MODE_I /= "110") then
                STORE_AEFF <= '0'; 
            elsif FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP then
                STORE_AEFF <= '0'; -- Operation completed.
            elsif FETCH_STATE = SWITCH_STATE or FETCH_STATE = CALC_AEFF or FETCH_STATE = FETCH_OPERAND or FETCH_STATE = INIT_EXEC_WB then
                STORE_AEFF <= '1';
            end if;
        end if;

        -- This signal determines whether to handle address or data registers.
        if ADR_MODE_I = "100" then -- -(An).
            MOVEM_ADn_I <= not To_Bit(MOVEM_PVAR(3));
            MOVEM_ADn <= not To_Bit(MOVEM_PVAR(3));
        else
            MOVEM_ADn_I <= To_Bit(MOVEM_PVAR(3));
            MOVEM_ADn <= To_Bit(MOVEM_PVAR(3));
        end if;

        INDEX := To_Integer(unsigned(MOVEM_PVAR));

        -- The following signal determines if a register is affected or not, depending
        -- on the status of the register list bit. 
        if OP = MOVEM and BIW_1(INDEX) = '1' then
            MOVEM_COND <= true;
        else
            MOVEM_COND <= false;
        end if;

        -- This signal determines whether to handle address or data registers.
        if ADR_MODE_I = "100" then -- -(An).
            MOVEM_PNTR <= not MOVEM_PVAR; -- Count down.
        else
            MOVEM_PNTR <= MOVEM_PVAR;
        end if;
    end process MOVEM_CONTROL;

    MOVEP_CONTROL: process(CLK, MOVEP_PNTR_I)
    -- This logic handles the bytes to be written or read during the MOVEP
    -- operation. In LONG mode 4 bytes are affected and in WORD mode two bytes.
    begin
        if CLK = '1' and CLK' event then
          if RESET_CPU = '1' or (FETCH_STATE /= START_OP and NEXT_FETCH_STATE = START_OP) then
                MOVEP_PNTR_I <= 0;
            elsif FETCH_STATE = START_OP and (BIW_0(8 downto 6) = "101" or BIW_0(8 downto 6) = "111") then
                MOVEP_PNTR_I <= 3; -- LONG.
            elsif FETCH_STATE = START_OP then
                MOVEP_PNTR_I <= 1; -- WORD.
            elsif FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and MOVEP_PNTR_I /= 0 then
                MOVEP_PNTR_I <= MOVEP_PNTR_I - 1; -- Register to memory
            end if;
        end if;
        MOVEP_PNTR <= MOVEP_PNTR_I;
    end process MOVEP_CONTROL;

    PHASE2_CONTROL: process
    -- This is used for some operations which require
    -- two control sequences.
    begin
        wait until CLK = '1' and CLK' event;
        if NEXT_FETCH_STATE = START_OP then
            PHASE2 <= false;
        elsif (OP = ABCD or OP = SBCD) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' then
            PHASE2 <= true; -- One clock cycle delay for destination address calculation.
        elsif (OP = ADDX or OP = SUBX) and FETCH_STATE = FETCH_OPERAND and RD_RDY = '1' then
            PHASE2 <= true; -- One clock cycle delay for destination address calculation.
        elsif OP = CAS2 and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and PHASE2 = false then
            PHASE2 <= true; -- Used as a control flow switch.
        elsif OP = CAS2 and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' then
            PHASE2 <= false; -- Prepare for writeback / write destination.
        elsif OP_WB_I = CAS2 and EXEC_WB_STATE = WRITEBACK then
            PHASE2 <= true; -- Used as a control flow switch.
        elsif OP_WB_I = CAS2 and EXEC_WB_STATE = WRITE_DEST and WR_RDY = '1' then
            PHASE2 <= true; -- Used as a control flow switch.
        elsif (OP = CHK2 or OP = CMP2 or OP = CMPM) and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' then
            PHASE2 <= true; -- Used as a control flow switch.
        elsif OP = JSR and FETCH_STATE = SLEEP then
            PHASE2 <= true; -- One clock cycle delay for address calculation.
        elsif OP = PEA and FETCH_STATE = SWITCH_STATE then
            PHASE2 <= true; -- One clock cycle delay for address calculation.
        elsif OP = RTR and FETCH_STATE = INIT_EXEC_WB and NEXT_FETCH_STATE = CALC_AEFF then
            PHASE2 <= true; -- Used as a control flow switch.
        elsif OP = MOVE and FETCH_STATE = INIT_EXEC_WB and ALU_BSY = '0' and BIW_0(8 downto 6) > "100" then
            PHASE2 <= true; -- Indicate destination address calculation is in progress.
        end if;
    end process PHASE2_CONTROL;

    STATE_REGs: process
    begin
        wait until CLK = '1' and CLK' event;
        if RESET_CPU = '1' then
            FETCH_STATE <= START_OP;
            EXEC_WB_STATE <= IDLE;
        elsif EW_ACK = '1' and OW_VALID = '0' then
            FETCH_STATE <= START_OP; -- Bus error.
            EXEC_WB_STATE <= IDLE;
        elsif OPD_ACK = '1' and OW_VALID = '0' then
            FETCH_STATE <= START_OP; -- Bus error.
            EXEC_WB_STATE <= IDLE;
        elsif DATA_RD_I = '1' and RD_RDY = '1' and DATA_VALID = '0' then
            FETCH_STATE <= START_OP; -- Bus error.
            EXEC_WB_STATE <= IDLE;
        elsif DATA_WR_I = '1' and RD_RDY = '1' and DATA_VALID = '0' then
            FETCH_STATE <= START_OP; -- Bus error.
            EXEC_WB_STATE <= IDLE;
        else
            FETCH_STATE <= NEXT_FETCH_STATE;
            EXEC_WB_STATE <= NEXT_EXEC_WB_STATE;
        end if;
    end process STATE_REGs;

    -- Debugging:
    -- Use this signal to detect instructions in use in the writeback path (OP_WB_I) or in the fetch path (OP).
    -- for these instructions you can halt the pipeline in the START_OP state to detect any problems.
    -- with OP select
    -- with OP_WB_I select
    --     OP_TEST <= '1' when ADDA | ADDQ | EXG | LEA | LINK | MOVEA | MOVE_USP | MOVEC | MOVEM | MOVES | SUBA | SUBQ | UNLK | -- Address register manipulations.
    --                         ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR | DIVS | DIVU | -- Long ALU operations. (68K10, 68K30L have no barrel shifter).
    --                         ADD | AND_B | CLR | EOR | SUB | OR_B | CMP | CMPA | CMPM | NOT_B | NBCD | NEG | NEGX | SWAP | TAS | TST
    --                         ANDI_TO_CCR | ANDI_TO_SR | EORI_TO_CCR | EORI_TO_SR | ORI_TO_CCR | ORI_TO_SR | MOVE_FROM_CCR | 
    --                         MOVE_TO_CCR | MOVE_FROM_SR | MOVE_TO_SR | MOVE | MOVEQ | MOVEP | PEA | 
    --                         ABCD | ADDX | SBCD | SUBX | BCHG | BCLR | BSET | BTST | EXT | 
    --                         Bcc | BSR | CHK | DBcc | JSR | TRAPV | RTR | Scc | STOP | 
    --                         ADDI | ANDI | SUBI | CMPI | EORI | ORI | MULS | MULU, '0' when others;

    FETCH_DEC: process(ADR_MODE_I, ALU_BSY, ALU_COND, AR_IN_USE, BF_BYTES, BIW_0, BIW_1, BRANCH_ATN, DR_IN_USE, EW_ACK, EW_RDY, EXH_REQ, 
                       EXEC_WB_STATE, EXT_WORD, FETCH_STATE, MEM_INDIRECT, MEMADR_RDY, MOVEM_COND, MOVEM_PNTR, MOVEP_PNTR_I, NEXT_EXEC_WB_STATE, 
                       OP, OP_SIZE_I, OP_WB_I, OPD_ACK, OW_RDY, PHASE2, RD_RDY, TRACE_MODE, OD_REQ_32, OD_REQ_16, WR_RDY)
    -- ADH: avoid data hazard.
    -- ASH: avoid structural hazard.
    -- ASH: avoid control hazard.
    begin
        case FETCH_STATE is
            when START_OP =>
                if OPD_ACK = '0' and OW_RDY = '0' then
                    NEXT_FETCH_STATE <= START_OP;
                -- Debugging:
                --elsif OP_TEST = '1' and ALU_BSY = '1' then
                --    NEXT_FETCH_STATE <= START_OP;
                else
                    case OP is
                        when ILLEGAL | RTE | TRAP | UNIMPLEMENTED =>
                            NEXT_FETCH_STATE <= START_OP;
                        when DBcc | EXT | EXTB | MOVEQ | SWAP =>
                            if DR_IN_USE = '1' then
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Proceed.
                            end if;
                        when ABCD | SBCD | ADDX | SUBX | PACK | UNPK =>
                            if BIW_0(3) = '0' and DR_IN_USE = '0' then -- Check for destination addressing register. ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Register to register.
                            elsif BIW_0(3) = '1' and AR_IN_USE = '0' then -- Check for destination addressing register. ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF; -- Memory to memory.
                            else
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            end if;
                        when ADD | ADDI | ADDQ | AND_B | ANDI | CAS | CMP | CMPI | EOR | EORI | 
                             NBCD | NEG | NEGX | NOT_B | OR_B | ORI | SUB | SUBI | SUBQ | TST | TAS =>
                            -- These instructions have to take the destination into aspect
                            -- because the destination is an ALU operand and may cause data hazards.
                             case BIW_0(5 downto 3) is
                                when "000" => -- Dn.
                                    if DR_IN_USE = '0' then
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    else
                                        NEXT_FETCH_STATE <= START_OP;
                                    end if;
                                when "001" => -- An.
                                    if (OP = ADD or OP = SUB or OP = AND_B or OP = EOR or OP = OR_B or OP = CMP) and (AR_IN_USE = '1' or DR_IN_USE = '1')then -- ADH.
                                        NEXT_FETCH_STATE <= START_OP;
                                    elsif AR_IN_USE = '0' then
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    else
                                        NEXT_FETCH_STATE <= START_OP;
                                    end if;
                                when "010" | "011" => -- (An), (An)+.
                                    if AR_IN_USE = '1' then -- ADH.
                                        NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                                    else
                                        NEXT_FETCH_STATE <= FETCH_OPERAND;
                                    end if;
                                when "100" => -- -(An).
                                    if AR_IN_USE = '1' then -- ADH.
                                        NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                                    else
                                        NEXT_FETCH_STATE <= CALC_AEFF;
                                    end if;
                                when "101" => 
                                    NEXT_FETCH_STATE <= FETCH_DISPL;
                                when "110" =>
                                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                when others => -- "111" 
                                    if BIW_0(2 downto 0) = "000" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                    elsif BIW_0(2 downto 0) = "001" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                    elsif BIW_0(2 downto 0) = "100" and OP_SIZE_I = LONG then
                                        NEXT_FETCH_STATE <= FETCH_IDATA_B2;
                                    elsif BIW_0(2 downto 0) = "100" then -- Word or byte.
                                        NEXT_FETCH_STATE <= FETCH_IDATA_B1;
                                    elsif BIW_0(2 downto 0) = "010" then
                                        NEXT_FETCH_STATE <= FETCH_DISPL;
                                    else
                                        NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                    end if;
                            end case;
                        when ADDA | BCHG | BCLR | BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST | BSET | BTST | CHK | CHK2 | CMP2 | CMPA | 
                             DIVS | DIVU | MULS | MULU | MOVEA | MOVE_TO_CCR | MOVE_TO_SR | SUBA =>
                             case BIW_0(5 downto 3) is
                                when "000" => -- Source is Dn.
                                    if (OP = ADDA or OP = SUBA or OP = CMPA or OP = MOVEA) and (AR_IN_USE = '1' or DR_IN_USE = '1') then -- ADH.
                                        NEXT_FETCH_STATE <= START_OP;
                                    elsif DR_IN_USE = '0' then
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    else
                                        NEXT_FETCH_STATE <= START_OP;
                                    end if;
                                when "001" => -- Valid for ADDA, CMPA, MOVEA, SUBA; source is An.
                                    if AR_IN_USE = '0' then
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB; -- ADH.
                                    else
                                        NEXT_FETCH_STATE <= START_OP;
                                    end if;
                                when "010" | "011" => -- (An), (An)+.
                                    if AR_IN_USE = '1' then -- ADH.
                                        NEXT_FETCH_STATE <= START_OP; -- Wait, ADH!
                                    else
                                        NEXT_FETCH_STATE <= FETCH_OPERAND;
                                    end if;
                                when "100" => -- -(An).
                                    if AR_IN_USE = '1' then -- ADH.
                                        NEXT_FETCH_STATE <= START_OP; -- Wait, ADH!
                                    else
                                        NEXT_FETCH_STATE <= CALC_AEFF;
                                    end if;
                                when "101" => 
                                    NEXT_FETCH_STATE <= FETCH_DISPL;
                                when "110" =>
                                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                when others => -- "111"
                                    if BIW_0(2 downto 0) = "000" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                    elsif BIW_0(2 downto 0) = "001" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                    elsif BIW_0(2 downto 0) = "100" and OP_SIZE_I = LONG then
                                        NEXT_FETCH_STATE <= FETCH_IDATA_B2;
                                    elsif BIW_0(2 downto 0) = "100" then -- Word or Byte.
                                        NEXT_FETCH_STATE <= FETCH_IDATA_B1;
                                    elsif BIW_0(2 downto 0) = "010" then
                                        NEXT_FETCH_STATE <= FETCH_DISPL;
                                    else
                                        NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                    end if;
                            end case;
                        when EXG =>
                            if BIW_0(7 downto 3) = "10001" and (DR_IN_USE = '1' or AR_IN_USE = '1') then
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            elsif BIW_0(7 downto 3) = "01000" and DR_IN_USE = '1' then
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            elsif BIW_0(7 downto 3) = "01001" and AR_IN_USE = '1' then
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when NOP => -- Synchronize the instruction pipeline.
                            if ALU_BSY = '0' and EXEC_WB_STATE = IDLE then
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            else
                                NEXT_FETCH_STATE <= START_OP;
                            end if;
                        when MOVE_FROM_CCR | MOVE_FROM_SR =>
                            if ALU_BSY = '0' then
                                case BIW_0(5 downto 3) is
                                    when "000" => -- Destination is Dn.
                                        if DR_IN_USE = '0' then
                                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                        else
                                            NEXT_FETCH_STATE <= START_OP;
                                        end if;
                                    when "010" | "011" | "100" => -- (An), (An)+, -(An).
                                        if AR_IN_USE = '0' then
                                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                        else
                                            NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                                        end if;
                                    when "101" => 
                                        NEXT_FETCH_STATE <= FETCH_DISPL;
                                    when "110" =>
                                        NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                    when others => -- "111" 
                                        if BIW_0(2 downto 0) = "000" then
                                            NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                        else
                                            NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                        end if;
                                end case;
                            else
                                NEXT_FETCH_STATE <= START_OP;
                            end if;
                        when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                            if BIW_0(7 downto 6) /= "11" then -- Register shifts.
                                if DR_IN_USE = '0' then
                                    NEXT_FETCH_STATE <= INIT_EXEC_WB; -- ADH.
                                else
                                    NEXT_FETCH_STATE <= START_OP;
                                end if;
                            else -- Memory shifts.
                                case BIW_0(5 downto 3) is
                                    when "010" | "011" => -- (An), (An)+.
                                        if AR_IN_USE = '0' then -- ADH.
                                            NEXT_FETCH_STATE <= FETCH_OPERAND;
                                        else
                                            NEXT_FETCH_STATE <= START_OP;
                                        end if;
                                    when "100" => -- -(An).
                                        if AR_IN_USE = '0' then -- ADH.
                                            NEXT_FETCH_STATE <= CALC_AEFF;
                                        else
                                            NEXT_FETCH_STATE <= START_OP;
                                        end if;
                                    when "101" => 
                                        NEXT_FETCH_STATE <= FETCH_DISPL;
                                    when "110" =>
                                        NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                    when others => -- "111". 
                                        if BIW_0(2 downto 0) = "000" then
                                            NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                        else
                                            NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                        end if;
                                end case;
                            end if;
                        when BKPT =>
                            -- Wait until the bus controller is free to avoid a structural
                            -- hazard due to the top level function code multiplexer which
                            -- switches on the CPU_SPACE selector.
                            if ALU_BSY = '0' then
                                NEXT_FETCH_STATE <= FETCH_OPERAND;
                            else
                                NEXT_FETCH_STATE <= START_OP;
                            end if;
                        when CAS2 | CMPM | RTD | RTR | RTS =>
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= FETCH_OPERAND;
                            else
                                NEXT_FETCH_STATE <= START_OP;
                            end if;
                        when CLR | JMP | JSR | LEA | PEA | Scc => -- No read access required.
                            case BIW_0(5 downto 3) is
                                when "000" => -- CLR, Scc.
                                    if DR_IN_USE = '0' then
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    else
                                        NEXT_FETCH_STATE <= START_OP;
                                    end if;
                                when "001" | "010" | "011" | "100" =>
                                    if AR_IN_USE = '1' then
                                        NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                                    elsif OP = LEA or OP = PEA then
                                        NEXT_FETCH_STATE <= SWITCH_STATE;
                                    else
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    end if;
                                when "101" => 
                                    NEXT_FETCH_STATE <= FETCH_DISPL;
                                when "110" =>
                                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                when others => -- "111" 
                                    if BIW_0(2 downto 0) = "000" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                    elsif BIW_0(2 downto 0) = "001" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                    elsif BIW_0(2 downto 0) = "010" then
                                        NEXT_FETCH_STATE <= FETCH_DISPL;
                                    else
                                        NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                    end if;
                            end case;
                            --
                            -- The following condition is a special case for the
                            -- stack manipulating operations JSR and PEA. If A7
                            -- is in use, we have to wait in all addressing modes.
                            if (OP = JSR or OP = PEA) and AR_IN_USE = '1' then
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            end if;
                        when LINK | UNLK =>
                            -- We have to wait for the ALU because the registers are written without pipelining
                            -- through the ALU and the stack is decremented early. For PEA we have to wait in 
                            -- all addressing modes, if A7 is in use.
                            if OP = LINK and (ALU_BSY = '1' or AR_IN_USE = '1') then
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH, ASH (two address registers are affected).
                            elsif OP = UNLK and ALU_BSY = '1' then
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH, ASH (two address registers are affected).
                            else
                                NEXT_FETCH_STATE <= SWITCH_STATE; -- Stack pointer is decremented in this state.
                            end if;
                        when MOVE =>
                            case BIW_0(5 downto 3) is -- Source operand.
                                when "000" => -- Dn.
                                    -- Destination is -(An) and will be decremented here, wait.
                                    if BIW_0(8 downto 6) = "100" and (AR_IN_USE = '1' or DR_IN_USE = '1') then
                                        NEXT_FETCH_STATE <= START_OP;
                                    elsif DR_IN_USE = '1' then
                                        NEXT_FETCH_STATE <= START_OP;
                                    else
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    end if;
                                when "001" => -- An.
                                    if AR_IN_USE = '1' then
                                        NEXT_FETCH_STATE <= START_OP;
                                    else
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    end if;
                                when "010" | "011" => -- (An), (An)+.
                                    if AR_IN_USE = '0' then
                                        NEXT_FETCH_STATE <= FETCH_OPERAND;
                                    else
                                        NEXT_FETCH_STATE <= START_OP;
                                    end if;
                                when "100" => -- -(An).
                                    if AR_IN_USE = '0' then
                                        NEXT_FETCH_STATE <= CALC_AEFF;
                                    else
                                        NEXT_FETCH_STATE <= START_OP;
                                    end if;
                                when "101" => 
                                    NEXT_FETCH_STATE <= FETCH_DISPL;
                                when "110" =>
                                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                when others =>
                                    if BIW_0(2 downto 0) = "000" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                    elsif BIW_0(2 downto 0) = "001" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                    elsif BIW_0(2 downto 0) = "100" and BIW_0(13 downto 12) = "10" then -- Long.
                                        NEXT_FETCH_STATE <= FETCH_IDATA_B2;
                                    elsif BIW_0(2 downto 0) = "100" then -- Word or Byte.
                                        NEXT_FETCH_STATE <= FETCH_IDATA_B1;
                                    elsif BIW_0(2 downto 0) = "010" then
                                        NEXT_FETCH_STATE <= FETCH_DISPL;
                                    else
                                        NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                    end if;
                            end case;
                        when MOVEM =>
                            case BIW_0(5 downto 3) is
                                when "010" | "011" | "100" => -- (An), (An)+, -(An).
                                    if AR_IN_USE = '1' then -- ADH.
                                        NEXT_FETCH_STATE <= START_OP;
                                    else
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                    end if;
                                when "101" => 
                                    NEXT_FETCH_STATE <= FETCH_DISPL;
                                when "110" =>
                                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                when others => 
                                    if BIW_0(2 downto 0) = "000" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                    elsif BIW_0(2 downto 0) = "001" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                    elsif BIW_0(2 downto 0) = "010" then
                                        NEXT_FETCH_STATE <= FETCH_DISPL;
                                    else
                                        NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                    end if;
                            end case;
                        when MOVEP =>
                            if AR_IN_USE = '0' and BIW_0(7 downto 6) < "10" then
                                NEXT_FETCH_STATE <= SWITCH_STATE; -- Memory to register.
                            elsif AR_IN_USE = '0' and DR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= SWITCH_STATE; -- Register to memory.
                            else
                                NEXT_FETCH_STATE <= START_OP;
                            end if;
                        when BSR | MOVE_USP =>
                            -- MOVE_USP: wait until A7 has been updated to load the correct data to the ALU.
                            -- BSR: wait until A7 has been updated before decrementing.
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            else
                                NEXT_FETCH_STATE <= START_OP;
                            end if;
                        when MOVEC =>
                            if BIW_0(0) = '1' and BIW_1(15) = '1' and AR_IN_USE = '1' then -- Address register is source.
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            elsif BIW_0(0) = '1' and BIW_1(15) = '0' and DR_IN_USE = '1' then -- Data register is source.
                                NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when MOVES =>
                            case BIW_0(5 downto 3) is
                                when "010" | "011" => -- (An), (An)+.
                                    if BIW_1(11) = '0' and AR_IN_USE = '0' then -- ADH.
                                        NEXT_FETCH_STATE <= FETCH_OPERAND; -- Memory to register.
                                    elsif BIW_1(11) = '1' and AR_IN_USE = '0' then -- ADH.
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Register to memory.
                                    else
                                        NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                                    end if;
                                when "100" => -- -(An).
                                    if BIW_1(11) = '0' and AR_IN_USE = '0' then -- ADH.
                                        NEXT_FETCH_STATE <= CALC_AEFF; -- Memory to register.
                                    elsif BIW_1(11) = '1' and AR_IN_USE = '0' then -- ADH.
                                        NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Register to memory.
                                    else
                                        NEXT_FETCH_STATE <= START_OP; -- Wait, ADH.
                                    end if;
                                when "101" => 
                                    NEXT_FETCH_STATE <= FETCH_DISPL;
                                when "110" =>
                                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                when others => -- "111"
                                    if BIW_0(2 downto 0) = "000" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                    else
                                        NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                    end if;
                            end case;
                            -- Register to memory:
                            if BIW_1(11) = '1' and BIW_1(15) = '1' and AR_IN_USE = '1' then -- ADH.
                                NEXT_FETCH_STATE <= START_OP;
                            elsif BIW_1(11) = '1' and BIW_1(15) = '0' and DR_IN_USE = '1' then -- ADH.
                                NEXT_FETCH_STATE <= START_OP;
                            end if;
                        when ANDI_TO_CCR | ANDI_TO_SR | EORI_TO_CCR | EORI_TO_SR | ORI_TO_CCR | ORI_TO_SR | RESET =>
                            -- Wait until the status register / condition codes have been updated. Otherwise we 
                            -- possibly have a data hazard using the wrong condition codes for the operation.
                            -- Be aware: for the ANDI_TO_SR, EORI_TO_SR, MOVE_TO_SR and ORI_TOI_SR operations
                            -- the pipe flush results in automatically aligned condition codes. Nevertheless
                            -- we need this logic for the respective operations, if the pipe is not flushed,
                            -- in the case of non changing RAM space.
                            -- For the RESET: we should not reset in running writeback cycles.
                            if ALU_BSY = '1' then
                                NEXT_FETCH_STATE <= START_OP;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when others => -- Bcc, BRA, STOP, TRAPV.
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                    end case;
                end if;
            when FETCH_DISPL =>
                case OP is
                    when ADD | CMP | SUB | AND_B | EOR | OR_B =>
                        if (EW_ACK = '1' or EW_RDY = '1') and AR_IN_USE = '0' then -- ADH.
                            NEXT_FETCH_STATE <= CALC_AEFF;
                        else
                            NEXT_FETCH_STATE <= FETCH_DISPL;
                        end if;
                    when ADDA | BCHG | BCLR | BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST | BSET | BTST | CHK | CHK2 | CMP2 | CMPA | DIVS | DIVU | MULS | MULU | MOVE | MOVEA | MOVE_TO_CCR | MOVE_TO_SR | SUBA =>
                        if (EW_ACK = '1' or EW_RDY = '1') and OP = MOVE and PHASE2 = true and AR_IN_USE = '0' then -- ADH.
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        elsif (EW_ACK = '1' or EW_RDY = '1') and AR_IN_USE = '0' then -- ADH.
                            NEXT_FETCH_STATE <= CALC_AEFF;
                        else
                            NEXT_FETCH_STATE <= FETCH_DISPL;
                        end if;
                    when ADDI | ADDQ | ANDI | CAS | CMPI | EORI | NBCD | NEG | NEGX | NOT_B | ORI | SUBI | SUBQ | TST | TAS | ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                        if (EW_ACK = '1' or EW_RDY = '1') and AR_IN_USE = '0' then -- ADH.
                            NEXT_FETCH_STATE <= CALC_AEFF;
                        else
                            NEXT_FETCH_STATE <= FETCH_DISPL;
                        end if;
                    when MOVES =>
                        if (EW_ACK = '1' or EW_RDY = '1') and AR_IN_USE = '0' and BIW_1(11) = '0' then
                            NEXT_FETCH_STATE <= CALC_AEFF;
                        elsif (EW_ACK = '1' or EW_RDY = '1') and AR_IN_USE = '0' then
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        else
                            NEXT_FETCH_STATE <= FETCH_DISPL;
                        end if;                    
                    when LEA | PEA =>
                        if (EW_ACK = '1' or EW_RDY = '1') and AR_IN_USE = '0' then -- ADH.
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        else
                            NEXT_FETCH_STATE <= FETCH_DISPL;
                        end if;
                    when others => -- CLR, JMP, JSR, MOVE_FROM_CCR, MOVE_FROM_SR, MOVEM, Scc.
                        if (EW_ACK = '1' or EW_RDY = '1') and AR_IN_USE = '0' then -- ADH.
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        else
                            NEXT_FETCH_STATE <= FETCH_DISPL;
                        end if;
                end case;
            when FETCH_EXWORD_1 =>
                -- Be aware that the An registers which will be addressed by EXWORD_1 and are used for several addressing modes
                -- are valid right after this state (because every address register manipulation requires no more than two clock cycles).
                if EW_ACK = '1' and EXT_WORD(8) = '1' and EXT_WORD(5 downto 4) = "11" then -- 32 bit displacement.
                    NEXT_FETCH_STATE <= FETCH_D_HI;
                elsif EW_ACK = '1' and EXT_WORD(8) = '1' and EXT_WORD(5 downto 4) = "10" then -- 16 bit displacement.
                    NEXT_FETCH_STATE <= FETCH_D_LO;
                elsif EW_ACK = '1' and EXT_WORD(8) = '1' and EXT_WORD(5 downto 4) = "00" then -- Reserved.
                    NEXT_FETCH_STATE <= START_OP;
                elsif EW_ACK = '1' and EXT_WORD(8) = '1' and EXT_WORD(1 downto 0) = "11" then
                    NEXT_FETCH_STATE <= FETCH_OD_HI; -- Long outer displacement.
                elsif EW_ACK = '1' and EXT_WORD(8) = '1' and EXT_WORD(1 downto 0) = "10" then
                    NEXT_FETCH_STATE <= FETCH_OD_LO; -- Word outer displacement.
                elsif EW_ACK = '1' and EXT_WORD(8) = '1' and EXT_WORD(1 downto 0) = "01" then
                    NEXT_FETCH_STATE <= FETCH_MEMADR; -- Null outer displacement, go to intermediate address.
                elsif EW_ACK = '1' or EW_RDY = '1' then -- Null displacement, no outer displacement.
                    case OP is
                        when ADD | CMP | SUB | AND_B | EOR | OR_B =>
                            if (BIW_1(15) = '0' and AR_IN_USE = '0' and DR_IN_USE = '0') or (BIW_1(15) = '1' and AR_IN_USE = '0') then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                            end if;
                        when ADDA | BCHG | BCLR | BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST | BSET | BTST | CHK | CHK2 | CMP2 | CMPA | DIVS | DIVU | MULS | MULU | MOVE | MOVEA | MOVE_TO_CCR | MOVE_TO_SR | SUBA =>
                            if OP = MOVE and PHASE2 = true and BIW_1(15) = '0' and AR_IN_USE = '0' and DR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            elsif OP = MOVE and PHASE2 = true and BIW_1(15) = '1' and AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            elsif (BIW_1(15) = '0' and AR_IN_USE = '0' and DR_IN_USE = '0') or (BIW_1(15) = '1' and AR_IN_USE = '0') then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                            end if;
                        when MOVES =>
                            if (BIW_1(15) = '0' and AR_IN_USE = '0' and DR_IN_USE = '0') or (BIW_1(15) = '1' and AR_IN_USE = '0') then -- ADH.
                                if BIW_1(11) = '0' then
                                    NEXT_FETCH_STATE <= CALC_AEFF;
                                else
                                    NEXT_FETCH_STATE <= INIT_EXEC_WB;
                                end if;
                            else
                                NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                            end if;
                        when ADDI | ADDQ | ANDI | CAS | CMPI | EORI | NBCD | NEG | NEGX | NOT_B | ORI | SUBI | SUBQ | TST | TAS | ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                            if (BIW_1(15) = '0' and AR_IN_USE = '0' and DR_IN_USE = '0') or (BIW_1(15) = '1' and AR_IN_USE = '0') then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                            end if;
						when LEA | PEA =>
                            if (BIW_1(15) = '0' and AR_IN_USE = '0' and DR_IN_USE = '0') or (BIW_1(15) = '1' and AR_IN_USE = '0') then -- ADH.
                                NEXT_FETCH_STATE <= SWITCH_STATE;
                            else
                                NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                            end if;
                        when others => -- CLR, JMP, JSR, MOVE_FROM_CCR, MOVE_FROM_SR, MOVEM, Scc.
                            if (BIW_1(15) = '0' and AR_IN_USE = '0' and DR_IN_USE = '0') or (BIW_1(15) = '1' and AR_IN_USE = '0') then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            else
                                NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                            end if;
                    end case;
                else
                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                end if;
            when FETCH_D_HI =>
                if EW_ACK = '1' then
                    NEXT_FETCH_STATE <= FETCH_D_LO;
                else
                    NEXT_FETCH_STATE <= FETCH_D_HI;
                end if;
            when FETCH_D_LO =>
                if EW_ACK = '1' and OD_REQ_32 = '1' then
                    NEXT_FETCH_STATE <= FETCH_OD_HI;
                elsif EW_ACK = '1' and OD_REQ_16 = '1' then
                    NEXT_FETCH_STATE <= FETCH_OD_LO;
                elsif EW_ACK = '1' and MEM_INDIRECT = '1' then -- Null displacement.
                    NEXT_FETCH_STATE <= FETCH_MEMADR;
                elsif EW_ACK = '1' or EW_RDY = '1' then
                    case OP is
                        when ADD | CMP | SUB | AND_B | EOR | OR_B =>
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <=  FETCH_D_LO;
                            end if;
                        when ADDA | BCHG | BCLR | BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST | BSET | BTST | CHK | CHK2| CMP2 | CMPA | DIVS | DIVU | MULS | MULU | MOVE | MOVEA | MOVE_TO_CCR | MOVE_TO_SR | SUBA =>
                            if OP = MOVE and PHASE2 = true and AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            elsif AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= FETCH_D_LO;
                            end if;
                        when MOVES =>
                            if AR_IN_USE = '1' then -- ADH.
                                NEXT_FETCH_STATE <= FETCH_D_LO; -- Wait, ADH.
                            elsif BIW_1(11) = '0' then
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when ADDI | ADDQ | ANDI | CAS | CMPI | EORI | NBCD | NEG | NEGX | NOT_B | ORI | SUBI | SUBQ | TST | TAS | ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <=  FETCH_D_LO;
                            end if;
                        when LEA | PEA =>
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= SWITCH_STATE;
                            else
                                NEXT_FETCH_STATE <= FETCH_D_LO;
                            end if;
                        when others => -- CLR, JMP, JSR, MOVE_FROM_CCR, MOVE_FROM_SR, MOVEM, Scc.
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            else
                                NEXT_FETCH_STATE <= FETCH_D_LO;
                            end if;
                    end case;
                else
                    NEXT_FETCH_STATE <= FETCH_D_LO;
                end if;
            when FETCH_OD_HI =>
                if EW_ACK = '1' then
                    NEXT_FETCH_STATE <= FETCH_OD_LO;
                else
                    NEXT_FETCH_STATE <= FETCH_OD_HI;
                end if;
            when FETCH_OD_LO =>
                if EW_ACK = '1' then
                    NEXT_FETCH_STATE <= FETCH_MEMADR;
                else
                    NEXT_FETCH_STATE <= FETCH_OD_LO;
                end if;
            when FETCH_MEMADR =>
                if RD_RDY = '1' or MEMADR_RDY = '1' then
                    case OP is
                        when ADD | CMP | SUB | AND_B | EOR | OR_B =>
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= FETCH_MEMADR;
                            end if;
                        when ADDA | BCHG | BCLR | BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST | BSET | BTST | CHK | CHK2| CMP2 | CMPA | DIVS | DIVU | MULS | MULU | MOVE | MOVEA | MOVE_TO_CCR | MOVE_TO_SR | SUBA =>
                            if OP = MOVE and PHASE2 = true and AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            elsif AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= FETCH_MEMADR;
                            end if;
                        when MOVES =>
                            if AR_IN_USE = '1' then -- ADH.
                                NEXT_FETCH_STATE <= FETCH_MEMADR; -- Wait, ADH.
                            elsif BIW_1(11) = '0' then
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when ADDI | ADDQ | ANDI | CAS | CMPI | EORI | NBCD | NEG | NEGX | NOT_B | ORI | SUBI | SUBQ | TST | TAS | ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= FETCH_MEMADR;
                            end if;
                        when LEA | PEA =>
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= SWITCH_STATE;
                            else
                                NEXT_FETCH_STATE <= FETCH_MEMADR;
                            end if;
                        when others => -- CLR, JMP, JSR, MOVE_FROM_CCR, MOVE_FROM_SR, MOVEM, Scc.
                            if AR_IN_USE = '0' then -- ADH.
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            else
                                NEXT_FETCH_STATE <= FETCH_MEMADR;
                            end if;
                    end case;
                else
                    NEXT_FETCH_STATE <= FETCH_MEMADR;
                end if;
            when FETCH_ABS_HI =>
                if EW_ACK = '1' then
                    NEXT_FETCH_STATE <= FETCH_ABS_LO;
                else
                    NEXT_FETCH_STATE <= FETCH_ABS_HI;
                end if;
            when FETCH_ABS_LO =>
                if EW_ACK = '1' then
                    case OP is
                        when CLR | JMP | JSR | MOVE_FROM_CCR | MOVE_FROM_SR | MOVEM | Scc =>
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        when LEA | PEA =>
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        when MOVE =>
                            if PHASE2 = false then
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when MOVES =>
                            if BIW_1(11) = '0' then
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when others =>
                            NEXT_FETCH_STATE <= CALC_AEFF;
                    end case;
                else
                    NEXT_FETCH_STATE <= FETCH_ABS_LO;
                end if;
            when FETCH_IDATA_B2 =>
                if EW_ACK = '1' then
                    NEXT_FETCH_STATE <= FETCH_IDATA_B1;
                else
                    NEXT_FETCH_STATE <= FETCH_IDATA_B2;
                end if;
            when FETCH_IDATA_B1 =>
                if EW_ACK = '1' or EW_RDY = '1' then
                    case OP is -- ADH.
                        when ADD | SUB | AND_B | OR_B | BTST | DIVS | DIVU | MULS | MULU | CHK | MOVE =>
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        when ADDA | CMPA | SUBA | MOVEA =>
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        when others =>
                            if DR_IN_USE = '1' then -- ADH.
                                NEXT_FETCH_STATE <= FETCH_IDATA_B1;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                    end case;
                else
                    NEXT_FETCH_STATE <= FETCH_IDATA_B1;
                end if;
            when CALC_AEFF =>
                NEXT_FETCH_STATE <= FETCH_OPERAND; -- One CLK calculation delay.
            when FETCH_OPERAND =>
                if RD_RDY = '1' then
                    case OP is
                        when ABCD | ADDX | SBCD | SUBX =>
                            if PHASE2 = false then
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when ADD | CMP | CHK | SUB | AND_B | EOR | OR_B | BCHG | BCLR | BSET | BTST | DIVS | DIVU | MULS | MULU =>
                            if DR_IN_USE = '1' then
                                NEXT_FETCH_STATE <= SWITCH_STATE;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when ADDA | CMPA | SUBA =>
                            if BIW_0(11 downto 9) = BIW_0(2 downto 0) and ADR_MODE_I = "011" then
                                NEXT_FETCH_STATE <= SWITCH_STATE; -- Postincrement (Ax)+, AX; wait before loading the ALU.
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when BFCHG | BFCLR | BFEXTS | BFEXTU | BFFFO | BFINS | BFSET | BFTST =>
                            if BF_BYTES = 5 then -- Another Byte required.
                                NEXT_FETCH_STATE <= CALC_AEFF;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when MOVE =>
                            if BIW_0(8 downto 6) = "100" and ADR_MODE_I = "011" then -- (An)+,-(An).
                                NEXT_FETCH_STATE <= SWITCH_STATE;
                            else
                                NEXT_FETCH_STATE <= INIT_EXEC_WB;
                            end if;
                        when others => 
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                    end case;
                else
                    NEXT_FETCH_STATE <= FETCH_OPERAND;
                end if;
            when SWITCH_STATE => -- This state is used individually by several operations.
                case OP is
                    when ADDA | CMPA | SUBA | MOVEA => -- Address register operations.
                        if AR_IN_USE = '0' then
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        else
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        end if;
                    when LEA | LINK | MOVE => 
                        -- LEA: calculate effective address (1 clock cycle) load it in INIT_EXEC_WB.
                        -- LINK: used to load the decremented stack pointer.
                        -- MOVE: Used for (An)+,-(An). address mode.
                        NEXT_FETCH_STATE <= INIT_EXEC_WB;
                    when UNLK => -- SP is updated here.
                        NEXT_FETCH_STATE <= CALC_AEFF;
                    when MOVEM => -- MOVEM requires 1 CLK cycle for address calculation.
                        if MOVEM_COND = false then
                            NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Cancel bus access.
                        else
                            NEXT_FETCH_STATE <= CALC_AEFF;
                        end if;
                    when MOVEP => -- Register select and displacement update.
                        if DR_IN_USE = '0' and BIW_0(7 downto 6) < "10" then
                            NEXT_FETCH_STATE <= CALC_AEFF;
                        elsif DR_IN_USE = '0' and ALU_BSY = '0' then -- ASH.
                            NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Register to memory.
                        else
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        end if;
                    when PEA =>
                        -- PEA requires two clock cycles here for effective adress calculation because it 
                        -- is loaded early. The first clock cycle the address becomes valid and after the
                        -- second the address is loaded to the ALU for writing on the stack.
                        if PHASE2 = false then 
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when others => -- Data register operations.
                        if DR_IN_USE = '0' then
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        else
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        end if;
                end case;
            when INIT_EXEC_WB =>
                case OP is
                    when ANDI_TO_SR | EORI_TO_SR | MOVE_TO_SR | ORI_TO_SR =>
                        if ALU_BSY = '0' and BRANCH_ATN = '1' then
                            NEXT_FETCH_STATE <= SLEEP; -- Wait for new processor context.
                        elsif ALU_BSY = '0' then
                            NEXT_FETCH_STATE <= START_OP; -- Proceed normally.
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when Bcc | CHK | DBcc | JMP | TRAPcc | TRAPV =>
                        if ALU_BSY = '0' then
                            NEXT_FETCH_STATE <= SLEEP; -- Check conditions.
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when CAS | JSR | MOVEC | TAS =>
                        -- CAS, TAS provide a RMC operation so have to sleep a little bit ;-)
                        if ALU_BSY = '0' then
                            NEXT_FETCH_STATE <= SLEEP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when BRA | BSR | RTD | RTS =>
                        if ALU_BSY = '0' then
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when BFCHG | BFCLR | BFINS | BFSET =>
                        if ALU_BSY = '0' and BF_BYTES < 5 then
                            NEXT_FETCH_STATE <= START_OP;
                        elsif ALU_BSY = '0' then
                            NEXT_FETCH_STATE <= SLEEP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Wait, ASH.
                        end if;
                    when CAS2 => -- RMC operation.
                        if ALU_BSY = '0' and PHASE2 = false then
                            NEXT_FETCH_STATE <= CALC_AEFF; -- Second compare.
                        elsif ALU_BSY = '0' then
                            NEXT_FETCH_STATE <= SLEEP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when CHK2 =>
                        if ALU_BSY = '0' and PHASE2 = false then
                            NEXT_FETCH_STATE <= FETCH_OPERAND; -- Second compare required?
                        elsif ALU_BSY = '0' then -- ASH.
                            NEXT_FETCH_STATE <= SLEEP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when CMP2 | CMPM =>
                        if ALU_BSY = '0' and PHASE2 = false then
                            NEXT_FETCH_STATE <= FETCH_OPERAND; -- Second compare required?
                        elsif ALU_BSY = '0' then -- ASH.
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when MOVE_USP =>
                        if ALU_BSY = '0' and BIW_0(3) = '0' then -- An to USP.
                            NEXT_FETCH_STATE <= SLEEP;
                        elsif ALU_BSY = '0' then
                            NEXT_FETCH_STATE <= START_OP; -- USP to An.
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when MOVE =>
                        if ALU_BSY = '0' and PHASE2 = false then -- Load the Operand into the ALU here.
                            case BIW_0(8 downto 6) is -- Destination operand.
                                when "101" => 
                                    NEXT_FETCH_STATE <= FETCH_DISPL;
                                when "110" =>
                                    NEXT_FETCH_STATE <= FETCH_EXWORD_1;
                                when "111" =>
                                    if BIW_0(11 downto 9) = "000" then
                                        NEXT_FETCH_STATE <= FETCH_ABS_LO;
                                    else
                                        NEXT_FETCH_STATE <= FETCH_ABS_HI;
                                    end if;
                                when others => -- No destination address calculation required.
                                    NEXT_FETCH_STATE <= START_OP;
                            end case;
                        elsif PHASE2 = true then -- ALU is not required at this point.
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when MOVEM =>
                        if ALU_BSY = '0' and BIW_0(10) = '0' and ADR_MODE_I = "100" and MOVEM_PNTR = x"0" then -- -(An), register to memory.
                            NEXT_FETCH_STATE <= SLEEP; -- Data completely transfered to the ALU.
                        elsif ALU_BSY = '0' and BIW_0(10) = '0' and ADR_MODE_I /= "100" and MOVEM_PNTR = x"F"  then -- Register to memory
                            NEXT_FETCH_STATE <= SLEEP; -- Data completely transfered to the ALU.
                        elsif ALU_BSY = '0' and BIW_0(10) = '1' and MOVEM_PNTR = x"F"  then -- Memory to register.
                            NEXT_FETCH_STATE <= SLEEP; -- Data completely transfered to the ALU.
                        elsif ALU_BSY = '0' and BIW_0(10) = '1' then -- Memory to register.
                            NEXT_FETCH_STATE <= SWITCH_STATE;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Register to memory.
                        end if;
                    when MOVEP =>
                        if ALU_BSY = '0' and MOVEP_PNTR_I = 0 then
                            NEXT_FETCH_STATE <= START_OP; -- Ready.
                        elsif ALU_BSY = '0' and BIW_0(7 downto 6) < "10" then
                            NEXT_FETCH_STATE <= CALC_AEFF; -- Memory to register.
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Register to memory.
                        end if;
                    when NOP =>
                        if ALU_BSY = '1' then -- ASH.
                            NEXT_FETCH_STATE <= INIT_EXEC_WB; -- Wait for all pending bus cycles to be completed.
                        else
                            NEXT_FETCH_STATE <= START_OP;
                        end if;
                    when RTR =>
                        if ALU_BSY = '0' and PHASE2 = false then
                            NEXT_FETCH_STATE <= CALC_AEFF;
                        elsif ALU_BSY = '0' and PHASE2 = true then
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when STOP =>
                        if ALU_BSY = '0' then -- ASH.
                            NEXT_FETCH_STATE <= SLEEP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when UNLK =>
                        if ALU_BSY = '0' and AR_IN_USE = '0' then -- ADH, ASH.
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB;
                        end if;
                    when others =>
                        if ALU_BSY = '0' then -- ASH.
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= INIT_EXEC_WB; -- ASH.
                        end if;
                end case;
            when SLEEP =>
                case OP is
                    when ANDI_TO_SR | CAS | CAS2 | EORI_TO_SR | MOVE_TO_SR | MOVEM | ORI_TO_SR | TAS =>
                        -- CAS, CAS2 and TAS are a read modify write instructions.
                        -- MOVEM: wait until last register is written to avoid data hazards
                        --        because the ADR_IN_USE, AR_IN__USE and DR_IN_USE does not
                        --        work for MOVEM (several registers in use).
                        -- TAS is a read modify write instruction.
                        -- _TO_SR instructions wait for the change of the SBIT
                        --        and so for a new processor context.
                        if NEXT_EXEC_WB_STATE = IDLE then
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= SLEEP;
                        end if;
                    when BFCHG | BFCLR | BFINS | BFSET =>
                        if EXEC_WB_STATE = WRITE_DEST and WR_RDY = '1' and BF_BYTES = 1 then
                            -- Wait until second writeback access has been processed.
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= SLEEP;
                        end if;
                    when JSR =>
                        if PHASE2 = false then
                            NEXT_FETCH_STATE <= SLEEP; -- Wait for address calculation.
                        else
                            NEXT_FETCH_STATE <= START_OP;
                        end if;
                    when MOVE_USP | MOVEC =>
                        -- MOVE_USP: wait for writeback not to conflict with AR_DEC in START_OP.
                        if NEXT_EXEC_WB_STATE = IDLE then
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= SLEEP; -- Wait for new processor context.
                        end if;
                    when DBcc =>
                        -- DBcc: evaluate conditions.
                        if NEXT_EXEC_WB_STATE = IDLE then
                            NEXT_FETCH_STATE <= START_OP;
                        else
                            NEXT_FETCH_STATE <= SLEEP;
                        end if;
                    when STOP =>
                        if TRACE_MODE /= "00" then
                            NEXT_FETCH_STATE <= START_OP; -- Do not perform a stop while tracing.
                        elsif EXH_REQ = '1' then
                            NEXT_FETCH_STATE <= START_OP; -- Wait on interrupt.
                        else
                            NEXT_FETCH_STATE <= SLEEP;
                        end if;
                    when others => -- Bcc, CHK, JMP, TRAPV.
                        -- Bcc: evaluate conditions.
                        -- CHK: use SWITCH_STATE for TRAP evaluation.
                        -- CHK2: use SWITCH_STATE for TRAP evaluation.
                        -- JMP: wait for address calculation.
                        -- TRAPV: check conditions.
                        NEXT_FETCH_STATE <= START_OP;
                end case;
        end case;
    end process FETCH_DEC;

    EXEC_WB_DEC: process(ALU_COND, ALU_INIT_I, ALU_REQ, BIW_0_WB, BIW_1_WB, BF_BYTES, EXEC_WB_STATE, FETCH_STATE, MOVEM_INH_WR, OP_WB_I, PHASE2, WR_RDY)
    begin
        case EXEC_WB_STATE is
            when IDLE =>
                if ALU_INIT_I = '1' then
                    NEXT_EXEC_WB_STATE <= EXECUTE;
                else
                    NEXT_EXEC_WB_STATE <= IDLE;
                end if;
            when EXECUTE =>
                if ALU_REQ = '1' then
                    case OP_WB_I is
                        when ABCD | SBCD | ADDX | SUBX | PACK | UNPK =>
                            if BIW_0_WB(3) = '0' then -- Register to register.
                                NEXT_EXEC_WB_STATE <= WRITEBACK;
                            else -- Memory to memory.
                                NEXT_EXEC_WB_STATE <= WRITE_DEST;
                            end if;
                        when ADD | SUB | AND_B | OR_B =>
                            if BIW_0_WB(8) = '0' then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Destination is register.
                            else
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Destination is in memory.
                            end if;
                        when ADDA | SUBA | ANDI_TO_SR | BFEXTS | BFEXTU | BFFFO | DIVS | DIVU | EORI_TO_SR | EXG | EXT | EXTB | 
                             LEA | MOVE_TO_CCR | MOVE_TO_SR | MOVE_USP | MOVEA | MOVEC | MOVEQ | MULS | MULU | ORI_TO_SR | STOP | SWAP | UNLK =>
                            NEXT_EXEC_WB_STATE <= WRITEBACK;
                        when ADDI | ADDQ | ANDI | BCHG | BCLR | BFCHG | BFCLR | BFINS | BFSET | BSET | CLR | EOR | EORI |
                                     MOVE_FROM_CCR | MOVE_FROM_SR | NBCD | NEG | NEGX | NOT_B | ORI | Scc | SUBI | SUBQ | TAS =>
                            if BIW_0_WB(5 downto 3) = "000" then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Destination is a data register.
                            elsif BIW_0_WB(5 downto 3) = "001" then -- Valid for ADDQ and SUBQ.
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Destination is an address register.
                            else
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Destination is in memory.
                            end if;
                        when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
                            if BIW_0_WB(7 downto 6) /= "11" then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Register shifts.
                            else
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Memory shifts.
                            end if;
                        when CAS =>
                            if ALU_COND = false then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Update Dc.
                            else
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Update destination.
                            end if;
                        when CAS2 =>
                            if FETCH_STATE = FETCH_OPERAND then
                                NEXT_EXEC_WB_STATE <= IDLE; -- Second read access.
                            elsif ALU_COND = false then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Update Dc.
                            else
                                NEXT_EXEC_WB_STATE <= ADR_PIPELINE; -- Update destination.
                            end if;
                        when DBcc =>
                            if ALU_COND = true then
                                NEXT_EXEC_WB_STATE <= IDLE;
                            else
                                NEXT_EXEC_WB_STATE <= WRITEBACK;
                            end if;
                        when MOVE =>
                            if BIW_0_WB(8 downto 6) = "000" then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Destination is register.
                            elsif PHASE2 = false then
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Destination is in memory.
                            else
                                NEXT_EXEC_WB_STATE <= EXECUTE; -- Wait for PHASE2 address calculation.
                            end if;
                        when BSR | JSR | LINK | PEA =>
                            NEXT_EXEC_WB_STATE <= WRITE_DEST;
                        when MOVEM =>
                            if OP_WB_I = MOVEM and MOVEM_INH_WR = true then
                                NEXT_EXEC_WB_STATE <= IDLE; -- Discard the write cycle.
                            elsif BIW_0_WB(10) = '1' then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Destination is register.
                            else
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Destination is in memory.
                            end if;
                        when MOVEP =>
                            if BIW_0_WB(7 downto 6) < "10" then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Memory to register.
                            else
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Register to memory.
                            end if;
                        when MOVES =>
                            if BIW_1_WB(11) = '0' then
                                NEXT_EXEC_WB_STATE <= WRITEBACK; -- Destination is register.
                            else
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Destination is in memory.
                            end if;
                        -- Default is for:
                        -- ANDI_TO_CCR, Bcc, BFTST, BTST, CHK, CHK2, 
                        -- CMP, CMP2, CMPA, CMPI, CMPM, EORI_TO_CCR,
                        -- ORI_TO_CCR, RTR, TRAPV, TST.
                        when others =>
                            NEXT_EXEC_WB_STATE <= IDLE;
                    end case;
                else
                    NEXT_EXEC_WB_STATE <= EXECUTE;
                end if;
            when ADR_PIPELINE => -- Effective address calculation takes one clock cycle.
                NEXT_EXEC_WB_STATE <= WRITE_DEST;
            when WRITEBACK =>
                case OP_WB_I is
                    when CAS2 =>
                        if PHASE2 = false then
                            NEXT_EXEC_WB_STATE <= WRITEBACK;  -- Update Dc2
                        else
                            NEXT_EXEC_WB_STATE <= IDLE;
                        end if;
                    when others =>
                        NEXT_EXEC_WB_STATE <= IDLE;
                    end case;
            when WRITE_DEST =>
                if WR_RDY = '1' then
                    case OP_WB_I is
                        when BFCHG | BFCLR | BFINS | BFSET =>
                            if BF_BYTES <= 4 then
                                NEXT_EXEC_WB_STATE <= IDLE;
                            else
                                NEXT_EXEC_WB_STATE <= ADR_PIPELINE;
                            end if;
                        when CAS2 =>
                            if PHASE2 = false then
                                NEXT_EXEC_WB_STATE <= WRITE_DEST; -- Update destination 2.
                            else
                                NEXT_EXEC_WB_STATE <= IDLE;
                            end if;
                        when others => NEXT_EXEC_WB_STATE <= IDLE;
                    end case;
                else
                    NEXT_EXEC_WB_STATE <= WRITE_DEST;
                end if;
        end case;
    end process EXEC_WB_DEC;
end BEHAVIOUR;
