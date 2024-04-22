--
-- Copyright 2013-2020 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all; -- We do use signed arithmetic
use IEEE.numeric_std.all;

-- Device primitives library
library UNISIM;
use UNISIM.vcomponents.all;

-- I/O libraries * SIMULATION ONLY *
use STD.textio.all;
use ieee.std_logic_textio.all;

--! Currently only one Tx antenna is supported in this design; this block will interface the rfdc IP
--! and provide the decimated I/Q data, jointly with the related clock, as expected by the timestamping
--! and synchronization blocks.

entity rfdc_dac_data_interp_and_pack is
  generic (
    PARAM_OUT_CLEANING_FIR : boolean := false --! A low-pass filter to clean the output signal can be added at the end (true) or skipped [(false) default]
  );
  port (
    -- **********************************
    -- interface to srsUE_AXI_control_unit (@s_axi_aclk)
    -- **********************************

    -- clock and reset signals
    s_axi_aclk    : in std_logic;
    s_axi_aresetn : in std_logic;

    -- parameters from PS
    rfdc_N_FFT_param : in std_logic_vector(2 downto 0);               --! Signal providing the 'N_FFT' PSS parameter (i.e., number of FFT points) (@s_axi_aclk)
    rfdc_N_FFT_valid : in std_logic;                                  --! Signal indicating if the output 'N_FFT' PSS parameter is valid (@s_axi_aclk)

    -- **********************************
    -- clock and reset signals governing the rfdc
    -- **********************************

    -- #dac channel 0
    dac0_axis_aclk : in std_logic;                                    --! DAC channel 0 clock signal (@245.76 MHz)
    dac0_axis_aresetn : in std_logic;                                 --! RFdc low-active reset signal (mapped to the DAC channel 0 clock domain [@245.76 MHz])

    -- **********************************
    -- dac 0 data interface (@dac0_axis_aclk)
    -- **********************************

    dac00_axis_tdata : out std_logic_vector(31 downto 0);             --! Parallel (interleaved) output I/Q data (AXI-formatted)
    dac00_axis_tvalid : out std_logic;                                --! Valid signal for 'DAC00_axis_tdata'
    dac00_axis_tready : in std_logic;                                 --! Signal indicating to RFdc that we are ready to receive new data through 'DAC00_axis_tdata'

    -- ****************************
		-- interface to dac_fifo_timestamp_enabler
		-- ****************************

    -- clock signal at Nx sampling-rate
    DACxN_clk : in std_logic;                                         --! DAC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    DACxN_reset : in std_logic;                                       --! DAC high-active reset signal (mapped to the DAC clock xN domain [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    DACxN_locked : in std_logic;                                      --! DAC clock locked indication signal

    -- I/Q data
    dac_enable_0 : in std_logic;                                      --! Enable signal for DAC data port 0
    dac_valid_0 : in std_logic;                                       --! Valid signal for DAC data port 0
    dac_data_0 : in std_logic_vector(15 downto 0);                    --! DAC parallel data port 0 [16-bit I samples, Tx antenna 1]
    dac_enable_1 : in std_logic;                                      --! Enable signal for DAC data port 1
    dac_valid_1 : in std_logic;                                       --! Valid signal for DAC data port 1
    dac_data_1 : in std_logic_vector(15 downto 0)                     --! DAC parallel data port 1 [16-bit Q samples, Tx antenna 1]
  );
end rfdc_dac_data_interp_and_pack;

architecture arch_rfdc_dac_data_interp_and_pack_RTL_impl of rfdc_dac_data_interp_and_pack is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- FFT configuration-parameter constants
  constant cnt_128_FFT_points_3b : std_logic_vector(2 downto 0):="000";
  constant cnt_256_FFT_points_3b : std_logic_vector(2 downto 0):="001";
  constant cnt_512_FFT_points_3b : std_logic_vector(2 downto 0):="010";
  constant cnt_1024_FFT_points_3b : std_logic_vector(2 downto 0):="011";
  constant cnt_2048_FFT_points_3b : std_logic_vector(2 downto 0):="100";

  -- interpolation FIR related constants
  constant cnt_2xinterpolation_FIR_length : std_logic_vector(6 downto 0):="001"&x"F";
  constant cnt_8xinterpolation_FIR_length : std_logic_vector(8 downto 0):="0"&x"7F";
  constant cnt_1_7b : std_logic_vector(6 downto 0):="000"&x"1";
  constant cnt_1_9b : std_logic_vector(8 downto 0):="0"&x"01";

  -- **********************************
  -- component instantiation
  -- **********************************

  -- 2x interpolating FIR (from 1.92MSPS to 3.84MSPS)
  component dac_interpolation_192msps_to_384msps is
    port (
      aresetn : in std_logic;
      aclk : in std_logic;
      s_axis_data_tvalid : in std_logic;
      s_axis_data_tready : out std_logic;
      s_axis_data_tdata : in std_logic_vector(15 downto 0);
      m_axis_data_tvalid : out std_logic;
      m_axis_data_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  -- 2x interpolating FIR (from 3.84MSPS to 7.68MSPS)
  component dac_interpolation_384msps_to_768msps is
    port (
      aresetn : in std_logic;
      aclk : in std_logic;
      s_axis_data_tvalid : in std_logic;
      s_axis_data_tready : out std_logic;
      s_axis_data_tdata : in std_logic_vector(15 downto 0);
      m_axis_data_tvalid : out std_logic;
      m_axis_data_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  -- 2x interpolating FIR (from 7.68MSPS to 15.36MSPS)
  component dac_interpolation_768msps_to_1536msps is
    port (
      aresetn : in std_logic;
      aclk : in std_logic;
      s_axis_data_tvalid : in std_logic;
      s_axis_data_tready : out std_logic;
      s_axis_data_tdata : in std_logic_vector(15 downto 0);
      m_axis_data_tvalid : out std_logic;
      m_axis_data_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  -- 2x interpolating FIR (from 15.36MSPS to 30.72MSPS)
  component dac_interpolation_1536msps_to_3072msps is
    port (
      aresetn : in std_logic;
      aclk : in std_logic;
      s_axis_data_tvalid : in std_logic;
      s_axis_data_tready : out std_logic;
      s_axis_data_tdata : in std_logic_vector(15 downto 0);
      m_axis_data_tvalid : out std_logic;
      m_axis_data_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  -- 8x interpolating FIR (from 30.72MSPS to 245.76 MSPS)
  component dac_interpolation_3072msps_to_24576msps is
    port (
      aresetn : in std_logic;
      aclk : in std_logic;
      s_axis_data_tvalid : in std_logic;
      s_axis_data_tready : out std_logic;
      s_axis_data_tdata : in std_logic_vector(15 downto 0);
      m_axis_data_tvalid : out std_logic;
      m_axis_data_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  -- low-pass cleaning FIR (filters out all undesired bands of the interpolated signal @245.76 MSPS)
  component lowpass_clean_signal_at245msps is
    port (
      aresetn : in std_logic;
      aclk : in std_logic;
      s_axis_data_tvalid : in std_logic;
      s_axis_data_tready : out std_logic;
      s_axis_data_tdata : in std_logic_vector(15 downto 0);
      m_axis_data_tvalid : out std_logic;
      m_axis_data_tdata : out std_logic_vector(39 downto 0)
    );
  end component;

  -- [16-bit] fifo-based multi-bit cross-clock domain synchronizer stage to enable passing I/Q samples between different clock domains (e.g., FPGA using a higher processing speed)
  component multibit_cross_clock_domain_fifo_synchronizer_resetless_16b is
    generic (
      -- parameter defining the current data-width
      SYNCH_ACTIVE : boolean := true -- indicates if the synchronizer must be really instantiated or if it needs to be bypassed; this attribute is used to
                                     --   increase the flexibility of the design by supporting various clock sources or a single one without requiring changes
                                     --   in the VHDL code. In cases where the source and destination clock are tied to the same clock signal, then this circuit
                                     --   will be bypassed (i.e., ACTIVE := false -> then the logic will be prunned by the synthesizer and dst_data* = src_data*),
                                     --   whereas if they are tied to different clock signals, then this circuit will be used (i.e., ACTIVE := true -> the logic
                                     --   will be synthesized and dst_data* = synchronized(src_data*))
    );
    port (
      -- input ports
      src_clk : in std_logic;                                 -- source clock domain signal
      src_data : in std_logic_vector(15 downto 0);            -- parallel input data bus (mapped to the source clock domain)
      src_data_valid : in std_logic;                          -- signal indicating when the input data is valid (mapped to the source clock domain)
      dst_clk : in std_logic;                                 -- destination clock domain signal

      -- output ports
      dst_data : out std_logic_vector(15 downto 0);           -- parallel output data bus (mapped to the destination clock domain)
      dst_data_valid : out std_logic                          -- signal indicating when the output data is valid (mapped to the destination clock domain)
    );
  end component;

  -- [3-bit] fifo-based multi-bit cross-clock domain synchronizer stage to enable passing I/Q samples between different clock domains (e.g., FPGA using a higher processing speed)
  component multibit_cross_clock_domain_fifo_synchronizer_resetless_3b is
    generic (
      -- parameter defining the current data-width
      SYNCH_ACTIVE : boolean := true -- indicates if the synchronizer must be really instantiated or if it needs to be bypassed; this attribute is used to
                                     --   increase the flexibility of the design by supporting various clock sources or a single one without requiring changes
                                     --   in the VHDL code. In cases where the source and destination clock are tied to the same clock signal, then this circuit
                                     --   will be bypassed (i.e., ACTIVE := false -> then the logic will be prunned by the synthesizer and dst_data* = src_data*),
                                     --   whereas if they are tied to different clock signals, then this circuit will be used (i.e., ACTIVE := true -> the logic
                                     --   will be synthesized and dst_data* = synchronized(src_data*))
    );
    port (
      -- input ports
      src_clk : in std_logic;                                 -- source clock domain signal
      src_data : in std_logic_vector(2 downto 0);             -- parallel input data bus (mapped to the source clock domain)
      src_data_valid : in std_logic;                          -- signal indicating when the input data is valid (mapped to the source clock domain)
      dst_clk : in std_logic;                                 -- destination clock domain signal

      -- output ports
      dst_data : out std_logic_vector(2 downto 0);            -- parallel output data bus (mapped to the destination clock domain)
      dst_data_valid : out std_logic                          -- signal indicating when the output data is valid (mapped to the destination clock domain)
    );
  end component;

  -- [1-bit] fifo-based multi-bit cross-clock domain synchronizer stage to enable passing I/Q samples between different clock domains (e.g., FPGA using a higher processing speed)
  component multibit_cross_clock_domain_fifo_synchronizer_resetless_1b is
    generic (
      -- parameter defining the current data-width
      SYNCH_ACTIVE : boolean := true -- indicates if the synchronizer must be really instantiated or if it needs to be bypassed; this attribute is used to
                                     --   increase the flexibility of the design by supporting various clock sources or a single one without requiring changes
                                     --   in the VHDL code. In cases where the source and destination clock are tied to the same clock signal, then this circuit
                                     --   will be bypassed (i.e., ACTIVE := false -> then the logic will be prunned by the synthesizer and dst_data* = src_data*),
                                     --   whereas if they are tied to different clock signals, then this circuit will be used (i.e., ACTIVE := true -> the logic
                                     --   will be synthesized and dst_data* = synchronized(src_data*))
    );
    port (
      -- input ports
      src_clk : in std_logic;                                 -- source clock domain signal
      src_data : in std_logic_vector(0 downto 0);             -- parallel input data bus (mapped to the source clock domain)
      src_data_valid : in std_logic;                          -- signal indicating when the input data is valid (mapped to the source clock domain)
      dst_clk : in std_logic;                                 -- destination clock domain signal

      -- output ports
      dst_data : out std_logic_vector(0 downto 0);            -- parallel output data bus (mapped to the destination clock domain)
      dst_data_valid : out std_logic                          -- signal indicating when the output data is valid (mapped to the destination clock domain)
    );
  end component;

  -- latency-leveller shift register [optimized for 7.68 MHz - first in the chain]
  component lat_leveller_shift_reg_768msps
    port (
      D : in std_logic_vector(16 downto 0);
      CLK : in std_logic;
      Q : out std_logic_vector(16 downto 0)
    );
  end component;

  -- latency-leveller shift register [optimized for 3.84 MHz - second in the chain]
  component lat_leveller_shift_reg_384msps
    port (
      D : in std_logic_vector(16 downto 0);
      CLK : in std_logic;
      Q : out std_logic_vector(16 downto 0)
    );
  end component;

  -- latency-leveller shift register [optimized for 15.36 MHz - third in the chain]
  component lat_leveller_shift_reg_1536msps
    port (
      D : in std_logic_vector(16 downto 0);
      CLK : in std_logic;
      Q : out std_logic_vector(16 downto 0)
    );
  end component;

  -- latency-leveller shift register [optimized for 30.72 MHz - fourth in the chain]
  component lat_leveller_shift_reg_3072msps
    port (
      D : in std_logic_vector(16 downto 0);
      CLK : in std_logic;
      Q : out std_logic_vector(16 downto 0)
    );
  end component;

  -- latency-leveller shift register [optimized for 1.92 MHz - last in the chain]
  component lat_leveller_shift_reg_192msps
    port (
      D : in std_logic_vector(16 downto 0);
      CLK : in std_logic;
      Q : out std_logic_vector(16 downto 0)
    );
  end component;

  -- **********************************
  -- internal signals
  -- **********************************

  -- PS configuration parameters related signals
  signal current_N_FFT : std_logic_vector(2 downto 0);
  signal interpolation_initialized : std_logic;

  -- 1.92MSPS I/Q data from 'dac_fifo_timestamp_enabler' signals
  signal data_I_1p92MHz_3p84MHzClk : std_logic_vector(15 downto 0);
  signal data_I_valid_1p92MHz_3p84MHzClk : std_logic;
  signal data_Q_1p92MHz_3p84MHzClk : std_logic_vector(15 downto 0);
  -- signal data_Q_valid_1p92MHz_3p84MHzClk : std_logic;
  signal data_IQ_1p92MHz_from_DMA : std_logic;

  -- 1.92MSPS to 3.84MSPS translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I_1p92MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I_valid_1p92MHz_245p76MHzClk : std_logic:='0';
  signal data_Q_1p92MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q_valid_1p92MHz_245p76MHzClk : std_logic:='0';

  -- 1.92MSPS to 3.84MSPS 2x interpolating FIR signals
  signal s_axis_data_tdata_I_1p92MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I_1p92MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I_1p92MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_I_3p84MHz_245p76MHz : std_logic_vector(31 downto 0);
  signal m_axis_data_tvalid_I_3p84MHz_245p76MHz : std_logic;
  signal s_axis_data_tdata_Q_1p92MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q_1p92MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q_1p92MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_Q_3p84MHz_245p76MHz : std_logic_vector(31 downto 0);
  -- signal m_axis_data_tvalid_Q_3p84MHz_245p76MHz : std_logic;
  signal truncated_FIR_data_I_3p84MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I_3p84MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q_3p84MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q_3p84MHz_245p76MHz_valid : std_logic;
  signal FIR_3p84MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 3.84MSPS I/Q data from 'dac_fifo_timestamp_enabler' signals
  signal data_I_3p84MHz_7p68MHzClk : std_logic_vector(15 downto 0);
  signal data_I_valid_3p84MHz_7p68MHzClk : std_logic;
  signal data_Q_3p84MHz_7p68MHzClk : std_logic_vector(15 downto 0);
  -- signal data_Q_valid_3p84MHz_7p68MHzClk : std_logic;
  signal data_IQ_3p84MHz_from_DMA : std_logic;
  signal enable_384msps_to_768msps_interp_filter : std_logic;
  signal enable_384msps_to_768msps_interp_filter_DAC0clk_s : std_logic := '0';
  signal enable_384msps_to_768msps_interp_filter_DAC0clk   : std_logic := '0';

  -- 3.84MSPS to 7.68MSPS translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I_valid_3p84MHz_245p76MHzClk : std_logic:='0';
  signal data_Q_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q_valid_3p84MHz_245p76MHzClk : std_logic:='0';

  -- 3.84MSPS to 7.68MSPS 2x interpolating FIR signals
  signal s_axis_data_tdata_I_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I_3p84MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I_3p84MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_I_7p68MHz_245p76MHz : std_logic_vector(31 downto 0);
  signal m_axis_data_tvalid_I_7p68MHz_245p76MHz : std_logic;
  signal s_axis_data_tdata_Q_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q_3p84MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q_3p84MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_Q_7p68MHz_245p76MHz : std_logic_vector(31 downto 0);
  -- signal m_axis_data_tvalid_Q_7p68MHz_245p76MHz : std_logic;
  signal truncated_FIR_data_I_7p68MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I_7p68MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q_7p68MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q_7p68MHz_245p76MHz_valid : std_logic;
  signal FIR_7p68MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 7.68MSPS I/Q data from 'dac_fifo_timestamp_enabler' signals
  signal data_I_7p68MHz_15p36MHzClk : std_logic_vector(15 downto 0);
  signal data_I_valid_7p68MHz_15p36MHzClk : std_logic;
  signal data_Q_7p68MHz_15p36MHzClk : std_logic_vector(15 downto 0);
  -- signal data_Q_valid_7p68MHz_15p36MHzClk : std_logic;
  signal data_IQ_7p68MHz_from_DMA : std_logic;
  signal enable_768msps_to_1536msps_interp_filter : std_logic;
  signal enable_768msps_to_1536msps_interp_filter_DAC0clk_s : std_logic := '0';
  signal enable_768msps_to_1536msps_interp_filter_DAC0clk   : std_logic := '0';

  -- 7.68MSPS to 15.36MSPS translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I_valid_7p68MHz_245p76MHzClk : std_logic:='0';
  signal data_Q_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q_valid_7p68MHz_245p76MHzClk : std_logic:='0';

  -- 7.68MSPS to 15.36MSPS 2x interpolating FIR signals
  signal s_axis_data_tdata_I_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I_7p68MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I_7p68MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_I_15p36MHz_245p76MHz : std_logic_vector(31 downto 0);
  signal m_axis_data_tvalid_I_15p36MHz_245p76MHz : std_logic;
  signal s_axis_data_tdata_Q_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q_7p68MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q_7p68MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_Q_15p36MHz_245p76MHz : std_logic_vector(31 downto 0);
  -- signal m_axis_data_tvalid_Q_15p36MHz_245p76MHz : std_logic;
  signal truncated_FIR_data_I_15p36MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I_15p36MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q_15p36MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q_15p36MHz_245p76MHz_valid : std_logic;
  signal FIR_15p36MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 15.36MSPS I/Q data from 'dac_fifo_timestamp_enabler' signals
  signal data_I_15p36MHz_30p72MHzClk : std_logic_vector(15 downto 0);
  signal data_I_valid_15p36MHz_30p72MHzClk : std_logic;
  signal data_Q_15p36MHz_30p72MHzClk : std_logic_vector(15 downto 0);
  -- signal data_Q_valid_15p36MHz_30p72MHzClk : std_logic;
  signal data_IQ_15p36MHz_from_DMA : std_logic;
  signal enable_1536msps_to_3072msps_interp_filter : std_logic;
  signal enable_1536msps_to_3072msps_interp_filter_DAC0clk_s : std_logic := '0';
  signal enable_1536msps_to_3072msps_interp_filter_DAC0clk   : std_logic := '0';

  -- 15.36MSPS to 30.72MSPS translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I_valid_15p36MHz_245p76MHzClk : std_logic:='0';
  signal data_Q_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q_valid_15p36MHz_245p76MHzClk : std_logic:='0';

  -- 15.36MSPS to 30.72MSPS 2x interpolating FIR signals
  signal s_axis_data_tdata_I_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I_15p36MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I_15p36MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_I_30p72MHz_245p76MHz : std_logic_vector(31 downto 0);
  signal m_axis_data_tvalid_I_30p72MHz_245p76MHz : std_logic;
  signal s_axis_data_tdata_Q_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q_15p36MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q_15p36MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_Q_30p72MHz_245p76MHz : std_logic_vector(31 downto 0);
  -- signal m_axis_data_tvalid_Q_30p72MHz_245p76MHz : std_logic;
  signal truncated_FIR_data_I_30p72MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I_30p72MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q_30p72MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_Q_30p72MHz_245p76MHz_valid : std_logic;
  signal FIR_30p72MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 30.72MSPS I/Q data from 'dac_fifo_timestamp_enabler' signals
  signal data_I_30p72MHz_61p44MHzClk : std_logic_vector(15 downto 0);
  signal data_I_valid_30p72MHz_61p44MHzClk : std_logic;
  signal data_Q_30p72MHz_61p44MHzClk : std_logic_vector(15 downto 0);
  -- signal data_Q_valid_30p72MHz_61p44MHzClk : std_logic;
  signal data_IQ_30p72MHz_from_DMA : std_logic;

  -- 30.72MSPS to 245.76MSPS translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I_valid_30p72MHz_245p76MHzClk : std_logic:='0';
  signal data_Q_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q_valid_30p72MHz_245p76MHzClk : std_logic:='0';

  -- 30.72MSPS to 245.76MSPS 8x interpolating FIR signals
  signal s_axis_data_tdata_I_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I_30p72MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I_30p72MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_I_245p76MHz : std_logic_vector(31 downto 0);
  signal m_axis_data_tvalid_I_245p76MHz : std_logic;
  signal s_axis_data_tdata_Q_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q_30p72MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q_30p72MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tdata_Q_245p76MHz : std_logic_vector(31 downto 0);
  -- signal m_axis_data_tvalid_Q_245p76MHz : std_logic;
  signal truncated_FIR_data_I_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q_245p76MHz_valid : std_logic;
  signal FIR_245p76MHz_output_discard_count : std_logic_vector(8 downto 0);

  -- latency-leveller shift registers signals
  signal lat_leveller_shift_reg_768msps_I_in : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_768msps_I_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_768msps_Q_in : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_768msps_Q_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_384msps_I_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_384msps_Q_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_1536msps_I_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_1536msps_Q_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_3072msps_I_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_3072msps_Q_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_192msps_I_out : std_logic_vector(16 downto 0):=(others => '0');
  signal lat_leveller_shift_reg_192msps_Q_out : std_logic_vector(16 downto 0):=(others => '0');
  signal aligned_I_out : std_logic_vector(15 downto 0);
  signal aligned_I_out_valid : std_logic;
  signal aligned_Q_out : std_logic_vector(15 downto 0);
  -- signal aligned_Q_out_valid : std_logic;
  signal dac00_output_provision_started : std_logic;

  -- low-pass cleaning FIR signals
  signal s_axis_data_tvalid_I_245p76MHz : std_logic:='0';
  signal s_axis_data_tready_I_245p76MHz : std_logic:='0';
  signal s_axis_data_tdata_I_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal m_axis_data_tvalid_filtered_I_245p76MHz : std_logic:='0';
  signal m_axis_data_tdata_filtered_I_245p76MHz : std_logic_vector(39 downto 0):=(others => '0');
  -- signal s_axis_data_tvalid_Q_245p76MHz : std_logic:='0';
  -- signal s_axis_data_tready_Q_245p76MHz : std_logic:='0';
  signal s_axis_data_tdata_Q_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  -- signal m_axis_data_tvalid_filtered_Q_245p76MHz : std_logic:='0';
  signal m_axis_data_tdata_filtered_Q_245p76MHz : std_logic_vector(39 downto 0):=(others => '0');
  signal truncated_filtered_FIR_data_I_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal truncated_filtered_FIR_data_I_245p76MHz_valid : std_logic:='0';
  signal truncated_filtered_FIR_data_Q_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  -- signal truncated_filtered_FIR_data_Q_245p76MHz_valid : std_logic:='0';
  signal filtered_FIR_245p76MHz_output_discard_count : std_logic_vector(8 downto 0);

  -- cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup
  signal clk_mgr_locked_DAC0clk : std_logic:='0';
  signal clk_mgr_locked_DAC0clk_s : std_logic:='0';
  signal clk_mgr_locked_AXIclk_s : std_logic:='0';
  signal clk_mgr_locked_AXIclk : std_logic:='0';
  signal current_N_FFT_DAC0clk : std_logic_vector(2 downto 0):=(others => '0');
  signal current_N_FFT_valid_DAC0clk : std_logic:='0';
  signal rfdc_N_FFT_param_DAC0clk : std_logic_vector(2 downto 0):=(others => '0');
  signal rfdc_N_FFT_valid_DAC0clk : std_logic:='0';
  signal pulse_rfdc_N_FFT_valid_DAC0clk : std_logic:='0';
  signal generate_N_FFT_config_flag_pulse_DAC0 : std_logic:='0';
  signal current_N_FFT_DACxNclk : std_logic_vector(2 downto 0):=(others => '0');
  signal current_N_FFT_valid_DACxNclk : std_logic:='0';
  signal rfdc_N_FFT_param_DACxNclk : std_logic_vector(2 downto 0):=(others => '0');
  signal rfdc_N_FFT_valid_DACxNclk : std_logic:='0';

  signal data_IQ_1p92MHz_from_DMA_DAC0clk : std_logic:='0';
  signal data_IQ_1p92MHz_from_DMA_DAC0clk_s : std_logic:='0';
  signal data_IQ_3p84MHz_from_DMA_DAC0clk : std_logic:='0';
  signal data_IQ_3p84MHz_from_DMA_DAC0clk_s : std_logic:='0';
  signal data_IQ_7p68MHz_from_DMA_DAC0clk : std_logic:='0';
  signal data_IQ_7p68MHz_from_DMA_DAC0clk_s : std_logic:='0';
  signal data_IQ_15p36MHz_from_DMA_DAC0clk : std_logic:='0';
  signal data_IQ_15p36MHz_from_DMA_DAC0clk_s : std_logic:='0';
  signal data_IQ_30p72MHz_from_DMA_DAC0clk : std_logic:='0';
  signal data_IQ_30p72MHz_from_DMA_DAC0clk_s : std_logic:='0';

  -- **********************************
  -- file handlers * SIMULATION ONLY *
  -- **********************************

  file output_IQ_file_cfg0_0 : text open write_mode is "interp_FIR_192MSPS_to_384MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_1 : text open write_mode is "interp_FIR_384MSPS_to_768MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_2 : text open write_mode is "interp_FIR_768MSPS_to_1536MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_3 : text open write_mode is "interp_FIR_1536MSPS_to_3072MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_4 : text open write_mode is "interp_FIR_3072MSPS_to_24576MSPS_outputs_full.txt";

begin

  -- ***************************************************
  -- management of the input parameters and decimation FIRs
  -- ***************************************************

  -- * NOTE: the clock manager benefits from the use of differentiated clocks for configuration and frequency-
  --         synthesis; hence it has been decided that input parameters from PS are received jointly with their
  --         original clock which is reused to program the clock-manager; the conversion of the parameters to
  --         the ADC clock - which is used as source for the frequency-synthesis - is thus done internally *

  -- process registering 'rfdc_N_FFT_param' [@s_axi_aclk]
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        current_N_FFT <= (others => '0');
      else
        if rfdc_N_FFT_valid = '1' then
          current_N_FFT <= rfdc_N_FFT_param;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process registering 'rfdc_N_FFT_param' [@dac0_axis_aclk]
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        current_N_FFT_DAC0clk <= (others => '0');
        current_N_FFT_valid_DAC0clk <= '0';
      else
        if pulse_rfdc_N_FFT_valid_DAC0clk = '1' then
          current_N_FFT_DAC0clk <= rfdc_N_FFT_param_DAC0clk;
          current_N_FFT_valid_DAC0clk <= '1';
        elsif interpolation_initialized = '1' then -- once the decimation-related signals have been initialized, we don't want to change them unless a new 'rfdc_N_FFT_param' value is received
          current_N_FFT_valid_DAC0clk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process registering 'rfdc_N_FFT_param' [@DACxN_clk]
  process(DACxN_clk,DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        current_N_FFT_DACxNclk <= (others => '0');
        current_N_FFT_valid_DACxNclk <= '0';
      else
        -- capture a new 'N_FFT' configuration
        if rfdc_N_FFT_valid_DACxNclk = '1' and current_N_FFT_valid_DACxNclk = '0' then
          current_N_FFT_DACxNclk <= rfdc_N_FFT_param_DACxNclk;
          current_N_FFT_valid_DACxNclk <= '1';
        -- 'N_FFT' won't be valid unless the clock manager has reached a 'locked' status
        elsif DACxN_locked = '0' then
          current_N_FFT_valid_DACxNclk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'interpolation_initialized'
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        interpolation_initialized <= '0';
      else
        -- we'll assert 'interpolation_initialized' after receiving a configuration from the PS and won't deassert it unless there is a reset
        if current_N_FFT_valid_DAC0clk = '1' and interpolation_initialized = '0' then
          interpolation_initialized <= '1';
        -- deassert 'interpolation_initialized' with each new set of parameters provided by the PS
        elsif rfdc_N_FFT_valid_DAC0clk = '1' and interpolation_initialized = '1' then
          interpolation_initialized <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'pulse_rfdc_N_FFT_valid_DAC0clk' (i.e., to make sure that each new UE configuration is properly accounted [only once] in the slower clock domain)
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        pulse_rfdc_N_FFT_valid_DAC0clk <= '0';
        generate_N_FFT_config_flag_pulse_DAC0 <= '1';
      else
        --clear the pulse signal
        pulse_rfdc_N_FFT_valid_DAC0clk <= '0';

        -- activate the pulse on a new storage operation only
        if pulse_rfdc_N_FFT_valid_DAC0clk = '0' and rfdc_N_FFT_valid_DAC0clk = '1' and generate_N_FFT_config_flag_pulse_DAC0 = '1' then
          pulse_rfdc_N_FFT_valid_DAC0clk <= '1';
          generate_N_FFT_config_flag_pulse_DAC0 <= '0';
        elsif rfdc_N_FFT_valid_DAC0clk = '0' and generate_N_FFT_config_flag_pulse_DAC0 = '0' then
          generate_N_FFT_config_flag_pulse_DAC0 <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the input data
  -- ***************************************************

  -- * NOTE: we are receiving the DAC inputs @DACxN_clk (i.e., 2x sampling rate), but the interpolating
  --         logic works @245.MHz; additionally, we do seek to provide an homogeneous latency (in terms
  --         of @DACxN_clk cycles) for all supported PRB configurations when providing the interpolated
  --         signal (@245.76 MSPS) to the RFdc *

  -- process managing the write to the interpolation fifos [@DACxN_clk]
  process(DACxN_clk,DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        -- 1.92  MSPS input data
        data_I_1p92MHz_3p84MHzClk <= (others => '0');
        data_I_valid_1p92MHz_3p84MHzClk <= '0';
        data_Q_1p92MHz_3p84MHzClk <= (others => '0');
        -- data_Q_valid_1p92MHz_3p84MHzClk <= '0';
        data_IQ_1p92MHz_from_DMA <= '0';
        -- 3.84  MSPS input data
        data_I_3p84MHz_7p68MHzClk <= (others => '0');
        data_I_valid_3p84MHz_7p68MHzClk <= '0';
        data_Q_3p84MHz_7p68MHzClk <= (others => '0');
        -- data_Q_valid_3p84MHz_7p68MHzClk <= '0';
        data_IQ_3p84MHz_from_DMA <= '0';
        enable_384msps_to_768msps_interp_filter <= '0';
        -- 7.68  MSPS input data
        data_I_7p68MHz_15p36MHzClk <= (others => '0');
        data_I_valid_7p68MHz_15p36MHzClk <= '0';
        data_Q_7p68MHz_15p36MHzClk <= (others => '0');
        -- data_Q_valid_7p68MHz_15p36MHzClk <= '0';
        data_IQ_7p68MHz_from_DMA <= '0';
        enable_768msps_to_1536msps_interp_filter <= '0';
        -- 15.36  MSPS input data
        data_I_15p36MHz_30p72MHzClk <= (others => '0');
        data_I_valid_15p36MHz_30p72MHzClk <= '0';
        data_Q_15p36MHz_30p72MHzClk <= (others => '0');
        -- data_Q_valid_15p36MHz_30p72MHzClk <= '0';
        data_IQ_15p36MHz_from_DMA <= '0';
        enable_1536msps_to_3072msps_interp_filter <= '0';
        -- 30.72  MSPS input data
        data_I_30p72MHz_61p44MHzClk <= (others => '0');
        data_I_valid_30p72MHz_61p44MHzClk <= '0';
        data_Q_30p72MHz_61p44MHzClk <= (others => '0');
        -- data_Q_valid_30p72MHz_61p44MHzClk <= '0';
        data_IQ_30p72MHz_from_DMA <= '0';
      else
        -- clear unused signals
        data_I_valid_1p92MHz_3p84MHzClk <= '0';
        -- data_Q_valid_1p92MHz_3p84MHzClk <= '0';
        data_IQ_1p92MHz_from_DMA <= '0';
        data_I_valid_3p84MHz_7p68MHzClk <= '0';
        -- data_Q_valid_3p84MHz_7p68MHzClk <= '0';
        data_IQ_3p84MHz_from_DMA <= '0';
        enable_384msps_to_768msps_interp_filter <= '0';
        data_I_valid_7p68MHz_15p36MHzClk <= '0';
        -- data_Q_valid_7p68MHz_15p36MHzClk <= '0';
        data_IQ_7p68MHz_from_DMA <= '0';
        enable_768msps_to_1536msps_interp_filter <= '0';
        data_I_valid_15p36MHz_30p72MHzClk <= '0';
        -- data_Q_valid_15p36MHz_30p72MHzClk <= '0';
        data_IQ_15p36MHz_from_DMA <= '0';
        enable_1536msps_to_3072msps_interp_filter <= '0';
        data_I_valid_30p72MHz_61p44MHzClk <= '0';
        -- data_Q_valid_30p72MHz_61p44MHzClk <= '0';
        data_IQ_30p72MHz_from_DMA <= '0';

        -- fixed assignations
        data_I_1p92MHz_3p84MHzClk <= dac_data_0;
        data_Q_1p92MHz_3p84MHzClk <= dac_data_1;
        data_I_3p84MHz_7p68MHzClk <= dac_data_0;
        data_Q_3p84MHz_7p68MHzClk <= dac_data_1;
        data_I_7p68MHz_15p36MHzClk <= dac_data_0;
        data_Q_7p68MHz_15p36MHzClk <= dac_data_1;
        data_I_15p36MHz_30p72MHzClk <= dac_data_0;
        data_Q_15p36MHz_30p72MHzClk <= dac_data_1;
        data_I_30p72MHz_61p44MHzClk <= dac_data_0;
        data_Q_30p72MHz_61p44MHzClk <= dac_data_1;

        -- we'll only write if the clock manager is locked and 'N_FFT' is properly configured
        if current_N_FFT_valid_DACxNclk = '1' and dac_enable_0 = '1' and dac_enable_1 = '1' then
          -- let's forward the input data to the correct decimation FIR filter
          case current_N_FFT_DACxNclk is
            when cnt_128_FFT_points_3b =>  -- 6 PRB
              -- 1.92  MSPS input data
              data_I_valid_1p92MHz_3p84MHzClk <= dac_valid_0;
              -- data_Q_valid_1p92MHz_3p84MHzClk <= dac_valid_1;
              data_IQ_1p92MHz_from_DMA <= '1';
              enable_384msps_to_768msps_interp_filter <= '1';
              enable_768msps_to_1536msps_interp_filter <= '1';
              enable_1536msps_to_3072msps_interp_filter <= '1';
            when cnt_256_FFT_points_3b =>  -- 15 PRB
              -- 3.84  MSPS input data
              data_I_valid_3p84MHz_7p68MHzClk <= dac_valid_0;
              -- data_Q_valid_3p84MHz_7p68MHzClk <= dac_valid_1;
              data_IQ_3p84MHz_from_DMA <= '1';
              enable_384msps_to_768msps_interp_filter <= '1';
              enable_768msps_to_1536msps_interp_filter <= '1';
              enable_1536msps_to_3072msps_interp_filter <= '1';
            when cnt_512_FFT_points_3b =>  -- 25 PRB
              -- 7.68  MSPS input data
              data_I_valid_7p68MHz_15p36MHzClk <= dac_valid_0;
              -- data_Q_valid_7p68MHz_15p36MHzClk <= dac_valid_1;
              data_IQ_7p68MHz_from_DMA <= '1';
              enable_768msps_to_1536msps_interp_filter <= '1';
              enable_1536msps_to_3072msps_interp_filter <= '1';
            when cnt_1024_FFT_points_3b => -- 50 PRB
              -- 15.36  MSPS input data
              data_I_valid_15p36MHz_30p72MHzClk <= dac_valid_0;
              -- data_Q_valid_15p36MHz_30p72MHzClk <= dac_valid_1;
              data_IQ_15p36MHz_from_DMA <= '1';
              enable_1536msps_to_3072msps_interp_filter <= '1';
            when others =>                 -- 100 PRB
              -- 30.72  MSPS input data
              data_I_valid_30p72MHz_61p44MHzClk <= dac_valid_0;
              -- data_Q_valid_30p72MHz_61p44MHzClk <= dac_valid_1;
              data_IQ_30p72MHz_from_DMA <= '1';
          end case;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the interpolation FIRs
  -- ***************************************************

  -- process managing the 1.92 MSPS to 3.84 MSPS x2 interpolating FIR inputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I_1p92MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I_1p92MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q_1p92MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q_1p92MHz_245p76MHzClk <= (others => '0');
      else
        -- check the source of the data (fixed in this testbench)
        -- * NOTE: we don't currently use 's_axis_data_tready_I_1p92MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_1p92MHz_from_DMA_DAC0clk = '1' then -- data from DMA
          s_axis_data_tdata_I_1p92MHz_245p76MHzClk <= data_I_1p92MHz_245p76MHzClk;
          s_axis_data_tvalid_I_1p92MHz_245p76MHzClk <= data_I_valid_1p92MHz_245p76MHzClk;
          s_axis_data_tdata_Q_1p92MHz_245p76MHzClk <= data_Q_1p92MHz_245p76MHzClk;
          -- s_axis_data_tvalid_Q_1p92MHz_245p76MHzClk <= data_Q_valid_1p92MHz_245p76MHzClk;
        else                                           -- no other path is possible
          s_axis_data_tvalid_I_1p92MHz_245p76MHzClk <= '0';
          -- s_axis_data_tvalid_Q_1p92MHz_245p76MHzClk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 1.92 MSPS to 3.84 MSPS x2 interpolating FIR outputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I_3p84MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I_3p84MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q_3p84MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q_3p84MHz_245p76MHz_valid <= '0';
        FIR_3p84MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I_3p84MHz_245p76MHz <= m_axis_data_tdata_I_3p84MHz_245p76MHz(30 downto 15);
        truncated_FIR_data_Q_3p84MHz_245p76MHz <= m_axis_data_tdata_Q_3p84MHz_245p76MHz(30 downto 15);

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_3p84MHz_output_discard_count <= cnt_2xinterpolation_FIR_length then
          truncated_FIR_data_I_3p84MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q_3p84MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I_3p84MHz_245p76MHz = '1' then
            FIR_3p84MHz_output_discard_count <= FIR_3p84MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I_3p84MHz_245p76MHz_valid <= m_axis_data_tvalid_I_3p84MHz_245p76MHz;
          -- truncated_FIR_data_Q_3p84MHz_245p76MHz_valid <= m_axis_data_tvalid_Q_3p84MHz_245p76MHz;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 3.84 MSPS to 7.68 MSPS x2 interpolating FIR inputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I_3p84MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I_3p84MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q_3p84MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q_3p84MHz_245p76MHzClk <= (others => '0');
      else
        -- check the source of the data (fixed in this testbench)
        -- * NOTE: we don't currently use 's_axis_data_tready_I_3p84MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_3p84MHz_from_DMA_DAC0clk = '1' then           -- data from DMA
          s_axis_data_tdata_I_3p84MHz_245p76MHzClk <= data_I_3p84MHz_245p76MHzClk;
          s_axis_data_tvalid_I_3p84MHz_245p76MHzClk <= data_I_valid_3p84MHz_245p76MHzClk;
          s_axis_data_tdata_Q_3p84MHz_245p76MHzClk <= data_Q_3p84MHz_245p76MHzClk;
          -- s_axis_data_tvalid_Q_3p84MHz_245p76MHzClk <= data_Q_valid_3p84MHz_245p76MHzClk;
        elsif enable_384msps_to_768msps_interp_filter_DAC0clk = '1' then -- data from 2x FIR
          s_axis_data_tdata_I_3p84MHz_245p76MHzClk <= truncated_FIR_data_I_3p84MHz_245p76MHz;
          s_axis_data_tvalid_I_3p84MHz_245p76MHzClk <= truncated_FIR_data_I_3p84MHz_245p76MHz_valid;
          s_axis_data_tdata_Q_3p84MHz_245p76MHzClk <= truncated_FIR_data_Q_3p84MHz_245p76MHz;
          -- s_axis_data_tvalid_Q_3p84MHz_245p76MHzClk <= truncated_FIR_data_Q_3p84MHz_245p76MHz_valid;
        else                                                     -- FIR not enabled
          s_axis_data_tvalid_I_3p84MHz_245p76MHzClk <= '0';
          -- s_axis_data_tvalid_Q_3p84MHz_245p76MHzClk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 3.84 MSPS to 7.68 MSPS x2 interpolating FIR outputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I_7p68MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I_7p68MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q_7p68MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q_7p68MHz_245p76MHz_valid <= '0';
        FIR_7p68MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I_7p68MHz_245p76MHz <= m_axis_data_tdata_I_7p68MHz_245p76MHz(29 downto 14);
        truncated_FIR_data_Q_7p68MHz_245p76MHz <= m_axis_data_tdata_Q_7p68MHz_245p76MHz(29 downto 14);

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_7p68MHz_output_discard_count <= cnt_2xinterpolation_FIR_length then
          truncated_FIR_data_I_7p68MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q_7p68MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I_7p68MHz_245p76MHz = '1' then
            FIR_7p68MHz_output_discard_count <= FIR_7p68MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I_7p68MHz_245p76MHz_valid <= m_axis_data_tvalid_I_7p68MHz_245p76MHz;
          -- truncated_FIR_data_Q_7p68MHz_245p76MHz_valid <= m_axis_data_tvalid_Q_7p68MHz_245p76MHz;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 7.68 MSPS to 15.36 MSPS x2 interpolating FIR inputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I_7p68MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I_7p68MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q_7p68MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q_7p68MHz_245p76MHzClk <= (others => '0');
      else
        -- check the source of the data (fixed in this testbench)
        -- * NOTE: we don't currently use 's_axis_data_tready_I_7p68MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_7p68MHz_from_DMA_DAC0clk = '1' then            -- data from DMA
          s_axis_data_tdata_I_7p68MHz_245p76MHzClk <= data_I_7p68MHz_245p76MHzClk;
          s_axis_data_tvalid_I_7p68MHz_245p76MHzClk <= data_I_valid_7p68MHz_245p76MHzClk;
          s_axis_data_tdata_Q_7p68MHz_245p76MHzClk <= data_Q_7p68MHz_245p76MHzClk;
          -- s_axis_data_tvalid_Q_7p68MHz_245p76MHzClk <= data_Q_valid_7p68MHz_245p76MHzClk;
        elsif enable_768msps_to_1536msps_interp_filter_DAC0clk = '1' then -- data from 2x FIR
          s_axis_data_tdata_I_7p68MHz_245p76MHzClk <= truncated_FIR_data_I_7p68MHz_245p76MHz;
          s_axis_data_tvalid_I_7p68MHz_245p76MHzClk <= truncated_FIR_data_I_7p68MHz_245p76MHz_valid;
          s_axis_data_tdata_Q_7p68MHz_245p76MHzClk <= truncated_FIR_data_Q_7p68MHz_245p76MHz;
          -- s_axis_data_tvalid_Q_7p68MHz_245p76MHzClk <= truncated_FIR_data_Q_7p68MHz_245p76MHz_valid;
        else                                                     -- FIR not enabled
          s_axis_data_tvalid_I_7p68MHz_245p76MHzClk <= '0';
          -- s_axis_data_tvalid_Q_7p68MHz_245p76MHzClk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 7.68 MSPS to 15.36 MSPS x2 interpolating FIR outputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I_15p36MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I_15p36MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q_15p36MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q_15p36MHz_245p76MHz_valid <= '0';
        FIR_15p36MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I_15p36MHz_245p76MHz <= m_axis_data_tdata_I_15p36MHz_245p76MHz(29 downto 14);
        truncated_FIR_data_Q_15p36MHz_245p76MHz <= m_axis_data_tdata_Q_15p36MHz_245p76MHz(29 downto 14);

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_15p36MHz_output_discard_count <= cnt_2xinterpolation_FIR_length then
          truncated_FIR_data_I_15p36MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q_15p36MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I_15p36MHz_245p76MHz = '1' then
            FIR_15p36MHz_output_discard_count <= FIR_15p36MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I_15p36MHz_245p76MHz_valid <= m_axis_data_tvalid_I_15p36MHz_245p76MHz;
          -- truncated_FIR_data_Q_15p36MHz_245p76MHz_valid <= m_axis_data_tvalid_Q_15p36MHz_245p76MHz;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 15.36 MSPS to 30.72 MSPS x2 interpolating FIR inputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I_15p36MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I_15p36MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q_15p36MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q_15p36MHz_245p76MHzClk <= (others => '0');
      else
        -- check the source of the data (fixed in this testbench)
        -- * NOTE: we don't currently use 's_axis_data_tready_I_15p36MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_15p36MHz_from_DMA_DAC0clk = '1' then            -- data from DMA
          s_axis_data_tdata_I_15p36MHz_245p76MHzClk <= data_I_15p36MHz_245p76MHzClk;
          s_axis_data_tvalid_I_15p36MHz_245p76MHzClk <= data_I_valid_15p36MHz_245p76MHzClk;
          s_axis_data_tdata_Q_15p36MHz_245p76MHzClk <= data_Q_15p36MHz_245p76MHzClk;
          -- s_axis_data_tvalid_Q_15p36MHz_245p76MHzClk <= data_Q_valid_15p36MHz_245p76MHzClk;
        elsif enable_1536msps_to_3072msps_interp_filter_DAC0clk = '1' then -- data from 2x FIR
          s_axis_data_tdata_I_15p36MHz_245p76MHzClk <= truncated_FIR_data_I_15p36MHz_245p76MHz;
          s_axis_data_tvalid_I_15p36MHz_245p76MHzClk <= truncated_FIR_data_I_15p36MHz_245p76MHz_valid;
          s_axis_data_tdata_Q_15p36MHz_245p76MHzClk <= truncated_FIR_data_Q_15p36MHz_245p76MHz;
          -- s_axis_data_tvalid_Q_15p36MHz_245p76MHzClk <= truncated_FIR_data_Q_15p36MHz_245p76MHz_valid;
        else                                                       -- FIR not enabled
          s_axis_data_tvalid_I_15p36MHz_245p76MHzClk <= '0';
          -- s_axis_data_tvalid_Q_15p36MHz_245p76MHzClk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 15.36 MSPS to 30.72 MSPS x2 interpolating FIR outputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I_30p72MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I_30p72MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q_30p72MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q_30p72MHz_245p76MHz_valid <= '0';
        FIR_30p72MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I_30p72MHz_245p76MHz <= m_axis_data_tdata_I_30p72MHz_245p76MHz(29 downto 14);
        truncated_FIR_data_Q_30p72MHz_245p76MHz <= m_axis_data_tdata_Q_30p72MHz_245p76MHz(29 downto 14);

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_30p72MHz_output_discard_count <= cnt_2xinterpolation_FIR_length then
          truncated_FIR_data_I_30p72MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q_30p72MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I_30p72MHz_245p76MHz = '1' then
            FIR_30p72MHz_output_discard_count <= FIR_30p72MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I_30p72MHz_245p76MHz_valid <= m_axis_data_tvalid_I_30p72MHz_245p76MHz;
          -- truncated_FIR_data_Q_30p72MHz_245p76MHz_valid <= m_axis_data_tvalid_Q_30p72MHz_245p76MHz;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 30.72 MSPS to 245.76 MSPS x8 interpolating FIR inputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I_30p72MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I_30p72MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q_30p72MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q_30p72MHz_245p76MHzClk <= (others => '0');
      else
        -- check the source of the data (fixed in this testbench)
        -- * NOTE: we don't currently use 's_axis_data_tready_I_30p72MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_30p72MHz_from_DMA_DAC0clk = '1' then -- data from DMA
          s_axis_data_tdata_I_30p72MHz_245p76MHzClk <= data_I_30p72MHz_245p76MHzClk;
          s_axis_data_tvalid_I_30p72MHz_245p76MHzClk <= data_I_valid_30p72MHz_245p76MHzClk;
          s_axis_data_tdata_Q_30p72MHz_245p76MHzClk <= data_Q_30p72MHz_245p76MHzClk;
          -- s_axis_data_tvalid_Q_30p72MHz_245p76MHzClk <= data_Q_valid_30p72MHz_245p76MHzClk;
        else                                            -- data from 2x FIR
          s_axis_data_tdata_I_30p72MHz_245p76MHzClk <= truncated_FIR_data_I_30p72MHz_245p76MHz;
          s_axis_data_tvalid_I_30p72MHz_245p76MHzClk <= truncated_FIR_data_I_30p72MHz_245p76MHz_valid;
          s_axis_data_tdata_Q_30p72MHz_245p76MHzClk <= truncated_FIR_data_Q_30p72MHz_245p76MHz;
          -- s_axis_data_tvalid_Q_30p72MHz_245p76MHzClk <= truncated_FIR_data_Q_30p72MHz_245p76MHz_valid;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 30.72 MSPS to 245.76 MSPS x8 interpolating FIR outputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I_245p76MHz <= (others => '0');
        truncated_FIR_data_I_245p76MHz_valid <= '0';
        truncated_FIR_data_Q_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q_245p76MHz_valid <= '0';
        FIR_245p76MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I_245p76MHz <= m_axis_data_tdata_I_245p76MHz(29 downto 14);
        truncated_FIR_data_Q_245p76MHz <= m_axis_data_tdata_Q_245p76MHz(29 downto 14);

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_245p76MHz_output_discard_count <= cnt_8xinterpolation_FIR_length then
          truncated_FIR_data_I_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I_245p76MHz = '1' then
            FIR_245p76MHz_output_discard_count <= FIR_245p76MHz_output_discard_count + cnt_1_9b;
          end if;
        else
          truncated_FIR_data_I_245p76MHz_valid <= m_axis_data_tvalid_I_245p76MHz;
          -- truncated_FIR_data_Q_245p76MHz_valid <= m_axis_data_tvalid_Q_245p76MHz;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the latency-leveller shift registers
  -- ***************************************************

  -- * NOTE: a chain of shift-registers provides an aligned output (in terms of timestamped samples)
  --         for all PRB configurations; each shift-register provides both the time-aligned output
  --         for a given PRB configuration and the input of the following shift-register in the chain *

  -- process managing the 7.68msps latency-leveller shift-register inputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        lat_leveller_shift_reg_768msps_I_in <= (others => '0');
        lat_leveller_shift_reg_768msps_Q_in <= (others => '0');
      else
        -- fixed assignations
        lat_leveller_shift_reg_768msps_I_in <= truncated_FIR_data_I_245p76MHz_valid & truncated_FIR_data_I_245p76MHz;
        --lat_leveller_shift_reg_768msps_Q_in <= truncated_FIR_data_Q_245p76MHz_valid & truncated_FIR_data_Q_245p76MHz;
        lat_leveller_shift_reg_768msps_Q_in <= truncated_FIR_data_I_245p76MHz_valid & truncated_FIR_data_Q_245p76MHz;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the aligned block outputs for all PRB configurations
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        aligned_I_out <= (others => '0');
        aligned_I_out_valid <= '0';
        aligned_Q_out <= (others => '0');
        -- aligned_Q_out_valid <= '0';
      else
        -- we'll only output data when we know that the clock-manager is locked
        if clk_mgr_locked_DAC0clk = '1' then
          -- let's take the outputs from the required latency-leveller shift-register
          case current_N_FFT_DAC0clk is
            when cnt_128_FFT_points_3b =>  -- 6 PRB
              aligned_I_out <= lat_leveller_shift_reg_192msps_I_out(15 downto 0);
              aligned_I_out_valid <= lat_leveller_shift_reg_192msps_I_out(16);
              aligned_Q_out <= lat_leveller_shift_reg_192msps_Q_out(15 downto 0);
              -- aligned_Q_out_valid <= lat_leveller_shift_reg_192msps_Q_out(16);
            when cnt_256_FFT_points_3b =>  -- 15 PRB
              aligned_I_out <= lat_leveller_shift_reg_384msps_I_out(15 downto 0);
              aligned_I_out_valid <= lat_leveller_shift_reg_384msps_I_out(16);
              aligned_Q_out <= lat_leveller_shift_reg_384msps_Q_out(15 downto 0);
              -- aligned_Q_out_valid <= lat_leveller_shift_reg_384msps_Q_out(16);
            when cnt_512_FFT_points_3b =>  -- 25 PRB
              aligned_I_out <= lat_leveller_shift_reg_768msps_I_out(15 downto 0);
              aligned_I_out_valid <= lat_leveller_shift_reg_768msps_I_out(16);
              aligned_Q_out <= lat_leveller_shift_reg_768msps_Q_out(15 downto 0);
              -- aligned_Q_out_valid <= lat_leveller_shift_reg_768msps_Q_out(16);
            when cnt_1024_FFT_points_3b => -- 50 PRB
              aligned_I_out <= lat_leveller_shift_reg_1536msps_I_out(15 downto 0);
              aligned_I_out_valid <= lat_leveller_shift_reg_1536msps_I_out(16);
              aligned_Q_out <= lat_leveller_shift_reg_1536msps_Q_out(15 downto 0);
              -- aligned_Q_out_valid <= lat_leveller_shift_reg_1536msps_Q_out(16);
            when others =>                 -- 100 PRB
              aligned_I_out <= lat_leveller_shift_reg_3072msps_I_out(15 downto 0);
              aligned_I_out_valid <= lat_leveller_shift_reg_3072msps_I_out(16);
              aligned_Q_out <= lat_leveller_shift_reg_3072msps_Q_out(15 downto 0);
              -- aligned_Q_out_valid <= lat_leveller_shift_reg_3072msps_Q_out(16);
          end case;
        else
          aligned_I_out <= (others => '0');
          aligned_I_out_valid <= '0';
          aligned_Q_out <= (others => '0');
          -- aligned_Q_out_valid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the (optional) low-pass cleaning FIR
  -- ***************************************************

-- [low-pass cleaning FIR path]
lowpass_cleaning_FIR_logic : if PARAM_OUT_CLEANING_FIR generate
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I_245p76MHz <= '0';
        s_axis_data_tdata_I_245p76MHz <= (others => '0');
        -- s_axis_data_tvalid_Q_245p76MHz <= '0';
        s_axis_data_tdata_Q_245p76MHz <= (others => '0');
      else
        -- clear unused signals
        s_axis_data_tvalid_I_245p76MHz <= '0';
        -- s_axis_data_tvalid_Q_245p76MHz <= '0';

        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations; also, we don't currently use
        --         's_axis_data_tready_I_245p76MHz' *; @TO_BE_TESTED
        s_axis_data_tdata_I_245p76MHz <= aligned_I_out;
        s_axis_data_tvalid_I_245p76MHz <= aligned_I_out_valid;
        s_axis_data_tdata_Q_245p76MHz <= aligned_Q_out;
        -- s_axis_data_tvalid_Q_245p76MHz <= aligned_Q_out_valid;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 30.72 MSPS to 245.76 MSPS x8 interpolating FIR outputs
  process(dac0_axis_aclk,dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_filtered_FIR_data_I_245p76MHz <= (others => '0');
        truncated_filtered_FIR_data_I_245p76MHz_valid <= '0';
        truncated_filtered_FIR_data_Q_245p76MHz <= (others => '0');
        -- truncated_filtered_FIR_data_Q_245p76MHz_valid <= '0';
        filtered_FIR_245p76MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_filtered_FIR_data_I_245p76MHz <= m_axis_data_tdata_filtered_I_245p76MHz(33 downto 18);
        truncated_filtered_FIR_data_Q_245p76MHz <= m_axis_data_tdata_filtered_Q_245p76MHz(33 downto 18);

        -- the first N outputs will be discarded (i.e., they are not valid)
        if filtered_FIR_245p76MHz_output_discard_count <= cnt_8xinterpolation_FIR_length then
          truncated_filtered_FIR_data_I_245p76MHz_valid <= '0';
          -- truncated_filtered_FIR_data_Q_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_filtered_I_245p76MHz = '1' then
            filtered_FIR_245p76MHz_output_discard_count <= filtered_FIR_245p76MHz_output_discard_count + cnt_1_9b;
          end if;
        else
          truncated_filtered_FIR_data_I_245p76MHz_valid <= m_axis_data_tvalid_filtered_I_245p76MHz;
          -- truncated_filtered_FIR_data_Q_245p76MHz_valid <= m_axis_data_tvalid_filtered_Q_245p76MHz;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;
end generate lowpass_cleaning_FIR_logic;

  -- ***************************************************
  -- management of the output ports
  -- ***************************************************

  process(dac0_axis_aclk, dac0_axis_aresetn)
  begin
    if rising_edge(dac0_axis_aclk) then
      if dac0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        dac00_axis_tdata <= (others => '0');
        dac00_axis_tvalid <= '0';
        dac00_output_provision_started <= '0';
      else
        -- fixed assignations
        -- [low-pass cleaning FIR path]
        -- * NOTE: optimum truncation according to co-simulations *
        if PARAM_OUT_CLEANING_FIR then
          dac00_axis_tdata <= truncated_filtered_FIR_data_Q_245p76MHz & truncated_filtered_FIR_data_I_245p76MHz;
        -- [default path]
        -- * NOTE: optimum truncation according to co-simulations *
        else
          dac00_axis_tdata <= aligned_Q_out & aligned_I_out;
        end if;

        -- we'll start forwarding interpolated data once the clock-manager has been configured according to the parameters provided by the PS
        if clk_mgr_locked_DAC0clk = '1' and dac00_output_provision_started = '0' and dac00_axis_tready = '1' then
          if (PARAM_OUT_CLEANING_FIR and truncated_filtered_FIR_data_I_245p76MHz_valid = '1') or
             (not(PARAM_OUT_CLEANING_FIR) and aligned_I_out_valid = '1') then
            dac00_axis_tvalid <= '1';
            dac00_output_provision_started <= '1';
          else
            dac00_axis_tvalid <= '0';
            dac00_output_provision_started <= '0';
          end if;
        elsif clk_mgr_locked_DAC0clk = '1' and dac00_output_provision_started = '1' then
          dac00_axis_tvalid <= '1';
        else
          dac00_axis_tvalid <= '0';
          dac00_output_provision_started <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- block instances
  -- ***************************************************

  -- cross-clock domain sharing of 'rfdc_N_FFT_param' [to DAC0clk]
  synchronizer_rfdc_N_FFT_valid_DAC0_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_3b
    generic map (
      --DATA_WIDTH	=> 3,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data => rfdc_N_FFT_param,
      src_data_valid => rfdc_N_FFT_valid,
      dst_clk => dac0_axis_aclk,
      dst_data => rfdc_N_FFT_param_DAC0clk,
      dst_data_valid => rfdc_N_FFT_valid_DAC0clk
    );

  -- cross-clock domain sharing of 'rfdc_N_FFT_param' [to DACxNclk]
  synchronizer_rfdc_N_FFT_valid_DACxN_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_3b
    generic map (
      --DATA_WIDTH	=> 3,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => dac0_axis_aclk,
      src_data => rfdc_N_FFT_param_DAC0clk,
      src_data_valid => clk_mgr_locked_DAC0clk,
      dst_clk => DACxN_clk,
      dst_data => rfdc_N_FFT_param_DACxNclk,
      dst_data_valid => rfdc_N_FFT_valid_DACxNclk
    );

  -- cross-clock domain sharing of 'DACxN_locked'
  synchronizer_DACxN_locked_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk,
      src_data(0) => DACxN_locked,
      src_data_valid => '1', -- always valid
      dst_clk => s_axi_aclk,
      dst_data(0) => clk_mgr_locked_AXIclk_s,
      dst_data_valid => open -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    clk_mgr_locked_AXIclk <= clk_mgr_locked_AXIclk_s when s_axi_aresetn = '1' else
                             '0';

  -- cross-clock domain sharing of 'clk_mgr_locked_AXIclk'
  synchronizer_clk_mgr_locked_AXIclk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
  generic map (
   --DATA_WIDTH	=> 1,    -- fixed value
   SYNCH_ACTIVE => true -- fixed value
  )
  port map (
   src_clk => s_axi_aclk,
   src_data(0) => clk_mgr_locked_AXIclk,
   src_data_valid => '1', -- always valid
   dst_clk => dac0_axis_aclk,
   dst_data(0) => clk_mgr_locked_DAC0clk_s,
   dst_data_valid => open
 );
 -- apply reset to important cross-clock domain control signals
 clk_mgr_locked_DAC0clk <= clk_mgr_locked_DAC0clk_s when dac0_axis_aresetn = '1' else
                           '0';

  -- cross-clock domain sharing of 'data_IQ_1p92MHz_from_DMA'
  synchronizer_data_IQ_1p92MHz_from_DMA_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 3.84MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => data_IQ_1p92MHz_from_DMA,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => data_IQ_1p92MHz_from_DMA_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    data_IQ_1p92MHz_from_DMA_DAC0clk <= data_IQ_1p92MHz_from_DMA_DAC0clk_s when dac0_axis_aresetn = '1' else
                                        '0';

  -- cross-clock domain sharing of 'data_I_1p92MHz_3p84MHzClk'
  synchronizer_data_I_1p92MHz_3p84MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 3.84MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_I_1p92MHz_3p84MHzClk,
      src_data_valid => data_I_valid_1p92MHz_3p84MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_I_1p92MHz_245p76MHzClk,
      dst_data_valid => data_I_valid_1p92MHz_245p76MHzClk
    );

  -- cross-clock domain sharing of 'data_Q_1p92MHz_3p84MHzClk'
  synchronizer_data_Q_1p92MHz_3p84MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 3.84MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_Q_1p92MHz_3p84MHzClk,
      src_data_valid => data_I_valid_1p92MHz_3p84MHzClk, --data_Q_valid_1p92MHz_3p84MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_Q_1p92MHz_245p76MHzClk,
      dst_data_valid => open --data_Q_valid_1p92MHz_245p76MHzClk -- we don't need it
    );

  -- 2x interpolating FIR translating the signal from 1.92 MSPS to 3.84 MSPS [I branch]
  dac_interpolation_192msps_to_384msps_I_ins : dac_interpolation_192msps_to_384msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_1p92MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I_1p92MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I_1p92MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I_3p84MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I_3p84MHz_245p76MHz
    );

  -- 2x interpolating FIR translating the signal from 1.92 MSPS to 3.84 MSPS [Q branch]
  dac_interpolation_192msps_to_384msps_Q_ins : dac_interpolation_192msps_to_384msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_1p92MHz_245p76MHzClk, --s_axis_data_tvalid_Q_1p92MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q_1p92MHz_245p76MHzClk, -- we don't need it
      s_axis_data_tdata => s_axis_data_tdata_Q_1p92MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q_3p84MHz_245p76MHz,    -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q_3p84MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'data_IQ_3p84MHz_from_DMA'
  synchronizer_data_IQ_3p84MHz_from_DMA_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 7.68MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => data_IQ_3p84MHz_from_DMA,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => data_IQ_3p84MHz_from_DMA_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    data_IQ_3p84MHz_from_DMA_DAC0clk <= data_IQ_3p84MHz_from_DMA_DAC0clk_s when dac0_axis_aresetn = '1' else
                                        '0';

  -- cross-clock domain sharing of 'enable_384msps_to_768msps_interp_filter'
  synchronizer_enable_384msps_to_768msps_interp_filter_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 7.68MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => enable_384msps_to_768msps_interp_filter,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => enable_384msps_to_768msps_interp_filter_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    enable_384msps_to_768msps_interp_filter_DAC0clk <= enable_384msps_to_768msps_interp_filter_DAC0clk_s when dac0_axis_aresetn = '1' else
                                        '0';

  -- cross-clock domain sharing of 'data_I_3p84MHz_7p68MHzClk'
  synchronizer_data_I_3p84MHz_7p68MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 7.68MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_I_3p84MHz_7p68MHzClk,
      src_data_valid => data_I_valid_3p84MHz_7p68MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_I_3p84MHz_245p76MHzClk,
      dst_data_valid => data_I_valid_3p84MHz_245p76MHzClk
    );

  -- cross-clock domain sharing of 'data_Q_3p84MHz_7p68MHzClk'
  synchronizer_data_Q_3p84MHz_7p68MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 7.68MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_Q_3p84MHz_7p68MHzClk,
      src_data_valid => data_I_valid_3p84MHz_7p68MHzClk, --data_Q_valid_3p84MHz_7p68MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_Q_3p84MHz_245p76MHzClk,
      dst_data_valid => open --data_Q_valid_3p84MHz_245p76MHzClk -- we don't need it
    );

  -- 2x interpolating FIR translating the signal from 3.84 MSPS to 7.68 MSPS [I branch]
  dac_interpolation_384msps_to_768msps_I_ins : dac_interpolation_384msps_to_768msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_3p84MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I_3p84MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I_3p84MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I_7p68MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I_7p68MHz_245p76MHz
    );

  -- 2x interpolating FIR translating the signal from 3.84 MSPS to 7.68 MSPS [Q branch]
  dac_interpolation_384msps_to_768msps_Q_ins : dac_interpolation_384msps_to_768msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_3p84MHz_245p76MHzClk, --s_axis_data_tvalid_Q_3p84MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q_3p84MHz_245p76MHzClk, -- we don't need it
      s_axis_data_tdata => s_axis_data_tdata_Q_3p84MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q_7p68MHz_245p76MHz,    -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q_7p68MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'data_IQ_7p68MHz_from_DMA'
  synchronizer_data_IQ_7p68MHz_from_DMA_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 15.36MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => data_IQ_7p68MHz_from_DMA,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => data_IQ_7p68MHz_from_DMA_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    data_IQ_7p68MHz_from_DMA_DAC0clk <= data_IQ_7p68MHz_from_DMA_DAC0clk_s when dac0_axis_aresetn = '1' else
                                        '0';

  -- cross-clock domain sharing of 'enable_768msps_to_1536msps_interp_filter'
  synchronizer_enable_768msps_to_1536msps_interp_filter_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 7.68MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => enable_768msps_to_1536msps_interp_filter,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => enable_768msps_to_1536msps_interp_filter_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    enable_768msps_to_1536msps_interp_filter_DAC0clk <= enable_768msps_to_1536msps_interp_filter_DAC0clk_s when dac0_axis_aresetn = '1' else
                                        '0';

  -- cross-clock domain sharing of 'data_I_7p68MHz_15p36MHzClk'
  synchronizer_data_I_7p68MHz_15p36MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 15.36MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_I_7p68MHz_15p36MHzClk,
      src_data_valid => data_I_valid_7p68MHz_15p36MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_I_7p68MHz_245p76MHzClk,
      dst_data_valid => data_I_valid_7p68MHz_245p76MHzClk
    );

  -- cross-clock domain sharing of 'data_Q_7p68MHz_15p36MHzClk'
  synchronizer_data_Q_7p68MHz_15p36MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 15.36MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_Q_7p68MHz_15p36MHzClk,
      src_data_valid => data_I_valid_7p68MHz_15p36MHzClk, --data_Q_valid_7p68MHz_15p36MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_Q_7p68MHz_245p76MHzClk,
      dst_data_valid => open --data_Q_valid_7p68MHz_245p76MHzClk -- we don't need it
    );

  -- 2x interpolating FIR translating the signal from 7.68 MSPS to 15.36 MSPS [I branch]
  dac_interpolation_768msps_to_1536msps_I_ins : dac_interpolation_768msps_to_1536msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_7p68MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I_7p68MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I_7p68MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I_15p36MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I_15p36MHz_245p76MHz
    );

  -- 2x interpolating FIR translating the signal from 7.68 MSPS to 15.36 MSPS [Q branch]
  dac_interpolation_768msps_to_1536msps_Q_ins : dac_interpolation_768msps_to_1536msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_7p68MHz_245p76MHzClk,--s_axis_data_tvalid_Q_7p68MHz_245p76MHzClk,
      s_axis_data_tready => open,--s_axis_data_tready_Q_7p68MHz_245p76MHzClk, -- we don't need it
      s_axis_data_tdata => s_axis_data_tdata_Q_7p68MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q_15p36MHz_245p76MHz,  -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q_15p36MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'data_IQ_15p36MHz_from_DMA'
  synchronizer_data_IQ_15p36MHz_from_DMA_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 30.72MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => data_IQ_15p36MHz_from_DMA,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => data_IQ_15p36MHz_from_DMA_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    data_IQ_15p36MHz_from_DMA_DAC0clk <= data_IQ_15p36MHz_from_DMA_DAC0clk_s when dac0_axis_aresetn = '1' else
                                         '0';

  -- cross-clock domain sharing of 'enable_1536msps_to_3072msps_interp_filter'
  synchronizer_enable_1536msps_to_3072msps_interp_filter_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 7.68MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => enable_1536msps_to_3072msps_interp_filter,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => enable_1536msps_to_3072msps_interp_filter_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    enable_1536msps_to_3072msps_interp_filter_DAC0clk <= enable_1536msps_to_3072msps_interp_filter_DAC0clk_s when dac0_axis_aresetn = '1' else
                                        '0';

  -- cross-clock domain sharing of 'data_I_15p36MHz_30p72MHzClk'
  synchronizer_data_I_15p36MHz_30p72MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 30.72MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_I_15p36MHz_30p72MHzClk,
      src_data_valid => data_I_valid_15p36MHz_30p72MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_I_15p36MHz_245p76MHzClk,
      dst_data_valid => data_I_valid_15p36MHz_245p76MHzClk
    );

  -- cross-clock domain sharing of 'data_Q_15p36MHz_30p72MHzClk'
  synchronizer_data_Q_15p36MHz_30p72MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 30.72MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_Q_15p36MHz_30p72MHzClk,
      src_data_valid => data_I_valid_15p36MHz_30p72MHzClk, --data_Q_valid_15p36MHz_30p72MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_Q_15p36MHz_245p76MHzClk,
      dst_data_valid => open --data_Q_valid_15p36MHz_245p76MHzClk -- we don't need it
    );

  -- 2x interpolating FIR translating the signal from 15.36 MSPS to 30.72 MSPS [I branch]
  dac_interpolation_1536msps_to_3072msps_I_ins : dac_interpolation_1536msps_to_3072msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_15p36MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I_15p36MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I_15p36MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I_30p72MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I_30p72MHz_245p76MHz
    );

  -- 2x interpolating FIR translating the signal from 15.36 MSPS to 30.72 MSPS [Q branch]
  dac_interpolation_1536msps_to_3072msps_Q_ins : dac_interpolation_1536msps_to_3072msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_15p36MHz_245p76MHzClk, --s_axis_data_tvalid_Q_15p36MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q_15p36MHz_245p76MHzClk, -- we don't need it
      s_axis_data_tdata => s_axis_data_tdata_Q_15p36MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q_30p72MHz_245p76MHz,    -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q_30p72MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'data_IQ_30p72MHz_from_DMA'
  synchronizer_data_IQ_30p72MHz_from_DMA_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
     --DATA_WIDTH	=> 1,    -- fixed value
     SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 61.44MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data(0) => data_IQ_30p72MHz_from_DMA,
      src_data_valid => '1',  -- data is always valid
      dst_clk => dac0_axis_aclk,
      dst_data(0) => data_IQ_30p72MHz_from_DMA_DAC0clk_s,
      dst_data_valid => open  -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    data_IQ_30p72MHz_from_DMA_DAC0clk <= data_IQ_30p72MHz_from_DMA_DAC0clk_s when dac0_axis_aresetn = '1' else
                                         '0';

  -- cross-clock domain sharing of 'data_I_30p72MHz_61p44MHzClk'
  synchronizer_data_I_30p72MHz_61p44MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 61.44MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_I_30p72MHz_61p44MHzClk,
      src_data_valid => data_I_valid_30p72MHz_61p44MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_I_30p72MHz_245p76MHzClk,
      dst_data_valid => data_I_valid_30p72MHz_245p76MHzClk
    );

  -- cross-clock domain sharing of 'data_Q_30p72MHz_61p44MHzClk'
  synchronizer_data_Q_30p72MHz_61p44MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk, -- we don't have an explicit 61.44MHz clock, but use a single MMCM-generated signal combined with data-valid (enable) signals
      src_data => data_Q_30p72MHz_61p44MHzClk,
      src_data_valid => data_I_valid_30p72MHz_61p44MHzClk, --data_Q_valid_30p72MHz_61p44MHzClk,
      dst_clk => dac0_axis_aclk,
      dst_data => data_Q_30p72MHz_245p76MHzClk,
      dst_data_valid => open -- data_Q_valid_30p72MHz_245p76MHzClk -- we don't need it
    );

  -- 8x interpolating FIR translating the signal from 30.72 MSPS to 245.76 MSPS [I branch]
  dac_interpolation_3072msps_to_24576msps_I_ins : dac_interpolation_3072msps_to_24576msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_30p72MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I_30p72MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I_30p72MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I_245p76MHz
    );

  -- 8x interpolating FIR translating the signal from 30.72 MSPS to 245.76 MSPS [Q branch]
  dac_interpolation_3072msps_to_24576msps_Q_ins : dac_interpolation_3072msps_to_24576msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_30p72MHz_245p76MHzClk, --s_axis_data_tvalid_Q_30p72MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q_30p72MHz_245p76MHzClk, -- we don't need it
      s_axis_data_tdata => s_axis_data_tdata_Q_30p72MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q_245p76MHz,             -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q_245p76MHz
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 7.68 MHz, I branch]
  --   * NOTE: this shift-register feeds the 15 PRB one and time-aligns the 25 PRB outputs *
  lat_leveller_shift_reg_768msps_I_ins : lat_leveller_shift_reg_768msps
    port map (
      D => lat_leveller_shift_reg_768msps_I_in,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_768msps_I_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 7.68 MHz, Q branch]
  --   * NOTE: this shift-register feeds the 15 PRB one and time-aligns the 25 PRB outputs *
  lat_leveller_shift_reg_768msps_Q_ins : lat_leveller_shift_reg_768msps
    port map (
      D => lat_leveller_shift_reg_768msps_Q_in,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_768msps_Q_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 3.84 MHz, I branch]
  --   * NOTE: this shift-register feeds the 50 PRB one and time-aligns the 15 PRB outputs *
  lat_leveller_shift_reg_384msps_I_ins : lat_leveller_shift_reg_384msps
    port map (
      D => lat_leveller_shift_reg_768msps_I_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_384msps_I_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 3.84 MHz, Q branch]
  --   * NOTE: this shift-register feeds the 50 PRB one and time-aligns the 15 PRB outputs *
  lat_leveller_shift_reg_384msps_Q_ins : lat_leveller_shift_reg_384msps
    port map (
      D => lat_leveller_shift_reg_768msps_Q_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_384msps_Q_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 15.36 MHz, I branch]
  --   * NOTE: this shift-register feeds the 100 PRB one and time-aligns the 50 PRB outputs *
  lat_leveller_shift_reg_1536msps_I_ins : lat_leveller_shift_reg_1536msps
    port map (
      D => lat_leveller_shift_reg_384msps_I_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_1536msps_I_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 15.36 MHz, Q branch]
  --   * NOTE: this shift-register feeds the 100 PRB one and time-aligns the 50 PRB outputs *
  lat_leveller_shift_reg_1536msps_Q_ins : lat_leveller_shift_reg_1536msps
    port map (
      D => lat_leveller_shift_reg_384msps_Q_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_1536msps_Q_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 30.72 MHz, I branch]
  --   * NOTE: this shift-register feeds the 6 PRB one and time-aligns the 100 PRB outputs *
  lat_leveller_shift_reg_3072msps_I_ins : lat_leveller_shift_reg_3072msps
    port map (
      D => lat_leveller_shift_reg_1536msps_I_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_3072msps_I_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 30.72 MHz, Q branch]
  --   * NOTE: this shift-register feeds the 6 PRB one and time-aligns the 100 PRB outputs *
  lat_leveller_shift_reg_3072msps_Q_ins : lat_leveller_shift_reg_3072msps
    port map (
      D => lat_leveller_shift_reg_1536msps_Q_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_3072msps_Q_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 1.92 MHz, I branch]
  --   * NOTE: this shift-register time-aligns the 6 PRB outputs *
  lat_leveller_shift_reg_192msps_I_ins : lat_leveller_shift_reg_192msps
    port map (
      D => lat_leveller_shift_reg_3072msps_I_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_192msps_I_out
    );

  -- latency-leveller shift register used to provide aligned outputs in all PRB configurations [optimized for 1.92 MHz, Q branch]
  --   * NOTE: this shift-register time-aligns the 6 PRB outputs *
  lat_leveller_shift_reg_192msps_Q_ins : lat_leveller_shift_reg_192msps
    port map (
      D => lat_leveller_shift_reg_3072msps_Q_out,
      CLK => dac0_axis_aclk,
      Q => lat_leveller_shift_reg_192msps_Q_out
    );

