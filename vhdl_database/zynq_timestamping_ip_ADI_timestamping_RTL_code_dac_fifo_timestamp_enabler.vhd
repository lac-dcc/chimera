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

use IEEE.math_real."ceil";
use IEEE.math_real."log2";

-- Device primitives library
library UNISIM;
use UNISIM.vcomponents.all;

-- I/O libraries * SIMULATION ONLY *
use STD.textio.all;
use ieee.std_logic_textio.all;

-- * NOTE: whereas a configuration up to 2x2 (i.e., 4 channels) is supported, the basic functionality of the block needs to work for the most reduced possible
--         configuration (i.e., 1x1 or 2 channels, as provided by AD9364). Hence, even if it is not optimum, the provision of the synhronization header and
--         timestamp value will always use two single DAC channels (i.e., 32 bits or i0 & q0) and, thus, require eight clock cycles to be completed.
--
--         Also, because of the inherent desing of the underlying firmware and the timestamping requirements, the data will arrive @s_axi_aclk but will then
--         be forwarded to the DAC @DACxN_clk; RAMBs will serve both as internal buffering and safe cross-clock domain forwarding elements. *

-- ** IMPORTANT NOTE: it is assumed that all AXI interfaces are driven by a single clock signal (i.e., 's00_axi_aclk' = 's00_axis_aclk' = 'm00_axis_aclk';
--                    therefore 's00_axi_aresetn' = 's00_axis_aresetn' = 'm00_axis_aresetn'); accordingly no synchronizer logic is used for those signals
--                    shared between the different AXI-control logic elements. **
-- *** NOTE: in case of a x1 ratio between the FPGA baseband (DACxN_clk) and the sampling clocks, the forwarded outputs will be valid at each clock cycle,
--           instead of 1/2 as with the x2 ratio ***
-- @TO_BE_TESTED: in case the previous assumption needs to be modified, the proper synchronization elements will need to be instantiated and configured

entity dac_fifo_timestamp_enabler is
  generic ( -- @TO_BE_IMPROVED: a fixed configuration is used (i.e., 4 channels - 2RX/2TX - & 16-bit samples); support must be added for 'CHANNEL_DATA_WIDTH' and 'NUM_OF_CHANNELS'
    PARAM_DMA_LENGTH_WIDTH : integer := 24;         -- defines the width of transfer length control register in bits; limits the maximum length of the transfers to 2^PARAM_DMA_LENGTH_WIDTH (e.g., 2^24 = 16M)
    PARAM_BYPASS : boolean := false;                -- the block can be bypassed, resulting thus in an unmodified ADI firmware implementation
    PARAM_BUFFER_LENGTH : integer := 8;             -- defines the length of the internal circular buffer (in subframes @1.92 MHz; i.e., number of memories that will be implemented); the valid values are in the range [4..10] (i.e., values below 4 will still generate 4 memories and values above 10 will still generate 10 memories)
    PARAM_MAX_DMA_PACKET_LENGTH : integer := 16000; -- max length of a DMA packet [up to 30720]; defines the number of RAMBs used to implement each memory of the internal circular buffer
    PARAM_DMA_LENGTH_IN_HEADER : boolean := false;  -- defines if the DMA packet length to be used in the DAC chain comes in the 8-sample synchronization inserted for timestamping reasons (true) or if it will be provided by 'dac_dmac_xlength_sniffer' (false [default])
    PARAM_TWO_ANTENNA_SUPPORT : boolean := false;   -- indicates whether the design has to be synthesized to support two transmit antennas (true) or only one (false [default])
    PARAM_MEM_TYPE : string := "ramb36e2";          -- indicates the memory instantiation type - supported types: "**ramb36e2**" (Ultrascale), "**ramb36e1**" (7 series)
    PARAM_x1_FPGA_SAMPLING_RATIO : boolean := false -- defines whether the baseband FPGA clock (DACxN_clk) has an actual x1 ratio to the sampling clock (true) or not (false [default]); in the first case, forwarded outputs will be updated 1/2 clock cycles, otherwise a new sample will be forwarded each cycle
  );
  port (
    -- **********************************
    -- clock and reset signals governing the communication with the PS
    -- **********************************
    s_axi_aclk : in std_logic;                                       -- AXI clock signal (@100 MHz)
    s_axi_aresetn : in std_logic;                                    -- AXI low-active reset signal (mapped to the AXI clock domain [@100 MHz])

    -- **********************************
    -- clock and reset signals governing the DAC sample provision
    -- **********************************
    DACxN_clk : in std_logic;                                        -- DAC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    DACxN_reset : in std_logic;                                      -- DAC high-active reset signal (mapped to the DAC clock xN domain [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    DAC_clk_division : in std_logic;                                 -- Indicates the division factor between the sampling clock and input clock (i.e., '1' indicates N = 2 or 1x1, '0' indicates N = 4 or 2x2)

    -- **********************************
    -- custom timestamping ports
    -- **********************************
    current_lclk_count : in std_logic_vector(63 downto 0);           -- current ADC clock cycle (i.e., current I/Q sample count) [@ADC_clk]
    DMA_x_length : in std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0); -- signal indicating the number of samples comprising the current DMA transfer [@s_axi_aclk]
    DMA_x_length_valid : in std_logic;                               -- valid signal for 'DMA_x_length' [@s_axi_aclk]

    -- ************************************
    -- interface to ADI axi_ad9361_dac_fifo
    -- ************************************

    -- input ports from axi_ad9361_dac_fifo
    dac_data_0 : in std_logic_vector(15 downto 0);                   -- DAC parallel data port 0 [16-bit I samples, Tx antenna 1]
    dac_data_1 : in std_logic_vector(15 downto 0);                   -- DAC parallel data port 1 [16-bit Q samples, Tx antenna 1]
    dac_data_2 : in std_logic_vector(15 downto 0);                   -- DAC parallel data port 2 [16-bit I samples, Tx antenna 2]
    dac_data_3 : in std_logic_vector(15 downto 0);                   -- DAC parallel data port 3 [16-bit Q samples, Tx antenna 2]
    dac_fifo_unf : in std_logic;                                     -- FIFO underflow signal (forwarded from 'axi_ad9361_dac_dma')

    -- ************************************
    -- interface to ADI axi_ad9361
    -- ************************************

    -- input ports from axi_ad9361
    dac_enable_0 : in std_logic;                                     -- enable signal for DAC data port 0
    dac_valid_0 : in std_logic;                                      -- valid-in signal for DAC data port 0
    dac_enable_1 : in std_logic;                                     -- enable signal for DAC data port 1  FIFO channel
    dac_valid_1 : in std_logic;                                      -- valid-in signal for DAC data port 1
    dac_enable_2 : in std_logic;                                     -- enable signal for DAC data port 2
    dac_valid_2 : in std_logic;                                      -- valid-in signal for DAC data port 2
    dac_enable_3 : in std_logic;                                     -- enable signal for DAC data port 3
    dac_valid_3 : in std_logic;                                      -- valid-in signal for DAC data port 3

    -- output ports to axi_ad9361
    fwd_dac_enable_0 : out std_logic;                                -- enable signal for DAC data port 0
    fwd_dac_valid_0 : out std_logic;                                 -- valid-in signal for DAC data port 0
    fwd_dac_data_0 : out std_logic_vector(15 downto 0);              -- DAC parallel data port 0 [16-bit I samples, Tx antenna 1]
    fwd_dac_enable_1 : out std_logic;                                -- enable signal for DAC data port 1
    fwd_dac_valid_1 : out std_logic;                                 -- valid-in signal for DAC data port 1
    fwd_dac_data_1 : out std_logic_vector(15 downto 0);              -- DAC parallel data port 1 [16-bit Q samples, Tx antenna 1]
    fwd_dac_enable_2 : out std_logic;                                -- enable signal for DAC data port 2
    fwd_dac_valid_2 : out std_logic;                                 -- valid-in signal for DAC data port 2
    fwd_dac_data_2 : out std_logic_vector(15 downto 0);              -- DAC parallel data port 2 [16-bit I samples, Tx antenna 2]
    fwd_dac_enable_3 : out std_logic;                                -- enable signal for DAC data port 3
    fwd_dac_valid_3 : out std_logic;                                 -- valid-in signal for DAC data port 3
    fwd_dac_data_3 : out std_logic_vector(15 downto 0);              -- DAC parallel data port 3 [16-bit Q samples, Tx antenna 2]
    fwd_dac_fifo_unf : out std_logic;                                -- FIFO underflow signal (forwarded from 'axi_ad9361_dac_dma')

    -- **********************************
    -- interface to srsUE_AXI_control_unit (@s00_axi_aclk)
    -- **********************************

  -- clock and reset ports
    s00_axi_aclk : in std_logic;                                     -- AXI clock signal (@100 MHz)
    s00_axi_aresetn : in std_logic;                                  -- AXI low-active reset signal (mapped to the AXI clock domain [@100 MHz])

    -- mapping of status registers
    DAC_late_flag : out std_logic;                                   -- flag indicating whether a 'late' situation took place or ont
    DAC_new_late : out std_logic;                                    -- valid signal for 'DAC_late_flag'
    DAC_FSM_status : out std_logic_vector(31 downto 0);              -- status register for the FSM controlling the DAC forwarding chain
    DAC_FSM_new_status : out std_logic;                              -- valid signal for 'DAC_FSM_status'
    DAC_FSM_status_read : in std_logic                               -- ACK signal for 'DAC_FSM_status'
  );
end dac_fifo_timestamp_enabler;

architecture arch_dac_fifo_timestamp_enabler_RTL_impl of dac_fifo_timestamp_enabler is

  -- function called clogb2 that returns an integer which has the
  --value of the ceiling of the log base 2

  function clogb2 (bit_depth : integer) return integer is
    variable depth  : integer := bit_depth;
    variable count  : integer := 1;
   begin
     for clogb2 in 1 to bit_depth loop  -- Works for up to 32 bit integers
        if (bit_depth <= 2) then
          count := 1;
        else
          if(depth <= 1) then
           count := count;
         else
           depth := depth / 2;
            count := count + 1;
         end if;
       end if;
     end loop;
     return(count);
   end;

  -- **********************************
  -- definition of constants
  -- **********************************

  -- RAMB instantiation constants
  constant C_NUM_RAMBS_PER_MEM    : integer := PARAM_MAX_DMA_PACKET_LENGTH / 1024 + 1;
  constant C_NUM_MEMORY_SEL_BITS  : integer := integer(ceil(log2(real(C_NUM_RAMBS_PER_MEM)))) + 1;
  constant C_NUM_ADDRESS_BITS     : integer := (10 + C_NUM_MEMORY_SEL_BITS); -- 10bits to address each 1024depth memory and MSB bits used to select current memory to be used

  -- memory control and related constants
  constant cnt_0 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0) := (1 => '0', 0 => '0', others => '0');
  constant cnt_1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0) := (1 => '0', 0 => '1', others => '0');
  constant cnt_2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0) := (1 => '1', 0 => '0', others => '0');
  constant cnt_3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0) := (1 => '1', 0 => '1', others => '0');
  constant cnt_memory_0 : std_logic_vector(3 downto 0):="0000";
  constant cnt_memory_1 : std_logic_vector(3 downto 0):="0001";
  constant cnt_memory_2 : std_logic_vector(3 downto 0):="0010";
  constant cnt_memory_3 : std_logic_vector(3 downto 0):="0011";
  constant cnt_memory_4 : std_logic_vector(3 downto 0):="0100";
  constant cnt_memory_5 : std_logic_vector(3 downto 0):="0101";
  constant cnt_memory_6 : std_logic_vector(3 downto 0):="0110";
  constant cnt_memory_7 : std_logic_vector(3 downto 0):="0111";
  constant cnt_memory_8 : std_logic_vector(3 downto 0):="1000";
  constant cnt_memory_9 : std_logic_vector(3 downto 0):="1001";
  constant cnt_internal_buffer_latency_64b : std_logic_vector(63 downto 0):=x"0000000000000004";       -- obtained from RTL simulation (measured in ADC_clk cycles); @TO_BE_IMPROVED: this value is only valid for the 1x1 configuration
  constant cnt_internal_buffer_latency_plus1_64b : std_logic_vector(63 downto 0):=x"0000000000000005"; -- obtained from RTL simulation (measured in ADC_clk cycles); @TO_BE_IMPROVED: this value is only valid for the 1x1 configuration

  -- PS-PL synchronization words
  constant cnt_1st_synchronization_word : std_logic_vector(31 downto 0):=x"bbbbaaaa";
  constant cnt_2nd_synchronization_word : std_logic_vector(31 downto 0):=x"ddddcccc";
  constant cnt_3rd_synchronization_word : std_logic_vector(31 downto 0):=x"ffffeeee";
  constant cnt_3rd_synch_word_with_xlen : std_logic_vector(15 downto 0):=x"ffee";
  constant cnt_4th_synchronization_word : std_logic_vector(31 downto 0):=x"abcddcba";
  constant cnt_5th_synchronization_word : std_logic_vector(31 downto 0):=x"fedccdef";
  constant cnt_6th_synchronization_word : std_logic_vector(31 downto 0):=x"dfcbaefd";

  -- internal internal buffer write-control state machine's state definition-values and related constants
  constant cnt_frame_storing_state_WAIT_NEW_FRAME : std_logic_vector(2 downto 0):="000";
  constant cnt_frame_storing_state_VERIFY_SYNC_HEADER_2nd : std_logic_vector(2 downto 0):="001";
  constant cnt_frame_storing_state_VERIFY_SYNC_HEADER_3rd : std_logic_vector(2 downto 0):="010";
  constant cnt_frame_storing_state_VERIFY_SYNC_HEADER_4th : std_logic_vector(2 downto 0):="011";
  constant cnt_frame_storing_state_VERIFY_SYNC_HEADER_5th : std_logic_vector(2 downto 0):="100";
  constant cnt_frame_storing_state_VERIFY_SYNC_HEADER_6th : std_logic_vector(2 downto 0):="101";
  constant cnt_frame_storing_state_PROCESS_FRAME : std_logic_vector(2 downto 0):="110";

  -- timestamp related constants
  constant cnt_0_64b : std_logic_vector(63 downto 0):=(others => '0');
  constant cnt_1_64b : std_logic_vector(63 downto 0):= x"0000000000000001";

  -- x-length related constants
  constant cnt_0_5b : std_logic_vector(4 downto 0):="00000";
  constant cnt_1_5b : std_logic_vector(4 downto 0):="00001";
  constant cnt_31_DMA_LENGTH_WIDTHbits : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0):=(4 downto 0 => '1', others => '0');
  constant cnt_0_C_NUM_ADDRESS_BITS : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');

  -- internal clock-enable constants
  constant cnt_0_3b : std_logic_vector(2 downto 0):="000";
  constant cnt_1_3b : std_logic_vector(2 downto 0):="001";
  constant cnt_3_3b : std_logic_vector(2 downto 0):="011";

  -- AXI-lite-related constants
  constant cnt_mem_mapped_reg0_address : std_logic_vector(1 downto 0):="00";
  constant cnt_mem_mapped_reg1_address : std_logic_vector(1 downto 0):="01";
  constant cnt_mem_mapped_reg2_address : std_logic_vector(1 downto 0):="10";
  constant cnt_mem_mapped_reg3_address : std_logic_vector(1 downto 0):="11";
  constant cnt_1_16b : std_logic_vector(15 downto 0):=x"0001";
  constant cnt_19200_16b : std_logic_vector(15 downto 0):=x"4b00";

  -- **********************************
  -- internal signals
  -- **********************************

  TYPE rambs_array_32bit_t IS ARRAY(C_NUM_RAMBS_PER_MEM-1 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  TYPE rambs_array_15bit_t IS ARRAY(C_NUM_RAMBS_PER_MEM-1 DOWNTO 0) OF STD_LOGIC_VECTOR(14 DOWNTO 0);
  TYPE rambs_array_8bit_t  IS ARRAY(C_NUM_RAMBS_PER_MEM-1 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
  TYPE rambs_array_4bit_t  IS ARRAY(C_NUM_RAMBS_PER_MEM-1 DOWNTO 0) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
  TYPE rambs_array_1bit_t  IS ARRAY(C_NUM_RAMBS_PER_MEM-1 DOWNTO 0) OF STD_LOGIC;

  -- frame buffering related signals
  signal frame_storing_state : std_logic_vector(2 downto 0);
  signal frame_storing_start_flag : std_logic;
  signal currentframe_processing_started : std_logic;
  signal first_timestamp_half : std_logic;

  signal timestamp_header_value_mem0 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem2 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem3 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem4 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem5 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem6 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem7 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem8 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem9 : std_logic_vector(63 downto 0);

  signal current_num_samples_mem0 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem4 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem5 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem6 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem7 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem8 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem9 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal current_num_samples_mem0_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem1_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem2_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem3_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem4_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem5_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem6_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem7_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem8_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem9_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal current_num_samples_mem0_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem1_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem2_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem3_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem4_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem5_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem6_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem7_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem8_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem9_16b : std_logic_vector(15 downto 0):=(others => '0');

  signal current_write_memory : std_logic_vector(3 downto 0);                  -- up to 9 (i.e., we have 10 memories which allows internal storage of up to 10 subframes @1.92 Msps/1.4 MHz BW)
  signal current_read_memory : std_logic_vector(3 downto 0);                   -- up to 9 (i.e., we have 10 memories which allows internal storage of up to 10 subframes @1.92 Msps/1.4 MHz BW)
  signal current_read_memory_i_i_i : std_logic_vector(3 downto 0);
  signal current_read_memory_i_i : std_logic_vector(3 downto 0);
  signal current_read_memory_i : std_logic_vector(3 downto 0);

  signal PS_DAC_data_RAMB_data_in_ch01 : std_logic_vector(31 downto 0);        -- two data input signals (I/Q for DAC channels 0/1 & 2/3) are feeding all RAMB instances
  signal PS_DAC_data_RAMB_data_in_ch23 : std_logic_vector(31 downto 0);        -- two data input signals (I/Q for DAC channels 0/1 & 2/3) are feeding all RAMB instances
  signal PS_DAC_data_RAMB_validEnable_in_ch01 : std_logic_vector(3 downto 0);  -- two extra valid/enable input signals (I/Q-valid/enable for DAC channels 0/1 & 2/3) are feeding the parity-bits of all RAMB instances
  signal PS_DAC_data_RAMB_validEnable_in_ch23 : std_logic_vector(3 downto 0);  -- two extra valid/enable input signals (I/Q-valid/enable for DAC channels 0/1 & 2/3) are feeding the parity-bits of all RAMB instances
  signal PS_DAC_data_RAMB_write_index_memory0 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory4 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory5 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory6 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory7 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory8 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory9 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0); -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_write_index_memory0_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory1_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory2_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory3_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory4_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory5_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory6_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory7_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory8_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory9_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_read_index_memory0 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory4 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory5 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory6 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory7 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory8 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_read_index_memory9 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory0 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory4 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory5 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory6 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory7 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory8 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory9 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);  -- up to 1920 I/Q samples (i.e., 1 ms for 1.92 Msps/1.4 MHz BW)
  signal PS_DAC_data_RAMB_final_index_memory0_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory1_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory2_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory3_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory4_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory5_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory6_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory7_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory8_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory9_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory0_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory1_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory2_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory3_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory4_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory5_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory6_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory7_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory8_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal PS_DAC_data_RAMB_final_index_memory9_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  -- Channels 0-1 RAMBs control signals
  signal PS_DAC_data_RAMB_ch01_0_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_0_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_0_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_0_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_0_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_0_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_1_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_1_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_1_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_1_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_1_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_1_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_2_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_2_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_2_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_2_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_2_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_2_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_3_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_3_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_3_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_3_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_3_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_3_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_4_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_4_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_4_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_4_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_4_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_4_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_5_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_5_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_5_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_5_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_5_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_5_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_6_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_6_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_6_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_6_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_6_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_6_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_7_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_7_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_7_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_7_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_7_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_7_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_8_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_8_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_8_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_8_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_8_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_8_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_9_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_9_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_9_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch01_9_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch01_9_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch01_9_read_enable     : rambs_array_1bit_t;
  -- Channels 2-3 RAMs control signals
  signal PS_DAC_data_RAMB_ch23_0_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_0_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_0_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_0_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_0_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_0_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_1_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_1_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_1_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_1_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_1_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_1_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_2_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_2_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_2_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_2_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_2_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_2_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_3_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_3_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_3_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_3_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_3_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_3_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_4_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_4_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_4_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_4_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_4_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_4_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_5_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_5_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_5_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_5_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_5_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_5_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_6_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_6_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_6_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_6_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_6_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_6_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_7_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_7_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_7_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_7_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_7_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_7_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_8_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_8_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_8_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_8_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_8_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_8_read_enable     : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_9_write_address   : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_9_write_enable    : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_9_byteWide_write_enable : rambs_array_8bit_t;
  signal PS_DAC_data_RAMB_ch23_9_data_out        : rambs_array_32bit_t;
  signal PS_DAC_data_RAMB_ch23_9_read_address    : rambs_array_15bit_t;
  signal PS_DAC_data_RAMB_ch23_9_read_enable     : rambs_array_1bit_t;

  signal PS_DAC_data_RAMB_ch01_0_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_0_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_1_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_1_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_2_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_2_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_3_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_3_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_4_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_4_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_5_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_5_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_6_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_6_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_7_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_7_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_8_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_8_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_9_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch01_9_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_0_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_0_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_1_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_1_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_2_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_2_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_3_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_3_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_4_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_4_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_5_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_5_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_6_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_6_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_7_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_7_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_8_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_8_read_enable_i   : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_9_read_enable_i_i : rambs_array_1bit_t;
  signal PS_DAC_data_RAMB_ch23_9_read_enable_i   : rambs_array_1bit_t;

  signal current_read_period_count : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal clear_timestamping_ctrl_reg_mem0 : std_logic;
  signal clear_timestamping_ctrl_reg_mem1 : std_logic;
  signal clear_timestamping_ctrl_reg_mem2 : std_logic;
  signal clear_timestamping_ctrl_reg_mem3 : std_logic;
  signal clear_timestamping_ctrl_reg_mem4 : std_logic;
  signal clear_timestamping_ctrl_reg_mem5 : std_logic;
  signal clear_timestamping_ctrl_reg_mem6 : std_logic;
  signal clear_timestamping_ctrl_reg_mem7 : std_logic;
  signal clear_timestamping_ctrl_reg_mem8 : std_logic;
  signal clear_timestamping_ctrl_reg_mem9 : std_logic;
  signal large_early_situation : std_logic;
  signal read_memory_just_cleared : std_logic;
  signal mem0_pending_clear : std_logic;
  signal mem1_pending_clear : std_logic;
  signal mem2_pending_clear : std_logic;
  signal mem3_pending_clear : std_logic;
  signal mem4_pending_clear : std_logic;
  signal mem5_pending_clear : std_logic;
  signal mem6_pending_clear : std_logic;
  signal mem7_pending_clear : std_logic;
  signal mem8_pending_clear : std_logic;
  signal mem9_pending_clear : std_logic;

  signal num_of_stored_frames : std_logic_vector(4 downto 0);
  signal s_axi_areset : std_logic;

  -- timestamping related signals
  signal current_lclk_count_int : std_logic_vector(63 downto 0) := (others => '0');
  signal fwd_current_time_int : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem0 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem1 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem2 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem3 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem4 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem5 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem6 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem7 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem8 : std_logic_vector(63 downto 0);
  signal fwd_time_difference_mem9 : std_logic_vector(63 downto 0);
  signal fwd_early_mem0 : std_logic;
  signal fwd_early_mem1 : std_logic;
  signal fwd_early_mem2 : std_logic;
  signal fwd_early_mem3 : std_logic;
  signal fwd_early_mem4 : std_logic;
  signal fwd_early_mem5 : std_logic;
  signal fwd_early_mem6 : std_logic;
  signal fwd_early_mem7 : std_logic;
  signal fwd_early_mem8 : std_logic;
  signal fwd_early_mem9 : std_logic;
  signal fwd_late_mem0 : std_logic;
  signal fwd_late_mem1 : std_logic;
  signal fwd_late_mem2 : std_logic;
  signal fwd_late_mem3 : std_logic;
  signal fwd_late_mem4 : std_logic;
  signal fwd_late_mem5 : std_logic;
  signal fwd_late_mem6 : std_logic;
  signal fwd_late_mem7 : std_logic;
  signal fwd_late_mem8 : std_logic;
  signal fwd_late_mem9 : std_logic;
  -- signal fwd_timestamp_header_value_mem0 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem1 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem2 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem3 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem4 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem5 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem6 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem7 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem8 : std_logic_vector(63 downto 0);
  -- signal fwd_timestamp_header_value_mem9 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem0 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem1 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem2 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem3 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem4 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem5 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem6 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem7 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem8 : std_logic_vector(63 downto 0);
  signal baseline_late_time_difference_mem9 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem0_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem1_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem2_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem3_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem4_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem5_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem6_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem7_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem8_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem9_minus_buffer_latency : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem0_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem1_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem2_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem3_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem4_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem5_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem6_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem7_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem8_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal timestamp_header_value_mem9_minus_buffer_latency_plus1 : std_logic_vector(63 downto 0);
  signal fwd_current_num_samples_mem0 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem4 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem5 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem6 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem7 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem8 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem9 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);             -- up to PARAM_MAX_DMA_PACKET_LENGTH I/Q samples
  signal fwd_current_num_samples_mem0_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem1_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem2_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem3_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem4_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem5_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem6_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem7_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem8_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem9_minus1 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem0_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem1_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem2_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem3_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem4_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem5_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem6_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem7_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem8_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwd_current_num_samples_mem9_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);
  signal fwdframe_processing_started : std_logic;
  signal fwdframe_continued_processing : std_logic;
  signal fwd_idle_state : std_logic;
  signal fwd_early_mem0_i_i_i : std_logic;
  signal fwd_early_mem1_i_i_i : std_logic;
  signal fwd_early_mem2_i_i_i : std_logic;
  signal fwd_early_mem3_i_i_i : std_logic;
  signal fwd_early_mem4_i_i_i : std_logic;
  signal fwd_early_mem5_i_i_i : std_logic;
  signal fwd_early_mem6_i_i_i : std_logic;
  signal fwd_early_mem7_i_i_i : std_logic;
  signal fwd_early_mem8_i_i_i : std_logic;
  signal fwd_early_mem9_i_i_i : std_logic;
  signal fwd_early_mem0_i_i : std_logic;
  signal fwd_early_mem1_i_i : std_logic;
  signal fwd_early_mem2_i_i : std_logic;
  signal fwd_early_mem3_i_i : std_logic;
  signal fwd_early_mem4_i_i : std_logic;
  signal fwd_early_mem5_i_i : std_logic;
  signal fwd_early_mem6_i_i : std_logic;
  signal fwd_early_mem7_i_i : std_logic;
  signal fwd_early_mem8_i_i : std_logic;
  signal fwd_early_mem9_i_i : std_logic;
  signal fwd_early_mem0_i : std_logic;
  signal fwd_early_mem1_i : std_logic;
  signal fwd_early_mem2_i : std_logic;
  signal fwd_early_mem3_i : std_logic;
  signal fwd_early_mem4_i : std_logic;
  signal fwd_early_mem5_i : std_logic;
  signal fwd_early_mem6_i : std_logic;
  signal fwd_early_mem7_i : std_logic;
  signal fwd_early_mem8_i : std_logic;
  signal fwd_early_mem9_i : std_logic;
  signal fwd_late_mem0_i_i_i : std_logic;
  signal fwd_late_mem1_i_i_i : std_logic;
  signal fwd_late_mem2_i_i_i : std_logic;
  signal fwd_late_mem3_i_i_i : std_logic;
  signal fwd_late_mem4_i_i_i : std_logic;
  signal fwd_late_mem5_i_i_i : std_logic;
  signal fwd_late_mem6_i_i_i : std_logic;
  signal fwd_late_mem7_i_i_i : std_logic;
  signal fwd_late_mem8_i_i_i : std_logic;
  signal fwd_late_mem9_i_i_i : std_logic;
  signal fwd_late_mem0_i_i : std_logic;
  signal fwd_late_mem1_i_i : std_logic;
  signal fwd_late_mem2_i_i : std_logic;
  signal fwd_late_mem3_i_i : std_logic;
  signal fwd_late_mem4_i_i : std_logic;
  signal fwd_late_mem5_i_i : std_logic;
  signal fwd_late_mem6_i_i : std_logic;
  signal fwd_late_mem7_i_i : std_logic;
  signal fwd_late_mem8_i_i : std_logic;
  signal fwd_late_mem9_i_i : std_logic;
  signal fwd_late_mem0_i : std_logic;
  signal fwd_late_mem1_i : std_logic;
  signal fwd_late_mem2_i : std_logic;
  signal fwd_late_mem3_i : std_logic;
  signal fwd_late_mem4_i : std_logic;
  signal fwd_late_mem5_i : std_logic;
  signal fwd_late_mem6_i : std_logic;
  signal fwd_late_mem7_i : std_logic;
  signal fwd_late_mem8_i : std_logic;
  signal fwd_late_mem9_i : std_logic;
  signal fwd_idle_state_i_i_i : std_logic;
  signal fwd_idle_state_i_i : std_logic;
  signal fwd_idle_state_i : std_logic;

  -- x_length related signals
  signal DMA_x_length_int : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0):=(others => '0');
  signal DMA_x_length_minus31 : std_logic_vector(PARAM_DMA_LENGTH_WIDTH-1 downto 0);
  signal DMA_x_length_valid_int : std_logic;
  signal DMA_x_length_valid_count : std_logic_vector(4 downto 0):=(others => '0');
  signal DMA_x_length_applied : std_logic:='0';

  -- internal clock-enable related signals
  signal clock_enable_counter : std_logic_vector(2 downto 0);

  -- internal forwarding signals
  signal fwd_dac_valid_0_s : std_logic;
  signal fwd_dac_data_0_s : std_logic_vector(15 downto 0);
  signal fwd_dac_valid_1_s : std_logic;
  signal fwd_dac_data_1_s : std_logic_vector(15 downto 0);
  signal fwd_dac_valid_2_s : std_logic;
  signal fwd_dac_data_2_s : std_logic_vector(15 downto 0);
  signal fwd_dac_valid_3_s : std_logic;
  signal fwd_dac_data_3_s : std_logic_vector(15 downto 0);

  -- srsUE_AXI_control_unit related signals
  signal DAC_FSM_status_s : std_logic_vector(31 downto 0) := (others => '0');
  signal DAC_FSM_status_s_valid : std_logic:='0';
  signal late_flag : std_logic;
  signal current_block_configuration : std_logic;
  signal DAC_FSM_status_unread : std_logic;

  -- cross-clock domain-related signals; they are intialized to 0s to avoid unknown states at startup
  signal frame_storing_start_flag_DACxNclk : std_logic:='0';
  signal frame_storing_start_flag_DACxNclk_s : std_logic:='0';
  signal pulse_frame_storing_start_flag_DACxNclk : std_logic:='0';
  signal new_frame_storing_pulse : std_logic;
  signal DMA_x_length_applied_AXIclk : std_logic:='0';
  signal DMA_x_length_applied_AXIclk_s : std_logic:='0';
  signal DMA_x_length_applied_AXIclk_valid : std_logic:='0';
  signal DMA_x_length_applied_AXIclk_valid_s : std_logic:='0';
  signal timestamp_header_value_mem0_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem1_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem2_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem3_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem4_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem5_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem6_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem7_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem8_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal timestamp_header_value_mem9_DACxNclk : std_logic_vector(63 downto 0):=(others => '0');
  signal current_num_samples_mem0_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem1_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem2_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem3_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem4_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem5_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem6_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem7_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem8_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem9_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal current_num_samples_mem0_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem1_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem2_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem3_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem4_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem5_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem6_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem7_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem8_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal current_num_samples_mem9_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory0_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory1_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory2_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory3_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory4_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory5_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory6_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory7_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory8_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory9_DACxNclk : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory0_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory1_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory2_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory3_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory4_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory5_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory6_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory7_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory8_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory9_DACxNclk_16b : std_logic_vector(15 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory0_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory0_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory1_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory1_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory2_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory2_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory3_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory3_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory4_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory4_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory5_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory5_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory6_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory6_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory7_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory7_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory8_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory8_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory9_DACxNclk_minus3 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal PS_DAC_data_RAMB_write_index_memory9_DACxNclk_minus2 : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0):=(others => '0');
  signal clear_timestamping_ctrl_reg_mem0_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem1_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem2_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem3_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem4_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem5_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem6_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem7_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem8_AXIclk : std_logic;
  signal clear_timestamping_ctrl_reg_mem9_AXIclk : std_logic;
  signal pulse_clear_timestamping_ctrl_reg_mem0_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem1_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem2_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem3_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem4_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem5_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem6_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem7_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem8_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem9_AXIclk : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem0_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem1_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem2_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem3_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem4_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem5_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem6_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem7_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem8_AXIclk_i : std_logic:='0';
  signal pulse_clear_timestamping_ctrl_reg_mem9_AXIclk_i : std_logic:='0';
  signal new_clear_timestamping_pulse_mem0 : std_logic;
  signal new_clear_timestamping_pulse_mem1 : std_logic;
  signal new_clear_timestamping_pulse_mem2 : std_logic;
  signal new_clear_timestamping_pulse_mem3 : std_logic;
  signal new_clear_timestamping_pulse_mem4 : std_logic;
  signal new_clear_timestamping_pulse_mem5 : std_logic;
  signal new_clear_timestamping_pulse_mem6 : std_logic;
  signal new_clear_timestamping_pulse_mem7 : std_logic;
  signal new_clear_timestamping_pulse_mem8 : std_logic;
  signal new_clear_timestamping_pulse_mem9 : std_logic;
  signal update_mem_timestamps_pulse : std_logic:='0';
  signal pulse_update_mem0_timestamp : std_logic:='0';
  signal pulse_update_mem1_timestamp : std_logic:='0';
  signal pulse_update_mem2_timestamp : std_logic:='0';
  signal pulse_update_mem3_timestamp : std_logic:='0';
  signal pulse_update_mem4_timestamp : std_logic:='0';
  signal pulse_update_mem5_timestamp : std_logic:='0';
  signal pulse_update_mem6_timestamp : std_logic:='0';
  signal pulse_update_mem7_timestamp : std_logic:='0';
  signal pulse_update_mem8_timestamp : std_logic:='0';
  signal pulse_update_mem9_timestamp : std_logic:='0';
  signal dac_fifo_unf_DACxNclk : std_logic:='0';
  signal dac_fifo_unf_DACxNclk_s : std_logic:='0';
  signal dac_fifo_unf_DACxNclk_valid : std_logic:='0';
  signal dac_fifo_unf_DACxNclk_valid_s : std_logic:='0';
  signal late_flag_AXIclk : std_logic:='0';
  signal late_flag_AXIclk_s : std_logic:='0';
  signal num_of_stored_frames_AXIclk : std_logic_vector(4 downto 0):=(others => '0');

  -- debugging only SIGNALS
  signal fwd_late_count : std_logic_vector(C_NUM_ADDRESS_BITS-1 downto 0);

