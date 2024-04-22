
library work;
use work.extra_types.all;
use work.dpath_components.all;

entity divide_dp is
  port(
    ip : in  bit_vector(50 downto 1);
    op : out bit_vector(44 downto 1) := (others => '0');

    load_reqs : out bit_vector(1 downto 0) := (others => '0');
    load_acks : in bit_vector(1 downto 0);
    load_addr : out MemoryBusVectorType(1 downto 0);
    load_data : in  MemoryBusVectorType(1 downto 0);

    store_reqs : out bit_vector(0 downto 0) := (others => '0');
    store_acks : in bit_vector(0 downto 0);
    store_addr : out MemoryBusVectorType(0 downto 0);
    store_data : out MemoryBusVectorType(0 downto 0);

    reset : in bit;
    clk   : in  bit);
end divide_dp;

architecture Behavioral of divide_dp is

  signal cst_0_float_d_wire : bit_vector(31 downto 0);
  signal cst_10_float_d_wire : bit_vector(31 downto 0);
  signal cst_11_float_d_wire : bit_vector(31 downto 0);
  signal cst_12_float_d_wire : bit_vector(31 downto 0);
  signal cst_1_float_d_wire : bit_vector(31 downto 0);
  signal cst_2_float_d_wire : bit_vector(31 downto 0);
  signal cst_3_float_d_wire : bit_vector(31 downto 0);
  signal cst_4_float_d_wire : bit_vector(31 downto 0);
  signal cst_5_float_d_wire : bit_vector(31 downto 0);
  signal cst_6_float_d_wire : bit_vector(31 downto 0);
  signal cst_7_float_d_wire : bit_vector(31 downto 0);
  signal cst_8_float_d_wire : bit_vector(31 downto 0);
  signal cst_9_float_d_wire : bit_vector(31 downto 0);
  signal di_d_0_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal di_d_1_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal di_d_1_d_1_mux_1_d_wire : bit_vector(31 downto 0);
  signal di_d_1_mux_1_d_wire : bit_vector(31 downto 0);
  signal di_d_2_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal load_dividend_d_wire : bit_vector(31 downto 0);
  signal load_divisor_d_wire : bit_vector(31 downto 0);
  signal location_divide_formal_0_d_wire : bit_vector(31 downto 0);
  signal location_divide_formal_1_d_wire : bit_vector(31 downto 0);
  signal location_divide_return_d_wire : bit_vector(31 downto 0);
  signal ni_d_0_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal ni_d_1_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal ni_d_1_d_1_mux_1_d_wire : bit_vector(31 downto 0);
  signal ni_d_1_mux_1_d_wire : bit_vector(31 downto 0);
  signal ni_d_2_d_0_mux_1_d_wire : bit_vector(31 downto 0);
  signal ni_d_2_d_1_mux_1_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_1114_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_11_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_14_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_16_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_19_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_21_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_2420_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_24_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_2621_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_26_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_31_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_34_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_35_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_36_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_3_bool_d_wire : bit_vector(0 downto 0);
  signal oper_tmp_d_6_float_d_wire : bit_vector(31 downto 0);
  signal oper_tmp_d_8_float_d_wire : bit_vector(31 downto 0);
  signal ri_d_0_d_0_mux_1_d_wire : bit_vector(31 downto 0);

