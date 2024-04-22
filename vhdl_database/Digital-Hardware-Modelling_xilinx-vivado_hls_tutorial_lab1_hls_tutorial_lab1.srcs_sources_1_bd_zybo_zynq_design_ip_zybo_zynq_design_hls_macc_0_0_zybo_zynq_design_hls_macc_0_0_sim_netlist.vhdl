-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sun Sep 22 02:34:40 2019
-- Host        : varun-laptop running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               d:/github/Digital-Hardware-Modelling/xilinx-vivado/hls_tutorial_lab1/hls_tutorial_lab1.srcs/sources_1/bd/zybo_zynq_design/ip/zybo_zynq_design_hls_macc_0_0/zybo_zynq_design_hls_macc_0_0_sim_netlist.vhdl
-- Design      : zybo_zynq_design_hls_macc_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zybo_zynq_design_hls_macc_0_0_hls_macc_HLS_MACC_PERIPH_BUS_s_axi is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_RVALID : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    interrupt : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \a_reg0_reg[31]\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \buff2_reg__0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \accum_clr_read_reg_85_reg[0]\ : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_ARVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_RREADY : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_AWVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_WVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \ap_CS_fsm_reg[4]\ : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_BREADY : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    accum_clr_read_reg_85 : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \acc_reg_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zybo_zynq_design_hls_macc_0_0_hls_macc_HLS_MACC_PERIPH_BUS_s_axi : entity is "hls_macc_HLS_MACC_PERIPH_BUS_s_axi";
end zybo_zynq_design_hls_macc_0_0_hls_macc_HLS_MACC_PERIPH_BUS_s_axi;

architecture STRUCTURE of zybo_zynq_design_hls_macc_0_0_hls_macc_HLS_MACC_PERIPH_BUS_s_axi is
  signal \FSM_onehot_rstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rstate_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FSM_onehot_rstate_reg_n_0_[0]\ : signal is "yes";
  signal \FSM_onehot_wstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_wstate_reg_n_0_[0]\ : signal is "yes";
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^a_reg0_reg[31]\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal accum_clr : STD_LOGIC;
  signal ap_NS_fsm1 : STD_LOGIC;
  signal ap_idle : STD_LOGIC;
  signal ap_start : STD_LOGIC;
  signal ar_hs : STD_LOGIC;
  signal \^buff2_reg__0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal int_a0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \int_a[31]_i_1_n_0\ : STD_LOGIC;
  signal \int_a[31]_i_3_n_0\ : STD_LOGIC;
  signal int_accum : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal int_accum_ap_vld : STD_LOGIC;
  signal int_accum_ap_vld1 : STD_LOGIC;
  signal int_accum_ap_vld_i_1_n_0 : STD_LOGIC;
  signal \int_accum_clr[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_accum_clr[0]_i_3_n_0\ : STD_LOGIC;
  signal int_ap_done : STD_LOGIC;
  signal int_ap_done1 : STD_LOGIC;
  signal int_ap_done_i_1_n_0 : STD_LOGIC;
  signal int_ap_idle : STD_LOGIC;
  signal int_ap_ready : STD_LOGIC;
  signal int_ap_start3_out : STD_LOGIC;
  signal int_ap_start_i_1_n_0 : STD_LOGIC;
  signal int_auto_restart : STD_LOGIC;
  signal int_auto_restart_i_1_n_0 : STD_LOGIC;
  signal int_b0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \int_b[31]_i_1_n_0\ : STD_LOGIC;
  signal int_gie_i_1_n_0 : STD_LOGIC;
  signal int_gie_reg_n_0 : STD_LOGIC;
  signal \int_ier[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_ier[1]_i_1_n_0\ : STD_LOGIC;
  signal \int_ier[1]_i_2_n_0\ : STD_LOGIC;
  signal \int_ier_reg_n_0_[0]\ : STD_LOGIC;
  signal int_isr6_out : STD_LOGIC;
  signal \int_isr[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_isr[1]_i_1_n_0\ : STD_LOGIC;
  signal \int_isr_reg_n_0_[0]\ : STD_LOGIC;
  signal \int_isr_reg_n_0_[1]\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal p_0_in : STD_LOGIC;
  signal p_0_in11_in : STD_LOGIC;
  signal \rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[16]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[17]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[18]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[19]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[20]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[21]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[22]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[23]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[24]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[25]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[26]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[27]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[28]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[29]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[30]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \rdata_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \^s_axi_hls_macc_periph_bus_rdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axi_hls_macc_periph_bus_rvalid\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \^s_axi_hls_macc_periph_bus_rvalid\ : signal is "yes";
  signal waddr : STD_LOGIC;
  signal \waddr_reg_n_0_[0]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[1]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[4]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[5]\ : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[0]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_rstate_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[1]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute KEEP of \FSM_onehot_rstate_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[2]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute KEEP of \FSM_onehot_rstate_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[0]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute KEEP of \FSM_onehot_wstate_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[1]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute KEEP of \FSM_onehot_wstate_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[2]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute KEEP of \FSM_onehot_wstate_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[3]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute KEEP of \FSM_onehot_wstate_reg[3]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \accum_clr_read_reg_85[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \int_a[0]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \int_a[10]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_a[11]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_a[12]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_a[13]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_a[14]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_a[15]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_a[16]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_a[17]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_a[18]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_a[19]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_a[1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \int_a[20]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_a[21]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_a[22]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_a[23]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_a[24]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \int_a[25]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \int_a[26]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \int_a[27]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \int_a[28]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \int_a[29]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \int_a[2]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \int_a[30]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \int_a[31]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \int_a[3]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \int_a[4]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \int_a[5]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \int_a[6]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \int_a[7]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \int_a[8]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_a[9]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of int_ap_start_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of int_ap_start_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \int_b[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \int_b[10]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_b[11]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \int_b[12]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \int_b[13]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_b[14]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_b[15]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_b[16]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_b[17]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_b[18]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_b[19]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_b[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \int_b[20]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_b[21]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_b[22]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_b[23]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_b[24]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \int_b[25]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \int_b[26]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \int_b[27]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \int_b[28]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \int_b[29]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \int_b[2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \int_b[30]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \int_b[31]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \int_b[3]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \int_b[4]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \int_b[5]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \int_b[6]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \int_b[7]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \int_b[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_b[9]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_isr[0]_i_2\ : label is "soft_lutpair0";
begin
  SR(0) <= \^sr\(0);
  \a_reg0_reg[31]\(31 downto 0) <= \^a_reg0_reg[31]\(31 downto 0);
  \buff2_reg__0\(31 downto 0) <= \^buff2_reg__0\(31 downto 0);
  \out\(2 downto 0) <= \^out\(2 downto 0);
  s_axi_HLS_MACC_PERIPH_BUS_RDATA(31 downto 0) <= \^s_axi_hls_macc_periph_bus_rdata\(31 downto 0);
  s_axi_HLS_MACC_PERIPH_BUS_RVALID(1 downto 0) <= \^s_axi_hls_macc_periph_bus_rvalid\(1 downto 0);
\FSM_onehot_rstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F747"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      I1 => \^s_axi_hls_macc_periph_bus_rvalid\(0),
      I2 => \^s_axi_hls_macc_periph_bus_rvalid\(1),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_RREADY,
      O => \FSM_onehot_rstate[1]_i_1_n_0\
    );
\FSM_onehot_rstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      I1 => \^s_axi_hls_macc_periph_bus_rvalid\(0),
      I2 => s_axi_HLS_MACC_PERIPH_BUS_RREADY,
      I3 => \^s_axi_hls_macc_periph_bus_rvalid\(1),
      O => \FSM_onehot_rstate[2]_i_1_n_0\
    );
\FSM_onehot_rstate_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => '0',
      Q => \FSM_onehot_rstate_reg_n_0_[0]\,
      S => \^sr\(0)
    );
\FSM_onehot_rstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_rstate[1]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rvalid\(0),
      R => \^sr\(0)
    );
\FSM_onehot_rstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_rstate[2]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rvalid\(1),
      R => \^sr\(0)
    );
\FSM_onehot_wstate[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888BFF8B"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_BREADY,
      I1 => \^out\(2),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_AWVALID,
      O => \FSM_onehot_wstate[1]_i_1_n_0\
    );
\FSM_onehot_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_AWVALID,
      I1 => \^out\(0),
      I2 => s_axi_HLS_MACC_PERIPH_BUS_WVALID,
      I3 => \^out\(1),
      O => \FSM_onehot_wstate[2]_i_1_n_0\
    );
\FSM_onehot_wstate[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => \^sr\(0)
    );
\FSM_onehot_wstate[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WVALID,
      I1 => \^out\(1),
      I2 => s_axi_HLS_MACC_PERIPH_BUS_BREADY,
      I3 => \^out\(2),
      O => \FSM_onehot_wstate[3]_i_2_n_0\
    );
\FSM_onehot_wstate_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => '0',
      Q => \FSM_onehot_wstate_reg_n_0_[0]\,
      S => \^sr\(0)
    );
\FSM_onehot_wstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[1]_i_1_n_0\,
      Q => \^out\(0),
      R => \^sr\(0)
    );
\FSM_onehot_wstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[2]_i_1_n_0\,
      Q => \^out\(1),
      R => \^sr\(0)
    );
\FSM_onehot_wstate_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[3]_i_2_n_0\,
      Q => \^out\(2),
      R => \^sr\(0)
    );
\accum_clr_read_reg_85[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => accum_clr,
      I1 => Q(0),
      I2 => ap_start,
      I3 => accum_clr_read_reg_85,
      O => \accum_clr_read_reg_85_reg[0]\
    );
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => Q(4),
      I1 => Q(0),
      I2 => ap_start,
      O => D(0)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => ap_NS_fsm1,
      I1 => \ap_CS_fsm_reg[4]\,
      I2 => Q(1),
      I3 => Q(4),
      I4 => Q(2),
      I5 => Q(3),
      O => D(1)
    );
\ap_CS_fsm[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Q(0),
      I1 => ap_start,
      O => ap_NS_fsm1
    );
\int_a[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(0),
      O => int_a0(0)
    );
\int_a[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(10),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(10),
      O => int_a0(10)
    );
\int_a[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(11),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(11),
      O => int_a0(11)
    );
\int_a[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(12),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(12),
      O => int_a0(12)
    );
\int_a[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(13),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(13),
      O => int_a0(13)
    );
\int_a[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(14),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(14),
      O => int_a0(14)
    );
\int_a[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(15),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(15),
      O => int_a0(15)
    );
\int_a[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(16),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(16),
      O => int_a0(16)
    );
\int_a[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(17),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(17),
      O => int_a0(17)
    );
\int_a[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(18),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(18),
      O => int_a0(18)
    );
\int_a[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(19),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(19),
      O => int_a0(19)
    );
\int_a[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(1),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(1),
      O => int_a0(1)
    );
\int_a[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(20),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(20),
      O => int_a0(20)
    );
\int_a[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(21),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(21),
      O => int_a0(21)
    );
\int_a[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(22),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(22),
      O => int_a0(22)
    );
\int_a[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(23),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^buff2_reg__0\(23),
      O => int_a0(23)
    );
\int_a[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(24),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(24),
      O => int_a0(24)
    );
\int_a[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(25),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(25),
      O => int_a0(25)
    );
\int_a[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(26),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(26),
      O => int_a0(26)
    );
\int_a[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(27),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(27),
      O => int_a0(27)
    );
\int_a[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(28),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(28),
      O => int_a0(28)
    );
\int_a[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(29),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(29),
      O => int_a0(29)
    );
\int_a[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(2),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(2),
      O => int_a0(2)
    );
\int_a[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(30),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(30),
      O => int_a0(30)
    );
\int_a[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \waddr_reg_n_0_[2]\,
      I1 => \waddr_reg_n_0_[3]\,
      I2 => \int_a[31]_i_3_n_0\,
      O => \int_a[31]_i_1_n_0\
    );
\int_a[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(31),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^buff2_reg__0\(31),
      O => int_a0(31)
    );
\int_a[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
        port map (
      I0 => \waddr_reg_n_0_[4]\,
      I1 => \waddr_reg_n_0_[5]\,
      I2 => \^out\(1),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_WVALID,
      I4 => \waddr_reg_n_0_[0]\,
      I5 => \waddr_reg_n_0_[1]\,
      O => \int_a[31]_i_3_n_0\
    );
\int_a[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(3),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(3),
      O => int_a0(3)
    );
\int_a[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(4),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(4),
      O => int_a0(4)
    );
\int_a[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(5),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(5),
      O => int_a0(5)
    );
\int_a[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(6),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(6),
      O => int_a0(6)
    );
\int_a[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(7),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^buff2_reg__0\(7),
      O => int_a0(7)
    );
\int_a[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(8),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(8),
      O => int_a0(8)
    );
\int_a[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(9),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^buff2_reg__0\(9),
      O => int_a0(9)
    );
\int_a_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(0),
      Q => \^buff2_reg__0\(0),
      R => \^sr\(0)
    );
\int_a_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(10),
      Q => \^buff2_reg__0\(10),
      R => \^sr\(0)
    );
\int_a_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(11),
      Q => \^buff2_reg__0\(11),
      R => \^sr\(0)
    );
\int_a_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(12),
      Q => \^buff2_reg__0\(12),
      R => \^sr\(0)
    );
\int_a_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(13),
      Q => \^buff2_reg__0\(13),
      R => \^sr\(0)
    );
\int_a_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(14),
      Q => \^buff2_reg__0\(14),
      R => \^sr\(0)
    );
\int_a_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(15),
      Q => \^buff2_reg__0\(15),
      R => \^sr\(0)
    );
