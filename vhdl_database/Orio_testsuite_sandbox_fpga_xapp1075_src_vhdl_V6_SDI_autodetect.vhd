-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: autodetect.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2004-12-15 16:11:18-07 $
-- /___/   /\    Date Created: Marcj 11, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: autodetect.vhd,rcs $
-- Revision 1.0  2004-12-15 16:11:18-07  jsnow
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
-- This module examines a digital video stream and determines which of six
-- supported video standards matches the video stream. The supported video 
-- standards are:
-- 
-- Video Format                            Corresponding Standards
-- ------------------------------------------------------------------------------
-- NTSC 4:2:2 component video              SMPTE 125M,ITU-R BT.601,ITU-R BT.656
-- NTSC 4:2:2 16x9 component video         SMPTE 267M
-- NTSC 4:4:4 component 13.5MHz sample     SMPTE RP 174
-- PAL 4:2:2 component video               ITU-R BT.656
-- PAL 4:2:2 16x9 component video          ITU-R BT.601
-- PAL 4:4:4 component 13.5MHz sample      ITU-R BT.799    
-- 
-- The autodetect module is a finite state machine (FSM) that looks for TRS
-- symbols and measures the number of samples per line of video based on the
-- positions of the TRS symbols.
-- 
-- The FSM executes two main loops, the ACQUIRE loop and the LOCKED loop. In the 
-- ACQUIRE loop, the FSM attempts to find eight consecutive lines with the same
-- number of samples. Once it does this, the FSM then compares the number of
-- samples per video line to that of each of the six known standards. If a
-- a matching standard is found, the FSM sets the locked output and also outputs
-- a 3-bit code representing the video standard on the std output port then
-- it advances to the LOCKED loop.
-- 
-- In the LOCKED loop, the FSM continuously compares the number of samples of 
-- each received video line to the correct number for the current video 
-- standard. If the number of consecutive lines with the incorrect number of 
-- samples exceeds the MAX_ERR_CNT value, then the locked output is negated and 
-- the FSM returns to the ACQUIRE loop.
-- 
-- The autodetect module has the following inputs:
-- 
-- clk: Input clock running at the video word rate.
-- 
-- ce: Clock enable input.
-- 
-- rst: Asynchronous reset input.
-- 
-- reacquire: Forces the autodetect unit to redetect the video format when
-- asserted high. This is essentially a synchronous reset to the FSM. The FSM
-- will not start the reacquire loop until the reacquire input goes low.
-- 
-- vid_in: This is the video data input port. If eight bit video is being used, 
-- the LS 2-bits of the vid_in input port should be grounded.
-- 
-- rx_trs: This input must be asserted on the first word of every TRS symbol
-- present in the input video stream.
-- 
-- rx_xyz: This input must be asserted during the XYZ word of every TRS symbol
-- present in the input video stream.
-- 
-- rx_xyz_err: This input must be asserted during when the XYZ word contains an
-- error according to the 4:2:2 format.
-- 
-- rx_xyz_err_4444: This input identifies errors in XYZ words for the 4:4:4:4 
-- formats.
-- 
-- The autodetect module has the following outputs.
-- 
-- std: A 3-bit output port that indicates which standard has been detected. 
-- This code is not valid unless the locked output is asserted. The std code 
-- values are:
-- 
-- 000:    NTSC 4:2:2 component video
-- 001:    invalid
-- 010:    NTSC 4:2:2 16x9 component video
-- 011:    NTSC 4:4:4 13.5MHz component video
-- 100:    PAL 4:2:2 component video
-- 101:    invalid
-- 110:    PAL 4:2:2 16x9 component video
-- 111:    PAL 4:4:4 13.5MHz component video
-- 
-- locked: Asserted high when the autodetect unit is locked to the incoming 
-- video standard.
-- 
-- xyz_err: This signal indicates the detection of an XYZ word error. This 
-- output is generated by multiplexing the rx_xyz_err and rx_xyz_err_4444 inputs
-- together and using the detected video standard as the control for the MUX.
-- 
-- s4444: For the 4444 component video standards, this signal reflects the S 
-- bits in the TRS word. The S bit is 1 for YCbCr and 0 for RGB.
--
-------------------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity autodetect is
    port (
        clk:            in    std_ulogic;                       -- clock input
        ce:             in    std_ulogic;                       -- clock enable
        rst:            in    std_ulogic;                       -- async reset input
        reacquire:      in    std_ulogic;                       -- forces autodetect to reacquire standard
        vid_in:         in    std_ulogic_vector(9 downto 0);    -- video data input
        rx_trs:         in    std_ulogic;                       -- must be 1 on first word of TRS
        rx_xyz:         in    std_ulogic;                       -- must be 1 during the TRS XYZ word
        rx_xyz_err:     in    std_ulogic;                       -- XYZ word error input for all but 4444
        rx_xyz_err_4444:in    std_ulogic;                       -- XYZ word error for 4444 standards
        vid_std:        out   std_ulogic_vector(2 downto 0);    -- video standard code
        locked:         out   std_ulogic;                       -- asserted when synced to input video
        xyz_err:        out   std_ulogic;                       -- asserted when XYZ word contain an error
        s4444:          out   std_ulogic);                      -- status of the S-bit in 4444 XYZ word
