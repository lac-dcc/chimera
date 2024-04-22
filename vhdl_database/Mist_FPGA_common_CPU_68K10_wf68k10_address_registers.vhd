------------------------------------------------------------------------
----                                                                ----
---- WF68K10 IP Core: Address register logic.                       ----
----                                                                ----
---- Description:                                                   ----
---- This module provides the address registers, stack pointers,    ----
---- the address arithmetics, the program counter logic and the SFC ----
---- and DFC registers. The address registers are accessible by two ----
---- read and two write ports simultaneously. For more information  ----
---- refer to the MC68030 User' Manual.                             ----
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
--   Minor optimizations.
-- Revision 2K18A 20180620 WF
--   Changed ADR_ATN logic to be valid one clock cycle earlier.
--   Fixed PC restoring during exception processing.
--   Fixed the writing ISP_REG during EXG instruction with two address registers.
--   Fixed writing the stack pointer registers (SBIT_WB is used instead of SBIT).
--   The address registers are always written long.
--   Bugfix: exception handler do not increment and decrement the USP any more.
--   MOVEM-Fix: the effective address in memory to register is stored (STORE_AEFF) not to be overwritten in case the addressing register is also loaded.
-- Revision 2K19A 2019## WF
--   Removed ADR_ATN. We do not need this any more.
--   Fixed the condition if UNMARK and AR_MARK_USED are asserted simultaneously (see process P_IN_USE).
--

use work.WF68K10_PKG.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity WF68K10_ADDRESS_REGISTERS is
    port (
        CLK                 : in std_logic;
        RESET               : in bit;

        -- Address and data:
        AR_IN_1             : in std_logic_vector(31 downto 0);
        AR_IN_2             : in std_logic_vector(31 downto 0);
        AR_OUT_1            : out std_logic_vector(31 downto 0);
        AR_OUT_2            : out std_logic_vector(31 downto 0);
        INDEX_IN            : in std_logic_vector(31 downto 0);
        PC                  : out std_logic_vector(31 downto 0); -- Program counter (or sPC) always word aligned.
        PC_EW_OFFSET        : in std_logic_vector(3 downto 0); -- Offset to the first address extension word.
        STORE_ADR_FORMAT    : in bit;
        STORE_ABS_HI        : in bit;
        STORE_ABS_LO        : in bit;
        STORE_D16           : in bit;
        STORE_DISPL         : in bit;
        STORE_AEFF          : in bit;
        OP_SIZE             : in OP_SIZETYPE;

        ADR_OFFSET          : in std_logic_vector(31 downto 0);
        ADR_MARK_USED       : in bit;
        USE_APAIR           : in boolean;
        ADR_IN_USE          : out bit;

        ADR_MODE            : in std_logic_vector(2 downto 0);
        AMODE_SEL           : in std_logic_vector(2 downto 0);
        ADR_EFF             : out std_logic_vector(31 downto 0); -- This is the effective address.
        ADR_EFF_WB          : out std_logic_vector(31 downto 0); -- This is the effective address.

        DFC                 : out std_logic_vector(2 downto 0);
        DFC_WR              : in bit;
        SFC                 : out std_logic_vector(2 downto 0);
        SFC_WR              : in bit;

        ISP_DEC             : in bit;
        ISP_WR              : in bit;
        USP_RD              : in bit;
        USP_WR              : in bit;

        -- Registers controls:
        AR_MARK_USED        : in bit;
        AR_IN_USE           : out bit;
        AR_SEL_RD_1         : in std_logic_vector(2 downto 0);
        AR_SEL_RD_2         : in std_logic_vector(2 downto 0);
        AR_SEL_WR_1         : in std_logic_vector(2 downto 0);
        AR_SEL_WR_2         : in std_logic_vector(2 downto 0);
        AR_DEC              : in bit; -- Address register decrement.
        AR_INC              : in bit; -- Address register increment.
        AR_WR_1             : in bit; -- Address register write.
        AR_WR_2             : in bit; -- Address register write.
        UNMARK              : in bit;

        EXT_WORD            : in std_logic_vector(15 downto 0);

        SBIT                : in std_logic;

        SP_ADD_DISPL        : in bit;
        RESTORE_ISP_PC      : in bit;

        -- Other controls:
        DISPLACEMENT        : in std_logic_vector(31 downto 0);
        PC_ADD_DISPL        : in bit;
        PC_INC              : in bit; -- Program counter increment.
        PC_LOAD             : in bit; -- Program counter write.
        PC_RESTORE          : in bit;
        PC_OFFSET           : in std_logic_vector(7 downto 0)
    );