\int_a_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(16),
      Q => \^buff2_reg__0\(16),
      R => \^sr\(0)
    );
\int_a_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(17),
      Q => \^buff2_reg__0\(17),
      R => \^sr\(0)
    );
\int_a_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(18),
      Q => \^buff2_reg__0\(18),
      R => \^sr\(0)
    );
\int_a_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(19),
      Q => \^buff2_reg__0\(19),
      R => \^sr\(0)
    );
\int_a_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(1),
      Q => \^buff2_reg__0\(1),
      R => \^sr\(0)
    );
\int_a_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(20),
      Q => \^buff2_reg__0\(20),
      R => \^sr\(0)
    );
\int_a_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(21),
      Q => \^buff2_reg__0\(21),
      R => \^sr\(0)
    );
\int_a_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(22),
      Q => \^buff2_reg__0\(22),
      R => \^sr\(0)
    );
\int_a_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(23),
      Q => \^buff2_reg__0\(23),
      R => \^sr\(0)
    );
\int_a_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(24),
      Q => \^buff2_reg__0\(24),
      R => \^sr\(0)
    );
\int_a_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(25),
      Q => \^buff2_reg__0\(25),
      R => \^sr\(0)
    );
\int_a_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(26),
      Q => \^buff2_reg__0\(26),
      R => \^sr\(0)
    );
\int_a_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(27),
      Q => \^buff2_reg__0\(27),
      R => \^sr\(0)
    );
\int_a_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(28),
      Q => \^buff2_reg__0\(28),
      R => \^sr\(0)
    );
\int_a_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(29),
      Q => \^buff2_reg__0\(29),
      R => \^sr\(0)
    );
\int_a_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(2),
      Q => \^buff2_reg__0\(2),
      R => \^sr\(0)
    );
\int_a_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(30),
      Q => \^buff2_reg__0\(30),
      R => \^sr\(0)
    );
\int_a_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(31),
      Q => \^buff2_reg__0\(31),
      R => \^sr\(0)
    );
\int_a_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(3),
      Q => \^buff2_reg__0\(3),
      R => \^sr\(0)
    );
\int_a_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(4),
      Q => \^buff2_reg__0\(4),
      R => \^sr\(0)
    );
\int_a_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(5),
      Q => \^buff2_reg__0\(5),
      R => \^sr\(0)
    );
\int_a_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(6),
      Q => \^buff2_reg__0\(6),
      R => \^sr\(0)
    );
\int_a_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(7),
      Q => \^buff2_reg__0\(7),
      R => \^sr\(0)
    );
\int_a_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(8),
      Q => \^buff2_reg__0\(8),
      R => \^sr\(0)
    );
\int_a_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[31]_i_1_n_0\,
      D => int_a0(9),
      Q => \^buff2_reg__0\(9),
      R => \^sr\(0)
    );
int_accum_ap_vld_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFAAAA"
    )
        port map (
      I0 => Q(4),
      I1 => int_accum_ap_vld1,
      I2 => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      I3 => \^s_axi_hls_macc_periph_bus_rvalid\(0),
      I4 => int_accum_ap_vld,
      O => int_accum_ap_vld_i_1_n_0
    );
int_accum_ap_vld_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(1),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(2),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I5 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(0),
      O => int_accum_ap_vld1
    );
int_accum_ap_vld_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => int_accum_ap_vld_i_1_n_0,
      Q => int_accum_ap_vld,
      R => \^sr\(0)
    );
\int_accum_clr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => p_0_in11_in,
      I3 => accum_clr,
      O => \int_accum_clr[0]_i_1_n_0\
    );
\int_accum_clr[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \waddr_reg_n_0_[2]\,
      I1 => \waddr_reg_n_0_[5]\,
      I2 => \int_accum_clr[0]_i_3_n_0\,
      I3 => \waddr_reg_n_0_[4]\,
      I4 => \waddr_reg_n_0_[3]\,
      O => p_0_in11_in
    );
\int_accum_clr[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^out\(1),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WVALID,
      I2 => \waddr_reg_n_0_[0]\,
      I3 => \waddr_reg_n_0_[1]\,
      O => \int_accum_clr[0]_i_3_n_0\
    );
\int_accum_clr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \int_accum_clr[0]_i_1_n_0\,
      Q => accum_clr,
      R => \^sr\(0)
    );
\int_accum_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(0),
      Q => int_accum(0),
      R => \^sr\(0)
    );
\int_accum_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(10),
      Q => int_accum(10),
      R => \^sr\(0)
    );
\int_accum_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(11),
      Q => int_accum(11),
      R => \^sr\(0)
    );
\int_accum_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(12),
      Q => int_accum(12),
      R => \^sr\(0)
    );
\int_accum_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(13),
      Q => int_accum(13),
      R => \^sr\(0)
    );
\int_accum_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(14),
      Q => int_accum(14),
      R => \^sr\(0)
    );
\int_accum_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(15),
      Q => int_accum(15),
      R => \^sr\(0)
    );
\int_accum_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(16),
      Q => int_accum(16),
      R => \^sr\(0)
    );
\int_accum_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(17),
      Q => int_accum(17),
      R => \^sr\(0)
    );
\int_accum_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(18),
      Q => int_accum(18),
      R => \^sr\(0)
    );
\int_accum_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(19),
      Q => int_accum(19),
      R => \^sr\(0)
    );
\int_accum_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(1),
      Q => int_accum(1),
      R => \^sr\(0)
    );
\int_accum_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(20),
      Q => int_accum(20),
      R => \^sr\(0)
    );
\int_accum_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(21),
      Q => int_accum(21),
      R => \^sr\(0)
    );
\int_accum_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(22),
      Q => int_accum(22),
      R => \^sr\(0)
    );
\int_accum_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(23),
      Q => int_accum(23),
      R => \^sr\(0)
    );
\int_accum_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(24),
      Q => int_accum(24),
      R => \^sr\(0)
    );
\int_accum_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(25),
      Q => int_accum(25),
      R => \^sr\(0)
    );
\int_accum_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(26),
      Q => int_accum(26),
      R => \^sr\(0)
    );
\int_accum_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(27),
      Q => int_accum(27),
      R => \^sr\(0)
    );
\int_accum_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(28),
      Q => int_accum(28),
      R => \^sr\(0)
    );
\int_accum_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(29),
      Q => int_accum(29),
      R => \^sr\(0)
    );
\int_accum_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(2),
      Q => int_accum(2),
      R => \^sr\(0)
    );
\int_accum_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(30),
      Q => int_accum(30),
      R => \^sr\(0)
    );
\int_accum_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(31),
      Q => int_accum(31),
      R => \^sr\(0)
    );
\int_accum_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(3),
      Q => int_accum(3),
      R => \^sr\(0)
    );
\int_accum_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(4),
      Q => int_accum(4),
      R => \^sr\(0)
    );
\int_accum_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(5),
      Q => int_accum(5),
      R => \^sr\(0)
    );
\int_accum_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(6),
      Q => int_accum(6),
      R => \^sr\(0)
    );
\int_accum_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(7),
      Q => int_accum(7),
      R => \^sr\(0)
    );
\int_accum_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(8),
      Q => int_accum(8),
      R => \^sr\(0)
    );
\int_accum_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => Q(4),
      D => \acc_reg_reg[31]\(9),
      Q => int_accum(9),
      R => \^sr\(0)
    );
int_ap_done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFAAAA"
    )
        port map (
      I0 => Q(4),
      I1 => int_ap_done1,
      I2 => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      I3 => \^s_axi_hls_macc_periph_bus_rvalid\(0),
      I4 => int_ap_done,
      O => int_ap_done_i_1_n_0
    );
int_ap_done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(1),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(0),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I5 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(2),
      O => int_ap_done1
    );
int_ap_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => int_ap_done_i_1_n_0,
      Q => int_ap_done,
      R => \^sr\(0)
    );
int_ap_idle_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Q(0),
      I1 => ap_start,
      O => ap_idle
    );
int_ap_idle_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => ap_idle,
      Q => int_ap_idle,
      R => \^sr\(0)
    );
int_ap_ready_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => Q(4),
      Q => int_ap_ready,
      R => \^sr\(0)
    );
int_ap_start_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBF8"
    )
        port map (
      I0 => int_auto_restart,
      I1 => Q(4),
      I2 => int_ap_start3_out,
      I3 => ap_start,
      O => int_ap_start_i_1_n_0
    );
int_ap_start_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => \waddr_reg_n_0_[3]\,
      I1 => \int_ier[1]_i_2_n_0\,
      I2 => \waddr_reg_n_0_[2]\,
      I3 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(0),
      O => int_ap_start3_out
    );
int_ap_start_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => int_ap_start_i_1_n_0,
      Q => ap_start,
      R => \^sr\(0)
    );
int_auto_restart_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(7),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \int_ier[1]_i_2_n_0\,
      I4 => \waddr_reg_n_0_[3]\,
      I5 => int_auto_restart,
      O => int_auto_restart_i_1_n_0
    );
int_auto_restart_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => int_auto_restart_i_1_n_0,
      Q => int_auto_restart,
      R => \^sr\(0)
    );
\int_b[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(0),
      O => int_b0(0)
    );
\int_b[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(10),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(10),
      O => int_b0(10)
    );
\int_b[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(11),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(11),
      O => int_b0(11)
    );
\int_b[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(12),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(12),
      O => int_b0(12)
    );
\int_b[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(13),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(13),
      O => int_b0(13)
    );
\int_b[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(14),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(14),
      O => int_b0(14)
    );
\int_b[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(15),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(15),
      O => int_b0(15)
    );
\int_b[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(16),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(16),
      O => int_b0(16)
    );
\int_b[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(17),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(17),
      O => int_b0(17)
    );
\int_b[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(18),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(18),
      O => int_b0(18)
    );
\int_b[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(19),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(19),
      O => int_b0(19)
    );
\int_b[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(1),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(1),
      O => int_b0(1)
    );
\int_b[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(20),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(20),
      O => int_b0(20)
    );
\int_b[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(21),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(21),
      O => int_b0(21)
    );
\int_b[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(22),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(22),
      O => int_b0(22)
    );
\int_b[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(23),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(2),
      I2 => \^a_reg0_reg[31]\(23),
      O => int_b0(23)
    );
\int_b[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(24),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(24),
      O => int_b0(24)
    );
\int_b[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(25),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(25),
      O => int_b0(25)
    );
\int_b[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(26),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(26),
      O => int_b0(26)
    );
\int_b[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(27),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(27),
      O => int_b0(27)
    );
\int_b[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(28),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(28),
      O => int_b0(28)
    );
\int_b[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(29),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(29),
      O => int_b0(29)
    );
\int_b[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(2),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(2),
      O => int_b0(2)
    );
\int_b[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(30),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(30),
      O => int_b0(30)
    );
\int_b[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \waddr_reg_n_0_[2]\,
      I1 => \waddr_reg_n_0_[3]\,
      I2 => \int_a[31]_i_3_n_0\,
      O => \int_b[31]_i_1_n_0\
    );
\int_b[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(31),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3),
      I2 => \^a_reg0_reg[31]\(31),
      O => int_b0(31)
    );
\int_b[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(3),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(3),
      O => int_b0(3)
    );
\int_b[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(4),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(4),
      O => int_b0(4)
    );
\int_b[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(5),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(5),
      O => int_b0(5)
    );
\int_b[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(6),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(6),
      O => int_b0(6)
    );
\int_b[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(7),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \^a_reg0_reg[31]\(7),
      O => int_b0(7)
    );
\int_b[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(8),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(8),
      O => int_b0(8)
    );
\int_b[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(9),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(1),
      I2 => \^a_reg0_reg[31]\(9),
      O => int_b0(9)
    );
\int_b_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(0),
      Q => \^a_reg0_reg[31]\(0),
      R => \^sr\(0)
    );
\int_b_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(10),
      Q => \^a_reg0_reg[31]\(10),
      R => \^sr\(0)
    );
\int_b_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(11),
      Q => \^a_reg0_reg[31]\(11),
      R => \^sr\(0)
    );
\int_b_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(12),
      Q => \^a_reg0_reg[31]\(12),
      R => \^sr\(0)
    );
\int_b_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(13),
      Q => \^a_reg0_reg[31]\(13),
      R => \^sr\(0)
    );
\int_b_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(14),
      Q => \^a_reg0_reg[31]\(14),
      R => \^sr\(0)
    );
\int_b_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(15),
      Q => \^a_reg0_reg[31]\(15),
      R => \^sr\(0)
    );
\int_b_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(16),
      Q => \^a_reg0_reg[31]\(16),
      R => \^sr\(0)
    );
\int_b_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(17),
      Q => \^a_reg0_reg[31]\(17),
      R => \^sr\(0)
    );
\int_b_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(18),
      Q => \^a_reg0_reg[31]\(18),
      R => \^sr\(0)
    );
\int_b_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(19),
      Q => \^a_reg0_reg[31]\(19),
      R => \^sr\(0)
    );
\int_b_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(1),
      Q => \^a_reg0_reg[31]\(1),
      R => \^sr\(0)
    );
\int_b_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(20),
      Q => \^a_reg0_reg[31]\(20),
      R => \^sr\(0)
    );
\int_b_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(21),
      Q => \^a_reg0_reg[31]\(21),
      R => \^sr\(0)
    );
\int_b_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(22),
      Q => \^a_reg0_reg[31]\(22),
      R => \^sr\(0)
    );
\int_b_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(23),
      Q => \^a_reg0_reg[31]\(23),
      R => \^sr\(0)
    );
