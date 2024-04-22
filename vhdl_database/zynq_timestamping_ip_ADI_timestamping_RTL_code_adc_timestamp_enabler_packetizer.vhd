library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all; -- We do use signed arithmetic
use IEEE.numeric_std.all;

-- I/O libraries * SIMULATION ONLY *
use STD.textio.all;
use ieee.std_logic_textio.all;

--! Whereas a configuration up to 2x2 (i.e., 4 channels) is supported, the basic functionality of the
--! block needs to work for the most reduced possible configuration (i.e., 1x1 or 2 channels, as provided
--! by AD9364). Hence, even if it is not optimum, the provision of the synhronization header and
--! timestamp value will always use two single DAC channels (i.e., 32 bits or i0 & q0) and, thus, require
--! eight clock cycles to be completed.
entity adc_timestamp_enabler_packetizer is
  generic (
    c_AXI_ADDR_WIDTH    : integer := 16;
    c_AXIS_NOF_CHANNELS : integer := 1
  );
  port (
    -- **********************************
    -- clock and reset signals governing the ADC sample provision
    -- **********************************
    ADCxN_clk   : in std_logic;                                      --! ADC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_reset : in std_logic;                                      --! ADC high-active reset signal (mapped to the ADC clock xN domain [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADC_clk_division : in std_logic;                                 --! Indicates the division factor between the sampling clock and input clock (i.e., '1' indicates N = 2 or 1x1, '0' indicates N = 4 or 2x2)

    -- **********************************
    -- custom timestamping ports
    -- **********************************
    current_lclk_count : in std_logic_vector(63 downto 0);           --! Current ADC clock cycle (i.e., current I/Q sample count) [@ADCxN_clk, even though the clock-ticks are based on @ADC_clk]

    -- ****************************
    -- interface to ADI AD936x
    -- ****************************

    -- input ports from axi_ad9361
    adc_valid_0 : in std_logic;                                      --! Valid signal for ADC data port 0
    adc_data_0 : in std_logic_vector(15 downto 0);                   --! ADC parallel data port 0 [16-bit I samples, Rx antenna 1]
    adc_valid_1 : in std_logic;                                      --! Valid signal for ADC data port 1
    adc_data_1 : in std_logic_vector(15 downto 0);                   --! ADC parallel data port 1 [16-bit Q samples, Rx antenna 1]
    adc_valid_2 : in std_logic;                                      --! Valid signal for ADC data port 2
    adc_data_2 : in std_logic_vector(15 downto 0);                   --! ADC parallel data port 2 [16-bit I samples, Rx antenna 2]
    adc_valid_3 : in std_logic;                                      --! Valid signal for ADC data port 3
    adc_data_3 : in std_logic_vector(15 downto 0);                   --! ADC parallel data port 3 [16-bit Q samples, Rx antenna 2]

    nof_adc_dma_channels : out std_logic_vector(1 downto 0);         --! Number of ADC channels forwarded to a DMA IP

    -- ************************************
    -- AXI4-Lite configuration interface
    -- ************************************

    -- Clock and Reset axi
    axi_aclk    : in std_logic;
    axi_aresetn : in std_logic;
    -- AXI Write Address Channel
    s_axi_awaddr  : in std_logic_vector(c_AXI_ADDR_WIDTH - 1 downto 0);
    s_axi_awprot  : in std_logic_vector(2 downto 0);
    s_axi_awvalid : in std_logic;
    s_axi_awready : out std_logic;
    -- AXI Write Data Channel
    s_axi_wdata  : in std_logic_vector(31 downto 0);
    s_axi_wstrb  : in std_logic_vector(3 downto 0);
    s_axi_wvalid : in std_logic;
    s_axi_wready : out std_logic;
    -- AXI Read Address Channel
    s_axi_araddr  : in std_logic_vector(c_AXI_ADDR_WIDTH - 1 downto 0);
    s_axi_arprot  : in std_logic_vector(2 downto 0);
    s_axi_arvalid : in std_logic;
    s_axi_arready : out std_logic;
    -- AXI Read Data Channel
    s_axi_rdata  : out std_logic_vector(31 downto 0);
    s_axi_rresp  : out std_logic_vector(1 downto 0);
    s_axi_rvalid : out std_logic;
    s_axi_rready : in std_logic;
    -- AXI Write Response Channel
    s_axi_bresp  : out std_logic_vector(1 downto 0);
    s_axi_bvalid : out std_logic;
    s_axi_bready : in std_logic;

    -- ************************************
    -- AXI4-Stream interface
    -- ************************************
    -- clock is the same as for ADC data, reset is low-active
    m_axis_tdata  : out std_logic_vector(2 * c_AXIS_NOF_CHANNELS * 32 - 1 downto 0);  --! Double the necessary width to support the required throughput
    m_axis_tready : in std_logic;
    m_axis_tvalid : out std_logic;
    m_axis_tlast  : out std_logic;
    data_fifo_rstn : out std_logic
  );
end adc_timestamp_enabler_packetizer;

architecture adc_timestamp_enabler_packetizer_RTL_impl of adc_timestamp_enabler_packetizer is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- PS-PL synchronization words
  constant cnt_1st_synchronization_word : std_logic_vector(31 downto 0):=x"bbbbaaaa";
  constant cnt_2nd_synchronization_word : std_logic_vector(31 downto 0):=x"ddddcccc";
  constant cnt_3rd_synchronization_word : std_logic_vector(31 downto 0):=x"ffffeeee";
  constant cnt_4th_synchronization_word : std_logic_vector(31 downto 0):=x"abcddcba";
  constant cnt_5th_synchronization_word : std_logic_vector(31 downto 0):=x"fedccdef";
  constant cnt_6th_synchronization_word : std_logic_vector(31 downto 0):=x"dfcbaefd";

  -- AXI related
  constant AXI_OKAY                     : std_logic_vector(1 downto 0) := "00";
  constant AXI_DECERR                   : std_logic_vector(1 downto 0) := "11";
  constant cnt_mem_mapped_reg0_address  : std_logic_vector(4 downto 0) :="00000";
  constant cnt_mem_mapped_reg1_address  : std_logic_vector(4 downto 0) :="00001";
  constant cnt_mem_mapped_reg2_address  : std_logic_vector(4 downto 0) :="00010";

  constant cnt_NUM_IQ_PER_WORD          : integer := 2;--c_AXIS_DATA_WIDTH / 32;

  constant cnt_1_1b : std_logic := '1';
  constant cnt_0_3b : unsigned(2 downto 0):="000";
  constant cnt_1_3b : unsigned(2 downto 0):="001";
  constant cnt_2_3b : unsigned(2 downto 0):="010";
  constant cnt_3_3b : unsigned(2 downto 0):="011";
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

  signal current_num_samples        : std_logic_vector(15 downto 0);
  signal current_num_samples_minus1 : std_logic_vector(15 downto 0);
  signal num_samples_count : std_logic_vector(15 downto 0);
  signal current_lclk_count_int : std_logic_vector(63 downto 0):=(others => '0');
  signal current_lclk_count_int_i : std_logic_vector(63 downto 0):=(others => '0');

  signal dma_packet_size_configured       : std_logic;
  signal current_dma_packet_size          : std_logic_vector(31 downto 0);
  signal current_dma_packet_size_int      : std_logic_vector(31 downto 0);
  signal current_dma_packet_size_ADCclk_s : std_logic_vector(31 downto 0) := (others => '0');
  signal current_dma_packet_size_ADCclk   : std_logic_vector(31 downto 0);
  signal new_dma_packet_size_val          : std_logic := '0';
  signal new_dma_packet_size_val_ADCclk   : std_logic := '0';
  signal new_dma_packet_size_val_ADCclk_latched : std_logic;

  signal data_forwarding_enabled          : std_logic;
  signal data_forwarding_enabled_int      : std_logic;
  signal new_data_forwarding_enabled_val  : std_logic;
  signal data_forwarding_enabled_ADCclk   : std_logic;
  signal data_forwarding_enabled_ADCclk_s : std_logic;
  signal new_data_forwarding_enabled_val_ADCclk : std_logic;
  signal new_data_forwarding_enabled_val_ADCclk_latched : std_logic;
  signal pending_forwarding_enable        : std_logic;
  signal pending_forwarding_enable_val    : std_logic;

  signal ongoing_packet_generation : std_logic;
  signal last_packet_sample : std_logic;

  --signal word_iq_sample_index : unsigned(2 downto 0);
  --signal word_iq_sample_index_plus_1 : unsigned(2 downto 0);
  signal word_iq_sample_index : std_logic := '0';

  signal data_fifo_reset_vector : std_logic_vector(15 downto 0);
  signal data_fifo_reset_int : std_logic;
  signal data_fifo_reset_ADCclk : std_logic;
  signal new_data_fifo_reset_pulse : std_logic;
  signal new_data_fifo_reset_pulse_ADCclk : std_logic;

  -- internal forwarding signals
  signal fwd_adc_valid_0_s : std_logic;
  signal fwd_adc_data_0_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_1_s : std_logic;
  signal fwd_adc_data_1_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_2_s : std_logic;
  signal fwd_adc_data_2_s : std_logic_vector(15 downto 0);
  signal fwd_adc_valid_3_s : std_logic;
  signal fwd_adc_data_3_s : std_logic_vector(15 downto 0);


  -- AXI signals
  signal s_axi_awready_r    : std_logic;
  signal s_axi_wready_r     : std_logic;
  signal s_axi_awaddr_reg_r : std_logic_vector(s_axi_awaddr'range);
  signal s_axi_bvalid_r     : std_logic;
  signal s_axi_bresp_r      : std_logic_vector(s_axi_bresp'range);
  signal s_axi_arready_r    : std_logic;
  signal s_axi_araddr_reg_r : std_logic_vector(s_axi_araddr'range);
  signal s_axi_rvalid_r     : std_logic;
  signal s_axi_rresp_r      : std_logic_vector(s_axi_rresp'range);
  signal s_axi_wdata_reg_r  : std_logic_vector(s_axi_wdata'range);
  signal s_axi_wstrb_reg_r  : std_logic_vector(s_axi_wstrb'range);
  signal s_axi_rdata_r      : std_logic_vector(s_axi_rdata'range);

begin

  process(axi_aclk)
  begin
    if rising_edge(axi_aclk) then
      nof_adc_dma_channels <= std_logic_vector(to_unsigned(c_AXIS_NOF_CHANNELS, nof_adc_dma_channels'length));
    end if; -- end of clk
  end process;

  ----------------------------------------------------------------------------
  -- AXI4-Lite read-transaction FSM
  --
  read_fsm : process(axi_aclk, axi_aresetn) is
    type t_state is (IDLE, READ_REGISTER, READ_RESPONSE, DONE);
    -- registered state variables
    variable v_state_r          : t_state;
    variable v_rdata_r          : std_logic_vector(31 downto 0);
    variable v_rresp_r          : std_logic_vector(s_axi_rresp'range);
    -- combinatorial helper variables
    variable v_addr_hit : boolean;

    begin
      if axi_aresetn = '0' then
        v_state_r          := IDLE;
        v_rdata_r          := (others => '0');
        v_rresp_r          := (others => '0');
        s_axi_arready_r    <= '0';
        s_axi_rvalid_r     <= '0';
        s_axi_rresp_r      <= (others => '0');
        s_axi_araddr_reg_r <= (others => '0');
        s_axi_rdata_r      <= (others => '0');
      elsif rising_edge(axi_aclk) then
        -- Default values:
        s_axi_arready_r <= '0';

        case v_state_r is
          -- Wait for the start of a read transaction, which is
          -- initiated by the assertion of ARVALID
          when IDLE =>
            s_axi_arready_r <= '1';

            if s_axi_arvalid = '1' then
              s_axi_araddr_reg_r <= s_axi_araddr; -- save the read address
              s_axi_arready_r    <= '1';          -- acknowledge the read-address
              v_state_r          := READ_REGISTER;
            end if;

          -- Read from the actual storage element
          when READ_REGISTER =>
            -- defaults:
            v_addr_hit := false;
            v_rdata_r  := (others => '0');

            -- register 'DMA_PACKET_SIZE' at address offset 0x00
            if s_axi_araddr_reg_r(6 downto 2) = cnt_mem_mapped_reg0_address then
              v_addr_hit := true;
              v_rdata_r(31 downto 0) := current_dma_packet_size;
              v_state_r := READ_RESPONSE;
            end if;
            -- register 'FORWARDING_ENABLED' at address offset 0x04
            if s_axi_araddr_reg_r(6 downto 2) = cnt_mem_mapped_reg1_address then
              v_addr_hit := true;
              v_rdata_r(0) := data_forwarding_enabled;
              v_rdata_r(31 downto 1) := (others => '0');
              v_state_r := READ_RESPONSE;
            end if;
            -- register 'RESET_DATA_FIFO' at address offset 0x08
            if s_axi_araddr_reg_r(6 downto 2) = cnt_mem_mapped_reg2_address then
              v_addr_hit := true;
              v_rdata_r(0) := data_fifo_reset_int;
              v_rdata_r(31 downto 1) := (others => '0');
              v_state_r := READ_RESPONSE;
            end if;
            --
            if v_addr_hit then
              v_rresp_r := AXI_OKAY;
            else
              v_rresp_r := AXI_DECERR;
              -- pragma translate_off
              report "ARADDR decode error" severity warning;
              -- pragma translate_on
              v_state_r := READ_RESPONSE;
            end if;

          -- Generate read response
          when READ_RESPONSE =>
            s_axi_rvalid_r <= '1';
            s_axi_rresp_r  <= v_rresp_r;
            s_axi_rdata_r  <= v_rdata_r;
            --
            v_state_r      := DONE;

            -- Write transaction completed, wait for master RREADY to proceed
          when DONE =>
            if s_axi_rready = '1' then
              s_axi_rvalid_r <= '0';
              s_axi_rdata_r   <= (others => '0');
              v_state_r      := IDLE;
            end if;
        end case;
      end if;
  end process read_fsm;

  ----------------------------------------------------------------------------
  -- AXI4-Lite write-transaction FSM
  --

  write_fsm : process(axi_aclk, axi_aresetn) is
    type t_state is (IDLE, ADDR_FIRST, DATA_FIRST, UPDATE_REGISTER, DONE);
    variable v_state_r  : t_state;
    variable v_addr_hit : boolean;
  begin
    if axi_aresetn = '0' then
       v_state_r          := IDLE;
       s_axi_awready_r    <= '0';
       s_axi_wready_r     <= '0';
       s_axi_awaddr_reg_r <= (others => '0');
       s_axi_wdata_reg_r  <= (others => '0');
       s_axi_wstrb_reg_r  <= (others => '0');
       s_axi_bvalid_r     <= '0';
       s_axi_bresp_r      <= (others => '0');
       --
       data_forwarding_enabled_int <= '0';
       new_data_forwarding_enabled_val <= '1';
       current_dma_packet_size_int <= (others => '0');
       new_dma_packet_size_val <= '1';
       data_fifo_reset_int <= '0';
       new_data_fifo_reset_pulse <= '1';
    elsif rising_edge(axi_aclk) then
      -- Default values:
      s_axi_awready_r <= '0';
      s_axi_wready_r  <= '0';
      new_dma_packet_size_val <= '0';
      new_data_forwarding_enabled_val <= '0';
      new_data_fifo_reset_pulse <= '0';

      case v_state_r is
        -- Wait for the start of a write transaction, which may be
        -- initiated by either of the following conditions:
        --   * assertion of both AWVALID and WVALID
        --   * assertion of AWVALID
        --   * assertion of WVALID
        when IDLE =>
          if s_axi_awvalid = '1' and s_axi_wvalid = '1' then
            s_axi_awaddr_reg_r <= s_axi_awaddr; -- save the write-address
            s_axi_awready_r    <= '1'; -- acknowledge the write-address
            s_axi_wdata_reg_r  <= s_axi_wdata; -- save the write-data
            s_axi_wstrb_reg_r  <= s_axi_wstrb; -- save the write-strobe
            s_axi_wready_r     <= '1'; -- acknowledge the write-data
            v_state_r          := UPDATE_REGISTER;
          elsif s_axi_awvalid = '1' then
            s_axi_awaddr_reg_r <= s_axi_awaddr; -- save the write-address
            s_axi_awready_r    <= '1'; -- acknowledge the write-address
            v_state_r          := ADDR_FIRST;
          elsif s_axi_wvalid = '1' then
            s_axi_wdata_reg_r <= s_axi_wdata; -- save the write-data
            s_axi_wstrb_reg_r <= s_axi_wstrb; -- save the write-strobe
            s_axi_wready_r    <= '1'; -- acknowledge the write-data
            v_state_r         := DATA_FIRST;
          end if;

          -- Address-first write transaction: wait for the write-data
        when ADDR_FIRST =>
          if s_axi_wvalid = '1' then
            s_axi_wdata_reg_r <= s_axi_wdata; -- save the write-data
            s_axi_wstrb_reg_r <= s_axi_wstrb; -- save the write-strobe
            s_axi_wready_r    <= '1'; -- acknowledge the write-data
            v_state_r         := UPDATE_REGISTER;
          end if;

        -- Data-first write transaction: wait for the write-address
        when DATA_FIRST =>
          if s_axi_awvalid = '1' then
            s_axi_awaddr_reg_r <= s_axi_awaddr; -- save the write-address
            s_axi_awready_r    <= '1'; -- acknowledge the write-address
            v_state_r          := UPDATE_REGISTER;
          end if;

        -- Update the actual storage element
        when UPDATE_REGISTER =>
          s_axi_bresp_r               <= AXI_OKAY; -- default value, may be overriden in case of decode error
          s_axi_bvalid_r              <= '1';
          --
          v_addr_hit := false;
          -- register 'DMA_PACKET_SIZE' at address offset 0x00
          if s_axi_awaddr_reg_r(6 downto 2) = cnt_mem_mapped_reg0_address then
            v_addr_hit := true;
            current_dma_packet_size_int <= s_axi_wdata_reg_r;
            new_dma_packet_size_val <= '1';
          end if;
          -- register 'FORWARDING_ENABLED' at address offset 0x04
          if s_axi_awaddr_reg_r(6 downto 2) = cnt_mem_mapped_reg1_address then
            v_addr_hit := true;
            data_forwarding_enabled_int <= s_axi_wdata_reg_r(0);
            new_data_forwarding_enabled_val <= '1';
          end if;
          -- register 'RESET_DATA_FIFO' at address offset 0x08
          if s_axi_awaddr_reg_r(6 downto 2) = cnt_mem_mapped_reg2_address then
            v_addr_hit := true;
            data_fifo_reset_int <= s_axi_wdata_reg_r(0);
            new_data_fifo_reset_pulse <= '1';
          end if;
          --
          if not v_addr_hit then
            s_axi_bresp_r <= AXI_DECERR;
            -- pragma translate_off
            report "AWADDR decode error" severity warning;
            -- pragma translate_on
          end if;
          --
          v_state_r := DONE;

        -- Write transaction completed, wait for master BREADY to proceed
        when DONE =>
          if s_axi_bready = '1' then
            s_axi_bvalid_r <= '0';
            v_state_r      := IDLE;
          end if;
      end case;
    end if;
  end process write_fsm;

  ----------------------------------------------------------------------------
  -- AXI4-Lite outputs
  --
  s_axi_awready <= s_axi_awready_r;
  s_axi_wready  <= s_axi_wready_r;
  s_axi_bvalid  <= s_axi_bvalid_r;
  s_axi_bresp   <= s_axi_bresp_r;
  s_axi_arready <= s_axi_arready_r;
  s_axi_rvalid  <= s_axi_rvalid_r;
  s_axi_rresp   <= s_axi_rresp_r;
  s_axi_rdata   <= s_axi_rdata_r;

  -- process controlling sw reset of data fifo attached to this block
  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        data_fifo_rstn <= '0';
        data_fifo_reset_vector <= (others => '1');
      else
        data_fifo_reset_vector <= '1' & data_fifo_reset_vector(15 downto 1);
        data_fifo_rstn <= data_fifo_reset_vector(0);
        if new_data_fifo_reset_pulse_ADCclk = '1' then
          data_fifo_reset_vector <= (others => '0');
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process registering 'current_lclk_count' and generating a delayed version
  process(ADCxN_clk)
  begin
    if rising_edge(ADCxN_clk) then
      -- * NOTE: 'current_lclk_count_int_i' delays the current 'current_lclk_count_int' value by one clock cycle, enabling the two clock-cyle insertion of the timestamp
      current_lclk_count_int_i <= current_lclk_count_int;
      current_lclk_count_int <= current_lclk_count;
    end if; -- end of clk
  end process;

  -- process managing passing of 'packet generation ENABLE flag' from AXI to ADC clk
  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        pending_forwarding_enable <= '0';
        pending_forwarding_enable_val <= '0';
        data_forwarding_enabled_ADCclk <= '0';
      else
        -- if we are in the middle of packet generation, save pending 'enabled' value
        if new_data_forwarding_enabled_val_ADCclk = '1' and ongoing_packet_generation = '1' then
          pending_forwarding_enable     <= '1';
          pending_forwarding_enable_val <= data_forwarding_enabled_ADCclk_s;
          --
        elsif new_data_forwarding_enabled_val_ADCclk = '1' then
          data_forwarding_enabled_ADCclk <= data_forwarding_enabled_ADCclk_s;
          --
        elsif pending_forwarding_enable = '1' and last_packet_sample = '1' then
          pending_forwarding_enable <= '0';
          data_forwarding_enabled_ADCclk <= pending_forwarding_enable_val;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing passing of 'DMA packet size' from AXI to ADC clk
  -- we'll allow the packet size to change only when packet generation is not active
  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        current_dma_packet_size_ADCclk <= (others => '0');
        dma_packet_size_configured <= '0';
      else
        if new_dma_packet_size_val_ADCclk = '1' and current_dma_packet_size_ADCclk_s /= x"00000000" and  data_forwarding_enabled_ADCclk = '0' then
          current_dma_packet_size_ADCclk  <= current_dma_packet_size_ADCclk_s;
          dma_packet_size_configured      <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  current_num_samples <= current_dma_packet_size_ADCclk(15 downto 0);
  -- concurrent calculation of the control-index
  current_num_samples_minus1 <= current_num_samples - cnt_1_16b;

  -- process managing packet header insertion and data forwarding
  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        fwd_adc_valid_0_s <= '0';
        fwd_adc_data_0_s <= (others => '0');
        fwd_adc_valid_1_s <= '0';
        fwd_adc_data_1_s <= (others => '0');
        fwd_adc_valid_2_s <= '0';
        fwd_adc_data_2_s <= (others => '0');
        fwd_adc_valid_3_s <= '0';
        fwd_adc_data_3_s <= (others => '0');
        num_samples_count <= (others => '0');
        ongoing_packet_generation <= '0';
        last_packet_sample <= '0';
      else
        -- default values
        last_packet_sample <= '0';

        -- the I/Q packets to be transmitted to the PS will comprise N 32-bit words and have the following format (where N is always 8M, with M being an integer):
        --
        --  + synchronization_header: 6 32-bit words [0xbbbbaaaa, 0xddddcccc, 0xffffeeee, 0xabcddcba, 0xfedccdef, 0xdfcbaefd]
        --  + 64-bit simestamp: 2 32-bit words
        --  + I/Q data: N-8 32-bit words [16-bit I & 16-bit Q]
        if data_forwarding_enabled_ADCclk = '1' and dma_packet_size_configured = '1' and num_samples_count = cnt_0_16b and (adc_valid_0 = '1' or adc_valid_1 = '1') then
          if pending_forwarding_enable = '1' and pending_forwarding_enable_val = '0' then
            ongoing_packet_generation <= '0';
            fwd_adc_valid_0_s <= '0';
            fwd_adc_valid_1_s <= '0';
            fwd_adc_valid_2_s <= '0';
            fwd_adc_valid_3_s <= '0';
          else
            ongoing_packet_generation <= '1';

            -- the first IQ-frame sample will be the 1st synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_1st_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_1st_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            if c_AXIS_NOF_CHANNELS = 2 then
              fwd_adc_data_2_s <= cnt_2nd_synchronization_word(15 downto 0);
              fwd_adc_valid_2_s <= '1';
              fwd_adc_data_3_s <= cnt_2nd_synchronization_word(31 downto 16);
              fwd_adc_valid_3_s <= '1';
            else
              fwd_adc_valid_2_s <= '0';
              fwd_adc_valid_3_s <= '0';
            end if;
            -- control counter update
            num_samples_count <= num_samples_count + cnt_1_16b;
          end if;

        -- 2nd synchronization header sample insertion
        elsif num_samples_count = cnt_1_16b then
          if c_AXIS_NOF_CHANNELS = 2 then
            -- the second IQ-frame sample will be the 2nd synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_3rd_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_3rd_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_data_2_s <= cnt_4th_synchronization_word(15 downto 0);
            fwd_adc_valid_2_s <= '1';
            fwd_adc_data_3_s <= cnt_4th_synchronization_word(31 downto 16);
            fwd_adc_valid_3_s <= '1';
          else
            -- the second IQ-frame sample will be the 2nd synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_2nd_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_2nd_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during header instertion we want to make sure that data on channel 3 is not accounted as valid
            fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during header insertion we want to make sure that data on channel 4 is not accounted as valid
          end if;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- 3rd synchronization header sample insertion
        elsif num_samples_count = cnt_2_16b then
          if c_AXIS_NOF_CHANNELS = 2 then
            fwd_adc_data_0_s <= cnt_5th_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_5th_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_data_2_s <= cnt_6th_synchronization_word(15 downto 0);
            fwd_adc_valid_2_s <= '1';
            fwd_adc_data_3_s <= cnt_6th_synchronization_word(31 downto 16);
            fwd_adc_valid_3_s <= '1';
          else
            -- the third IQ-frame sample will be the 3rd synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_3rd_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_3rd_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during header instertion we want to make sure that data on channel 3 is not accounted as valid
            fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during header insertion we want to make sure that data on channel 4 is not accounted as valid
          end if;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- 4th synchronization header sample insertion
        elsif num_samples_count = cnt_3_16b then
          if c_AXIS_NOF_CHANNELS = 2 then
            fwd_adc_data_0_s <= current_lclk_count_int(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= current_lclk_count_int(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_data_2_s <= current_lclk_count_int(47 downto 32);
            fwd_adc_valid_2_s <= '1';
            fwd_adc_data_3_s <= current_lclk_count_int(63 downto 48);
            fwd_adc_valid_3_s <= '1';
          else
            -- the fourth IQ-frame sample will be the 4th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_4th_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_4th_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during header instertion we want to make sure that data on channel 3 is not accounted as valid
            fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during header insertion we want to make sure that data on channel 4 is not accounted as valid
          end if;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- 5th synchronization header sample insertion
        elsif num_samples_count = cnt_4_16b then
          if c_AXIS_NOF_CHANNELS = 2 then
            -- forward valid I/Q data
            fwd_adc_data_0_s <= adc_data_0_i_i_i_i;
            fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i;
            fwd_adc_data_1_s <= adc_data_1_i_i_i_i;
            fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i;
            fwd_adc_data_2_s <= adc_data_2_i_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i;
          else
            -- the fifth IQ-frame sample will be the 5th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_5th_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_5th_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during header instertion we want to make sure that data on channel 3 is not accounted as valid
            fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during header insertion we want to make sure that data on channel 4 is not accounted as valid
          end if;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- 6th synchronization header sample insertion
        elsif num_samples_count = cnt_5_16b then
          if c_AXIS_NOF_CHANNELS = 2 then
            -- forward valid I/Q data
            fwd_adc_data_0_s <= adc_data_0_i_i_i;
            fwd_adc_valid_0_s <= adc_valid_0_i_i_i;
            fwd_adc_data_1_s <= adc_data_1_i_i_i;
            fwd_adc_valid_1_s <= adc_valid_1_i_i_i;
            fwd_adc_data_2_s <= adc_data_2_i_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i_i;
          else
            -- the sixth IQ-frame sample will be the 6th synchronization word (MSBs on ADC channel 1, LSBs on ADC channel 0)
            fwd_adc_data_0_s <= cnt_6th_synchronization_word(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= cnt_6th_synchronization_word(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during header instertion we want to make sure that data on channel 3 is not accounted as valid
            fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during header insertion we want to make sure that data on channel 4 is not accounted as valid
          end if;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- LSBs timestamp insertion (7th synchronization header sample)
        elsif num_samples_count = cnt_6_16b then
          if c_AXIS_NOF_CHANNELS = 2 then
            -- forward valid I/Q data
            fwd_adc_data_0_s <= adc_data_0_i_i;
            fwd_adc_valid_0_s <= adc_valid_0_i_i;
            fwd_adc_data_1_s <= adc_data_1_i_i;
            fwd_adc_valid_1_s <= adc_valid_1_i_i;
            fwd_adc_data_2_s <= adc_data_2_i_i;
            fwd_adc_valid_2_s <= adc_valid_2_i_i;
            fwd_adc_data_3_s <= adc_data_3_i_i;
            fwd_adc_valid_3_s <= adc_valid_3_i_i;
          else
            -- the seventh IQ-frame sample will be the timestamp's LSBs
            fwd_adc_data_0_s <= current_lclk_count_int(15 downto 0);
            fwd_adc_valid_0_s <= '1';
            fwd_adc_data_1_s <= current_lclk_count_int(31 downto 16);
            fwd_adc_valid_1_s <= '1';
            fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 3 is not accounted as valid
            fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 4 is not accounted as valid
          end if;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- MSBs timestamp insertion (8th synchronization header sample)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_7_16b then
          -- the eighth IQ-frame sample will be the timestamp's MSBs
          fwd_adc_data_0_s <= current_lclk_count_int_i(47 downto 32);
          fwd_adc_valid_0_s <= '1';
          fwd_adc_data_1_s <= current_lclk_count_int_i(63 downto 48);
          fwd_adc_valid_1_s <= '1';
          fwd_adc_valid_2_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 3 is not accounted as valid
          fwd_adc_valid_3_s <= '0'; -- @TO_BE_TESTED: during timestamping we want to make sure that data on channel 4 is not accounted as valid

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- first current I/Q sample (eight fast clock cycles delayed)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_8_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i_i_i_i;
          fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i_i_i_i;
          fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i_i_i_i;
          fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i_i_i_i;
          fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i_i_i_i;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- fourth current I/Q sample (seven fast clock cycles delayed)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_9_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i_i_i;
          fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i_i_i;
          fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i_i_i;
          fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i_i_i;
          fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i_i_i;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- fifth current I/Q sample (six fast clock cycles delayed)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_10_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i_i;
          fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i_i;
          fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i_i;
          fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i_i;
          fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i_i;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- sixth current I/Q sample (five fast clock cycles delayed)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_11_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i_i;
          fwd_adc_data_2_s <= adc_data_2_i_i_i_i_i;
          fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i_i;
          fwd_adc_data_3_s <= adc_data_3_i_i_i_i_i;
          fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i_i;
          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- seventh current I/Q sample (four fast clock cycles delayed)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_12_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i_i;
          fwd_adc_data_2_s <= adc_data_2_i_i_i_i;
          fwd_adc_valid_2_s <= adc_valid_2_i_i_i_i;
          fwd_adc_data_3_s <= adc_data_3_i_i_i_i;
          fwd_adc_valid_3_s <= adc_valid_3_i_i_i_i;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- eighth current I/Q sample (three fast clock cycles delayed)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_13_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i_i;
          fwd_adc_data_2_s <= adc_data_2_i_i_i;
          fwd_adc_valid_2_s <= adc_valid_2_i_i_i;
          fwd_adc_data_3_s <= adc_data_3_i_i_i;
          fwd_adc_valid_3_s <= adc_valid_3_i_i_i;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- ninth current I/Q sample (two fast clock cycles delayed)
        elsif c_AXIS_NOF_CHANNELS = 1 and num_samples_count = cnt_14_16b then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i_i;
          fwd_adc_valid_0_s <= adc_valid_0_i_i;
          fwd_adc_data_1_s <= adc_data_1_i_i;
          fwd_adc_valid_1_s <= adc_valid_1_i_i;
          fwd_adc_data_2_s <= adc_data_2_i_i;
          fwd_adc_valid_2_s <= adc_valid_2_i_i;
          fwd_adc_data_3_s <= adc_data_3_i_i;
          fwd_adc_valid_3_s <= adc_valid_3_i_i;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

        -- forwarding of remaining I/Q samples (one clock cycle delayed)
        elsif (c_AXIS_NOF_CHANNELS = 1 and num_samples_count > cnt_14_16b) or (c_AXIS_NOF_CHANNELS = 2 and num_samples_count > cnt_6_16b) then
          -- forward valid I/Q data
          fwd_adc_data_0_s <= adc_data_0_i;
          fwd_adc_valid_0_s <= adc_valid_0_i;
          fwd_adc_data_1_s <= adc_data_1_i;
          fwd_adc_valid_1_s <= adc_valid_1_i;
          fwd_adc_data_2_s <= adc_data_2_i;
          fwd_adc_valid_2_s <= adc_valid_2_i;
          fwd_adc_data_3_s <= adc_data_3_i;
          fwd_adc_valid_3_s <= adc_valid_3_i;

          if adc_valid_0_i = '1' or adc_valid_1_i = '1' then
            -- we must check if all samples comprising the current IQ-packet have been already forwarded or not
            if num_samples_count = current_num_samples_minus1 then
              num_samples_count  <= (others => '0');
              last_packet_sample <= '1';
            else
              num_samples_count  <= num_samples_count + cnt_1_16b;
            end if;
          end if;
        else
          ongoing_packet_generation <= '0';
          num_samples_count <= (others => '0');
          fwd_adc_valid_0_s <= '0';
          fwd_adc_valid_1_s <= '0';
          fwd_adc_valid_2_s <= '0';
          fwd_adc_valid_3_s <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  process(ADCxN_clk)
  begin
    if rising_edge(ADCxN_clk) then
      -- * NOTE: 'adc_X_i' signals delay the current 'util_ad9361_adc_fifo' inputs up to eight clock cycles, enabling the insertion of the synhronization header and 64-bit timestamp at positions 0-7 of each IQ-frame (i.e., as a 8-sample header)
      if c_AXIS_NOF_CHANNELS = 1 then
        adc_valid_0_i_i_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i_i_i;
        adc_data_0_i_i_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i_i_i;
        adc_valid_1_i_i_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i_i_i;
        adc_data_1_i_i_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i_i_i;
        adc_valid_0_i_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i_i;
        adc_data_0_i_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i_i;
        adc_valid_1_i_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i_i;
        adc_data_1_i_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i_i;
        adc_valid_0_i_i_i_i_i_i <= adc_valid_0_i_i_i_i_i;
        adc_data_0_i_i_i_i_i_i <= adc_data_0_i_i_i_i_i;
        adc_valid_1_i_i_i_i_i_i <= adc_valid_1_i_i_i_i_i;
        adc_data_1_i_i_i_i_i_i <= adc_data_1_i_i_i_i_i;
        adc_valid_2_i_i_i_i_i_i <= adc_valid_2_i_i_i_i_i;
        adc_data_2_i_i_i_i_i_i <= adc_data_2_i_i_i_i_i;
        adc_valid_3_i_i_i_i_i_i <= adc_valid_3_i_i_i_i_i;
        adc_data_3_i_i_i_i_i_i <= adc_data_3_i_i_i_i_i;
        adc_valid_0_i_i_i_i_i <= adc_valid_0_i_i_i_i;
        adc_data_0_i_i_i_i_i <= adc_data_0_i_i_i_i;
        adc_valid_1_i_i_i_i_i <= adc_valid_1_i_i_i_i;
        adc_data_1_i_i_i_i_i <= adc_data_1_i_i_i_i;
        adc_valid_2_i_i_i_i_i <= adc_valid_2_i_i_i_i;
        adc_data_2_i_i_i_i_i <= adc_data_2_i_i_i_i;
        adc_valid_3_i_i_i_i_i <= adc_valid_3_i_i_i_i;
        adc_data_3_i_i_i_i_i <= adc_data_3_i_i_i_i;
      end if;
      adc_valid_0_i_i_i_i <= adc_valid_0_i_i_i;
      adc_data_0_i_i_i_i <= adc_data_0_i_i_i;
      adc_valid_1_i_i_i_i <= adc_valid_1_i_i_i;
      adc_data_1_i_i_i_i <= adc_data_1_i_i_i;
      adc_valid_2_i_i_i_i <= adc_valid_2_i_i_i;
      adc_data_2_i_i_i_i <= adc_data_2_i_i_i;
      adc_valid_3_i_i_i_i <= adc_valid_3_i_i_i;
      adc_data_3_i_i_i_i <= adc_data_3_i_i_i;
      adc_valid_0_i_i_i <= adc_valid_0_i_i;
      adc_data_0_i_i_i <= adc_data_0_i_i;
      adc_valid_1_i_i_i <= adc_valid_1_i_i;
      adc_data_1_i_i_i <= adc_data_1_i_i;
      adc_valid_2_i_i_i <= adc_valid_2_i_i;
      adc_data_2_i_i_i <= adc_data_2_i_i;
      adc_valid_3_i_i_i <= adc_valid_3_i_i;
      adc_data_3_i_i_i <= adc_data_3_i_i;
      adc_valid_0_i_i <= adc_valid_0_i;
      adc_data_0_i_i <= adc_data_0_i;
      adc_valid_1_i_i <= adc_valid_1_i;
      adc_data_1_i_i <= adc_data_1_i;
      adc_valid_2_i_i <= adc_valid_2_i;
      adc_data_2_i_i <= adc_data_2_i;
      adc_valid_3_i_i <= adc_valid_3_i;
      adc_data_3_i_i <= adc_data_3_i;
      adc_valid_0_i <= adc_valid_0;
      adc_data_0_i <= adc_data_0;
      adc_valid_1_i <= adc_valid_1;
      adc_data_1_i <= adc_data_1;
      adc_data_2_i <= adc_data_2;
      adc_valid_2_i <= adc_valid_2;
      adc_data_3_i <= adc_data_3;
      adc_valid_3_i <= adc_valid_3;
    end if; -- end of clk
  end process;

  --word_iq_sample_index_plus_1 <= word_iq_sample_index + cnt_1_3b;

  -- process managing AXI4-stream outputs
  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        word_iq_sample_index <= '0';
        m_axis_tdata  <= (others => '0');
        m_axis_tvalid <= '0';
        m_axis_tlast  <= '0';
      else
        -- default values
        m_axis_tlast  <= '0';
        m_axis_tvalid <= '0';

        -- NOTE: the design assumes that tready is always '1'
        if new_data_fifo_reset_pulse_ADCclk = '1' then
          word_iq_sample_index <= '0';
          m_axis_tdata  <= (others => '0');
        elsif fwd_adc_valid_0_s = '1' or fwd_adc_valid_1_s = '1' then
          if word_iq_sample_index = '0' then
            m_axis_tdata(31 downto 0)  <= fwd_adc_data_1_s & fwd_adc_data_0_s;
            if c_AXIS_NOF_CHANNELS = 2 then
              m_axis_tdata(63 downto 32) <= fwd_adc_data_3_s & fwd_adc_data_2_s;
            end if;
          elsif word_iq_sample_index = '1' then
            if c_AXIS_NOF_CHANNELS = 2 then
              m_axis_tdata(95 downto 64)  <= fwd_adc_data_1_s & fwd_adc_data_0_s;
              m_axis_tdata(127 downto 96) <= fwd_adc_data_3_s & fwd_adc_data_2_s;
            else
              m_axis_tdata(63 downto 32) <= fwd_adc_data_1_s & fwd_adc_data_0_s;
            end if;
          end if;

          word_iq_sample_index <= not word_iq_sample_index;

          if word_iq_sample_index = '1' then
            word_iq_sample_index <= '0';
            m_axis_tlast  <= last_packet_sample;
            m_axis_tvalid <= fwd_adc_valid_0_s or fwd_adc_valid_1_s;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -------------------------------------------------------------------------------------------------
  -- block instances
  --

  -- cross-clock domain sharing of 'DMA packet size'
  synchronizer_DMA_packet_length_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH	=> 32,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => axi_aclk,
      src_data => current_dma_packet_size_int,
      src_data_valid => new_dma_packet_size_val,
      dst_clk => ADCxN_clk,
      dst_data => current_dma_packet_size_ADCclk_s,
      dst_data_valid => new_dma_packet_size_val_ADCclk
    );

  -- cross-clock domain sharing of 'data_forwarding_enabled_int'
  synchronizer_data_fwd_enable_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => axi_aclk,
      src_data(0) => data_forwarding_enabled_int,
      src_data_valid => new_data_forwarding_enabled_val,
      dst_clk => ADCxN_clk,
      dst_data(0) => data_forwarding_enabled_ADCclk_s,
      dst_data_valid => new_data_forwarding_enabled_val_ADCclk
    );

  -- cross-clock domain sharing of 'data_fifo_reset_int'
  synchronizer_data_fifo_reset_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => axi_aclk,
      src_data(0) => data_fifo_reset_int,
      src_data_valid => new_data_fifo_reset_pulse,
      dst_clk => ADCxN_clk,
      dst_data(0) => data_fifo_reset_ADCclk,
      dst_data_valid => new_data_fifo_reset_pulse_ADCclk
    );

  -- cross-clock domain sharing of 'DMA packet size'
  synchronizer_current_DMA_packet_length_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH	=> 32,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data => current_dma_packet_size_ADCclk,
      src_data_valid => cnt_1_1b,
      dst_clk => axi_aclk,
      dst_data => current_dma_packet_size,
      dst_data_valid => open
    );

  -- cross-clock domain sharing of 'data_forwarding_enabled_int'
  synchronizer_current_data_fwd_enable_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH	=> 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => ADCxN_clk,
      src_data(0) => data_forwarding_enabled_ADCclk,
      src_data_valid => cnt_1_1b,
      dst_clk => axi_aclk,
      dst_data(0) => data_forwarding_enabled,
      dst_data_valid => open
    );

end adc_timestamp_enabler_packetizer_RTL_impl;