end entity WF68K10_ADDRESS_REGISTERS;
    
architecture BEHAVIOR of WF68K10_ADDRESS_REGISTERS is
type AR_TYPE is array(0 to 6) of std_logic_vector(31 downto 0);
signal ADR_EFF_I        : std_logic_vector(31 downto 0);
signal AR               : AR_TYPE; -- Address registers A0 to A6.
signal AR_OUT_1_I       : std_logic_vector(31 downto 0);
signal AR_OUT_2_I       : std_logic_vector(31 downto 0);
signal ADR_WB           : std_logic_vector(32 downto 0);
signal AR_PNTR_1        : integer range 0 to 7;
signal AR_PNTR_2        : integer range 0 to 7;
signal AR_PNTR_WB_1     : integer range 0 to 7;
signal AR_PNTR_WB_2     : integer range 0 to 7;
signal AR_USED_1        : std_logic_vector(3 downto 0);
signal AR_USED_2        : std_logic_vector(3 downto 0);
signal DFC_REG          : std_logic_vector(2 downto 0); -- Special function code registers.
signal ISP_REG          : std_logic_vector(31 downto 0); -- Interrupt stack pointer (refers to A7'' in the supervisor mode).
signal SBIT_WB          : std_logic;
signal PC_I             : std_logic_vector(31 downto 0); -- Active program counter.
signal SCALE            : std_logic_vector(1 downto 0); -- Scale information for the index.
signal SFC_REG          : std_logic_vector(2 downto 0); -- Special function code registers.
signal USP_REG          : std_logic_vector(31 downto 0); -- User stack pointer (refers to A7 in the user mode.).
begin
    INBUFFER: process
    begin
        wait until CLK = '1' and CLK' event;
        if AR_MARK_USED = '1' then
            AR_PNTR_WB_1 <= conv_integer(AR_SEL_WR_1);
            AR_PNTR_WB_2 <= conv_integer(AR_SEL_WR_2);
        end if;
    end process INBUFFER;

    AR_PNTR_1 <= conv_integer(AR_SEL_RD_1);
    AR_PNTR_2 <= conv_integer(AR_SEL_RD_2);

    P_IN_USE: process
    variable DELAY  : boolean;
    begin
        wait until CLK = '1' and CLK' event;
        if RESET = '1' or (UNMARK = '1' and AR_MARK_USED = '0') then
            AR_USED_1(3) <= '0';
            AR_USED_2(3) <= '0';
        elsif AR_MARK_USED = '1' then
            AR_USED_1 <= '1' & AR_SEL_WR_1;
            if USE_APAIR = true then
                AR_USED_2 <= '1' & AR_SEL_WR_2;
            end if;
            SBIT_WB <= SBIT;
        end if;
        --
        if RESET = '1' or (UNMARK = '1' and AR_MARK_USED = '0') then
            ADR_WB(32) <= '0';
            DELAY := false;
        elsif ADR_MARK_USED = '1' then
            DELAY := true; -- One clock cycle address calculation delay.
        elsif DELAY = true then
            ADR_WB <= '1' & ADR_EFF_I;
            DELAY := false;
        end if;
    end process P_IN_USE; 

    AR_IN_USE <= '1' when AR_USED_1(3) = '1' and AR_USED_1(2 downto 0) = AR_SEL_RD_1 else
                 '1' when AR_USED_1(3) = '1' and AR_USED_1(2 downto 0) = AR_SEL_RD_2 else
                 '1' when AR_USED_2(3) = '1' and AR_USED_2(2 downto 0) = AR_SEL_RD_1 else
                 '1' when AR_USED_2(3) = '1' and AR_USED_2(2 downto 0) = AR_SEL_RD_2 else '0';

    AR_OUT_1 <= AR_OUT_1_I;
    AR_OUT_2 <= AR_OUT_2_I;

    ADR_IN_USE <= '1' when ADR_WB(32) = '1' and ADR_WB(31 downto 2) = ADR_EFF_I(31 downto 2) else -- Actual long word address.
                  '1' when ADR_WB(32) = '1' and ADR_WB(31 downto 2) - '1' = ADR_EFF_I(31 downto 2) else -- Lock a misaligned access.
                  '1' when ADR_WB(32) = '1' and ADR_WB(31 downto 2) + '1' = ADR_EFF_I(31 downto 2) else '0'; -- Lock a misaligned access.

    ADR_FORMAT: process
    begin
        wait until CLK = '1' and CLK' event;
        if STORE_ADR_FORMAT = '1' then
            SCALE <= EXT_WORD(10 downto 9);
        end if;
    end process ADR_FORMAT;

    ADDRESS_MODES: process(ADR_MODE, AMODE_SEL, AR, AR_PNTR_1, CLK, 
                           ISP_REG, PC_EW_OFFSET, PC_I, RESTORE_ISP_PC, SBIT, USP_REG)
    -- The effective address calculation takes place in this process depending on the 
    -- selected addressing mode.
    -- The PC address (PC_I) used for the address calculation points to the first
    -- extension word used.
    variable ABS_ADDRESS        : std_logic_vector(31 downto 0);
    variable ADR_EFF_VAR        : std_logic_vector(31 downto 0);
    variable ADR_EFF_TMP        : std_logic_vector(31 downto 0);
    variable ADR_MUX            : std_logic_vector(31 downto 0);
    variable BASE_DISPL         : std_logic_vector(31 downto 0);
    variable INDEX              : std_logic_vector(31 downto 0) := x"00000000";    
    variable INDEX_SCALED       : std_logic_vector(31 downto 0);
    variable PCVAR              : std_logic_vector(31 downto 0);
    begin
        PCVAR := PC_I + PC_EW_OFFSET; -- This is the address of the extension word.

        if CLK = '1' and CLK' event then
            -- This logic selects the INDEX from one of the data registers or from one of 
            -- the address registers. Furthermore the index needs to be sign extended from 
            -- 8 bit to 32 bit or from 16 bit to 32 bit dependent on the address mode.
            -- In case of a long word operation, no extension is required. The index is 
            -- multiplied by 1, 2, 4 or 8.
            if STORE_ADR_FORMAT = '1' and EXT_WORD(15) = '0' and EXT_WORD(11) = '1' then
                INDEX := INDEX_IN; -- Long data register.
            elsif STORE_ADR_FORMAT = '1' and EXT_WORD(15) = '0' then
                for i in 31 downto 16 loop
                    INDEX(i) := INDEX_IN(15);
                end loop;
                INDEX(15 downto 0) := INDEX_IN(15 downto 0); -- Sign extended data register;
            elsif STORE_ADR_FORMAT = '1' and EXT_WORD(11) = '1' then -- Long address register.
                if EXT_WORD(14 downto 12) = "111" and SBIT = '1' then
                    INDEX := ISP_REG;
                elsif EXT_WORD(14 downto 12) = "111" and SBIT = '0' then
                    INDEX := USP_REG;
                else
                    INDEX :=  AR(conv_integer(EXT_WORD(14 downto 12)));
                end if;
            elsif STORE_ADR_FORMAT = '1' then -- Sign extended address register;
                if EXT_WORD(14 downto 12) = "111" and SBIT = '1' then
                    for i in 31 downto 16 loop
                        INDEX(i) := ISP_REG(15);
                    end loop;
                    INDEX(15 downto 0) := ISP_REG(15 downto 0);
                elsif EXT_WORD(14 downto 12) = "111" and SBIT = '0' then
                    for i in 31 downto 16 loop
                        INDEX(i) := USP_REG(15);
                    end loop;
                    INDEX(15 downto 0) := USP_REG(15 downto 0);
                else
                    for i in 31 downto 16 loop
                        INDEX(i) := AR(conv_integer(EXT_WORD(14 downto 12)))(15);
                    end loop;
                    INDEX(15 downto 0) := AR(conv_integer(EXT_WORD(14 downto 12)))(15 downto 0);
                end if;
            end if;
            --
            case SCALE is
                when "00" => INDEX_SCALED := INDEX; -- Multiple by 1.
                when "01" => INDEX_SCALED := INDEX(30 downto 0) & '0'; -- Multiple by 2.
                when "10" => INDEX_SCALED := INDEX(29 downto 0) & "00"; -- Multiple by 4.
                when others => INDEX_SCALED := INDEX(28 downto 0) & "000"; -- Multiple by 8.
            end case;
            --
            -- The displacement needs to be sign extended from 8 bit to 32, from 16 bit to 32 bit or 
            -- not extended dependent on the address mode.
            if RESET = '1' then
                BASE_DISPL := (others => '0'); -- Null base displacement.
            elsif STORE_ADR_FORMAT = '1' then
                for i in 31 downto 8 loop
                    BASE_DISPL(i) := EXT_WORD(7);
                end loop;
                BASE_DISPL(7 downto 0) := EXT_WORD(7 downto 0);
            elsif STORE_D16 = '1' then
                for i in 31 downto 16 loop
                    BASE_DISPL(i) := EXT_WORD(15);
                end loop;
                BASE_DISPL(15 downto 0) := EXT_WORD;
            elsif STORE_DISPL = '1' then
                BASE_DISPL := DISPLACEMENT;
            end if;
            --
            if STORE_ABS_LO = '1' then
                if AMODE_SEL = "000" then
                    for i in 31 downto 16 loop
                        ABS_ADDRESS(i) := EXT_WORD(15);
                    end loop;
                end if;
                ABS_ADDRESS(15 downto 0) := EXT_WORD;
            elsif STORE_ABS_HI = '1' then
                ABS_ADDRESS(31 downto 16) := EXT_WORD;
            end if;
        end if;

        case AR_PNTR_1 is
            when 7 =>
                if SBIT = '1' then
                    ADR_MUX := ISP_REG;
                else
                    ADR_MUX := USP_REG;
                end if;
            when others => ADR_MUX := AR(AR_PNTR_1);
        end case;

        case ADR_MODE is
            -- when "000" | "001" => Direct address modes: no effective address required.
            when "010" | "011" | "100" =>
                ADR_EFF_VAR := ADR_MUX; -- (An), (An)+, -(An). 
            when "101" => -- Address register indirect with offset. Assembler syntax: (d16,An).
                ADR_EFF_VAR := ADR_MUX + BASE_DISPL; -- (d16,An).
            when "110" =>
                ADR_EFF_VAR := ADR_MUX + BASE_DISPL + INDEX_SCALED; -- (d8, An, Xn, SIZE*SCALE). 
            when "111" =>
                case AMODE_SEL is
                    when "000" | "001" =>
                        ADR_EFF_VAR := ABS_ADDRESS;
                    when "010" => -- (d16, PC).
                        ADR_EFF_VAR := PCVAR + BASE_DISPL;
                    when "011" =>
                        -- Assembler syntax: (d8,PC,Xn.SIZE*SCALE).
                        ADR_EFF_VAR := PCVAR + BASE_DISPL + INDEX_SCALED; -- (d8, PC, Xn, SIZE*SCALE).
                    when others =>
                        ADR_EFF_VAR := (others => '-'); -- Don't care, while not used.
                end case;
            when others =>
                ADR_EFF_VAR := (others => '-'); -- Result not required.
        end case;
        --
        if CLK = '1' and CLK' event then
            if RESTORE_ISP_PC = '1' then
                ADR_EFF_I <= ADR_OFFSET; -- During exception processing.
            elsif STORE_AEFF = '1' then -- Used for MOVEM.
                ADR_EFF_I <= ADR_EFF_TMP + ADR_OFFSET; -- Keep the effective address. See also CONTROL section.
            else -- Normal operation:
                ADR_EFF_I <= ADR_EFF_VAR + ADR_OFFSET;
                ADR_EFF_TMP := ADR_EFF_VAR;
            end if;
        end if;
    end process ADDRESS_MODES;

    ADR_EFF <= ADR_EFF_I;
    ADR_EFF_WB <= ADR_WB(31 downto 0);
    
    -- Data outputs:
    AR_OUT_1_I <= USP_REG when USP_RD = '1' else
                  AR(AR_PNTR_1) when AR_PNTR_1 < 7 else 
                  ISP_REG when SBIT = '1' else USP_REG;

    AR_OUT_2_I <= AR(AR_PNTR_2) when AR_PNTR_2 < 7 else 
                  ISP_REG when SBIT = '1' else USP_REG;

    PC <= PC_I;

    PROGRAM_COUNTER: process
    -- Note: PC_LOAD and PC_ADD_DISPL must be highest
    -- prioritized. The reason is that in case of jumps
    -- or branches the Ipipe is flushed in connection
    -- with PC_INC. In such cases PC_LOAD or PC_ADD_DISPL
    -- are asserted simultaneously with PC_INC.
    begin
        wait until CLK = '1' and CLK' event;
        if RESET = '1' then
            PC_I <= (others => '0');
        elsif PC_LOAD = '1' then
            PC_I <= AR_IN_1;
        elsif PC_ADD_DISPL = '1' then
            PC_I <= PC_I + DISPLACEMENT;
        elsif PC_RESTORE = '1' then
            PC_I <= AR_IN_1; -- Keep prioritization!
        elsif PC_INC = '1' then
            PC_I <= PC_I + PC_OFFSET;
        end if;
    end process PROGRAM_COUNTER;

    STACK_POINTERS: process
    -- The registers are modeled in a way
    -- that write and simultaneously increment
    -- decrement and others are possible for
    -- different registers.
    begin
        wait until CLK = '1' and CLK' event;
        ---------------------------------------- ISP section ----------------------------------------
        if RESET = '1' then
            ISP_REG <= (others => '0');
        elsif AR_WR_1 = '1' and AR_PNTR_WB_1 = 7 and SBIT_WB = '1' then
            ISP_REG <= AR_IN_1; -- Always written long.
        end if;
        
        if AR_INC = '1' and AR_PNTR_1 = 7 and SBIT = '1' then
            case OP_SIZE is
                when BYTE       => ISP_REG <= ISP_REG + "10"; -- Increment by two!
                when WORD       => ISP_REG <= ISP_REG + "10"; -- Increment by two.
                when others     => ISP_REG <= ISP_REG + "100"; -- Increment by four, (LONG).
            end case;
        end if;
        
        if ISP_DEC = '1' or (AR_DEC = '1' and AR_PNTR_1 = 7 and SBIT = '1') then
            case OP_SIZE is
                when BYTE       => ISP_REG <= ISP_REG - "10"; -- Decrement by two!
                when WORD       => ISP_REG <= ISP_REG - "10"; -- Decrement by two.
                when others     => ISP_REG <= ISP_REG - "100"; -- Decrement by four, (LONG).
            end case;
        end if;

        if ISP_WR = '1' then
            ISP_REG <= AR_IN_1;
        elsif SP_ADD_DISPL = '1' and AR_INC = '1' and SBIT = '1' then
            ISP_REG <= ISP_REG + DISPLACEMENT + "100"; -- Used for RTD. 
        elsif SP_ADD_DISPL = '1' and SBIT = '1' then
            ISP_REG <= ISP_REG + DISPLACEMENT; 
        end if;

        ---------------------------------------- USP section ----------------------------------------
        if RESET = '1' then
            USP_REG <= (others => '0');
        elsif AR_WR_1 = '1' and AR_PNTR_WB_1 = 7 and SBIT_WB = '0' then
            USP_REG <= AR_IN_1; -- Always written long.
        end if;
        
        if AR_INC = '1' and AR_PNTR_1 = 7 and SBIT = '0' then
            case OP_SIZE is
                when BYTE       => USP_REG <= USP_REG + "10"; -- Increment by two!
                when WORD       => USP_REG <= USP_REG + "10"; -- Increment by two.
                when others     => USP_REG <= USP_REG + "100"; -- Increment by four, (LONG).
            end case;
        end if;
        
        if AR_DEC = '1' and AR_PNTR_1 = 7 and SBIT = '0' then
            case OP_SIZE is
                when BYTE       => USP_REG <= USP_REG - "10"; -- Decrement by two!
                when WORD       => USP_REG <= USP_REG - "10"; -- Decrement by two.
                when others     => USP_REG <= USP_REG - "100"; -- Decrement by four, (LONG).
            end case;
        end if;
        
        if USP_WR = '1' then
            USP_REG <= AR_IN_1;
        elsif SP_ADD_DISPL = '1' and AR_INC = '1' and SBIT = '0' then
            USP_REG <= USP_REG + DISPLACEMENT + "100"; -- Used for RTD. 
        elsif SP_ADD_DISPL = '1' and SBIT = '0' then
            USP_REG <= USP_REG + DISPLACEMENT; 
        end if;

        ---------------------------------- ISP / USP section ----------------------------------------        
        if AR_WR_2 = '1' and AR_PNTR_WB_2 = 7 and SBIT_WB = '1' then
            ISP_REG <= AR_IN_2; -- Used for EXG and UNLK.
        elsif AR_WR_2 = '1' and AR_PNTR_WB_2 = 7 then
            USP_REG <= AR_IN_2; -- Used for EXG and UNLK.
        end if;
    end process STACK_POINTERS;

    ADDRESS_REGISTERS: process
    -- The registers are modeled in a way
    -- that write and simultaneously increment
    -- decrement and others are possible for
    -- different registers.
    begin
        -- 
        wait until CLK = '1' and CLK' event;

        if RESET = '1' then
            AR <= (others => (Others => '0'));
        end if;
        
        if AR_WR_1 = '1' and AR_PNTR_WB_1 < 7 then
            AR(AR_PNTR_WB_1) <= AR_IN_1; -- Always written long.
        end if;
        
        if AR_INC = '1' and AR_PNTR_1 < 7 then
            case OP_SIZE is
                when BYTE       => AR(AR_PNTR_1) <= AR(AR_PNTR_1) + '1';
                when WORD       => AR(AR_PNTR_1) <= AR(AR_PNTR_1) + "10";
                when others     => AR(AR_PNTR_1) <= AR(AR_PNTR_1) + "100";
            end case;
        end if;
        
        if AR_DEC = '1' and AR_PNTR_1 < 7 then
            case OP_SIZE is
                when BYTE       => AR(AR_PNTR_1) <= AR(AR_PNTR_1) - '1';
                when WORD       => AR(AR_PNTR_1) <= AR(AR_PNTR_1) - "10";
                when others     => AR(AR_PNTR_1) <= AR(AR_PNTR_1) - "100";
            end case;
        end if;        

        if AR_WR_2 = '1' and AR_PNTR_WB_2 < 7 then
            AR(AR_PNTR_WB_2) <= AR_IN_2; -- Used for EXG and UNLK.
        end if;
    end process ADDRESS_REGISTERS;

    FCODES: process
    -- These flip flops provide the alternate function
    -- code registers.
    variable SFC_REG : std_logic_vector(2 downto 0);
    variable DFC_REG : std_logic_vector(2 downto 0);
    begin
        wait until CLK = '1' and CLK' event;
        if DFC_WR = '1' then
            DFC_REG := AR_IN_1(2 downto 0);
        end if;
        --
        if SFC_WR = '1' then
            SFC_REG := AR_IN_1(2 downto 0);
        end if;
        --
        DFC <= DFC_REG;
        SFC <= SFC_REG;
    end process FCODES;
end BEHAVIOR;