\int_b_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(24),
      Q => \^a_reg0_reg[31]\(24),
      R => \^sr\(0)
    );
\int_b_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(25),
      Q => \^a_reg0_reg[31]\(25),
      R => \^sr\(0)
    );
\int_b_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(26),
      Q => \^a_reg0_reg[31]\(26),
      R => \^sr\(0)
    );
\int_b_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(27),
      Q => \^a_reg0_reg[31]\(27),
      R => \^sr\(0)
    );
\int_b_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(28),
      Q => \^a_reg0_reg[31]\(28),
      R => \^sr\(0)
    );
\int_b_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(29),
      Q => \^a_reg0_reg[31]\(29),
      R => \^sr\(0)
    );
\int_b_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(2),
      Q => \^a_reg0_reg[31]\(2),
      R => \^sr\(0)
    );
\int_b_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(30),
      Q => \^a_reg0_reg[31]\(30),
      R => \^sr\(0)
    );
\int_b_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(31),
      Q => \^a_reg0_reg[31]\(31),
      R => \^sr\(0)
    );
\int_b_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(3),
      Q => \^a_reg0_reg[31]\(3),
      R => \^sr\(0)
    );
\int_b_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(4),
      Q => \^a_reg0_reg[31]\(4),
      R => \^sr\(0)
    );
\int_b_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(5),
      Q => \^a_reg0_reg[31]\(5),
      R => \^sr\(0)
    );
\int_b_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(6),
      Q => \^a_reg0_reg[31]\(6),
      R => \^sr\(0)
    );
\int_b_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(7),
      Q => \^a_reg0_reg[31]\(7),
      R => \^sr\(0)
    );
\int_b_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(8),
      Q => \^a_reg0_reg[31]\(8),
      R => \^sr\(0)
    );
\int_b_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[31]_i_1_n_0\,
      D => int_b0(9),
      Q => \^a_reg0_reg[31]\(9),
      R => \^sr\(0)
    );
int_gie_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \int_ier[1]_i_2_n_0\,
      I3 => \waddr_reg_n_0_[3]\,
      I4 => \waddr_reg_n_0_[2]\,
      I5 => int_gie_reg_n_0,
      O => int_gie_i_1_n_0
    );
int_gie_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => int_gie_i_1_n_0,
      Q => int_gie_reg_n_0,
      R => \^sr\(0)
    );
\int_ier[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \waddr_reg_n_0_[3]\,
      I4 => \int_ier[1]_i_2_n_0\,
      I5 => \int_ier_reg_n_0_[0]\,
      O => \int_ier[0]_i_1_n_0\
    );
\int_ier[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(1),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \waddr_reg_n_0_[3]\,
      I4 => \int_ier[1]_i_2_n_0\,
      I5 => p_0_in,
      O => \int_ier[1]_i_1_n_0\
    );
\int_ier[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => \waddr_reg_n_0_[5]\,
      I1 => \^out\(1),
      I2 => s_axi_HLS_MACC_PERIPH_BUS_WVALID,
      I3 => \waddr_reg_n_0_[0]\,
      I4 => \waddr_reg_n_0_[1]\,
      I5 => \waddr_reg_n_0_[4]\,
      O => \int_ier[1]_i_2_n_0\
    );
\int_ier_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \int_ier[0]_i_1_n_0\,
      Q => \int_ier_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\int_ier_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \int_ier[1]_i_1_n_0\,
      Q => p_0_in,
      R => \^sr\(0)
    );
\int_isr[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F777F888"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(0),
      I1 => int_isr6_out,
      I2 => Q(4),
      I3 => \int_ier_reg_n_0_[0]\,
      I4 => \int_isr_reg_n_0_[0]\,
      O => \int_isr[0]_i_1_n_0\
    );
\int_isr[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(0),
      I1 => \waddr_reg_n_0_[3]\,
      I2 => \int_ier[1]_i_2_n_0\,
      I3 => \waddr_reg_n_0_[2]\,
      O => int_isr6_out
    );
\int_isr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F777F888"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_WDATA(1),
      I1 => int_isr6_out,
      I2 => p_0_in,
      I3 => Q(4),
      I4 => \int_isr_reg_n_0_[1]\,
      O => \int_isr[1]_i_1_n_0\
    );
\int_isr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \int_isr[0]_i_1_n_0\,
      Q => \int_isr_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\int_isr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \int_isr[1]_i_1_n_0\,
      Q => \int_isr_reg_n_0_[1]\,
      R => \^sr\(0)
    );
interrupt_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \int_isr_reg_n_0_[1]\,
      I1 => \int_isr_reg_n_0_[0]\,
      I2 => int_gie_reg_n_0,
      O => interrupt
    );
\rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \rdata_reg[0]_i_2_n_0\,
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(2),
      I2 => \rdata[0]_i_3_n_0\,
      I3 => \rdata[1]_i_4_n_0\,
      I4 => ar_hs,
      I5 => \^s_axi_hls_macc_periph_bus_rdata\(0),
      O => \rdata[0]_i_1_n_0\
    );
\rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033223000002230"
    )
        port map (
      I0 => int_accum_ap_vld,
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => int_gie_reg_n_0,
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I5 => \int_isr_reg_n_0_[0]\,
      O => \rdata[0]_i_3_n_0\
    );
\rdata[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^buff2_reg__0\(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => int_accum(0),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => ap_start,
      O => \rdata[0]_i_4_n_0\
    );
\rdata[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => accum_clr,
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => \int_ier_reg_n_0_[0]\,
      O => \rdata[0]_i_5_n_0\
    );
\rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(10),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(10),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(10),
      O => \rdata[10]_i_1_n_0\
    );
\rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(11),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(11),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(11),
      O => \rdata[11]_i_1_n_0\
    );
\rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(12),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(12),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(12),
      O => \rdata[12]_i_1_n_0\
    );
\rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(13),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(13),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(13),
      O => \rdata[13]_i_1_n_0\
    );
\rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(14),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(14),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(14),
      O => \rdata[14]_i_1_n_0\
    );
\rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(15),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(15),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(15),
      O => \rdata[15]_i_1_n_0\
    );
\rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(16),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(16),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(16),
      O => \rdata[16]_i_1_n_0\
    );
\rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(17),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(17),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(17),
      O => \rdata[17]_i_1_n_0\
    );
\rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(18),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(18),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(18),
      O => \rdata[18]_i_1_n_0\
    );
\rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(19),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(19),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(19),
      O => \rdata[19]_i_1_n_0\
    );
\rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \rdata[1]_i_2_n_0\,
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(2),
      I2 => \rdata[1]_i_3_n_0\,
      I3 => \rdata[1]_i_4_n_0\,
      I4 => ar_hs,
      I5 => \^s_axi_hls_macc_periph_bus_rdata\(1),
      O => \rdata[1]_i_1_n_0\
    );
\rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => p_0_in,
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => \^a_reg0_reg[31]\(1),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I5 => \rdata[1]_i_5_n_0\,
      O => \rdata[1]_i_2_n_0\
    );
\rdata[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I2 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I3 => \int_isr_reg_n_0_[1]\,
      O => \rdata[1]_i_3_n_0\
    );
\rdata[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(1),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(0),
      O => \rdata[1]_i_4_n_0\
    );
\rdata[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^buff2_reg__0\(1),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => int_accum(1),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => int_ap_done,
      O => \rdata[1]_i_5_n_0\
    );
\rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(20),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(20),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(20),
      O => \rdata[20]_i_1_n_0\
    );
\rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(21),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(21),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(21),
      O => \rdata[21]_i_1_n_0\
    );
\rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(22),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(22),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(22),
      O => \rdata[22]_i_1_n_0\
    );
\rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(23),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(23),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(23),
      O => \rdata[23]_i_1_n_0\
    );
\rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(24),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(24),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(24),
      O => \rdata[24]_i_1_n_0\
    );
\rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(25),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(25),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(25),
      O => \rdata[25]_i_1_n_0\
    );
\rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(26),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(26),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(26),
      O => \rdata[26]_i_1_n_0\
    );
\rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(27),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(27),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(27),
      O => \rdata[27]_i_1_n_0\
    );
\rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(28),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(28),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(28),
      O => \rdata[28]_i_1_n_0\
    );
\rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(29),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(29),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(29),
      O => \rdata[29]_i_1_n_0\
    );
\rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => \^a_reg0_reg[31]\(2),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I4 => \rdata[2]_i_2_n_0\,
      O => \rdata[2]_i_1_n_0\
    );
\rdata[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^buff2_reg__0\(2),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => int_accum(2),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => int_ap_idle,
      O => \rdata[2]_i_2_n_0\
    );
\rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(30),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(30),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(30),
      O => \rdata[30]_i_1_n_0\
    );
\rdata[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => \^s_axi_hls_macc_periph_bus_rvalid\(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      I2 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(1),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(0),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(2),
      O => \rdata[31]_i_1_n_0\
    );
\rdata[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      I1 => \^s_axi_hls_macc_periph_bus_rvalid\(0),
      O => ar_hs
    );
\rdata[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(31),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(31),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(31),
      O => \rdata[31]_i_3_n_0\
    );
\rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => \^a_reg0_reg[31]\(3),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I4 => \rdata[3]_i_2_n_0\,
      O => \rdata[3]_i_1_n_0\
    );
\rdata[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^buff2_reg__0\(3),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => int_accum(3),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => int_ap_ready,
      O => \rdata[3]_i_2_n_0\
    );
\rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(4),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(4),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(4),
      O => \rdata[4]_i_1_n_0\
    );
\rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(5),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(5),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(5),
      O => \rdata[5]_i_1_n_0\
    );
\rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(6),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(6),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(6),
      O => \rdata[6]_i_1_n_0\
    );
\rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4000"
    )
        port map (
      I0 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => \^a_reg0_reg[31]\(7),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I4 => \rdata[7]_i_2_n_0\,
      O => \rdata[7]_i_1_n_0\
    );
\rdata[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^buff2_reg__0\(7),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I2 => int_accum(7),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I4 => int_auto_restart,
      O => \rdata[7]_i_2_n_0\
    );
\rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(8),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(8),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(8),
      O => \rdata[8]_i_1_n_0\
    );
\rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^a_reg0_reg[31]\(9),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3),
      I2 => \^buff2_reg__0\(9),
      I3 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(4),
      I4 => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5),
      I5 => int_accum(9),
      O => \rdata[9]_i_1_n_0\
    );
\rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \rdata[0]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(0),
      R => '0'
    );
\rdata_reg[0]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[0]_i_4_n_0\,
      I1 => \rdata[0]_i_5_n_0\,
      O => \rdata_reg[0]_i_2_n_0\,
      S => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(3)
    );
\rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[10]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(10),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[11]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(11),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[12]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(12),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[13]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(13),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[14]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(14),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[15]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(15),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[16]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(16),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[17]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(17),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[18]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(18),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[19]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(19),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \rdata[1]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(1),
      R => '0'
    );
\rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[20]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(20),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[21]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(21),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[22]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(22),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[23]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(23),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[24]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(24),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[25]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(25),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[26]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(26),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[27]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(27),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[28]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(28),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[29]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(29),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[2]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(2),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[30]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(30),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[31]_i_3_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(31),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[3]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(3),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[4]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(4),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[5]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(5),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[6]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(6),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[7]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(7),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[8]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(8),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[9]_i_1_n_0\,
      Q => \^s_axi_hls_macc_periph_bus_rdata\(9),
      R => \rdata[31]_i_1_n_0\
    );
\waddr[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^out\(0),
      I1 => s_axi_HLS_MACC_PERIPH_BUS_AWVALID,
      O => waddr
    );
\waddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(0),
      Q => \waddr_reg_n_0_[0]\,
      R => '0'
    );
\waddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(1),
      Q => \waddr_reg_n_0_[1]\,
      R => '0'
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(2),
      Q => \waddr_reg_n_0_[2]\,
      R => '0'
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(3),
      Q => \waddr_reg_n_0_[3]\,
      R => '0'
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(4),
      Q => \waddr_reg_n_0_[4]\,
      R => '0'
    );
\waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(5),
      Q => \waddr_reg_n_0_[5]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb_MulnS_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_clk : in STD_LOGIC;
    \int_a_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \int_b_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb_MulnS_0 : entity is "hls_macc_mul_32s_bkb_MulnS_0";
end zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb_MulnS_0;

