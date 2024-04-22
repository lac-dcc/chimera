-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon Sep 16 04:56:42 2019
-- Host        : varun-laptop running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_pointer_basic_0_0_sim_netlist.vhdl
-- Design      : design_1_pointer_basic_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic_pointer_basic_io_s_axi is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_pointer_basic_io_RVALID : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_clk : in STD_LOGIC;
    s_axi_pointer_basic_io_ARVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_RREADY : in STD_LOGIC;
    s_axi_pointer_basic_io_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_pointer_basic_io_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ap_rst_n : in STD_LOGIC;
    \ap_CS_fsm_reg[2]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_pointer_basic_io_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_AWVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_BREADY : in STD_LOGIC;
    s_axi_pointer_basic_io_WVALID : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic_pointer_basic_io_s_axi;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic_pointer_basic_io_s_axi is
  signal \FSM_onehot_rstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rstate_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FSM_onehot_rstate_reg_n_0_[0]\ : signal is "yes";
  signal \FSM_onehot_wstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_wstate_reg_n_0_[0]\ : signal is "yes";
  signal \^q\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ar_hs : STD_LOGIC;
  signal \int_d_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[10]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[11]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[12]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[13]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[14]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[15]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[16]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[17]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[18]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[19]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[20]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[21]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[22]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[23]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[24]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[25]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[26]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[27]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[28]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[29]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[30]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[31]_i_2_n_0\ : STD_LOGIC;
  signal \int_d_i[31]_i_3_n_0\ : STD_LOGIC;
  signal \int_d_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[4]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[5]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[6]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[7]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[8]_i_1_n_0\ : STD_LOGIC;
  signal \int_d_i[9]_i_1_n_0\ : STD_LOGIC;
  signal int_d_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal int_d_o_ap_vld : STD_LOGIC;
  signal int_d_o_ap_vld_i_1_n_0 : STD_LOGIC;
  signal int_d_o_ap_vld_i_2_n_0 : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal p_0_in : STD_LOGIC;
  signal \rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_2_n_0\ : STD_LOGIC;
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
  signal \rdata[30]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \^s_axi_pointer_basic_io_rdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axi_pointer_basic_io_rvalid\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \^s_axi_pointer_basic_io_rvalid\ : signal is "yes";
  signal waddr : STD_LOGIC;
  signal \waddr_reg_n_0_[0]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[1]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[4]\ : STD_LOGIC;
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
  attribute SOFT_HLUTNM of \int_d_i[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_d_i[10]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_d_i[11]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_d_i[12]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_d_i[13]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_d_i[14]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_d_i[15]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_d_i[16]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_d_i[17]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_d_i[18]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_d_i[19]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_d_i[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_d_i[20]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_d_i[21]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_d_i[22]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_d_i[23]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_d_i[24]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_d_i[25]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_d_i[26]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \int_d_i[27]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \int_d_i[28]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \int_d_i[29]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \int_d_i[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_d_i[30]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \int_d_i[31]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \int_d_i[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_d_i[4]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_d_i[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_d_i[6]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_d_i[7]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_d_i[8]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_d_i[9]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rdata[10]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rdata[11]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rdata[12]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rdata[13]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rdata[14]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \rdata[15]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \rdata[16]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \rdata[17]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \rdata[18]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \rdata[19]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \rdata[20]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rdata[21]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rdata[22]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \rdata[23]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \rdata[24]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \rdata[25]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \rdata[26]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rdata[27]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rdata[28]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rdata[29]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rdata[2]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rdata[30]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rdata[31]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rdata[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rdata[4]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \rdata[5]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \rdata[6]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rdata[7]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rdata[8]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rdata[9]_i_1\ : label is "soft_lutpair27";
begin
  Q(31 downto 0) <= \^q\(31 downto 0);
  SR(0) <= \^sr\(0);
  \out\(2 downto 0) <= \^out\(2 downto 0);
  s_axi_pointer_basic_io_RDATA(31 downto 0) <= \^s_axi_pointer_basic_io_rdata\(31 downto 0);
  s_axi_pointer_basic_io_RVALID(1 downto 0) <= \^s_axi_pointer_basic_io_rvalid\(1 downto 0);
\FSM_onehot_rstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BFB"
    )
        port map (
      I0 => s_axi_pointer_basic_io_RREADY,
      I1 => \^s_axi_pointer_basic_io_rvalid\(1),
      I2 => \^s_axi_pointer_basic_io_rvalid\(0),
      I3 => s_axi_pointer_basic_io_ARVALID,
      O => \FSM_onehot_rstate[1]_i_1_n_0\
    );
\FSM_onehot_rstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_pointer_basic_io_ARVALID,
      I1 => \^s_axi_pointer_basic_io_rvalid\(0),
      I2 => s_axi_pointer_basic_io_RREADY,
      I3 => \^s_axi_pointer_basic_io_rvalid\(1),
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
      Q => \^s_axi_pointer_basic_io_rvalid\(0),
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
      Q => \^s_axi_pointer_basic_io_rvalid\(1),
      R => \^sr\(0)
    );
\FSM_onehot_wstate[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888BFF8B"
    )
        port map (
      I0 => s_axi_pointer_basic_io_BREADY,
      I1 => \^out\(2),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => s_axi_pointer_basic_io_AWVALID,
      O => \FSM_onehot_wstate[1]_i_1_n_0\
    );
\FSM_onehot_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_pointer_basic_io_AWVALID,
      I1 => \^out\(0),
      I2 => s_axi_pointer_basic_io_WVALID,
      I3 => \^out\(1),
      O => \FSM_onehot_wstate[2]_i_1_n_0\
    );
\FSM_onehot_wstate[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WVALID,
      I1 => \^out\(1),
      I2 => s_axi_pointer_basic_io_BREADY,
      I3 => \^out\(2),
      O => \FSM_onehot_wstate[3]_i_1_n_0\
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
      D => \FSM_onehot_wstate[3]_i_1_n_0\,
      Q => \^out\(2),
      R => \^sr\(0)
    );
\ap_CS_fsm[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => \^sr\(0)
    );
\int_d_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(0),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(0),
      O => \int_d_i[0]_i_1_n_0\
    );
\int_d_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(10),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(10),
      O => \int_d_i[10]_i_1_n_0\
    );
\int_d_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(11),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(11),
      O => \int_d_i[11]_i_1_n_0\
    );
\int_d_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(12),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(12),
      O => \int_d_i[12]_i_1_n_0\
    );
