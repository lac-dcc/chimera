-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Tue Sep 17 19:44:40 2019
-- Host        : varun-laptop running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               d:/github/Digital-Hardware-Modelling/xilinx-vivado/gcd_snickerdoodle/gcd_snickerdoodle.srcs/sources_1/bd/gcd_zynq_snick/ip/gcd_zynq_snick_gcd_0_0/gcd_zynq_snick_gcd_0_0_sim_netlist.vhdl
-- Design      : gcd_zynq_snick_gcd_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gcd_zynq_snick_gcd_0_0_gcd_gcd_bus_s_axi is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_gcd_bus_RVALID : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    interrupt : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \b_read_reg_102_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \a_read_reg_107_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_gcd_bus_RDATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ap_clk : in STD_LOGIC;
    s_axi_gcd_bus_ARVALID : in STD_LOGIC;
    s_axi_gcd_bus_RREADY : in STD_LOGIC;
    s_axi_gcd_bus_AWVALID : in STD_LOGIC;
    s_axi_gcd_bus_WVALID : in STD_LOGIC;
    s_axi_gcd_bus_WDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_gcd_bus_WSTRB : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_gcd_bus_BREADY : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \result_reg_56_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \p_s_reg_45_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_gcd_bus_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    ap_rst_n : in STD_LOGIC;
    s_axi_gcd_bus_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gcd_zynq_snick_gcd_0_0_gcd_gcd_bus_s_axi : entity is "gcd_gcd_bus_s_axi";
end gcd_zynq_snick_gcd_0_0_gcd_gcd_bus_s_axi;

architecture STRUCTURE of gcd_zynq_snick_gcd_0_0_gcd_gcd_bus_s_axi is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
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
  signal \^a_read_reg_107_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ap_done : STD_LOGIC;
  signal ap_idle : STD_LOGIC;
  signal ap_start : STD_LOGIC;
  signal ar_hs : STD_LOGIC;
  signal \^b_read_reg_102_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal int_a0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \int_a[15]_i_1_n_0\ : STD_LOGIC;
  signal \int_a[15]_i_3_n_0\ : STD_LOGIC;
  signal int_ap_done : STD_LOGIC;
  signal int_ap_done1 : STD_LOGIC;
  signal int_ap_done_i_1_n_0 : STD_LOGIC;
  signal int_ap_idle : STD_LOGIC;
  signal int_ap_ready : STD_LOGIC;
  signal int_ap_start3_out : STD_LOGIC;
  signal int_ap_start_i_10_n_0 : STD_LOGIC;
  signal int_ap_start_i_1_n_0 : STD_LOGIC;
  signal int_ap_start_i_5_n_0 : STD_LOGIC;
  signal int_ap_start_i_6_n_0 : STD_LOGIC;
  signal int_ap_start_i_7_n_0 : STD_LOGIC;
  signal int_ap_start_i_8_n_0 : STD_LOGIC;
  signal int_ap_start_i_9_n_0 : STD_LOGIC;
  signal int_ap_start_reg_i_2_n_3 : STD_LOGIC;
  signal int_ap_start_reg_i_4_n_0 : STD_LOGIC;
  signal int_ap_start_reg_i_4_n_1 : STD_LOGIC;
  signal int_ap_start_reg_i_4_n_2 : STD_LOGIC;
  signal int_ap_start_reg_i_4_n_3 : STD_LOGIC;
  signal int_auto_restart : STD_LOGIC;
  signal int_auto_restart_i_1_n_0 : STD_LOGIC;
  signal int_b0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \int_b[15]_i_1_n_0\ : STD_LOGIC;
  signal int_gie_i_1_n_0 : STD_LOGIC;
  signal int_gie_reg_n_0 : STD_LOGIC;
  signal \int_ier[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_ier[1]_i_1_n_0\ : STD_LOGIC;
  signal \int_ier[1]_i_2_n_0\ : STD_LOGIC;
  signal \int_ier_reg_n_0_[0]\ : STD_LOGIC;
  signal \int_ier_reg_n_0_[1]\ : STD_LOGIC;
  signal int_isr6_out : STD_LOGIC;
  signal \int_isr[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_isr[1]_i_1_n_0\ : STD_LOGIC;
  signal \int_isr_reg_n_0_[0]\ : STD_LOGIC;
  signal int_pResult : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal int_pResult_ap_vld : STD_LOGIC;
  signal int_pResult_ap_vld1 : STD_LOGIC;
  signal int_pResult_ap_vld_i_1_n_0 : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal p_1_in : STD_LOGIC;
  signal \rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \^s_axi_gcd_bus_rdata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^s_axi_gcd_bus_rvalid\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \^s_axi_gcd_bus_rvalid\ : signal is "yes";
  signal waddr : STD_LOGIC;
  signal \waddr_reg_n_0_[0]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[1]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[4]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[5]\ : STD_LOGIC;
  signal NLW_int_ap_start_reg_i_2_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_int_ap_start_reg_i_2_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_int_ap_start_reg_i_4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
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
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \int_a[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \int_a[10]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_a[11]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_a[12]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_a[13]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_a[14]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_a[15]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_a[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_a[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_a[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_a[4]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_a[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \int_a[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_a[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_a[8]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_a[9]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of int_ap_idle_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of int_ap_start_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \int_b[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_b[10]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_b[11]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_b[12]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_b[13]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_b[14]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_b[15]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_b[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_b[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_b[3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_b[4]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_b[5]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_b[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_b[7]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_b[8]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_b[9]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_isr[0]_i_2\ : label is "soft_lutpair0";
begin
  CO(0) <= \^co\(0);
  SR(0) <= \^sr\(0);
  \a_read_reg_107_reg[15]\(15 downto 0) <= \^a_read_reg_107_reg[15]\(15 downto 0);
  \b_read_reg_102_reg[15]\(15 downto 0) <= \^b_read_reg_102_reg[15]\(15 downto 0);
  \out\(2 downto 0) <= \^out\(2 downto 0);
  s_axi_gcd_bus_RDATA(15 downto 0) <= \^s_axi_gcd_bus_rdata\(15 downto 0);
  s_axi_gcd_bus_RVALID(1 downto 0) <= \^s_axi_gcd_bus_rvalid\(1 downto 0);
\FSM_onehot_rstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F747"
    )
        port map (
      I0 => s_axi_gcd_bus_ARVALID,
      I1 => \^s_axi_gcd_bus_rvalid\(0),
      I2 => \^s_axi_gcd_bus_rvalid\(1),
      I3 => s_axi_gcd_bus_RREADY,
      O => \FSM_onehot_rstate[1]_i_1_n_0\
    );
\FSM_onehot_rstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => s_axi_gcd_bus_ARVALID,
      I1 => \^s_axi_gcd_bus_rvalid\(0),
      I2 => \^s_axi_gcd_bus_rvalid\(1),
      I3 => s_axi_gcd_bus_RREADY,
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
      Q => \^s_axi_gcd_bus_rvalid\(0),
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
      Q => \^s_axi_gcd_bus_rvalid\(1),
      R => \^sr\(0)
    );
\FSM_onehot_wstate[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888BFF8B"
    )
        port map (
      I0 => s_axi_gcd_bus_BREADY,
      I1 => \^out\(2),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => s_axi_gcd_bus_AWVALID,
      O => \FSM_onehot_wstate[1]_i_1_n_0\
    );
\FSM_onehot_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_gcd_bus_AWVALID,
      I1 => \^out\(0),
      I2 => s_axi_gcd_bus_WVALID,
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
      I0 => s_axi_gcd_bus_WVALID,
      I1 => \^out\(1),
      I2 => s_axi_gcd_bus_BREADY,
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
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FA30"
    )
        port map (
      I0 => \^co\(0),
      I1 => ap_start,
      I2 => Q(0),
      I3 => Q(2),
      O => D(0)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(3),
      I2 => Q(0),
      I3 => ap_start,
      I4 => Q(2),
      O => D(1)
    );
\b_read_reg_102[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Q(0),
      I1 => ap_start,
      O => E(0)
    );
\int_a[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(0),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(0),
      O => int_a0(0)
    );
\int_a[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(10),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(10),
      O => int_a0(10)
    );
\int_a[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(11),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(11),
      O => int_a0(11)
    );
\int_a[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(12),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(12),
      O => int_a0(12)
    );
\int_a[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(13),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(13),
      O => int_a0(13)
    );
\int_a[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(14),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(14),
      O => int_a0(14)
    );
\int_a[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \waddr_reg_n_0_[4]\,
      I1 => \int_a[15]_i_3_n_0\,
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \waddr_reg_n_0_[3]\,
      O => \int_a[15]_i_1_n_0\
    );
\int_a[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(15),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(15),
      O => int_a0(15)
    );
\int_a[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => \waddr_reg_n_0_[0]\,
      I1 => \waddr_reg_n_0_[5]\,
      I2 => \^out\(1),
      I3 => s_axi_gcd_bus_WVALID,
      I4 => \waddr_reg_n_0_[1]\,
      O => \int_a[15]_i_3_n_0\
    );
\int_a[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(1),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(1),
      O => int_a0(1)
    );
\int_a[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(2),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(2),
      O => int_a0(2)
    );
\int_a[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(3),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(3),
      O => int_a0(3)
    );
\int_a[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(4),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(4),
      O => int_a0(4)
    );
\int_a[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(5),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(5),
      O => int_a0(5)
    );
\int_a[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(6),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(6),
      O => int_a0(6)
    );
\int_a[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(7),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^a_read_reg_107_reg[15]\(7),
      O => int_a0(7)
    );
\int_a[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(8),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(8),
      O => int_a0(8)
    );
\int_a[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(9),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^a_read_reg_107_reg[15]\(9),
      O => int_a0(9)
    );
\int_a_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(0),
      Q => \^a_read_reg_107_reg[15]\(0),
      R => \^sr\(0)
    );
\int_a_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(10),
      Q => \^a_read_reg_107_reg[15]\(10),
      R => \^sr\(0)
    );
\int_a_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(11),
      Q => \^a_read_reg_107_reg[15]\(11),
      R => \^sr\(0)
    );
\int_a_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(12),
      Q => \^a_read_reg_107_reg[15]\(12),
      R => \^sr\(0)
    );
\int_a_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(13),
      Q => \^a_read_reg_107_reg[15]\(13),
      R => \^sr\(0)
    );
\int_a_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(14),
      Q => \^a_read_reg_107_reg[15]\(14),
      R => \^sr\(0)
    );
\int_a_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(15),
      Q => \^a_read_reg_107_reg[15]\(15),
      R => \^sr\(0)
    );
\int_a_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(1),
      Q => \^a_read_reg_107_reg[15]\(1),
      R => \^sr\(0)
    );
\int_a_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(2),
      Q => \^a_read_reg_107_reg[15]\(2),
      R => \^sr\(0)
    );
\int_a_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(3),
      Q => \^a_read_reg_107_reg[15]\(3),
      R => \^sr\(0)
    );
\int_a_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(4),
      Q => \^a_read_reg_107_reg[15]\(4),
      R => \^sr\(0)
    );
