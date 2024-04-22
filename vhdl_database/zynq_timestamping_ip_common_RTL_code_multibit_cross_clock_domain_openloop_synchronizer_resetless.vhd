--
-- Copyright 2013-2020 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.
--

library IEEE;
use IEEE.std_logic_1164.all;

entity multibit_cross_clock_domain_openloop_synchronizer_resetless is
  generic (
    -- parameter defining the current data-width
    DATA_WIDTH	: integer	:= 32;   --! Width of the data to be synchronized between clock domains
    SYNCH_ACTIVE : boolean := true --! Indicates if the synchronizer must be really instantiated or if it needs to be bypassed; this attribute is used to
                                   --!   increase the flexibility of the design by supporting various clock sources or a single one without requiring changes
                                   --!   in the VHDL code. In cases where the source and destination clock are tied to the same clock signal, then this circuit
                                   --!   will be bypassed (i.e., ACTIVE := false -> then the logic will be prunned by the synthesizer and dst_data* = src_data*),
                                   --!   whereas if they are tied to different clock signals, then this circuit will be used (i.e., ACTIVE := true -> the logic
                                   --!   will be synthesized and dst_data* = synchronized(src_data*))
  );
  port (
    -- input ports
    src_clk : in std_logic;                                 --! Source clock domain signal
    src_data : in std_logic_vector(DATA_WIDTH-1 downto 0);  --! Parallel input data bus (mapped to the source clock domain)
    src_data_valid : in std_logic;                          --! Signal indicating when the input data is valid (mapped to the source clock domain)
    dst_clk : in std_logic;                                 --! Destination clock domain signal

    -- output ports
    dst_data : out std_logic_vector(DATA_WIDTH-1 downto 0); --! Parallel output data bus (mapped to the destination clock domain)
    dst_data_valid : out std_logic                          --! Signal indicating when the output data is valid (mapped to the destination clock domain)
  );
end multibit_cross_clock_domain_openloop_synchronizer_resetless;

architecture arch_multibit_cross_clock_domain_openloop_synchronizer_resetless_RTL_impl of multibit_cross_clock_domain_openloop_synchronizer_resetless is

  -- **********************************
  -- internal signals
  -- **********************************

  signal src_data_valid_XORed : std_logic:='0';
  signal src_data_reg : std_logic_vector(DATA_WIDTH-1 downto 0):=(others => '0');
  signal src_data_valid_reg : std_logic:='0';
  signal dst_data_reg0 : std_logic_vector(DATA_WIDTH-1 downto 0):=(others => '0');
  signal dst_data_reg1 : std_logic_vector(DATA_WIDTH-1 downto 0):=(others => '0');
  signal dst_data_valid_reg0 : std_logic:='0';
  signal dst_data_valid_reg1 : std_logic:='0';
  signal dst_data_valid_XORed : std_logic:='0';
  signal dst_data_valid_reg : std_logic:='0';
  signal dst_data_s : std_logic_vector(DATA_WIDTH-1 downto 0):=(others => '0');
  signal dst_data_valid_s : std_logic:='0';

begin

  -- ** NOTE: when ACTIVE := true, this block implements a basic two-stage flip-flop multi-bit synchronizer circuit that allows safely passing data between
  --          different clock domains; for extra safety, both the input and output data are registered and a toogle event synchronizer is utilized for the
  --          data valid signal. As a result, we obtain a reasonably secure, fast and cheap solution to avoid metastability problems in signals travessing
  --          different clock domains
  --
  --          the design is based on the circuit shown in https://xlnx.i.lithium.com/t5/image/serverpage/image-id/24715i4FEDBC0C4EB55DE0?v=1.0 **

  -- ***************************************************
  -- toggling data and data_valid events @src_clk
  -- ***************************************************

  -- concurrent xoring of the source data-valid signal with its own registered version
  src_data_valid_XORed <= src_data_valid xor src_data_valid_reg;

  -- process registering the data andº data-valid signal originated in the source clock domain
  process(src_clk)
  begin
    if rising_edge(src_clk) then
      src_data_reg <= src_data;
      src_data_valid_reg <= src_data_valid_XORed;
    end if; -- end of clk
  end process;

  -- ***************************************************
  -- synchronization of data and data_valid @dst_clk
  -- ***************************************************

  -- process implementing a basic two flip-flop cross-clock domain synchronization technique to pass the source data and data-valid signals to the destination clock domain
  process(dst_clk)
  begin
    if rising_edge(dst_clk) then
      dst_data_reg0 <= src_data_reg;
      dst_data_reg1 <= dst_data_reg0;
      dst_data_valid_reg0 <= src_data_valid_reg;
      dst_data_valid_reg1 <= dst_data_valid_reg0;
    end if; -- end of clk
  end process;

  -- process registering the data-valid signals received in the destination clock domain
  process(dst_clk)
  begin
    if rising_edge(dst_clk) then
      dst_data_valid_reg <= dst_data_valid_reg1;
    end if; -- end of clk
  end process;

  -- concurrent xoring of the destination data-valid signal with its own registered version
  dst_data_valid_XORed <= dst_data_valid_reg1 xor dst_data_valid_reg;

  -- ***************************************************
  -- generation of synchronized outputs @dst_clk
  -- ***************************************************

  -- process generating the output signals
  process(dst_clk)
  begin
    if rising_edge(dst_clk) then
      -- clear the output valid signal
      dst_data_valid_s <= '0';

      -- latch synchronized data and data valid signals
      if dst_data_valid_XORed = '1' then
        dst_data_valid_s <= '1';
        dst_data_s <= dst_data_reg1;
      end if;
    end if; -- end of clk
  end process;

  -- assign output port values depending on the SYNCH_ACTIVE parameter
  dst_data <= dst_data_s when SYNCH_ACTIVE else -- synchronizer needs to be synthesized
              src_data;                         -- synchronizer is bypassed

  dst_data_valid <= dst_data_valid_s when SYNCH_ACTIVE else -- synchronizer needs to be synthesized
                    src_data_valid;                         -- synchronizer is bypassed

end arch_multibit_cross_clock_domain_openloop_synchronizer_resetless_RTL_impl;