\int_d_i[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(13),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(13),
      O => \int_d_i[13]_i_1_n_0\
    );
\int_d_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(14),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(14),
      O => \int_d_i[14]_i_1_n_0\
    );
\int_d_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(15),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(15),
      O => \int_d_i[15]_i_1_n_0\
    );
\int_d_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(16),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(16),
      O => \int_d_i[16]_i_1_n_0\
    );
\int_d_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(17),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(17),
      O => \int_d_i[17]_i_1_n_0\
    );
\int_d_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(18),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(18),
      O => \int_d_i[18]_i_1_n_0\
    );
\int_d_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(19),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(19),
      O => \int_d_i[19]_i_1_n_0\
    );
\int_d_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(1),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(1),
      O => \int_d_i[1]_i_1_n_0\
    );
\int_d_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(20),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(20),
      O => \int_d_i[20]_i_1_n_0\
    );
\int_d_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(21),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(21),
      O => \int_d_i[21]_i_1_n_0\
    );
\int_d_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(22),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(22),
      O => \int_d_i[22]_i_1_n_0\
    );
\int_d_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(23),
      I1 => s_axi_pointer_basic_io_WSTRB(2),
      I2 => \^q\(23),
      O => \int_d_i[23]_i_1_n_0\
    );
\int_d_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(24),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(24),
      O => \int_d_i[24]_i_1_n_0\
    );
\int_d_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(25),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(25),
      O => \int_d_i[25]_i_1_n_0\
    );
\int_d_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(26),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(26),
      O => \int_d_i[26]_i_1_n_0\
    );
\int_d_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(27),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(27),
      O => \int_d_i[27]_i_1_n_0\
    );
\int_d_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(28),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(28),
      O => \int_d_i[28]_i_1_n_0\
    );
\int_d_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(29),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(29),
      O => \int_d_i[29]_i_1_n_0\
    );
\int_d_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(2),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(2),
      O => \int_d_i[2]_i_1_n_0\
    );
\int_d_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(30),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(30),
      O => \int_d_i[30]_i_1_n_0\
    );
\int_d_i[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WVALID,
      I1 => \int_d_i[31]_i_3_n_0\,
      O => p_0_in
    );
\int_d_i[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(31),
      I1 => s_axi_pointer_basic_io_WSTRB(3),
      I2 => \^q\(31),
      O => \int_d_i[31]_i_2_n_0\
    );
\int_d_i[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \waddr_reg_n_0_[0]\,
      I1 => \waddr_reg_n_0_[3]\,
      I2 => \waddr_reg_n_0_[1]\,
      I3 => \waddr_reg_n_0_[2]\,
      I4 => \waddr_reg_n_0_[4]\,
      I5 => \^out\(1),
      O => \int_d_i[31]_i_3_n_0\
    );
\int_d_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(3),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(3),
      O => \int_d_i[3]_i_1_n_0\
    );
\int_d_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(4),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(4),
      O => \int_d_i[4]_i_1_n_0\
    );
\int_d_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(5),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(5),
      O => \int_d_i[5]_i_1_n_0\
    );
\int_d_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(6),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(6),
      O => \int_d_i[6]_i_1_n_0\
    );
\int_d_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(7),
      I1 => s_axi_pointer_basic_io_WSTRB(0),
      I2 => \^q\(7),
      O => \int_d_i[7]_i_1_n_0\
    );
\int_d_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(8),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(8),
      O => \int_d_i[8]_i_1_n_0\
    );
\int_d_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_WDATA(9),
      I1 => s_axi_pointer_basic_io_WSTRB(1),
      I2 => \^q\(9),
      O => \int_d_i[9]_i_1_n_0\
    );
\int_d_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \^sr\(0)
    );
\int_d_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[10]_i_1_n_0\,
      Q => \^q\(10),
      R => \^sr\(0)
    );
\int_d_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[11]_i_1_n_0\,
      Q => \^q\(11),
      R => \^sr\(0)
    );
\int_d_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[12]_i_1_n_0\,
      Q => \^q\(12),
      R => \^sr\(0)
    );
\int_d_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[13]_i_1_n_0\,
      Q => \^q\(13),
      R => \^sr\(0)
    );
\int_d_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[14]_i_1_n_0\,
      Q => \^q\(14),
      R => \^sr\(0)
    );
\int_d_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[15]_i_1_n_0\,
      Q => \^q\(15),
      R => \^sr\(0)
    );
\int_d_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[16]_i_1_n_0\,
      Q => \^q\(16),
      R => \^sr\(0)
    );
\int_d_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[17]_i_1_n_0\,
      Q => \^q\(17),
      R => \^sr\(0)
    );
\int_d_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[18]_i_1_n_0\,
      Q => \^q\(18),
      R => \^sr\(0)
    );
\int_d_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[19]_i_1_n_0\,
      Q => \^q\(19),
      R => \^sr\(0)
    );
\int_d_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[1]_i_1_n_0\,
      Q => \^q\(1),
      R => \^sr\(0)
    );
\int_d_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[20]_i_1_n_0\,
      Q => \^q\(20),
      R => \^sr\(0)
    );
\int_d_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[21]_i_1_n_0\,
      Q => \^q\(21),
      R => \^sr\(0)
    );
\int_d_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[22]_i_1_n_0\,
      Q => \^q\(22),
      R => \^sr\(0)
    );
\int_d_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[23]_i_1_n_0\,
      Q => \^q\(23),
      R => \^sr\(0)
    );
\int_d_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[24]_i_1_n_0\,
      Q => \^q\(24),
      R => \^sr\(0)
    );
\int_d_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[25]_i_1_n_0\,
      Q => \^q\(25),
      R => \^sr\(0)
    );
\int_d_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[26]_i_1_n_0\,
      Q => \^q\(26),
      R => \^sr\(0)
    );
\int_d_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[27]_i_1_n_0\,
      Q => \^q\(27),
      R => \^sr\(0)
    );
\int_d_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[28]_i_1_n_0\,
      Q => \^q\(28),
      R => \^sr\(0)
    );
\int_d_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[29]_i_1_n_0\,
      Q => \^q\(29),
      R => \^sr\(0)
    );
\int_d_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[2]_i_1_n_0\,
      Q => \^q\(2),
      R => \^sr\(0)
    );
\int_d_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[30]_i_1_n_0\,
      Q => \^q\(30),
      R => \^sr\(0)
    );