architecture STRUCTURE of zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb_MulnS_0 is
  signal a_reg0 : STD_LOGIC_VECTOR ( 31 downto 17 );
  signal b_reg0 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal buff1_reg_n_100 : STD_LOGIC;
  signal buff1_reg_n_101 : STD_LOGIC;
  signal buff1_reg_n_102 : STD_LOGIC;
  signal buff1_reg_n_103 : STD_LOGIC;
  signal buff1_reg_n_104 : STD_LOGIC;
  signal buff1_reg_n_105 : STD_LOGIC;
  signal buff1_reg_n_106 : STD_LOGIC;
  signal buff1_reg_n_107 : STD_LOGIC;
  signal buff1_reg_n_108 : STD_LOGIC;
  signal buff1_reg_n_109 : STD_LOGIC;
  signal buff1_reg_n_110 : STD_LOGIC;
  signal buff1_reg_n_111 : STD_LOGIC;
  signal buff1_reg_n_112 : STD_LOGIC;
  signal buff1_reg_n_113 : STD_LOGIC;
  signal buff1_reg_n_114 : STD_LOGIC;
  signal buff1_reg_n_115 : STD_LOGIC;
  signal buff1_reg_n_116 : STD_LOGIC;
  signal buff1_reg_n_117 : STD_LOGIC;
  signal buff1_reg_n_118 : STD_LOGIC;
  signal buff1_reg_n_119 : STD_LOGIC;
  signal buff1_reg_n_120 : STD_LOGIC;
  signal buff1_reg_n_121 : STD_LOGIC;
  signal buff1_reg_n_122 : STD_LOGIC;
  signal buff1_reg_n_123 : STD_LOGIC;
  signal buff1_reg_n_124 : STD_LOGIC;
  signal buff1_reg_n_125 : STD_LOGIC;
  signal buff1_reg_n_126 : STD_LOGIC;
  signal buff1_reg_n_127 : STD_LOGIC;
  signal buff1_reg_n_128 : STD_LOGIC;
  signal buff1_reg_n_129 : STD_LOGIC;
  signal buff1_reg_n_130 : STD_LOGIC;
  signal buff1_reg_n_131 : STD_LOGIC;
  signal buff1_reg_n_132 : STD_LOGIC;
  signal buff1_reg_n_133 : STD_LOGIC;
  signal buff1_reg_n_134 : STD_LOGIC;
  signal buff1_reg_n_135 : STD_LOGIC;
  signal buff1_reg_n_136 : STD_LOGIC;
  signal buff1_reg_n_137 : STD_LOGIC;
  signal buff1_reg_n_138 : STD_LOGIC;
  signal buff1_reg_n_139 : STD_LOGIC;
  signal buff1_reg_n_140 : STD_LOGIC;
  signal buff1_reg_n_141 : STD_LOGIC;
  signal buff1_reg_n_142 : STD_LOGIC;
  signal buff1_reg_n_143 : STD_LOGIC;
  signal buff1_reg_n_144 : STD_LOGIC;
  signal buff1_reg_n_145 : STD_LOGIC;
  signal buff1_reg_n_146 : STD_LOGIC;
  signal buff1_reg_n_147 : STD_LOGIC;
  signal buff1_reg_n_148 : STD_LOGIC;
  signal buff1_reg_n_149 : STD_LOGIC;
  signal buff1_reg_n_150 : STD_LOGIC;
  signal buff1_reg_n_151 : STD_LOGIC;
  signal buff1_reg_n_152 : STD_LOGIC;
  signal buff1_reg_n_153 : STD_LOGIC;
  signal buff1_reg_n_58 : STD_LOGIC;
  signal buff1_reg_n_59 : STD_LOGIC;
  signal buff1_reg_n_60 : STD_LOGIC;
  signal buff1_reg_n_61 : STD_LOGIC;
  signal buff1_reg_n_62 : STD_LOGIC;
  signal buff1_reg_n_63 : STD_LOGIC;
  signal buff1_reg_n_64 : STD_LOGIC;
  signal buff1_reg_n_65 : STD_LOGIC;
  signal buff1_reg_n_66 : STD_LOGIC;
  signal buff1_reg_n_67 : STD_LOGIC;
  signal buff1_reg_n_68 : STD_LOGIC;
  signal buff1_reg_n_69 : STD_LOGIC;
  signal buff1_reg_n_70 : STD_LOGIC;
  signal buff1_reg_n_71 : STD_LOGIC;
  signal buff1_reg_n_72 : STD_LOGIC;
  signal buff1_reg_n_73 : STD_LOGIC;
  signal buff1_reg_n_74 : STD_LOGIC;
  signal buff1_reg_n_75 : STD_LOGIC;
  signal buff1_reg_n_76 : STD_LOGIC;
  signal buff1_reg_n_77 : STD_LOGIC;
  signal buff1_reg_n_78 : STD_LOGIC;
  signal buff1_reg_n_79 : STD_LOGIC;
  signal buff1_reg_n_80 : STD_LOGIC;
  signal buff1_reg_n_81 : STD_LOGIC;
  signal buff1_reg_n_82 : STD_LOGIC;
  signal buff1_reg_n_83 : STD_LOGIC;
  signal buff1_reg_n_84 : STD_LOGIC;
  signal buff1_reg_n_85 : STD_LOGIC;
  signal buff1_reg_n_86 : STD_LOGIC;
  signal buff1_reg_n_87 : STD_LOGIC;
  signal buff1_reg_n_88 : STD_LOGIC;
  signal buff1_reg_n_89 : STD_LOGIC;
  signal buff1_reg_n_90 : STD_LOGIC;
  signal buff1_reg_n_91 : STD_LOGIC;
  signal buff1_reg_n_92 : STD_LOGIC;
  signal buff1_reg_n_93 : STD_LOGIC;
  signal buff1_reg_n_94 : STD_LOGIC;
  signal buff1_reg_n_95 : STD_LOGIC;
  signal buff1_reg_n_96 : STD_LOGIC;
  signal buff1_reg_n_97 : STD_LOGIC;
  signal buff1_reg_n_98 : STD_LOGIC;
  signal buff1_reg_n_99 : STD_LOGIC;
  signal \buff2_reg__0_n_106\ : STD_LOGIC;
  signal \buff2_reg__0_n_107\ : STD_LOGIC;
  signal \buff2_reg__0_n_108\ : STD_LOGIC;
  signal \buff2_reg__0_n_109\ : STD_LOGIC;
  signal \buff2_reg__0_n_110\ : STD_LOGIC;
  signal \buff2_reg__0_n_111\ : STD_LOGIC;
  signal \buff2_reg__0_n_112\ : STD_LOGIC;
  signal \buff2_reg__0_n_113\ : STD_LOGIC;
  signal \buff2_reg__0_n_114\ : STD_LOGIC;
  signal \buff2_reg__0_n_115\ : STD_LOGIC;
  signal \buff2_reg__0_n_116\ : STD_LOGIC;
  signal \buff2_reg__0_n_117\ : STD_LOGIC;
  signal \buff2_reg__0_n_118\ : STD_LOGIC;
  signal \buff2_reg__0_n_119\ : STD_LOGIC;
  signal \buff2_reg__0_n_120\ : STD_LOGIC;
  signal \buff2_reg__0_n_121\ : STD_LOGIC;
  signal \buff2_reg__0_n_122\ : STD_LOGIC;
  signal \buff2_reg__0_n_123\ : STD_LOGIC;
  signal \buff2_reg__0_n_124\ : STD_LOGIC;
  signal \buff2_reg__0_n_125\ : STD_LOGIC;
  signal \buff2_reg__0_n_126\ : STD_LOGIC;
  signal \buff2_reg__0_n_127\ : STD_LOGIC;
  signal \buff2_reg__0_n_128\ : STD_LOGIC;
  signal \buff2_reg__0_n_129\ : STD_LOGIC;
  signal \buff2_reg__0_n_130\ : STD_LOGIC;
  signal \buff2_reg__0_n_131\ : STD_LOGIC;
  signal \buff2_reg__0_n_132\ : STD_LOGIC;
  signal \buff2_reg__0_n_133\ : STD_LOGIC;
  signal \buff2_reg__0_n_134\ : STD_LOGIC;
  signal \buff2_reg__0_n_135\ : STD_LOGIC;
  signal \buff2_reg__0_n_136\ : STD_LOGIC;
  signal \buff2_reg__0_n_137\ : STD_LOGIC;
  signal \buff2_reg__0_n_138\ : STD_LOGIC;
  signal \buff2_reg__0_n_139\ : STD_LOGIC;
  signal \buff2_reg__0_n_140\ : STD_LOGIC;
  signal \buff2_reg__0_n_141\ : STD_LOGIC;
  signal \buff2_reg__0_n_142\ : STD_LOGIC;
  signal \buff2_reg__0_n_143\ : STD_LOGIC;
  signal \buff2_reg__0_n_144\ : STD_LOGIC;
  signal \buff2_reg__0_n_145\ : STD_LOGIC;
  signal \buff2_reg__0_n_146\ : STD_LOGIC;
  signal \buff2_reg__0_n_147\ : STD_LOGIC;
  signal \buff2_reg__0_n_148\ : STD_LOGIC;
  signal \buff2_reg__0_n_149\ : STD_LOGIC;
  signal \buff2_reg__0_n_150\ : STD_LOGIC;
  signal \buff2_reg__0_n_151\ : STD_LOGIC;
  signal \buff2_reg__0_n_152\ : STD_LOGIC;
  signal \buff2_reg__0_n_153\ : STD_LOGIC;
  signal \buff3_reg__0_n_100\ : STD_LOGIC;
  signal \buff3_reg__0_n_101\ : STD_LOGIC;
  signal \buff3_reg__0_n_102\ : STD_LOGIC;
  signal \buff3_reg__0_n_103\ : STD_LOGIC;
  signal \buff3_reg__0_n_104\ : STD_LOGIC;
  signal \buff3_reg__0_n_105\ : STD_LOGIC;
  signal \buff3_reg__0_n_58\ : STD_LOGIC;
  signal \buff3_reg__0_n_59\ : STD_LOGIC;
  signal \buff3_reg__0_n_60\ : STD_LOGIC;
  signal \buff3_reg__0_n_61\ : STD_LOGIC;
  signal \buff3_reg__0_n_62\ : STD_LOGIC;
  signal \buff3_reg__0_n_63\ : STD_LOGIC;
  signal \buff3_reg__0_n_64\ : STD_LOGIC;
  signal \buff3_reg__0_n_65\ : STD_LOGIC;
  signal \buff3_reg__0_n_66\ : STD_LOGIC;
  signal \buff3_reg__0_n_67\ : STD_LOGIC;
  signal \buff3_reg__0_n_68\ : STD_LOGIC;
  signal \buff3_reg__0_n_69\ : STD_LOGIC;
  signal \buff3_reg__0_n_70\ : STD_LOGIC;
  signal \buff3_reg__0_n_71\ : STD_LOGIC;
  signal \buff3_reg__0_n_72\ : STD_LOGIC;
  signal \buff3_reg__0_n_73\ : STD_LOGIC;
  signal \buff3_reg__0_n_74\ : STD_LOGIC;
  signal \buff3_reg__0_n_75\ : STD_LOGIC;
  signal \buff3_reg__0_n_76\ : STD_LOGIC;
  signal \buff3_reg__0_n_77\ : STD_LOGIC;
  signal \buff3_reg__0_n_78\ : STD_LOGIC;
  signal \buff3_reg__0_n_79\ : STD_LOGIC;
  signal \buff3_reg__0_n_80\ : STD_LOGIC;
  signal \buff3_reg__0_n_81\ : STD_LOGIC;
  signal \buff3_reg__0_n_82\ : STD_LOGIC;
  signal \buff3_reg__0_n_83\ : STD_LOGIC;
  signal \buff3_reg__0_n_84\ : STD_LOGIC;
  signal \buff3_reg__0_n_85\ : STD_LOGIC;
  signal \buff3_reg__0_n_86\ : STD_LOGIC;
  signal \buff3_reg__0_n_87\ : STD_LOGIC;
  signal \buff3_reg__0_n_88\ : STD_LOGIC;
  signal \buff3_reg__0_n_89\ : STD_LOGIC;
  signal \buff3_reg__0_n_90\ : STD_LOGIC;
  signal \buff3_reg__0_n_91\ : STD_LOGIC;
  signal \buff3_reg__0_n_92\ : STD_LOGIC;
  signal \buff3_reg__0_n_93\ : STD_LOGIC;
  signal \buff3_reg__0_n_94\ : STD_LOGIC;
  signal \buff3_reg__0_n_95\ : STD_LOGIC;
  signal \buff3_reg__0_n_96\ : STD_LOGIC;
  signal \buff3_reg__0_n_97\ : STD_LOGIC;
  signal \buff3_reg__0_n_98\ : STD_LOGIC;
  signal \buff3_reg__0_n_99\ : STD_LOGIC;
  signal NLW_buff1_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_buff1_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_buff1_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_buff1_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_buff1_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_buff1_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_buff1_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_buff1_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_buff1_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_buff2_reg__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff2_reg__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff2_reg__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff2_reg__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff2_reg__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff2_reg__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff2_reg__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_buff2_reg__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_buff2_reg__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_buff2_reg__0_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_buff3_reg__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff3_reg__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff3_reg__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff3_reg__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff3_reg__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff3_reg__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_buff3_reg__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_buff3_reg__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_buff3_reg__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_buff3_reg__0_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute srl_bus_name : string;
  attribute srl_bus_name of \buff4_reg[0]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name : string;
  attribute srl_name of \buff4_reg[0]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[0]_srl3 ";
  attribute srl_bus_name of \buff4_reg[10]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[10]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[10]_srl3 ";
  attribute srl_bus_name of \buff4_reg[11]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[11]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[11]_srl3 ";
  attribute srl_bus_name of \buff4_reg[12]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[12]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[12]_srl3 ";
  attribute srl_bus_name of \buff4_reg[13]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[13]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[13]_srl3 ";
  attribute srl_bus_name of \buff4_reg[14]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[14]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[14]_srl3 ";
  attribute srl_bus_name of \buff4_reg[15]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[15]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[15]_srl3 ";
  attribute srl_bus_name of \buff4_reg[16]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[16]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[16]_srl3 ";
  attribute srl_bus_name of \buff4_reg[1]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[1]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[1]_srl3 ";
  attribute srl_bus_name of \buff4_reg[2]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[2]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[2]_srl3 ";
  attribute srl_bus_name of \buff4_reg[3]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[3]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[3]_srl3 ";
  attribute srl_bus_name of \buff4_reg[4]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[4]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[4]_srl3 ";
  attribute srl_bus_name of \buff4_reg[5]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[5]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[5]_srl3 ";
  attribute srl_bus_name of \buff4_reg[6]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[6]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[6]_srl3 ";
  attribute srl_bus_name of \buff4_reg[7]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[7]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[7]_srl3 ";
  attribute srl_bus_name of \buff4_reg[8]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[8]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[8]_srl3 ";
  attribute srl_bus_name of \buff4_reg[9]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg ";
  attribute srl_name of \buff4_reg[9]_srl3\ : label is "inst/\hls_macc_mul_32s_bkb_U1/hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg[9]_srl3 ";
