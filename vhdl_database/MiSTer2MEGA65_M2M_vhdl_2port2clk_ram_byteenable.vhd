library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dualport_2clk_ram_byteenable is
   generic (
       G_ADDR_WIDTH : integer := 8;
       G_DATA_WIDTH : integer := 8;   -- Must by a multiple of 8.
       G_FALLING_A  : boolean := false;        -- read/write on falling edge for clock a
       G_FALLING_B  : boolean := false         -- ditto clock b
   );
   port
   (
      a_clk_i        : in  std_logic;
      a_address_i    : in  std_logic_vector(G_ADDR_WIDTH - 1 downto 0);
      a_data_i       : in  std_logic_vector(G_DATA_WIDTH - 1 downto 0);
      a_byteenable_i : in  std_logic_vector(G_DATA_WIDTH/8 - 1 downto 0);
      a_wren_i       : in  std_logic;
      a_q_o          : out std_logic_vector(G_DATA_WIDTH - 1 downto 0);

      b_clk_i        : in  std_logic;
      b_address_i    : in  std_logic_vector(G_ADDR_WIDTH - 1 downto 0);
      b_data_i       : in  std_logic_vector(G_DATA_WIDTH - 1 downto 0) := (others => '0');
      b_byteenable_i : in  std_logic_vector(G_DATA_WIDTH/8 - 1 downto 0) := (others => '1');
      b_wren_i       : in  std_logic := '0';
      b_q_o          : out std_logic_vector(G_DATA_WIDTH - 1 downto 0)
   );
end entity dualport_2clk_ram_byteenable;

architecture synthesis of dualport_2clk_ram_byteenable is

begin

   gen_rams : for i in 0 to G_DATA_WIDTH/8-1 generate

      i_dualport_2clk_ram : entity work.dualport_2clk_ram
         generic map (
             ADDR_WIDTH => G_ADDR_WIDTH,
             DATA_WIDTH => 8,
             FALLING_A  => G_FALLING_A,
             FALLING_B  => G_FALLING_B
         )
         port map
         (
            clock_a   => a_clk_i,
            address_a => a_address_i,
            data_a    => a_data_i(8*i+7 downto 8*i),
            wren_a    => a_wren_i and a_byteenable_i(i),
            q_a       => a_q_o(8*i+7 downto 8*i),

            clock_b   => b_clk_i,
            address_b => b_address_i,
            data_b    => b_data_i(8*i+7 downto 8*i),
            wren_b    => b_wren_i and b_byteenable_i(i),
            q_b       => b_q_o(8*i+7 downto 8*i)
         ); -- i_dualport_2clk_ram

      end generate gen_rams;

end architecture synthesis;

