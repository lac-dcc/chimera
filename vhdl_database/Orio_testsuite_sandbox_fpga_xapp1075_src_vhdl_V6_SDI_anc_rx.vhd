-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: anc_rx.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 15:58:04-07 $
-- /___/   /\    Date Created: 2002
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: anc_rx.vhd,rcs $
-- Revision 1.0  2004-12-15 15:58:04-07  jsnow
-- Header update.
--
-------------------------------------------------------------------------------- 
--   
--   XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" 
--   AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND 
--   SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, 
--   OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, 
--   APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION 
--   THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT, 
--   AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE 
--   FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY 
--   WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE 
--   IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR 
--   REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF 
--   INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
--   FOR A PARTICULAR PURPOSE. 
--
-------------------------------------------------------------------------------- 
-- 
-- This module checks the parity bits and checksums of all ANC packets (except 
-- EDH packets) on the video stream.. If any errors are detected in ANC packets 
-- during a field, the module will assert the anc_edh_local signal. This signal 
-- is used by the edh_gen module to assert the edh flag in the ANC flag set of 
-- the next EDH packet it generates. The anc_edh_local signal remains asserted 
-- until the EDH packet has been sent (as indicated the edh_packet input being 
-- asserted then negated).
-- 
-- The module will not do any checking after reset until the video decoder's 
-- locked signal is asserted for the first time.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity anc_rx is
    port (
        -- inputs
        clk:            in  std_ulogic;  -- clock input
        ce:             in  std_ulogic;  -- clock enable
        rst:            in  std_ulogic;  -- async reset input
        locked:         in  std_ulogic;  -- video decoder locked signal
        rx_anc_next:    in  std_ulogic;  -- asserted when next word begins ANC packet
        rx_edh_next:    in  std_ulogic;  -- asserted when next word begins EDH packet
        edh_packet:     in  std_ulogic;  -- indicates an EDH packet is being generated
        vid_in:         in  video_type;  -- video input data
    
        -- outputs
        anc_edh_local:  out std_ulogic); -- ANC error detected here flag
end;

architecture synth of anc_rx is

-------------------------------------------------------------------------------
-- Constant definitions
--      

--
-- This group of constants defines the states of the EDH processor state
-- machine.
--
constant STATE_WIDTH :  integer := 4;
subtype  state_type is  std_ulogic_vector(STATE_WIDTH - 1 downto 0);

constant S_WAIT :   state_type := "0000";
constant S_ADF1 :   state_type := "0001";
constant S_ADF2 :   state_type := "0010";
constant S_ADF3 :   state_type := "0011";
constant S_DID  :   state_type := "0100";
constant S_DBN  :   state_type := "0101";
constant S_DC   :   state_type := "0110";
constant S_UDW  :   state_type := "0111";
constant S_CHK  :   state_type := "1000";
constant S_EDH1 :   state_type := "1001";
constant S_EDH2 :   state_type := "1010";
constant S_EDH3 :   state_type := "1011";


-------------------------------------------------------------------------------
-- Signal definitions
--
signal current_state:   state_type;     -- FSM current state
signal next_state:      state_type;     -- FSM next state
signal parity:          std_ulogic;     -- used to generate parity_err signal
signal parity_err:      std_ulogic;     -- asserted on parity error
signal check_parity:    std_ulogic;     -- asserted when parity should be checked
signal checksum:        cksum_type;     -- checksum generator for ANC packet
signal clr_checksum:    std_ulogic;     -- asserted to clear the checksum
signal check_checksum:  std_ulogic;     -- asserted when checksum is to be tested
signal clr_edh_flag:    std_ulogic;     -- asserted to clear the edh flag
signal checksum_err:    std_ulogic;     -- asserted when checksum error in EDH packet is detected
signal udw_cntr:        ubyte_type;     -- user data word counter
signal udwcntr_eq_0:    std_ulogic;     -- asserted when output of UDW in MUX is zero
signal udw_mux:         ubyte_type;     -- UDW counter input MUX
signal ld_udw_cntr:     std_ulogic;     -- loads the UDW counter when asserted
signal enable:          std_ulogic;     -- generated from locked input