begin
\a_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(17),
      Q => a_reg0(17),
      R => '0'
    );
\a_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(18),
      Q => a_reg0(18),
      R => '0'
    );
\a_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(19),
      Q => a_reg0(19),
      R => '0'
    );
\a_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(20),
      Q => a_reg0(20),
      R => '0'
    );
\a_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(21),
      Q => a_reg0(21),
      R => '0'
    );
\a_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(22),
      Q => a_reg0(22),
      R => '0'
    );
\a_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(23),
      Q => a_reg0(23),
      R => '0'
    );
\a_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(24),
      Q => a_reg0(24),
      R => '0'
    );
\a_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(25),
      Q => a_reg0(25),
      R => '0'
    );
\a_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(26),
      Q => a_reg0(26),
      R => '0'
    );
\a_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(27),
      Q => a_reg0(27),
      R => '0'
    );
\a_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(28),
      Q => a_reg0(28),
      R => '0'
    );
\a_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(29),
      Q => a_reg0(29),
      R => '0'
    );
\a_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(30),
      Q => a_reg0(30),
      R => '0'
    );
\a_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_b_reg[31]\(31),
      Q => a_reg0(31),
      R => '0'
    );
\b_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(0),
      Q => b_reg0(0),
      R => '0'
    );
\b_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(10),
      Q => b_reg0(10),
      R => '0'
    );
\b_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(11),
      Q => b_reg0(11),
      R => '0'
    );
\b_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(12),
      Q => b_reg0(12),
      R => '0'
    );
\b_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(13),
      Q => b_reg0(13),
      R => '0'
    );
\b_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(14),
      Q => b_reg0(14),
      R => '0'
    );
\b_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(15),
      Q => b_reg0(15),
      R => '0'
    );
\b_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(16),
      Q => b_reg0(16),
      R => '0'
    );
\b_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(1),
      Q => b_reg0(1),
      R => '0'
    );
\b_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(2),
      Q => b_reg0(2),
      R => '0'
    );
\b_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(3),
      Q => b_reg0(3),
      R => '0'
    );
\b_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(4),
      Q => b_reg0(4),
      R => '0'
    );
\b_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(5),
      Q => b_reg0(5),
      R => '0'
    );
\b_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(6),
      Q => b_reg0(6),
      R => '0'
    );
\b_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(7),
      Q => b_reg0(7),
      R => '0'
    );
\b_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(8),
      Q => b_reg0(8),
      R => '0'
    );
\b_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \int_a_reg[31]\(9),
      Q => b_reg0(9),
      R => '0'
    );
buff1_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => \int_b_reg[31]\(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_buff1_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => '0',
      B(16 downto 0) => \int_a_reg[31]\(16 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_buff1_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_buff1_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_buff1_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '1',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '1',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '1',
      CEP => '1',
      CLK => ap_clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_buff1_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_buff1_reg_OVERFLOW_UNCONNECTED,
      P(47) => buff1_reg_n_58,
      P(46) => buff1_reg_n_59,
      P(45) => buff1_reg_n_60,
      P(44) => buff1_reg_n_61,
      P(43) => buff1_reg_n_62,
      P(42) => buff1_reg_n_63,
      P(41) => buff1_reg_n_64,
      P(40) => buff1_reg_n_65,
      P(39) => buff1_reg_n_66,
      P(38) => buff1_reg_n_67,
      P(37) => buff1_reg_n_68,
      P(36) => buff1_reg_n_69,
      P(35) => buff1_reg_n_70,
      P(34) => buff1_reg_n_71,
      P(33) => buff1_reg_n_72,
      P(32) => buff1_reg_n_73,
      P(31) => buff1_reg_n_74,
      P(30) => buff1_reg_n_75,
      P(29) => buff1_reg_n_76,
      P(28) => buff1_reg_n_77,
      P(27) => buff1_reg_n_78,
      P(26) => buff1_reg_n_79,
      P(25) => buff1_reg_n_80,
      P(24) => buff1_reg_n_81,
      P(23) => buff1_reg_n_82,
      P(22) => buff1_reg_n_83,
      P(21) => buff1_reg_n_84,
      P(20) => buff1_reg_n_85,
      P(19) => buff1_reg_n_86,
      P(18) => buff1_reg_n_87,
      P(17) => buff1_reg_n_88,
      P(16) => buff1_reg_n_89,
      P(15) => buff1_reg_n_90,
      P(14) => buff1_reg_n_91,
      P(13) => buff1_reg_n_92,
      P(12) => buff1_reg_n_93,
      P(11) => buff1_reg_n_94,
      P(10) => buff1_reg_n_95,
      P(9) => buff1_reg_n_96,
      P(8) => buff1_reg_n_97,
      P(7) => buff1_reg_n_98,
      P(6) => buff1_reg_n_99,
      P(5) => buff1_reg_n_100,
      P(4) => buff1_reg_n_101,
      P(3) => buff1_reg_n_102,
      P(2) => buff1_reg_n_103,
      P(1) => buff1_reg_n_104,
      P(0) => buff1_reg_n_105,
      PATTERNBDETECT => NLW_buff1_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_buff1_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => buff1_reg_n_106,
      PCOUT(46) => buff1_reg_n_107,
      PCOUT(45) => buff1_reg_n_108,
      PCOUT(44) => buff1_reg_n_109,
      PCOUT(43) => buff1_reg_n_110,
      PCOUT(42) => buff1_reg_n_111,
      PCOUT(41) => buff1_reg_n_112,
      PCOUT(40) => buff1_reg_n_113,
      PCOUT(39) => buff1_reg_n_114,
      PCOUT(38) => buff1_reg_n_115,
      PCOUT(37) => buff1_reg_n_116,
      PCOUT(36) => buff1_reg_n_117,
      PCOUT(35) => buff1_reg_n_118,
      PCOUT(34) => buff1_reg_n_119,
      PCOUT(33) => buff1_reg_n_120,
      PCOUT(32) => buff1_reg_n_121,
      PCOUT(31) => buff1_reg_n_122,
      PCOUT(30) => buff1_reg_n_123,
      PCOUT(29) => buff1_reg_n_124,
      PCOUT(28) => buff1_reg_n_125,
      PCOUT(27) => buff1_reg_n_126,
      PCOUT(26) => buff1_reg_n_127,
      PCOUT(25) => buff1_reg_n_128,
      PCOUT(24) => buff1_reg_n_129,
      PCOUT(23) => buff1_reg_n_130,
      PCOUT(22) => buff1_reg_n_131,
      PCOUT(21) => buff1_reg_n_132,
      PCOUT(20) => buff1_reg_n_133,
      PCOUT(19) => buff1_reg_n_134,
      PCOUT(18) => buff1_reg_n_135,
      PCOUT(17) => buff1_reg_n_136,
      PCOUT(16) => buff1_reg_n_137,
      PCOUT(15) => buff1_reg_n_138,
      PCOUT(14) => buff1_reg_n_139,
      PCOUT(13) => buff1_reg_n_140,
      PCOUT(12) => buff1_reg_n_141,
      PCOUT(11) => buff1_reg_n_142,
      PCOUT(10) => buff1_reg_n_143,
      PCOUT(9) => buff1_reg_n_144,
      PCOUT(8) => buff1_reg_n_145,
      PCOUT(7) => buff1_reg_n_146,
      PCOUT(6) => buff1_reg_n_147,
      PCOUT(5) => buff1_reg_n_148,
      PCOUT(4) => buff1_reg_n_149,
      PCOUT(3) => buff1_reg_n_150,
      PCOUT(2) => buff1_reg_n_151,
      PCOUT(1) => buff1_reg_n_152,
      PCOUT(0) => buff1_reg_n_153,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_buff1_reg_UNDERFLOW_UNCONNECTED
    );
\buff2_reg__0\: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 2,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 2,
      BREG => 2,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => \int_b_reg[31]\(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_buff2_reg__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => \int_a_reg[31]\(31),
      B(16) => \int_a_reg[31]\(31),
      B(15) => \int_a_reg[31]\(31),
      B(14 downto 0) => \int_a_reg[31]\(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_buff2_reg__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_buff2_reg__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_buff2_reg__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '1',
      CEB2 => '1',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '1',
      CEP => '1',
      CLK => ap_clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_buff2_reg__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(6 downto 0) => B"1010101",
      OVERFLOW => \NLW_buff2_reg__0_OVERFLOW_UNCONNECTED\,
      P(47 downto 0) => \NLW_buff2_reg__0_P_UNCONNECTED\(47 downto 0),
      PATTERNBDETECT => \NLW_buff2_reg__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_buff2_reg__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47) => buff1_reg_n_106,
      PCIN(46) => buff1_reg_n_107,
      PCIN(45) => buff1_reg_n_108,
      PCIN(44) => buff1_reg_n_109,
      PCIN(43) => buff1_reg_n_110,
      PCIN(42) => buff1_reg_n_111,
      PCIN(41) => buff1_reg_n_112,
      PCIN(40) => buff1_reg_n_113,
      PCIN(39) => buff1_reg_n_114,
      PCIN(38) => buff1_reg_n_115,
      PCIN(37) => buff1_reg_n_116,
      PCIN(36) => buff1_reg_n_117,
      PCIN(35) => buff1_reg_n_118,
      PCIN(34) => buff1_reg_n_119,
      PCIN(33) => buff1_reg_n_120,
      PCIN(32) => buff1_reg_n_121,
      PCIN(31) => buff1_reg_n_122,
      PCIN(30) => buff1_reg_n_123,
      PCIN(29) => buff1_reg_n_124,
      PCIN(28) => buff1_reg_n_125,
      PCIN(27) => buff1_reg_n_126,
      PCIN(26) => buff1_reg_n_127,
      PCIN(25) => buff1_reg_n_128,
      PCIN(24) => buff1_reg_n_129,
      PCIN(23) => buff1_reg_n_130,
      PCIN(22) => buff1_reg_n_131,
      PCIN(21) => buff1_reg_n_132,
      PCIN(20) => buff1_reg_n_133,
      PCIN(19) => buff1_reg_n_134,
      PCIN(18) => buff1_reg_n_135,
      PCIN(17) => buff1_reg_n_136,
      PCIN(16) => buff1_reg_n_137,
      PCIN(15) => buff1_reg_n_138,
      PCIN(14) => buff1_reg_n_139,
      PCIN(13) => buff1_reg_n_140,
      PCIN(12) => buff1_reg_n_141,
      PCIN(11) => buff1_reg_n_142,
      PCIN(10) => buff1_reg_n_143,
      PCIN(9) => buff1_reg_n_144,
      PCIN(8) => buff1_reg_n_145,
      PCIN(7) => buff1_reg_n_146,
      PCIN(6) => buff1_reg_n_147,
      PCIN(5) => buff1_reg_n_148,
      PCIN(4) => buff1_reg_n_149,
      PCIN(3) => buff1_reg_n_150,
      PCIN(2) => buff1_reg_n_151,
      PCIN(1) => buff1_reg_n_152,
      PCIN(0) => buff1_reg_n_153,
      PCOUT(47) => \buff2_reg__0_n_106\,
      PCOUT(46) => \buff2_reg__0_n_107\,
      PCOUT(45) => \buff2_reg__0_n_108\,
      PCOUT(44) => \buff2_reg__0_n_109\,
      PCOUT(43) => \buff2_reg__0_n_110\,
      PCOUT(42) => \buff2_reg__0_n_111\,
      PCOUT(41) => \buff2_reg__0_n_112\,
      PCOUT(40) => \buff2_reg__0_n_113\,
      PCOUT(39) => \buff2_reg__0_n_114\,
      PCOUT(38) => \buff2_reg__0_n_115\,
      PCOUT(37) => \buff2_reg__0_n_116\,
      PCOUT(36) => \buff2_reg__0_n_117\,
      PCOUT(35) => \buff2_reg__0_n_118\,
      PCOUT(34) => \buff2_reg__0_n_119\,
      PCOUT(33) => \buff2_reg__0_n_120\,
      PCOUT(32) => \buff2_reg__0_n_121\,
      PCOUT(31) => \buff2_reg__0_n_122\,
      PCOUT(30) => \buff2_reg__0_n_123\,
      PCOUT(29) => \buff2_reg__0_n_124\,
      PCOUT(28) => \buff2_reg__0_n_125\,
      PCOUT(27) => \buff2_reg__0_n_126\,
      PCOUT(26) => \buff2_reg__0_n_127\,
      PCOUT(25) => \buff2_reg__0_n_128\,
      PCOUT(24) => \buff2_reg__0_n_129\,
      PCOUT(23) => \buff2_reg__0_n_130\,
      PCOUT(22) => \buff2_reg__0_n_131\,
      PCOUT(21) => \buff2_reg__0_n_132\,
      PCOUT(20) => \buff2_reg__0_n_133\,
      PCOUT(19) => \buff2_reg__0_n_134\,
      PCOUT(18) => \buff2_reg__0_n_135\,
      PCOUT(17) => \buff2_reg__0_n_136\,
      PCOUT(16) => \buff2_reg__0_n_137\,
      PCOUT(15) => \buff2_reg__0_n_138\,
      PCOUT(14) => \buff2_reg__0_n_139\,
      PCOUT(13) => \buff2_reg__0_n_140\,
      PCOUT(12) => \buff2_reg__0_n_141\,
      PCOUT(11) => \buff2_reg__0_n_142\,
      PCOUT(10) => \buff2_reg__0_n_143\,
      PCOUT(9) => \buff2_reg__0_n_144\,
      PCOUT(8) => \buff2_reg__0_n_145\,
      PCOUT(7) => \buff2_reg__0_n_146\,
      PCOUT(6) => \buff2_reg__0_n_147\,
      PCOUT(5) => \buff2_reg__0_n_148\,
      PCOUT(4) => \buff2_reg__0_n_149\,
      PCOUT(3) => \buff2_reg__0_n_150\,
      PCOUT(2) => \buff2_reg__0_n_151\,
      PCOUT(1) => \buff2_reg__0_n_152\,
      PCOUT(0) => \buff2_reg__0_n_153\,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_buff2_reg__0_UNDERFLOW_UNCONNECTED\
    );
\buff3_reg__0\: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 2,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 2,
      BREG => 2,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => b_reg0(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_buff3_reg__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => a_reg0(31),
      B(16) => a_reg0(31),
      B(15) => a_reg0(31),
      B(14 downto 0) => a_reg0(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_buff3_reg__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_buff3_reg__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_buff3_reg__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '1',
      CEB2 => '1',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '1',
      CEP => '1',
      CLK => ap_clk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_buff3_reg__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => \NLW_buff3_reg__0_OVERFLOW_UNCONNECTED\,
      P(47) => \buff3_reg__0_n_58\,
      P(46) => \buff3_reg__0_n_59\,
      P(45) => \buff3_reg__0_n_60\,
      P(44) => \buff3_reg__0_n_61\,
      P(43) => \buff3_reg__0_n_62\,
      P(42) => \buff3_reg__0_n_63\,
      P(41) => \buff3_reg__0_n_64\,
      P(40) => \buff3_reg__0_n_65\,
      P(39) => \buff3_reg__0_n_66\,
      P(38) => \buff3_reg__0_n_67\,
      P(37) => \buff3_reg__0_n_68\,
      P(36) => \buff3_reg__0_n_69\,
      P(35) => \buff3_reg__0_n_70\,
      P(34) => \buff3_reg__0_n_71\,
      P(33) => \buff3_reg__0_n_72\,
      P(32) => \buff3_reg__0_n_73\,
      P(31) => \buff3_reg__0_n_74\,
      P(30) => \buff3_reg__0_n_75\,
      P(29) => \buff3_reg__0_n_76\,
      P(28) => \buff3_reg__0_n_77\,
      P(27) => \buff3_reg__0_n_78\,
      P(26) => \buff3_reg__0_n_79\,
      P(25) => \buff3_reg__0_n_80\,
      P(24) => \buff3_reg__0_n_81\,
      P(23) => \buff3_reg__0_n_82\,
      P(22) => \buff3_reg__0_n_83\,
      P(21) => \buff3_reg__0_n_84\,
      P(20) => \buff3_reg__0_n_85\,
      P(19) => \buff3_reg__0_n_86\,
      P(18) => \buff3_reg__0_n_87\,
      P(17) => \buff3_reg__0_n_88\,
      P(16) => \buff3_reg__0_n_89\,
      P(15) => \buff3_reg__0_n_90\,
      P(14) => \buff3_reg__0_n_91\,
      P(13) => \buff3_reg__0_n_92\,
      P(12) => \buff3_reg__0_n_93\,
      P(11) => \buff3_reg__0_n_94\,
      P(10) => \buff3_reg__0_n_95\,
      P(9) => \buff3_reg__0_n_96\,
      P(8) => \buff3_reg__0_n_97\,
      P(7) => \buff3_reg__0_n_98\,
      P(6) => \buff3_reg__0_n_99\,
      P(5) => \buff3_reg__0_n_100\,
      P(4) => \buff3_reg__0_n_101\,
      P(3) => \buff3_reg__0_n_102\,
      P(2) => \buff3_reg__0_n_103\,
      P(1) => \buff3_reg__0_n_104\,
      P(0) => \buff3_reg__0_n_105\,
      PATTERNBDETECT => \NLW_buff3_reg__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_buff3_reg__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47) => \buff2_reg__0_n_106\,
      PCIN(46) => \buff2_reg__0_n_107\,
      PCIN(45) => \buff2_reg__0_n_108\,
      PCIN(44) => \buff2_reg__0_n_109\,
      PCIN(43) => \buff2_reg__0_n_110\,
      PCIN(42) => \buff2_reg__0_n_111\,
      PCIN(41) => \buff2_reg__0_n_112\,
      PCIN(40) => \buff2_reg__0_n_113\,
      PCIN(39) => \buff2_reg__0_n_114\,
      PCIN(38) => \buff2_reg__0_n_115\,
      PCIN(37) => \buff2_reg__0_n_116\,
      PCIN(36) => \buff2_reg__0_n_117\,
      PCIN(35) => \buff2_reg__0_n_118\,
      PCIN(34) => \buff2_reg__0_n_119\,
      PCIN(33) => \buff2_reg__0_n_120\,
      PCIN(32) => \buff2_reg__0_n_121\,
      PCIN(31) => \buff2_reg__0_n_122\,
      PCIN(30) => \buff2_reg__0_n_123\,
      PCIN(29) => \buff2_reg__0_n_124\,
      PCIN(28) => \buff2_reg__0_n_125\,
      PCIN(27) => \buff2_reg__0_n_126\,
      PCIN(26) => \buff2_reg__0_n_127\,
      PCIN(25) => \buff2_reg__0_n_128\,
      PCIN(24) => \buff2_reg__0_n_129\,
      PCIN(23) => \buff2_reg__0_n_130\,
      PCIN(22) => \buff2_reg__0_n_131\,
      PCIN(21) => \buff2_reg__0_n_132\,
      PCIN(20) => \buff2_reg__0_n_133\,
      PCIN(19) => \buff2_reg__0_n_134\,
      PCIN(18) => \buff2_reg__0_n_135\,
      PCIN(17) => \buff2_reg__0_n_136\,
      PCIN(16) => \buff2_reg__0_n_137\,
      PCIN(15) => \buff2_reg__0_n_138\,
      PCIN(14) => \buff2_reg__0_n_139\,
      PCIN(13) => \buff2_reg__0_n_140\,
      PCIN(12) => \buff2_reg__0_n_141\,
      PCIN(11) => \buff2_reg__0_n_142\,
      PCIN(10) => \buff2_reg__0_n_143\,
      PCIN(9) => \buff2_reg__0_n_144\,
      PCIN(8) => \buff2_reg__0_n_145\,
      PCIN(7) => \buff2_reg__0_n_146\,
      PCIN(6) => \buff2_reg__0_n_147\,
      PCIN(5) => \buff2_reg__0_n_148\,
      PCIN(4) => \buff2_reg__0_n_149\,
      PCIN(3) => \buff2_reg__0_n_150\,
      PCIN(2) => \buff2_reg__0_n_151\,
      PCIN(1) => \buff2_reg__0_n_152\,
      PCIN(0) => \buff2_reg__0_n_153\,
      PCOUT(47 downto 0) => \NLW_buff3_reg__0_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_buff3_reg__0_UNDERFLOW_UNCONNECTED\
    );
\buff4_reg[0]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_105\,
      Q => D(17),
      R => '0'
    );
