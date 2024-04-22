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

entity rfdc_adc_data_decim_and_depack is
  generic ( -- @TO_BE_IMPROVED: a known fixed configuration is assumed for 'util_ad9361_adc_fifo' (i.e., 4 channels - 2RX/2TX - & 16-bit samples); changes might be required for different 'util_cpack' configurations
    PARAM_ENABLE_2nd_RX : boolean := false --! The block can be set to use a single receive antenna [(false) default] or two antennas (true)
  );
  port (
    -- **********************************
    -- interface to srsUE_AXI_control_unit (@s_axi_aclk)
    -- **********************************

    -- clock and reset signals
    s_axi_aclk    : in std_logic;
    s_axi_aresetn : in std_logic;

    -- parameters from PS
    rfdc_N_FFT_param : in std_logic_vector(2 downto 0);                --! Signal providing the 'N_FFT' PSS parameter (i.e., number of FFT points) (@s_axi_aclk)
    rfdc_N_FFT_valid : in std_logic;                                   --! Signal indicating if the output 'N_FFT' PSS parameter is valid (@s_axi_aclk)

    -- **********************************
    -- clock and reset signals governing the rfdc
    -- **********************************

    -- #adc channel 0
    adc0_axis_aclk : in std_logic;                                    --! ADC channel 0 clock signal (@122.88 MHz)
    adc0_axis_aresetn : in std_logic;                                 --! RFdc low-active reset signal (mapped to the ADC channel 0 clock domain [@122.88 MHz])
    adc0_axis_mul2_aclk : in std_logic;                               --! ADC channel 0 x2 clock signal (@245.76 MHz)
    adc0_axis_mul2_aresetn : in std_logic;                            --! RFdc low-active reset signal (mapped to the ADC channel 0 x2 clock domain [@245.76 MHz])

    -- **********************************
    -- adc 0 data interface (@adc0_axis_aclk)
    -- **********************************

    adc00_axis_tdata : in std_logic_vector(31 downto 0);              --! Parallel input I data (AXI-formatted)
    adc00_axis_tvalid : in std_logic;                                 --! Valid signal for 'adc00_axis_tdata'
    adc00_axis_tready : out std_logic;                                --! Signal indicating to RFdc that we are ready to receive new data through 'adc00_axis_tdata'
    adc01_axis_tdata : in std_logic_vector(31 downto 0);              --! Parallel input Q data (AXI-formatted)
    adc01_axis_tvalid : in std_logic;                                 --! Valid signal for 'adc01_axis_tdata'
    adc01_axis_tready : out std_logic;                                --! Signal indicating to RFdc that we are ready to receive new data through 'adc01_axis_tdata'

    -- **********************************
    -- adc 1 data interface (@adc0_axis_aclk)
    -- **********************************

    adc02_axis_tdata : in std_logic_vector(31 downto 0);              --! Parallel input I data (AXI-formatted)
    adc02_axis_tvalid : in std_logic;                                 --! Valid signal for 'adc00_axis_tdata'
    adc02_axis_tready : out std_logic;                                --! Signal indicating to RFdc that we are ready to receive new data through 'adc00_axis_tdata'
    adc03_axis_tdata : in std_logic_vector(31 downto 0);              --! Parallel input Q data (AXI-formatted)
    adc03_axis_tvalid : in std_logic;                                 --! Valid signal for 'adc01_axis_tdata'
    adc03_axis_tready : out std_logic;                                --! Signal indicating to RFdc that we are ready to receive new data through 'adc01_axis_tdata'

    -- ****************************
		-- interface to adc_fifo_timestamp_enabler
		-- ****************************

    -- clock signal at Nx sampling-rate
    ADCxN_clk : out std_logic;                                        --! ADC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_reset : out std_logic;                                      --! ADC high-active reset signal (mapped to the ADC clock xN domain [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_locked : out std_logic;                                     --! ADC clock locked indication signal

    -- I/Q data
    adc_enable_0 : out std_logic;                                     --! Enable signal for ADC data port 0
    adc_valid_0 : out std_logic;                                      --! Valid signal for ADC data port 0
    adc_data_0 : out std_logic_vector(15 downto 0);                   --! ADC parallel data port 0 [16-bit I samples, Rx antenna 1]
    adc_enable_1 : out std_logic;                                     --! Enable signal for ADC data port 1
    adc_valid_1 : out std_logic;                                      --! Valid signal for ADC data port 1
    adc_data_1 : out std_logic_vector(15 downto 0);                   --! ADC parallel data port 1 [16-bit Q samples, Rx antenna 1]
    adc_enable_2 : out std_logic;                                     --! Enable signal for ADC data port 2
    adc_valid_2 : out std_logic;                                      --! Valid signal for ADC data port 2
    adc_data_2 : out std_logic_vector(15 downto 0);                   --! ADC parallel data port 2 [16-bit I samples, Rx antenna 2]
    adc_enable_3 : out std_logic;                                     --! Enable signal for ADC data port 3
    adc_valid_3 : out std_logic;                                      --! Valid signal for ADC data port 3
    adc_data_3 : out std_logic_vector(15 downto 0)                    --! ADC parallel data port 3 [16-bit Q samples, Rx antenna 2]
  );
end rfdc_adc_data_decim_and_depack;

architecture arch_rfdc_adc_data_decim_and_depack_RTL_impl of rfdc_adc_data_decim_and_depack is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- FFT configuration-parameter constants
  constant cnt_128_FFT_points_3b : std_logic_vector(2 downto 0):="000";
  constant cnt_256_FFT_points_3b : std_logic_vector(2 downto 0):="001";
  constant cnt_512_FFT_points_3b : std_logic_vector(2 downto 0):="010";
  constant cnt_1024_FFT_points_3b : std_logic_vector(2 downto 0):="011";
  constant cnt_2048_FFT_points_3b : std_logic_vector(2 downto 0):="100";

  -- clock manager control FSM constants
  constant cnt_clk_mgr_FSM_waiting_for_PS_parameters : std_logic_vector(3 downto 0):=x"0";
  constant cnt_clk_mgr_FSM_validate_CDC_locked_is_deasserted : std_logic_vector(3 downto 0):=x"1";
  constant cnt_clk_mgr_FSM_send_CLKFBOUT_MULT_write_req : std_logic_vector(3 downto 0):=x"2";
  constant cnt_clk_mgr_FSM_send_CLKFBOUT_PHASE_write_req : std_logic_vector(3 downto 0):=x"3";
  constant cnt_clk_mgr_FSM_send_CLKOUT0_DIVIDE_write_req : std_logic_vector(3 downto 0):=x"4";
  constant cnt_clk_mgr_FSM_send_CLKOUT0_PHASE_write_req : std_logic_vector(3 downto 0):=x"5";
  constant cnt_clk_mgr_FSM_send_CLKOUT0_DUTY_write_req : std_logic_vector(3 downto 0):=x"6";
  constant cnt_clk_mgr_FSM_send_read_STATUS_req : std_logic_vector(3 downto 0):=x"7";
  constant cnt_clk_mgr_FSM_validate_read_STATUS : std_logic_vector(3 downto 0):=x"8";
  constant cnt_clk_mgr_FSM_send_LOAD_RECONFIG_req : std_logic_vector(3 downto 0):=x"9";

  -- clock manager configuration values related constants
  constant cnt_1_8b : std_logic_vector(7 downto 0):=x"01";
  constant cnt_0_32b : std_logic_vector(31 downto 0):=x"00000000";
  constant cnt_CLKMGR_int_8 : std_logic_vector(7 downto 0):=x"08";
  constant cnt_CLKMGR_int_9 : std_logic_vector(7 downto 0):=x"09";
  constant cnt_CLKMGR_int_16 : std_logic_vector(7 downto 0):=x"10";
  constant cnt_CLKMGR_int_19 : std_logic_vector(7 downto 0):=x"13";
  constant cnt_CLKMGR_int_38 : std_logic_vector(7 downto 0):=x"26";
  constant cnt_CLKMGR_int_64 : std_logic_vector(7 downto 0):=x"40";
  constant cnt_CLKMGR_int_128 : std_logic_vector(7 downto 0):=x"80";
  constant cnt_CLKMGR_frc_0 : std_logic_vector(9 downto 0):="00"&x"00";
  constant cnt_CLKMGR_frc_125 : std_logic_vector(9 downto 0):="00"&x"7D";
  constant cnt_CLKMGR_frc_500 : std_logic_vector(9 downto 0):="01"&x"F4";
  constant cnt_CLKMGR_frc_625 : std_logic_vector(9 downto 0):="10"&x"71";
  constant cnt_CLKMGR_frc_750 : std_logic_vector(9 downto 0):="10"&x"EE";
  constant cnt_CLKMGR_duty_5000 : std_logic_vector(31 downto 0):=x"0000C350";
  constant cnt_CLKMGR_LOAD_CONFIG_VALUES : std_logic_vector(1 downto 0):="11";
  constant cnt_clk_mgr_STATUS_reg_addr : std_logic_vector(10 downto 0):="000"&x"04";         -- BASEADDR + 0x004
  constant cnt_clk_mgr_CLKFBOUT_MULT_reg_addr : std_logic_vector(10 downto 0):="010"&x"00";  -- BASEADDR + 0x200
  constant cnt_clk_mgr_CLKFBOUT_PHASE_reg_addr : std_logic_vector(10 downto 0):="010"&x"04"; -- BASEADDR + 0x204
  constant cnt_clk_mgr_CLKOUT0_DIVIDE_reg_addr : std_logic_vector(10 downto 0):="010"&x"08"; -- BASEADDR + 0x208
  constant cnt_clk_mgr_CLKOUT0_PHASE_reg_addr : std_logic_vector(10 downto 0):="010"&x"0C";  -- BASEADDR + 0x20C
  constant cnt_clk_mgr_CLKOUT0_DUTY_reg_addr : std_logic_vector(10 downto 0):="010"&x"10";   -- BASEADDR + 0x210
  constant cnt_clk_mgr_LOAD_RECONFIG_reg_addr : std_logic_vector(10 downto 0):="010"&x"5C";  -- BASEADDR + 0x25C

  -- interpolation FIR related constants
  constant cnt_decimation_FIR_length : std_logic_vector(6 downto 0):="010"&x"0";
  constant cnt_1_7b : std_logic_vector(6 downto 0):="000"&x"1";

  -- **********************************
  -- component instantiation
  -- **********************************

  -- dynamically reconfigurable clocking-manager instance (MMCM)
  --  * NOTE: a single clock signal cannot be (directly) used to drive both the clock-manager and custom logic;
  --          hence, the clock-manager will always return a buffered version of the input clock to be used to
  --          drive all required internal processes and instantiated IP clocks *
  component clk_wiz_0_ADC
    port (
      -- System interface
      s_axi_aclk : in std_logic;
      s_axi_aresetn : in std_logic;
      -- AXI Write address channel signals
      s_axi_awaddr : in std_logic_vector(10 downto 0);
      s_axi_awvalid : in std_logic;
      s_axi_awready : out std_logic;
      -- AXI Write data channel signals
      s_axi_wdata : in std_logic_vector(31 downto 0);
      s_axi_wstrb : in std_logic_vector(3 downto 0);
      s_axi_wvalid : in std_logic;
      s_axi_wready : out std_logic;
      -- AXI Write response channel signals
      s_axi_bresp : out std_logic_vector(1 downto 0);
      s_axi_bvalid : out std_logic;
      s_axi_bready : in std_logic;
      -- AXI Read address channel signals
      s_axi_araddr : in std_logic_vector(10 downto 0);
      s_axi_arvalid : in std_logic;
      s_axi_arready : out std_logic;
      -- AXI Read address channel signals
      s_axi_rdata : out std_logic_vector(31 downto 0);
      s_axi_rresp : out std_logic_vector(1 downto 0);
      s_axi_rvalid : out std_logic;
      s_axi_rready : in std_logic;
      -- Clock out ports
      clk_out1 : out std_logic;
      -- Status and control signals
      locked : out std_logic;
      -- Clock in ports
      clk_in1 : in std_logic
    );
  end component;

  -- cross-clock domain reset synchronizer IP
  component proc_sys_reset_synchronizer
    port (
      slowest_sync_clk : in std_logic;
      ext_reset_in : in std_logic;
      aux_reset_in : in std_logic;
      mb_debug_sys_rst : in std_logic;
      dcm_locked : in std_logic;
      -- mb_reset : out std_logic;
      -- bus_struct_reset : out std_logic_vector(0 downto 0);
      -- peripheral_reset : out std_logic_vector(0 downto 0);
      -- interconnect_aresetn : out std_logic_vector(0 downto 0);
      peripheral_aresetn : out std_logic_vector(0 downto 0)
    );
  end component;

  -- 8x decimating FIR (from 245.76 MSPS to 30.72MSPS)
  component adc_decimation_24576msps_to_3072msps is
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

  -- 2x decimating FIR (from 30.72MSPS to 15.36MSPS)
  component adc_decimation_3072msps_to_1536msps is
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

  -- 2x decimating FIR (from 15.36MSPS to 7.68MSPS)
  component adc_decimation_1536msps_to_768msps is
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

  -- 2x decimating FIR (from 7.68MSPS to 3.84MSPS)
  component adc_decimation_768msps_to_384msps is
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

  -- 2x decimating FIR (from 3.84MSPS to 1.92MSPS)
  component adc_decimation_384msps_to_192msps is
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

  -- **********************************
  -- internal signals
  -- **********************************

  -- PS configuration parameters related signals
  signal current_N_FFT : std_logic_vector(2 downto 0);
  signal current_N_FFT_valid : std_logic;
  signal decimation_initialized : std_logic;
  signal new_decimation_initialized_value : std_logic:='0';

  -- clocking-manager configuration related signals
  signal clk_mgr_s_axi_awaddr : std_logic_vector(10 downto 0);
  signal clk_mgr_s_axi_awvalid : std_logic;
  signal clk_mgr_s_axi_awready : std_logic;
  signal clk_mgr_s_axi_wdata : std_logic_vector(31 downto 0);
  signal clk_mgr_s_axi_wstrb : std_logic_vector(3 downto 0);
  signal clk_mgr_s_axi_wvalid : std_logic;
  signal clk_mgr_s_axi_wready : std_logic;
  signal clk_mgr_s_axi_bresp : std_logic_vector(1 downto 0);
  signal clk_mgr_s_axi_bvalid : std_logic;
  signal clk_mgr_s_axi_bready : std_logic;
  signal clk_mgr_s_axi_araddr : std_logic_vector(10 downto 0);
  signal clk_mgr_s_axi_arvalid : std_logic;
  signal clk_mgr_s_axi_arready : std_logic;
  signal clk_mgr_s_axi_rdata : std_logic_vector(31 downto 0);
  signal clk_mgr_s_axi_rresp : std_logic_vector(1 downto 0);
  signal clk_mgr_s_axi_rvalid : std_logic;
  signal clk_mgr_s_axi_rready : std_logic;
  signal clock_manager_FSM_status : std_logic_vector(3 downto 0);
  signal clock_manager_configured : std_logic;

  -- internally generated clock and reset related signals
  signal clk_mgr_clk_out : std_logic;
  signal clk_mgr_locked : std_logic:='0';
  signal clk_bufs_CLR : std_logic;
  signal clk_bufs_CE : std_logic;
  signal ADCxN_clk_s : std_logic;
  signal ADCxN_resetn : std_logic:='0';
  signal ADCxN_reset_s : std_logic:='1';

  -- RFdc outputs depacketization and clock-translation related signals
  signal adc00_I0_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc00_I1_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc00_I_valid_122p88MHz : std_logic:='0';
  signal adc01_Q0_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc01_Q1_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  -- signal adc01_Q_valid_122p88MHz : std_logic:='0';
  signal adc02_I0_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc02_I1_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc02_I_valid_122p88MHz : std_logic:='0';
  signal adc03_Q0_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc03_Q1_122p88MHz : std_logic_vector(15 downto 0):=(others => '0');
  -- signal adc03_Q_valid_122p88MHz : std_logic:='0';
  signal adc00_I0_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc00_I1_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc00_I_valid_245p76MHz : std_logic:='0';
  signal adc01_Q0_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc01_Q1_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  -- signal adc01_Q_valid_245p76MHz : std_logic:='0';
  signal adc02_I0_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc02_I1_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc02_I_valid_245p76MHz : std_logic:='0';
  signal adc03_Q0_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  signal adc03_Q1_245p76MHz : std_logic_vector(15 downto 0):=(others => '0');
  -- signal adc03_Q_valid_245p76MHz : std_logic:='0';

  -- 245.76MSPS to 30.72MSPS 8x decimating FIR signals
  signal s_axis_data_tdata_I0_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I0_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I0_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I0_30p72MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I0_30p72MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q0_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q0_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q0_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q0_30p72MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q0_30p72MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_I1_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I1_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I1_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I1_30p72MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I1_30p72MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q1_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q1_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q1_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q1_30p72MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q1_30p72MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal adc00_245p76MHz_sample_count : std_logic;
  -- signal adc01_245p76MHz_sample_count : std_logic;
  signal adc02_245p76MHz_sample_count : std_logic;
  -- signal adc03_245p76MHz_sample_count : std_logic;
  signal truncated_FIR_data_I0_30p72MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I0_30p72MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q0_30p72MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q0_30p72MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_I1_30p72MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I1_30p72MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q1_30p72MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q1_30p72MHz_245p76MHz_valid : std_logic;
  signal FIR_30p72MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 245.76MHz to 61.44MHz translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I0_30p72MHz_61p44MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I0_valid_30p72MHz_61p44MHzClk : std_logic:='0';
  signal data_Q0_30p72MHz_61p44MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q0_valid_30p72MHz_61p44MHzClk : std_logic:='0';
  signal data_I1_30p72MHz_61p44MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I1_valid_30p72MHz_61p44MHzClk : std_logic:='0';
  signal data_Q1_30p72MHz_61p44MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q1_valid_30p72MHz_61p44MHzClk : std_logic:='0';
  signal data_IQ_30p72MHz_to_decimating_FIR : std_logic;

  -- 30.72MSPS to 15.36MSPS 2x decimating FIR signals
  signal s_axis_data_tdata_I0_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I0_30p72MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I0_30p72MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I0_15p36MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I0_15p36MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q0_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q0_30p72MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q0_30p72MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q0_15p36MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q0_15p36MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_I1_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I1_30p72MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I1_30p72MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I1_15p36MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I1_15p36MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q1_30p72MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q1_30p72MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q1_30p72MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q1_15p36MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q1_15p36MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal truncated_FIR_data_I0_15p36MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I0_15p36MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q0_15p36MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q0_15p36MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_I1_15p36MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I1_15p36MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q1_15p36MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q1_15p36MHz_245p76MHz_valid : std_logic;
  signal FIR_15p36MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 245.76MHz to 30.72MHz translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I0_15p36MHz_30p72MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I0_valid_15p36MHz_30p72MHzClk : std_logic:='0';
  signal data_Q0_15p36MHz_30p72MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q0_valid_15p36MHz_30p72MHzClk : std_logic:='0';
  signal data_I1_15p36MHz_30p72MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I1_valid_15p36MHz_30p72MHzClk : std_logic:='0';
  signal data_Q1_15p36MHz_30p72MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q1_valid_15p36MHz_30p72MHzClk : std_logic:='0';
  signal data_IQ_15p36MHz_to_decimating_FIR : std_logic;

  -- 15.36MSPS to 7.68MSPS 2x decimating FIR signals
  signal s_axis_data_tdata_I0_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I0_15p36MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I0_15p36MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I0_7p68MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I0_7p68MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q0_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q0_15p36MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q0_15p36MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q0_7p68MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q0_7p68MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_I1_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I1_15p36MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I1_15p36MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I1_7p68MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I1_7p68MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q1_15p36MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q1_15p36MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q1_15p36MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q1_7p68MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q1_7p68MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal truncated_FIR_data_I0_7p68MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I0_7p68MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q0_7p68MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q0_7p68MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_I1_7p68MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I1_7p68MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q1_7p68MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q1_7p68MHz_245p76MHz_valid : std_logic;
  signal FIR_7p68MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 245.76MHz to 15.36MHz translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I0_7p68MHz_15p36MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I0_valid_7p68MHz_15p36MHzClk : std_logic:='0';
  signal data_Q0_7p68MHz_15p36MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q0_valid_7p68MHz_15p36MHzClk : std_logic:='0';
  signal data_I1_7p68MHz_15p36MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I1_valid_7p68MHz_15p36MHzClk : std_logic:='0';
  signal data_Q1_7p68MHz_15p36MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q1_valid_7p68MHz_15p36MHzClk : std_logic:='0';
  signal data_IQ_7p68MHz_to_decimating_FIR : std_logic;

  -- 7.68MSPS to 3.84MSPS 2x decimating FIR signals
  signal s_axis_data_tdata_I0_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I0_7p68MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I0_7p68MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I0_3p84MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I0_3p84MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q0_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q0_7p68MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q0_7p68MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q0_3p84MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q0_3p84MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_I1_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I1_7p68MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I1_7p68MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I1_3p84MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I1_3p84MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q1_7p68MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q1_7p68MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q1_7p68MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q1_3p84MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q1_3p84MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal truncated_FIR_data_I0_3p84MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I0_3p84MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q0_3p84MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q0_3p84MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_I1_3p84MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I1_3p84MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q1_3p84MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q1_3p84MHz_245p76MHz_valid : std_logic;
  signal FIR_3p84MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 245.76MHz to 7.68MHz translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I0_3p84MHz_7p68MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I0_valid_3p84MHz_7p68MHzClk : std_logic:='0';
  signal data_Q0_3p84MHz_7p68MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q0_valid_3p84MHz_7p68MHzClk : std_logic:='0';
  signal data_I1_3p84MHz_7p68MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I1_valid_3p84MHz_7p68MHzClk : std_logic:='0';
  signal data_Q1_3p84MHz_7p68MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q1_valid_3p84MHz_7p68MHzClk : std_logic:='0';
  signal data_IQ_3p84MHz_to_decimating_FIR : std_logic;

  -- 3.84MSPS to 1.92MSPS 2x decimating FIR signals
  signal s_axis_data_tdata_I0_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I0_3p84MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I0_3p84MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I0_1p92MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I0_1p92MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q0_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q0_3p84MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q0_3p84MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q0_1p92MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q0_1p92MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_I1_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  signal s_axis_data_tvalid_I1_3p84MHz_245p76MHzClk : std_logic;
  signal s_axis_data_tready_I1_3p84MHz_245p76MHzClk : std_logic;
  signal m_axis_data_tvalid_I1_1p92MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_I1_1p92MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal s_axis_data_tdata_Q1_3p84MHz_245p76MHzClk : std_logic_vector(15 downto 0);
  -- signal s_axis_data_tvalid_Q1_3p84MHz_245p76MHzClk : std_logic;
  -- signal s_axis_data_tready_Q1_3p84MHz_245p76MHzClk : std_logic;
  -- signal m_axis_data_tvalid_Q1_1p92MHz_245p76MHz : std_logic;
  signal m_axis_data_tdata_Q1_1p92MHz_245p76MHz : std_logic_vector(39 downto 0);
  signal truncated_FIR_data_I0_1p92MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I0_1p92MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q0_1p92MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q0_1p92MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_I1_1p92MHz_245p76MHz : std_logic_vector(15 downto 0);
  signal truncated_FIR_data_I1_1p92MHz_245p76MHz_valid : std_logic;
  signal truncated_FIR_data_Q1_1p92MHz_245p76MHz : std_logic_vector(15 downto 0);
  -- signal truncated_FIR_data_Q1_1p92MHz_245p76MHz_valid : std_logic;
  signal FIR_1p92MHz_output_discard_count : std_logic_vector(6 downto 0);

  -- 245.76MHz to 3.84MHz translating FIFO signals (cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup)
  signal data_I0_1p92MHz_3p84MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I0_valid_1p92MHz_3p84MHzClk : std_logic:='0';
  signal data_Q0_1p92MHz_3p84MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q0_valid_1p92MHz_3p84MHzClk : std_logic:='0';
  signal data_I1_1p92MHz_3p84MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  signal data_I1_valid_1p92MHz_3p84MHzClk : std_logic:='0';
  signal data_Q1_1p92MHz_3p84MHzClk : std_logic_vector(15 downto 0):=(others => '0');
  -- signal data_Q1_valid_1p92MHz_3p84MHzClk : std_logic:='0';

  -- cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup
  signal clock_manager_configured_ADC0clk : std_logic:='0';
  signal clock_manager_configured_ADC0clk_i : std_logic:='0';
  -- signal clk_mgr_reconfig_pulse : std_logic:='0';
  signal clk_mgr_locked_ADC0clk : std_logic:='0';
  signal clk_mgr_locked_ADC0clk_i : std_logic:='0';
  signal clk_mgr_locked_ADC0_i_i : std_logic:='0';
  signal clk_mgr_locked_ADC0_i : std_logic:='0';
  signal clk_mgr_locked_ADC0clk_new : std_logic:='0';
  signal clk_mgr_locked_ADCxNclk : std_logic:='0';
  signal clk_mgr_locked_ADCxNclk_s : std_logic:='0';
  signal clk_mgr_locked_245p76MHzClk : std_logic:='0';
  signal clk_mgr_locked_245p76MHzClk_s : std_logic:='0';
  signal clk_mgr_locked_AXIclk_s : std_logic:='0';
  signal clk_mgr_locked_AXIclk : std_logic:='0';
  signal initial_clk_config_provided : std_logic:='0';
  signal initial_clk_config_provided_DAC0clk : std_logic:='0';
  signal current_N_FFT_ADC0clk : std_logic_vector(2 downto 0):=(others => '0');
  signal current_N_FFT_valid_ADC0clk : std_logic:='0';
  signal rfdc_N_FFT_param_ADC0clk : std_logic_vector(2 downto 0):=(others => '0');
  signal rfdc_N_FFT_valid_ADC0clk : std_logic:='0';
  signal pulse_rfdc_N_FFT_valid_ADC0clk : std_logic:='0';
  signal generate_N_FFT_config_flag_pulse : std_logic:='0';
  signal current_N_FFT_245p76MHzClk : std_logic_vector(2 downto 0):=(others => '0');
  signal current_N_FFT_valid_245p76MHzClk : std_logic:='0';
  signal rfdc_N_FFT_param_245p76MHzClk : std_logic_vector(2 downto 0):=(others => '0');
  signal rfdc_N_FFT_valid_245p76MHzClk : std_logic:='0';
  signal current_N_FFT_ADCxNclk : std_logic_vector(2 downto 0):=(others => '0');
  signal current_N_FFT_valid_ADCxNclk : std_logic:='0';
  signal rfdc_N_FFT_param_ADCxNclk : std_logic_vector(2 downto 0):=(others => '0');
  signal rfdc_N_FFT_valid_ADCxNclk : std_logic:='0';
  signal decimation_initialized_AXIclk : std_logic:='0';
  signal decimation_initialized_AXIclk_d : std_logic:='0';
  signal pulse_decimation_initialized_AXIclk  : std_logic:='0';

  -- **********************************
  -- file handlers * SIMULATION ONLY *
  -- **********************************

  file output_IQ_file_cfg0_0 : text open write_mode is "decim_FIR_24576MSPS_to_3072MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_1 : text open write_mode is "decim_FIR_3072MSPS_to_1536MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_2 : text open write_mode is "decim_FIR_1536MSPS_to_768MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_3 : text open write_mode is "decim_FIR_768MSPS_to_384MSPS_outputs_full.txt";
  file output_IQ_file_cfg0_4 : text open write_mode is "decim_FIR_384MSPS_to_192MSPS_outputs_full.txt";

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
        current_N_FFT_valid <= '0';
      else
        if rfdc_N_FFT_valid = '1' then
          current_N_FFT <= rfdc_N_FFT_param;
          current_N_FFT_valid <= '1';
        elsif clock_manager_configured = '1' then -- once the decimation-related signals have been initialized, we don't want to change them unless a new 'rfdc_N_FFT_param' value is received
          current_N_FFT_valid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process registering 'rfdc_N_FFT_param' [@adc0_axis_aclk]
  process(adc0_axis_aclk,adc0_axis_aresetn)
  begin
    if rising_edge(adc0_axis_aclk) then
      if adc0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        current_N_FFT_ADC0clk <= (others => '0');
        current_N_FFT_valid_ADC0clk <= '0';
      else
        if pulse_rfdc_N_FFT_valid_ADC0clk = '1' then
          current_N_FFT_ADC0clk <= rfdc_N_FFT_param_ADC0clk;
          current_N_FFT_valid_ADC0clk <= '1';
        elsif decimation_initialized = '1' then -- once the decimation-related signals have been initialized, we don't want to change them unless a new 'rfdc_N_FFT_param' value is received
          current_N_FFT_valid_ADC0clk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process registering 'rfdc_N_FFT_param' [@adc0_axis_mul2_aclk]
  process(adc0_axis_mul2_aclk,adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        current_N_FFT_245p76MHzClk <= (others => '0');
        current_N_FFT_valid_245p76MHzClk <= '0';
      else
        -- capture a new 'N_FFT' configuration
        if rfdc_N_FFT_valid_245p76MHzClk = '1' and current_N_FFT_valid_245p76MHzClk = '0' then
          current_N_FFT_245p76MHzClk <= rfdc_N_FFT_param_245p76MHzClk;
          current_N_FFT_valid_245p76MHzClk <= '1';
        -- 'N_FFT' won't be valid unless the clock manager has reached a 'locked' status
        elsif clk_mgr_locked_245p76MHzClk = '0' then
          current_N_FFT_valid_245p76MHzClk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process registering 'rfdc_N_FFT_param' [@ADCxN_clk_s]
  process(ADCxN_clk_s,ADCxN_reset_s)
  begin
    if rising_edge(ADCxN_clk_s) then
      if ADCxN_reset_s='1' then -- synchronous high-active reset: initialization of signals
        current_N_FFT_ADCxNclk <= (others => '0');
        current_N_FFT_valid_ADCxNclk <= '0';
      else
        -- capture a new 'N_FFT' configuration
        if rfdc_N_FFT_valid_ADCxNclk = '1' and current_N_FFT_valid_ADCxNclk = '0' then
          current_N_FFT_ADCxNclk <= rfdc_N_FFT_param_ADCxNclk;
          current_N_FFT_valid_ADCxNclk <= '1';
        -- 'N_FFT' won't be valid unless the clock manager has reached a 'locked' status
        elsif clk_mgr_locked_ADCxNclk = '0' then
          current_N_FFT_valid_ADCxNclk <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'decimation_initialized'
  process(adc0_axis_aclk,adc0_axis_aresetn)
  begin
    if rising_edge(adc0_axis_aclk) then
      if adc0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        decimation_initialized <= '0';
        new_decimation_initialized_value <= '0';
      else
        -- clear unused signals
        new_decimation_initialized_value <= '0';

        -- we'll assert 'decimation_initialized' after receiving a configuration from the PS and won't deassert it unless there is a reset
        if current_N_FFT_valid_ADC0clk = '1' and decimation_initialized = '0' then
          decimation_initialized <= '1';
          new_decimation_initialized_value <= '1';
        -- deassert 'decimation_initialized' with each new set of parameters provided by the PS
        elsif rfdc_N_FFT_valid_ADC0clk = '1' and decimation_initialized = '1' then
          decimation_initialized <= '0';
          new_decimation_initialized_value <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'pulse_rfdc_N_FFT_valid_ADC0clk' (i.e., to make sure that each new UE configuration is properly accounted [only once] in the slower clock domain)
  process(adc0_axis_aclk,adc0_axis_aresetn)
  begin
    if rising_edge(adc0_axis_aclk) then
      if adc0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        pulse_rfdc_N_FFT_valid_ADC0clk <= '0';
        generate_N_FFT_config_flag_pulse <= '1';
      else
        --clear the pulse signal
        pulse_rfdc_N_FFT_valid_ADC0clk <= '0';

        -- activate the pulse on a new storage operation only
        if pulse_rfdc_N_FFT_valid_ADC0clk = '0' and rfdc_N_FFT_valid_ADC0clk = '1' and generate_N_FFT_config_flag_pulse = '1' then
          pulse_rfdc_N_FFT_valid_ADC0clk <= '1';
          generate_N_FFT_config_flag_pulse <= '0';
        elsif rfdc_N_FFT_valid_ADC0clk = '0' and generate_N_FFT_config_flag_pulse = '0' then
          generate_N_FFT_config_flag_pulse <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'pulse_decimation_initialized_AXIclk'
  process(s_axi_aclk, s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        pulse_decimation_initialized_AXIclk <= '0';
        decimation_initialized_AXIclk_d <= '0';
      else
        -- clear by defaut
        pulse_decimation_initialized_AXIclk <= '0';
        --
        decimation_initialized_AXIclk_d <= decimation_initialized_AXIclk;
        if decimation_initialized_AXIclk = '1' and decimation_initialized_AXIclk_d = '0' then
          pulse_decimation_initialized_AXIclk <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the clocking-manager
  -- ***************************************************

  -- process manage the reprogramming of the clock manager
  --   ** NOTE: this process will configure the clocking-manager to synthesize an output clock which is
  --            4x the sampling-rate of the current PRB configuration, while assuming that the RFdc IP
  --            has been configure to provide an output clock of 122.88 MHz; the configuration parameters
  --            required for each PRB are as follows (optimum values obtained through Vivado):
  --              + 100 PRB: output clock = 122.88 MHz -> MULT = 9.750, DIV0 = 9.750
  --              + 50 PRB: output clock = 61.44 MHz -> MULT = 9.750, DIV0 = 19.500
  --              + 25 PRB: output clock = 30.72 MHz -> MULT = 9.625, DIV0 = 38.500
  --              + 15 PRB: output clock = 15.36 MHz -> MULT = 16.125, DIV0 = 64.500
  --              + 6 PRB: output clock = 7.68 MHz -> MULT = 8, DIV0 = 128
  --            furthermore, the resulting clock will pass through a BUFGCE_DIV primitive to generate the
  --            x2 output clock that will be finally forwarded alongside the decimated I/Q data **
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        clk_mgr_s_axi_awaddr <= (others => '0');
        clk_mgr_s_axi_awvalid <= '0';
        clk_mgr_s_axi_wdata <= (others => '0');
        clk_mgr_s_axi_wvalid <= '0';
        clk_mgr_s_axi_wstrb <= (others => '0');
        clk_mgr_s_axi_bready <= '0';
        clk_mgr_s_axi_araddr <= (others => '0');
        clk_mgr_s_axi_arvalid <= '0';
        clk_mgr_s_axi_rready <= '0';
        clock_manager_FSM_status <= cnt_clk_mgr_FSM_waiting_for_PS_parameters;
        clock_manager_configured <= '0';
        initial_clk_config_provided <= '0';
      else
        -- fixed assignations
        clk_mgr_s_axi_wstrb <= (others => '1'); -- @TO_BE_TESTED: fixed 32-bit write-operations are assumed
        clk_mgr_s_axi_bready <= '1'; -- we are always ready to receive a write response
        clk_mgr_s_axi_rready <= '1'; -- we are always ready to receive read data

        -- [state 0] wait for valid PS parameters to start configuring the clock manager
        if clock_manager_FSM_status = cnt_clk_mgr_FSM_waiting_for_PS_parameters then
          clk_mgr_s_axi_wvalid <= '0';
          clk_mgr_s_axi_awvalid <= '0';

          -- let's start a new configuration procedure with each new set of parameters from the PS
          if pulse_decimation_initialized_AXIclk = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_validate_CDC_locked_is_deasserted;
            clock_manager_configured <= '0';
          end if;
        -- [state 1] let's make sure that all CDC-translated MMCM-configured-and-locked signals are deasserted
        --           before triggering a new MMCM configuration (e.g., change of sampling rate)
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_validate_CDC_locked_is_deasserted then
          -- let's check the current status of the MMCM configuration and locked after all CDC translations
          if clk_mgr_locked_AXIclk = '0' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_CLKFBOUT_MULT_write_req;
          end if;
        -- [state 2] provide the CLKFBOUT_MULT parameter
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_send_CLKFBOUT_MULT_write_req then
          clk_mgr_s_axi_awaddr <= cnt_clk_mgr_CLKFBOUT_MULT_reg_addr;
          clk_mgr_s_axi_wvalid <= '1';
          clk_mgr_s_axi_awvalid <= '1';

          -- let's provide the required CLKFBOUT_MULT value for the current PRB configuration
          --   * NOTE: the 32-bit register is organized as follows:
          --        + 7 downto 0: DIVCLK_DIVIDE (fixed to 1 for all cases)
          --        + 15 downto 8: integer part of CLKFBOUT_MULT
          --        + 25 downto 16: fractional part of CLKFBOUT_MULT -> from 0 to 875, representing the
          --                        fractional multiplied by 1000 *
          clk_mgr_s_axi_wdata(31 downto 26) <= (others => '0');
          clk_mgr_s_axi_wdata(7 downto 0) <= cnt_1_8b;
          case current_N_FFT is
            when cnt_128_FFT_points_3b => -- 6 PRB
              clk_mgr_s_axi_wdata(15 downto 8) <= cnt_CLKMGR_int_8;
              clk_mgr_s_axi_wdata(25 downto 16) <= cnt_CLKMGR_frc_0;
            when cnt_256_FFT_points_3b => -- 15 PRB
              clk_mgr_s_axi_wdata(15 downto 8) <= cnt_CLKMGR_int_16;
              clk_mgr_s_axi_wdata(25 downto 16) <= cnt_CLKMGR_frc_125;
            when cnt_512_FFT_points_3b => -- 25 PRB
              clk_mgr_s_axi_wdata(15 downto 8) <= cnt_CLKMGR_int_9;
              clk_mgr_s_axi_wdata(25 downto 16) <= cnt_CLKMGR_frc_625;
            when others =>                -- 50 and 100 PRB
              clk_mgr_s_axi_wdata(15 downto 8) <= cnt_CLKMGR_int_9;
              clk_mgr_s_axi_wdata(25 downto 16) <= cnt_CLKMGR_frc_750;
          end case;

          -- let's check if the write transaction has been accepted
          if clk_mgr_s_axi_awready = '1' and clk_mgr_s_axi_awready = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_CLKFBOUT_PHASE_write_req;
            clk_mgr_s_axi_wvalid <= '0';
            clk_mgr_s_axi_awvalid <= '0';
          end if;

        -- [state 3] provide the CLKFBOUT_PHASE parameter
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_send_CLKFBOUT_PHASE_write_req then
          clk_mgr_s_axi_awaddr <= cnt_clk_mgr_CLKFBOUT_PHASE_reg_addr;
          clk_mgr_s_axi_wvalid <= '1';
          clk_mgr_s_axi_awvalid <= '1';

          -- common value to all PRB configurations
          clk_mgr_s_axi_wdata <= cnt_0_32b;

          -- let's check if the write transaction has been accepted
          if clk_mgr_s_axi_awready = '1' and clk_mgr_s_axi_awready = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_CLKOUT0_DIVIDE_write_req;
            clk_mgr_s_axi_wvalid <= '0';
            clk_mgr_s_axi_awvalid <= '0';
          end if;
        -- [state 4] provide the CLKOUT0_DIVIDE parameter
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_send_CLKOUT0_DIVIDE_write_req then
          clk_mgr_s_axi_awaddr <= cnt_clk_mgr_CLKOUT0_DIVIDE_reg_addr;
          clk_mgr_s_axi_wvalid <= '1';
          clk_mgr_s_axi_awvalid <= '1';

          -- let's provide the required CLKOUT0_DIVIDE value for the current PRB configuration
          --   * NOTE: the 32-bit register is organized as follows:
          --        + 7 downto 0: integer part of CLKOUT0_DIVIDE
          --        + 17 downto 8: fractional part of CLKOUT0_DIVIDE -> from 0 to 875, representing the
          --                       fractional multiplied by 1000 *
          clk_mgr_s_axi_wdata(31 downto 18) <= (others => '0');
          case current_N_FFT is
            when cnt_128_FFT_points_3b =>  -- 6 PRB
              clk_mgr_s_axi_wdata(7 downto 0) <= cnt_CLKMGR_int_128;
              clk_mgr_s_axi_wdata(17 downto 8) <= cnt_CLKMGR_frc_0;
            when cnt_256_FFT_points_3b =>  -- 15 PRB
              clk_mgr_s_axi_wdata(7 downto 0) <= cnt_CLKMGR_int_64;
              clk_mgr_s_axi_wdata(17 downto 8) <= cnt_CLKMGR_frc_500;
            when cnt_512_FFT_points_3b =>  -- 25 PRB
              clk_mgr_s_axi_wdata(7 downto 0) <= cnt_CLKMGR_int_38;
              clk_mgr_s_axi_wdata(17 downto 8) <= cnt_CLKMGR_frc_500;
            when cnt_1024_FFT_points_3b => -- 50 PRB
              clk_mgr_s_axi_wdata(7 downto 0) <= cnt_CLKMGR_int_19;
              clk_mgr_s_axi_wdata(17 downto 8) <= cnt_CLKMGR_frc_500;
            when others => -- 100 PRB
              clk_mgr_s_axi_wdata(7 downto 0) <= cnt_CLKMGR_int_9;
              clk_mgr_s_axi_wdata(17 downto 8) <= cnt_CLKMGR_frc_750;
          end case;

          -- let's check if the write transaction has been accepted
          if clk_mgr_s_axi_awready = '1' and clk_mgr_s_axi_awready = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_CLKOUT0_PHASE_write_req;
            clk_mgr_s_axi_wvalid <= '0';
            clk_mgr_s_axi_awvalid <= '0';
          end if;
        -- [state 5] provide the CLKOUT0_PHASE parameter
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_send_CLKOUT0_PHASE_write_req then
          clk_mgr_s_axi_awaddr <= cnt_clk_mgr_CLKOUT0_PHASE_reg_addr;
          clk_mgr_s_axi_wvalid <= '1';
          clk_mgr_s_axi_awvalid <= '1';

          -- common value to all PRB configurations
          clk_mgr_s_axi_wdata <= cnt_0_32b;

          -- let's check if the write transaction has been accepted
          if clk_mgr_s_axi_awready = '1' and clk_mgr_s_axi_awready = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_CLKOUT0_DUTY_write_req;
            clk_mgr_s_axi_wvalid <= '0';
            clk_mgr_s_axi_awvalid <= '0';
          end if;
        -- [state 6] provide the CLKOUT0_DUTY parameter
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_send_CLKOUT0_DUTY_write_req then
          clk_mgr_s_axi_awaddr <= cnt_clk_mgr_CLKOUT0_DUTY_reg_addr;
          clk_mgr_s_axi_wvalid <= '1';
          clk_mgr_s_axi_awvalid <= '1';

          -- common value to all PRB configurations
          --   * NOTE: the 32-bit register stores the duty cycle value as follows:
          --        + (duty cycle in %) * 1000 *
          clk_mgr_s_axi_wdata <= cnt_CLKMGR_duty_5000;

          -- let's check if the write transaction has been accepted
          if clk_mgr_s_axi_awready = '1' and clk_mgr_s_axi_awready = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_read_STATUS_req;
            clk_mgr_s_axi_wvalid <= '0';
            clk_mgr_s_axi_awvalid <= '0';
          end if;
        -- [state 7] check that the IP is ready to apply the reconfiguration [step 1: read the STATUS register]
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_send_read_STATUS_req then
          clk_mgr_s_axi_araddr <= cnt_clk_mgr_STATUS_reg_addr;
          clk_mgr_s_axi_arvalid <= '1';

          -- let's check if the read transaction has been accepted
          if clk_mgr_s_axi_arready = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_validate_read_STATUS;
            clk_mgr_s_axi_arvalid <= '0';
          end if;
        -- [state 8] check that the IP is ready to apply the reconfiguration [step 2: validate the read STATUS]
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_validate_read_STATUS then
          -- let's check the read STATUS
          --   * NOTE: the STATUS register is used as follows:
          --            + bit 0 = Locked -> when high the IP is ready for reconfiguration *
          if clk_mgr_s_axi_rvalid = '1' then
            if clk_mgr_s_axi_rdata(0) = '1' then -- IP ready for reconfig -> jump to next state
              clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_LOAD_RECONFIG_req;
            else                                 -- IP not ready for reconfig -> jump back to read STATUS
              clock_manager_FSM_status <= cnt_clk_mgr_FSM_send_read_STATUS_req;
            end if;
          end if;
        -- [state 9] request to load the provided values to the internal register used for dynamic reconfiguration
        elsif clock_manager_FSM_status = cnt_clk_mgr_FSM_send_LOAD_RECONFIG_req then
          clk_mgr_s_axi_awaddr <= cnt_clk_mgr_LOAD_RECONFIG_reg_addr;
          clk_mgr_s_axi_wvalid <= '1';
          clk_mgr_s_axi_awvalid <= '1';

          -- common value to all PRB configurations
          --   * NOTE: the 2 LSBs of the 32-bit register are used as follows:
          --      + 1: saddr (when asserted the settings provided in the clock configuration registers are used
          --           for dynamic reconfiguration)
          --      + 0: load (needs to be asserted when the required settings are already written to the clock
          --           configuration registers) *
          clk_mgr_s_axi_wdata(1 downto 0) <= cnt_CLKMGR_LOAD_CONFIG_VALUES;

          -- let's check if the write transaction has been accepted
          if clk_mgr_s_axi_awready = '1' and clk_mgr_s_axi_awready = '1' then
            clock_manager_FSM_status <= cnt_clk_mgr_FSM_waiting_for_PS_parameters;
            clk_mgr_s_axi_wvalid <= '0';
            clk_mgr_s_axi_awvalid <= '0';
            clock_manager_configured <= '1'; -- configuration done
            initial_clk_config_provided <= '1';
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'clk_mgr_locked_ADC0clk'
  --   ** NOTE: the 'locked' output from an MMCM is by nature an asynchronous signal and hence needs to
  --            be synchronized to the destination clock-domain before it can be used there; we'll implement
  --            a simple double-FF synchronization mechanism **
  process(adc0_axis_aclk,adc0_axis_aresetn)
  begin
    if rising_edge(adc0_axis_aclk) then
      if adc0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        clk_mgr_locked_ADC0clk <= '0';
        clk_mgr_locked_ADC0clk_i <= '0';
        clk_mgr_locked_ADC0_i_i <= '0';
        clk_mgr_locked_ADC0_i <= '0';
        clock_manager_configured_ADC0clk_i <= '0';
      else
        clk_mgr_locked_ADC0clk_i <= clk_mgr_locked_ADC0clk;
        clk_mgr_locked_ADC0clk <= clk_mgr_locked_ADC0_i_i;
        clk_mgr_locked_ADC0_i_i <= clk_mgr_locked_ADC0_i;
        clk_mgr_locked_ADC0_i <= clk_mgr_locked and clock_manager_configured_ADC0clk; -- we are interested in the 'locked' status after the clock-manager has been reconfigured
        --
        clock_manager_configured_ADC0clk_i <= clock_manager_configured_ADC0clk;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  clk_mgr_locked_ADC0clk_new <= '1' when clk_mgr_locked_ADC0clk_i /= clk_mgr_locked_ADC0clk else '0';

  -- ***************************************************
  -- generation of 'adcXX_axis_tready'
  -- ***************************************************

  -- process managing the decimation FIRs input signals
  process(adc0_axis_aclk,adc0_axis_aresetn)
  begin
    if rising_edge(adc0_axis_aclk) then
      if adc0_axis_aresetn='0' then -- synchronous low-active reset: initialization of signals
        adc00_axis_tready <= '0';
        adc01_axis_tready <= '0';
        adc02_axis_tready <= '0';
        adc03_axis_tready <= '0';
      else
        -- let's check if the clock-manager has been configured according to the parameters provided by the PS
        if clk_mgr_locked_ADC0clk = '1' then
          -- * NOTE: we assume that once the clock manager is configured, we are always ready to receive data *; @TO_BE_TESTED
          adc00_axis_tready <= '1';
          adc01_axis_tready <= '1';
          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            adc02_axis_tready <= '1';
            adc03_axis_tready <= '1';
          else
            adc02_axis_tready <= '0';
            adc03_axis_tready <= '0';
          end if;
        else
          adc00_axis_tready <= '0';
          adc01_axis_tready <= '0';
          adc02_axis_tready <= '0';
          adc03_axis_tready <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the input data
  -- ***************************************************

  -- * NOTE: we are receiving the ADC inputs @adc0_axis_aclk (i.e., 122.88 MHz) in sets of 2, but the
  --         decimation logic works @245.76; hence, we do need to serialize the RFdc outputs while also
  --         translating them to the destination clock domain *

  -- process serializing
  process(adc0_axis_aclk, adc0_axis_aresetn)
  begin
    if rising_edge(adc0_axis_aclk) then
      if adc0_axis_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        adc00_I0_122p88MHz <= (others => '0');
        adc00_I1_122p88MHz <= (others => '0');
        adc00_I_valid_122p88MHz <= '0';
        adc01_Q0_122p88MHz <= (others => '0');
        adc01_Q1_122p88MHz <= (others => '0');
        -- adc01_Q_valid_122p88MHz <= '0';
        adc02_I0_122p88MHz <= (others => '0');
        adc02_I1_122p88MHz <= (others => '0');
        adc02_I_valid_122p88MHz <= '0';
        adc03_Q0_122p88MHz <= (others => '0');
        adc03_Q1_122p88MHz <= (others => '0');
        -- adc03_Q_valid_122p88MHz <= '0';
      else
        if clk_mgr_locked_ADC0clk = '1' then
          -- fixed assignations
          adc00_I0_122p88MHz <= adc00_axis_tdata(15 downto 0);
          adc00_I1_122p88MHz <= adc00_axis_tdata(31 downto 16);
          adc00_I_valid_122p88MHz <= adc00_axis_tvalid;
          adc01_Q0_122p88MHz <= adc01_axis_tdata(15 downto 0);
          adc01_Q1_122p88MHz <= adc01_axis_tdata(31 downto 16);
          -- adc01_Q_valid_122p88MHz <= adc01_axis_tvalid;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            adc02_I0_122p88MHz <= adc02_axis_tdata(15 downto 0);
            adc02_I1_122p88MHz <= adc02_axis_tdata(31 downto 16);
            adc02_I_valid_122p88MHz <= adc02_axis_tvalid;
            adc03_Q0_122p88MHz <= adc03_axis_tdata(15 downto 0);
            adc03_Q1_122p88MHz <= adc03_axis_tdata(31 downto 16);
            -- adc03_Q_valid_122p88MHz <= adc03_axis_tvalid;
          end if;
        else
          adc00_I_valid_122p88MHz <= '0';
          -- adc01_Q_valid_122p88MHz <= '0';
          adc02_I_valid_122p88MHz <= '0';
          -- adc03_Q_valid_122p88MHz <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the decimation FIRs
  -- ***************************************************

  -- process generating the 'data_IQ_XMHz_to_decimating_FIR' FIR enable signals
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        data_IQ_30p72MHz_to_decimating_FIR <= '0';
        data_IQ_15p36MHz_to_decimating_FIR <= '0';
        data_IQ_7p68MHz_to_decimating_FIR <= '0';
        data_IQ_3p84MHz_to_decimating_FIR <= '0';
      else
        -- we'll only output data when we know that the clock-manager is locked
        if clk_mgr_locked_245p76MHzClk = '1' then
          -- let's enable to required decimating FIR filters
          case current_N_FFT_245p76MHzClk is
            when cnt_128_FFT_points_3b =>  -- 6 PRB
              data_IQ_30p72MHz_to_decimating_FIR <= '1';
              data_IQ_15p36MHz_to_decimating_FIR <= '1';
              data_IQ_7p68MHz_to_decimating_FIR <= '1';
              data_IQ_3p84MHz_to_decimating_FIR <= '1';
            when cnt_256_FFT_points_3b =>  -- 15 PRB
              data_IQ_30p72MHz_to_decimating_FIR <= '1';
              data_IQ_15p36MHz_to_decimating_FIR <= '1';
              data_IQ_7p68MHz_to_decimating_FIR <= '1';
              data_IQ_3p84MHz_to_decimating_FIR <= '0';
            when cnt_512_FFT_points_3b =>  -- 25 PRB
              data_IQ_30p72MHz_to_decimating_FIR <= '1';
              data_IQ_15p36MHz_to_decimating_FIR <= '1';
              data_IQ_7p68MHz_to_decimating_FIR <= '0';
              data_IQ_3p84MHz_to_decimating_FIR <= '0';
            when cnt_1024_FFT_points_3b => -- 50 PRB
              data_IQ_30p72MHz_to_decimating_FIR <= '1';
              data_IQ_15p36MHz_to_decimating_FIR <= '0';
              data_IQ_7p68MHz_to_decimating_FIR <= '0';
              data_IQ_3p84MHz_to_decimating_FIR <= '0';
            when others =>                 -- 100 PRB
              data_IQ_30p72MHz_to_decimating_FIR <= '0';
              data_IQ_15p36MHz_to_decimating_FIR <= '0';
              data_IQ_7p68MHz_to_decimating_FIR <= '0';
              data_IQ_3p84MHz_to_decimating_FIR <= '0';
          end case;
        else
          data_IQ_30p72MHz_to_decimating_FIR <= '0';
          data_IQ_15p36MHz_to_decimating_FIR <= '0';
          data_IQ_7p68MHz_to_decimating_FIR <= '0';
          data_IQ_3p84MHz_to_decimating_FIR <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 245.76 MSPS to 30.72 MSPS x8 decimating FIR inputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I0_245p76MHzClk <= '0';
        s_axis_data_tdata_I0_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q0_245p76MHzClk <= '0';
        s_axis_data_tdata_Q0_245p76MHzClk <= (others => '0');
        s_axis_data_tvalid_I1_245p76MHzClk <= '0';
        s_axis_data_tdata_I1_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q1_245p76MHzClk <= '0';
        s_axis_data_tdata_Q1_245p76MHzClk <= (others => '0');
        adc00_245p76MHz_sample_count <= '0';
        -- adc01_245p76MHz_sample_count <= '0';
        adc02_245p76MHz_sample_count <= '0';
        -- adc03_245p76MHz_sample_count <= '0';
      else
        -- push new adc00 & adc01 data to the 8x decimating FIR
        if adc00_I_valid_245p76MHz = '1' then
          s_axis_data_tdata_I0_245p76MHzClk <= adc00_I0_245p76MHz;
          s_axis_data_tvalid_I0_245p76MHzClk <= '1';
          s_axis_data_tdata_Q0_245p76MHzClk <= adc01_Q0_245p76MHz;
          adc00_245p76MHz_sample_count <= '1';
        elsif adc00_245p76MHz_sample_count = '1' then
          s_axis_data_tdata_I0_245p76MHzClk <= adc00_I1_245p76MHz;
          s_axis_data_tvalid_I0_245p76MHzClk <= '1';
          s_axis_data_tdata_Q0_245p76MHzClk <= adc01_Q1_245p76MHz;
          adc00_245p76MHz_sample_count <= '0';
        else
          s_axis_data_tvalid_I0_245p76MHzClk <= '0';
        end if;

        -- -- push new adc01 data to the 8x decimating FIR
        -- if adc00_I_valid_245p76MHz = '1' then --if adc01_Q_valid_245p76MHz = '1' then
        --   s_axis_data_tdata_Q0_245p76MHzClk <= adc01_Q0_245p76MHz;
        --   s_axis_data_tvalid_Q0_245p76MHzClk <= '1';
        --   adc01_245p76MHz_sample_count <= '1';
        -- elsif adc01_245p76MHz_sample_count = '1' then
        --   s_axis_data_tdata_Q0_245p76MHzClk <= adc01_Q1_245p76MHz;
        --   s_axis_data_tvalid_Q0_245p76MHzClk <= '1';
        --   adc01_245p76MHz_sample_count <= '0';
        -- else
        --   s_axis_data_tvalid_Q0_245p76MHzClk <= '0';
        -- end if;

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          -- push new adc02 data to the 8x decimating FIR
          if adc02_I_valid_245p76MHz = '1' then
            s_axis_data_tdata_I1_245p76MHzClk <= adc02_I0_245p76MHz;
            s_axis_data_tvalid_I1_245p76MHzClk <= '1';
            s_axis_data_tdata_Q1_245p76MHzClk <= adc03_Q0_245p76MHz;
            adc02_245p76MHz_sample_count <= '1';
          elsif adc02_245p76MHz_sample_count = '1' then
            s_axis_data_tdata_I1_245p76MHzClk <= adc02_I1_245p76MHz;
            s_axis_data_tvalid_I1_245p76MHzClk <= '1';
            s_axis_data_tdata_Q1_245p76MHzClk <= adc03_Q1_245p76MHz;
            adc02_245p76MHz_sample_count <= '0';
          else
            s_axis_data_tvalid_I1_245p76MHzClk <= '0';
          end if;

          -- -- push new adc03 data to the 8x decimating FIR
          -- if adc02_I_valid_245p76MHz = '1' then --if adc03_Q_valid_245p76MHz = '1' then
          --   s_axis_data_tdata_Q1_245p76MHzClk <= adc03_Q0_245p76MHz;
          --   s_axis_data_tvalid_Q1_245p76MHzClk <= '1';
          --   adc03_245p76MHz_sample_count <= '1';
          -- elsif adc03_245p76MHz_sample_count = '1' then
          --   s_axis_data_tdata_Q1_245p76MHzClk <= adc03_Q1_245p76MHz;
          --   s_axis_data_tvalid_Q1_245p76MHzClk <= '1';
          --   adc03_245p76MHz_sample_count <= '0';
          -- else
          --   s_axis_data_tvalid_Q1_245p76MHzClk <= '0';
          -- end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 245.76 MSPS to 30.72 MSPS x8 decimating FIR outputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I0_30p72MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I0_30p72MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q0_30p72MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q0_30p72MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_I1_30p72MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I1_30p72MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q1_30p72MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q1_30p72MHz_245p76MHz_valid <= '0';
        FIR_30p72MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I0_30p72MHz_245p76MHz <= m_axis_data_tdata_I0_30p72MHz_245p76MHz(32 downto 17);
        truncated_FIR_data_Q0_30p72MHz_245p76MHz <= m_axis_data_tdata_Q0_30p72MHz_245p76MHz(32 downto 17);

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          -- * NOTE: optimum truncation according to co-simulations *
          truncated_FIR_data_I1_30p72MHz_245p76MHz <= m_axis_data_tdata_I1_30p72MHz_245p76MHz(32 downto 17);
          truncated_FIR_data_Q1_30p72MHz_245p76MHz <= m_axis_data_tdata_Q1_30p72MHz_245p76MHz(32 downto 17);
        end if;

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_30p72MHz_output_discard_count <= cnt_decimation_FIR_length then
          truncated_FIR_data_I0_30p72MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q0_30p72MHz_245p76MHz_valid <= '0';
          truncated_FIR_data_I1_30p72MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q1_30p72MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I0_30p72MHz_245p76MHz = '1' then
            FIR_30p72MHz_output_discard_count <= FIR_30p72MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I0_30p72MHz_245p76MHz_valid <= m_axis_data_tvalid_I0_30p72MHz_245p76MHz;
          -- truncated_FIR_data_Q0_30p72MHz_245p76MHz_valid <= m_axis_data_tvalid_Q0_30p72MHz_245p76MHz;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            truncated_FIR_data_I1_30p72MHz_245p76MHz_valid <= m_axis_data_tvalid_I1_30p72MHz_245p76MHz;
            -- truncated_FIR_data_Q1_30p72MHz_245p76MHz_valid <= m_axis_data_tvalid_Q1_30p72MHz_245p76MHz;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 30.72 MSPS to 15.36 MSPS x2 decimating FIR inputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I0_30p72MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I0_30p72MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q0_30p72MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q0_30p72MHz_245p76MHzClk <= (others => '0');
        s_axis_data_tvalid_I1_30p72MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I1_30p72MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q1_30p72MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q1_30p72MHz_245p76MHzClk <= (others => '0');
      else
        -- fixed assignations
        s_axis_data_tdata_I0_30p72MHz_245p76MHzClk <= truncated_FIR_data_I0_30p72MHz_245p76MHz;
        s_axis_data_tdata_Q0_30p72MHz_245p76MHzClk <= truncated_FIR_data_Q0_30p72MHz_245p76MHz;

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          s_axis_data_tdata_I1_30p72MHz_245p76MHzClk <= truncated_FIR_data_I1_30p72MHz_245p76MHz;
          s_axis_data_tdata_Q1_30p72MHz_245p76MHzClk <= truncated_FIR_data_Q1_30p72MHz_245p76MHz;
        end if;

        -- only activate the decimating FIR when required
        -- * NOTE: we don't currently use 's_axis_data_tready_I_30p72MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_30p72MHz_to_decimating_FIR = '1' then
          s_axis_data_tvalid_I0_30p72MHz_245p76MHzClk <= truncated_FIR_data_I0_30p72MHz_245p76MHz_valid;
          -- s_axis_data_tvalid_Q0_30p72MHz_245p76MHzClk <= truncated_FIR_data_Q0_30p72MHz_245p76MHz_valid;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            s_axis_data_tvalid_I1_30p72MHz_245p76MHzClk <= truncated_FIR_data_I1_30p72MHz_245p76MHz_valid;
            -- s_axis_data_tvalid_Q1_30p72MHz_245p76MHzClk <= truncated_FIR_data_Q1_30p72MHz_245p76MHz_valid;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 30.72 MSPS to 15.36 MSPS x2 decimating FIR outputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I0_15p36MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I0_15p36MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q0_15p36MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q0_15p36MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_I1_15p36MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I1_15p36MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q1_15p36MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q1_15p36MHz_245p76MHz_valid <= '0';
        FIR_15p36MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I0_15p36MHz_245p76MHz <= m_axis_data_tdata_I0_15p36MHz_245p76MHz(31 downto 16);
        truncated_FIR_data_Q0_15p36MHz_245p76MHz <= m_axis_data_tdata_Q0_15p36MHz_245p76MHz(31 downto 16);

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          -- * NOTE: optimum truncation according to co-simulations *
          truncated_FIR_data_I1_15p36MHz_245p76MHz <= m_axis_data_tdata_I1_15p36MHz_245p76MHz(31 downto 16);
          truncated_FIR_data_Q1_15p36MHz_245p76MHz <= m_axis_data_tdata_Q1_15p36MHz_245p76MHz(31 downto 16);
        end if;

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_15p36MHz_output_discard_count <= cnt_decimation_FIR_length then
          truncated_FIR_data_I0_15p36MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q0_15p36MHz_245p76MHz_valid <= '0';
          truncated_FIR_data_I1_15p36MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q1_15p36MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I0_15p36MHz_245p76MHz = '1' then
            FIR_15p36MHz_output_discard_count <= FIR_15p36MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I0_15p36MHz_245p76MHz_valid <= m_axis_data_tvalid_I0_15p36MHz_245p76MHz;
          -- truncated_FIR_data_Q0_15p36MHz_245p76MHz_valid <= m_axis_data_tvalid_Q0_15p36MHz_245p76MHz;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            truncated_FIR_data_I1_15p36MHz_245p76MHz_valid <= m_axis_data_tvalid_I1_15p36MHz_245p76MHz;
            -- truncated_FIR_data_Q1_15p36MHz_245p76MHz_valid <= m_axis_data_tvalid_Q1_15p36MHz_245p76MHz;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 15.36 MSPS to 7.68 MSPS x2 decimating FIR inputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I0_15p36MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I0_15p36MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q0_15p36MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q0_15p36MHz_245p76MHzClk <= (others => '0');
        s_axis_data_tvalid_I1_15p36MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I1_15p36MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q1_15p36MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q1_15p36MHz_245p76MHzClk <= (others => '0');
      else
        -- fixed assignations
        s_axis_data_tdata_I0_15p36MHz_245p76MHzClk <= truncated_FIR_data_I0_15p36MHz_245p76MHz;
        s_axis_data_tdata_Q0_15p36MHz_245p76MHzClk <= truncated_FIR_data_Q0_15p36MHz_245p76MHz;

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          s_axis_data_tdata_I1_15p36MHz_245p76MHzClk <= truncated_FIR_data_I1_15p36MHz_245p76MHz;
          s_axis_data_tdata_Q1_15p36MHz_245p76MHzClk <= truncated_FIR_data_Q1_15p36MHz_245p76MHz;
        end if;

        -- only activate the decimating FIR when required
        -- * NOTE: we don't currently use 's_axis_data_tready_I_15p36MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_15p36MHz_to_decimating_FIR = '1' then
          s_axis_data_tvalid_I0_15p36MHz_245p76MHzClk <= truncated_FIR_data_I0_15p36MHz_245p76MHz_valid;
          -- s_axis_data_tvalid_Q0_15p36MHz_245p76MHzClk <= truncated_FIR_data_Q0_15p36MHz_245p76MHz_valid;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            s_axis_data_tvalid_I1_15p36MHz_245p76MHzClk <= truncated_FIR_data_I1_15p36MHz_245p76MHz_valid;
            -- s_axis_data_tvalid_Q1_15p36MHz_245p76MHzClk <= truncated_FIR_data_Q1_15p36MHz_245p76MHz_valid;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 15.36 MSPS to 7.68 MSPS x2 decimating FIR outputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I0_7p68MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I0_7p68MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q0_7p68MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q0_7p68MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_I1_7p68MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I1_7p68MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q1_7p68MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q1_7p68MHz_245p76MHz_valid <= '0';
        FIR_7p68MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I0_7p68MHz_245p76MHz <= m_axis_data_tdata_I0_7p68MHz_245p76MHz(31 downto 16);
        truncated_FIR_data_Q0_7p68MHz_245p76MHz <= m_axis_data_tdata_Q0_7p68MHz_245p76MHz(31 downto 16);

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          -- * NOTE: optimum truncation according to co-simulations *
          truncated_FIR_data_I1_7p68MHz_245p76MHz <= m_axis_data_tdata_I1_7p68MHz_245p76MHz(31 downto 16);
          truncated_FIR_data_Q1_7p68MHz_245p76MHz <= m_axis_data_tdata_Q1_7p68MHz_245p76MHz(31 downto 16);
        end if;

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_7p68MHz_output_discard_count <= cnt_decimation_FIR_length then
          truncated_FIR_data_I0_7p68MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q0_7p68MHz_245p76MHz_valid <= '0';
          truncated_FIR_data_I1_7p68MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q1_7p68MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I0_7p68MHz_245p76MHz = '1' then
            FIR_7p68MHz_output_discard_count <= FIR_7p68MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I0_7p68MHz_245p76MHz_valid <= m_axis_data_tvalid_I0_7p68MHz_245p76MHz;
          -- truncated_FIR_data_Q0_7p68MHz_245p76MHz_valid <= m_axis_data_tvalid_Q0_7p68MHz_245p76MHz;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            truncated_FIR_data_I1_7p68MHz_245p76MHz_valid <= m_axis_data_tvalid_I1_7p68MHz_245p76MHz;
            -- truncated_FIR_data_Q1_7p68MHz_245p76MHz_valid <= m_axis_data_tvalid_Q1_7p68MHz_245p76MHz;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 7.68 MSPS to 3.84 MSPS x2 decimating FIR inputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I0_7p68MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I0_7p68MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q0_7p68MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q0_7p68MHz_245p76MHzClk <= (others => '0');
        s_axis_data_tvalid_I1_7p68MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I1_7p68MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q1_7p68MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q1_7p68MHz_245p76MHzClk <= (others => '0');
      else
        -- fixed assignations
        s_axis_data_tdata_I0_7p68MHz_245p76MHzClk <= truncated_FIR_data_I0_7p68MHz_245p76MHz;
        s_axis_data_tdata_Q0_7p68MHz_245p76MHzClk <= truncated_FIR_data_Q0_7p68MHz_245p76MHz;

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          s_axis_data_tdata_I1_7p68MHz_245p76MHzClk <= truncated_FIR_data_I1_7p68MHz_245p76MHz;
          s_axis_data_tdata_Q1_7p68MHz_245p76MHzClk <= truncated_FIR_data_Q1_7p68MHz_245p76MHz;
        end if;

        -- only activate the decimating FIR when required
        -- * NOTE: we don't currently use 's_axis_data_tready_I_7p68MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_7p68MHz_to_decimating_FIR = '1' then
          s_axis_data_tvalid_I0_7p68MHz_245p76MHzClk <= truncated_FIR_data_I0_7p68MHz_245p76MHz_valid;
          -- s_axis_data_tvalid_Q0_7p68MHz_245p76MHzClk <= truncated_FIR_data_Q0_7p68MHz_245p76MHz_valid;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            s_axis_data_tvalid_I1_7p68MHz_245p76MHzClk <= truncated_FIR_data_I1_7p68MHz_245p76MHz_valid;
            -- s_axis_data_tvalid_Q1_7p68MHz_245p76MHzClk <= truncated_FIR_data_Q1_7p68MHz_245p76MHz_valid;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 7.68 MSPS to 3.84 MSPS x2 decimating FIR outputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I0_3p84MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I0_3p84MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q0_3p84MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q0_3p84MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_I1_3p84MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I1_3p84MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q1_3p84MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q1_3p84MHz_245p76MHz_valid <= '0';
        FIR_3p84MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I0_3p84MHz_245p76MHz <= m_axis_data_tdata_I0_3p84MHz_245p76MHz(31 downto 16);
        truncated_FIR_data_Q0_3p84MHz_245p76MHz <= m_axis_data_tdata_Q0_3p84MHz_245p76MHz(31 downto 16);

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          -- * NOTE: optimum truncation according to co-simulations *
          truncated_FIR_data_I1_3p84MHz_245p76MHz <= m_axis_data_tdata_I1_3p84MHz_245p76MHz(31 downto 16);
          truncated_FIR_data_Q1_3p84MHz_245p76MHz <= m_axis_data_tdata_Q1_3p84MHz_245p76MHz(31 downto 16);
        end if;

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_3p84MHz_output_discard_count <= cnt_decimation_FIR_length then
          truncated_FIR_data_I0_3p84MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q0_3p84MHz_245p76MHz_valid <= '0';
          truncated_FIR_data_I1_3p84MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q1_3p84MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I0_3p84MHz_245p76MHz = '1' then
            FIR_3p84MHz_output_discard_count <= FIR_3p84MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I0_3p84MHz_245p76MHz_valid <= m_axis_data_tvalid_I0_3p84MHz_245p76MHz;
          -- truncated_FIR_data_Q0_3p84MHz_245p76MHz_valid <= m_axis_data_tvalid_Q0_3p84MHz_245p76MHz;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            truncated_FIR_data_I1_3p84MHz_245p76MHz_valid <= m_axis_data_tvalid_I1_3p84MHz_245p76MHz;
            -- truncated_FIR_data_Q1_3p84MHz_245p76MHz_valid <= m_axis_data_tvalid_Q1_3p84MHz_245p76MHz;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 3.84 MSPS to 1.92 MSPS x2 decimating FIR inputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        s_axis_data_tvalid_I0_3p84MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I0_3p84MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q0_3p84MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q0_3p84MHz_245p76MHzClk <= (others => '0');
        s_axis_data_tvalid_I1_3p84MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_I1_3p84MHz_245p76MHzClk <= (others => '0');
        -- s_axis_data_tvalid_Q1_3p84MHz_245p76MHzClk <= '0';
        s_axis_data_tdata_Q1_3p84MHz_245p76MHzClk <= (others => '0');
      else
        -- fixed assignations
        s_axis_data_tdata_I0_3p84MHz_245p76MHzClk <= truncated_FIR_data_I0_3p84MHz_245p76MHz;
        s_axis_data_tdata_Q0_3p84MHz_245p76MHzClk <= truncated_FIR_data_Q0_3p84MHz_245p76MHz;

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          s_axis_data_tdata_I1_3p84MHz_245p76MHzClk <= truncated_FIR_data_I1_3p84MHz_245p76MHz;
          s_axis_data_tdata_Q1_3p84MHz_245p76MHzClk <= truncated_FIR_data_Q1_3p84MHz_245p76MHz;
        end if;

        -- only activate the decimating FIR when required
        -- * NOTE: we don't currently use 's_axis_data_tready_I_3p84MHz_245p76MHzClk' *; @TO_BE_TESTED
        if data_IQ_3p84MHz_to_decimating_FIR = '1' then
          s_axis_data_tvalid_I0_3p84MHz_245p76MHzClk <= truncated_FIR_data_I0_3p84MHz_245p76MHz_valid;
          -- s_axis_data_tvalid_Q0_3p84MHz_245p76MHzClk <= truncated_FIR_data_Q0_3p84MHz_245p76MHz_valid;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            s_axis_data_tvalid_I1_3p84MHz_245p76MHzClk <= truncated_FIR_data_I1_3p84MHz_245p76MHz_valid;
            -- s_axis_data_tvalid_Q1_3p84MHz_245p76MHzClk <= truncated_FIR_data_Q1_3p84MHz_245p76MHz_valid;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process truncating the 3.84 MSPS to 1.92 MSPS x2 decimating FIR outputs
  process(adc0_axis_mul2_aclk, adc0_axis_mul2_aresetn)
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if adc0_axis_mul2_aresetn='0' then -- synchronous low-active reset: initialization of signals
        truncated_FIR_data_I0_1p92MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I0_1p92MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q0_1p92MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q0_1p92MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_I1_1p92MHz_245p76MHz <= (others => '0');
        truncated_FIR_data_I1_1p92MHz_245p76MHz_valid <= '0';
        truncated_FIR_data_Q1_1p92MHz_245p76MHz <= (others => '0');
        -- truncated_FIR_data_Q1_1p92MHz_245p76MHz_valid <= '0';
        FIR_1p92MHz_output_discard_count <= (others => '0');
      else
        -- fixed assignations
        -- * NOTE: optimum truncation according to co-simulations *
        truncated_FIR_data_I0_1p92MHz_245p76MHz <= m_axis_data_tdata_I0_1p92MHz_245p76MHz(31 downto 16);
        truncated_FIR_data_Q0_1p92MHz_245p76MHz <= m_axis_data_tdata_Q0_1p92MHz_245p76MHz(31 downto 16);

        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          -- * NOTE: optimum truncation according to co-simulations *
          truncated_FIR_data_I1_1p92MHz_245p76MHz <= m_axis_data_tdata_I1_1p92MHz_245p76MHz(31 downto 16);
          truncated_FIR_data_Q1_1p92MHz_245p76MHz <= m_axis_data_tdata_Q1_1p92MHz_245p76MHz(31 downto 16);
        end if;

        -- the first N outputs will be discarded (i.e., they are not valid)
        if FIR_1p92MHz_output_discard_count <= cnt_decimation_FIR_length then
          truncated_FIR_data_I0_1p92MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q0_1p92MHz_245p76MHz_valid <= '0';
          truncated_FIR_data_I1_1p92MHz_245p76MHz_valid <= '0';
          -- truncated_FIR_data_Q1_1p92MHz_245p76MHz_valid <= '0';

          -- update the discarded output count
          if m_axis_data_tvalid_I0_1p92MHz_245p76MHz = '1' then
            FIR_1p92MHz_output_discard_count <= FIR_1p92MHz_output_discard_count + cnt_1_7b;
          end if;
        else
          truncated_FIR_data_I0_1p92MHz_245p76MHz_valid <= m_axis_data_tvalid_I0_1p92MHz_245p76MHz;
          -- truncated_FIR_data_Q0_1p92MHz_245p76MHz_valid <= m_axis_data_tvalid_Q0_1p92MHz_245p76MHz;

          -- [implement only if we have two antennas]
          if PARAM_ENABLE_2nd_RX then
            truncated_FIR_data_I1_1p92MHz_245p76MHz_valid <= m_axis_data_tvalid_I1_1p92MHz_245p76MHz;
            -- truncated_FIR_data_Q1_1p92MHz_245p76MHz_valid <= m_axis_data_tvalid_Q1_1p92MHz_245p76MHz;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the output ports
  -- ***************************************************

  -- process managing the decimation FIRs output signals
  process(ADCxN_clk_s,ADCxN_reset_s)
  begin
    if rising_edge(ADCxN_clk_s) then
      if ADCxN_reset_s='1' then -- synchronous high-active reset: initialization of signals
        adc_enable_0 <= '0';
        adc_valid_0 <= '0';
        adc_data_0 <= (others => '0');
        adc_enable_1 <= '0';
        adc_valid_1 <= '0';
        adc_data_1 <= (others => '0');
        adc_enable_2 <= '0';
        adc_valid_2 <= '0';
        adc_data_2 <= (others => '0');
        adc_enable_3 <= '0';
        adc_valid_3 <= '0';
        adc_data_3 <= (others => '0');
      else
        -- fixed assignations
        adc_enable_0 <= '1';
        adc_enable_1 <= '1';
        -- [implement only if we have two antennas]
        if PARAM_ENABLE_2nd_RX then
          adc_enable_2 <= '1';
          adc_enable_3 <= '1';
        end if;

        -- we'll only generate valid signals if the clock manager is locked
        if clk_mgr_locked_ADCxNclk = '1' then
          -- let's enable to required decimating FIR filters
          case current_N_FFT_ADCxNclk is
            when cnt_128_FFT_points_3b =>  -- 6 PRB
              adc_data_0 <= data_I0_1p92MHz_3p84MHzClk;
              adc_valid_0 <= data_I0_valid_1p92MHz_3p84MHzClk;
              adc_data_1 <= data_Q0_1p92MHz_3p84MHzClk;
              adc_valid_1 <= data_I0_valid_1p92MHz_3p84MHzClk;--data_Q0_valid_1p92MHz_3p84MHzClk;

              -- [implement only if we have two antennas]
              if PARAM_ENABLE_2nd_RX then
                adc_data_2 <= data_I1_1p92MHz_3p84MHzClk;
                adc_valid_2 <= data_I1_valid_1p92MHz_3p84MHzClk;
                adc_data_3 <= data_Q1_1p92MHz_3p84MHzClk;
                adc_valid_3 <= data_I1_valid_1p92MHz_3p84MHzClk;--data_Q1_valid_1p92MHz_3p84MHzClk;
              end if;
            when cnt_256_FFT_points_3b =>  -- 15 PRB
              adc_data_0 <= data_I0_3p84MHz_7p68MHzClk;
              adc_valid_0 <= data_I0_valid_3p84MHz_7p68MHzClk;
              adc_data_1 <= data_Q0_3p84MHz_7p68MHzClk;
              adc_valid_1 <= data_I0_valid_3p84MHz_7p68MHzClk;--data_Q0_valid_3p84MHz_7p68MHzClk;

              -- [implement only if we have two antennas]
              if PARAM_ENABLE_2nd_RX then
                adc_data_2 <= data_I1_3p84MHz_7p68MHzClk;
                adc_valid_2 <= data_I1_valid_3p84MHz_7p68MHzClk;
                adc_data_3 <= data_Q1_3p84MHz_7p68MHzClk;
                adc_valid_3 <= data_I1_valid_3p84MHz_7p68MHzClk;--data_Q1_valid_3p84MHz_7p68MHzClk;
              end if;
            when cnt_512_FFT_points_3b =>  -- 25 PRB
              adc_data_0 <= data_I0_7p68MHz_15p36MHzClk;
              adc_valid_0 <= data_I0_valid_7p68MHz_15p36MHzClk;
              adc_data_1 <= data_Q0_7p68MHz_15p36MHzClk;
              adc_valid_1 <= data_I0_valid_7p68MHz_15p36MHzClk;--data_Q0_valid_7p68MHz_15p36MHzClk;

              -- [implement only if we have two antennas]
              if PARAM_ENABLE_2nd_RX then
                adc_data_2 <= data_I1_7p68MHz_15p36MHzClk;
                adc_valid_2 <= data_I1_valid_7p68MHz_15p36MHzClk;
                adc_data_3 <= data_Q1_7p68MHz_15p36MHzClk;
                adc_valid_3 <= data_I1_valid_7p68MHz_15p36MHzClk;--data_Q1_valid_7p68MHz_15p36MHzClk;
              end if;
            when cnt_1024_FFT_points_3b => -- 50 PRB
              adc_data_0 <= data_I0_15p36MHz_30p72MHzClk;
              adc_valid_0 <= data_I0_valid_15p36MHz_30p72MHzClk;
              adc_data_1 <= data_Q0_15p36MHz_30p72MHzClk;
              adc_valid_1 <= data_I0_valid_15p36MHz_30p72MHzClk;--data_Q0_valid_15p36MHz_30p72MHzClk;

              -- [implement only if we have two antennas]
              if PARAM_ENABLE_2nd_RX then
                adc_data_2 <= data_I1_15p36MHz_30p72MHzClk;
                adc_valid_2 <= data_I1_valid_15p36MHz_30p72MHzClk;
                adc_data_3 <= data_Q1_15p36MHz_30p72MHzClk;
                adc_valid_3 <= data_I1_valid_15p36MHz_30p72MHzClk;--data_Q1_valid_15p36MHz_30p72MHzClk;
              end if;
            when others =>                 -- 100 PRB
              adc_data_0 <= data_I0_30p72MHz_61p44MHzClk;
              adc_valid_0 <= data_I0_valid_30p72MHz_61p44MHzClk;
              adc_data_1 <= data_Q0_30p72MHz_61p44MHzClk;
              adc_valid_1 <= data_I0_valid_30p72MHz_61p44MHzClk;--data_Q0_valid_30p72MHz_61p44MHzClk;

              -- [implement only if we have two antennas]
              if PARAM_ENABLE_2nd_RX then
                adc_data_2 <= data_I1_30p72MHz_61p44MHzClk;
                adc_valid_2 <= data_I1_valid_30p72MHz_61p44MHzClk;
                adc_data_3 <= data_Q1_30p72MHz_61p44MHzClk;
                adc_valid_3 <= data_I1_valid_30p72MHz_61p44MHzClk;--data_Q1_valid_30p72MHz_61p44MHzClk;
              end if;
            end case;
        else
          adc_valid_0 <= '0';
          adc_valid_1 <= '0';
          adc_valid_2 <= '0';
          adc_valid_3 <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
    end process;

  -- mapping of the 'ADCxN_X' output ports
  ADCxN_clk <= ADCxN_clk_s;
  ADCxN_reset <= ADCxN_reset_s;
  ADCxN_locked <= clk_mgr_locked_ADCxNclk;

  -- ***************************************************
  -- block instances
  -- ***************************************************

  -- cross-clock domain sharing of 'rfdc_N_FFT_param'
  synchronizer_rfdc_N_FFT_valid_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_3b
    generic map (
      --DATA_WIDTH	=> 3,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data => rfdc_N_FFT_param,
      src_data_valid => rfdc_N_FFT_valid,
      dst_clk => adc0_axis_aclk,
      dst_data => rfdc_N_FFT_param_ADC0clk,
      dst_data_valid => rfdc_N_FFT_valid_ADC0clk
    );

  -- cross-clock domain sharing of 'rfdc_N_FFT_param' [to adc0_axis_mul2_aclk]
  synchronizer_rfdc_N_FFT_valid_245p76MHzClk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_3b
    generic map (
      --DATA_WIDTH	=> 3,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => rfdc_N_FFT_param_ADC0clk,
      src_data_valid => clk_mgr_locked_ADC0clk,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => rfdc_N_FFT_param_245p76MHzClk,
      dst_data_valid => rfdc_N_FFT_valid_245p76MHzClk
    );

  -- cross-clock domain sharing of 'rfdc_N_FFT_param' [to ADCxNclk]
  synchronizer_rfdc_N_FFT_valid_ADCxN_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_3b
    generic map (
      --DATA_WIDTH	=> 3,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => rfdc_N_FFT_param_245p76MHzClk,
      src_data_valid => clk_mgr_locked_245p76MHzClk,
      dst_clk => ADCxN_clk_s,
      dst_data => rfdc_N_FFT_param_ADCxNclk,
      dst_data_valid => rfdc_N_FFT_valid_ADCxNclk
    );

  -- cross-clock domain sharing of 'decimation_initialized'
  synchronizer_decimation_initialized_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data(0) => decimation_initialized,
      src_data_valid => new_decimation_initialized_value,
      dst_clk => s_axi_aclk,
      dst_data(0) => decimation_initialized_AXIclk,
      dst_data_valid => open -- we don't need it
    );

  -- clock manager
  clk_wiz_0_ADC_ins : clk_wiz_0_ADC
    port map (
      -- AXI-lite configuration interface
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_awaddr => clk_mgr_s_axi_awaddr,
      s_axi_awvalid => clk_mgr_s_axi_awvalid,
      s_axi_awready => clk_mgr_s_axi_awready,
      s_axi_wdata => clk_mgr_s_axi_wdata,
      s_axi_wstrb => clk_mgr_s_axi_wstrb,
      s_axi_wvalid => clk_mgr_s_axi_wvalid,
      s_axi_wready => clk_mgr_s_axi_wready,
      s_axi_bresp => clk_mgr_s_axi_bresp,
      s_axi_bvalid => clk_mgr_s_axi_bvalid,
      s_axi_bready => clk_mgr_s_axi_bready,
      s_axi_araddr => clk_mgr_s_axi_araddr,
      s_axi_arvalid => clk_mgr_s_axi_arvalid,
      s_axi_arready => clk_mgr_s_axi_arready,
      s_axi_rdata => clk_mgr_s_axi_rdata,
      s_axi_rresp => clk_mgr_s_axi_rresp,
      s_axi_rvalid => clk_mgr_s_axi_rvalid,
      s_axi_rready => clk_mgr_s_axi_rready,
      -- input clock
      clk_in1 => adc0_axis_aclk,
      -- output clocks
      clk_out1 => clk_mgr_clk_out,
      locked => clk_mgr_locked
    );

  -- apply CE and CLR as depicted on the diagram here https://www.xilinx.com/support/answers/67885.html
  -- clk_mgr_reconfig_pulse <= '1' when clock_manager_configured_ADC0clk_i = '0' and clock_manager_configured_ADC0clk = '1' else '0';
  -- clk_bufs_CLR           <= '1' when (clk_mgr_reconfig_pulse = '1' or adc0_axis_aresetn = '0') else '0';
  clk_bufs_CLR <= '1' when clock_manager_configured_ADC0clk_i = '0' and clock_manager_configured_ADC0clk = '1' else '0';

  -- * NOTE: we won't forward the clock until the MMCM reaches a 'locked' status (after the clock-manager has been reconfigured) *
  clk_bufs_CE <= '1' when (clk_mgr_locked = '1' and initial_clk_config_provided_DAC0clk = '1') else '0';

  -- BUFGCE_DIV: General Clock Buffer with Divide Function [UltraScale, Xilinx HDL Language Template, version 2018.1]
  --  * NOTE: we do divide the clock manager output clock by 2 taking into account that for 6 PRBs, the
  --          design expects a clock as low as 3.84 MHz which cannot be synthesized by the MMCM IP; hence,
  --          this clocking architecture is used for the sake of an hogomeneized design for all PRBs *
  BUFGCE_DIV_inst_clk1 : BUFGCE_DIV
    generic map (
      -- programmable division attribute (1-8)
      BUFGCE_DIVIDE => 2,
      -- programmable inversion attributes (specifies built-in programmable inversion on specific pins)
      IS_CE_INVERTED => '0', -- Optional inversion for CE
      IS_CLR_INVERTED => '0', -- Optional inversion for CLR
      -- optional inversion for I
      IS_I_INVERTED => '0'
    )
    port map (
      O   => ADCxN_clk_s,
      CE  => clk_bufs_CE,
      CLR => clk_bufs_CLR,
      I   => clk_mgr_clk_out
  );

  -- reset synchronizer for clock-manager output clock domain
  proc_sys_ADCxN_reset_synchronizer_clkmgrout_ins : proc_sys_reset_synchronizer
    port map (
      slowest_sync_clk => ADCxN_clk_s,
      ext_reset_in => adc0_axis_aresetn,
      aux_reset_in => '1',     -- tied to 0 as we don't use it
      mb_debug_sys_rst => '0', -- tied to 0 as we don't use it
      dcm_locked => clk_mgr_locked_ADC0_i,
      -- mb_reset => open,
      -- bus_struct_reset(0) => open,
      -- peripheral_reset(0) => open,
      -- interconnect_aresetn(0) => open,
      peripheral_aresetn(0) => ADCxN_resetn
    );

  -- concurrent generation of 'ADCxN_reset_s'
  ADCxN_reset_s <= not ADCxN_resetn;

  -- synchronization of initial_clk_config_provided
  synchronizer_initial_clk_config_provided_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data(0) => initial_clk_config_provided,
      src_data_valid => '1',
      dst_clk => adc0_axis_aclk,
      dst_data(0) => initial_clk_config_provided_DAC0clk,
      dst_data_valid => open
    );

  -- cross-clock domain sharing of 'clock_manager_configured'
  synchronizer_clock_manager_configured_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data(0) => clock_manager_configured,
      src_data_valid => '1', -- inputs are always valid
      dst_clk => adc0_axis_aclk,
      dst_data(0) => clock_manager_configured_ADC0clk,
      dst_data_valid => open -- we don't need it
    );

  -- cross-clock domain sharing of 'clk_mgr_locked_ADC0clk'
  synchronizer_clk_mgr_locked_ADC0clk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data(0) => clk_mgr_locked_ADC0clk,
      src_data_valid => clk_mgr_locked_ADC0clk_new,
      dst_clk => ADCxN_clk_s,
      dst_data(0) => clk_mgr_locked_ADCxNclk_s,
      dst_data_valid => open
    );
    -- apply reset to important cross-clock domain control signals
    clk_mgr_locked_ADCxNclk <= clk_mgr_locked_ADCxNclk_s when ADCxN_reset_s = '0' else
                               '0';

  -- cross-clock domain sharing of 'clk_mgr_locked_ADCxNclk'
  synchronizer_clk_mgr_locked_ADCxNclk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk_s,
      src_data(0) => clk_mgr_locked_ADCxNclk,
      src_data_valid => '1', -- always valid
      dst_clk => adc0_axis_mul2_aclk,
      dst_data(0) => clk_mgr_locked_245p76MHzClk_s,
      dst_data_valid => open -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    clk_mgr_locked_245p76MHzClk <= clk_mgr_locked_245p76MHzClk_s when adc0_axis_mul2_aresetn = '1' else
                                   '0';

  -- cross-clock domain sharing of 'clk_mgr_locked_245p76MHzClk'
  synchronizer_clk_mgr_locked_AXIclk_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data(0) => clk_mgr_locked_245p76MHzClk,
      src_data_valid => '1', -- always valid
      dst_clk => s_axi_aclk,
      dst_data(0) => clk_mgr_locked_AXIclk_s,
      dst_data_valid => open -- we don't need it
    );
    -- apply reset to important cross-clock domain control signals
    clk_mgr_locked_AXIclk <= clk_mgr_locked_AXIclk_s when s_axi_aresetn = '1' else
                             '0';

  -- cross-clock domain sharing of 'adc00_I0'
  synchronizer_adc00_I0_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc00_I0_122p88MHz,
      src_data_valid => adc00_I_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc00_I0_245p76MHz,
      dst_data_valid => adc00_I_valid_245p76MHz
    );

  -- cross-clock domain sharing of 'adc00_I1'
  synchronizer_adc00_I1_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc00_I1_122p88MHz,
      src_data_valid => adc00_I_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc00_I1_245p76MHz,
      dst_data_valid => open -- already generated in the translation of 'adc00_I0'
    );

  -- cross-clock domain sharing of 'adc01_Q0'
  synchronizer_adc01_Q0_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc01_Q0_122p88MHz,
      src_data_valid => adc00_I_valid_122p88MHz, --adc01_Q_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc01_Q0_245p76MHz,
      dst_data_valid => open -- already generated in the translation of 'adc00_I0' --adc01_Q_valid_245p76MHz
    );

  -- cross-clock domain sharing of 'adc01_Q1'
  synchronizer_adc01_Q1_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc01_Q1_122p88MHz,
      src_data_valid => adc00_I_valid_122p88MHz, --adc01_Q_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc01_Q1_245p76MHz,
      dst_data_valid => open -- already generated in the translation of 'adc00_I0' -- already generated in the translation of 'adc01_Q0'
    );

  -- 8x decimating FIR translating the signal from 245.76 MSPS to 30.72 MSPS [I0 branch]
  adc_decimation_24576msps_to_3072msps_I0_ins : adc_decimation_24576msps_to_3072msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I0_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I0_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I0_30p72MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I0_30p72MHz_245p76MHz
    );

  -- 8x decimating FIR translating the signal from 245.76 MSPS to 30.72 MSPS [Q0 branch]
  adc_decimation_24576msps_to_3072msps_Q0_ins : adc_decimation_24576msps_to_3072msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_245p76MHzClk,--s_axis_data_tvalid_Q0_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q0_245p76MHzClk,       -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q0_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q0_30p72MHz_245p76MHz, -- already generated in the I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q0_30p72MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I0_30p72MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I0_30p72MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I0_30p72MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_30p72MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I0_30p72MHz_61p44MHzClk,
      dst_data_valid => data_I0_valid_30p72MHz_61p44MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q0_30p72MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q0_30p72MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q0_30p72MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_30p72MHz_245p76MHz_valid, --truncated_FIR_data_Q0_30p72MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q0_30p72MHz_61p44MHzClk,
      dst_data_valid => open --data_Q0_valid_30p72MHz_61p44MHzClk -- we don't need it
    );

  -- 2x decimating FIR translating the signal from 30.72 MSPS to 15.36 MSPS [I0 branch]
  adc_decimation_3072msps_to_1536msps_I0_ins : adc_decimation_3072msps_to_1536msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_30p72MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I0_30p72MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I0_30p72MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I0_15p36MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I0_15p36MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 30.72 MSPS to 15.36 MSPS [Q0 branch]
  adc_decimation_3072msps_to_1536msps_Q0_ins : adc_decimation_3072msps_to_1536msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_30p72MHz_245p76MHzClk, --s_axis_data_tvalid_Q0_30p72MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q0_30p72MHz_245p76MHzClk, -- we don't need it
      s_axis_data_tdata => s_axis_data_tdata_Q0_30p72MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q0_15p36MHz_245p76MHz,    -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q0_15p36MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I0_15p36MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I0_15p36MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I0_15p36MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_15p36MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I0_15p36MHz_30p72MHzClk,
      dst_data_valid => data_I0_valid_15p36MHz_30p72MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q0_15p36MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q0_15p36MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q0_15p36MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_15p36MHz_245p76MHz_valid, --truncated_FIR_data_Q0_15p36MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q0_15p36MHz_30p72MHzClk,
      dst_data_valid => open --data_Q0_valid_15p36MHz_30p72MHzClk -- not needed
    );

  -- 2x decimating FIR translating the signal from 15.36 MSPS to 7.68 MSPS [I0 branch]
  adc_decimation_1536msps_to_768msps_I0_ins : adc_decimation_1536msps_to_768msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_15p36MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I0_15p36MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I0_15p36MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I0_7p68MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I0_7p68MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 15.36 MSPS to 7.68 MSPS [Q0 branch]
  adc_decimation_1536msps_to_768msps_Q0_ins : adc_decimation_1536msps_to_768msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_15p36MHz_245p76MHzClk, --s_axis_data_tvalid_Q0_15p36MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q0_15p36MHz_245p76MHzClk, -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q0_15p36MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q0_7p68MHz_245p76MHz,     -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q0_7p68MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I0_7p68MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I0_7p68MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I0_7p68MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_7p68MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I0_7p68MHz_15p36MHzClk,
      dst_data_valid => data_I0_valid_7p68MHz_15p36MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q0_7p68MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q0_7p68MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q0_7p68MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_7p68MHz_245p76MHz_valid, --truncated_FIR_data_Q0_7p68MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q0_7p68MHz_15p36MHzClk,
      dst_data_valid => open --data_Q0_valid_7p68MHz_15p36MHzClk -- not needed
    );

  -- 2x decimating FIR translating the signal from 7.68 MSPS to 3.84 MSPS [I0 branch]
  adc_decimation_768msps_to_384msps_I0_ins : adc_decimation_768msps_to_384msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_7p68MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I0_7p68MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I0_7p68MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I0_3p84MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I0_3p84MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 7.68 MSPS to 3.84 MSPS [Q0 branch]
  adc_decimation_768msps_to_384msps_Q0_ins : adc_decimation_768msps_to_384msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_7p68MHz_245p76MHzClk, --s_axis_data_tvalid_Q0_7p68MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q0_7p68MHz_245p76MHzClk, -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q0_7p68MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q0_3p84MHz_245p76MHz,    -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q0_3p84MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I0_3p84MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I0_3p84MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I0_3p84MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_3p84MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I0_3p84MHz_7p68MHzClk,
      dst_data_valid => data_I0_valid_3p84MHz_7p68MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q0_3p84MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q0_3p84MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q0_3p84MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_3p84MHz_245p76MHz_valid, --truncated_FIR_data_Q0_3p84MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q0_3p84MHz_7p68MHzClk,
      dst_data_valid => open --data_Q0_valid_3p84MHz_7p68MHzClk -- not needed
    );

  -- 2x decimating FIR translating the signal from 3.84 MSPS to 1.92 MSPS [I0 branch]
  adc_decimation_384msps_to_192msps_I0_ins : adc_decimation_384msps_to_192msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_3p84MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I0_3p84MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I0_3p84MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I0_1p92MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I0_1p92MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 3.84 MSPS to 1.92 MSPS [Q0 branch]
  adc_decimation_384msps_to_192msps_Q0_ins : adc_decimation_384msps_to_192msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I0_3p84MHz_245p76MHzClk, --s_axis_data_tvalid_Q0_3p84MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q0_3p84MHz_245p76MHzClk, -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q0_3p84MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q0_1p92MHz_245p76MHz,     -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q0_1p92MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I0_1p92MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I0_1p92MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I0_1p92MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_1p92MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I0_1p92MHz_3p84MHzClk,
      dst_data_valid => data_I0_valid_1p92MHz_3p84MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q0_1p92MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q0_1p92MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q0_1p92MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I0_1p92MHz_245p76MHz_valid, --truncated_FIR_data_Q0_1p92MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q0_1p92MHz_3p84MHzClk,
      dst_data_valid => open --data_Q0_valid_1p92MHz_3p84MHzClk -- not needed
    );

