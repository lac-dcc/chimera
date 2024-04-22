-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Master Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_axi_stream_master_interface is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 128-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in : in std_logic_vector( 128-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_axi_stream_master_interface;
architecture structural of xsg_bwselector_axi_stream_master_interface is 
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal register3_q_net : std_logic_vector( 128-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal ce_net : std_logic;
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
begin
  mux_y_net <= re_valid_in;
  mux1_y_net <= re_data_in;
  mux2_y_net <= im_valid_in;
  mux3_y_net <= im_data_in;
  m_axis_im_tdata <= register3_q_net;
  m_axis_im_tvalid <= register2_q_net;
  m_axis_re_tdata <= register1_q_net;
  m_axis_re_tvalid <= register_q_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux2_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => mux3_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/AXI-Stream Slave Interface
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_axi_stream_slave_interface is
  port (
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_axi_stream_slave_interface;
architecture structural of xsg_bwselector_axi_stream_slave_interface is 
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 128-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal s_axis_re_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal register_q_net : std_logic_vector( 128-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 128-1 downto 0 );
begin
  re_valid_out <= register3_q_net;
  re_data_out <= reinterpret_output_port_net;
  im_valid_out <= register2_q_net;
  im_data_out <= reinterpret1_output_port_net;
  s_axis_im_tdata_net <= s_axis_im_tdata;
  s_axis_im_tready <= constant_op_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tdata_net <= s_axis_re_tdata;
  s_axis_re_tready <= constant_op_net;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_861c8eb41f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_im_tdata_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 128,
    init_value => b"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_re_tdata_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_im_tvalid_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axis_re_tvalid_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_b9e342ce4b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => register1_q_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_b9e342ce4b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => register_q_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/Scalar2Vector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_scalar2vector is
  port (
    i : in std_logic_vector( 32-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_scalar2vector;
architecture structural of xsg_bwselector_scalar2vector is 
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice_y_net : std_logic_vector( 32-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net;
  slice_y_net <= i;
  slice0 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => slice_y_net,
    y => slice0_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => slice_y_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/Scalar2Vector1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_scalar2vector1 is
  port (
    i : in std_logic_vector( 32-1 downto 0 );
    o_1 : out std_logic_vector( 16-1 downto 0 );
    o_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_scalar2vector1;
architecture structural of xsg_bwselector_scalar2vector1 is 
  signal slice1_y_net : std_logic_vector( 32-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
begin
  o_1 <= slice0_y_net;
  o_2 <= slice1_y_net_x0;
  slice1_y_net <= i;
  slice0 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => slice1_y_net,
    y => slice0_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/Vector Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_imag_fir_2 is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_imag_fir_2;
architecture structural of xsg_bwselector_vector_imag_fir_2 is 
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal clk_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  register2_q_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_1eb83f552fd9c59e0967d3d99cbc3b26 
  port map (
    s_axis_data_tvalid => register2_q_net(0),
    s_axis_data_tdata_vect1 => reinterpret1_output_port_net,
    s_axis_data_tdata_vect0 => reinterpret0_output_port_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/Vector Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_real_fir_2 is
  port (
    tvi : in std_logic_vector( 1-1 downto 0 );
    tdi_1 : in std_logic_vector( 16-1 downto 0 );
    tdi_2 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_vector_real_fir_2;
architecture structural of xsg_bwselector_vector_real_fir_2 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  register3_q_net <= tvi;
  reinterpret0_output_port_net <= tdi_1;
  reinterpret1_output_port_net <= tdi_2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_1eb83f552fd9c59e0967d3d99cbc3b26 
  port map (
    s_axis_data_tvalid => register3_q_net(0),
    s_axis_data_tdata_vect1 => reinterpret1_output_port_net,
    s_axis_data_tdata_vect0 => reinterpret0_output_port_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/Vector Reinterpret
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret;
architecture structural of xsg_bwselector_vector_reinterpret is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator/Vector Reinterpret1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_vector_reinterpret1 is
  port (
    in_1 : in std_logic_vector( 16-1 downto 0 );
    in_2 : in std_logic_vector( 16-1 downto 0 );
    out_1 : out std_logic_vector( 16-1 downto 0 );
    out_2 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_vector_reinterpret1;
architecture structural of xsg_bwselector_vector_reinterpret1 is 
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
begin
  out_1 <= reinterpret0_output_port_net;
  out_2 <= reinterpret1_output_port_net;
  slice0_y_net <= in_1;
  slice1_y_net <= in_2;
  reinterpret0 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice0_y_net,
    output_port => reinterpret0_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_439aa46949 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Coarse Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_coarse_decimator is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 128-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in : in std_logic_vector( 128-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_coarse_decimator;
architecture structural of xsg_bwselector_coarse_decimator is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 128-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal slice1_y_net_x1 : std_logic_vector( 32-1 downto 0 );
  signal slice_y_net : std_logic_vector( 32-1 downto 0 );
  signal reinterpret1_output_port_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal ce_net : std_logic;
  signal slice0_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal slice0_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret0_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  im_data_out <= convert_dout_net;
  register3_q_net <= re_valid_in;
  reinterpret_output_port_net <= re_data_in;
  register2_q_net <= im_valid_in;
  reinterpret1_output_port_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  scalar2vector : entity xil_defaultlib.xsg_bwselector_scalar2vector 
  port map (
    i => slice_y_net,
    o_1 => slice0_y_net_x0,
    o_2 => slice1_y_net_x0
  );
  scalar2vector1 : entity xil_defaultlib.xsg_bwselector_scalar2vector1 
  port map (
    i => slice1_y_net_x1,
    o_1 => slice0_y_net,
    o_2 => slice1_y_net
  );
  vector_imag_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_imag_fir_2 
  port map (
    tvi => register2_q_net,
    tdi_1 => reinterpret0_output_port_net_x0,
    tdi_2 => reinterpret1_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  vector_real_fir_2 : entity xil_defaultlib.xsg_bwselector_vector_real_fir_2 
  port map (
    tvi => register3_q_net,
    tdi_1 => reinterpret0_output_port_net,
    tdi_2 => reinterpret1_output_port_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  vector_reinterpret : entity xil_defaultlib.xsg_bwselector_vector_reinterpret 
  port map (
    in_1 => slice0_y_net_x0,
    in_2 => slice1_y_net_x0,
    out_1 => reinterpret0_output_port_net,
    out_2 => reinterpret1_output_port_net_x1
  );
  vector_reinterpret1 : entity xil_defaultlib.xsg_bwselector_vector_reinterpret1 
  port map (
    in_1 => slice0_y_net,
    in_2 => slice1_y_net,
    out_1 => reinterpret0_output_port_net_x0,
    out_2 => reinterpret1_output_port_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  slice : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 31,
    x_width => 128,
    y_width => 32
  )
  port map (
    x => reinterpret_output_port_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 31,
    x_width => 128,
    y_width => 32
  )
  port map (
    x => reinterpret1_output_port_net_x0,
    y => slice1_y_net_x1
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 0/Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_imag_fir_2_x0 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_imag_fir_2_x0;
architecture structural of xsg_bwselector_imag_fir_2_x0 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 0/Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_real_fir_2 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_real_fir_2;
architecture structural of xsg_bwselector_real_fir_2 is 
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_0 is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_0;
architecture structural of xsg_bwselector_fir_2_system_0 is 
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert1_dout_net_x0 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert_dout_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  imag_fir_2 : entity xil_defaultlib.xsg_bwselector_imag_fir_2_x0 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  real_fir_2 : entity xil_defaultlib.xsg_bwselector_real_fir_2 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 1/Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_imag_fir_2_x1 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_imag_fir_2_x1;
architecture structural of xsg_bwselector_imag_fir_2_x1 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 1/Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_real_fir_2_x0 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_real_fir_2_x0;
architecture structural of xsg_bwselector_real_fir_2_x0 is 
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal clk_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_1 is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_1;
architecture structural of xsg_bwselector_fir_2_system_1 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert1_dout_net_x0 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert_dout_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  imag_fir_2 : entity xil_defaultlib.xsg_bwselector_imag_fir_2_x1 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  real_fir_2 : entity xil_defaultlib.xsg_bwselector_real_fir_2_x0 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 2/Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_imag_fir_2_x2 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_imag_fir_2_x2;
architecture structural of xsg_bwselector_imag_fir_2_x2 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 2/Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_real_fir_2_x1 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_real_fir_2_x1;
architecture structural of xsg_bwselector_real_fir_2_x1 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_2 is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_2;
architecture structural of xsg_bwselector_fir_2_system_2 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert1_dout_net_x0 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert_dout_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  imag_fir_2 : entity xil_defaultlib.xsg_bwselector_imag_fir_2_x2 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  real_fir_2 : entity xil_defaultlib.xsg_bwselector_real_fir_2_x1 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 3/Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_imag_fir_2_x3 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_imag_fir_2_x3;
architecture structural of xsg_bwselector_imag_fir_2_x3 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 3/Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_real_fir_2_x2 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_real_fir_2_x2;
architecture structural of xsg_bwselector_real_fir_2_x2 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_3 is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_3;
architecture structural of xsg_bwselector_fir_2_system_3 is 
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal clk_net : std_logic;
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert1_dout_net_x0 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert_dout_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  imag_fir_2 : entity xil_defaultlib.xsg_bwselector_imag_fir_2_x3 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  real_fir_2 : entity xil_defaultlib.xsg_bwselector_real_fir_2_x2 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 4/Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_imag_fir_2_x4 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_imag_fir_2_x4;
architecture structural of xsg_bwselector_imag_fir_2_x4 is 
  signal clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 4/Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_real_fir_2_x3 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_real_fir_2_x3;
architecture structural of xsg_bwselector_real_fir_2_x3 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal clk_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 4
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_4 is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_4;
architecture structural of xsg_bwselector_fir_2_system_4 is 
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert1_dout_net_x0 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert_dout_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  imag_fir_2 : entity xil_defaultlib.xsg_bwselector_imag_fir_2_x4 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  real_fir_2 : entity xil_defaultlib.xsg_bwselector_real_fir_2_x3 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 5/Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_imag_fir_2 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_imag_fir_2;
architecture structural of xsg_bwselector_imag_fir_2 is 
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 5/Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_real_fir_2_x4 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_real_fir_2_x4;
architecture structural of xsg_bwselector_real_fir_2_x4 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 5
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_5 is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_5;
architecture structural of xsg_bwselector_fir_2_system_5 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert1_dout_net_x0 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert_dout_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  imag_fir_2 : entity xil_defaultlib.xsg_bwselector_imag_fir_2 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  real_fir_2 : entity xil_defaultlib.xsg_bwselector_real_fir_2_x4 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 6/Imag FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_imag_fir_2_x5 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_imag_fir_2_x5;
architecture structural of xsg_bwselector_imag_fir_2_x5 is 
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 6/Real FIR 2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_real_fir_2_x5 is
  port (
    tvi : in std_logic;
    tdi : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvo : out std_logic;
    tdo : out std_logic_vector( 32-1 downto 0 )
  );
end xsg_bwselector_real_fir_2_x5;
architecture structural of xsg_bwselector_real_fir_2_x5 is 
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_s_axis_data_tready_net : std_logic;
begin
  tvo <= fir_compiler_7_2_m_axis_data_tvalid_net;
  tdo <= fir_compiler_7_2_m_axis_data_tdata_real_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= tvi;
  convert1_dout_net <= tdi;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_compiler_7_2 : entity xil_defaultlib.xlfir_compiler_2163b25948ec1959d2c5ebcf7f8f4abd 
  port map (
    s_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    s_axis_data_tdata_real => convert1_dout_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_s_axis_data_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_m_axis_data_tvalid_net,
    m_axis_data_tdata_real => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators/FIR 2 System 6
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fir_2_system_6 is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic;
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic;
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fir_2_system_6;
architecture structural of xsg_bwselector_fir_2_system_6 is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal ce_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tdata_real_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tdata_real_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
begin
  re_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net;
  re_data_out <= convert1_dout_net;
  im_valid_out <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  im_data_out <= convert_dout_net;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_in;
  convert1_dout_net_x0 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_in;
  convert_dout_net_x0 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  imag_fir_2 : entity xil_defaultlib.xsg_bwselector_imag_fir_2_x5 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    tdi => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net_x0
  );
  real_fir_2 : entity xil_defaultlib.xsg_bwselector_real_fir_2_x5 
  port map (
    tvi => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    tdi => convert1_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvo => fir_compiler_7_2_m_axis_data_tvalid_net,
    tdo => fir_compiler_7_2_m_axis_data_tdata_real_net
  );
  convert : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net_x0,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.xsg_bwselector_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 30,
    din_width => 32,
    dout_arith => 2,
    dout_bin_pt => 15,
    dout_width => 16,
    latency => 0,
    overflow => xlSaturate,
    quantization => xlRound
  )
  port map (
    clr => '0',
    en => "1",
    din => fir_compiler_7_2_m_axis_data_tdata_real_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Decimators
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_decimators is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_1 : out std_logic;
    re_valid_2 : out std_logic;
    re_valid_3 : out std_logic;
    re_valid_4 : out std_logic;
    re_valid_5 : out std_logic;
    re_valid_6 : out std_logic;
    re_valid_7 : out std_logic;
    re_data_1 : out std_logic_vector( 16-1 downto 0 );
    re_data_2 : out std_logic_vector( 16-1 downto 0 );
    re_data_3 : out std_logic_vector( 16-1 downto 0 );
    re_data_4 : out std_logic_vector( 16-1 downto 0 );
    re_data_5 : out std_logic_vector( 16-1 downto 0 );
    re_data_6 : out std_logic_vector( 16-1 downto 0 );
    re_data_7 : out std_logic_vector( 16-1 downto 0 );
    im_valid_1 : out std_logic;
    im_valid_2 : out std_logic;
    im_valid_3 : out std_logic;
    im_valid_4 : out std_logic;
    im_valid_5 : out std_logic;
    im_valid_6 : out std_logic;
    im_valid_7 : out std_logic;
    im_data_1 : out std_logic_vector( 16-1 downto 0 );
    im_data_2 : out std_logic_vector( 16-1 downto 0 );
    im_data_3 : out std_logic_vector( 16-1 downto 0 );
    im_data_4 : out std_logic_vector( 16-1 downto 0 );
    im_data_5 : out std_logic_vector( 16-1 downto 0 );
    im_data_6 : out std_logic_vector( 16-1 downto 0 );
    im_data_7 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_decimators;
architecture structural of xsg_bwselector_decimators is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x4 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x13 : std_logic;
  signal convert1_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x11 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x7 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x10 : std_logic;
  signal convert1_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x8 : std_logic;
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x5 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal ce_net : std_logic;
  signal convert_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x3 : std_logic;
  signal convert_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x6 : std_logic;
  signal convert_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x12 : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x14 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x9 : std_logic;
  signal convert1_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
begin
  re_valid_1 <= fir_compiler_7_2_m_axis_data_tvalid_net_x7;
  re_valid_2 <= fir_compiler_7_2_m_axis_data_tvalid_net_x10;
  re_valid_3 <= fir_compiler_7_2_m_axis_data_tvalid_net_x4;
  re_valid_4 <= fir_compiler_7_2_m_axis_data_tvalid_net_x2;
  re_valid_5 <= fir_compiler_7_2_m_axis_data_tvalid_net_x0;
  re_valid_6 <= fir_compiler_7_2_m_axis_data_tvalid_net_x13;
  re_valid_7 <= fir_compiler_7_2_m_axis_data_tvalid_net_x11;
  re_data_1 <= convert1_dout_net_x4;
  re_data_2 <= convert1_dout_net_x3;
  re_data_3 <= convert1_dout_net_x2;
  re_data_4 <= convert1_dout_net_x1;
  re_data_5 <= convert1_dout_net_x0;
  re_data_6 <= convert1_dout_net;
  re_data_7 <= convert1_dout_net_x6;
  im_valid_1 <= fir_compiler_7_2_m_axis_data_tvalid_net_x8;
  im_valid_2 <= fir_compiler_7_2_m_axis_data_tvalid_net_x6;
  im_valid_3 <= fir_compiler_7_2_m_axis_data_tvalid_net_x5;
  im_valid_4 <= fir_compiler_7_2_m_axis_data_tvalid_net_x3;
  im_valid_5 <= fir_compiler_7_2_m_axis_data_tvalid_net_x1;
  im_valid_6 <= fir_compiler_7_2_m_axis_data_tvalid_net;
  im_valid_7 <= fir_compiler_7_2_m_axis_data_tvalid_net_x12;
  im_data_1 <= convert_dout_net_x4;
  im_data_2 <= convert_dout_net_x3;
  im_data_3 <= convert_dout_net_x2;
  im_data_4 <= convert_dout_net_x1;
  im_data_5 <= convert_dout_net_x0;
  im_data_6 <= convert_dout_net;
  im_data_7 <= convert_dout_net_x6;
  fir_compiler_7_2_m_axis_data_tvalid_net_x9 <= re_valid_in;
  convert1_dout_net_x5 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x14 <= im_valid_in;
  convert_dout_net_x5 <= im_data_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  fir_2_system_0 : entity xil_defaultlib.xsg_bwselector_fir_2_system_0 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x9,
    re_data_in => convert1_dout_net_x5,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x14,
    im_data_in => convert_dout_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x7,
    re_data_out => convert1_dout_net_x4,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x8,
    im_data_out => convert_dout_net_x4
  );
  fir_2_system_1 : entity xil_defaultlib.xsg_bwselector_fir_2_system_1 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x7,
    re_data_in => convert1_dout_net_x4,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x8,
    im_data_in => convert_dout_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x10,
    re_data_out => convert1_dout_net_x3,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x6,
    im_data_out => convert_dout_net_x3
  );
  fir_2_system_2 : entity xil_defaultlib.xsg_bwselector_fir_2_system_2 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x10,
    re_data_in => convert1_dout_net_x3,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x6,
    im_data_in => convert_dout_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    re_data_out => convert1_dout_net_x2,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x5,
    im_data_out => convert_dout_net_x2
  );
  fir_2_system_3 : entity xil_defaultlib.xsg_bwselector_fir_2_system_3 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    re_data_in => convert1_dout_net_x2,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x5,
    im_data_in => convert_dout_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    re_data_out => convert1_dout_net_x1,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    im_data_out => convert_dout_net_x1
  );
  fir_2_system_4 : entity xil_defaultlib.xsg_bwselector_fir_2_system_4 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    re_data_in => convert1_dout_net_x1,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    im_data_in => convert_dout_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    re_data_out => convert1_dout_net_x0,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    im_data_out => convert_dout_net_x0
  );
  fir_2_system_5 : entity xil_defaultlib.xsg_bwselector_fir_2_system_5 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    re_data_in => convert1_dout_net_x0,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    im_data_in => convert_dout_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x13,
    re_data_out => convert1_dout_net,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net,
    im_data_out => convert_dout_net
  );
  fir_2_system_6 : entity xil_defaultlib.xsg_bwselector_fir_2_system_6 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x13,
    re_data_in => convert1_dout_net,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net,
    im_data_in => convert_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x11,
    re_data_out => convert1_dout_net_x6,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x12,
    im_data_out => convert_dout_net_x6
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch/Switch Im Data
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch_im_data is
  port (
    sel_0 : in std_logic_vector( 32-1 downto 0 );
    input_0 : in std_logic_vector( 16-1 downto 0 );
    input_1 : in std_logic_vector( 16-1 downto 0 );
    input_2 : in std_logic_vector( 16-1 downto 0 );
    input_3 : in std_logic_vector( 16-1 downto 0 );
    input_4 : in std_logic_vector( 16-1 downto 0 );
    input_5 : in std_logic_vector( 16-1 downto 0 );
    input_6 : in std_logic_vector( 16-1 downto 0 );
    input_7 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output_0 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_switch_im_data;
architecture structural of xsg_bwselector_switch_im_data is 
  signal convert_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal slice_y_net : std_logic_vector( 3-1 downto 0 );
  signal clk_net : std_logic;
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
begin
  output_0 <= mux5_y_net;
  register_q_net <= sel_0;
  convert_dout_net_x4 <= input_0;
  convert_dout_net_x3 <= input_1;
  convert_dout_net_x2 <= input_2;
  convert_dout_net_x1 <= input_3;
  convert_dout_net_x0 <= input_4;
  convert_dout_net <= input_5;
  convert_dout_net_x6 <= input_6;
  convert_dout_net_x5 <= input_7;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux1 : entity xil_defaultlib.sysgen_mux_35b2df22fc 
  port map (
    clr => '0',
    sel => slice_y_net,
    d0 => convert_dout_net_x4,
    d1 => convert_dout_net_x4,
    d2 => convert_dout_net_x3,
    d3 => convert_dout_net_x2,
    d4 => convert_dout_net_x1,
    d5 => convert_dout_net_x0,
    d6 => convert_dout_net,
    d7 => convert_dout_net_x6,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux5 : entity xil_defaultlib.sysgen_mux_7f041165db 
  port map (
    clr => '0',
    sel => register1_q_net,
    d0 => mux1_y_net,
    d1 => register_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux5_y_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert_dout_net_x5,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net_x0
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => slice1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  slice : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 2,
    x_width => 32,
    y_width => 3
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 3,
    new_msb => 3,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch/Switch Im Valid
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch_im_valid is
  port (
    sel_0 : in std_logic_vector( 32-1 downto 0 );
    input_0 : in std_logic;
    input_1 : in std_logic;
    input_2 : in std_logic;
    input_3 : in std_logic;
    input_4 : in std_logic;
    input_5 : in std_logic;
    input_6 : in std_logic;
    input_7 : in std_logic;
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output_0 : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_switch_im_valid;
architecture structural of xsg_bwselector_switch_im_valid is 
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x4 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x6 : std_logic;
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x3 : std_logic;
  signal mux5_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 3-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x5 : std_logic;
  signal clk_net : std_logic;
begin
  output_0 <= mux5_y_net;
  register_q_net <= sel_0;
  fir_compiler_7_2_m_axis_data_tvalid_net_x4 <= input_0;
  fir_compiler_7_2_m_axis_data_tvalid_net_x3 <= input_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= input_2;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= input_3;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= input_4;
  fir_compiler_7_2_m_axis_data_tvalid_net <= input_5;
  fir_compiler_7_2_m_axis_data_tvalid_net_x6 <= input_6;
  fir_compiler_7_2_m_axis_data_tvalid_net_x5 <= input_7;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux1 : entity xil_defaultlib.sysgen_mux_55a94068fd 
  port map (
    clr => '0',
    sel => slice_y_net,
    d0(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    d2(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    d3(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    d4(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    d5(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    d6(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    d7(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x6,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux5 : entity xil_defaultlib.sysgen_mux_eb0d4b73f8 
  port map (
    clr => '0',
    sel => register1_q_net,
    d0 => mux1_y_net,
    d1 => register_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux5_y_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x5,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net_x0
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => slice1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  slice : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 2,
    x_width => 32,
    y_width => 3
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 3,
    new_msb => 3,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch/Switch Re Data
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch_re_data is
  port (
    sel_0 : in std_logic_vector( 32-1 downto 0 );
    input_0 : in std_logic_vector( 16-1 downto 0 );
    input_1 : in std_logic_vector( 16-1 downto 0 );
    input_2 : in std_logic_vector( 16-1 downto 0 );
    input_3 : in std_logic_vector( 16-1 downto 0 );
    input_4 : in std_logic_vector( 16-1 downto 0 );
    input_5 : in std_logic_vector( 16-1 downto 0 );
    input_6 : in std_logic_vector( 16-1 downto 0 );
    input_7 : in std_logic_vector( 16-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output_0 : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_switch_re_data;
architecture structural of xsg_bwselector_switch_re_data is 
  signal convert1_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal slice_y_net : std_logic_vector( 3-1 downto 0 );
  signal ce_net : std_logic;
  signal mux1_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
begin
  output_0 <= mux5_y_net;
  register_q_net <= sel_0;
  convert1_dout_net_x4 <= input_0;
  convert1_dout_net_x3 <= input_1;
  convert1_dout_net_x2 <= input_2;
  convert1_dout_net_x1 <= input_3;
  convert1_dout_net_x0 <= input_4;
  convert1_dout_net <= input_5;
  convert1_dout_net_x6 <= input_6;
  convert1_dout_net_x5 <= input_7;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux1 : entity xil_defaultlib.sysgen_mux_35b2df22fc 
  port map (
    clr => '0',
    sel => slice_y_net,
    d0 => convert1_dout_net_x4,
    d1 => convert1_dout_net_x4,
    d2 => convert1_dout_net_x3,
    d3 => convert1_dout_net_x2,
    d4 => convert1_dout_net_x1,
    d5 => convert1_dout_net_x0,
    d6 => convert1_dout_net,
    d7 => convert1_dout_net_x6,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux5 : entity xil_defaultlib.sysgen_mux_7f041165db 
  port map (
    clr => '0',
    sel => register1_q_net,
    d0 => mux1_y_net,
    d1 => register_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux5_y_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 16,
    init_value => b"0000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => convert1_dout_net_x5,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net_x0
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => slice1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  slice : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 2,
    x_width => 32,
    y_width => 3
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 3,
    new_msb => 3,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch/Switch Re Valid
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch_re_valid is
  port (
    sel_0 : in std_logic_vector( 32-1 downto 0 );
    input_0 : in std_logic;
    input_1 : in std_logic;
    input_2 : in std_logic;
    input_3 : in std_logic;
    input_4 : in std_logic;
    input_5 : in std_logic;
    input_6 : in std_logic;
    input_7 : in std_logic;
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    output_0 : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_switch_re_valid;
architecture structural of xsg_bwselector_switch_re_valid is 
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x3 : std_logic;
  signal mux5_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x4 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal slice_y_net : std_logic_vector( 3-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x6 : std_logic;
  signal mux1_y_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x5 : std_logic;
begin
  output_0 <= mux5_y_net;
  register_q_net <= sel_0;
  fir_compiler_7_2_m_axis_data_tvalid_net_x4 <= input_0;
  fir_compiler_7_2_m_axis_data_tvalid_net_x3 <= input_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= input_2;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= input_3;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= input_4;
  fir_compiler_7_2_m_axis_data_tvalid_net <= input_5;
  fir_compiler_7_2_m_axis_data_tvalid_net_x6 <= input_6;
  fir_compiler_7_2_m_axis_data_tvalid_net_x5 <= input_7;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux1 : entity xil_defaultlib.sysgen_mux_55a94068fd 
  port map (
    clr => '0',
    sel => slice_y_net,
    d0(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    d1(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    d2(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    d3(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    d4(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    d5(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    d6(0) => fir_compiler_7_2_m_axis_data_tvalid_net,
    d7(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x6,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux5 : entity xil_defaultlib.sysgen_mux_eb0d4b73f8 
  port map (
    clr => '0',
    sel => register1_q_net,
    d0 => mux1_y_net,
    d1 => register_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux5_y_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d(0) => fir_compiler_7_2_m_axis_data_tvalid_net_x5,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net_x0
  );
  register1 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => slice1_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  slice : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 2,
    x_width => 32,
    y_width => 3
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.xsg_bwselector_xlslice 
  generic map (
    new_lsb => 3,
    new_msb => 3,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator/Switch
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_switch is
  port (
    re_valid_0 : in std_logic;
    re_valid_1 : in std_logic;
    re_valid_2 : in std_logic;
    re_valid_3 : in std_logic;
    re_valid_4 : in std_logic;
    re_valid_5 : in std_logic;
    re_valid_6 : in std_logic;
    re_valid_7 : in std_logic;
    re_data_0 : in std_logic_vector( 16-1 downto 0 );
    re_data_1 : in std_logic_vector( 16-1 downto 0 );
    re_data_2 : in std_logic_vector( 16-1 downto 0 );
    re_data_3 : in std_logic_vector( 16-1 downto 0 );
    re_data_4 : in std_logic_vector( 16-1 downto 0 );
    re_data_5 : in std_logic_vector( 16-1 downto 0 );
    re_data_6 : in std_logic_vector( 16-1 downto 0 );
    re_data_7 : in std_logic_vector( 16-1 downto 0 );
    im_valid_0 : in std_logic;
    im_valid_1 : in std_logic;
    im_valid_2 : in std_logic;
    im_valid_3 : in std_logic;
    im_valid_4 : in std_logic;
    im_valid_5 : in std_logic;
    im_valid_6 : in std_logic;
    im_valid_7 : in std_logic;
    im_data_0 : in std_logic_vector( 16-1 downto 0 );
    im_data_1 : in std_logic_vector( 16-1 downto 0 );
    im_data_2 : in std_logic_vector( 16-1 downto 0 );
    im_data_3 : in std_logic_vector( 16-1 downto 0 );
    im_data_4 : in std_logic_vector( 16-1 downto 0 );
    im_data_5 : in std_logic_vector( 16-1 downto 0 );
    im_data_6 : in std_logic_vector( 16-1 downto 0 );
    im_data_7 : in std_logic_vector( 16-1 downto 0 );
    sel : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_switch;
architecture structural of xsg_bwselector_switch is 
  signal mux5_y_net_x2 : std_logic_vector( 1-1 downto 0 );
  signal mux5_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux5_y_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x12 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x11 : std_logic;
  signal mux5_y_net : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x8 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x14 : std_logic;
  signal convert_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x7 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x3 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x13 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x10 : std_logic;
  signal convert_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert1_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x4 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x9 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x5 : std_logic;
  signal convert1_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x6 : std_logic;
  signal ce_net : std_logic;
begin
  re_valid_out <= mux5_y_net_x2;
  re_data_out <= mux5_y_net;
  im_valid_out <= mux5_y_net_x0;
  im_data_out <= mux5_y_net_x1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x12 <= re_valid_0;
  fir_compiler_7_2_m_axis_data_tvalid_net_x11 <= re_valid_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x9 <= re_valid_2;
  fir_compiler_7_2_m_axis_data_tvalid_net_x7 <= re_valid_3;
  fir_compiler_7_2_m_axis_data_tvalid_net_x5 <= re_valid_4;
  fir_compiler_7_2_m_axis_data_tvalid_net_x3 <= re_valid_5;
  fir_compiler_7_2_m_axis_data_tvalid_net_x1 <= re_valid_6;
  fir_compiler_7_2_m_axis_data_tvalid_net <= re_valid_7;
  convert1_dout_net_x6 <= re_data_0;
  convert1_dout_net_x5 <= re_data_1;
  convert1_dout_net_x4 <= re_data_2;
  convert1_dout_net_x3 <= re_data_3;
  convert1_dout_net_x2 <= re_data_4;
  convert1_dout_net_x1 <= re_data_5;
  convert1_dout_net_x0 <= re_data_6;
  convert1_dout_net <= re_data_7;
  fir_compiler_7_2_m_axis_data_tvalid_net_x13 <= im_valid_0;
  fir_compiler_7_2_m_axis_data_tvalid_net_x14 <= im_valid_1;
  fir_compiler_7_2_m_axis_data_tvalid_net_x10 <= im_valid_2;
  fir_compiler_7_2_m_axis_data_tvalid_net_x8 <= im_valid_3;
  fir_compiler_7_2_m_axis_data_tvalid_net_x6 <= im_valid_4;
  fir_compiler_7_2_m_axis_data_tvalid_net_x4 <= im_valid_5;
  fir_compiler_7_2_m_axis_data_tvalid_net_x2 <= im_valid_6;
  fir_compiler_7_2_m_axis_data_tvalid_net_x0 <= im_valid_7;
  convert_dout_net_x6 <= im_data_0;
  convert_dout_net_x5 <= im_data_1;
  convert_dout_net_x3 <= im_data_2;
  convert_dout_net_x2 <= im_data_3;
  convert_dout_net_x4 <= im_data_4;
  convert_dout_net_x1 <= im_data_5;
  convert_dout_net_x0 <= im_data_6;
  convert_dout_net <= im_data_7;
  register_q_net <= sel;
  clk_net <= clk_1;
  ce_net <= ce_1;
  switch_im_data : entity xil_defaultlib.xsg_bwselector_switch_im_data 
  port map (
    sel_0 => register_q_net,
    input_0 => convert_dout_net_x6,
    input_1 => convert_dout_net_x5,
    input_2 => convert_dout_net_x3,
    input_3 => convert_dout_net_x2,
    input_4 => convert_dout_net_x4,
    input_5 => convert_dout_net_x1,
    input_6 => convert_dout_net_x0,
    input_7 => convert_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output_0 => mux5_y_net_x1
  );
  switch_im_valid : entity xil_defaultlib.xsg_bwselector_switch_im_valid 
  port map (
    sel_0 => register_q_net,
    input_0 => fir_compiler_7_2_m_axis_data_tvalid_net_x13,
    input_1 => fir_compiler_7_2_m_axis_data_tvalid_net_x14,
    input_2 => fir_compiler_7_2_m_axis_data_tvalid_net_x10,
    input_3 => fir_compiler_7_2_m_axis_data_tvalid_net_x8,
    input_4 => fir_compiler_7_2_m_axis_data_tvalid_net_x6,
    input_5 => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    input_6 => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    input_7 => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output_0 => mux5_y_net_x0
  );
  switch_re_data : entity xil_defaultlib.xsg_bwselector_switch_re_data 
  port map (
    sel_0 => register_q_net,
    input_0 => convert1_dout_net_x6,
    input_1 => convert1_dout_net_x5,
    input_2 => convert1_dout_net_x4,
    input_3 => convert1_dout_net_x3,
    input_4 => convert1_dout_net_x2,
    input_5 => convert1_dout_net_x1,
    input_6 => convert1_dout_net_x0,
    input_7 => convert1_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output_0 => mux5_y_net
  );
  switch_re_valid : entity xil_defaultlib.xsg_bwselector_switch_re_valid 
  port map (
    sel_0 => register_q_net,
    input_0 => fir_compiler_7_2_m_axis_data_tvalid_net_x12,
    input_1 => fir_compiler_7_2_m_axis_data_tvalid_net_x11,
    input_2 => fir_compiler_7_2_m_axis_data_tvalid_net_x9,
    input_3 => fir_compiler_7_2_m_axis_data_tvalid_net_x7,
    input_4 => fir_compiler_7_2_m_axis_data_tvalid_net_x5,
    input_5 => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    input_6 => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    input_7 => fir_compiler_7_2_m_axis_data_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    output_0 => mux5_y_net_x2
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Fine Decimator
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_fine_decimator is
  port (
    re_valid_in : in std_logic;
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic;
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    decimation : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 16-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 16-1 downto 0 )
  );
end xsg_bwselector_fine_decimator;
architecture structural of xsg_bwselector_fine_decimator is 
  signal ce_net : std_logic;
  signal convert_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x13 : std_logic;
  signal convert1_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal mux5_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x6 : std_logic;
  signal convert_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal convert_dout_net_x4 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x14 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x9 : std_logic;
  signal convert1_dout_net_x6 : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal mux5_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal convert1_dout_net_x5 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x3 : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x12 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x10 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x5 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x11 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x4 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal convert_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x1 : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x8 : std_logic;
  signal convert_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal clk_net : std_logic;
  signal convert1_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x2 : std_logic;
  signal convert1_dout_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x7 : std_logic;
  signal convert1_dout_net_x3 : std_logic_vector( 16-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux5_y_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 1-1 downto 0 );
begin
  re_valid_out <= mux5_y_net;
  re_data_out <= mux5_y_net_x0;
  im_valid_out <= mux5_y_net_x1;
  im_data_out <= mux5_y_net_x2;
  fir_compiler_7_2_m_axis_data_tvalid_net_x13 <= re_valid_in;
  convert1_dout_net_x6 <= re_data_in;
  fir_compiler_7_2_m_axis_data_tvalid_net_x14 <= im_valid_in;
  convert_dout_net_x5 <= im_data_in;
  register_q_net <= decimation;
  clk_net <= clk_1;
  ce_net <= ce_1;
  decimators : entity xil_defaultlib.xsg_bwselector_decimators 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x13,
    re_data_in => convert1_dout_net_x6,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x14,
    im_data_in => convert_dout_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_1 => fir_compiler_7_2_m_axis_data_tvalid_net_x10,
    re_valid_2 => fir_compiler_7_2_m_axis_data_tvalid_net_x9,
    re_valid_3 => fir_compiler_7_2_m_axis_data_tvalid_net_x7,
    re_valid_4 => fir_compiler_7_2_m_axis_data_tvalid_net_x5,
    re_valid_5 => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    re_valid_6 => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    re_valid_7 => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_data_1 => convert1_dout_net_x5,
    re_data_2 => convert1_dout_net_x4,
    re_data_3 => convert1_dout_net_x3,
    re_data_4 => convert1_dout_net_x2,
    re_data_5 => convert1_dout_net_x1,
    re_data_6 => convert1_dout_net_x0,
    re_data_7 => convert1_dout_net,
    im_valid_1 => fir_compiler_7_2_m_axis_data_tvalid_net_x11,
    im_valid_2 => fir_compiler_7_2_m_axis_data_tvalid_net_x12,
    im_valid_3 => fir_compiler_7_2_m_axis_data_tvalid_net_x8,
    im_valid_4 => fir_compiler_7_2_m_axis_data_tvalid_net_x6,
    im_valid_5 => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    im_valid_6 => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    im_valid_7 => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    im_data_1 => convert_dout_net_x6,
    im_data_2 => convert_dout_net_x4,
    im_data_3 => convert_dout_net_x3,
    im_data_4 => convert_dout_net_x2,
    im_data_5 => convert_dout_net_x1,
    im_data_6 => convert_dout_net_x0,
    im_data_7 => convert_dout_net
  );
  switch : entity xil_defaultlib.xsg_bwselector_switch 
  port map (
    re_valid_0 => fir_compiler_7_2_m_axis_data_tvalid_net_x13,
    re_valid_1 => fir_compiler_7_2_m_axis_data_tvalid_net_x10,
    re_valid_2 => fir_compiler_7_2_m_axis_data_tvalid_net_x9,
    re_valid_3 => fir_compiler_7_2_m_axis_data_tvalid_net_x7,
    re_valid_4 => fir_compiler_7_2_m_axis_data_tvalid_net_x5,
    re_valid_5 => fir_compiler_7_2_m_axis_data_tvalid_net_x3,
    re_valid_6 => fir_compiler_7_2_m_axis_data_tvalid_net_x1,
    re_valid_7 => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_data_0 => convert1_dout_net_x6,
    re_data_1 => convert1_dout_net_x5,
    re_data_2 => convert1_dout_net_x4,
    re_data_3 => convert1_dout_net_x3,
    re_data_4 => convert1_dout_net_x2,
    re_data_5 => convert1_dout_net_x1,
    re_data_6 => convert1_dout_net_x0,
    re_data_7 => convert1_dout_net,
    im_valid_0 => fir_compiler_7_2_m_axis_data_tvalid_net_x14,
    im_valid_1 => fir_compiler_7_2_m_axis_data_tvalid_net_x11,
    im_valid_2 => fir_compiler_7_2_m_axis_data_tvalid_net_x12,
    im_valid_3 => fir_compiler_7_2_m_axis_data_tvalid_net_x8,
    im_valid_4 => fir_compiler_7_2_m_axis_data_tvalid_net_x6,
    im_valid_5 => fir_compiler_7_2_m_axis_data_tvalid_net_x4,
    im_valid_6 => fir_compiler_7_2_m_axis_data_tvalid_net_x2,
    im_valid_7 => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    im_data_0 => convert_dout_net_x5,
    im_data_1 => convert_dout_net_x6,
    im_data_2 => convert_dout_net_x4,
    im_data_3 => convert_dout_net_x3,
    im_data_4 => convert_dout_net_x2,
    im_data_5 => convert_dout_net_x1,
    im_data_6 => convert_dout_net_x0,
    im_data_7 => convert_dout_net,
    sel => register_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => mux5_y_net,
    re_data_out => mux5_y_net_x0,
    im_valid_out => mux5_y_net_x1,
    im_data_out => mux5_y_net_x2
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/SSR Switch
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_ssr_switch is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 128-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in : in std_logic_vector( 128-1 downto 0 );
    ssr_re_valid_in : in std_logic_vector( 1-1 downto 0 );
    ssr_re_data_in : in std_logic_vector( 128-1 downto 0 );
    ssr_im_valid_in : in std_logic_vector( 1-1 downto 0 );
    ssr_im_data_in : in std_logic_vector( 128-1 downto 0 );
    decimation : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_ssr_switch;
architecture structural of xsg_bwselector_ssr_switch is 
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux5_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal clk_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 128-1 downto 0 );
begin
  re_valid_out <= mux_y_net;
  re_data_out <= mux1_y_net;
  im_valid_out <= mux2_y_net;
  im_data_out <= mux3_y_net;
  mux5_y_net <= re_valid_in;
  concat_y_net <= re_data_in;
  mux5_y_net_x0 <= im_valid_in;
  concat1_y_net <= im_data_in;
  register3_q_net <= ssr_re_valid_in;
  reinterpret_output_port_net <= ssr_re_data_in;
  register2_q_net <= ssr_im_valid_in;
  reinterpret1_output_port_net <= ssr_im_data_in;
  relational_op_net <= decimation;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mux : entity xil_defaultlib.sysgen_mux_1a4ba3d9a5 
  port map (
    clr => '0',
    sel => relational_op_net,
    d0 => register3_q_net,
    d1 => mux5_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  mux1 : entity xil_defaultlib.sysgen_mux_e03597c965 
  port map (
    clr => '0',
    sel => relational_op_net,
    d0 => reinterpret_output_port_net,
    d1 => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux1_y_net
  );
  mux2 : entity xil_defaultlib.sysgen_mux_1a4ba3d9a5 
  port map (
    clr => '0',
    sel => relational_op_net,
    d0 => register2_q_net,
    d1 => mux5_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    y => mux2_y_net
  );
  mux3 : entity xil_defaultlib.sysgen_mux_e03597c965 
  port map (
    clr => '0',
    sel => relational_op_net,
    d0 => reinterpret1_output_port_net,
    d1 => concat1_y_net,
    clk => clk_net,
    ce => ce_net,
    y => mux3_y_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core/Scalar Converter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_scalar_converter is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 16-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in : in std_logic_vector( 16-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_scalar_converter;
architecture structural of xsg_bwselector_scalar_converter is 
  signal mux5_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux5_y_net_x0 : std_logic_vector( 16-1 downto 0 );
  signal mux5_y_net_x2 : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 112-1 downto 0 );
begin
  re_data_out <= concat_y_net;
  im_data_out <= concat1_y_net;
  mux5_y_net <= re_valid_in;
  mux5_y_net_x0 <= re_data_in;
  mux5_y_net_x1 <= im_valid_in;
  mux5_y_net_x2 <= im_data_in;
  concat : entity xil_defaultlib.sysgen_concat_b05fc24dc2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => reinterpret_output_port_net,
    y => concat_y_net
  );
  concat1 : entity xil_defaultlib.sysgen_concat_b05fc24dc2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => constant_op_net,
    in1 => reinterpret1_output_port_net,
    y => concat1_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_1ff53682d3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux5_y_net_x0,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_3f7a2a62b5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => mux5_y_net_x2,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector/Bandwidth Selector Core
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_bandwidth_selector_core is
  port (
    re_valid_in : in std_logic_vector( 1-1 downto 0 );
    re_data_in : in std_logic_vector( 128-1 downto 0 );
    im_valid_in : in std_logic_vector( 1-1 downto 0 );
    im_data_in : in std_logic_vector( 128-1 downto 0 );
    decimation : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    re_valid_out : out std_logic_vector( 1-1 downto 0 );
    re_data_out : out std_logic_vector( 128-1 downto 0 );
    im_valid_out : out std_logic_vector( 1-1 downto 0 );
    im_data_out : out std_logic_vector( 128-1 downto 0 )
  );
end xsg_bwselector_bandwidth_selector_core;
architecture structural of xsg_bwselector_bandwidth_selector_core is 
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 16-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 128-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_m_axis_data_tvalid_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 128-1 downto 0 );
  signal ce_net : std_logic;
  signal convert1_dout_net : std_logic_vector( 16-1 downto 0 );
  signal fir_compiler_7_2_m_axis_data_tvalid_net_x0 : std_logic;
  signal mux5_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux5_y_net_x1 : std_logic_vector( 16-1 downto 0 );
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal mux5_y_net_x2 : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 128-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 128-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux5_y_net : std_logic_vector( 16-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
begin
  re_valid_out <= mux_y_net;
  re_data_out <= mux1_y_net;
  im_valid_out <= mux2_y_net;
  im_data_out <= mux3_y_net;
  register3_q_net <= re_valid_in;
  reinterpret_output_port_net <= re_data_in;
  register2_q_net <= im_valid_in;
  reinterpret1_output_port_net <= im_data_in;
  register_q_net <= decimation;
  clk_net <= clk_1;
  ce_net <= ce_1;
  coarse_decimator : entity xil_defaultlib.xsg_bwselector_coarse_decimator 
  port map (
    re_valid_in => register3_q_net,
    re_data_in => reinterpret_output_port_net,
    im_valid_in => register2_q_net,
    im_data_in => reinterpret1_output_port_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_data_out => convert1_dout_net,
    im_valid_out => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    im_data_out => convert_dout_net
  );
  fine_decimator : entity xil_defaultlib.xsg_bwselector_fine_decimator 
  port map (
    re_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net,
    re_data_in => convert1_dout_net,
    im_valid_in => fir_compiler_7_2_m_axis_data_tvalid_net_x0,
    im_data_in => convert_dout_net,
    decimation => register_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => mux5_y_net_x0,
    re_data_out => mux5_y_net_x1,
    im_valid_out => mux5_y_net_x2,
    im_data_out => mux5_y_net
  );
  ssr_switch : entity xil_defaultlib.xsg_bwselector_ssr_switch 
  port map (
    re_valid_in => mux5_y_net_x0,
    re_data_in => concat_y_net,
    im_valid_in => mux5_y_net_x2,
    im_data_in => concat1_y_net,
    ssr_re_valid_in => register3_q_net,
    ssr_re_data_in => reinterpret_output_port_net,
    ssr_im_valid_in => register2_q_net,
    ssr_im_data_in => reinterpret1_output_port_net,
    decimation => relational_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => mux_y_net,
    re_data_out => mux1_y_net,
    im_valid_out => mux2_y_net,
    im_data_out => mux3_y_net
  );
  scalar_converter : entity xil_defaultlib.xsg_bwselector_scalar_converter 
  port map (
    re_valid_in => mux5_y_net_x0,
    re_data_in => mux5_y_net_x1,
    im_valid_in => mux5_y_net_x2,
    im_data_in => mux5_y_net,
    re_data_out => concat_y_net,
    im_data_out => concat1_y_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_e15eed17da 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  relational : entity xil_defaultlib.sysgen_relational_dc450e9729 
  port map (
    clr => '0',
    a => register_q_net,
    b => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector/Bandwidth Selector
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_bandwidth_selector is
  port (
    s_axi_decimation : in std_logic_vector( 32-1 downto 0 );
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_bandwidth_selector;
architecture structural of xsg_bwselector_bandwidth_selector is 
  signal register2_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal mux3_y_net : std_logic_vector( 128-1 downto 0 );
  signal mux1_y_net : std_logic_vector( 128-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 128-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 128-1 downto 0 );
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal mux2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net_x0 : std_logic_vector( 128-1 downto 0 );
  signal s_axi_decimation_net : std_logic_vector( 32-1 downto 0 );
  signal ce_net : std_logic;
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_re_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
begin
  s_axi_decimation_net <= s_axi_decimation;
  m_axis_im_tdata <= register3_q_net_x0;
  m_axis_im_tvalid <= register2_q_net_x0;
  m_axis_re_tdata <= register1_q_net;
  m_axis_re_tvalid <= register_q_net_x0;
  s_axis_im_tdata_net <= s_axis_im_tdata;
  s_axis_im_tready <= constant_op_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tdata_net <= s_axis_re_tdata;
  s_axis_re_tready <= constant_op_net;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  axi_stream_master_interface : entity xil_defaultlib.xsg_bwselector_axi_stream_master_interface 
  port map (
    re_valid_in => mux_y_net,
    re_data_in => mux1_y_net,
    im_valid_in => mux2_y_net,
    im_data_in => mux3_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_im_tdata => register3_q_net_x0,
    m_axis_im_tvalid => register2_q_net_x0,
    m_axis_re_tdata => register1_q_net,
    m_axis_re_tvalid => register_q_net_x0
  );
  axi_stream_slave_interface : entity xil_defaultlib.xsg_bwselector_axi_stream_slave_interface 
  port map (
    s_axis_im_tdata => s_axis_im_tdata_net,
    s_axis_im_tvalid => s_axis_im_tvalid_net,
    s_axis_re_tdata => s_axis_re_tdata_net,
    s_axis_re_tvalid => s_axis_re_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => register3_q_net,
    re_data_out => reinterpret_output_port_net,
    im_valid_out => register2_q_net,
    im_data_out => reinterpret1_output_port_net,
    s_axis_im_tready => constant_op_net,
    s_axis_re_tready => constant_op_net
  );
  bandwidth_selector_core : entity xil_defaultlib.xsg_bwselector_bandwidth_selector_core 
  port map (
    re_valid_in => register3_q_net,
    re_data_in => reinterpret_output_port_net,
    im_valid_in => register2_q_net,
    im_data_in => reinterpret1_output_port_net,
    decimation => register_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    re_valid_out => mux_y_net,
    re_data_out => mux1_y_net,
    im_valid_out => mux2_y_net,
    im_data_out => mux3_y_net
  );
  register_x0 : entity xil_defaultlib.xsg_bwselector_xlregister 
  generic map (
    d_width => 32,
    init_value => b"00000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => s_axi_decimation_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
end structural;
-- Generated from Simulink block xsg_bwselector_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_struct is
  port (
    s_axi_decimation : in std_logic_vector( 32-1 downto 0 );
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 )
  );
end xsg_bwselector_struct;
architecture structural of xsg_bwselector_struct is 
  signal s_axi_decimation_net : std_logic_vector( 32-1 downto 0 );
  signal register3_q_net : std_logic_vector( 128-1 downto 0 );
  signal register2_q_net : std_logic_vector( 1-1 downto 0 );
  signal register1_q_net : std_logic_vector( 128-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_im_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_re_tdata_net : std_logic_vector( 128-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal s_axis_re_tvalid_net : std_logic_vector( 1-1 downto 0 );
begin
  s_axi_decimation_net <= s_axi_decimation;
  m_axis_im_tdata <= register3_q_net;
  m_axis_im_tvalid <= register2_q_net;
  m_axis_re_tdata <= register1_q_net;
  m_axis_re_tvalid <= register_q_net;
  s_axis_im_tdata_net <= s_axis_im_tdata;
  s_axis_im_tready <= constant_op_net;
  s_axis_im_tvalid_net <= s_axis_im_tvalid;
  s_axis_re_tdata_net <= s_axis_re_tdata;
  s_axis_re_tready <= constant_op_net;
  s_axis_re_tvalid_net <= s_axis_re_tvalid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  bandwidth_selector : entity xil_defaultlib.xsg_bwselector_bandwidth_selector 
  port map (
    s_axi_decimation => s_axi_decimation_net,
    s_axis_im_tdata => s_axis_im_tdata_net,
    s_axis_im_tvalid => s_axis_im_tvalid_net,
    s_axis_re_tdata => s_axis_re_tdata_net,
    s_axis_re_tvalid => s_axis_re_tvalid_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_im_tdata => register3_q_net,
    m_axis_im_tvalid => register2_q_net,
    m_axis_re_tdata => register1_q_net,
    m_axis_re_tvalid => register_q_net,
    s_axis_im_tready => constant_op_net,
    s_axis_re_tready => constant_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector_default_clock_driver is
  port (
    xsg_bwselector_sysclk : in std_logic;
    xsg_bwselector_sysce : in std_logic;
    xsg_bwselector_sysclr : in std_logic;
    xsg_bwselector_clk1 : out std_logic;
    xsg_bwselector_ce1 : out std_logic
  );
end xsg_bwselector_default_clock_driver;
architecture structural of xsg_bwselector_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => xsg_bwselector_sysclk,
    sysce => xsg_bwselector_sysce,
    sysclr => xsg_bwselector_sysclr,
    clk => xsg_bwselector_clk1,
    ce => xsg_bwselector_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity xsg_bwselector is
  port (
    s_axis_im_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_im_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_re_tdata : in std_logic_vector( 128-1 downto 0 );
    s_axis_re_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    xsg_bwselector_aresetn : in std_logic;
    xsg_bwselector_s_axi_awaddr : in std_logic;
    xsg_bwselector_s_axi_awvalid : in std_logic;
    xsg_bwselector_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    xsg_bwselector_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    xsg_bwselector_s_axi_wvalid : in std_logic;
    xsg_bwselector_s_axi_bready : in std_logic;
    xsg_bwselector_s_axi_araddr : in std_logic;
    xsg_bwselector_s_axi_arvalid : in std_logic;
    xsg_bwselector_s_axi_rready : in std_logic;
    m_axis_im_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_im_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_re_tdata : out std_logic_vector( 128-1 downto 0 );
    m_axis_re_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_im_tready : out std_logic_vector( 1-1 downto 0 );
    s_axis_re_tready : out std_logic_vector( 1-1 downto 0 );
    xsg_bwselector_s_axi_awready : out std_logic;
    xsg_bwselector_s_axi_wready : out std_logic;
    xsg_bwselector_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    xsg_bwselector_s_axi_bvalid : out std_logic;
    xsg_bwselector_s_axi_arready : out std_logic;
    xsg_bwselector_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    xsg_bwselector_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    xsg_bwselector_s_axi_rvalid : out std_logic
  );
end xsg_bwselector;
architecture structural of xsg_bwselector is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "xsg_bwselector,sysgen_core_2020_1,{,compilation=IP Catalog,block_icon_display=Default,family=zynquplusRFSOC,part=xczu28dr,speed=-2-e,package=ffvg1517,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=3.90625,system_simulink_period=3.90625e-09,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=1.6e-05,concat=2,constant=3,convert=16,fir_compiler_v7_2=16,mux=12,register=17,reinterpret=8,relational=1,slice=14,}";
  signal s_axi_decimation : std_logic_vector( 32-1 downto 0 );
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
  signal clk_net : std_logic;
begin
  xsg_bwselector_axi_lite_interface : entity xil_defaultlib.xsg_bwselector_axi_lite_interface 
  port map (
    xsg_bwselector_s_axi_awaddr => xsg_bwselector_s_axi_awaddr,
    xsg_bwselector_s_axi_awvalid => xsg_bwselector_s_axi_awvalid,
    xsg_bwselector_s_axi_wdata => xsg_bwselector_s_axi_wdata,
    xsg_bwselector_s_axi_wstrb => xsg_bwselector_s_axi_wstrb,
    xsg_bwselector_s_axi_wvalid => xsg_bwselector_s_axi_wvalid,
    xsg_bwselector_s_axi_bready => xsg_bwselector_s_axi_bready,
    xsg_bwselector_s_axi_araddr => xsg_bwselector_s_axi_araddr,
    xsg_bwselector_s_axi_arvalid => xsg_bwselector_s_axi_arvalid,
    xsg_bwselector_s_axi_rready => xsg_bwselector_s_axi_rready,
    xsg_bwselector_aresetn => xsg_bwselector_aresetn,
    xsg_bwselector_aclk => clk,
    s_axi_decimation => s_axi_decimation,
    xsg_bwselector_s_axi_awready => xsg_bwselector_s_axi_awready,
    xsg_bwselector_s_axi_wready => xsg_bwselector_s_axi_wready,
    xsg_bwselector_s_axi_bresp => xsg_bwselector_s_axi_bresp,
    xsg_bwselector_s_axi_bvalid => xsg_bwselector_s_axi_bvalid,
    xsg_bwselector_s_axi_arready => xsg_bwselector_s_axi_arready,
    xsg_bwselector_s_axi_rdata => xsg_bwselector_s_axi_rdata,
    xsg_bwselector_s_axi_rresp => xsg_bwselector_s_axi_rresp,
    xsg_bwselector_s_axi_rvalid => xsg_bwselector_s_axi_rvalid,
    clk => clk_net
  );
  xsg_bwselector_default_clock_driver : entity xil_defaultlib.xsg_bwselector_default_clock_driver 
  port map (
    xsg_bwselector_sysclk => clk_net,
    xsg_bwselector_sysce => '1',
    xsg_bwselector_sysclr => '0',
    xsg_bwselector_clk1 => clk_1_net,
    xsg_bwselector_ce1 => ce_1_net
  );
  xsg_bwselector_struct : entity xil_defaultlib.xsg_bwselector_struct 
  port map (
    s_axi_decimation => s_axi_decimation,
    s_axis_im_tdata => s_axis_im_tdata,
    s_axis_im_tvalid => s_axis_im_tvalid,
    s_axis_re_tdata => s_axis_re_tdata,
    s_axis_re_tvalid => s_axis_re_tvalid,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    m_axis_im_tdata => m_axis_im_tdata,
    m_axis_im_tvalid => m_axis_im_tvalid,
    m_axis_re_tdata => m_axis_re_tdata,
    m_axis_re_tvalid => m_axis_re_tvalid,
    s_axis_im_tready => s_axis_im_tready,
    s_axis_re_tready => s_axis_re_tready
  );
end structural;