\buff4_reg[0]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_105,
      Q => D(0)
    );
\buff4_reg[10]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_95\,
      Q => D(27),
      R => '0'
    );
\buff4_reg[10]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_95,
      Q => D(10)
    );
\buff4_reg[11]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_94\,
      Q => D(28),
      R => '0'
    );
\buff4_reg[11]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_94,
      Q => D(11)
    );
\buff4_reg[12]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_93\,
      Q => D(29),
      R => '0'
    );
\buff4_reg[12]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_93,
      Q => D(12)
    );
\buff4_reg[13]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_92\,
      Q => D(30),
      R => '0'
    );
\buff4_reg[13]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_92,
      Q => D(13)
    );
\buff4_reg[14]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_91\,
      Q => D(31),
      R => '0'
    );
\buff4_reg[14]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_91,
      Q => D(14)
    );
\buff4_reg[15]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_90,
      Q => D(15)
    );
\buff4_reg[16]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_89,
      Q => D(16)
    );
\buff4_reg[1]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_104\,
      Q => D(18),
      R => '0'
    );
\buff4_reg[1]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_104,
      Q => D(1)
    );
\buff4_reg[2]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_103\,
      Q => D(19),
      R => '0'
    );
\buff4_reg[2]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_103,
      Q => D(2)
    );
\buff4_reg[3]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_102\,
      Q => D(20),
      R => '0'
    );
\buff4_reg[3]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_102,
      Q => D(3)
    );
\buff4_reg[4]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_101\,
      Q => D(21),
      R => '0'
    );
\buff4_reg[4]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_101,
      Q => D(4)
    );
\buff4_reg[5]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_100\,
      Q => D(22),
      R => '0'
    );
\buff4_reg[5]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_100,
      Q => D(5)
    );
\buff4_reg[6]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_99\,
      Q => D(23),
      R => '0'
    );
\buff4_reg[6]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_99,
      Q => D(6)
    );
\buff4_reg[7]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_98\,
      Q => D(24),
      R => '0'
    );
\buff4_reg[7]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_98,
      Q => D(7)
    );
\buff4_reg[8]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_97\,
      Q => D(25),
      R => '0'
    );
\buff4_reg[8]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_97,
      Q => D(8)
    );
\buff4_reg[9]__0\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \buff3_reg__0_n_96\,
      Q => D(26),
      R => '0'
    );
\buff4_reg[9]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => ap_clk,
      D => buff1_reg_n_96,
      Q => D(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb is
  port (
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_clk : in STD_LOGIC;
    \int_a_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \int_b_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb : entity is "hls_macc_mul_32s_bkb";
end zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb;

architecture STRUCTURE of zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb is
begin
hls_macc_mul_32s_bkb_MulnS_0_U: entity work.zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb_MulnS_0
     port map (
      D(31 downto 0) => D(31 downto 0),
      ap_clk => ap_clk,
      \int_a_reg[31]\(31 downto 0) => \int_a_reg[31]\(31 downto 0),
      \int_b_reg[31]\(31 downto 0) => \int_b_reg[31]\(31 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zybo_zynq_design_hls_macc_0_0_hls_macc is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_AWVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_AWREADY : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_WVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_WREADY : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_ARVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_ARREADY : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_RVALID : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_RREADY : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_BVALID : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_BREADY : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    interrupt : out STD_LOGIC
  );
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is 32;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_ADDR_WIDTH : integer;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_ADDR_WIDTH of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is 6;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_DATA_WIDTH : integer;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_DATA_WIDTH of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is 32;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_WSTRB_WIDTH : integer;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_WSTRB_WIDTH of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is 4;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is 4;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "hls_macc";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b000000001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b000000010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b000000100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b000001000";
  attribute ap_ST_fsm_state5 : string;
  attribute ap_ST_fsm_state5 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b000010000";
  attribute ap_ST_fsm_state6 : string;
  attribute ap_ST_fsm_state6 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b000100000";
  attribute ap_ST_fsm_state7 : string;
  attribute ap_ST_fsm_state7 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b001000000";
  attribute ap_ST_fsm_state8 : string;
  attribute ap_ST_fsm_state8 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b010000000";
  attribute ap_ST_fsm_state9 : string;
  attribute ap_ST_fsm_state9 of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "9'b100000000";
  attribute hls_module : string;
  attribute hls_module of zybo_zynq_design_hls_macc_0_0_hls_macc : entity is "yes";
end zybo_zynq_design_hls_macc_0_0_hls_macc;

architecture STRUCTURE of zybo_zynq_design_hls_macc_0_0_hls_macc is
  signal \<const0>\ : STD_LOGIC;
  signal a : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \acc_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[0]_i_5_n_0\ : STD_LOGIC;
  signal \acc_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[12]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[12]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[12]_i_5_n_0\ : STD_LOGIC;
  signal \acc_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[16]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[16]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[16]_i_5_n_0\ : STD_LOGIC;
  signal \acc_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[20]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[20]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[20]_i_5_n_0\ : STD_LOGIC;
  signal \acc_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[24]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[24]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[24]_i_5_n_0\ : STD_LOGIC;
  signal \acc_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[28]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[28]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[28]_i_5_n_0\ : STD_LOGIC;
  signal \acc_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[4]_i_5_n_0\ : STD_LOGIC;
  signal \acc_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \acc_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \acc_reg[8]_i_4_n_0\ : STD_LOGIC;
  signal \acc_reg[8]_i_5_n_0\ : STD_LOGIC;
  signal acc_reg_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \acc_reg_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal accum_clr_read_reg_85 : STD_LOGIC;
  signal \ap_CS_fsm[1]_i_3_n_0\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[1]\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[2]\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[3]\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[4]\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[5]\ : STD_LOGIC;
  signal ap_CS_fsm_state7 : STD_LOGIC;
  signal ap_CS_fsm_state9 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ap_rst_n_inv : STD_LOGIC;
  signal b : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_macc_HLS_MACC_PERIPH_BUS_s_axi_U_n_73 : STD_LOGIC;
  signal \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sel : STD_LOGIC;
  signal tmp_1_reg_100 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_acc_reg_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[3]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[4]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[5]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[6]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[7]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[8]\ : label is "none";
begin
  s_axi_HLS_MACC_PERIPH_BUS_BRESP(1) <= \<const0>\;
  s_axi_HLS_MACC_PERIPH_BUS_BRESP(0) <= \<const0>\;
  s_axi_HLS_MACC_PERIPH_BUS_RRESP(1) <= \<const0>\;
  s_axi_HLS_MACC_PERIPH_BUS_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\acc_reg[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(3),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(3),
      O => \acc_reg[0]_i_2_n_0\
    );
\acc_reg[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(2),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(2),
      O => \acc_reg[0]_i_3_n_0\
    );
\acc_reg[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(1),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(1),
      O => \acc_reg[0]_i_4_n_0\
    );
\acc_reg[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(0),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(0),
      O => \acc_reg[0]_i_5_n_0\
    );
\acc_reg[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(15),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(15),
      O => \acc_reg[12]_i_2_n_0\
    );
\acc_reg[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(14),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(14),
      O => \acc_reg[12]_i_3_n_0\
    );
\acc_reg[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(13),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(13),
      O => \acc_reg[12]_i_4_n_0\
    );
\acc_reg[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(12),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(12),
      O => \acc_reg[12]_i_5_n_0\
    );
\acc_reg[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(19),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(19),
      O => \acc_reg[16]_i_2_n_0\
    );
\acc_reg[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(18),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(18),
      O => \acc_reg[16]_i_3_n_0\
    );
\acc_reg[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(17),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(17),
      O => \acc_reg[16]_i_4_n_0\
    );
\acc_reg[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(16),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(16),
      O => \acc_reg[16]_i_5_n_0\
    );
\acc_reg[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(23),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(23),
      O => \acc_reg[20]_i_2_n_0\
    );
\acc_reg[20]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(22),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(22),
      O => \acc_reg[20]_i_3_n_0\
    );
\acc_reg[20]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(21),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(21),
      O => \acc_reg[20]_i_4_n_0\
    );
\acc_reg[20]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(20),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(20),
      O => \acc_reg[20]_i_5_n_0\
    );