begin
    
    --
    -- enable signal
    --
    -- This signal enables checking of the parity and checksum. It is negated on
    -- reset and remains negated until locked is asserted for the first time.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            enable <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (locked = '1') then
                    enable <= '1';
                end if;
            end if;
        end if;
    end process;
                                    
    --
    -- FSM: current_state register
    --
    -- This code implements the current state register. 
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            current_state <= S_WAIT;
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
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
    process(current_state, rx_anc_next, rx_edh_next, udwcntr_eq_0,
            parity_err, edh_packet, enable)
    begin
        case current_state is
            when S_WAIT =>
                if (enable = '0') then
                    next_state <= S_WAIT;
                elsif (rx_anc_next = '1' and rx_edh_next = '0') then
                    next_state <= S_ADF1;
                elsif (edh_packet = '1') then
                    next_state <= S_EDH1;
                else
                    next_state <= S_WAIT;
                end if;
                    
            when S_ADF1 =>  
                next_state <= S_ADF2;

            when S_ADF2 =>      
                next_state <= S_ADF3;

            when S_ADF3 =>      
                next_state <= S_DID;

            when S_DID =>       
                if (parity_err = '1') then
                    next_state <= S_WAIT;
                else
                    next_state <= S_DBN;
                end if;

            when S_DBN =>       
                if (parity_err = '1') then
                    next_state <= S_WAIT;
                else
                    next_state <= S_DC;
                end if;

            when S_DC =>
                if (parity_err = '1') then
                    next_state <= S_WAIT;
                elsif (udwcntr_eq_0 = '1') then
                    next_state <= S_CHK;
                else
                    next_state <= S_UDW;
                end if;

            when S_UDW =>
                if (udwcntr_eq_0 = '1') then
                    next_state <= S_CHK;
                else
                    next_state <= S_UDW;
                end if;

            when S_CHK =>
                next_state <= S_WAIT;

            when S_EDH1 =>
                if (edh_packet = '0') then
                    next_state <= S_EDH1;
                else
                    next_state <= S_EDH2;
                end if;

            when S_EDH2 =>
                if (edh_packet = '1') then
                    next_state <= S_EDH2;
                else
                    next_state <= S_EDH3;
                end if;

            when S_EDH3 =>
                next_state <= S_WAIT;

            when others =>  
                next_state <= S_WAIT;
        end case;
    end process;

            
    --
    -- FSM: outputs
    --
    -- This block decodes the current state to generate the various outputs of 
    -- the FSM.
    --
    process(current_state)
    begin
        -- Unless specifically assigned in the case statement, all FSM outputs
        -- default to the values given here.
        clr_checksum    <= '0';
        clr_edh_flag    <= '0';
        check_parity    <= '0';
        ld_udw_cntr     <= '0';
        check_checksum  <= '0';
                                
        case current_state is
            
            when S_EDH3 =>
                clr_edh_flag <= '1';

            when S_ADF3 =>
                clr_checksum <= '1';

            when S_DID =>
                check_parity <= '1';

            when S_DBN =>
                check_parity <= '1';

            when S_DC =>
                ld_udw_cntr <= '1';
                check_parity <= '1';

            when S_CHK =>
                check_checksum <= '1';

            when others =>
        end case;       
    end process;

    --
    -- parity error detection
    --
    -- This code calculates the parity of bits 7:0 of the video word. The 
    -- calculated parity bit is compared to bit 8 and the complement of bit 9 to
    -- determine if a parity error has occured. If a parity error is detected, 
    -- the parity_err signal is asserted. Parity is only valid on the payload 
    -- portion of the EDH packet (user data words).
    --
    parity <= vid_in(7) xor vid_in(6) xor vid_in(5) xor vid_in(4) xor
              vid_in(3) xor vid_in(2) xor vid_in(1) xor vid_in(0);

    parity_err <= (parity xor vid_in(8)) or (parity xor not vid_in(9));


    --
    -- checksum calculator
    --
    -- This code generates a checksum for the EDH packet. The checksum is 
    -- cleared to zero prior to beginning the checksum calculation by the FSM 
    -- asserting the clr_checksum signal. The vid_in word is added to the 
    -- current checksum when the FSM asserts the do_checksum signal. The 
    -- checksum is a 9-bit value and is computed by summing all but the MSB of 
    -- the vid_in word with the current checksum value and ignoring any carry 
    -- bits.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            checksum <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_checksum = '1') then
                    checksum <= (others => '0');
                else
                    checksum <= std_ulogic_vector(std_logic_vector(checksum) +
                                std_logic_vector(vid_in(8 downto 0)));
                end if;
            end if;
        end if;
    end process;

    --
    -- checksum tester
    --
    -- This logic asserts the checksum_err signal if the calculated and received
    -- checksum are not the same.
    --
    process(checksum, vid_in)
    begin
        if ((checksum = vid_in(8 downto 0)) and (checksum(8) = not vid_in(9))) then
            checksum_err <= '0';
        else
            checksum_err <= '1';
        end if;
    end process;

    --
    -- UDW counter, input MUX, and comparator
    --
    -- The UDW counter is designed to count the number of user data words in the
    -- ANC packet so that the FSM knows when the payload portion of the ANC
    -- packet is over.
    --
    -- The ld_udw_cntr signal controls a MUX. When this signal is asserted, the
    -- MUX outputs the vid_in data word. Otherwise, the MUX outputs the contents
    -- of the UDW counter. The output of the MUX is decremented by one and 
    -- loaded into the UDW counter. The output of the MUX is also tested to see 
    -- if it equals zero and the udwcntr_eq_0 signal is asserted if so.
    --
    udw_mux <= vid_in(7 downto 0) when ld_udw_cntr = '1' else udw_cntr;

    process(udw_mux)
    begin
        if (udw_mux = UBYTE_ZERO) then
            udwcntr_eq_0 <= '1';
        else
            udwcntr_eq_0 <= '0';
        end if;
    end process;

    process(clk, rst)
    begin
        if (rst = '1') then
            udw_cntr <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                udw_cntr <= std_ulogic_vector(std_logic_vector(udw_mux) - 1);
            end if;
        end if;
    end process;        
            
    --
    -- anc_edh_local flag
    --
    -- This flag is reset whenever an EDH packet is generated. The flag is set
    -- if a parity error or checksum error is detected during a field.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            anc_edh_local <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_edh_flag = '1') then
                    anc_edh_local <= '0';
                elsif (parity_err = '1' and check_parity = '1') then
                    anc_edh_local <= '1';
                elsif (checksum_err = '1' and check_checksum = '1') then
                    anc_edh_local <= '1';
                end if;
            end if;
        end if;
    end process;

end synth;