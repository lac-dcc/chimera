------------------------------------------------------------------------
----                                                                ----
---- WF68K10 IP Core: Data register logic.                          ----
----                                                                ----
---- Description:                                                   ----
---- These are the eight data registers. The logic provides two     ----
---- read and two write ports providing simultaneos access. For     ----
---- more information refer to the MC68010 User' Manual.            ----
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
-- 

library work;
use work.WF68K10_PKG.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity WF68K10_DATA_REGISTERS is
    port (
        CLK                 : in std_logic;
        RESET               : in bit;

        -- Data lines:
        DR_IN_1             : in std_logic_vector(31 downto 0);
        DR_IN_2             : in std_logic_vector(31 downto 0);
        DR_OUT_1            : out std_logic_vector(31 downto 0);
        DR_OUT_2            : out std_logic_vector(31 downto 0);
        
        -- Registers controls:
        DR_SEL_WR_1         : in std_logic_vector(2 downto 0);
        DR_SEL_WR_2         : in std_logic_vector(2 downto 0);
        DR_SEL_RD_1         : in std_logic_vector(2 downto 0);
        DR_SEL_RD_2         : in std_logic_vector(2 downto 0);
        DR_WR_1             : in bit;
        DR_WR_2             : in bit;
        DR_MARK_USED        : in bit;
        USE_DPAIR           : in boolean;
        DR_IN_USE           : out bit;
        UNMARK              : in bit;
        
        OP_SIZE             : in OP_SIZETYPE
    );
end entity WF68K10_DATA_REGISTERS;
    
architecture BEHAVIOUR of WF68K10_DATA_REGISTERS is
type DR_TYPE is array(0 to 7) of std_logic_vector(31 downto 0);
signal DR               : DR_TYPE; -- Data registers D0 to D7.
signal DR_PNTR_WR_1     : integer range 0 to 7;
signal DR_PNTR_WR_2     : integer range 0 to 7;
signal DR_PNTR_RD_1     : integer range 0 to 7;
signal DR_PNTR_RD_2     : integer range 0 to 7;
signal DR_SEL_WR_I1     : std_logic_vector(2 downto 0);
signal DR_SEL_WR_I2     : std_logic_vector(2 downto 0);
signal DR_USED_1        : std_logic_vector(3 downto 0);
signal DR_USED_2        : std_logic_vector(3 downto 0);
begin
    INBUFFER: process
    begin
        wait until CLK = '1' and CLK' event;
        if DR_MARK_USED = '1' then
            DR_SEL_WR_I1 <= DR_SEL_WR_1;
            DR_SEL_WR_I2 <= DR_SEL_WR_2;
        end if;
    end process INBUFFER;

    DR_PNTR_WR_1 <= conv_integer(DR_SEL_WR_I1);
    DR_PNTR_WR_2 <= conv_integer(DR_SEL_WR_I2);
    DR_PNTR_RD_1 <= conv_integer(DR_SEL_RD_1);
    DR_PNTR_RD_2 <= conv_integer(DR_SEL_RD_2);

    P_IN_USE: process
    begin
        wait until CLK = '1' and CLK' event;
        if RESET = '1' or UNMARK = '1' then
            DR_USED_1(3) <= '0';
            DR_USED_2(3) <= '0';
        elsif DR_MARK_USED = '1' then
            DR_USED_1 <= '1' & DR_SEL_WR_1;
            if USE_DPAIR = true then
                DR_USED_2 <= '1' & DR_SEL_WR_2;
            end if;
        end if;
    end process P_IN_USE;

    DR_IN_USE <= '1' when DR_USED_1(3) = '1' and DR_USED_1(2 downto 0) = DR_SEL_RD_1 else
                 '1' when DR_USED_1(3) = '1' and DR_USED_1(2 downto 0) = DR_SEL_RD_2 else
                 '1' when DR_USED_2(3) = '1' and DR_USED_2(2 downto 0) = DR_SEL_RD_1 else
                 '1' when DR_USED_2(3) = '1' and DR_USED_2(2 downto 0) = DR_SEL_RD_2 else '0';

    DR_OUT_1 <= DR(DR_PNTR_RD_1);
    DR_OUT_2 <= DR(DR_PNTR_RD_2);

    REGISTERS: process
    begin
        wait until CLK = '1' and CLK' event;
        if RESET = '1' then
            DR <= (others => (others => '0'));
        end if;
        if DR_WR_1 = '1' then
            case OP_SIZE is
                when LONG => DR(DR_PNTR_WR_1) <= DR_IN_1;
                when WORD => DR(DR_PNTR_WR_1)(15 downto 0) <= DR_IN_1(15 downto 0);
                when Byte => DR(DR_PNTR_WR_1)(7 downto 0) <= DR_IN_1(7 downto 0);
            end case;
        end if;
        if DR_WR_2 = '1' then
            case OP_SIZE is
                when LONG => DR(DR_PNTR_WR_2) <= DR_IN_2;
                when WORD => DR(DR_PNTR_WR_2)(15 downto 0) <= DR_IN_2(15 downto 0);
                when Byte => DR(DR_PNTR_WR_2)(7 downto 0) <= DR_IN_2(7 downto 0);
            end case;
        end if;
    end process REGISTERS;
end BEHAVIOUR;