\int_a_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(5),
      Q => \^a_read_reg_107_reg[15]\(5),
      R => \^sr\(0)
    );
\int_a_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(6),
      Q => \^a_read_reg_107_reg[15]\(6),
      R => \^sr\(0)
    );
\int_a_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(7),
      Q => \^a_read_reg_107_reg[15]\(7),
      R => \^sr\(0)
    );
\int_a_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(8),
      Q => \^a_read_reg_107_reg[15]\(8),
      R => \^sr\(0)
    );
\int_a_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_a[15]_i_1_n_0\,
      D => int_a0(9),
      Q => \^a_read_reg_107_reg[15]\(9),
      R => \^sr\(0)
    );
int_ap_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FFFFFFF88888888"
    )
        port map (
      I0 => Q(2),
      I1 => \^co\(0),
      I2 => \^s_axi_gcd_bus_rvalid\(0),
      I3 => s_axi_gcd_bus_ARVALID,
      I4 => int_ap_done1,
      I5 => int_ap_done,
      O => int_ap_done_i_1_n_0
    );
int_ap_done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_axi_gcd_bus_ARADDR(5),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => s_axi_gcd_bus_ARADDR(1),
      I3 => s_axi_gcd_bus_ARADDR(0),
      I4 => s_axi_gcd_bus_ARADDR(3),
      I5 => s_axi_gcd_bus_ARADDR(2),
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
int_ap_ready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^co\(0),
      I1 => Q(2),
      O => ap_done
    );
int_ap_ready_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => ap_done,
      Q => int_ap_ready,
      R => \^sr\(0)
    );
int_ap_start_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFF80"
    )
        port map (
      I0 => int_auto_restart,
      I1 => Q(2),
      I2 => \^co\(0),
      I3 => int_ap_start3_out,
      I4 => ap_start,
      O => int_ap_start_i_1_n_0
    );
int_ap_start_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \result_reg_56_reg[15]\(0),
      I1 => \p_s_reg_45_reg[15]\(0),
      I2 => \p_s_reg_45_reg[15]\(2),
      I3 => \result_reg_56_reg[15]\(2),
      I4 => \p_s_reg_45_reg[15]\(1),
      I5 => \result_reg_56_reg[15]\(1),
      O => int_ap_start_i_10_n_0
    );
int_ap_start_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(0),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \int_ier[1]_i_2_n_0\,
      I4 => \waddr_reg_n_0_[3]\,
      O => int_ap_start3_out
    );
int_ap_start_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \p_s_reg_45_reg[15]\(15),
      I1 => \result_reg_56_reg[15]\(15),
      O => int_ap_start_i_5_n_0
    );
int_ap_start_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \result_reg_56_reg[15]\(12),
      I1 => \p_s_reg_45_reg[15]\(12),
      I2 => \p_s_reg_45_reg[15]\(14),
      I3 => \result_reg_56_reg[15]\(14),
      I4 => \p_s_reg_45_reg[15]\(13),
      I5 => \result_reg_56_reg[15]\(13),
      O => int_ap_start_i_6_n_0
    );
int_ap_start_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \result_reg_56_reg[15]\(9),
      I1 => \p_s_reg_45_reg[15]\(9),
      I2 => \p_s_reg_45_reg[15]\(11),
      I3 => \result_reg_56_reg[15]\(11),
      I4 => \p_s_reg_45_reg[15]\(10),
      I5 => \result_reg_56_reg[15]\(10),
      O => int_ap_start_i_7_n_0
    );
int_ap_start_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \result_reg_56_reg[15]\(6),
      I1 => \p_s_reg_45_reg[15]\(6),
      I2 => \p_s_reg_45_reg[15]\(8),
      I3 => \result_reg_56_reg[15]\(8),
      I4 => \p_s_reg_45_reg[15]\(7),
      I5 => \result_reg_56_reg[15]\(7),
      O => int_ap_start_i_8_n_0
    );
int_ap_start_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \result_reg_56_reg[15]\(3),
      I1 => \p_s_reg_45_reg[15]\(3),
      I2 => \p_s_reg_45_reg[15]\(5),
      I3 => \result_reg_56_reg[15]\(5),
      I4 => \p_s_reg_45_reg[15]\(4),
      I5 => \result_reg_56_reg[15]\(4),
      O => int_ap_start_i_9_n_0
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
int_ap_start_reg_i_2: unisim.vcomponents.CARRY4
     port map (
      CI => int_ap_start_reg_i_4_n_0,
      CO(3 downto 2) => NLW_int_ap_start_reg_i_2_CO_UNCONNECTED(3 downto 2),
      CO(1) => \^co\(0),
      CO(0) => int_ap_start_reg_i_2_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_int_ap_start_reg_i_2_O_UNCONNECTED(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => int_ap_start_i_5_n_0,
      S(0) => int_ap_start_i_6_n_0
    );
int_ap_start_reg_i_4: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => int_ap_start_reg_i_4_n_0,
      CO(2) => int_ap_start_reg_i_4_n_1,
      CO(1) => int_ap_start_reg_i_4_n_2,
      CO(0) => int_ap_start_reg_i_4_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_int_ap_start_reg_i_4_O_UNCONNECTED(3 downto 0),
      S(3) => int_ap_start_i_7_n_0,
      S(2) => int_ap_start_i_8_n_0,
      S(1) => int_ap_start_i_9_n_0,
      S(0) => int_ap_start_i_10_n_0
    );
int_auto_restart_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(7),
      I1 => \waddr_reg_n_0_[3]\,
      I2 => \int_ier[1]_i_2_n_0\,
      I3 => \waddr_reg_n_0_[2]\,
      I4 => s_axi_gcd_bus_WSTRB(0),
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
      I0 => s_axi_gcd_bus_WDATA(0),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(0),
      O => int_b0(0)
    );
\int_b[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(10),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(10),
      O => int_b0(10)
    );
\int_b[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(11),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(11),
      O => int_b0(11)
    );
\int_b[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(12),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(12),
      O => int_b0(12)
    );
\int_b[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(13),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(13),
      O => int_b0(13)
    );
\int_b[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(14),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(14),
      O => int_b0(14)
    );
\int_b[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \waddr_reg_n_0_[3]\,
      I1 => \waddr_reg_n_0_[4]\,
      I2 => \int_a[15]_i_3_n_0\,
      I3 => \waddr_reg_n_0_[2]\,
      O => \int_b[15]_i_1_n_0\
    );
\int_b[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(15),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(15),
      O => int_b0(15)
    );
\int_b[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(1),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(1),
      O => int_b0(1)
    );
\int_b[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(2),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(2),
      O => int_b0(2)
    );
\int_b[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(3),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(3),
      O => int_b0(3)
    );
\int_b[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(4),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(4),
      O => int_b0(4)
    );
\int_b[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(5),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(5),
      O => int_b0(5)
    );
\int_b[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(6),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(6),
      O => int_b0(6)
    );
\int_b[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(7),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \^b_read_reg_102_reg[15]\(7),
      O => int_b0(7)
    );
\int_b[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(8),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(8),
      O => int_b0(8)
    );
\int_b[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(9),
      I1 => s_axi_gcd_bus_WSTRB(1),
      I2 => \^b_read_reg_102_reg[15]\(9),
      O => int_b0(9)
    );
\int_b_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(0),
      Q => \^b_read_reg_102_reg[15]\(0),
      R => \^sr\(0)
    );
\int_b_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(10),
      Q => \^b_read_reg_102_reg[15]\(10),
      R => \^sr\(0)
    );
\int_b_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(11),
      Q => \^b_read_reg_102_reg[15]\(11),
      R => \^sr\(0)
    );
\int_b_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(12),
      Q => \^b_read_reg_102_reg[15]\(12),
      R => \^sr\(0)
    );
\int_b_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(13),
      Q => \^b_read_reg_102_reg[15]\(13),
      R => \^sr\(0)
    );
\int_b_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(14),
      Q => \^b_read_reg_102_reg[15]\(14),
      R => \^sr\(0)
    );
\int_b_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(15),
      Q => \^b_read_reg_102_reg[15]\(15),
      R => \^sr\(0)
    );
\int_b_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(1),
      Q => \^b_read_reg_102_reg[15]\(1),
      R => \^sr\(0)
    );
\int_b_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(2),
      Q => \^b_read_reg_102_reg[15]\(2),
      R => \^sr\(0)
    );
\int_b_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(3),
      Q => \^b_read_reg_102_reg[15]\(3),
      R => \^sr\(0)
    );
\int_b_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(4),
      Q => \^b_read_reg_102_reg[15]\(4),
      R => \^sr\(0)
    );
\int_b_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(5),
      Q => \^b_read_reg_102_reg[15]\(5),
      R => \^sr\(0)
    );