begin

  -- ** @TO_BE_TESTED: the design assumes that 'DMA_x_length_valid' will be always asserted at least one clock cycle before the data associated to
  --                   that DMA transfer enters this block. **

  -- ** NOTE: output 'valid' ports will feature a fixed behaviour, being asserted each 1/N clock cycles as expected by ADI's firmware.
  --          Similarly, output 'enable' ports will be always asserted given that their related input is also asserted. Nevertheless,
  --          the logic enabling these output ports to be generated more flexibly has been left commented out in the code in case it
  --          needs to be reused at any time. **

-- ***************************************************
  -- timestamp capturing and I/Q sample buffering
  -- ***************************************************

  -- process registering 'current_lclk_count'
  process(DACxN_clk)
  begin
    if rising_edge(DACxN_clk) then
      current_lclk_count_int <= current_lclk_count;
    end if; -- end of clk
  end process;

  -- concurrent calculation of the 'DMA_x_length_minus31' operand
  DMA_x_length_minus31 <= DMA_x_length_int - cnt_31_DMA_LENGTH_WIDTHbits;

  -- concurrent calculation of the control index values
  current_num_samples_mem0_minus1 <= current_num_samples_mem0 - cnt_1;
  current_num_samples_mem1_minus1 <= current_num_samples_mem1 - cnt_1;
  current_num_samples_mem2_minus1 <= current_num_samples_mem2 - cnt_1;
  current_num_samples_mem3_minus1 <= current_num_samples_mem3 - cnt_1;
num_samp_min1_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
  current_num_samples_mem4_minus1 <= current_num_samples_mem4 - cnt_1;
end generate num_samp_min1_5mem;
num_samp_min1_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
  current_num_samples_mem5_minus1 <= current_num_samples_mem5 - cnt_1;
end generate num_samp_min1_6mem;
num_samp_min1_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
  current_num_samples_mem6_minus1 <= current_num_samples_mem6 - cnt_1;
end generate num_samp_min1_7mem;
num_samp_min1_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
  current_num_samples_mem7_minus1 <= current_num_samples_mem7 - cnt_1;
end generate num_samp_min1_8mem;
num_samp_min1_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
  current_num_samples_mem8_minus1 <= current_num_samples_mem8 - cnt_1;
end generate num_samp_min1_9mem;
num_samp_min1_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
  current_num_samples_mem9_minus1 <= current_num_samples_mem9 - cnt_1;
