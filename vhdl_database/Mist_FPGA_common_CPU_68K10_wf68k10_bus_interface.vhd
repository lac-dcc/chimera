------------------------------------------------------------------------
----                                                                ----
---- WF68K10 IP Core: this is the bus interface.                    ----
----                                                                ----
---- Description:                                                   ----
---- This module is a 68010 compatible bus controller featuring     ----
---- all of the 68010 bus interface functionality.                  ----
----                                                                ----
---- Bus cycle operation:                                           ----
---- A bus cycle is invoked by either asserting RD_REQ, WR_REQ or   ----
---- OPCODE_REQ. Data is provided after the respective bus cycle    ----
---- has finished. The RD_REQ, WR_REQ or OPCODE_REQ signals should  ----
---- stay asserted until the respective _RDY signal from the bus    ----
---- controller indicates, that the data is available. These _RDY   ----
---- signals are strobes. If more than one read or write request    ----
---- are asserted the same time, RD_REQ is prioritized over WR_REQ  ----
---- and OPCODE_REQ has lowest priority. For more information of    ----
---- the signal functionality of the bus controller entity see also ----
---- the comments below.                                            ----
----                                                                ----
---- Remarks:                                                       ----
----                                                                ----
---- Bus arbitration topics:                                        ----
---- Additionally to the single wire and the three wire bus arbi-   ----
---- tration as described in the 68030 hardware manual, the bus     ----
---- controller  also features the two wire arbitration as des-     ----
---- cribed in the documentation of the 68020 processor.            ----
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
--   Fixed a bug in the DATA_PORT_OUT multiplexer. Thanks to Gary Bingham for the support.
--   Fixed a bug in the DATA_INMUX multiplexer. Thanks to Gary Bingham for the support.
-- Revision 2K18A 20180620 WF
--   RESET is now 124 instead of 512 clock cycles.
--   Adjusted the SSW to 68K10.
--   Removed RERUN_RMC.
--   Suppress bus faults during RESET instruction.
--   Optimized ASn and DSn timing for synchronous RAM.
--   DATA_PORT_EN timing optimization.
--   BUS_EN is now active except during arbitration.
--   Rearanged the DATA_RDY vs. BUS_FLT logic.
--   Opted out START_READ and CHK_RD.
--   UDSn and LDSn are now always enabled for opcode cycles (bugfix).
--   Fixed the faulty bus arbitration logic.
--   Rearranged address error handling.
-- Revision 2K20A 20200620 WF
--   ASn and DSn are not asserted in S0 any more.
--   Some modifications to optimize the RETRY logic.
--

