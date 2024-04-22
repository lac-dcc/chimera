-- Jonathan P Dawson 9/10/2016
--
-- CORDIC
--
-- Calculates magnitude and phase from rectangular inputs
-- Uses the cordic algorithm.
--
-- The magnitude has been multiplied by the cordic gain ~1.647, this will
-- need to be factored in if you need the absolute magnitude.
--
-- The magnitude is represented as a signed number. The minimum signed number
-- corresponds to -pi, the maximum number corresponds to (almost) +pi.


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity rectangular_to_polar_tb is
end entity rectangular_to_polar_tb;

architecture rtl of rectangular_to_polar_tb is

  component rectangular_to_polar is
    generic(
      width : integer
    );
    port(
      clk : in std_logic;
      rst : in std_logic;
      stb_in : in std_logic;
      stb_out : out std_logic;
      i   : in std_logic_vector(width-1 downto 0);
      q   : in std_logic_vector(width-1 downto 0);
      phase : out std_logic_vector(width downto 0);
      magnitude : out std_logic_vector(width downto 0)
    );
  end component rectangular_to_polar;

  signal clk : std_logic;
  signal rst : std_logic;
  signal stb_in : std_logic;
  signal stb_out : std_logic;
  signal i   : std_logic_vector(30 downto 0);
  signal q   : std_logic_vector(30 downto 0);
  signal phase : std_logic_vector(31 downto 0);
  signal magnitude : std_logic_vector(31 downto 0);

begin


  process
  begin
    while True loop
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process;

  process
  begin
    stb_in <= '0';
    rst <= '1';
    wait for 100 ns;
    rst <= '0';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    i <= std_logic_vector(to_signed(-361, 31));
    q <= std_logic_vector(to_signed(0, 31));
    stb_in <= '1';
    wait until rising_edge(clk);
    stb_in <= '0';
    wait;
  end process;


  uut: rectangular_to_polar generic map(
    width => 31
  ) port map (
    clk => clk,
    rst => rst,
    stb_in => stb_in,
    stb_out => stb_out,
    i => i,
    q => q,
    phase => phase,
    magnitude => magnitude
  );



end rtl;
