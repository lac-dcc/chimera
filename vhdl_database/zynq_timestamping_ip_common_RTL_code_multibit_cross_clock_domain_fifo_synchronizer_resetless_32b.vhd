--
-- Copyright 2013-2020 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.
--

library IEEE;
use IEEE.std_logic_1164.all;

-- we will use the Xilinx prametrized marcros (xpm) library
library xpm;
use xpm.vcomponents.all;

entity multibit_cross_clock_domain_fifo_synchronizer_resetless_32b is
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
end multibit_cross_clock_domain_fifo_synchronizer_resetless_32b;

architecture arch_multibit_cross_clock_domain_fifo_synchronizer_resetless_32b_RTL_impl of multibit_cross_clock_domain_fifo_synchronizer_resetless_32b is

  -- **********************************
  -- component instantiation
  -- **********************************

   -- small FIFO aimed at enabling safe CDC communications
   component CDC_fifo_32b is
    port (
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(31 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(31 downto 0);
      full : out std_logic;
      empty : out std_logic;
      valid : out std_logic
    );
  end component;

  -- **********************************
  -- internal signals
  -- **********************************

  -- FIFO related signals
  signal fifo_din : std_logic_vector(31 downto 0);
  signal fifo_din_valid : std_logic:='0';
  signal fifo_wr_en : std_logic;
  signal fifo_rd_en : std_logic;
  signal fifo_dout : std_logic_vector(31 downto 0);
  signal fifo_full : std_logic;
  signal fifo_empty : std_logic;
  signal fifo_valid : std_logic;
  signal dst_data_s : std_logic_vector(31 downto 0):=(others => '0');
  signal dst_data_valid_s : std_logic:='0';

begin

  -- ***************************************************
  -- input data latching and management of FIFO write signals
  -- ***************************************************

  -- fixed mapping of input ports to internal signals
  fifo_din <= src_data;
  fifo_din_valid <= src_data_valid;

  -- process to control the writing to the FIFO
  process(src_clk)
  begin
    if rising_edge(src_clk) then
      -- clean unused signals
      fifo_wr_en <= '0';

      -- stop writing to FIFO when it is full or when data is not valid
      if fifo_full = '0' and fifo_din_valid = '1' then
        fifo_wr_en <= '1';
      end if;
    end if; -- end of clk
  end process;

  -- process to control the reading from the FIFO used to provide a reliable cross clock-domain sharing
  process(dst_clk)
  begin
    if rising_edge(dst_clk) then
      -- no need to check for 'empty', since reading is a non-destructive process
      fifo_rd_en <= '1';
    end if; -- end of clk
  end process;

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
      if fifo_valid = '1' then
        dst_data_valid_s <= '1';
        dst_data_s <= fifo_dout;
      end if;
    end if; -- end of clk
  end process;

  -- assign output port values depending on the SYNCH_ACTIVE parameter
  dst_data <= dst_data_s when SYNCH_ACTIVE else -- synchronizer needs to be synthesized
              src_data;                         -- synchronizer is bypassed

  dst_data_valid <= dst_data_valid_s when SYNCH_ACTIVE else -- synchronizer needs to be synthesized
                    src_data_valid;                         -- synchronizer is bypassed

  -- ***************************************************
  -- block instances
  -- ***************************************************

   CDC_fifo_32b_ins : CDC_fifo_32b
   port map (
     wr_clk        =>  src_clk,
     rd_clk        =>  dst_clk,
     din           =>  fifo_din,
     wr_en         =>  fifo_wr_en,
     rd_en         =>  fifo_rd_en,
     dout          =>  fifo_dout,
     full          =>  fifo_full,
     empty         =>  fifo_empty,
     valid         =>  fifo_valid
   );

end arch_multibit_cross_clock_domain_fifo_synchronizer_resetless_32b_RTL_impl;
