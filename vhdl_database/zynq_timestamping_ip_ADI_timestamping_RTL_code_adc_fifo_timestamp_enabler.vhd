--
-- Copyright 2013-2020 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all; -- We do use signed arithmetic
use IEEE.numeric_std.all;

-- I/O libraries * SIMULATION ONLY *
use STD.textio.all;
use ieee.std_logic_textio.all;

--! Whereas a configuration up to 2x2 (i.e., 4 channels) is supported, the basic functionality of the 
--! block needs to work for the most reduced possible configuration (i.e., 1x1 or 2 channels, as provided by AD9364). 
--! Hence, even if it is not optimum, the provision of the synhronization header and
--! timestamp value will always use two single DAC channels (i.e., 32 bits or i0 & q0) and, thus, require 
--! eight clock cycles to be completed.
--!
--! The design assumes that 'DMA_x_length_valid' will be always asserted at least one clock cycle before the 
--! data associated to that DMA transfer enters this block.
--!
--! In case of a x1 ratio between the FPGA baseband (ADCxN_clk) and the sampling clocks, the forwarded outputs 
--! will be translated from the baseband clock to the AXI one; in such cases, the design assumes that the ratio 
--! between the baseband clock and the AXI one is large enough to enable the insertion of the 8 header samples.


-- @TO_BE_IMPROVED: a known fixed configuration is assumed for 'util_ad9361_adc_fifo' 
-- (i.e., 4 channels - 2RX/2TX - & 16-bit samples); changes might be required for different 'util_cpack' configurations
entity adc_fifo_timestamp_enabler is
  generic ( 
    --! Defines the width of transfer length control register in bits; limits the maximum length 
    --! of the transfers to 2^PARAM_DMA_LENGTH_WIDTH (e.g., 2^24 = 16M).
    PARAM_DMA_LENGTH_WIDTH	: integer	:= 24;  
    --! The block can be bypassed, resulting thus in an unmodified ADI firmware implementation 
    --! [not implemented for x1 FPGA/sampling clock ratios].     
    PARAM_BYPASS : boolean := false;
    --! The block can be set in 'debug' mode, which will result in 'fwd_adc_data_0' returning a 
    --! predefined data sequence (i.e., a counter) that enables debugging (e.g., see if samples are lost) 
    --! [not implemented for x1 FPGA/sampling clock ratios].                
    PARAM_DEBUG : boolean := false;  
    --! The block can be set in 'freerun' (i.e., once the first 'x_length' is received, the DMA will be always feed, 
    --! not checking for new requests as it will be assumed that the PS will be always in time or realigning 
    --! packets as needed) or in 'burst' mode (i.e., PARAM_FREERUN = false; data will only be provided to the 
    --! DMA when there is a new request from the PS) [not implemented for x1 FPGA/sampling clock ratios].              
    PARAM_FREERUN : boolean := false;               
    --! Defines wether adc_X_2/3' ports are active (true) or not (false [default]).
    PARAM_TWO_ANTENNA_SUPPORT : boolean := false;   
    --! Defines whether the baseband FPGA clock (ADCxN_clk) has an actual x1 ratio to the sampling clock (true) or not 
    --! (false [default]); in the first case, forwarded outputs will be @ADCxN_clk, otherwise @s_axi_aclk
    PARAM_x1_FPGA_SAMPLING_RATIO : boolean := false 
  );
  port (
    -- *************************************************************************
		-- Clock and reset signals governing the ADC sample provision
		-- *************************************************************************
    --! ADC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling 
    --! freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz].
    ADCxN_clk : in std_logic;
    -- ADC high-active reset signal (mapped to the ADC clock xN domain 
    --! [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; 
    --! max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]                                                   
    ADCxN_reset : in std_logic;
    --! Indicates the division factor between the sampling clock and input clock
    --! (i.e., '1' indicates N = 2 or 1x1, '0' indicates N = 4 or 2x2)
    ADC_clk_division : in std_logic;

    -- *************************************************************************
    -- Clock and reset signals governing the communication with the PS: only used 
    -- if 'PARAM_x1_FPGA_SAMPLING_RATIO' is set to true
    -- *************************************************************************
    s_axi_aclk : in std_logic;    --! AXI clock signal (@100 MHz)
    s_axi_aresetn : in std_logic; --! AXI low-active reset signal (mapped to the AXI clock domain [@100 MHz])

    -- *************************************************************************
    -- custom timestamping ports
    -- *************************************************************************
    --! Current ADC clock cycle (i.e., current I/Q sample count) 
    --! [@ADCxN_clk, even though the clock-ticks are based on @ADC_clk]
    current_lclk_count : in std_logic_vector(63 downto 0);
    --! Signal indicating the number of samples comprising the current DMA transfer [@ADCxN_clk]
    DMA_x_length : in std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0);
    --! Valid signal for 'DMA_x_length' [@ADCxN_clk]
    DMA_x_length_valid : in std_logic;

    -- *************************************************************************
    -- Interface to ADI AD936x
    -- *************************************************************************
    adc_enable_0 : in std_logic;                   --! Enable signal for ADC data port 0.
    adc_valid_0 : in std_logic;                    --! Valid signal for ADC data port 0.
    adc_data_0 : in std_logic_vector(15 downto 0); --! ADC parallel data port 0 [16-bit I samples, Rx antenna 1].
    adc_enable_1 : in std_logic;                   --! Enable signal for ADC data port 1.
    adc_valid_1 : in std_logic;                    --! Valid signal for ADC data port 1.
    adc_data_1 : in std_logic_vector(15 downto 0); --! ADC parallel data port 1 [16-bit Q samples, Rx antenna 1].
    adc_enable_2 : in std_logic;                   --! Enable signal for ADC data port 2.
    adc_valid_2 : in std_logic;                    --! Valid signal for ADC data port 2.
    adc_data_2 : in std_logic_vector(15 downto 0); --! ADC parallel data port 2 [16-bit I samples, Rx antenna 2].
    adc_enable_3 : in std_logic;                   --! Enable signal for ADC data port 3.
    adc_valid_3 : in std_logic;                    --! Valid signal for ADC data port 3.
    adc_data_3 : in std_logic_vector(15 downto 0); --! ADC parallel data port 3 [16-bit Q samples, Rx antenna 2].

    --! Debug-only output port.
    --! Forwarding of 'current_num_samples' for debugging reasons.
    current_num_samples_o : out std_logic_vector(15 downto 0); 

    -- forwarded util_ad9361_adc_fifo inputs
    fwd_adc_enable_0 : out std_logic;                   --! Enable signal for ADC data port 0.
    fwd_adc_valid_0 : out std_logic;                    --! Valid signal for ADC data port 0.
    fwd_adc_data_0 : out std_logic_vector(15 downto 0); --! ADC parallel data port 0 [16-bit I samples, Rx antenna 1].
    fwd_adc_enable_1 : out std_logic;                   --! Enable signal for ADC data port 1.
    fwd_adc_valid_1 : out std_logic;                    --! Valid signal for ADC data port 1.
    fwd_adc_data_1 : out std_logic_vector(15 downto 0); --! ADC parallel data port 1 [16-bit Q samples, Rx antenna 1].
    fwd_adc_enable_2 : out std_logic;                   --! Enable signal for ADC data port 2.
    fwd_adc_valid_2 : out std_logic;                    --! Valid signal for ADC data port 2.
    fwd_adc_data_2 : out std_logic_vector(15 downto 0); --! ADC parallel data port 2 [16-bit I samples, Rx antenna 2].
    fwd_adc_enable_3 : out std_logic;                   --! Enable signal for ADC data port 3.
    fwd_adc_valid_3 : out std_logic;                    --! Valid signal for ADC data port 3.
    fwd_adc_data_3 : out std_logic_vector(15 downto 0); --! ADC parallel data port 3 [16-bit Q samples, Rx antenna 2].
    fwd_adc_overflow : out std_logic;                   --! Overflow signal indicating that the DMA request was late.

    --! Signal indicating the number of samples comprising the current DMA transfer
    --! [@s_axi_aclk; only used in case of x1 ratio between FPGA and sampling clocks]
    fwd_DMA_x_length : out std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0);
    --! Valid signal for 'DMA_x_length' [@s_axi_aclk; only used in case of x1 ratio between FPGA and sampling clocks]
    fwd_DMA_x_length_valid : out std_logic;
    --! Overflow signal indicating that the DMA request was late
    --! [@ADCxN_clk; only used in case of x1 ratio between FPGA and sampling clocks]
    fwd_adc_overflow_BBclk : out std_logic;

    fwd_sync_out : out std_logic;

    -- *************************************************************************
    -- Interface to srsUE_AXI_control_unit (@ADCxN_clk)
    -- *************************************************************************
    --! Status register for the FSM controlling the ADC forwarding chain
    ADC_FSM_status : out std_logic_vector(31 downto 0); 
    ADC_FSM_new_status : out std_logic;                 --! Valid signal for 'ADC_FSM_status'
    ADC_FSM_status_read : in std_logic                  --! ACK signal for 'ADC_FSM_status'
  );
