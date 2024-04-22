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

entity rectangular_to_polar is
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
end entity rectangular_to_polar;

architecture rtl of rectangular_to_polar is

  --The range of output bits represents -pi to +pi radians
  constant half_phase_range : integer := 2**(width-1);

  type pipeline_type is array (0 to width) of signed(width downto 0);
  signal pipeline_i     : pipeline_type := (others => (others => '0'));
  signal pipeline_q     : pipeline_type := (others => (others => '0'));
  signal pipeline_phase : pipeline_type := (others => (others => '0'));
  signal stb : std_logic_vector(width downto 0);

begin


  process
    variable d : integer := 0;
  begin

    wait until rising_edge(clk);

    if signed(q) < 0 then
      pipeline_i(0) <= -resize(signed(q), width+1);
      pipeline_q(0) <= resize(signed(i), width+1);
      pipeline_phase(0) <= -to_signed(half_phase_range/2, width+1);
    else
      pipeline_i(0) <= resize(signed(q), width+1);
      pipeline_q(0) <= -resize(signed(i), width+1);
      pipeline_phase(0) <= to_signed(half_phase_range/2, width+1);
    end if;
    stb(0) <= stb_in;

    d := 1;
    for N in 0 to (width-1) loop
      if pipeline_q(N) < 0 then
        pipeline_i(N+1) <= pipeline_i(N) - (pipeline_q(N)/d);
        pipeline_q(N+1) <= pipeline_q(N) + (pipeline_i(N)/d);
        pipeline_phase(N+1) <= pipeline_phase(N) - integer(round(real(half_phase_range)*(arctan(1.0/real(d))/math_pi)));
      else
        pipeline_i(N+1) <= pipeline_i(N) + (pipeline_q(N)/d);
        pipeline_q(N+1) <= pipeline_q(N) - (pipeline_i(N)/d);
        pipeline_phase(N+1) <= pipeline_phase(N) + integer(round(real(half_phase_range)*(arctan(1.0/real(d))/math_pi)));
      end if;
      d := d*2;
      stb(N+1) <= stb(N);
    end loop;

  end process;

  magnitude <= std_logic_vector(pipeline_i(width));
  phase <= std_logic_vector(pipeline_phase(width));
  stb_out <= stb(width);


end rtl;