library work;
use work.WF68K10_PKG.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity WF68K10_BUS_INTERFACE is
    port (
        -- System control:
        CLK                 : in std_logic; -- System clock.

        -- Adress bus:
        ADR_IN_P            : in std_logic_vector(31 downto 0); -- Logical address line inputs.
        ADR_OUT_P           : out std_logic_vector(31 downto 0); -- Address line outputs.

        -- Function code relevant stuff:
        FC_IN               : in std_logic_vector(2 downto 0); -- Function codes.
        FC_OUT              : out std_logic_vector(2 downto 0); -- Physical function codes (top level entity).

        -- Data bus:
        DATA_PORT_IN        : in std_logic_vector(15 downto 0); -- Data bus input lines (top level entity).
        DATA_PORT_OUT       : out std_logic_vector(15 downto 0); -- Data bus output lines (top level entity).
        DATA_FROM_CORE      : in std_logic_vector(31 downto 0); -- Internal bus input lines.
        DATA_TO_CORE        : out std_logic_vector(31 downto 0); -- Internal data bus output lines.
        OPCODE_TO_CORE      : out std_logic_vector(15 downto 0); -- Internal instruction bus output lines.

        -- Tri state controls:
        DATA_PORT_EN        : out std_logic; -- For the data bus.
        BUS_EN              : out std_logic; -- For all other bus control signals.

        
        -- Operation size:
        OP_SIZE             : in OP_SIZETYPE; -- Used for bus access control.

        -- Control signals:
        RD_REQ              : in bit; -- Read data.
        WR_REQ              : in bit; -- Write data.
        DATA_RDY            : out bit; -- Indicates 'new data available' (this is a strobe).
        DATA_VALID          : out std_logic; -- The data buffer contains valid data when '1'.
        OPCODE_REQ          : in bit; -- Read opcode.
        OPCODE_RDY          : out bit; -- Indicates 'new opcode available' (this is a strobe).
        OPCODE_VALID        : out std_logic; -- The opcode buffer contains valid data when '1'.
        RMC                 : in bit; -- Indicates a read modify write operation.
        BUSY_EXH            : in bit;
        INBUFFER            : out std_logic_vector(31 downto 0); -- Used by the exception handler for stack frame type B.
        OUTBUFFER           : out std_logic_vector(31 downto 0); -- Used by the exception handler for stack frame types A and B.
        SSW                 : out std_logic_vector(15 downto 0);

        -- Asynchronous bus control signals:
        DTACKn              : in std_logic; -- Asynchronous bus cycle termination (top level entity).
        ASn                 : out std_logic; -- Adress select (top level entity).
        UDSn                : out std_logic; -- Data select (top level entity).
        LDSn                : out std_logic; -- Data select (top level entity).
        RWn                 : out std_logic; -- Hi is read, low = write (top level entity).
        RMCn                : out std_logic; -- Read modify write indicator (top level entity).
        DBENn               : out std_logic; -- Data buffer enable (top level entity).

        -- Synchronous peripheral control:
        E                   : out std_logic;
        VMAn                : out std_logic;
        VMA_EN              : out std_logic;
        VPAn                : in std_logic;

        -- Bus arbitration:
        BRn                 : in std_logic; -- Bus request (top level entity).
        BGACKn              : in std_logic; -- Bus grant acknowledge (top level entity).
        BGn                 : out std_logic; -- Bus grant (top level entity).

        -- Exception signals:
        RESET_IN            : in std_logic; -- System's reset input (top level entity).
        RESET_STRB          : in bit; -- From Core: force external reset.
        RESET_OUT           : out std_logic; -- System's reset output open drain enable.
        RESET_CPU           : out bit; -- Internal reset used for CPU initialization.
        AVECn               : in std_logic; -- Auto interrupt vector input (top level entity).
        HALTn               : in std_logic; -- Halt (top level entity).
        BERRn               : in std_logic; -- Bus error (top level entity).
        AERR                : out bit; -- Core internal address error.

        BUS_BSY             : out bit -- Bus is busy when '1'.
    );
end entity WF68K10_BUS_INTERFACE;
    
