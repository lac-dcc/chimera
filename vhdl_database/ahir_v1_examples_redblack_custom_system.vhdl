
library work;
use work.extra_types.all;
use work.memory_components.all;
use work.arbiter_components.all;

entity system is
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
end system;

architecture default_arch of system is

  component custom_memory
    port (
      clk        : in  bit;
      reset      : in  bit;
      read_req   : in  bit;
      read_ack   : out bit;
      read_addr  : in  MemoryBusType;
      read_data  : out MemoryBusType;
      write_req  : in  bit;
      write_ack  : out bit;
      write_addr : in  MemoryBusType;
      write_data : in  MemoryBusType);
  end component;
  
  component rb_alloc_cp
    port (
      ip    : in bit_vector(14 downto 1);
      op    : out bit_vector(14 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_alloc_cp_ip :  bit_vector(14 downto 1);
  signal rb_alloc_cp_op : bit_vector(14 downto 1);

  component rb_delete_cp
    port (
      ip    : in bit_vector(118 downto 1);
      op    : out bit_vector(113 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_delete_cp_ip :  bit_vector(118 downto 1);
  signal rb_delete_cp_op : bit_vector(113 downto 1);

  component rb_delete_fix_cp
    port (
      ip    : in bit_vector(282 downto 1);
      op    : out bit_vector(279 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_delete_fix_cp_ip :  bit_vector(282 downto 1);
  signal rb_delete_fix_cp_op : bit_vector(279 downto 1);

  component rb_free_cp
    port (
      ip    : in bit_vector(8 downto 1);
      op    : out bit_vector(8 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_free_cp_ip :  bit_vector(8 downto 1);
  signal rb_free_cp_op : bit_vector(8 downto 1);

  component rb_left_rotate_cp
    port (
      ip    : in bit_vector(59 downto 1);
      op    : out bit_vector(56 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_left_rotate_cp_ip :  bit_vector(59 downto 1);
  signal rb_left_rotate_cp_op : bit_vector(56 downto 1);

  component rb_predecessor_cp
    port (
      ip    : in bit_vector(45 downto 1);
      op    : out bit_vector(46 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_predecessor_cp_ip :  bit_vector(45 downto 1);
  signal rb_predecessor_cp_op : bit_vector(46 downto 1);

  component rb_right_rotate_cp
    port (
      ip    : in bit_vector(59 downto 1);
      op    : out bit_vector(56 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_right_rotate_cp_ip :  bit_vector(59 downto 1);
  signal rb_right_rotate_cp_op : bit_vector(56 downto 1);

  component rb_successor_cp
    port (
      ip    : in bit_vector(45 downto 1);
      op    : out bit_vector(46 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_successor_cp_ip :  bit_vector(45 downto 1);
  signal rb_successor_cp_op : bit_vector(46 downto 1);

  component rb_traverse_cp
    port (
      ip    : in bit_vector(340 downto 1);
      op    : out bit_vector(341 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_traverse_cp_ip :  bit_vector(340 downto 1);
  signal rb_traverse_cp_op : bit_vector(341 downto 1);

  component rbdelete_cp
    port (
      ip    : in bit_vector(19 downto 1);
      op    : out bit_vector(19 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rbdelete_cp_ip :  bit_vector(19 downto 1);
  signal rbdelete_cp_op : bit_vector(19 downto 1);

  component rbfind_cp
    port (
      ip    : in bit_vector(23 downto 1);
      op    : out bit_vector(23 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rbfind_cp_ip :  bit_vector(23 downto 1);
  signal rbfind_cp_op : bit_vector(23 downto 1);

  component rbsearch_cp
    port (
      ip    : in bit_vector(14 downto 1);
      op    : out bit_vector(14 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal rbsearch_cp_ip :  bit_vector(14 downto 1);
  signal rbsearch_cp_op : bit_vector(14 downto 1);

  component start_cp
    port (
      ip    : in bit_vector(19 downto 1);
      op    : out bit_vector(19 downto 1) := (others => '0');
      reset : in bit;
      clk   : in bit);
  end component;

  signal start_cp_ip :  bit_vector(19 downto 1);
  signal start_cp_op : bit_vector(19 downto 1);

  component rb_alloc_dp
    port (
      ip : in bit_vector(13 downto 1);
      op : out bit_vector(13 downto 1) := (others => '0');

      retval : out bit_vector(31 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_alloc_dp_ip : bit_vector(13 downto 1);
  signal rb_alloc_dp_op : bit_vector(13 downto 1) := (others => '0');

  signal rb_alloc_dp_retval : bit_vector(31 downto 0);
  signal rb_alloc_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_alloc_dp_load_acks : bit_vector(0 downto 0);
  signal rb_alloc_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_alloc_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rb_alloc_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_alloc_dp_store_acks : bit_vector(0 downto 0);
  signal rb_alloc_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal rb_alloc_dp_store_data : MemoryBusVectorType(0 downto 0);

  component rb_delete_dp
    port (
      ip : in bit_vector(109 downto 1);
      op : out bit_vector(114 downto 1) := (others => '0');

      args : in bit_vector(63 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      call_rb_delete_fix_1_args : out bit_vector(63 downto 0);
      call_rb_free_2_args : out bit_vector(31 downto 0);
      call_rb_successor_0_args : out bit_vector(31 downto 0);
      call_rb_successor_0_retval : in bit_vector(31 downto 0);
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_delete_dp_ip : bit_vector(109 downto 1);
  signal rb_delete_dp_op : bit_vector(114 downto 1) := (others => '0');

  signal rb_delete_dp_args : bit_vector(63 downto 0);
  signal rb_delete_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_delete_dp_load_acks : bit_vector(0 downto 0);
  signal rb_delete_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_delete_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rb_delete_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_delete_dp_store_acks : bit_vector(0 downto 0);
  signal rb_delete_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal rb_delete_dp_store_data : MemoryBusVectorType(0 downto 0);

  signal rb_delete_call_rb_delete_fix_1_args : bit_vector(63 downto 0);
  signal rb_delete_call_rb_free_2_args : bit_vector(31 downto 0);
  signal rb_delete_call_rb_successor_0_args : bit_vector(31 downto 0);
  signal rb_delete_call_rb_successor_0_retval : bit_vector(31 downto 0);
  component rb_delete_fix_dp
    port (
      ip : in bit_vector(272 downto 1);
      op : out bit_vector(275 downto 1) := (others => '0');

      args : in bit_vector(63 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      call_rb_left_rotate_0_args : out bit_vector(63 downto 0);
      call_rb_left_rotate_3_args : out bit_vector(63 downto 0);
      call_rb_left_rotate_4_args : out bit_vector(63 downto 0);
      call_rb_right_rotate_1_args : out bit_vector(63 downto 0);
      call_rb_right_rotate_2_args : out bit_vector(63 downto 0);
      call_rb_right_rotate_5_args : out bit_vector(63 downto 0);
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_delete_fix_dp_ip : bit_vector(272 downto 1);
  signal rb_delete_fix_dp_op : bit_vector(275 downto 1) := (others => '0');

  signal rb_delete_fix_dp_args : bit_vector(63 downto 0);
  signal rb_delete_fix_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_delete_fix_dp_load_acks : bit_vector(0 downto 0);
  signal rb_delete_fix_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_delete_fix_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rb_delete_fix_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_delete_fix_dp_store_acks : bit_vector(0 downto 0);
  signal rb_delete_fix_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal rb_delete_fix_dp_store_data : MemoryBusVectorType(0 downto 0);

  signal rb_delete_fix_call_rb_left_rotate_0_args : bit_vector(63 downto 0);
  signal rb_delete_fix_call_rb_left_rotate_3_args : bit_vector(63 downto 0);
  signal rb_delete_fix_call_rb_left_rotate_4_args : bit_vector(63 downto 0);
  signal rb_delete_fix_call_rb_right_rotate_1_args : bit_vector(63 downto 0);
  signal rb_delete_fix_call_rb_right_rotate_2_args : bit_vector(63 downto 0);
  signal rb_delete_fix_call_rb_right_rotate_5_args : bit_vector(63 downto 0);
  component rb_free_dp
    port (
      ip : in bit_vector(7 downto 1);
      op : out bit_vector(7 downto 1) := (others => '0');

      args : in bit_vector(31 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_free_dp_ip : bit_vector(7 downto 1);
  signal rb_free_dp_op : bit_vector(7 downto 1) := (others => '0');

  signal rb_free_dp_args : bit_vector(31 downto 0);
  signal rb_free_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_free_dp_load_acks : bit_vector(0 downto 0);
  signal rb_free_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_free_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rb_free_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_free_dp_store_acks : bit_vector(0 downto 0);
  signal rb_free_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal rb_free_dp_store_data : MemoryBusVectorType(0 downto 0);

  component rb_left_rotate_dp
    port (
      ip : in bit_vector(55 downto 1);
      op : out bit_vector(58 downto 1) := (others => '0');

      args : in bit_vector(63 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_left_rotate_dp_ip : bit_vector(55 downto 1);
  signal rb_left_rotate_dp_op : bit_vector(58 downto 1) := (others => '0');

  signal rb_left_rotate_dp_args : bit_vector(63 downto 0);
  signal rb_left_rotate_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_left_rotate_dp_load_acks : bit_vector(0 downto 0);
  signal rb_left_rotate_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_left_rotate_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rb_left_rotate_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_left_rotate_dp_store_acks : bit_vector(0 downto 0);
  signal rb_left_rotate_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal rb_left_rotate_dp_store_data : MemoryBusVectorType(0 downto 0);

  component rb_predecessor_dp
    port (
      ip : in bit_vector(45 downto 1);
      op : out bit_vector(44 downto 1) := (others => '0');

      args : in bit_vector(31 downto 0);
      retval : out bit_vector(31 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_predecessor_dp_ip : bit_vector(45 downto 1);
  signal rb_predecessor_dp_op : bit_vector(44 downto 1) := (others => '0');

  signal rb_predecessor_dp_args : bit_vector(31 downto 0);
  signal rb_predecessor_dp_retval : bit_vector(31 downto 0);
  signal rb_predecessor_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_predecessor_dp_load_acks : bit_vector(0 downto 0);
  signal rb_predecessor_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_predecessor_dp_load_data : MemoryBusVectorType(0 downto 0);

  component rb_right_rotate_dp
    port (
      ip : in bit_vector(55 downto 1);
      op : out bit_vector(58 downto 1) := (others => '0');

      args : in bit_vector(63 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_right_rotate_dp_ip : bit_vector(55 downto 1);
  signal rb_right_rotate_dp_op : bit_vector(58 downto 1) := (others => '0');

  signal rb_right_rotate_dp_args : bit_vector(63 downto 0);
  signal rb_right_rotate_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_right_rotate_dp_load_acks : bit_vector(0 downto 0);
  signal rb_right_rotate_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_right_rotate_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rb_right_rotate_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_right_rotate_dp_store_acks : bit_vector(0 downto 0);
  signal rb_right_rotate_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal rb_right_rotate_dp_store_data : MemoryBusVectorType(0 downto 0);

  component rb_successor_dp
    port (
      ip : in bit_vector(45 downto 1);
      op : out bit_vector(44 downto 1) := (others => '0');

      args : in bit_vector(31 downto 0);
      retval : out bit_vector(31 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_successor_dp_ip : bit_vector(45 downto 1);
  signal rb_successor_dp_op : bit_vector(44 downto 1) := (others => '0');

  signal rb_successor_dp_args : bit_vector(31 downto 0);
  signal rb_successor_dp_retval : bit_vector(31 downto 0);
  signal rb_successor_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_successor_dp_load_acks : bit_vector(0 downto 0);
  signal rb_successor_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_successor_dp_load_data : MemoryBusVectorType(0 downto 0);

  component rb_traverse_dp
    port (
      ip : in bit_vector(335 downto 1);
      op : out bit_vector(334 downto 1) := (others => '0');

      args : in bit_vector(95 downto 0);
      retval : out bit_vector(31 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      call_rb_alloc_0_retval : in bit_vector(31 downto 0);
      call_rb_left_rotate_1_args : out bit_vector(63 downto 0);
      call_rb_left_rotate_4_args : out bit_vector(63 downto 0);
      call_rb_right_rotate_2_args : out bit_vector(63 downto 0);
      call_rb_right_rotate_3_args : out bit_vector(63 downto 0);
      reset : in bit;
      clk   : in bit);
  end component;

  signal rb_traverse_dp_ip : bit_vector(335 downto 1);
  signal rb_traverse_dp_op : bit_vector(334 downto 1) := (others => '0');

  signal rb_traverse_dp_args : bit_vector(95 downto 0);
  signal rb_traverse_dp_retval : bit_vector(31 downto 0);
  signal rb_traverse_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_traverse_dp_load_acks : bit_vector(0 downto 0);
  signal rb_traverse_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rb_traverse_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rb_traverse_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rb_traverse_dp_store_acks : bit_vector(0 downto 0);
  signal rb_traverse_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal rb_traverse_dp_store_data : MemoryBusVectorType(0 downto 0);

  signal rb_traverse_call_rb_alloc_0_retval : bit_vector(31 downto 0);
  signal rb_traverse_call_rb_left_rotate_1_args : bit_vector(63 downto 0);
  signal rb_traverse_call_rb_left_rotate_4_args : bit_vector(63 downto 0);
  signal rb_traverse_call_rb_right_rotate_2_args : bit_vector(63 downto 0);
  signal rb_traverse_call_rb_right_rotate_3_args : bit_vector(63 downto 0);
  component rbdelete_dp
    port (
      ip : in bit_vector(16 downto 1);
      op : out bit_vector(16 downto 1) := (others => '0');

      args : in bit_vector(63 downto 0);
      retval : out bit_vector(31 downto 0);
      call_rb_delete_1_args : out bit_vector(63 downto 0);
      call_rb_traverse_0_args : out bit_vector(95 downto 0);
      call_rb_traverse_0_retval : in bit_vector(31 downto 0);
      reset : in bit;
      clk   : in bit);
  end component;

  signal rbdelete_dp_ip : bit_vector(16 downto 1);
  signal rbdelete_dp_op : bit_vector(16 downto 1) := (others => '0');

  signal rbdelete_dp_args : bit_vector(63 downto 0);
  signal rbdelete_dp_retval : bit_vector(31 downto 0);
  signal rbdelete_call_rb_delete_1_args : bit_vector(63 downto 0);
  signal rbdelete_call_rb_traverse_0_args : bit_vector(95 downto 0);
  signal rbdelete_call_rb_traverse_0_retval : bit_vector(31 downto 0);
  component rbfind_dp
    port (
      ip : in bit_vector(21 downto 1);
      op : out bit_vector(21 downto 1) := (others => '0');

      args : in bit_vector(63 downto 0);
      retval : out bit_vector(31 downto 0);
      load_reqs : out bit_vector(0 downto 0) := (others => '0');
      load_acks : in bit_vector(0 downto 0);
      load_addr : out MemoryBusVectorType(0 downto 0);
      load_data : in MemoryBusVectorType(0 downto 0);

      call_rb_traverse_0_args : out bit_vector(95 downto 0);
      call_rb_traverse_0_retval : in bit_vector(31 downto 0);
      reset : in bit;
      clk   : in bit);
  end component;

  signal rbfind_dp_ip : bit_vector(21 downto 1);
  signal rbfind_dp_op : bit_vector(21 downto 1) := (others => '0');

  signal rbfind_dp_args : bit_vector(63 downto 0);
  signal rbfind_dp_retval : bit_vector(31 downto 0);
  signal rbfind_dp_load_reqs : bit_vector(0 downto 0) := (others => '0');
  signal rbfind_dp_load_acks : bit_vector(0 downto 0);
  signal rbfind_dp_load_addr : MemoryBusVectorType(0 downto 0);
  signal rbfind_dp_load_data : MemoryBusVectorType(0 downto 0);

  signal rbfind_call_rb_traverse_0_args : bit_vector(95 downto 0);
  signal rbfind_call_rb_traverse_0_retval : bit_vector(31 downto 0);
  component rbsearch_dp
    port (
      ip : in bit_vector(12 downto 1);
      op : out bit_vector(12 downto 1) := (others => '0');

      args : in bit_vector(63 downto 0);
      retval : out bit_vector(31 downto 0);
      call_rb_traverse_0_args : out bit_vector(95 downto 0);
      call_rb_traverse_0_retval : in bit_vector(31 downto 0);
      reset : in bit;
      clk   : in bit);
  end component;

  signal rbsearch_dp_ip : bit_vector(12 downto 1);
  signal rbsearch_dp_op : bit_vector(12 downto 1) := (others => '0');

  signal rbsearch_dp_args : bit_vector(63 downto 0);
  signal rbsearch_dp_retval : bit_vector(31 downto 0);
  signal rbsearch_call_rb_traverse_0_args : bit_vector(95 downto 0);
  signal rbsearch_call_rb_traverse_0_retval : bit_vector(31 downto 0);
  component start_dp
    port (
      ip : in bit_vector(17 downto 1);
      op : out bit_vector(17 downto 1) := (others => '0');

      store_reqs : out bit_vector(0 downto 0) := (others => '0');
      store_acks : in bit_vector(0 downto 0);
      store_addr : out MemoryBusVectorType(0 downto 0);
      store_data : out MemoryBusVectorType(0 downto 0);

      call_rbsearch_0_args : out bit_vector(63 downto 0);
      call_rbsearch_0_retval : in bit_vector(31 downto 0);
      reset : in bit;
      clk   : in bit);
  end component;

  signal start_dp_ip : bit_vector(17 downto 1);
  signal start_dp_op : bit_vector(17 downto 1) := (others => '0');

  signal start_dp_store_reqs : bit_vector(0 downto 0) := (others => '0');
  signal start_dp_store_acks : bit_vector(0 downto 0);
  signal start_dp_store_addr : MemoryBusVectorType(0 downto 0);
  signal start_dp_store_data : MemoryBusVectorType(0 downto 0);

  signal start_call_rbsearch_0_args : bit_vector(63 downto 0);
  signal start_call_rbsearch_0_retval : bit_vector(31 downto 0);
  component rb_alloc_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      rb_alloc_cp_ip : in bit_vector(14 downto 1);
      rb_alloc_dp_ip : in bit_vector(13 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      rb_alloc_cp_op : out bit_vector(14 downto 1) := (others => '0');
      rb_alloc_dp_op : out bit_vector(13 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_delete_fix_ln
    port(
      omega_ip : in bit_vector(7 downto 1);
      rb_delete_fix_cp_ip : in bit_vector(279 downto 1);
      rb_delete_fix_dp_ip : in bit_vector(275 downto 1);
      omega_op : out bit_vector(7 downto 1) := (others => '0');
      rb_delete_fix_cp_op : out bit_vector(282 downto 1) := (others => '0');
      rb_delete_fix_dp_op : out bit_vector(272 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_delete_ln
    port(
      omega_ip : in bit_vector(4 downto 1);
      rb_delete_cp_ip : in bit_vector(113 downto 1);
      rb_delete_dp_ip : in bit_vector(114 downto 1);
      omega_op : out bit_vector(4 downto 1) := (others => '0');
      rb_delete_cp_op : out bit_vector(118 downto 1) := (others => '0');
      rb_delete_dp_op : out bit_vector(109 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_free_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      rb_free_cp_ip : in bit_vector(8 downto 1);
      rb_free_dp_ip : in bit_vector(7 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      rb_free_cp_op : out bit_vector(8 downto 1) := (others => '0');
      rb_free_dp_op : out bit_vector(7 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_left_rotate_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      rb_left_rotate_cp_ip : in bit_vector(56 downto 1);
      rb_left_rotate_dp_ip : in bit_vector(58 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      rb_left_rotate_cp_op : out bit_vector(59 downto 1) := (others => '0');
      rb_left_rotate_dp_op : out bit_vector(55 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_predecessor_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      rb_predecessor_cp_ip : in bit_vector(46 downto 1);
      rb_predecessor_dp_ip : in bit_vector(44 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      rb_predecessor_cp_op : out bit_vector(45 downto 1) := (others => '0');
      rb_predecessor_dp_op : out bit_vector(45 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_right_rotate_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      rb_right_rotate_cp_ip : in bit_vector(56 downto 1);
      rb_right_rotate_dp_ip : in bit_vector(58 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      rb_right_rotate_cp_op : out bit_vector(59 downto 1) := (others => '0');
      rb_right_rotate_dp_op : out bit_vector(55 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_successor_ln
    port(
      omega_ip : in bit_vector(1 downto 1);
      rb_successor_cp_ip : in bit_vector(46 downto 1);
      rb_successor_dp_ip : in bit_vector(44 downto 1);
      omega_op : out bit_vector(1 downto 1) := (others => '0');
      rb_successor_cp_op : out bit_vector(45 downto 1) := (others => '0');
      rb_successor_dp_op : out bit_vector(45 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rb_traverse_ln
    port(
      omega_ip : in bit_vector(6 downto 1);
      rb_traverse_cp_ip : in bit_vector(341 downto 1);
      rb_traverse_dp_ip : in bit_vector(334 downto 1);
      omega_op : out bit_vector(6 downto 1) := (others => '0');
      rb_traverse_cp_op : out bit_vector(340 downto 1) := (others => '0');
      rb_traverse_dp_op : out bit_vector(335 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rbdelete_ln
    port(
      omega_ip : in bit_vector(3 downto 1);
      rbdelete_cp_ip : in bit_vector(19 downto 1);
      rbdelete_dp_ip : in bit_vector(16 downto 1);
      omega_op : out bit_vector(3 downto 1) := (others => '0');
      rbdelete_cp_op : out bit_vector(19 downto 1) := (others => '0');
      rbdelete_dp_op : out bit_vector(16 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rbfind_ln
    port(
      omega_ip : in bit_vector(2 downto 1);
      rbfind_cp_ip : in bit_vector(23 downto 1);
      rbfind_dp_ip : in bit_vector(21 downto 1);
      omega_op : out bit_vector(2 downto 1) := (others => '0');
      rbfind_cp_op : out bit_vector(23 downto 1) := (others => '0');
      rbfind_dp_op : out bit_vector(21 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component rbsearch_ln
    port(
      omega_ip : in bit_vector(2 downto 1);
      rbsearch_cp_ip : in bit_vector(14 downto 1);
      rbsearch_dp_ip : in bit_vector(12 downto 1);
      omega_op : out bit_vector(2 downto 1) := (others => '0');
      rbsearch_cp_op : out bit_vector(14 downto 1) := (others => '0');
      rbsearch_dp_op : out bit_vector(12 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  component start_ln
    port(
      omega_ip : in bit_vector(2 downto 1);
      start_cp_ip : in bit_vector(19 downto 1);
      start_dp_ip : in bit_vector(17 downto 1);
      omega_op : out bit_vector(2 downto 1) := (others => '0');
      start_cp_op : out bit_vector(19 downto 1) := (others => '0');
      start_dp_op : out bit_vector(17 downto 1) := (others => '0');

      reset : in bit;
      clk   : in bit);
  end component;

  signal amux_load_reqs  : bit_vector(10 downto 0);
  signal amux_load_acks  : bit_vector(10 downto 0);
  signal amux_load_data  : MemoryBusVectorType(11 - 1 downto 0);
  signal amux_load_addr  : MemoryBusVectorType(11 - 1 downto 0);
  signal amux_load_mreq  : bit;
  signal amux_load_mack  : bit;
  signal amux_load_mdata : MemoryBusType;
  signal amux_load_maddr : MemoryBusType;

  signal amux_store_reqs  : bit_vector(8 downto 0);
  signal amux_store_acks  : bit_vector(8 downto 0);
  signal amux_store_data  : MemoryBusVectorType(9 - 1 downto 0);
  signal amux_store_addr  : MemoryBusVectorType(9 - 1 downto 0);
  signal amux_store_mreq  : bit;
  signal amux_store_mack  : bit;
  signal amux_store_mdata : MemoryBusType;
  signal amux_store_maddr : MemoryBusType;

  signal omega_rb_alloc_reqs : bit_vector(1 downto 1);
  signal omega_rb_alloc_acks : bit_vector(1 downto 1);
  signal omega_rb_alloc_args : bit_vector(0 downto 0);
  signal omega_rb_alloc_retval : bit_vector(32 downto 0);
  signal omega_rb_alloc_margs : bit_vector(0 downto 0);
  signal omega_rb_alloc_mretval : bit_vector(32 downto 0);

  signal omega_rb_delete_reqs : bit_vector(1 downto 1);
  signal omega_rb_delete_acks : bit_vector(1 downto 1);
  signal omega_rb_delete_args : bit_vector(64 downto 0);
  signal omega_rb_delete_retval : bit_vector(0 downto 0);
  signal omega_rb_delete_margs : bit_vector(64 downto 0);
  signal omega_rb_delete_mretval : bit_vector(0 downto 0);

  signal omega_rb_delete_fix_reqs : bit_vector(1 downto 1);
  signal omega_rb_delete_fix_acks : bit_vector(1 downto 1);
  signal omega_rb_delete_fix_args : bit_vector(64 downto 0);
  signal omega_rb_delete_fix_retval : bit_vector(0 downto 0);
  signal omega_rb_delete_fix_margs : bit_vector(64 downto 0);
  signal omega_rb_delete_fix_mretval : bit_vector(0 downto 0);

  signal omega_rb_free_reqs : bit_vector(1 downto 1);
  signal omega_rb_free_acks : bit_vector(1 downto 1);
  signal omega_rb_free_args : bit_vector(32 downto 0);
  signal omega_rb_free_retval : bit_vector(0 downto 0);
  signal omega_rb_free_margs : bit_vector(32 downto 0);
  signal omega_rb_free_mretval : bit_vector(0 downto 0);

  signal omega_rb_left_rotate_reqs : bit_vector(5 downto 1);
  signal omega_rb_left_rotate_acks : bit_vector(5 downto 1);
  signal omega_rb_left_rotate_args : bit_vector(320 downto 0);
  signal omega_rb_left_rotate_retval : bit_vector(0 downto 0);
  signal omega_rb_left_rotate_margs : bit_vector(64 downto 0);
  signal omega_rb_left_rotate_mretval : bit_vector(0 downto 0);

  signal omega_rb_right_rotate_reqs : bit_vector(5 downto 1);
  signal omega_rb_right_rotate_acks : bit_vector(5 downto 1);
  signal omega_rb_right_rotate_args : bit_vector(320 downto 0);
  signal omega_rb_right_rotate_retval : bit_vector(0 downto 0);
  signal omega_rb_right_rotate_margs : bit_vector(64 downto 0);
  signal omega_rb_right_rotate_mretval : bit_vector(0 downto 0);

  signal omega_rb_successor_reqs : bit_vector(1 downto 1);
  signal omega_rb_successor_acks : bit_vector(1 downto 1);
  signal omega_rb_successor_args : bit_vector(32 downto 0);
  signal omega_rb_successor_retval : bit_vector(32 downto 0);
  signal omega_rb_successor_margs : bit_vector(32 downto 0);
  signal omega_rb_successor_mretval : bit_vector(32 downto 0);

  signal omega_rb_traverse_reqs : bit_vector(3 downto 1);
  signal omega_rb_traverse_acks : bit_vector(3 downto 1);
  signal omega_rb_traverse_args : bit_vector(288 downto 0);
  signal omega_rb_traverse_retval : bit_vector(96 downto 0);
  signal omega_rb_traverse_margs : bit_vector(96 downto 0);
  signal omega_rb_traverse_mretval : bit_vector(32 downto 0);

  signal omega_rbsearch_reqs : bit_vector(1 downto 1);
  signal omega_rbsearch_acks : bit_vector(1 downto 1);
  signal omega_rbsearch_args : bit_vector(64 downto 0);
  signal omega_rbsearch_retval : bit_vector(32 downto 0);
  signal omega_rbsearch_margs : bit_vector(64 downto 0);
  signal omega_rbsearch_mretval : bit_vector(32 downto 0);

  signal omega_start_reqs : bit_vector(1 downto 1);
  signal omega_start_acks : bit_vector(1 downto 1);
  signal omega_start_args : bit_vector(0 downto 0);
  signal omega_start_retval : bit_vector(0 downto 0);
  signal omega_start_margs : bit_vector(0 downto 0);
  signal omega_start_mretval : bit_vector(0 downto 0);

  signal omega_to_rb_alloc_ln : bit_vector(1 downto 1);
  signal rb_alloc_ln_to_omega : bit_vector(1 downto 1);

  signal omega_to_rb_delete_ln : bit_vector(4 downto 1);
  signal rb_delete_ln_to_omega : bit_vector(4 downto 1);

  signal omega_to_rb_delete_fix_ln : bit_vector(7 downto 1);
  signal rb_delete_fix_ln_to_omega : bit_vector(7 downto 1);

  signal omega_to_rb_free_ln : bit_vector(1 downto 1);
  signal rb_free_ln_to_omega : bit_vector(1 downto 1);

  signal omega_to_rb_left_rotate_ln : bit_vector(1 downto 1);
  signal rb_left_rotate_ln_to_omega : bit_vector(1 downto 1);

  signal omega_to_rb_predecessor_ln : bit_vector(1 downto 1);
  signal rb_predecessor_ln_to_omega : bit_vector(1 downto 1);

  signal omega_to_rb_right_rotate_ln : bit_vector(1 downto 1);
  signal rb_right_rotate_ln_to_omega : bit_vector(1 downto 1);

  signal omega_to_rb_successor_ln : bit_vector(1 downto 1);
  signal rb_successor_ln_to_omega : bit_vector(1 downto 1);

  signal omega_to_rb_traverse_ln : bit_vector(6 downto 1);
  signal rb_traverse_ln_to_omega : bit_vector(6 downto 1);

  signal omega_to_rbdelete_ln : bit_vector(3 downto 1);
  signal rbdelete_ln_to_omega : bit_vector(3 downto 1);

  signal omega_to_rbfind_ln : bit_vector(2 downto 1);
  signal rbfind_ln_to_omega : bit_vector(2 downto 1);

  signal omega_to_rbsearch_ln : bit_vector(2 downto 1);
  signal rbsearch_ln_to_omega : bit_vector(2 downto 1);

  signal omega_to_start_ln : bit_vector(2 downto 1);
  signal start_ln_to_omega : bit_vector(2 downto 1);

  signal omega_to_env_ln : bit_vector(1 downto 1);
  signal env_ln_to_omega : bit_vector(1 downto 1);


begin

  env_ln_to_omega <= env_reqs;
  env_acks <= omega_to_env_ln;


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
  amux_load_inst : amux_load
    generic map (
      num_ports => 11)
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
      num_ports => 9)
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

  mem : custom_memory
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


  -- rb_alloc_dp: 1 load ports, 1 store ports
  amux_load_reqs(1 downto 1)  <= rb_alloc_dp_load_reqs;
  rb_alloc_dp_load_acks <= amux_load_acks(1 downto 1);

  rb_alloc_dp_load_data <=  amux_load_data(1 downto 1);
  amux_load_addr(1 downto 1) <= rb_alloc_dp_load_addr;

  amux_store_reqs(1 downto 1)  <= rb_alloc_dp_store_reqs;
  rb_alloc_dp_store_acks <= amux_store_acks(1 downto 1);

  amux_store_data(1 downto 1) <= rb_alloc_dp_store_data;
  amux_store_addr(1 downto 1) <= rb_alloc_dp_store_addr;

  rb_alloc_dp_inst : rb_alloc_dp
    port map (
      ip         => rb_alloc_dp_ip,
      op         => rb_alloc_dp_op,
      retval     => rb_alloc_dp_retval,
      load_reqs  => rb_alloc_dp_load_reqs,
      load_acks  => rb_alloc_dp_load_acks,
      load_addr  => rb_alloc_dp_load_addr,
      load_data  => rb_alloc_dp_load_data,
      store_reqs => rb_alloc_dp_store_reqs,
      store_acks => rb_alloc_dp_store_acks,
      store_addr => rb_alloc_dp_store_addr,
      store_data => rb_alloc_dp_store_data,
      reset      => reset,
      clk        => clk);


  -- rb_delete_dp: 1 load ports, 1 store ports
  amux_load_reqs(2 downto 2)  <= rb_delete_dp_load_reqs;
  rb_delete_dp_load_acks <= amux_load_acks(2 downto 2);

  rb_delete_dp_load_data <=  amux_load_data(2 downto 2);
  amux_load_addr(2 downto 2) <= rb_delete_dp_load_addr;

  amux_store_reqs(2 downto 2)  <= rb_delete_dp_store_reqs;
  rb_delete_dp_store_acks <= amux_store_acks(2 downto 2);

  amux_store_data(2 downto 2) <= rb_delete_dp_store_data;
  amux_store_addr(2 downto 2) <= rb_delete_dp_store_addr;

  rb_delete_dp_inst : rb_delete_dp
    port map (
      ip         => rb_delete_dp_ip,
      op         => rb_delete_dp_op,
      args       => rb_delete_dp_args,
      load_reqs  => rb_delete_dp_load_reqs,
      load_acks  => rb_delete_dp_load_acks,
      load_addr  => rb_delete_dp_load_addr,
      load_data  => rb_delete_dp_load_data,
      store_reqs => rb_delete_dp_store_reqs,
      store_acks => rb_delete_dp_store_acks,
      store_addr => rb_delete_dp_store_addr,
      store_data => rb_delete_dp_store_data,
      call_rb_delete_fix_1_args => rb_delete_call_rb_delete_fix_1_args,
      call_rb_free_2_args => rb_delete_call_rb_free_2_args,
      call_rb_successor_0_args => rb_delete_call_rb_successor_0_args,
      call_rb_successor_0_retval => rb_delete_call_rb_successor_0_retval,
      reset      => reset,
      clk        => clk);


  -- rb_delete_fix_dp: 1 load ports, 1 store ports
  amux_load_reqs(3 downto 3)  <= rb_delete_fix_dp_load_reqs;
  rb_delete_fix_dp_load_acks <= amux_load_acks(3 downto 3);

  rb_delete_fix_dp_load_data <=  amux_load_data(3 downto 3);
  amux_load_addr(3 downto 3) <= rb_delete_fix_dp_load_addr;

  amux_store_reqs(3 downto 3)  <= rb_delete_fix_dp_store_reqs;
  rb_delete_fix_dp_store_acks <= amux_store_acks(3 downto 3);

  amux_store_data(3 downto 3) <= rb_delete_fix_dp_store_data;
  amux_store_addr(3 downto 3) <= rb_delete_fix_dp_store_addr;

  rb_delete_fix_dp_inst : rb_delete_fix_dp
    port map (
      ip         => rb_delete_fix_dp_ip,
      op         => rb_delete_fix_dp_op,
      args       => rb_delete_fix_dp_args,
      load_reqs  => rb_delete_fix_dp_load_reqs,
      load_acks  => rb_delete_fix_dp_load_acks,
      load_addr  => rb_delete_fix_dp_load_addr,
      load_data  => rb_delete_fix_dp_load_data,
      store_reqs => rb_delete_fix_dp_store_reqs,
      store_acks => rb_delete_fix_dp_store_acks,
      store_addr => rb_delete_fix_dp_store_addr,
      store_data => rb_delete_fix_dp_store_data,
      call_rb_left_rotate_0_args => rb_delete_fix_call_rb_left_rotate_0_args,
      call_rb_left_rotate_3_args => rb_delete_fix_call_rb_left_rotate_3_args,
      call_rb_left_rotate_4_args => rb_delete_fix_call_rb_left_rotate_4_args,
      call_rb_right_rotate_1_args => rb_delete_fix_call_rb_right_rotate_1_args,
      call_rb_right_rotate_2_args => rb_delete_fix_call_rb_right_rotate_2_args,
      call_rb_right_rotate_5_args => rb_delete_fix_call_rb_right_rotate_5_args,
      reset      => reset,
      clk        => clk);


  -- rb_free_dp: 1 load ports, 1 store ports
  amux_load_reqs(4 downto 4)  <= rb_free_dp_load_reqs;
  rb_free_dp_load_acks <= amux_load_acks(4 downto 4);

  rb_free_dp_load_data <=  amux_load_data(4 downto 4);
  amux_load_addr(4 downto 4) <= rb_free_dp_load_addr;

  amux_store_reqs(4 downto 4)  <= rb_free_dp_store_reqs;
  rb_free_dp_store_acks <= amux_store_acks(4 downto 4);

  amux_store_data(4 downto 4) <= rb_free_dp_store_data;
  amux_store_addr(4 downto 4) <= rb_free_dp_store_addr;

  rb_free_dp_inst : rb_free_dp
    port map (
      ip         => rb_free_dp_ip,
      op         => rb_free_dp_op,
      args       => rb_free_dp_args,
      load_reqs  => rb_free_dp_load_reqs,
      load_acks  => rb_free_dp_load_acks,
      load_addr  => rb_free_dp_load_addr,
      load_data  => rb_free_dp_load_data,
      store_reqs => rb_free_dp_store_reqs,
      store_acks => rb_free_dp_store_acks,
      store_addr => rb_free_dp_store_addr,
      store_data => rb_free_dp_store_data,
      reset      => reset,
      clk        => clk);


  -- rb_left_rotate_dp: 1 load ports, 1 store ports
  amux_load_reqs(5 downto 5)  <= rb_left_rotate_dp_load_reqs;
  rb_left_rotate_dp_load_acks <= amux_load_acks(5 downto 5);

  rb_left_rotate_dp_load_data <=  amux_load_data(5 downto 5);
  amux_load_addr(5 downto 5) <= rb_left_rotate_dp_load_addr;

  amux_store_reqs(5 downto 5)  <= rb_left_rotate_dp_store_reqs;
  rb_left_rotate_dp_store_acks <= amux_store_acks(5 downto 5);

  amux_store_data(5 downto 5) <= rb_left_rotate_dp_store_data;
  amux_store_addr(5 downto 5) <= rb_left_rotate_dp_store_addr;

  rb_left_rotate_dp_inst : rb_left_rotate_dp
    port map (
      ip         => rb_left_rotate_dp_ip,
      op         => rb_left_rotate_dp_op,
      args       => rb_left_rotate_dp_args,
      load_reqs  => rb_left_rotate_dp_load_reqs,
      load_acks  => rb_left_rotate_dp_load_acks,
      load_addr  => rb_left_rotate_dp_load_addr,
      load_data  => rb_left_rotate_dp_load_data,
      store_reqs => rb_left_rotate_dp_store_reqs,
      store_acks => rb_left_rotate_dp_store_acks,
      store_addr => rb_left_rotate_dp_store_addr,
      store_data => rb_left_rotate_dp_store_data,
      reset      => reset,
      clk        => clk);


  -- rb_predecessor_dp: 1 load ports, 0 store ports
  amux_load_reqs(6 downto 6)  <= rb_predecessor_dp_load_reqs;
  rb_predecessor_dp_load_acks <= amux_load_acks(6 downto 6);

  rb_predecessor_dp_load_data <=  amux_load_data(6 downto 6);
  amux_load_addr(6 downto 6) <= rb_predecessor_dp_load_addr;

  rb_predecessor_dp_inst : rb_predecessor_dp
    port map (
      ip         => rb_predecessor_dp_ip,
      op         => rb_predecessor_dp_op,
      args       => rb_predecessor_dp_args,
      retval     => rb_predecessor_dp_retval,
      load_reqs  => rb_predecessor_dp_load_reqs,
      load_acks  => rb_predecessor_dp_load_acks,
      load_addr  => rb_predecessor_dp_load_addr,
      load_data  => rb_predecessor_dp_load_data,
      reset      => reset,
      clk        => clk);


  -- rb_right_rotate_dp: 1 load ports, 1 store ports
  amux_load_reqs(7 downto 7)  <= rb_right_rotate_dp_load_reqs;
  rb_right_rotate_dp_load_acks <= amux_load_acks(7 downto 7);

  rb_right_rotate_dp_load_data <=  amux_load_data(7 downto 7);
  amux_load_addr(7 downto 7) <= rb_right_rotate_dp_load_addr;

  amux_store_reqs(6 downto 6)  <= rb_right_rotate_dp_store_reqs;
  rb_right_rotate_dp_store_acks <= amux_store_acks(6 downto 6);

  amux_store_data(6 downto 6) <= rb_right_rotate_dp_store_data;
  amux_store_addr(6 downto 6) <= rb_right_rotate_dp_store_addr;

  rb_right_rotate_dp_inst : rb_right_rotate_dp
    port map (
      ip         => rb_right_rotate_dp_ip,
      op         => rb_right_rotate_dp_op,
      args       => rb_right_rotate_dp_args,
      load_reqs  => rb_right_rotate_dp_load_reqs,
      load_acks  => rb_right_rotate_dp_load_acks,
      load_addr  => rb_right_rotate_dp_load_addr,
      load_data  => rb_right_rotate_dp_load_data,
      store_reqs => rb_right_rotate_dp_store_reqs,
      store_acks => rb_right_rotate_dp_store_acks,
      store_addr => rb_right_rotate_dp_store_addr,
      store_data => rb_right_rotate_dp_store_data,
      reset      => reset,
      clk        => clk);


  -- rb_successor_dp: 1 load ports, 0 store ports
  amux_load_reqs(8 downto 8)  <= rb_successor_dp_load_reqs;
  rb_successor_dp_load_acks <= amux_load_acks(8 downto 8);

  rb_successor_dp_load_data <=  amux_load_data(8 downto 8);
  amux_load_addr(8 downto 8) <= rb_successor_dp_load_addr;

  rb_successor_dp_inst : rb_successor_dp
    port map (
      ip         => rb_successor_dp_ip,
      op         => rb_successor_dp_op,
      args       => rb_successor_dp_args,
      retval     => rb_successor_dp_retval,
      load_reqs  => rb_successor_dp_load_reqs,
      load_acks  => rb_successor_dp_load_acks,
      load_addr  => rb_successor_dp_load_addr,
      load_data  => rb_successor_dp_load_data,
      reset      => reset,
      clk        => clk);


  -- rb_traverse_dp: 1 load ports, 1 store ports
  amux_load_reqs(9 downto 9)  <= rb_traverse_dp_load_reqs;
  rb_traverse_dp_load_acks <= amux_load_acks(9 downto 9);

  rb_traverse_dp_load_data <=  amux_load_data(9 downto 9);
  amux_load_addr(9 downto 9) <= rb_traverse_dp_load_addr;

  amux_store_reqs(7 downto 7)  <= rb_traverse_dp_store_reqs;
  rb_traverse_dp_store_acks <= amux_store_acks(7 downto 7);

  amux_store_data(7 downto 7) <= rb_traverse_dp_store_data;
  amux_store_addr(7 downto 7) <= rb_traverse_dp_store_addr;

  rb_traverse_dp_inst : rb_traverse_dp
    port map (
      ip         => rb_traverse_dp_ip,
      op         => rb_traverse_dp_op,
      args       => rb_traverse_dp_args,
      retval     => rb_traverse_dp_retval,
      load_reqs  => rb_traverse_dp_load_reqs,
      load_acks  => rb_traverse_dp_load_acks,
      load_addr  => rb_traverse_dp_load_addr,
      load_data  => rb_traverse_dp_load_data,
      store_reqs => rb_traverse_dp_store_reqs,
      store_acks => rb_traverse_dp_store_acks,
      store_addr => rb_traverse_dp_store_addr,
      store_data => rb_traverse_dp_store_data,
      call_rb_alloc_0_retval => rb_traverse_call_rb_alloc_0_retval,
      call_rb_left_rotate_1_args => rb_traverse_call_rb_left_rotate_1_args,
      call_rb_left_rotate_4_args => rb_traverse_call_rb_left_rotate_4_args,
      call_rb_right_rotate_2_args => rb_traverse_call_rb_right_rotate_2_args,
      call_rb_right_rotate_3_args => rb_traverse_call_rb_right_rotate_3_args,
      reset      => reset,
      clk        => clk);


  -- rbdelete_dp: 0 load ports, 0 store ports
  rbdelete_dp_inst : rbdelete_dp
    port map (
      ip         => rbdelete_dp_ip,
      op         => rbdelete_dp_op,
      args       => rbdelete_dp_args,
      retval     => rbdelete_dp_retval,
      call_rb_delete_1_args => rbdelete_call_rb_delete_1_args,
      call_rb_traverse_0_args => rbdelete_call_rb_traverse_0_args,
      call_rb_traverse_0_retval => rbdelete_call_rb_traverse_0_retval,
      reset      => reset,
      clk        => clk);


  -- rbfind_dp: 1 load ports, 0 store ports
  amux_load_reqs(10 downto 10)  <= rbfind_dp_load_reqs;
  rbfind_dp_load_acks <= amux_load_acks(10 downto 10);

  rbfind_dp_load_data <=  amux_load_data(10 downto 10);
  amux_load_addr(10 downto 10) <= rbfind_dp_load_addr;

  rbfind_dp_inst : rbfind_dp
    port map (
      ip         => rbfind_dp_ip,
      op         => rbfind_dp_op,
      args       => rbfind_dp_args,
      retval     => rbfind_dp_retval,
      load_reqs  => rbfind_dp_load_reqs,
      load_acks  => rbfind_dp_load_acks,
      load_addr  => rbfind_dp_load_addr,
      load_data  => rbfind_dp_load_data,
      call_rb_traverse_0_args => rbfind_call_rb_traverse_0_args,
      call_rb_traverse_0_retval => rbfind_call_rb_traverse_0_retval,
      reset      => reset,
      clk        => clk);


  -- rbsearch_dp: 0 load ports, 0 store ports
  rbsearch_dp_inst : rbsearch_dp
    port map (
      ip         => rbsearch_dp_ip,
      op         => rbsearch_dp_op,
      args       => rbsearch_dp_args,
      retval     => rbsearch_dp_retval,
      call_rb_traverse_0_args => rbsearch_call_rb_traverse_0_args,
      call_rb_traverse_0_retval => rbsearch_call_rb_traverse_0_retval,
      reset      => reset,
      clk        => clk);


  -- start_dp: 0 load ports, 1 store ports
  amux_store_reqs(8 downto 8)  <= start_dp_store_reqs;
  start_dp_store_acks <= amux_store_acks(8 downto 8);

  amux_store_data(8 downto 8) <= start_dp_store_data;
  amux_store_addr(8 downto 8) <= start_dp_store_addr;

  start_dp_inst : start_dp
    port map (
      ip         => start_dp_ip,
      op         => start_dp_op,
      store_reqs => start_dp_store_reqs,
      store_acks => start_dp_store_acks,
      store_addr => start_dp_store_addr,
      store_data => start_dp_store_data,
      call_rbsearch_0_args => start_call_rbsearch_0_args,
      call_rbsearch_0_retval => start_call_rbsearch_0_retval,
      reset      => reset,
      clk        => clk);

  rb_alloc_cp_inst : rb_alloc_cp
    port map (
      ip    => rb_alloc_cp_ip,
      op    => rb_alloc_cp_op,
      reset => reset,
      clk   => clk);

  rb_delete_cp_inst : rb_delete_cp
    port map (
      ip    => rb_delete_cp_ip,
      op    => rb_delete_cp_op,
      reset => reset,
      clk   => clk);

  rb_delete_fix_cp_inst : rb_delete_fix_cp
    port map (
      ip    => rb_delete_fix_cp_ip,
      op    => rb_delete_fix_cp_op,
      reset => reset,
      clk   => clk);

  rb_free_cp_inst : rb_free_cp
    port map (
      ip    => rb_free_cp_ip,
      op    => rb_free_cp_op,
      reset => reset,
      clk   => clk);

  rb_left_rotate_cp_inst : rb_left_rotate_cp
    port map (
      ip    => rb_left_rotate_cp_ip,
      op    => rb_left_rotate_cp_op,
      reset => reset,
      clk   => clk);

  rb_predecessor_cp_inst : rb_predecessor_cp
    port map (
      ip    => rb_predecessor_cp_ip,
      op    => rb_predecessor_cp_op,
      reset => reset,
      clk   => clk);

  rb_right_rotate_cp_inst : rb_right_rotate_cp
    port map (
      ip    => rb_right_rotate_cp_ip,
      op    => rb_right_rotate_cp_op,
      reset => reset,
      clk   => clk);

  rb_successor_cp_inst : rb_successor_cp
    port map (
      ip    => rb_successor_cp_ip,
      op    => rb_successor_cp_op,
      reset => reset,
      clk   => clk);

  rb_traverse_cp_inst : rb_traverse_cp
    port map (
      ip    => rb_traverse_cp_ip,
      op    => rb_traverse_cp_op,
      reset => reset,
      clk   => clk);

  rbdelete_cp_inst : rbdelete_cp
    port map (
      ip    => rbdelete_cp_ip,
      op    => rbdelete_cp_op,
      reset => reset,
      clk   => clk);

  rbfind_cp_inst : rbfind_cp
    port map (
      ip    => rbfind_cp_ip,
      op    => rbfind_cp_op,
      reset => reset,
      clk   => clk);

  rbsearch_cp_inst : rbsearch_cp
    port map (
      ip    => rbsearch_cp_ip,
      op    => rbsearch_cp_op,
      reset => reset,
      clk   => clk);

  start_cp_inst : start_cp
    port map (
      ip    => start_cp_ip,
      op    => start_cp_op,
      reset => reset,
      clk   => clk);

  rb_alloc_ln_inst : rb_alloc_ln
    port map (
      omega_ip => omega_to_rb_alloc_ln,
      rb_alloc_cp_ip => rb_alloc_cp_op,
      rb_alloc_dp_ip => rb_alloc_dp_op,
      omega_op => rb_alloc_ln_to_omega,
      rb_alloc_cp_op => rb_alloc_cp_ip,
      rb_alloc_dp_op => rb_alloc_dp_ip,
      reset => reset,
      clk   => clk);

  rb_delete_fix_ln_inst : rb_delete_fix_ln
    port map (
      omega_ip => omega_to_rb_delete_fix_ln,
      rb_delete_fix_cp_ip => rb_delete_fix_cp_op,
      rb_delete_fix_dp_ip => rb_delete_fix_dp_op,
      omega_op => rb_delete_fix_ln_to_omega,
      rb_delete_fix_cp_op => rb_delete_fix_cp_ip,
      rb_delete_fix_dp_op => rb_delete_fix_dp_ip,
      reset => reset,
      clk   => clk);

  rb_delete_ln_inst : rb_delete_ln
    port map (
      omega_ip => omega_to_rb_delete_ln,
      rb_delete_cp_ip => rb_delete_cp_op,
      rb_delete_dp_ip => rb_delete_dp_op,
      omega_op => rb_delete_ln_to_omega,
      rb_delete_cp_op => rb_delete_cp_ip,
      rb_delete_dp_op => rb_delete_dp_ip,
      reset => reset,
      clk   => clk);

  rb_free_ln_inst : rb_free_ln
    port map (
      omega_ip => omega_to_rb_free_ln,
      rb_free_cp_ip => rb_free_cp_op,
      rb_free_dp_ip => rb_free_dp_op,
      omega_op => rb_free_ln_to_omega,
      rb_free_cp_op => rb_free_cp_ip,
      rb_free_dp_op => rb_free_dp_ip,
      reset => reset,
      clk   => clk);

  rb_left_rotate_ln_inst : rb_left_rotate_ln
    port map (
      omega_ip => omega_to_rb_left_rotate_ln,
      rb_left_rotate_cp_ip => rb_left_rotate_cp_op,
      rb_left_rotate_dp_ip => rb_left_rotate_dp_op,
      omega_op => rb_left_rotate_ln_to_omega,
      rb_left_rotate_cp_op => rb_left_rotate_cp_ip,
      rb_left_rotate_dp_op => rb_left_rotate_dp_ip,
      reset => reset,
      clk   => clk);

  rb_predecessor_ln_inst : rb_predecessor_ln
    port map (
      omega_ip => omega_to_rb_predecessor_ln,
      rb_predecessor_cp_ip => rb_predecessor_cp_op,
      rb_predecessor_dp_ip => rb_predecessor_dp_op,
      omega_op => rb_predecessor_ln_to_omega,
      rb_predecessor_cp_op => rb_predecessor_cp_ip,
      rb_predecessor_dp_op => rb_predecessor_dp_ip,
      reset => reset,
      clk   => clk);

  rb_right_rotate_ln_inst : rb_right_rotate_ln
    port map (
      omega_ip => omega_to_rb_right_rotate_ln,
      rb_right_rotate_cp_ip => rb_right_rotate_cp_op,
      rb_right_rotate_dp_ip => rb_right_rotate_dp_op,
      omega_op => rb_right_rotate_ln_to_omega,
      rb_right_rotate_cp_op => rb_right_rotate_cp_ip,
      rb_right_rotate_dp_op => rb_right_rotate_dp_ip,
      reset => reset,
      clk   => clk);

  rb_successor_ln_inst : rb_successor_ln
    port map (
      omega_ip => omega_to_rb_successor_ln,
      rb_successor_cp_ip => rb_successor_cp_op,
      rb_successor_dp_ip => rb_successor_dp_op,
      omega_op => rb_successor_ln_to_omega,
      rb_successor_cp_op => rb_successor_cp_ip,
      rb_successor_dp_op => rb_successor_dp_ip,
      reset => reset,
      clk   => clk);

  rb_traverse_ln_inst : rb_traverse_ln
    port map (
      omega_ip => omega_to_rb_traverse_ln,
      rb_traverse_cp_ip => rb_traverse_cp_op,
      rb_traverse_dp_ip => rb_traverse_dp_op,
      omega_op => rb_traverse_ln_to_omega,
      rb_traverse_cp_op => rb_traverse_cp_ip,
      rb_traverse_dp_op => rb_traverse_dp_ip,
      reset => reset,
      clk   => clk);

  rbdelete_ln_inst : rbdelete_ln
    port map (
      omega_ip => omega_to_rbdelete_ln,
      rbdelete_cp_ip => rbdelete_cp_op,
      rbdelete_dp_ip => rbdelete_dp_op,
      omega_op => rbdelete_ln_to_omega,
      rbdelete_cp_op => rbdelete_cp_ip,
      rbdelete_dp_op => rbdelete_dp_ip,
      reset => reset,
      clk   => clk);

  rbfind_ln_inst : rbfind_ln
    port map (
      omega_ip => omega_to_rbfind_ln,
      rbfind_cp_ip => rbfind_cp_op,
      rbfind_dp_ip => rbfind_dp_op,
      omega_op => rbfind_ln_to_omega,
      rbfind_cp_op => rbfind_cp_ip,
      rbfind_dp_op => rbfind_dp_ip,
      reset => reset,
      clk   => clk);

  rbsearch_ln_inst : rbsearch_ln
    port map (
      omega_ip => omega_to_rbsearch_ln,
      rbsearch_cp_ip => rbsearch_cp_op,
      rbsearch_dp_ip => rbsearch_dp_op,
      omega_op => rbsearch_ln_to_omega,
      rbsearch_cp_op => rbsearch_cp_ip,
      rbsearch_dp_op => rbsearch_dp_ip,
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

  omega_rb_alloc_mretval(32 downto 1) <= rb_alloc_dp_retval;
  rb_traverse_call_rb_alloc_0_retval <= omega_rb_alloc_retval(32 downto 1);
  omega_rb_alloc_reqs(1) <= rb_traverse_ln_to_omega(2);
  omega_to_rb_traverse_ln(2) <= omega_rb_alloc_acks(1);

  omega_rb_alloc : omega_amux
    generic map (
      args_width => 0,
      retval_width => 32,
      num_clients => 1)
    port map (
      reqs => omega_rb_alloc_reqs,
      acks => omega_rb_alloc_acks,
      args => omega_rb_alloc_args,
      retval => omega_rb_alloc_retval,

      mreq => omega_to_rb_alloc_ln(1),
      mack => rb_alloc_ln_to_omega(1),
      margs => omega_rb_alloc_margs,
      mretval => omega_rb_alloc_mretval,
      clk => clk,
      reset => reset);

  rb_delete_dp_args <= omega_rb_delete_margs(64 downto 1);
  omega_rb_delete_args(64 downto 1) <= rbdelete_call_rb_delete_1_args;
  omega_rb_delete_reqs(1) <= rbdelete_ln_to_omega(3);
  omega_to_rbdelete_ln(3) <= omega_rb_delete_acks(1);

  omega_rb_delete : omega_amux
    generic map (
      args_width => 64,
      retval_width => 0,
      num_clients => 1)
    port map (
      reqs => omega_rb_delete_reqs,
      acks => omega_rb_delete_acks,
      args => omega_rb_delete_args,
      retval => omega_rb_delete_retval,

      mreq => omega_to_rb_delete_ln(1),
      mack => rb_delete_ln_to_omega(1),
      margs => omega_rb_delete_margs,
      mretval => omega_rb_delete_mretval,
      clk => clk,
      reset => reset);

  rb_delete_fix_dp_args <= omega_rb_delete_fix_margs(64 downto 1);
  omega_rb_delete_fix_args(64 downto 1) <= rb_delete_call_rb_delete_fix_1_args;
  omega_rb_delete_fix_reqs(1) <= rb_delete_ln_to_omega(3);
  omega_to_rb_delete_ln(3) <= omega_rb_delete_fix_acks(1);

  omega_rb_delete_fix : omega_amux
    generic map (
      args_width => 64,
      retval_width => 0,
      num_clients => 1)
    port map (
      reqs => omega_rb_delete_fix_reqs,
      acks => omega_rb_delete_fix_acks,
      args => omega_rb_delete_fix_args,
      retval => omega_rb_delete_fix_retval,

      mreq => omega_to_rb_delete_fix_ln(1),
      mack => rb_delete_fix_ln_to_omega(1),
      margs => omega_rb_delete_fix_margs,
      mretval => omega_rb_delete_fix_mretval,
      clk => clk,
      reset => reset);

  rb_free_dp_args <= omega_rb_free_margs(32 downto 1);
  omega_rb_free_args(32 downto 1) <= rb_delete_call_rb_free_2_args;
  omega_rb_free_reqs(1) <= rb_delete_ln_to_omega(4);
  omega_to_rb_delete_ln(4) <= omega_rb_free_acks(1);

  omega_rb_free : omega_amux
    generic map (
      args_width => 32,
      retval_width => 0,
      num_clients => 1)
    port map (
      reqs => omega_rb_free_reqs,
      acks => omega_rb_free_acks,
      args => omega_rb_free_args,
      retval => omega_rb_free_retval,

      mreq => omega_to_rb_free_ln(1),
      mack => rb_free_ln_to_omega(1),
      margs => omega_rb_free_margs,
      mretval => omega_rb_free_mretval,
      clk => clk,
      reset => reset);

  rb_left_rotate_dp_args <= omega_rb_left_rotate_margs(64 downto 1);
  omega_rb_left_rotate_args(64 downto 1) <= rb_delete_fix_call_rb_left_rotate_0_args;
  omega_rb_left_rotate_reqs(1) <= rb_delete_fix_ln_to_omega(2);
  omega_to_rb_delete_fix_ln(2) <= omega_rb_left_rotate_acks(1);

  omega_rb_left_rotate_args(128 downto 65) <= rb_delete_fix_call_rb_left_rotate_3_args;
  omega_rb_left_rotate_reqs(2) <= rb_delete_fix_ln_to_omega(5);
  omega_to_rb_delete_fix_ln(5) <= omega_rb_left_rotate_acks(2);

  omega_rb_left_rotate_args(192 downto 129) <= rb_delete_fix_call_rb_left_rotate_4_args;
  omega_rb_left_rotate_reqs(3) <= rb_delete_fix_ln_to_omega(6);
  omega_to_rb_delete_fix_ln(6) <= omega_rb_left_rotate_acks(3);

  omega_rb_left_rotate_args(256 downto 193) <= rb_traverse_call_rb_left_rotate_1_args;
  omega_rb_left_rotate_reqs(4) <= rb_traverse_ln_to_omega(3);
  omega_to_rb_traverse_ln(3) <= omega_rb_left_rotate_acks(4);

  omega_rb_left_rotate_args(320 downto 257) <= rb_traverse_call_rb_left_rotate_4_args;
  omega_rb_left_rotate_reqs(5) <= rb_traverse_ln_to_omega(6);
  omega_to_rb_traverse_ln(6) <= omega_rb_left_rotate_acks(5);

  omega_rb_left_rotate : omega_amux
    generic map (
      args_width => 64,
      retval_width => 0,
      num_clients => 5)
    port map (
      reqs => omega_rb_left_rotate_reqs,
      acks => omega_rb_left_rotate_acks,
      args => omega_rb_left_rotate_args,
      retval => omega_rb_left_rotate_retval,

      mreq => omega_to_rb_left_rotate_ln(1),
      mack => rb_left_rotate_ln_to_omega(1),
      margs => omega_rb_left_rotate_margs,
      mretval => omega_rb_left_rotate_mretval,
      clk => clk,
      reset => reset);

  rb_right_rotate_dp_args <= omega_rb_right_rotate_margs(64 downto 1);
  omega_rb_right_rotate_args(64 downto 1) <= rb_delete_fix_call_rb_right_rotate_1_args;
  omega_rb_right_rotate_reqs(1) <= rb_delete_fix_ln_to_omega(3);
  omega_to_rb_delete_fix_ln(3) <= omega_rb_right_rotate_acks(1);

  omega_rb_right_rotate_args(128 downto 65) <= rb_delete_fix_call_rb_right_rotate_2_args;
  omega_rb_right_rotate_reqs(2) <= rb_delete_fix_ln_to_omega(4);
  omega_to_rb_delete_fix_ln(4) <= omega_rb_right_rotate_acks(2);

  omega_rb_right_rotate_args(192 downto 129) <= rb_delete_fix_call_rb_right_rotate_5_args;
  omega_rb_right_rotate_reqs(3) <= rb_delete_fix_ln_to_omega(7);
  omega_to_rb_delete_fix_ln(7) <= omega_rb_right_rotate_acks(3);

  omega_rb_right_rotate_args(256 downto 193) <= rb_traverse_call_rb_right_rotate_2_args;
  omega_rb_right_rotate_reqs(4) <= rb_traverse_ln_to_omega(4);
  omega_to_rb_traverse_ln(4) <= omega_rb_right_rotate_acks(4);

  omega_rb_right_rotate_args(320 downto 257) <= rb_traverse_call_rb_right_rotate_3_args;
  omega_rb_right_rotate_reqs(5) <= rb_traverse_ln_to_omega(5);
  omega_to_rb_traverse_ln(5) <= omega_rb_right_rotate_acks(5);

  omega_rb_right_rotate : omega_amux
    generic map (
      args_width => 64,
      retval_width => 0,
      num_clients => 5)
    port map (
      reqs => omega_rb_right_rotate_reqs,
      acks => omega_rb_right_rotate_acks,
      args => omega_rb_right_rotate_args,
      retval => omega_rb_right_rotate_retval,

      mreq => omega_to_rb_right_rotate_ln(1),
      mack => rb_right_rotate_ln_to_omega(1),
      margs => omega_rb_right_rotate_margs,
      mretval => omega_rb_right_rotate_mretval,
      clk => clk,
      reset => reset);

  rb_successor_dp_args <= omega_rb_successor_margs(32 downto 1);
  omega_rb_successor_mretval(32 downto 1) <= rb_successor_dp_retval;
  omega_rb_successor_args(32 downto 1) <= rb_delete_call_rb_successor_0_args;
  rb_delete_call_rb_successor_0_retval <= omega_rb_successor_retval(32 downto 1);
  omega_rb_successor_reqs(1) <= rb_delete_ln_to_omega(2);
  omega_to_rb_delete_ln(2) <= omega_rb_successor_acks(1);

  omega_rb_successor : omega_amux
    generic map (
      args_width => 32,
      retval_width => 32,
      num_clients => 1)
    port map (
      reqs => omega_rb_successor_reqs,
      acks => omega_rb_successor_acks,
      args => omega_rb_successor_args,
      retval => omega_rb_successor_retval,

      mreq => omega_to_rb_successor_ln(1),
      mack => rb_successor_ln_to_omega(1),
      margs => omega_rb_successor_margs,
      mretval => omega_rb_successor_mretval,
      clk => clk,
      reset => reset);

  rb_traverse_dp_args <= omega_rb_traverse_margs(96 downto 1);
  omega_rb_traverse_mretval(32 downto 1) <= rb_traverse_dp_retval;
  omega_rb_traverse_args(96 downto 1) <= rbdelete_call_rb_traverse_0_args;
  rbdelete_call_rb_traverse_0_retval <= omega_rb_traverse_retval(32 downto 1);
  omega_rb_traverse_reqs(1) <= rbdelete_ln_to_omega(2);
  omega_to_rbdelete_ln(2) <= omega_rb_traverse_acks(1);

  omega_rb_traverse_args(192 downto 97) <= rbfind_call_rb_traverse_0_args;
  rbfind_call_rb_traverse_0_retval <= omega_rb_traverse_retval(64 downto 33);
  omega_rb_traverse_reqs(2) <= rbfind_ln_to_omega(2);
  omega_to_rbfind_ln(2) <= omega_rb_traverse_acks(2);

  omega_rb_traverse_args(288 downto 193) <= rbsearch_call_rb_traverse_0_args;
  rbsearch_call_rb_traverse_0_retval <= omega_rb_traverse_retval(96 downto 65);
  omega_rb_traverse_reqs(3) <= rbsearch_ln_to_omega(2);
  omega_to_rbsearch_ln(2) <= omega_rb_traverse_acks(3);

  omega_rb_traverse : omega_amux
    generic map (
      args_width => 96,
      retval_width => 32,
      num_clients => 3)
    port map (
      reqs => omega_rb_traverse_reqs,
      acks => omega_rb_traverse_acks,
      args => omega_rb_traverse_args,
      retval => omega_rb_traverse_retval,

      mreq => omega_to_rb_traverse_ln(1),
      mack => rb_traverse_ln_to_omega(1),
      margs => omega_rb_traverse_margs,
      mretval => omega_rb_traverse_mretval,
      clk => clk,
      reset => reset);

  rbsearch_dp_args <= omega_rbsearch_margs(64 downto 1);
  omega_rbsearch_mretval(32 downto 1) <= rbsearch_dp_retval;
  omega_rbsearch_args(64 downto 1) <= start_call_rbsearch_0_args;
  start_call_rbsearch_0_retval <= omega_rbsearch_retval(32 downto 1);
  omega_rbsearch_reqs(1) <= start_ln_to_omega(2);
  omega_to_start_ln(2) <= omega_rbsearch_acks(1);

  omega_rbsearch : omega_amux
    generic map (
      args_width => 64,
      retval_width => 32,
      num_clients => 1)
    port map (
      reqs => omega_rbsearch_reqs,
      acks => omega_rbsearch_acks,
      args => omega_rbsearch_args,
      retval => omega_rbsearch_retval,

      mreq => omega_to_rbsearch_ln(1),
      mack => rbsearch_ln_to_omega(1),
      margs => omega_rbsearch_margs,
      mretval => omega_rbsearch_mretval,
      clk => clk,
      reset => reset);

  omega_start_reqs(1) <= env_ln_to_omega(1);
  omega_to_env_ln(1) <= omega_start_acks(1);

  omega_start : omega_amux
    generic map (
      args_width => 0,
      retval_width => 0,
      num_clients => 1)
    port map (
      reqs => omega_start_reqs,
      acks => omega_start_acks,
      args => omega_start_args,
      retval => omega_start_retval,

      mreq => omega_to_start_ln(1),
      mack => start_ln_to_omega(1),
      margs => omega_start_margs,
      mretval => omega_start_mretval,
      clk => clk,
      reset => reset);


end default_arch;
