library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.types.all;
use ahir.subprograms.all;

entity testbench is
  
end testbench;

architecture default_arch of testbench is

  component system
    port (
      clk             : in  std_logic;
      env_accept_data : in  std_logic_vector(0 downto 0);
      env_accept_in   : in  std_logic;
      env_accept_out  : out std_logic;
      env_lc_ack      : out std_logic;
      env_lc_data     : out std_logic_vector(31 downto 0);
      env_lc_req      : in  std_logic;
      env_lr_ack      : out std_logic;
      env_lr_addr     : in  std_logic_vector(31 downto 0);
      env_lr_req      : in  std_logic;
      env_return_data : out std_logic_vector(0 downto 0);
      env_return_in   : in  std_logic;
      env_return_out  : out std_logic;
      env_sr_ack      : out std_logic;
      env_sr_addr     : in  std_logic_vector(31 downto 0);
      env_sr_data     : in  std_logic_vector(31 downto 0);
      env_sr_req      : in  std_logic;
      reset           : in  std_logic);
  end component;

begin  -- default_arch

  clk <= not clk after 10 ns;

  process
  begin  -- process
    wait on clk until clk = '1';
    reset <= '0';
    wait;
  end process;

  process

    subtype AWord is std_logic_vector(maw - 1 downto 0);
    type InitAddrType is array (integer range <>) of AWord;

    subtype DWord is std_logic_vector (lau - 1 downto 0);
    type InitDataType is array (integer range <>) of DWord;

    variable init_addr : InitAddrType :=
      (('0', '0', '0', '0', '0', '0', '0', '1'),
       ('0', '0', '0', '0', '0', '0', '1', '0'),
       ('0', '0', '0', '0', '0', '0', '1', '1'),
       ('0', '0', '0', '0', '0', '1', '0', '0'),
       ('0', '0', '0', '0', '0', '1', '0', '1'),
       ('0', '0', '0', '0', '0', '1', '1', '0'),
       ('0', '0', '0', '0', '0', '1', '1', '1'),
       ('0', '0', '0', '0', '1', '0', '0', '0'));

    variable init_data : InitDataType :=
      (('0', '0', '0', '1', '1', '0', '1', '0'),
       ('0', '0', '0', '0', '0', '0', '0', '0'),
       ('0', '0', '0', '0', '0', '0', '0', '0'),
       ('0', '0', '0', '0', '0', '0', '0', '0'),
       ('0', '0', '0', '0', '1', '1', '1', '1'),
       ('0', '0', '0', '0', '0', '0', '0', '0'),
       ('0', '0', '0', '0', '0', '0', '0', '0'),
       ('0', '0', '0', '0', '0', '0', '0', '0'));

  begin  -- process

    wait until reset = '0';
    wait until clk = '1';

    env_sr_req <= '1';
    for i in 0 to init_addr'length(1) - 1 loop
      env_sr_addr <= init_addr(i);
      env_sr_data <= init_data(i);
      wait until env_sr_ack = '1';
      wait until clk = '1';
    end loop;  -- i
    env_sr_req <= '0';
    
    env_accept_in <= '1';
    wait until env_accept_out = '1';
    wait until clk = '1';
    env_accept_in <= '0';

    env_return_in <= '1';
    wait until env_return_out = '1';
    wait until clk = '1';
    env_return_in <= '0';
                     
    env_lr_req <= '1';
    for i in 0 to num_fin - 1 loop
      env_lr_addr <= to_stdlogicvector(to_unsigned(9, 32));
      wait until env_lr_ack = '1';
      wait until clk = '1';
    end loop;  -- i
    env_lr_req <= '0';
    
    env_lc_req <= '1';
    for i in 0 to num_fin - 1 loop
      wait until env_lc_ack = '1';
      wait until clk = '1';
    end loop;  -- i
    env_lc_req <= '0';

    assert false report "simulation done" severity note;
    wait;
  end process;

end default_arch;
