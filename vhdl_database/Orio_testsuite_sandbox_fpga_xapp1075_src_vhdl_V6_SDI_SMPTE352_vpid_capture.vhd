-------------------------------------------------------------------------------- 
-- Copyright (c) 2007 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: SMPTE352_vpid_capture.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-01-11 14:07:53-07 $
-- /___/   /\    Date Created: April 27, 2007
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: SMPTE352_vpid_capture.vhd,rcs $
-- Revision 1.5  2010-01-11 14:07:53-07  jsnow
-- Added "work" to line: use work.hdsdi_pkg.all;
--
-- Revision 1.4  2008-09-26 11:14:21-06  jsnow
-- Added missing state transition from UDW3 to CS.
--
-- Revision 1.3  2008-09-25 12:02:22-06  jsnow
-- Removed paylod_int internal register.
--
-- Revision 1.2  2008-09-25 08:26:55-06  jsnow
-- Fixed error in ld_byte assignements.
--
-- Revision 1.1  2008-07-31 14:39:13-06  jsnow
-- Fixed process sensitivity list.
--
-- Revision 1.0  2007-08-08 14:08:09-06  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- LIMITED WARRANTY AND DISCLAMER. These designs are provided to you "as is" or 
-- as a template to make your own working designs. Xilinx and its licensors make 
-- and you receive no warranties or conditions, express, implied, statutory or 
-- otherwise, and Xilinx specifically disclaims any implied warranties of 
-- merchantability, non-infringement, or fitness for a particular purpose. 
-- Xilinx does not warrant that the functions contained in these designs will 
-- meet your requirements, or that the operation of these designs will be 
-- uninterrupted or error free, or that defects in the Designs will be 
-- corrected. Furthermore, Xilinx does not warrant or make any representations 
-- regarding use or the results of the use of the designs in terms of 
-- correctness, accuracy, reliability, or otherwise. The designs are not covered
-- by any other agreement that you may have with Xilinx. 
--
-- LIMITATION OF LIABILITY. In no event will Xilinx or its licensors be liable 
-- for any damages, including without limitation direct, indirect, incidental, 
-- special, reliance or consequential damages arising from the use or operation 
-- of the designs or accompanying documentation, however caused and on any 
-- theory of liability. This limitation will apply even if Xilinx has been 
-- advised of the possibility of such damage. This limitation shall apply 
-- not-withstanding the failure of the essential purpose of any limited remedies
-- herein.
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
-- This module captures the SMPTE 352M video payload ID packet. The payload
-- output port is only updated when the packet does not have a checksum error. 
-- The vpid_valid output is asserted as long at least one valid packet has 
-- been detected in the last VPID_TIMEOUT_VBLANKS vertical blanking intervals.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim; 
use unisim.vcomponents.all; 

use work.hdsdi_pkg.all;

entity SMPTE352_vpid_capture is
    generic (
        VPID_TIMEOUT_VBLANKS:   integer := 4);
    port (
        clk:        in  std_logic;                          -- clock input
        ce:         in  std_logic;                          -- clock enable
        rst:        in  std_logic;                          -- async reset input
        sav:        in  std_logic;                          -- asserted on XYZ word of SAV
        vid_in:     in  xavb_10b_vcomp_type;                -- video data input
        payload:    out std_logic_vector(31 downto 0);      -- (byte4 & byte3 & byte2 & byte1)
        valid:      out std_logic);                         -- 1 when payload is valid
end SMPTE352_vpid_capture;

architecture xilinx of SMPTE352_vpid_capture is

--
-- This group of parameters defines the states of the finite state machine.
--
constant STATE_WIDTH :  integer := 4;
subtype  STATE_TYPE is std_logic_vector(STATE_WIDTH-1 downto 0);

constant STATE_START :  STATE_TYPE := "0000";
constant STATE_ADF2 :   STATE_TYPE := "0001";
constant STATE_ADF3 :   STATE_TYPE := "0010";
constant STATE_DID :    STATE_TYPE := "0011";
constant STATE_SDID :   STATE_TYPE := "0100";
constant STATE_DC :     STATE_TYPE := "0101";
constant STATE_UDW0 :   STATE_TYPE := "0110";
constant STATE_UDW1 :   STATE_TYPE := "0111";
constant STATE_UDW2 :   STATE_TYPE := "1000";
constant STATE_UDW3 :   STATE_TYPE := "1001";
constant STATE_CS :     STATE_TYPE := "1010";