\acc_reg[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(27),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(27),
      O => \acc_reg[24]_i_2_n_0\
    );
\acc_reg[24]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(26),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(26),
      O => \acc_reg[24]_i_3_n_0\
    );
\acc_reg[24]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(25),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(25),
      O => \acc_reg[24]_i_4_n_0\
    );
\acc_reg[24]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(24),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(24),
      O => \acc_reg[24]_i_5_n_0\
    );
\acc_reg[28]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(31),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(31),
      O => \acc_reg[28]_i_2_n_0\
    );
\acc_reg[28]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(30),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(30),
      O => \acc_reg[28]_i_3_n_0\
    );
\acc_reg[28]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(29),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(29),
      O => \acc_reg[28]_i_4_n_0\
    );
\acc_reg[28]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(28),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(28),
      O => \acc_reg[28]_i_5_n_0\
    );
\acc_reg[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(7),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(7),
      O => \acc_reg[4]_i_2_n_0\
    );
\acc_reg[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(6),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(6),
      O => \acc_reg[4]_i_3_n_0\
    );
\acc_reg[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(5),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(5),
      O => \acc_reg[4]_i_4_n_0\
    );
\acc_reg[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(4),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(4),
      O => \acc_reg[4]_i_5_n_0\
    );
\acc_reg[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(11),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(11),
      O => \acc_reg[8]_i_2_n_0\
    );
\acc_reg[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(10),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(10),
      O => \acc_reg[8]_i_3_n_0\
    );
\acc_reg[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(9),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(9),
      O => \acc_reg[8]_i_4_n_0\
    );
\acc_reg[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => tmp_1_reg_100(8),
      I1 => accum_clr_read_reg_85,
      I2 => acc_reg_reg(8),
      O => \acc_reg[8]_i_5_n_0\
    );
\acc_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[0]_i_1_n_7\,
      Q => acc_reg_reg(0),
      R => '0'
    );
\acc_reg_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc_reg_reg[0]_i_1_n_0\,
      CO(2) => \acc_reg_reg[0]_i_1_n_1\,
      CO(1) => \acc_reg_reg[0]_i_1_n_2\,
      CO(0) => \acc_reg_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_1_reg_100(3 downto 0),
      O(3) => \acc_reg_reg[0]_i_1_n_4\,
      O(2) => \acc_reg_reg[0]_i_1_n_5\,
      O(1) => \acc_reg_reg[0]_i_1_n_6\,
      O(0) => \acc_reg_reg[0]_i_1_n_7\,
      S(3) => \acc_reg[0]_i_2_n_0\,
      S(2) => \acc_reg[0]_i_3_n_0\,
      S(1) => \acc_reg[0]_i_4_n_0\,
      S(0) => \acc_reg[0]_i_5_n_0\
    );
\acc_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[8]_i_1_n_5\,
      Q => acc_reg_reg(10),
      R => '0'
    );
\acc_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[8]_i_1_n_4\,
      Q => acc_reg_reg(11),
      R => '0'
    );
\acc_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[12]_i_1_n_7\,
      Q => acc_reg_reg(12),
      R => '0'
    );
\acc_reg_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg_reg[8]_i_1_n_0\,
      CO(3) => \acc_reg_reg[12]_i_1_n_0\,
      CO(2) => \acc_reg_reg[12]_i_1_n_1\,
      CO(1) => \acc_reg_reg[12]_i_1_n_2\,
      CO(0) => \acc_reg_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_1_reg_100(15 downto 12),
      O(3) => \acc_reg_reg[12]_i_1_n_4\,
      O(2) => \acc_reg_reg[12]_i_1_n_5\,
      O(1) => \acc_reg_reg[12]_i_1_n_6\,
      O(0) => \acc_reg_reg[12]_i_1_n_7\,
      S(3) => \acc_reg[12]_i_2_n_0\,
      S(2) => \acc_reg[12]_i_3_n_0\,
      S(1) => \acc_reg[12]_i_4_n_0\,
      S(0) => \acc_reg[12]_i_5_n_0\
    );
\acc_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[12]_i_1_n_6\,
      Q => acc_reg_reg(13),
      R => '0'
    );
\acc_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[12]_i_1_n_5\,
      Q => acc_reg_reg(14),
      R => '0'
    );
\acc_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[12]_i_1_n_4\,
      Q => acc_reg_reg(15),
      R => '0'
    );
\acc_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[16]_i_1_n_7\,
      Q => acc_reg_reg(16),
      R => '0'
    );
\acc_reg_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg_reg[12]_i_1_n_0\,
      CO(3) => \acc_reg_reg[16]_i_1_n_0\,
      CO(2) => \acc_reg_reg[16]_i_1_n_1\,
      CO(1) => \acc_reg_reg[16]_i_1_n_2\,
      CO(0) => \acc_reg_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_1_reg_100(19 downto 16),
      O(3) => \acc_reg_reg[16]_i_1_n_4\,
      O(2) => \acc_reg_reg[16]_i_1_n_5\,
      O(1) => \acc_reg_reg[16]_i_1_n_6\,
      O(0) => \acc_reg_reg[16]_i_1_n_7\,
      S(3) => \acc_reg[16]_i_2_n_0\,
      S(2) => \acc_reg[16]_i_3_n_0\,
      S(1) => \acc_reg[16]_i_4_n_0\,
      S(0) => \acc_reg[16]_i_5_n_0\
    );
\acc_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[16]_i_1_n_6\,
      Q => acc_reg_reg(17),
      R => '0'
    );
\acc_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[16]_i_1_n_5\,
      Q => acc_reg_reg(18),
      R => '0'
    );
\acc_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[16]_i_1_n_4\,
      Q => acc_reg_reg(19),
      R => '0'
    );
\acc_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[0]_i_1_n_6\,
      Q => acc_reg_reg(1),
      R => '0'
    );
\acc_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[20]_i_1_n_7\,
      Q => acc_reg_reg(20),
      R => '0'
    );
\acc_reg_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg_reg[16]_i_1_n_0\,
      CO(3) => \acc_reg_reg[20]_i_1_n_0\,
      CO(2) => \acc_reg_reg[20]_i_1_n_1\,
      CO(1) => \acc_reg_reg[20]_i_1_n_2\,
      CO(0) => \acc_reg_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_1_reg_100(23 downto 20),
      O(3) => \acc_reg_reg[20]_i_1_n_4\,
      O(2) => \acc_reg_reg[20]_i_1_n_5\,
      O(1) => \acc_reg_reg[20]_i_1_n_6\,
      O(0) => \acc_reg_reg[20]_i_1_n_7\,
      S(3) => \acc_reg[20]_i_2_n_0\,
      S(2) => \acc_reg[20]_i_3_n_0\,
      S(1) => \acc_reg[20]_i_4_n_0\,
      S(0) => \acc_reg[20]_i_5_n_0\
    );
\acc_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[20]_i_1_n_6\,
      Q => acc_reg_reg(21),
      R => '0'
    );
\acc_reg_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[20]_i_1_n_5\,
      Q => acc_reg_reg(22),
      R => '0'
    );
\acc_reg_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[20]_i_1_n_4\,
      Q => acc_reg_reg(23),
      R => '0'
    );
\acc_reg_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[24]_i_1_n_7\,
      Q => acc_reg_reg(24),
      R => '0'
    );
\acc_reg_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg_reg[20]_i_1_n_0\,
      CO(3) => \acc_reg_reg[24]_i_1_n_0\,
      CO(2) => \acc_reg_reg[24]_i_1_n_1\,
      CO(1) => \acc_reg_reg[24]_i_1_n_2\,
      CO(0) => \acc_reg_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_1_reg_100(27 downto 24),
      O(3) => \acc_reg_reg[24]_i_1_n_4\,
      O(2) => \acc_reg_reg[24]_i_1_n_5\,
      O(1) => \acc_reg_reg[24]_i_1_n_6\,
      O(0) => \acc_reg_reg[24]_i_1_n_7\,
      S(3) => \acc_reg[24]_i_2_n_0\,
      S(2) => \acc_reg[24]_i_3_n_0\,
      S(1) => \acc_reg[24]_i_4_n_0\,
      S(0) => \acc_reg[24]_i_5_n_0\
    );
\acc_reg_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[24]_i_1_n_6\,
      Q => acc_reg_reg(25),
      R => '0'
    );
\acc_reg_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[24]_i_1_n_5\,
      Q => acc_reg_reg(26),
      R => '0'
    );
\acc_reg_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[24]_i_1_n_4\,
      Q => acc_reg_reg(27),
      R => '0'
    );
\acc_reg_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[28]_i_1_n_7\,
      Q => acc_reg_reg(28),
      R => '0'
    );
\acc_reg_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg_reg[24]_i_1_n_0\,
      CO(3) => \NLW_acc_reg_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \acc_reg_reg[28]_i_1_n_1\,
      CO(1) => \acc_reg_reg[28]_i_1_n_2\,
      CO(0) => \acc_reg_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => tmp_1_reg_100(30 downto 28),
      O(3) => \acc_reg_reg[28]_i_1_n_4\,
      O(2) => \acc_reg_reg[28]_i_1_n_5\,
      O(1) => \acc_reg_reg[28]_i_1_n_6\,
      O(0) => \acc_reg_reg[28]_i_1_n_7\,
      S(3) => \acc_reg[28]_i_2_n_0\,
      S(2) => \acc_reg[28]_i_3_n_0\,
      S(1) => \acc_reg[28]_i_4_n_0\,
      S(0) => \acc_reg[28]_i_5_n_0\
    );
\acc_reg_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[28]_i_1_n_6\,
      Q => acc_reg_reg(29),
      R => '0'
    );
\acc_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[0]_i_1_n_5\,
      Q => acc_reg_reg(2),
      R => '0'
    );
\acc_reg_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[28]_i_1_n_5\,
      Q => acc_reg_reg(30),
      R => '0'
    );
\acc_reg_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[28]_i_1_n_4\,
      Q => acc_reg_reg(31),
      R => '0'
    );
\acc_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[0]_i_1_n_4\,
      Q => acc_reg_reg(3),
      R => '0'
    );
\acc_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[4]_i_1_n_7\,
      Q => acc_reg_reg(4),
      R => '0'
    );
\acc_reg_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg_reg[0]_i_1_n_0\,
      CO(3) => \acc_reg_reg[4]_i_1_n_0\,
      CO(2) => \acc_reg_reg[4]_i_1_n_1\,
      CO(1) => \acc_reg_reg[4]_i_1_n_2\,
      CO(0) => \acc_reg_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_1_reg_100(7 downto 4),
      O(3) => \acc_reg_reg[4]_i_1_n_4\,
      O(2) => \acc_reg_reg[4]_i_1_n_5\,
      O(1) => \acc_reg_reg[4]_i_1_n_6\,
      O(0) => \acc_reg_reg[4]_i_1_n_7\,
      S(3) => \acc_reg[4]_i_2_n_0\,
      S(2) => \acc_reg[4]_i_3_n_0\,
      S(1) => \acc_reg[4]_i_4_n_0\,
      S(0) => \acc_reg[4]_i_5_n_0\
    );
\acc_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[4]_i_1_n_6\,
      Q => acc_reg_reg(5),
      R => '0'
    );
\acc_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[4]_i_1_n_5\,
      Q => acc_reg_reg(6),
      R => '0'
    );
\acc_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[4]_i_1_n_4\,
      Q => acc_reg_reg(7),
      R => '0'
    );
\acc_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[8]_i_1_n_7\,
      Q => acc_reg_reg(8),
      R => '0'
    );