architecture BEHAVIOR of WF68K10_BUS_INTERFACE is
type BUS_CTRL_STATES is (IDLE, START_CYCLE, DATA_C1C4);
type ARB_STATES is(IDLE, GRANT, WAIT_RELEASE_3WIRE);
type TIME_SLICES is (IDLE, S0, S1, S2, S3, S4, S5);
signal ADR_OFFSET           : std_logic_vector(5 downto 0);
signal ADR_OUT_I            : std_logic_vector(31 downto 0);
signal AERR_I               : bit;
signal ARB_STATE            : ARB_STATES := IDLE;
signal AVEC_In              : std_logic;
signal BGACK_In             : std_logic;
signal BR_In                : std_logic;
signal BUS_CTRL_STATE       : BUS_CTRL_STATES;
signal BUS_CYC_RDY          : bit;
signal BUS_FLT              : std_logic;
signal DATA_INMUX           : std_logic_vector(31 downto 0);
signal DATA_RDY_I           : bit;
signal DBUFFER              : std_logic_vector(31 downto 0);
signal DSn                  : std_logic;
signal DTACK_In             : std_logic;
signal HALT_In              : std_logic;
signal HALTED               : bit;
signal NEXT_ARB_STATE       : ARB_STATES;
signal NEXT_BUS_CTRL_STATE  : BUS_CTRL_STATES;
signal OBUFFER              : std_logic_vector(15 downto 0);
signal OPCODE_ACCESS        : bit;
signal OPCODE_RDY_I         : bit;
signal READ_ACCESS          : bit;
signal RESET_CPU_I          : bit;
signal RESET_OUT_I          : std_logic;
signal RETRY                : bit;
signal RW_In                : std_logic;
signal SIZE_D               : std_logic_vector(1 downto 0);
signal SIZE_I               : std_logic_vector(1 downto 0);
signal SIZE_N               : std_logic_vector(2 downto 0) := "000";
signal SLICE_CNT_N          : std_logic_vector(2 downto 0);
signal SLICE_CNT_P          : std_logic_vector(2 downto 0);
signal SYNCn                : bit;
signal T_SLICE              : TIME_SLICES;
signal VMA_In               : std_logic;
signal WAITSTATES           : bit;
signal WP_BUFFER            : std_logic_vector(31 downto 0);
signal WRITE_ACCESS         : bit;
begin
    P_SYNC: process(CLK)
    -- These flip flops synchronize external signals on the negative clock edge. This
    -- meets the requirement of sampling these signals in the end of S2 for asynchronous
    -- bus access. Be aware, that we have to buffer the RETRY signal to prevent the bus
    -- controller of spurious or timing critical BERRn and/or HALTn signals. The logic
    -- for BUS_FLT and RETRY is coded in a way that we have a bus error or a retry
    -- condition but not both at the same time.    
    -- Note: there is no need to synchronize the already synchronous bus control signals
    variable BERR_VARn      : std_logic;
    variable HALT_VARn      : std_logic;
    begin
        if CLK = '0' and CLK' event then
            DTACK_In <= DTACKn;
            BR_In <= BRn;
            BGACK_In <= BGACKn;
            AVEC_In <= AVECn;
            HALT_VARn := HALTn;
            BERR_VARn := BERRn;
        end if;
        --
        if CLK = '1' and CLK' event then
            if BUS_CTRL_STATE = START_CYCLE then
                AERR <= AERR_I; -- AERR_I is valid in this state.
            else
                AERR <= '0';
            end if;
            --
            HALT_In <= HALTn or HALT_VARn;
            --
            if BUS_CTRL_STATE = DATA_C1C4 then
                if (BERRn nand BERR_VARn) = '1' and (HALTn or HALT_VARn) = '0' and SIZE_N /= "000" then
                    RETRY <= '1';
                elsif T_SLICE = IDLE and (BERRn = '1' and HALTn = '1' and BERR_VARn = '1' and HALT_VARn = '1') then
                    RETRY <= '0';
                elsif RETRY = '0' then
					BUS_FLT <= (BERRn nor BERR_VARn) and HALT_VARn and HALTn;
                end if;
            else
                BUS_FLT <= '0';
                RETRY <= '0';
            end if;
        end if;
    end process P_SYNC;

    ACCESSTYPE: process
    -- This logic stores the execution unit control
    -- signals during the current bus access. This is
    -- important for the bus control signals to be
    -- stable during the complete bus access.
    begin
        wait until CLK = '1' and CLK' event;
        if BUS_CTRL_STATE = START_CYCLE then
            if READ_ACCESS = '1' or WRITE_ACCESS = '1' or OPCODE_ACCESS = '1' then
                null; -- Do not start either new cycle.
            elsif RD_REQ = '1' then
                READ_ACCESS <= '1';
            elsif WR_REQ = '1' then
                WRITE_ACCESS <= '1';
            elsif OPCODE_REQ = '1' then
                OPCODE_ACCESS <= '1';
            end if;
        elsif AERR_I = '1' or (BUS_CTRL_STATE = DATA_C1C4 and NEXT_BUS_CTRL_STATE = IDLE) then
            READ_ACCESS <= '0';
            WRITE_ACCESS <= '0';
            OPCODE_ACCESS <= '0';
        end if;
    end process ACCESSTYPE;

    P_DF: process
    -- This is the logic which provides the fault flags for data cycles and
    -- input and output buffer information.
    variable SIZEVAR : std_logic_vector(1 downto 0) := "00";
    begin
        wait until CLK = '1' and CLK' event;
        if BUSY_EXH = '0' then -- Do not alter during exception processing.
            case OP_SIZE is
                when LONG => SIZEVAR := "10";
                when WORD => SIZEVAR := "01";
                when BYTE => SIZEVAR := "00";
            end case;
            --
            if BUS_CTRL_STATE = START_CYCLE and NEXT_BUS_CTRL_STATE = DATA_C1C4 then
                SSW <= To_StdLogicVector (RMC & '0' & OPCODE_REQ & RD_REQ & RMC) & SIZEVAR & RW_In & "00000" & FC_IN;
            end if;
            
            OUTBUFFER <= WP_BUFFER; -- Used for exception stack frame type A and B.
            INBUFFER <= DATA_INMUX; -- Used for exception stack frame type B.
        end if;
    end process P_DF;
    
    WRITEBACK_INFO: process
    -- This registers stor writeback relevant information.
    begin
        wait until CLK = '1' and CLK' event;
        if BUS_CTRL_STATE = IDLE and NEXT_BUS_CTRL_STATE = START_CYCLE then -- Freeze during a bus cycle.
            WP_BUFFER <= DATA_FROM_CORE;
        end if;
    end process WRITEBACK_INFO;

    BUS_BSY <= '1' when BUS_CTRL_STATE /= IDLE else '0';

    PARTITIONING: process
    -- This logic gives information about the remaining bus cycles The initial 
    -- size is sampled right before the bus acces. This requires the RD_REQ
    -- and WR_REQ signals to work on the positive clock edge.
    variable RESTORE_VAR : std_logic_vector(2 downto 0) := "000";
    begin
        wait until CLK = '1' and CLK' event;

        if BUS_CTRL_STATE = DATA_C1C4 and T_SLICE = S1 then -- On positive clock edge.
            RESTORE_VAR := SIZE_N; -- We need this initial value for early RETRY.
        end if;
        --
        if RESET_CPU_I = '1' then
            SIZE_N <= "000";
        elsif BUS_CTRL_STATE /= DATA_C1C4 and NEXT_BUS_CTRL_STATE = DATA_C1C4 then
            if RD_REQ = '1' or WR_REQ = '1' then
                case OP_SIZE is
                    when LONG => SIZE_N <= "100";
                    when WORD => SIZE_N <= "010";
                    when BYTE => SIZE_N <= "001";
                end case;
            else -- OPCODE_ACCESS.
                SIZE_N <= "010"; -- WORD.
            end if;
        end if;
        
        -- Decrementing the size information:
        -- In this logic all permutations are considered. This allows a dynamically changing bus size.
        if RETRY = '1' then
            SIZE_N <= RESTORE_VAR;
        elsif BUS_CTRL_STATE = DATA_C1C4 and T_SLICE = S3 and WAITSTATES = '0' then -- On positive clock edge.
            if ADR_OUT_I(1 downto 0) = "11" then
                SIZE_N <= SIZE_N - '1';
            elsif ADR_OUT_I(1 downto 0) = "01" then
                SIZE_N <= SIZE_N - '1';
            elsif SIZE_N = "001" then
               SIZE_N <= SIZE_N - '1';
            else
                SIZE_N <= SIZE_N - "10";
            end if;
        end if;
        --
        if (BUS_FLT = '1' and HALT_In = '1') then -- Abort bus cycle.
            SIZE_N <= "000";
        end if;        
    end process PARTITIONING;

    SIZE_I <= SIZE_N(1 downto 0) when T_SLICE = S0 or T_SLICE = S1 else SIZE_D;
    
    P_DELAY: process
    -- This delay is responsible for a correct SIZE_I information. Use this, if the
    -- process PARTITIONING works on the positive clock edge. The SIZE_I information
    -- is delayed by half a clock cycle to be valid just in time of sampling the INMUX.
    begin
        wait until CLK = '1' and CLK' event;
        SIZE_D <= SIZE_N(1 downto 0);
    end process P_DELAY;

    BUS_STATE_REG: process
    -- This is the bus controller's state register.
    begin
        wait until CLK = '1' and CLK' event;
        BUS_CTRL_STATE <= NEXT_BUS_CTRL_STATE;
    end process BUS_STATE_REG;

    BUS_CTRL_DEC: process(ADR_IN_P, ADR_OUT_I, AERR_I, ARB_STATE, BGACK_In, BR_In, BUS_CTRL_STATE, BUS_CYC_RDY, 
                          BUS_FLT, HALT_In, OPCODE_REQ, RD_REQ, RESET_CPU_I, RMC, SIZE_N, WR_REQ)
    -- This is the bus controller's state machine decoder.  A SIZE_N count of "000" means that all bytes
    -- to be transfered. After a bus transfer a value of x"0" indicates that no further bytes are required
    -- for a bus transfer.
    begin
        case BUS_CTRL_STATE is
            when IDLE =>
                if RESET_CPU_I = '1' then
                    NEXT_BUS_CTRL_STATE <= IDLE;  -- Reset condition (bus cycle terminated).
                elsif HALT_In = '0' then
                    NEXT_BUS_CTRL_STATE <= IDLE;  -- This is the 'HALT' condition.
                elsif (BR_In = '0' and RMC = '0') or ARB_STATE /= IDLE or BGACK_In = '0' then
                    NEXT_BUS_CTRL_STATE <= IDLE;  -- Arbitration, wait!
                elsif RD_REQ = '1' then
                    NEXT_BUS_CTRL_STATE <= START_CYCLE; -- Read cycle.
                elsif WR_REQ = '1' then
                    NEXT_BUS_CTRL_STATE <= START_CYCLE; -- Write cycle.
                elsif OPCODE_REQ = '1' then
                    NEXT_BUS_CTRL_STATE <= START_CYCLE; -- Opcode cycle.
                else
                    NEXT_BUS_CTRL_STATE <= IDLE;
                end if;
            when START_CYCLE =>
                if (RD_REQ = '1' or WR_REQ = '1') and AERR_I = '1' then
                    NEXT_BUS_CTRL_STATE <= IDLE;
                elsif RD_REQ = '1' then
                    NEXT_BUS_CTRL_STATE <= DATA_C1C4;
                elsif WR_REQ = '1' then
                    NEXT_BUS_CTRL_STATE <= DATA_C1C4;
                elsif OPCODE_REQ = '1' and ADR_IN_P(0) = '1' then
                    NEXT_BUS_CTRL_STATE <= IDLE; -- Abort due to address error.
                elsif OPCODE_REQ = '1' then
                    NEXT_BUS_CTRL_STATE <= DATA_C1C4;
                else
                    NEXT_BUS_CTRL_STATE <= IDLE;
                end if;
            when DATA_C1C4 =>
                if BUS_CYC_RDY = '1' and SIZE_N = "000" then
                    NEXT_BUS_CTRL_STATE <= IDLE;
                else
                    NEXT_BUS_CTRL_STATE <= DATA_C1C4;
                end if;
        end case;
    end process BUS_CTRL_DEC;

    P_ADR_OFFS: process
    -- This process provides a temporary address offset.
    variable OFFSET_VAR     : std_logic_vector(2 downto 0) := "000";
    begin
        wait until CLK = '1' and CLK' event;
        if RESET_CPU_I = '1' then
            OFFSET_VAR := "000";
        elsif T_SLICE = S3 then
            case ADR_OUT_I(1 downto 0) is
                when "01" | "11" => OFFSET_VAR := "001";
                when others => OFFSET_VAR := "010";
            end case;
        end if;
        --
        if RESET_CPU_I = '1' then
            ADR_OFFSET <= (others => '0');
        elsif RETRY = '1' then
            null; -- Do not update if there is a retry cycle.
        elsif BUS_CTRL_STATE /= IDLE and NEXT_BUS_CTRL_STATE = IDLE then
            ADR_OFFSET <= (others => '0');
        elsif BUS_CYC_RDY = '1' then
            ADR_OFFSET <= ADR_OFFSET + OFFSET_VAR; 
        end if;
    end process P_ADR_OFFS;

    ADR_OUT_I <= ADR_IN_P + ADR_OFFSET;
    ADR_OUT_P <= ADR_OUT_I;

    FC_OUT <= FC_IN;

    -- Address and bus errors:
    AERR_I <= '1' when BUS_CTRL_STATE = START_CYCLE and OPCODE_REQ = '1' and RD_REQ = '0' and WR_REQ = '0' and ADR_IN_P(0) = '1' else
              '1' when BUS_CTRL_STATE = START_CYCLE and OP_SIZE = LONG and ADR_IN_P(0) = '1' else
              '1' when BUS_CTRL_STATE = START_CYCLE and OP_SIZE = WORD and ADR_IN_P(0) = '1' else '0';


    DATA_PORT_OUT <= WP_BUFFER(31 downto 16) when SIZE_I = "00" else 
                     WP_BUFFER(15 downto 0) when SIZE_I = "10" else
                     WP_BUFFER(7 downto 0) & WP_BUFFER(7 downto 0);

    IN_MUX: process
    -- This is the input multiplexer which can handle up to four bytes.
    begin
        wait until CLK = '0' and CLK' event;
        --
        if T_SLICE = S4 then
            case SIZE_I is
                when "00" =>            
                    DATA_INMUX(31 downto 16) <= DATA_PORT_IN;
                when "10" => -- Word.
                    DATA_INMUX(15 downto 0) <= DATA_PORT_IN;
                when others => -- Byte.
                    case ADR_OUT_I(0) is
                        when '0' => DATA_INMUX(7 downto 0) <= DATA_PORT_IN(15 downto 8);
                        when others => DATA_INMUX(7 downto 0) <= DATA_PORT_IN(7 downto 0);
                    end case;
            end case;
        end if;
    end process IN_MUX;

    VALIDATION: process
    -- These flip flops detect a fault during the read operation over one or
    -- several bytes or during the write operation.
    begin
        wait until CLK = '1' and CLK' event;
        --
        if RESET_CPU_I = '1' then
            OPCODE_VALID <= '1';
        elsif OPCODE_ACCESS = '1' and BUS_CTRL_STATE = DATA_C1C4 and BUS_FLT = '1' then
            OPCODE_VALID <= '0';
        elsif OPCODE_RDY_I = '1' then
            OPCODE_VALID <= '1'; -- Reset after use, TRAP_BERR is asserted during DATA_RDY.
        end if;
        --
        if RESET_CPU_I = '1' then
            DATA_VALID <= '1';
        elsif BUS_CTRL_STATE = DATA_C1C4 and BUS_FLT = '1' then
            DATA_VALID <= '0';
        elsif DATA_RDY_I = '1' then
            DATA_VALID <= '1'; -- Reset after use, TRAP_BERR is asserted during DATA_RDY.
        end if;
    end process VALIDATION;

    PREFETCH_BUFFERS: process
    -- These are the data and the operation code input registers. After a last read to the registered
    -- input multiplexer, the respective data is copied from the input multiplexer to these buffers.
    -- The opcode buffer is always written with 32 bit data. The data buffers may contain invalid bytes
    -- in case of word or byte data size.
    variable DBUFFER_MEM    : std_logic_vector(31 downto 8) := x"000000";
    variable RDY_VAR        : bit := '0';
    begin
        wait until CLK = '1' and CLK' event;
        --
        OPCODE_RDY_I <= '0'; -- This is a strobe.
        DATA_RDY_I <= '0'; -- This is a strobe.
        --
        -- The following variable is responsible, that the _RDY signals are
        -- always strobes.
        if DATA_RDY_I = '1' or OPCODE_RDY_I = '1' then
            RDY_VAR := '0';
        elsif BUS_CTRL_STATE = START_CYCLE then
            RDY_VAR := '1';
        end if;
        -- Opcode cycle:
        if AERR_I = '1' then
            OPCODE_RDY_I <= '1';
        elsif OPCODE_ACCESS = '1' and BUS_CTRL_STATE = DATA_C1C4 and BUS_CYC_RDY = '1' and SIZE_N = "000" then
            -- Instruction prefetches are always long and on word boundaries.
            -- The word is available after the first word read.
            OBUFFER <= DATA_INMUX(15 downto 0);
            OPCODE_RDY_I <= RDY_VAR;
        end if;
        -- Data cycle:
        if AERR_I = '1' then
            DATA_RDY_I <= '1';
        elsif WRITE_ACCESS = '1' and BUS_CTRL_STATE = DATA_C1C4 and BUS_CYC_RDY = '1' and SIZE_N = "000" then
            DATA_RDY_I <= RDY_VAR;
        elsif READ_ACCESS = '1' and BUS_CTRL_STATE = DATA_C1C4 and BUS_CYC_RDY = '1' then
            case OP_SIZE is
                when LONG =>
                    if SIZE_N = "000" then
                        DBUFFER <= DATA_INMUX;
                        DATA_RDY_I <= RDY_VAR;
                    end if;
                when WORD =>
                    if SIZE_N = "000" then
                        DBUFFER <= x"0000" & DATA_INMUX(15 downto 0);
                        DATA_RDY_I <= RDY_VAR;
                    end if;
                when BYTE => -- Byte always aligned.
                    DATA_RDY_I <= RDY_VAR;
                    DBUFFER <= x"000000" & DATA_INMUX(7 downto 0);
            end case;
        end if;
    end process PREFETCH_BUFFERS;

    DATA_RDY <= DATA_RDY_I;
    OPCODE_RDY <= OPCODE_RDY_I;

    DATA_TO_CORE <= DBUFFER;
    OPCODE_TO_CORE <= OBUFFER;

    WAITSTATES <= '0' when T_SLICE /= S3 else
                  '1' when RESET_OUT_I = '1' else -- No bus fault during RESET instruction.
                  '0' when SYNCn = '0' else -- For synchronous bus cycles.
                  '0' when DTACK_In = '0' else -- For asynchronous bus cycles.
                  '0' when ADR_IN_P(19 downto 16) = x"F" and AVEC_In = '0' else -- Interrupt acknowledge space cycle.
                  '0' when BUS_FLT = '1' else -- In case of a bus error;
                  '0' when RESET_CPU_I = '1' else '1'; -- A CPU reset terminates the current bus cycle.

    SLICES: process(CLK)
    -- This process provides the central timing for the read, write and read modify write cycle as also
    -- for the bus arbitration procedure. Be aware, that the bus controller state machine changes it's
    -- state on the positive clock edge. The BUS_CYC_RDY signal is asserted during S3 or S5. So the 
    -- slice counter working on the positive clock edge may change it's state.
    begin
        if CLK = '1' and CLK' event then
            if BUS_CTRL_STATE = IDLE then
                SLICE_CNT_P <= "111"; -- Init.
            elsif RETRY = '1' then
                SLICE_CNT_P <= "111"; -- Stay in IDLE, go to IDLE.
            elsif BUS_CTRL_STATE /= IDLE and NEXT_BUS_CTRL_STATE = IDLE then
                SLICE_CNT_P <= "111"; -- Init.
            elsif SLICE_CNT_P = "010" then
                if RETRY = '1' then
                    SLICE_CNT_P <= "111"; -- Go IDLE.
                elsif BUS_CTRL_STATE = DATA_C1C4 and NEXT_BUS_CTRL_STATE = IDLE then
                    SLICE_CNT_P <= "111"; -- Ready.
                else
                    SLICE_CNT_P <= "000"; -- Go on.
                end if;
            elsif WAITSTATES = '0' then
                SLICE_CNT_P <= SLICE_CNT_P + '1'; -- Cycle active.
            end if;
        end if;
        --
        if CLK = '0' and CLK' event then
            SLICE_CNT_N <= SLICE_CNT_P; -- Follow the P counter.
        end if;
    end process SLICES;

    T_SLICE <=  S0 when SLICE_CNT_P = "000" and SLICE_CNT_N = "111" else
                S1 when SLICE_CNT_P = "000" and SLICE_CNT_N = "000" else 
                S2 when SLICE_CNT_P = "001" and SLICE_CNT_N = "000" else
                S3 when SLICE_CNT_P = "001" and SLICE_CNT_N = "001" else
                S4 when SLICE_CNT_P = "010" and SLICE_CNT_N = "001" else
                S5 when SLICE_CNT_P = "010" and SLICE_CNT_N = "010" else
                S0 when SLICE_CNT_P = "000" and SLICE_CNT_N = "010" else IDLE; -- Rollover from state S5 to S0.

    -- Bus control signals:
    RWn <= RW_In;
    RW_In <= '0' when WRITE_ACCESS = '1' and BUS_CTRL_STATE = DATA_C1C4 else '1';
    RMCn <= '0' when RMC = '1' else '1';
    ASn <= '0' when T_SLICE = S1 or T_SLICE = S2 or T_SLICE = S3 or T_SLICE = S4 else '1';

    UDSn <= '1' when OPCODE_ACCESS = '0' and OP_SIZE = BYTE and ADR_OUT_I(0) = '1' else DSn;
    LDSn <= '1' when OPCODE_ACCESS = '0' and OP_SIZE = BYTE and ADR_OUT_I(0) = '0' else DSn;
    DSn <= '0' when (T_SLICE = S3 or T_SLICE = S4 or T_SLICE = S5) and WRITE_ACCESS = '1' else -- Write.
           '0' when T_SLICE = S1 or T_SLICE = S2 or T_SLICE = S3 or T_SLICE = S4 else '1'; -- Read.

    DBENn <= '0' when (T_SLICE = S1 or T_SLICE = S2 or T_SLICE = S3 or T_SLICE = S4 or T_SLICE = S5) and WRITE_ACCESS = '1' else -- Write.
             '0' when T_SLICE = S2 or T_SLICE = S3 or T_SLICE = S4 else '1'; -- Read.

    -- Bus tri state controls:
    BUS_EN <= '1' when ARB_STATE = IDLE and RESET_CPU_I = '0' else '0';
    DATA_PORT_EN <= '1' when WRITE_ACCESS = '1' and ARB_STATE = IDLE and RESET_CPU_I = '0' else '0';

    -- Progress controls:
    BUS_CYC_RDY <= '0' when RETRY = '1' else
                   '1' when T_SLICE = S5 else '0'; -- Asynchronous cycles.

    -- Bus arbitration:
    ARB_REG: process
    -- This is the arbiters state register.
    begin
        wait until CLK = '1' and CLK' event;
        --
        if RESET_CPU_I = '1' then
            ARB_STATE <= IDLE;
        else
            ARB_STATE <= NEXT_ARB_STATE;
        end if;
    end process ARB_REG;
    
    ARB_DEC: process(ARB_STATE, BGACK_In, BR_In, BUS_CTRL_STATE, RETRY, RMC)
    -- This is the bus arbitration state machine's decoder. It can handle single-, two- 
    -- or three wire arbitration. The two wire arbitration is done in the GRANT state
    -- by negating BRn.
    begin
        case ARB_STATE is
            when IDLE =>
                if RMC = '1' and RETRY = '0' then
                    NEXT_ARB_STATE <= IDLE; -- Arbitration in RETRY operation is possible.
                elsif BGACK_In = '0' and BUS_CTRL_STATE = IDLE then -- This is the single wire arbitration.
                    NEXT_ARB_STATE <= WAIT_RELEASE_3WIRE;
                elsif BR_In = '0' and BUS_CTRL_STATE = IDLE then -- Wait until the bus is free.
                    NEXT_ARB_STATE <= GRANT;
                else
                    NEXT_ARB_STATE <= IDLE;
                end if;
            when GRANT =>
                if BGACK_In = '0' then
                    NEXT_ARB_STATE <= WAIT_RELEASE_3WIRE;
                elsif BR_In = '1' then
                    NEXT_ARB_STATE <= IDLE; -- Resume normal operation.
                else
                    NEXT_ARB_STATE <= GRANT;
                end if;
            when WAIT_RELEASE_3WIRE =>
                if BGACK_In = '1' and BR_In = '0' then
                    NEXT_ARB_STATE <= GRANT; -- Re-enter new arbitration.
                elsif BGACK_In = '1' then
                    NEXT_ARB_STATE <= IDLE;
                else
                    NEXT_ARB_STATE <= WAIT_RELEASE_3WIRE;
                end if;
        end case;
    end process ARB_DEC;

    BGn <=  '0' when ARB_STATE = GRANT else '1';

    -- RESET logic:
    RESET_FILTER: process
    -- This process filters the incoming reset pin.
    -- If RESET_IN and HALT_In are asserted together for longer
    -- than 10 clock cycles over the execution of a CPU reset
    -- command, the CPU reset is released.
    variable STARTUP    : boolean := false;
    variable TMP        : std_logic_vector(3 downto 0) := x"0";
    begin
        wait until CLK = '1' and CLK' event;
        --
        if RESET_IN = '1' and HALT_In = '0' and RESET_OUT_I = '0' and TMP < x"F" then
            TMP := TMP + '1';
        elsif RESET_IN = '0' or HALT_In = '1' or RESET_OUT_I = '1' then
            TMP := x"0";
        end if;
        if TMP > x"A" then
            RESET_CPU_I <= '1'; -- Release internal reset.
            STARTUP := true;
        elsif STARTUP = false then
            RESET_CPU_I <= '1';
        else
            RESET_CPU_I <= '0';
        end if;
    end process RESET_FILTER;

    RESET_TIMER: process
    -- This logic is responsible for the assertion of the
    -- reset output for 124 clock cycles, during the reset
    -- command. The LOCK variable avoids re-initialisation
    -- of the counter in the case that the RESET_EN is no
    -- strobe.
    variable TMP : std_logic_vector(6 downto 0) := "0000000";
    begin
        wait until CLK = '1' and CLK' event;
        --
        if RESET_STRB = '1' or TMP > "0000000" then
            RESET_OUT_I <= '1';
        else
            RESET_OUT_I <= '0';
        end if;
        --
        if RESET_STRB = '1' then
            TMP := "1111011"; -- 124 initial value.
        elsif TMP > "0000000" then
            TMP := TMP - '1';
        end if;
    end process RESET_TIMER;

    RESET_CPU <= RESET_CPU_I;
    RESET_OUT <= RESET_OUT_I;
    
    VMA_EN <= '0' when ARB_STATE /= IDLE or RESET_CPU_I = '1' else '1';
    VMAn <= VMA_In;

    -- Synchronous bus timing:
    E_TIMER: process
    -- The E clock is a free running clock with a period of 10 times
    -- the CLK period. The pulse ratio is 4 CLK high and 6 CLK low.
    -- Use a synchronous reset due to FPGA constraints.
    variable TMP : std_logic_vector(3 downto 0);
    begin
        wait until CLK = '1' and CLK' event;
        if RESET_CPU_I = '1' then
            TMP := x"0";
            VMA_In <= '1';
            SYNCn <= '1';
            E <= '1';
        elsif TMP < x"9" then
            TMP := TMP + '1';
        else
            TMP := x"0";
        end if;
        
        -- E logic:
        if TMP = x"0" then
            E <= '1';
        elsif TMP = x"4" then
            E <= '0';
        end if;

        -- VMA logic:
        if VPAn = '0' and TMP >= x"4" then -- Switch, when E is low.
            VMA_In <= '0';
        elsif VPAn = '1' then
            VMA_In <= '1';
        end if;
        
        -- SYNCn logic (wait states controlling):
        if VPAn = '0' and VMA_In = '0' and TMP = x"2" then -- Adjust E to S6..
            SYNCn <= '0';
        elsif VPAn = '1' then
            SYNCn <= '1';
        end if;
    end process E_TIMER;
end BEHAVIOR;
