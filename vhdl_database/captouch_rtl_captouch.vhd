-- #################################################################################################
-- # << captouch - Capacitive Buttons for any FPGA! >>                                             #
-- # ********************************************************************************************* #
-- # Technology-agnostic controller to turn conductive pads into touch buttons.                    #
-- #                                                                                               #
-- # The controller evaluates the change of time required to charge the capacitance of the pads    #
-- # to the supply voltage. If there is a finger close to a pad, the pad's capacitance is          #
-- # increased requiring more time to get fully charged                                            #
-- #                                                                                               #
-- # The actual touch pads are connected to pad_io. The resulting (filtered/stabilized) button     #
-- # state is available via touch_o (1 when touched). The controller is calibrated by issuing a    #
-- # reset - either via the global async reset line (rstn_i) or via the sync rstn_sync_i signal,   #
-- # which can be driven by application logic. Make sure to NOT touch any pads while calibrating.  #
-- #                                                                                               #
-- # Electrical Requirements:                                                                      #
-- # - The pad_io signal is bi-directional and requires FPGA-internal tri-state drivers            #
-- # - Each pad connected to pad_io requires an external pull-up resistor (~1M Ohm) to the supply  #
-- #   voltage of the according FPGA IO bank                                                       #
-- # ********************************************************************************************* #
-- # BSD 3-Clause License                                                                          #
-- #                                                                                               #
-- # Copyright (c) 2021, Stephan Nolting. All rights reserved.                                     #
-- #                                                                                               #
-- # Redistribution and use in source and binary forms, with or without modification, are          #
-- # permitted provided that the following conditions are met:                                     #
-- #                                                                                               #
-- # 1. Redistributions of source code must retain the above copyright notice, this list of        #
-- #    conditions and the following disclaimer.                                                   #
-- #                                                                                               #
-- # 2. Redistributions in binary form must reproduce the above copyright notice, this list of     #
-- #    conditions and the following disclaimer in the documentation and/or other materials        #
-- #    provided with the distribution.                                                            #
-- #                                                                                               #
-- # 3. Neither the name of the copyright holder nor the names of its contributors may be used to  #
-- #    endorse or promote products derived from this software without specific prior written      #
-- #    permission.                                                                                #
-- #                                                                                               #
-- # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS   #
-- # OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF               #
-- # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE    #
-- # COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,     #
-- # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE #
-- # GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED    #
-- # AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     #
-- # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED  #
-- # OF THE POSSIBILITY OF SUCH DAMAGE.                                                            #
-- # ********************************************************************************************* #
-- # https://github.com/stnolting/captouch                                     (c) Stephan Nolting #
-- #################################################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity captouch is
  generic (
    F_CLOCK     : integer; -- frequency of clk_i in Hz
    NUM_PADS    : integer; -- number of touch pads
    SENSITIVITY : integer  -- 1=high, 2=medium, 3=low
  );
  port (
    -- global control --
    clk_i       : in    std_ulogic; -- clock
    rstn_i      : in    std_ulogic; -- async reset, low-active
    rstn_sync_i : in    std_ulogic; -- sync reset, low-active
    -- status --
    ready_o     : out   std_ulogic; -- system calibration done when high
    touch_o     : out   std_ulogic_vector(NUM_PADS-1 downto 0); -- touch pads state
    -- touch pads --
    pad_io      : inout std_logic_vector(NUM_PADS-1 downto 0)   -- capacitive touch pads
  );
end captouch;