\int_d_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[31]_i_2_n_0\,
      Q => \^q\(31),
      R => \^sr\(0)
    );
\int_d_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[3]_i_1_n_0\,
      Q => \^q\(3),
      R => \^sr\(0)
    );
\int_d_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[4]_i_1_n_0\,
      Q => \^q\(4),
      R => \^sr\(0)
    );
\int_d_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[5]_i_1_n_0\,
      Q => \^q\(5),
      R => \^sr\(0)
    );
\int_d_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[6]_i_1_n_0\,
      Q => \^q\(6),
      R => \^sr\(0)
    );
\int_d_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[7]_i_1_n_0\,
      Q => \^q\(7),
      R => \^sr\(0)
    );
\int_d_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[8]_i_1_n_0\,
      Q => \^q\(8),
      R => \^sr\(0)
    );
\int_d_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => p_0_in,
      D => \int_d_i[9]_i_1_n_0\,
      Q => \^q\(9),
      R => \^sr\(0)
    );
int_d_o_ap_vld_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFFAAAAAAAA"
    )
        port map (
      I0 => \ap_CS_fsm_reg[2]\(0),
      I1 => ar_hs,
      I2 => s_axi_pointer_basic_io_ARADDR(3),
      I3 => s_axi_pointer_basic_io_ARADDR(2),
      I4 => int_d_o_ap_vld_i_2_n_0,
      I5 => int_d_o_ap_vld,
      O => int_d_o_ap_vld_i_1_n_0
    );
int_d_o_ap_vld_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => s_axi_pointer_basic_io_ARADDR(1),
      I1 => s_axi_pointer_basic_io_ARADDR(4),
      I2 => s_axi_pointer_basic_io_ARADDR(0),
      O => int_d_o_ap_vld_i_2_n_0
    );
int_d_o_ap_vld_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => int_d_o_ap_vld_i_1_n_0,
      Q => int_d_o_ap_vld,
      R => \^sr\(0)
    );
\int_d_o_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(0),
      Q => int_d_o(0),
      R => \^sr\(0)
    );
\int_d_o_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(10),
      Q => int_d_o(10),
      R => \^sr\(0)
    );
\int_d_o_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(11),
      Q => int_d_o(11),
      R => \^sr\(0)
    );
\int_d_o_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(12),
      Q => int_d_o(12),
      R => \^sr\(0)
    );
\int_d_o_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(13),
      Q => int_d_o(13),
      R => \^sr\(0)
    );
\int_d_o_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(14),
      Q => int_d_o(14),
      R => \^sr\(0)
    );
\int_d_o_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(15),
      Q => int_d_o(15),
      R => \^sr\(0)
    );
\int_d_o_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(16),
      Q => int_d_o(16),
      R => \^sr\(0)
    );
\int_d_o_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(17),
      Q => int_d_o(17),
      R => \^sr\(0)
    );
\int_d_o_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(18),
      Q => int_d_o(18),
      R => \^sr\(0)
    );
\int_d_o_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(19),
      Q => int_d_o(19),
      R => \^sr\(0)
    );
\int_d_o_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(1),
      Q => int_d_o(1),
      R => \^sr\(0)
    );
\int_d_o_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(20),
      Q => int_d_o(20),
      R => \^sr\(0)
    );
\int_d_o_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(21),
      Q => int_d_o(21),
      R => \^sr\(0)
    );
\int_d_o_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(22),
      Q => int_d_o(22),
      R => \^sr\(0)
    );
\int_d_o_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(23),
      Q => int_d_o(23),
      R => \^sr\(0)
    );
\int_d_o_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(24),
      Q => int_d_o(24),
      R => \^sr\(0)
    );
\int_d_o_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(25),
      Q => int_d_o(25),
      R => \^sr\(0)
    );
\int_d_o_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(26),
      Q => int_d_o(26),
      R => \^sr\(0)
    );
\int_d_o_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(27),
      Q => int_d_o(27),
      R => \^sr\(0)
    );
\int_d_o_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(28),
      Q => int_d_o(28),
      R => \^sr\(0)
    );
\int_d_o_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(29),
      Q => int_d_o(29),
      R => \^sr\(0)
    );
\int_d_o_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(2),
      Q => int_d_o(2),
      R => \^sr\(0)
    );
\int_d_o_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(30),
      Q => int_d_o(30),
      R => \^sr\(0)
    );
\int_d_o_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(31),
      Q => int_d_o(31),
      R => \^sr\(0)
    );
\int_d_o_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(3),
      Q => int_d_o(3),
      R => \^sr\(0)
    );
\int_d_o_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(4),
      Q => int_d_o(4),
      R => \^sr\(0)
    );
\int_d_o_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(5),
      Q => int_d_o(5),
      R => \^sr\(0)
    );
\int_d_o_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(6),
      Q => int_d_o(6),
      R => \^sr\(0)
    );
\int_d_o_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(7),
      Q => int_d_o(7),
      R => \^sr\(0)
    );
\int_d_o_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(8),
      Q => int_d_o(8),
      R => \^sr\(0)
    );
\int_d_o_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \ap_CS_fsm_reg[2]\(0),
      D => D(9),
      Q => int_d_o(9),
      R => \^sr\(0)
    );
\rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020FFFF00200000"
    )
        port map (
      I0 => \rdata[0]_i_2_n_0\,
      I1 => s_axi_pointer_basic_io_ARADDR(0),
      I2 => s_axi_pointer_basic_io_ARADDR(4),
      I3 => s_axi_pointer_basic_io_ARADDR(1),
      I4 => ar_hs,
      I5 => \^s_axi_pointer_basic_io_rdata\(0),
      O => \rdata[0]_i_1_n_0\
    );
\rdata[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => int_d_o_ap_vld,
      I1 => int_d_o(0),
      I2 => s_axi_pointer_basic_io_ARADDR(3),
      I3 => \^q\(0),
      I4 => s_axi_pointer_basic_io_ARADDR(2),
      O => \rdata[0]_i_2_n_0\
    );
\rdata[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(10),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(10),
      O => \rdata[10]_i_1_n_0\
    );
\rdata[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(11),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(11),
      O => \rdata[11]_i_1_n_0\
    );
\rdata[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(12),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(12),
      O => \rdata[12]_i_1_n_0\
    );
\rdata[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(13),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(13),
      O => \rdata[13]_i_1_n_0\
    );
\rdata[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(14),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(14),
      O => \rdata[14]_i_1_n_0\
    );
