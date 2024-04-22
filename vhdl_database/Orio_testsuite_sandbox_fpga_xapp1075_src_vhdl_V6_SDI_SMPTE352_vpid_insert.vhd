-------------------------------------------------------------------------------- 
-- Copyright (c) 2007 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: SMPTE352_vpid_insert.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-05-03 09:17:13-06 $
-- /___/   /\    Date Created: April 27, 2007
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: SMPTE352_vpid_insert.vhd,rcs $
-- Revision 1.3  2010-05-03 09:17:13-06  jsnow
-- Removed incorrect logic for anc_next signal unique to 3G-SDI level B.
--
-- Revision 1.2  2008-07-31 14:38:39-06  jsnow
-- Fixed process sensitivity list.
--
-- Revision 1.1  2007-10-23 16:39:52-06  jsnow
-- Changed level B VPID insertion to match SMPTE 425-2007 changes.
--
-- Revision 1.0  2007-08-08 14:15:19-06  jsnow
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
-- This module inserts SMPTE 352M video payload ID packets into a video stream.
-- The stream may be either HD or SD, as indicated by the hd_sd input signal.
-- The module will overwrite an existing VPID packet if the overwrite input
-- is asserted, otherwise if a VPID packet exists in the HANC space, it will
-- not be overwritten and a new packet will not be inserted.
--
-- The module does not create the user data words of the VPID packet. Those
-- are generated externally and enter the module on the byte1, byte2, byte3,
-- and byte4 ports.
--
-- The module requires an interface line number on its input. This line number
-- must be valid for the new line one clock cycle before the start of the
-- HANC space -- that is during the second CRC word following the EAV.
--
-- If the overwrite input is 1, this module will also deleted any VPID packets
-- that occur elsewhere in any HANC space. These packets will be marked as
-- deleted packets.
--
-- When the level_b input is 1, then the module works a little bit differently.
-- It will always overwrite the first data word of the VPID packet with the
-- value present on the byte1 input port, even if overwrite is 0. This is 
-- because conversions from dual link to level B 3G-SDI require the first byte 
-- to be modified. The checksum is recalculated and inserted.
-- 
-- This module is compliant with the 2007 revision of SMPTE 425M for inserting
-- SMPTE 352M VPID packets in level B streams.
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim; 
use unisim.vcomponents.all; 

entity SMPTE352_vpid_insert is
    port (
        clk:        in  std_logic;                      -- clock input
        ce:         in  std_logic;                      -- clock enable
        rst:        in  std_logic;                      -- async reset input
        hd_sd:      in  std_logic;                      -- 0 = HD, 1 = SD
        level_b:    in  std_logic;                      -- 1 = SMPTE 425M Level B
        enable:     in  std_logic;                      -- 0 = disable insertion
        overwrite:  in  std_logic;                      -- 1 = overwrite existing packets
        line:       in  std_logic_vector(10 downto 0);  -- current video line
        line_a:     in  std_logic_vector(10 downto 0);  -- field 1 line for packet insertion
        line_b:     in  std_logic_vector(10 downto 0);  -- field 2 line for packet insertion
        line_b_en:  in  std_logic;                      -- 1 = use line_b, 0 = ignore line_b
        byte1:      in  std_logic_vector(7 downto 0);   -- first byte of VPID data
        byte2:      in  std_logic_vector(7 downto 0);   -- second byte of VPID data
        byte3:      in  std_logic_vector(7 downto 0);   -- third byte of VPID data
        byte4:      in  std_logic_vector(7 downto 0);   -- fourth byte of VPID data
        y_in:       in  std_logic_vector(9 downto 0);   -- Y data stream in
        c_in:       in  std_logic_vector(9 downto 0);   -- C data stream in
        y_out:      out std_logic_vector(9 downto 0);   -- Y data stream out
        c_out:      out std_logic_vector(9 downto 0);   -- C data stream out
        eav_out:    out std_logic;                      -- 1 on XYZ word of EAV
        sav_out:    out std_logic);                     -- 1 on XYZ word of SAV
end SMPTE352_vpid_insert;

architecture xilinx of SMPTE352_vpid_insert is

component wide_SRLC16E
generic (
    WIDTH:  integer);
