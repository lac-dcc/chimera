-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Solutions Development Group, Xilinx, Inc.
--  \   \        Filename: $RCSfile: triple_sdi_autodetect_ln.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-11-14 16:35:18-07 $
-- /___/   /\    Date Created: June 25, 2008
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: triple_sdi_autodetect_ln.vhd,rcs $
-- Revision 1.1  2008-11-14 16:35:18-07  jsnow
-- Added register initializers.
--
-- Revision 1.0  2008-07-31 16:27:59-06  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- LIMITED WARRANTY AND DISCLAMER. These designs are provided to you "as is" or 
-- as a template to make your own working designs exclusively with Xilinx
-- products. Xilinx and its licensors make and you receive no warranties or 
-- conditions, express, implied, statutory or otherwise, and Xilinx specifically
-- disclaims any implied warranties of merchantability, non-infringement, or 
-- fitness for a particular purpose. Xilinx does not warrant that the functions 
-- contained in these designs will meet your requirements, or that the operation
-- of these designs will be uninterrupted or error free, or that defects in the 
-- Designs will be corrected. Furthermore, Xilinx does not warrant or make any 
-- representations regarding use or the results of the use of the designs in 
-- terms of correctness, accuracy, reliability, or otherwise. The designs are 
-- not covered by any other agreement that you may have with Xilinx. 
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
-- This module will examine a HD data stream and detect the transport format. It
-- detects all the video standards currently supported by SMPTE 292M-2006 (SMPTE 
-- 260M, SMPTE 274M, and SMPTE 296M) plus the 1080PsF video formats described in
-- SMPTE RP 211 and the legacy SMPTE 295M format. The module can also be used 
-- with a 3G-SDI receiver and recognizes all video formats supported by SMPTE 
-- 425M-2008, including the SMPTE 428 digital cinema format.
-- 
-- Note that this module detects transport timing and not necessarily the actual 
-- video format. The module counts words and lines to  determine the video 
-- standard. It does not depend on the inclusion of ANC packets identifying the
-- video standard.
-- 
-- This module also produces a line number value indicating the current line 
-- number. This line number value changes on the rising edge of clock following
-- the XYZ word of the EAV so that is valid for insertion into the LN field of 
-- an HD-SDI stream.
-- 
-- The module requires as input only one of the channels of the video stream,
-- either Y or C. It also requires as input the decoded signals eav and sav. 
-- These inputs must be asserted only during the XYZ word of the EAV or SAV, 
-- respectively..
-- 
-- The a3g input must be 1 for 3G-SDI level A and 0 for all other modes. This 
-- allows it to use an alternate set of word counts to correctly identify the 
-- various video formats in 3G-SDI level A mode where the clock will be twice as
-- fast as it should be except for the 1080p 50 Hz / 60 Hz standards. It also 
-- allows the module to differentiate between 1080p 50 Hz and 1080p 25 Hz and 
-- between 1080p 60 Hz and 1080p 30 Hz.
-- 
-- Normally, when the input video standard changes, this module will wait for
-- some number of video frames (determine by MAX_ERRCNT) before beginning the 
-- process of identifying and locking to the new video format. This is to 
-- prevent a few errors in the video from causing the module to lose lock. 
-- However, it also increases the latency for the module to lock to a new 
-- standard when the input video standard is deliberately changed. If some logic
-- external to this module knows that a deliberate input video standard change 
-- has been done, it can assert this module's reacquire input for one clock 
-- cycle to force the module to immediately begin the process of identifying 
-- and locking to the new video standard.
-- 
-- The module generates the following outputs:
-- 
-- locked: Indicates when the module has locked to the incoming video standard.
-- The std and ln outputs are only valid when locked is a 1.
-- 
-- std: A 4-bit code indicating which transport format has been detected encoded
-- as follows (rates are frame rate):
--     
--     0000: SMPTE 260M 1035i           30Hz
--     0001: SMPTE 295M 1080i           25Hz
--     0010: SMPTE 274M 1080i or 1080sF 30Hz
--     0011: SMPTE 274M 1080i or 1080sF 25Hz
--     0100: SMPTE 274M 1080p           30Hz   
--     0101: SMPTE 274M 1080p           25Hz   
--     0110: SMPTE 274M 1080p           24Hz
--     0111: SMPTE 296M 720p            60Hz
--     1000: SMPTE 274M 1080sF          24Hz
--     1001: SMPTE 296M 720p            50Hz
--     1010: SMPTE 296M 720p            30Hz
--     1011: SMPTE 296M 720p            25Hz
--     1100: SMPTE 296M 720p            24Hz
--     1101: SMPTE 296M 1080p           60Hz    (3G-SDI level A only)
--     1110: SMPTE 296M 1080p           50Hz   (3G-SDI level B only)
-- 
-- ln: An 11-bit line number code indicating the current line number. This code
-- changes on the rising edge of the clock when both xyz and eav are asserted. 
-- This allows the ln code to be available just in time for encoding and 
-- insertion into the two words that immediately follow the EAV. However, care 
-- must be taken to insure that this path meets timing.
--  
-- ln_valid: Asserted whenever the locked output is asserted and the line number
-- generator has started generating valid line numbers.
-- 
-- Note that the std code does not distinguish between the /1 and /M tranport
-- formats. So, the code 0010 can represent either a true 30Hz signal or 30Hz/M.
-- Also note that this module is unable to distinguish between the SMPTE 274M
-- 1080i standards and the corresponding 1080sF standards since they both have
-- exactly the same video format in terms of number of lines per frame and words
-- per line.
-- 
-- This module will detect the SMPTE 428 digital cinema 2048x1080 24p or 24sF
-- as SMPTE 274M 1080p 24Hz or 2080p 24sF, respectively, because these are the
-- transport protocols that carry the container file for the digital cinema
-- format.
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity triple_sdi_autodetect_ln is
    port (
        clk:        in  std_logic;                      -- clock input
        rst:        in  std_logic;                      -- async reset input
        ce:         in  std_logic;                      -- clock enable input
        vid_in:     in  std_logic_vector(8 downto 7);   -- C or Y channel video input (bits 8:7 only)
        eav:        in  std_logic;                      -- XYZ word of EAV
        sav:        in  std_logic;                      -- XYZ word of SAV
        reacquire:  in  std_logic;                      -- force module to require new format
        a3g:        in  std_logic;                      -- 1 = 3G-SDI level A mode
        std:        out hd_vidstd_type;                 -- video format code
        locked:     out std_logic;                      -- asserted when locked to video
        ln:         out hd_vpos_type;                   -- line number output
        ln_valid:   out std_logic                       -- asserted when ln is valid
    );