-- [low-pass cleaning FIR path]
lowpass_cleaning_FIR_instances : if PARAM_OUT_CLEANING_FIR generate
  -- low-pass cleaning FIR [I branch]
  lowpass_clean_signal_at245msps_I_ins : lowpass_clean_signal_at245msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_245p76MHz,
      s_axis_data_tready => s_axis_data_tready_I_245p76MHz,
      s_axis_data_tdata => s_axis_data_tdata_I_245p76MHz,
      m_axis_data_tvalid => m_axis_data_tvalid_filtered_I_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_filtered_I_245p76MHz
    );

  -- low-pass cleaning FIR [Q branch]
  lowpass_clean_signal_at245msps_Q_ins : lowpass_clean_signal_at245msps
    port map (
      aresetn => dac0_axis_aresetn,
      aclk => dac0_axis_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I_245p76MHz,--s_axis_data_tvalid_Q_245p76MHz,
      s_axis_data_tready => open, --s_axis_data_tready_Q_245p76MHz,          -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q_245p76MHz,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_filtered_Q_245p76MHz, -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_filtered_Q_245p76MHz
    );
end generate lowpass_cleaning_FIR_instances;

  -- ***************************************************
  -- dump to external file * SIMULATION ONLY *
  -- ***************************************************

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(dac0_axis_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(dac0_axis_aclk) then
      if m_axis_data_tvalid_I_3p84MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I_3p84MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_0, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q_3p84MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_0, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(dac0_axis_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(dac0_axis_aclk) then
      if m_axis_data_tvalid_I_7p68MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I_7p68MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_1, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q_7p68MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_1, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(dac0_axis_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(dac0_axis_aclk) then
      if m_axis_data_tvalid_I_15p36MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I_15p36MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_2, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q_15p36MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_2, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(dac0_axis_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(dac0_axis_aclk) then
      if m_axis_data_tvalid_I_30p72MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I_30p72MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_3, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q_30p72MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_3, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(dac0_axis_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(dac0_axis_aclk) then
      if m_axis_data_tvalid_I_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I_245p76MHz);
        writeline(output_IQ_file_cfg0_4, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q_245p76MHz);
        writeline(output_IQ_file_cfg0_4, written_text_line);
      end if;
    end if; -- end of clk
  end process;

end arch_rfdc_dac_data_interp_and_pack_RTL_impl;
