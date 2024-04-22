-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: edh_rx.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 16:07:02-07 $
-- /___/   /\    Date Created: May 8, 200 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: edh_rx.vhd,rcs $
-- Revision 1.0  2004-12-15 16:07:02-07  jsnow
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
-- This module processes a received EDH packet. It examines the vcnt and hcnt
-- values from the video flywheel to determine when an EDH packet should occur. 
-- If there is no EDH packet then, the missing EDH packet flag is asserted. If 
-- an EDH packet occurs somewhere other than where it is expected, the misplaced
-- EDH packet flag is asserted.
-- 
-- When an EDH packet at the expected location if found, it is checked to make
-- sure all the words of the packet are correct, that the parity of the payload
-- data words are correct, and that the checksum for the packet is correct.
-- 
-- The active picture and full field CRCs and flags are extracted and stored in
-- registers.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity edh_rx is
    port (
        clk:            in  std_ulogic;     -- clock input
        ce:             in  std_ulogic;     -- clock enable
        rst:            in  std_ulogic;     -- async reset input
        rx_edh_next:    in  std_ulogic;     -- indicates the next word is the first word of a received EDH packet
        vid_in:         in  video_type;     -- video data
        edh_next:       in  std_ulogic;     -- EDH packet begins on next sample
        reg_flags:      in  std_ulogic;     -- 1 = register flag words, 0 = feed vid_in through

        -- outputs
        ap_crc_valid:   out std_ulogic;     -- valid bit for active picture CRC
        ap_crc:         out crc16_type;     -- active picture CRC
        ff_crc_valid:   out std_ulogic;     -- valid bit for full field CRC
        ff_crc:         out crc16_type;     -- full field CRC
        edh_missing:    out std_ulogic;     -- asserted when last expected EDH packet was missing
        edh_parity_err: out std_ulogic;     -- asserted when a parity error occurs in EDH packet
        edh_chksum_err: out std_ulogic;     -- asserted when a checksum error occurs in EDH packet
        edh_format_err: out std_ulogic;     -- asserted when a format error is found in EDH packet
        in_ap_flags:    out edh_flgset_type;-- received AP flag word to edh_flags module
        in_ff_flags:    out edh_flgset_type;-- received FF flag word to edh_flags module
        in_anc_flags:   out edh_flgset_type;-- received ANC flag word to edh_flags module
        rx_ap_flags:    out edh_flgset_type;-- received & registered AP flags for external inspection
        rx_ff_flags:    out edh_flgset_type;-- received & registered FF flags for external inspection
        rx_anc_flags:   out edh_flgset_type);-- received & registered ANC flags for external inspection
end;        

architecture synth of edh_rx is

-------------------------------------------------------------------------------
-- Constant definitions
--      

--
-- This group of constants defines the fixed values of some of the words in
-- the EDH packet.
--
constant EDH_DID :      video_type := "0111110100"; --h1f4;
constant EDH_DBN :      video_type := "1000000000"; --h200;
constant EDH_DC  :      video_type := "0100010000"; --h110;

--
-- This group of constants defines the states of the EDH processor state
-- machine.
--
constant STATE_WIDTH :  integer := 5;
subtype state_type is std_ulogic_vector(STATE_WIDTH - 1 downto 0);