end triple_sdi_autodetect_ln;

architecture synth of triple_sdi_autodetect_ln is


-------------------------------------------------------------------------------
-- Constant definitions
--

--
-- State machine state assignments
--

constant STATE_WIDTH :  integer := 4;
constant STATE_MSB :    integer := STATE_WIDTH - 1;

subtype state is std_logic_vector(STATE_MSB downto 0);

constant ACQ0 : state := "0000";
constant ACQ1 : state := "0001";
constant ACQ2 : state := "0010";
constant ACQ3 : state := "0011";
constant ACQ4 : state := "0100";
constant ACQ5 : state := "0101";
constant ACQ6 : state := "0110";
constant ACQ7 : state := "0111";
constant LCK0 : state := "1000";
constant LCK1 : state := "1001";
constant LCK2 : state := "1010";
constant LCK3 : state := "1011";
constant LCK4 : state := "1100";
constant ERR :  state := "1101";

--
-- The MAX_ERRCNT constant indicates the maximum number of consecutive frames 
-- that do not match the currently locked standard's parameters. If MAX_ERRCNT
-- is exceeded the locked signal will be negated and the state machine will
-- attempt to match the new video standard.
--
-- Increasing the MAX_ERRCNT value improves the tolerance to errors in the
-- video stream. However, it also increases the latency for the module to
-- lock to a new standard when the input standard changes. If some external
-- logic knows that the input video standard has changed, the state machine
-- can be forced to reacquire the new standard more quickly by asserted the
-- reacquire input for one clock cycle. This forces the state machine to start
-- the process of identifying the new standard without having to wait for
-- it to reach the MAX_ERRCNT number of errored frames before starting this
-- process.
--

