

library ieee;
use ieee.numeric_bit.all;

use std.textio.all;

library work;
use work.extra_types.all;

entity test_bench is
end test_bench;

architecture behavioral of test_bench is

  component system

    port (
    env_reqs : in  bit_vector(1 downto 1);
    env_acks : out bit_vector(1 downto 1);

    -- read port
    env_load_req  : in bit;
    env_load_ack  : out  bit;
    env_load_addr : in MemoryBusType;
    env_load_data : out  MemoryBusType;

    -- write port
    env_store_req  : in bit;
    env_store_ack  : out  bit;
    env_store_addr : in MemoryBusType;
    env_store_data : in MemoryBusType;

    reset : in bit;
    clk   : in bit);

  end component;

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
      reset,
      clk);

  clk <= not clk after half_clock;

  tb                 : process
    variable err_msg : line;
    variable err_hdr : string(1 to 53) := "Validation Error : Data corrupted at address location";

    constant memory_init_size : integer := 1;
    type memory_init_address_type is array(0 to memory_init_size-1) of MemoryBusType;
    type memory_init_data_type is array(0 to memory_init_size-1) of MemoryBusType;

    constant memory_final_size : integer := 1;
    type memory_final_address_type is array(0 to memory_final_size-1) of MemoryBusType;
    type memory_final_data_type is array(0 to memory_final_size-1) of MemoryBusType;

    variable memory_init_address : memory_init_address_type := 
    (0 => bit_vector(to_unsigned(3, 32)));

    variable memory_init_data : memory_init_data_type := 
    (0 => ('0','0','1','1','1','1','1','1','1','0','0','1','1','0','1','0','1','1','1','0','0','0','0','1','0','1','0','0','1','0','0','0'));

    variable memory_final_address : memory_final_address_type := 
    (0 => bit_vector(to_unsigned(4, 32)));

    variable memory_final_data : memory_final_data_type;

    variable expected_data : memory_final_data_type := 
    (0 => ('0','0','1','1','1','1','1','1','1','0','0','0','1','1','0','0','1','1','0','0','1','1','0','0','1','1','0','0','1','1','0','1'));

  begin

    wait until clk = '0';
    wait until clk = '1';
    reset <= '1';
    wait until clk = '0';
    wait until clk = '1';
    reset <= '0';
    wait until clk = '0';
    wait until clk = '1';

    for i in 0 to memory_init_size-1 loop
      --mem_write;
      wait until clk = '0';
      wait until clk = '1';
      env_store_addr <= memory_init_address(i);
      env_store_data <= memory_init_data(i);
      env_store_req  <= '1';
      wait until env_store_ack = '1';
      env_store_req  <= '0';
      wait until env_store_ack = '0';
    end loop;

    wait until clk = '0';
    wait until clk = '1';
    env_reqs(1) <= '1';
    wait until env_acks(1) = '1';
    env_reqs(1) <= '0';
    wait until env_acks(1) = '0';

    for i in 0 to memory_final_size-1 loop
      --mem_read;
      wait until clk = '0';
      wait until clk = '1';
      env_load_addr <= memory_final_address(i);
      env_load_req  <= '1';
      wait until env_load_ack = '1';
      memory_final_data(i) := env_load_data;
      env_load_req  <= '0';
      wait until env_load_ack = '0';
    end loop;

    --Validate result;
    for i in 0 to memory_final_size-1 loop
      if(memory_final_data(i)/= expected_data(i)) then
        write(err_msg, err_hdr);
        writeline(output, err_msg);
      end if;
    end loop;

    wait;

  end process;

end behavioral;