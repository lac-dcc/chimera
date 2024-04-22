
library work;
use work.extra_types.all;
use work.dpath_components.all;

entity start_dp is
  port(
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
end start_dp;

architecture Behavioral of start_dp is

  signal cst_10_zero_float_d_wire : bit_vector(31 downto 0);
  signal cst_11_zero_float_d_wire : bit_vector(31 downto 0);
  signal cst_12_0_int_d_wire : bit_vector(31 downto 0);
  signal cst_13_13_int_d_wire : bit_vector(31 downto 0);
  signal cst_14_1_float_d_wire : bit_vector(31 downto 0);
  signal cst_15_0_int_d_wire : bit_vector(31 downto 0);
  signal cst_16_0_d_5_float_d_wire : bit_vector(31 downto 0);
  signal cst_17_1_int_d_wire : bit_vector(31 downto 0);
  signal cst_9_1_float_d_wire : bit_vector(31 downto 0);
  signal i_d_0_d_i_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal i_d_0_d_i_mux_1_d_wire : bit_vector(31 downto 0);
  signal llimit_d_1_d_i_mux_1_d_wire : bit_vector(31 downto 0);
  signal llimit_d_2_d_i_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal llimit_d_2_d_i_mux_1_d_wire : bit_vector(31 downto 0);
  signal load_number_d_wire : bit_vector(31 downto 0);
  signal location_start_formal_0_d_wire : bit_vector(31 downto 0);
  signal location_start_return_d_wire : bit_vector(31 downto 0);
  signal mid_d_0_d_i_mux_1_d_wire : bit_vector(31 downto 0);
  signal oper_inc_d_i_int_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_10_d_i_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_11_d_i_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_14_d_i_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_17_d_i_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_1_d_i_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_6_d_i_bool_d_wire : bit_vector(0 downto 0);
  signal ulimit_d_1_d_i_mux_1_d_wire : bit_vector(31 downto 0);
  signal ulimit_d_2_d_i_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal ulimit_d_2_d_i_mux_1_d_wire : bit_vector(31 downto 0);

begin

  cbr_4_oper_tmp_d_1_d_i_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_1_d_i_bool_d_wire -- in
    , req0 => ip(3)
    , ack0 => op(4)
    , ack1 => op(3)
    , reset => reset
    , clk => clk);

  cbr_5_oper_tmp_d_6_d_i_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_6_d_i_bool_d_wire -- in
    , req0 => ip(13)
    , ack0 => op(11)
    , ack1 => op(10)
    , reset => reset
    , clk => clk);

  cbr_6_oper_tmp_d_17_d_i_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_17_d_i_bool_d_wire -- in
    , req0 => ip(24)
    , ack0 => op(20)
    , ack1 => op(19)
    , reset => reset
    , clk => clk);

  cbr_7_oper_tmp_d_17_d_i_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_17_d_i_bool_d_wire -- in
    , req0 => ip(27)
    , ack0 => op(23)
    , ack1 => op(22)
    , reset => reset
    , clk => clk);

  i_d_0_d_i_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => cst_15_0_int_d_wire -- in
    , ip1 => i_d_0_d_i_mux_1_d_wire -- in
    , op => i_d_0_d_i_d_0_mux_1_d_wire -- out
    , req0 => ip(18)
    , req1 => ip(19)
    , ack0 => op(14)
    , reset => reset
    , clk => clk);

  i_d_0_d_i_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_inc_d_i_int_d_wire -- in
    , ip1 => cst_12_0_int_d_wire -- in
    , op => i_d_0_d_i_mux_1_d_wire -- out
    , req0 => ip(10)
    , req1 => ip(11)
    , ack0 => op(8)
    , reset => reset
    , clk => clk);

  llimit_d_1_d_i_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_11_d_i_float_d_wire -- in
    , ip1 => llimit_d_2_d_i_d_0_mux_1_d_wire -- in
    , op => llimit_d_1_d_i_mux_1_d_wire -- out
    , req0 => ip(25)
    , req1 => ip(26)
    , ack0 => op(21)
    , reset => reset
    , clk => clk);

  llimit_d_2_d_i_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => load_number_d_wire -- in
    , ip1 => llimit_d_2_d_i_mux_1_d_wire -- in
    , op => llimit_d_2_d_i_d_0_mux_1_d_wire -- out
    , req0 => ip(14)
    , req1 => ip(15)
    , ack0 => op(12)
    , reset => reset
    , clk => clk);

  llimit_d_2_d_i_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => llimit_d_1_d_i_mux_1_d_wire -- in
    , ip1 => cst_11_zero_float_d_wire -- in
    , op => llimit_d_2_d_i_mux_1_d_wire -- out
    , req0 => ip(6)
    , req1 => ip(7)
    , ack0 => op(6)
    , reset => reset
    , clk => clk);

  load_number : liblod
  generic map(
     ap_wd => 32
    , dp_wd => 32)
  port map(
    ap => location_start_formal_0_d_wire -- in
    , dp => load_number_d_wire -- out
    , req0 => ip(1)
    , ack0 => op(1)
    , mreq => load_reqs(0)
    , mack => load_acks(0)
    , maddr => load_addr(0)
    , mdata => load_data(0)
    , reset => reset
    , clk => clk);

  mid_d_0_d_i_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_11_d_i_float_d_wire -- in
    , ip1 => cst_10_zero_float_d_wire -- in
    , op => mid_d_0_d_i_mux_1_d_wire -- out
    , req0 => ip(4)
    , req1 => ip(5)
    , ack0 => op(5)
    , reset => reset
    , clk => clk);

  oper_inc_d_i_int : libadd_int
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => i_d_0_d_i_d_0_mux_1_d_wire -- in
    , ip1 => cst_17_1_int_d_wire -- in
    , op => oper_inc_d_i_int_d_wire -- out
    , req0 => ip(30)
    , ack0 => op(25)
    , reset => reset
    , clk => clk);

  oper_tmp_d_10_d_i_float : libadd_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ulimit_d_2_d_i_d_0_mux_1_d_wire -- in
    , ip1 => llimit_d_2_d_i_d_0_mux_1_d_wire -- in
    , op => oper_tmp_d_10_d_i_float_d_wire -- out
    , req0 => ip(20)
    , ack0 => op(15)
    , reset => reset
    , clk => clk);

  oper_tmp_d_11_d_i_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_10_d_i_float_d_wire -- in
    , ip1 => cst_16_0_d_5_float_d_wire -- in
    , op => oper_tmp_d_11_d_i_float_d_wire -- out
    , req0 => ip(21)
    , ack0 => op(16)
    , reset => reset
    , clk => clk);

  oper_tmp_d_14_d_i_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_11_d_i_float_d_wire -- in
    , ip1 => oper_tmp_d_11_d_i_float_d_wire -- in
    , op => oper_tmp_d_14_d_i_float_d_wire -- out
    , req0 => ip(22)
    , ack0 => op(17)
    , reset => reset
    , clk => clk);

  oper_tmp_d_17_d_i_bool : liblt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => oper_tmp_d_14_d_i_float_d_wire -- in
    , ip1 => load_number_d_wire -- in
    , op => oper_tmp_d_17_d_i_bool_d_wire -- out
    , req0 => ip(23)
    , ack0 => op(18)
    , reset => reset
    , clk => clk);

  oper_tmp_d_1_d_i_bool : libgt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => load_number_d_wire -- in
    , ip1 => cst_9_1_float_d_wire -- in
    , op => oper_tmp_d_1_d_i_bool_d_wire -- out
    , req0 => ip(2)
    , ack0 => op(2)
    , reset => reset
    , clk => clk);

  oper_tmp_d_6_d_i_bool : liblt_int
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => i_d_0_d_i_mux_1_d_wire -- in
    , ip1 => cst_13_13_int_d_wire -- in
    , op => oper_tmp_d_6_d_i_bool_d_wire -- out
    , req0 => ip(12)
    , ack0 => op(9)
    , reset => reset
    , clk => clk);

  store_location_start_return : libsto
  generic map(
     ap_wd => 32
    , dp_wd => 32)
  port map(
    ap => location_start_return_d_wire -- in
    , dp => mid_d_0_d_i_mux_1_d_wire -- in
    , req0 => ip(31)
    , ack0 => op(26)
    , mreq => store_reqs(0)
    , mack => store_acks(0)
    , maddr => store_addr(0)
    , mdata => store_data(0)
    , reset => reset
    , clk => clk);

  ulimit_d_1_d_i_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ulimit_d_2_d_i_d_0_mux_1_d_wire -- in
    , ip1 => oper_tmp_d_11_d_i_float_d_wire -- in
    , op => ulimit_d_1_d_i_mux_1_d_wire -- out
    , req0 => ip(28)
    , req1 => ip(29)
    , ack0 => op(24)
    , reset => reset
    , clk => clk);

  ulimit_d_2_d_i_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => cst_14_1_float_d_wire -- in
    , ip1 => ulimit_d_2_d_i_mux_1_d_wire -- in
    , op => ulimit_d_2_d_i_d_0_mux_1_d_wire -- out
    , req0 => ip(16)
    , req1 => ip(17)
    , ack0 => op(13)
    , reset => reset
    , clk => clk);

  ulimit_d_2_d_i_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ulimit_d_1_d_i_mux_1_d_wire -- in
    , ip1 => load_number_d_wire -- in
    , op => ulimit_d_2_d_i_mux_1_d_wire -- out
    , req0 => ip(8)
    , req1 => ip(9)
    , ack0 => op(7)
    , reset => reset
    , clk => clk);

  cst_10_zero_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_10_zero_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_11_zero_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_11_zero_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_12_0_int : libkonst_int
  generic map(
    op_wd => 32
    , val => 0)
  port map(
    op => cst_12_0_int_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_13_13_int : libkonst_int
  generic map(
    op_wd => 32
    , val => 13)
  port map(
    op => cst_13_13_int_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_14_1_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_14_1_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_15_0_int : libkonst_int
  generic map(
    op_wd => 32
    , val => 0)
  port map(
    op => cst_15_0_int_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_16_0_d_5_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_16_0_d_5_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_17_1_int : libkonst_int
  generic map(
    op_wd => 32
    , val => 1)
  port map(
    op => cst_17_1_int_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_9_1_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_9_1_float_d_wire -- out
    , reset => reset
    , clk => clk);

  location_start_formal_0 : libkonst_uint -- actually an address
  generic map(
    op_wd => 32
    , val => 3)
  port map(
    op => location_start_formal_0_d_wire -- out
    , reset => reset
    , clk => clk);

  location_start_return : libkonst_uint -- actually an address
  generic map(
    op_wd => 32
    , val => 4)
  port map(
    op => location_start_return_d_wire -- out
    , reset => reset
    , clk => clk);
end Behavioral;