subtype  MUXSEL_TYPE is std_logic_vector(2 downto 0);

constant MUX_SEL_000 :  MUXSEL_TYPE := "000";
constant MUX_SEL_3FF :  MUXSEL_TYPE := "001";
constant MUX_SEL_DID :  MUXSEL_TYPE := "010";
constant MUX_SEL_SDID : MUXSEL_TYPE := "011";
constant MUX_SEL_DC :   MUXSEL_TYPE := "100";
constant MUX_SEL_CS :   MUXSEL_TYPE := "101";

constant SR_MSB :       integer     := VPID_TIMEOUT_VBLANKS - 1;

signal current_state :      STATE_TYPE := STATE_START;
signal next_state :         STATE_TYPE;
signal checksum :           std_logic_vector(8 downto 0) := "000000000";
signal old_v :              std_logic := '0';
signal v :                  std_logic := '0';
signal v_fall :             std_logic;
signal v_rise :             std_logic;
signal packet_rx :          std_logic := '0';
signal packet_det :         std_logic_vector(SR_MSB downto 0) := (others => '0');
signal byte1 :              std_logic_vector(7 downto 0) := "00000000";
signal byte2 :              std_logic_vector(7 downto 0) := "00000000";
signal byte3 :              std_logic_vector(7 downto 0) := "00000000";
signal byte4 :              std_logic_vector(7 downto 0) := "00000000";
signal ld_byte1 :           std_logic;
signal ld_byte2 :           std_logic;
signal ld_byte3 :           std_logic;
signal ld_byte4 :           std_logic;
signal ld_cs_err :          std_logic;
signal clr_cs :             std_logic;
signal cmp_mux_sel :        MUXSEL_TYPE;
signal cmp_mux :            std_logic_vector(9 downto 0);
signal cmp_equal :          std_logic;
signal packet_ok :          std_logic;
signal valid_d :            std_logic;