-- [second receive antenna path]
secondRx_FIR_path : if PARAM_ENABLE_2nd_RX generate
  -- cross-clock domain sharing of 'adc02_I0'
  synchronizer_adc02_I0_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc02_I0_122p88MHz,
      src_data_valid => adc02_I_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc02_I0_245p76MHz,
      dst_data_valid => adc02_I_valid_245p76MHz
    );

  -- cross-clock domain sharing of 'adc02_I1'
  synchronizer_adc02_I1_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc02_I1_122p88MHz,
      src_data_valid => adc02_I_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc02_I1_245p76MHz,
      dst_data_valid => open -- already generated in the translation of 'adc02_I0'
    );

  -- cross-clock domain sharing of 'adc03_Q0'
  synchronizer_adc03_Q0_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc03_Q0_122p88MHz,
      src_data_valid => adc02_I_valid_122p88MHz, --adc03_Q_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc03_Q0_245p76MHz,
      dst_data_valid => open -- already generated in the translation of 'adc02_I0' --adc03_Q_valid_245p76MHz
    );

  -- cross-clock domain sharing of 'adc03_Q1'
  synchronizer_adc03_Q1_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_aclk,
      src_data => adc03_Q1_122p88MHz,
      src_data_valid => adc02_I_valid_122p88MHz, --adc03_Q_valid_122p88MHz,
      dst_clk => adc0_axis_mul2_aclk,
      dst_data => adc03_Q1_245p76MHz,
      dst_data_valid => open -- already generated in the translation of 'adc02_I0' -- already generated in the translation of 'adc03_Q0'
    );

  -- 8x decimating FIR translating the signal from 245.76 MSPS to 30.72 MSPS [I1 branch]
  adc_decimation_24576msps_to_3072msps_I1_ins : adc_decimation_24576msps_to_3072msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I1_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I1_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I1_30p72MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I1_30p72MHz_245p76MHz
    );

  -- 8x decimating FIR translating the signal from 245.76 MSPS to 30.72 MSPS [Q1 branch]
  adc_decimation_24576msps_to_3072msps_Q1_ins : adc_decimation_24576msps_to_3072msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_245p76MHzClk,--s_axis_data_tvalid_Q1_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q1_245p76MHzClk,       -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q1_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q1_30p72MHz_245p76MHz, -- already generated in the I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q1_30p72MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I1_30p72MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I1_30p72MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I1_30p72MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_30p72MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I1_30p72MHz_61p44MHzClk,
      dst_data_valid => data_I1_valid_30p72MHz_61p44MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q1_30p72MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q1_30p72MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q1_30p72MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_30p72MHz_245p76MHz_valid, --truncated_FIR_data_Q1_30p72MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q1_30p72MHz_61p44MHzClk,
      dst_data_valid => open --data_Q1_valid_30p72MHz_61p44MHzClk -- we don't need it
    );

  -- 2x decimating FIR translating the signal from 30.72 MSPS to 15.36 MSPS [I1 branch]
  adc_decimation_3072msps_to_1536msps_I1_ins : adc_decimation_3072msps_to_1536msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_30p72MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I1_30p72MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I1_30p72MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I1_15p36MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I1_15p36MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 30.72 MSPS to 15.36 MSPS [Q1 branch]
  adc_decimation_3072msps_to_1536msps_Q1_ins : adc_decimation_3072msps_to_1536msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_30p72MHz_245p76MHzClk, --s_axis_data_tvalid_Q1_30p72MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q1_30p72MHz_245p76MHzClk, -- we don't need it
      s_axis_data_tdata => s_axis_data_tdata_Q1_30p72MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q1_15p36MHz_245p76MHz,    -- already generated in the I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q1_15p36MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I1_15p36MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I1_15p36MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I1_15p36MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_15p36MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I1_15p36MHz_30p72MHzClk,
      dst_data_valid => data_I1_valid_15p36MHz_30p72MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q1_15p36MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q1_15p36MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q1_15p36MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_15p36MHz_245p76MHz_valid, --truncated_FIR_data_Q1_15p36MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q1_15p36MHz_30p72MHzClk,
      dst_data_valid => open --data_Q1_valid_15p36MHz_30p72MHzClk -- not needed
    );

  -- 2x decimating FIR translating the signal from 15.36 MSPS to 7.68 MSPS [I1 branch]
  adc_decimation_1536msps_to_768msps_I1_ins : adc_decimation_1536msps_to_768msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_15p36MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I1_15p36MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I1_15p36MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I1_7p68MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I1_7p68MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 15.36 MSPS to 7.68 MSPS [Q1 branch]
  adc_decimation_1536msps_to_768msps_Q1_ins : adc_decimation_1536msps_to_768msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_15p36MHz_245p76MHzClk, --s_axis_data_tvalid_Q1_15p36MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q1_15p36MHz_245p76MHzClk, -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q1_15p36MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q1_7p68MHz_245p76MHz,     -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q1_7p68MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I1_7p68MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I1_7p68MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I1_7p68MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_7p68MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I1_7p68MHz_15p36MHzClk,
      dst_data_valid => data_I1_valid_7p68MHz_15p36MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q1_7p68MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q1_7p68MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q1_7p68MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_7p68MHz_245p76MHz_valid, --truncated_FIR_data_Q1_7p68MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q1_7p68MHz_15p36MHzClk,
      dst_data_valid => open --data_Q1_valid_7p68MHz_15p36MHzClk -- not needed
    );

  -- 2x decimating FIR translating the signal from 7.68 MSPS to 3.84 MSPS [I1 branch]
  adc_decimation_768msps_to_384msps_I1_ins : adc_decimation_768msps_to_384msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_7p68MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I1_7p68MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I1_7p68MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I1_3p84MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I1_3p84MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 7.68 MSPS to 3.84 MSPS [Q1 branch]
  adc_decimation_768msps_to_384msps_Q1_ins : adc_decimation_768msps_to_384msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_7p68MHz_245p76MHzClk,--s_axis_data_tvalid_Q1_7p68MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q1_7p68MHz_245p76MHzClk, -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q1_7p68MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q1_3p84MHz_245p76MHz,    -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q1_3p84MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I1_3p84MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I1_3p84MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I1_3p84MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_3p84MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I1_3p84MHz_7p68MHzClk,
      dst_data_valid => data_I1_valid_3p84MHz_7p68MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q1_3p84MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q1_3p84MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q1_3p84MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_3p84MHz_245p76MHz_valid, --truncated_FIR_data_Q1_3p84MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q1_3p84MHz_7p68MHzClk,
      dst_data_valid => open --data_Q1_valid_3p84MHz_7p68MHzClk -- not needed
    );

  -- 2x decimating FIR translating the signal from 3.84 MSPS to 1.92 MSPS [I1 branch]
  adc_decimation_384msps_to_192msps_I1_ins : adc_decimation_384msps_to_192msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_3p84MHz_245p76MHzClk,
      s_axis_data_tready => s_axis_data_tready_I1_3p84MHz_245p76MHzClk,
      s_axis_data_tdata => s_axis_data_tdata_I1_3p84MHz_245p76MHzClk,
      m_axis_data_tvalid => m_axis_data_tvalid_I1_1p92MHz_245p76MHz,
      m_axis_data_tdata => m_axis_data_tdata_I1_1p92MHz_245p76MHz
    );

  -- 2x decimating FIR translating the signal from 3.84 MSPS to 1.92 MSPS [Q1 branch]
  adc_decimation_384msps_to_192msps_Q1_ins : adc_decimation_384msps_to_192msps
    port map (
      aresetn => adc0_axis_mul2_aresetn,
      aclk => adc0_axis_mul2_aclk,
      s_axis_data_tvalid => s_axis_data_tvalid_I1_3p84MHz_245p76MHzClk, --s_axis_data_tvalid_Q1_3p84MHz_245p76MHzClk,
      s_axis_data_tready => open, --s_axis_data_tready_Q1_3p84MHz_245p76MHzClk, -- not needed
      s_axis_data_tdata => s_axis_data_tdata_Q1_3p84MHz_245p76MHzClk,
      m_axis_data_tvalid => open, --m_axis_data_tvalid_Q1_1p92MHz_245p76MHz,    -- already generated in I FIR
      m_axis_data_tdata => m_axis_data_tdata_Q1_1p92MHz_245p76MHz
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_I1_1p92MHz_245p76MHz'
  synchronizer_truncated_FIR_data_I1_1p92MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_I1_1p92MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_1p92MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_I1_1p92MHz_3p84MHzClk,
      dst_data_valid => data_I1_valid_1p92MHz_3p84MHzClk
    );

  -- cross-clock domain sharing of 'truncated_FIR_data_Q1_1p92MHz_245p76MHz'
  synchronizer_truncated_FIR_data_Q1_1p92MHz_245p76MHz_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_16b
    generic map (
      --DATA_WIDTH	=> 16,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => adc0_axis_mul2_aclk,
      src_data => truncated_FIR_data_Q1_1p92MHz_245p76MHz,
      src_data_valid => truncated_FIR_data_I1_1p92MHz_245p76MHz_valid, --truncated_FIR_data_Q1_1p92MHz_245p76MHz_valid,
      dst_clk => ADCxN_clk_s,
      dst_data => data_Q1_1p92MHz_3p84MHzClk,
      dst_data_valid => open --data_Q1_valid_1p92MHz_3p84MHzClk -- not needed
    );
