--
-- Copyright 2013-2022 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all; -- We do use signed arithmetic
use IEEE.numeric_std.all;

entity adc_dma_packet_controller is
  generic (
    --! Parameter defining the current DMA bandwidth
    --! defines the width of transfer length control register in bits; limits the maximum length 
    --! of the transfers to 2^DMA_LENGTH_WIDTH (e.g., 2^24 = 16M)
    DMA_LENGTH_WIDTH	: integer	:= 24    
  );
  port (
    -- *************************************************************************
    -- Clock and reset signals governing the ADC sample provision
    -- *************************************************************************
    --! ADC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) 
    --! configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_clk : in std_logic;   
    --! ADC high-active reset signal (mapped to the ADC clock xN domain [depends on antenna 
    --! (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling 
    --! freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_reset : in std_logic; 

    -- *************************************************************************
    -- Custom timestamping ports
    -- *************************************************************************
    --! Signal indicating the number of samples comprising the current DMA transfer [@ADCxN_clk]
    DMA_x_length : in std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0); 
    DMA_x_length_valid : in std_logic; --! Valid signal for 'DMA_x_length' [@ADCxN_clk]
    --! Signal from DMA core indicating that the new DMA requested 
    --! is being processed and the core is ready to receive new data
    fifo_wr_xfer_req : in std_logic;   

    -- *************************************************************************
		-- Interface to ADC data-path sources
		-- *************************************************************************
    adc_enable_0 : in std_logic;                   --! Enable signal for ADC data port 0
    adc_valid_0 : in std_logic;                    --! Valid signal for ADC data port 0
    adc_data_0 : in std_logic_vector(15 downto 0); --! ADC parallel data port 0 [16-bit I samples, Rx antenna 1]
    adc_enable_1 : in std_logic;                   --! Enable signal for ADC data port 1
    adc_valid_1 : in std_logic;                    --! Valid signal for ADC data port 1
    adc_data_1 : in std_logic_vector(15 downto 0); --! ADC parallel data port 1 [16-bit Q samples, Rx antenna 1]
    adc_enable_2 : in std_logic;                   --! Enable signal for ADC data port 2
    adc_valid_2 : in std_logic;                    --! Valid signal for ADC data port 2
    adc_data_2 : in std_logic_vector(15 downto 0); --! ADC parallel data port 2 [16-bit I samples, Rx antenna 2]
    adc_enable_3 : in std_logic;                   --! Enable signal for ADC data port 3
    adc_valid_3 : in std_logic;                    --! Valid signal for ADC data port 3
    adc_data_3 : in std_logic_vector(15 downto 0); --! ADC parallel data port 3 [16-bit Q samples, Rx antenna 2]
    adc_overflow : in std_logic;                   --! Overflow signal indicating that the DMA request was late

    -- ****************************
    -- Interface to ADI AD936x
    -- ****************************
    fwd_adc_enable_0 : out std_logic;                   --! Enable signal for ADC data port 0
    fwd_adc_valid_0 : out std_logic;                    --! Valid signal for ADC data port 0
    fwd_adc_data_0 : out std_logic_vector(15 downto 0); --! ADC parallel data port 0 [16-bit I samples, Rx antenna 1]
    fwd_adc_enable_1 : out std_logic;                   --! Enable signal for ADC data port 1
    fwd_adc_valid_1 : out std_logic;                    --! Valid signal for ADC data port 1
    fwd_adc_data_1 : out std_logic_vector(15 downto 0); --! ADC parallel data port 1 [16-bit Q samples, Rx antenna 1]
    fwd_adc_enable_2 : out std_logic;                   --! Enable signal for ADC data port 2
    fwd_adc_valid_2 : out std_logic;                    --! Valid signal for ADC data port 2
    fwd_adc_data_2 : out std_logic_vector(15 downto 0); --! ADC parallel data port 2 [16-bit I samples, Rx antenna 2]
    fwd_adc_enable_3 : out std_logic;                   --! Enable signal for ADC data port 3
    fwd_adc_valid_3 : out std_logic;                    --! Valid signal for ADC data port 3
    fwd_adc_data_3 : out std_logic_vector(15 downto 0); --! ADC parallel data port 3 [16-bit Q samples, Rx antenna 2]
    fwd_adc_overflow : out std_logic                    --! Overflow signal indicating that the DMA request was late
  );
end adc_dma_packet_controller;

architecture arch_adc_dma_packet_controller_RTL_impl of adc_dma_packet_controller is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- DMA length related constants
  constant cnt_1_DMA_LENGTH_WIDTHbits : std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0):=(0 => '1', others => '0');
  constant cnt_0_5b : std_logic_vector(4 downto 0):="00000";
  constant cnt_1_5b : std_logic_vector(4 downto 0):="00001";
  constant cnt_0_16b : std_logic_vector(15 downto 0):=x"0000";
  constant cnt_1_16b : std_logic_vector(15 downto 0):=x"0001";

  -- PS-PL synchronization words
  constant cnt_1st_synchronization_word : std_logic_vector(31 downto 0):=x"bbbbaaaa";

  -- **********************************
  -- internal signals
  -- **********************************

  -- DMA related signals
  signal DMA_x_length_int : std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0):=(others => '0');
  signal DMA_x_length_valid_int : std_logic:='0';
  signal DMA_x_length_plus1 : std_logic_vector(DMA_LENGTH_WIDTH-1 downto 0);
  signal DMA_x_length_applied : std_logic;
  signal DMA_x_length_valid_count : std_logic_vector(4 downto 0):=(others => '0');
  signal current_num_samples : std_logic_vector(15 downto 0); -- up to 32768 I/Q samples (i.e., enough for 1 ms @30.72 Msps/20 MHz BW)
  signal current_num_samples_minus1 : std_logic_vector(15 downto 0);
  signal num_samples_count : std_logic_vector(15 downto 0);
  signal samples_to_forward : std_logic_vector(15 downto 0);
  signal processing_new_packet : std_logic := '0';
  signal discard_adc_samples : std_logic := '0';
  signal fifo_xfer_req_d : std_logic := '0';
  signal fifo_xfer_req_falling : std_logic := '0';
  signal wait_xfer_request : std_logic := '0';
  signal cancelling_xfer : std_logic := '0';
  signal forwarding_en : std_logic := '0';

  -- when CPU cancels an ongoing DMA transfer, we want to be sure that downstream ADI blocks will still receive multiple of 8 samples
  signal n_samples_to_align_wfifo : std_logic_vector(3 downto 0) := (others => '0');

  -- output related signals
  signal fwd_adc_enable_0_s : std_logic;
  signal fwd_adc_valid_0_s  : std_logic;
  signal fwd_adc_data_0_s   : std_logic_vector(15 downto 0);
  signal fwd_adc_enable_1_s : std_logic;
  signal fwd_adc_valid_1_s  : std_logic;
  signal fwd_adc_data_1_s   : std_logic_vector(15 downto 0);
  signal fwd_adc_enable_2_s : std_logic;
  signal fwd_adc_valid_2_s  : std_logic;
  signal fwd_adc_data_2_s   : std_logic_vector(15 downto 0);
  signal fwd_adc_enable_3_s : std_logic;
  signal fwd_adc_valid_3_s  : std_logic;
  signal fwd_adc_data_3_s   : std_logic_vector(15 downto 0);
  signal fwd_adc_overflow_s : std_logic;

  -- FIFO related signals
  signal fifo_reset : std_logic_vector(1 downto 0);
  signal fifo_din  : std_logic_vector(68 downto 0);
  signal fifo_wen  : std_logic;
  signal fifo_rden : std_logic;
  signal fifo_empty : std_logic;
  signal fifo_dout  : std_logic_vector(68 downto 0);
  signal fifo_o_valid : std_logic;
  signal fifo_full : std_logic;
  signal fifo_overflow : std_logic;
  signal fifo_overflow_s : std_logic;
  signal fifo_data_count : std_logic_vector(5 downto 0);

  -- FIFO used as a temporal sample buffer
  component fifo_out_buffer
  port (
    clk   : in std_logic;
    rst   : in std_logic;
    din   : in std_logic_vector(68 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout  : out std_logic_vector(68 downto 0);
    full :  out std_logic;
    overflow : out std_logic;
    empty : out std_logic;
    valid : out std_logic;
    data_count : out std_logic_vector(5 downto 0)
  );
  end component;

begin

  -- ***************************************************
  -- basic DMA packet control
  -- ***************************************************

  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        DMA_x_length_int <= (others => '0');
        DMA_x_length_valid_int <= '0';
      else
        if DMA_x_length_valid_int = '0' and DMA_x_length_valid = '1' then
          DMA_x_length_valid_int <= '1';
        elsif DMA_x_length_valid_int = '1' and DMA_x_length_applied = '1' then
          DMA_x_length_valid_int <= '0';
        end if;

        if DMA_x_length_valid = '1' then -- capture any new value that is received
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

  -- concurrent calculation of the 'DMA_x_length_plus1' operand
  DMA_x_length_plus1 <= DMA_x_length_int + cnt_1_DMA_LENGTH_WIDTHbits;

  -- concurrent calculation of the control-index
  current_num_samples_minus1 <= current_num_samples - cnt_1_16b;

  -- process forwarding the packet-aligned input data
  process(ADCxN_clk,ADCxN_reset)
  begin
   if rising_edge(ADCxN_clk) then
     if ADCxN_reset='1' then -- synchronous high-active reset: initialization of signals
        fwd_adc_enable_0_s <= '0';
        fwd_adc_valid_0_s  <= '0';
        fwd_adc_data_0_s   <= (others => '0');
        fwd_adc_enable_1_s <= '0';
        fwd_adc_valid_1_s  <= '0';
        fwd_adc_data_1_s   <= (others => '0');
        fwd_adc_enable_2_s <= '0';
        fwd_adc_valid_2_s  <= '0';
        fwd_adc_data_2_s   <= (others => '0');
        fwd_adc_enable_3_s <= '0';
        fwd_adc_valid_3_s  <= '0';
        fwd_adc_data_3_s   <= (others => '0');
        fwd_adc_overflow_s <= '0';
        current_num_samples <= (others => '0');
        num_samples_count <= (others => '0');
        DMA_x_length_applied <= '0';
        processing_new_packet <= '0';
      else
        -- default values
        DMA_x_length_applied <= '0';

        -- fixed assignations
        fwd_adc_enable_0_s <= adc_enable_0;
        fwd_adc_enable_1_s <= adc_enable_1;
        fwd_adc_enable_2_s <= adc_enable_2;
        fwd_adc_enable_3_s <= adc_enable_3;
        fwd_adc_overflow_s <= adc_overflow;

        -- 1st forwarded DMA-packet sample: we will update the internal control signals; we'll make sure that we are aligned with the incoming DMA packets structure)
        if (adc_valid_0 = '1' or adc_valid_1 = '1' or adc_valid_2 = '1' or adc_valid_3 = '1') and
           adc_data_0 = cnt_1st_synchronization_word(15 downto 0) and adc_data_1 = cnt_1st_synchronization_word(31 downto 16) and
           num_samples_count = cnt_0_16b and (DMA_x_length_valid_int = '1' or DMA_x_length_valid_count > cnt_0_5b) and discard_adc_samples = '0' then
          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame + one 64-bit timestamp (+2 32-bit values), as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = (M+1)/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples (incl. timestamp) = (x_length + 1)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples <= DMA_x_length_plus1(17 downto 2); -- @TO_BE_TESTED: validate we are always obtaining a meaningful value

          -- actual data forwarding
          -- fwd_adc_enable_0_s <= adc_enable_0;
          fwd_adc_valid_0_s <= adc_valid_0;
          fwd_adc_data_0_s <= adc_data_0;
          -- fwd_adc_enable_1_s <= adc_enable_1;
          fwd_adc_valid_1_s <= adc_valid_1;
          fwd_adc_data_1_s <= adc_data_1;
          -- fwd_adc_enable_2_s <= adc_enable_2;
          fwd_adc_valid_2_s <= adc_valid_2;
          fwd_adc_data_2_s <= adc_data_2;
          -- fwd_adc_enable_3_s <= adc_enable_3;
          fwd_adc_valid_3_s <= adc_valid_3;
          fwd_adc_data_3_s <= adc_data_3;
          -- fwd_adc_overflow_s <= adc_overflow;

          -- control counter update
          num_samples_count <= num_samples_count + cnt_1_16b;

          -- notify that we have currently applied a new DMA_x_length and update the internal 'select' signal
          DMA_x_length_applied <= '1';
          processing_new_packet <= '1';
        -- rest of forwarded DMA-packet samples: we will use the internally stored muxing configuration
        elsif num_samples_count > cnt_0_16b and discard_adc_samples = '0' then
          -- actual data forwarding
          -- fwd_adc_enable_0_s <= adc_enable_0;
          fwd_adc_valid_0_s <= adc_valid_0;
          fwd_adc_data_0_s <= adc_data_0;
          -- fwd_adc_enable_1_s <= adc_enable_1;
          fwd_adc_valid_1_s <= adc_valid_1;
          fwd_adc_data_1_s <= adc_data_1;
          -- fwd_adc_enable_2_s <= adc_enable_2;
          fwd_adc_valid_2_s <= adc_valid_2;
          fwd_adc_data_2_s <= adc_data_2;
          -- fwd_adc_enable_3_s <= adc_enable_3;
          fwd_adc_valid_3_s <= adc_valid_3;
          fwd_adc_data_3_s <= adc_data_3;
          -- fwd_adc_overflow_s <= adc_overflow;
          processing_new_packet <= '1';

          -- new sample
          if adc_valid_0 = '1' or adc_valid_1 = '1' or adc_valid_2 = '1' or adc_valid_3 = '1' then
            -- we must check if all samples comprising the current IQ-packet have been already forwarded or not
            if num_samples_count = current_num_samples_minus1 then
              num_samples_count <= (others => '0');
            else
              num_samples_count <= num_samples_count + cnt_1_16b;
            end if;
          end if;
        -- either 'x_length' was not properly updated... we will dismiss the samples until it is configured back again
        -- or discard_adc_samples was asserted because dma transfer has been cancelled by the CPU
        else
          fwd_adc_valid_0_s <= '0';
          fwd_adc_valid_1_s <= '0';
          fwd_adc_valid_2_s <= '0';
          fwd_adc_valid_3_s <= '0';
          -- fwd_adc_overflow_s <= '0';
          num_samples_count <= (others => '0');
          processing_new_packet <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing the output buffer (data are buffered until DMA core is ready to accept them)
  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        fwd_adc_enable_0 <= '0';
        fwd_adc_valid_0  <= '0';
        fwd_adc_data_0   <= (others => '0');
        fwd_adc_enable_1 <= '0';
        fwd_adc_valid_1  <= '0';
        fwd_adc_data_1   <= (others => '0');
        fwd_adc_enable_2 <= '0';
        fwd_adc_valid_2  <= '0';
        fwd_adc_data_2   <= (others => '0');
        fwd_adc_enable_3 <= '0';
        fwd_adc_valid_3  <= '0';
        fwd_adc_data_3   <= (others => '0');
        fwd_adc_overflow <= '0';
        fifo_wen  <= '0';
        fifo_overflow <= '0';
      else
        fifo_overflow <= '0';
        fifo_wen <= '0';

        -- fixed assignations
        fwd_adc_enable_0 <= fwd_adc_enable_0_s;
        fwd_adc_enable_1 <= fwd_adc_enable_1_s;
        fwd_adc_enable_2 <= fwd_adc_enable_2_s;
        fwd_adc_enable_3 <= fwd_adc_enable_3_s;
        fwd_adc_overflow <= fwd_adc_overflow_s;
        
        -- Writing to the output FIFO
        if (fwd_adc_valid_0_s = '1' or fwd_adc_valid_1_s = '1' or
            fwd_adc_valid_2_s = '1' or fwd_adc_valid_3_s = '1') then
          fifo_din <= fwd_adc_overflow_s &
                      fwd_adc_enable_3_s & fwd_adc_enable_2_s & fwd_adc_data_3_s & fwd_adc_data_2_s &
                      fwd_adc_enable_1_s & fwd_adc_enable_0_s & fwd_adc_data_1_s & fwd_adc_data_0_s;
          if fifo_full = '0' then
            fifo_wen <= '1';
          else
            fifo_wen <= '0';
            fifo_overflow <= '1';
          end if;
        end if;

        if forwarding_en = '1' and fifo_o_valid = '1' then
          fwd_adc_data_0 <= fifo_dout(15 downto 0);
          fwd_adc_data_1 <= fifo_dout(31 downto 16);
          -- fwd_adc_enable_0 <= fifo_dout(32);
          -- fwd_adc_enable_1 <= fifo_dout(33);
          fwd_adc_data_2 <= fifo_dout(49 downto 34);
          fwd_adc_data_3 <= fifo_dout(65 downto 50);
          -- fwd_adc_enable_2 <= fifo_dout(66);
          -- fwd_adc_enable_3 <= fifo_dout(67);
          -- fwd_adc_overflow <= fifo_dout(68);
          fwd_adc_valid_0 <= '1';
          fwd_adc_valid_1 <= '1';
          fwd_adc_valid_2 <= '1';
          fwd_adc_valid_3 <= '1';
        elsif cancelling_xfer = '1' then
          fwd_adc_data_0 <= (others => '0');
          fwd_adc_data_1 <= (others => '0');
          fwd_adc_data_2 <= (others => '0');
          fwd_adc_data_3 <= (others => '0');
          fwd_adc_valid_0 <= '1';
          fwd_adc_valid_1 <= '1';
          fwd_adc_valid_2 <= '1';
          fwd_adc_valid_3 <= '1';
        else
          fwd_adc_valid_0 <= '0';
          fwd_adc_valid_1 <= '0';
          fwd_adc_valid_2 <= '0';
          fwd_adc_valid_3 <= '0';
        end if;
      end if;
    end if;
  end process;

  fifo_xfer_req_falling <= (not fifo_wr_xfer_req) and fifo_xfer_req_d;

  process(ADCxN_clk, ADCxN_reset)
    variable samples_to_align_wfifo_v : unsigned(2 downto 0);
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then
        fifo_xfer_req_d    <=  '0';
        wait_xfer_request  <=  '1';
        cancelling_xfer    <=  '0';
        forwarding_en      <=  '0';
        fifo_rden          <=  '0';
        samples_to_forward <= (others => '0');
        samples_to_align_wfifo_v := (others => '0');
      else
        fifo_rden <= '0';
        fifo_xfer_req_d <= fifo_wr_xfer_req;

        if wait_xfer_request = '1' and fifo_wr_xfer_req = '1' and processing_new_packet = '1' then
          wait_xfer_request <= '0';
          forwarding_en <= '1';
          samples_to_forward <= current_num_samples;

        elsif forwarding_en = '1' then

          -- Reading from the output FIFO
          if fifo_empty = '0' then
            fifo_rden <= '1';
          end if;
          -- update number of forwarded samples
          if fifo_o_valid = '1' then
            samples_to_forward <= samples_to_forward - 1;
          end if;

          if samples_to_forward > 0 and fifo_xfer_req_falling = '1' then
            -- DMA transfer cancelled
            forwarding_en <= '0';
            -- we want number of forwarded samples to be multiple of 8 (check here how many is left to forward)
            samples_to_align_wfifo_v := unsigned(samples_to_forward(2 downto 0) and "111");
            if fifo_o_valid = '1' then
              samples_to_align_wfifo_v := samples_to_align_wfifo_v - 1;
            end if;
            if samples_to_align_wfifo_v > 0 then
              cancelling_xfer <= '1';
              n_samples_to_align_wfifo <= std_logic_vector('0' & samples_to_align_wfifo_v);
            else
              wait_xfer_request <= '1';
              samples_to_forward <= (others => '0');
            end if;
          elsif samples_to_forward = 0 then
            if processing_new_packet = '0' then -- no more data to be forwarded
              forwarding_en <= '0';             -- let's wait for a next DMA request
              wait_xfer_request <= '1';
              samples_to_forward <= (others => '0');
            else -- next packet must be forwarded
              samples_to_forward <= current_num_samples_minus1;
            end if;
          end if;

        elsif cancelling_xfer = '1' then
          if n_samples_to_align_wfifo > 1 then
            n_samples_to_align_wfifo <= n_samples_to_align_wfifo - 1;
          else
            cancelling_xfer <= '0';
            wait_xfer_request <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;

  -- process generating the reset of the output fifo
  process(ADCxN_clk, ADCxN_reset)
  begin
    if rising_edge(ADCxN_clk) then
      if ADCxN_reset = '1' then
        discard_adc_samples <= '0';
        fifo_reset <= "10";
      else
        -- set default values
        discard_adc_samples <= '0';
        fifo_reset <= fifo_reset(0) & '0';
        -- ADC samples must be ignored
        if fifo_overflow = '1' or fifo_xfer_req_falling = '1' then -- fifo_wr_xfer_req deasserted either because DMA transfer has been canceled by the CPU
          discard_adc_samples <= '1';       -- or all requested samples were read in (in this case resetting the fifo is not destructive)
          fifo_reset <= "11"; -- generate 2 cycles long reset pulse for FIFO
        end if;
      end if;
    end if;
  end process;

  -- Output FIFO instance
  -- (it is aimed to buffer ADC samples in case new DMA request was made (i.e. DMA_x_length_valid='1') but DMA is not ready yet to receive new samples)
  fifo_out_buffer_inst : fifo_out_buffer
  port map (
    clk   => ADCxN_clk,
    rst   => fifo_reset(1),
    din   => fifo_din,
    wr_en => fifo_wen,
    rd_en => fifo_rden,
    dout  => fifo_dout,
    full  => fifo_full,
    empty => fifo_empty,
    valid => fifo_o_valid,
    overflow => fifo_overflow_s,
    data_count => fifo_data_count
  );

end arch_adc_dma_packet_controller_RTL_impl;