begin

    --
    -- FSM: current_state register
    --
    -- This code implements the current state register. 
    --
    process(clk, rst)
    begin
        if rst = '1' then
            current_state <= STATE_START;
        elsif rising_edge(clk) then
            if ce = '1' then
                current_state <= next_state;
            end if;
        end if;
    end process;

    --
    -- FSM: next_state logic
    --
    -- This case statement generates the next_state value for the FSM based on
    -- the current_state and the various FSM inputs.
    --
    process(current_state, cmp_equal)
    begin
        case current_state is
        
            when STATE_START => 
                if cmp_equal = '1' then
                    next_state <= STATE_ADF2;
                else
                    next_state <= STATE_START;
                end if;

            when STATE_ADF2 => 
                if cmp_equal = '1' then
                    next_state <= STATE_ADF3;
                else
                    next_state <= STATE_START;
                end if;

            when STATE_ADF3 => 
                if cmp_equal = '1' then
                    next_state <= STATE_DID;
                else
                    next_state <= STATE_START;
                end if;

            when STATE_DID => 
                if cmp_equal = '1' then
                    next_state <= STATE_SDID;
                else
                    next_state <= STATE_START;
                end if;
        
            when STATE_SDID => 
                if cmp_equal = '1' then
                    next_state <= STATE_DC;
                else
                    next_state <= STATE_START;
                end if;

            when STATE_DC => 
                if cmp_equal = '1' then
                    next_state <= STATE_UDW0;
                else
                    next_state <= STATE_START;
                end if;

            when STATE_UDW0 => 
                next_state <= STATE_UDW1;

            when STATE_UDW1 => 
                next_state <= STATE_UDW2;

            when STATE_UDW2 => 
                next_state <= STATE_UDW3;

            when STATE_UDW3 => 
                next_state <= STATE_CS;

            when STATE_CS => 
                next_state <= STATE_START;

            when others => 
                next_state <= STATE_START;

        end case;
    end process;
            
    --
    -- FSM: outputs
    --
    -- This block decodes the current state to generate the various outputs of the
    -- FSM.
    --
    process(current_state)
    begin
        ld_byte1        <= '0';
        ld_byte2        <= '0';
        ld_byte3        <= '0';
        ld_byte4        <= '0';
        ld_cs_err       <= '0';
        clr_cs          <= '0';
        cmp_mux_sel     <= MUX_SEL_000;

        case current_state is
            
            when STATE_START => clr_cs <= '1';
            
            when STATE_ADF2 =>
                cmp_mux_sel <= MUX_SEL_3FF;
                clr_cs <= '1';

            when STATE_ADF3 => 
                cmp_mux_sel <= MUX_SEL_3FF;
                clr_cs <= '1';

            when STATE_DID  => cmp_mux_sel <= MUX_SEL_DID;
            
            when STATE_SDID => cmp_mux_sel <= MUX_SEL_SDID;
            
            when STATE_DC =>   cmp_mux_sel <= MUX_SEL_DC;
            
            when STATE_UDW0 => ld_byte1 <= '1';
            
            when STATE_UDW1 => ld_byte2 <= '1';
            
            when STATE_UDW2 => ld_byte3 <= '1';
            
            when STATE_UDW3 => ld_byte4 <= '1';
            
            when STATE_CS => 
                cmp_mux_sel <= MUX_SEL_CS;
                ld_cs_err <= '1';  
        
            when others =>
        end case;
    end process;

    --
    -- Comparator
    --
    -- Compares the expected value of each word, except the user data words, to the
    -- received value.
    --
    process(cmp_mux_sel, checksum)
    begin
        case cmp_mux_sel is
            when MUX_SEL_000  => cmp_mux <= "0000000000";
            when MUX_SEL_3FF  => cmp_mux <= "1111111111";
            when MUX_SEL_DID  => cmp_mux <= "1001000001";   -- 241
            when MUX_SEL_SDID => cmp_mux <= "0100000001";   -- 101
            when MUX_SEL_DC   => cmp_mux <= "0100000100";   -- 104
            when MUX_SEL_CS   => cmp_mux <= (not checksum(8) & checksum);
            when others       => cmp_mux <= "0000000000";
        end case;
    end process;

    cmp_equal <= '1' when cmp_mux = vid_in else '0';

    --
    -- User data word registers
    --
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' and ld_byte1 = '1' then
                byte1 <= vid_in(7 downto 0);
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' and ld_byte2 = '1' then
                byte2 <= vid_in(7 downto 0);
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' and ld_byte3 = '1' then
                byte3 <= vid_in(7 downto 0);
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' and ld_byte4 = '1' then
                byte4 <= vid_in(7 downto 0);
            end if;
        end if;
    end process;

    --
    -- Checksum generation and error flag
    --
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                if clr_cs = '1' then
                    checksum <= (others => '0');
                else
                    checksum <= checksum + vid_in(8 downto 0);
                end if;
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                packet_ok <= ld_cs_err and cmp_equal;
            end if;
        end if;
    end process;

    --
    -- Packet valid signal generation
    --
    -- The valid output is updated immediatly if a packet is received. Once a
    -- packet has been detected in any of the last VPID_TIMEOUT_VBLANKS blanking 
    -- intervals, the valid output will be asserted.
    --
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' and sav = '1' then
                v <= vid_in(7);
                old_v <= v;
            end if;
        end if;
    end process;

    v_fall <= old_v and not v;
    v_rise <= not old_v and v;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                if packet_ok = '1' then
                    packet_rx <= '1';
                elsif v_rise = '1' then
                    packet_rx <= '0';
                end if;
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' and v_fall = '1' then
                    packet_det <= (packet_det(SR_MSB - 1 downto 0) & packet_rx);
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                valid <= valid_d;
            end if;
        end if;
    end process;

    valid_d <= '1' when (packet_rx = '1') or 
                        (packet_det /= (packet_det'range => '0')) else '0';
             
    --
    -- Output registers
    --
    -- The payload register is loaded from the captured bytes at the same time that
    -- packet_rx is set -- when packet_ok is asserted.
    --
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' and packet_ok = '1' then
                payload <= (byte4 & byte3 & byte2 & byte1);
            end if;
        end if;
    end process;

end xilinx;