architecture captouch_rtl of captouch is

  -- configuration --
  constant f_sample_c    : integer := 3300000; -- pad sample frequency in Hz
  constant scnt_size_c   : integer := 11; -- pad sample counter size in bits
  constant f_output_c    : integer := 10; -- max output state change frequency in Hz
  constant filter_size_c : integer := 3; -- output filter size in bits

  -- internal constants --
  constant sample_time_c : integer := (F_CLOCK / f_sample_c) - 1;
  constant output_time_c : integer := (f_sample_c / f_output_c) - 1;
  constant dcnt_size_c   : integer := scnt_size_c / 4;
  constant channel_one_c : std_logic_vector(NUM_PADS-1 downto 0) := (others => '1');
  constant filter_one_c  : std_ulogic_vector(filter_size_c-1 downto 0) := (others => '1');
  constant filter_zero_c : std_ulogic_vector(filter_size_c-1 downto 0) := (others => '0');

  -- generators --
  signal rstn_int       : std_ulogic := '0'; -- reset also via bitstream (if supported)
  signal sample_clk_gen : integer range 0 to sample_time_c;
  signal sample_clk     : std_ulogic;
  signal output_clk_gen : integer range 0 to output_time_c;
  signal output_clk     : std_ulogic;

  -- controller --
  type ctrl_state_t is (S_INIT_START, S_INIT_DISCHARGE, S_INIT_SAMPLE, S_RUN_START, S_RUN_DISCHARGE, S_RUN_SAMPLE);
  type ctrl_t is record
    state : ctrl_state_t;
    sync0 : std_logic_vector(NUM_PADS-1 downto 0); -- input synchronizer stage 0
    sync1 : std_logic_vector(NUM_PADS-1 downto 0); -- input synchronizer stage 1
    data  : std_ulogic_vector(NUM_PADS-1 downto 0); -- current pad state
    dcnt  : std_ulogic_vector(dcnt_size_c-1 downto 0); -- discharge counter
    thres : std_ulogic_vector(scnt_size_c-1 downto 0); -- threshold counter
    scnt  : std_ulogic_vector(scnt_size_c-1 downto 0); -- sample counter
  end record;
  signal ctrl : ctrl_t;

  -- sample timing threshold --
  signal threshold : std_ulogic_vector(scnt_size_c-1 downto 0);

  -- output filter --
  type   out_filter_t is array (NUM_PADS-1 downto 0) of std_ulogic_vector(filter_size_c-1 downto 0);
  signal out_filter : out_filter_t;