end;

architecture synth of autodetect is

constant HCNT_WIDTH:        integer := 12;  
constant HCNT_MSB :         integer := HCNT_WIDTH - 1;

subtype video     is std_ulogic_vector(9 downto 0);
subtype hposition is std_logic_vector(HCNT_MSB downto 0);
subtype stdcode   is std_ulogic_vector(2 downto 0);

    
-------------------------------------------------------------------------------
-- Constant definitions
--

--
-- This group of constants defines the size of the error counter. It must be
-- big enough to handle the maximum error count.
--
constant ERRCNT_WIDTH :     integer := 4;               -- Width of errcnt
constant ERRCNT_MSB :       integer := ERRCNT_WIDTH - 1;-- MS bit # of errcnt

--
-- This constant controls the maximum number of allowable consecutive errors 
-- before the FSM begins to reacquire the video standard. Be sure to size
-- error counter's width appropriately with the ERRCNT_WIDTH parameter if this 
-- value is changed.
--
constant MAX_ERR_CNT :      std_logic_vector(ERRCNT_MSB downto 0)
    := std_logic_vector(TO_UNSIGNED(8, ERRCNT_WIDTH));

--
-- This group of constants defines the total number of clocks per line 
-- for the various supported video standards.
--
constant CNT_NTSC_422:      hposition := std_logic_vector(TO_UNSIGNED(1716, HCNT_WIDTH));
constant CNT_NTSC_422_WIDE: hposition := std_logic_vector(TO_UNSIGNED(2288, HCNT_WIDTH));
constant CNT_NTSC_4444:     hposition := std_logic_vector(TO_UNSIGNED(3432, HCNT_WIDTH));
constant CNT_PAL_422:       hposition := std_logic_vector(TO_UNSIGNED(1728, HCNT_WIDTH));
constant CNT_PAL_422_WIDE:  hposition := std_logic_vector(TO_UNSIGNED(2304, HCNT_WIDTH));
constant CNT_PAL_4444:      hposition := std_logic_vector(TO_UNSIGNED(3456, HCNT_WIDTH));

--
-- This group of constants defines the states of the FSM.
--                        
constant STATE_WIDTH:       integer := 4;
constant STATE_MSB:         integer := STATE_WIDTH - 1;

subtype state is std_ulogic_vector(STATE_MSB downto 0);

constant ACQ0:              state := "0000";
constant ACQ1:              state := "0001";
constant ACQ2:              state := "0010";
constant ACQ3:              state := "0011";
constant ACQ4:              state := "0100";
constant ACQ5:              state := "0101";
constant ACQ6:              state := "0110";
constant ACQ7:              state := "0111";
constant LCK0:              state := "1000";
constant LCK1:              state := "1001";
constant LCK2:              state := "1010";
constant LCK3:              state := "1011";
constant ERR0:              state := "1100";
constant ERR1:              state := "1101";
constant ERR2:              state := "1110";
      
--
-- This group of constants defines the encoding of the std variable.
--
constant NTSC_422:          stdcode := "000";
constant NTSC_INVALID:      stdcode := "001";
constant NTSC_422_WIDE:     stdcode := "010";
constant NTSC_4444:         stdcode := "011";
constant PAL_422:           stdcode := "100";
constant PAL_INVALID:       stdcode := "101";
constant PAL_422_WIDE:      stdcode := "110";
constant PAL_4444:          stdcode := "111";