constant S_WAIT     : state_type := "00000";
constant S_ADF1     : state_type := "00001";
constant S_ADF2     : state_type := "00010";
constant S_ADF3     : state_type := "00011";
constant S_DID      : state_type := "00100";
constant S_DBN      : state_type := "00101";
constant S_DC       : state_type := "00110";
constant S_AP1      : state_type := "00111";
constant S_AP2      : state_type := "01000";
constant S_AP3      : state_type := "01001";
constant S_FF1      : state_type := "01010";
constant S_FF2      : state_type := "01011";
constant S_FF3      : state_type := "01100";
constant S_ANCFLG   : state_type := "01101";
constant S_APFLG    : state_type := "01110";
constant S_FFFLG    : state_type := "01111";
constant S_RSV1     : state_type := "10000";
constant S_RSV2     : state_type := "10001";
constant S_RSV3     : state_type := "10010";
constant S_RSV4     : state_type := "10011";
constant S_RSV5     : state_type := "10100";
constant S_RSV6     : state_type := "10101";
constant S_RSV7     : state_type := "10110";
constant S_CHK      : state_type := "10111";
constant S_ERRM     : state_type := "11000";  -- Missing EDH packet
constant S_ERRF     : state_type := "11001";  -- Format error in EDH packet
constant S_ERRC     : state_type := "11010";  -- Checksum error in EDH packet

-------------------------------------------------------------------------------
-- Signal definitions
--
signal current_state:   state_type;         -- FSM current state
signal next_state:      state_type;         -- FSM next state
signal parity_err:      std_ulogic;         -- detects parity errors on EDH words
signal parity:          std_ulogic;         -- used to generate parity_err
signal checksum:        cksum_type;         -- checksum for EDH packet
signal ld_ap1:          std_ulogic;         -- loads bits 5:0 of active picture crc
signal ld_ap2:          std_ulogic;         -- loads bits 11:6 of active picture crc
signal ld_ap3:          std_ulogic;         -- loads bits 15:12 of active picture crc
signal ld_ff1:          std_ulogic;         -- loads bits 5:0 of full field crc
signal ld_ff2:          std_ulogic;         -- loads bits 11:6 of full field crc
signal ld_ff3:          std_ulogic;         -- loads bits 15:12 of full field crc
signal ld_ap_flags:     std_ulogic;         -- loads the rx_ap_flags register
signal ld_ff_flags:     std_ulogic;         -- loads the rx_ff_flags register
signal ld_anc_flags:    std_ulogic;         -- loads the rx_anc_flags register
signal clr_checksum:    std_ulogic;         -- asserted to clear the checksum
signal clr_errors:      std_ulogic;         -- asserted to clear the EDH packet errs
signal ap_crc_reg:      crc16_type;         -- active picture CRC register
signal ff_crc_reg:      crc16_type;         -- full field CRC register                  
signal missing_err:     std_ulogic;         -- asserted when EDH packet is missing
signal format_err:      std_ulogic;         -- asserted when format error in EDH packet is detected
signal check_parity:    std_ulogic;         -- asserted when parity error in EDH packet is detected
signal checksum_err:    std_ulogic;         -- asserted when checksum error in EDH packet is detected
signal rx_edh:          std_ulogic;         -- asserted when current word is first word of received EDH
signal rx_ap_flg_reg:   edh_flgset_type;    -- holds the received AP flags
signal rx_ff_flg_reg:   edh_flgset_type;    -- holds the received FF flags
signal rx_anc_flg_reg:  edh_flgset_type;    -- holds the received ANC flags