port(
    clk:    in  std_logic;
    ce:     in  std_logic;
    d:      in  std_logic_vector(WIDTH-1 downto 0);
    a:      in  std_logic_vector(3 downto 0);
    q:      out std_logic_vector(WIDTH-1 downto 0));
end component;

--
-- These constants define the states of the finite state machine.
--
constant STATE_WIDTH :  integer := 6;
subtype  STATE_TYPE is std_logic_vector(STATE_WIDTH - 1 downto 0);

constant STATE_WAIT :       STATE_TYPE := "000000";
constant STATE_ADF0 :       STATE_TYPE := "000001";
constant STATE_ADF1 :       STATE_TYPE := "000010";
constant STATE_ADF2 :       STATE_TYPE := "000011";
constant STATE_DID :        STATE_TYPE := "000100";
constant STATE_SDID :       STATE_TYPE := "000101";
constant STATE_DC :         STATE_TYPE := "000110";
constant STATE_B0 :         STATE_TYPE := "000111";
constant STATE_B1 :         STATE_TYPE := "001000";
constant STATE_B2 :         STATE_TYPE := "001001";
constant STATE_B3 :         STATE_TYPE := "001010";
constant STATE_CS :         STATE_TYPE := "001011";
constant STATE_DID2 :       STATE_TYPE := "001100";
constant STATE_SDID2 :      STATE_TYPE := "001101";
constant STATE_DC2 :        STATE_TYPE := "001110";
constant STATE_UDW :        STATE_TYPE := "001111";
constant STATE_CS2 :        STATE_TYPE := "010000";
constant STATE_INS_ADF0 :   STATE_TYPE := "010001";
constant STATE_INS_ADF1 :   STATE_TYPE := "010010";
constant STATE_INS_ADF2 :   STATE_TYPE := "010011";
constant STATE_INS_DID :    STATE_TYPE := "010100";
constant STATE_INS_SDID :   STATE_TYPE := "010101";
constant STATE_INS_DC :     STATE_TYPE := "010110";
constant STATE_INS_B0 :     STATE_TYPE := "010111";
constant STATE_INS_B1 :     STATE_TYPE := "011000";
constant STATE_INS_B2 :     STATE_TYPE := "011001";
constant STATE_INS_B3 :     STATE_TYPE := "011010";
constant STATE_ADF0_X :     STATE_TYPE := "011011";
constant STATE_ADF1_X :     STATE_TYPE := "011100";
constant STATE_ADF2_X :     STATE_TYPE := "011101";
constant STATE_DID_X :      STATE_TYPE := "011110";
constant STATE_SDID_X :     STATE_TYPE := "011111";
constant STATE_DC_X :       STATE_TYPE := "100000";
constant STATE_UDW_X :      STATE_TYPE := "100001";
constant STATE_CS_X :       STATE_TYPE := "100010";

--
-- These constants define the encoding of the video output mux selection signal.
--
subtype  OUT_MUX_SEL_TYPE is std_logic_vector(3 downto 0);      

constant MUX_SEL_000 :      OUT_MUX_SEL_TYPE := "0000";
constant MUX_SEL_3FF :      OUT_MUX_SEL_TYPE := "0001";
constant MUX_SEL_DID :      OUT_MUX_SEL_TYPE := "0010";
constant MUX_SEL_SDID :     OUT_MUX_SEL_TYPE := "0011";
constant MUX_SEL_DC :       OUT_MUX_SEL_TYPE := "0100";
constant MUX_SEL_UDW :      OUT_MUX_SEL_TYPE := "0101";
constant MUX_SEL_CS :       OUT_MUX_SEL_TYPE := "0110";
constant MUX_SEL_DEL :      OUT_MUX_SEL_TYPE := "0111";
constant MUX_SEL_VID :      OUT_MUX_SEL_TYPE := "1000";

