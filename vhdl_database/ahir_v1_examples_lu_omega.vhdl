
library work;
use work.arbiter_components.all;

entity omega is

  port (
    env_ip : in bit_vector(1 downto 1);
    env_op : out bit_vector(1 downto 1) := (others => '0');

    divide_ln_ip : in bit_vector(1 downto 1);
    divide_ln_op : out bit_vector(1 downto 1) := (others => '0');
    start_ln_ip : in bit_vector(2 downto 1);
    start_ln_op : out bit_vector(2 downto 1) := (others => '0');

    clk          : in  bit;
    reset        : in  bit);

end omega;

architecture structural of omega is

  signal arbiter_divide_ln_reqs : bit_vector(1 downto 1);
  signal arbiter_divide_ln_acks : bit_vector(1 downto 1);
  signal arbiter_start_ln_reqs : bit_vector(1 downto 1);
  signal arbiter_start_ln_acks : bit_vector(1 downto 1);

begin  -- structural

  omega_divide_ln : arbiter
    generic map (
      num_clients => 1)
    port map (
      clk            => clk,
      reset          => reset,
      reqs           => arbiter_divide_ln_reqs,
      acks           => arbiter_divide_ln_acks,
      mreq           => divide_ln_op(1),
      mack           => divide_ln_ip(1));

  arbiter_divide_ln_reqs(1) <= start_ln_ip(2);
  start_ln_op(2) <= arbiter_divide_ln_acks(1);

  omega_start_ln : arbiter
    generic map (
      num_clients => 1)
    port map (
      clk            => clk,
      reset          => reset,
      reqs           => arbiter_start_ln_reqs,
      acks           => arbiter_start_ln_acks,
      mreq           => start_ln_op(1),
      mack           => start_ln_ip(1));

  arbiter_start_ln_reqs(1) <= env_ip(1);
  env_op(1) <= arbiter_start_ln_acks(1);

end structural;