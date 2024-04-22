

library ieee;
use ieee.numeric_bit.all;

use std.textio.all;

library work;
use work.extra_types.all;

entity test_bench is
end test_bench;

architecture default_arch of test_bench is

  signal env_reqs : bit_vector(1 downto 1);
  signal env_acks : bit_vector(1 downto 1);

  signal env_load_req  : bit := '0';
  signal env_store_req : bit := '0';

  signal env_load_ack  : bit;
  signal env_store_ack : bit;

  signal env_load_addr  : MemoryBusType;
  signal env_store_addr : MemoryBusType;

  signal env_store_data : MemoryBusType;
  signal env_load_data  : MemoryBusType;

  signal reset : bit;
  signal clk   : bit := '0';

  constant half_clock : time := 50 ns;


  component system
  port (
    env_reqs : in  bit_vector(1 downto 1);
    env_acks : out bit_vector(1 downto 1);

    env_load_req  : in bit;
    env_load_ack  : out  bit;
    env_load_addr : in MemoryBusType;
    env_load_data : out  MemoryBusType;

    env_store_req  : in bit;
    env_store_ack  : out  bit;
    env_store_addr : in MemoryBusType;
    env_store_data : in MemoryBusType;


    reset : in bit;
    clk   : in bit);
  end component;


begin

  UUT : system
    port map(
      env_reqs,
      env_acks,
      env_load_req,
      env_load_ack,
      env_load_addr,
      env_load_data,
      env_store_req,
      env_store_ack,
      env_store_addr,
      env_store_data,
--      env_args,
--      env_retval,
      reset,
      clk);

  clk <= not clk after half_clock;

  -- env_args <= system_args_const;
  -- env_retval <= system_retval_const;

  tb : process

  begin

    wait until clk = '0';
    wait until clk = '1';
    reset <= '1';
    wait until clk = '0';
    wait until clk = '1';
    reset <= '0';
    wait until clk = '0';
    wait until clk = '1';

    env_reqs(1) <= '1';
    wait until clk = '0';
    wait until clk = '1';
    env_reqs(1) <= '0';
    wait until env_acks(1) = '1';
    wait until env_acks(1) = '0';

    wait;

  end process;

end default_arch;