constant ERRCNT_WIDTH : integer := 3;
constant ERRCNT_MSB :   integer := ERRCNT_WIDTH - 1;

constant MAX_ERRCNT :   std_logic_vector(ERRCNT_MSB downto 0) := "010";

--
-- The loops counter is an internal 4-bit counter used by the FSM to sequence
-- through the various video formats, looking for matches.
--

constant LOOPS_WIDTH :  integer := 4;
constant LOOPS_MSB :    integer := LOOPS_WIDTH - 1;

constant HCNT_MSB :     integer := 13;

constant LAST_VIDEO_FORMAT_CODE_NORMAL : hd_vidstd_type := HD_FMT_720p_24;
constant LAST_VIDEO_FORMAT_CODE_3GA :    hd_vidstd_type := HD_FMT_1080p_50;

-------------------------------------------------------------------------------
-- Signal definitions
--

signal std_int :        hd_vidstd_type      -- internal video std output code
                            := (others => '0');
signal word_counter :   std_logic_vector(HCNT_MSB downto 0) := (others => '0');    
                                            -- counts words per line
signal trs_to_counter : std_logic_vector(HCNT_MSB downto 0) := (others => '0');       
                                            -- TRS timeout counter
signal trs_tc :         std_logic_vector(HCNT_MSB downto 0);       
                                            -- terminal count for trs_to_counter
signal line_counter :   hd_vpos_type        -- counts lines per field or frame
                            := (others => '0');
signal line_tc :        hd_vpos_type;       -- terminal count for line counter
signal current_state :  state := ACQ0;      -- FSM current state
signal next_state :     state;              -- FSM next state
signal en_wcnt :        std_logic;          -- enables word counter
signal en_lcnt :        std_logic;          -- enables line counter
signal clr_wcnt :       std_logic;          -- clears word counter
signal clr_lcnt :       std_logic;          -- clears line counter
signal set_locked :     std_logic;          -- asserts the locked signal
signal clr_locked :     std_logic;          -- clears the locked signal
signal clr_errcnt :     std_logic;          -- clears the error counter
signal inc_errcnt :     std_logic;          -- increments the error counter
signal loops :          std_logic_vector(LOOPS_MSB downto 0) := (others => '0');
                                            -- iteration loop counter used by FSM
signal clr_loops :      std_logic;          -- clears loop counter
signal inc_loops :      std_logic;          -- increments loop counter
signal loops_tc :       std_logic;          -- asserted when loop counter equals 8
signal ld_std :         std_logic;          -- load std register
signal errcnt :         std_logic_vector(ERRCNT_MSB downto 0) := (others => '0');
                                            -- error counter
signal maxerrs :        std_logic;          -- asserted when error counter reaches max allowed
signal match :          std_logic;          -- asserted when video standard match is found
signal match_words :    std_logic := '0';   -- word counter matches video standard
signal match_lines :    std_logic := '1';   -- line counter matches video standard
signal compare_sel :    std_logic;          -- controls comparator input MUX
signal cmp_mux :        hd_vidstd_type;     -- comparator input MUX
signal cmp_wcnt :       std_logic_vector(HCNT_MSB-1 downto 0);       
                                            -- word count comparison value
signal wpl :            std_logic_vector(HCNT_MSB-1 downto 0);
                                            -- calculated words per line (corrected for 3GA)