-------------------------------------------------------------------------------
-- Signal definitions
--

-- counters and registers
signal hcnt :           hposition;          -- horizontal counter
signal saved_hcnt :     hposition;          -- saves the hcnt value of a line
signal current_state :  state;              -- FSM current state
signal next_state :     state;              -- FSM next state
signal loops :          
    std_logic_vector(2 downto 0);           -- iteration counter
signal errcnt :         
    std_logic_vector(ERRCNT_MSB downto 0);  -- error counter
signal std :            stdcode;            -- internal vid_std register

-- FSM inputs
signal composite :      std_ulogic;         -- 1 = composite, 0 = component
signal eav :            std_ulogic;         -- asserted when EAV received
signal sav :            std_ulogic;         -- asserted when SAV received
signal loops_eq_0 :     std_ulogic;         -- asserted when loops = 0
signal loops_eq_7 :     std_ulogic;         -- asserted when loops = 7
signal loops_eq_1 :     std_ulogic;         -- asserted when loops = 1
signal match :          std_ulogic;         -- comparator output
signal int_xyz_err :    std_ulogic;         -- error in XYZ protection bits
signal max_errs :       std_ulogic;         -- asserted when errcnt reaches max

-- FSM outputs
signal clr_loops :      std_ulogic;         -- clears loops counter
signal inc_loops :      std_ulogic;         -- increments loops counter
signal clr_errcnt :     std_ulogic;         -- clears the error counter
signal inc_errcnt :     std_ulogic;         -- increments the error counter
signal clr_locked :     std_ulogic;         -- clears the locked output
signal set_locked :     std_ulogic;         -- sets the locked output
signal clr_hcnt :       std_ulogic;         -- clears the hcnt counter
signal match_code :     
    std_ulogic_vector(1 downto 0);          -- comparator control bits
signal ld_std :         std_ulogic;         -- loads the vid std output reg
signal ld_saved_hcnt :  std_ulogic;         -- loads the saved hcnt register
signal ld_s4444 :       std_ulogic;         -- loads the s4444 flip-flop

-- other signals
signal cmp_a :          hposition;          -- A input to comparator
signal cmp_b :          hposition;          -- B input to comparator
signal samples :        hposition;          -- output of samples ROM                                        --   various supported video standards
signal samples_adr :    
    std_ulogic_vector(2 downto 0);          -- address inputs for samples ROM

