library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cic_filter is
  generic(
    bits : integer := 31;
    stages : integer := 2
  );
  port(
    clk : in std_logic;
    rst : in std_logic;
    decimation : in std_logic_vector(31 downto 0);
    data_in    : in std_logic_vector(bits-1 downto 0);
    data_out_stb : out std_logic;
    data_out   : out std_logic_vector(bits-1 downto 0)
  );
end entity cic_filter;

architecture rtl of cic_filter is

  type pipeline_type is array (0 to stages) of signed(bits-1 downto 0);
  signal integrator : pipeline_type := (others => (others => '0'));
  signal comb : pipeline_type := (others => (others => '0'));
  signal delayed : pipeline_type := (others => (others => '0'));
  signal count : unsigned(31 downto 0);

begin

  process
  begin
    wait until rising_edge(clk);

    --integrator sections
    integrator(0) <= signed(data_in);
    for i in 0 to stages-1 loop
      integrator(i+1)  <= integrator(i+1) + integrator(i);
    end loop;

    --comb sections
    if count = 0 then
      count <= unsigned(decimation) - 1;
      delayed(0) <= integrator(stages);
      comb(1)  <= integrator(stages) - delayed(0);
      for i in 1 to stages-1 loop
        delayed(i) <= comb(i);
        comb(i+1)  <= comb(i) - delayed(i);
      end loop;
      data_out_stb <= '1';
    else
      count <= count - 1;
      data_out_stb <= '0';
    end if;

  end process;

  data_out <= std_logic_vector(comb(stages));

end rtl;