\int_b_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(6),
      Q => \^b_read_reg_102_reg[15]\(6),
      R => \^sr\(0)
    );
\int_b_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(7),
      Q => \^b_read_reg_102_reg[15]\(7),
      R => \^sr\(0)
    );
\int_b_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(8),
      Q => \^b_read_reg_102_reg[15]\(8),
      R => \^sr\(0)
    );
\int_b_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \int_b[15]_i_1_n_0\,
      D => int_b0(9),
      Q => \^b_read_reg_102_reg[15]\(9),
      R => \^sr\(0)
    );
int_gie_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(0),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \waddr_reg_n_0_[3]\,
      I3 => \waddr_reg_n_0_[2]\,
      I4 => \int_ier[1]_i_2_n_0\,
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
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(0),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \int_ier[1]_i_2_n_0\,
      I3 => \waddr_reg_n_0_[2]\,
      I4 => \waddr_reg_n_0_[3]\,
      I5 => \int_ier_reg_n_0_[0]\,
      O => \int_ier[0]_i_1_n_0\
    );
\int_ier[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(1),
      I1 => s_axi_gcd_bus_WSTRB(0),
      I2 => \int_ier[1]_i_2_n_0\,
      I3 => \waddr_reg_n_0_[2]\,
      I4 => \waddr_reg_n_0_[3]\,
      I5 => \int_ier_reg_n_0_[1]\,
      O => \int_ier[1]_i_1_n_0\
    );
\int_ier[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => \waddr_reg_n_0_[1]\,
      I1 => s_axi_gcd_bus_WVALID,
      I2 => \^out\(1),
      I3 => \waddr_reg_n_0_[5]\,
      I4 => \waddr_reg_n_0_[0]\,
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
      Q => \int_ier_reg_n_0_[1]\,
      R => \^sr\(0)
    );
\int_isr[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7777777F8888888"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(0),
      I1 => int_isr6_out,
      I2 => \int_ier_reg_n_0_[0]\,
      I3 => \^co\(0),
      I4 => Q(2),
      I5 => \int_isr_reg_n_0_[0]\,
      O => \int_isr[0]_i_1_n_0\
    );
\int_isr[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => s_axi_gcd_bus_WSTRB(0),
      I1 => \waddr_reg_n_0_[2]\,
      I2 => \int_ier[1]_i_2_n_0\,
      I3 => \waddr_reg_n_0_[3]\,
      O => int_isr6_out
    );
\int_isr[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7777777F8888888"
    )
        port map (
      I0 => s_axi_gcd_bus_WDATA(1),
      I1 => int_isr6_out,
      I2 => \int_ier_reg_n_0_[1]\,
      I3 => \^co\(0),
      I4 => Q(2),
      I5 => p_1_in,
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
      Q => p_1_in,
      R => \^sr\(0)
    );
int_pResult_ap_vld_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FFFFFFF88888888"
    )
        port map (
      I0 => Q(2),
      I1 => \^co\(0),
      I2 => \^s_axi_gcd_bus_rvalid\(0),
      I3 => s_axi_gcd_bus_ARVALID,
      I4 => int_pResult_ap_vld1,
      I5 => int_pResult_ap_vld,
      O => int_pResult_ap_vld_i_1_n_0
    );
int_pResult_ap_vld_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => s_axi_gcd_bus_ARADDR(1),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => s_axi_gcd_bus_ARADDR(5),
      I3 => s_axi_gcd_bus_ARADDR(2),
      I4 => s_axi_gcd_bus_ARADDR(3),
      I5 => s_axi_gcd_bus_ARADDR(0),
      O => int_pResult_ap_vld1
    );
int_pResult_ap_vld_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => int_pResult_ap_vld_i_1_n_0,
      Q => int_pResult_ap_vld,
      R => \^sr\(0)
    );
\int_pResult_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(0),
      Q => int_pResult(0),
      R => \^sr\(0)
    );
\int_pResult_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(10),
      Q => int_pResult(10),
      R => \^sr\(0)
    );
\int_pResult_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(11),
      Q => int_pResult(11),
      R => \^sr\(0)
    );
\int_pResult_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(12),
      Q => int_pResult(12),
      R => \^sr\(0)
    );
\int_pResult_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(13),
      Q => int_pResult(13),
      R => \^sr\(0)
    );
\int_pResult_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(14),
      Q => int_pResult(14),
      R => \^sr\(0)
    );
\int_pResult_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(15),
      Q => int_pResult(15),
      R => \^sr\(0)
    );
\int_pResult_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(1),
      Q => int_pResult(1),
      R => \^sr\(0)
    );
\int_pResult_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(2),
      Q => int_pResult(2),
      R => \^sr\(0)
    );
\int_pResult_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(3),
      Q => int_pResult(3),
      R => \^sr\(0)
    );
\int_pResult_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(4),
      Q => int_pResult(4),
      R => \^sr\(0)
    );
\int_pResult_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(5),
      Q => int_pResult(5),
      R => \^sr\(0)
    );
\int_pResult_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(6),
      Q => int_pResult(6),
      R => \^sr\(0)
    );
\int_pResult_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(7),
      Q => int_pResult(7),
      R => \^sr\(0)
    );
\int_pResult_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(8),
      Q => int_pResult(8),
      R => \^sr\(0)
    );
\int_pResult_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_done,
      D => \p_s_reg_45_reg[15]\(9),
      Q => int_pResult(9),
      R => \^sr\(0)
    );
interrupt_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => p_1_in,
      I1 => \int_isr_reg_n_0_[0]\,
      I2 => int_gie_reg_n_0,
      O => interrupt
    );
\rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \rdata[0]_i_2_n_0\,
      I1 => s_axi_gcd_bus_ARADDR(2),
      I2 => \rdata[0]_i_3_n_0\,
      I3 => \rdata[1]_i_4_n_0\,
      I4 => ar_hs,
      I5 => \^s_axi_gcd_bus_rdata\(0),
      O => \rdata[0]_i_1_n_0\
    );
\rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \int_ier_reg_n_0_[0]\,
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => \^b_read_reg_102_reg[15]\(0),
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => s_axi_gcd_bus_ARADDR(3),
      I5 => \rdata[0]_i_4_n_0\,
      O => \rdata[0]_i_2_n_0\
    );
\rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033223000002230"
    )
        port map (
      I0 => int_pResult_ap_vld,
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => int_gie_reg_n_0,
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => s_axi_gcd_bus_ARADDR(3),
      I5 => \int_isr_reg_n_0_[0]\,
      O => \rdata[0]_i_3_n_0\
    );
\rdata[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^a_read_reg_107_reg[15]\(0),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => int_pResult(0),
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => ap_start,
      O => \rdata[0]_i_4_n_0\
    );
\rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(10),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(10),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(10),
      O => \rdata[10]_i_1_n_0\
    );
\rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(11),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(11),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(11),
      O => \rdata[11]_i_1_n_0\
    );
\rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(12),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(12),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(12),
      O => \rdata[12]_i_1_n_0\
    );
\rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(13),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(13),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(13),
      O => \rdata[13]_i_1_n_0\
    );
\rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(14),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(14),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(14),
      O => \rdata[14]_i_1_n_0\
    );
\rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888880"
    )
        port map (
      I0 => s_axi_gcd_bus_ARVALID,
      I1 => \^s_axi_gcd_bus_rvalid\(0),
      I2 => s_axi_gcd_bus_ARADDR(1),
      I3 => s_axi_gcd_bus_ARADDR(0),
      I4 => s_axi_gcd_bus_ARADDR(2),
      O => \rdata[15]_i_1_n_0\
    );
\rdata[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s_axi_gcd_bus_rvalid\(0),
      I1 => s_axi_gcd_bus_ARVALID,
      O => ar_hs
    );
\rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(15),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(15),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(15),
      O => \rdata[15]_i_3_n_0\
    );
\rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \rdata[1]_i_2_n_0\,
      I1 => s_axi_gcd_bus_ARADDR(2),
      I2 => \rdata[1]_i_3_n_0\,
      I3 => \rdata[1]_i_4_n_0\,
      I4 => ar_hs,
      I5 => \^s_axi_gcd_bus_rdata\(1),
      O => \rdata[1]_i_1_n_0\
    );
\rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \int_ier_reg_n_0_[1]\,
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => \^b_read_reg_102_reg[15]\(1),
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => s_axi_gcd_bus_ARADDR(3),
      I5 => \rdata[1]_i_5_n_0\,
      O => \rdata[1]_i_2_n_0\
    );
\rdata[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => s_axi_gcd_bus_ARADDR(4),
      I1 => s_axi_gcd_bus_ARADDR(5),
      I2 => s_axi_gcd_bus_ARADDR(3),
      I3 => p_1_in,
      O => \rdata[1]_i_3_n_0\
    );
\rdata[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => s_axi_gcd_bus_ARADDR(1),
      I1 => s_axi_gcd_bus_ARADDR(0),
      O => \rdata[1]_i_4_n_0\
    );
\rdata[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^a_read_reg_107_reg[15]\(1),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => int_pResult(1),
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => int_ap_done,
      O => \rdata[1]_i_5_n_0\
    );
\rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4000"
    )
        port map (
      I0 => s_axi_gcd_bus_ARADDR(5),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => \^b_read_reg_102_reg[15]\(2),
      I3 => s_axi_gcd_bus_ARADDR(3),
      I4 => \rdata[2]_i_2_n_0\,
      O => \rdata[2]_i_1_n_0\
    );
\rdata[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^a_read_reg_107_reg[15]\(2),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => int_pResult(2),
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => int_ap_idle,
      O => \rdata[2]_i_2_n_0\
    );
\rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4000"
    )
        port map (
      I0 => s_axi_gcd_bus_ARADDR(5),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => \^b_read_reg_102_reg[15]\(3),
      I3 => s_axi_gcd_bus_ARADDR(3),
      I4 => \rdata[3]_i_2_n_0\,
      O => \rdata[3]_i_1_n_0\
    );