end adc_fifo_timestamp_enabler;

architecture arch_adc_fifo_timestamp_enabler_RTL_impl of adc_fifo_timestamp_enabler is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- fixed values for non supported generic parameters
  constant cnt_fixed_CHANNEL_DATA_WIDTH : integer:=16;
  constant cnt_fixed_NUM_OF_CHANNELS : integer:=4;

  -- PS-PL synchronization words
  constant cnt_1st_synchronization_word : std_logic_vector(31 downto 0):=x"bbbbaaaa";
  constant cnt_2nd_synchronization_word : std_logic_vector(31 downto 0):=x"ddddcccc";
  constant cnt_3rd_synchronization_word : std_logic_vector(31 downto 0):=x"ffffeeee";
  constant cnt_4th_synchronization_word : std_logic_vector(31 downto 0):=x"abcddcba";
  constant cnt_5th_synchronization_word : std_logic_vector(31 downto 0):=x"fedccdef";
  constant cnt_6th_synchronization_word : std_logic_vector(31 downto 0):=x"dfcbaefd";

  -- DMA length related constants
  constant cnt_0_PARAM_DMA_LENGTH_WIDTHbits : std_logic_vector(cnt_fixed_CHANNEL_DATA_WIDTH-1 downto 0):=(others => '0');
  constant cnt_1_PARAM_DMA_LENGTH_WIDTHbits : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0):=(0 => '1', others => '0');
  constant cnt_0_5b : std_logic_vector(4 downto 0):="00000";
  constant cnt_1_5b : std_logic_vector(4 downto 0):="00001";
  constant cnt_0_16b : std_logic_vector(15 downto 0):=x"0000";
  constant cnt_1_16b : std_logic_vector(15 downto 0):=x"0001";
  constant cnt_2_16b : std_logic_vector(15 downto 0):=x"0002";
  constant cnt_3_16b : std_logic_vector(15 downto 0):=x"0003";
  constant cnt_4_16b : std_logic_vector(15 downto 0):=x"0004";
  constant cnt_5_16b : std_logic_vector(15 downto 0):=x"0005";
  constant cnt_6_16b : std_logic_vector(15 downto 0):=x"0006";
  constant cnt_7_16b : std_logic_vector(15 downto 0):=x"0007";
  constant cnt_8_16b : std_logic_vector(15 downto 0):=x"0008";
  constant cnt_9_16b : std_logic_vector(15 downto 0):=x"0009";
  constant cnt_10_16b : std_logic_vector(15 downto 0):=x"000A";
  constant cnt_11_16b : std_logic_vector(15 downto 0):=x"000B";
  constant cnt_12_16b : std_logic_vector(15 downto 0):=x"000C";
  constant cnt_13_16b : std_logic_vector(15 downto 0):=x"000D";
  constant cnt_14_16b : std_logic_vector(15 downto 0):=x"000E";
  constant cnt_15_16b : std_logic_vector(15 downto 0):=x"000F";
  constant cnt_16_16b : std_logic_vector(15 downto 0):=x"0010";
  constant cnt_1_64b : std_logic_vector(63 downto 0):=x"0000000000000001";

  -- **********************************
  -- internal signals
  -- **********************************

  -- util_ad9361_adc_fifo related signals
  signal adc_valid_0_i_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_0_i_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_1_i_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_2_i_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_3_i_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_0_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_1_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_2_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_3_i_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_0_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_1_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_2_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i_i_i_i_i : std_logic:='0';
  signal adc_data_3_i_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i_i_i_i_i : std_logic:='0';
  signal adc_data_0_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i_i_i_i : std_logic:='0';
  signal adc_data_1_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i_i_i_i : std_logic:='0';
  signal adc_data_2_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i_i_i_i : std_logic:='0';
  signal adc_data_3_i_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i_i_i_i : std_logic:='0';
  signal adc_data_0_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i_i_i : std_logic:='0';
  signal adc_data_1_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i_i_i : std_logic:='0';
  signal adc_data_2_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i_i_i : std_logic:='0';
  signal adc_data_3_i_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i_i_i : std_logic:='0';
  signal adc_data_0_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i_i : std_logic:='0';
  signal adc_data_1_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i_i : std_logic:='0';
  signal adc_data_2_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i_i : std_logic:='0';
  signal adc_data_3_i_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i_i : std_logic:='0';
  signal adc_data_0_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i : std_logic:='0';
  signal adc_data_1_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i : std_logic:='0';
  signal adc_data_2_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i : std_logic:='0';
  signal adc_data_3_i_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i : std_logic:='0';
  signal adc_data_0_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i : std_logic:='0';
  signal adc_data_1_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i : std_logic:='0';
  signal adc_data_2_i : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i : std_logic:='0';
  signal adc_data_3_i : std_logic_vector(15 downto 0):=(others => '0');

  -- DMA related signals
  signal DMA_x_length_int : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0):=(others => '0');
  signal DMA_x_length_valid_int : std_logic:='0';
  signal DMA_x_length_plus1 : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0);
  signal current_num_samples : std_logic_vector(15 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal current_num_samples_minus1 : std_logic_vector(15 downto 0);
  signal num_samples_count : std_logic_vector(15 downto 0);
  signal current_lclk_count_int : std_logic_vector(63 downto 0):=(others => '0');
  signal current_lclk_count_int_i : std_logic_vector(63 downto 0):=(others => '0');
  signal DMA_x_length_valid_count : std_logic_vector(4 downto 0):=(others => '0');
  signal DMA_x_length_applied : std_logic:='0';
  signal overflow_notified_to_PS : std_logic:='0';
  signal first_x_length_received : std_logic:='0';

  signal r0_sync : std_logic := '0';
  -- internal forwarding signals
  signal fwd_adc_valid_0_s : std_logic;
  signal fwd_adc_data_0_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_1_s : std_logic;
  signal fwd_adc_data_1_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_2_s : std_logic;
  signal fwd_adc_data_2_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_3_s : std_logic;
  signal fwd_adc_data_3_s : std_logic_vector(15 downto 0);
  signal fwd_adc_overflow_s : std_logic;

  -- srsUE_AXI_control_unit related signals
  signal current_block_configuration : std_logic_vector(1 downto 0);
  signal ADC_FSM_status_s : std_logic_vector(31 downto 0) := (others => '0');
  signal ADC_FSM_status_s_valid : std_logic:='0';
  signal ADC_FSM_status_unread : std_logic;

  -- debugging-mode related signals
  constant cnt_32640_16b  : std_logic_vector(15 downto 0) :=x"7F80"; -- 17 ms (i.e., 17 x 1920 samples)
  signal adc_data_value_I : std_logic_vector(15 downto 0) := (others => '0');

  -- x1 ratio path related signals
  signal adc_enable_0_and_1 : std_logic_vector(1 downto 0) := "00";
  signal adc_enable_2_and_3 : std_logic_vector(1 downto 0) := "00";
  signal adc_valid_0_i_i_x1path : std_logic := '0';
  signal adc_data_0_i_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_i_x1path : std_logic := '0';
  signal adc_data_1_i_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_0_i_x1path : std_logic := '0';
  signal adc_data_0_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_1_i_x1path : std_logic := '0';
  signal adc_data_1_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_i_x1path : std_logic := '0';
  signal adc_data_2_i_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_i_x1path : std_logic := '0';
  signal adc_data_3_i_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_2_i_x1path : std_logic := '0';
  signal adc_data_2_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal adc_valid_3_i_x1path : std_logic := '0';
  signal adc_data_3_i_x1path : std_logic_vector(15 downto 0):=(others => '0');
  signal DMA_x_length_AXI : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0);
  signal DMA_x_length_valid_AXI : std_logic;
  signal DMA_x_length_valid_int_AXI_i : std_logic;

  -- cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup
  signal current_lclk_count_AXI : std_logic_vector(63 downto 0) := (others => '0');
  signal DMA_x_length_int_AXI : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0) := (others => '0');
  signal DMA_x_length_valid_int_AXI : std_logic := '0';
  signal DMA_x_length_applied_AXI : std_logic := '0';
  signal DMA_x_length_valid_count_AXI : std_logic_vector(4 downto 0):=(others => '0');
  signal adc_enable_0_and_1_AXI : std_logic_vector(1 downto 0) := "00";
  signal adc_enable_2_and_3_AXI : std_logic_vector(1 downto 0) := "00";
  signal adc_data_0_AXI : std_logic_vector(15 downto 0) := (others => '0');
  signal adc_valid_0_AXI : std_logic := '0';
  signal adc_data_1_AXI : std_logic_vector(15 downto 0) := (others => '0');
  signal adc_valid_1_AXI : std_logic := '0';
  signal adc_data_2_AXI : std_logic_vector(15 downto 0) := (others => '0');
  signal adc_valid_2_AXI : std_logic := '0';
  signal adc_data_3_AXI : std_logic_vector(15 downto 0) := (others => '0');
  signal adc_valid_3_AXI : std_logic := '0';
  signal fwd_adc_overflow_BBclk_s : std_logic := '0';