end generate secondRx_FIR_path;

  -- ***************************************************
  -- dump to external file * SIMULATION ONLY *
  -- ***************************************************

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(adc0_axis_mul2_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if m_axis_data_tvalid_I0_30p72MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I0_30p72MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_0, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q0_30p72MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_0, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(adc0_axis_mul2_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if m_axis_data_tvalid_I0_15p36MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I0_15p36MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_1, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q0_15p36MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_1, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(adc0_axis_mul2_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if m_axis_data_tvalid_I0_7p68MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I0_7p68MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_2, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q0_7p68MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_2, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(adc0_axis_mul2_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if m_axis_data_tvalid_I0_3p84MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I0_3p84MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_3, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q0_3p84MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_3, written_text_line);
      end if;
    end if; -- end of clk
  end process;

  -- process writing intermediate results to an output text file (a single line will be generated for each value)
  process(adc0_axis_mul2_aclk)
    variable written_text_line : line;
  begin
    if rising_edge(adc0_axis_mul2_aclk) then
      if m_axis_data_tvalid_I0_1p92MHz_245p76MHz = '1' then
        write(written_text_line, m_axis_data_tdata_I0_1p92MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_4, written_text_line);
        write(written_text_line, m_axis_data_tdata_Q0_1p92MHz_245p76MHz);
        writeline(output_IQ_file_cfg0_4, written_text_line);
      end if;
    end if; -- end of clk
  end process;

end arch_rfdc_adc_data_decim_and_depack_RTL_impl;