\acc_reg_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg_reg[4]_i_1_n_0\,
      CO(3) => \acc_reg_reg[8]_i_1_n_0\,
      CO(2) => \acc_reg_reg[8]_i_1_n_1\,
      CO(1) => \acc_reg_reg[8]_i_1_n_2\,
      CO(0) => \acc_reg_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => tmp_1_reg_100(11 downto 8),
      O(3) => \acc_reg_reg[8]_i_1_n_4\,
      O(2) => \acc_reg_reg[8]_i_1_n_5\,
      O(1) => \acc_reg_reg[8]_i_1_n_6\,
      O(0) => \acc_reg_reg[8]_i_1_n_7\,
      S(3) => \acc_reg[8]_i_2_n_0\,
      S(2) => \acc_reg[8]_i_3_n_0\,
      S(1) => \acc_reg[8]_i_4_n_0\,
      S(0) => \acc_reg[8]_i_5_n_0\
    );
\acc_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => sel,
      D => \acc_reg_reg[8]_i_1_n_6\,
      Q => acc_reg_reg(9),
      R => '0'
    );
\accum_clr_read_reg_85_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => hls_macc_HLS_MACC_PERIPH_BUS_s_axi_U_n_73,
      Q => accum_clr_read_reg_85,
      R => '0'
    );
\ap_CS_fsm[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_0_[4]\,
      I1 => \ap_CS_fsm_reg_n_0_[5]\,
      I2 => \ap_CS_fsm_reg_n_0_[2]\,
      I3 => \ap_CS_fsm_reg_n_0_[3]\,
      O => \ap_CS_fsm[1]_i_3_n_0\
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => \ap_CS_fsm_reg_n_0_[0]\,
      S => ap_rst_n_inv
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => \ap_CS_fsm_reg_n_0_[1]\,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \ap_CS_fsm_reg_n_0_[1]\,
      Q => \ap_CS_fsm_reg_n_0_[2]\,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \ap_CS_fsm_reg_n_0_[2]\,
      Q => \ap_CS_fsm_reg_n_0_[3]\,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \ap_CS_fsm_reg_n_0_[3]\,
      Q => \ap_CS_fsm_reg_n_0_[4]\,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \ap_CS_fsm_reg_n_0_[4]\,
      Q => \ap_CS_fsm_reg_n_0_[5]\,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \ap_CS_fsm_reg_n_0_[5]\,
      Q => ap_CS_fsm_state7,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_CS_fsm_state7,
      Q => sel,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => sel,
      Q => ap_CS_fsm_state9,
      R => ap_rst_n_inv
    );
hls_macc_HLS_MACC_PERIPH_BUS_s_axi_U: entity work.zybo_zynq_design_hls_macc_0_0_hls_macc_HLS_MACC_PERIPH_BUS_s_axi
     port map (
      D(1 downto 0) => ap_NS_fsm(1 downto 0),
      Q(4) => ap_CS_fsm_state9,
      Q(3) => sel,
      Q(2) => ap_CS_fsm_state7,
      Q(1) => \ap_CS_fsm_reg_n_0_[1]\,
      Q(0) => \ap_CS_fsm_reg_n_0_[0]\,
      SR(0) => ap_rst_n_inv,
      \a_reg0_reg[31]\(31 downto 0) => b(31 downto 0),
      \acc_reg_reg[31]\(31 downto 0) => acc_reg_reg(31 downto 0),
      accum_clr_read_reg_85 => accum_clr_read_reg_85,
      \accum_clr_read_reg_85_reg[0]\ => hls_macc_HLS_MACC_PERIPH_BUS_s_axi_U_n_73,
      \ap_CS_fsm_reg[4]\ => \ap_CS_fsm[1]_i_3_n_0\,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      \buff2_reg__0\(31 downto 0) => a(31 downto 0),
      interrupt => interrupt,
      \out\(2) => s_axi_HLS_MACC_PERIPH_BUS_BVALID,
      \out\(1) => s_axi_HLS_MACC_PERIPH_BUS_WREADY,
      \out\(0) => s_axi_HLS_MACC_PERIPH_BUS_AWREADY,
      s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_ARVALID => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      s_axi_HLS_MACC_PERIPH_BUS_AWADDR(5 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(5 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_AWVALID => s_axi_HLS_MACC_PERIPH_BUS_AWVALID,
      s_axi_HLS_MACC_PERIPH_BUS_BREADY => s_axi_HLS_MACC_PERIPH_BUS_BREADY,
      s_axi_HLS_MACC_PERIPH_BUS_RDATA(31 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_RDATA(31 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_RREADY => s_axi_HLS_MACC_PERIPH_BUS_RREADY,
      s_axi_HLS_MACC_PERIPH_BUS_RVALID(1) => s_axi_HLS_MACC_PERIPH_BUS_RVALID,
      s_axi_HLS_MACC_PERIPH_BUS_RVALID(0) => s_axi_HLS_MACC_PERIPH_BUS_ARREADY,
      s_axi_HLS_MACC_PERIPH_BUS_WDATA(31 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_WDATA(31 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_WVALID => s_axi_HLS_MACC_PERIPH_BUS_WVALID
    );
hls_macc_mul_32s_bkb_U1: entity work.zybo_zynq_design_hls_macc_0_0_hls_macc_mul_32s_bkb
     port map (
      D(31 downto 0) => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(31 downto 0),
      ap_clk => ap_clk,
      \int_a_reg[31]\(31 downto 0) => a(31 downto 0),
      \int_b_reg[31]\(31 downto 0) => b(31 downto 0)
    );
\tmp_1_reg_100_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(0),
      Q => tmp_1_reg_100(0),
      R => '0'
    );
\tmp_1_reg_100_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(10),
      Q => tmp_1_reg_100(10),
      R => '0'
    );
\tmp_1_reg_100_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(11),
      Q => tmp_1_reg_100(11),
      R => '0'
    );
\tmp_1_reg_100_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(12),
      Q => tmp_1_reg_100(12),
      R => '0'
    );
\tmp_1_reg_100_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(13),
      Q => tmp_1_reg_100(13),
      R => '0'
    );
\tmp_1_reg_100_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(14),
      Q => tmp_1_reg_100(14),
      R => '0'
    );
\tmp_1_reg_100_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(15),
      Q => tmp_1_reg_100(15),
      R => '0'
    );
\tmp_1_reg_100_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(16),
      Q => tmp_1_reg_100(16),
      R => '0'
    );
\tmp_1_reg_100_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(17),
      Q => tmp_1_reg_100(17),
      R => '0'
    );
\tmp_1_reg_100_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(18),
      Q => tmp_1_reg_100(18),
      R => '0'
    );
\tmp_1_reg_100_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(19),
      Q => tmp_1_reg_100(19),
      R => '0'
    );
\tmp_1_reg_100_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(1),
      Q => tmp_1_reg_100(1),
      R => '0'
    );
\tmp_1_reg_100_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(20),
      Q => tmp_1_reg_100(20),
      R => '0'
    );
\tmp_1_reg_100_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(21),
      Q => tmp_1_reg_100(21),
      R => '0'
    );
\tmp_1_reg_100_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(22),
      Q => tmp_1_reg_100(22),
      R => '0'
    );
\tmp_1_reg_100_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(23),
      Q => tmp_1_reg_100(23),
      R => '0'
    );
\tmp_1_reg_100_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(24),
      Q => tmp_1_reg_100(24),
      R => '0'
    );
\tmp_1_reg_100_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(25),
      Q => tmp_1_reg_100(25),
      R => '0'
    );
\tmp_1_reg_100_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(26),
      Q => tmp_1_reg_100(26),
      R => '0'
    );
\tmp_1_reg_100_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(27),
      Q => tmp_1_reg_100(27),
      R => '0'
    );
\tmp_1_reg_100_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(28),
      Q => tmp_1_reg_100(28),
      R => '0'
    );
\tmp_1_reg_100_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(29),
      Q => tmp_1_reg_100(29),
      R => '0'
    );
\tmp_1_reg_100_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(2),
      Q => tmp_1_reg_100(2),
      R => '0'
    );
\tmp_1_reg_100_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(30),
      Q => tmp_1_reg_100(30),
      R => '0'
    );
\tmp_1_reg_100_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(31),
      Q => tmp_1_reg_100(31),
      R => '0'
    );
\tmp_1_reg_100_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(3),
      Q => tmp_1_reg_100(3),
      R => '0'
    );
\tmp_1_reg_100_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(4),
      Q => tmp_1_reg_100(4),
      R => '0'
    );
\tmp_1_reg_100_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(5),
      Q => tmp_1_reg_100(5),
      R => '0'
    );
\tmp_1_reg_100_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(6),
      Q => tmp_1_reg_100(6),
      R => '0'
    );
\tmp_1_reg_100_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(7),
      Q => tmp_1_reg_100(7),
      R => '0'
    );
\tmp_1_reg_100_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(8),
      Q => tmp_1_reg_100(8),
      R => '0'
    );
\tmp_1_reg_100_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_CS_fsm_state7,
      D => \hls_macc_mul_32s_bkb_MulnS_0_U/buff4_reg\(9),
      Q => tmp_1_reg_100(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zybo_zynq_design_hls_macc_0_0 is
  port (
    s_axi_HLS_MACC_PERIPH_BUS_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_AWVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_AWREADY : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_WVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_WREADY : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_BVALID : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_BREADY : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_ARVALID : in STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_ARREADY : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_HLS_MACC_PERIPH_BUS_RVALID : out STD_LOGIC;
    s_axi_HLS_MACC_PERIPH_BUS_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of zybo_zynq_design_hls_macc_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of zybo_zynq_design_hls_macc_0_0 : entity is "zybo_zynq_design_hls_macc_0_0,hls_macc,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of zybo_zynq_design_hls_macc_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of zybo_zynq_design_hls_macc_0_0 : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of zybo_zynq_design_hls_macc_0_0 : entity is "hls_macc,Vivado 2018.2";
  attribute hls_module : string;
  attribute hls_module of zybo_zynq_design_hls_macc_0_0 : entity is "yes";
end zybo_zynq_design_hls_macc_0_0;

architecture STRUCTURE of zybo_zynq_design_hls_macc_0_0 is
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_ADDR_WIDTH : integer;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_ADDR_WIDTH of inst : label is 6;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_DATA_WIDTH : integer;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_WSTRB_WIDTH : integer;
  attribute C_S_AXI_HLS_MACC_PERIPH_BUS_WSTRB_WIDTH of inst : label is 4;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of inst : label is 4;
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "9'b000000001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of inst : label is "9'b000000010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of inst : label is "9'b000000100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of inst : label is "9'b000001000";
  attribute ap_ST_fsm_state5 : string;
  attribute ap_ST_fsm_state5 of inst : label is "9'b000010000";
  attribute ap_ST_fsm_state6 : string;
  attribute ap_ST_fsm_state6 of inst : label is "9'b000100000";
  attribute ap_ST_fsm_state7 : string;
  attribute ap_ST_fsm_state7 of inst : label is "9'b001000000";
  attribute ap_ST_fsm_state8 : string;
  attribute ap_ST_fsm_state8 of inst : label is "9'b010000000";
  attribute ap_ST_fsm_state9 : string;
  attribute ap_ST_fsm_state9 of inst : label is "9'b100000000";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_HLS_MACC_PERIPH_BUS, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN zybo_zynq_design_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS ARREADY";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS ARVALID";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS AWREADY";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS AWVALID";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS BREADY";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS BVALID";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_HLS_MACC_PERIPH_BUS_RREADY : signal is "XIL_INTERFACENAME s_axi_HLS_MACC_PERIPH_BUS, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN zybo_zynq_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS RVALID";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS WREADY";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS WVALID";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS ARADDR";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS AWADDR";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS BRESP";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS RDATA";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS RRESP";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS WDATA";
  attribute X_INTERFACE_INFO of s_axi_HLS_MACC_PERIPH_BUS_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_HLS_MACC_PERIPH_BUS WSTRB";
begin
inst: entity work.zybo_zynq_design_hls_macc_0_0_hls_macc
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_ARADDR(5 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_ARREADY => s_axi_HLS_MACC_PERIPH_BUS_ARREADY,
      s_axi_HLS_MACC_PERIPH_BUS_ARVALID => s_axi_HLS_MACC_PERIPH_BUS_ARVALID,
      s_axi_HLS_MACC_PERIPH_BUS_AWADDR(5 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_AWADDR(5 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_AWREADY => s_axi_HLS_MACC_PERIPH_BUS_AWREADY,
      s_axi_HLS_MACC_PERIPH_BUS_AWVALID => s_axi_HLS_MACC_PERIPH_BUS_AWVALID,
      s_axi_HLS_MACC_PERIPH_BUS_BREADY => s_axi_HLS_MACC_PERIPH_BUS_BREADY,
      s_axi_HLS_MACC_PERIPH_BUS_BRESP(1 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_BRESP(1 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_BVALID => s_axi_HLS_MACC_PERIPH_BUS_BVALID,
      s_axi_HLS_MACC_PERIPH_BUS_RDATA(31 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_RDATA(31 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_RREADY => s_axi_HLS_MACC_PERIPH_BUS_RREADY,
      s_axi_HLS_MACC_PERIPH_BUS_RRESP(1 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_RRESP(1 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_RVALID => s_axi_HLS_MACC_PERIPH_BUS_RVALID,
      s_axi_HLS_MACC_PERIPH_BUS_WDATA(31 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_WDATA(31 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_WREADY => s_axi_HLS_MACC_PERIPH_BUS_WREADY,
      s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3 downto 0) => s_axi_HLS_MACC_PERIPH_BUS_WSTRB(3 downto 0),
      s_axi_HLS_MACC_PERIPH_BUS_WVALID => s_axi_HLS_MACC_PERIPH_BUS_WVALID
    );
end STRUCTURE;