--
-- Internal signal definitions
--
signal vid_reg0 :       std_logic_vector(9 downto 0) := (others => '0');    -- video pipeline register
signal vid_reg1 :       std_logic_vector(9 downto 0) := (others => '0');    -- video pipeline register
signal vid_reg2 :       std_logic_vector(9 downto 0) := (others => '0');    -- video pipeline register
signal vid_dly :        std_logic_vector(9 downto 0) := (others => '0');    -- last state of video pipeline
signal all_ones_in :    std_logic;                                          -- asserted when in_reg is all ones
signal all_zeros_in :   std_logic;                                          -- asserted when in_reg is all zeros : 
signal all_zeros_pipe : std_logic_vector(2 downto 0) := (others => '0');    -- delay pipe for all zeros
signal all_ones_pipe :  std_logic_vector(2 downto 0) := (others => '0');    -- delay pipe for all ones
signal xyz :            std_logic;                                          -- current word is XYZ word
signal eav_next :       std_logic;                                          -- 1 = next word is first word of EAV
signal sav_next :       std_logic;                                          -- 1 = next word is first word of SAV
signal anc_next :       std_logic;                                          -- 1 = next word is first word of ANC
signal hanc_start_next :std_logic;                                          -- 1 = next word is first word of HANC
signal hanc_dly :       std_logic_vector(3 downto 0);                       -- delay from xyz word to hanc_start_next
signal in_reg :         std_logic_vector(9 downto 0) := (others => '0');    -- input registers
signal vid_out :        std_logic_vector(9 downto 0) := (others => '0');    -- internal version of y_out
signal line_match_a :   std_logic;                                          -- output of line_a comparitor
signal line_match_b :   std_logic;                                          -- output of line_b comparitor
signal vpid_line :      std_logic := '0';                                   -- 1 = insert VPID packet on this line
signal vpid_pkt :       std_logic;                                          -- 1 = ANC packet is a VPID
signal del_pkt_ok :     std_logic;                                          -- 1 = ANC packet is deleted packet with >= 4 UDW
signal udw_cntr :       std_logic_vector(7 downto 0) := (others => '0');    -- user data word counter
signal udw_cntr_mux :   std_logic_vector(7 downto 0) := (others => '0');    -- user data word counter input mux
signal ld_udw_cntr :    std_logic;                                          -- 1 = load udw_cntr
signal udw_cntr_tc :    std_logic;                                          -- 1 = udw_cntr == 0
signal cs_reg :         std_logic_vector(8 downto 0) := (others => '0');    -- checksum generation register
signal clr_cs_reg :     std_logic;                                          -- 1 = clear cs_reg to 0
signal vpid_mux :       std_logic_vector(7 downto 0);                       -- selects the VPID byte to be output
signal vpid_mux_sel :   std_logic_vector(1 downto 0);                       -- controls vpid_mux
signal out_mux_sel :    OUT_MUX_SEL_TYPE;                                   -- controls the vid_out data mux
signal parity :         std_logic;                                          -- parity calculation
signal sav_timing :     std_logic_vector(3 downto 0) := (others => '0');    -- shift register for generation sav_out
signal eav_timing :     std_logic_vector(3 downto 0) := (others => '0');    -- shift register for generation eav_out
signal current_state :  STATE_TYPE := STATE_WAIT;                           -- FSM current state
signal next_state :     STATE_TYPE;                                         -- FSM next state
signal y_out_reg :      std_logic_vector(9 downto 0) := (others => '0');
signal eav_out_reg :    std_logic := '0';
signal sav_out_reg :    std_logic := '0';
signal byte1_reg :      std_logic_vector(7 downto 0) := (others => '0');
signal byte2_reg :      std_logic_vector(7 downto 0) := (others => '0');
signal byte3_reg :      std_logic_vector(7 downto 0) := (others => '0');
signal byte4_reg :      std_logic_vector(7 downto 0) := (others => '0');
 