\rdata[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(15),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(15),
      O => \rdata[15]_i_1_n_0\
    );
\rdata[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(16),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(16),
      O => \rdata[16]_i_1_n_0\
    );
\rdata[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(17),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(17),
      O => \rdata[17]_i_1_n_0\
    );
\rdata[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(18),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(18),
      O => \rdata[18]_i_1_n_0\
    );
\rdata[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(19),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(19),
      O => \rdata[19]_i_1_n_0\
    );
\rdata[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(1),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(1),
      O => \rdata[1]_i_1_n_0\
    );
\rdata[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(20),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(20),
      O => \rdata[20]_i_1_n_0\
    );
\rdata[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(21),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(21),
      O => \rdata[21]_i_1_n_0\
    );
\rdata[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(22),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(22),
      O => \rdata[22]_i_1_n_0\
    );
\rdata[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(23),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(23),
      O => \rdata[23]_i_1_n_0\
    );
\rdata[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(24),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(24),
      O => \rdata[24]_i_1_n_0\
    );
\rdata[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(25),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(25),
      O => \rdata[25]_i_1_n_0\
    );
\rdata[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(26),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(26),
      O => \rdata[26]_i_1_n_0\
    );
\rdata[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(27),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(27),
      O => \rdata[27]_i_1_n_0\
    );
\rdata[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(28),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(28),
      O => \rdata[28]_i_1_n_0\
    );
\rdata[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(29),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(29),
      O => \rdata[29]_i_1_n_0\
    );
\rdata[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(2),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(2),
      O => \rdata[2]_i_1_n_0\
    );
\rdata[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(30),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(30),
      O => \rdata[30]_i_1_n_0\
    );
\rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => s_axi_pointer_basic_io_ARADDR(1),
      I1 => s_axi_pointer_basic_io_ARADDR(4),
      I2 => s_axi_pointer_basic_io_ARADDR(0),
      I3 => s_axi_pointer_basic_io_ARADDR(2),
      I4 => s_axi_pointer_basic_io_ARVALID,
      I5 => \^s_axi_pointer_basic_io_rvalid\(0),
      O => \rdata[31]_i_1_n_0\
    );
\rdata[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s_axi_pointer_basic_io_rvalid\(0),
      I1 => s_axi_pointer_basic_io_ARVALID,
      O => ar_hs
    );
\rdata[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(31),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(31),
      O => \rdata[31]_i_3_n_0\
    );
\rdata[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(3),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(3),
      O => \rdata[3]_i_1_n_0\
    );
\rdata[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(4),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(4),
      O => \rdata[4]_i_1_n_0\
    );
\rdata[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(5),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(5),
      O => \rdata[5]_i_1_n_0\
    );
\rdata[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(6),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(6),
      O => \rdata[6]_i_1_n_0\
    );
\rdata[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(7),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(7),
      O => \rdata[7]_i_1_n_0\
    );
\rdata[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(8),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(8),
      O => \rdata[8]_i_1_n_0\
    );
\rdata[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => int_d_o(9),
      I1 => s_axi_pointer_basic_io_ARADDR(3),
      I2 => \^q\(9),
      O => \rdata[9]_i_1_n_0\
    );
\rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \rdata[0]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(0),
      R => '0'
    );
\rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[10]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(10),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[11]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(11),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[12]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(12),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[13]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(13),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[14]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(14),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[15]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(15),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[16]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(16),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[17]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(17),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[18]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(18),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[19]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(19),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[1]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(1),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[20]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(20),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[21]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(21),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[22]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(22),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[23]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(23),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[24]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(24),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[25]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(25),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[26]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(26),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[27]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(27),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[28]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(28),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[29]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(29),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[2]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(2),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[30]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(30),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[31]_i_3_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(31),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[3]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(3),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[4]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(4),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[5]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(5),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[6]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(6),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[7]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(7),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[8]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(8),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => \rdata[9]_i_1_n_0\,
      Q => \^s_axi_pointer_basic_io_rdata\(9),
      R => \rdata[31]_i_1_n_0\
    );
\waddr[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_pointer_basic_io_AWVALID,
      I1 => \^out\(0),
      O => waddr
    );
\waddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_pointer_basic_io_AWADDR(0),
      Q => \waddr_reg_n_0_[0]\,
      R => '0'
    );
\waddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_pointer_basic_io_AWADDR(1),
      Q => \waddr_reg_n_0_[1]\,
      R => '0'
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_pointer_basic_io_AWADDR(2),
      Q => \waddr_reg_n_0_[2]\,
      R => '0'
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_pointer_basic_io_AWADDR(3),
      Q => \waddr_reg_n_0_[3]\,
      R => '0'
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_pointer_basic_io_AWADDR(4),
      Q => \waddr_reg_n_0_[4]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    s_axi_pointer_basic_io_AWVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_AWREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_pointer_basic_io_WVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_WREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_pointer_basic_io_ARVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_ARREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_pointer_basic_io_RVALID : out STD_LOGIC;
    s_axi_pointer_basic_io_RREADY : in STD_LOGIC;
    s_axi_pointer_basic_io_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_pointer_basic_io_BVALID : out STD_LOGIC;
    s_axi_pointer_basic_io_BREADY : in STD_LOGIC;
    s_axi_pointer_basic_io_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is 32;
  attribute C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH : integer;
  attribute C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is 5;
  attribute C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH : integer;
  attribute C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is 32;
  attribute C_S_AXI_POINTER_BASIC_IO_WSTRB_WIDTH : integer;
  attribute C_S_AXI_POINTER_BASIC_IO_WSTRB_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is 4;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is 4;
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is "3'b001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is "3'b010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is "3'b100";
  attribute hls_module : string;
  attribute hls_module of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic is
  signal \<const0>\ : STD_LOGIC;
  signal \acc[0]_i_2_n_0\ : STD_LOGIC;
  signal \acc[0]_i_3_n_0\ : STD_LOGIC;
  signal \acc[0]_i_4_n_0\ : STD_LOGIC;
  signal \acc[0]_i_5_n_0\ : STD_LOGIC;
  signal \acc[12]_i_2_n_0\ : STD_LOGIC;
  signal \acc[12]_i_3_n_0\ : STD_LOGIC;
  signal \acc[12]_i_4_n_0\ : STD_LOGIC;
  signal \acc[12]_i_5_n_0\ : STD_LOGIC;
  signal \acc[16]_i_2_n_0\ : STD_LOGIC;
  signal \acc[16]_i_3_n_0\ : STD_LOGIC;
  signal \acc[16]_i_4_n_0\ : STD_LOGIC;
  signal \acc[16]_i_5_n_0\ : STD_LOGIC;
  signal \acc[20]_i_2_n_0\ : STD_LOGIC;
  signal \acc[20]_i_3_n_0\ : STD_LOGIC;
  signal \acc[20]_i_4_n_0\ : STD_LOGIC;
  signal \acc[20]_i_5_n_0\ : STD_LOGIC;
  signal \acc[24]_i_2_n_0\ : STD_LOGIC;
  signal \acc[24]_i_3_n_0\ : STD_LOGIC;
  signal \acc[24]_i_4_n_0\ : STD_LOGIC;
  signal \acc[24]_i_5_n_0\ : STD_LOGIC;
  signal \acc[28]_i_2_n_0\ : STD_LOGIC;
  signal \acc[28]_i_3_n_0\ : STD_LOGIC;
  signal \acc[28]_i_4_n_0\ : STD_LOGIC;
  signal \acc[28]_i_5_n_0\ : STD_LOGIC;
  signal \acc[4]_i_2_n_0\ : STD_LOGIC;
  signal \acc[4]_i_3_n_0\ : STD_LOGIC;
  signal \acc[4]_i_4_n_0\ : STD_LOGIC;
  signal \acc[4]_i_5_n_0\ : STD_LOGIC;
  signal \acc[8]_i_2_n_0\ : STD_LOGIC;
  signal \acc[8]_i_3_n_0\ : STD_LOGIC;
  signal \acc[8]_i_4_n_0\ : STD_LOGIC;
  signal \acc[8]_i_5_n_0\ : STD_LOGIC;
  signal acc_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \acc_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \acc_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ap_NS_fsm1 : STD_LOGIC;
  signal \^ap_done\ : STD_LOGIC;
  signal ap_rst_n_inv : STD_LOGIC;
  signal d_i : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal d_read_reg_52 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_acc_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1\ : label is "soft_lutpair31";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair31";
