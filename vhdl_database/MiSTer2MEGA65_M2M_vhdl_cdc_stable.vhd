library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Clock Domain Crossing specialized for slowly varying data:
-- Only propagate when all bits are stable.
--
-- In the constraint file, add the following line:
-- set_max_delay 8 -datapath_only -from [get_clocks] -to [get_pins -hierarchical "*cdc_stable_gen.dst_*_d_reg[*]/D"]

entity cdc_stable is
  generic (
    G_DATA_SIZE    : integer;
    G_REGISTER_SRC : boolean := false  -- Add register to input data
  );
  port (
    src_clk_i  : in    std_logic;
    src_data_i : in    std_logic_vector(G_DATA_SIZE - 1 downto 0);
    dst_clk_i  : in    std_logic;
    dst_data_o : out   std_logic_vector(G_DATA_SIZE - 1 downto 0)
  );
end entity cdc_stable;

architecture synthesis of cdc_stable is

  signal src_data    : std_logic_vector(G_DATA_SIZE - 1 downto 0);
  signal dst_data_d  : std_logic_vector(G_DATA_SIZE - 1 downto 0);
  signal dst_data_dd : std_logic_vector(G_DATA_SIZE - 1 downto 0);

  attribute async_reg                : string;
  attribute async_reg of dst_data_d  : signal is "true";
  attribute async_reg of dst_data_dd : signal is "true";

begin

  -- Optionally add a register to the input samples

  input_reg_gen : if G_REGISTER_SRC generate

    input_reg_proc : process (src_clk_i)
    begin
      if rising_edge(src_clk_i) then
        src_data <= src_data_i;
      end if;
    end process input_reg_proc;

  else generate
    src_data <= src_data_i;
  end generate input_reg_gen;

  -- Use generate to create a nice unique name for constraining

  cdc_stable_gen : if true generate

    sample_proc : process (dst_clk_i)
    begin
      if rising_edge(dst_clk_i) then
        dst_data_d  <= src_data;   -- CDC
        dst_data_dd <= dst_data_d;

        -- Propagate, when sampling is stable
        if dst_data_d = dst_data_dd then
          dst_data_o <= dst_data_dd;
        end if;
      end if;
    end process sample_proc;

  end generate cdc_stable_gen;

end architecture synthesis;