end generate num_samp_min1_10mem;

  -- process updating the internal timestamp control registers and managing the writing to the internal buffer (@s_axi_aclk)
  process(s_axi_aclk,s_axi_aresetn)
    variable ramb_index : integer;
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        DMA_x_length_int <= (others => '0');
        DMA_x_length_valid_int <= '0';
        timestamp_header_value_mem0 <= (others => '0');
        timestamp_header_value_mem1 <= (others => '0');
        timestamp_header_value_mem2 <= (others => '0');
        timestamp_header_value_mem3 <= (others => '0');
        timestamp_header_value_mem4 <= (others => '0');
        timestamp_header_value_mem5 <= (others => '0');
        timestamp_header_value_mem6 <= (others => '0');
        timestamp_header_value_mem7 <= (others => '0');
        timestamp_header_value_mem8 <= (others => '0');
        timestamp_header_value_mem9 <= (others => '0');
        current_num_samples_mem0 <= (others => '0');
        current_num_samples_mem1 <= (others => '0');
        current_num_samples_mem2 <= (others => '0');
        current_num_samples_mem3 <= (others => '0');
        current_num_samples_mem4 <= (others => '0');
        current_num_samples_mem5 <= (others => '0');
        current_num_samples_mem6 <= (others => '0');
        current_num_samples_mem7 <= (others => '0');
        current_num_samples_mem8 <= (others => '0');
        current_num_samples_mem9 <= (others => '0');
        current_write_memory <= cnt_memory_0; -- indicates whether memory_0, memory_1, memory_2, memory_3, memory_4, memory_5, memory_6, memory_7, memory_8 or memory_9 is being used to write the input data [default = memory_0]
        currentframe_processing_started <= '0';
        first_timestamp_half <= '1';
        PS_DAC_data_RAMB_data_in_ch01 <= (others => '0');
        PS_DAC_data_RAMB_data_in_ch23 <= (others => '0');
        PS_DAC_data_RAMB_validEnable_in_ch01 <= (others => '0');
        PS_DAC_data_RAMB_validEnable_in_ch23 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory0 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory1 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory2 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory3 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory4 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory5 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory6 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory7 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory8 <= (others => '0');
        PS_DAC_data_RAMB_write_index_memory9 <= (others => '0');

        PS_DAC_data_RAMB_ch01_0_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_0_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_0_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_1_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_1_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_1_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_2_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_2_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_2_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_3_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_3_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_3_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_4_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_4_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_4_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_5_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_5_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_5_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_6_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_6_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_6_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_7_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_7_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_7_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_8_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_8_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_8_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_9_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_9_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_9_byteWide_write_enable <= (others => (others => '0'));

        PS_DAC_data_RAMB_ch23_0_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_0_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_0_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_1_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_1_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_1_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_2_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_2_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_2_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_3_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_3_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_3_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_4_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_4_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_4_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_5_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_5_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_5_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_6_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_6_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_6_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_7_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_7_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_7_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_8_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_8_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_8_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_9_write_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_9_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_9_byteWide_write_enable <= (others => (others => '0'));
        frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME;

        mem0_pending_clear <= '0';
        mem1_pending_clear <= '0';
        mem2_pending_clear <= '0';
        mem3_pending_clear <= '0';
        mem4_pending_clear <= '0';
        mem5_pending_clear <= '0';
        mem6_pending_clear <= '0';
        mem7_pending_clear <= '0';
        mem8_pending_clear <= '0';
        mem9_pending_clear <= '0';
      else
        -- forward the input data (and associated valid-signals) to the RAMBs
        PS_DAC_data_RAMB_data_in_ch01 <= dac_data_1 & dac_data_0;
        PS_DAC_data_RAMB_data_in_ch23 <= dac_data_3 & dac_data_2;
        PS_DAC_data_RAMB_validEnable_in_ch01 <= (others => '0'); -- dac_enable_1 & dac_enable_0 & dac_valid_1 & dac_valid_0; -- @TO_BE_TESTED: the 'dac_enable_X' signals are stored but not currently used
        PS_DAC_data_RAMB_validEnable_in_ch23 <= (others => '0'); -- dac_enable_3 & dac_enable_2 & dac_valid_3 & dac_valid_2; -- @TO_BE_TESTED: the 'dac_enable_X' signals are stored but not currently used

        -- clear unused signals
        DMA_x_length_valid_int <= '0';
        PS_DAC_data_RAMB_ch01_0_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_0_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_1_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_1_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_2_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_2_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_3_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_3_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_4_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_4_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_5_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_5_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_6_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_6_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_7_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_7_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_8_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_8_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_9_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_9_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_0_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_0_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_1_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_1_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_2_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_2_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_3_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_3_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_4_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_4_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_5_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_5_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_6_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_6_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_7_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_7_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_8_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_8_byteWide_write_enable <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_9_write_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_9_byteWide_write_enable <= (others => (others => '0'));
        mem0_pending_clear <= '0';
        mem1_pending_clear <= '0';
        mem2_pending_clear <= '0';
        mem3_pending_clear <= '0';
        mem4_pending_clear <= '0';
        mem5_pending_clear <= '0';
        mem6_pending_clear <= '0';
        mem7_pending_clear <= '0';
        mem8_pending_clear <= '0';
        mem9_pending_clear <= '0';

        -- * [DMA X_length sniffing path] *; update 'DMA_x_length_int'
        if (not PARAM_DMA_LENGTH_IN_HEADER) and DMA_x_length_valid = '1' then
          DMA_x_length_int <= DMA_x_length;
        end if;

       -- when requested by the read logic, the timestamping and write control registers will be cleared (still, write has preference and if in the same clock cycle that a 'clear' is requested a new timestamp value needs to be written, the latter will be applied)
       -- [mem0]
       if pulse_clear_timestamping_ctrl_reg_mem0_AXIclk = '1' then
         timestamp_header_value_mem0 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory0 <= (others => '0');
         current_num_samples_mem0 <= (others => '0');
         mem0_pending_clear <= '1';
       end if;
       -- [mem1]
       if pulse_clear_timestamping_ctrl_reg_mem1_AXIclk = '1' then
         timestamp_header_value_mem1 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory1 <= (others => '0');
         current_num_samples_mem1 <= (others => '0');
         mem1_pending_clear <= '1';
       end if;
       -- [mem2]
       if pulse_clear_timestamping_ctrl_reg_mem2_AXIclk = '1' then
         timestamp_header_value_mem2 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory2 <= (others => '0');
         current_num_samples_mem2 <= (others => '0');
         mem2_pending_clear <= '1';
       end if;
       -- [mem3]
       if pulse_clear_timestamping_ctrl_reg_mem3_AXIclk = '1' then
         timestamp_header_value_mem3 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory3 <= (others => '0');
         current_num_samples_mem3 <= (others => '0');
         mem3_pending_clear <= '1';
       end if;
       -- [mem4]
       if pulse_clear_timestamping_ctrl_reg_mem4_AXIclk = '1' then
         timestamp_header_value_mem4 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory4 <= (others => '0');
         current_num_samples_mem4 <= (others => '0');
         mem4_pending_clear <= '1';
       end if;
       -- [mem5]
       if pulse_clear_timestamping_ctrl_reg_mem5_AXIclk = '1' then
         timestamp_header_value_mem5 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory5 <= (others => '0');
         current_num_samples_mem5 <= (others => '0');
         mem5_pending_clear <= '1';
       end if;
       -- [mem6]
       if pulse_clear_timestamping_ctrl_reg_mem6_AXIclk = '1' then
         timestamp_header_value_mem6 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory6 <= (others => '0');
         current_num_samples_mem6 <= (others => '0');
         mem6_pending_clear <= '1';
       end if;
       -- [mem7]
       if pulse_clear_timestamping_ctrl_reg_mem7_AXIclk = '1' then
         timestamp_header_value_mem7 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory7 <= (others => '0');
         current_num_samples_mem7 <= (others => '0');
         mem7_pending_clear <= '1';
       end if;
       -- [mem8]
       if pulse_clear_timestamping_ctrl_reg_mem8_AXIclk = '1' then
         timestamp_header_value_mem8 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory8 <= (others => '0');
         current_num_samples_mem8 <= (others => '0');
         mem8_pending_clear <= '1';
       end if;
       -- [mem9]
       if pulse_clear_timestamping_ctrl_reg_mem9_AXIclk = '1' then
         timestamp_header_value_mem9 <= (others => '0');
         PS_DAC_data_RAMB_write_index_memory9 <= (others => '0');
         current_num_samples_mem9 <= (others => '0');
         mem9_pending_clear <= '1';
       end if;

      -- * NOTE: uninterrupted write operations are supported (i.e., changing the target memory without introducing latencies) *; @TO_BE_TESTED: verify that this is possible when accounting for the internal cross-clock sharing latencies associated with 'DMA_x_length_applied' --_count_AXIclk'

      -- the I/Q packets received from the PS comprise N 32-bit words and have the following format (where N is always 8M, with M being an integer):
      --
      --  + synchronization_header: 6 32-bit words [0xbbbbaaaa, 0xddddcccc, 0xffffeeee, 0xabcddcba, 0xfedccdef, 0xdfcbaefd]
      --  + 64-bit simestamp: 2 32-bit words
      --  + I/Q data: N-8 32-bit words [16-bit I & 16-bit Q]

      -- the first 6 iterations of the state machine will be devoted to validate the synchronization header heading each IQ-frame sent by the PS
      -- [state 0]: validate synchronization word 1
      if frame_storing_state = cnt_frame_storing_state_WAIT_NEW_FRAME and dac_valid_0 = '1' and dac_valid_1 = '1' then
        -- search for the first synchronization word sent by the PS
        if dac_data_0 = cnt_1st_synchronization_word(15 downto 0) and dac_data_1 = cnt_1st_synchronization_word(31 downto 16) then
          frame_storing_state <= cnt_frame_storing_state_VERIFY_SYNC_HEADER_2nd;
        end if;
      -- [state 1]: validate synchronization word 2
      elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_2nd and dac_valid_0 = '1' and dac_valid_1 = '1' then
        -- search for the second synchronization word sent by the PS
        if dac_data_0 = cnt_2nd_synchronization_word(15 downto 0) and dac_data_1 = cnt_2nd_synchronization_word(31 downto 16) then
          frame_storing_state <= cnt_frame_storing_state_VERIFY_SYNC_HEADER_3rd;
        else -- in case the words are not detected, we'll go back to the [state 0]
          frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME;
        end if;
      -- [state 2]: validate synchronization word 3
      elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_3rd and dac_valid_0 = '1' and dac_valid_1 = '1' then
        -- * [DMA X_length in header path] *; search for the third synchronization word sent by the PS
        if PARAM_DMA_LENGTH_IN_HEADER then
          if dac_data_0 = cnt_3rd_synch_word_with_xlen then        -- extract packet length from the current header word
            DMA_x_length_int(15 downto 0) <= dac_data_1;           -- * NOTE: in order to use common variables for ADI DMA 'xlength' and DMA_length specified in header directly,
                                                                   -- *       for the latter we use DMA_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
            DMA_x_length_valid_int <= '1';
            frame_storing_state <= cnt_frame_storing_state_VERIFY_SYNC_HEADER_4th;
          else -- in case the words are not detected, we'll go back to the [state 0]
            frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME;
          end if;
        else
          if dac_data_0 = cnt_3rd_synchronization_word(15 downto 0) and dac_data_1 = cnt_3rd_synchronization_word(31 downto 16) then
            frame_storing_state <= cnt_frame_storing_state_VERIFY_SYNC_HEADER_4th;
          else -- in case the words are not detected, we'll go back to the [state 0]
            frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME;
          end if;
        end if;
      -- [state 3]: validate synchronization word 4
      elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_4th and dac_valid_0 = '1' and dac_valid_1 = '1' then
        -- search for the fourth synchronization word sent by the PS
        if dac_data_0 = cnt_4th_synchronization_word(15 downto 0) and dac_data_1 = cnt_4th_synchronization_word(31 downto 16) then
          frame_storing_state <= cnt_frame_storing_state_VERIFY_SYNC_HEADER_5th;
        else -- in case the words are not detected, we'll go back to the [state 0]
          frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME;
        end if;
      -- [state 4]: validate synchronization word 5
      elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_5th and dac_valid_0 = '1' and dac_valid_1 = '1' then
        -- search for the fifth synchronization word sent by the PS
        if dac_data_0 = cnt_5th_synchronization_word(15 downto 0) and dac_data_1 = cnt_5th_synchronization_word(31 downto 16) then
          frame_storing_state <= cnt_frame_storing_state_VERIFY_SYNC_HEADER_6th;
        else -- in case the words are not detected, we'll go back to the [state 0]
          frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME;
        end if;
      -- [state 5]: validate synchronization word 6
      elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_6th and dac_valid_0 = '1' and dac_valid_1 = '1' then
        -- search for the sixth synchronization word sent by the PS
        if dac_data_0 = cnt_6th_synchronization_word(15 downto 0) and dac_data_1 = cnt_6th_synchronization_word(31 downto 16) then
          frame_storing_state <= cnt_frame_storing_state_PROCESS_FRAME;
        else -- in case the words are not detected, we'll go back to the [state 0]
          frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME;
        end if;
      -- [state 6a - frame processing]: when a new I/Q sample-frame is received, we will extract the first 32 bits of the associated timestamp (given that, previously, a valid 'x_length' configuration has been passed to the DMA)
      elsif frame_storing_state = cnt_frame_storing_state_PROCESS_FRAME and dac_valid_0 = '1' and dac_valid_1 = '1' and currentframe_processing_started = '0' and first_timestamp_half = '1' then
        first_timestamp_half <= '0';

        -- update the MSBs of the timestamp
        if current_write_memory = cnt_memory_0 then    -- we will write to memory_0
          timestamp_header_value_mem0(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_1 then -- we will write to memory_1
          timestamp_header_value_mem1(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_2 then -- we will write to memory_2
          timestamp_header_value_mem2(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_3 then -- we will write to memory_3
          timestamp_header_value_mem3(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 then -- we will write to memory_4
          timestamp_header_value_mem4(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 then -- we will write to memory_5
          timestamp_header_value_mem5(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 then -- we will write to memory_6
          timestamp_header_value_mem6(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 then -- we will write to memory_7
          timestamp_header_value_mem7(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif current_write_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 then -- we will write to memory_8
          timestamp_header_value_mem8(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        elsif PARAM_BUFFER_LENGTH >= 10 then                                        -- we will write to memory_9
          timestamp_header_value_mem9(31 downto 0) <= dac_data_1 & dac_data_0; -- LSBs of the first PS value (64-bit timestamp)
        end if;
      -- [state 6b - frame processing]: with the second value of a new I/Q sampel-frame, we will extract the last 32 bits of the associated timestamp and store the remaining values
      elsif frame_storing_state = cnt_frame_storing_state_PROCESS_FRAME and dac_valid_0 = '1' and dac_valid_1 = '1' and currentframe_processing_started = '0' and first_timestamp_half = '0' and DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2) > cnt_0_C_NUM_ADDRESS_BITS then -- let's make sure that we got a meaningful value in 'DMA_x_length_minus31'
        currentframe_processing_started <= '1';
        first_timestamp_half <= '1'; -- we do restore the initial value so it will be ready for the next frame

        -- update the LSBs of the timestamp and all index control registers associated to destination write-memory and save the current 'x_length' configuration
        if current_write_memory = cnt_memory_0 then    -- we will write to memory_0
          timestamp_header_value_mem0(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory0 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem0 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_1 then -- we will write to memory_1
          timestamp_header_value_mem1(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory1 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem1 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_2 then -- we will write to memory_2
          timestamp_header_value_mem2(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory2 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem2 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_3 then -- we will write to memory_3
          timestamp_header_value_mem3(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory3 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem3 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 then -- we will write to memory_4
          timestamp_header_value_mem4(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory4 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem4 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 then -- we will write to memory_5
          timestamp_header_value_mem5(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory5 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem5 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 then -- we will write to memory_6
          timestamp_header_value_mem6(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory6 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem6 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 then -- we will write to memory_7
          timestamp_header_value_mem7(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory7 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem7 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif current_write_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 then -- we will write to memory_8
          timestamp_header_value_mem8(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory8 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem8 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        elsif PARAM_BUFFER_LENGTH >= 10 then                                        -- we will write to memory_9
          timestamp_header_value_mem9(63 downto 32) <= dac_data_1 & dac_data_0; -- MSBs of the first PS value (64-bit timestamp)
          PS_DAC_data_RAMB_write_index_memory9 <= (others => '0');

          -- we will now convert the DMA's 'x_length' parameter to the current number of samples comprising the I/Q frame, as follows:
          --
          --  + x_length = N, where N = M-1 + 32 = M + 31, where M is the number of I/Q-data bytes being forwarded by the DMA
          --  + num_samples = M/4, since each sample comprises one 16-bit I value and one 16-bit Q value (i.e., 4 bytes)
          --  + num_samples = (x_length - 31)/4, where the division is implemented as a 2-position shift to the right
          current_num_samples_mem9 <= DMA_x_length_minus31((C_NUM_ADDRESS_BITS+1) downto 2);
        end if;
      -- [state 6c - frame processing]: storing of the actual I/Q samples received from PS
      elsif frame_storing_state = cnt_frame_storing_state_PROCESS_FRAME and currentframe_processing_started = '1' then
        -- check if there is new I/Q data coming from the PS
        if dac_valid_0 = '1' or dac_valid_1 = '1' or (PARAM_TWO_ANTENNA_SUPPORT and (dac_valid_2 = '1' or dac_valid_3 = '1')) then
          if current_write_memory = cnt_memory_0 then    -- we will write to memory_0
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory0(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_0_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory0(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_0_write_enable(ramb_index) <= '1';
            PS_DAC_data_RAMB_ch01_0_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_0_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory0(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_0_write_enable(ramb_index) <= '1';
              PS_DAC_data_RAMB_ch23_0_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory0 < current_num_samples_mem0 or mem0_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory0 = current_num_samples_mem0_minus1 or mem0_pending_clear = '1' then
                currentframe_processing_started <= '0';
                current_write_memory <= cnt_memory_1;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory0 <= PS_DAC_data_RAMB_write_index_memory0 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_1 then -- we will write to memory_1
            -- select the appropriate RAMB instance
           ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory1(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

           PS_DAC_data_RAMB_ch01_1_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory1(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
           PS_DAC_data_RAMB_ch01_1_write_enable(ramb_index) <= '1';
           PS_DAC_data_RAMB_ch01_1_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
           -- *[two-antenna]*
           if PARAM_TWO_ANTENNA_SUPPORT then
             PS_DAC_data_RAMB_ch23_1_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory1(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
             PS_DAC_data_RAMB_ch23_1_write_enable(ramb_index) <= '1';
             PS_DAC_data_RAMB_ch23_1_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
           end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory1 < current_num_samples_mem1 or mem1_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory1 = current_num_samples_mem1_minus1 or mem1_pending_clear = '1' then
                currentframe_processing_started <= '0';
                current_write_memory <= cnt_memory_2;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory1 <= PS_DAC_data_RAMB_write_index_memory1 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_2 then -- we will write to memory_2
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory2(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_2_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory2(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_2_write_enable(ramb_index) <= '1';
            PS_DAC_data_RAMB_ch01_2_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_2_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory2(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_2_write_enable(ramb_index) <= '1';
              PS_DAC_data_RAMB_ch23_2_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory2 < current_num_samples_mem2 or mem2_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory2 = current_num_samples_mem2_minus1 or mem2_pending_clear = '1' then
                currentframe_processing_started <= '0';
                current_write_memory <= cnt_memory_3;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory2 <= PS_DAC_data_RAMB_write_index_memory2 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_3 then -- we will write to memory_3
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory3(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_3_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory3(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_3_write_enable(ramb_index) <= '1';
            PS_DAC_data_RAMB_ch01_3_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_3_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory3(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_3_write_enable(ramb_index) <= '1';
              PS_DAC_data_RAMB_ch23_3_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory3 < current_num_samples_mem3 or mem3_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory3 = current_num_samples_mem3_minus1 or mem3_pending_clear = '1' then
                currentframe_processing_started <= '0';
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 5 then
                  current_write_memory <= cnt_memory_4;
                else
                  current_write_memory <= cnt_memory_0;
                end if;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory3 <= PS_DAC_data_RAMB_write_index_memory3 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 then -- we will write to memory_4
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory4(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_4_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory4(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_4_write_enable(ramb_index) <= '1';
            PS_DAC_data_RAMB_ch01_4_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_4_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory4(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_4_write_enable(ramb_index) <= '1';
              PS_DAC_data_RAMB_ch23_4_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory4 < current_num_samples_mem4 or mem4_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory4 = current_num_samples_mem4_minus1 or mem4_pending_clear = '1'  then
                currentframe_processing_started <= '0';
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 6 then
                  current_write_memory <= cnt_memory_5;
                else
                  current_write_memory <= cnt_memory_0;
                end if;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory4 <= PS_DAC_data_RAMB_write_index_memory4 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 then -- we will write to memory_5
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory5(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_5_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory5(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_5_write_enable(ramb_index)  <= '1';
            PS_DAC_data_RAMB_ch01_5_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_5_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory5(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_5_write_enable(ramb_index)  <= '1';
              PS_DAC_data_RAMB_ch23_5_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory5 < current_num_samples_mem5 or mem5_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory5 = current_num_samples_mem5_minus1 or mem5_pending_clear = '1' then
                currentframe_processing_started <= '0';
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 7 then
                  current_write_memory <= cnt_memory_6;
                else
                  current_write_memory <= cnt_memory_0;
                end if;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory5 <= PS_DAC_data_RAMB_write_index_memory5 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 then -- we will write to memory_6
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory6(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_6_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory6(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_6_write_enable(ramb_index)  <= '1';
            PS_DAC_data_RAMB_ch01_6_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_6_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory6(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_6_write_enable(ramb_index)  <= '1';
              PS_DAC_data_RAMB_ch23_6_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory6 < current_num_samples_mem6 or mem6_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory6 = current_num_samples_mem6_minus1 or mem6_pending_clear = '1' then
                currentframe_processing_started <= '0';
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 8 then
                  current_write_memory <= cnt_memory_7;
                else
                  current_write_memory <= cnt_memory_0;
                end if;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory6 <= PS_DAC_data_RAMB_write_index_memory6 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 then -- we will write to memory_7
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory7(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_7_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory7(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_7_write_enable(ramb_index)  <= '1';
            PS_DAC_data_RAMB_ch01_7_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_7_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory7(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_7_write_enable(ramb_index)  <= '1';
              PS_DAC_data_RAMB_ch23_7_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory7 < current_num_samples_mem7 or mem7_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory7 = current_num_samples_mem7_minus1 or mem7_pending_clear = '1' then
                currentframe_processing_started <= '0';
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 9 then
                  current_write_memory <= cnt_memory_8;
                else
                  current_write_memory <= cnt_memory_0;
                end if;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory7 <= PS_DAC_data_RAMB_write_index_memory7 + cnt_1;
              end if;
            end if;
          elsif current_write_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 then -- we will write to memory_8
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory8(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_8_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory8(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_8_write_enable(ramb_index)  <= '1';
            PS_DAC_data_RAMB_ch01_8_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_8_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory8(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_8_write_enable(ramb_index)  <= '1';
              PS_DAC_data_RAMB_ch23_8_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory8 < current_num_samples_mem8 or mem8_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory8 = current_num_samples_mem8_minus1 or mem8_pending_clear = '1' then
                currentframe_processing_started <= '0';
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 10 then
                  current_write_memory <= cnt_memory_9;
                else
                  current_write_memory <= cnt_memory_0;
                end if;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory8 <= PS_DAC_data_RAMB_write_index_memory8 + cnt_1;
              end if;
            end if;
          elsif PARAM_BUFFER_LENGTH >= 10 then                                        -- we will write to memory_9
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_write_index_memory9(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_9_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory9(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_9_write_enable(ramb_index)  <= '1';
            PS_DAC_data_RAMB_ch01_9_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_9_write_address(ramb_index) <= PS_DAC_data_RAMB_write_index_memory9(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_9_write_enable(ramb_index)  <= '1';
              PS_DAC_data_RAMB_ch23_9_byteWide_write_enable(ramb_index)(3 downto 0) <= "1111";
            end if;

            -- update the write index and check if all samples of the current frame have been written (or if a large late situation has occurred and we should stop writing and change mem)
            if PS_DAC_data_RAMB_write_index_memory9 < current_num_samples_mem9 or mem9_pending_clear = '1' then
              -- check if we are currently processing the last sample of the current packet
              if PS_DAC_data_RAMB_write_index_memory9 = current_num_samples_mem9_minus1 or mem9_pending_clear = '1' then
                currentframe_processing_started <= '0';
                current_write_memory <= cnt_memory_0;
                frame_storing_state <= cnt_frame_storing_state_WAIT_NEW_FRAME; -- return to [state 0]
              else
                PS_DAC_data_RAMB_write_index_memory9 <= PS_DAC_data_RAMB_write_index_memory9 + cnt_1;
              end if;
            end if;
          end if;
        end if;
      end if;
    end if; -- end of reset
  end if; -- end of clk
end process;

  -- process generating 'frame_storing_start_flag'
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        frame_storing_start_flag <= '0';
      else
        -- we will enable this control signal when the storage of a new frame starts
        frame_storing_start_flag <= '0';
        if frame_storing_start_flag = '0' and frame_storing_state = cnt_frame_storing_state_PROCESS_FRAME and first_timestamp_half = '1' and currentframe_processing_started = '0' then
          frame_storing_start_flag <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'update_mem_timestamps_pulse'
  process(s_axi_aclk,s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        update_mem_timestamps_pulse <= '0';
      else
        -- we will enable this control signal when the storage of a new frame starts
        update_mem_timestamps_pulse <= '0';
        if (frame_storing_state = cnt_frame_storing_state_PROCESS_FRAME and currentframe_processing_started = '0'
            and first_timestamp_half = '0' and dac_valid_0 = '1' and dac_valid_1 = '1') then
          update_mem_timestamps_pulse <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'pulse_clear_timestamping_ctrl_reg_memX_AXIclk'
  process(s_axi_aclk, s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        pulse_clear_timestamping_ctrl_reg_mem0_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem1_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem2_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem3_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem4_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem5_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem6_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem7_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem8_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem9_AXIclk <= '0';
        new_clear_timestamping_pulse_mem0 <= '1';
        new_clear_timestamping_pulse_mem1 <= '1';
        new_clear_timestamping_pulse_mem2 <= '1';
        new_clear_timestamping_pulse_mem3 <= '1';
        new_clear_timestamping_pulse_mem4 <= '1';
        new_clear_timestamping_pulse_mem5 <= '1';
        new_clear_timestamping_pulse_mem6 <= '1';
        new_clear_timestamping_pulse_mem7 <= '1';
        new_clear_timestamping_pulse_mem8 <= '1';
        new_clear_timestamping_pulse_mem9 <= '1';
      else
        --clear the pulse signal
        pulse_clear_timestamping_ctrl_reg_mem0_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem1_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem2_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem3_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem4_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem5_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem6_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem7_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem8_AXIclk <= '0';
        pulse_clear_timestamping_ctrl_reg_mem9_AXIclk <= '0';

        -- activate the pulse on a new storage operation only
        -- [mem0]
        if pulse_clear_timestamping_ctrl_reg_mem0_AXIclk = '0' and clear_timestamping_ctrl_reg_mem0_AXIclk = '1' and new_clear_timestamping_pulse_mem0 = '1' then
          pulse_clear_timestamping_ctrl_reg_mem0_AXIclk <= '1';
          new_clear_timestamping_pulse_mem0 <= '0';
        elsif clear_timestamping_ctrl_reg_mem0_AXIclk = '0' and new_clear_timestamping_pulse_mem0 = '0' then
          new_clear_timestamping_pulse_mem0 <= '1';
        end if;
        -- [mem1]
        if pulse_clear_timestamping_ctrl_reg_mem1_AXIclk = '0' and clear_timestamping_ctrl_reg_mem1_AXIclk = '1' and new_clear_timestamping_pulse_mem1 = '1' then
          pulse_clear_timestamping_ctrl_reg_mem1_AXIclk <= '1';
          new_clear_timestamping_pulse_mem1 <= '0';
        elsif clear_timestamping_ctrl_reg_mem1_AXIclk = '0' and new_clear_timestamping_pulse_mem1 = '0' then
          new_clear_timestamping_pulse_mem1 <= '1';
        end if;
        -- [mem2]
        if pulse_clear_timestamping_ctrl_reg_mem2_AXIclk = '0' and clear_timestamping_ctrl_reg_mem2_AXIclk = '1' and new_clear_timestamping_pulse_mem2 = '1' then
          pulse_clear_timestamping_ctrl_reg_mem2_AXIclk <= '1';
          new_clear_timestamping_pulse_mem2 <= '0';
        elsif clear_timestamping_ctrl_reg_mem2_AXIclk = '0' and new_clear_timestamping_pulse_mem2 = '0' then
          new_clear_timestamping_pulse_mem2 <= '1';
        end if;
        -- [mem3]
        if pulse_clear_timestamping_ctrl_reg_mem3_AXIclk = '0' and clear_timestamping_ctrl_reg_mem3_AXIclk = '1' and new_clear_timestamping_pulse_mem3 = '1' then
          pulse_clear_timestamping_ctrl_reg_mem3_AXIclk <= '1';
          new_clear_timestamping_pulse_mem3 <= '0';
        elsif clear_timestamping_ctrl_reg_mem3_AXIclk = '0' and new_clear_timestamping_pulse_mem3 = '0' then
          new_clear_timestamping_pulse_mem3 <= '1';
        end if;
        -- [mem4]
        if PARAM_BUFFER_LENGTH >= 5 then
          if pulse_clear_timestamping_ctrl_reg_mem4_AXIclk = '0' and clear_timestamping_ctrl_reg_mem4_AXIclk = '1' and new_clear_timestamping_pulse_mem4 = '1' then
            pulse_clear_timestamping_ctrl_reg_mem4_AXIclk <= '1';
            new_clear_timestamping_pulse_mem4 <= '0';
          elsif clear_timestamping_ctrl_reg_mem4_AXIclk = '0' and new_clear_timestamping_pulse_mem4 = '0' then
            new_clear_timestamping_pulse_mem4 <= '1';
          end if;
        end if;
        -- [mem5]
        if PARAM_BUFFER_LENGTH >= 6 then
          if pulse_clear_timestamping_ctrl_reg_mem5_AXIclk = '0' and clear_timestamping_ctrl_reg_mem5_AXIclk = '1' and new_clear_timestamping_pulse_mem5 = '1' then
            pulse_clear_timestamping_ctrl_reg_mem5_AXIclk <= '1';
            new_clear_timestamping_pulse_mem5 <= '0';
          elsif clear_timestamping_ctrl_reg_mem5_AXIclk = '0' and new_clear_timestamping_pulse_mem5 = '0' then
            new_clear_timestamping_pulse_mem5 <= '1';
          end if;
        end if;
        -- [mem6]
        if PARAM_BUFFER_LENGTH >= 7 then
          if pulse_clear_timestamping_ctrl_reg_mem6_AXIclk = '0' and clear_timestamping_ctrl_reg_mem6_AXIclk = '1' and new_clear_timestamping_pulse_mem6 = '1' then
            pulse_clear_timestamping_ctrl_reg_mem6_AXIclk <= '1';
            new_clear_timestamping_pulse_mem6 <= '0';
          elsif clear_timestamping_ctrl_reg_mem6_AXIclk = '0' and new_clear_timestamping_pulse_mem6 = '0' then
            new_clear_timestamping_pulse_mem6 <= '1';
          end if;
        end if;
        -- [mem7]
        if PARAM_BUFFER_LENGTH >= 8 then
          if pulse_clear_timestamping_ctrl_reg_mem7_AXIclk = '0' and clear_timestamping_ctrl_reg_mem7_AXIclk = '1' and new_clear_timestamping_pulse_mem7 = '1' then
            pulse_clear_timestamping_ctrl_reg_mem7_AXIclk <= '1';
            new_clear_timestamping_pulse_mem7 <= '0';
          elsif clear_timestamping_ctrl_reg_mem7_AXIclk = '0' and new_clear_timestamping_pulse_mem7 = '0' then
            new_clear_timestamping_pulse_mem7 <= '1';
          end if;
        end if;
        -- [mem8]
        if PARAM_BUFFER_LENGTH >= 9 then
          if pulse_clear_timestamping_ctrl_reg_mem8_AXIclk = '0' and clear_timestamping_ctrl_reg_mem8_AXIclk = '1' and new_clear_timestamping_pulse_mem8 = '1' then
            pulse_clear_timestamping_ctrl_reg_mem8_AXIclk <= '1';
            new_clear_timestamping_pulse_mem8 <= '0';
          elsif clear_timestamping_ctrl_reg_mem8_AXIclk = '0' and new_clear_timestamping_pulse_mem8 = '0' then
            new_clear_timestamping_pulse_mem8 <= '1';
          end if;
        end if;
        -- [mem9]
        if PARAM_BUFFER_LENGTH >= 10 then
          if pulse_clear_timestamping_ctrl_reg_mem9_AXIclk = '0' and clear_timestamping_ctrl_reg_mem9_AXIclk = '1' and new_clear_timestamping_pulse_mem9 = '1' then
            pulse_clear_timestamping_ctrl_reg_mem9_AXIclk <= '1';
            new_clear_timestamping_pulse_mem9 <= '0';
          elsif clear_timestamping_ctrl_reg_mem9_AXIclk = '0' and new_clear_timestamping_pulse_mem9 = '0' then
            new_clear_timestamping_pulse_mem9 <= '1';
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating delayed versions of 'pulse_clear_timestamping_ctrl_reg_memX_AXIclk'
  process(s_axi_aclk, s_axi_aresetn)
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        pulse_clear_timestamping_ctrl_reg_mem0_AXIclk_i <= '0';
        pulse_clear_timestamping_ctrl_reg_mem1_AXIclk_i <= '0';
        pulse_clear_timestamping_ctrl_reg_mem2_AXIclk_i <= '0';
        pulse_clear_timestamping_ctrl_reg_mem3_AXIclk_i <= '0';
        if (PARAM_BUFFER_LENGTH >= 5) then
          pulse_clear_timestamping_ctrl_reg_mem4_AXIclk_i <= '0';
        end if;
        if (PARAM_BUFFER_LENGTH >= 6) then
          pulse_clear_timestamping_ctrl_reg_mem5_AXIclk_i <= '0';
        end if;
        if (PARAM_BUFFER_LENGTH >= 7) then
          pulse_clear_timestamping_ctrl_reg_mem6_AXIclk_i <= '0';
        end if;
        if (PARAM_BUFFER_LENGTH >= 8) then
          pulse_clear_timestamping_ctrl_reg_mem7_AXIclk_i <= '0';
        end if;
        if (PARAM_BUFFER_LENGTH >= 9) then
          pulse_clear_timestamping_ctrl_reg_mem8_AXIclk_i <= '0';
        end if;
        if (PARAM_BUFFER_LENGTH >= 10) then
          pulse_clear_timestamping_ctrl_reg_mem9_AXIclk_i <= '0';
        end if;
      else
        pulse_clear_timestamping_ctrl_reg_mem0_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem0_AXIclk;
        pulse_clear_timestamping_ctrl_reg_mem1_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem1_AXIclk;
        pulse_clear_timestamping_ctrl_reg_mem2_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem2_AXIclk;
        pulse_clear_timestamping_ctrl_reg_mem3_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem3_AXIclk;
        if (PARAM_BUFFER_LENGTH >= 5) then
          pulse_clear_timestamping_ctrl_reg_mem4_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem4_AXIclk;
        end if;
        if (PARAM_BUFFER_LENGTH >= 6) then
          pulse_clear_timestamping_ctrl_reg_mem5_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem5_AXIclk;
    end if;
        if (PARAM_BUFFER_LENGTH >= 7) then
          pulse_clear_timestamping_ctrl_reg_mem6_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem6_AXIclk;
        end if;
        if (PARAM_BUFFER_LENGTH >= 8) then
          pulse_clear_timestamping_ctrl_reg_mem7_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem7_AXIclk;
        end if;
        if (PARAM_BUFFER_LENGTH >= 9) then
          pulse_clear_timestamping_ctrl_reg_mem8_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem8_AXIclk;
        end if;
        if (PARAM_BUFFER_LENGTH >= 10) then
          pulse_clear_timestamping_ctrl_reg_mem9_AXIclk_i <= pulse_clear_timestamping_ctrl_reg_mem9_AXIclk;
    end if;
      end if;
    end if;
  end process;

  -- ***************************************************
  -- management of the amount of buffered IQ-frames
  -- ***************************************************

  -- process controlling the number of received 'x_length' values for control purposes
  process(s_axi_aclk,s_axi_aresetn)
    variable DMA_length_valid_var : std_logic;
  begin
    if rising_edge(s_axi_aclk) then
      if s_axi_aresetn='0' then -- synchronous low-active reset: initialization of signals
        DMA_x_length_valid_count <= (others => '0');
        DMA_length_valid_var := '0';
      else
        if PARAM_DMA_LENGTH_IN_HEADER then
          DMA_length_valid_var := DMA_x_length_valid_int;
        else
          DMA_length_valid_var := DMA_x_length_valid;
        end if;
        -- update number of 'x_length' values received from PS (i.e., DMA write requests or number of received frames)
        if DMA_length_valid_var = '1' and DMA_x_length_applied_AXIclk = '0' then
          DMA_x_length_valid_count <= DMA_x_length_valid_count + cnt_1_5b;
        elsif DMA_length_valid_var = '0' and DMA_x_length_applied_AXIclk = '1' and DMA_x_length_applied_AXIclk_valid = '1'then
          DMA_x_length_valid_count <= DMA_x_length_valid_count - cnt_1_5b;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'fwd_late_count'
  process(DACxN_clk,DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        fwd_late_count <= (others => '0');
      else
        if ((current_read_memory = cnt_memory_0 and fwd_late_mem0 = '1') or
            (current_read_memory = cnt_memory_1 and fwd_late_mem1 = '1') or
            (current_read_memory = cnt_memory_2 and fwd_late_mem2 = '1') or
            (current_read_memory = cnt_memory_3 and fwd_late_mem3 = '1') or
            (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_late_mem4 = '1') or
            (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_late_mem5 = '1') or
            (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_late_mem6 = '1') or
            (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_late_mem7 = '1') or
            (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_late_mem8 = '1') or
            (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_late_mem9 = '1')) and
            current_read_period_count = x"000" and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwd_late_count <= fwd_late_count + cnt_1;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating 'pulse_frame_storing_start_flag_DACxNclk' (i.e., to make sure that each new frame storage is only accounted once)
  process(DACxN_clk, DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        pulse_frame_storing_start_flag_DACxNclk <= '0';
        new_frame_storing_pulse <= '1';
      else
        --clear the pulse signal
        pulse_frame_storing_start_flag_DACxNclk <= '0';

        -- activate the pulse on a new storage operation only
        if pulse_frame_storing_start_flag_DACxNclk = '0' and frame_storing_start_flag_DACxNclk = '1' and new_frame_storing_pulse = '1' then
          pulse_frame_storing_start_flag_DACxNclk <= '1';
          new_frame_storing_pulse <= '0';
        elsif frame_storing_start_flag_DACxNclk = '0' and new_frame_storing_pulse = '0' then
          new_frame_storing_pulse <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process updating 'num_of_stored_frames' and 'DMA_x_length_applied'
  --  * NOTE: if no new samples have been submitted by the PS (i.e, empty buffers), we shall not forward data to the DAC *
  process(DACxN_clk, DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        num_of_stored_frames <= (others => '0');
        read_memory_just_cleared <= '0';
        DMA_x_length_applied <= '0';
      else
        -- clear unused signals
        DMA_x_length_applied <= '0';
        read_memory_just_cleared <= '0';

        -- check if a new I/Q-sample frame has been fully forwarded (update @DAC_clk)
        if fwdframe_processing_started = '1' and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) and
           ((current_read_memory = cnt_memory_0 and PS_DAC_data_RAMB_read_index_memory0 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory0 = PS_DAC_data_RAMB_final_index_memory0_minus1 or PS_DAC_data_RAMB_read_index_memory0 = fwd_current_num_samples_mem0)) or
            (current_read_memory = cnt_memory_1 and PS_DAC_data_RAMB_read_index_memory1 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory1 = PS_DAC_data_RAMB_final_index_memory1_minus1 or PS_DAC_data_RAMB_read_index_memory1 = fwd_current_num_samples_mem1)) or
            (current_read_memory = cnt_memory_2 and PS_DAC_data_RAMB_read_index_memory2 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory2 = PS_DAC_data_RAMB_final_index_memory2_minus1 or PS_DAC_data_RAMB_read_index_memory2 = fwd_current_num_samples_mem2)) or
            (current_read_memory = cnt_memory_3 and PS_DAC_data_RAMB_read_index_memory3 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory3 = PS_DAC_data_RAMB_final_index_memory3_minus1 or PS_DAC_data_RAMB_read_index_memory3 = fwd_current_num_samples_mem3)) or
            (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and PS_DAC_data_RAMB_read_index_memory4 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory4 = PS_DAC_data_RAMB_final_index_memory4_minus1 or PS_DAC_data_RAMB_read_index_memory4 = fwd_current_num_samples_mem4)) or
            (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and PS_DAC_data_RAMB_read_index_memory5 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory5 = PS_DAC_data_RAMB_final_index_memory5_minus1 or PS_DAC_data_RAMB_read_index_memory5 = fwd_current_num_samples_mem5)) or
            (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and PS_DAC_data_RAMB_read_index_memory6 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory6 = PS_DAC_data_RAMB_final_index_memory6_minus1 or PS_DAC_data_RAMB_read_index_memory6 = fwd_current_num_samples_mem6)) or
            (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and PS_DAC_data_RAMB_read_index_memory7 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory7 = PS_DAC_data_RAMB_final_index_memory7_minus1 or PS_DAC_data_RAMB_read_index_memory7 = fwd_current_num_samples_mem7)) or
            (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and PS_DAC_data_RAMB_read_index_memory8 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory8 = PS_DAC_data_RAMB_final_index_memory8_minus1 or PS_DAC_data_RAMB_read_index_memory8 = fwd_current_num_samples_mem8)) or
            (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and PS_DAC_data_RAMB_read_index_memory9 > cnt_0 and (PS_DAC_data_RAMB_read_index_memory9 = PS_DAC_data_RAMB_final_index_memory9_minus1 or PS_DAC_data_RAMB_read_index_memory9 = fwd_current_num_samples_mem9))) then
          -- check that the current read operation is not ending in the same clock cycle were it starts the writing of the next frame and, also, that there is actually at least one stored frame
          if pulse_frame_storing_start_flag_DACxNclk = '0' and num_of_stored_frames > cnt_0_5b then
            num_of_stored_frames <= num_of_stored_frames - cnt_1_5b;
            read_memory_just_cleared <= '1';
          end if;
          DMA_x_length_applied <= '1';
        elsif large_early_situation = '1' and read_memory_just_cleared = '0' then
          -- check that the current read operation is not ending in the same clock cycle were it starts the writing of the next frame and, also, that there is actually at least one stored frame
          if pulse_frame_storing_start_flag_DACxNclk = '0' and num_of_stored_frames > cnt_0_5b then
            num_of_stored_frames <= num_of_stored_frames - cnt_1_5b;
            read_memory_just_cleared <= '1';
          end if;
          DMA_x_length_applied <= '1';
        -- check if a new I/Q sample-frame is being received and that a current valid 'x_length' configuration has been passed to the DMA [we already know that it is not in the same clock cycle were the reading of the previous one ended]
        elsif pulse_frame_storing_start_flag_DACxNclk = '1' then
          num_of_stored_frames <= num_of_stored_frames + cnt_1_5b; -- @TO_BE_TESTED: check that we will never have more stored data than we can handle (i.e., more than 3 buffers)
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- time comparing logic and I/Q sample forwarding
  -- ***************************************************

-- ** FPGA/sampling clock with a x2 ratio: forwarded outputs will have a 1/2 ratio **
clock_enable_processing : if (not PARAM_x1_FPGA_SAMPLING_RATIO) generate
  -- generation of an internal clock-enable signal used to match the output data-rate with the input one
  process(DACxN_clk,DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        clock_enable_counter <= cnt_3_3b; -- @TO_BE_TESTED: we would usually initialize it to '0', but given that the internal latency is not divisible by either 2 or 4 this "strange" initialization allows aligning 'fwd_dac_X' to 'current_lclk_count'
      else
        -- clock enable control (implemented according to 'DAC_clk_division')
        if (clock_enable_counter < cnt_1_3b) then -- and DAC_clk_division = '1') or   -- 1x1 antenna configuration [N = 2]
           --(clock_enable_counter < cnt_3_3b and DAC_clk_division = '0') then -- 2x2 antenna configuration [N = 4]
          clock_enable_counter <= clock_enable_counter + cnt_1_3b;
        else
          clock_enable_counter <= (others => '0');
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;
end generate clock_enable_processing;

  -- concurrent calculation of the control indexes
  fwd_current_num_samples_mem0_minus1 <= fwd_current_num_samples_mem0 - cnt_1;
  fwd_current_num_samples_mem0_minus2 <= fwd_current_num_samples_mem0 - cnt_2;
  fwd_current_num_samples_mem1_minus1 <= fwd_current_num_samples_mem1 - cnt_1;
  fwd_current_num_samples_mem1_minus2 <= fwd_current_num_samples_mem1 - cnt_2;
  fwd_current_num_samples_mem2_minus1 <= fwd_current_num_samples_mem2 - cnt_1;
  fwd_current_num_samples_mem2_minus2 <= fwd_current_num_samples_mem2 - cnt_2;
  fwd_current_num_samples_mem3_minus1 <= fwd_current_num_samples_mem3 - cnt_1;
  fwd_current_num_samples_mem3_minus2 <= fwd_current_num_samples_mem3 - cnt_2;
fwd_curr_num_smp_min1_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
  fwd_current_num_samples_mem4_minus1 <= fwd_current_num_samples_mem4 - cnt_1;
  fwd_current_num_samples_mem4_minus2 <= fwd_current_num_samples_mem4 - cnt_2;
end generate fwd_curr_num_smp_min1_5mem;
fwd_curr_num_smp_min1_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
  fwd_current_num_samples_mem5_minus1 <= fwd_current_num_samples_mem5 - cnt_1;
  fwd_current_num_samples_mem5_minus2 <= fwd_current_num_samples_mem5 - cnt_2;
end generate fwd_curr_num_smp_min1_6mem;
fwd_curr_num_smp_min1_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
  fwd_current_num_samples_mem6_minus1 <= fwd_current_num_samples_mem6 - cnt_1;
  fwd_current_num_samples_mem6_minus2 <= fwd_current_num_samples_mem6 - cnt_2;
end generate fwd_curr_num_smp_min1_7mem;
fwd_curr_num_smp_min1_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
  fwd_current_num_samples_mem7_minus1 <= fwd_current_num_samples_mem7 - cnt_1;
  fwd_current_num_samples_mem7_minus2 <= fwd_current_num_samples_mem7 - cnt_2;
end generate fwd_curr_num_smp_min1_8mem;
fwd_curr_num_smp_min1_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
  fwd_current_num_samples_mem8_minus1 <= fwd_current_num_samples_mem8 - cnt_1;
  fwd_current_num_samples_mem8_minus2 <= fwd_current_num_samples_mem8 - cnt_2;
end generate fwd_curr_num_smp_min1_9mem;
fwd_curr_num_smp_min1_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
  fwd_current_num_samples_mem9_minus1 <= fwd_current_num_samples_mem9 - cnt_1;
  fwd_current_num_samples_mem9_minus2 <= fwd_current_num_samples_mem9 - cnt_2;
end generate fwd_curr_num_smp_min1_10mem;

  -- concurrent calculation of the control indexes
  baseline_late_time_difference_mem0 <= current_lclk_count_int - timestamp_header_value_mem0_DACxNclk;
  baseline_late_time_difference_mem1 <= current_lclk_count_int - timestamp_header_value_mem1_DACxNclk;
  baseline_late_time_difference_mem2 <= current_lclk_count_int - timestamp_header_value_mem2_DACxNclk;
  baseline_late_time_difference_mem3 <= current_lclk_count_int - timestamp_header_value_mem3_DACxNclk;
baseline_late_time_diff_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
  baseline_late_time_difference_mem4 <= current_lclk_count_int - timestamp_header_value_mem4_DACxNclk;
end generate baseline_late_time_diff_5mem;
baseline_late_time_diff_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
  baseline_late_time_difference_mem5 <= current_lclk_count_int - timestamp_header_value_mem5_DACxNclk;
end generate baseline_late_time_diff_6mem;
baseline_late_time_diff_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
  baseline_late_time_difference_mem6 <= current_lclk_count_int - timestamp_header_value_mem6_DACxNclk;
end generate baseline_late_time_diff_7mem;
baseline_late_time_diff_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
  baseline_late_time_difference_mem7 <= current_lclk_count_int - timestamp_header_value_mem7_DACxNclk;
end generate baseline_late_time_diff_8mem;
baseline_late_time_diff_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
  baseline_late_time_difference_mem8 <= current_lclk_count_int - timestamp_header_value_mem8_DACxNclk;
end generate baseline_late_time_diff_9mem;
baseline_late_time_diff_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
  baseline_late_time_difference_mem9 <= current_lclk_count_int - timestamp_header_value_mem9_DACxNclk;
end generate baseline_late_time_diff_10mem;

-- concurrent calculation of the control indexes
PS_DAC_data_RAMB_final_index_memory0_minus1 <= PS_DAC_data_RAMB_final_index_memory0 - cnt_1;
PS_DAC_data_RAMB_final_index_memory0_minus2 <= PS_DAC_data_RAMB_final_index_memory0 - cnt_2;
PS_DAC_data_RAMB_final_index_memory1_minus1 <= PS_DAC_data_RAMB_final_index_memory1 - cnt_1;
PS_DAC_data_RAMB_final_index_memory1_minus2 <= PS_DAC_data_RAMB_final_index_memory1 - cnt_2;
PS_DAC_data_RAMB_final_index_memory2_minus1 <= PS_DAC_data_RAMB_final_index_memory2 - cnt_1;
PS_DAC_data_RAMB_final_index_memory2_minus2 <= PS_DAC_data_RAMB_final_index_memory2 - cnt_2;
PS_DAC_data_RAMB_final_index_memory3_minus1 <= PS_DAC_data_RAMB_final_index_memory3 - cnt_1;
PS_DAC_data_RAMB_final_index_memory3_minus2 <= PS_DAC_data_RAMB_final_index_memory3 - cnt_2;
RAMB_final_ix_min1_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
  PS_DAC_data_RAMB_final_index_memory4_minus1 <= PS_DAC_data_RAMB_final_index_memory4 - cnt_1;
  PS_DAC_data_RAMB_final_index_memory4_minus2 <= PS_DAC_data_RAMB_final_index_memory4 - cnt_2;
end generate RAMB_final_ix_min1_5mem;
RAMB_final_ix_min1_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
  PS_DAC_data_RAMB_final_index_memory5_minus1 <= PS_DAC_data_RAMB_final_index_memory5 - cnt_1;
  PS_DAC_data_RAMB_final_index_memory5_minus2 <= PS_DAC_data_RAMB_final_index_memory5 - cnt_2;
end generate RAMB_final_ix_min1_6mem;
RAMB_final_ix_min1_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
  PS_DAC_data_RAMB_final_index_memory6_minus1 <= PS_DAC_data_RAMB_final_index_memory6 - cnt_1;
  PS_DAC_data_RAMB_final_index_memory6_minus2 <= PS_DAC_data_RAMB_final_index_memory6 - cnt_2;
end generate RAMB_final_ix_min1_7mem;
RAMB_final_ix_min1_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
  PS_DAC_data_RAMB_final_index_memory7_minus1 <= PS_DAC_data_RAMB_final_index_memory7 - cnt_1;
  PS_DAC_data_RAMB_final_index_memory7_minus2 <= PS_DAC_data_RAMB_final_index_memory7 - cnt_2;
end generate RAMB_final_ix_min1_8mem;
RAMB_final_ix_min1_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
  PS_DAC_data_RAMB_final_index_memory8_minus1 <= PS_DAC_data_RAMB_final_index_memory8 - cnt_1;
  PS_DAC_data_RAMB_final_index_memory8_minus2 <= PS_DAC_data_RAMB_final_index_memory8 - cnt_2;
end generate RAMB_final_ix_min1_9mem;
RAMB_final_ix_min1_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
  PS_DAC_data_RAMB_final_index_memory9_minus1 <= PS_DAC_data_RAMB_final_index_memory9 - cnt_1;
  PS_DAC_data_RAMB_final_index_memory9_minus2 <= PS_DAC_data_RAMB_final_index_memory9 - cnt_2;
end generate RAMB_final_ix_min1_10mem;

  -- concurrent calculation of the control indexes
  timestamp_header_value_mem0_minus_buffer_latency <= timestamp_header_value_mem0_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem1_minus_buffer_latency <= timestamp_header_value_mem1_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem2_minus_buffer_latency <= timestamp_header_value_mem2_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem3_minus_buffer_latency <= timestamp_header_value_mem3_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem0_minus_buffer_latency_plus1 <= timestamp_header_value_mem0_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
  timestamp_header_value_mem1_minus_buffer_latency_plus1 <= timestamp_header_value_mem1_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
  timestamp_header_value_mem2_minus_buffer_latency_plus1 <= timestamp_header_value_mem2_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
  timestamp_header_value_mem3_minus_buffer_latency_plus1 <= timestamp_header_value_mem3_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
tmst_hdr_min_buff_lat_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
  timestamp_header_value_mem4_minus_buffer_latency <= timestamp_header_value_mem4_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem4_minus_buffer_latency_plus1 <= timestamp_header_value_mem4_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
end generate tmst_hdr_min_buff_lat_5mem;
tmst_hdr_min_buff_lat_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
  timestamp_header_value_mem5_minus_buffer_latency <= timestamp_header_value_mem5_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem5_minus_buffer_latency_plus1 <= timestamp_header_value_mem5_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
end generate tmst_hdr_min_buff_lat_6mem;
tmst_hdr_min_buff_lat_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
  timestamp_header_value_mem6_minus_buffer_latency <= timestamp_header_value_mem6_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem6_minus_buffer_latency_plus1 <= timestamp_header_value_mem6_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
end generate tmst_hdr_min_buff_lat_7mem;
tmst_hdr_min_buff_lat_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
  timestamp_header_value_mem7_minus_buffer_latency <= timestamp_header_value_mem7_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem7_minus_buffer_latency_plus1 <= timestamp_header_value_mem7_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
end generate tmst_hdr_min_buff_lat_8mem;
tmst_hdr_min_buff_lat_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
  timestamp_header_value_mem8_minus_buffer_latency <= timestamp_header_value_mem8_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem8_minus_buffer_latency_plus1 <= timestamp_header_value_mem8_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
end generate tmst_hdr_min_buff_lat_9mem;
tmst_hdr_min_buff_lat_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
  timestamp_header_value_mem9_minus_buffer_latency <= timestamp_header_value_mem9_DACxNclk - cnt_internal_buffer_latency_64b;
  timestamp_header_value_mem9_minus_buffer_latency_plus1 <= timestamp_header_value_mem9_DACxNclk - cnt_internal_buffer_latency_plus1_64b;
end generate tmst_hdr_min_buff_lat_10mem;

  -- concurrent calculation of the control indexes
  PS_DAC_data_RAMB_write_index_memory0_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory0_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory0_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory0_DACxNclk - cnt_2;
  PS_DAC_data_RAMB_write_index_memory1_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory1_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory1_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory1_DACxNclk - cnt_2;
  PS_DAC_data_RAMB_write_index_memory2_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory2_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory2_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory2_DACxNclk - cnt_2;
  PS_DAC_data_RAMB_write_index_memory3_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory3_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory3_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory3_DACxNclk - cnt_2;
RAMB_write_ix_min3_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
  PS_DAC_data_RAMB_write_index_memory4_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory4_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory4_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory4_DACxNclk - cnt_2;
end generate RAMB_write_ix_min3_5mem;
RAMB_write_ix_min3_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
  PS_DAC_data_RAMB_write_index_memory5_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory5_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory5_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory5_DACxNclk - cnt_2;
end generate RAMB_write_ix_min3_6mem;
RAMB_write_ix_min3_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
  PS_DAC_data_RAMB_write_index_memory6_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory6_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory6_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory6_DACxNclk - cnt_2;
end generate RAMB_write_ix_min3_7mem;
RAMB_write_ix_min3_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
  PS_DAC_data_RAMB_write_index_memory7_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory7_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory7_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory7_DACxNclk - cnt_2;
end generate RAMB_write_ix_min3_8mem;
RAMB_write_ix_min3_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
  PS_DAC_data_RAMB_write_index_memory8_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory8_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory8_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory8_DACxNclk - cnt_2;
end generate RAMB_write_ix_min3_9mem;
RAMB_write_ix_min3_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
  PS_DAC_data_RAMB_write_index_memory9_DACxNclk_minus3 <= PS_DAC_data_RAMB_write_index_memory9_DACxNclk - cnt_3;
  PS_DAC_data_RAMB_write_index_memory9_DACxNclk_minus2 <= PS_DAC_data_RAMB_write_index_memory9_DACxNclk - cnt_2;
end generate RAMB_write_ix_min3_10mem;

  -- process comparing the current time with the received timestamps and managing the reading of the internal buffer
  --   * NOTE: by separating the control-logic in charge of updating the read-index pointer and that one managing the forwarding of sample-frames
  --           (i.e., different logic managing the RAMB index generation and the number of samples forwarded in relation to 'x_length'), we naturally
  --           obtain a resource-efficient manner to implement the required circular-buffer access features. *
  process(DACxN_clk, DACxN_reset)
    variable ramb_index : integer;
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset = '1' then -- synchronous high-active reset: initialization of signals
        fwd_current_time_int <= (others => '0');
        fwd_time_difference_mem0 <= (others => '0');
        fwd_time_difference_mem1 <= (others => '0');
        fwd_time_difference_mem2 <= (others => '0');
        fwd_time_difference_mem3 <= (others => '0');
        fwd_time_difference_mem4 <= (others => '0');
        fwd_time_difference_mem5 <= (others => '0');
        fwd_time_difference_mem6 <= (others => '0');
        fwd_time_difference_mem7 <= (others => '0');
        fwd_time_difference_mem8 <= (others => '0');
        fwd_time_difference_mem9 <= (others => '0');
        fwd_early_mem0 <= '0';
        fwd_early_mem1 <= '0';
        fwd_early_mem2 <= '0';
        fwd_early_mem3 <= '0';
        fwd_early_mem4 <= '0';
        fwd_early_mem5 <= '0';
        fwd_early_mem6 <= '0';
        fwd_early_mem7 <= '0';
        fwd_early_mem8 <= '0';
        fwd_early_mem9 <= '0';
        fwd_late_mem0 <= '0';
        fwd_late_mem1 <= '0';
        fwd_late_mem2 <= '0';
        fwd_late_mem3 <= '0';
        fwd_late_mem4 <= '0';
        fwd_late_mem5 <= '0';
        fwd_late_mem6 <= '0';
        fwd_late_mem7 <= '0';
        fwd_late_mem8 <= '0';
        fwd_late_mem9 <= '0';
        -- fwd_timestamp_header_value_mem0 <= (others => '0');
        -- fwd_timestamp_header_value_mem1 <= (others => '0');
        -- fwd_timestamp_header_value_mem2 <= (others => '0');
        -- fwd_timestamp_header_value_mem3 <= (others => '0');
        -- fwd_timestamp_header_value_mem4 <= (others => '0');
        -- fwd_timestamp_header_value_mem5 <= (others => '0');
        -- fwd_timestamp_header_value_mem6 <= (others => '0');
        -- fwd_timestamp_header_value_mem7 <= (others => '0');
        -- fwd_timestamp_header_value_mem8 <= (others => '0');
        -- fwd_timestamp_header_value_mem9 <= (others => '0');
        fwd_current_num_samples_mem0 <= (others => '0');
        fwd_current_num_samples_mem1 <= (others => '0');
        fwd_current_num_samples_mem2 <= (others => '0');
        fwd_current_num_samples_mem3 <= (others => '0');
        fwd_current_num_samples_mem4 <= (others => '0');
        fwd_current_num_samples_mem5 <= (others => '0');
        fwd_current_num_samples_mem6 <= (others => '0');
        fwd_current_num_samples_mem7 <= (others => '0');
        fwd_current_num_samples_mem8 <= (others => '0');
        fwd_current_num_samples_mem9 <= (others => '0');
        current_read_memory <= cnt_memory_0; -- indicates whether memory_0, memory_1, memory_2, memory_3, memory_4, memory_5, memory_6, memory_7, memory_8 or memory_9 is being used to read the input data [default = memory_0]
        fwdframe_processing_started <= '0';
        PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory1 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory2 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory3 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory4 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory5 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory6 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory7 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory8 <= (others => '0');
        PS_DAC_data_RAMB_read_index_memory9 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory0 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory1 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory2 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory3 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory4 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory5 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory6 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory7 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory8 <= (others => '0');
        PS_DAC_data_RAMB_final_index_memory9 <= (others => '0');
        current_read_period_count <= (others => '0');
        fwdframe_continued_processing <= '0';
        fwd_idle_state <= '0';
        PS_DAC_data_RAMB_ch01_0_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_0_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_1_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_1_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_2_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_2_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_3_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_3_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_4_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_4_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_5_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_5_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_6_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_6_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_7_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_7_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_8_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_8_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_9_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch01_9_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_0_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_0_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_1_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_1_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_2_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_2_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_3_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_3_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_4_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_4_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_5_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_5_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_6_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_6_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_7_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_7_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_8_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_8_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_9_read_address <= (others => (others => '0'));
        PS_DAC_data_RAMB_ch23_9_read_enable  <= (others => '0');

        clear_timestamping_ctrl_reg_mem0 <= '0';
        clear_timestamping_ctrl_reg_mem1 <= '0';
        clear_timestamping_ctrl_reg_mem2 <= '0';
        clear_timestamping_ctrl_reg_mem3 <= '0';
        clear_timestamping_ctrl_reg_mem4 <= '0';
        clear_timestamping_ctrl_reg_mem5 <= '0';
        clear_timestamping_ctrl_reg_mem6 <= '0';
        clear_timestamping_ctrl_reg_mem7 <= '0';
        clear_timestamping_ctrl_reg_mem8 <= '0';
        clear_timestamping_ctrl_reg_mem9 <= '0';
        large_early_situation <= '0';
      else
        -- clear unused signels (used in both subprocesses)
        clear_timestamping_ctrl_reg_mem0 <= '0';
        clear_timestamping_ctrl_reg_mem1 <= '0';
        clear_timestamping_ctrl_reg_mem2 <= '0';
        clear_timestamping_ctrl_reg_mem3 <= '0';
        clear_timestamping_ctrl_reg_mem4 <= '0';
        clear_timestamping_ctrl_reg_mem5 <= '0';
        clear_timestamping_ctrl_reg_mem6 <= '0';
        clear_timestamping_ctrl_reg_mem7 <= '0';
        clear_timestamping_ctrl_reg_mem8 <= '0';
        clear_timestamping_ctrl_reg_mem9 <= '0';

        -- #################################################################################################
        -- subprocess managing the timestamps and driving the principal DAC data-forwarding state machine
        -- #################################################################################################

        -- clear unused signals
        large_early_situation <= '0';

        -- when a new I/Q sample-frame is being buffered, we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        if (pulse_frame_storing_start_flag_DACxNclk = '1' or num_of_stored_frames > cnt_0_5b) and fwdframe_processing_started = '0' and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_processing_started <= '1';
          fwdframe_continued_processing <= '0';
          fwd_current_time_int <= current_lclk_count_int; -- @TO_BE_TESTED
          current_read_period_count <= (others => '0');   -- a new frame reading process starts

          -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration
          if current_read_memory = cnt_memory_0 then    -- we will read from memory_0
            -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
            fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem0_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem0 <= '1';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem0_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '1';
              fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_1 then -- we will read from memory_1
            -- fwd_timestamp_header_value_mem1 <= timestamp_header_value_mem1_DACxNclk;
            fwd_current_num_samples_mem1 <= current_num_samples_mem1_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory1 <= current_num_samples_mem1_DACxNclk; -- index of the last I/Q sample written to memory_1

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem1_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem1 <= '1';
              fwd_late_mem1 <= '0';
              fwd_time_difference_mem1 <= timestamp_header_value_mem1_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory1 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem1_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem1_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem1 <= '0';
              fwd_late_mem1 <= '1';
              fwd_time_difference_mem1 <= baseline_late_time_difference_mem1 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem1 < current_num_samples_mem1_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory1 <= baseline_late_time_difference_mem1(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory1 <= current_num_samples_mem1_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem1 <= '0';
              fwd_late_mem1 <= '0';
              fwd_time_difference_mem1 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory1 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_2 then -- we will read from memory_2
            -- fwd_timestamp_header_value_mem2 <= timestamp_header_value_mem2_DACxNclk;
            fwd_current_num_samples_mem2 <= current_num_samples_mem2_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory2 <= current_num_samples_mem2_DACxNclk; -- index of the last I/Q sample written to memory_2

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem2_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem2 <= '1';
              fwd_late_mem2 <= '0';
              fwd_time_difference_mem2 <= timestamp_header_value_mem2_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory2 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem2_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem2_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem2 <= '0';
              fwd_late_mem2 <= '1';
              fwd_time_difference_mem2 <= baseline_late_time_difference_mem2 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem2 < current_num_samples_mem2_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory2 <= baseline_late_time_difference_mem2(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory2 <= current_num_samples_mem2_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem2 <= '0';
              fwd_late_mem2 <= '0';
              fwd_time_difference_mem2 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory2 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_3 then -- we will read from memory_3
            -- fwd_timestamp_header_value_mem3 <= timestamp_header_value_mem3_DACxNclk;
            fwd_current_num_samples_mem3 <= current_num_samples_mem3_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory3 <= current_num_samples_mem3_DACxNclk; -- index of the last I/Q sample written to memory_3

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem3_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem3 <= '1';
              fwd_late_mem3 <= '0';
              fwd_time_difference_mem3 <= timestamp_header_value_mem3_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory3 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem3_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem3_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem3 <= '0';
              fwd_late_mem3 <= '1';
              fwd_time_difference_mem3 <= baseline_late_time_difference_mem3 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem3 < current_num_samples_mem3_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory3 <= baseline_late_time_difference_mem3(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory3 <= current_num_samples_mem3_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem3 <= '0';
              fwd_late_mem3 <= '0';
              fwd_time_difference_mem3 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory3 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 then -- we will read from memory_4
            -- fwd_timestamp_header_value_mem4 <= timestamp_header_value_mem4_DACxNclk;
            fwd_current_num_samples_mem4 <= current_num_samples_mem4_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory4 <= current_num_samples_mem4_DACxNclk; -- index of the last I/Q sample written to memory_4

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem4_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem4 <= '1';
              fwd_late_mem4 <= '0';
              fwd_time_difference_mem4 <= timestamp_header_value_mem4_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory4 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem4_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem4_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem4 <= '0';
              fwd_late_mem4 <= '1';
              fwd_time_difference_mem4 <= baseline_late_time_difference_mem4 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem4 < current_num_samples_mem4_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory4 <= baseline_late_time_difference_mem4(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory4 <= current_num_samples_mem4_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem4 <= '0';
              fwd_late_mem4 <= '0';
              fwd_time_difference_mem4 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory4 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 then -- we will read from memory_5
            -- fwd_timestamp_header_value_mem5 <= timestamp_header_value_mem5_DACxNclk;
            fwd_current_num_samples_mem5 <= current_num_samples_mem5_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory5 <= current_num_samples_mem5_DACxNclk; -- index of the last I/Q sample written to memory_5

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem5_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem5 <= '1';
              fwd_late_mem5 <= '0';
              fwd_time_difference_mem5 <= timestamp_header_value_mem5_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory5 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem5_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem5_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem5 <= '0';
              fwd_late_mem5 <= '1';
              fwd_time_difference_mem5 <= baseline_late_time_difference_mem5 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem5 < current_num_samples_mem5_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory5 <= baseline_late_time_difference_mem5(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory5 <= current_num_samples_mem5_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem5 <= '0';
              fwd_late_mem5 <= '0';
              fwd_time_difference_mem5 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory5 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 then -- we will read from memory_6
            -- fwd_timestamp_header_value_mem6 <= timestamp_header_value_mem6_DACxNclk;
            fwd_current_num_samples_mem6 <= current_num_samples_mem6_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory6 <= current_num_samples_mem6_DACxNclk; -- index of the last I/Q sample written to memory_6

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem6_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem6 <= '1';
              fwd_late_mem6 <= '0';
              fwd_time_difference_mem6 <= timestamp_header_value_mem6_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory6 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem6_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem6_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem6 <= '0';
              fwd_late_mem6 <= '1';
              fwd_time_difference_mem6 <= baseline_late_time_difference_mem6 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem6 < current_num_samples_mem6_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory6 <= baseline_late_time_difference_mem6(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory6 <= current_num_samples_mem6_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem6 <= '0';
              fwd_late_mem6 <= '0';
              fwd_time_difference_mem6 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory6 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 then -- we will read from memory_7
            -- fwd_timestamp_header_value_mem7 <= timestamp_header_value_mem7_DACxNclk;
            fwd_current_num_samples_mem7 <= current_num_samples_mem7_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory7 <= current_num_samples_mem7_DACxNclk; -- index of the last I/Q sample written to memory_7

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem7_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem7 <= '1';
              fwd_late_mem7 <= '0';
              fwd_time_difference_mem7 <= timestamp_header_value_mem7_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory7 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem7_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem7_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem7 <= '0';
              fwd_late_mem7 <= '1';
              fwd_time_difference_mem7 <= baseline_late_time_difference_mem7 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem7 < current_num_samples_mem7_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory7 <= baseline_late_time_difference_mem7(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory7 <= current_num_samples_mem7_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem7 <= '0';
              fwd_late_mem7 <= '0';
              fwd_time_difference_mem7 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory7 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 then -- we will read from memory_8
            -- fwd_timestamp_header_value_mem8 <= timestamp_header_value_mem8_DACxNclk;
            fwd_current_num_samples_mem8 <= current_num_samples_mem8_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory8 <= current_num_samples_mem8_DACxNclk; -- index of the last I/Q sample written to memory_8

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem8_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem8 <= '1';
              fwd_late_mem8 <= '0';
              fwd_time_difference_mem8 <= timestamp_header_value_mem8_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory8 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem8_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem8_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem8 <= '0';
              fwd_late_mem8 <= '1';
              fwd_time_difference_mem8 <= baseline_late_time_difference_mem8 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem8 < current_num_samples_mem8_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory8 <= baseline_late_time_difference_mem8(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory8 <= current_num_samples_mem8_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem8 <= '0';
              fwd_late_mem8 <= '0';
              fwd_time_difference_mem8 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory8 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          elsif PARAM_BUFFER_LENGTH >= 10 then                                       -- we will read from memory_9
            -- fwd_timestamp_header_value_mem9 <= timestamp_header_value_mem9_DACxNclk;
            fwd_current_num_samples_mem9 <= current_num_samples_mem9_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory9 <= current_num_samples_mem9_DACxNclk; -- index of the last I/Q sample written to memory_9

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem9_minus_buffer_latency > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem9 <= '1';
              fwd_late_mem9 <= '0';
              fwd_time_difference_mem9 <= timestamp_header_value_mem9_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_64b; -- @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory9 <= (others => '0');                                                             -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem9_minus_buffer_latency < current_lclk_count_int and timestamp_header_value_mem9_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem9 <= '0';
              fwd_late_mem9 <= '1';
              fwd_time_difference_mem9 <= baseline_late_time_difference_mem9 + cnt_internal_buffer_latency_64b;                                                   -- @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem9 < current_num_samples_mem9_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory9 <= baseline_late_time_difference_mem9(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by; @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory9 <= current_num_samples_mem9_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                      -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem9 <= '0';
              fwd_late_mem9 <= '0';
              fwd_time_difference_mem9 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory9 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          end if;
        -- [continuous reading: mem0 to mem1] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_0 and current_read_period_count = fwd_current_num_samples_mem0_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_1
          -- fwd_timestamp_header_value_mem1 <= timestamp_header_value_mem1_DACxNclk;
          fwd_current_num_samples_mem1 <= current_num_samples_mem1_DACxNclk;
          PS_DAC_data_RAMB_final_index_memory1 <= current_num_samples_mem1_DACxNclk; -- index of the last I/Q sample written to memory_1

          -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
          if timestamp_header_value_mem1_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
            fwd_early_mem1 <= '1';
            fwd_late_mem1 <= '0';
            fwd_time_difference_mem1 <= timestamp_header_value_mem1_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
            PS_DAC_data_RAMB_read_index_memory1 <= (others => '0');                                                                -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
          elsif timestamp_header_value_mem1_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem1_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
            fwd_early_mem1 <= '0';
            fwd_late_mem1 <= '1';
            fwd_time_difference_mem1 <= baseline_late_time_difference_mem1 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

            -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
            if baseline_late_time_difference_mem1 < current_num_samples_mem1_DACxNclk then
              PS_DAC_data_RAMB_read_index_memory1 <= baseline_late_time_difference_mem1(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
            else
              PS_DAC_data_RAMB_read_index_memory1 <= current_num_samples_mem1_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
            end if;
          else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
            fwd_early_mem1 <= '0';
            fwd_late_mem1 <= '0';
            fwd_time_difference_mem1 <= (others => '0');
            PS_DAC_data_RAMB_read_index_memory1 <= (others => '0'); -- we'll read from the first stored sample onwards
          end if;
        -- [continuous reading: mem1 to mem2] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_1 and current_read_period_count = fwd_current_num_samples_mem1_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_2
          -- fwd_timestamp_header_value_mem2 <= timestamp_header_value_mem2_DACxNclk;
          fwd_current_num_samples_mem2 <= current_num_samples_mem2_DACxNclk;
          PS_DAC_data_RAMB_final_index_memory2 <= current_num_samples_mem2_DACxNclk; -- index of the last I/Q sample written to memory_2

          -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
          if timestamp_header_value_mem2_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
            fwd_early_mem2 <= '1';
            fwd_late_mem2 <= '0';
            fwd_time_difference_mem2 <= timestamp_header_value_mem2_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
            PS_DAC_data_RAMB_read_index_memory2 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
          elsif timestamp_header_value_mem2_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem2_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
            fwd_early_mem2 <= '0';
            fwd_late_mem2 <= '1';
            fwd_time_difference_mem2 <= baseline_late_time_difference_mem2 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

            -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
            if baseline_late_time_difference_mem2 < current_num_samples_mem2_DACxNclk then
              PS_DAC_data_RAMB_read_index_memory2 <= baseline_late_time_difference_mem2(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
            else
              PS_DAC_data_RAMB_read_index_memory2 <= current_num_samples_mem2_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
            end if;
          else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
            fwd_early_mem2 <= '0';
            fwd_late_mem2 <= '0';
            fwd_time_difference_mem2 <= (others => '0');
            PS_DAC_data_RAMB_read_index_memory2 <= (others => '0'); -- we'll read from the first stored sample onwards
          end if;
        -- [continuous reading: mem2 to mem3] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_2 and current_read_period_count = fwd_current_num_samples_mem2_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_3
          -- fwd_timestamp_header_value_mem3 <= timestamp_header_value_mem3_DACxNclk;
          fwd_current_num_samples_mem3 <= current_num_samples_mem3_DACxNclk;
          PS_DAC_data_RAMB_final_index_memory3 <= current_num_samples_mem3_DACxNclk; -- index of the last I/Q sample written to memory_3

          -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
          if timestamp_header_value_mem3_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
            fwd_early_mem3 <= '1';
            fwd_late_mem3 <= '0';
            fwd_time_difference_mem3 <= timestamp_header_value_mem3_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
            PS_DAC_data_RAMB_read_index_memory3 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
          elsif timestamp_header_value_mem3_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem3_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
            fwd_early_mem3 <= '0';
            fwd_late_mem3 <= '1';
            fwd_time_difference_mem3 <= baseline_late_time_difference_mem3 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

            -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
            if baseline_late_time_difference_mem3 < current_num_samples_mem3_DACxNclk then
              PS_DAC_data_RAMB_read_index_memory3 <= baseline_late_time_difference_mem3(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
            else
              PS_DAC_data_RAMB_read_index_memory3 <= current_num_samples_mem3_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
            end if;
          else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
            fwd_early_mem3 <= '0';
            fwd_late_mem3 <= '0';
            fwd_time_difference_mem3 <= (others => '0');
            PS_DAC_data_RAMB_read_index_memory3 <= (others => '0'); -- we'll read from the first stored sample onwards
          end if;
        -- [continuous reading: mem3 to mem4/0] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_3 and current_read_period_count = fwd_current_num_samples_mem3_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
          if PARAM_BUFFER_LENGTH >= 5 then
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem4 <= timestamp_header_value_mem4_DACxNclk;
            fwd_current_num_samples_mem4 <= current_num_samples_mem4_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory4 <= current_num_samples_mem4_DACxNclk; -- index of the last I/Q sample written to memory_4

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem4_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem4 <= '1';
              fwd_late_mem4 <= '0';
              fwd_time_difference_mem4 <= timestamp_header_value_mem4_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory4 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem4_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem4_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem4 <= '0';
              fwd_late_mem4 <= '1';
              fwd_time_difference_mem4 <= baseline_late_time_difference_mem4 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem4 < current_num_samples_mem4_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory4 <= baseline_late_time_difference_mem4(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory4 <= current_num_samples_mem4_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem4 <= '0';
              fwd_late_mem4 <= '0';
              fwd_time_difference_mem4 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory4 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          else
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
            fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem0_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem0 <= '1';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem0_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '1';
              fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          end if;
        -- [continuous reading: mem4 to mem5/0] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and current_read_period_count = fwd_current_num_samples_mem4_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
          if PARAM_BUFFER_LENGTH >= 6 then
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem5 <= timestamp_header_value_mem5_DACxNclk;
            fwd_current_num_samples_mem5 <= current_num_samples_mem5_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory5 <= current_num_samples_mem5_DACxNclk; -- index of the last I/Q sample written to memory_5

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem5_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem5 <= '1';
              fwd_late_mem5 <= '0';
              fwd_time_difference_mem5 <= timestamp_header_value_mem5_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory5 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem5_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem5_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem5 <= '0';
              fwd_late_mem5 <= '1';
              fwd_time_difference_mem5 <= baseline_late_time_difference_mem5 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem5 < current_num_samples_mem5_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory5 <= baseline_late_time_difference_mem5(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory5 <= current_num_samples_mem5_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem5 <= '0';
              fwd_late_mem5 <= '0';
              fwd_time_difference_mem5 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory5 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          else
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
            fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem0_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem0 <= '1';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem0_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '1';
              fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          end if;
        -- [continuous reading: mem5 to mem6/0] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and current_read_period_count = fwd_current_num_samples_mem5_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
          if PARAM_BUFFER_LENGTH >= 7 then
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem6 <= timestamp_header_value_mem6_DACxNclk;
            fwd_current_num_samples_mem6 <= current_num_samples_mem6_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory6 <= current_num_samples_mem6_DACxNclk; -- index of the last I/Q sample written to memory_6

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem6_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem6 <= '1';
              fwd_late_mem6 <= '0';
              fwd_time_difference_mem6 <= timestamp_header_value_mem6_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory6 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem6_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem6_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem6 <= '0';
              fwd_late_mem6 <= '1';
              fwd_time_difference_mem6 <= baseline_late_time_difference_mem6 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem6 < current_num_samples_mem6_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory6 <= baseline_late_time_difference_mem6(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory6 <= current_num_samples_mem6_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem6 <= '0';
              fwd_late_mem6 <= '0';
              fwd_time_difference_mem6 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory6 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          else
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
            fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem0_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem0 <= '1';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem0_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '1';
              fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          end if;
        -- [continuous reading: mem6 to mem7/0] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and current_read_period_count = fwd_current_num_samples_mem6_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
          if PARAM_BUFFER_LENGTH >= 8 then
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem7 <= timestamp_header_value_mem7_DACxNclk;
            fwd_current_num_samples_mem7 <= current_num_samples_mem7_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory7 <= current_num_samples_mem7_DACxNclk; -- index of the last I/Q sample written to memory_7

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem7_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem7 <= '1';
              fwd_late_mem7 <= '0';
              fwd_time_difference_mem7 <= timestamp_header_value_mem7_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory7 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem7_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem7_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem7 <= '0';
              fwd_late_mem7 <= '1';
              fwd_time_difference_mem7 <= baseline_late_time_difference_mem7 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem7 < current_num_samples_mem7_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory7 <= baseline_late_time_difference_mem7(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory7 <= current_num_samples_mem7_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem7 <= '0';
              fwd_late_mem7 <= '0';
              fwd_time_difference_mem7 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory7 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          else
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
            fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem0_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem0 <= '1';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem0_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '1';
              fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          end if;
        -- [continuous reading: mem7 to mem8/0] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and current_read_period_count = fwd_current_num_samples_mem7_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
          if PARAM_BUFFER_LENGTH >= 9 then
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem8 <= timestamp_header_value_mem8_DACxNclk;
            fwd_current_num_samples_mem8 <= current_num_samples_mem8_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory8 <= current_num_samples_mem8_DACxNclk; -- index of the last I/Q sample written to memory_8

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem8_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem8 <= '1';
              fwd_late_mem8 <= '0';
              fwd_time_difference_mem8 <= timestamp_header_value_mem8_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory8 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem8_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem8_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem8 <= '0';
              fwd_late_mem8 <= '1';
              fwd_time_difference_mem8 <= baseline_late_time_difference_mem8 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem8 < current_num_samples_mem8_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory8 <= baseline_late_time_difference_mem8(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory8 <= current_num_samples_mem8_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem8 <= '0';
              fwd_late_mem8 <= '0';
              fwd_time_difference_mem8 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory8 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          else
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
            fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem0_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem0 <= '1';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem0_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '1';
              fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          end if;
        -- [continuous reading: mem8 to mem9/0] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and current_read_period_count = fwd_current_num_samples_mem8_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
          if PARAM_BUFFER_LENGTH >= 10 then
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem9 <= timestamp_header_value_mem9_DACxNclk;
            fwd_current_num_samples_mem9 <= current_num_samples_mem9_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory9 <= current_num_samples_mem9_DACxNclk; -- index of the last I/Q sample written to memory_9

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem9_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem9 <= '1';
              fwd_late_mem9 <= '0';
              fwd_time_difference_mem9 <= timestamp_header_value_mem9_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory9 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem9_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem9_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem9 <= '0';
              fwd_late_mem9 <= '1';
              fwd_time_difference_mem9 <= baseline_late_time_difference_mem9 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem9 < current_num_samples_mem9_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory9 <= baseline_late_time_difference_mem9(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory9 <= current_num_samples_mem9_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem9 <= '0';
              fwd_late_mem9 <= '0';
              fwd_time_difference_mem9 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory9 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          else
            -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
            -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
            fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
            PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

            -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
            if timestamp_header_value_mem0_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
              fwd_early_mem0 <= '1';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
            elsif timestamp_header_value_mem0_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '1';
              fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

              -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
              if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
                PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
              else
                PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
              end if;
            else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
              fwd_early_mem0 <= '0';
              fwd_late_mem0 <= '0';
              fwd_time_difference_mem0 <= (others => '0');
              PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
            end if;
          end if;
        -- [continuous reading: mem9 to mem0] when an unread stored one needs to be currently processed (i.e., two clock cycles before the reading of the previous one ends, accounting for the RAMB access latencies), we will inspect its associated timestamp and decide which values need to be forwarded to the DAC; this process will work at the same rate as the input-data (i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and current_read_period_count = fwd_current_num_samples_mem9_minus2 and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '1';
          fwd_current_time_int <= current_lclk_count_int;                     -- @TO_BE_TESTED
          current_read_period_count <= current_read_period_count + cnt_1; -- we keep reading the (last two samples of the) previous frame!

          -- update the timestamp and index control registers associated to source read-memory and save the current 'x_length' configuration; since we are still reading the (last two samples of the) previous frame, our next frame will be read from memory_0
          -- fwd_timestamp_header_value_mem0 <= timestamp_header_value_mem0_DACxNclk;
          fwd_current_num_samples_mem0 <= current_num_samples_mem0_DACxNclk;
          PS_DAC_data_RAMB_final_index_memory0 <= current_num_samples_mem0_DACxNclk; -- index of the last I/Q sample written to memory_0

          -- check the time difference between the current clock count and the received timestamp (accouting for the latency resulting from the internal sample-buffering scheme)
          if timestamp_header_value_mem0_minus_buffer_latency_plus1 > current_lclk_count_int then                                                         -- the I/Q samples provided by the PS are meant to be transmitted later in time
            fwd_early_mem0 <= '1';
            fwd_late_mem0 <= '0';
            fwd_time_difference_mem0 <= timestamp_header_value_mem0_DACxNclk - current_lclk_count_int - cnt_internal_buffer_latency_plus1_64b; -- we do need to account for the internal latency and an exra cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not waiting forever
            PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');                           -- once enough 0s have been forwarded, then we'll read from the first stored sample onwards
          elsif timestamp_header_value_mem0_minus_buffer_latency_plus1 < current_lclk_count_int and timestamp_header_value_mem0_DACxNclk > cnt_0_64b then -- the I/Q samples provided by the PS were meant to be transmitted earlier in time
            fwd_early_mem0 <= '0';
            fwd_late_mem0 <= '1';
            fwd_time_difference_mem0 <= baseline_late_time_difference_mem0 + cnt_internal_buffer_latency_plus1_64b;                                                -- we do need to account for the internal latency plus one extra clock cycle (i.e., we are updating the control indexes in advance precisely to enable a continuous forwarding of data to the DAC); @TO_BE_TESTED: check that we are not always forwarding 0s

            -- check that if the current late is within the IQ-frame size (i.e., avoid setting a negative reading index)
            if baseline_late_time_difference_mem0 < current_num_samples_mem0_DACxNclk then
              PS_DAC_data_RAMB_read_index_memory0 <= baseline_late_time_difference_mem0(C_NUM_ADDRESS_BITS-1 downto 0) + cnt_internal_buffer_latency_plus1_64b(C_NUM_ADDRESS_BITS-1 downto 0); -- we'll offset the initial read address the amount of samples corresponding to the time we're late by (also accounting for the internal buffer latency); @TO_BE_TESTED: check that we always obtain a meaningful index value
            else
              PS_DAC_data_RAMB_read_index_memory0 <= current_num_samples_mem0_DACxNclk; -- nothing to read (i.e., set a value beyond the biggest actual valid read index)
            end if;
          else                                                                                                                                            -- FPGA and PS are perfectly aligned in time or timestamping has been disabled from SW
            fwd_early_mem0 <= '0';
            fwd_late_mem0 <= '0';
            fwd_time_difference_mem0 <= (others => '0');
            PS_DAC_data_RAMB_read_index_memory0 <= (others => '0'); -- we'll read from the first stored sample onwards
          end if;
        -- update the control counter aligned with the forwarding of I/Q data to the DAC (will work at the same rate as the input-data; i.e., with a clock-enable configure according to 'DAC_clk_division')
        elsif fwdframe_processing_started = '1' and num_of_stored_frames > cnt_0_5b and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          -- [mem0] forwarding of I/Q samples to the DAC; the FPGA and PS are currently time-aligned (i.e., if required, the appropriate offset has been put in place and those I/Q samples that were late have been discarded)
          if (current_read_memory = cnt_memory_0 and fwd_early_mem0 = '0') or
             (current_read_memory = cnt_memory_1 and fwd_early_mem1 = '0') or
             (current_read_memory = cnt_memory_2 and fwd_early_mem2 = '0') or
             (current_read_memory = cnt_memory_3 and fwd_early_mem3 = '0') or
             (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_early_mem4 = '0') or
             (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_early_mem5 = '0') or
             (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_early_mem6 = '0') or
             (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_early_mem7 = '0') or
             (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_early_mem8 = '0') or
             (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_early_mem9 = '0') then
            -- update the forwarding-control index
            if (current_read_memory = cnt_memory_0 and current_read_period_count < fwd_current_num_samples_mem0) or
               (current_read_memory = cnt_memory_1 and current_read_period_count < fwd_current_num_samples_mem1) or
               (current_read_memory = cnt_memory_2 and current_read_period_count < fwd_current_num_samples_mem2) or
               (current_read_memory = cnt_memory_3 and current_read_period_count < fwd_current_num_samples_mem3) or
               (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and current_read_period_count < fwd_current_num_samples_mem4) or
               (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and current_read_period_count < fwd_current_num_samples_mem5) or
               (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and current_read_period_count < fwd_current_num_samples_mem6) or
               (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and current_read_period_count < fwd_current_num_samples_mem7) or
               (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and current_read_period_count < fwd_current_num_samples_mem8) or
               (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and current_read_period_count < fwd_current_num_samples_mem9) then
              -- check if we currently are reading the last sample of the frame
              if (current_read_memory = cnt_memory_0 and current_read_period_count = fwd_current_num_samples_mem0_minus1) or
                 (current_read_memory = cnt_memory_1 and current_read_period_count = fwd_current_num_samples_mem1_minus1) or
                 (current_read_memory = cnt_memory_2 and current_read_period_count = fwd_current_num_samples_mem2_minus1) or
                 (current_read_memory = cnt_memory_3 and current_read_period_count = fwd_current_num_samples_mem3_minus1) or
                 (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and current_read_period_count = fwd_current_num_samples_mem4_minus1) or
                 (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and current_read_period_count = fwd_current_num_samples_mem5_minus1) or
                 (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and current_read_period_count = fwd_current_num_samples_mem6_minus1) or
                 (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and current_read_period_count = fwd_current_num_samples_mem7_minus1) or
                 (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and current_read_period_count = fwd_current_num_samples_mem8_minus1) or
                 (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and current_read_period_count = fwd_current_num_samples_mem9_minus1) then
                current_read_period_count <= (others => '0');

                -- let's clear the late signals
                if current_read_memory = cnt_memory_0 then
                  fwd_late_mem0 <= '0';
                elsif current_read_memory = cnt_memory_1 then
                  fwd_late_mem1 <= '0';
                elsif current_read_memory = cnt_memory_2 then
                  fwd_late_mem2 <= '0';
                elsif current_read_memory = cnt_memory_3 then
                  fwd_late_mem3 <= '0';
                elsif current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 then
                  fwd_late_mem4 <= '0';
                elsif current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 then
                  fwd_late_mem5 <= '0';
                elsif current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 then
                  fwd_late_mem6 <= '0';
                elsif current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 then
                  fwd_late_mem7 <= '0';
                elsif current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 then
                  fwd_late_mem8 <= '0';
                elsif PARAM_BUFFER_LENGTH >= 10 then
                  fwd_late_mem9 <= '0';
                end if;

                -- when no more frames are stored (we do not count the stored frame that we are currently reading; i.e., we are reading the last sample and, thus, 'num_of_stored_samples' has not yet been updated) we must enter into 'idle' state
                if num_of_stored_frames = cnt_1_5b then
                  fwd_idle_state <= '1';
                  fwdframe_continued_processing <= '0';
                  fwdframe_processing_started <= '0';
                else
                  fwd_idle_state <= '0';
                end if;
              else
                  -- default operation values
                  current_read_period_count <= current_read_period_count + cnt_1;
                  fwd_idle_state <= '0';

                  -- in late situatons we must check that the data to be forwarded (i.e., after discarding the late samples) has already been written to the memory
                  if (current_read_memory = cnt_memory_0 and fwd_late_mem0 = '1' and PS_DAC_data_RAMB_write_index_memory0_DACxNclk > PS_DAC_data_RAMB_read_index_memory0) or
                     (current_read_memory = cnt_memory_1 and fwd_late_mem1 = '1' and PS_DAC_data_RAMB_write_index_memory1_DACxNclk > PS_DAC_data_RAMB_read_index_memory1) or
                     (current_read_memory = cnt_memory_2 and fwd_late_mem2 = '1' and PS_DAC_data_RAMB_write_index_memory2_DACxNclk > PS_DAC_data_RAMB_read_index_memory2) or
                     (current_read_memory = cnt_memory_3 and fwd_late_mem3 = '1' and PS_DAC_data_RAMB_write_index_memory3_DACxNclk > PS_DAC_data_RAMB_read_index_memory3) or
                     (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_late_mem4 = '1' and PS_DAC_data_RAMB_write_index_memory4_DACxNclk > PS_DAC_data_RAMB_read_index_memory4) or
                     (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_late_mem5 = '1' and PS_DAC_data_RAMB_write_index_memory5_DACxNclk > PS_DAC_data_RAMB_read_index_memory5) or
                     (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_late_mem6 = '1' and PS_DAC_data_RAMB_write_index_memory6_DACxNclk > PS_DAC_data_RAMB_read_index_memory6) or
                     (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_late_mem7 = '1' and PS_DAC_data_RAMB_write_index_memory7_DACxNclk > PS_DAC_data_RAMB_read_index_memory7) or
                     (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_late_mem8 = '1' and PS_DAC_data_RAMB_write_index_memory8_DACxNclk > PS_DAC_data_RAMB_read_index_memory8) or
                     (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_late_mem9 = '1' and PS_DAC_data_RAMB_write_index_memory9_DACxNclk > PS_DAC_data_RAMB_read_index_memory9) then
                    -- we must also verify if the next frame was received in time for a continuous IQ-data forwarding
                    if num_of_stored_frames > cnt_0_5b and
                       ((current_read_memory = cnt_memory_0 and PS_DAC_data_RAMB_read_index_memory0 = PS_DAC_data_RAMB_write_index_memory0_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_1 and PS_DAC_data_RAMB_read_index_memory1 = PS_DAC_data_RAMB_write_index_memory1_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_2 and PS_DAC_data_RAMB_read_index_memory2 = PS_DAC_data_RAMB_write_index_memory2_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_3 and PS_DAC_data_RAMB_read_index_memory3 = PS_DAC_data_RAMB_write_index_memory3_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and PS_DAC_data_RAMB_read_index_memory4 = PS_DAC_data_RAMB_write_index_memory4_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and PS_DAC_data_RAMB_read_index_memory5 = PS_DAC_data_RAMB_write_index_memory5_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and PS_DAC_data_RAMB_read_index_memory6 = PS_DAC_data_RAMB_write_index_memory6_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and PS_DAC_data_RAMB_read_index_memory7 = PS_DAC_data_RAMB_write_index_memory7_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and PS_DAC_data_RAMB_read_index_memory8 = PS_DAC_data_RAMB_write_index_memory8_DACxNclk_minus3) or
                        (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and PS_DAC_data_RAMB_read_index_memory9 = PS_DAC_data_RAMB_write_index_memory9_DACxNclk_minus3)) then
                      -- in such case, we will force the required 'current_read_period_count' value to ensure the uninterrupted DAC data forwarding
                      if current_read_memory = cnt_memory_0 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory0_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_1 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory1_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_2 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory2_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_3 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory3_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory4_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory5_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory6_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory7_DACxNclk_minus2;
                      elsif current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory8_DACxNclk_minus2;
                      elsif PARAM_BUFFER_LENGTH >= 10 then
                        current_read_period_count <= PS_DAC_data_RAMB_write_index_memory9_DACxNclk_minus2;
                      end if;
                    end if;
                  elsif (current_read_memory = cnt_memory_0 and fwd_late_mem0 = '1') or
                        (current_read_memory = cnt_memory_1 and fwd_late_mem1 = '1') or
                        (current_read_memory = cnt_memory_2 and fwd_late_mem2 = '1') or
                        (current_read_memory = cnt_memory_3 and fwd_late_mem3 = '1') or
                        (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_late_mem4 = '1') or
                        (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_late_mem5 = '1') or
                        (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_late_mem6 = '1') or
                        (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_late_mem7 = '1') or
                        (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_late_mem8 = '1') or
                        (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_late_mem9 = '1') then
                    fwd_idle_state <= '1';

                    -- check that the amount of time for which we are late isn't greater than the size of the number of samples in the IQ-frame; if it is, let's end its processing
                    if current_read_memory = cnt_memory_0 and PS_DAC_data_RAMB_read_index_memory0 >= fwd_current_num_samples_mem0 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');
                      current_read_memory <= cnt_memory_1;
                      clear_timestamping_ctrl_reg_mem0 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem0 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_1 and PS_DAC_data_RAMB_read_index_memory1 >= fwd_current_num_samples_mem1 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory1 <= (others => '0');
                      current_read_memory <= cnt_memory_2;
                      clear_timestamping_ctrl_reg_mem1 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem1 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_2 and PS_DAC_data_RAMB_read_index_memory2 >= fwd_current_num_samples_mem2 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory2 <= (others => '0');
                      current_read_memory <= cnt_memory_3;
                      clear_timestamping_ctrl_reg_mem2 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem2 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_3 and PS_DAC_data_RAMB_read_index_memory3 >= fwd_current_num_samples_mem3 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory3 <= (others => '0');
                      if PARAM_BUFFER_LENGTH >= 5 then
                        current_read_memory <= cnt_memory_4;
                      else
                        current_read_memory <= cnt_memory_0;
                      end if;
                      clear_timestamping_ctrl_reg_mem3 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem3 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and PS_DAC_data_RAMB_read_index_memory4 >= fwd_current_num_samples_mem4 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory4 <= (others => '0');
                      if PARAM_BUFFER_LENGTH >= 6 then
                        current_read_memory <= cnt_memory_5;
                      else
                        current_read_memory <= cnt_memory_0;
                      end if;
                      clear_timestamping_ctrl_reg_mem4 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem4 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and PS_DAC_data_RAMB_read_index_memory5 >= fwd_current_num_samples_mem5 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory5 <= (others => '0');
                      if PARAM_BUFFER_LENGTH >= 7 then
                        current_read_memory <= cnt_memory_6;
                      else
                        current_read_memory <= cnt_memory_0;
                      end if;
                      clear_timestamping_ctrl_reg_mem5 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem5 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and PS_DAC_data_RAMB_read_index_memory6 >= fwd_current_num_samples_mem6 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory6 <= (others => '0');
                      if PARAM_BUFFER_LENGTH >= 8 then
                        current_read_memory <= cnt_memory_7;
                      else
                        current_read_memory <= cnt_memory_0;
                      end if;
                      clear_timestamping_ctrl_reg_mem6 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem6 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and PS_DAC_data_RAMB_read_index_memory7 >= fwd_current_num_samples_mem7 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory7 <= (others => '0');
                      if PARAM_BUFFER_LENGTH >= 9 then
                        current_read_memory <= cnt_memory_8;
                      else
                        current_read_memory <= cnt_memory_0;
                      end if;
                      clear_timestamping_ctrl_reg_mem7 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem7 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and PS_DAC_data_RAMB_read_index_memory8 >= fwd_current_num_samples_mem8 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory8 <= (others => '0');
                      if PARAM_BUFFER_LENGTH >= 10 then
                        current_read_memory <= cnt_memory_9;
                      else
                        current_read_memory <= cnt_memory_0;
                      end if;
                      clear_timestamping_ctrl_reg_mem8 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem8 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    elsif current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and PS_DAC_data_RAMB_read_index_memory9 >= fwd_current_num_samples_mem9 then
                      current_read_period_count <= (others => '0');
                      PS_DAC_data_RAMB_read_index_memory9 <= (others => '0');
                      current_read_memory <= cnt_memory_0;
                      clear_timestamping_ctrl_reg_mem9 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
                      fwd_late_mem9 <= '0';
                      fwdframe_continued_processing <= '0';
                      fwdframe_processing_started <= '0';
                      large_early_situation <= '1';
                    end if;
                  end if;
              end if;
            end if;
          -- the I/Q samples provided by the PS are meant to be transmitted later in time
          else
            fwd_idle_state <= '0';

            -- [mem0] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_0 and fwd_time_difference_mem0 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem0 <= fwd_time_difference_mem0 - cnt_1_64b;
            else
              fwd_early_mem0 <= '0';
            end if;

            -- [mem1] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_1 and fwd_time_difference_mem1 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem1 <= fwd_time_difference_mem1 - cnt_1_64b;
            else
              fwd_early_mem1 <= '0';
            end if;

            -- [mem2] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_2 and fwd_time_difference_mem2 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem2 <= fwd_time_difference_mem2 - cnt_1_64b;
            else
              fwd_early_mem2 <= '0';
            end if;

            -- [mem3] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_3 and fwd_time_difference_mem3 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem3 <= fwd_time_difference_mem3 - cnt_1_64b;
            else
              fwd_early_mem3 <= '0';
            end if;

            -- [mem4] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_time_difference_mem4 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem4 <= fwd_time_difference_mem4 - cnt_1_64b;
            else
              fwd_early_mem4 <= '0';
            end if;

            -- [mem5] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_time_difference_mem5 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem5 <= fwd_time_difference_mem5 - cnt_1_64b;
            else
              fwd_early_mem5 <= '0';
            end if;

            -- [mem6] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_time_difference_mem6 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem6 <= fwd_time_difference_mem6 - cnt_1_64b;
            else
              fwd_early_mem6 <= '0';
            end if;

            -- [mem7] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_time_difference_mem7 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem7 <= fwd_time_difference_mem7 - cnt_1_64b;
            else
              fwd_early_mem7 <= '0';
            end if;

            -- [mem8] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_time_difference_mem8 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem8 <= fwd_time_difference_mem8 - cnt_1_64b;
            else
              fwd_early_mem8 <= '0';
            end if;

            -- [mem9] update the current time misalignment (i.e., 0s will be transmitted meanwhile)
            if current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_time_difference_mem9 > cnt_1_64b then -- we are still one clock cycle misaligned at least
              fwd_time_difference_mem9 <= fwd_time_difference_mem9 - cnt_1_64b;
            else
              fwd_early_mem9 <= '0';
            end if;
          end if;
        -- we are not currently processing valid I/Q data
        elsif (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwdframe_continued_processing <= '0';
          fwdframe_processing_started <= '0';
          current_read_period_count <= (others => '0');
          fwd_idle_state <= '1';
        end if;

        -- #################################################################################################
        -- subprocess managing the current RAMB read-control signals
        -- #################################################################################################

        -- clear unused signals
        PS_DAC_data_RAMB_ch01_0_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_1_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_2_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_3_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_4_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_5_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_6_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_7_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_8_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch01_9_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_0_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_1_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_2_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_3_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_4_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_5_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_6_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_7_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_8_read_enable  <= (others => '0');
        PS_DAC_data_RAMB_ch23_9_read_enable  <= (others => '0');

        -- * NOTE: uninterrupted read operations are supported (i.e., changing the source memory without introducing latencies) *

        -- forwarding of I/Q data to the DAC (will work at the same rate as the input-data; i.e., with a clock-enable configure according to 'DAC_clk_division')
        if fwdframe_processing_started = '1' and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          -- forwarding of I/Q samples to the DAC; the FPGA and PS are currently time-aligned (i.e., if required, the appropriate offset has been put in place and those I/Q samples that were late have been discarded)
          if current_read_memory = cnt_memory_0 and fwd_early_mem0 = '0' and PS_DAC_data_RAMB_read_index_memory0 < current_num_samples_mem0_DACxNclk then -- we will read from memory_0
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory0(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_0_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory0(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_0_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_0_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory0(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_0_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory0 < PS_DAC_data_RAMB_final_index_memory0 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory0 = PS_DAC_data_RAMB_final_index_memory0_minus1 then
                PS_DAC_data_RAMB_read_index_memory0 <= (others => '0');
                current_read_memory <= cnt_memory_1;
                clear_timestamping_ctrl_reg_mem0 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory0 <= PS_DAC_data_RAMB_read_index_memory0 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_1 and fwd_early_mem1 = '0' and PS_DAC_data_RAMB_read_index_memory1 < current_num_samples_mem1_DACxNclk then -- we will read from memory_1
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory1(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_1_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory1(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_1_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_1_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory1(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_1_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory1 < PS_DAC_data_RAMB_final_index_memory1 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory1 = PS_DAC_data_RAMB_final_index_memory1_minus1 then
                PS_DAC_data_RAMB_read_index_memory1 <= (others => '0');
                current_read_memory <= cnt_memory_2;
                clear_timestamping_ctrl_reg_mem1 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory1 <= PS_DAC_data_RAMB_read_index_memory1 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_2 and fwd_early_mem2 = '0' and PS_DAC_data_RAMB_read_index_memory2 < current_num_samples_mem2_DACxNclk then -- we will read from memory_2
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory2(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_2_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory2(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_2_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_2_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory2(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_2_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory2 < PS_DAC_data_RAMB_final_index_memory2 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory2 = PS_DAC_data_RAMB_final_index_memory2_minus1 then
                PS_DAC_data_RAMB_read_index_memory2 <= (others => '0');
                current_read_memory <= cnt_memory_3;
                clear_timestamping_ctrl_reg_mem2 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory2 <= PS_DAC_data_RAMB_read_index_memory2 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_3 and fwd_early_mem3 = '0' and PS_DAC_data_RAMB_read_index_memory3 < current_num_samples_mem3_DACxNclk then -- we will read from memory_3
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory3(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_3_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory3(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_3_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_3_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory3(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_3_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory3 < PS_DAC_data_RAMB_final_index_memory3 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory3 = PS_DAC_data_RAMB_final_index_memory3_minus1 then
                PS_DAC_data_RAMB_read_index_memory3 <= (others => '0');
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 5 then
                  current_read_memory <= cnt_memory_4;
                else
                  current_read_memory <= cnt_memory_0;
                end if;
                clear_timestamping_ctrl_reg_mem3 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory3 <= PS_DAC_data_RAMB_read_index_memory3 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_early_mem4 = '0' and PS_DAC_data_RAMB_read_index_memory4 < current_num_samples_mem4_DACxNclk then -- we will read from memory_4
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory4(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_4_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory4(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_4_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_4_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory4(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_4_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory4 < PS_DAC_data_RAMB_final_index_memory4 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory4 = PS_DAC_data_RAMB_final_index_memory4_minus1 then
                PS_DAC_data_RAMB_read_index_memory4 <= (others => '0');
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 6 then
                  current_read_memory <= cnt_memory_5;
                else
                  current_read_memory <= cnt_memory_0;
                end if;
                clear_timestamping_ctrl_reg_mem4 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory4 <= PS_DAC_data_RAMB_read_index_memory4 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_early_mem5 = '0' and PS_DAC_data_RAMB_read_index_memory5 < current_num_samples_mem5_DACxNclk then -- we will read from memory_5
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory5(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_5_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory5(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_5_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_5_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory5(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_5_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory5 < PS_DAC_data_RAMB_final_index_memory5 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory5 = PS_DAC_data_RAMB_final_index_memory5_minus1 then
                PS_DAC_data_RAMB_read_index_memory5 <= (others => '0');
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 7 then
                  current_read_memory <= cnt_memory_6;
                else
                  current_read_memory <= cnt_memory_0;
                end if;
                clear_timestamping_ctrl_reg_mem5 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory5 <= PS_DAC_data_RAMB_read_index_memory5 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_early_mem6 = '0' and PS_DAC_data_RAMB_read_index_memory6 < current_num_samples_mem6_DACxNclk then  -- we will read from memory_6
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory6(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_6_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory6(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_6_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_6_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory6(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_6_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory6 < PS_DAC_data_RAMB_final_index_memory6 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory6 = PS_DAC_data_RAMB_final_index_memory6_minus1 then
                PS_DAC_data_RAMB_read_index_memory6 <= (others => '0');
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 8 then
                  current_read_memory <= cnt_memory_7;
                else
                  current_read_memory <= cnt_memory_0;
                end if;
                clear_timestamping_ctrl_reg_mem6 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory6 <= PS_DAC_data_RAMB_read_index_memory6 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_early_mem7 = '0' and PS_DAC_data_RAMB_read_index_memory7 < current_num_samples_mem7_DACxNclk then -- we will read from memory_7
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory7(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_7_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory7(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_7_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_7_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory7(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_7_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory7 < PS_DAC_data_RAMB_final_index_memory7 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory7 = PS_DAC_data_RAMB_final_index_memory7_minus1 then
                PS_DAC_data_RAMB_read_index_memory7 <= (others => '0');
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 9 then
                  current_read_memory <= cnt_memory_8;
                else
                  current_read_memory <= cnt_memory_0;
                end if;
                clear_timestamping_ctrl_reg_mem7 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory7 <= PS_DAC_data_RAMB_read_index_memory7 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_early_mem8 = '0' and PS_DAC_data_RAMB_read_index_memory8 < current_num_samples_mem8_DACxNclk then -- we will read from memory_8
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory8(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_8_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory8(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_8_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_8_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory8(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_8_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory8 < PS_DAC_data_RAMB_final_index_memory8 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory8 = PS_DAC_data_RAMB_final_index_memory8_minus1 then
                PS_DAC_data_RAMB_read_index_memory8 <= (others => '0');
                -- time to check the 'PARAM_BUFFER_LENGTH' parameter value (i.e., size of the circular buffer)
                if PARAM_BUFFER_LENGTH >= 10 then
                  current_read_memory <= cnt_memory_9;
                else
                  current_read_memory <= cnt_memory_0;
                end if;
                clear_timestamping_ctrl_reg_mem8 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory8 <= PS_DAC_data_RAMB_read_index_memory8 + cnt_1;
              end if;
            end if;
          elsif current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_early_mem9 = '0' and PS_DAC_data_RAMB_read_index_memory9 < current_num_samples_mem9_DACxNclk then -- we will read from memory_9
            -- select the appropriate RAMB instance
            ramb_index := to_integer(unsigned(PS_DAC_data_RAMB_read_index_memory9(C_NUM_ADDRESS_BITS-1 downto (C_NUM_ADDRESS_BITS-C_NUM_MEMORY_SEL_BITS))));

            PS_DAC_data_RAMB_ch01_9_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory9(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
            PS_DAC_data_RAMB_ch01_9_read_enable(ramb_index) <= '1';
            -- *[two-antenna]*
            if PARAM_TWO_ANTENNA_SUPPORT then
              PS_DAC_data_RAMB_ch23_9_read_address(ramb_index) <= PS_DAC_data_RAMB_read_index_memory9(9 downto 0) & "00000"; -- port aspect ratio according to table 1-9 [UG573]
              PS_DAC_data_RAMB_ch23_9_read_enable(ramb_index) <= '1';
            end if;

            -- update the read index
            if PS_DAC_data_RAMB_read_index_memory9 < PS_DAC_data_RAMB_final_index_memory9 then
              -- check if we are currently processing the last packet of the frame
              if PS_DAC_data_RAMB_read_index_memory9 = PS_DAC_data_RAMB_final_index_memory9_minus1 then
                PS_DAC_data_RAMB_read_index_memory9 <= (others => '0');
                current_read_memory <= cnt_memory_0;
                clear_timestamping_ctrl_reg_mem9 <= '1'; -- we will request to clear the RAMB timestamping control register (i.e., to ensure that only valid timestamping data will be accounted in future reads)
              else
                PS_DAC_data_RAMB_read_index_memory9 <= PS_DAC_data_RAMB_read_index_memory9 + cnt_1;
              end if;
            end if;
          end if;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process generating delayed versions of the read-enable and related signals
  process(DACxN_clk,DACxN_reset)
    begin
      if rising_edge(DACxN_clk) then
        if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
          PS_DAC_data_RAMB_ch01_0_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_0_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_1_read_enable_i_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_1_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_2_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_2_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_3_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_3_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_4_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_4_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_5_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_5_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_6_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_6_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_7_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_7_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_8_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_8_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch01_9_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch01_9_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_0_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_0_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_1_read_enable_i_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_1_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_2_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_2_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_3_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_3_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_4_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_4_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_5_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_5_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_6_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_6_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_7_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_7_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_8_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_8_read_enable_i <= (others => '0');
          PS_DAC_data_RAMB_ch23_9_read_enable_i_i <=  (others => '0');
          PS_DAC_data_RAMB_ch23_9_read_enable_i <= (others => '0');
          current_read_memory_i_i_i <= (others => '0');
          current_read_memory_i_i <= (others => '0');
          current_read_memory_i <= (others => '0');
          fwd_early_mem0_i_i_i <= '0';
          fwd_early_mem1_i_i_i <= '0';
          fwd_early_mem2_i_i_i <= '0';
          fwd_early_mem3_i_i_i <= '0';
          fwd_early_mem4_i_i_i <= '0';
          fwd_early_mem5_i_i_i <= '0';
          fwd_early_mem6_i_i_i <= '0';
          fwd_early_mem7_i_i_i <= '0';
          fwd_early_mem8_i_i_i <= '0';
          fwd_early_mem9_i_i_i <= '0';
          fwd_early_mem0_i_i <= '0';
          fwd_early_mem1_i_i <= '0';
          fwd_early_mem2_i_i <= '0';
          fwd_early_mem3_i_i <= '0';
          fwd_early_mem4_i_i <= '0';
          fwd_early_mem5_i_i <= '0';
          fwd_early_mem6_i_i <= '0';
          fwd_early_mem7_i_i <= '0';
          fwd_early_mem8_i_i <= '0';
          fwd_early_mem9_i_i <= '0';
          fwd_early_mem0_i <= '0';
          fwd_early_mem1_i <= '0';
          fwd_early_mem2_i <= '0';
          fwd_early_mem3_i <= '0';
          fwd_early_mem4_i <= '0';
          fwd_early_mem5_i <= '0';
          fwd_early_mem6_i <= '0';
          fwd_early_mem7_i <= '0';
          fwd_early_mem8_i <= '0';
          fwd_early_mem9_i <= '0';
          fwd_late_mem0_i_i_i <= '0';
          fwd_late_mem1_i_i_i <= '0';
          fwd_late_mem2_i_i_i <= '0';
          fwd_late_mem3_i_i_i <= '0';
          fwd_late_mem4_i_i_i <= '0';
          fwd_late_mem5_i_i_i <= '0';
          fwd_late_mem6_i_i_i <= '0';
          fwd_late_mem7_i_i_i <= '0';
          fwd_late_mem8_i_i_i <= '0';
          fwd_late_mem9_i_i_i <= '0';
          fwd_late_mem0_i_i <= '0';
          fwd_late_mem1_i_i <= '0';
          fwd_late_mem2_i_i <= '0';
          fwd_late_mem3_i_i <= '0';
          fwd_late_mem4_i_i <= '0';
          fwd_late_mem5_i_i <= '0';
          fwd_late_mem6_i_i <= '0';
          fwd_late_mem7_i_i <= '0';
          fwd_late_mem8_i_i <= '0';
          fwd_late_mem9_i_i <= '0';
          fwd_late_mem0_i <= '0';
          fwd_late_mem1_i <= '0';
          fwd_late_mem2_i <= '0';
          fwd_late_mem3_i <= '0';
          fwd_late_mem4_i <= '0';
          fwd_late_mem5_i <= '0';
          fwd_late_mem6_i <= '0';
          fwd_late_mem7_i <= '0';
          fwd_late_mem8_i <= '0';
          fwd_late_mem9_i <= '0';
          fwd_idle_state_i_i_i <= '0';
          fwd_idle_state_i_i <= '0';
          fwd_idle_state_i <= '0';
        else
          PS_DAC_data_RAMB_ch01_0_read_enable_i_i <= PS_DAC_data_RAMB_ch01_0_read_enable_i;
          PS_DAC_data_RAMB_ch01_0_read_enable_i <= PS_DAC_data_RAMB_ch01_0_read_enable;
          PS_DAC_data_RAMB_ch01_1_read_enable_i_i <= PS_DAC_data_RAMB_ch01_1_read_enable_i;
          PS_DAC_data_RAMB_ch01_1_read_enable_i <= PS_DAC_data_RAMB_ch01_1_read_enable;
          PS_DAC_data_RAMB_ch01_2_read_enable_i_i <= PS_DAC_data_RAMB_ch01_2_read_enable_i;
          PS_DAC_data_RAMB_ch01_2_read_enable_i <= PS_DAC_data_RAMB_ch01_2_read_enable;
          PS_DAC_data_RAMB_ch01_3_read_enable_i_i <= PS_DAC_data_RAMB_ch01_3_read_enable_i;
          PS_DAC_data_RAMB_ch01_3_read_enable_i <= PS_DAC_data_RAMB_ch01_3_read_enable;
          PS_DAC_data_RAMB_ch01_4_read_enable_i_i <= PS_DAC_data_RAMB_ch01_4_read_enable_i;
          PS_DAC_data_RAMB_ch01_4_read_enable_i <= PS_DAC_data_RAMB_ch01_4_read_enable;
          PS_DAC_data_RAMB_ch01_5_read_enable_i_i <= PS_DAC_data_RAMB_ch01_5_read_enable_i;
          PS_DAC_data_RAMB_ch01_5_read_enable_i <= PS_DAC_data_RAMB_ch01_5_read_enable;
          PS_DAC_data_RAMB_ch01_6_read_enable_i_i <= PS_DAC_data_RAMB_ch01_6_read_enable_i;
          PS_DAC_data_RAMB_ch01_6_read_enable_i <= PS_DAC_data_RAMB_ch01_6_read_enable;
          PS_DAC_data_RAMB_ch01_7_read_enable_i_i <= PS_DAC_data_RAMB_ch01_7_read_enable_i;
          PS_DAC_data_RAMB_ch01_7_read_enable_i <= PS_DAC_data_RAMB_ch01_7_read_enable;
          PS_DAC_data_RAMB_ch01_8_read_enable_i_i <= PS_DAC_data_RAMB_ch01_8_read_enable_i;
          PS_DAC_data_RAMB_ch01_8_read_enable_i <= PS_DAC_data_RAMB_ch01_8_read_enable;
          PS_DAC_data_RAMB_ch01_9_read_enable_i_i <= PS_DAC_data_RAMB_ch01_9_read_enable_i;
          PS_DAC_data_RAMB_ch01_9_read_enable_i <= PS_DAC_data_RAMB_ch01_9_read_enable;
          -- *[two-antenna]*
          if PARAM_TWO_ANTENNA_SUPPORT then
            PS_DAC_data_RAMB_ch23_0_read_enable_i_i <= PS_DAC_data_RAMB_ch23_0_read_enable_i;
            PS_DAC_data_RAMB_ch23_0_read_enable_i <= PS_DAC_data_RAMB_ch23_0_read_enable;
            PS_DAC_data_RAMB_ch23_1_read_enable_i_i <= PS_DAC_data_RAMB_ch23_1_read_enable_i;
            PS_DAC_data_RAMB_ch23_1_read_enable_i <= PS_DAC_data_RAMB_ch23_1_read_enable;
            PS_DAC_data_RAMB_ch23_2_read_enable_i_i <= PS_DAC_data_RAMB_ch23_2_read_enable_i;
            PS_DAC_data_RAMB_ch23_2_read_enable_i <= PS_DAC_data_RAMB_ch23_2_read_enable;
            PS_DAC_data_RAMB_ch23_3_read_enable_i_i <= PS_DAC_data_RAMB_ch23_3_read_enable_i;
            PS_DAC_data_RAMB_ch23_3_read_enable_i <= PS_DAC_data_RAMB_ch23_3_read_enable;
            PS_DAC_data_RAMB_ch23_4_read_enable_i_i <= PS_DAC_data_RAMB_ch23_4_read_enable_i;
            PS_DAC_data_RAMB_ch23_4_read_enable_i <= PS_DAC_data_RAMB_ch23_4_read_enable;
            PS_DAC_data_RAMB_ch23_5_read_enable_i_i <= PS_DAC_data_RAMB_ch23_5_read_enable_i;
            PS_DAC_data_RAMB_ch23_5_read_enable_i <= PS_DAC_data_RAMB_ch23_5_read_enable;
            PS_DAC_data_RAMB_ch23_6_read_enable_i_i <= PS_DAC_data_RAMB_ch23_6_read_enable_i;
            PS_DAC_data_RAMB_ch23_6_read_enable_i <= PS_DAC_data_RAMB_ch23_6_read_enable;
            PS_DAC_data_RAMB_ch23_7_read_enable_i_i <= PS_DAC_data_RAMB_ch23_7_read_enable_i;
            PS_DAC_data_RAMB_ch23_7_read_enable_i <= PS_DAC_data_RAMB_ch23_7_read_enable;
            PS_DAC_data_RAMB_ch23_8_read_enable_i_i <= PS_DAC_data_RAMB_ch23_8_read_enable_i;
            PS_DAC_data_RAMB_ch23_8_read_enable_i <= PS_DAC_data_RAMB_ch23_8_read_enable;
            PS_DAC_data_RAMB_ch23_9_read_enable_i_i <= PS_DAC_data_RAMB_ch23_9_read_enable_i;
            PS_DAC_data_RAMB_ch23_9_read_enable_i <= PS_DAC_data_RAMB_ch23_9_read_enable;
          end if;
          current_read_memory_i_i_i <= current_read_memory_i_i;
          current_read_memory_i_i <= current_read_memory_i;
          current_read_memory_i <= current_read_memory;
          fwd_early_mem0_i_i_i <= fwd_early_mem0_i_i;
          fwd_early_mem1_i_i_i <= fwd_early_mem1_i_i;
          fwd_early_mem2_i_i_i <= fwd_early_mem2_i_i;
          fwd_early_mem3_i_i_i <= fwd_early_mem3_i_i;
          fwd_early_mem4_i_i_i <= fwd_early_mem4_i_i;
          fwd_early_mem5_i_i_i <= fwd_early_mem5_i_i;
          fwd_early_mem6_i_i_i <= fwd_early_mem6_i_i;
          fwd_early_mem7_i_i_i <= fwd_early_mem7_i_i;
          fwd_early_mem8_i_i_i <= fwd_early_mem8_i_i;
          fwd_early_mem9_i_i_i <= fwd_early_mem9_i_i;
          fwd_early_mem0_i_i <= fwd_early_mem0_i;
          fwd_early_mem1_i_i <= fwd_early_mem1_i;
          fwd_early_mem2_i_i <= fwd_early_mem2_i;
          fwd_early_mem3_i_i <= fwd_early_mem3_i;
          fwd_early_mem4_i_i <= fwd_early_mem4_i;
          fwd_early_mem5_i_i <= fwd_early_mem5_i;
          fwd_early_mem6_i_i <= fwd_early_mem6_i;
          fwd_early_mem7_i_i <= fwd_early_mem7_i;
          fwd_early_mem8_i_i <= fwd_early_mem8_i;
          fwd_early_mem9_i_i <= fwd_early_mem9_i;
          fwd_early_mem0_i <= fwd_early_mem0;
          fwd_early_mem1_i <= fwd_early_mem1;
          fwd_early_mem2_i <= fwd_early_mem2;
          fwd_early_mem3_i <= fwd_early_mem3;
          fwd_early_mem4_i <= fwd_early_mem4;
          fwd_early_mem5_i <= fwd_early_mem5;
          fwd_early_mem6_i <= fwd_early_mem6;
          fwd_early_mem7_i <= fwd_early_mem7;
          fwd_early_mem8_i <= fwd_early_mem8;
          fwd_early_mem9_i <= fwd_early_mem9;
          fwd_late_mem0_i_i_i <= fwd_late_mem0_i_i;
          fwd_late_mem1_i_i_i <= fwd_late_mem1_i_i;
          fwd_late_mem2_i_i_i <= fwd_late_mem2_i_i;
          fwd_late_mem3_i_i_i <= fwd_late_mem3_i_i;
          fwd_late_mem4_i_i_i <= fwd_late_mem4_i_i;
          fwd_late_mem5_i_i_i <= fwd_late_mem5_i_i;
          fwd_late_mem6_i_i_i <= fwd_late_mem6_i_i;
          fwd_late_mem7_i_i_i <= fwd_late_mem7_i_i;
          fwd_late_mem8_i_i_i <= fwd_late_mem8_i_i;
          fwd_late_mem9_i_i_i <= fwd_late_mem9_i_i;
          fwd_late_mem0_i_i <= fwd_late_mem0_i;
          fwd_late_mem1_i_i <= fwd_late_mem1_i;
          fwd_late_mem2_i_i <= fwd_late_mem2_i;
          fwd_late_mem3_i_i <= fwd_late_mem3_i;
          fwd_late_mem4_i_i <= fwd_late_mem4_i;
          fwd_late_mem5_i_i <= fwd_late_mem5_i;
          fwd_late_mem6_i_i <= fwd_late_mem6_i;
          fwd_late_mem7_i_i <= fwd_late_mem7_i;
          fwd_late_mem8_i_i <= fwd_late_mem8_i;
          fwd_late_mem9_i_i <= fwd_late_mem9_i;
          fwd_late_mem0_i <= fwd_late_mem0;
          fwd_late_mem1_i <= fwd_late_mem1;
          fwd_late_mem2_i <= fwd_late_mem2;
          fwd_late_mem3_i <= fwd_late_mem3;
          fwd_late_mem4_i <= fwd_late_mem4;
          fwd_late_mem5_i <= fwd_late_mem5;
          fwd_late_mem6_i <= fwd_late_mem6;
          fwd_late_mem7_i <= fwd_late_mem7;
          fwd_late_mem8_i <= fwd_late_mem8;
          fwd_late_mem9_i <= fwd_late_mem9;
          fwd_idle_state_i_i_i <= fwd_idle_state_i_i;
          fwd_idle_state_i_i <= fwd_idle_state_i;
          fwd_idle_state_i <= fwd_idle_state;
        end if; -- end of reset
      end if; -- end of clk
  end process;

  -- process managing the DAC data forwarding
  process(DACxN_clk, DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        fwd_dac_valid_0_s <= '0';
        fwd_dac_data_0_s <= (others => '0');
        fwd_dac_valid_1_s <= '0';
        fwd_dac_data_1_s <= (others => '0');
        fwd_dac_valid_2_s <= '0';
        fwd_dac_data_2_s <= (others => '0');
        fwd_dac_valid_3_s <= '0';
        fwd_dac_data_3_s <= (others => '0');
      else
        -- as expected by ADI's firmware, DAC valid signals are asserted each 1/N clock cycles
        if (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_1_3b) or -- because we are delaying it 3x DACxN_clk cycles, we will now be aligned with the high-values of 'clock_enable_counter'
            PARAM_x1_FPGA_SAMPLING_RATIO) then
          fwd_dac_valid_0_s <= '1';
          fwd_dac_valid_1_s <= '1';
          -- @TO_BE_TESTED: validate that channel 2 is enabled (otherwise not even 0s will be forwarded [as valid data])
          -- *[two-antenna]*
          if dac_enable_2 = '1' and PARAM_TWO_ANTENNA_SUPPORT then
            fwd_dac_valid_2_s <= '1';
          end if;
          -- @TO_BE_TESTED: validate that channel 3 is enabled (otherwise not even 0s will be forwarded [as valid data])
          -- *[two-antenna]*
          if dac_enable_3 = '1' and PARAM_TWO_ANTENNA_SUPPORT then
            fwd_dac_valid_3_s <= '1';
          end if;
        else
          fwd_dac_valid_0_s <= '0';
          fwd_dac_valid_1_s <= '0';
          fwd_dac_valid_2_s <= '0';
          fwd_dac_valid_3_s <= '0';
        end if;

        -- forward 0s if the data arrived early [channels 0,1] (@DAC_clk!); also beware that 'fwd_early' was generated one clock cycle earlier than 'X_read_enable'
        if ((current_read_memory_i_i_i = cnt_memory_0 and fwd_early_mem0_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_1 and fwd_early_mem1_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_2 and fwd_early_mem2_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_3 and fwd_early_mem3_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_early_mem4_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_early_mem5_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_early_mem6_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_early_mem7_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_early_mem8_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_early_mem9_i_i_i = '1') or
            fwd_idle_state_i_i_i = '1') and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_1_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then -- because we are delaying it 3x DACxN_clk cycles, we will now be aligned with the high-values of 'clock_enable_counter'
          fwd_dac_data_1_s <= (others => '0');
          fwd_dac_data_0_s <= (others => '0');
        -- grab the data read from the RAMBs [channels 0,1]
        else
          for j in 0 to (C_NUM_RAMBS_PER_MEM-1) loop
            if PS_DAC_data_RAMB_ch01_0_read_enable_i_i(j) = '1' then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_0_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_0_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_1_read_enable_i_i(j) = '1' then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_1_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_1_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_2_read_enable_i_i(j) = '1' then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_2_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_2_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_3_read_enable_i_i(j) = '1' then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_3_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_3_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_4_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 5 then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_4_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_4_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_5_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 6 then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_5_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_5_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_6_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 7 then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_6_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_6_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_7_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 8 then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_7_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_7_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_8_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 9 then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_8_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_8_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch01_9_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 10 then
              fwd_dac_data_1_s <= PS_DAC_data_RAMB_ch01_9_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_0_s <= PS_DAC_data_RAMB_ch01_9_data_out(j)(15 downto 0);  -- [channel 0 LSBs]
            end if;
          end loop;
        end if;

        -- forward 0s if the data arrived early [channels 2,3] (@DAC_clk!); also beware that 'fwd_early' was generated one clock cycle earlier than 'X_read_enable'
        -- *[two-antenna]*
        if PARAM_TWO_ANTENNA_SUPPORT and
           ((current_read_memory_i_i_i = cnt_memory_0 and fwd_early_mem0_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_1 and fwd_early_mem1_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_2 and fwd_early_mem2_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_3 and fwd_early_mem3_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_early_mem4_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_early_mem5_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_early_mem6_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_early_mem7_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_early_mem8_i_i_i = '1') or
            (current_read_memory_i_i_i = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_early_mem9_i_i_i = '1') or
            fwd_idle_state_i_i_i = '1') and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_1_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then -- because we are delaying it 3x DACxN_clk cycles, we will now be aligned with the high-values of 'clock_enable_counter'
          fwd_dac_data_3_s <= (others => '0');
          fwd_dac_data_2_s <= (others => '0');
        -- grab the data read from the RAMBs [channels 2,3]
        -- *[two-antenna]*
        elsif PARAM_TWO_ANTENNA_SUPPORT then
          for j in 0 to (C_NUM_RAMBS_PER_MEM-1) loop
            if PS_DAC_data_RAMB_ch23_0_read_enable_i_i(j) = '1' then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_0_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_0_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_1_read_enable_i_i(j) = '1' then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_1_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_1_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_2_read_enable_i_i(j) = '1' then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_2_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_2_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_3_read_enable_i_i(j) = '1' then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_3_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_3_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_4_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 5 then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_4_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_4_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_5_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 6 then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_5_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_5_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_6_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 7 then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_6_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_6_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_7_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 8 then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_7_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_7_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_8_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 9 then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_8_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_8_data_out(j)(15 downto 0);  -- [channel 0 LSBs]

            elsif PS_DAC_data_RAMB_ch23_9_read_enable_i_i(j) = '1' and PARAM_BUFFER_LENGTH >= 10 then
              fwd_dac_data_3_s <= PS_DAC_data_RAMB_ch23_9_data_out(j)(31 downto 16); -- [channel 1 MSBs]
              fwd_dac_data_2_s <= PS_DAC_data_RAMB_ch23_9_data_out(j)(15 downto 0);  -- [channel 0 LSBs]
            end if;
          end loop;
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;


  -- mapping of the internal signals to the corresponding output ports (implementing the PARAM_BYPASS configuration as well)
  fwd_dac_enable_0 <= dac_enable_0;
  fwd_dac_valid_0 <= dac_valid_0 when PARAM_BYPASS else fwd_dac_valid_0_s;
  fwd_dac_data_0 <= dac_data_0 when PARAM_BYPASS else fwd_dac_data_0_s;
  fwd_dac_enable_1 <= dac_enable_1;
  fwd_dac_valid_1 <= dac_valid_1 when PARAM_BYPASS else fwd_dac_valid_1_s;
  fwd_dac_data_1 <= dac_data_1 when PARAM_BYPASS else fwd_dac_data_1_s;
  fwd_dac_enable_2 <= dac_enable_2;
  fwd_dac_valid_2 <= dac_valid_2 when PARAM_BYPASS else fwd_dac_valid_2_s;
  fwd_dac_data_2 <= dac_data_2 when PARAM_BYPASS else fwd_dac_data_2_s;
  fwd_dac_enable_3 <= dac_enable_3;
  fwd_dac_valid_3 <= dac_valid_3 when PARAM_BYPASS else fwd_dac_valid_3_s;
  fwd_dac_data_3 <= dac_data_3 when PARAM_BYPASS else fwd_dac_data_3_s;
  fwd_dac_fifo_unf <= dac_fifo_unf_DACxNclk; -- @TO_BE_IMPROVED: add logic to use this signal properly

  -- ***************************************************
  -- management of the interfacing to srs_UE_AXI_control_unit (@s00_axi_aclk)
  -- ***************************************************

  -- process generating 'late_flag'
  process(DACxN_clk, DACxN_reset)
  begin
    if rising_edge(DACxN_clk) then
      if DACxN_reset='1' then -- synchronous high-active reset: initialization of signals
        late_flag <= '0';
      else
        late_flag <= '0';
        -- the late flag will be asserted when a new late situation takes place
        if ((current_read_memory = cnt_memory_0 and fwd_late_mem0 = '1') or
            (current_read_memory = cnt_memory_1 and fwd_late_mem1 = '1') or
            (current_read_memory = cnt_memory_2 and fwd_late_mem2 = '1') or
            (current_read_memory = cnt_memory_3 and fwd_late_mem3 = '1') or
            (current_read_memory = cnt_memory_4 and PARAM_BUFFER_LENGTH >= 5 and fwd_late_mem4 = '1') or
            (current_read_memory = cnt_memory_5 and PARAM_BUFFER_LENGTH >= 6 and fwd_late_mem5 = '1') or
            (current_read_memory = cnt_memory_6 and PARAM_BUFFER_LENGTH >= 7 and fwd_late_mem6 = '1') or
            (current_read_memory = cnt_memory_7 and PARAM_BUFFER_LENGTH >= 8 and fwd_late_mem7 = '1') or
            (current_read_memory = cnt_memory_8 and PARAM_BUFFER_LENGTH >= 9 and fwd_late_mem8 = '1') or
            (current_read_memory = cnt_memory_9 and PARAM_BUFFER_LENGTH >= 10 and fwd_late_mem9 = '1')) and
            current_read_period_count = x"000" and (((not PARAM_x1_FPGA_SAMPLING_RATIO) and clock_enable_counter = cnt_0_3b) or PARAM_x1_FPGA_SAMPLING_RATIO) then
          late_flag <= '1';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing 'DAC_late_flag' and 'DAC_new_late'
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        DAC_late_flag <= '0';
        DAC_new_late <= '0';
      else
        DAC_late_flag <= late_flag_AXIclk;
        DAC_new_late <= late_flag_AXIclk;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- *DEBUG DATA* this signal is mean to help the PS to know the current configuration of the block, which was set at implementation time
  current_block_configuration <= '1' when PARAM_BYPASS else
                                 '0';

  -- process managing the internal FSM status register
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        DAC_FSM_status_s <= (others => '0'); -- late flag (LSB)
        DAC_FSM_status_s_valid <= '0';
      else
        -- *DEBUG DATA* fixed assignations
        DAC_FSM_status_s(31 downto 30) <= "11";
        DAC_FSM_status_s(29) <= current_block_configuration;
        DAC_FSM_status_s(28 downto 24) <= DMA_x_length_valid_count;
        DAC_FSM_status_s(23 downto 8) <= DMA_x_length_minus31(15 downto 0);
        DAC_FSM_status_s(7 downto 3) <= num_of_stored_frames_AXIclk;
        DAC_FSM_status_s_valid <= '1';

        -- status 0: out of reset, no request received from ARM
        if frame_storing_state = cnt_frame_storing_state_WAIT_NEW_FRAME then
          DAC_FSM_status_s(2 downto 0) <= "000";
        -- status 1: verifying header (2nd word)
        elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_2nd then
          DAC_FSM_status_s(2 downto 0) <= "001";
        -- status 2: verifying header (3rd word)
        elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_3rd then
          DAC_FSM_status_s(2 downto 0) <= "010";
        -- status 3: verifying header (4th word)
        elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_4th then
          DAC_FSM_status_s(2 downto 0) <= "011";
        -- status 4: verifying header (5th word)
        elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_5th then
          DAC_FSM_status_s(2 downto 0) <= "100";
        -- status 5: verifying header (6th word)
        elsif frame_storing_state = cnt_frame_storing_state_VERIFY_SYNC_HEADER_6th then
          DAC_FSM_status_s(2 downto 0) <= "101";
        -- status 6: request received from ARM, actual processing of the frame has not yet started
        elsif frame_storing_state = cnt_frame_storing_state_PROCESS_FRAME and currentframe_processing_started = '0' then
          DAC_FSM_status_s(2 downto 0) <= "110";
        -- status 7: request received from ARM, actual processing of the frame has started
        elsif frame_storing_state = cnt_frame_storing_state_PROCESS_FRAME and currentframe_processing_started = '1' and DAC_FSM_status_s = x"FA0B0004" then
          DAC_FSM_status_s(2 downto 0) <= "111";
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- process managing 'DAC_FSM_status' and 'DAC_FSM_new_status'
  process(s00_axi_aclk,s00_axi_aresetn)
  begin
    if rising_edge(s00_axi_aclk) then
      if s00_axi_aresetn = '0' then -- synchronous low-active reset: initialization of signals
        DAC_FSM_status <= (others => '0');
        DAC_FSM_new_status <= '0';
        DAC_FSM_status_unread <= '0';
    else
        DAC_FSM_status <= DAC_FSM_status_s;

        if DAC_FSM_status_s_valid = '1' and DAC_FSM_status_unread = '0' then
          DAC_FSM_status_unread <= '1';
          DAC_FSM_new_status <= '1';
        elsif DAC_FSM_status_unread = '1' and DAC_FSM_status_read = '1' then
          DAC_FSM_status_unread <= '0';
          DAC_FSM_new_status <= '0';
        end if;
      end if; -- end of reset
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- block instances
  -- ***************************************************

  -- cross-clock domain sharing of 'frame_storing_start_flag'
  synchronizer_frame_storing_start_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data(0) => '1',
      src_data_valid => frame_storing_start_flag,
      dst_clk => DACxN_clk,
      dst_data => open,
      dst_data_valid => frame_storing_start_flag_DACxNclk_s
    );
  -- apply reset to important cross-clock domain control signals
  frame_storing_start_flag_DACxNclk <= frame_storing_start_flag_DACxNclk_s when DACxN_reset = '0' else
                                       '0';

  -- cross-clock domain sharing of 'DMA_x_length_applied'
  synchronizer_dma_xlength_applied_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 1,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk,
      src_data(0) => DMA_x_length_applied,
      src_data_valid => '1', -- inputs will be always valid
      dst_clk => s_axi_aclk,
      dst_data(0) => DMA_x_length_applied_AXIclk_s,
      dst_data_valid => DMA_x_length_applied_AXIclk_valid_s
    );
  -- apply reset to important cross-clock domain control signals
  DMA_x_length_applied_AXIclk <= DMA_x_length_applied_AXIclk_s when s_axi_aresetn = '1' else
                                 '0';
  DMA_x_length_applied_AXIclk_valid <= DMA_x_length_applied_AXIclk_valid_s when s_axi_aresetn = '1' else
                                       '0';

  -- cross-clock domain sharing of 'timestamp_header_value_mem0'
  synchronizer_timestamp_header_value_mem0_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 64,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data => timestamp_header_value_mem0,
      src_data_valid => pulse_update_mem0_timestamp,
      dst_clk => DACxN_clk,
      dst_data => timestamp_header_value_mem0_DACxNclk,
      dst_data_valid => open -- not needed
    );
  pulse_update_mem0_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem0_AXIclk_i;

  -- cross-clock domain sharing of 'timestamp_header_value_mem1'
  synchronizer_timestamp_header_value_mem1_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 64,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data => timestamp_header_value_mem1,
      src_data_valid => pulse_update_mem1_timestamp,
      dst_clk => DACxN_clk,
      dst_data => timestamp_header_value_mem1_DACxNclk,
      dst_data_valid => open -- not needed
    );
  pulse_update_mem1_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem1_AXIclk_i;

  -- cross-clock domain sharing of 'timestamp_header_value_mem2'
  synchronizer_timestamp_header_value_mem2_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 64,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data => timestamp_header_value_mem2,
      src_data_valid => pulse_update_mem2_timestamp,
      dst_clk => DACxN_clk,
      dst_data => timestamp_header_value_mem2_DACxNclk,
      dst_data_valid => open -- not needed
    );
  pulse_update_mem2_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem2_AXIclk_i;

  -- cross-clock domain sharing of 'timestamp_header_value_mem3'
  synchronizer_timestamp_header_value_mem3_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 64,   -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data => timestamp_header_value_mem3,
      src_data_valid => pulse_update_mem3_timestamp,
      dst_clk => DACxN_clk,
      dst_data => timestamp_header_value_mem3_DACxNclk,
      dst_data_valid => open -- not needed
    );
  pulse_update_mem3_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem3_AXIclk_i;

  -- cross-clock domain sharing of 'current_num_samples_mem0'
  --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
  --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem0_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem0_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem0_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem0_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem0;
      current_num_samples_mem0_DACxNclk <= current_num_samples_mem0_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'current_num_samples_mem1'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem1_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem1_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem1_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem1_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem1;
      current_num_samples_mem1_DACxNclk <= current_num_samples_mem1_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'current_num_samples_mem2'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem2_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem2_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem2_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem2_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem2;
      current_num_samples_mem2_DACxNclk <= current_num_samples_mem2_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'current_num_samples_mem3'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem3_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem3_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem3_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem3_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem3;
      current_num_samples_mem3_DACxNclk <= current_num_samples_mem3_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory0'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem0_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory0_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory0_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory0_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory0;
      PS_DAC_data_RAMB_write_index_memory0_DACxNclk <= PS_DAC_data_RAMB_write_index_memory0_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory1'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem1_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory1_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory1_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory1_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory1;
      PS_DAC_data_RAMB_write_index_memory1_DACxNclk <= PS_DAC_data_RAMB_write_index_memory1_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory2'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem2_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory2_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory2_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory2_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory2;
      PS_DAC_data_RAMB_write_index_memory2_DACxNclk <= PS_DAC_data_RAMB_write_index_memory2_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory3'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem3_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory3_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory3_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory3_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory3;
      PS_DAC_data_RAMB_write_index_memory3_DACxNclk <= PS_DAC_data_RAMB_write_index_memory3_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem0'
    synchronizer_clear_timestamp_reg_mem0_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem0,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem0_AXIclk,
        dst_data_valid => open -- not needed
      );

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem1'
    synchronizer_clear_timestamp_reg_mem1_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem1,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem1_AXIclk,
        dst_data_valid => open -- not needed
      );

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem2'
    synchronizer_clear_timestamp_reg_mem2_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem2,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem2_AXIclk,
        dst_data_valid => open -- not needed
      );

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem3'
    synchronizer_clear_timestamp_reg_mem3_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem3,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem3_AXIclk,
        dst_data_valid => open -- not needed
      );

  crs_clk_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
    -- cross-clock domain sharing of 'timestamp_header_value_mem4'
    synchronizer_timestamp_header_value_mem4_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 64,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => timestamp_header_value_mem4,
        src_data_valid => pulse_update_mem4_timestamp,
        dst_clk => DACxN_clk,
        dst_data => timestamp_header_value_mem4_DACxNclk,
        dst_data_valid => open -- not needed
      );
    pulse_update_mem4_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem4_AXIclk_i;

    -- cross-clock domain sharing of 'current_num_samples_mem4'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem4_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem4_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem4_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem4_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem4;
      current_num_samples_mem4_DACxNclk <= current_num_samples_mem4_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory4'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem4_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory4_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory4_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory4_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory4;
      PS_DAC_data_RAMB_write_index_memory4_DACxNclk <= PS_DAC_data_RAMB_write_index_memory4_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem4'
    synchronizer_clear_timestamp_reg_mem4_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem4,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem4_AXIclk,
        dst_data_valid => open -- not needed
      );
  end generate crs_clk_5mem;

  crs_clk_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
    -- cross-clock domain sharing of 'timestamp_header_value_mem5'
    synchronizer_timestamp_header_value_mem5_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 64,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => timestamp_header_value_mem5,
        src_data_valid => pulse_update_mem5_timestamp,
        dst_clk => DACxN_clk,
        dst_data => timestamp_header_value_mem5_DACxNclk,
        dst_data_valid => open -- not needed
      );
    pulse_update_mem5_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem5_AXIclk_i;

    -- cross-clock domain sharing of 'current_num_samples_mem5'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem5_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem5_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem5_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem5_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem5;
      current_num_samples_mem5_DACxNclk <= current_num_samples_mem5_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory5'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem5_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory5_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory5_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory5_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory5;
      PS_DAC_data_RAMB_write_index_memory5_DACxNclk <= PS_DAC_data_RAMB_write_index_memory5_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem5'
    synchronizer_clear_timestamp_reg_mem5_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem5,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem5_AXIclk,
        dst_data_valid => open -- not needed
      );
  end generate crs_clk_6mem;

  crs_clk_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
    -- cross-clock domain sharing of 'timestamp_header_value_mem6'
    synchronizer_timestamp_header_value_mem6_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 64,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => timestamp_header_value_mem6,
        src_data_valid => pulse_update_mem6_timestamp,
        dst_clk => DACxN_clk,
        dst_data => timestamp_header_value_mem6_DACxNclk,
        dst_data_valid => open -- not needed
      );
    pulse_update_mem6_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem6_AXIclk_i;

    -- cross-clock domain sharing of 'current_num_samples_mem6'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem6_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem6_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem6_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem6_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem6;
      current_num_samples_mem6_DACxNclk <= current_num_samples_mem6_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory6'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem6_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory6_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory6_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory6_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory6;
      PS_DAC_data_RAMB_write_index_memory6_DACxNclk <= PS_DAC_data_RAMB_write_index_memory6_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem6'
    synchronizer_clear_timestamp_reg_mem6_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem6,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem6_AXIclk,
        dst_data_valid => open -- not needed
      );
  end generate crs_clk_7mem;

  crs_clk_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
    -- cross-clock domain sharing of 'timestamp_header_value_mem7'
    synchronizer_timestamp_header_value_mem7_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 64,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => timestamp_header_value_mem7,
        src_data_valid => pulse_update_mem7_timestamp,
        dst_clk => DACxN_clk,
        dst_data => timestamp_header_value_mem7_DACxNclk,
        dst_data_valid => open -- not needed
      );
    pulse_update_mem7_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem7_AXIclk_i;

    -- cross-clock domain sharing of 'current_num_samples_mem7'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem7_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem7_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem7_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem7_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem7;
      current_num_samples_mem7_DACxNclk <= current_num_samples_mem7_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory7'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem7_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory7_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory7_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory7_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory7;
      PS_DAC_data_RAMB_write_index_memory7_DACxNclk <= PS_DAC_data_RAMB_write_index_memory7_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem7'
    synchronizer_clear_timestamp_reg_mem7_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem7,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem7_AXIclk,
        dst_data_valid => open -- not needed
      );
  end generate crs_clk_8mem;

  crs_clk_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
    -- cross-clock domain sharing of 'timestamp_header_value_mem8'
    synchronizer_timestamp_header_value_mem8_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 64,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => timestamp_header_value_mem8,
        src_data_valid => pulse_update_mem8_timestamp,
        dst_clk => DACxN_clk,
        dst_data => timestamp_header_value_mem8_DACxNclk,
        dst_data_valid => open -- not needed
      );
    pulse_update_mem8_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem8_AXIclk_i;

    -- cross-clock domain sharing of 'current_num_samples_mem8'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem8_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem8_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem8_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem8_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem8;
      current_num_samples_mem8_DACxNclk <= current_num_samples_mem8_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory8'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem8_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory8_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxN_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory8_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory8_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory8;
      PS_DAC_data_RAMB_write_index_memory8_DACxNclk <= PS_DAC_data_RAMB_write_index_memory8_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem8'
    synchronizer_clear_timestamp_reg_mem8_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem8,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem8_AXIclk,
        dst_data_valid => open -- not needed
      );
  end generate crs_clk_9mem;

  crs_clk_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
    -- cross-clock domain sharing of 'timestamp_header_value_mem9'
    synchronizer_timestamp_header_value_mem9_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 64,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => timestamp_header_value_mem9,
        src_data_valid => pulse_update_mem9_timestamp,
        dst_clk => DACxN_clk,
        dst_data => timestamp_header_value_mem9_DACxNclk,
        dst_data_valid => open -- not needed
      );
    pulse_update_mem9_timestamp <= update_mem_timestamps_pulse or pulse_clear_timestamping_ctrl_reg_mem9_AXIclk_i;

    -- cross-clock domain sharing of 'current_num_samples_mem9'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_current_num_samples_mem9_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => current_num_samples_mem9_16b,
        src_data_valid => update_mem_timestamps_pulse, -- we use this signal since num_samples_memX are updated jointly with timestamps when a new packet arrives
        dst_clk => DACxN_clk,
        dst_data => current_num_samples_mem9_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      current_num_samples_mem9_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= current_num_samples_mem9;
      current_num_samples_mem9_DACxNclk <= current_num_samples_mem9_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'PS_DAC_data_RAMB_write_index_memory9'
    --   ** NOTE: the current FIFO-based CDC synchronizer does not support a parametrizable width and, hence, a fixed 16-bit width is
    --            used instead, which should allow large enough packets (i.e., up to 16000 samples) **; @TO_BE_TESTED: make sure that this assumption is always valid; @TO_BE_IMPROVED: modify the FIFO-based CDC synchronizer to enable a parametrizable width
    synchronizer_PS_DAC_RAMB_write_index_mem9_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 16,   -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => s_axi_aclk,
        src_data => PS_DAC_data_RAMB_write_index_memory9_16b,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => DACxn_clk,
        dst_data => PS_DAC_data_RAMB_write_index_memory9_DACxNclk_16b,
        dst_data_valid => open -- not needed
      );
      -- needed because of variable width of input signal
      PS_DAC_data_RAMB_write_index_memory9_16b(C_NUM_ADDRESS_BITS-1 downto 0) <= PS_DAC_data_RAMB_write_index_memory9;
      PS_DAC_data_RAMB_write_index_memory9_DACxNclk <= PS_DAC_data_RAMB_write_index_memory9_DACxNclk_16b(C_NUM_ADDRESS_BITS-1 downto 0);

    -- cross-clock domain sharing of 'clear_timestamping_ctrl_reg_mem9'
    synchronizer_clear_timestamp_reg_mem9_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
      generic map (
        g_DATA_WIDTH    => 1,    -- fixed value
        SYNCH_ACTIVE => true -- fixed value
      )
      port map (
        src_clk => DACxN_clk,
        src_data(0) => clear_timestamping_ctrl_reg_mem9,
        src_data_valid => '1', -- inputs will be always valid
        dst_clk => s_axi_aclk,
        dst_data(0) => clear_timestamping_ctrl_reg_mem9_AXIclk,
        dst_data_valid => open -- not needed
      );
  end generate crs_clk_10mem;

  -- cross-clock domain sharing of 'dac_fifo_unf'
  synchronizer_dac_fifo_unf_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => s_axi_aclk,
      src_data(0) => '1',
      src_data_valid => dac_fifo_unf,
      dst_clk => DACxN_clk,
      dst_data => open,
      dst_data_valid => dac_fifo_unf_DACxNclk_s
    );
  -- apply reset to important cross-clock domain control signals
  dac_fifo_unf_DACxNclk <= dac_fifo_unf_DACxNclk_s when DACxN_reset = '0' else '0';

  -- cross-clock domain sharing of 'late_flag'
  synchronizer_late_flag_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 1,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk,
      src_data(0) => '1',
      src_data_valid => late_flag,
      dst_clk => s00_axi_aclk,
      dst_data => open,
      dst_data_valid => late_flag_AXIclk_s -- not needed
    );
  -- apply reset to important cross-clock domain control signals
  late_flag_AXIclk <= late_flag_AXIclk_s when s00_axi_aresetn = '1' else
                      '0';

  -- cross-clock domain sharing of 'num_of_stored_frames'
  synchronizer_num_of_stored_frames_ins : entity work.multibit_cross_clock_domain_fifo_synchronizer_resetless
    generic map (
      g_DATA_WIDTH    => 5,    -- fixed value
      SYNCH_ACTIVE => true -- fixed value
    )
    port map (
      src_clk => DACxN_clk,
      src_data => num_of_stored_frames,
      src_data_valid => '1', -- inputs will be always valid
      dst_clk => s00_axi_aclk,
      dst_data => num_of_stored_frames_AXIclk,
      dst_data_valid => open -- not needed
    );

  -- ******************************************************************************
  -- RAMB instances (internal storage of the I/Q samples sent by the PS to the DAC
  -- ******************************************************************************

  -- * NOTE: the internal buffer is currently sized to keep up to 10 subframes (i.e., 10 ms) worth of PARAM_MAX_DMA_PACKET_LENGTH data (e.g. @1.92 Msps/1.4 MHz BW); the parity bits are
  --         exploited to store the DAC channels valid and enable signals, enabling by this way a flexible implementation of this block functionality
  --         (i.e., no rigid DAC channel configuration, in terms of enable/valid, is forced to enable the correct behaviour of this block; e.g, the
  --         channels can be enabled/disabed in an I/Q sample basis)
  --
  --         As previously detailed, the writing to the RAMBs will take place @s_axi_aclk and the reading @DACxN_clk, so they will naturally act as
  --         a safe cross-clock domain translation logic. *

  -- the RAMB instances require a high-active reset signal
  s_axi_areset <= not s_axi_aresetn;

GEN_MEMORY_CH01: for i in 0 to (C_NUM_RAMBS_PER_MEM-1) generate
-- ******************************************************************************
-- RAMB instances synthesized for channels 0 and 1 data strorage
-- ******************************************************************************
begin
  -- RAMB36E2 instance ch01_0 (first 36 kbit of memory_0, storing the first 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_0_inst: entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_0_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_0_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_0_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_0_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_0_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_0_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_0 instantiation

  -- RAMB36E2 instance ch01_1 (second 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_1_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_1_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_1_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_1_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_1_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_1_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_1_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_1 instantiation

  -- RAMB36E2 instance ch01_2 (third 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_2_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_2_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_2_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_2_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_2_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_2_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_2_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_2 instantiation

  -- RAMB36E2 instance ch01_3 (fourth 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_3_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_3_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_3_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_3_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_3_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_3_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_3_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_3 instantiation

rmb_inst_ch01_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
  -- RAMB36E2 instance ch01_4 (fifth 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_4_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_4_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_4_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_4_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_4_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_4_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_4_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_4 instantiation
end generate rmb_inst_ch01_5mem;

rmb_inst_ch01_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
  -- RAMB36E2 instance ch01_5 (sixth 36 kbit of memory_0, storing the nex1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_5_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_5_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_5_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_5_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_5_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_5_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_5_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_5 instantiation
end generate rmb_inst_ch01_6mem;

rmb_inst_ch01_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
  -- RAMB36E2 instance ch01_6 (seventh 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_6_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_6_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_6_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_6_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_6_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_6_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_6_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_6 instantiation
end generate rmb_inst_ch01_7mem;

rmb_inst_ch01_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
  -- RAMB36E2 instance ch01_7 (eighth 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_7_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_7_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_7_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_7_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_7_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_7_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_7_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_7 instantiation
end generate rmb_inst_ch01_8mem;

rmb_inst_ch01_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
  -- RAMB36E2 instance ch01_8 (ninth 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_8_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_8_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_8_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_8_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_8_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_8_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_8_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_8 instantiation
end generate rmb_inst_ch01_9mem;

rmb_inst_ch01_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
  -- RAMB36E2 instance ch01_9 (tenth 36 kbit of memory_0, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
  PS_DAC_data_RAMB_ch01_9_inst : entity work.single_port_memory
    generic map(
      g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
      g_MEM_TYPE              => PARAM_MEM_TYPE,
      g_DATA_WIDTH            => 32,
      g_ADDRESS_WIDTH         => 15
    )
    port map(
      rd_clk => DACxN_clk,
      wr_clk => s_axi_aclk,
      --
      rd_reset => DACxN_reset,
      wr_reset => s_axi_areset,
      --
      wr_address   => PS_DAC_data_RAMB_ch01_9_write_address(i),
      wr_din       => PS_DAC_data_RAMB_data_in_ch01,
      wr_byte_wide => PS_DAC_data_RAMB_ch01_9_byteWide_write_enable(i),
      wr_enable    => PS_DAC_data_RAMB_ch01_9_write_enable(i),
      --
      rd_address => PS_DAC_data_RAMB_ch01_9_read_address(i),
      rd_dout    => PS_DAC_data_RAMB_ch01_9_data_out(i),
      rd_enable  => PS_DAC_data_RAMB_ch01_9_read_enable(i)
    );
  -- End of PS_DAC_data_RAMB_ch01_9 instantiation
end generate rmb_inst_ch01_10mem;

end generate;

TWO_ANTENNA_RAMB_inst: if PARAM_TWO_ANTENNA_SUPPORT generate
  GEN_MEMORY_ch23: for i in 0 to (C_NUM_RAMBS_PER_MEM-1) generate
  -- ******************************************************************************
  -- RAMB instances synthesized for channels 2 and 3 data strorage
  -- ******************************************************************************
  begin
    -- RAMB36E2 instance ch23_0 (first 36 kbit of memory_1, storing the first 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_0_inst: entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_0_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_0_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_0_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_0_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_0_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_0_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_0 instantiation

    -- RAMB36E2 instance ch23_1 (second 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_1_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_1_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_1_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_1_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_1_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_1_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_1_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_1 instantiation

    -- RAMB36E2 instance ch23_2 (third 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_2_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_2_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_2_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_2_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_2_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_2_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_2_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_2 instantiation

    -- RAMB36E2 instance ch23_3 (fourth 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_3_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_3_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_3_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_3_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_3_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_3_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_3_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_3 instantiation

  rmb_inst_ch23_5mem : if PARAM_BUFFER_LENGTH >= 5 generate
    -- RAMB36E2 instance ch23_4 (fifth 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_4_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_4_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_4_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_4_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_4_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_4_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_4_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_4 instantiation
  end generate rmb_inst_ch23_5mem;

  rmb_inst_ch23_6mem : if PARAM_BUFFER_LENGTH >= 6 generate
    -- RAMB36E2 instance ch23_5 (sixth 36 kbit of memory_0, storing the nex1024 16-bit I & 16-bit Q samples for DAC channels 0 & 1)
    PS_DAC_data_RAMB_ch23_5_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_5_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_5_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_5_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_5_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_5_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_5_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_5 instantiation
  end generate rmb_inst_ch23_6mem;

  rmb_inst_ch23_7mem : if PARAM_BUFFER_LENGTH >= 7 generate
    -- RAMB36E2 instance ch23_6 (seventh 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_6_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_6_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_6_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_6_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_6_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_6_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_6_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_6 instantiation
  end generate rmb_inst_ch23_7mem;

  rmb_inst_ch23_8mem : if PARAM_BUFFER_LENGTH >= 8 generate
    -- RAMB36E2 instance ch23_7 (eighth 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_7_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_7_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_7_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_7_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_7_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_7_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_7_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_7 instantiation
  end generate rmb_inst_ch23_8mem;

  rmb_inst_ch23_9mem : if PARAM_BUFFER_LENGTH >= 9 generate
    -- RAMB36E2 instance ch23_8 (ninth 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_8_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_8_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_8_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_8_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_8_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_8_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_8_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_8 instantiation
  end generate rmb_inst_ch23_9mem;

  rmb_inst_ch23_10mem : if PARAM_BUFFER_LENGTH >= 10 generate
    -- RAMB36E2 instance ch23_9 (tenth 36 kbit of memory_1, storing the next 1024 16-bit I & 16-bit Q samples for DAC channels 2 & 3)
    PS_DAC_data_RAMB_ch23_9_inst : entity work.single_port_memory
      generic map(
        g_MEM_CLOCK_DOMAIN_TYPE => "INDEPENDENT",
        g_MEM_TYPE              => PARAM_MEM_TYPE,
        g_DATA_WIDTH            => 32,
        g_ADDRESS_WIDTH         => 15
      )
      port map(
        rd_clk => DACxN_clk,
        wr_clk => s_axi_aclk,
        --
        rd_reset => DACxN_reset,
        wr_reset => s_axi_areset,
        --
        wr_address   => PS_DAC_data_RAMB_ch23_9_write_address(i),
        wr_din       => PS_DAC_data_RAMB_data_in_ch23,
        wr_byte_wide => PS_DAC_data_RAMB_ch23_9_byteWide_write_enable(i),
        wr_enable    => PS_DAC_data_RAMB_ch23_9_write_enable(i),
        --
        rd_address => PS_DAC_data_RAMB_ch23_9_read_address(i),
        rd_dout    => PS_DAC_data_RAMB_ch23_9_data_out(i),
        rd_enable  => PS_DAC_data_RAMB_ch23_9_read_enable(i)
      );
    -- End of PS_DAC_data_RAMB_ch23_9 instantiation
  end generate rmb_inst_ch23_10mem;

  end generate;
end generate TWO_ANTENNA_RAMB_inst;

end arch_dac_fifo_timestamp_enabler_RTL_impl;
