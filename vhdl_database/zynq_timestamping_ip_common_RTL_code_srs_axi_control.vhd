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

-- * NOTE: this block aims at providing a centralized control point for all UE blocks implemented in the FPGA; hence, it will implement the principal
--         interface to the PS (i.e., AXI-based) and manage the proper configuration of the PHY blocks according to the PS requirements *

entity srs_axi_control is
  generic( -- @TO_BE_TESTED: currently we use fixed bit-widths for the I/Q operands
    G_BUILD_TIME : std_logic_vector(31 downto 0) := (others => '0');
    G_BUILD_DATE : std_logic_vector(31 downto 0) := (others => '0');
    G_BUILD_COMMIT_HASH : std_logic_vector(31 downto 0) := (others => '0')
  );
  port (
    -- **********************************
    -- ports of the slave AXI-lite bus interface [s00_axi] -> reception of configuration parameters or forwarding of status (or specific intermediate results) from/to the ARM
    -- **********************************

    -- input ports
    s00_axi_aclk : in std_logic;
    s00_axi_aresetn : in std_logic;
    s00_axi_awaddr : in std_logic_vector(11 downto 0);
    s00_axi_awprot : in std_logic_vector(2 downto 0); -- ** NOT USED **
    s00_axi_awvalid : in std_logic;
    s00_axi_wdata : in std_logic_vector(31 downto 0);
    s00_axi_wstrb : in std_logic_vector(3 downto 0);  -- ** NOT USED; @TO_BE_TESTED: fixed 32-bit write-operations are assumed **
    s00_axi_wvalid : in std_logic;
    s00_axi_bready : in std_logic;
    s00_axi_araddr : in std_logic_vector(11 downto 0);
    s00_axi_arprot : in std_logic_vector(2 downto 0);
    s00_axi_arvalid : in std_logic;
    s00_axi_rready : in std_logic;

    -- output ports
    s00_axi_awready : out std_logic;
    s00_axi_wready : out std_logic;
    s00_axi_bresp : out std_logic_vector(1 downto 0);
    s00_axi_bvalid : out std_logic;
    s00_axi_arready : out std_logic;
    s00_axi_rdata : out std_logic_vector(31 downto 0);
    s00_axi_rresp : out std_logic_vector(1 downto 0);
    s00_axi_rvalid : out std_logic;

    -- **********************************
    -- clock and reset signals governing the ADC sample provision
    -- **********************************
    ADCxN_clk : in std_logic;                                        -- ADC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_reset : in std_logic;                                      -- ADC high-active reset signal (mapped to the ADC clock xN domain [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_locked : in std_logic;                                     -- ADC clock locked indication signal

    -- **********************************
    -- custom timestamping ports
    -- **********************************
    current_lclk_count : in std_logic_vector(63 downto 0);           -- current ADC clock cycle (i.e., current I/Q sample count) [@ADCxN_clk, even though the clock-ticks are based on @ADC_clk]

    -- **********************************
    -- interface to configurable_adc_16bit_readjusment
    -- **********************************
    adc_channel_shifting_ch0 : out std_logic_vector(4 downto 0);     -- signal providing the 'adc_channel_shifting_ch0' parameter (i.e., number of bits to shift [to the left]) (@s_axi_aclk) - supported values are 0-10 (@s00_axi_aclk)
    adc_channel_shifting_ch0_valid : out std_logic;                  -- signal indicating if the output 'adc_channel_shifting_ch0' parameter is valid (@s00_axi_aclk)
    adc_channel_shifting_ch1 : out std_logic_vector(4 downto 0);     -- signal providing the 'adc_channel_shifting_ch1' parameter (i.e., number of bits to shift [to the left]) (@s_axi_aclk) - supported values are 0-10 (@s00_axi_aclk)
    adc_channel_shifting_ch1_valid : out std_logic;                  -- signal indicating if the output 'adc_channel_shifting_ch1' parameter is valid (@s00_axi_aclk)

    -- **********************************
    -- interface to configurable_dac_16bit_readjusment
    -- **********************************
    dac_channel_shifting : out std_logic_vector(4 downto 0);         -- signal providing the 'dac_channel_shifting' parameter (i.e., number of bits to shift [to the right]) (@s_axi_aclk) - supported values are 0-10 (@s00_axi_aclk)
    dac_channel_shifting_valid : out std_logic;                      -- signal indicating if the output 'dac_channel_shifting' parameter is valid (@s00_axi_aclk)

    -- **********************************
    -- interface to rfdc_adc_data_decim_and_depack
    -- **********************************
    rfdc_N_FFT_param : out std_logic_vector(2 downto 0);              -- signal providing the 'N_FFT' PSS parameter (i.e., number of FFT points) (@s00_axi_aclk)
    rfdc_N_FFT_valid : out std_logic;                                 -- signal indicating if the output 'N_FFT' PSS parameter is valid (@s00_axi_aclk)

    -- **********************************
    -- interface to adc_fifo_timestamp_enabler (@ADCxN_clk)
    -- **********************************

    -- status register
    ADC_FSM_status : in std_logic_vector(31 downto 0);               -- status register for the FSM controlling the ADC forwarding chain
    ADC_FSM_new_status : in std_logic;                               -- valid signal for 'ADC_FSM_status'
    ADC_FSM_status_read : out std_logic;                             -- ACK signal for 'ADC_FSM_status'

    nof_adc_dma_channels : in std_logic_vector(1 downto 0);          -- number of ADC channels forwarded to a DMA IP

    -- **********************************
    -- interface to dac_fifo_timestamp_enabler
    -- **********************************
    DAC_late_flag : in std_logic;                                    -- flag indicating whether a 'late' situation took place or ont
    DAC_new_late : in std_logic;                                     -- valid signal for 'DAC_late_flag'
    DAC_FSM_status : in std_logic_vector(31 downto 0);               -- status register for the FSM controlling the DAC forwarding chain
    DAC_FSM_new_status : in std_logic;                               -- valid signal for 'DAC_FSM_status'
    DAC_FSM_status_read : out std_logic;                             -- ACK signal for 'DAC_FSM_status'

    -- **********************************
    -- SW generated system-wide reset signal (negative edge)
    sw_generated_resetn : out std_logic

  );
end srs_axi_control;

architecture arch_srs_axi_control_RTL_impl of srs_axi_control is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- AXI-lite-related constants
  constant cnt_FFT_mem_mapped_base_address   : std_logic_vector(3 downto 0)                 :="0000";
  constant cnt_DEBUG_mem_mapped_base_address : std_logic_vector(3 downto 0)                 :="0011";
  constant cnt_srs_axi_control_mem_mapped_base_address : std_logic_vector(3 downto 0):="0111";
  constant cnt_RFdc_mem_mapped_base_address : std_logic_vector(3 downto 0)                  :="1000";

  constant cnt_mem_mapped_reg0_address  : std_logic_vector(4 downto 0) :="00000";
  constant cnt_mem_mapped_reg1_address  : std_logic_vector(4 downto 0) :="00001";
  constant cnt_mem_mapped_reg2_address  : std_logic_vector(4 downto 0) :="00010";
  constant cnt_mem_mapped_reg3_address  : std_logic_vector(4 downto 0) :="00011";
  constant cnt_mem_mapped_reg4_address  : std_logic_vector(4 downto 0) :="00100";
  constant cnt_mem_mapped_reg5_address  : std_logic_vector(4 downto 0) :="00101";
  constant cnt_mem_mapped_reg6_address  : std_logic_vector(4 downto 0) :="00110";
  constant cnt_mem_mapped_reg7_address  : std_logic_vector(4 downto 0) :="00111";
  constant cnt_mem_mapped_reg8_address  : std_logic_vector(4 downto 0) :="01000";
  constant cnt_mem_mapped_reg9_address  : std_logic_vector(4 downto 0) :="01001";
  constant cnt_mem_mapped_reg10_address : std_logic_vector(4 downto 0) :="01010";
  constant cnt_mem_mapped_reg11_address : std_logic_vector(4 downto 0) :="01011";
  constant cnt_mem_mapped_reg12_address : std_logic_vector(4 downto 0) :="01100";
  constant cnt_mem_mapped_reg13_address : std_logic_vector(4 downto 0) :="01101";
  constant cnt_mem_mapped_reg14_address : std_logic_vector(4 downto 0) :="01110";
  constant cnt_mem_mapped_reg15_address : std_logic_vector(4 downto 0) :="01111";
  constant cnt_mem_mapped_reg16_address : std_logic_vector(4 downto 0) :="10000";
  constant cnt_mem_mapped_reg17_address : std_logic_vector(4 downto 0) :="10001";
  constant cnt_mem_mapped_reg18_address : std_logic_vector(4 downto 0) :="10010";
  constant cnt_mem_mapped_reg19_address : std_logic_vector(4 downto 0) :="10011";
  constant cnt_mem_mapped_reg20_address : std_logic_vector(4 downto 0) :="10100";
  constant cnt_mem_mapped_reg21_address : std_logic_vector(4 downto 0) :="10101";
  constant cnt_mem_mapped_reg22_address : std_logic_vector(4 downto 0) :="10110";
  constant cnt_mem_mapped_reg23_address : std_logic_vector(4 downto 0) :="10111";
  constant cnt_mem_mapped_reg24_address : std_logic_vector(4 downto 0) :="11000";
  constant cnt_mem_mapped_reg25_address : std_logic_vector(4 downto 0) :="11001";
  constant cnt_mem_mapped_reg26_address : std_logic_vector(4 downto 0) :="11010";
  constant cnt_mem_mapped_reg27_address : std_logic_vector(4 downto 0) :="11011";
  constant cnt_mem_mapped_reg28_address : std_logic_vector(4 downto 0) :="11100";
  constant cnt_mem_mapped_reg29_address : std_logic_vector(4 downto 0) :="11101";
  constant cnt_mem_mapped_reg30_address : std_logic_vector(4 downto 0) :="11110";
  constant cnt_mem_mapped_reg31_address : std_logic_vector(4 downto 0) :="11111";

  -- FFT configuration-parameter constants
  constant cnt_128_FFT_points_3b : std_logic_vector(2 downto 0)  :="000";
  constant cnt_256_FFT_points_3b : std_logic_vector(2 downto 0)  :="001";
  constant cnt_512_FFT_points_3b : std_logic_vector(2 downto 0)  :="010";
  constant cnt_1024_FFT_points_3b : std_logic_vector(2 downto 0) :="011";
  constant cnt_2048_FFT_points_3b : std_logic_vector(2 downto 0) :="100";

  constant cnt_128_32b : std_logic_vector(31 downto 0)  := x"00000080";
  constant cnt_256_32b : std_logic_vector(31 downto 0)  := x"00000100";
  constant cnt_512_32b : std_logic_vector(31 downto 0)  := x"00000200";
  constant cnt_1024_32b : std_logic_vector(31 downto 0) := x"00000400";
  constant cnt_2048_32b : std_logic_vector(31 downto 0) := x"00000800";

  -- system-reset related signals
  constant cnt_sw_system_reset_duration : unsigned(3 downto 0) := (others => '1');
  constant cnt_sw_system_reset_zero     : unsigned(cnt_sw_system_reset_duration'range) := (others => '0');
  constant cnt_sw_system_reset_incrmnt  : unsigned(cnt_sw_system_reset_duration'range) := (0 => '1', others => '0');

  -- **********************************
  -- component instantiation
  -- **********************************

  -- [64-bit] fifo-based multi-bit cross-clock domain synchronizer stage to enable passing I/Q samples between different clock domains (e.g., FPGA using a higher processing speed)
  component multibit_cross_clock_domain_fifo_synchronizer_resetless_64b is
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
      src_data : in std_logic_vector(63 downto 0);            -- parallel input data bus (mapped to the source clock domain)
      src_data_valid : in std_logic;                          -- signal indicating when the input data is valid (mapped to the source clock domain)
      dst_clk : in std_logic;                                 -- destination clock domain signal

      -- output ports
      dst_data : out std_logic_vector(63 downto 0);           -- parallel output data bus (mapped to the destination clock domain)
      dst_data_valid : out std_logic                          -- signal indicating when the output data is valid (mapped to the destination clock domain)
    );
  end component;

  -- [32-bit] fifo-based multi-bit cross-clock domain synchronizer stage to enable passing I/Q samples between different clock domains (e.g., FPGA using a higher processing speed)
  component multibit_cross_clock_domain_fifo_synchronizer_resetless_32b is
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
      src_data : in std_logic_vector(31 downto 0);            -- parallel input data bus (mapped to the source clock domain)
      src_data_valid : in std_logic;                          -- signal indicating when the input data is valid (mapped to the source clock domain)
      dst_clk : in std_logic;                                 -- destination clock domain signal

      -- output ports
      dst_data : out std_logic_vector(31 downto 0);           -- parallel output data bus (mapped to the destination clock domain)
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

  -- x_length related signals
  signal current_lclk_count_int : std_logic_vector(63 downto 0):=(others => '0');

  -- AXI-lite signals (includes the memory-mapped input and output registers)
  signal axi_lite_awaddr : std_logic_vector(11 downto 0);
  signal axi_lite_awready : std_logic;
  signal axi_lite_wready : std_logic;
  signal axi_lite_bresp : std_logic_vector(1 downto 0);
  signal axi_lite_bvalid : std_logic;
  signal axi_lite_araddr : std_logic_vector(11 downto 0);
  signal axi_lite_arready : std_logic;
  signal axi_lite_rdata : std_logic_vector(31 downto 0);
  signal axi_lite_rresp : std_logic_vector(1 downto 0);
  signal axi_lite_rvalid : std_logic;
  -- FFT --
  signal FFT_mem_mapped_reg_4	: std_logic_vector(31 downto 0);             -- storage of the N_FFT parameter for the RFdc block
  signal FFT_mem_mapped_reg_4_data_valid : std_logic;
  -- RF --
  signal RFdc_mem_mapped_reg_0 : std_logic_vector(31 downto 0);            -- storage of the 'adc_channel_shifting_ch0' parameter (drives the 'configurable_adc_16bit_readjusment' block)
  signal RFdc_mem_mapped_reg_0_data_valid : std_logic;
  signal RFdc_mem_mapped_reg_1 : std_logic_vector(31 downto 0);            -- storage of the 'adc_channel_shifting_ch1' parameter (drives the 'configurable_adc_16bit_readjusment' block)
  signal RFdc_mem_mapped_reg_1_data_valid : std_logic;
  signal RFdc_mem_mapped_reg_2 : std_logic_vector(31 downto 0);            -- storage of the 'dac_channel_shifting' parameter (drives the 'configurable_dac_16bit_readjusment' block)
  signal RFdc_mem_mapped_reg_2_data_valid : std_logic;
  signal RFdc_mem_mapped_reg_7 : std_logic_vector(31 downto 0) := (others => '0');  -- storage of the RFdc & clock related status signals [READ-ONLY]
  signal RFdc_mem_mapped_reg_8 : std_logic_vector(31 downto 0) := (others => '0');  -- storage of the ADC DMA channels number [READ-ONLY]
  -- Centralized controller status --
  signal srsUE_AXI_ctrl_mem_mapped_reg_0	: std_logic_vector(31 downto 0); -- timestamped DAC late flag register
  signal srsUE_AXI_ctrl_mem_mapped_reg_0_data_valid : std_logic;
  signal srsUE_AXI_ctrl_mem_mapped_reg_1 : std_logic_vector(31 downto 0);  -- timestamped DAC FSM status register
  signal srsUE_AXI_ctrl_mem_mapped_reg_1_data_valid : std_logic;
  signal srsUE_AXI_ctrl_mem_mapped_reg_2    : std_logic_vector(31 downto 0); -- register indicating a PS-write error status
  signal srsUE_AXI_ctrl_mem_mapped_reg_2_data_valid : std_logic;
  signal srsUE_AXI_ctrl_mem_mapped_reg_3    : std_logic_vector(31 downto 0); -- PSS status register (e.g., PSS not found flag)
  signal srsUE_AXI_ctrl_mem_mapped_reg_3_data_valid : std_logic;
  signal srsUE_AXI_ctrl_mem_mapped_reg_4    : std_logic_vector(31 downto 0); -- timestamped ADC FSM status register
  signal srsUE_AXI_ctrl_mem_mapped_reg_4_data_valid : std_logic;
  signal srsUE_AXI_ctrl_mem_mapped_reg_5    : std_logic_vector(31 downto 0); -- FPGA timestamp LSB bits
  signal srsUE_AXI_ctrl_mem_mapped_reg_6    : std_logic_vector(31 downto 0); -- FPGA timestamp MSB bits
  signal srsUE_AXI_ctrl_mem_mapped_reg_7    : std_logic_vector(31 downto 0); -- control signals common to the whole design
  signal srsUE_AXI_ctrl_mem_mapped_reg_8    : std_logic_vector(31 downto 0); -- build date (filled by TCL build-script)
  signal srsUE_AXI_ctrl_mem_mapped_reg_9    : std_logic_vector(31 downto 0); -- build time (filled by TCL build-script)
  signal srsUE_AXI_ctrl_mem_mapped_reg_10    : std_logic_vector(31 downto 0); -- build commit hash (filled by TCL build-script)

  signal mem_mapped_reg_write_enable	: std_logic;
  signal mem_mapped_reg_addr_write_enable	: std_logic;
  signal mem_mapped_reg_read_enable	: std_logic;
  signal mem_mapped_reg_data_out	: std_logic_vector(31 downto 0);

  -- NFFT config for the RFdc clock generation block
  signal param_NFFT_rfdc : std_logic_vector(2 downto 0);
  signal param_NFFT_rfdc_received : std_logic;
  signal param_NFFT_rfdc_valid : std_logic;
  signal new_param_NFFT_rfdc : std_logic;

  -- RFdc configuration-parameter signals
  signal param_adc_channel_shifting_ch0 : std_logic_vector(4 downto 0);
  signal new_param_adc_channel_shifting_ch0 : std_logic;
  signal param_adc_channel_shifting_ch1 : std_logic_vector(4 downto 0);
  signal new_param_adc_channel_shifting_ch1 : std_logic;
  signal param_dac_channel_shifting : std_logic_vector(4 downto 0);
  signal new_param_dac_channel_shifting : std_logic;
  signal ADCxN_locked_AXIclk : std_logic := '0';

  -- cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup
  signal current_lclk_count_int_AXIclk : std_logic_vector(63 downto 0):=(others => '0');
  signal ADC_FSM_status_AXIclk : std_logic_vector(31 downto 0):=(others => '0');
  signal ADC_FSM_new_status_AXIclk : std_logic:='0';
  signal ADC_FSM_status_read_AXIclk : std_logic:='0';
  signal ADC_FSM_status_read_s : std_logic:='0';
  signal out_data_available : std_logic;

  -- sw generated system-wide reset related sugnals
  signal generate_new_system_reset : std_logic := '0';
  signal system_reset_generated : std_logic := '0';
  signal system_reset_from_sw_counter : unsigned(cnt_sw_system_reset_duration'range) := (others => '0');

begin

  -- ***********************************************************
  -- management of the ad9361 and timestamping logic inputs [@ADCxN_clk]
  -- ***********************************************************

  -- process registering 'current_lclk_count'
  process(ADCxN_clk)
  begin
    if rising_edge(ADCxN_clk) then
      current_lclk_count_int <= current_lclk_count;
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- management of the slave AXI-lite bus interface [s00_axi] -> reception of the configuration parameters from the ARM
  -- ***************************************************

  -- process that generates 'axi_lite_awready'
  --  + it is asserted for one clock cycle (@s00_axi_aclk) when both 's00_axi_awvalid' and 's00_axi_wvalid' are asserted
  --  + it is deasserted during reset
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        axi_lite_awready <= '0';
        mem_mapped_reg_addr_write_enable <= '1';
      else
        if axi_lite_awready = '0' and s00_axi_awvalid = '1' and s00_axi_wvalid = '1' and mem_mapped_reg_addr_write_enable = '1' then
          -- the slave is ready to accept a new write address when there are valid input write address and write data values; no outstanding transactions are expected
          axi_lite_awready <= '1';
        elsif s00_axi_bready = '1' and axi_lite_bvalid = '1' then
          mem_mapped_reg_addr_write_enable <= '1';
          axi_lite_awready <= '0';
        else
          axi_lite_awready <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process that latches 's00_axi_awaddr'
  --   + the address is latched when both 's00_axi_awvalid' and 's00_axi_wvalid' are valid
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        axi_lite_awaddr <= (others => '0');
      else
        if axi_lite_awready = '0' and s00_axi_awvalid = '1' and s00_axi_wvalid = '1' and mem_mapped_reg_addr_write_enable = '1' then
          -- write address latching
          axi_lite_awaddr <= s00_axi_awaddr;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process that generates 'axi_lite_wready'
  --  + it is asserted for one clock cycle (@s00_axi_aclk) when both 's00_axi_awvalid' and 's00_axi_wvalid' are asserted
  --  + it is deasserted during reset
  process(s00_axi_aclk, s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        axi_lite_wready <= '0';
      else
        if axi_lite_wready = '0' and s00_axi_awvalid = '1' and s00_axi_wvalid = '1' and mem_mapped_reg_addr_write_enable = '1' then
          -- the slave is ready to accept write data when there are valid input write address and write data values; no outstanding transactions are expected
          axi_lite_wready <= '1';
        else
          axi_lite_wready <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- concurrent generation of the memory mapped register select for write transactions
  --   + write data is accepted and written to the registers when 'axi_lite_awready', 's00_axi_wvalid', 'axi_lite_wready' and 's00_axi_awvalid' are asserted.
  mem_mapped_reg_write_enable <= axi_lite_awready and s00_axi_wvalid and axi_lite_wready and s00_axi_awvalid;

  -- process managing the writing to the memory mapped registers
  --   + @TO_BE_TESTED: fixed 32-bit write operations are implemented (i.e, s00_axi_wstrb [byte-enable signal] is not used)
  --   + the associated valid signals just indicate that data has been written to the register, but no formal verification of the written values is conducted here
  --   + the registers are cleared during reset
  --   + the slave register write enable is asserted when both valid address and data values are available and the slave is ready to accept write address and data values
  process(s00_axi_aclk, s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        -- FFT mm-registers
        FFT_mem_mapped_reg_4 <= (others => '0');             -- used for providing FFT size for RFdc ADC decimation block
        FFT_mem_mapped_reg_4_data_valid <= '0';
        -- RFdc configuration mm-registes
        RFdc_mem_mapped_reg_0 <= (others => '0');            -- storage of 'adc_channel_shifting_ch0'
        RFdc_mem_mapped_reg_0_data_valid <= '0';
        RFdc_mem_mapped_reg_1 <= (others => '0');            -- storage of 'adc_channel_shifting_ch1'
        RFdc_mem_mapped_reg_1_data_valid <= '0';
        RFdc_mem_mapped_reg_2 <= (others => '0');            -- storage of 'dac_channel_shifting'
        RFdc_mem_mapped_reg_2_data_valid <= '0';
        RFdc_mem_mapped_reg_7 <= (others => '0');
        -- srs_UE_AXI_control_unit mm-registers
        srsUE_AXI_ctrl_mem_mapped_reg_0 <= (others => '0');  -- timestamped DAC late flag register
        srsUE_AXI_ctrl_mem_mapped_reg_0_data_valid <= '0';
        srsUE_AXI_ctrl_mem_mapped_reg_1 <= (others => '0');  -- timestamped DAC FSM status register
        srsUE_AXI_ctrl_mem_mapped_reg_1_data_valid <= '0';
        srsUE_AXI_ctrl_mem_mapped_reg_2 <= (others => '0');  -- register indicating a PS-write error status
        srsUE_AXI_ctrl_mem_mapped_reg_2_data_valid <= '0';
        srsUE_AXI_ctrl_mem_mapped_reg_3 <= (others => '0');  -- PSS status register (i.e., PSS found and PSS not found flags [both on the LSB])
        srsUE_AXI_ctrl_mem_mapped_reg_3_data_valid <= '0';
        srsUE_AXI_ctrl_mem_mapped_reg_4 <= (others => '0');  -- timestamped ADC FSM status register
        srsUE_AXI_ctrl_mem_mapped_reg_4_data_valid <= '0';
        srsUE_AXI_ctrl_mem_mapped_reg_5 <= (others => '0');  -- FPGA timestamp LSB bits
        srsUE_AXI_ctrl_mem_mapped_reg_6 <= (others => '0');  -- FPGA timestamp MSB bits
        srsUE_AXI_ctrl_mem_mapped_reg_7 <= (others => '0');  -- system-wide control signals
        srsUE_AXI_ctrl_mem_mapped_reg_8 <= (others => '0');  -- build date (filled by TCL build-script)
        srsUE_AXI_ctrl_mem_mapped_reg_9 <= (others => '0');  -- build time (filled by TCL build-script)
        srsUE_AXI_ctrl_mem_mapped_reg_10 <= (others => '0'); -- build commit hash (filled by TCL build-script)
        generate_new_system_reset <= '0';
      else

        srsUE_AXI_ctrl_mem_mapped_reg_8  <= G_BUILD_DATE;
        srsUE_AXI_ctrl_mem_mapped_reg_9  <= G_BUILD_TIME;
        srsUE_AXI_ctrl_mem_mapped_reg_10 <= G_BUILD_COMMIT_HASH;

        generate_new_system_reset <= '0';

        srsUE_AXI_ctrl_mem_mapped_reg_5 <= current_lclk_count_int_AXIclk(31 downto 0);
        srsUE_AXI_ctrl_mem_mapped_reg_6 <= current_lclk_count_int_AXIclk(63 downto 32);
        RFdc_mem_mapped_reg_7(0)          <= ADCxN_locked_AXIclk;
        RFdc_mem_mapped_reg_8(1 downto 0) <= nof_adc_dma_channels;

        -- when we receive new data from the PS we must check to which memory-mapped register it goes to
        if mem_mapped_reg_write_enable = '1' then
          -- let's write to the addressed register
          case axi_lite_awaddr(10 downto 7) is
            when cnt_FFT_mem_mapped_base_address =>   -- the PS is configuring the FFT block
              case axi_lite_awaddr(6 downto 2) is
                when cnt_mem_mapped_reg4_address =>    -- data will be written to reg_4
                  FFT_mem_mapped_reg_4 <= s00_axi_wdata;
                  FFT_mem_mapped_reg_4_data_valid <= '1';
                when others =>                         -- invalid write address: we notifiy it through status register 0; @TO_BE_IMPROVED: better handling of this error
                  srsUE_AXI_ctrl_mem_mapped_reg_2 <= x"0000FFFF";
                  srsUE_AXI_ctrl_mem_mapped_reg_2_data_valid <= '1';
              end case;

            when cnt_RFdc_mem_mapped_base_address => -- the PS is configuring the RFdc-related processing
              case axi_lite_awaddr(6 downto 2) is
                when cnt_mem_mapped_reg0_address =>
                  RFdc_mem_mapped_reg_0 <= s00_axi_wdata;
                  RFdc_mem_mapped_reg_0_data_valid <= '1';
                when cnt_mem_mapped_reg1_address =>
                  RFdc_mem_mapped_reg_1 <= s00_axi_wdata;
                  RFdc_mem_mapped_reg_1_data_valid <= '1';
                when cnt_mem_mapped_reg2_address =>
                  RFdc_mem_mapped_reg_2 <= s00_axi_wdata;
                  RFdc_mem_mapped_reg_2_data_valid <= '1';
                when others =>
                  srsUE_AXI_ctrl_mem_mapped_reg_2 <= x"0001FFFF";
                  srsUE_AXI_ctrl_mem_mapped_reg_2_data_valid <= '1';
              end case;

            when cnt_srs_axi_control_mem_mapped_base_address =>
              if axi_lite_awaddr(6 downto 2) = cnt_mem_mapped_reg7_address then
                if srsUE_AXI_ctrl_mem_mapped_reg_7(0) = '0' and s00_axi_wdata(0) = '1' then
                  generate_new_system_reset <= '1';
                end if;
              else
                srsUE_AXI_ctrl_mem_mapped_reg_2 <= x"0001FFFF";
                srsUE_AXI_ctrl_mem_mapped_reg_2_data_valid <= '1';
              end if;

            when others =>                         -- invalid write address: we notifiy it through status register 0; @TO_BE_IMPROVED: better handling of this error
              srsUE_AXI_ctrl_mem_mapped_reg_2 <= x"000FFFFF";
              srsUE_AXI_ctrl_mem_mapped_reg_2_data_valid <= '1';
          end case;
        -- when we know that the FFT configuration data has been correctly processed we can deassert the valid signal for reg_0 and reg_1 (i.e., wait until new configuration data arrives)
        else
          if param_NFFT_rfdc_received = '1' then
            FFT_mem_mapped_reg_4_data_valid <= '0';
          end if;
          -- when we know that the 'adc_channel_shifting_ch0' value has been correctly processed we can deassert the valid signal for reg_1 (i.e., wait until a new N_ID_2 value arrives)
          if new_param_adc_channel_shifting_ch0 = '1' then
            RFdc_mem_mapped_reg_0_data_valid <= '0';
          end if;
          -- when we know that the 'adc_channel_shifting_ch1' value has been correctly processed we can deassert the valid signal for reg_1 (i.e., wait until a new N_ID_2 value arrives)
          if new_param_adc_channel_shifting_ch1 = '1' then
            RFdc_mem_mapped_reg_1_data_valid <= '0';
          end if;
          -- when we know that the 'dac_channel_shifting' value has been correctly processed we can deassert the valid signal for reg_1 (i.e., wait until a new N_ID_2 value arrives)
          if new_param_dac_channel_shifting = '1' then
            RFdc_mem_mapped_reg_2_data_valid <= '0';
          end if;

          -- when the 'dac_fifo_timestamp_enabler' block notifies a late situation, we will assert the 'late' flag
          if DAC_new_late = '1' then
            srsUE_AXI_ctrl_mem_mapped_reg_0(0) <= DAC_late_flag;
            srsUE_AXI_ctrl_mem_mapped_reg_0_data_valid <= '1';
          -- when we know that the status register 0 has been read by PS we can deassert the valid signal
          elsif mem_mapped_reg_read_enable = '1' and axi_lite_araddr(10 downto 7) = cnt_srs_axi_control_mem_mapped_base_address and axi_lite_araddr(6 downto 2) = cnt_mem_mapped_reg0_address then
            srsUE_AXI_ctrl_mem_mapped_reg_0_data_valid <= '0';
          end if;

          -- when a new status is reported by the central FSM of 'dac_fifo_timestamp_enabler', we will update the internal related status register
          if DAC_FSM_new_status = '1' then
            srsUE_AXI_ctrl_mem_mapped_reg_1 <= DAC_FSM_status;
            srsUE_AXI_ctrl_mem_mapped_reg_1_data_valid <= '1';
          -- when we know that the status register 1 has been read by PS we can deassert the valid signal
          elsif  mem_mapped_reg_read_enable = '1' and axi_lite_araddr(10 downto 7) = cnt_srs_axi_control_mem_mapped_base_address and axi_lite_araddr(6 downto 2) = cnt_mem_mapped_reg1_address then
            srsUE_AXI_ctrl_mem_mapped_reg_1_data_valid <= '0';
          end if;

          -- when we know that the status register 2 has been read by PS we can deassert the valid signal
          if mem_mapped_reg_read_enable = '1' and axi_lite_araddr(10 downto 7) = cnt_srs_axi_control_mem_mapped_base_address and axi_lite_araddr(6 downto 2) = cnt_mem_mapped_reg2_address then
            srsUE_AXI_ctrl_mem_mapped_reg_2_data_valid <= '0';
          end if;

          if ADC_FSM_new_status_AXIclk = '1' then
            srsUE_AXI_ctrl_mem_mapped_reg_4 <= ADC_FSM_status_AXIclk;
            srsUE_AXI_ctrl_mem_mapped_reg_4_data_valid <= '1';
            -- when we know that the status register 2 has been read by PS we can deassert the valid signal
          elsif mem_mapped_reg_read_enable = '1' and axi_lite_araddr(10 downto 7) = cnt_srs_axi_control_mem_mapped_base_address and axi_lite_araddr(6 downto 2) = cnt_mem_mapped_reg4_address then
            srsUE_AXI_ctrl_mem_mapped_reg_4_data_valid <= '0';
          end if;

          if system_reset_generated = '1' then
            srsUE_AXI_ctrl_mem_mapped_reg_7(0) <= '0';
          end if;
        end if;

      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating the write response
  --   + the write response and response valid signals are asserted when 'axi_lite_wready', 's00_axi_wvalid', 'axi_lite_awready' and 's00_axi_awvalid' are asserted
  --   + these signals mark the acceptance of the write address and indicate the status of the write transaction
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        axi_lite_bvalid <= '0';
        axi_lite_bresp <= "00";
      else
        if axi_lite_awready = '1' and s00_axi_awvalid = '1' and axi_lite_wready = '1' and s00_axi_wvalid = '1' and axi_lite_bvalid = '0' then
          axi_lite_bvalid <= '1';
          axi_lite_bresp <= "00";  -- 'OK' response; @TO_BE_IMPROVED: handle other write responses
        elsif s00_axi_bready = '1' and axi_lite_bvalid = '1' then -- check if bready is asserted while bvalid is high; there is a possibility that bready is always asserted high
          axi_lite_bvalid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'axi_lite_arready'
  --   + it is asserted for one clock cycle (@s00_axi_aclk) when 's00_axi_arvalid' is asserted
  --   + it is deasserted during reset
  --   + the read address is also latched when 's00_axi_arvalid' is asserted; the latch is cleared (-1) during reset
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        axi_lite_arready <= '0';
        axi_lite_araddr  <= (others => '1');
      else
        if axi_lite_arready = '0' and s00_axi_arvalid = '1' then
          -- indicates that the slave has acceped the valid read address
          axi_lite_arready <= '1';
          -- read address latching
          axi_lite_araddr <= s00_axi_araddr;
        else
          axi_lite_arready <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'axi_lite_rvalid'
  --   + it is asserted for one clock cycle (@s00_axi_aclk) when both 's00_axi_arvalid' and 'axi_lite_arready' are asserted
  --   + the memory mapped registers' data is available on the output data bus when 'axi_lite_rvalid' is asserted; it, thus, marks its validity
  --   + 'axi_lite_rresp' indicates the status of the read transaction
  --   + both signals are cleared during reset
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        axi_lite_rvalid <= '0';
        axi_lite_rresp  <= "00";
      else
        if out_data_available = '1' and axi_lite_rvalid = '0' then
          -- valid read data is available at the read data bus
          axi_lite_rvalid <= '1';
          axi_lite_rresp  <= "00"; -- 'OK' response; @TO_BE_IMPROVED: handle other read responses
        elsif axi_lite_rvalid = '1' and s00_axi_rready = '1' then
          -- read data is accepted by the master
          axi_lite_rvalid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- concurrent generation of the memory mapped register select for read transactions
  --   + read data is procured from the registers when 'axi_lite_arready' and 's00_axi_arvalid' are asserted and 'axi_lite_rvalid' is not (i.e., avoiding conflicts on the output data bus).
  mem_mapped_reg_read_enable <= axi_lite_arready and s00_axi_arvalid and (not axi_lite_rvalid);

  -- process managing the reading from the memory mapped registers
  --   + @TO_BE_TESTED: fixed 32-bit write operations are implemented (i.e, s00_axi_wstrb [byte-enable signal] is not used)
  --   + this process is not synchronous to avoid adding any further latency to the read transaction
  --   + the latches are initialized during reset
  --   + the register's read enable is asserted when a valid address is available and the slave is ready to accept the read address
  process(axi_lite_araddr, s00_axi_aresetn, mem_mapped_reg_read_enable,
          FFT_mem_mapped_reg_4, srsUE_AXI_ctrl_mem_mapped_reg_0, srsUE_AXI_ctrl_mem_mapped_reg_1,
          srsUE_AXI_ctrl_mem_mapped_reg_2, srsUE_AXI_ctrl_mem_mapped_reg_3, srsUE_AXI_ctrl_mem_mapped_reg_4,
          srsUE_AXI_ctrl_mem_mapped_reg_5, srsUE_AXI_ctrl_mem_mapped_reg_6, srsUE_AXI_ctrl_mem_mapped_reg_7,
          srsUE_AXI_ctrl_mem_mapped_reg_8, srsUE_AXI_ctrl_mem_mapped_reg_9, srsUE_AXI_ctrl_mem_mapped_reg_10, 
          RFdc_mem_mapped_reg_0, RFdc_mem_mapped_reg_1, RFdc_mem_mapped_reg_2, RFdc_mem_mapped_reg_7, RFdc_mem_mapped_reg_8
  )
  begin
    -- let's read from the addressed register
    case axi_lite_araddr(10 downto 7) is
      when cnt_FFT_mem_mapped_base_address =>                    -- the PS is reading the FFT configuration registers
        case axi_lite_araddr(6 downto 2) is
          when cnt_mem_mapped_reg4_address =>    -- data will be read from reg_4
            mem_mapped_reg_data_out <= FFT_mem_mapped_reg_4;
          when others =>                         -- e.g., unknown state during initialization of the system; @TO_BE_IMPROVED: handle this error
            mem_mapped_reg_data_out <= (others => '0');
        end case;

      when cnt_srs_axi_control_mem_mapped_base_address => -- the PS is accessing the srsUE status registers
        case axi_lite_araddr(6 downto 2) is
          when cnt_mem_mapped_reg0_address =>    -- data will be read from reg_0 (timestamped DAC late flag)
            if srsUE_AXI_ctrl_mem_mapped_reg_0_data_valid = '1' then
              mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_0;
            else
              mem_mapped_reg_data_out <= (others => '0');
            end if;
          when cnt_mem_mapped_reg1_address =>    -- data will be read from reg_1 (timestamped DAC FSM status register)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_1;
          when cnt_mem_mapped_reg2_address =>    -- data will be read from reg_2 (PS write-error registers)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_2;
          when cnt_mem_mapped_reg3_address =>    -- data will be read from reg_3 (PSS status registers)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_3;
          when cnt_mem_mapped_reg4_address =>    -- data will be read from reg_4 (PSS status registers)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_4;
          when cnt_mem_mapped_reg5_address =>    -- data will be read from reg_5 (timestamp LSBs)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_5;
          when cnt_mem_mapped_reg6_address =>    -- data will be read from reg_6 (timestamp MSBs)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_6;
          when cnt_mem_mapped_reg7_address =>    -- data will be read from reg_7 (system-wide control signals)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_7;
          when cnt_mem_mapped_reg8_address =>    -- data will be read from reg_8 (system-wide control signals)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_8;
          when cnt_mem_mapped_reg9_address =>    -- data will be read from reg_9 (system-wide control signals)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_9;
          when cnt_mem_mapped_reg10_address =>    -- data will be read from reg_10 (system-wide control signals)
            mem_mapped_reg_data_out <= srsUE_AXI_ctrl_mem_mapped_reg_10;
          when others =>                         -- e.g., unknown state during initialization of the system; @TO_BE_IMPROVED: handle this error
            mem_mapped_reg_data_out <= (others => '0');
        end case;

      when cnt_RFdc_mem_mapped_base_address =>                    -- the PS is reading the RFdc configuration registers
        case axi_lite_araddr(6 downto 2) is
          when cnt_mem_mapped_reg0_address =>    -- data will be read from reg_0
            mem_mapped_reg_data_out <= RFdc_mem_mapped_reg_0;
          when cnt_mem_mapped_reg1_address =>    -- data will be read from reg_1
            mem_mapped_reg_data_out <= RFdc_mem_mapped_reg_1;
          when cnt_mem_mapped_reg2_address =>    -- data will be read from reg_2
            mem_mapped_reg_data_out <= RFdc_mem_mapped_reg_2;
          when cnt_mem_mapped_reg7_address =>    -- data will be read from reg_7
            mem_mapped_reg_data_out <= RFdc_mem_mapped_reg_7;
          when cnt_mem_mapped_reg8_address =>    -- data will be read from reg_8
            mem_mapped_reg_data_out <= RFdc_mem_mapped_reg_8;
          when others =>                         -- e.g., unknown state during initialization of the system; @TO_BE_IMPROVED: handle this error
            mem_mapped_reg_data_out <= (others => '0');
        end case;

      when others =>                         -- e.g., unknown state during initialization of the system; @TO_BE_IMPROVED: handle this error
        mem_mapped_reg_data_out <= (others => '0');
    end case;
  end process;

  -- process generating the register output data
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        axi_lite_rdata  <= (others => '0');
        out_data_available <= '0';
        DAC_FSM_status_read <= '0';
        ADC_FSM_status_read_AXIclk <= '0';
      else
        -- clear the 'ACK' signals
        DAC_FSM_status_read <= '0';
        ADC_FSM_status_read_AXIclk <= '0';
        -- clear AXI read-request related signals
        out_data_available <= '0';

        if mem_mapped_reg_read_enable = '1' then
          -- output the read data when there is a valid read address ('s00_axi_arvalid'') with acceptance of read address by the slave ('axi_lite_arready')
          axi_lite_rdata     <= mem_mapped_reg_data_out;
          out_data_available <= '1';
          -- check whether the CPU is reading internal registers or memory
          
          -- check if any 'ACK' signal needs to be asserted
          if axi_lite_araddr(10 downto 7) = cnt_srs_axi_control_mem_mapped_base_address then
            if axi_lite_araddr(6 downto 2) = cnt_mem_mapped_reg1_address then
              DAC_FSM_status_read <= '1'; -- let's ACK the read of the FSM status register
            elsif axi_lite_araddr(6 downto 2) = cnt_mem_mapped_reg4_address then
               ADC_FSM_status_read_AXIclk <= '1'; -- let's ACK the read of the FSM status register
            end if;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- mapping of the internal signals to the corresponding output ports
  s00_axi_awready <= axi_lite_awready;
  s00_axi_wready <= axi_lite_wready;
  s00_axi_bresp	<= axi_lite_bresp;
  s00_axi_bvalid <= axi_lite_bvalid;
  s00_axi_arready <= axi_lite_arready;
  s00_axi_rdata <= axi_lite_rdata;
  s00_axi_rresp	<= axi_lite_rresp;
  s00_axi_rvalid <= axi_lite_rvalid;

  -- process managing sw-generated system reset
  process(s00_axi_aclk)
  begin
    if rising_edge(s00_axi_aclk) then
      -- default values
      system_reset_generated <= '0';
      sw_generated_resetn <= '1';
      --
      if generate_new_system_reset = '1' and system_reset_from_sw_counter = cnt_sw_system_reset_zero then
        system_reset_generated <= '1';
        system_reset_from_sw_counter <= system_reset_from_sw_counter + cnt_sw_system_reset_incrmnt;
        sw_generated_resetn <= '0';
      elsif system_reset_from_sw_counter > cnt_sw_system_reset_zero and
            system_reset_from_sw_counter < cnt_sw_system_reset_duration then
        system_reset_from_sw_counter <= system_reset_from_sw_counter + cnt_sw_system_reset_incrmnt;
        sw_generated_resetn <= '0';
      elsif system_reset_from_sw_counter = cnt_sw_system_reset_duration then
        system_reset_from_sw_counter <= cnt_sw_system_reset_zero;
      end if;
    end if;
  end process;

  -- ***************************************************
  -- [FFT] management of the output ports driving the 'rfdc_adc_data_decim_and_depack' block
  -- ***************************************************

  new_param_NFFT_rfdc <= param_NFFT_rfdc_received and param_NFFT_rfdc_valid;

  -- processing new NFFT param passed for 'rfdc_adc_data_decim_and_depack' block
  process(s00_axi_aclk, s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        param_NFFT_rfdc_received <= '0';
        param_NFFT_rfdc_valid <= '0';
      else
        param_NFFT_rfdc_received <= '0';
        param_NFFT_rfdc_valid <= '0';

        -- we will forward any new FFT configuration that is received, if it is valid
        if FFT_mem_mapped_reg_4_data_valid = '1' and param_NFFT_rfdc_received = '0' then
          param_NFFT_rfdc_received <= '1';
          case FFT_mem_mapped_reg_4 is
            when cnt_128_32b =>
              param_NFFT_rfdc <= cnt_128_FFT_points_3b;
              param_NFFT_rfdc_valid <= '1';
            when cnt_256_32b =>
              param_NFFT_rfdc <= cnt_256_FFT_points_3b;
              param_NFFT_rfdc_valid <= '1';
            when cnt_512_32b =>
              param_NFFT_rfdc <= cnt_512_FFT_points_3b;
              param_NFFT_rfdc_valid <= '1';
            when cnt_1024_32b =>
              param_NFFT_rfdc <= cnt_1024_FFT_points_3b;
              param_NFFT_rfdc_valid <= '1';
            when cnt_2048_32b =>
              param_NFFT_rfdc <= cnt_2048_FFT_points_3b;
              param_NFFT_rfdc_valid <= '1';
            when others =>     -- the received 'N_FFT' parameter is not valid
              param_NFFT_rfdc_valid <= '0';
          end case;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process driving the output interface to 'rfdc_adc_data_decim_and_depack'
  process(s00_axi_aclk, s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        rfdc_N_FFT_param <= (others => '0');
        rfdc_N_FFT_valid <= '0';
      else
        -- we will forward any new FFT configuration that is received
        if new_param_NFFT_rfdc = '1' then
          rfdc_N_FFT_param <= param_NFFT_rfdc;
          rfdc_N_FFT_valid <= '1';
        else
          rfdc_N_FFT_valid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- [RFdc] management of the RFdc configuration parameters
  -- ***************************************************

  -- process managing the 'param_adc_channel_shifting_ch0' parameter-related signals
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        param_adc_channel_shifting_ch0 <= (others => '0');
        new_param_adc_channel_shifting_ch0 <= '0';
      else
        -- when a new 'adc_channel_shifting_ch0' parameter has been received, we will update the 'configurable_adc_16bit_readjusment' configuration-related signals
        if RFdc_mem_mapped_reg_0_data_valid = '1' then
          param_adc_channel_shifting_ch0 <= RFdc_mem_mapped_reg_0(4 downto 0);
          new_param_adc_channel_shifting_ch0 <= '1';
        else
          new_param_adc_channel_shifting_ch0 <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 'param_adc_channel_shifting_ch0' outputs
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        adc_channel_shifting_ch0 <= (others => '0');
        adc_channel_shifting_ch0_valid <= '0';
      else
        -- when a new 'adc_channel_shifting_ch0' parameter has been received, we will update the 'configurable_adc_16bit_readjusment' configuration-related signals
        if new_param_adc_channel_shifting_ch0 = '1' then
          adc_channel_shifting_ch0 <= param_adc_channel_shifting_ch0;
          adc_channel_shifting_ch0_valid <= '1';
        else
          adc_channel_shifting_ch0_valid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 'param_adc_channel_shifting_ch1' parameter-related signals
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        param_adc_channel_shifting_ch1 <= (others => '0');
        new_param_adc_channel_shifting_ch1 <= '0';
      else
        -- when a new 'adc_channel_shifting_ch1' parameter has been received, we will update the 'configurable_adc_16bit_readjusment' configuration-related signals
        if RFdc_mem_mapped_reg_1_data_valid = '1' then
          param_adc_channel_shifting_ch1 <= RFdc_mem_mapped_reg_1(4 downto 0);
          new_param_adc_channel_shifting_ch1 <= '1';
        else
          new_param_adc_channel_shifting_ch1 <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 'param_adc_channel_shifting_ch1' outputs
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        adc_channel_shifting_ch1 <= (others => '0');
        adc_channel_shifting_ch1_valid <= '0';
      else
        -- when a new 'adc_channel_shifting_ch1' parameter has been received, we will update the 'configurable_adc_16bit_readjusment' configuration-related signals
        if new_param_adc_channel_shifting_ch1 = '1' then
          adc_channel_shifting_ch1 <= param_adc_channel_shifting_ch1;
          adc_channel_shifting_ch1_valid <= '1';
        else
          adc_channel_shifting_ch1_valid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 'param_dac_channel_shifting' parameter-related signals
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        param_dac_channel_shifting <= (others => '0');
        new_param_dac_channel_shifting <= '0';
      else
        -- when a new 'dac_channel_shifting' parameter has been received, we will update the 'configurable_dac_16bit_readjusment' configuration-related signals
        if RFdc_mem_mapped_reg_2_data_valid = '1' then
          param_dac_channel_shifting <= RFdc_mem_mapped_reg_2(4 downto 0);
          new_param_dac_channel_shifting <= '1';
        else
          new_param_dac_channel_shifting <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the 'param_dac_channel_shifting' outputs
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        dac_channel_shifting <= (others => '0');
        dac_channel_shifting_valid <= '0';
      else
        -- when a new 'dac_channel_shifting' parameter has been received, we will update the 'configurable_dac_16bit_readjusment' configuration-related signals
        if new_param_dac_channel_shifting = '1' then
          dac_channel_shifting <= param_dac_channel_shifting;
          dac_channel_shifting_valid <= '1';
        else
          dac_channel_shifting_valid <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- block instances
  -- ***************************************************


  -- cross-clock domain sharing of 'current_lclk_count_int'
  synchronizer_current_lclk_count_int_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_64b
    generic map (
      --DATA_WIDTH	=> 64,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => current_lclk_count_int,
      src_data_valid => '1', -- inputs will be always valid
      dst_clk => s00_axi_aclk,
      dst_data => current_lclk_count_int_AXIclk,
      dst_data_valid => open -- not needed
    );

  -- cross-clock domain sharing of 'ADC_FSM_status'
  synchronizer_ADC_FSM_status_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_32b
    generic map (
      --DATA_WIDTH	=> 32,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => ADC_FSM_status,
      src_data_valid => '1', -- inputs will be always valid
      dst_clk => s00_axi_aclk,
      dst_data => ADC_FSM_status_AXIclk,
      dst_data_valid => open -- not needed
    );

  -- cross-clock domain sharing of 'ADC_FSM_new_status'
  synchronizer_ADC_FSM_new_status_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data(0) => ADC_FSM_new_status,
      src_data_valid => '1', -- inputs will be always valid
      dst_clk => s00_axi_aclk,
      dst_data(0) => ADC_FSM_new_status_AXIclk,
      dst_data_valid => open -- not needed
    );

  -- cross-clock domain sharing of 'ADC_FSM_status_read'
  synchronizer_ADC_FSM_status_read_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      --DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s00_axi_aclk,
      src_data(0) => '1',
      src_data_valid => ADC_FSM_status_read_AXIclk,
      dst_clk => ADCxN_clk,
      dst_data => open,
      dst_data_valid => ADC_FSM_status_read_s
    );
    -- apply reset to important cross-clock domain control signals
    ADC_FSM_status_read <= ADC_FSM_status_read_s when ADCxN_reset = '0' else
                           '0';

  -- cross-clock domain sharing of 'ADCxN_locked
  synchronizer_ADCxN_locked_ins : multibit_cross_clock_domain_fifo_synchronizer_resetless_1b
    generic map (
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data(0) => ADCxN_locked,
      src_data_valid => '1', -- always valid
      dst_clk => s00_axi_aclk,
      dst_data(0) => ADCxN_locked_AXIclk,
      dst_data_valid => open
  );

end arch_srs_axi_control_RTL_impl;