begin
  ap_done <= \^ap_done\;
  ap_ready <= \^ap_done\;
  s_axi_pointer_basic_io_BRESP(1) <= \<const0>\;
  s_axi_pointer_basic_io_BRESP(0) <= \<const0>\;
  s_axi_pointer_basic_io_RRESP(1) <= \<const0>\;
  s_axi_pointer_basic_io_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\acc[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(3),
      I1 => acc_reg(3),
      O => \acc[0]_i_2_n_0\
    );
\acc[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(2),
      I1 => acc_reg(2),
      O => \acc[0]_i_3_n_0\
    );
\acc[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(1),
      I1 => acc_reg(1),
      O => \acc[0]_i_4_n_0\
    );
\acc[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(0),
      I1 => acc_reg(0),
      O => \acc[0]_i_5_n_0\
    );
\acc[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(15),
      I1 => acc_reg(15),
      O => \acc[12]_i_2_n_0\
    );
\acc[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(14),
      I1 => acc_reg(14),
      O => \acc[12]_i_3_n_0\
    );
\acc[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(13),
      I1 => acc_reg(13),
      O => \acc[12]_i_4_n_0\
    );
\acc[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(12),
      I1 => acc_reg(12),
      O => \acc[12]_i_5_n_0\
    );
\acc[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(19),
      I1 => acc_reg(19),
      O => \acc[16]_i_2_n_0\
    );
\acc[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(18),
      I1 => acc_reg(18),
      O => \acc[16]_i_3_n_0\
    );
\acc[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(17),
      I1 => acc_reg(17),
      O => \acc[16]_i_4_n_0\
    );
\acc[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(16),
      I1 => acc_reg(16),
      O => \acc[16]_i_5_n_0\
    );
\acc[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(23),
      I1 => acc_reg(23),
      O => \acc[20]_i_2_n_0\
    );
\acc[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(22),
      I1 => acc_reg(22),
      O => \acc[20]_i_3_n_0\
    );
\acc[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(21),
      I1 => acc_reg(21),
      O => \acc[20]_i_4_n_0\
    );
\acc[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(20),
      I1 => acc_reg(20),
      O => \acc[20]_i_5_n_0\
    );
\acc[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(27),
      I1 => acc_reg(27),
      O => \acc[24]_i_2_n_0\
    );
\acc[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(26),
      I1 => acc_reg(26),
      O => \acc[24]_i_3_n_0\
    );
\acc[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(25),
      I1 => acc_reg(25),
      O => \acc[24]_i_4_n_0\
    );
\acc[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(24),
      I1 => acc_reg(24),
      O => \acc[24]_i_5_n_0\
    );
\acc[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc_reg(31),
      I1 => d_read_reg_52(31),
      O => \acc[28]_i_2_n_0\
    );
\acc[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(30),
      I1 => acc_reg(30),
      O => \acc[28]_i_3_n_0\
    );
\acc[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(29),
      I1 => acc_reg(29),
      O => \acc[28]_i_4_n_0\
    );
\acc[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(28),
      I1 => acc_reg(28),
      O => \acc[28]_i_5_n_0\
    );
\acc[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(7),
      I1 => acc_reg(7),
      O => \acc[4]_i_2_n_0\
    );
\acc[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(6),
      I1 => acc_reg(6),
      O => \acc[4]_i_3_n_0\
    );
\acc[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(5),
      I1 => acc_reg(5),
      O => \acc[4]_i_4_n_0\
    );
\acc[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(4),
      I1 => acc_reg(4),
      O => \acc[4]_i_5_n_0\
    );
\acc[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(11),
      I1 => acc_reg(11),
      O => \acc[8]_i_2_n_0\
    );
\acc[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(10),
      I1 => acc_reg(10),
      O => \acc[8]_i_3_n_0\
    );
\acc[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(9),
      I1 => acc_reg(9),
      O => \acc[8]_i_4_n_0\
    );
\acc[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => d_read_reg_52(8),
      I1 => acc_reg(8),
      O => \acc[8]_i_5_n_0\
    );
\acc_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[0]_i_1_n_7\,
      Q => acc_reg(0),
      R => '0'
    );