\rdata[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^a_read_reg_107_reg[15]\(3),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => int_pResult(3),
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => int_ap_ready,
      O => \rdata[3]_i_2_n_0\
    );
\rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(4),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(4),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(4),
      O => \rdata[4]_i_1_n_0\
    );
\rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(5),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(5),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(5),
      O => \rdata[5]_i_1_n_0\
    );
\rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(6),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(6),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(6),
      O => \rdata[6]_i_1_n_0\
    );
\rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4000"
    )
        port map (
      I0 => s_axi_gcd_bus_ARADDR(5),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => \^b_read_reg_102_reg[15]\(7),
      I3 => s_axi_gcd_bus_ARADDR(3),
      I4 => \rdata[7]_i_2_n_0\,
      O => \rdata[7]_i_1_n_0\
    );
\rdata[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \^a_read_reg_107_reg[15]\(7),
      I1 => s_axi_gcd_bus_ARADDR(4),
      I2 => int_pResult(7),
      I3 => s_axi_gcd_bus_ARADDR(5),
      I4 => int_auto_restart,
      O => \rdata[7]_i_2_n_0\
    );
\rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(8),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(8),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(8),
      O => \rdata[8]_i_1_n_0\
    );
\rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033B8000000B800"
    )
        port map (
      I0 => \^b_read_reg_102_reg[15]\(9),
      I1 => s_axi_gcd_bus_ARADDR(3),
      I2 => \^a_read_reg_107_reg[15]\(9),
      I3 => s_axi_gcd_bus_ARADDR(4),
      I4 => s_axi_gcd_bus_ARADDR(5),
      I5 => int_pResult(9),
      O => \rdata[9]_i_1_n_0\
    );
\rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \rdata[0]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(0),
      R => '0'
    );
\rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[10]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(10),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[11]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(11),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[12]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(12),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[13]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(13),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[14]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(14),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[15]_i_3_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(15),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \rdata[1]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(1),
      R => '0'
    );
\rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[2]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(2),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[3]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(3),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[4]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(4),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[5]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(5),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[6]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(6),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[7]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(7),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[8]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(8),
      R => \rdata[15]_i_1_n_0\
    );
\rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[9]_i_1_n_0\,
      Q => \^s_axi_gcd_bus_rdata\(9),
      R => \rdata[15]_i_1_n_0\
    );
\waddr[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^out\(0),
      I1 => s_axi_gcd_bus_AWVALID,
      O => waddr
    );
\waddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_gcd_bus_AWADDR(0),
      Q => \waddr_reg_n_0_[0]\,
      R => '0'
    );
\waddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_gcd_bus_AWADDR(1),
      Q => \waddr_reg_n_0_[1]\,
      R => '0'
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_gcd_bus_AWADDR(2),
      Q => \waddr_reg_n_0_[2]\,
      R => '0'
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_gcd_bus_AWADDR(3),
      Q => \waddr_reg_n_0_[3]\,
      R => '0'
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_gcd_bus_AWADDR(4),
      Q => \waddr_reg_n_0_[4]\,
      R => '0'
    );
\waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_gcd_bus_AWADDR(5),
      Q => \waddr_reg_n_0_[5]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gcd_zynq_snick_gcd_0_0_gcd is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    s_axi_gcd_bus_AWVALID : in STD_LOGIC;
    s_axi_gcd_bus_AWREADY : out STD_LOGIC;
    s_axi_gcd_bus_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_gcd_bus_WVALID : in STD_LOGIC;
    s_axi_gcd_bus_WREADY : out STD_LOGIC;
    s_axi_gcd_bus_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_gcd_bus_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_gcd_bus_ARVALID : in STD_LOGIC;
    s_axi_gcd_bus_ARREADY : out STD_LOGIC;
    s_axi_gcd_bus_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_gcd_bus_RVALID : out STD_LOGIC;
    s_axi_gcd_bus_RREADY : in STD_LOGIC;
    s_axi_gcd_bus_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_gcd_bus_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_gcd_bus_BVALID : out STD_LOGIC;
    s_axi_gcd_bus_BREADY : in STD_LOGIC;
    s_axi_gcd_bus_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    interrupt : out STD_LOGIC
  );
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of gcd_zynq_snick_gcd_0_0_gcd : entity is 32;
  attribute C_S_AXI_GCD_BUS_ADDR_WIDTH : integer;
  attribute C_S_AXI_GCD_BUS_ADDR_WIDTH of gcd_zynq_snick_gcd_0_0_gcd : entity is 6;
  attribute C_S_AXI_GCD_BUS_DATA_WIDTH : integer;
  attribute C_S_AXI_GCD_BUS_DATA_WIDTH of gcd_zynq_snick_gcd_0_0_gcd : entity is 32;
  attribute C_S_AXI_GCD_BUS_WSTRB_WIDTH : integer;
  attribute C_S_AXI_GCD_BUS_WSTRB_WIDTH of gcd_zynq_snick_gcd_0_0_gcd : entity is 4;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of gcd_zynq_snick_gcd_0_0_gcd : entity is 4;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gcd_zynq_snick_gcd_0_0_gcd : entity is "gcd";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of gcd_zynq_snick_gcd_0_0_gcd : entity is "4'b0001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of gcd_zynq_snick_gcd_0_0_gcd : entity is "4'b0010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of gcd_zynq_snick_gcd_0_0_gcd : entity is "4'b0100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of gcd_zynq_snick_gcd_0_0_gcd : entity is "4'b1000";
  attribute hls_module : string;
  attribute hls_module of gcd_zynq_snick_gcd_0_0_gcd : entity is "yes";
end gcd_zynq_snick_gcd_0_0_gcd;

architecture STRUCTURE of gcd_zynq_snick_gcd_0_0_gcd is
  signal \<const0>\ : STD_LOGIC;
  signal a : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal a_assign_fu_78_p21_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal a_assign_reg_121 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal a_assign_reg_1210 : STD_LOGIC;
  signal \a_assign_reg_121[11]_i_2_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[11]_i_3_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[11]_i_4_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[11]_i_5_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[15]_i_2_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[15]_i_3_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[15]_i_4_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[15]_i_5_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[3]_i_2_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[3]_i_3_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[3]_i_4_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[3]_i_5_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[7]_i_2_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[7]_i_3_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[7]_i_4_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121[7]_i_5_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \a_assign_reg_121_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal a_read_reg_107 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_CS_fsm_state3 : STD_LOGIC;
  signal ap_CS_fsm_state4 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ap_NS_fsm1 : STD_LOGIC;
  signal ap_rst_n_inv : STD_LOGIC;
  signal b : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal b_assign_fu_84_p20_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal b_assign_reg_126 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \b_assign_reg_126[11]_i_2_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[11]_i_3_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[11]_i_4_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[11]_i_5_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[15]_i_2_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[15]_i_3_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[15]_i_4_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[15]_i_5_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[3]_i_2_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[3]_i_3_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[3]_i_4_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[3]_i_5_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[7]_i_2_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[7]_i_3_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[7]_i_4_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126[7]_i_5_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \b_assign_reg_126_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal b_read_reg_102 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_s_reg_45 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \p_s_reg_45[0]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[10]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[11]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[12]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[13]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[14]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[15]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[15]_i_2_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[1]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[2]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[3]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[4]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[5]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[6]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[7]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[8]_i_1_n_0\ : STD_LOGIC;
  signal \p_s_reg_45[9]_i_1_n_0\ : STD_LOGIC;
  signal result_reg_56 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \result_reg_56[15]_i_1_n_0\ : STD_LOGIC;
  signal \^s_axi_gcd_bus_rdata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal tmp_2_fu_66_p2 : STD_LOGIC;
  signal tmp_3_fu_72_p2 : STD_LOGIC;
  signal tmp_3_reg_115 : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_10_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_11_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_12_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_13_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_14_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_15_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_16_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_17_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_18_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_3_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_4_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_5_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_6_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_7_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_8_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115[0]_i_9_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \tmp_3_reg_115_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \tmp_3_reg_115_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \tmp_3_reg_115_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \tmp_3_reg_115_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \tmp_3_reg_115_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \tmp_3_reg_115_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \NLW_a_assign_reg_121_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_b_assign_reg_126_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_tmp_3_reg_115_reg[0]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_tmp_3_reg_115_reg[0]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[3]\ : label is "none";
begin
  s_axi_gcd_bus_BRESP(1) <= \<const0>\;
  s_axi_gcd_bus_BRESP(0) <= \<const0>\;
  s_axi_gcd_bus_RDATA(31) <= \<const0>\;
  s_axi_gcd_bus_RDATA(30) <= \<const0>\;
  s_axi_gcd_bus_RDATA(29) <= \<const0>\;
  s_axi_gcd_bus_RDATA(28) <= \<const0>\;
  s_axi_gcd_bus_RDATA(27) <= \<const0>\;
  s_axi_gcd_bus_RDATA(26) <= \<const0>\;
  s_axi_gcd_bus_RDATA(25) <= \<const0>\;
  s_axi_gcd_bus_RDATA(24) <= \<const0>\;
  s_axi_gcd_bus_RDATA(23) <= \<const0>\;
  s_axi_gcd_bus_RDATA(22) <= \<const0>\;
  s_axi_gcd_bus_RDATA(21) <= \<const0>\;
  s_axi_gcd_bus_RDATA(20) <= \<const0>\;
  s_axi_gcd_bus_RDATA(19) <= \<const0>\;
  s_axi_gcd_bus_RDATA(18) <= \<const0>\;
  s_axi_gcd_bus_RDATA(17) <= \<const0>\;
  s_axi_gcd_bus_RDATA(16) <= \<const0>\;
  s_axi_gcd_bus_RDATA(15 downto 0) <= \^s_axi_gcd_bus_rdata\(15 downto 0);
  s_axi_gcd_bus_RRESP(1) <= \<const0>\;
  s_axi_gcd_bus_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\a_assign_reg_121[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(11),
      I1 => p_s_reg_45(11),
      O => \a_assign_reg_121[11]_i_2_n_0\
    );