begin

    --
    -- hcnt: horizontal counter
    --
    -- The horizontal counter increments every clock cycle to keep track of the
    -- current horizontal position. If clr_hcnt is asserted by the FSM, hcnt is
    -- reloaded with a value of 1. A value of 1 is used because of the latency
    -- involved in detected the TRS symbol and deciding whether to clear hcnt or
    -- not.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            hcnt <= (0 => '1', others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_hcnt = '1') then
                    hcnt <= (0 => '1', others => '0');
                else
                    hcnt <= hcnt + 1;
                end if;
            end if;
        end if;
    end process;

    --
    -- saved_hcnt
    --
    -- This register loads the current value of the hcnt counter when 
    -- ld_saved_hcnt is asserted.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            saved_hcnt <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_saved_hcnt = '1') then
                    saved_hcnt <= hcnt;
                end if;
            end if;
        end if;
    end process;

    --
    -- error counter
    --
    -- This counter increments when inc_errcnt is asserted by the FSM. It clears
    -- when the FSM asserts clr_errcnt. When the error counter reaches the 
    -- MAX_ERR_CNT value, max_errs is asserted.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            errcnt <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_errcnt = '1') then
                    errcnt <= (others => '0');
                elsif (inc_errcnt = '1') then
                    errcnt <= errcnt + 1;
                end if;
            end if;
        end if;
    end process;

    max_errs <= '1' when errcnt = MAX_ERR_CNT else '0';

    --
    -- loops
    --
    -- This iteration counter is used by the FSM for two purposes. First, it is
    -- used to count the number of consecutive times that the SAV occurs at the 
    -- same hcnt value. Second, it is used to index through the samples ROM to 
    -- search for a matching video standard.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            loops <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_loops = '1') then
                    loops <= (others => '0');
                elsif (inc_loops = '1') then
                    loops <= loops + 1;
                end if;
            end if;
        end if;
    end process;

    --
    -- std
    --
    -- This register holds the code representing the video standard found by the
    -- FSM. If the FSM asserted ld_std, the register loads the current value of 
    -- the loops iteration counter.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            std <= NTSC_422;
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_std = '1') then
                    std <= std_ulogic_vector(loops);
                end if;
            end if;
        end if;
    end process;

    -------------------------------------------------------------------------------
    -- FSM
    --
    -- The finite state machine is implemented in three processes, one for the
    -- current_state register, one to generate the next_state value, and the
    -- third to decode the current_state to generate the outputs.
     
    --
    -- FSM: current_state register
    --
    -- This code implements the current state register. It loads with the ACQ0
    -- state on reset and the next_state value with each rising clock edge.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            current_state <= ACQ0;
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (reacquire = '1') then
                    current_state <= ACQ0;
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
    process(current_state, rx_trs, eav, sav, int_xyz_err, composite, loops_eq_0,
            loops_eq_1, loops_eq_7, match, max_errs)
    begin
        case current_state is
            when ACQ0 =>    
                next_state <= ACQ1;

            when ACQ1 =>    
                if (rx_trs = '1') then
                    next_state <= ACQ2;
                else
                    next_state <= ACQ1;
                end if;

            when ACQ2 =>   
                if (eav = '1' or (sav = '1' and composite = '1')) then
                    next_state <= ACQ1;
                elsif (sav = '0') then
                    next_state <= ACQ2;
                else
                    if (loops_eq_0 = '1') then
                        next_state <= ACQ3;
                    elsif (loops_eq_1 = '1') then
                        next_state <= ACQ4;
                    elsif (loops_eq_7 = '1') then
                        next_state <= ACQ5;
                    else
                        next_state <= ACQ7;
                    end if;
                end if;
                            
            when ACQ3 =>   
                next_state <= ACQ1;

            when ACQ4 =>   
                next_state <= ACQ1;

            when ACQ5 =>   
                if (match = '1') then
                    next_state <= ACQ6;
                else
                    next_state <= ACQ0;
                end if;

            when ACQ6 =>   
                if (match = '1') then
                    next_state <= LCK0;
                elsif (loops_eq_7 = '1') then
                    next_state <= ACQ0;
                else
                    next_state <= ACQ6;
                end if;

            when ACQ7 =>   
                if (match = '1') then
                    next_state <= ACQ1;
                else
                    next_state <= ACQ0;
                end if;

            when LCK0 =>   
                if (rx_trs = '1') then
                    next_state <= LCK1;
                else
                    next_state <= LCK0;
                end if;

            when LCK1 =>   
                if (eav = '1') then
                    next_state <= LCK0;
                elsif (sav = '1' and int_xyz_err = '1') then
                    next_state <= ERR0;
                elsif (sav = '1' and int_xyz_err = '0') then
                    next_state <= LCK2;
                else
                    next_state <= LCK1;
                end if;

            when LCK2 =>   
                if (match = '1') then
                    next_state <= LCK3;
                else
                    next_state <= ERR1;
                end if;

            when LCK3 =>   
                next_state <= LCK0;
                    
            when ERR0 =>   
                next_state <= ERR1;

            when ERR1 =>   
                next_state <= ERR2;

            when ERR2 =>   
                if (max_errs = '1') then
                    next_state <= ACQ0;
                else
                    next_state <= LCK0;
                end if;

            when others =>
                next_state <= ACQ0;
        end case;
    end process;
            
    --
    -- FSM: outputs
    --
    -- This block decodes the current state to generate the various outputs of 
    -- the FSM.
    --
    process(current_state, std, rx_xyz)
    begin
        -- Unless specifically assigned in the case statement, all FSM outputs
        -- are low.
        clr_loops     <= '0';
        inc_loops     <= '0';
        clr_errcnt    <= '0';
        inc_errcnt    <= '0';
        clr_locked    <= '0';
        set_locked    <= '0';
        clr_hcnt      <= '0';
        ld_saved_hcnt <= '0';
        match_code    <= "00";
        ld_std        <= '0';
        ld_s4444      <= '0';
        
        case current_state is
            when ACQ0 =>
                clr_locked <= '1';
                clr_errcnt <= '1';
                clr_loops <= '1';

            when ACQ2 =>
                if (rx_xyz = '1') then
                    ld_s4444 <= '1';
                end if;

            when ACQ3 =>   
                inc_loops <= '1';
                clr_hcnt <= '1';

            when ACQ4 =>
                ld_saved_hcnt <= '1';
                clr_hcnt <= '1';
                inc_loops <= '1';

            when ACQ5 =>
                match_code <= "00";
                inc_loops <= '1';
                clr_hcnt <= '1';

            when ACQ6 =>
                inc_loops <= '1';
                ld_std <= '1';
                match_code <= "01";

            when ACQ7 =>
                match_code <= "00";
                clr_hcnt <= '1';
                inc_loops <= '1';

            when LCK0 =>   
                set_locked <= '1';

            when LCK1 =>   
                if (rx_xyz = '1' and (std = PAL_4444 or std = NTSC_4444)) then
                    ld_s4444 <= '1';
                end if;

            when LCK2 => 
                match_code <= "10";
                clr_hcnt <= '1';

            when LCK3 =>
                clr_errcnt <= '1';

            when ERR0 =>   
                clr_hcnt <= '1';

            when ERR1 =>   
                inc_errcnt <= '1';

            when others =>

        end case;            
    end process;

    --
    -- locked flip-flop
    --
    -- The locked signal is generated by the FSM to indicate when it is properly
    -- synchronized with the incoming video stream. This flip-flop is set when 
    -- the set_locked signal is asserted by the FSM and cleared when the 
    -- clr_locked signal is asserted by the FSM.
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            locked <= '0';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (clr_locked = '1') then
                    locked <= '0';
                elsif (set_locked = '1') then
                    locked <= '1';
                end if;
            end if;
        end if;
    end process;

    --
    -- These statements generate the composite, eav, sav, and int_xyz_err sigals.
    --
    composite <= not vid_in(9);
    eav <= vid_in(6) and rx_xyz;
    sav <= not vid_in(6) and rx_xyz;
    int_xyz_err <= rx_xyz_err_4444 when (std = NTSC_4444) or (std = PAL_4444) 
                   else rx_xyz_err; 

    --
    -- These statements decode the loops interation counter.
    --
    loops_eq_0 <= '1' when loops = "000" else '0';
    loops_eq_1 <= '1' when loops = "001" else '0';
    loops_eq_7 <= '1' when loops = "111" else '0';

    --
    -- This is the samples ROM. It contains the total number of samples on a 
    -- video line for each of the eight supported video standards.
    --
    process(samples_adr)
    begin
        case samples_adr is
            when NTSC_422 =>       samples <= CNT_NTSC_422;
            when NTSC_422_WIDE =>  samples <= CNT_NTSC_422_WIDE;
            when NTSC_4444 =>      samples <= CNT_NTSC_4444;
            when PAL_422 =>        samples <= CNT_PAL_422;
            when PAL_422_WIDE =>   samples <= CNT_PAL_422_WIDE;
            when PAL_4444 =>       samples <= CNT_PAL_4444;
            when others =>         samples <= (others => '0');
        end case;   
    end process;

    --
    -- This code implements a MUX to generate the address into the samples 
    -- counter. This address can come from either the loops counter or the std 
    -- register depending on the MSB of the match_code from the FSM.
    --
    samples_adr <= std when match_code(1) = '1' else std_ulogic_vector(loops);

    --
    -- This code implements the comparator that generates the match input to the
    -- FSM. It can compare hcnt to saved_hcnt, hcnt to the output of the samples
    -- ROM, or saved_hcnt to the output of the samples ROM depending the 
    -- match_code value.
    --
    cmp_a <= samples when match_code(0) = '1' else hcnt;
    cmp_b <= samples when match_code(1) = '1' else saved_hcnt;
    match <= '1' when cmp_a = cmp_b else '0';

     
    --
    -- Output register for s4444 signal
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            s4444 <= '1';
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (ld_s4444 = '1' and int_xyz_err = '0') then
                    s4444 <= vid_in(5);
                end if;
            end if;
        end if;
    end process;

    --
    -- vid_std output register
    --
    process(clk, rst)
    begin
        if (rst = '1') then
            vid_std <= "000";
        elsif (clk'event and clk = '1') then
            if (ce = '1') then
                if (set_locked = '1') then
                    vid_std <= std;
                end if;
            end if;
        end if;
    end process;

    xyz_err <= int_xyz_err;

end synth;