\acc_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc_reg[0]_i_1_n_0\,
      CO(2) => \acc_reg[0]_i_1_n_1\,
      CO(1) => \acc_reg[0]_i_1_n_2\,
      CO(0) => \acc_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => d_read_reg_52(3 downto 0),
      O(3) => \acc_reg[0]_i_1_n_4\,
      O(2) => \acc_reg[0]_i_1_n_5\,
      O(1) => \acc_reg[0]_i_1_n_6\,
      O(0) => \acc_reg[0]_i_1_n_7\,
      S(3) => \acc[0]_i_2_n_0\,
      S(2) => \acc[0]_i_3_n_0\,
      S(1) => \acc[0]_i_4_n_0\,
      S(0) => \acc[0]_i_5_n_0\
    );
\acc_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[8]_i_1_n_5\,
      Q => acc_reg(10),
      R => '0'
    );
\acc_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[8]_i_1_n_4\,
      Q => acc_reg(11),
      R => '0'
    );
\acc_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[12]_i_1_n_7\,
      Q => acc_reg(12),
      R => '0'
    );
\acc_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg[8]_i_1_n_0\,
      CO(3) => \acc_reg[12]_i_1_n_0\,
      CO(2) => \acc_reg[12]_i_1_n_1\,
      CO(1) => \acc_reg[12]_i_1_n_2\,
      CO(0) => \acc_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => d_read_reg_52(15 downto 12),
      O(3) => \acc_reg[12]_i_1_n_4\,
      O(2) => \acc_reg[12]_i_1_n_5\,
      O(1) => \acc_reg[12]_i_1_n_6\,
      O(0) => \acc_reg[12]_i_1_n_7\,
      S(3) => \acc[12]_i_2_n_0\,
      S(2) => \acc[12]_i_3_n_0\,
      S(1) => \acc[12]_i_4_n_0\,
      S(0) => \acc[12]_i_5_n_0\
    );
\acc_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[12]_i_1_n_6\,
      Q => acc_reg(13),
      R => '0'
    );
\acc_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[12]_i_1_n_5\,
      Q => acc_reg(14),
      R => '0'
    );
\acc_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[12]_i_1_n_4\,
      Q => acc_reg(15),
      R => '0'
    );
\acc_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[16]_i_1_n_7\,
      Q => acc_reg(16),
      R => '0'
    );
\acc_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg[12]_i_1_n_0\,
      CO(3) => \acc_reg[16]_i_1_n_0\,
      CO(2) => \acc_reg[16]_i_1_n_1\,
      CO(1) => \acc_reg[16]_i_1_n_2\,
      CO(0) => \acc_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => d_read_reg_52(19 downto 16),
      O(3) => \acc_reg[16]_i_1_n_4\,
      O(2) => \acc_reg[16]_i_1_n_5\,
      O(1) => \acc_reg[16]_i_1_n_6\,
      O(0) => \acc_reg[16]_i_1_n_7\,
      S(3) => \acc[16]_i_2_n_0\,
      S(2) => \acc[16]_i_3_n_0\,
      S(1) => \acc[16]_i_4_n_0\,
      S(0) => \acc[16]_i_5_n_0\
    );
\acc_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[16]_i_1_n_6\,
      Q => acc_reg(17),
      R => '0'
    );
\acc_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[16]_i_1_n_5\,
      Q => acc_reg(18),
      R => '0'
    );
\acc_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[16]_i_1_n_4\,
      Q => acc_reg(19),
      R => '0'
    );
\acc_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[0]_i_1_n_6\,
      Q => acc_reg(1),
      R => '0'
    );
\acc_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[20]_i_1_n_7\,
      Q => acc_reg(20),
      R => '0'
    );
\acc_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg[16]_i_1_n_0\,
      CO(3) => \acc_reg[20]_i_1_n_0\,
      CO(2) => \acc_reg[20]_i_1_n_1\,
      CO(1) => \acc_reg[20]_i_1_n_2\,
      CO(0) => \acc_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => d_read_reg_52(23 downto 20),
      O(3) => \acc_reg[20]_i_1_n_4\,
      O(2) => \acc_reg[20]_i_1_n_5\,
      O(1) => \acc_reg[20]_i_1_n_6\,
      O(0) => \acc_reg[20]_i_1_n_7\,
      S(3) => \acc[20]_i_2_n_0\,
      S(2) => \acc[20]_i_3_n_0\,
      S(1) => \acc[20]_i_4_n_0\,
      S(0) => \acc[20]_i_5_n_0\
    );
\acc_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[20]_i_1_n_6\,
      Q => acc_reg(21),
      R => '0'
    );
\acc_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[20]_i_1_n_5\,
      Q => acc_reg(22),
      R => '0'
    );
\acc_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[20]_i_1_n_4\,
      Q => acc_reg(23),
      R => '0'
    );
\acc_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[24]_i_1_n_7\,
      Q => acc_reg(24),
      R => '0'
    );
\acc_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg[20]_i_1_n_0\,
      CO(3) => \acc_reg[24]_i_1_n_0\,
      CO(2) => \acc_reg[24]_i_1_n_1\,
      CO(1) => \acc_reg[24]_i_1_n_2\,
      CO(0) => \acc_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => d_read_reg_52(27 downto 24),
      O(3) => \acc_reg[24]_i_1_n_4\,
      O(2) => \acc_reg[24]_i_1_n_5\,
      O(1) => \acc_reg[24]_i_1_n_6\,
      O(0) => \acc_reg[24]_i_1_n_7\,
      S(3) => \acc[24]_i_2_n_0\,
      S(2) => \acc[24]_i_3_n_0\,
      S(1) => \acc[24]_i_4_n_0\,
      S(0) => \acc[24]_i_5_n_0\
    );
\acc_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[24]_i_1_n_6\,
      Q => acc_reg(25),
      R => '0'
    );
\acc_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[24]_i_1_n_5\,
      Q => acc_reg(26),
      R => '0'
    );
\acc_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[24]_i_1_n_4\,
      Q => acc_reg(27),
      R => '0'
    );
\acc_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[28]_i_1_n_7\,
      Q => acc_reg(28),
      R => '0'
    );
\acc_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg[24]_i_1_n_0\,
      CO(3) => \NLW_acc_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \acc_reg[28]_i_1_n_1\,
      CO(1) => \acc_reg[28]_i_1_n_2\,
      CO(0) => \acc_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => d_read_reg_52(30 downto 28),
      O(3) => \acc_reg[28]_i_1_n_4\,
      O(2) => \acc_reg[28]_i_1_n_5\,
      O(1) => \acc_reg[28]_i_1_n_6\,
      O(0) => \acc_reg[28]_i_1_n_7\,
      S(3) => \acc[28]_i_2_n_0\,
      S(2) => \acc[28]_i_3_n_0\,
      S(1) => \acc[28]_i_4_n_0\,
      S(0) => \acc[28]_i_5_n_0\
    );