signal cmp_lcnt :       hd_vpos_type;       -- line count comparison value
signal first_act :      std_logic := '0';   -- asserted on first active line
signal last_v :         std_logic := '0';   -- registered version of V bit from last line
signal v :              std_logic;          -- vertical blanking interval indicator (V bit)
signal f :              std_logic;          -- field indicator (F bit)
signal trs_timeout :    std_logic;          -- timed out waiting for TRS
signal first_timeout :  std_logic;          -- timed out waiting for first line
signal timeout :        std_logic;          -- timeout condition
signal locked_q :       std_logic := '0';   -- locked flip-flop
signal ln_valid_q :     std_logic := '0';   -- ln_valid flip-flop
signal reset_delay :    std_logic_vector(7 downto 0) := (others => '0');
                                            -- delay register for reset signal
signal reset :          std_logic;          -- module reset
signal ln_counter :     hd_vpos_type        -- counter for the ln generator
                            := (others => '0');
signal ln_init :        hd_vpos_type;       -- init value for the counter
signal ln_max :         hd_vpos_type;       -- max ln value for the current std
signal ln_tc :          std_logic;          -- asserted when ln_counter = ln_max
signal ln_load :        std_logic;          -- loads the ln_counter with ln_init
signal std_reg :        hd_vidstd_type      -- holds internal copy of std for ln generation logic
                            := (others => '0');
signal reacquire_sync : std_logic := '0';   -- sync register for reacquire
signal reacquire_q :    std_logic := '0';   -- sync register for reacquire
signal last_code :      hd_vidstd_type;     -- last code in search list
signal a3g_reg :        std_logic := '0';   -- input register for a3g port