begin

  -- Sanity Checks --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  assert not (F_CLOCK < f_sample_c) report "Input clock frequency too slow (required: F_CLOCK >= " & integer'image(f_sample_c) & ")!" severity error;
  assert not (NUM_PADS < 1) report "Invalid <NUM_PADS> configuration (min 1)!" severity error;
  assert not ((SENSITIVITY < 1) or (SENSITIVITY > 3)) report "Invalid <SENSITIVITY> level (1, 2 or 3)!" severity error;


  -- Reset Generator ------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  reset_gen: process(rstn_i, clk_i)
  begin
    if (rstn_i = '0') then -- async reset
      rstn_int <= '0';
    elsif rising_edge(clk_i) then
      if (rstn_sync_i = '0') then -- sync reset
        rstn_int <= '0';
      else
        rstn_int <= '1';
      end if;
    end if;
  end process reset_gen;


  -- Clock Generators -----------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  clock_gen: process(clk_i)
  begin
    if rising_edge(clk_i) then
      if (rstn_int = '0') then
        sample_clk_gen <= 0;
        sample_clk     <= '0';
        output_clk_gen <= 0;
        output_clk     <= '0';
      else
        -- sample clock --
        if (sample_clk_gen = sample_time_c) then
          sample_clk_gen <= 0;
          sample_clk     <= '1';
        else
          sample_clk_gen <= sample_clk_gen + 1;
          sample_clk     <= '0';
        end if;
        -- output clock --
        if (sample_clk = '1') then
          if (output_clk_gen = output_time_c) then
            output_clk_gen <= 0;
            output_clk     <= '1';
          else
            output_clk_gen <= output_clk_gen + 1;
            output_clk     <= '0';
          end if;
        end if;
      end if;
    end if;
  end process clock_gen;


  -- Controller -----------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  controller: process(clk_i)
  begin
    if rising_edge(clk_i) then
      if (rstn_int = '0') then
        ctrl.state <= S_INIT_START;
      elsif (sample_clk = '1') then
        -- input synchronizer (no metastability) --
        ctrl.sync0 <= pad_io;
        ctrl.sync1 <= ctrl.sync0;

        -- fsm --
        case ctrl.state is
        
          when S_INIT_START => -- reset, start new calibration
          -- ------------------------------------------------------------
            ctrl.thres <= (others => '0');
            ctrl.dcnt  <= (others => '0');
            ctrl.state <= S_INIT_DISCHARGE;
        
          when S_INIT_DISCHARGE => -- discharge pads
          -- ------------------------------------------------------------
            ctrl.dcnt <= std_ulogic_vector(unsigned(ctrl.dcnt) + 1);
            if (ctrl.dcnt(ctrl.dcnt'left) = '1') then
              ctrl.state <= S_INIT_SAMPLE;
            end if;

          when S_INIT_SAMPLE => -- calibrate buttons (time until charged WITHOUT button push)
          -- ------------------------------------------------------------
            ctrl.thres <= std_ulogic_vector(unsigned(ctrl.thres) + 1); -- time required to charge base capacitance
            if (ctrl.thres(ctrl.thres'left) = '1') then -- overflow
              ctrl.state <= S_INIT_START;
            elsif (ctrl.sync1 = channel_one_c) then -- all buttons charged
              ctrl.state <= S_RUN_START;
            end if;

          when S_RUN_START => -- sample phase 0: prepare new sampling
          -- ------------------------------------------------------------
            ctrl.dcnt  <= (others => '0');
            ctrl.scnt  <= (others => '0');
            ctrl.state <= S_RUN_DISCHARGE;

          when S_RUN_DISCHARGE => -- sample phase 1: discharge pads
          -- ------------------------------------------------------------
            ctrl.dcnt <= std_ulogic_vector(unsigned(ctrl.dcnt) + 1);
            if (ctrl.dcnt(ctrl.dcnt'left) = '1') then
              ctrl.state <= S_RUN_SAMPLE;
            end if;

          when S_RUN_SAMPLE => -- sample phase 2: sample pads after crossing timing threshold
          -- ------------------------------------------------------------
            ctrl.scnt <= std_ulogic_vector(unsigned(ctrl.scnt) + 1);
            if (ctrl.scnt = threshold) then -- sample!
              ctrl.data  <= not std_ulogic_vector(ctrl.sync1);
              ctrl.state <= S_RUN_START;
            end if;

          when others => -- undefined
          -- ------------------------------------------------------------
            ctrl.state <= S_INIT_START;

        end case;
      end if;
    end if;
  end process controller;

  -- threshold time to distinguish between pushed and not-pushed state --
  threshold_comp: process(ctrl.thres)
    variable tmp_v : std_ulogic_vector(scnt_size_c-1 downto 0);
  begin
    case SENSITIVITY is -- this defines the additional time required to charge the pad's increased capacitance (+ finger)
      when 1 => tmp_v := "0000" & ctrl.thres(ctrl.thres'left downto 4); -- 0.0625 * thres [high]
      when 2 => tmp_v := "000" & ctrl.thres(ctrl.thres'left downto 3); -- 0.125 * thres [medium]
      when 3 => tmp_v := "00" & ctrl.thres(ctrl.thres'left downto 2); -- 0.25 * thres [low]
      when others => tmp_v := (others => '0'); -- invalid
    end case;
    threshold <= std_ulogic_vector(unsigned(ctrl.thres) + unsigned(tmp_v)); -- threshold = (1 + [0.0625, 0.125, 0.25]) * thres
  end process;

  -- calibration done? --
  ready_o <= '0' when (ctrl.state = S_INIT_START) or (ctrl.state = S_INIT_DISCHARGE) or (ctrl.state = S_INIT_SAMPLE) else '1';


  -- Tri-State Driver -----------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  tri_state_drive:
  for i in 0 to NUM_PADS-1 generate
    pad_io(i) <= '0' when (ctrl.state = S_INIT_DISCHARGE) or (ctrl.state = S_RUN_DISCHARGE) else 'Z';
  end generate;


  -- Output Stabilizer ----------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  output_filter: process(clk_i)
  begin
    if rising_edge(clk_i) then
      if (rstn_int = '0') then
        out_filter <= (others => (others => '0'));
        touch_o    <= (others => '0');
      else
        -- sample shift register --
        if (sample_clk = '1') then
          if (ctrl.state = S_RUN_START) then
            for i in 0 to NUM_PADS-1 loop
              out_filter(i)(filter_size_c-1 downto 0) <= out_filter(i)(filter_size_c-2 downto 0) & ctrl.data(i);
            end loop;
          end if;
        end if;
        -- majority check --
        if (output_clk = '1') then
          for i in 0 to NUM_PADS-1 loop
            if (out_filter(i) = filter_zero_c) then -- all zero -> button is NOT active
              touch_o(i) <= '0';
            elsif (out_filter(i) = filter_one_c) then -- all one -> button is active
              touch_o(i) <= '1';
            end if;
          end loop;
        end if;
      end if;
    end if;
  end process;
  

end captouch_rtl;
