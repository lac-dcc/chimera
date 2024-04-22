library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Clock Domain Crossing specialized for slowly varying data:
-- Only propagate when all bits are stable.

entity cdc_slow is
  generic (
    G_DATA_SIZE    : integer;
    G_REGISTER_SRC : boolean := false  -- Add register to input data
  );
  port (
    src_clk_i   : in    std_logic;
    src_rst_i   : in    std_logic;
    src_valid_i : in    std_logic;
    src_data_i  : in    std_logic_vector(G_DATA_SIZE - 1 downto 0);
    dst_clk_i   : in    std_logic;
    dst_valid_o : out   std_logic;
    dst_data_o  : out   std_logic_vector(G_DATA_SIZE - 1 downto 0)
  );
end entity cdc_slow;

architecture synthesis of cdc_slow is

  signal src_data   : std_logic_vector(G_DATA_SIZE downto 0);
  signal dst_data   : std_logic_vector(G_DATA_SIZE downto 0);
  signal dst_data_d : std_logic_vector(G_DATA_SIZE downto 0);

begin

   process (src_clk_i)
   begin
      if rising_edge(src_clk_i) then
         src_data(G_DATA_SIZE-1 downto 0) <= src_data_i;
         src_data(G_DATA_SIZE) <= src_data(G_DATA_SIZE) xor src_valid_i;

         if src_rst_i = '1' then
            src_data <= (others => '0');
         end if;
      end if;
   end process;

   i_cdc_stable : entity work.cdc_stable
     generic map (
       G_DATA_SIZE    => G_DATA_SIZE + 1,
       G_REGISTER_SRC => G_REGISTER_SRC
     )
     port map (
       src_clk_i   => src_clk_i,
       src_data_i  => src_data,
       dst_clk_i   => dst_clk_i,
       dst_data_o  => dst_data
     ); -- i_cdc_slow

   process (dst_clk_i)
   begin
      if rising_edge(dst_clk_i) then
         dst_data_d <= dst_data;
      end if;
   end process;

   dst_data_o <= dst_data(G_DATA_SIZE-1 downto 0);
   dst_valid_o <= dst_data(G_DATA_SIZE) xor dst_data_d(G_DATA_SIZE);

end architecture synthesis;