\a_assign_reg_121[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(10),
      I1 => p_s_reg_45(10),
      O => \a_assign_reg_121[11]_i_3_n_0\
    );
\a_assign_reg_121[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(9),
      I1 => p_s_reg_45(9),
      O => \a_assign_reg_121[11]_i_4_n_0\
    );
\a_assign_reg_121[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(8),
      I1 => p_s_reg_45(8),
      O => \a_assign_reg_121[11]_i_5_n_0\
    );
\a_assign_reg_121[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(15),
      I1 => p_s_reg_45(15),
      O => \a_assign_reg_121[15]_i_2_n_0\
    );
\a_assign_reg_121[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(14),
      I1 => p_s_reg_45(14),
      O => \a_assign_reg_121[15]_i_3_n_0\
    );
\a_assign_reg_121[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(13),
      I1 => p_s_reg_45(13),
      O => \a_assign_reg_121[15]_i_4_n_0\
    );
\a_assign_reg_121[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(12),
      I1 => p_s_reg_45(12),
      O => \a_assign_reg_121[15]_i_5_n_0\
    );
\a_assign_reg_121[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(3),
      I1 => p_s_reg_45(3),
      O => \a_assign_reg_121[3]_i_2_n_0\
    );
\a_assign_reg_121[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(2),
      I1 => p_s_reg_45(2),
      O => \a_assign_reg_121[3]_i_3_n_0\
    );
\a_assign_reg_121[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(1),
      I1 => p_s_reg_45(1),
      O => \a_assign_reg_121[3]_i_4_n_0\
    );
\a_assign_reg_121[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(0),
      I1 => p_s_reg_45(0),
      O => \a_assign_reg_121[3]_i_5_n_0\
    );
\a_assign_reg_121[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(7),
      I1 => p_s_reg_45(7),
      O => \a_assign_reg_121[7]_i_2_n_0\
    );
\a_assign_reg_121[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(6),
      I1 => p_s_reg_45(6),
      O => \a_assign_reg_121[7]_i_3_n_0\
    );
\a_assign_reg_121[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(5),
      I1 => p_s_reg_45(5),
      O => \a_assign_reg_121[7]_i_4_n_0\
    );
\a_assign_reg_121[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => result_reg_56(4),
      I1 => p_s_reg_45(4),
      O => \a_assign_reg_121[7]_i_5_n_0\
    );
\a_assign_reg_121_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(0),
      Q => a_assign_reg_121(0),
      R => '0'
    );
\a_assign_reg_121_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(10),
      Q => a_assign_reg_121(10),
      R => '0'
    );
\a_assign_reg_121_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(11),
      Q => a_assign_reg_121(11),
      R => '0'
    );
\a_assign_reg_121_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \a_assign_reg_121_reg[7]_i_1_n_0\,
      CO(3) => \a_assign_reg_121_reg[11]_i_1_n_0\,
      CO(2) => \a_assign_reg_121_reg[11]_i_1_n_1\,
      CO(1) => \a_assign_reg_121_reg[11]_i_1_n_2\,
      CO(0) => \a_assign_reg_121_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => result_reg_56(11 downto 8),
      O(3 downto 0) => a_assign_fu_78_p21_out(11 downto 8),
      S(3) => \a_assign_reg_121[11]_i_2_n_0\,
      S(2) => \a_assign_reg_121[11]_i_3_n_0\,
      S(1) => \a_assign_reg_121[11]_i_4_n_0\,
      S(0) => \a_assign_reg_121[11]_i_5_n_0\
    );
\a_assign_reg_121_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(12),
      Q => a_assign_reg_121(12),
      R => '0'
    );
\a_assign_reg_121_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(13),
      Q => a_assign_reg_121(13),
      R => '0'
    );
\a_assign_reg_121_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(14),
      Q => a_assign_reg_121(14),
      R => '0'
    );
\a_assign_reg_121_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(15),
      Q => a_assign_reg_121(15),
      R => '0'
    );
\a_assign_reg_121_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \a_assign_reg_121_reg[11]_i_1_n_0\,
      CO(3) => \NLW_a_assign_reg_121_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \a_assign_reg_121_reg[15]_i_1_n_1\,
      CO(1) => \a_assign_reg_121_reg[15]_i_1_n_2\,
      CO(0) => \a_assign_reg_121_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => result_reg_56(14 downto 12),
      O(3 downto 0) => a_assign_fu_78_p21_out(15 downto 12),
      S(3) => \a_assign_reg_121[15]_i_2_n_0\,
      S(2) => \a_assign_reg_121[15]_i_3_n_0\,
      S(1) => \a_assign_reg_121[15]_i_4_n_0\,
      S(0) => \a_assign_reg_121[15]_i_5_n_0\
    );
\a_assign_reg_121_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(1),
      Q => a_assign_reg_121(1),
      R => '0'
    );
\a_assign_reg_121_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(2),
      Q => a_assign_reg_121(2),
      R => '0'
    );
\a_assign_reg_121_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(3),
      Q => a_assign_reg_121(3),
      R => '0'
    );
\a_assign_reg_121_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \a_assign_reg_121_reg[3]_i_1_n_0\,
      CO(2) => \a_assign_reg_121_reg[3]_i_1_n_1\,
      CO(1) => \a_assign_reg_121_reg[3]_i_1_n_2\,
      CO(0) => \a_assign_reg_121_reg[3]_i_1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => result_reg_56(3 downto 0),
      O(3 downto 0) => a_assign_fu_78_p21_out(3 downto 0),
      S(3) => \a_assign_reg_121[3]_i_2_n_0\,
      S(2) => \a_assign_reg_121[3]_i_3_n_0\,
      S(1) => \a_assign_reg_121[3]_i_4_n_0\,
      S(0) => \a_assign_reg_121[3]_i_5_n_0\
    );
\a_assign_reg_121_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(4),
      Q => a_assign_reg_121(4),
      R => '0'
    );
\a_assign_reg_121_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(5),
      Q => a_assign_reg_121(5),
      R => '0'
    );
\a_assign_reg_121_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(6),
      Q => a_assign_reg_121(6),
      R => '0'
    );
\a_assign_reg_121_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(7),
      Q => a_assign_reg_121(7),
      R => '0'
    );
\a_assign_reg_121_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \a_assign_reg_121_reg[3]_i_1_n_0\,
      CO(3) => \a_assign_reg_121_reg[7]_i_1_n_0\,
      CO(2) => \a_assign_reg_121_reg[7]_i_1_n_1\,
      CO(1) => \a_assign_reg_121_reg[7]_i_1_n_2\,
      CO(0) => \a_assign_reg_121_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => result_reg_56(7 downto 4),
      O(3 downto 0) => a_assign_fu_78_p21_out(7 downto 4),
      S(3) => \a_assign_reg_121[7]_i_2_n_0\,
      S(2) => \a_assign_reg_121[7]_i_3_n_0\,
      S(1) => \a_assign_reg_121[7]_i_4_n_0\,
      S(0) => \a_assign_reg_121[7]_i_5_n_0\
    );
\a_assign_reg_121_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(8),
      Q => a_assign_reg_121(8),
      R => '0'
    );
\a_assign_reg_121_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => a_assign_fu_78_p21_out(9),
      Q => a_assign_reg_121(9),
      R => '0'
    );
\a_read_reg_107_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(0),
      Q => a_read_reg_107(0),
      R => '0'
    );
\a_read_reg_107_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(10),
      Q => a_read_reg_107(10),
      R => '0'
    );
\a_read_reg_107_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(11),
      Q => a_read_reg_107(11),
      R => '0'
    );
\a_read_reg_107_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(12),
      Q => a_read_reg_107(12),
      R => '0'
    );
\a_read_reg_107_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(13),
      Q => a_read_reg_107(13),
      R => '0'
    );
\a_read_reg_107_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(14),
      Q => a_read_reg_107(14),
      R => '0'
    );
\a_read_reg_107_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(15),
      Q => a_read_reg_107(15),
      R => '0'
    );
\a_read_reg_107_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(1),
      Q => a_read_reg_107(1),
      R => '0'
    );
\a_read_reg_107_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(2),
      Q => a_read_reg_107(2),
      R => '0'
    );
\a_read_reg_107_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(3),
      Q => a_read_reg_107(3),
      R => '0'
    );
\a_read_reg_107_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(4),
      Q => a_read_reg_107(4),
      R => '0'
    );
\a_read_reg_107_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(5),
      Q => a_read_reg_107(5),
      R => '0'
    );
\a_read_reg_107_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(6),
      Q => a_read_reg_107(6),
      R => '0'
    );
\a_read_reg_107_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(7),
      Q => a_read_reg_107(7),
      R => '0'
    );
\a_read_reg_107_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(8),
      Q => a_read_reg_107(8),
      R => '0'
    );
\a_read_reg_107_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => a(9),
      Q => a_read_reg_107(9),
      R => '0'
    );
\ap_CS_fsm[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => ap_CS_fsm_state4,
      O => ap_NS_fsm(2)
    );
\ap_CS_fsm[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ap_CS_fsm_state3,
      I1 => tmp_2_fu_66_p2,
      O => a_assign_reg_1210
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
      Q => ap_CS_fsm_state2,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(2),
      Q => ap_CS_fsm_state3,
      R => ap_rst_n_inv
    );
\ap_CS_fsm_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => a_assign_reg_1210,
      Q => ap_CS_fsm_state4,
      R => ap_rst_n_inv
    );
\b_assign_reg_126[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(11),
      I1 => result_reg_56(11),
      O => \b_assign_reg_126[11]_i_2_n_0\
    );
\b_assign_reg_126[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(10),
      I1 => result_reg_56(10),
      O => \b_assign_reg_126[11]_i_3_n_0\
    );
