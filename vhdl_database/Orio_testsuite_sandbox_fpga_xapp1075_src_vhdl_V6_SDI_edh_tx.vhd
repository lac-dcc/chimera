-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: edh_tx.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 16:08:23-07 $
-- /___/   /\    Date Created: May 8, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: edh_tx.vhd,rcs $
-- Revision 1.0  2004-12-15 16:08:23-07  jsnow
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
-- This packet generates a new EDH packet and inserts it into the output video
-- stream.
-- 
-- The module is controlled by a finite state machine. The FSM waits for the
-- edh_next signal to be asserted by the edh_loc module. This signal indicates
-- that the next word is beginning of the area where an EDH packet should be
-- inserted.
-- 
-- The FSM then generates all the words of the EDH packet, assembling the 
-- payload of the packet from the CRC and error flag inputs. The three sets of 
-- error flags enter the module sequentially on the flags_in port. The module 
-- generates three outputs (ap_flag_word, ff_flag_word, and anc_flag_word) to 
-- indicate which flag set it needs on the flags_in port.
-- 
-- The module generates an output signal, edh_packet, that is asserted during 
-- all the entire time that a generated EDH packet is being inserted into the 
-- video stream. This signal is used by various other modules to determine when 
-- an EDH packet has been sent.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity edh_tx is
    port (
        -- inputs
        clk:            in  std_ulogic;     -- clock input
        ce:             in  std_ulogic;     -- clock enable
        rst:            in  std_ulogic;     -- async reset input
        vid_in:         in  video_type;     -- input video port
        edh_next:       in  std_ulogic;     -- asserted when next sample begins EDH packet
        edh_missing:    in  std_ulogic;     -- receved EDh packet is missing
        ap_crc_valid:   in  std_ulogic;     -- asserted when AP CRC is valid
        ap_crc:         in  crc16_type;     -- calculated active picture CRC
        ff_crc_valid:   in  std_ulogic;     -- asserted when FF CRC is valid
        ff_crc:         in  crc16_type;     -- calculated full-frame CRC
        flags_in:       in  edh_flgset_type;-- bus that carries AP, FF, and ANC flags

        -- outputs
        ap_flag_word:   out std_ulogic;     -- asserted during AP flag word in EDH packet
        ff_flag_word:   out std_ulogic;     -- asserted during FF flag word in EDH packet
        anc_flag_word:  out std_ulogic;     -- asserted during ANC flag word in EDH packet
        edh_packet:     out std_ulogic;     -- asserted during all words of EDH packet
        edh_vid:        out video_type);    -- generated EDH packet data
end;
        
architecture synth of edh_tx is

-------------------------------------------------------------------------------
-- Constant definitions
--      

--
-- This group of constants defines the fixed values of some of the words in
-- the EDH packet.
--
constant EDH_ADF1 : video_type := (others => '0');  -- 0x000
constant EDH_ADF2 : video_type := (others => '1');  -- 0x3ff
constant EDH_ADF3 : video_type := (others => '1');  -- 0x3ff;
constant EDH_DID  : video_type := "0111110100";     -- 0x1f4;
constant EDH_DBN  : video_type := "1000000000";     -- 0x200;
constant EDH_DC   : video_type := "0100010000";     -- 0x110;
constant EDH_RSVD : video_type := "1000000000";     -- 0x200;

--
-- This group of constants defines the states of the EDH generator state
-- machine.
--
constant STATE_WIDTH : integer := 5;
subtype state is std_ulogic_vector(STATE_WIDTH - 1 downto 0);

constant S_WAIT   : state := "00000";
constant S_ADF1   : state := "00001";
constant S_ADF2   : state := "00010";
constant S_ADF3   : state := "00011";
constant S_DID    : state := "00100";
constant S_DBN    : state := "00101";
constant S_DC     : state := "00110";
constant S_AP1    : state := "00111";
constant S_AP2    : state := "01000";
constant S_AP3    : state := "01001";
constant S_FF1    : state := "01010";
constant S_FF2    : state := "01011";
constant S_FF3    : state := "01100";
constant S_ANCFLG : state := "01101";
constant S_APFLG  : state := "01110";
constant S_FFFLG  : state := "01111";
constant S_RSV1   : state := "10000";
constant S_RSV2   : state := "10001";
constant S_RSV3   : state := "10010";
constant S_RSV4   : state := "10011";
constant S_RSV5   : state := "10100";
constant S_RSV6   : state := "10101";
constant S_RSV7   : state := "10110";
constant S_CHK    : state := "10111";


-------------------------------------------------------------------------------
-- Signal definitions
--
signal current_state:   state;              -- FSM current state register
signal next_state:      state;              -- FSM next state value
signal parity:          std_ulogic;         -- used to generate parity bit for EDH packet words
signal checksum:        cksum_type;         -- used to calculated EDH packet CS word
signal clr_checksum:    std_ulogic;         -- clears the checksum register
signal vid:             video_type;         -- internal version of edh_vid output port
signal end_packet:      std_ulogic;         -- FSM output that clears the edh_packet signal