\acc_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[28]_i_1_n_6\,
      Q => acc_reg(29),
      R => '0'
    );
\acc_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[0]_i_1_n_5\,
      Q => acc_reg(2),
      R => '0'
    );
\acc_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[28]_i_1_n_5\,
      Q => acc_reg(30),
      R => '0'
    );
\acc_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[28]_i_1_n_4\,
      Q => acc_reg(31),
      R => '0'
    );
\acc_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[0]_i_1_n_4\,
      Q => acc_reg(3),
      R => '0'
    );
\acc_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[4]_i_1_n_7\,
      Q => acc_reg(4),
      R => '0'
    );
\acc_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg[0]_i_1_n_0\,
      CO(3) => \acc_reg[4]_i_1_n_0\,
      CO(2) => \acc_reg[4]_i_1_n_1\,
      CO(1) => \acc_reg[4]_i_1_n_2\,
      CO(0) => \acc_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => d_read_reg_52(7 downto 4),
      O(3) => \acc_reg[4]_i_1_n_4\,
      O(2) => \acc_reg[4]_i_1_n_5\,
      O(1) => \acc_reg[4]_i_1_n_6\,
      O(0) => \acc_reg[4]_i_1_n_7\,
      S(3) => \acc[4]_i_2_n_0\,
      S(2) => \acc[4]_i_3_n_0\,
      S(1) => \acc[4]_i_4_n_0\,
      S(0) => \acc[4]_i_5_n_0\
    );
\acc_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[4]_i_1_n_6\,
      Q => acc_reg(5),
      R => '0'
    );
\acc_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[4]_i_1_n_5\,
      Q => acc_reg(6),
      R => '0'
    );
\acc_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[4]_i_1_n_4\,
      Q => acc_reg(7),
      R => '0'
    );
\acc_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[8]_i_1_n_7\,
      Q => acc_reg(8),
      R => '0'
    );
\acc_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc_reg[4]_i_1_n_0\,
      CO(3) => \acc_reg[8]_i_1_n_0\,
      CO(2) => \acc_reg[8]_i_1_n_1\,
      CO(1) => \acc_reg[8]_i_1_n_2\,
      CO(0) => \acc_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => d_read_reg_52(11 downto 8),
      O(3) => \acc_reg[8]_i_1_n_4\,
      O(2) => \acc_reg[8]_i_1_n_5\,
      O(1) => \acc_reg[8]_i_1_n_6\,
      O(0) => \acc_reg[8]_i_1_n_7\,
      S(3) => \acc[8]_i_2_n_0\,
      S(2) => \acc[8]_i_3_n_0\,
      S(1) => \acc[8]_i_4_n_0\,
      S(0) => \acc[8]_i_5_n_0\
    );
\acc_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_CS_fsm_state2,
      D => \acc_reg[8]_i_1_n_6\,
      Q => acc_reg(9),
      R => '0'
    );
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4555"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => \^ap_done\,
      I2 => ap_start,
      I3 => \ap_CS_fsm_reg_n_0_[0]\,
      O => ap_NS_fsm(0)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \^ap_done\,
      I1 => ap_start,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      I3 => ap_CS_fsm_state2,
      O => ap_NS_fsm(1)
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
      D => ap_CS_fsm_state2,
      Q => \^ap_done\,
      R => ap_rst_n_inv
    );
ap_idle_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_0_[0]\,
      I1 => ap_start,
      O => ap_idle
    );
\d_read_reg_52[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ap_start,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      O => ap_NS_fsm1
    );
\d_read_reg_52_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(0),
      Q => d_read_reg_52(0),
      R => '0'
    );
\d_read_reg_52_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(10),
      Q => d_read_reg_52(10),
      R => '0'
    );
\d_read_reg_52_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(11),
      Q => d_read_reg_52(11),
      R => '0'
    );
\d_read_reg_52_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(12),
      Q => d_read_reg_52(12),
      R => '0'
    );
\d_read_reg_52_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(13),
      Q => d_read_reg_52(13),
      R => '0'
    );
\d_read_reg_52_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(14),
      Q => d_read_reg_52(14),
      R => '0'
    );
\d_read_reg_52_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(15),
      Q => d_read_reg_52(15),
      R => '0'
    );
\d_read_reg_52_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(16),
      Q => d_read_reg_52(16),
      R => '0'
    );
\d_read_reg_52_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(17),
      Q => d_read_reg_52(17),
      R => '0'
    );
\d_read_reg_52_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(18),
      Q => d_read_reg_52(18),
      R => '0'
    );
\d_read_reg_52_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(19),
      Q => d_read_reg_52(19),
      R => '0'
    );
\d_read_reg_52_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(1),
      Q => d_read_reg_52(1),
      R => '0'
    );
\d_read_reg_52_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(20),
      Q => d_read_reg_52(20),
      R => '0'
    );
\d_read_reg_52_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(21),
      Q => d_read_reg_52(21),
      R => '0'
    );
\d_read_reg_52_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(22),
      Q => d_read_reg_52(22),
      R => '0'
    );
\d_read_reg_52_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(23),
      Q => d_read_reg_52(23),
      R => '0'
    );
\d_read_reg_52_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(24),
      Q => d_read_reg_52(24),
      R => '0'
    );
\d_read_reg_52_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(25),
      Q => d_read_reg_52(25),
      R => '0'
    );
\d_read_reg_52_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(26),
      Q => d_read_reg_52(26),
      R => '0'
    );
\d_read_reg_52_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(27),
      Q => d_read_reg_52(27),
      R => '0'
    );
\d_read_reg_52_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(28),
      Q => d_read_reg_52(28),
      R => '0'
    );
\d_read_reg_52_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(29),
      Q => d_read_reg_52(29),
      R => '0'
    );
\d_read_reg_52_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(2),
      Q => d_read_reg_52(2),
      R => '0'
    );
\d_read_reg_52_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(30),
      Q => d_read_reg_52(30),
      R => '0'
    );
\d_read_reg_52_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(31),
      Q => d_read_reg_52(31),
      R => '0'
    );
\d_read_reg_52_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(3),
      Q => d_read_reg_52(3),
      R => '0'
    );