begin
    --
    -- Input register and video pipeline registers
    --
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                in_reg    <= y_in;
                vid_reg0  <= in_reg;
                vid_reg1  <= vid_reg0;
                vid_reg2  <= vid_reg1;
                vid_dly   <= vid_reg2;
                byte1_reg <= byte1;
                byte2_reg <= byte2;
                byte3_reg <= byte3;
                byte4_reg <= byte4;
            end if;
        end if;
    end process;

    --
    -- all ones and all zeros detectors
    --
    all_ones_in  <= '1' when in_reg = "1111111111" else '0';
    all_zeros_in <= '1' when in_reg = "0000000000" else '0';

    process(clk, rst)
    begin
        if rst = '1' then
            all_zeros_pipe <= (others => '0');
        elsif rising_edge(clk) then
            if ce = '1' then
                all_zeros_pipe <= (all_zeros_pipe(1 downto 0) & all_zeros_in);
            end if;
        end if;
    end process;

    process(clk, rst)
    begin
        if rst = '1' then
            all_ones_pipe <= (others => '0');
        elsif rising_edge(clk) then
            if ce = '1' then
                all_ones_pipe <= (all_ones_pipe(1 downto 0) & all_ones_in);
            end if;
        end if;
    end process;


    --
    -- EAV, SAV, and ADF detection
    --
    xyz <= all_ones_pipe(2) and all_zeros_pipe(1) and all_zeros_pipe(0);

    eav_next <= xyz and in_reg(6);
    sav_next <= xyz and not in_reg(6);
    anc_next <= (all_zeros_pipe(2) and all_ones_pipe(1) and all_ones_pipe(0));

    --
    -- This SRL16 is used to generate the hanc_start_next signal. The input to the
    -- shift register is eav_next. The depth of the shift register depends on 
    -- whether the video is HD or SD.
    --
    process(hd_sd, level_b)
    begin
        if hd_sd = '1' then
            hanc_dly <= "0011";
        else
            hanc_dly <= "0111";
        end if;
    end process;

    EAVDLY : SRLC16E 
        generic map (
            INIT    => "0000000000000000")
        port map (
            Q       => hanc_start_next,
            Q15     => open,
            A0      => hanc_dly(0),
            A1      => hanc_dly(1),
            A2      => hanc_dly(2),
            A3      => hanc_dly(3),
            CE      => ce,
            CLK     => clk,
            D       => eav_next);

    --
    -- Line number comparison
    --
    -- Two comparators are used to determine if the current line number matches
    -- either of the two lines where the VPID packets are located. The second
    -- line can be disabled for progressive video by setting line_b_en low.
    --
    line_match_a <= '1' when line = line_a else '0';
    line_match_b <= '1' when line = line_b else '0';

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                vpid_line <= line_match_a or (line_match_b and line_b_en);
            end if;
        end if;
    end process;

    --
    -- DID/SDID match
    --
    -- The vpid_pkt signal is asserted when the next two words in the video delay
    -- pipeline indicate a video payload ID packet. The del_pkt_ok signal is
    -- asserted when the data in the video delay pipeline indicates that a deleted
    -- ANC packet is present with a data count of at least 4.
    --
    vpid_pkt   <= '1' when (vid_reg2(7 downto 0) = "01000001") and 
                           (vid_reg1(7 downto 0) = "00000001") 
                  else '0';

    del_pkt_ok <= '1' when (vid_reg2(7 downto 0) = "10000000") and 
                           (vid_reg0(7 downto 0) = "00000100") 
                  else '0';

    --
    -- UDW counter
    --
    -- This counter is used to cycle through the user data words of non-VPID ANC 
    -- packets that may be encountered before empty HANC space is found.
    --
    udw_cntr_mux <= vid_dly(7 downto 0) when ld_udw_cntr = '1' else udw_cntr;
    udw_cntr_tc  <= '1' when udw_cntr_mux = "00000000" else '0';

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                udw_cntr <= udw_cntr_mux - 1;
            end if;
        end if;
    end process;

    --
    -- Checksum generation
    --
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                if clr_cs_reg = '1' then
                    cs_reg <= (others => '0');
                else
                    cs_reg <= cs_reg + vid_out(8 downto 0);
                end if;
            end if;
        end if;
    end process;

    --
    -- Video data path
    --
    with vpid_mux_sel select
        vpid_mux <= byte1_reg when "00",
                    byte2_reg when "01",
                    byte3_reg when "10",
                    byte4_reg when others;

    parity <= vpid_mux(7) xor vpid_mux(6) xor vpid_mux(5) xor vpid_mux(4) xor
              vpid_mux(3) xor vpid_mux(2) xor vpid_mux(1) xor vpid_mux(0);

    with out_mux_sel select
        vid_out <= "0000000000"                     when MUX_SEL_000,
                   "1111111111"                     when MUX_SEL_3FF,
                   "1001000001"                     when MUX_SEL_DID,
                   "0100000001"                     when MUX_SEL_SDID,
                   "0100000100"                     when MUX_SEL_DC,
                   (not parity & parity & vpid_mux) when MUX_SEL_UDW,
                   (not cs_reg(8) & cs_reg)         when MUX_SEL_CS,
                   "0110000000"                     when MUX_SEL_DEL,
                   vid_dly                          when others;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                y_out_reg <= vid_out;
            end if;
        end if;
    end process;

    y_out <= y_out_reg;

    --
    -- Delay the C video channel by 6 clock cycles to match the Y channel delay.
    --
    CDLY : wide_SRLC16E
    generic map (
        WIDTH   => 10)
    port map (
        clk     => clk,
        ce      => ce,
        d       => c_in,
        a       => "0101",
        q       => c_out);

    --
    -- EAV & SAV output generation
    --
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                eav_timing <= (eav_timing(2 downto 0) & eav_next);
            end if;
        end if;
    end process;
            
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                eav_out_reg <= eav_timing(3);
            end if;
        end if;
    end process;

    eav_out <= eav_out_reg;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                sav_timing <= (sav_timing(2 downto 0) & sav_next);
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                sav_out_reg <= sav_timing(3);
            end if;
        end if;
    end process;

    sav_out <= sav_out_reg;

    --
    -- FSM: current_state register
    --
    -- This code implements the current state register. 
    --
    process(clk, rst)
    begin
        if rst = '1' then
            current_state <= STATE_WAIT;
        elsif rising_edge(clk) then
            if ce = '1' then
                if sav_next = '1' then
                    current_state <= STATE_WAIT;
                else
                    current_state <= next_state;
                end if;
            end if;
        end if;
    end process;


    --
    -- FSM: next_state logic
    --
    -- This case statement generates the next_state value for the FSM based on
    -- the current_state and the various FSM inputs.
    --
    process(current_state, enable, vpid_line, hanc_start_next, anc_next, overwrite, 
            vpid_pkt, del_pkt_ok, udw_cntr_tc)
    begin
        case current_state is

            when STATE_WAIT => 
                if enable = '1' and vpid_line = '1' and hanc_start_next = '1' then
                    if anc_next = '1' then
                        next_state <= STATE_ADF0;
                    else
                        next_state <= STATE_INS_ADF0;
                    end if;
                elsif enable = '1' and vpid_line = '0' and anc_next = '1' and overwrite = '1' then
                    next_state <= STATE_ADF0_X;
                else
                    next_state <= STATE_WAIT;
                end if;

            when STATE_ADF0 => 
                next_state <= STATE_ADF1;
                
            when STATE_ADF1 => 
                next_state <= STATE_ADF2;
                
            when STATE_ADF2 => 
                if vpid_pkt = '1' then
                    next_state <= STATE_DID;
                elsif del_pkt_ok = '1' then
                    next_state <= STATE_INS_DID;
                else
                    next_state <= STATE_DID2;
                end if; 

            when STATE_DID => 
                next_state <= STATE_SDID;

            when STATE_SDID =>
                if overwrite = '1' then
                    next_state <= STATE_INS_DC;
                else
                    next_state <= STATE_DC;
                end if;

            when STATE_DC => 
                next_state <= STATE_B0;

            when STATE_B0 => 
                next_state <= STATE_B1;

            when STATE_B1 => 
                next_state <= STATE_B2;

            when STATE_B2 => 
                next_state <= STATE_B3;

            when STATE_B3 => 
                next_state <= STATE_CS;

            when STATE_CS => 
                next_state <= STATE_WAIT;

            when STATE_DID2 => 
                next_state <= STATE_SDID2;

            when STATE_SDID2 => 
                next_state <= STATE_DC2;

            when STATE_DC2 => 
                if udw_cntr_tc = '1' then
                    next_state <= STATE_CS2;
                else
                    next_state <= STATE_UDW;
                end if;
        
            when STATE_UDW => 
                if udw_cntr_tc = '1' then
                    next_state <= STATE_CS2;
                else
                    next_state <= STATE_UDW;
                end if;

            when STATE_CS2 => 
                if anc_next = '1' then
                    next_state <= STATE_ADF0;
                else
                    next_state <= STATE_INS_ADF0;
                end if;

            when STATE_INS_ADF0 => 
                next_state <= STATE_INS_ADF1;

            when STATE_INS_ADF1 => 
                next_state <= STATE_INS_ADF2;

            when STATE_INS_ADF2 => 
                next_state <= STATE_INS_DID;

            when STATE_INS_DID => 
                next_state <= STATE_INS_SDID;

            when STATE_INS_SDID => 
                next_state <= STATE_INS_DC;

            when STATE_INS_DC => 
                next_state <= STATE_INS_B0;

            when STATE_INS_B0 => 
                next_state <= STATE_INS_B1;

            when STATE_INS_B1 => 
                next_state <= STATE_INS_B2;

            when STATE_INS_B2 => 
                next_state <= STATE_INS_B3;

            when STATE_INS_B3 => 
                next_state <= STATE_CS;

            when STATE_ADF0_X => 
                next_state <= STATE_ADF1_X;

            when STATE_ADF1_X => 
                next_state <= STATE_ADF2_X;

            when STATE_ADF2_X => 
                if vpid_pkt = '1' then
                    next_state <= STATE_DID_X;
                else
                    next_state <= STATE_WAIt;
                end if;
        
            when STATE_DID_X => 
                next_state <= STATE_SDID_X;
                
            when STATE_SDID_X => 
                next_state <= STATE_DC_X;
                
            when STATE_DC_X => 
                if udw_cntr_tc = '1' then
                    next_state <= STATE_CS_X;
                else
                    next_state <= STATE_UDW_X;
                end if;     
        
            when STATE_UDW_X => 
                if udw_cntr_tc = '1' then
                    next_state <= STATE_CS_X;
                else
                    next_state <= STATE_UDW_X;
                end if; 
        
            when STATE_CS_X => 
                if anc_next = '1' then
                    next_state <= STATE_ADF0_X;
                else
                    next_state <= STATE_WAIt;
                end if;

            when others => 
                next_state <= STATE_WAIT;

        end case;
    end process;




    --
    -- FSM: outputs
    --
    -- This block decodes the current state to generate the various outputs of the
    -- FSM.
    --
    process(current_state, level_b)
    begin
        out_mux_sel     <= MUX_SEL_VID;
        ld_udw_cntr     <= '0';
        clr_cs_reg      <= '0';
        vpid_mux_sel    <= "00";

        case current_state is
            when STATE_ADF2     =>  clr_cs_reg <= '1';

            when STATE_B0       =>  if level_b = '1' then
                                        out_mux_sel <= MUX_SEL_UDW;
                                    else
                                        out_mux_sel <= MUX_SEL_VID;
                                    end if;
                                    vpid_mux_sel <= "00";

            when STATE_CS       =>  out_mux_sel <= MUX_SEL_CS;

            when STATE_DC2      =>  ld_udw_cntr <= '1';

            when STATE_INS_ADF0 =>  out_mux_sel <= MUX_SEL_000;

            when STATE_INS_ADF1 =>  out_mux_sel <= MUX_SEL_3FF;

            when STATE_INS_ADF2 =>  out_mux_sel <= MUX_SEL_3FF;
                                    clr_cs_reg <= '1';

            when STATE_INS_DID  =>  out_mux_sel <= MUX_SEL_DID;

            when STATE_INS_SDID =>  out_mux_sel <= MUX_SEL_SDID;

            when STATE_INS_DC   =>  out_mux_sel <= MUX_SEL_DC;

            when STATE_INS_B0   =>  out_mux_sel <= MUX_SEL_UDW;
                                    vpid_mux_sel <= "00";

            when STATE_INS_B1   =>  out_mux_sel <= MUX_SEL_UDW;
                                    vpid_mux_sel <= "01";

            when STATE_INS_B2   =>  out_mux_sel <= MUX_SEL_UDW;
                                    vpid_mux_sel <= "10";

            when STATE_INS_B3   =>  out_mux_sel <= MUX_SEL_UDW;
                                    vpid_mux_sel <= "11";

            when STATE_ADF2_X   =>  clr_cs_reg <= '1';

            when STATE_DID_X    =>  out_mux_sel <= MUX_SEL_DEL;

            when STATE_DC_X     =>  ld_udw_cntr <= '1';

            when STATE_CS_X     =>  out_mux_sel <= MUX_SEL_CS;

            when others         =>  out_mux_sel <= MUX_SEL_VID;
                                    ld_udw_cntr <= '0';
                                    vpid_mux_sel<= "00";
                                    clr_cs_reg  <= '0';
        end case;
    end process;

end xilinx;