begin

    --
    -- FSM: current_state register
    --
    -- This code implements the current state register. It loads with the HSYNC1
    -- state on reset and the next_state value with each rising clock edge.
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
    process(current_state, edh_next)
    begin
        case current_state is
            when S_WAIT =>      if (edh_next = '1') then
                                    next_state <= S_ADF1;
                                else
                                    next_state <= S_WAIT;
                                end if;

            when S_ADF1 =>      next_state <= S_ADF2;

            when S_ADF2 =>      next_state <= S_ADF3;

            when S_ADF3 =>      next_state <= S_DID;

            when S_DID =>       next_state <= S_DBN;

            when S_DBN =>       next_state <= S_DC;

            when S_DC =>        next_state <= S_AP1;

            when S_AP1 =>       next_state <= S_AP2;

            when S_AP2 =>       next_state <= S_AP3;

            when S_AP3 =>       next_state <= S_FF1;

            when S_FF1 =>       next_state <= S_FF2;

            when S_FF2 =>       next_state <= S_FF3;

            when S_FF3 =>       next_state <= S_ANCFLG;

            when S_ANCFLG =>    next_state <= S_APFLG;

            when S_APFLG =>     next_state <= S_FFFLG;
                        
            when S_FFFLG =>     next_state <= S_RSV1;

            when S_RSV1 =>      next_state <= S_RSV2;

            when S_RSV2 =>      next_state <= S_RSV3;

            when S_RSV3 =>      next_state <= S_RSV4;

            when S_RSV4 =>      next_state <= S_RSV5;

            when S_RSV5 =>      next_state <= S_RSV6;

            when S_RSV6 =>      next_state <= S_RSV7;

            when S_RSV7 =>      next_state <= S_CHK;

            when S_CHK =>       next_state <= S_WAIT;

            when others =>      next_state <= S_WAIT;

        end case;
    end process;
            
    --
    -- FSM: outputs
    --
    -- This block decodes the current state to generate the various outputs of 
    -- the FSM.
    --
    process(current_state, parity, ap_crc, ff_crc, ap_crc_valid,
            ff_crc_valid, flags_in, checksum, vid_in, edh_missing)
    begin   
        -- Unless specifically assigned in the case statement, all FSM outputs
        -- default to the values below.
        vid             <= vid_in;
        clr_checksum    <= '0';
        end_packet      <= '0';
        ap_flag_word    <= '0';
        ff_flag_word    <= '0';
        anc_flag_word   <= '0';
                                    
        case current_state is

            when S_ADF1 =>      
                vid <= EDH_ADF1;

            when S_ADF2 =>      
                vid <= EDH_ADF2;

            when S_ADF3 =>      
                vid <= EDH_ADF3;
                clr_checksum <= '1';

            when S_DID =>       
                vid <= EDH_DID;

            when S_DBN =>       
                vid <= EDH_DBN;

            when S_DC =>        
                vid <= EDH_DC;

            when S_AP1 =>       
                vid <= (not parity & parity & ap_crc(5 downto 0) & "00");

            when S_AP2 =>       
                vid <= (not parity & parity & ap_crc(11 downto 6) & "00");

            when S_AP3 =>       
                vid <= (not parity & parity & ap_crc_valid & '0' & 
                        ap_crc(15 downto 12) & "00");

            when S_FF1 =>       
                vid <= (not parity & parity & ff_crc(5 downto 0) & "00");

            when S_FF2 =>       
                vid <= (not parity & parity & ff_crc(11 downto 6) & "00");

            when S_FF3 =>
                vid <= (not parity & parity & ff_crc_valid & '0' & 
                        ff_crc(15 downto 12) & "00");

            when S_ANCFLG =>   
                vid <= (not parity & parity & '0' & flags_in & "00");
                anc_flag_word <= '1';

            when S_APFLG =>
                vid <= (not parity & parity & '0' & flags_in & "00");
                ap_flag_word <= '1';

            when S_FFFLG =>   
                vid <= (not parity & parity & '0' & flags_in & "00");
                ff_flag_word <= '1';

            when S_RSV1 =>      
                vid <= EDH_RSVD;

            when S_RSV2 =>      
                vid <= EDH_RSVD;

            when S_RSV3 =>      
                vid <= EDH_RSVD;

            when S_RSV4 =>      
                vid <= EDH_RSVD;

            when S_RSV5 =>
                vid <= EDH_RSVD;

            when S_RSV6 =>
                vid <= EDH_RSVD;

            when S_RSV7 =>  
                vid <= EDH_RSVD;

            when S_CHK =>
                vid <= (not checksum(8) & checksum);
                end_packet <= '1';

            when others =>

        end case;
    end process;

    --
    -- parity bit generation
    --
    -- This code calculates the parity of bits 7:0 of the video word. The parity
    -- bit is inserted into bit 8 of parity protected words of the EDH packet. 
    -- The complement of the parity bit is inserted into bit 9 of those same 
    -- words.
    --
    parity <= vid(7) xor vid(6) xor vid(5) xor vid(4) xor
              vid(3) xor vid(2) xor vid(1) xor vid(0);


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
                    checksum <= std_ulogic_vector(
                        std_logic_vector(checksum) + 
                        std_logic_vector(vid(8 downto 0)));
                end if;
            end if;
        end if;
    end process;


    --
    -- edh_packet signal
    --
    -- The edh_packet signal becomes asserted at the beginning of an EDH packet
    -- and remains asserted through the last word of the EDH packet.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            edh_packet <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (edh_next = '1') then
                    edh_packet <= '1';
                elsif (end_packet = '1') then
                    edh_packet <= '0';
                end if;
            end if;
        end if;
    end process;

    --
    -- output assignments
    --
    edh_vid <= vid;

end synth;