begin
    
    --
    -- delay flip-flop for rx_edh_next
    --
    -- The resulting signal, rx_edh, is asserted during the first word of a
    -- received EDH packet.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            rx_edh <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                rx_edh <= rx_edh_next;
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
    process(current_state, edh_next, rx_edh, vid_in, parity_err, checksum)
    begin
        case current_state is
      
            when S_WAIT =>
                if (edh_next = '1') then
                    next_state <= S_ADF1;
                else
                    next_state <= S_WAIT;
                end if;

            when S_ADF1 =>
                if (rx_edh = '1') then
                    next_state <= S_ADF2;
                else
                    next_state <= S_ERRM;
                end if;

            when S_ADF2 =>
                next_state <= S_ADF3;

            when S_ADF3 =>
                next_state <= S_DID;

            when S_DID =>
                next_state <= S_DBN;

            when S_DBN =>
                if (vid_in(9 downto 2) = EDH_DBN(9 downto 2)) then
                    next_state <= S_DC;
                else
                    next_state <= S_ERRF;
                end if;

            when S_DC =>
                if (vid_in(9 downto 0) = EDH_DC(9 downto 0)) then
                    next_state <= S_AP1;
                else
                    next_state <= S_ERRF;
                end if;

            when S_AP1 =>
                next_state <= S_AP2;

            when S_AP2 =>
                next_state <= S_AP3;

            when S_AP3 =>
                next_state <= S_FF1;

            when S_FF1 =>
                next_state <= S_FF2;

            when S_FF2 =>
                next_state <= S_FF3;

            when S_FF3 =>
                next_state <= S_ANCFLG;

            when S_ANCFLG =>    
                next_state <= S_APFLG;

            when S_APFLG => 
                next_state <= S_FFFLG;
                        
            when S_FFFLG => 
                next_state <= S_RSV1;

            when S_RSV1 =>
                next_state <= S_RSV2;

            when S_RSV2 =>
                next_state <= S_RSV3;

            when S_RSV3 =>
                next_state <= S_RSV4;

            when S_RSV4 =>
                next_state <= S_RSV5;

            when S_RSV5 =>
                next_state <= S_RSV6;

            when S_RSV6 =>
                next_state <= S_RSV7;

            when S_RSV7 =>
                next_state <= S_CHK;

            when S_CHK =>
                if (checksum = vid_in(8 downto 0) and checksum(8) = not vid_in(9)) then
                    next_state <= S_WAIT;
                else
                    next_state <= S_ERRC;
                end if;

            when S_ERRM =>
                next_state <= S_WAIT;

            when S_ERRF =>
                next_state <= S_WAIT;

            when S_ERRC =>
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
        -- default to the values below.
        ld_ap1          <='0';
        ld_ap2          <='0';
        ld_ap3          <='0';
        ld_ff1          <='0';
        ld_ff2          <='0';
        ld_ff3          <='0';
        ld_ap_flags     <='0';
        ld_ff_flags     <='0';
        ld_anc_flags    <='0';
        clr_checksum    <='0';
        clr_errors      <='0';
        missing_err     <='0';
        format_err      <='0';
        check_parity    <='0';
        checksum_err    <='0';
                                    
        case current_state is
            when S_ADF1 =>      clr_errors <= '1';

            when S_ADF3 =>      clr_checksum <= '1';

            when S_AP1 =>       ld_ap1 <= '1';
                                check_parity <= '1';

            when S_AP2 =>       ld_ap2 <= '1';
                                check_parity <= '1';

            when S_AP3 =>       ld_ap3 <= '1';
                                check_parity <= '1';

            when S_FF1 =>       ld_ff1 <= '1';
                                check_parity <= '1';

            when S_FF2 =>       ld_ff2 <= '1';
                                check_parity <= '1';

            when S_FF3 =>       ld_ff3 <= '1';
                                check_parity <= '1';

            when S_ANCFLG =>    ld_anc_flags <= '1';
                                check_parity <= '1';

            when S_APFLG =>     ld_ap_flags <= '1';
                                check_parity <= '1';

            when S_FFFLG =>     ld_ff_flags <= '1';
                                check_parity <= '1';

            when S_ERRM =>      missing_err <= '1';

            when S_ERRF =>      format_err <= '1';

            when S_ERRC =>      checksum_err <= '1';

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
                    checksum <= cksum_type(std_logic_vector(checksum) +
                                std_logic_vector(vid_in(8 downto 0)));
                end if;
            end if;
        end if;
    end process;

    --
    -- Active-picture CRC and valid bit register
    --
    -- This code captures the AP CRC word and valid bit. The CRC word is carried
    -- in three different words in the EDH packet and is assembled into a 
    -- complete 16-bit checkword plus a valid bit by this logic.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            ap_crc_valid <= '0';
            ap_crc_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_ap1 = '1') then
                    ap_crc_reg <= (ap_crc_reg(15 downto 6) & vid_in(7 downto 2));
                elsif (ld_ap2 = '1') then
                    ap_crc_reg <= (ap_crc_reg(15 downto 12) & vid_in(7 downto 2) &
                                   ap_crc_reg(5 downto 0));
                elsif (ld_ap3 = '1') then
                    ap_crc_reg <= (vid_in(5 downto 2) & ap_crc_reg(11 downto 0));
                    ap_crc_valid <= vid_in(7);
                end if;
            end if;
        end if;
    end process;

    --
    -- Full-field CRC and valid bit register
    --
    -- This code captures the FF CRC word and valid bit. The CRC word is carried
    -- in three different words in the EDH packet and is assembled into a 
    -- complete 16-bit checkword plus a valid bit by this logic.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            ff_crc_valid <= '0';
            ff_crc_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_ff1 = '1') then
                    ff_crc_reg <= (ff_crc_reg(15 downto 6) & vid_in(7 downto 2));
                elsif (ld_ff2 = '1') then
                    ff_crc_reg <= (ff_crc_reg(15 downto 12) & vid_in(7 downto 2) &
                                   ff_crc_reg(5 downto 0));
                elsif (ld_ff3 = '1') then
                    ff_crc_reg <= (vid_in(5 downto 2) & ff_crc_reg(11 downto 0));
                    ff_crc_valid <= vid_in(7);
                end if;
            end if;
        end if;
    end process;

    --
    -- EDH packet error flags
    --
    -- This code implements registers for each of the four different EDH packet
    -- error flags. These flags are captured as an EDH packet is received and
    -- remain asserted until the start of the next EDH packet.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            edh_missing     <= '0';
            edh_parity_err  <= '0';
            edh_chksum_err  <= '0';
            edh_format_err  <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_errors = '1') then
                    edh_missing     <= '0';
                    edh_parity_err  <= '0';
                    edh_chksum_err  <= '0';
                    edh_format_err  <= '0';
                else
                    if (missing_err = '1') then
                        edh_missing <= '1';
                    end if;
                    
                    if (format_err = '1') then
                        edh_format_err <= '1';
                    end if;
                    
                    if (checksum_err = '1') then
                        edh_chksum_err <= '1';
                    end if;

                    if (check_parity = '1' and parity_err = '1') then
                        edh_parity_err <= '1';
                    end if;
                end if; 
            end if;
        end if;
    end process;

    --
    -- received flags registers
    --
    -- These registers capture the three sets of error status flags (ap, ff, and
    -- anc) from the received EDH packet. These flags remain in the registers 
    -- until overwritten by the next EDH packet.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            rx_ap_flg_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1' and ld_ap_flags = '1') then
                rx_ap_flg_reg <= vid_in(6 downto 2);
            end if;
        end if;
    end process;

    in_ap_flags <= rx_ap_flg_reg when reg_flags = '1' else vid_in(6 downto 2);

    process(clk, rst)
    begin
        if (rst = '1') then
            rx_ff_flg_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1' and ld_ff_flags = '1') then
                rx_ff_flg_reg <= vid_in(6 downto 2);
            end if;
        end if;
    end process;

    in_ff_flags <= rx_ff_flg_reg when reg_flags = '1' else vid_in(6 downto 2);

    process(clk, rst)
    begin
        if (rst = '1') then
            rx_anc_flg_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1' and ld_anc_flags = '1') then
                rx_anc_flg_reg <= vid_in(6 downto 2);
            end if;
        end if;
    end process;
                                
    in_anc_flags <= rx_anc_flg_reg when reg_flags = '1' else vid_in(6 downto 2);

    --
    -- outputs assignments
    --
    ap_crc <= ap_crc_reg;
    ff_crc <= ff_crc_reg;
        
    rx_ap_flags <= rx_ap_flg_reg;
    rx_ff_flags <= rx_ff_flg_reg;
    rx_anc_flags <= rx_anc_flg_reg;
                    
end synth;