begin

  -- ***********************************************************
  -- management of the util_ad9361_adc_fifo inputs [@ADCxN_clk]
  -- ***********************************************************

  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        DMA_x_length_int <= (others => '0');
        DMA_x_length_valid_int <= '0';
      else
        if DMA_x_length_valid_int = '0' and DMA_x_length_valid = '1' then
          DMA_x_length_valid_int <= '1';
        elsif DMA_x_length_valid_int = '1' and DMA_x_length_applied = '1' and (not PARAM_FREERUN) then
          DMA_x_length_valid_int <= '0';
        end if;

        if DMA_x_length_valid = '1' then
          DMA_x_length_int <= DMA_x_length;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process controlling the number of received 'x_length' values for control purposes
  process(ADCxN_clk,ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset='1' then -- synchronous high-active reset: initialization of signals
        DMA_x_length_valid_count <= (others => '0');
      else
        -- update number of 'x_length' values received from PS (i.e., DMA write requests or number of received frames)
        if DMA_x_length_valid = '1' and DMA_x_length_applied = '0' then
          DMA_x_length_valid_count <= DMA_x_length_valid_count + cnt_1_5b;
        elsif DMA_x_length_valid = '0' and DMA_x_length_applied = '1' then
          DMA_x_length_valid_count <= DMA_x_length_valid_count - cnt_1_5b;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- concurrent calculation of the control-index
  current_num_samples_minus1 <= current_num_samples - cnt_1_16b;

-- ** FPGA/sampling clock with a x2 ratio: forwarded outputs will be @ADCxN_clk **
default_output_processing : if (not PARAM_x1_FPGA_SAMPLING_RATIO) generate
  -- process registering the inputs from util_ad9361_adc_fifo
  process(ADCxN_clk)
  begin
    if rising_edge(ADCxN_clk) then
      -- * NOTE: 'adc_X_i' signals delay the current 'util_ad9361_adc_fifo' inputs up to eight clock cycles, enabling the insertion of the synhronization header and 64-bit timestamp at positions 0-7 of each IQ-frame (i.e., as a 8-sample header)
      adc_valid_0_i_i_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i_i_i;
      adc_data_0_i_i_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i_i_i;
      adc_valid_1_i_i_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i_i_i;
      adc_data_1_i_i_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i_i_i;
      adc_valid_0_i_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i_i;
      adc_data_0_i_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i_i;
      adc_valid_1_i_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i_i;
      adc_data_1_i_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i_i;
      adc_valid_0_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i;
      adc_data_0_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i;
      adc_valid_1_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i;
      adc_data_1_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i;
      adc_valid_0_i_i_i_i_i <= adc_valid_0_i_i_i_i;
      adc_data_0_i_i_i_i_i <= adc_data_0_i_i_i_i;
      adc_valid_1_i_i_i_i_i <= adc_valid_1_i_i_i_i;
      adc_data_1_i_i_i_i_i <= adc_data_1_i_i_i_i;
      adc_valid_0_i_i_i_i <= adc_valid_0_i_i_i;
      adc_data_0_i_i_i_i <= adc_data_0_i_i_i;
      adc_valid_1_i_i_i_i <= adc_valid_1_i_i_i;
      adc_data_1_i_i_i_i <= adc_data_1_i_i_i;
      adc_valid_0_i_i_i <= adc_valid_0_i_i;
      adc_data_0_i_i_i <= adc_data_0_i_i;
      adc_valid_1_i_i_i <= adc_valid_1_i_i;
      adc_data_1_i_i_i <= adc_data_1_i_i;
      adc_valid_0_i_i <= adc_valid_0_i;
      adc_data_0_i_i <= adc_data_0_i;
      adc_valid_1_i_i <= adc_valid_1_i;
      adc_data_1_i_i <= adc_data_1_i;
      adc_valid_0_i <= adc_valid_0;

      -- ** DEBUGGING-MODE-ONLY CODE **
      if PARAM_DEBUG then
        if adc_valid_0 = '1' then
          if adc_data_value_I = cnt_32640_16b then
            adc_data_0_i <= cnt_1_16b;
            adc_data_value_I <= cnt_1_16b;
          else
            adc_data_0_i <= adc_data_value_I + cnt_1_16b;
            adc_data_value_I <= adc_data_value_I + cnt_1_16b;
          end if;
        end if;
      else
        adc_data_0_i <= adc_data_0;
      end if;

      adc_valid_1_i <= adc_valid_1;
      adc_data_1_i <= adc_data_1;

      -- ** TWO-ANTENNA-ONLY CODE **
      if PARAM_TWO_ANTENNA_SUPPORT then
        adc_valid_2_i_i_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i <= adc_valid_2_i_i_i_i;
        adc_data_2_i_i_i_i_i <= adc_data_2_i_i_i_i;
        adc_valid_3_i_i_i_i_i <= adc_valid_3_i_i_i_i;
        adc_data_3_i_i_i_i_i <= adc_data_3_i_i_i_i;
        adc_valid_2_i_i_i_i <= adc_valid_2_i_i_i;
        adc_data_2_i_i_i_i <= adc_data_2_i_i_i;
        adc_valid_3_i_i_i_i <= adc_valid_3_i_i_i;
        adc_data_3_i_i_i_i <= adc_data_3_i_i_i;
        adc_valid_2_i_i_i <= adc_valid_2_i_i;
        adc_data_2_i_i_i <= adc_data_2_i_i;
        adc_valid_3_i_i_i <= adc_valid_3_i_i;
        adc_data_3_i_i_i <= adc_data_3_i_i;
        adc_valid_2_i_i <= adc_valid_2_i;
        adc_data_2_i_i <= adc_data_2_i;
        adc_valid_3_i_i <= adc_valid_3_i;
        adc_data_3_i_i <= adc_data_3_i;
        adc_data_2_i <= adc_data_2;
        adc_valid_2_i <= adc_valid_2;
        adc_data_3_i <= adc_data_3;
        adc_valid_3_i <= adc_valid_3;
      end if;
    end if; -- end of clk
  end process;

  -- concurrent calculation of the 'DMA_x_length_plus1' operand
  DMA_x_length_plus1 <= DMA_x_length_int + cnt_1_PARAM_DMA_LENGTH_WIDTHbits;

  -- process registering 'current_lclk_count' and generating a delayed version
  process(ADCxN_clk)
  begin
    if rising_edge(ADCxN_clk) then
      -- * NOTE: 'current_lclk_count_int_i' delays the current 'current_lclk_count_int' value by one clock cycle, enabling the two clock-cyle insertion of the timestamp
      current_lclk_count_int_i <= current_lclk_count_int;
      current_lclk_count_int <= current_lclk_count;
    end if; -- end of clk
  end process;

  -- *DEBUG DATA* this signal is mean to help the PS to know the current configuration of the block, which was set at implementation time
  current_block_configuration <= "01" when PARAM_DEBUG else
                                 "10" when PARAM_FREERUN else
                                 "11" when PARAM_BYPASS else
                                 "00";

  -- process updating the value of 'current_num_samples' and managing the timestamp insertion; @TO_BE_IMPROVED: add support to >x2 FPGA/sampling-clock ratios  (e.g., 2x2 configuration)
  --                                                                                           @TO_BE_IMPROVED: properly use 'X_ovf' signals of 'util_ad9361_adc_fifo'
  process(ADCxN_clk,ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset='1' then -- synchronous high-active reset: initialization of signals
        fwd_adc_valid_0_s <= '0';
        fwd_adc_data_0_s <= (others => '0');
        fwd_adc_valid_1_s <= '0';
        fwd_adc_data_1_s <= (others => '0');
        fwd_adc_valid_2_s <= '0';
        fwd_adc_data_2_s <= (others => '0');
        fwd_adc_valid_3_s <= '0';
        fwd_adc_data_3_s <= (others => '0');
        current_num_samples <= (others => '0');
        num_samples_count <= (others => '0');
        DMA_x_length_applied <= '0';
        fwd_adc_overflow_s <= '0';
        overflow_notified_to_PS <= '0';
        first_x_length_received <= '0';
        ADC_FSM_status_s <= (others => '0');
        ADC_FSM_status_s_valid <= '0';
      else
        -- clear 'DMA_x_length_applied' and 'fwd_adc_overflow_s'
        DMA_x_length_applied <= '0';
        fwd_adc_overflow_s <= '0';

        -- *DEBUG DATA* fixed assignations
        ADC_FSM_status_s(31 downto 29) <= "111";
        ADC_FSM_status_s(28 downto 27) <= current_block_configuration;
        ADC_FSM_status_s(26) <= DMA_x_length_valid_int;
        ADC_FSM_status_s(25 downto 21) <= DMA_x_length_valid_count;
        ADC_FSM_status_s(20 downto 5) <= current_num_samples;
        ADC_FSM_status_s_valid <= '1';

        r0_sync <= '0';

        -- the I/Q packets to be transmitted to the PS will comprise N 32-bit words and have the following format (where N is always 8M, with M being an integer):
        --
        --  + synchronization_header: 6 32-bit words [0xbbbbaaaa, 0xddddcccc, 0xffffeeee, 0xabcddcba, 0xfedccdef, 0xdfcbaefd]
        --  + 64-bit simestamp: 2 32-bit words
        --  + I/Q data: N-8 32-bit words [16-bit I & 16-bit Q]

        -- 1st synchronization header sample insertion; we will start the packetization procedure when there is new adc data to be forwarded and a valid 'x_length' configuration has been passed to the DMA
        if (adc_valid_0 = '1' or adc_valid_1 = '1') and num_samples_count = cnt_0_16b and (DMA_x_length_valid_int = '1' or DMA_x_length_valid_count > cnt_0_5b) then
          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame + one 64-bit timestamp (+2 32-bit values), as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = (M+1)/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples (incl. timestamp) = (x_length + 1)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples <= DMA_x_length_plus1(17 downto 2); -- @TO_BE_TESTED: validate we are always obtaining a meaningful value

          r0_sync <= '1';

          -- the first IQ-frame sample will be the 1st synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_1st_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_1st_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- notify that we have currently applied a new DMA_x_length
          DMA_x_length_applied <= '1';

          -- in 'free-run' mode we will check if the DMA request arrived on time or not, just to notify the PS about it
          if PARAM_FREERUN then
            if DMA_x_length_valid_count < cnt_1_5b then
              fwd_adc_overflow_s <= '1';
            end if;
          end if;
          overflow_notified_to_PS <= '0';
          first_x_length_received <= '1';

          -- *DEBUG DATA* control FSM is in its 1st sate
          ADC_FSM_status_s(4 downto 0) <= "00001";
        -- 2nd synchronization header sample insertion
        elsif num_samples_count = cnt_1_16b then
          -- the second IQ-frame sample will be the 2nd synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_2nd_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_2nd_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 2nd sate
          ADC_FSM_status_s(4 downto 0) <= "00010";
        -- 3rd synchronization header sample insertion
        elsif num_samples_count = cnt_2_16b then
          -- the third IQ-frame sample will be the 3rd synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_3rd_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_3rd_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 3rd sate
          ADC_FSM_status_s(4 downto 0) <= "00011";
        -- 4th synchronization header sample insertion
        elsif num_samples_count = cnt_3_16b then
          -- the fourth IQ-frame sample will be the 4th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_4th_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_4th_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 4th sate
          ADC_FSM_status_s(4 downto 0) <= "00100";
        -- 5th synchronization header sample insertion
        elsif num_samples_count = cnt_4_16b then
          -- the fifth IQ-frame sample will be the 5th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_5th_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_5th_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 5th sate
          ADC_FSM_status_s(4 downto 0) <= "00101";
        -- 6th synchronization header sample insertion
        elsif num_samples_count = cnt_5_16b then
          -- the sixth IQ-frame sample will be the 6th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_6th_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_6th_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 6th sate
          ADC_FSM_status_s(4 downto 0) <= "00110";
        -- LSBs timestamp insertion (7th synchronization header sample)
        elsif num_samples_count = cnt_6_16b then
          -- the seventh IQ-frame sample will be the timestamp's LSBs
          fwd_adc_data_0_s <= current_lclk_count_int(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= current_lclk_count_int(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 7th sate
          ADC_FSM_status_s(4 downto 0) <= "00111";
        -- MSBs timestamp insertion (8th synchronization header sample)
        elsif num_samples_count = cnt_7_16b then
          -- the eighth IQ-frame sample will be the timestamp's MSBs
          fwd_adc_data_0_s <= current_lclk_count_int_i(47 downto 32);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= current_lclk_count_int_i(63 downto 48);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 8th sate
          ADC_FSM_status_s(4 downto 0) <= "01000";
        -- first current I/Q sample (eight fast clock cycles delayed)
        elsif num_samples_count = cnt_8_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i_i_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i_i_i_i;
          end if;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 9th sate
          ADC_FSM_status_s(4 downto 0) <= "01001";
        -- fourth current I/Q sample (seven fast clock cycles delayed)
        elsif num_samples_count = cnt_9_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i_i_i;
          end if;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 10th sate
          ADC_FSM_status_s(4 downto 0) <= "01010";
        -- fifth current I/Q sample (six fast clock cycles delayed)
        elsif num_samples_count = cnt_10_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i_i;
          end if;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 11th sate
          ADC_FSM_status_s(4 downto 0) <= "01011";
        -- sixth current I/Q sample (five fast clock cycles delayed)
        elsif num_samples_count = cnt_11_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i;
          end if;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 12th sate
          ADC_FSM_status_s(4 downto 0) <= "01100";
        -- seventh current I/Q sample (four fast clock cycles delayed)
        elsif num_samples_count = cnt_12_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i;
          end if;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 13th sate
          ADC_FSM_status_s(4 downto 0) <= "01101";
        -- eighth current I/Q sample (three fast clock cycles delayed)
        elsif num_samples_count = cnt_13_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i;
          end if;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 14th sate
          ADC_FSM_status_s(4 downto 0) <= "01110";
        -- ninth current I/Q sample (two fast clock cycles delayed)
        elsif num_samples_count = cnt_14_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i;
          end if;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- *DEBUG DATA* control FSM is in its 15th sate
          ADC_FSM_status_s(4 downto 0) <= "01111";
        -- forwarding of remaining I/Q samples (one clock cycle delayed)
        elsif num_samples_count > cnt_14_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i;
          fwd_adc_valid_0_s <= adc_valid_0_i;
          fwd_adc_data_1_s <= adc_data_1_i;
          fwd_adc_valid_1_s <= adc_valid_1_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i;
            fwd_adc_valid_2_s <= adc_valid_2_i;
            fwd_adc_data_3_s <= adc_data_3_i;
            fwd_adc_valid_3_s <= adc_valid_3_i;
          end if;

          if adc_valid_0_i = '1' or adc_valid_1_i = '1' then
            -- we must check if all samples comprising the current IQ-packet have been already forwarded or not
            if num_samples_count = current_num_samples_minus1 then
              num_samples_count <= (others => '0');
            else
              num_samples_count <= num_samples_count + cnt_1_16b;
            end if;
          end if;

          -- *DEBUG DATA* control FSM is in its 16th sate
          ADC_FSM_status_s(4 downto 0) <= "10000";
        -- 'x_length' was not properly updated... we will dismiss the samples until it is configured back again
        else
          fwd_adc_valid_0_s <= '0';
          fwd_adc_valid_1_s <= '0';
          fwd_adc_valid_2_s <= '0';
          fwd_adc_valid_3_s <= '0';
          num_samples_count <= (others => '0');

          -- in 'burst' mode, when we do miss a transaction, we will notify the PS about it as well
          if (not PARAM_FREERUN) and overflow_notified_to_PS ='0' and first_x_length_received = '1' then
            fwd_adc_overflow_s <= '1';
            overflow_notified_to_PS <='1';
          end if;

          -- *DEBUG DATA* control FSM is in its 17th sate [problem updating 'x_length']
          ADC_FSM_status_s(4 downto 0) <= "11111";
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- forward the 'current_num_samples' signal to an output port for debugging reasons
  current_num_samples_o <= current_num_samples;

  -- mapping of the internal signals to the corresponding output ports (implementing the bypass configuration as well)
  fwd_adc_enable_0 <= adc_enable_0;-- when PARAM_BYPASS else fwd_adc_enable_0_s;
  fwd_adc_valid_0 <= adc_valid_0 when PARAM_BYPASS else fwd_adc_valid_0_s;
  fwd_adc_data_0 <= adc_data_0 when PARAM_BYPASS else fwd_adc_data_0_s;
  fwd_adc_enable_1 <= adc_enable_1;-- when PARAM_BYPASS else fwd_adc_enable_1_s;
  fwd_adc_valid_1 <= adc_valid_1 when PARAM_BYPASS else fwd_adc_valid_1_s;
  fwd_adc_data_1 <= adc_data_1 when PARAM_BYPASS else fwd_adc_data_1_s;
  fwd_adc_enable_2 <= adc_enable_2;-- when PARAM_BYPASS else fwd_adc_enable_2_s;
  fwd_adc_valid_2 <= adc_valid_2 when PARAM_BYPASS else fwd_adc_valid_2_s;
  fwd_adc_data_2 <= adc_data_2 when PARAM_BYPASS else fwd_adc_data_2_s;
  fwd_adc_enable_3 <= adc_enable_3;-- when PARAM_BYPASS else fwd_adc_enable_3_s;
  fwd_adc_valid_3 <= adc_valid_3 when PARAM_BYPASS else fwd_adc_valid_3_s;
  fwd_adc_data_3 <= adc_data_3 when PARAM_BYPASS else fwd_adc_data_3_s;
  fwd_adc_overflow <= '0' when PARAM_BYPASS else fwd_adc_overflow_s;
end generate default_output_processing;

fwd_sync_out <= r0_sync;


-- ** FPGA/sampling clock with a x1 ratio: forwarded outputs will be @s_axi_aclk **
CDC_output_processing : if PARAM_x1_FPGA_SAMPLING_RATIO generate
  -- process registering the inputs from util_ad9361_adc_fifo
  process(s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      -- * NOTE: 'adc_X_i' signals delay the current 'util_ad9361_adc_fifo' inputs up to eight clock cycles, enabling the insertion of the synhronization header and 64-bit timestamp at positions 0-7 of each IQ-frame (i.e., as a 8-sample header)
      adc_valid_0_i_i_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i_i_i;
      adc_data_0_i_i_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i_i_i;
      adc_valid_1_i_i_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i_i_i;
      adc_data_1_i_i_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i_i_i;
      adc_valid_0_i_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i_i;
      adc_data_0_i_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i_i;
      adc_valid_1_i_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i_i;
      adc_data_1_i_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i_i;
      adc_valid_0_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i;
      adc_data_0_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i;
      adc_valid_1_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i;
      adc_data_1_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i;
      adc_valid_0_i_i_i_i_i <= adc_valid_0_i_i_i_i;
      adc_data_0_i_i_i_i_i <= adc_data_0_i_i_i_i;
      adc_valid_1_i_i_i_i_i <= adc_valid_1_i_i_i_i;
      adc_data_1_i_i_i_i_i <= adc_data_1_i_i_i_i;
      adc_valid_0_i_i_i_i <= adc_valid_0_i_i_i;
      adc_data_0_i_i_i_i <= adc_data_0_i_i_i;
      adc_valid_1_i_i_i_i <= adc_valid_1_i_i_i;
      adc_data_1_i_i_i_i <= adc_data_1_i_i_i;
      adc_valid_0_i_i_i <= adc_valid_0_i_i;
      adc_data_0_i_i_i <= adc_data_0_i_i;
      adc_valid_1_i_i_i <= adc_valid_1_i_i;
      adc_data_1_i_i_i <= adc_data_1_i_i;
      adc_valid_0_i_i <= adc_valid_0_i;
      adc_data_0_i_i <= adc_data_0_i;
      adc_valid_1_i_i <= adc_valid_1_i;
      adc_data_1_i_i <= adc_data_1_i;
      adc_valid_0_i <= adc_valid_0_AXI;
      adc_data_0_i <= adc_data_0_AXI;
      adc_valid_1_i <= adc_valid_0_AXI; --adc_valid_1_AXI;
      adc_data_1_i <= adc_data_1_AXI;

      -- ** TWO-ANTENNA-ONLY CODE **
      if PARAM_TWO_ANTENNA_SUPPORT then
        adc_valid_2_i_i_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i <= adc_valid_2_i_i_i_i;
        adc_data_2_i_i_i_i_i <= adc_data_2_i_i_i_i;
        adc_valid_3_i_i_i_i_i <= adc_valid_3_i_i_i_i;
        adc_data_3_i_i_i_i_i <= adc_data_3_i_i_i_i;
        adc_valid_2_i_i_i_i <= adc_valid_2_i_i_i;
        adc_data_2_i_i_i_i <= adc_data_2_i_i_i;
        adc_valid_3_i_i_i_i <= adc_valid_3_i_i_i;
        adc_data_3_i_i_i_i <= adc_data_3_i_i_i;
        adc_valid_2_i_i_i <= adc_valid_2_i_i;
        adc_data_2_i_i_i <= adc_data_2_i_i;
        adc_valid_3_i_i_i <= adc_valid_3_i_i;
        adc_data_3_i_i_i <= adc_data_3_i_i;
        adc_valid_2_i_i <= adc_valid_2_i;
        adc_data_2_i_i <= adc_data_2_i;
        adc_valid_3_i_i <= adc_valid_3_i;
        adc_data_3_i_i <= adc_data_3_i;
        adc_data_2_i <= adc_data_2_AXI;
        adc_valid_2_i <= adc_valid_2_AXI;
        adc_data_3_i <= adc_data_3_AXI;
        adc_valid_3_i <= adc_valid_2_AXI; --adc_valid_3_AXI;
      end if;
    end if; -- end of clk
  end process;

  -- concurrent calculation of the 'DMA_x_length_plus1' operand
  DMA_x_length_plus1 <= DMA_x_length_int_AXI + cnt_1_PARAM_DMA_LENGTH_WIDTHbits;

  -- process delaying the input data
  process(ADCxN_clk)
  begin
    if rising_edge(ADCxN_clk) then
      -- * NOTE: the input data is delayed two clocks in order to provide an homogeneous timing with the x2 path **
      adc_valid_0_i_i_x1path <= adc_valid_0_i_x1path;
      adc_data_0_i_i_x1path <= adc_data_0_i_x1path;
      adc_valid_1_i_i_x1path <= adc_valid_1_i_x1path;
      adc_data_1_i_i_x1path <= adc_data_1_i_x1path;
      adc_valid_0_i_x1path <= adc_valid_0;
      adc_data_0_i_x1path <= adc_data_0;
      adc_valid_1_i_x1path <= adc_valid_1;
      adc_data_1_i_x1path <= adc_data_1;

      -- ** TWO-ANTENNA-ONLY CODE **
      if PARAM_TWO_ANTENNA_SUPPORT then
        adc_valid_2_i_i_x1path <= adc_valid_2_i_x1path;
        adc_data_2_i_i_x1path <= adc_data_2_i_x1path;
        adc_valid_3_i_i_x1path <= adc_valid_3_i_x1path;
        adc_data_3_i_i_x1path <= adc_data_3_i_x1path;
        adc_valid_2_i_x1path <= adc_valid_2;
        adc_data_2_i_x1path <= adc_data_2;
        adc_valid_3_i_x1path <= adc_valid_3;
        adc_data_3_i_x1path <= adc_data_3;
      end if;
    end if; -- end of clk
  end process;

  -- process registering 'current_lclk_count' and generating a delayed version
  process(s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      -- * NOTE: 'current_lclk_count_int_i' delays the current 'current_lclk_count_int' value by one clock cycle, enabling the two clock-cyle insertion of the timestamp
      current_lclk_count_int_i <= current_lclk_count_int;
      current_lclk_count_int <= current_lclk_count_AXI;
    end if; -- end of clk
  end process;

  -- process updating the value of 'current_num_samples' and managing the timestamp insertion; @TO_BE_IMPROVED: add support to >x2 FPGA/sampling-clock ratios  (e.g., 2x2 configuration)
  --                                                                                           @TO_BE_IMPROVED: properly use 'X_ovf' signals of 'util_ad9361_adc_fifo'
  process(s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        fwd_adc_valid_0_s <= '0';
        fwd_adc_data_0_s <= (others => '0');
        fwd_adc_valid_1_s <= '0';
        fwd_adc_data_1_s <= (others => '0');
        fwd_adc_valid_2_s <= '0';
        fwd_adc_data_2_s <= (others => '0');
        fwd_adc_valid_3_s <= '0';
        fwd_adc_data_3_s <= (others => '0');
        current_num_samples <= (others => '0');
        num_samples_count <= (others => '0');
        DMA_x_length_applied_AXI <= '0';
        fwd_adc_overflow_s <= '0';
        overflow_notified_to_PS <= '0';
        first_x_length_received <= '0';
      else
        -- clear 'DMA_x_length_applied_AXI' and 'fwd_adc_overflow_s'
        DMA_x_length_applied_AXI <= '0';
        fwd_adc_overflow_s <= '0';

        -- the I/Q packets to be transmitted to the PS will comprise N 32-bit words and have the following format (where N is always 8M, with M being an integer):
        --
        --  + synchronization_header: 6 32-bit words [0xbbbbaaaa, 0xddddcccc, 0xffffeeee, 0xabcddcba, 0xfedccdef, 0xdfcbaefd]
        --  + 64-bit simestamp: 2 32-bit words
        --  + I/Q data: N-8 32-bit words [16-bit I & 16-bit Q]

        -- 1st synchronization header sample insertion; we will start the packetization procedure when there is new adc data to be forwarded and a valid 'x_length' configuration has been passed to the DMA
        --if (adc_valid_0_AXI = '1' or adc_valid_1_AXI = '1') and num_samples_count = cnt_0_16b and (DMA_x_length_valid_int_AXI = '1' or DMA_x_length_valid_count_AXI > cnt_0_5b) then
        if adc_valid_0_AXI = '1' and num_samples_count = cnt_0_16b and (DMA_x_length_valid_int_AXI = '1' or DMA_x_length_valid_count_AXI > cnt_0_5b) then
          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame + one 64-bit timestamp (+2 32-bit values), as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = (M+1)/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples (incl. timestamp) = (x_length + 1)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples <= DMA_x_length_plus1(17 downto 2); -- @TO_BE_TESTED: validate we are always obtaining a meaningful value

          -- the first IQ-frame sample will be the 1st synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_1st_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_1st_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- notify that we have currently applied a new DMA_x_length
          DMA_x_length_applied_AXI <= '1';
          overflow_notified_to_PS <= '0';
          first_x_length_received <= '1';
        -- 2nd synchronization header sample insertion
        elsif num_samples_count = cnt_1_16b then
          -- the second IQ-frame sample will be the 2nd synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_2nd_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_2nd_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;
        -- 3rd synchronization header sample insertion
        elsif num_samples_count = cnt_2_16b then
          -- the third IQ-frame sample will be the 3rd synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_3rd_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_3rd_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;
        -- 4th synchronization header sample insertion
        elsif num_samples_count = cnt_3_16b then
          -- the fourth IQ-frame sample will be the 4th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_4th_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_4th_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;
        -- 5th synchronization header sample insertion
        elsif num_samples_count = cnt_4_16b then
          -- the fifth IQ-frame sample will be the 5th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
          fwd_adc_data_0_s <= cnt_5th_synchronization_word(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= cnt_5th_synchronization_word(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;
        -- 6th synchronization header sample insertion
       elsif num_samples_count = cnt_5_16b then
            -- the sixth IQ-frame sample will be the 6th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_6th_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_6th_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_valid_2_s <= '0'; -- during header insertion we want to make sure that data on channel 3 is not accounted as valid
            fwd_adc_valid_3_s <= '0'; -- during header insertion we want to make sure that data on channel 4 is not accounted as valid

            -- control counter update
            num_samples_count <= num_samples_count + cnt_1_16b;
        -- LSBs timestamp insertion (7th synchronization header sample)
        elsif num_samples_count = cnt_6_16b then
          -- the seventh IQ-frame sample will be the timestamp's LSBs
          fwd_adc_data_0_s <= current_lclk_count_int(15 downto 0);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= current_lclk_count_int(31 downto 16);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;
        -- MSBs timestamp insertion (8th synchronization header sample)
        elsif num_samples_count = cnt_7_16b then
          -- the eighth IQ-frame sample will be the timestamp's MSBs
          fwd_adc_data_0_s <= current_lclk_count_int_i(47 downto 32);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= current_lclk_count_int_i(63 downto 48);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;
        -- forwarding of actual I/Q samples
        elsif num_samples_count > cnt_7_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i_i_i_i;
          -- ** TWO-ANTENNA-ONLY CODE **
          if PARAM_TWO_ANTENNA_SUPPORT then
            fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i_i_i_i;
          end if;

          -- control counter update
          if adc_valid_0_i_i_i_i_i_i_i_i = '1' or adc_valid_1_i_i_i_i_i_i_i_i = '1' then
            -- we must check if all samples comprising the current IQ-packet have been already forwarded or not
            if num_samples_count = current_num_samples_minus1 then
              num_samples_count <= (others => '0');
            else
              num_samples_count <= num_samples_count + cnt_1_16b;
            end if;
          end if;
        -- 'x_length' was not properly updated... we will dismiss the samples until it is configured back again
        elsif num_samples_count = cnt_0_16b then
          fwd_adc_valid_0_s <= '0';
          fwd_adc_valid_1_s <= '0';
          fwd_adc_valid_2_s <= '0';
          fwd_adc_valid_3_s <= '0';

          -- in 'burst' mode, when we do miss a transaction, we will notify the PS about it as well
          if DMA_x_length_valid_int_AXI = '0' and DMA_x_length_valid_count_AXI = cnt_0_5b and overflow_notified_to_PS ='0' and first_x_length_received = '1' then
            fwd_adc_overflow_s <= '1';
            overflow_notified_to_PS <='1';
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'DMA_x_length_AXI'
  process(s_axi_aclk)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        DMA_x_length_AXI <= (others => '0');
        DMA_x_length_valid_AXI <= '0';
        DMA_x_length_valid_int_AXI_i <= '0';
      else
        -- clear unused signals
        DMA_x_length_valid_AXI <= '0';

        -- fixed assignation
        DMA_x_length_valid_int_AXI_i <= DMA_x_length_valid_int_AXI;

        -- forward new DMA_x_length_AXI values only
        if DMA_x_length_valid_int_AXI_i = '0' and DMA_x_length_valid_int_AXI = '1' then
          DMA_x_length_AXI <= DMA_x_length_int_AXI;
          DMA_x_length_valid_AXI <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- mapping of the internal signals to the corresponding output ports
  fwd_adc_enable_0 <= adc_enable_0_and_1_AXI(0);
  fwd_adc_valid_0 <= fwd_adc_valid_0_s;
  fwd_adc_data_0 <= fwd_adc_data_0_s;
  fwd_adc_enable_1 <= adc_enable_0_and_1_AXI(0); --adc_enable_0_and_1_AXI(1);
  fwd_adc_valid_1 <= fwd_adc_valid_1_s;
  fwd_adc_data_1 <= fwd_adc_data_1_s;
  fwd_adc_enable_2 <= adc_enable_2_and_3_AXI(0);
  fwd_adc_valid_2 <= fwd_adc_valid_2_s;
  fwd_adc_data_2 <= fwd_adc_data_2_s;
  fwd_adc_enable_3 <= adc_enable_2_and_3_AXI(0); --adc_enable_2_and_3_AXI(1);
  fwd_adc_valid_3 <= fwd_adc_valid_3_s;
  fwd_adc_data_3 <= fwd_adc_data_3_s;
  fwd_adc_overflow <= fwd_adc_overflow_s;
  fwd_DMA_x_length <= DMA_x_length_AXI;
  fwd_DMA_x_length_valid <= DMA_x_length_valid_AXI;
  fwd_adc_overflow_BBclk <= fwd_adc_overflow_BBclk_s;

  -- ***************************************************
  -- block instances
  -- ***************************************************

  -- cross-clock domain sharing of 'current_lclk_count'
  synchronizer_current_lclk_count_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 64,  -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => current_lclk_count,
      src_data_valid => '1', -- always valid
      dst_clk => s_axi_aclk,
      dst_data => current_lclk_count_AXI,
      dst_data_valid => open -- not needed
    );

  -- cross-clock domain sharing of 'DMA_x_length_int'
  synchronizer_DMA_x_length_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => PARAM_DMA_LENGTH_WIDTH,
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => DMA_x_length_int,
      src_data_valid => '1', -- always valid
      dst_clk => s_axi_aclk,
      dst_data => DMA_x_length_int_AXI,
      dst_data_valid => open -- not needed
    );

  -- cross-clock domain sharing of 'DMA_x_length_valid_int'
  synchronizer_DMA_x_length_valid_int_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 1,
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data(0) => DMA_x_length_valid_int,
      src_data_valid => '1', -- always valid
      dst_clk => s_axi_aclk,
      dst_data(0) => DMA_x_length_valid_int_AXI,
      dst_data_valid => open -- not needed
    );

  -- cross-clock domain sharing of 'DMA_x_length_applied_AXI'
  synchronizer_DMA_x_length_applied_AXI_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 1,
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data(0) => '1',
      src_data_valid => DMA_x_length_applied_AXI,
      dst_clk => ADCxN_clk,
      dst_data => open, -- not needed
      dst_data_valid => DMA_x_length_applied
    );

  -- cross-clock domain sharing of 'DMA_x_length_valid_count'
  synchronizer_DMA_x_length_valid_count_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 5,
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => DMA_x_length_valid_count,
      src_data_valid => '1', -- always valid
      dst_clk => s_axi_aclk,
      dst_data => DMA_x_length_valid_count_AXI,
      dst_data_valid => open -- not needed
    );

  -- concurrent assignment of CDC signals
  adc_enable_0_and_1 <= adc_enable_1 & adc_enable_0;

  -- cross-clock domain sharing of 'adc_enable_0_and_1'
  synchronizer_adc_enable_0_and_1_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 2,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => adc_enable_0_and_1,
      src_data_valid => '1', -- always valid
      dst_clk => s_axi_aclk,
      dst_data => adc_enable_0_and_1_AXI,
      dst_data_valid => open -- not needed
    );

  -- cross-clock domain sharing of 'adc_data_0_i_i_x1path'
  synchronizer_adc_data_0_i_i_x1path_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 16,  -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => adc_data_0_i_i_x1path,
      src_data_valid => adc_valid_0_i_i_x1path,
      dst_clk => s_axi_aclk,
      dst_data => adc_data_0_AXI,
      dst_data_valid => adc_valid_0_AXI
    );

  -- cross-clock domain sharing of 'adc_data_1_i_i_x1path'
  synchronizer_adc_data_1_i_i_x1path_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 16,  -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => adc_data_1_i_i_x1path,
      src_data_valid => adc_valid_0_i_i_x1path, --adc_valid_1_i_i_x1path,
      dst_clk => s_axi_aclk,
      dst_data => adc_data_1_AXI,
      dst_data_valid => open --adc_valid_1_AXI
    );

  TWO_ANTENNA_FIFO_inst: if PARAM_TWO_ANTENNA_SUPPORT generate
    -- concurrent assignment of CDC signals
    adc_enable_2_and_3 <= adc_enable_3 & adc_enable_2;

    -- cross-clock domain sharing of 'adc_enable_2_and_3'
    synchronizer_adc_enable_2_and_3_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH => 2,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => ADCxN_clk,
        src_data => adc_enable_2_and_3,
        src_data_valid => '1', -- always valid
        dst_clk => s_axi_aclk,
        dst_data => adc_enable_2_and_3_AXI,
        dst_data_valid => open -- not needed
      );

    -- cross-clock domain sharing of 'adc_data_2_i_i_x1path'
    synchronizer_adc_data_2_i_i_x1path_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH => 16,  -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => ADCxN_clk,
        src_data => adc_data_2_i_i_x1path,
        src_data_valid => adc_valid_2_i_i_x1path,
        dst_clk => s_axi_aclk,
        dst_data => adc_data_2_AXI,
        dst_data_valid => adc_valid_2_AXI
      );

    -- cross-clock domain sharing of 'adc_data_3_i_i_x1path'
    synchronizer_adc_data_3_i_i_x1path_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH => 16,  -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => ADCxN_clk,
        src_data => adc_data_3_i_i_x1path,
        src_data_valid => adc_valid_2_i_i_x1path, --adc_valid_3_i_i_x1path,
        dst_clk => s_axi_aclk,
        dst_data => adc_data_3_AXI,
        dst_data_valid => open --adc_valid_3_AXI
      );
  end generate TWO_ANTENNA_FIFO_inst;

  -- cross-clock domain sharing of 'fwd_adc_overflow'
  synchronizer_fwd_adc_overflow_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH => 1,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data(0) => '1',
      src_data_valid => fwd_adc_overflow_s,
      dst_clk => ADCxN_clk,
      dst_data => open, -- not needed
      dst_data_valid => fwd_adc_overflow_BBclk_s
    );
end generate CDC_output_processing;

  -- process managing the debug data output ports to 'srsUE_AXI_control_unit'
  process(ADCxN_clk,ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset='1' then -- synchronous high-active reset: initialization of signals
        ADC_FSM_status <= (others => '0');
        ADC_FSM_new_status <= '0';
        ADC_FSM_status_unread <= '0';
      else
        -- fixed assignations
        ADC_FSM_status <= ADC_FSM_status_s;

        -- @TO_BE_IMPROVED: add support to debugging data in x1 clock ratios
        if (not PARAM_x1_FPGA_SAMPLING_RATIO) then
          if ADC_FSM_status_s_valid = '1' and ADC_FSM_status_unread = '0' then
            ADC_FSM_status_unread <= '1';
            ADC_FSM_new_status <= '1';
          elsif ADC_FSM_status_unread = '1' and ADC_FSM_status_read = '1' then
            ADC_FSM_status_unread <= '0';
            ADC_FSM_new_status <= '0';
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

end arch_adc_fifo_timestamp_enabler_RTL_impl;