\b_assign_reg_126[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(9),
      I1 => result_reg_56(9),
      O => \b_assign_reg_126[11]_i_4_n_0\
    );
\b_assign_reg_126[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(8),
      I1 => result_reg_56(8),
      O => \b_assign_reg_126[11]_i_5_n_0\
    );
\b_assign_reg_126[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(15),
      I1 => result_reg_56(15),
      O => \b_assign_reg_126[15]_i_2_n_0\
    );
\b_assign_reg_126[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(14),
      I1 => result_reg_56(14),
      O => \b_assign_reg_126[15]_i_3_n_0\
    );
\b_assign_reg_126[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(13),
      I1 => result_reg_56(13),
      O => \b_assign_reg_126[15]_i_4_n_0\
    );
\b_assign_reg_126[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(12),
      I1 => result_reg_56(12),
      O => \b_assign_reg_126[15]_i_5_n_0\
    );
\b_assign_reg_126[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(3),
      I1 => result_reg_56(3),
      O => \b_assign_reg_126[3]_i_2_n_0\
    );
\b_assign_reg_126[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(2),
      I1 => result_reg_56(2),
      O => \b_assign_reg_126[3]_i_3_n_0\
    );
\b_assign_reg_126[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(1),
      I1 => result_reg_56(1),
      O => \b_assign_reg_126[3]_i_4_n_0\
    );
\b_assign_reg_126[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(0),
      I1 => result_reg_56(0),
      O => \b_assign_reg_126[3]_i_5_n_0\
    );
\b_assign_reg_126[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(7),
      I1 => result_reg_56(7),
      O => \b_assign_reg_126[7]_i_2_n_0\
    );
\b_assign_reg_126[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(6),
      I1 => result_reg_56(6),
      O => \b_assign_reg_126[7]_i_3_n_0\
    );
\b_assign_reg_126[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(5),
      I1 => result_reg_56(5),
      O => \b_assign_reg_126[7]_i_4_n_0\
    );
\b_assign_reg_126[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_s_reg_45(4),
      I1 => result_reg_56(4),
      O => \b_assign_reg_126[7]_i_5_n_0\
    );
\b_assign_reg_126_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(0),
      Q => b_assign_reg_126(0),
      R => '0'
    );
\b_assign_reg_126_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(10),
      Q => b_assign_reg_126(10),
      R => '0'
    );
\b_assign_reg_126_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(11),
      Q => b_assign_reg_126(11),
      R => '0'
    );
\b_assign_reg_126_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \b_assign_reg_126_reg[7]_i_1_n_0\,
      CO(3) => \b_assign_reg_126_reg[11]_i_1_n_0\,
      CO(2) => \b_assign_reg_126_reg[11]_i_1_n_1\,
      CO(1) => \b_assign_reg_126_reg[11]_i_1_n_2\,
      CO(0) => \b_assign_reg_126_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => p_s_reg_45(11 downto 8),
      O(3 downto 0) => b_assign_fu_84_p20_out(11 downto 8),
      S(3) => \b_assign_reg_126[11]_i_2_n_0\,
      S(2) => \b_assign_reg_126[11]_i_3_n_0\,
      S(1) => \b_assign_reg_126[11]_i_4_n_0\,
      S(0) => \b_assign_reg_126[11]_i_5_n_0\
    );
\b_assign_reg_126_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(12),
      Q => b_assign_reg_126(12),
      R => '0'
    );
\b_assign_reg_126_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(13),
      Q => b_assign_reg_126(13),
      R => '0'
    );
\b_assign_reg_126_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(14),
      Q => b_assign_reg_126(14),
      R => '0'
    );
\b_assign_reg_126_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(15),
      Q => b_assign_reg_126(15),
      R => '0'
    );
\b_assign_reg_126_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \b_assign_reg_126_reg[11]_i_1_n_0\,
      CO(3) => \NLW_b_assign_reg_126_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \b_assign_reg_126_reg[15]_i_1_n_1\,
      CO(1) => \b_assign_reg_126_reg[15]_i_1_n_2\,
      CO(0) => \b_assign_reg_126_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => p_s_reg_45(14 downto 12),
      O(3 downto 0) => b_assign_fu_84_p20_out(15 downto 12),
      S(3) => \b_assign_reg_126[15]_i_2_n_0\,
      S(2) => \b_assign_reg_126[15]_i_3_n_0\,
      S(1) => \b_assign_reg_126[15]_i_4_n_0\,
      S(0) => \b_assign_reg_126[15]_i_5_n_0\
    );
\b_assign_reg_126_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(1),
      Q => b_assign_reg_126(1),
      R => '0'
    );
\b_assign_reg_126_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(2),
      Q => b_assign_reg_126(2),
      R => '0'
    );
\b_assign_reg_126_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(3),
      Q => b_assign_reg_126(3),
      R => '0'
    );
\b_assign_reg_126_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \b_assign_reg_126_reg[3]_i_1_n_0\,
      CO(2) => \b_assign_reg_126_reg[3]_i_1_n_1\,
      CO(1) => \b_assign_reg_126_reg[3]_i_1_n_2\,
      CO(0) => \b_assign_reg_126_reg[3]_i_1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => p_s_reg_45(3 downto 0),
      O(3 downto 0) => b_assign_fu_84_p20_out(3 downto 0),
      S(3) => \b_assign_reg_126[3]_i_2_n_0\,
      S(2) => \b_assign_reg_126[3]_i_3_n_0\,
      S(1) => \b_assign_reg_126[3]_i_4_n_0\,
      S(0) => \b_assign_reg_126[3]_i_5_n_0\
    );
\b_assign_reg_126_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(4),
      Q => b_assign_reg_126(4),
      R => '0'
    );
\b_assign_reg_126_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(5),
      Q => b_assign_reg_126(5),
      R => '0'
    );
\b_assign_reg_126_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(6),
      Q => b_assign_reg_126(6),
      R => '0'
    );
\b_assign_reg_126_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(7),
      Q => b_assign_reg_126(7),
      R => '0'
    );
\b_assign_reg_126_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \b_assign_reg_126_reg[3]_i_1_n_0\,
      CO(3) => \b_assign_reg_126_reg[7]_i_1_n_0\,
      CO(2) => \b_assign_reg_126_reg[7]_i_1_n_1\,
      CO(1) => \b_assign_reg_126_reg[7]_i_1_n_2\,
      CO(0) => \b_assign_reg_126_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => p_s_reg_45(7 downto 4),
      O(3 downto 0) => b_assign_fu_84_p20_out(7 downto 4),
      S(3) => \b_assign_reg_126[7]_i_2_n_0\,
      S(2) => \b_assign_reg_126[7]_i_3_n_0\,
      S(1) => \b_assign_reg_126[7]_i_4_n_0\,
      S(0) => \b_assign_reg_126[7]_i_5_n_0\
    );
\b_assign_reg_126_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(8),
      Q => b_assign_reg_126(8),
      R => '0'
    );
\b_assign_reg_126_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => b_assign_fu_84_p20_out(9),
      Q => b_assign_reg_126(9),
      R => '0'
    );
\b_read_reg_102_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(0),
      Q => b_read_reg_102(0),
      R => '0'
    );
\b_read_reg_102_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(10),
      Q => b_read_reg_102(10),
      R => '0'
    );
\b_read_reg_102_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(11),
      Q => b_read_reg_102(11),
      R => '0'
    );
\b_read_reg_102_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(12),
      Q => b_read_reg_102(12),
      R => '0'
    );
\b_read_reg_102_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(13),
      Q => b_read_reg_102(13),
      R => '0'
    );
\b_read_reg_102_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(14),
      Q => b_read_reg_102(14),
      R => '0'
    );
\b_read_reg_102_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(15),
      Q => b_read_reg_102(15),
      R => '0'
    );
\b_read_reg_102_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(1),
      Q => b_read_reg_102(1),
      R => '0'
    );
\b_read_reg_102_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(2),
      Q => b_read_reg_102(2),
      R => '0'
    );
\b_read_reg_102_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(3),
      Q => b_read_reg_102(3),
      R => '0'
    );
\b_read_reg_102_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(4),
      Q => b_read_reg_102(4),
      R => '0'
    );
\b_read_reg_102_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(5),
      Q => b_read_reg_102(5),
      R => '0'
    );
\b_read_reg_102_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(6),
      Q => b_read_reg_102(6),
      R => '0'
    );
\b_read_reg_102_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(7),
      Q => b_read_reg_102(7),
      R => '0'
    );
\b_read_reg_102_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(8),
      Q => b_read_reg_102(8),
      R => '0'
    );
\b_read_reg_102_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => b(9),
      Q => b_read_reg_102(9),
      R => '0'
    );
gcd_gcd_bus_s_axi_U: entity work.gcd_zynq_snick_gcd_0_0_gcd_gcd_bus_s_axi
     port map (
      CO(0) => tmp_2_fu_66_p2,
      D(1 downto 0) => ap_NS_fsm(1 downto 0),
      E(0) => ap_NS_fsm1,
      Q(3) => ap_CS_fsm_state4,
      Q(2) => ap_CS_fsm_state3,
      Q(1) => ap_CS_fsm_state2,
      Q(0) => \ap_CS_fsm_reg_n_0_[0]\,
      SR(0) => ap_rst_n_inv,
      \a_read_reg_107_reg[15]\(15 downto 0) => a(15 downto 0),
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      \b_read_reg_102_reg[15]\(15 downto 0) => b(15 downto 0),
      interrupt => interrupt,
      \out\(2) => s_axi_gcd_bus_BVALID,
      \out\(1) => s_axi_gcd_bus_WREADY,
      \out\(0) => s_axi_gcd_bus_AWREADY,
      \p_s_reg_45_reg[15]\(15 downto 0) => p_s_reg_45(15 downto 0),
      \result_reg_56_reg[15]\(15 downto 0) => result_reg_56(15 downto 0),
      s_axi_gcd_bus_ARADDR(5 downto 0) => s_axi_gcd_bus_ARADDR(5 downto 0),
      s_axi_gcd_bus_ARVALID => s_axi_gcd_bus_ARVALID,
      s_axi_gcd_bus_AWADDR(5 downto 0) => s_axi_gcd_bus_AWADDR(5 downto 0),
      s_axi_gcd_bus_AWVALID => s_axi_gcd_bus_AWVALID,
      s_axi_gcd_bus_BREADY => s_axi_gcd_bus_BREADY,
      s_axi_gcd_bus_RDATA(15 downto 0) => \^s_axi_gcd_bus_rdata\(15 downto 0),
      s_axi_gcd_bus_RREADY => s_axi_gcd_bus_RREADY,
      s_axi_gcd_bus_RVALID(1) => s_axi_gcd_bus_RVALID,
      s_axi_gcd_bus_RVALID(0) => s_axi_gcd_bus_ARREADY,
      s_axi_gcd_bus_WDATA(15 downto 0) => s_axi_gcd_bus_WDATA(15 downto 0),
      s_axi_gcd_bus_WSTRB(1 downto 0) => s_axi_gcd_bus_WSTRB(1 downto 0),
      s_axi_gcd_bus_WVALID => s_axi_gcd_bus_WVALID
    );