begin

    process(clk)
    begin
        if rising_edge(clk) then
            a3g_reg <= a3g;
        end if;
    end process;

    --
    -- reacquire synchronizer
    --
    -- Since reacquire is a direct input to the FSM from parts unknown, make sure
    -- it is synchronous to the local clock before feeding it to the state machine.
    --
    process(clk, reset)
    begin
        if reset = '1' then
            reacquire_q <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                reacquire_q <= reacquire;
            end if;
        end if;
    end process;

    process(clk, reset)
    begin
        if reset = '1' then
            reacquire_sync <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                reacquire_sync <= reacquire_q;
            end if;
        end if;
    end process;

    --
    -- word counter
    --
    -- The word counter counts the number of words detected during a video line.
    --
    process(clk, reset)
    begin
        if reset = '1' then
            word_counter <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if clr_wcnt = '1' then
                    word_counter <= (others => '0');
                elsif en_wcnt = '1' then
                    word_counter <= word_counter + 1;
                end if;
            end if;
        end if;
    end process;

    --
    -- trs_to_counter
    --
    -- This timer will timeout if TRS symbols are not received on a periodic
    -- basis, causing the trs_timeout signal to be asserted.
    --
    process(clk, reset)
    begin
        if reset = '1' then
            trs_to_counter <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if eav = '1' or sav = '1' then
                    trs_to_counter <= (others => '0');
                else
                    trs_to_counter <= trs_to_counter + 1;
                end if;
            end if;
        end if;
    end process;
    
    trs_tc <= (others => '1');
    trs_timeout <= '1' when trs_to_counter = trs_tc else '0';

    --
    -- line counter
    --
    -- The line counter counts the number of lines in a field or frame. The 
    -- first_timeout signal will be asserted if the line counter reaches terminal
    -- count before the FSM clears the counter at the beginning of a new field or
    -- frame.
    -- 
    process(clk, reset)
    begin
        if reset = '1' then
            line_counter <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if clr_lcnt = '1' then
                    line_counter <= (others => '0');
                elsif en_lcnt = '1' and eav = '1' then
                    line_counter <= line_counter + 1;
                end if;
            end if;
        end if;
    end process;

    line_tc <= (others => '1');
    first_timeout <= '1' when line_counter = line_tc else '0';

    --
    -- The timeout signal will be asserted if either trs_timeout or first_timeout
    -- are asserted.
    --
    timeout <= trs_timeout or first_timeout;

    --
    -- error counter
    --
    -- The error counter is incremented by the FSM when an error is detected. When
    -- the error counter reaches MAX_ERRCNT, the maxerrs signal will be asserted.
    --
    process(clk, reset)
    begin
        if reset = '1' then
            errcnt <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if clr_errcnt = '1' then
                    errcnt <= (others => '0');
                elsif inc_errcnt = '1' then
                    errcnt <= errcnt + 1;
                end if;
            end if;
        end if;
    end process;

    maxerrs <= '1' when errcnt = MAX_ERRCNT else '0';

    --
    -- loop counter
    --
    -- The loop counter is a 4-bit binary up counter used by the FSM. It is used to
    -- cycle through the word & line count values for each of the supported video
    -- standards so that they can be compared to the values found in the input
    -- video stream. The loops_tc signal is asserted when the loop counter reaches
    -- its terminal count.
    --
    process(clk, reset)
    begin
        if reset = '1' then
            loops <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if clr_loops = '1' then
                    loops <= (others => '0');
                elsif inc_loops = '1' then
                    loops <= loops + 1;
                end if;
            end if;
        end if;
    end process;

    last_code <= LAST_VIDEO_FORMAT_CODE_3GA when a3g_reg = '1' else
                 LAST_VIDEO_FORMAT_CODE_NORMAL;

    loops_tc <= '1' when loops = last_code else '0';

    --
    -- std_int register
    --
    -- This register holds the detected video standard code.
    --
    process(clk, reset)
    begin
        if reset = '1' then
            std_int <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if ld_std = '1' then
                    std_int <= loops;
                end if;
            end if;
        end if;
    end process;

    std <= std_int;

    --
    -- video timing logic
    --
    -- The following logic generates various video timing signals:
    --
    -- v is the vertical blanking indicator bit and is only valid when eav or sav
    -- are asserted. v is really just the vid_in[7] bit, but is reassigned to the
    -- more descriptive v signal.
    --
    -- f is the field indicator bit and is only valid when eav or sav are asserted.
    -- f is really just the vid_in[8] bit, but is reassigned to the more descriptive
    -- f signal.
    --
    -- last_v is a register that holds the value of v from the last line. This
    -- register loads whenever eav is asserted. It is used to detect the rising
    -- edge of the V signal to generate the first_act signal.
    --
    -- first_act indicates the first active line of a field or frame.  
    --
    v <= vid_in(7);
    f <= vid_in(8);

    process(clk, reset)
    begin
        if reset = '1' then
            last_v <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if eav = '1' then
                    last_v <= v;
                end if;
            end if;
        end if;
    end process;

    process(clk, reset)
    begin
        if reset = '1' then
            first_act <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if eav = '1' then
                    first_act <= last_v and not v;
                end if;
            end if;
        end if;
    end process;

    --
    -- locked flip-flop
    --
    -- This flip flop is controlled by the finite state machine.
    --
    process(clk, reset)
    begin
        if reset = '1' then
            locked_q <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if clr_locked = '1' then
                    locked_q <= '0';
                elsif set_locked = '1' then
                    locked_q <= '1';
                end if;
            end if;
        end if;
    end process;

    locked <= locked_q;

    --
    -- comparison logic
    --
    -- The comparison logic is used to compare the word and line counts found in 
    -- the video stream against the known values for the various video standards.
    -- To reduce the size of the implementation, the word and line counts are
    -- compared sequentially against the known word and line counts using one
    -- comparator for the words and one for the lines, rather than doing a parallel
    -- comparison against all known values. The FSM controls this sequential search.
    --
    process(cmp_mux)
    begin
        case cmp_mux is
            when HD_FMT_1035i_30    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2200, HCNT_MSB));
            when HD_FMT_1080i_25b   => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2376, HCNT_MSB));
            when HD_FMT_1080i_30    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2200, HCNT_MSB));
            when HD_FMT_1080i_25    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2640, HCNT_MSB));
            when HD_FMT_1080p_30    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2200, HCNT_MSB));
            when HD_FMT_1080p_25    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2640, HCNT_MSB));
            when HD_FMT_1080p_24    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2750, HCNT_MSB));
            when HD_FMT_720p_60     => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(1650, HCNT_MSB));
            when HD_FMT_1080sF_24   => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2750, HCNT_MSB));
            when HD_FMT_720p_50     => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(1980, HCNT_MSB));
            when HD_FMT_720p_30     => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(3300, HCNT_MSB));
            when HD_FMT_720p_25     => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(3960, HCNT_MSB));
            when HD_FMT_720p_24     => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(4125, HCNT_MSB));
            when HD_FMT_1080p_60    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(1100, HCNT_MSB));
            when HD_FMT_1080p_50    => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(1320, HCNT_MSB));
            when others             => cmp_wcnt <= std_logic_vector(TO_UNSIGNED(2200, HCNT_MSB));
        end case;
    end process;

    process(cmp_mux)
    begin
        case cmp_mux is
            when HD_FMT_1035i_30    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(517,  HD_VCNT_WIDTH));
            when HD_FMT_1080i_25b   => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(540,  HD_VCNT_WIDTH));
            when HD_FMT_1080i_30    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(540,  HD_VCNT_WIDTH));
            when HD_FMT_1080i_25    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(540,  HD_VCNT_WIDTH));
            when HD_FMT_1080p_30    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(1080, HD_VCNT_WIDTH));
            when HD_FMT_1080p_25    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(1080, HD_VCNT_WIDTH));
            when HD_FMT_1080p_24    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(1080, HD_VCNT_WIDTH));
            when HD_FMT_720p_60     => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(720,  HD_VCNT_WIDTH));
            when HD_FMT_1080sF_24   => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(540,  HD_VCNT_WIDTH));
            when HD_FMT_720p_50     => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(720,  HD_VCNT_WIDTH));
            when HD_FMT_720p_30     => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(720,  HD_VCNT_WIDTH));
            when HD_FMT_720p_25     => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(720,  HD_VCNT_WIDTH));
            when HD_FMT_720p_24     => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(720,  HD_VCNT_WIDTH));
            when HD_FMT_1080p_60    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(1080, HD_VCNT_WIDTH));
            when HD_FMT_1080p_50    => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(1080, HD_VCNT_WIDTH));
            when others             => cmp_lcnt <= std_logic_vector(TO_UNSIGNED(540,  HD_VCNT_WIDTH));
        end case;
    end process;

    cmp_mux <= std_int when compare_sel = '1' else loops;
    wpl <= word_counter(HCNT_MSB downto 1) when a3g_reg = '1' else
           word_counter(HCNT_MSB-1 downto 0);

    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                if wpl = cmp_wcnt then
                    match_words <= '1';
                else
                    match_words <= '0';
                end if;
            end if;
        end if;
    end process;
   
    process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                if line_counter = cmp_lcnt then
                    match_lines <= '1';
                else
                    match_lines <= '0';
                end if;
            end if;
        end if;
    end process;
   
    match <= match_words and match_lines;

    --
    -- Finite state machine
    --
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= ACQ0;
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if reacquire_sync = '1' then
                    current_state <= ACQ0;
                else
                    current_state <= next_state;
                end if;
            end if;
        end if;
    end process;

    process(current_state, sav, first_act, v, loops_tc, match, maxerrs, timeout, f)
    begin
        case current_state is
            when ACQ0 =>
                if sav = '1' and first_act = '1' then
                    next_state <= ACQ1;
                else
                    next_state <= ACQ0;
                end if;

            when ACQ1 => 
                if sav = '1' then
                    next_state <= ACQ2;
                else
                    next_state <= ACQ1;
                end if;

            when ACQ2 => 
                if sav = '1' and v = '1' then
                    next_state <= ACQ3;
                else
                    next_state <= ACQ2;
                end if;

            when ACQ3 => 
                next_state <= ACQ4;

            when ACQ4 => 
                next_state <= ACQ5;

            when ACQ5 => 
                if match = '1' then
                    next_state <= ACQ7;
                else
                    next_state <= ACQ6;
                end if;

            when ACQ6 => 
                if loops_tc = '1' then
                    next_state <= ACQ0;
                else
                    next_state <= ACQ4;
                end if;

            when ACQ7 => 
                next_state <= LCK0;

            when LCK0 => 
                if timeout = '1' then
                    next_state <= ERR;
                elsif sav = '1' and first_act = '1' and f = '0' then
                    next_state <= LCK1;
                else
                    next_state <= LCK0;
                end if;

            when LCK1 => 
                if timeout = '1' then
                    next_state <= ERR;
                elsif sav = '1' then
                    next_state <= LCK2;
                else
                    next_state <= LCK1;
                end if;

            when LCK2 => 
                if timeout = '1' then
                    next_state <= ERR;
                elsif sav = '1' and v = '1' then
                    next_state <= LCK3;
                else
                    next_state <= LCK2;
                end if;

            when LCK3 => 
                next_state <= LCK4;

            when LCK4 => 
                if match = '1' then
                    next_state <= LCK0;
                else
                    next_state <= ERR;
                end if;

            when ERR => 
                if maxerrs = '1' then
                    next_state <= ACQ0;
                else
                    next_state <= LCK0;
                end if;

            when others => 
                next_state <= ACQ0;
        end case;
    end process;

    process(current_state, sav, first_act, match)
    begin
        en_wcnt         <= '0';
        en_lcnt         <= '0';
        clr_wcnt        <= '0';
        clr_lcnt        <= '0';
        set_locked      <= '0';
        clr_locked      <= '0';
        clr_errcnt      <= '0';
        inc_errcnt      <= '0';
        clr_loops       <= '0';
        inc_loops       <= '0';
        ld_std          <= '0';
        compare_sel     <= '0';

        case current_state is
            when ACQ0 => 
                clr_errcnt <= '1';
                clr_locked <= '1';
                clr_wcnt <= '1';
                clr_lcnt <= '1';

            when ACQ1 => 
                en_wcnt <= '1';
                en_lcnt <= '1';

            when ACQ2 => 
                en_lcnt <= '1';

            when ACQ3 => 
                clr_loops <= '1';

            when ACQ6 => 
                inc_loops <= '1';

            when ACQ7 => 
                ld_std <= '1';
                clr_wcnt <= '1';
                set_locked <= '1';

            when LCK0 => 
                en_wcnt <= '1';
                clr_lcnt <= '1';
                compare_sel <= '1';
                if sav = '1' then
                    clr_wcnt <= '1';
                end if;

            when LCK1 => 
                en_wcnt <= '1';
                en_lcnt <= '1';
                compare_sel <= '1';

            when LCK2 => 
                en_lcnt <= '1';
                compare_sel <= '1';

            when LCK3 => 
                compare_sel <= '1';
               
            when LCK4 => 
                compare_sel <= '1';
                clr_wcnt <= '1';
                if match = '1' then
                    clr_errcnt <= '1';
                end if;

            when ERR => 
                inc_errcnt <= '1';
                clr_wcnt <= '1';
                compare_sel <= '1';

            when others =>
                null; 
        end case;   
    end process;

    --
    -- Reset logic
    --
    -- The reset signal is maintained to the logic in this module for a few
    -- clock cycles after the global reset signal is removed.
    --
    reset <= rst or not reset_delay(7);

    process(clk, rst)
    begin
        if rst = '1' then
            reset_delay <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                reset_delay <= (reset_delay(6 downto 0) & '1');
            end if;
        end if;
    end process;


    --
    -- ln generator
    --
    -- This code implements the line number generator. The line number generator
    -- is a counter that increments on the XYZ word of each EAV. It is initialized
    -- on the first active line of either  field. The initial value depends on
    -- the current standard and the field bit. The counter wraps back to zero when 
    -- it reaches the maximum line count for the current standard.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            std_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if set_locked = '1' then
                    std_reg <= std_int;
                end if;
            end if;
        end if;
    end process;

    ln_load <= last_v and not v;

    process(clk, rst)
    begin
        if rst = '1' then
            ln_valid_q <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if locked_q = '0' then
                    ln_valid_q <= '0';
                elsif eav = '1' and ln_load = '1' then
                    ln_valid_q <= '1';
                end if;
            end if;
        end if;
    end process;

    ln_valid <= ln_valid_q;

    process(std_reg, f)
    begin
        case std_reg is
            when HD_FMT_1035i_30 =>
                if f = '0' then
                    ln_init <= std_logic_vector(TO_UNSIGNED(41,  HD_VCNT_WIDTH));
                else
                    ln_init <= std_logic_vector(TO_UNSIGNED(603,  HD_VCNT_WIDTH));
                end if;

            when HD_FMT_1080i_25b =>
                if f = '0' then
                    ln_init <= std_logic_vector(TO_UNSIGNED(81,  HD_VCNT_WIDTH));
                else
                    ln_init <= std_logic_vector(TO_UNSIGNED(706,  HD_VCNT_WIDTH));
                end if;

            when HD_FMT_1080i_30 =>
                if f = '0' then
                    ln_init <= std_logic_vector(TO_UNSIGNED(21,  HD_VCNT_WIDTH));
                else
                    ln_init <= std_logic_vector(TO_UNSIGNED(584,  HD_VCNT_WIDTH));
                end if;

            when HD_FMT_1080i_25 =>
                if f = '0' then
                    ln_init <= std_logic_vector(TO_UNSIGNED(21,  HD_VCNT_WIDTH));
                else
                    ln_init <= std_logic_vector(TO_UNSIGNED(584,  HD_VCNT_WIDTH));
                end if;

             when HD_FMT_1080p_30 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(42,  HD_VCNT_WIDTH));
                
             when HD_FMT_1080p_25 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(42,  HD_VCNT_WIDTH));
                
             when HD_FMT_1080p_24 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(42,  HD_VCNT_WIDTH));
                
             when HD_FMT_720p_60 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(26,  HD_VCNT_WIDTH));
                
             when HD_FMT_720p_50 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(26,  HD_VCNT_WIDTH));

             when HD_FMT_720p_30 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(26,  HD_VCNT_WIDTH));

             when HD_FMT_720p_25 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(26,  HD_VCNT_WIDTH));

             when HD_FMT_720p_24 => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(26,  HD_VCNT_WIDTH));

             when HD_FMT_1080sF_24 =>
                if f = '0' then
                    ln_init <= std_logic_vector(TO_UNSIGNED(21,  HD_VCNT_WIDTH));
                else
                    ln_init <= std_logic_vector(TO_UNSIGNED(584,  HD_VCNT_WIDTH));
                end if;


            when others => 
                 ln_init <= std_logic_vector(TO_UNSIGNED(21,  HD_VCNT_WIDTH));

        end case;   
    end process;

    process(std_reg)
    begin
        case std_reg is
            when HD_FMT_1035i_30 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_1080i_25b => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1250, HD_VCNT_WIDTH));

            when HD_FMT_1080i_30 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_1080i_25 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_1080p_30 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_1080p_25 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_1080p_24 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_720p_60 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(750, HD_VCNT_WIDTH));

            when HD_FMT_720p_50 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(750, HD_VCNT_WIDTH));
         
            when HD_FMT_720p_30 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(750, HD_VCNT_WIDTH));
         
            when HD_FMT_720p_25 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(750, HD_VCNT_WIDTH));
         
            when HD_FMT_720p_24 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(750, HD_VCNT_WIDTH));
         
            when HD_FMT_1080sF_24 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_1080p_60 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when HD_FMT_1080p_50 => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));

            when others => 
                ln_max <= std_logic_vector(TO_UNSIGNED(1125, HD_VCNT_WIDTH));
                
        end case;
    end process;

    ln_tc <= '1' when ln_counter = ln_max else '0';

    process(clk, rst)
    begin
        if rst = '1' then
            ln_counter <= (0 => '1', others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if eav = '1' then
                    if ln_load = '1' then
                        ln_counter <= ln_init;
                    elsif ln_tc = '1' then
                        ln_counter <= (0 => '1', others => '0');
                    else
                        ln_counter <= ln_counter + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    ln <= ln_counter;

end synth;