\d_read_reg_52_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(4),
      Q => d_read_reg_52(4),
      R => '0'
    );
\d_read_reg_52_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(5),
      Q => d_read_reg_52(5),
      R => '0'
    );
\d_read_reg_52_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(6),
      Q => d_read_reg_52(6),
      R => '0'
    );
\d_read_reg_52_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(7),
      Q => d_read_reg_52(7),
      R => '0'
    );
\d_read_reg_52_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(8),
      Q => d_read_reg_52(8),
      R => '0'
    );
\d_read_reg_52_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ap_NS_fsm1,
      D => d_i(9),
      Q => d_read_reg_52(9),
      R => '0'
    );
pointer_basic_pointer_basic_io_s_axi_U: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic_pointer_basic_io_s_axi
     port map (
      D(31 downto 0) => acc_reg(31 downto 0),
      Q(31 downto 0) => d_i(31 downto 0),
      SR(0) => ap_rst_n_inv,
      \ap_CS_fsm_reg[2]\(0) => \^ap_done\,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      \out\(2) => s_axi_pointer_basic_io_BVALID,
      \out\(1) => s_axi_pointer_basic_io_WREADY,
      \out\(0) => s_axi_pointer_basic_io_AWREADY,
      s_axi_pointer_basic_io_ARADDR(4 downto 0) => s_axi_pointer_basic_io_ARADDR(4 downto 0),
      s_axi_pointer_basic_io_ARVALID => s_axi_pointer_basic_io_ARVALID,
      s_axi_pointer_basic_io_AWADDR(4 downto 0) => s_axi_pointer_basic_io_AWADDR(4 downto 0),
      s_axi_pointer_basic_io_AWVALID => s_axi_pointer_basic_io_AWVALID,
      s_axi_pointer_basic_io_BREADY => s_axi_pointer_basic_io_BREADY,
      s_axi_pointer_basic_io_RDATA(31 downto 0) => s_axi_pointer_basic_io_RDATA(31 downto 0),
      s_axi_pointer_basic_io_RREADY => s_axi_pointer_basic_io_RREADY,
      s_axi_pointer_basic_io_RVALID(1) => s_axi_pointer_basic_io_RVALID,
      s_axi_pointer_basic_io_RVALID(0) => s_axi_pointer_basic_io_ARREADY,
      s_axi_pointer_basic_io_WDATA(31 downto 0) => s_axi_pointer_basic_io_WDATA(31 downto 0),
      s_axi_pointer_basic_io_WSTRB(3 downto 0) => s_axi_pointer_basic_io_WSTRB(3 downto 0),
      s_axi_pointer_basic_io_WVALID => s_axi_pointer_basic_io_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s_axi_pointer_basic_io_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_pointer_basic_io_AWVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_AWREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_pointer_basic_io_WVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_WREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_pointer_basic_io_BVALID : out STD_LOGIC;
    s_axi_pointer_basic_io_BREADY : in STD_LOGIC;
    s_axi_pointer_basic_io_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_pointer_basic_io_ARVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_ARREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_pointer_basic_io_RVALID : out STD_LOGIC;
    s_axi_pointer_basic_io_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_pointer_basic_0_0,pointer_basic,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "pointer_basic,Vivado 2018.2";
  attribute hls_module : string;
  attribute hls_module of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH : integer;
  attribute C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH of inst : label is 5;
  attribute C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH : integer;
  attribute C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_POINTER_BASIC_IO_WSTRB_WIDTH : integer;
  attribute C_S_AXI_POINTER_BASIC_IO_WSTRB_WIDTH of inst : label is 4;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of inst : label is 4;
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "3'b001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of inst : label is "3'b010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of inst : label is "3'b100";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_pointer_basic_io, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute X_INTERFACE_INFO of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute X_INTERFACE_INFO of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute X_INTERFACE_PARAMETER of ap_ready : signal is "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute X_INTERFACE_INFO of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io ARREADY";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io ARVALID";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io AWREADY";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io AWVALID";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io BREADY";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io BVALID";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_pointer_basic_io_RREADY : signal is "XIL_INTERFACENAME s_axi_pointer_basic_io, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 50000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RVALID";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WREADY";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WVALID";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io ARADDR";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io AWADDR";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io BRESP";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RDATA";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io RRESP";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WDATA";
  attribute X_INTERFACE_INFO of s_axi_pointer_basic_io_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_pointer_basic_io WSTRB";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pointer_basic
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      s_axi_pointer_basic_io_ARADDR(4 downto 0) => s_axi_pointer_basic_io_ARADDR(4 downto 0),
      s_axi_pointer_basic_io_ARREADY => s_axi_pointer_basic_io_ARREADY,
      s_axi_pointer_basic_io_ARVALID => s_axi_pointer_basic_io_ARVALID,
      s_axi_pointer_basic_io_AWADDR(4 downto 0) => s_axi_pointer_basic_io_AWADDR(4 downto 0),
      s_axi_pointer_basic_io_AWREADY => s_axi_pointer_basic_io_AWREADY,
      s_axi_pointer_basic_io_AWVALID => s_axi_pointer_basic_io_AWVALID,
      s_axi_pointer_basic_io_BREADY => s_axi_pointer_basic_io_BREADY,
      s_axi_pointer_basic_io_BRESP(1 downto 0) => s_axi_pointer_basic_io_BRESP(1 downto 0),
      s_axi_pointer_basic_io_BVALID => s_axi_pointer_basic_io_BVALID,
      s_axi_pointer_basic_io_RDATA(31 downto 0) => s_axi_pointer_basic_io_RDATA(31 downto 0),
      s_axi_pointer_basic_io_RREADY => s_axi_pointer_basic_io_RREADY,
      s_axi_pointer_basic_io_RRESP(1 downto 0) => s_axi_pointer_basic_io_RRESP(1 downto 0),
      s_axi_pointer_basic_io_RVALID => s_axi_pointer_basic_io_RVALID,
      s_axi_pointer_basic_io_WDATA(31 downto 0) => s_axi_pointer_basic_io_WDATA(31 downto 0),
      s_axi_pointer_basic_io_WREADY => s_axi_pointer_basic_io_WREADY,
      s_axi_pointer_basic_io_WSTRB(3 downto 0) => s_axi_pointer_basic_io_WSTRB(3 downto 0),
      s_axi_pointer_basic_io_WVALID => s_axi_pointer_basic_io_WVALID
    );
end STRUCTURE;