\p_s_reg_45[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(0),
      I1 => b_read_reg_102(0),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[0]_i_1_n_0\
    );
\p_s_reg_45[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(10),
      I1 => b_read_reg_102(10),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[10]_i_1_n_0\
    );
\p_s_reg_45[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(11),
      I1 => b_read_reg_102(11),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[11]_i_1_n_0\
    );
\p_s_reg_45[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(12),
      I1 => b_read_reg_102(12),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[12]_i_1_n_0\
    );
\p_s_reg_45[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(13),
      I1 => b_read_reg_102(13),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[13]_i_1_n_0\
    );
\p_s_reg_45[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(14),
      I1 => b_read_reg_102(14),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[14]_i_1_n_0\
    );
\p_s_reg_45[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => tmp_3_reg_115,
      I1 => ap_CS_fsm_state4,
      I2 => ap_CS_fsm_state2,
      O => \p_s_reg_45[15]_i_1_n_0\
    );
\p_s_reg_45[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(15),
      I1 => b_read_reg_102(15),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[15]_i_2_n_0\
    );
\p_s_reg_45[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(1),
      I1 => b_read_reg_102(1),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[1]_i_1_n_0\
    );
\p_s_reg_45[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(2),
      I1 => b_read_reg_102(2),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[2]_i_1_n_0\
    );
\p_s_reg_45[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(3),
      I1 => b_read_reg_102(3),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[3]_i_1_n_0\
    );
\p_s_reg_45[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(4),
      I1 => b_read_reg_102(4),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[4]_i_1_n_0\
    );
\p_s_reg_45[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(5),
      I1 => b_read_reg_102(5),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[5]_i_1_n_0\
    );
\p_s_reg_45[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(6),
      I1 => b_read_reg_102(6),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[6]_i_1_n_0\
    );
\p_s_reg_45[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(7),
      I1 => b_read_reg_102(7),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[7]_i_1_n_0\
    );
\p_s_reg_45[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(8),
      I1 => b_read_reg_102(8),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[8]_i_1_n_0\
    );
\p_s_reg_45[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => b_assign_reg_126(9),
      I1 => b_read_reg_102(9),
      I2 => ap_CS_fsm_state4,
      O => \p_s_reg_45[9]_i_1_n_0\
    );
\p_s_reg_45_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[0]_i_1_n_0\,
      Q => p_s_reg_45(0),
      R => '0'
    );
\p_s_reg_45_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[10]_i_1_n_0\,
      Q => p_s_reg_45(10),
      R => '0'
    );
\p_s_reg_45_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[11]_i_1_n_0\,
      Q => p_s_reg_45(11),
      R => '0'
    );
\p_s_reg_45_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[12]_i_1_n_0\,
      Q => p_s_reg_45(12),
      R => '0'
    );
\p_s_reg_45_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[13]_i_1_n_0\,
      Q => p_s_reg_45(13),
      R => '0'
    );
\p_s_reg_45_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[14]_i_1_n_0\,
      Q => p_s_reg_45(14),
      R => '0'
    );
\p_s_reg_45_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[15]_i_2_n_0\,
      Q => p_s_reg_45(15),
      R => '0'
    );
\p_s_reg_45_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[1]_i_1_n_0\,
      Q => p_s_reg_45(1),
      R => '0'
    );
\p_s_reg_45_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[2]_i_1_n_0\,
      Q => p_s_reg_45(2),
      R => '0'
    );
\p_s_reg_45_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[3]_i_1_n_0\,
      Q => p_s_reg_45(3),
      R => '0'
    );
\p_s_reg_45_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[4]_i_1_n_0\,
      Q => p_s_reg_45(4),
      R => '0'
    );
\p_s_reg_45_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[5]_i_1_n_0\,
      Q => p_s_reg_45(5),
      R => '0'
    );
\p_s_reg_45_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[6]_i_1_n_0\,
      Q => p_s_reg_45(6),
      R => '0'
    );
\p_s_reg_45_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[7]_i_1_n_0\,
      Q => p_s_reg_45(7),
      R => '0'
    );
\p_s_reg_45_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[8]_i_1_n_0\,
      Q => p_s_reg_45(8),
      R => '0'
    );
\p_s_reg_45_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \p_s_reg_45[15]_i_1_n_0\,
      D => \p_s_reg_45[9]_i_1_n_0\,
      Q => p_s_reg_45(9),
      R => '0'
    );
\result_reg_56[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(0),
      I1 => a_read_reg_107(0),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(0)
    );
\result_reg_56[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(10),
      I1 => a_read_reg_107(10),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(10)
    );
\result_reg_56[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(11),
      I1 => a_read_reg_107(11),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(11)
    );
\result_reg_56[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(12),
      I1 => a_read_reg_107(12),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(12)
    );
\result_reg_56[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(13),
      I1 => a_read_reg_107(13),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(13)
    );
\result_reg_56[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(14),
      I1 => a_read_reg_107(14),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(14)
    );
\result_reg_56[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => tmp_3_reg_115,
      I1 => ap_CS_fsm_state4,
      I2 => ap_CS_fsm_state2,
      O => \result_reg_56[15]_i_1_n_0\
    );
\result_reg_56[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(15),
      I1 => a_read_reg_107(15),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(15)
    );
\result_reg_56[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(1),
      I1 => a_read_reg_107(1),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(1)
    );
\result_reg_56[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(2),
      I1 => a_read_reg_107(2),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(2)
    );
\result_reg_56[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(3),
      I1 => a_read_reg_107(3),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(3)
    );
\result_reg_56[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(4),
      I1 => a_read_reg_107(4),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(4)
    );
\result_reg_56[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(5),
      I1 => a_read_reg_107(5),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(5)
    );
\result_reg_56[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(6),
      I1 => a_read_reg_107(6),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(6)
    );
\result_reg_56[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(7),
      I1 => a_read_reg_107(7),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(7)
    );
\result_reg_56[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(8),
      I1 => a_read_reg_107(8),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(8)
    );
\result_reg_56[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a_assign_reg_121(9),
      I1 => a_read_reg_107(9),
      I2 => ap_CS_fsm_state4,
      O => p_1_in(9)
    );
\result_reg_56_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(0),
      Q => result_reg_56(0),
      R => '0'
    );
\result_reg_56_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(10),
      Q => result_reg_56(10),
      R => '0'
    );
\result_reg_56_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(11),
      Q => result_reg_56(11),
      R => '0'
    );
\result_reg_56_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(12),
      Q => result_reg_56(12),
      R => '0'
    );
\result_reg_56_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(13),
      Q => result_reg_56(13),
      R => '0'
    );
\result_reg_56_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(14),
      Q => result_reg_56(14),
      R => '0'
    );
\result_reg_56_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(15),
      Q => result_reg_56(15),
      R => '0'
    );
\result_reg_56_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(1),
      Q => result_reg_56(1),
      R => '0'
    );
\result_reg_56_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(2),
      Q => result_reg_56(2),
      R => '0'
    );
\result_reg_56_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(3),
      Q => result_reg_56(3),
      R => '0'
    );
\result_reg_56_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(4),
      Q => result_reg_56(4),
      R => '0'
    );
\result_reg_56_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(5),
      Q => result_reg_56(5),
      R => '0'
    );
\result_reg_56_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(6),
      Q => result_reg_56(6),
      R => '0'
    );
\result_reg_56_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(7),
      Q => result_reg_56(7),
      R => '0'
    );
\result_reg_56_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(8),
      Q => result_reg_56(8),
      R => '0'
    );
\result_reg_56_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \result_reg_56[15]_i_1_n_0\,
      D => p_1_in(9),
      Q => result_reg_56(9),
      R => '0'
    );
\tmp_3_reg_115[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(8),
      I1 => p_s_reg_45(8),
      I2 => result_reg_56(9),
      I3 => p_s_reg_45(9),
      O => \tmp_3_reg_115[0]_i_10_n_0\
    );
\tmp_3_reg_115[0]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(6),
      I1 => p_s_reg_45(6),
      I2 => p_s_reg_45(7),
      I3 => result_reg_56(7),
      O => \tmp_3_reg_115[0]_i_11_n_0\
    );
\tmp_3_reg_115[0]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(4),
      I1 => p_s_reg_45(4),
      I2 => p_s_reg_45(5),
      I3 => result_reg_56(5),
      O => \tmp_3_reg_115[0]_i_12_n_0\
    );
\tmp_3_reg_115[0]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(2),
      I1 => p_s_reg_45(2),
      I2 => p_s_reg_45(3),
      I3 => result_reg_56(3),
      O => \tmp_3_reg_115[0]_i_13_n_0\
    );