begin

  cbr_0_oper_tmp_d_35_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_35_bool_d_wire -- in
    , req0 => ip(4)
    , ack0 => op(5)
    , ack1 => op(4)
    , reset => reset
    , clk => clk);

  cbr_1_oper_tmp_d_3_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_3_bool_d_wire -- in
    , req0 => ip(12)
    , ack0 => op(12)
    , ack1 => op(11)
    , reset => reset
    , clk => clk);

  cbr_2_oper_tmp_d_11_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_11_bool_d_wire -- in
    , req0 => ip(18)
    , ack0 => op(17)
    , ack1 => op(16)
    , reset => reset
    , clk => clk);

  cbr_3_oper_tmp_d_1114_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_1114_bool_d_wire -- in
    , req0 => ip(26)
    , ack0 => op(24)
    , ack1 => op(23)
    , reset => reset
    , clk => clk);

  cbr_4_oper_tmp_d_2621_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_2621_bool_d_wire -- in
    , req0 => ip(35)
    , ack0 => op(32)
    , ack1 => op(31)
    , reset => reset
    , clk => clk);

  cbr_5_oper_tmp_d_26_bool : libdec
  generic map(
     ip_wd => 1)
  port map(
    ip => oper_tmp_d_26_bool_d_wire -- in
    , req0 => ip(47)
    , ack0 => op(42)
    , ack1 => op(41)
    , reset => reset
    , clk => clk);

  di_d_0_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_6_float_d_wire -- in
    , ip1 => load_divisor_d_wire -- in
    , op => di_d_0_d_0_mux_1_d_wire -- out
    , req0 => ip(5)
    , req1 => ip(6)
    , ack0 => op(6)
    , reset => reset
    , clk => clk);

  di_d_1_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_14_float_d_wire -- in
    , ip1 => di_d_1_mux_1_d_wire -- in
    , op => di_d_1_d_0_mux_1_d_wire -- out
    , req0 => ip(19)
    , req1 => ip(20)
    , ack0 => op(18)
    , reset => reset
    , clk => clk);

  di_d_1_d_1_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => di_d_1_mux_1_d_wire -- in
    , ip1 => oper_tmp_d_14_float_d_wire -- in
    , op => di_d_1_d_1_mux_1_d_wire -- out
    , req0 => ip(27)
    , req1 => ip(28)
    , ack0 => op(25)
    , reset => reset
    , clk => clk);

  di_d_1_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => load_divisor_d_wire -- in
    , ip1 => oper_tmp_d_6_float_d_wire -- in
    , op => di_d_1_mux_1_d_wire -- out
    , req0 => ip(13)
    , req1 => ip(14)
    , ack0 => op(13)
    , reset => reset
    , clk => clk);

  di_d_2_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_31_float_d_wire -- in
    , ip1 => di_d_1_d_1_mux_1_d_wire -- in
    , op => di_d_2_d_0_mux_1_d_wire -- out
    , req0 => ip(36)
    , req1 => ip(37)
    , ack0 => op(33)
    , reset => reset
    , clk => clk);

  load_dividend : liblod
  generic map(
     ap_wd => 32
    , dp_wd => 32)
  port map(
    ap => location_divide_formal_0_d_wire -- in
    , dp => load_dividend_d_wire -- out
    , req0 => ip(1)
    , ack0 => op(1)
    , mreq => load_reqs(0)
    , mack => load_acks(0)
    , maddr => load_addr(0)
    , mdata => load_data(0)
    , reset => reset
    , clk => clk);

  load_divisor : liblod
  generic map(
     ap_wd => 32
    , dp_wd => 32)
  port map(
    ap => location_divide_formal_1_d_wire -- in
    , dp => load_divisor_d_wire -- out
    , req0 => ip(2)
    , ack0 => op(2)
    , mreq => load_reqs(1)
    , mack => load_acks(1)
    , maddr => load_addr(1)
    , mdata => load_data(1)
    , reset => reset
    , clk => clk);

  ni_d_0_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_8_float_d_wire -- in
    , ip1 => load_dividend_d_wire -- in
    , op => ni_d_0_d_0_mux_1_d_wire -- out
    , req0 => ip(7)
    , req1 => ip(8)
    , ack0 => op(7)
    , reset => reset
    , clk => clk);

  ni_d_1_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_16_float_d_wire -- in
    , ip1 => ni_d_1_mux_1_d_wire -- in
    , op => ni_d_1_d_0_mux_1_d_wire -- out
    , req0 => ip(21)
    , req1 => ip(22)
    , ack0 => op(19)
    , reset => reset
    , clk => clk);

  ni_d_1_d_1_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ni_d_1_mux_1_d_wire -- in
    , ip1 => oper_tmp_d_16_float_d_wire -- in
    , op => ni_d_1_d_1_mux_1_d_wire -- out
    , req0 => ip(29)
    , req1 => ip(30)
    , ack0 => op(26)
    , reset => reset
    , clk => clk);

  ni_d_1_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => load_dividend_d_wire -- in
    , ip1 => oper_tmp_d_8_float_d_wire -- in
    , op => ni_d_1_mux_1_d_wire -- out
    , req0 => ip(15)
    , req1 => ip(16)
    , ack0 => op(14)
    , reset => reset
    , clk => clk);

  ni_d_2_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_34_float_d_wire -- in
    , ip1 => ni_d_1_d_1_mux_1_d_wire -- in
    , op => ni_d_2_d_0_mux_1_d_wire -- out
    , req0 => ip(38)
    , req1 => ip(39)
    , ack0 => op(34)
    , reset => reset
    , clk => clk);

  ni_d_2_d_1_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ni_d_1_d_1_mux_1_d_wire -- in
    , ip1 => oper_tmp_d_34_float_d_wire -- in
    , op => ni_d_2_d_1_mux_1_d_wire -- out
    , req0 => ip(48)
    , req1 => ip(49)
    , ack0 => op(43)
    , reset => reset
    , clk => clk);

  oper_tmp_d_1114_bool : libgt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => oper_tmp_d_14_float_d_wire -- in
    , ip1 => cst_7_float_d_wire -- in
    , op => oper_tmp_d_1114_bool_d_wire -- out
    , req0 => ip(25)
    , ack0 => op(22)
    , reset => reset
    , clk => clk);

  oper_tmp_d_11_bool : libgt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => di_d_1_mux_1_d_wire -- in
    , ip1 => cst_4_float_d_wire -- in
    , op => oper_tmp_d_11_bool_d_wire -- out
    , req0 => ip(17)
    , ack0 => op(15)
    , reset => reset
    , clk => clk);

  oper_tmp_d_14_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => di_d_1_d_0_mux_1_d_wire -- in
    , ip1 => cst_5_float_d_wire -- in
    , op => oper_tmp_d_14_float_d_wire -- out
    , req0 => ip(23)
    , ack0 => op(20)
    , reset => reset
    , clk => clk);

  oper_tmp_d_16_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ni_d_1_d_0_mux_1_d_wire -- in
    , ip1 => cst_6_float_d_wire -- in
    , op => oper_tmp_d_16_float_d_wire -- out
    , req0 => ip(24)
    , ack0 => op(21)
    , reset => reset
    , clk => clk);

  oper_tmp_d_19_float : libsub_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ni_d_1_d_1_mux_1_d_wire -- in
    , ip1 => cst_8_float_d_wire -- in
    , op => oper_tmp_d_19_float_d_wire -- out
    , req0 => ip(31)
    , ack0 => op(27)
    , reset => reset
    , clk => clk);

  oper_tmp_d_21_float : libsub_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => cst_9_float_d_wire -- in
    , ip1 => di_d_1_d_1_mux_1_d_wire -- in
    , op => oper_tmp_d_21_float_d_wire -- out
    , req0 => ip(32)
    , ack0 => op(28)
    , reset => reset
    , clk => clk);

  oper_tmp_d_2420_float : libsub_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ni_d_1_d_1_mux_1_d_wire -- in
    , ip1 => oper_tmp_d_19_float_d_wire -- in
    , op => oper_tmp_d_2420_float_d_wire -- out
    , req0 => ip(33)
    , ack0 => op(29)
    , reset => reset
    , clk => clk);

  oper_tmp_d_24_float : libsub_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_34_float_d_wire -- in
    , ip1 => ni_d_2_d_0_mux_1_d_wire -- in
    , op => oper_tmp_d_24_float_d_wire -- out
    , req0 => ip(45)
    , ack0 => op(39)
    , reset => reset
    , clk => clk);

  oper_tmp_d_2621_bool : libgt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => oper_tmp_d_2420_float_d_wire -- in
    , ip1 => cst_10_float_d_wire -- in
    , op => oper_tmp_d_2621_bool_d_wire -- out
    , req0 => ip(34)
    , ack0 => op(30)
    , reset => reset
    , clk => clk);

  oper_tmp_d_26_bool : libgt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => oper_tmp_d_24_float_d_wire -- in
    , ip1 => cst_12_float_d_wire -- in
    , op => oper_tmp_d_26_bool_d_wire -- out
    , req0 => ip(46)
    , ack0 => op(40)
    , reset => reset
    , clk => clk);

  oper_tmp_d_31_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => di_d_2_d_0_mux_1_d_wire -- in
    , ip1 => ri_d_0_d_0_mux_1_d_wire -- in
    , op => oper_tmp_d_31_float_d_wire -- out
    , req0 => ip(42)
    , ack0 => op(36)
    , reset => reset
    , clk => clk);

  oper_tmp_d_34_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ni_d_2_d_0_mux_1_d_wire -- in
    , ip1 => ri_d_0_d_0_mux_1_d_wire -- in
    , op => oper_tmp_d_34_float_d_wire -- out
    , req0 => ip(43)
    , ack0 => op(37)
    , reset => reset
    , clk => clk);

  oper_tmp_d_35_bool : libgt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => load_divisor_d_wire -- in
    , ip1 => cst_0_float_d_wire -- in
    , op => oper_tmp_d_35_bool_d_wire -- out
    , req0 => ip(3)
    , ack0 => op(3)
    , reset => reset
    , clk => clk);

  oper_tmp_d_36_float : libsub_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => cst_11_float_d_wire -- in
    , ip1 => oper_tmp_d_31_float_d_wire -- in
    , op => oper_tmp_d_36_float_d_wire -- out
    , req0 => ip(44)
    , ack0 => op(38)
    , reset => reset
    , clk => clk);

  oper_tmp_d_3_bool : libgt_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 1)
  port map(
    ip0 => oper_tmp_d_6_float_d_wire -- in
    , ip1 => cst_3_float_d_wire -- in
    , op => oper_tmp_d_3_bool_d_wire -- out
    , req0 => ip(11)
    , ack0 => op(10)
    , reset => reset
    , clk => clk);

  oper_tmp_d_6_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => di_d_0_d_0_mux_1_d_wire -- in
    , ip1 => cst_1_float_d_wire -- in
    , op => oper_tmp_d_6_float_d_wire -- out
    , req0 => ip(9)
    , ack0 => op(8)
    , reset => reset
    , clk => clk);

  oper_tmp_d_8_float : libmul_float
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => ni_d_0_d_0_mux_1_d_wire -- in
    , ip1 => cst_2_float_d_wire -- in
    , op => oper_tmp_d_8_float_d_wire -- out
    , req0 => ip(10)
    , ack0 => op(9)
    , reset => reset
    , clk => clk);

  ri_d_0_d_0_mux_1 : libmux
  generic map(
     ip0_wd => 32
    , ip1_wd => 32
    , op_wd => 32)
  port map(
    ip0 => oper_tmp_d_36_float_d_wire -- in
    , ip1 => oper_tmp_d_21_float_d_wire -- in
    , op => ri_d_0_d_0_mux_1_d_wire -- out
    , req0 => ip(40)
    , req1 => ip(41)
    , ack0 => op(35)
    , reset => reset
    , clk => clk);

  store_location_divide_return : libsto
  generic map(
     ap_wd => 32
    , dp_wd => 32)
  port map(
    ap => location_divide_return_d_wire -- in
    , dp => ni_d_2_d_1_mux_1_d_wire -- in
    , req0 => ip(50)
    , ack0 => op(44)
    , mreq => store_reqs(0)
    , mack => store_acks(0)
    , maddr => store_addr(0)
    , mdata => store_data(0)
    , reset => reset
    , clk => clk);

  cst_0_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_0_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_10_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','0','1','0','1','0','0','0','0','0','1','1','0','0','0','1','0','0','1','0','0','1','1','0','1','1','1','1'))
  port map(
    op => cst_10_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_11_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_11_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_12_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','0','1','0','1','0','0','0','0','0','1','1','0','0','0','1','0','0','1','0','0','1','1','0','1','1','1','1'))
  port map(
    op => cst_12_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_1_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_1_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_2_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_2_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_3_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_3_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_4_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_4_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_5_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_5_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_6_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_6_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_7_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_7_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_8_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','0','1','1','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_8_float_d_wire -- out
    , reset => reset
    , clk => clk);

  cst_9_float : libkonst_float
  generic map(
    op_wd => 32
    , val => ('0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'))
  port map(
    op => cst_9_float_d_wire -- out
    , reset => reset
    , clk => clk);

  location_divide_formal_0 : libkonst_uint -- actually an address
  generic map(
    op_wd => 32
    , val => 1)
  port map(
    op => location_divide_formal_0_d_wire -- out
    , reset => reset
    , clk => clk);

  location_divide_formal_1 : libkonst_uint -- actually an address
  generic map(
    op_wd => 32
    , val => 2)
  port map(
    op => location_divide_formal_1_d_wire -- out
    , reset => reset
    , clk => clk);

  location_divide_return : libkonst_uint -- actually an address
  generic map(
    op_wd => 32
    , val => 3)
  port map(
    op => location_divide_return_d_wire -- out
    , reset => reset
    , clk => clk);
end Behavioral;
