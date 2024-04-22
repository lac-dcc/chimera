
library work;
use work.extra_types.all;
use work.memory_components.all;

entity system is
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
end system;

architecture structural of system is

  component sqroot_cp
    port (
      ip    : in bit_vector(27 downto 1);
      op    : out bit_vector(32 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal sqroot_cp_ip :  bit_vector(27 downto 1);
  signal sqroot_cp_op : bit_vector(32 downto 1);

  component start_cp
    port (
      ip    : in bit_vector(27 downto 1);
      op    : out bit_vector(32 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal start_cp_ip :  bit_vector(27 downto 1);
  signal start_cp_op : bit_vector(32 downto 1);

  component sqroot_dp
    port (
      ip : in  bit_vector(31 downto 1);
      op : out bit_vector(26 downto 1) := (others => '0');

      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in  MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in  bit);
  end component;

  signal sqroot_dp_ip : bit_vector(31 downto 1);
  signal sqroot_dp_op : bit_vector(26 downto 1);

  signal sqroot_dp_load_reqs : bit_vector(0 downto 0);
  signal sqroot_dp_load_acks : bit_vector(0 downto 0);
  signal sqroot_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal sqroot_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal sqroot_dp_store_reqs : bit_vector(0 downto 0);
  signal sqroot_dp_store_acks : bit_vector(0 downto 0);
  signal sqroot_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal sqroot_dp_store_data : MemoryBusVectorType(0 downto 0);

  component start_dp
    port (
      ip : in  bit_vector(31 downto 1);
      op : out bit_vector(26 downto 1) := (others => '0');

      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in  MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in  bit);
  end component;

  signal start_dp_ip : bit_vector(31 downto 1);
  signal start_dp_op : bit_vector(26 downto 1);

  signal start_dp_load_reqs : bit_vector(0 downto 0);
  signal start_dp_load_acks : bit_vector(0 downto 0);
  signal start_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal start_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal start_dp_store_reqs : bit_vector(0 downto 0);
  signal start_dp_store_acks : bit_vector(0 downto 0);
  signal start_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal start_dp_store_data : MemoryBusVectorType(0 downto 0);

  component sqroot_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      sqroot_cp_ip : in bit_vector(32 downto 1);
      sqroot_dp_ip : in bit_vector(26 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      sqroot_cp_op : out bit_vector(27 downto 1) := (others => '0');
      sqroot_dp_op : out bit_vector(31 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  signal omega_to_sqroot_ln : bit_vector(1 downto 1);
  signal sqroot_ln_to_omega : bit_vector(1 downto 1);

  component start_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      start_cp_ip : in bit_vector(32 downto 1);
      start_dp_ip : in bit_vector(26 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      start_cp_op : out bit_vector(27 downto 1) := (others => '0');
      start_dp_op : out bit_vector(31 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  signal omega_to_start_ln : bit_vector(1 downto 1);
  signal start_ln_to_omega : bit_vector(1 downto 1);

  component omega
    port(
      env_ip : in bit_vector(1 downto 1);
      env_op : out bit_vector(1 downto 1) := (others => '0');

      sqroot_ln_ip : in bit_vector(1 downto 1);
      sqroot_ln_op : out bit_vector(1 downto 1) := (others => '0');
      start_ln_ip : in bit_vector(1 downto 1);
      start_ln_op : out bit_vector(1 downto 1) := (others => '0');

      clk          : in  bit;
      reset        : in  bit);
  end component;

  signal amux_load_reqs  : bit_vector(2 downto 0);
  signal amux_load_acks  : bit_vector(2 downto 0);
  signal amux_load_data  : MemoryBusVectorType(3 - 1 downto 0);
  signal amux_load_addr  : MemoryBusVectorType(3 - 1 downto 0);
  signal amux_load_mreq  : bit;
  signal amux_load_mack  : bit;
  signal amux_load_mdata : MemoryBusType;
  signal amux_load_maddr : MemoryBusType;

  signal amux_store_reqs  : bit_vector(2 downto 0);
  signal amux_store_acks  : bit_vector(2 downto 0);
  signal amux_store_data  : MemoryBusVectorType(3 - 1 downto 0);
  signal amux_store_addr  : MemoryBusVectorType(3 - 1 downto 0);
  signal amux_store_mreq  : bit;
  signal amux_store_mack  : bit;
  signal amux_store_mdata : MemoryBusType;
  signal amux_store_maddr : MemoryBusType;

begin

  -- env load ports
  amux_load_reqs(0) <= env_load_req;
  env_load_ack <= amux_load_acks(0);
  env_load_data <= amux_load_data(0);
  amux_load_addr(0) <= env_load_addr;

  -- env store ports
  amux_store_reqs(0) <= env_store_req;
  env_store_ack <= amux_store_acks(0);
  amux_store_data(0) <= env_store_data;
  amux_store_addr(0) <= env_store_addr;

  -- sqroot_dp: 1 load ports, 1 store ports
  amux_load_reqs(1 downto 1)  <= sqroot_dp_load_reqs;
  sqroot_dp_load_acks <= amux_load_acks(1 downto 1);

  sqroot_dp_load_data <=  amux_load_data(1 downto 1);
  amux_load_addr(1 downto 1) <= sqroot_dp_load_addr;

  amux_store_reqs(1 downto 1)  <= sqroot_dp_store_reqs;
  sqroot_dp_store_acks <= amux_store_acks(1 downto 1);

  amux_store_data(1 downto 1) <= sqroot_dp_store_data;
  amux_store_addr(1 downto 1) <= sqroot_dp_store_addr;

  sqroot_dp_inst : sqroot_dp
    port map (
      ip         => sqroot_dp_ip,
      op         => sqroot_dp_op,
      load_reqs  => sqroot_dp_load_reqs,
      load_acks  => sqroot_dp_load_acks,
      load_addr  => sqroot_dp_load_addr,
      load_data  => sqroot_dp_load_data,
      store_reqs => sqroot_dp_store_reqs,
      store_acks => sqroot_dp_store_acks,
      store_addr => sqroot_dp_store_addr,
      store_data => sqroot_dp_store_data,
      reset      => reset,
      clk        => clk);


  -- start_dp: 1 load ports, 1 store ports
  amux_load_reqs(2 downto 2)  <= start_dp_load_reqs;
  start_dp_load_acks <= amux_load_acks(2 downto 2);

  start_dp_load_data <=  amux_load_data(2 downto 2);
  amux_load_addr(2 downto 2) <= start_dp_load_addr;

  amux_store_reqs(2 downto 2)  <= start_dp_store_reqs;
  start_dp_store_acks <= amux_store_acks(2 downto 2);

  amux_store_data(2 downto 2) <= start_dp_store_data;
  amux_store_addr(2 downto 2) <= start_dp_store_addr;

  start_dp_inst : start_dp
    port map (
      ip         => start_dp_ip,
      op         => start_dp_op,
      load_reqs  => start_dp_load_reqs,
      load_acks  => start_dp_load_acks,
      load_addr  => start_dp_load_addr,
      load_data  => start_dp_load_data,
      store_reqs => start_dp_store_reqs,
      store_acks => start_dp_store_acks,
      store_addr => start_dp_store_addr,
      store_data => start_dp_store_data,
      reset      => reset,
      clk        => clk);

  amux_load_inst : amux_load
    generic map (
      num_ports => 3)
--      data_size      => 32,
--      addr_size      => 32)
--      tagout_size    => 0,
--      tagin_size     => 0)
    port map (
      clk            => clk,
      reset          => reset,
      reqs           => amux_load_reqs,
      acks           => amux_load_acks,
      data           => amux_load_data,
      addr           => amux_load_addr,
--      tagin          => (others => '0'),
      mreq           => amux_load_mreq,
      mack           => amux_load_mack,
      mdata          => amux_load_mdata,
      maddr          => amux_load_maddr);
--      mtagout        => (others => '0'));

  amux_store_inst : amux_store
    generic map (
      num_ports => 3)
--      data_size       => 32,
--      addr_size       => 32)
--      tagout_size     => 0,
--      tagin_size      => 0)
    port map (
      clk             => clk,
      reset           => reset,
      reqs            => amux_store_reqs,
      acks            => amux_store_acks,
      data            => amux_store_data,
      addr            => amux_store_addr,
--      tagin           => (others => '0'),
      mreq            => amux_store_mreq,
      mack            => amux_store_mack,
      mdata           => amux_store_mdata,
      maddr           => amux_store_maddr);
--      mtagout         => (others => '0'));

  mem : memory
    generic map(
      size        => 5)
    port map (
      clk         => clk,
      reset       => reset,
      read_req    => amux_load_mreq,
      read_ack    => amux_load_mack,
      read_addr   => amux_load_maddr,
      read_data   => amux_load_mdata,
      write_req   => amux_store_mreq,
      write_ack   => amux_store_mack,
      write_addr  => amux_store_maddr,
      write_data  => amux_store_mdata);

  sqroot_cp_inst : sqroot_cp
    port map (
      ip    => sqroot_cp_ip,
      op    => sqroot_cp_op,
      reset => reset,
      clk   => clk);

  start_cp_inst : start_cp
    port map (
      ip    => start_cp_ip,
      op    => start_cp_op,
      reset => reset,
      clk   => clk);

  sqroot_ln_inst : sqroot_ln
    port map (
      omega_ip => omega_to_sqroot_ln,
      sqroot_cp_ip => sqroot_cp_op,
      sqroot_dp_ip => sqroot_dp_op,
      omega_op => sqroot_ln_to_omega,
      sqroot_cp_op => sqroot_cp_ip,
      sqroot_dp_op => sqroot_dp_ip,
      reset => reset,
      clk   => clk);

  start_ln_inst : start_ln
    port map (
      omega_ip => omega_to_start_ln,
      start_cp_ip => start_cp_op,
      start_dp_ip => start_dp_op,
      omega_op => start_ln_to_omega,
      start_cp_op => start_cp_ip,
      start_dp_op => start_dp_ip,
      reset => reset,
      clk   => clk);

  omega_inst : omega
    port map(
      sqroot_ln_ip => sqroot_ln_to_omega,
      sqroot_ln_op => omega_to_sqroot_ln,
      start_ln_ip => start_ln_to_omega,
      start_ln_op => omega_to_start_ln,
      env_ip => env_reqs,
      env_op => env_acks,
      reset => reset,
      clk   => clk);

end structural;