\tmp_3_reg_115[0]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(0),
      I1 => p_s_reg_45(0),
      I2 => p_s_reg_45(1),
      I3 => result_reg_56(1),
      O => \tmp_3_reg_115[0]_i_14_n_0\
    );
\tmp_3_reg_115[0]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(6),
      I1 => p_s_reg_45(6),
      I2 => result_reg_56(7),
      I3 => p_s_reg_45(7),
      O => \tmp_3_reg_115[0]_i_15_n_0\
    );
\tmp_3_reg_115[0]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(4),
      I1 => p_s_reg_45(4),
      I2 => result_reg_56(5),
      I3 => p_s_reg_45(5),
      O => \tmp_3_reg_115[0]_i_16_n_0\
    );
\tmp_3_reg_115[0]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(2),
      I1 => p_s_reg_45(2),
      I2 => result_reg_56(3),
      I3 => p_s_reg_45(3),
      O => \tmp_3_reg_115[0]_i_17_n_0\
    );
\tmp_3_reg_115[0]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(0),
      I1 => p_s_reg_45(0),
      I2 => result_reg_56(1),
      I3 => p_s_reg_45(1),
      O => \tmp_3_reg_115[0]_i_18_n_0\
    );
\tmp_3_reg_115[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(14),
      I1 => p_s_reg_45(14),
      I2 => result_reg_56(15),
      I3 => p_s_reg_45(15),
      O => \tmp_3_reg_115[0]_i_3_n_0\
    );
\tmp_3_reg_115[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(12),
      I1 => p_s_reg_45(12),
      I2 => p_s_reg_45(13),
      I3 => result_reg_56(13),
      O => \tmp_3_reg_115[0]_i_4_n_0\
    );
\tmp_3_reg_115[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(10),
      I1 => p_s_reg_45(10),
      I2 => p_s_reg_45(11),
      I3 => result_reg_56(11),
      O => \tmp_3_reg_115[0]_i_5_n_0\
    );
\tmp_3_reg_115[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => result_reg_56(8),
      I1 => p_s_reg_45(8),
      I2 => p_s_reg_45(9),
      I3 => result_reg_56(9),
      O => \tmp_3_reg_115[0]_i_6_n_0\
    );
\tmp_3_reg_115[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(14),
      I1 => p_s_reg_45(14),
      I2 => p_s_reg_45(15),
      I3 => result_reg_56(15),
      O => \tmp_3_reg_115[0]_i_7_n_0\
    );
\tmp_3_reg_115[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(12),
      I1 => p_s_reg_45(12),
      I2 => result_reg_56(13),
      I3 => p_s_reg_45(13),
      O => \tmp_3_reg_115[0]_i_8_n_0\
    );
\tmp_3_reg_115[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => result_reg_56(10),
      I1 => p_s_reg_45(10),
      I2 => result_reg_56(11),
      I3 => p_s_reg_45(11),
      O => \tmp_3_reg_115[0]_i_9_n_0\
    );
\tmp_3_reg_115_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => a_assign_reg_1210,
      D => tmp_3_fu_72_p2,
      Q => tmp_3_reg_115,
      R => '0'
    );
\tmp_3_reg_115_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp_3_reg_115_reg[0]_i_2_n_0\,
      CO(3) => tmp_3_fu_72_p2,
      CO(2) => \tmp_3_reg_115_reg[0]_i_1_n_1\,
      CO(1) => \tmp_3_reg_115_reg[0]_i_1_n_2\,
      CO(0) => \tmp_3_reg_115_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \tmp_3_reg_115[0]_i_3_n_0\,
      DI(2) => \tmp_3_reg_115[0]_i_4_n_0\,
      DI(1) => \tmp_3_reg_115[0]_i_5_n_0\,
      DI(0) => \tmp_3_reg_115[0]_i_6_n_0\,
      O(3 downto 0) => \NLW_tmp_3_reg_115_reg[0]_i_1_O_UNCONNECTED\(3 downto 0),
      S(3) => \tmp_3_reg_115[0]_i_7_n_0\,
      S(2) => \tmp_3_reg_115[0]_i_8_n_0\,
      S(1) => \tmp_3_reg_115[0]_i_9_n_0\,
      S(0) => \tmp_3_reg_115[0]_i_10_n_0\
    );
\tmp_3_reg_115_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \tmp_3_reg_115_reg[0]_i_2_n_0\,
      CO(2) => \tmp_3_reg_115_reg[0]_i_2_n_1\,
      CO(1) => \tmp_3_reg_115_reg[0]_i_2_n_2\,
      CO(0) => \tmp_3_reg_115_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \tmp_3_reg_115[0]_i_11_n_0\,
      DI(2) => \tmp_3_reg_115[0]_i_12_n_0\,
      DI(1) => \tmp_3_reg_115[0]_i_13_n_0\,
      DI(0) => \tmp_3_reg_115[0]_i_14_n_0\,
      O(3 downto 0) => \NLW_tmp_3_reg_115_reg[0]_i_2_O_UNCONNECTED\(3 downto 0),
      S(3) => \tmp_3_reg_115[0]_i_15_n_0\,
      S(2) => \tmp_3_reg_115[0]_i_16_n_0\,
      S(1) => \tmp_3_reg_115[0]_i_17_n_0\,
      S(0) => \tmp_3_reg_115[0]_i_18_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gcd_zynq_snick_gcd_0_0 is
  port (
    s_axi_gcd_bus_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_gcd_bus_AWVALID : in STD_LOGIC;
    s_axi_gcd_bus_AWREADY : out STD_LOGIC;
    s_axi_gcd_bus_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_gcd_bus_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_gcd_bus_WVALID : in STD_LOGIC;
    s_axi_gcd_bus_WREADY : out STD_LOGIC;
    s_axi_gcd_bus_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_gcd_bus_BVALID : out STD_LOGIC;
    s_axi_gcd_bus_BREADY : in STD_LOGIC;
    s_axi_gcd_bus_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_gcd_bus_ARVALID : in STD_LOGIC;
    s_axi_gcd_bus_ARREADY : out STD_LOGIC;
    s_axi_gcd_bus_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_gcd_bus_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_gcd_bus_RVALID : out STD_LOGIC;
    s_axi_gcd_bus_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of gcd_zynq_snick_gcd_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of gcd_zynq_snick_gcd_0_0 : entity is "gcd_zynq_snick_gcd_0_0,gcd,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gcd_zynq_snick_gcd_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of gcd_zynq_snick_gcd_0_0 : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of gcd_zynq_snick_gcd_0_0 : entity is "gcd,Vivado 2018.2";
  attribute hls_module : string;
  attribute hls_module of gcd_zynq_snick_gcd_0_0 : entity is "yes";
end gcd_zynq_snick_gcd_0_0;

architecture STRUCTURE of gcd_zynq_snick_gcd_0_0 is
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_GCD_BUS_ADDR_WIDTH : integer;
  attribute C_S_AXI_GCD_BUS_ADDR_WIDTH of inst : label is 6;
  attribute C_S_AXI_GCD_BUS_DATA_WIDTH : integer;
  attribute C_S_AXI_GCD_BUS_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_GCD_BUS_WSTRB_WIDTH : integer;
  attribute C_S_AXI_GCD_BUS_WSTRB_WIDTH of inst : label is 4;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of inst : label is 4;
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "4'b0001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of inst : label is "4'b0010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of inst : label is "4'b0100";
  attribute ap_ST_fsm_state4 : string;
  attribute ap_ST_fsm_state4 of inst : label is "4'b1000";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_gcd_bus, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 49999947, PHASE 0.000, CLK_DOMAIN gcd_zynq_snick_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus ARREADY";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus ARVALID";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus AWREADY";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus AWVALID";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus BREADY";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus BVALID";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_gcd_bus_RREADY : signal is "XIL_INTERFACENAME s_axi_gcd_bus, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 49999947, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN gcd_zynq_snick_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RVALID";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WREADY";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WVALID";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus ARADDR";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus AWADDR";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus BRESP";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RDATA";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus RRESP";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WDATA";
  attribute X_INTERFACE_INFO of s_axi_gcd_bus_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_gcd_bus WSTRB";
begin
inst: entity work.gcd_zynq_snick_gcd_0_0_gcd
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      s_axi_gcd_bus_ARADDR(5 downto 0) => s_axi_gcd_bus_ARADDR(5 downto 0),
      s_axi_gcd_bus_ARREADY => s_axi_gcd_bus_ARREADY,
      s_axi_gcd_bus_ARVALID => s_axi_gcd_bus_ARVALID,
      s_axi_gcd_bus_AWADDR(5 downto 0) => s_axi_gcd_bus_AWADDR(5 downto 0),
      s_axi_gcd_bus_AWREADY => s_axi_gcd_bus_AWREADY,
      s_axi_gcd_bus_AWVALID => s_axi_gcd_bus_AWVALID,
      s_axi_gcd_bus_BREADY => s_axi_gcd_bus_BREADY,
      s_axi_gcd_bus_BRESP(1 downto 0) => s_axi_gcd_bus_BRESP(1 downto 0),
      s_axi_gcd_bus_BVALID => s_axi_gcd_bus_BVALID,
      s_axi_gcd_bus_RDATA(31 downto 0) => s_axi_gcd_bus_RDATA(31 downto 0),
      s_axi_gcd_bus_RREADY => s_axi_gcd_bus_RREADY,
      s_axi_gcd_bus_RRESP(1 downto 0) => s_axi_gcd_bus_RRESP(1 downto 0),
      s_axi_gcd_bus_RVALID => s_axi_gcd_bus_RVALID,
      s_axi_gcd_bus_WDATA(31 downto 0) => s_axi_gcd_bus_WDATA(31 downto 0),
      s_axi_gcd_bus_WREADY => s_axi_gcd_bus_WREADY,
      s_axi_gcd_bus_WSTRB(3 downto 0) => s_axi_gcd_bus_WSTRB(3 downto 0),
      s_axi_gcd_bus_WVALID => s_axi_gcd_bus_WVALID
    );
end STRUCTURE;
