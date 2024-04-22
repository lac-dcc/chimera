-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Jun  4 22:17:15 2018
-- Host        : hp-laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top design_1_axi_emc_0_0 -prefix
--               design_1_axi_emc_0_0_ design_1_axi_emc_0_0_sim_netlist.vhdl
-- Design      : design_1_axi_emc_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_axi_emc_addr_gen is
  port (
    \ADDRESS_STORE_GEN[29].ADDRESS_REG\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ADDRESS_STORE_GEN[28].ADDRESS_REG\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[27].ADDRESS_REG\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[26].ADDRESS_REG\ : out STD_LOGIC;
    addr_2_cmb : out STD_LOGIC;
    enable_cs_cmb : out STD_LOGIC;
    rnw_cmb : out STD_LOGIC;
    addr_3_cmb : out STD_LOGIC;
    addr_4_cmb : out STD_LOGIC;
    addr_5_cmb : out STD_LOGIC;
    bus2ip_addr_temp : out STD_LOGIC_VECTOR ( 25 downto 0 );
    last_addr0 : out STD_LOGIC;
    \burst_addr_cnt_reg[7]\ : out STD_LOGIC;
    last_data_cmb0 : out STD_LOGIC;
    \burst_data_cnt_reg[4]\ : out STD_LOGIC;
    p_1_in : out STD_LOGIC;
    \rd_data_count_reg[4]\ : out STD_LOGIC;
    bus2ip_wr_req_reg_reg : out STD_LOGIC;
    rnw_cmb0 : out STD_LOGIC;
    \derived_burst_reg_reg[1]\ : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \derived_burst_reg_reg[1]_0\ : in STD_LOGIC;
    \derived_burst_reg_reg[1]_1\ : in STD_LOGIC;
    \derived_burst_reg_reg[1]_2\ : in STD_LOGIC;
    s_axi_mem_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \burst_addr_cnt_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \burst_data_cnt_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    last_data_acked : in STD_LOGIC;
    s_axi_mem_rready : in STD_LOGIC;
    \rd_data_count_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_awvalid : in STD_LOGIC;
    s_axi_mem_wvalid : in STD_LOGIC;
    s_axi_mem_arvalid : in STD_LOGIC;
    rw_flag_reg_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    store_addr_info_cmb : in STD_LOGIC;
    bus2ip_rnw : in STD_LOGIC;
    rst_rdce_cmb : in STD_LOGIC;
    ip2bus_addrack : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[0]\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end design_1_axi_emc_0_0_axi_emc_addr_gen;

architecture STRUCTURE of design_1_axi_emc_0_0_axi_emc_addr_gen is
  signal \^address_store_gen[26].address_reg\ : STD_LOGIC;
  signal \^address_store_gen[27].address_reg\ : STD_LOGIC;
  signal \^address_store_gen[28].address_reg\ : STD_LOGIC;
  signal \^address_store_gen[29].address_reg\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[10]_i_2_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_4_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[3]_i_3_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[5]_i_3_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[6]_i_2_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[8]_i_2_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_2_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_2_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_3_n_0\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[1]\ : STD_LOGIC;
  signal R6_in : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addr_11_6_cmb : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal addr_sm_ns_IDLE_cmb_i_14_n_0 : STD_LOGIC;
  signal \^burst_addr_cnt_reg[7]\ : STD_LOGIC;
  signal \^burst_data_cnt_reg[4]\ : STD_LOGIC;
  signal \bus2ip_addr_i[12]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[13]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[14]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[15]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[16]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[17]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[18]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[19]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[20]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[21]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[22]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[23]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[24]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[25]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[26]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[27]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[28]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[29]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[30]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[31]_i_2_n_0\ : STD_LOGIC;
  signal \^bus2ip_addr_temp\ : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \^enable_cs_cmb\ : STD_LOGIC;
  signal \^p_1_in\ : STD_LOGIC;
  signal \^rd_data_count_reg[4]\ : STD_LOGIC;
  signal \^rnw_cmb\ : STD_LOGIC;
  signal \^rnw_cmb0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[10]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_4\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[2]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[3]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[5]_i_3\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[6]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[7]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[8]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[12]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[13]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[14]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[15]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[16]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[17]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[18]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[19]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[20]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[21]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[22]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[23]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[24]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[25]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[26]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[27]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[28]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[29]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[30]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[31]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of rnw_reg_i_2 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of s_axi_mem_awready_INST_0_i_2 : label is "soft_lutpair11";
begin
  \ADDRESS_STORE_GEN[26].ADDRESS_REG\ <= \^address_store_gen[26].address_reg\;
  \ADDRESS_STORE_GEN[27].ADDRESS_REG\ <= \^address_store_gen[27].address_reg\;
  \ADDRESS_STORE_GEN[28].ADDRESS_REG\ <= \^address_store_gen[28].address_reg\;
  \ADDRESS_STORE_GEN[29].ADDRESS_REG\ <= \^address_store_gen[29].address_reg\;
  SR(0) <= \^sr\(0);
  \burst_addr_cnt_reg[7]\ <= \^burst_addr_cnt_reg[7]\;
  \burst_data_cnt_reg[4]\ <= \^burst_data_cnt_reg[4]\;
  bus2ip_addr_temp(25 downto 0) <= \^bus2ip_addr_temp\(25 downto 0);
  enable_cs_cmb <= \^enable_cs_cmb\;
  p_1_in <= \^p_1_in\;
  \rd_data_count_reg[4]\ <= \^rd_data_count_reg[4]\;
  rnw_cmb <= \^rnw_cmb\;
  rnw_cmb0 <= \^rnw_cmb0\;
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(4),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[10]_i_2_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(10),
      I5 => s_axi_mem_awaddr(10),
      O => addr_11_6_cmb(4)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_2_n_0\,
      I1 => \^bus2ip_addr_temp\(3),
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[10]_i_2_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(5),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_4_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(11),
      I5 => s_axi_mem_awaddr(11),
      O => addr_11_6_cmb(5)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(3),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_2_n_0\,
      I2 => \^bus2ip_addr_temp\(4),
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_4_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F6F606F6F6060606"
    )
        port map (
      I0 => \^address_store_gen[29].address_reg\,
      I1 => R6_in,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(2),
      I5 => s_axi_mem_awaddr(2),
      O => addr_2_cmb
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA8"
    )
        port map (
      I0 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[1]\,
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\,
      I2 => Q(0),
      I3 => Q(1),
      O => R6_in
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^address_store_gen[28].address_reg\,
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[3]_i_3_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(3),
      I5 => s_axi_mem_awaddr(3),
      O => addr_3_cmb
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55577777"
    )
        port map (
      I0 => \^address_store_gen[29].address_reg\,
      I1 => Q(1),
      I2 => Q(0),
      I3 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\,
      I4 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[1]\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[3]_i_3_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^address_store_gen[27].address_reg\,
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(4),
      I5 => s_axi_mem_awaddr(4),
      O => addr_4_cmb
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^address_store_gen[26].address_reg\,
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[5]_i_3_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(5),
      I5 => s_axi_mem_awaddr(5),
      O => addr_5_cmb
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[5]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\,
      I1 => \^address_store_gen[27].address_reg\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[5]_i_3_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F6F606F6F6060606"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(0),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[6]_i_2_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(6),
      I5 => s_axi_mem_awaddr(6),
      O => addr_11_6_cmb(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^address_store_gen[26].address_reg\,
      I1 => \^address_store_gen[27].address_reg\,
      I2 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[6]_i_2_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(1),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[7]_i_2_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(7),
      I5 => s_axi_mem_awaddr(7),
      O => addr_11_6_cmb(1)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFF"
    )
        port map (
      I0 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\,
      I1 => \^address_store_gen[27].address_reg\,
      I2 => \^address_store_gen[26].address_reg\,
      I3 => \^bus2ip_addr_temp\(0),
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[7]_i_2_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(2),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[8]_i_2_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(8),
      I5 => s_axi_mem_awaddr(8),
      O => addr_11_6_cmb(2)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7FFFFF"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(0),
      I1 => \^address_store_gen[26].address_reg\,
      I2 => \^address_store_gen[27].address_reg\,
      I3 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\,
      I4 => \^bus2ip_addr_temp\(1),
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[8]_i_2_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(3),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_2_n_0\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(9),
      I5 => s_axi_mem_awaddr(9),
      O => addr_11_6_cmb(3)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^bus2ip_addr_temp\(1),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\,
      I2 => \^address_store_gen[27].address_reg\,
      I3 => \^address_store_gen[26].address_reg\,
      I4 => \^bus2ip_addr_temp\(0),
      I5 => \^bus2ip_addr_temp\(2),
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_2_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0057FFFFFFFFFFFF"
    )
        port map (
      I0 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[1]\,
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\,
      I2 => Q(0),
      I3 => Q(1),
      I4 => \^address_store_gen[29].address_reg\,
      I5 => \^address_store_gen[28].address_reg\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[9]_i_3_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => addr_11_6_cmb(4),
      Q => \^bus2ip_addr_temp\(4),
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => addr_11_6_cmb(5),
      Q => \^bus2ip_addr_temp\(5),
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \derived_burst_reg_reg[1]\,
      Q => \^address_store_gen[29].address_reg\,
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \derived_burst_reg_reg[1]_0\,
      Q => \^address_store_gen[28].address_reg\,
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \derived_burst_reg_reg[1]_1\,
      Q => \^address_store_gen[27].address_reg\,
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \derived_burst_reg_reg[1]_2\,
      Q => \^address_store_gen[26].address_reg\,
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => addr_11_6_cmb(0),
      Q => \^bus2ip_addr_temp\(0),
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => addr_11_6_cmb(1),
      Q => \^bus2ip_addr_temp\(1),
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => addr_11_6_cmb(2),
      Q => \^bus2ip_addr_temp\(2),
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => E(0),
      D => addr_11_6_cmb(3),
      Q => \^bus2ip_addr_temp\(3),
      R => \^sr\(0)
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAEFAA20"
    )
        port map (
      I0 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_2_n_0\,
      I1 => rst_rdce_cmb,
      I2 => ip2bus_addrack,
      I3 => \^enable_cs_cmb\,
      I4 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_1_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F909F9F9090909"
    )
        port map (
      I0 => Q(0),
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\,
      I2 => \^enable_cs_cmb\,
      I3 => \^rnw_cmb\,
      I4 => s_axi_mem_araddr(0),
      I5 => s_axi_mem_awaddr(0),
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_2_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF41FFFFFF140000"
    )
        port map (
      I0 => \^enable_cs_cmb\,
      I1 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_2_n_0\,
      I2 => Q(1),
      I3 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_3_n_0\,
      I4 => \FSM_sequential_emc_addr_ps_reg[0]\,
      I5 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[1]\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_1_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\,
      I1 => Q(0),
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_2_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CA00"
    )
        port map (
      I0 => s_axi_mem_awaddr(1),
      I1 => s_axi_mem_araddr(1),
      I2 => \^rnw_cmb\,
      I3 => \^enable_cs_cmb\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_3_n_0\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_1_n_0\,
      Q => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[0]\,
      R => '0'
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_1_n_0\,
      Q => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg_n_0_[1]\,
      R => '0'
    );
\FSM_sequential_emc_addr_ps[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^sr\(0)
    );
addr_sm_ns_IDLE_cmb_i_14: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \rd_data_count_reg[7]\(5),
      I1 => \rd_data_count_reg[7]\(4),
      I2 => \rd_data_count_reg[7]\(6),
      O => addr_sm_ns_IDLE_cmb_i_14_n_0
    );
addr_sm_ns_IDLE_cmb_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => last_data_acked,
      I1 => s_axi_mem_rready,
      I2 => \rd_data_count_reg[7]\(7),
      I3 => \^rd_data_count_reg[4]\,
      I4 => addr_sm_ns_IDLE_cmb_i_14_n_0,
      O => \^p_1_in\
    );
\burst_addr_cnt[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \burst_addr_cnt_reg[7]_0\(5),
      I1 => \burst_addr_cnt_reg[7]_0\(4),
      I2 => \burst_addr_cnt_reg[7]_0\(6),
      O => \^burst_addr_cnt_reg[7]\
    );
\burst_data_cnt[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \burst_data_cnt_reg[7]\(2),
      I1 => \burst_data_cnt_reg[7]\(0),
      I2 => \burst_data_cnt_reg[7]\(1),
      I3 => \burst_data_cnt_reg[7]\(3),
      O => \^burst_data_cnt_reg[4]\
    );
\burst_data_cnt[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^burst_data_cnt_reg[4]\,
      I1 => \burst_data_cnt_reg[7]\(5),
      I2 => \burst_data_cnt_reg[7]\(7),
      I3 => \burst_data_cnt_reg[7]\(4),
      I4 => \burst_data_cnt_reg[7]\(6),
      O => last_data_cmb0
    );
\bus2ip_addr_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(12),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(12),
      O => \bus2ip_addr_i[12]_i_1_n_0\
    );
\bus2ip_addr_i[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(13),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(13),
      O => \bus2ip_addr_i[13]_i_1_n_0\
    );
\bus2ip_addr_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(14),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(14),
      O => \bus2ip_addr_i[14]_i_1_n_0\
    );
\bus2ip_addr_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(15),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(15),
      O => \bus2ip_addr_i[15]_i_1_n_0\
    );
\bus2ip_addr_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(16),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(16),
      O => \bus2ip_addr_i[16]_i_1_n_0\
    );
\bus2ip_addr_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(17),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(17),
      O => \bus2ip_addr_i[17]_i_1_n_0\
    );
\bus2ip_addr_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(18),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(18),
      O => \bus2ip_addr_i[18]_i_1_n_0\
    );
\bus2ip_addr_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(19),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(19),
      O => \bus2ip_addr_i[19]_i_1_n_0\
    );
\bus2ip_addr_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(20),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(20),
      O => \bus2ip_addr_i[20]_i_1_n_0\
    );
\bus2ip_addr_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(21),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(21),
      O => \bus2ip_addr_i[21]_i_1_n_0\
    );
\bus2ip_addr_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(22),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(22),
      O => \bus2ip_addr_i[22]_i_1_n_0\
    );
\bus2ip_addr_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(23),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(23),
      O => \bus2ip_addr_i[23]_i_1_n_0\
    );
\bus2ip_addr_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(24),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(24),
      O => \bus2ip_addr_i[24]_i_1_n_0\
    );
\bus2ip_addr_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(25),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(25),
      O => \bus2ip_addr_i[25]_i_1_n_0\
    );
\bus2ip_addr_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(26),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(26),
      O => \bus2ip_addr_i[26]_i_1_n_0\
    );
\bus2ip_addr_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(27),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(27),
      O => \bus2ip_addr_i[27]_i_1_n_0\
    );
\bus2ip_addr_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(28),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(28),
      O => \bus2ip_addr_i[28]_i_1_n_0\
    );
\bus2ip_addr_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(29),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(29),
      O => \bus2ip_addr_i[29]_i_1_n_0\
    );
\bus2ip_addr_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(30),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(30),
      O => \bus2ip_addr_i[30]_i_1_n_0\
    );
\bus2ip_addr_i[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \out\(2),
      I1 => \out\(0),
      I2 => \out\(1),
      I3 => store_addr_info_cmb,
      O => \^enable_cs_cmb\
    );
\bus2ip_addr_i[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_araddr(31),
      I1 => \^rnw_cmb\,
      I2 => s_axi_mem_awaddr(31),
      O => \bus2ip_addr_i[31]_i_2_n_0\
    );
\bus2ip_addr_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[12]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(6),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[13]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(7),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[14]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(8),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[15]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(9),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[16]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(10),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[17]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(11),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[18]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(12),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[19]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(13),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[20]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(14),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[21]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(15),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[22]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(16),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[23]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(17),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[24]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(18),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[25]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(19),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[26]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(20),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[27]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(21),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[28]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(22),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[29]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(23),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[30]_i_1_n_0\,
      Q => \^bus2ip_addr_temp\(24),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \^enable_cs_cmb\,
      D => \bus2ip_addr_i[31]_i_2_n_0\,
      Q => \^bus2ip_addr_temp\(25),
      R => \^sr\(0)
    );
rnw_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE00FB11FE00EA00"
    )
        port map (
      I0 => \out\(2),
      I1 => \out\(1),
      I2 => \^p_1_in\,
      I3 => bus2ip_rnw,
      I4 => \out\(0),
      I5 => \^rnw_cmb0\,
      O => \^rnw_cmb\
    );
rnw_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4C"
    )
        port map (
      I0 => s_axi_mem_awvalid,
      I1 => s_axi_mem_arvalid,
      I2 => rw_flag_reg_reg,
      O => \^rnw_cmb0\
    );
s_axi_mem_awready_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8808"
    )
        port map (
      I0 => s_axi_mem_awvalid,
      I1 => s_axi_mem_wvalid,
      I2 => s_axi_mem_arvalid,
      I3 => rw_flag_reg_reg,
      O => bus2ip_wr_req_reg_reg
    );
s_axi_mem_bvalid_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^burst_addr_cnt_reg[7]\,
      I1 => \burst_addr_cnt_reg[7]_0\(3),
      I2 => \burst_addr_cnt_reg[7]_0\(2),
      I3 => \burst_addr_cnt_reg[7]_0\(7),
      I4 => \burst_addr_cnt_reg[7]_0\(1),
      I5 => \burst_addr_cnt_reg[7]_0\(0),
      O => last_addr0
    );
s_axi_mem_rlast_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \rd_data_count_reg[7]\(2),
      I1 => \rd_data_count_reg[7]\(0),
      I2 => \rd_data_count_reg[7]\(1),
      I3 => \rd_data_count_reg[7]\(3),
      O => \^rd_data_count_reg[4]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_axi_emc_address_decode is
  port (
    Bus2IP_Mem_CS_d1_reg : out STD_LOGIC;
    \bus2ip_BE_reg_reg[0]\ : out STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[2]\ : out STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[6]\ : out STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[3]\ : out STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[4]\ : out STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[5]\ : out STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    Bus2IP_RdReq_d1_reg : out STD_LOGIC;
    S : out STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[3]_rep__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_crnt_state_reg[3]\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[2]\ : out STD_LOGIC;
    Bus2IP_RdReq_d1_reg_0 : out STD_LOGIC;
    addr_sm_ps_idle_cmb : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bus2ip_BE_reg_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    transaction_done_cmb17_out : out STD_LOGIC;
    next_state181_out : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ : out STD_LOGIC;
    Write_req_data_ack_cmb13_out : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\ : out STD_LOGIC;
    readreq_th_reset : out STD_LOGIC;
    IP2Bus_RdAck0 : out STD_LOGIC;
    \mem_oen_reg_reg[0]\ : out STD_LOGIC;
    read_break_reg_d1_reg : out STD_LOGIC;
    Cycle_cnt_en_int : out STD_LOGIC;
    S_0 : out STD_LOGIC;
    \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ : out STD_LOGIC;
    last_len_cmb : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bus2ip_burst_reg_reg : out STD_LOGIC;
    bus2ip_burst_reg_reg_0 : out STD_LOGIC;
    rd_fifo_wr_en : out STD_LOGIC;
    \in\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_fifo : out STD_LOGIC;
    \s_axi_mem_bresp_reg_reg[1]\ : out STD_LOGIC;
    bus2ip_rd_req_reg_reg : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    pend_rdreq_reg : out STD_LOGIC;
    pend_wrreq_reg : out STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    emc_addr_ns : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    last_addr0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    addr_2_cmb : in STD_LOGIC;
    \LEN_GEN_32.derived_len_reg_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[2]_0\ : in STD_LOGIC;
    addr_3_cmb : in STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[3]_0\ : in STD_LOGIC;
    addr_4_cmb : in STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[4]_0\ : in STD_LOGIC;
    addr_5_cmb : in STD_LOGIC;
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[5]_0\ : in STD_LOGIC;
    rnw_cmb : in STD_LOGIC;
    enable_cs_cmb : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \axi_trans_size_reg_reg[1]\ : in STD_LOGIC;
    cycle_cnt_en : in STD_LOGIC;
    cycle_cnt : in STD_LOGIC_VECTOR ( 0 to 1 );
    type_of_xfer_reg_reg : in STD_LOGIC;
    axi_trans_size_reg_int : in STD_LOGIC_VECTOR ( 0 to 0 );
    ip2bus_rdack : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    pend_wrreq : in STD_LOGIC;
    bus2ip_wr_req_reg_reg : in STD_LOGIC;
    cycle_End : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    bus2Mem_WrReq : in STD_LOGIC;
    next_state174_out : in STD_LOGIC;
    twph_end : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    enable_rdce_cmb : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[0]\ : in STD_LOGIC;
    rst_rdce_cmb : in STD_LOGIC;
    \bus2ip_BE_reg1__1\ : in STD_LOGIC;
    eqOp4_in : in STD_LOGIC;
    eqOp1_in : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    FIFO_Full_reg : in STD_LOGIC;
    pend_rdreq : in STD_LOGIC;
    bus2ip_reset : in STD_LOGIC;
    \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ : in STD_LOGIC;
    Bus2IP_RdReq_d1 : in STD_LOGIC;
    read_break_reg_d1 : in STD_LOGIC;
    burst_cnt_i : in STD_LOGIC_VECTOR ( 0 to 7 );
    \burstlength_reg_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    read_req_ack_cmb : in STD_LOGIC;
    Write_req_addr_ack_cmb : in STD_LOGIC;
    FIFO_Full_reg_0 : in STD_LOGIC;
    s_axi_mem_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    bus2ip_burst_reg : in STD_LOGIC;
    \burstlength_reg_reg[2]\ : in STD_LOGIC;
    type_of_xfer_reg_reg_0 : in STD_LOGIC;
    s_axi_mem_bresp : in STD_LOGIC_VECTOR ( 0 to 0 );
    Write_req_data_ack_cmb : in STD_LOGIC;
    rnw_cmb0 : in STD_LOGIC;
    Bus2IP_RdReq_emc : in STD_LOGIC;
    transaction_done_i : in STD_LOGIC;
    bus2ip_burst_reg_reg_1 : in STD_LOGIC;
    last_data_cmb0 : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[1]_0\ : in STD_LOGIC;
    s_axi_mem_bvalid_reg_reg : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[1]_1\ : in STD_LOGIC;
    s_axi_mem_bvalid_reg_reg_0 : in STD_LOGIC;
    s_axi_mem_wvalid : in STD_LOGIC
  );
end design_1_axi_emc_0_0_axi_emc_address_decode;

architecture STRUCTURE of design_1_axi_emc_0_0_axi_emc_address_decode is
  signal \AXI_EMC_ADDR_GEN_INSTANCE_I/int_addr_enable_11_2__2\ : STD_LOGIC;
  signal \^bus2ip_addr_gen_data_wdth_32.bus2ip_addr_i_reg[6]\ : STD_LOGIC;
  signal \^bus2ip_mem_cs_d1_reg\ : STD_LOGIC;
  signal \^bus2ip_rdreq_d1_reg\ : STD_LOGIC;
  signal \^bus2ip_rdreq_d1_reg_0\ : STD_LOGIC;
  signal \^d\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \FSM_sequential_crnt_state[2]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[1]_i_3_n_0\ : STD_LOGIC;
  signal \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \MEM_DECODE_GEN[0].cs_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \MEM_DECODE_GEN[0].rdce_out_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \MEM_DECODE_GEN[0].rdce_out_i[0]_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[7].MULT_AND_i1_i_4_n_0\ : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_9_n_0 : STD_LOGIC;
  signal \^addr_sm_ps_idle_cmb\ : STD_LOGIC;
  signal \^bus2ip_be_reg_reg[0]\ : STD_LOGIC;
  signal \^bus2ip_burst_reg_reg\ : STD_LOGIC;
  signal \^bus2ip_burst_reg_reg_0\ : STD_LOGIC;
  signal bus2ip_rd_req_reg_i_2_n_0 : STD_LOGIC;
  signal cs_reg : STD_LOGIC;
  signal pend_wrreq_i_2_n_0 : STD_LOGIC;
  signal rdce_out_i : STD_LOGIC;
  signal rst_cs_cmb : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[0].RDACK_PIPE_ASYNC_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of Bus2IP_RdReq_d1_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_emc_addr_ps[1]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \INFERRED_GEN.data_reg[255][0]_srl32_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \INFERRED_GEN.data_reg[255][0]_srl32_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \MEM_DECODE_GEN[0].rdce_out_i[0]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \PERBIT_GEN[7].MULT_AND_i1_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_38\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \burst_addr_cnt[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \burstlength_reg[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \burstlength_reg[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \burstlength_reg[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \burstlength_reg[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of bus2ip_rd_req_reg_i_2 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \mem_oen_reg[0]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of read_break_reg_d1_i_4 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of s_axi_mem_arready_INST_0_i_1 : label is "soft_lutpair0";
begin
  \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[6]\ <= \^bus2ip_addr_gen_data_wdth_32.bus2ip_addr_i_reg[6]\;
  Bus2IP_Mem_CS_d1_reg <= \^bus2ip_mem_cs_d1_reg\;
  Bus2IP_RdReq_d1_reg <= \^bus2ip_rdreq_d1_reg\;
  Bus2IP_RdReq_d1_reg_0 <= \^bus2ip_rdreq_d1_reg_0\;
  D(3 downto 0) <= \^d\(3 downto 0);
  addr_sm_ps_idle_cmb <= \^addr_sm_ps_idle_cmb\;
  \bus2ip_BE_reg_reg[0]\ <= \^bus2ip_be_reg_reg[0]\;
  bus2ip_burst_reg_reg <= \^bus2ip_burst_reg_reg\;
  bus2ip_burst_reg_reg_0 <= \^bus2ip_burst_reg_reg_0\;
\ADDRESS_STORE_GEN[0].ADDRESS_REG_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00000004040000"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => \^bus2ip_mem_cs_d1_reg\,
      I2 => last_addr0,
      I3 => twph_end,
      I4 => cycle_End,
      I5 => bus2Mem_WrReq,
      O => Write_req_data_ack_cmb13_out
    );
\ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[0].RDACK_PIPE_ASYNC_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => bus2ip_reset,
      I1 => \^bus2ip_rdreq_d1_reg_0\,
      I2 => \^bus2ip_rdreq_d1_reg\,
      O => readreq_th_reset
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => Q(0),
      I1 => enable_cs_cmb,
      I2 => \AXI_EMC_ADDR_GEN_INSTANCE_I/int_addr_enable_11_2__2\,
      O => \^bus2ip_addr_gen_data_wdth_32.bus2ip_addr_i_reg[6]\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => \^bus2ip_be_reg_reg[0]\,
      I1 => last_addr0,
      I2 => rst_rdce_cmb,
      I3 => enable_cs_cmb,
      O => \AXI_EMC_ADDR_GEN_INSTANCE_I/int_addr_enable_11_2__2\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F7FFF0F08000"
    )
        port map (
      I0 => \AXI_EMC_ADDR_GEN_INSTANCE_I/int_addr_enable_11_2__2\,
      I1 => Q(1),
      I2 => addr_2_cmb,
      I3 => \LEN_GEN_32.derived_len_reg_reg[3]\(0),
      I4 => \^bus2ip_addr_gen_data_wdth_32.bus2ip_addr_i_reg[6]\,
      I5 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[2]_0\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[2]\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F7FFF0F08000"
    )
        port map (
      I0 => \AXI_EMC_ADDR_GEN_INSTANCE_I/int_addr_enable_11_2__2\,
      I1 => Q(1),
      I2 => addr_3_cmb,
      I3 => \LEN_GEN_32.derived_len_reg_reg[3]\(1),
      I4 => \^bus2ip_addr_gen_data_wdth_32.bus2ip_addr_i_reg[6]\,
      I5 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[3]_0\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[3]\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F7FFF0F08000"
    )
        port map (
      I0 => \AXI_EMC_ADDR_GEN_INSTANCE_I/int_addr_enable_11_2__2\,
      I1 => Q(1),
      I2 => addr_4_cmb,
      I3 => \LEN_GEN_32.derived_len_reg_reg[3]\(2),
      I4 => \^bus2ip_addr_gen_data_wdth_32.bus2ip_addr_i_reg[6]\,
      I5 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[4]_0\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[4]\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F7FFF0F08000"
    )
        port map (
      I0 => \AXI_EMC_ADDR_GEN_INSTANCE_I/int_addr_enable_11_2__2\,
      I1 => Q(1),
      I2 => addr_5_cmb,
      I3 => \LEN_GEN_32.derived_len_reg_reg[3]\(3),
      I4 => \^bus2ip_addr_gen_data_wdth_32.bus2ip_addr_i_reg[6]\,
      I5 => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[5]_0\,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[5]\
    );
Bus2IP_RdReq_d1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E000E0E0"
    )
        port map (
      I0 => pend_rdreq,
      I1 => \^bus2ip_rdreq_d1_reg_0\,
      I2 => rdce_out_i,
      I3 => \out\(2),
      I4 => FIFO_Full_reg,
      O => \^bus2ip_rdreq_d1_reg\
    );
Cnt_p10_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^bus2ip_mem_cs_d1_reg\,
      I1 => ip2bus_rdack,
      I2 => \INFERRED_GEN.cnt_i_reg[0]\(0),
      O => \INFERRED_GEN.cnt_i_reg[3]_rep__0\(0)
    );
\FSM_sequential_crnt_state[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEEEE0EE"
    )
        port map (
      I0 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      I1 => \FSM_sequential_crnt_state[2]_i_7_n_0\,
      I2 => bus2Mem_WrReq,
      I3 => \^bus2ip_mem_cs_d1_reg\,
      I4 => \^bus2ip_rdreq_d1_reg\,
      I5 => next_state174_out,
      O => \FSM_sequential_crnt_state_reg[2]\
    );
\FSM_sequential_crnt_state[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8FFF"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg_0\,
      I1 => twph_end,
      I2 => bus2ip_wr_req_reg_reg,
      I3 => pend_wrreq,
      O => \FSM_sequential_crnt_state[2]_i_7_n_0\
    );
\FSM_sequential_crnt_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FBBB0000"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => \^bus2ip_mem_cs_d1_reg\,
      I2 => pend_wrreq,
      I3 => bus2ip_wr_req_reg_reg,
      I4 => cycle_End,
      I5 => \FSM_sequential_crnt_state_reg[0]\(0),
      O => \FSM_sequential_crnt_state_reg[3]\
    );
\FSM_sequential_emc_addr_ps[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000EE2E"
    )
        port map (
      I0 => s_axi_mem_wvalid,
      I1 => \out\(0),
      I2 => \^bus2ip_be_reg_reg[0]\,
      I3 => last_addr0,
      I4 => \out\(1),
      O => \FSM_sequential_emc_addr_ps[0]_i_3_n_0\
    );
\FSM_sequential_emc_addr_ps[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => s_axi_mem_bvalid_reg_reg,
      I1 => \FSM_sequential_emc_addr_ps[1]_i_3_n_0\,
      I2 => \out\(2),
      I3 => \FSM_sequential_emc_addr_ps_reg[0]_0\,
      I4 => \out\(1),
      I5 => \FSM_sequential_emc_addr_ps_reg[0]_1\,
      O => \FSM_sequential_emc_addr_ps_reg[1]\(1)
    );
\FSM_sequential_emc_addr_ps[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => \^bus2ip_be_reg_reg[0]\,
      I1 => \out\(0),
      I2 => last_addr0,
      I3 => s_axi_mem_wvalid,
      O => \FSM_sequential_emc_addr_ps[1]_i_3_n_0\
    );
\FSM_sequential_emc_addr_ps_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \FSM_sequential_emc_addr_ps_reg[1]_0\,
      I1 => \FSM_sequential_emc_addr_ps[0]_i_3_n_0\,
      O => \FSM_sequential_emc_addr_ps_reg[1]\(0),
      S => \out\(2)
    );
\INFERRED_GEN.data_reg[255][0]_srl32_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^bus2ip_mem_cs_d1_reg\,
      I1 => ip2bus_rdack,
      O => rd_fifo_wr_en
    );
\INFERRED_GEN.data_reg[255][0]_srl32_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^bus2ip_mem_cs_d1_reg\,
      I1 => ip2bus_rdack,
      I2 => type_of_xfer_reg_reg_0,
      O => \in\(0)
    );
IP2Bus_RdAck_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg_0\,
      I1 => \^bus2ip_rdreq_d1_reg\,
      I2 => \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\,
      O => IP2Bus_RdAck0
    );
\MEM_DECODE_GEN[0].cs_out_i[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AA80"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => enable_cs_cmb,
      I2 => \^addr_sm_ps_idle_cmb\,
      I3 => \^bus2ip_mem_cs_d1_reg\,
      I4 => rst_cs_cmb,
      O => \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\
    );
\MEM_DECODE_GEN[0].cs_out_i[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00BB0088CF00CC00"
    )
        port map (
      I0 => Write_req_data_ack_cmb,
      I1 => \out\(2),
      I2 => last_data_cmb0,
      I3 => \out\(1),
      I4 => ip2bus_rdack,
      I5 => \out\(0),
      O => rst_cs_cmb
    );
\MEM_DECODE_GEN[0].cs_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\,
      Q => \^bus2ip_mem_cs_d1_reg\,
      R => '0'
    );
\MEM_DECODE_GEN[0].cs_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => \out\(2),
      I1 => \out\(0),
      I2 => \out\(1),
      I3 => cs_reg,
      O => \MEM_DECODE_GEN[0].cs_reg[0]_i_1_n_0\
    );
\MEM_DECODE_GEN[0].cs_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \MEM_DECODE_GEN[0].cs_reg[0]_i_1_n_0\,
      Q => cs_reg,
      R => '0'
    );
\MEM_DECODE_GEN[0].rdce_out_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5455545000000000"
    )
        port map (
      I0 => rst_cs_cmb,
      I1 => cs_reg,
      I2 => \MEM_DECODE_GEN[0].rdce_out_i[0]_i_2_n_0\,
      I3 => enable_rdce_cmb,
      I4 => rdce_out_i,
      I5 => \FSM_sequential_emc_addr_ps_reg[0]\,
      O => \MEM_DECODE_GEN[0].rdce_out_i[0]_i_1_n_0\
    );
\MEM_DECODE_GEN[0].rdce_out_i[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => rnw_cmb,
      I1 => enable_cs_cmb,
      I2 => \out\(2),
      I3 => \out\(0),
      I4 => \out\(1),
      O => \MEM_DECODE_GEN[0].rdce_out_i[0]_i_2_n_0\
    );
\MEM_DECODE_GEN[0].rdce_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \MEM_DECODE_GEN[0].rdce_out_i[0]_i_1_n_0\,
      Q => rdce_out_i,
      R => '0'
    );
\PERBIT_GEN[0].XORCY_i1_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => burst_cnt_i(0),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(7),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\
    );
\PERBIT_GEN[0].XORCY_i1_i_1__7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D0"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => \axi_trans_size_reg_reg[1]\,
      I2 => cycle_cnt_en,
      I3 => cycle_cnt(0),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[1].MULT_AND_i1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => \axi_trans_size_reg_reg[1]\,
      I2 => cycle_cnt_en,
      O => Cycle_cnt_en_int
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => burst_cnt_i(1),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(6),
      O => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5D0DDD805000D08"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => \axi_trans_size_reg_reg[1]\,
      I2 => cycle_cnt_en,
      I3 => type_of_xfer_reg_reg,
      I4 => axi_trans_size_reg_int(0),
      I5 => cycle_cnt(1),
      O => S
    );
\PERBIT_GEN[2].MUXCY_i1_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => burst_cnt_i(2),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(5),
      O => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[3].MUXCY_i1_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => burst_cnt_i(3),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(4),
      O => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080808080808080"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => eqOp4_in,
      I2 => \^bus2ip_mem_cs_d1_reg\,
      I3 => eqOp1_in,
      I4 => bus2ip_wr_req_reg_reg,
      I5 => pend_wrreq,
      O => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[4].MUXCY_i1_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => burst_cnt_i(4),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(3),
      O => \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[5].MUXCY_i1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => burst_cnt_i(5),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(2),
      O => \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[6].MUXCY_i1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => burst_cnt_i(6),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(1),
      O => \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[7].FF_RST0_GEN.FDRE_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => bus2ip_reset,
      I1 => \^bus2ip_mem_cs_d1_reg\,
      O => reset_fifo
    );
\PERBIT_GEN[7].MULT_AND_i1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFCCCCAAAA8888"
    )
        port map (
      I0 => read_req_ack_cmb,
      I1 => bus2ip_wr_req_reg_reg,
      I2 => \^bus2ip_rdreq_d1_reg_0\,
      I3 => last_addr0,
      I4 => \PERBIT_GEN[7].MULT_AND_i1_i_4_n_0\,
      I5 => Write_req_addr_ack_cmb,
      O => \^bus2ip_be_reg_reg[0]\
    );
\PERBIT_GEN[7].MULT_AND_i1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \burstlength_reg_reg[2]\,
      I1 => \^bus2ip_mem_cs_d1_reg\,
      I2 => \burstlength_reg_reg[7]\(0),
      I3 => \burstlength_reg_reg[7]\(1),
      O => \^bus2ip_rdreq_d1_reg_0\
    );
\PERBIT_GEN[7].MULT_AND_i1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A888AAA8AAA8AAA"
    )
        port map (
      I0 => rdce_out_i,
      I1 => \out\(2),
      I2 => FIFO_Full_reg_0,
      I3 => \out\(1),
      I4 => ip2bus_rdack,
      I5 => \out\(0),
      O => \PERBIT_GEN[7].MULT_AND_i1_i_4_n_0\
    );
\PERBIT_GEN[7].MUXCY_i1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => burst_cnt_i(7),
      I1 => \^bus2ip_be_reg_reg[0]\,
      I2 => \burstlength_reg_reg[7]\(0),
      O => S_0
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000D000D000D"
    )
        port map (
      I0 => \^bus2ip_mem_cs_d1_reg\,
      I1 => \^bus2ip_rdreq_d1_reg\,
      I2 => cycle_cnt(1),
      I3 => cycle_cnt(0),
      I4 => pend_wrreq,
      I5 => bus2ip_wr_req_reg_reg,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A200A200A2000000"
    )
        port map (
      I0 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I1 => FIFO_Full_reg,
      I2 => \out\(2),
      I3 => rdce_out_i,
      I4 => \^bus2ip_rdreq_d1_reg_0\,
      I5 => pend_rdreq,
      O => next_state181_out
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_38\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \^bus2ip_mem_cs_d1_reg\,
      I1 => \^bus2ip_rdreq_d1_reg\,
      I2 => next_state174_out,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0D0D000FFFFFFFF"
    )
        port map (
      I0 => FIFO_Full_reg,
      I1 => \out\(2),
      I2 => rdce_out_i,
      I3 => \^bus2ip_rdreq_d1_reg_0\,
      I4 => pend_rdreq,
      I5 => \^bus2ip_mem_cs_d1_reg\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\
    );
addr_sm_ns_IDLE_cmb_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^d\(0),
      I1 => \^d\(1),
      I2 => \^d\(3),
      I3 => \^d\(2),
      I4 => \^bus2ip_burst_reg_reg\,
      I5 => \^bus2ip_burst_reg_reg_0\,
      O => last_len_cmb
    );
addr_sm_ns_IDLE_cmb_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => s_axi_mem_awlen(5),
      I1 => s_axi_mem_arlen(5),
      I2 => s_axi_mem_awlen(4),
      I3 => rnw_cmb,
      I4 => s_axi_mem_arlen(4),
      O => \^bus2ip_burst_reg_reg_0\
    );
addr_sm_ns_IDLE_cmb_i_16: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => s_axi_mem_awlen(6),
      I1 => s_axi_mem_arlen(6),
      I2 => s_axi_mem_awlen(7),
      I3 => rnw_cmb,
      I4 => s_axi_mem_arlen(7),
      O => \^bus2ip_burst_reg_reg\
    );
addr_sm_ns_IDLE_cmb_i_3: unisim.vcomponents.MUXF7
     port map (
      I0 => \FSM_sequential_emc_addr_ps_reg[1]_1\,
      I1 => addr_sm_ns_IDLE_cmb_i_9_n_0,
      O => emc_addr_ns(0),
      S => \out\(2)
    );
addr_sm_ns_IDLE_cmb_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88BBB8888888B888"
    )
        port map (
      I0 => s_axi_mem_bvalid_reg_reg_0,
      I1 => \out\(1),
      I2 => \^bus2ip_be_reg_reg[0]\,
      I3 => \out\(0),
      I4 => last_addr0,
      I5 => s_axi_mem_wvalid,
      O => addr_sm_ns_IDLE_cmb_i_9_n_0
    );
\burst_addr_cnt[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \^bus2ip_be_reg_reg[0]\,
      I1 => last_addr0,
      I2 => enable_cs_cmb,
      O => E(0)
    );
\burstlength_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(0),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(0),
      O => \^d\(0)
    );
\burstlength_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(1),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(1),
      O => \^d\(1)
    );
\burstlength_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(2),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(2),
      O => \^d\(2)
    );
\burstlength_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(3),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(3),
      O => \^d\(3)
    );
\bus2ip_BE_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => \^bus2ip_be_reg_reg[0]\,
      I1 => rnw_cmb,
      I2 => enable_cs_cmb,
      I3 => \bus2ip_BE_reg1__1\,
      O => \bus2ip_BE_reg_reg[0]_0\(0)
    );
bus2ip_rd_req_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFB800000030"
    )
        port map (
      I0 => bus2ip_rd_req_reg_i_2_n_0,
      I1 => \out\(1),
      I2 => rnw_cmb0,
      I3 => \out\(0),
      I4 => \out\(2),
      I5 => Bus2IP_RdReq_emc,
      O => bus2ip_rd_req_reg_reg
    );
bus2ip_rd_req_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => last_addr0,
      I1 => \^bus2ip_be_reg_reg[0]\,
      O => bus2ip_rd_req_reg_i_2_n_0
    );
\mem_oen_reg[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF10"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => \^bus2ip_rdreq_d1_reg_0\,
      I2 => Bus2IP_RdReq_d1,
      I3 => read_break_reg_d1,
      O => \mem_oen_reg_reg[0]\
    );
pend_rdreq_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000088A88888"
    )
        port map (
      I0 => \^bus2ip_mem_cs_d1_reg\,
      I1 => pend_rdreq,
      I2 => transaction_done_i,
      I3 => rst_rdce_cmb,
      I4 => rdce_out_i,
      I5 => bus2ip_burst_reg_reg_1,
      O => pend_rdreq_reg
    );
pend_wrreq_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080AA80"
    )
        port map (
      I0 => \^bus2ip_mem_cs_d1_reg\,
      I1 => bus2ip_wr_req_reg_reg,
      I2 => transaction_done_i,
      I3 => pend_wrreq,
      I4 => pend_wrreq_i_2_n_0,
      O => pend_wrreq_reg
    );
pend_wrreq_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44404444"
    )
        port map (
      I0 => bus2ip_burst_reg,
      I1 => Write_req_addr_ack_cmb,
      I2 => bus2ip_wr_req_reg_reg,
      I3 => \^bus2ip_rdreq_d1_reg_0\,
      I4 => last_addr0,
      O => pend_wrreq_i_2_n_0
    );
read_break_reg_d1_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFD000"
    )
        port map (
      I0 => FIFO_Full_reg,
      I1 => \out\(2),
      I2 => rdce_out_i,
      I3 => pend_rdreq,
      I4 => \^bus2ip_rdreq_d1_reg_0\,
      O => read_break_reg_d1_reg
    );
s_axi_mem_arready_INST_0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(0),
      I2 => \out\(2),
      O => \^addr_sm_ps_idle_cmb\
    );
\s_axi_mem_bresp_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AAEA"
    )
        port map (
      I0 => s_axi_mem_bresp(0),
      I1 => \^bus2ip_mem_cs_d1_reg\,
      I2 => Write_req_data_ack_cmb,
      I3 => type_of_xfer_reg_reg_0,
      I4 => \^addr_sm_ps_idle_cmb\,
      O => \s_axi_mem_bresp_reg_reg[1]\
    );
transaction_done_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F7F7F7F7F7F7F7F"
    )
        port map (
      I0 => \^bus2ip_rdreq_d1_reg\,
      I1 => eqOp4_in,
      I2 => \^bus2ip_mem_cs_d1_reg\,
      I3 => eqOp1_in,
      I4 => bus2ip_wr_req_reg_reg,
      I5 => pend_wrreq,
      O => transaction_done_cmb17_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_cntr_incr_decr_addn_f is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_mem_rvalid : out STD_LOGIC;
    fifo_full_p1 : out STD_LOGIC;
    enable_rdce_cmb : out STD_LOGIC;
    A : out STD_LOGIC_VECTOR ( 1 downto 0 );
    addr : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \s_axi_mem_rdata[14]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_mem_rready : in STD_LOGIC;
    enable_cs_cmb : in STD_LOGIC;
    \burst_data_cnt_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \burst_data_cnt_reg[2]\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    enable_cs_cmb126_out : in STD_LOGIC;
    last_len_cmb : in STD_LOGIC;
    bus2ip_reset : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
end design_1_axi_emc_0_0_cntr_incr_decr_addn_f;

architecture STRUCTURE of design_1_axi_emc_0_0_cntr_incr_decr_addn_f is
  signal \Cnt_p10_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \Cnt_p10_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \Cnt_p10_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \Cnt_p10_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \Cnt_p10_carry__0_n_0\ : STD_LOGIC;
  signal \Cnt_p10_carry__0_n_1\ : STD_LOGIC;
  signal \Cnt_p10_carry__0_n_2\ : STD_LOGIC;
  signal \Cnt_p10_carry__0_n_3\ : STD_LOGIC;
  signal \Cnt_p10_carry__1_i_1_n_0\ : STD_LOGIC;
  signal Cnt_p10_carry_i_1_n_0 : STD_LOGIC;
  signal Cnt_p10_carry_i_2_n_0 : STD_LOGIC;
  signal Cnt_p10_carry_i_3_n_0 : STD_LOGIC;
  signal Cnt_p10_carry_i_4_n_0 : STD_LOGIC;
  signal Cnt_p10_carry_n_0 : STD_LOGIC;
  signal Cnt_p10_carry_n_1 : STD_LOGIC;
  signal Cnt_p10_carry_n_2 : STD_LOGIC;
  signal Cnt_p10_carry_n_3 : STD_LOGIC;
  signal FIFO_Full_i_2_n_0 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal addr_i_p1 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal enable_rdce_cmb0 : STD_LOGIC;
  signal fifo_empty : STD_LOGIC;
  signal \NLW_Cnt_p10_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Cnt_p10_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[0]\ : label is "INFERRED_GEN.cnt_i_reg[0]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[0]_rep\ : label is "INFERRED_GEN.cnt_i_reg[0]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[1]\ : label is "INFERRED_GEN.cnt_i_reg[1]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[1]_rep\ : label is "INFERRED_GEN.cnt_i_reg[1]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[2]\ : label is "INFERRED_GEN.cnt_i_reg[2]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[2]_rep\ : label is "INFERRED_GEN.cnt_i_reg[2]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[3]\ : label is "INFERRED_GEN.cnt_i_reg[3]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[3]_rep\ : label is "INFERRED_GEN.cnt_i_reg[3]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[3]_rep__0\ : label is "INFERRED_GEN.cnt_i_reg[3]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[4]\ : label is "INFERRED_GEN.cnt_i_reg[4]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[4]_rep\ : label is "INFERRED_GEN.cnt_i_reg[4]";
  attribute ORIG_CELL_NAME of \INFERRED_GEN.cnt_i_reg[4]_rep__0\ : label is "INFERRED_GEN.cnt_i_reg[4]";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \rd_data_count[7]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of s_axi_mem_rvalid_INST_0 : label is "soft_lutpair24";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
Cnt_p10_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Cnt_p10_carry_n_0,
      CO(2) => Cnt_p10_carry_n_1,
      CO(1) => Cnt_p10_carry_n_2,
      CO(0) => Cnt_p10_carry_n_3,
      CYINIT => Cnt_p10_carry_i_1_n_0,
      DI(3 downto 0) => \^q\(3 downto 0),
      O(3 downto 0) => addr_i_p1(3 downto 0),
      S(3) => Cnt_p10_carry_i_2_n_0,
      S(2) => Cnt_p10_carry_i_3_n_0,
      S(1) => Cnt_p10_carry_i_4_n_0,
      S(0) => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\(0)
    );
\Cnt_p10_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Cnt_p10_carry_n_0,
      CO(3) => \Cnt_p10_carry__0_n_0\,
      CO(2) => \Cnt_p10_carry__0_n_1\,
      CO(1) => \Cnt_p10_carry__0_n_2\,
      CO(0) => \Cnt_p10_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^q\(7 downto 4),
      O(3 downto 0) => addr_i_p1(7 downto 4),
      S(3) => \Cnt_p10_carry__0_i_1_n_0\,
      S(2) => \Cnt_p10_carry__0_i_2_n_0\,
      S(1) => \Cnt_p10_carry__0_i_3_n_0\,
      S(0) => \Cnt_p10_carry__0_i_4_n_0\
    );
\Cnt_p10_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^q\(7),
      I1 => fifo_empty,
      I2 => s_axi_mem_rready,
      O => \Cnt_p10_carry__0_i_1_n_0\
    );
\Cnt_p10_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^q\(6),
      I1 => fifo_empty,
      I2 => s_axi_mem_rready,
      O => \Cnt_p10_carry__0_i_2_n_0\
    );
\Cnt_p10_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^q\(5),
      I1 => fifo_empty,
      I2 => s_axi_mem_rready,
      O => \Cnt_p10_carry__0_i_3_n_0\
    );
\Cnt_p10_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^q\(4),
      I1 => fifo_empty,
      I2 => s_axi_mem_rready,
      O => \Cnt_p10_carry__0_i_4_n_0\
    );
\Cnt_p10_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \Cnt_p10_carry__0_n_0\,
      CO(3 downto 0) => \NLW_Cnt_p10_carry__1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_Cnt_p10_carry__1_O_UNCONNECTED\(3 downto 1),
      O(0) => addr_i_p1(8),
      S(3 downto 1) => B"000",
      S(0) => \Cnt_p10_carry__1_i_1_n_0\
    );
\Cnt_p10_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => s_axi_mem_rready,
      I1 => fifo_empty,
      O => \Cnt_p10_carry__1_i_1_n_0\
    );
Cnt_p10_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_mem_rready,
      I1 => fifo_empty,
      O => Cnt_p10_carry_i_1_n_0
    );
Cnt_p10_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^q\(3),
      I1 => fifo_empty,
      I2 => s_axi_mem_rready,
      O => Cnt_p10_carry_i_2_n_0
    );
Cnt_p10_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^q\(2),
      I1 => fifo_empty,
      I2 => s_axi_mem_rready,
      O => Cnt_p10_carry_i_3_n_0
    );
Cnt_p10_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^q\(1),
      I1 => fifo_empty,
      I2 => s_axi_mem_rready,
      O => Cnt_p10_carry_i_4_n_0
    );
FIFO_Full_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => FIFO_Full_i_2_n_0,
      I1 => addr_i_p1(0),
      I2 => addr_i_p1(1),
      I3 => addr_i_p1(2),
      O => fifo_full_p1
    );
FIFO_Full_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => addr_i_p1(3),
      I1 => addr_i_p1(4),
      I2 => addr_i_p1(5),
      I3 => addr_i_p1(6),
      I4 => addr_i_p1(8),
      I5 => addr_i_p1(7),
      O => FIFO_Full_i_2_n_0
    );
\INFERRED_GEN.cnt_i_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(0),
      Q => \^q\(0),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[0]_rep\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(0),
      Q => \s_axi_mem_rdata[14]\(0),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(1),
      Q => \^q\(1),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[1]_rep\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(1),
      Q => \s_axi_mem_rdata[14]\(1),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(2),
      Q => \^q\(2),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[2]_rep\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(2),
      Q => \s_axi_mem_rdata[14]\(2),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(3),
      Q => \^q\(3),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[3]_rep\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(3),
      Q => A(0),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[3]_rep__0\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(3),
      Q => addr(0),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(4),
      Q => \^q\(4),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[4]_rep\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(4),
      Q => A(1),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[4]_rep__0\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(4),
      Q => addr(1),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(5),
      Q => \^q\(5),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(6),
      Q => \^q\(6),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(7),
      Q => \^q\(7),
      S => bus2ip_reset
    );
\INFERRED_GEN.cnt_i_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(8),
      Q => fifo_empty,
      S => bus2ip_reset
    );
\MEM_DECODE_GEN[0].rdce_out_i[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055040004"
    )
        port map (
      I0 => \out\(0),
      I1 => enable_cs_cmb126_out,
      I2 => last_len_cmb,
      I3 => \out\(1),
      I4 => enable_rdce_cmb0,
      I5 => \out\(2),
      O => enable_rdce_cmb
    );
\MEM_DECODE_GEN[0].rdce_out_i[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => \burst_data_cnt_reg[7]\(2),
      I1 => \burst_data_cnt_reg[7]\(0),
      I2 => \burst_data_cnt_reg[7]\(3),
      I3 => \burst_data_cnt_reg[7]\(1),
      I4 => \burst_data_cnt_reg[2]\,
      I5 => fifo_empty,
      O => enable_rdce_cmb0
    );
\rd_data_count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => fifo_empty,
      I1 => s_axi_mem_rready,
      I2 => enable_cs_cmb,
      O => E(0)
    );
s_axi_mem_rvalid_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_empty,
      O => s_axi_mem_rvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_dynshreg_f is
  port (
    s_axi_mem_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_mem_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bus2ip_rnw : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rd_fifo_wr_en : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 0 to 32 );
    \INFERRED_GEN.cnt_i_reg[2]_rep\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 1 downto 0 );
    addr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end design_1_axi_emc_0_0_dynshreg_f;

architecture STRUCTURE of design_1_axi_emc_0_0_dynshreg_f is
  signal \INFERRED_GEN.data_reg[255][0]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][0]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][10]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][11]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][12]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][13]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][14]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][15]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][16]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][17]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][18]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][19]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][1]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][20]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][21]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][22]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][23]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][24]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][25]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][26]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][27]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][28]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][29]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][2]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][30]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][31]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][32]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][3]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][4]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][5]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][6]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][7]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][8]_srl32_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_mux__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_mux__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_mux__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_mux__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_mux__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_mux_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__0_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__1_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__1_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__2_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__2_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__3_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__3_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__4_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__5_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__5_n_1\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32__6_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[255][9]_srl32_n_1\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][0]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][10]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][11]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][12]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][13]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][14]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][15]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][16]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][17]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][18]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][19]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][1]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][20]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][21]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][22]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][23]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][24]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][25]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][26]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][27]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][28]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][29]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][2]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][30]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][31]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][32]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][3]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][4]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][5]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][6]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][7]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][8]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_INFERRED_GEN.data_reg[255][9]_srl32__6_Q31_UNCONNECTED\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name : string;
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][0]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][0]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][0]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][10]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][10]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][10]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][11]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][11]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][11]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][12]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][12]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][12]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][13]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][13]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][13]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][14]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][14]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][14]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][15]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][15]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][15]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][16]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][16]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][16]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][17]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][17]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][17]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][18]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][18]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][18]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][19]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][19]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][19]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][1]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][1]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][1]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][20]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][20]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][20]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][21]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][21]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][21]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][22]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][22]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][22]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][23]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][23]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][23]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][24]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][24]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][24]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][25]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][25]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][25]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][26]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][26]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][26]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][27]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][27]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][27]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][28]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][28]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][28]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][29]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][29]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][29]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][2]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][2]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][2]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][30]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][30]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][30]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][31]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][31]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][31]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][32]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][32]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][32]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][3]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][3]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][3]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][4]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][4]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][4]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][5]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][5]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][5]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][6]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][6]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][6]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][7]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][7]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][7]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][8]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][8]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][8]_srl32__6 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32__0\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32__0 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32__1\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32__1 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32__2\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32__2 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32__3\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32__3 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32__4\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32__4 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32__5\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32__5 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[255][9]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255] ";
  attribute srl_name of \INFERRED_GEN.data_reg[255][9]_srl32__6\ : label is "\U0/AXI_EMC_NATIVE_INTERFACE_I/RDATA_FIFO_I/DYNSHREG_F_I/INFERRED_GEN.data_reg[255][9]_srl32__6 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[0]_INST_0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[10]_INST_0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[11]_INST_0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[12]_INST_0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[13]_INST_0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[14]_INST_0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[15]_INST_0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[16]_INST_0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[17]_INST_0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[18]_INST_0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[19]_INST_0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[1]_INST_0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[20]_INST_0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[21]_INST_0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[22]_INST_0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[23]_INST_0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[24]_INST_0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[25]_INST_0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[26]_INST_0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[27]_INST_0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[28]_INST_0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[29]_INST_0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[2]_INST_0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[30]_INST_0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[31]_INST_0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[3]_INST_0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[4]_INST_0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[5]_INST_0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[6]_INST_0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[7]_INST_0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[8]_INST_0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \s_axi_mem_rdata[9]_INST_0\ : label is "soft_lutpair29";
begin
\INFERRED_GEN.data_reg[255][0]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][0]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][0]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][0]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][0]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][0]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][0]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][0]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][0]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][0]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][0]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][0]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][0]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][0]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][0]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][0]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][0]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][0]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][0]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][0]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][0]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][0]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][0]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][0]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][0]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(32),
      Q => \INFERRED_GEN.data_reg[255][0]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][0]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][0]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][0]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][0]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][0]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][0]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][0]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][0]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][0]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][0]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][0]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][0]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][0]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][0]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][0]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][0]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][0]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][0]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][0]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][0]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][0]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][0]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][0]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][0]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][0]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][0]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][0]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][0]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][0]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][10]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][10]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][10]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][10]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][10]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][10]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][10]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][10]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][10]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][10]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][10]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][10]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][10]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][10]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][10]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][10]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][10]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][10]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][10]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][10]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][10]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][10]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][10]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][10]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][10]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(22),
      Q => \INFERRED_GEN.data_reg[255][10]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][10]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][10]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][10]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][10]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][10]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][10]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][10]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][10]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][10]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][10]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][10]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][10]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][10]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][10]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][10]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][10]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][10]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][10]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][10]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][10]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][10]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][10]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][10]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][10]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][10]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][10]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][10]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][10]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][10]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][11]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][11]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][11]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][11]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][11]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][11]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][11]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][11]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][11]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][11]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][11]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][11]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][11]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][11]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][11]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][11]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][11]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][11]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][11]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][11]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][11]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][11]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][11]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][11]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][11]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(21),
      Q => \INFERRED_GEN.data_reg[255][11]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][11]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][11]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][11]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][11]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][11]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][11]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][11]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][11]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][11]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][11]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][11]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][11]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][11]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][11]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][11]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][11]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][11]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][11]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][11]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][11]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][11]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][11]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][11]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][11]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][11]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][11]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][11]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][11]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][11]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][12]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][12]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][12]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][12]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][12]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][12]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][12]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][12]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][12]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][12]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][12]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][12]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][12]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][12]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][12]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][12]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][12]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][12]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][12]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][12]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][12]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][12]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][12]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][12]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][12]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(20),
      Q => \INFERRED_GEN.data_reg[255][12]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][12]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][12]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][12]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][12]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][12]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][12]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][12]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][12]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][12]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][12]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][12]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][12]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][12]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][12]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][12]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][12]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][12]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][12]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][12]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][12]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][12]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][12]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][12]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][12]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][12]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][12]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][12]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][12]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][12]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][13]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][13]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][13]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][13]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][13]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][13]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][13]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][13]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][13]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][13]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][13]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][13]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][13]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][13]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][13]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][13]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][13]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][13]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][13]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][13]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][13]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][13]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][13]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][13]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][13]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(19),
      Q => \INFERRED_GEN.data_reg[255][13]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][13]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][13]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][13]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][13]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][13]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][13]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][13]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][13]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][13]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][13]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][13]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][13]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][13]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][13]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][13]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][13]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][13]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][13]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][13]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][13]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][13]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][13]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][13]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][13]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][13]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][13]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][13]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][13]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][13]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][14]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][14]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][14]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][14]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][14]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][14]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][14]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][14]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][14]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][14]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][14]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][14]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][14]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][14]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][14]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][14]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][14]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][14]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][14]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][14]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][14]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][14]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][14]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][14]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][14]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(18),
      Q => \INFERRED_GEN.data_reg[255][14]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][14]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][14]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][14]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][14]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][14]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][14]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][14]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][14]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][14]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][14]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][14]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][14]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][14]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][14]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][14]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][14]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][14]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][14]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][14]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][14]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][14]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][14]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][14]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][14]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][14]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][14]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][14]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][14]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][14]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][15]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][15]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][15]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][15]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][15]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][15]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][15]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][15]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][15]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][15]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][15]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][15]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][15]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][15]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][15]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][15]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][15]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][15]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][15]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][15]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][15]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][15]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][15]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][15]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][15]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(17),
      Q => \INFERRED_GEN.data_reg[255][15]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][15]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][15]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][15]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][15]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][15]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][15]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][15]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][15]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][15]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][15]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][15]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][15]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][15]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][15]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][15]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][15]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][15]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][15]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][15]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][15]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][15]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][15]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][15]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][15]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][15]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][15]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][15]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][15]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][15]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][16]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][16]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][16]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][16]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][16]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][16]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][16]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][16]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][16]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][16]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][16]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][16]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][16]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][16]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][16]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][16]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][16]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][16]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][16]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][16]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][16]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][16]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][16]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][16]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][16]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(16),
      Q => \INFERRED_GEN.data_reg[255][16]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][16]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][16]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][16]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][16]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][16]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][16]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][16]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][16]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][16]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][16]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][16]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][16]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][16]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][16]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][16]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][16]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][16]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][16]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][16]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][16]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][16]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][16]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][16]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][16]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][16]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][16]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][16]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][16]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][16]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][17]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][17]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][17]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][17]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][17]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][17]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][17]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][17]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][17]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][17]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][17]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][17]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][17]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][17]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][17]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][17]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][17]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][17]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][17]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][17]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][17]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][17]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][17]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][17]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][17]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(15),
      Q => \INFERRED_GEN.data_reg[255][17]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][17]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][17]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][17]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][17]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][17]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][17]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][17]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][17]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][17]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][17]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][17]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][17]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][17]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][17]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][17]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][17]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][17]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][17]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][17]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][17]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][17]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][17]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][17]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][17]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][17]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][17]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][17]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][17]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][17]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][18]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][18]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][18]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][18]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][18]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][18]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][18]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][18]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][18]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][18]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][18]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][18]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][18]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][18]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][18]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][18]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][18]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][18]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][18]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][18]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][18]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][18]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][18]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][18]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][18]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(14),
      Q => \INFERRED_GEN.data_reg[255][18]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][18]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][18]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][18]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][18]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][18]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][18]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][18]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][18]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][18]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][18]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][18]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][18]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][18]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][18]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][18]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][18]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][18]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][18]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][18]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][18]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][18]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][18]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][18]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][18]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][18]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][18]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][18]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][18]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][18]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][19]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][19]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][19]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][19]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][19]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][19]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][19]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][19]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][19]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][19]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][19]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][19]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][19]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][19]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][19]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][19]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][19]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][19]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][19]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][19]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][19]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][19]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][19]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][19]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][19]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(13),
      Q => \INFERRED_GEN.data_reg[255][19]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][19]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][19]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][19]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][19]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][19]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][19]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][19]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][19]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][19]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][19]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][19]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][19]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][19]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][19]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][19]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][19]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][19]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][19]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][19]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][19]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][19]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][19]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][19]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][19]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][19]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][19]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][19]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][19]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][19]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][1]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][1]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][1]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][1]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][1]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][1]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][1]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][1]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][1]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][1]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][1]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][1]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][1]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][1]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][1]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][1]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][1]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][1]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][1]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][1]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][1]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][1]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][1]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][1]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][1]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(31),
      Q => \INFERRED_GEN.data_reg[255][1]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][1]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][1]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][1]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][1]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][1]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][1]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][1]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][1]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][1]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][1]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][1]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][1]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][1]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][1]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][1]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][1]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][1]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][1]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][1]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][1]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][1]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][1]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][1]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][1]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][1]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][1]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][1]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][1]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][1]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][20]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][20]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][20]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][20]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][20]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][20]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][20]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][20]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][20]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][20]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][20]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][20]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][20]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][20]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][20]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][20]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][20]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][20]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][20]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][20]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][20]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][20]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][20]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][20]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][20]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(12),
      Q => \INFERRED_GEN.data_reg[255][20]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][20]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][20]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][20]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][20]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][20]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][20]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][20]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][20]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][20]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][20]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][20]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][20]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][20]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][20]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][20]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][20]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][20]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][20]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][20]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][20]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][20]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][20]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][20]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][20]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][20]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][20]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][20]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][20]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][20]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][21]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][21]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][21]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][21]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][21]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][21]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][21]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][21]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][21]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][21]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][21]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][21]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][21]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][21]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][21]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][21]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][21]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][21]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][21]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][21]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][21]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][21]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][21]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][21]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][21]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(11),
      Q => \INFERRED_GEN.data_reg[255][21]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][21]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][21]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][21]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][21]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][21]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][21]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][21]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][21]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][21]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][21]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][21]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][21]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][21]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][21]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][21]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][21]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][21]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][21]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][21]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][21]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][21]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][21]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][21]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][21]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][21]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][21]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][21]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][21]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][21]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][22]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][22]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][22]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][22]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][22]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][22]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][22]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][22]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][22]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][22]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][22]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][22]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][22]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][22]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][22]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][22]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][22]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][22]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][22]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][22]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][22]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][22]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][22]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][22]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][22]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(10),
      Q => \INFERRED_GEN.data_reg[255][22]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][22]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][22]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][22]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][22]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][22]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][22]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][22]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][22]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][22]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][22]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][22]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][22]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][22]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][22]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][22]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][22]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][22]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][22]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][22]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][22]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][22]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][22]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][22]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][22]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][22]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][22]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][22]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][22]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][22]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][23]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][23]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][23]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][23]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][23]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][23]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][23]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][23]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][23]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][23]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][23]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][23]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][23]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][23]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][23]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][23]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][23]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][23]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][23]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][23]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][23]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][23]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][23]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][23]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][23]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(9),
      Q => \INFERRED_GEN.data_reg[255][23]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][23]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][23]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][23]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][23]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][23]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][23]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][23]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][23]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][23]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][23]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][23]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][23]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][23]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][23]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][23]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][23]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][23]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][23]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][23]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][23]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][23]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][23]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][23]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][23]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][23]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][23]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][23]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][23]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][23]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][24]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][24]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][24]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][24]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][24]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][24]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][24]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][24]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][24]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][24]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][24]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][24]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][24]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][24]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][24]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][24]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][24]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][24]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][24]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][24]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][24]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][24]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][24]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][24]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][24]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(8),
      Q => \INFERRED_GEN.data_reg[255][24]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][24]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][24]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][24]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][24]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][24]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][24]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][24]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][24]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][24]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][24]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][24]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][24]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][24]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][24]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][24]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][24]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][24]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][24]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][24]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][24]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][24]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][24]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][24]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][24]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][24]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][24]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][24]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][24]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][24]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][25]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][25]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][25]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][25]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][25]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][25]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][25]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][25]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][25]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][25]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][25]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][25]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][25]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][25]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][25]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][25]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][25]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][25]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][25]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][25]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][25]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][25]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][25]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][25]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][25]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(7),
      Q => \INFERRED_GEN.data_reg[255][25]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][25]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][25]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][25]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][25]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][25]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][25]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][25]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][25]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][25]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][25]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][25]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][25]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][25]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][25]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][25]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][25]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][25]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][25]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][25]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][25]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][25]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][25]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][25]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][25]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][25]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][25]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][25]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][25]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][25]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][26]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][26]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][26]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][26]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][26]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][26]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][26]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][26]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][26]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][26]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][26]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][26]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][26]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][26]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][26]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][26]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][26]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][26]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][26]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][26]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][26]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][26]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][26]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][26]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][26]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(6),
      Q => \INFERRED_GEN.data_reg[255][26]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][26]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][26]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][26]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][26]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][26]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][26]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][26]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][26]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][26]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][26]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][26]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][26]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][26]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][26]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][26]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][26]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][26]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][26]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][26]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][26]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][26]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][26]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][26]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][26]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][26]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][26]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][26]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][26]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][26]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][27]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][27]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][27]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][27]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][27]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][27]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][27]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][27]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][27]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][27]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][27]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][27]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][27]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][27]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][27]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][27]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][27]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][27]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][27]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][27]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][27]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][27]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][27]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][27]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][27]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(5),
      Q => \INFERRED_GEN.data_reg[255][27]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][27]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][27]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][27]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][27]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][27]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][27]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][27]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][27]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][27]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][27]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][27]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][27]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][27]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][27]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][27]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][27]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][27]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][27]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][27]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][27]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][27]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][27]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][27]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][27]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][27]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][27]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][27]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][27]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][27]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][28]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][28]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][28]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][28]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][28]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][28]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][28]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][28]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][28]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][28]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][28]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][28]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][28]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][28]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][28]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][28]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][28]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][28]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][28]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][28]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][28]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][28]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][28]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][28]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][28]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(4),
      Q => \INFERRED_GEN.data_reg[255][28]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][28]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][28]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][28]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][28]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][28]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][28]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][28]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][28]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][28]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][28]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][28]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][28]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][28]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][28]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][28]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][28]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][28]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][28]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][28]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][28]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][28]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][28]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][28]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][28]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][28]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][28]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][28]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][28]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][28]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][29]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][29]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][29]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][29]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][29]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][29]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][29]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][29]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][29]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][29]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][29]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][29]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][29]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][29]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][29]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][29]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][29]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][29]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][29]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][29]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][29]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][29]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][29]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][29]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][29]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(3),
      Q => \INFERRED_GEN.data_reg[255][29]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][29]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][29]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][29]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][29]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][29]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][29]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][29]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][29]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][29]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][29]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][29]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][29]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][29]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][29]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][29]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][29]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][29]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][29]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][29]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][29]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][29]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][29]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][29]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][29]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][29]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][29]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][29]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][29]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][29]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][2]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][2]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][2]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][2]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][2]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][2]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][2]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][2]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][2]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][2]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][2]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][2]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][2]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][2]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][2]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][2]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][2]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][2]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][2]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][2]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][2]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][2]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][2]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][2]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][2]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(30),
      Q => \INFERRED_GEN.data_reg[255][2]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][2]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][2]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][2]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][2]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][2]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][2]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][2]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][2]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][2]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][2]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][2]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][2]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][2]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][2]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][2]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][2]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][2]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][2]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][2]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][2]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][2]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][2]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][2]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][2]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][2]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][2]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][2]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][2]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][2]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][30]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][30]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][30]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][30]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][30]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][30]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][30]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][30]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][30]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][30]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][30]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][30]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][30]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][30]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][30]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][30]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][30]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][30]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][30]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][30]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][30]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][30]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][30]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][30]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][30]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(2),
      Q => \INFERRED_GEN.data_reg[255][30]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][30]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][30]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][30]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][30]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][30]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][30]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][30]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][30]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][30]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][30]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][30]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][30]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][30]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][30]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][30]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][30]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][30]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][30]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][30]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][30]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][30]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][30]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][30]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][30]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][30]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][30]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][30]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][30]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][30]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][31]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][31]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][31]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][31]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][31]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][31]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][31]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][31]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][31]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][31]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][31]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][31]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][31]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][31]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][31]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][31]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][31]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][31]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][31]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][31]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][31]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][31]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][31]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][31]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(1),
      Q => \INFERRED_GEN.data_reg[255][31]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][31]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][31]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][31]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][31]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][31]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][31]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][31]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][31]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][31]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][31]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][31]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][31]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][31]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][31]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][31]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][31]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][31]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][31]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][31]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][31]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][31]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][31]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][31]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][31]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][31]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][31]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => A(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][31]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][31]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][31]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][32]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][32]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][32]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][32]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][32]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][32]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][32]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][32]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][32]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][32]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][32]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][32]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][32]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][32]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][32]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][32]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][32]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][32]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][32]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][32]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][32]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][32]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][32]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][32]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][32]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(0),
      Q => \INFERRED_GEN.data_reg[255][32]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][32]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][32]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][32]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][32]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][32]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][32]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][32]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][32]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][32]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][32]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][32]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][32]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][32]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][32]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][32]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][32]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][32]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][32]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][32]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][32]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][32]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][32]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][32]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][32]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][32]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][32]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => addr(1 downto 0),
      A(2 downto 0) => Q(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][32]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][32]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][32]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][3]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][3]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][3]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][3]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][3]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][3]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][3]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][3]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][3]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][3]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][3]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][3]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][3]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][3]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][3]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][3]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][3]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][3]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][3]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][3]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][3]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][3]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][3]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][3]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][3]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(29),
      Q => \INFERRED_GEN.data_reg[255][3]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][3]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][3]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][3]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][3]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][3]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][3]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][3]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][3]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][3]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][3]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][3]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][3]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][3]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][3]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][3]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][3]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][3]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][3]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][3]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][3]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][3]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][3]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][3]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][3]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][3]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][3]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][3]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][3]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][3]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][4]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][4]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][4]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][4]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][4]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][4]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][4]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][4]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][4]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][4]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][4]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][4]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][4]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][4]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][4]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][4]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][4]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][4]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][4]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][4]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][4]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][4]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][4]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][4]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][4]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(28),
      Q => \INFERRED_GEN.data_reg[255][4]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][4]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][4]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][4]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][4]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][4]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][4]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][4]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][4]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][4]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][4]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][4]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][4]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][4]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][4]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][4]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][4]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][4]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][4]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][4]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][4]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][4]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][4]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][4]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][4]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][4]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][4]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][4]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][4]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][4]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][5]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][5]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][5]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][5]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][5]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][5]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][5]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][5]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][5]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][5]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][5]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][5]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][5]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][5]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][5]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][5]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][5]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][5]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][5]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][5]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][5]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][5]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][5]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][5]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][5]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(27),
      Q => \INFERRED_GEN.data_reg[255][5]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][5]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][5]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][5]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][5]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][5]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][5]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][5]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][5]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][5]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][5]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][5]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][5]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][5]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][5]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][5]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][5]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][5]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][5]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][5]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][5]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][5]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][5]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][5]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][5]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][5]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][5]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][5]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][5]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][5]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][6]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][6]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][6]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][6]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][6]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][6]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][6]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][6]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][6]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][6]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][6]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][6]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][6]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][6]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][6]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][6]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][6]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][6]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][6]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][6]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][6]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][6]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][6]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][6]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][6]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(26),
      Q => \INFERRED_GEN.data_reg[255][6]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][6]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][6]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][6]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][6]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][6]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][6]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][6]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][6]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][6]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][6]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][6]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][6]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][6]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][6]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][6]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][6]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][6]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][6]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][6]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][6]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][6]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][6]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][6]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][6]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][6]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][6]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][6]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][6]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][6]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][7]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][7]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][7]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][7]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][7]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][7]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][7]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][7]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][7]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][7]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][7]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][7]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][7]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][7]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][7]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][7]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][7]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][7]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][7]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][7]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][7]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][7]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][7]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][7]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][7]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(25),
      Q => \INFERRED_GEN.data_reg[255][7]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][7]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][7]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][7]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][7]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][7]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][7]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][7]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][7]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][7]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][7]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][7]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][7]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][7]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][7]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][7]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][7]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][7]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][7]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][7]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][7]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][7]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][7]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][7]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][7]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][7]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][7]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][7]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][7]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][7]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][8]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][8]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][8]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][8]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][8]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][8]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][8]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][8]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][8]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][8]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][8]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][8]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][8]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][8]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][8]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][8]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][8]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][8]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][8]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][8]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][8]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][8]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][8]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][8]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][8]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(24),
      Q => \INFERRED_GEN.data_reg[255][8]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][8]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][8]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][8]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][8]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][8]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][8]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][8]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][8]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][8]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][8]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][8]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][8]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][8]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][8]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][8]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][8]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][8]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][8]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][8]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][8]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][8]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][8]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][8]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][8]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][8]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][8]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][8]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][8]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][8]_srl32__6_Q31_UNCONNECTED\
    );
\INFERRED_GEN.data_reg[255][9]_mux\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][9]_srl32_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][9]_srl32__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][9]_mux_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][9]_mux__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][9]_srl32__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][9]_srl32__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][9]_mux__0_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][9]_mux__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][9]_srl32__3_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][9]_srl32__4_n_0\,
      O => \INFERRED_GEN.data_reg[255][9]_mux__1_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][9]_mux__2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \INFERRED_GEN.data_reg[255][9]_srl32__5_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][9]_srl32__6_n_0\,
      O => \INFERRED_GEN.data_reg[255][9]_mux__2_n_0\,
      S => Q(5)
    );
\INFERRED_GEN.data_reg[255][9]_mux__3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][9]_mux_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][9]_mux__0_n_0\,
      O => \INFERRED_GEN.data_reg[255][9]_mux__3_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][9]_mux__4\: unisim.vcomponents.MUXF8
     port map (
      I0 => \INFERRED_GEN.data_reg[255][9]_mux__1_n_0\,
      I1 => \INFERRED_GEN.data_reg[255][9]_mux__2_n_0\,
      O => \INFERRED_GEN.data_reg[255][9]_mux__4_n_0\,
      S => Q(6)
    );
\INFERRED_GEN.data_reg[255][9]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \in\(23),
      Q => \INFERRED_GEN.data_reg[255][9]_srl32_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][9]_srl32_n_1\
    );
\INFERRED_GEN.data_reg[255][9]_srl32__0\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][9]_srl32_n_1\,
      Q => \INFERRED_GEN.data_reg[255][9]_srl32__0_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][9]_srl32__0_n_1\
    );
\INFERRED_GEN.data_reg[255][9]_srl32__1\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][9]_srl32__0_n_1\,
      Q => \INFERRED_GEN.data_reg[255][9]_srl32__1_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][9]_srl32__1_n_1\
    );
\INFERRED_GEN.data_reg[255][9]_srl32__2\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][9]_srl32__1_n_1\,
      Q => \INFERRED_GEN.data_reg[255][9]_srl32__2_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][9]_srl32__2_n_1\
    );
\INFERRED_GEN.data_reg[255][9]_srl32__3\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][9]_srl32__2_n_1\,
      Q => \INFERRED_GEN.data_reg[255][9]_srl32__3_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][9]_srl32__3_n_1\
    );
\INFERRED_GEN.data_reg[255][9]_srl32__4\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][9]_srl32__3_n_1\,
      Q => \INFERRED_GEN.data_reg[255][9]_srl32__4_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][9]_srl32__4_n_1\
    );
\INFERRED_GEN.data_reg[255][9]_srl32__5\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][9]_srl32__4_n_1\,
      Q => \INFERRED_GEN.data_reg[255][9]_srl32__5_n_0\,
      Q31 => \INFERRED_GEN.data_reg[255][9]_srl32__5_n_1\
    );
\INFERRED_GEN.data_reg[255][9]_srl32__6\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 3) => Q(4 downto 3),
      A(2 downto 0) => \INFERRED_GEN.cnt_i_reg[2]_rep\(2 downto 0),
      CE => rd_fifo_wr_en,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg[255][9]_srl32__5_n_1\,
      Q => \INFERRED_GEN.data_reg[255][9]_srl32__6_n_0\,
      Q31 => \NLW_INFERRED_GEN.data_reg[255][9]_srl32__6_Q31_UNCONNECTED\
    );
\s_axi_mem_rdata[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][1]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][1]_mux__3_n_0\,
      O => s_axi_mem_rdata(0)
    );
\s_axi_mem_rdata[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][11]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][11]_mux__3_n_0\,
      O => s_axi_mem_rdata(10)
    );
\s_axi_mem_rdata[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][12]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][12]_mux__3_n_0\,
      O => s_axi_mem_rdata(11)
    );
\s_axi_mem_rdata[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][13]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][13]_mux__3_n_0\,
      O => s_axi_mem_rdata(12)
    );
\s_axi_mem_rdata[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][14]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][14]_mux__3_n_0\,
      O => s_axi_mem_rdata(13)
    );
\s_axi_mem_rdata[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][15]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][15]_mux__3_n_0\,
      O => s_axi_mem_rdata(14)
    );
\s_axi_mem_rdata[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][16]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][16]_mux__3_n_0\,
      O => s_axi_mem_rdata(15)
    );
\s_axi_mem_rdata[16]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][17]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][17]_mux__3_n_0\,
      O => s_axi_mem_rdata(16)
    );
\s_axi_mem_rdata[17]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][18]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][18]_mux__3_n_0\,
      O => s_axi_mem_rdata(17)
    );
\s_axi_mem_rdata[18]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][19]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][19]_mux__3_n_0\,
      O => s_axi_mem_rdata(18)
    );
\s_axi_mem_rdata[19]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][20]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][20]_mux__3_n_0\,
      O => s_axi_mem_rdata(19)
    );
\s_axi_mem_rdata[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][2]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][2]_mux__3_n_0\,
      O => s_axi_mem_rdata(1)
    );
\s_axi_mem_rdata[20]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][21]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][21]_mux__3_n_0\,
      O => s_axi_mem_rdata(20)
    );
\s_axi_mem_rdata[21]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][22]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][22]_mux__3_n_0\,
      O => s_axi_mem_rdata(21)
    );
\s_axi_mem_rdata[22]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][23]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][23]_mux__3_n_0\,
      O => s_axi_mem_rdata(22)
    );
\s_axi_mem_rdata[23]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][24]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][24]_mux__3_n_0\,
      O => s_axi_mem_rdata(23)
    );
\s_axi_mem_rdata[24]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][25]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][25]_mux__3_n_0\,
      O => s_axi_mem_rdata(24)
    );
\s_axi_mem_rdata[25]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][26]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][26]_mux__3_n_0\,
      O => s_axi_mem_rdata(25)
    );
\s_axi_mem_rdata[26]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][27]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][27]_mux__3_n_0\,
      O => s_axi_mem_rdata(26)
    );
\s_axi_mem_rdata[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][28]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][28]_mux__3_n_0\,
      O => s_axi_mem_rdata(27)
    );
\s_axi_mem_rdata[28]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][29]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][29]_mux__3_n_0\,
      O => s_axi_mem_rdata(28)
    );
\s_axi_mem_rdata[29]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][30]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][30]_mux__3_n_0\,
      O => s_axi_mem_rdata(29)
    );
\s_axi_mem_rdata[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][3]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][3]_mux__3_n_0\,
      O => s_axi_mem_rdata(2)
    );
\s_axi_mem_rdata[30]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][31]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][31]_mux__3_n_0\,
      O => s_axi_mem_rdata(30)
    );
\s_axi_mem_rdata[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][32]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][32]_mux__3_n_0\,
      O => s_axi_mem_rdata(31)
    );
\s_axi_mem_rdata[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][4]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][4]_mux__3_n_0\,
      O => s_axi_mem_rdata(3)
    );
\s_axi_mem_rdata[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][5]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][5]_mux__3_n_0\,
      O => s_axi_mem_rdata(4)
    );
\s_axi_mem_rdata[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][6]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][6]_mux__3_n_0\,
      O => s_axi_mem_rdata(5)
    );
\s_axi_mem_rdata[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][7]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][7]_mux__3_n_0\,
      O => s_axi_mem_rdata(6)
    );
\s_axi_mem_rdata[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][8]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][8]_mux__3_n_0\,
      O => s_axi_mem_rdata(7)
    );
\s_axi_mem_rdata[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][9]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][9]_mux__3_n_0\,
      O => s_axi_mem_rdata(8)
    );
\s_axi_mem_rdata[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[255][10]_mux__4_n_0\,
      I1 => Q(7),
      I2 => \INFERRED_GEN.data_reg[255][10]_mux__3_n_0\,
      O => s_axi_mem_rdata(9)
    );
\s_axi_mem_rresp[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => bus2ip_rnw,
      I1 => \INFERRED_GEN.data_reg[255][0]_mux__3_n_0\,
      I2 => Q(7),
      I3 => \INFERRED_GEN.data_reg[255][0]_mux__4_n_0\,
      O => s_axi_mem_rresp(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_io_registers is
  port (
    mem_wen : out STD_LOGIC;
    mem_cen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_oen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_rpn : out STD_LOGIC;
    mem_ce : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_rnw : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_dq_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_dq_t : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_qwen : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mem_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_crnt_state_reg[3]\ : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    bus2ip_rd_req_reg_reg : in STD_LOGIC;
    mem_WEN_cmb : in STD_LOGIC;
    Mem_CE_int : in STD_LOGIC;
    mem_RNW_cmb : in STD_LOGIC;
    mem_dq_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rdclk : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \FSM_sequential_crnt_state_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \BEN_STORE_GEN[0].BEN_REG\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end design_1_axi_emc_0_0_io_registers;

architecture STRUCTURE of design_1_axi_emc_0_0_io_registers is
  signal mem_wen_reg : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of mem_wen_reg : signal is "true";
  attribute IOB : string;
  attribute IOB of \Mem_DQ_I_v_reg[0]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[10]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[11]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[12]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[13]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[14]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[15]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[1]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[2]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[3]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[4]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[5]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[6]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[7]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[8]\ : label is "TRUE";
  attribute IOB of \Mem_DQ_I_v_reg[9]\ : label is "TRUE";
  attribute IOB of \mem_ben_reg_reg[0]\ : label is "TRUE";
  attribute IOB of \mem_ben_reg_reg[1]\ : label is "TRUE";
  attribute IOB of \mem_ce_reg_reg[0]\ : label is "TRUE";
  attribute IOB of \mem_cen_reg_reg[0]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[0]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[10]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[11]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[12]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[13]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[14]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[15]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[1]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[2]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[3]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[4]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[5]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[6]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[7]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[8]\ : label is "TRUE";
  attribute IOB of \mem_dq_o_reg_reg[9]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[0]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[10]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[11]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[12]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[13]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[14]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[15]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[1]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[2]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[3]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[4]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[5]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[6]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[7]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[8]\ : label is "TRUE";
  attribute IOB of \mem_dq_t_reg_reg[9]\ : label is "TRUE";
  attribute IOB of \mem_oen_reg_reg[0]\ : label is "TRUE";
  attribute IOB of \mem_qwen_reg_reg[0]\ : label is "TRUE";
  attribute IOB of \mem_qwen_reg_reg[1]\ : label is "TRUE";
  attribute IOB of mem_rnw_reg_reg : label is "TRUE";
  attribute IOB of mem_rpn_reg_reg : label is "TRUE";
  attribute IOB of mem_wen_reg_reg : label is "TRUE";
  attribute KEEP : string;
  attribute KEEP of mem_wen_reg_reg : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of mem_wen_reg_reg : label is "no";
begin
  mem_wen <= mem_wen_reg;
\Mem_DQ_I_v_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(7),
      Q => Q(15),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(13),
      Q => Q(5),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(12),
      Q => Q(4),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(11),
      Q => Q(3),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(10),
      Q => Q(2),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(9),
      Q => Q(1),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(8),
      Q => Q(0),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(6),
      Q => Q(14),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(5),
      Q => Q(13),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(4),
      Q => Q(12),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(3),
      Q => Q(11),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(2),
      Q => Q(10),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(1),
      Q => Q(9),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(0),
      Q => Q(8),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(15),
      Q => Q(7),
      R => SR(0)
    );
\Mem_DQ_I_v_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => mem_dq_i(14),
      Q => Q(6),
      R => SR(0)
    );
\mem_ben_reg_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \BEN_STORE_GEN[0].BEN_REG\(1),
      Q => mem_ben(0),
      S => SR(0)
    );
\mem_ben_reg_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \BEN_STORE_GEN[0].BEN_REG\(0),
      Q => mem_ben(1),
      S => SR(0)
    );
\mem_ce_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Mem_CE_int,
      Q => mem_ce(0),
      R => SR(0)
    );
\mem_cen_reg_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[3]\,
      Q => mem_cen(0),
      S => SR(0)
    );
\mem_dq_o_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(15),
      Q => mem_dq_o(7),
      R => SR(0)
    );
\mem_dq_o_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(5),
      Q => mem_dq_o(13),
      R => SR(0)
    );
\mem_dq_o_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(4),
      Q => mem_dq_o(12),
      R => SR(0)
    );
\mem_dq_o_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(3),
      Q => mem_dq_o(11),
      R => SR(0)
    );
\mem_dq_o_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(2),
      Q => mem_dq_o(10),
      R => SR(0)
    );
\mem_dq_o_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(1),
      Q => mem_dq_o(9),
      R => SR(0)
    );
\mem_dq_o_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(0),
      Q => mem_dq_o(8),
      R => SR(0)
    );
\mem_dq_o_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(14),
      Q => mem_dq_o(6),
      R => SR(0)
    );
\mem_dq_o_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(13),
      Q => mem_dq_o(5),
      R => SR(0)
    );
\mem_dq_o_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(12),
      Q => mem_dq_o(4),
      R => SR(0)
    );
\mem_dq_o_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(11),
      Q => mem_dq_o(3),
      R => SR(0)
    );
\mem_dq_o_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(10),
      Q => mem_dq_o(2),
      R => SR(0)
    );
\mem_dq_o_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(9),
      Q => mem_dq_o(1),
      R => SR(0)
    );
\mem_dq_o_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(8),
      Q => mem_dq_o(0),
      R => SR(0)
    );
\mem_dq_o_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(7),
      Q => mem_dq_o(15),
      R => SR(0)
    );
\mem_dq_o_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(6),
      Q => mem_dq_o(14),
      R => SR(0)
    );
\mem_dq_t_reg_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(7),
      S => SR(0)
    );
\mem_dq_t_reg_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(13),
      S => SR(0)
    );
\mem_dq_t_reg_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(12),
      S => SR(0)
    );
\mem_dq_t_reg_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(11),
      S => SR(0)
    );
\mem_dq_t_reg_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(10),
      S => SR(0)
    );
\mem_dq_t_reg_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(9),
      S => SR(0)
    );
\mem_dq_t_reg_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(8),
      S => SR(0)
    );
\mem_dq_t_reg_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(6),
      S => SR(0)
    );
\mem_dq_t_reg_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(5),
      S => SR(0)
    );
\mem_dq_t_reg_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(4),
      S => SR(0)
    );
\mem_dq_t_reg_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(3),
      S => SR(0)
    );
\mem_dq_t_reg_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(2),
      S => SR(0)
    );
\mem_dq_t_reg_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(1),
      S => SR(0)
    );
\mem_dq_t_reg_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(0),
      S => SR(0)
    );
\mem_dq_t_reg_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(15),
      S => SR(0)
    );
\mem_dq_t_reg_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state_reg[4]\(0),
      Q => mem_dq_t(14),
      S => SR(0)
    );
\mem_oen_reg_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_rd_req_reg_reg,
      Q => mem_oen(0),
      S => SR(0)
    );
\mem_qwen_reg_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      Q => mem_qwen(0),
      S => SR(0)
    );
\mem_qwen_reg_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      Q => mem_qwen(1),
      S => SR(0)
    );
mem_rnw_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => mem_RNW_cmb,
      Q => mem_rnw,
      R => SR(0)
    );
mem_rpn_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => '1',
      Q => mem_rpn,
      R => SR(0)
    );
mem_wen_reg_reg: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => mem_WEN_cmb,
      Q => mem_wen_reg,
      S => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_ld_arith_reg is
  port (
    burst_cnt_i : out STD_LOGIC_VECTOR ( 0 to 7 );
    pend_rdreq_reg : out STD_LOGIC;
    ip2bus_addrack : in STD_LOGIC;
    S : in STD_LOGIC;
    \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    reset_fifo : in STD_LOGIC;
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
end design_1_axi_emc_0_0_ld_arith_reg;

architecture STRUCTURE of design_1_axi_emc_0_0_ld_arith_reg is
  signal \^burst_cnt_i\ : STD_LOGIC_VECTOR ( 0 to 7 );
  signal cry : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_1 : STD_LOGIC;
  signal gen_cry_kill_n_2 : STD_LOGIC;
  signal gen_cry_kill_n_3 : STD_LOGIC;
  signal gen_cry_kill_n_4 : STD_LOGIC;
  signal gen_cry_kill_n_5 : STD_LOGIC;
  signal gen_cry_kill_n_6 : STD_LOGIC;
  signal s_axi_mem_wready_INST_0_i_6_n_0 : STD_LOGIC;
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal xorcy_out_5 : STD_LOGIC;
  signal xorcy_out_6 : STD_LOGIC;
  signal xorcy_out_7 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[1].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[2].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[2].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[3].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[3].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[5].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[5].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[5].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[5].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[6].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[6].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[6].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[6].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[7].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[7].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[7].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[7].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[7].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[7].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  burst_cnt_i(0 to 7) <= \^burst_cnt_i\(0 to 7);
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_7,
      Q => \^burst_cnt_i\(0),
      R => reset_fifo
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_6,
      Q => \^burst_cnt_i\(1),
      R => reset_fifo
    );
\PERBIT_GEN[1].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^burst_cnt_i\(1),
      I1 => ip2bus_addrack,
      O => gen_cry_kill_n_6
    );
\PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_5,
      Q => \^burst_cnt_i\(2),
      R => reset_fifo
    );
\PERBIT_GEN[2].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^burst_cnt_i\(2),
      I1 => ip2bus_addrack,
      O => gen_cry_kill_n_5
    );
\PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_4,
      Q => \^burst_cnt_i\(3),
      R => reset_fifo
    );
\PERBIT_GEN[3].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^burst_cnt_i\(3),
      I1 => ip2bus_addrack,
      O => gen_cry_kill_n_4
    );
\PERBIT_GEN[3].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3) => \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_CO_UNCONNECTED\(3),
      CO(2 downto 0) => cry(7 downto 5),
      CYINIT => '0',
      DI(3) => \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => gen_cry_kill_n_6,
      DI(1) => gen_cry_kill_n_5,
      DI(0) => gen_cry_kill_n_4,
      O(3) => xorcy_out_7,
      O(2) => xorcy_out_6,
      O(1) => xorcy_out_5,
      O(0) => xorcy_out_4,
      S(3) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      S(2) => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      S(1) => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      S(0) => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_3,
      Q => \^burst_cnt_i\(4),
      R => reset_fifo
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^burst_cnt_i\(4),
      I1 => ip2bus_addrack,
      O => gen_cry_kill_n_3
    );
\PERBIT_GEN[5].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_2,
      Q => \^burst_cnt_i\(5),
      R => reset_fifo
    );
\PERBIT_GEN[5].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^burst_cnt_i\(5),
      I1 => ip2bus_addrack,
      O => gen_cry_kill_n_2
    );
\PERBIT_GEN[6].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_1,
      Q => \^burst_cnt_i\(6),
      R => reset_fifo
    );
\PERBIT_GEN[6].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^burst_cnt_i\(6),
      I1 => ip2bus_addrack,
      O => gen_cry_kill_n_1
    );
\PERBIT_GEN[7].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_0,
      Q => \^burst_cnt_i\(7),
      R => reset_fifo
    );
\PERBIT_GEN[7].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^burst_cnt_i\(7),
      I1 => ip2bus_addrack,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[7].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => ip2bus_addrack,
      DI(3) => gen_cry_kill_n_3,
      DI(2) => gen_cry_kill_n_2,
      DI(1) => gen_cry_kill_n_1,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\,
      S(2) => \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\,
      S(1) => \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\,
      S(0) => S
    );
s_axi_mem_wready_INST_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^burst_cnt_i\(1),
      I1 => \^burst_cnt_i\(7),
      I2 => \^burst_cnt_i\(6),
      I3 => \^burst_cnt_i\(5),
      I4 => s_axi_mem_wready_INST_0_i_6_n_0,
      O => pend_rdreq_reg
    );
s_axi_mem_wready_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^burst_cnt_i\(0),
      I1 => \^burst_cnt_i\(3),
      I2 => \^burst_cnt_i\(4),
      I3 => \^burst_cnt_i\(2),
      O => s_axi_mem_wready_INST_0_i_6_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized0\ is
  port (
    read_ack_reg_reg : out STD_LOGIC;
    read_ack_reg_reg_0 : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[0]\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    read_data_en_reg_reg : out STD_LOGIC;
    read_req_ack_cmb42_out : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ : out STD_LOGIC;
    read_ack_cmb : out STD_LOGIC;
    addr_cnt_rst_cmb : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    Cycle_cnt_en_int : in STD_LOGIC;
    S_0 : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[2]\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    pend_wrreq_reg : in STD_LOGIC;
    single_transaction : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC;
    tpacc_end : in STD_LOGIC;
    new_page : in STD_LOGIC;
    bus2Mem_RdReq : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]\ : in STD_LOGIC;
    trd_end : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]\ : in STD_LOGIC;
    bus2ip_wr_req_reg_reg : in STD_LOGIC;
    read_data_en_cmb : in STD_LOGIC;
    pend_wrreq_reg_0 : in STD_LOGIC;
    bus2ip_wrreq_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized0\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized0\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized0\ is
  signal \^datawidth_match_gen.addr_cnt_i_reg[0]\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[0]_i_6_n_0\ : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal \^read_ack_reg_reg\ : STD_LOGIC;
  signal \^read_ack_reg_reg_0\ : STD_LOGIC;
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_8\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \FSM_sequential_crnt_state[0]_i_6\ : label is "soft_lutpair60";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_4\ : label is "soft_lutpair58";
  attribute BOX_TYPE of \PERBIT_GEN[1].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[1].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[1].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute SOFT_HLUTNM of \PERBIT_GEN[4].MULT_AND_i1_i_5\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_4\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of read_data_en_reg_i_2 : label is "soft_lutpair59";
begin
  \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ <= \^datawidth_match_gen.addr_cnt_i_reg[0]\;
  read_ack_reg_reg <= \^read_ack_reg_reg\;
  read_ack_reg_reg_0 <= \^read_ack_reg_reg_0\;
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^read_ack_reg_reg\,
      I1 => \^read_ack_reg_reg_0\,
      I2 => trd_end,
      I3 => bus2Mem_RdReq,
      O => read_req_ack_cmb42_out
    );
\FSM_sequential_crnt_state[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000400044444444"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[0]_i_6_n_0\,
      I1 => \FSM_sequential_crnt_state_reg[2]\,
      I2 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I3 => pend_wrreq_reg,
      I4 => single_transaction,
      I5 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      O => \FSM_sequential_crnt_state_reg[0]\
    );
\FSM_sequential_crnt_state[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0054"
    )
        port map (
      I0 => \out\(0),
      I1 => \^read_ack_reg_reg\,
      I2 => \^read_ack_reg_reg_0\,
      I3 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      O => \FSM_sequential_crnt_state[0]_i_6_n_0\
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_1,
      Q => \^read_ack_reg_reg_0\,
      R => SR(0)
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_0,
      Q => \^read_ack_reg_reg\,
      R => SR(0)
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => pend_wrreq_reg_0,
      I1 => bus2ip_wrreq_i,
      I2 => \^read_ack_reg_reg\,
      I3 => \^read_ack_reg_reg_0\,
      I4 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      O => addr_cnt_rst_cmb
    );
\PERBIT_GEN[1].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_ack_reg_reg\,
      I1 => Cycle_cnt_en_int,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[1].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 1) => \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 1),
      CO(0) => cry(1),
      CYINIT => Cycle_cnt_en_int,
      DI(3 downto 1) => \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 1),
      DI(0) => gen_cry_kill_n_0,
      O(3 downto 2) => \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_O_UNCONNECTED\(3 downto 2),
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3 downto 2) => \NLW_PERBIT_GEN[1].MUXCY_i1_CARRY4_S_UNCONNECTED\(3 downto 2),
      S(1) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\,
      S(0) => S_0
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8AAA8A800000000"
    )
        port map (
      I0 => tpacc_end,
      I1 => \^read_ack_reg_reg_0\,
      I2 => \^read_ack_reg_reg\,
      I3 => new_page,
      I4 => bus2Mem_RdReq,
      I5 => \FSM_sequential_crnt_state_reg[1]\,
      O => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => bus2ip_wrreq_i,
      I1 => pend_wrreq_reg_0,
      I2 => \^read_ack_reg_reg_0\,
      I3 => \^read_ack_reg_reg\,
      O => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC8080808"
    )
        port map (
      I0 => \FSM_sequential_emc_addr_ps_reg[2]\,
      I1 => \^datawidth_match_gen.addr_cnt_i_reg[0]\,
      I2 => pend_wrreq_reg,
      I3 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I4 => single_transaction,
      I5 => bus2ip_wr_req_reg_reg,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\
    );
\READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^read_ack_reg_reg\,
      I1 => \^read_ack_reg_reg_0\,
      O => \^datawidth_match_gen.addr_cnt_i_reg[0]\
    );
read_ack_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => read_data_en_cmb,
      I1 => \^read_ack_reg_reg_0\,
      I2 => \^read_ack_reg_reg\,
      O => read_ack_cmb
    );
read_data_en_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^read_ack_reg_reg_0\,
      I1 => \^read_ack_reg_reg\,
      I2 => bus2Mem_RdReq,
      O => read_data_en_reg_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized1\ is
  port (
    read_data_en_reg_reg : out STD_LOGIC;
    read_data_en_reg_reg_0 : out STD_LOGIC;
    read_data_en_reg_reg_1 : out STD_LOGIC;
    read_data_en_reg_reg_2 : out STD_LOGIC;
    read_data_en_reg_reg_3 : out STD_LOGIC;
    \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\ : out STD_LOGIC;
    cycle_cnt_en_cmb38_out : out STD_LOGIC;
    tpacc_end : out STD_LOGIC;
    tpacc_cnt_en : in STD_LOGIC;
    S_10 : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_11\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_12\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_13\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE_14 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized1\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized1\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized1\ is
  signal \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_1 : STD_LOGIC;
  signal gen_cry_kill_n_2 : STD_LOGIC;
  signal \^read_data_en_reg_reg\ : STD_LOGIC;
  signal \^read_data_en_reg_reg_0\ : STD_LOGIC;
  signal \^read_data_en_reg_reg_1\ : STD_LOGIC;
  signal \^read_data_en_reg_reg_2\ : STD_LOGIC;
  signal \^read_data_en_reg_reg_3\ : STD_LOGIC;
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[2].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[2].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[3].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[3].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  read_data_en_reg_reg <= \^read_data_en_reg_reg\;
  read_data_en_reg_reg_0 <= \^read_data_en_reg_reg_0\;
  read_data_en_reg_reg_1 <= \^read_data_en_reg_reg_1\;
  read_data_en_reg_reg_2 <= \^read_data_en_reg_reg_2\;
  read_data_en_reg_reg_3 <= \^read_data_en_reg_reg_3\;
\PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_14,
      D => xorcy_out_4,
      Q => \^read_data_en_reg_reg_3\,
      S => SR(0)
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => xorcy_out_4,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_13\
    );
\PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_14,
      D => xorcy_out_3,
      Q => \^read_data_en_reg_reg_2\,
      S => SR(0)
    );
\PERBIT_GEN[1].MULT_AND_i1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \^read_data_en_reg_reg_2\,
      I1 => \^read_data_en_reg_reg_3\,
      I2 => \^read_data_en_reg_reg_1\,
      I3 => \^read_data_en_reg_reg_0\,
      I4 => \^read_data_en_reg_reg\,
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      O => cycle_cnt_en_cmb38_out
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^read_data_en_reg_reg_2\,
      I1 => tpacc_cnt_en,
      O => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_14,
      D => xorcy_out_2,
      Q => \^read_data_en_reg_reg_1\,
      S => SR(0)
    );
\PERBIT_GEN[2].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_data_en_reg_reg_1\,
      I1 => tpacc_cnt_en,
      O => gen_cry_kill_n_2
    );
\PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_14,
      D => xorcy_out_1,
      Q => \^read_data_en_reg_reg_0\,
      S => SR(0)
    );
\PERBIT_GEN[3].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_data_en_reg_reg_0\,
      I1 => tpacc_cnt_en,
      O => gen_cry_kill_n_1
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_14,
      D => xorcy_out_0,
      Q => \^read_data_en_reg_reg\,
      S => SR(0)
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_data_en_reg_reg\,
      I1 => tpacc_cnt_en,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[4].MULT_AND_i1_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^read_data_en_reg_reg\,
      I1 => \^read_data_en_reg_reg_0\,
      I2 => \^read_data_en_reg_reg_1\,
      I3 => \^read_data_en_reg_reg_3\,
      I4 => \^read_data_en_reg_reg_2\,
      O => tpacc_end
    );
\PERBIT_GEN[4].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => tpacc_cnt_en,
      DI(3) => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      DI(2) => gen_cry_kill_n_2,
      DI(1) => gen_cry_kill_n_1,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      S(2) => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_12\,
      S(1) => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_11\,
      S(0) => S_10
    );
\READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \^read_data_en_reg_reg_2\,
      I1 => \^read_data_en_reg_reg_3\,
      I2 => \^read_data_en_reg_reg_1\,
      I3 => \^read_data_en_reg_reg_0\,
      I4 => \^read_data_en_reg_reg\,
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      O => \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_1\ is
  port (
    read_data_en_reg_reg : out STD_LOGIC;
    read_data_en_reg_reg_0 : out STD_LOGIC;
    read_data_en_reg_reg_1 : out STD_LOGIC;
    read_data_en_reg_reg_2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ : out STD_LOGIC;
    trd_end : out STD_LOGIC;
    cycle_cnt_en_cmb37_out : out STD_LOGIC;
    trd_cnt_en : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_5\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_6\ : in STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_8\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE_9 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    tpacc_end : in STD_LOGIC;
    bus2Mem_RdReq : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_1\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_1\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_1\ is
  signal \PERBIT_GEN[2].MUXCY_i1_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[3].MUXCY_i1_i_2_n_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_3 : STD_LOGIC;
  signal \^read_data_en_reg_reg\ : STD_LOGIC;
  signal \^read_data_en_reg_reg_0\ : STD_LOGIC;
  signal \^read_data_en_reg_reg_1\ : STD_LOGIC;
  signal \^read_data_en_reg_reg_2\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal trd_cnt : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \^trd_end\ : STD_LOGIC;
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[1].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  read_data_en_reg_reg <= \^read_data_en_reg_reg\;
  read_data_en_reg_reg_0 <= \^read_data_en_reg_reg_0\;
  read_data_en_reg_reg_1 <= \^read_data_en_reg_reg_1\;
  read_data_en_reg_reg_2(0) <= \^read_data_en_reg_reg_2\(0);
  trd_end <= \^trd_end\;
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD3FFDFFFFFFFFF"
    )
        port map (
      I0 => \^trd_end\,
      I1 => \out\(1),
      I2 => \out\(0),
      I3 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      I4 => tpacc_end,
      I5 => bus2Mem_RdReq,
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\
    );
\PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_9,
      D => xorcy_out_4,
      Q => \^read_data_en_reg_reg_2\(0),
      S => SR(0)
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => xorcy_out_4,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_8\
    );
\PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_9,
      D => xorcy_out_3,
      Q => \^read_data_en_reg_reg\,
      S => SR(0)
    );
\PERBIT_GEN[1].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_data_en_reg_reg\,
      I1 => trd_cnt_en,
      O => gen_cry_kill_n_3
    );
\PERBIT_GEN[1].MULT_AND_i1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \^read_data_en_reg_reg\,
      I1 => \^read_data_en_reg_reg_2\(0),
      I2 => \^read_data_en_reg_reg_1\,
      I3 => \^read_data_en_reg_reg_0\,
      I4 => trd_cnt(4),
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      O => cycle_cnt_en_cmb37_out
    );
\PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_9,
      D => xorcy_out_2,
      Q => \^read_data_en_reg_reg_1\,
      S => SR(0)
    );
\PERBIT_GEN[2].MUXCY_i1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_data_en_reg_reg_1\,
      I1 => trd_cnt_en,
      O => \PERBIT_GEN[2].MUXCY_i1_i_2_n_0\
    );
\PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_9,
      D => xorcy_out_1,
      Q => \^read_data_en_reg_reg_0\,
      S => SR(0)
    );
\PERBIT_GEN[3].MUXCY_i1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_data_en_reg_reg_0\,
      I1 => trd_cnt_en,
      O => \PERBIT_GEN[3].MUXCY_i1_i_2_n_0\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_9,
      D => xorcy_out_0,
      Q => trd_cnt(4),
      S => SR(0)
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => trd_cnt(4),
      I1 => trd_cnt_en,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[4].MULT_AND_i1_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => trd_cnt(4),
      I1 => \^read_data_en_reg_reg_0\,
      I2 => \^read_data_en_reg_reg_1\,
      I3 => \^read_data_en_reg_reg_2\(0),
      I4 => \^read_data_en_reg_reg\,
      O => \^trd_end\
    );
\PERBIT_GEN[4].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => trd_cnt_en,
      DI(3) => gen_cry_kill_n_3,
      DI(2) => \PERBIT_GEN[2].MUXCY_i1_i_2_n_0\,
      DI(1) => \PERBIT_GEN[3].MUXCY_i1_i_2_n_0\,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\,
      S(2) => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_6\,
      S(1) => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_5\,
      S(0) => S
    );
\PERBIT_GEN[4].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => trd_cnt(4),
      I1 => trd_cnt_en,
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_3\ is
  port (
    p_0_in : out STD_LOGIC_VECTOR ( 0 to 4 );
    \FSM_sequential_crnt_state_reg[1]\ : out STD_LOGIC;
    twr_cnt_en : in STD_LOGIC;
    S : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_3\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_3\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized1_3\ is
  signal \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_1 : STD_LOGIC;
  signal gen_cry_kill_n_2 : STD_LOGIC;
  signal \^p_0_in\ : STD_LOGIC_VECTOR ( 0 to 4 );
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[2].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[2].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[3].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[3].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  p_0_in(0 to 4) <= \^p_0_in\(0 to 4);
\PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_4,
      Q => \^p_0_in\(0),
      S => SR(0)
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => xorcy_out_4,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_3,
      Q => \^p_0_in\(1),
      S => SR(0)
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^p_0_in\(1),
      I1 => twr_cnt_en,
      O => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_2,
      Q => \^p_0_in\(2),
      S => SR(0)
    );
\PERBIT_GEN[2].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p_0_in\(2),
      I1 => twr_cnt_en,
      O => gen_cry_kill_n_2
    );
\PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_1,
      Q => \^p_0_in\(3),
      S => SR(0)
    );
\PERBIT_GEN[3].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p_0_in\(3),
      I1 => twr_cnt_en,
      O => gen_cry_kill_n_1
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => xorcy_out_0,
      Q => \^p_0_in\(4),
      S => SR(0)
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p_0_in\(4),
      I1 => twr_cnt_en,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[4].MULT_AND_i1_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^p_0_in\(0),
      I1 => \^p_0_in\(3),
      I2 => \^p_0_in\(4),
      I3 => \^p_0_in\(1),
      I4 => \^p_0_in\(2),
      O => \FSM_sequential_crnt_state_reg[1]\
    );
\PERBIT_GEN[4].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => twr_cnt_en,
      DI(3) => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      DI(2) => gen_cry_kill_n_2,
      DI(1) => gen_cry_kill_n_1,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      S(2) => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      S(1) => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      S(0) => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized2\ is
  port (
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    p_85_in : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE_15 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    pend_wrreq_reg : in STD_LOGIC;
    bus2ip_wrreq_i : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    pend_wrreq_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized2\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized2\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized2\ is
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[4].MULT_AND_i1_i_1__2_n_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_1 : STD_LOGIC;
  signal gen_cry_kill_n_2 : STD_LOGIC;
  signal gen_cry_kill_n_3 : STD_LOGIC;
  signal thz_cnt : STD_LOGIC_VECTOR ( 0 to 4 );
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[1].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[2].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[2].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[3].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[3].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\;
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_15,
      D => xorcy_out_4,
      Q => thz_cnt(0),
      R => SR(0)
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => xorcy_out_4,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[0].XORCY_i1_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => thz_cnt(1),
      I1 => thz_cnt(2),
      I2 => thz_cnt(3),
      I3 => thz_cnt(4),
      I4 => thz_cnt(0),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_15,
      D => xorcy_out_3,
      Q => thz_cnt(1),
      R => SR(0)
    );
\PERBIT_GEN[1].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => thz_cnt(1),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__2_n_0\,
      O => gen_cry_kill_n_3
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => thz_cnt(0),
      I1 => thz_cnt(2),
      I2 => thz_cnt(3),
      I3 => thz_cnt(4),
      I4 => thz_cnt(1),
      O => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_15,
      D => xorcy_out_2,
      Q => thz_cnt(2),
      R => SR(0)
    );
\PERBIT_GEN[2].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => thz_cnt(2),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__2_n_0\,
      O => gen_cry_kill_n_2
    );
\PERBIT_GEN[2].MUXCY_i1_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => thz_cnt(1),
      I1 => thz_cnt(0),
      I2 => thz_cnt(3),
      I3 => thz_cnt(4),
      I4 => thz_cnt(2),
      O => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_15,
      D => xorcy_out_1,
      Q => thz_cnt(3),
      R => SR(0)
    );
\PERBIT_GEN[3].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => thz_cnt(3),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__2_n_0\,
      O => gen_cry_kill_n_1
    );
\PERBIT_GEN[3].MUXCY_i1_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => thz_cnt(1),
      I1 => thz_cnt(0),
      I2 => thz_cnt(2),
      I3 => thz_cnt(4),
      I4 => thz_cnt(3),
      O => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_15,
      D => xorcy_out_0,
      Q => thz_cnt(4),
      R => SR(0)
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => thz_cnt(4),
      I1 => thz_cnt(3),
      I2 => thz_cnt(2),
      I3 => thz_cnt(0),
      I4 => thz_cnt(1),
      O => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FFF5FFF0CCCFFFF"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I1 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I2 => pend_wrreq_reg,
      I3 => bus2ip_wrreq_i,
      I4 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\,
      I5 => \out\(0),
      O => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => thz_cnt(4),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__2_n_0\,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[4].MULT_AND_i1_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => thz_cnt(1),
      I1 => thz_cnt(0),
      I2 => thz_cnt(2),
      I3 => thz_cnt(3),
      I4 => thz_cnt(4),
      O => \PERBIT_GEN[4].MULT_AND_i1_i_1__2_n_0\
    );
\PERBIT_GEN[4].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => \PERBIT_GEN[4].MULT_AND_i1_i_1__2_n_0\,
      DI(3) => gen_cry_kill_n_3,
      DI(2) => gen_cry_kill_n_2,
      DI(1) => gen_cry_kill_n_1,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      S(2) => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      S(1) => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      S(0) => S
    );
\PERBIT_GEN[4].MUXCY_i1_i_1__4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => thz_cnt(1),
      I1 => thz_cnt(0),
      I2 => thz_cnt(2),
      I3 => thz_cnt(3),
      I4 => thz_cnt(4),
      O => S
    );
s_axi_mem_wready_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => thz_cnt(1),
      I1 => thz_cnt(0),
      I2 => thz_cnt(2),
      I3 => thz_cnt(3),
      I4 => thz_cnt(4),
      I5 => pend_wrreq_reg_0,
      O => p_85_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_0\ is
  port (
    \FSM_sequential_crnt_state_reg[1]\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE_4 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    temp_bus2ip_cs : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_0\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_0\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_0\ is
  signal \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \PERBIT_GEN[4].MULT_AND_i1_i_1__3_n_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_1 : STD_LOGIC;
  signal gen_cry_kill_n_2 : STD_LOGIC;
  signal gen_cry_kill_n_3 : STD_LOGIC;
  signal tlz_cnt : STD_LOGIC_VECTOR ( 0 to 4 );
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[1].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[2].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[2].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[3].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[3].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
\FSM_sequential_crnt_state[1]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => tlz_cnt(1),
      I1 => tlz_cnt(0),
      I2 => tlz_cnt(2),
      I3 => tlz_cnt(3),
      I4 => tlz_cnt(4),
      I5 => temp_bus2ip_cs,
      O => \FSM_sequential_crnt_state_reg[1]\
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_4,
      D => xorcy_out_4,
      Q => tlz_cnt(0),
      R => SR(0)
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => xorcy_out_4,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[0].XORCY_i1_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => tlz_cnt(1),
      I1 => tlz_cnt(2),
      I2 => tlz_cnt(3),
      I3 => tlz_cnt(4),
      I4 => tlz_cnt(0),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_4,
      D => xorcy_out_3,
      Q => tlz_cnt(1),
      R => SR(0)
    );
\PERBIT_GEN[1].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => tlz_cnt(1),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__3_n_0\,
      O => gen_cry_kill_n_3
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => tlz_cnt(0),
      I1 => tlz_cnt(2),
      I2 => tlz_cnt(3),
      I3 => tlz_cnt(4),
      I4 => tlz_cnt(1),
      O => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_4,
      D => xorcy_out_2,
      Q => tlz_cnt(2),
      R => SR(0)
    );
\PERBIT_GEN[2].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => tlz_cnt(2),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__3_n_0\,
      O => gen_cry_kill_n_2
    );
\PERBIT_GEN[2].MUXCY_i1_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => tlz_cnt(1),
      I1 => tlz_cnt(0),
      I2 => tlz_cnt(3),
      I3 => tlz_cnt(4),
      I4 => tlz_cnt(2),
      O => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_4,
      D => xorcy_out_1,
      Q => tlz_cnt(3),
      R => SR(0)
    );
\PERBIT_GEN[3].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => tlz_cnt(3),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__3_n_0\,
      O => gen_cry_kill_n_1
    );
\PERBIT_GEN[3].MUXCY_i1_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => tlz_cnt(1),
      I1 => tlz_cnt(0),
      I2 => tlz_cnt(2),
      I3 => tlz_cnt(4),
      I4 => tlz_cnt(3),
      O => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_4,
      D => xorcy_out_0,
      Q => tlz_cnt(4),
      R => SR(0)
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => tlz_cnt(4),
      I1 => tlz_cnt(3),
      I2 => tlz_cnt(2),
      I3 => tlz_cnt(0),
      I4 => tlz_cnt(1),
      O => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => tlz_cnt(4),
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_1__3_n_0\,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[4].MULT_AND_i1_i_1__3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => tlz_cnt(1),
      I1 => tlz_cnt(0),
      I2 => tlz_cnt(2),
      I3 => tlz_cnt(3),
      I4 => tlz_cnt(4),
      O => \PERBIT_GEN[4].MULT_AND_i1_i_1__3_n_0\
    );
\PERBIT_GEN[4].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => \PERBIT_GEN[4].MULT_AND_i1_i_1__3_n_0\,
      DI(3) => gen_cry_kill_n_3,
      DI(2) => gen_cry_kill_n_2,
      DI(1) => gen_cry_kill_n_1,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      S(2) => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      S(1) => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      S(0) => S
    );
\PERBIT_GEN[4].MUXCY_i1_i_1__5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => tlz_cnt(1),
      I1 => tlz_cnt(0),
      I2 => tlz_cnt(2),
      I3 => tlz_cnt(3),
      I4 => tlz_cnt(4),
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_2\ is
  port (
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[0]\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[3]\ : in STD_LOGIC;
    S_0 : in STD_LOGIC;
    \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1_1\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_1\ : in STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_2\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE_3 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    next_state1 : in STD_LOGIC;
    single_transaction : in STD_LOGIC;
    pend_wrreq_reg : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\ : in STD_LOGIC;
    crnt_state_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_2\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_2\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized2_2\ is
  signal \^datawidth_match_gen.addr_cnt_i_reg[0]\ : STD_LOGIC;
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal \^perbit_gen[1].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal \^perbit_gen[2].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal \^perbit_gen[3].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \^perbit_gen[4].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_2 : STD_LOGIC;
  signal gen_cry_kill_n_3 : STD_LOGIC;
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[1].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[2].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[2].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ <= \^datawidth_match_gen.addr_cnt_i_reg[0]\;
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\;
  \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[1].ff_rst0_gen.fdre_i1_0\;
  \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[2].ff_rst0_gen.fdre_i1_0\;
  \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[3].ff_rst0_gen.fdre_i1_0\;
  \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[4].ff_rst0_gen.fdre_i1_0\;
\FSM_sequential_crnt_state[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => \^perbit_gen[1].ff_rst0_gen.fdre_i1_0\,
      I1 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I2 => \^perbit_gen[2].ff_rst0_gen.fdre_i1_0\,
      I3 => \^perbit_gen[3].ff_rst0_gen.fdre_i1_0\,
      I4 => \^perbit_gen[4].ff_rst0_gen.fdre_i1_0\,
      I5 => next_state1,
      O => \FSM_sequential_crnt_state_reg[0]\
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_3,
      D => xorcy_out_4,
      Q => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      R => SR(0)
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => xorcy_out_4,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_2\
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_3,
      D => xorcy_out_3,
      Q => \^perbit_gen[1].ff_rst0_gen.fdre_i1_0\,
      R => SR(0)
    );
\PERBIT_GEN[1].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[1].ff_rst0_gen.fdre_i1_0\,
      I1 => \FSM_sequential_crnt_state_reg[3]\,
      O => gen_cry_kill_n_3
    );
\PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_3,
      D => xorcy_out_2,
      Q => \^perbit_gen[2].ff_rst0_gen.fdre_i1_0\,
      R => SR(0)
    );
\PERBIT_GEN[2].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[2].ff_rst0_gen.fdre_i1_0\,
      I1 => \FSM_sequential_crnt_state_reg[3]\,
      O => gen_cry_kill_n_2
    );
\PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_3,
      D => xorcy_out_1,
      Q => \^perbit_gen[3].ff_rst0_gen.fdre_i1_0\,
      R => SR(0)
    );
\PERBIT_GEN[3].MUXCY_i1_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^perbit_gen[3].ff_rst0_gen.fdre_i1_0\,
      I1 => \FSM_sequential_crnt_state_reg[3]\,
      O => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_3,
      D => xorcy_out_0,
      Q => \^perbit_gen[4].ff_rst0_gen.fdre_i1_0\,
      R => SR(0)
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[4].ff_rst0_gen.fdre_i1_0\,
      I1 => \FSM_sequential_crnt_state_reg[3]\,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[4].MULT_AND_i1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^perbit_gen[4].ff_rst0_gen.fdre_i1_0\,
      I1 => \^perbit_gen[3].ff_rst0_gen.fdre_i1_0\,
      I2 => \^perbit_gen[2].ff_rst0_gen.fdre_i1_0\,
      I3 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I4 => \^perbit_gen[1].ff_rst0_gen.fdre_i1_0\,
      O => \^datawidth_match_gen.addr_cnt_i_reg[0]\
    );
\PERBIT_GEN[4].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => \FSM_sequential_crnt_state_reg[3]\,
      DI(3) => gen_cry_kill_n_3,
      DI(2) => gen_cry_kill_n_2,
      DI(1) => \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1_1\,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      S(2) => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_1\,
      S(1) => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      S(0) => S_0
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFD055D000"
    )
        port map (
      I0 => \^datawidth_match_gen.addr_cnt_i_reg[0]\,
      I1 => single_transaction,
      I2 => pend_wrreq_reg,
      I3 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\,
      I4 => crnt_state_reg(0),
      I5 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555555554"
    )
        port map (
      I0 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\,
      I1 => \^perbit_gen[4].ff_rst0_gen.fdre_i1_0\,
      I2 => \^perbit_gen[3].ff_rst0_gen.fdre_i1_0\,
      I3 => \^perbit_gen[2].ff_rst0_gen.fdre_i1_0\,
      I4 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I5 => \^perbit_gen[1].ff_rst0_gen.fdre_i1_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_axi_emc_0_0_ld_arith_reg__parameterized3\ is
  port (
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\ : out STD_LOGIC_VECTOR ( 14 downto 0 );
    \PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1_0\ : out STD_LOGIC;
    twr_rec_cnt_en_int : in STD_LOGIC;
    \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_axi_emc_0_0_ld_arith_reg__parameterized3\ : entity is "ld_arith_reg";
end \design_1_axi_emc_0_0_ld_arith_reg__parameterized3\;

architecture STRUCTURE of \design_1_axi_emc_0_0_ld_arith_reg__parameterized3\ is
  signal \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \PERBIT_GEN[14].MUXCY_i1_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[15].MULT_AND_i1_i_3_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[15].MULT_AND_i1_i_4_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[15].MULT_AND_i1_i_5_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[15].MULT_AND_i1_i_6_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[15].MUXCY_i1_i_1_n_0\ : STD_LOGIC;
  signal cry : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal gen_cry_kill_n_0 : STD_LOGIC;
  signal gen_cry_kill_n_10 : STD_LOGIC;
  signal gen_cry_kill_n_11 : STD_LOGIC;
  signal gen_cry_kill_n_12 : STD_LOGIC;
  signal gen_cry_kill_n_13 : STD_LOGIC;
  signal gen_cry_kill_n_14 : STD_LOGIC;
  signal gen_cry_kill_n_2 : STD_LOGIC;
  signal gen_cry_kill_n_3 : STD_LOGIC;
  signal gen_cry_kill_n_4 : STD_LOGIC;
  signal gen_cry_kill_n_5 : STD_LOGIC;
  signal gen_cry_kill_n_6 : STD_LOGIC;
  signal gen_cry_kill_n_7 : STD_LOGIC;
  signal gen_cry_kill_n_8 : STD_LOGIC;
  signal gen_cry_kill_n_9 : STD_LOGIC;
  signal twr_rec_cnt : STD_LOGIC_VECTOR ( 15 to 15 );
  signal xorcy_out_0 : STD_LOGIC;
  signal xorcy_out_1 : STD_LOGIC;
  signal xorcy_out_10 : STD_LOGIC;
  signal xorcy_out_11 : STD_LOGIC;
  signal xorcy_out_12 : STD_LOGIC;
  signal xorcy_out_13 : STD_LOGIC;
  signal xorcy_out_14 : STD_LOGIC;
  signal xorcy_out_15 : STD_LOGIC;
  signal xorcy_out_2 : STD_LOGIC;
  signal xorcy_out_3 : STD_LOGIC;
  signal xorcy_out_4 : STD_LOGIC;
  signal xorcy_out_5 : STD_LOGIC;
  signal xorcy_out_6 : STD_LOGIC;
  signal xorcy_out_7 : STD_LOGIC;
  signal xorcy_out_8 : STD_LOGIC;
  signal xorcy_out_9 : STD_LOGIC;
  signal \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[10].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[10].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[10].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[11].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[11].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[11].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[11].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[11].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[12].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[12].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[12].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[13].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[13].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[13].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[15].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[15].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[15].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[15].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[15].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[1].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[1].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[1].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[2].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[2].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[2].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[3].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[3].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[3].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[3].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[4].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[4].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[4].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[5].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[5].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[5].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[6].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[6].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[6].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[7].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[7].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[7].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[7].MUXCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[7].MUXCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute BOX_TYPE of \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[8].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[8].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[8].MULT_AND_i1\ : label is "LO:O";
  attribute BOX_TYPE of \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[9].MULT_AND_i1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[9].MULT_AND_i1\ : label is "MULT_AND";
  attribute XILINX_TRANSFORM_PINMAP of \PERBIT_GEN[9].MULT_AND_i1\ : label is "LO:O";
begin
  \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\(14 downto 0) <= \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(14 downto 0);
\PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_15,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(14),
      S => SR(0)
    );
\PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_5,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(4),
      S => SR(0)
    );
\PERBIT_GEN[10].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(4),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_5
    );
\PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_4,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(3),
      S => SR(0)
    );
\PERBIT_GEN[11].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(3),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_4
    );
\PERBIT_GEN[11].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(4),
      CO(3 downto 0) => cry(8 downto 5),
      CYINIT => '0',
      DI(3) => gen_cry_kill_n_7,
      DI(2) => gen_cry_kill_n_6,
      DI(1) => gen_cry_kill_n_5,
      DI(0) => gen_cry_kill_n_4,
      O(3) => xorcy_out_7,
      O(2) => xorcy_out_6,
      O(1) => xorcy_out_5,
      O(0) => xorcy_out_4,
      S(3) => \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1_0\,
      S(2) => \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1_0\,
      S(1) => \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1_0\,
      S(0) => \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1_0\
    );
\PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_3,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(2),
      S => SR(0)
    );
\PERBIT_GEN[12].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(2),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_3
    );
\PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_2,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(1),
      S => SR(0)
    );
\PERBIT_GEN[13].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(1),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_2
    );
\PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_1,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(0),
      S => SR(0)
    );
\PERBIT_GEN[14].MUXCY_i1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(0),
      I1 => twr_rec_cnt_en_int,
      O => \PERBIT_GEN[14].MUXCY_i1_i_2_n_0\
    );
\PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_0,
      Q => twr_rec_cnt(15),
      S => SR(0)
    );
\PERBIT_GEN[15].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => twr_rec_cnt(15),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_0
    );
\PERBIT_GEN[15].MULT_AND_i1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => \out\(0),
      I1 => \PERBIT_GEN[15].MULT_AND_i1_i_3_n_0\,
      I2 => \PERBIT_GEN[15].MULT_AND_i1_i_4_n_0\,
      I3 => \PERBIT_GEN[15].MULT_AND_i1_i_5_n_0\,
      I4 => \PERBIT_GEN[15].MULT_AND_i1_i_6_n_0\,
      O => \PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1_0\
    );
\PERBIT_GEN[15].MULT_AND_i1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(5),
      I1 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(6),
      I2 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(3),
      I3 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(4),
      O => \PERBIT_GEN[15].MULT_AND_i1_i_3_n_0\
    );
\PERBIT_GEN[15].MULT_AND_i1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(1),
      I1 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(2),
      I2 => twr_rec_cnt(15),
      I3 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(0),
      O => \PERBIT_GEN[15].MULT_AND_i1_i_4_n_0\
    );
\PERBIT_GEN[15].MULT_AND_i1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(14),
      I1 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(13),
      I2 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(11),
      I3 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(12),
      O => \PERBIT_GEN[15].MULT_AND_i1_i_5_n_0\
    );
\PERBIT_GEN[15].MULT_AND_i1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(9),
      I1 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(10),
      I2 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(7),
      I3 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(8),
      O => \PERBIT_GEN[15].MULT_AND_i1_i_6_n_0\
    );
\PERBIT_GEN[15].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => cry(4 downto 1),
      CYINIT => twr_rec_cnt_en_int,
      DI(3) => gen_cry_kill_n_3,
      DI(2) => gen_cry_kill_n_2,
      DI(1) => \PERBIT_GEN[14].MUXCY_i1_i_2_n_0\,
      DI(0) => gen_cry_kill_n_0,
      O(3) => xorcy_out_3,
      O(2) => xorcy_out_2,
      O(1) => xorcy_out_1,
      O(0) => xorcy_out_0,
      S(3) => \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1_0\,
      S(2) => \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1_0\,
      S(1) => \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1_0\,
      S(0) => \PERBIT_GEN[15].MUXCY_i1_i_1_n_0\
    );
\PERBIT_GEN[15].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => twr_rec_cnt(15),
      I1 => twr_rec_cnt_en_int,
      O => \PERBIT_GEN[15].MUXCY_i1_i_1_n_0\
    );
\PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_14,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(13),
      S => SR(0)
    );
\PERBIT_GEN[1].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(13),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_14
    );
\PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_13,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(12),
      S => SR(0)
    );
\PERBIT_GEN[2].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(12),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_13
    );
\PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_12,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(11),
      S => SR(0)
    );
\PERBIT_GEN[3].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(11),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_12
    );
\PERBIT_GEN[3].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(12),
      CO(3) => \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_CO_UNCONNECTED\(3),
      CO(2 downto 0) => cry(15 downto 13),
      CYINIT => '0',
      DI(3) => \NLW_PERBIT_GEN[3].MUXCY_i1_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => gen_cry_kill_n_14,
      DI(1) => gen_cry_kill_n_13,
      DI(0) => gen_cry_kill_n_12,
      O(3) => xorcy_out_15,
      O(2) => xorcy_out_14,
      O(1) => xorcy_out_13,
      O(0) => xorcy_out_12,
      S(3) => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\,
      S(2) => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      S(1) => \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1_0\,
      S(0) => \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1_0\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_11,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(10),
      S => SR(0)
    );
\PERBIT_GEN[4].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(10),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_11
    );
\PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_10,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(9),
      S => SR(0)
    );
\PERBIT_GEN[5].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(9),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_10
    );
\PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_9,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(8),
      S => SR(0)
    );
\PERBIT_GEN[6].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(8),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_9
    );
\PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_8,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(7),
      S => SR(0)
    );
\PERBIT_GEN[7].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(7),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_8
    );
\PERBIT_GEN[7].MUXCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => cry(8),
      CO(3 downto 0) => cry(12 downto 9),
      CYINIT => '0',
      DI(3) => gen_cry_kill_n_11,
      DI(2) => gen_cry_kill_n_10,
      DI(1) => gen_cry_kill_n_9,
      DI(0) => gen_cry_kill_n_8,
      O(3) => xorcy_out_11,
      O(2) => xorcy_out_10,
      O(1) => xorcy_out_9,
      O(0) => xorcy_out_8,
      S(3) => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_0\,
      S(2) => \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1_0\,
      S(1) => \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1_0\,
      S(0) => \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1_0\
    );
\PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_7,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(6),
      S => SR(0)
    );
\PERBIT_GEN[8].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(6),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_7
    );
\PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_S_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => twr_rec_cnt_en_int,
      D => xorcy_out_6,
      Q => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(5),
      S => SR(0)
    );
\PERBIT_GEN[9].MULT_AND_i1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\(5),
      I1 => twr_rec_cnt_en_int,
      O => gen_cry_kill_n_6
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_mem_state_machine is
  port (
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    transaction_done_i : out STD_LOGIC;
    Bus2IP_RdReq_d1 : out STD_LOGIC;
    read_break_reg_d1 : out STD_LOGIC;
    new_page : out STD_LOGIC;
    wlast_reg : out STD_LOGIC;
    read_data_en : out STD_LOGIC;
    read_data_en_cmb : out STD_LOGIC;
    read_ack : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]\ : out STD_LOGIC;
    \mem_cen_reg_reg[0]\ : out STD_LOGIC;
    \mem_oen_reg_reg[0]\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]_0\ : out STD_LOGIC;
    \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    twr_rec_cnt_en_int : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ : out STD_LOGIC;
    \mem_a_int_reg[31]\ : out STD_LOGIC;
    CE : out STD_LOGIC;
    cycle_cnt_en : out STD_LOGIC;
    Mem_CE_int : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]_1\ : out STD_LOGIC;
    read_req_ack_cmb : out STD_LOGIC;
    data_strobe_c : out STD_LOGIC;
    Write_req_addr_ack_cmb : out STD_LOGIC;
    addr_cnt_ce : out STD_LOGIC;
    trd_cnt_en : out STD_LOGIC;
    tpacc_cnt_en : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ : out STD_LOGIC;
    next_state1 : out STD_LOGIC;
    mem_WEN_cmb : out STD_LOGIC;
    mem_RNW_cmb : out STD_LOGIC;
    twr_cnt_en : out STD_LOGIC;
    pr_idle : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    CE_0 : out STD_LOGIC;
    CE_1 : out STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    S : out STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_2\ : out STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_3\ : out STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_4\ : out STD_LOGIC;
    CE_5 : out STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_6\ : out STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\ : out STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_8\ : out STD_LOGIC;
    S_9 : out STD_LOGIC;
    CE_10 : out STD_LOGIC;
    \mem_dq_t_reg_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    CE_11 : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_2\ : out STD_LOGIC;
    CE_12 : out STD_LOGIC;
    S_13 : out STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_14\ : out STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_15\ : out STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_16\ : out STD_LOGIC;
    enable_cs_cmb126_out : out STD_LOGIC;
    enable_cs_cmb0 : out STD_LOGIC;
    pend_rdreq_reg : out STD_LOGIC;
    CE_17 : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\ : out STD_LOGIC;
    \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_2\ : out STD_LOGIC;
    store_addr_info_cmb : out STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]\ : out STD_LOGIC;
    rw_flag_reg_reg : out STD_LOGIC;
    Write_req_data_ack_cmb : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    temp_bus2ip_cs : in STD_LOGIC;
    bus2Mem_RdReq : in STD_LOGIC;
    read_ack_cmb : in STD_LOGIC;
    Bus2IP_RdReq_emc : in STD_LOGIC;
    Bus2IP_RdReq_d1_reg_0 : in STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\ : in STD_LOGIC_VECTOR ( 14 downto 0 );
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\ : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    bus2ip_wr_req_reg_reg : in STD_LOGIC;
    addr_cnt_rst_cmb : in STD_LOGIC;
    s_axi_mem_wvalid : in STD_LOGIC;
    pend_wrreq_reg : in STD_LOGIC;
    bus2ip_wrreq_i : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[0]_0\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \axi_trans_size_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    pend_wrreq_reg_0 : in STD_LOGIC;
    next_state181_out : in STD_LOGIC;
    next_state186_out : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]_0\ : in STD_LOGIC;
    transaction_done_cmb17_out : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_1\ : in STD_LOGIC;
    read_req_ack_cmb42_out : in STD_LOGIC;
    single_transaction : in STD_LOGIC;
    trd_end : in STD_LOGIC;
    cycle_cnt : in STD_LOGIC_VECTOR ( 0 to 1 );
    \FSM_sequential_crnt_state_reg[0]_1\ : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ : in STD_LOGIC;
    pend_wrreq_reg_1 : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    next_state174_out : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\ : in STD_LOGIC;
    p_85_in : in STD_LOGIC;
    Write_req_data_ack_cmb13_out : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]_1\ : in STD_LOGIC;
    tpacc_end : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]_2\ : in STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    cycle_cnt_en_cmb37_out : in STD_LOGIC;
    cycle_cnt_en_cmb38_out : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_2\ : in STD_LOGIC;
    bus2ip_wr_req_reg_reg_0 : in STD_LOGIC;
    s_axi_mem_wlast : in STD_LOGIC;
    pend_wrreq_reg_2 : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_3\ : in STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ : in STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    tpacc_cnt : in STD_LOGIC_VECTOR ( 0 to 4 );
    twph_cnt : in STD_LOGIC_VECTOR ( 0 to 4 );
    mem_dqt_t_d : in STD_LOGIC;
    p_0_in : in STD_LOGIC_VECTOR ( 0 to 4 );
    s_axi_mem_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rw_flag_reg : in STD_LOGIC;
    s_axi_mem_arvalid : in STD_LOGIC;
    s_axi_mem_awvalid : in STD_LOGIC;
    s_axi_mem_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    bus2ip_wr_req_cmb0 : in STD_LOGIC;
    bus2ip_burst_reg : in STD_LOGIC;
    ip2bus_addrack : in STD_LOGIC;
    addr_sm_ps_IDLE_reg : in STD_LOGIC
  );
end design_1_axi_emc_0_0_mem_state_machine;

architecture STRUCTURE of design_1_axi_emc_0_0_mem_state_machine is
  signal \ADDRESS_STORE_GEN[0].ADDRESS_REG_i_2_n_0\ : STD_LOGIC;
  signal \^bus2ip_rdreq_d1\ : STD_LOGIC;
  signal \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_5_n_0\ : STD_LOGIC;
  signal \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_6_n_0\ : STD_LOGIC;
  signal \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_7_n_0\ : STD_LOGIC;
  signal \^datawidth_match_gen.addr_cnt_i_reg[0]\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[0]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_11_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_14_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[1]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_crnt_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_sequential_crnt_state_reg[1]_0\ : STD_LOGIC;
  signal \^fsm_sequential_crnt_state_reg[1]_1\ : STD_LOGIC;
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1\ : STD_LOGIC;
  signal \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\ : STD_LOGIC;
  signal \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_3_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2__0_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_5_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[4].MULT_AND_i1_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[4].MULT_AND_i1_i_3__0_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_10_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_11_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_13_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_14_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_16_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_17_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_18_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_19_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_21_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_22_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_23_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_26_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_28_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_2_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_30_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_31_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_32_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_33_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_34_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_35_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_3_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_40_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_43_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_4_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_5_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_7_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_8_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_9_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_15_n_0\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_6_n_0\ : STD_LOGIC;
  signal \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\ : STD_LOGIC;
  signal \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_3_n_0\ : STD_LOGIC;
  signal \^write_req_addr_ack_cmb\ : STD_LOGIC;
  signal crnt_state : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of crnt_state : signal is "yes";
  signal crnt_state_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute RTL_KEEP of crnt_state_reg : signal is "yes";
  signal \^cycle_cnt_en\ : STD_LOGIC;
  signal \^enable_cs_cmb126_out\ : STD_LOGIC;
  signal \mem_a_int[31]_i_2_n_0\ : STD_LOGIC;
  signal \^mem_a_int_reg[31]\ : STD_LOGIC;
  signal \mem_ce_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \mem_oen_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \^new_page\ : STD_LOGIC;
  signal new_page_d1 : STD_LOGIC;
  signal new_page_d1_i_2_n_0 : STD_LOGIC;
  signal \^next_state1\ : STD_LOGIC;
  signal next_state10_out : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^pr_idle\ : STD_LOGIC;
  signal read_break_reg : STD_LOGIC;
  signal \^read_break_reg_d1\ : STD_LOGIC;
  signal read_break_reg_d1_i_2_n_0 : STD_LOGIC;
  signal read_break_reg_d1_i_3_n_0 : STD_LOGIC;
  signal read_complete_cmb : STD_LOGIC;
  signal read_complete_d_4 : STD_LOGIC;
  signal read_complete_d_5 : STD_LOGIC;
  signal read_complete_d_6 : STD_LOGIC;
  signal \^read_data_en_cmb\ : STD_LOGIC;
  signal \^read_req_ack_cmb\ : STD_LOGIC;
  signal s_axi_mem_wready_INST_0_i_5_n_0 : STD_LOGIC;
  signal \^tpacc_cnt_en\ : STD_LOGIC;
  signal transaction_complete : STD_LOGIC;
  signal transaction_complete_reg : STD_LOGIC;
  signal transaction_complete_reg_i_2_n_0 : STD_LOGIC;
  signal transaction_complete_reg_i_3_n_0 : STD_LOGIC;
  signal transaction_complete_reg_i_4_n_0 : STD_LOGIC;
  signal transaction_complete_reg_i_5_n_0 : STD_LOGIC;
  signal transaction_complete_reg_i_6_n_0 : STD_LOGIC;
  signal transaction_done_cmb : STD_LOGIC;
  signal \^trd_cnt_en\ : STD_LOGIC;
  signal twph_load : STD_LOGIC;
  signal \^twr_cnt_en\ : STD_LOGIC;
  signal \^twr_rec_cnt_en_int\ : STD_LOGIC;
  signal wlast : STD_LOGIC;
  signal \^wlast_reg\ : STD_LOGIC;
  signal wlast_reg_i_3_n_0 : STD_LOGIC;
  signal wlast_reg_i_4_n_0 : STD_LOGIC;
  signal wlast_reg_i_5_n_0 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_crnt_state_reg[0]\ : label is "idle:00000,address_set:00001,address_rset:01010,deassert_cen:00010,deassert_rcen:01011,write:00011,write_wait:00110,wait_temp:00101,dassert_wen:00100,assert_cen:00111,wait_write_ack:01000,wr_rec_period:01001,linear_flash_sync_rd:01100,read:01101,page_read:01110,deassert_oen:01111,wait_rddata_ack:10000";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_crnt_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_crnt_state_reg[1]\ : label is "idle:00000,address_set:00001,address_rset:01010,deassert_cen:00010,deassert_rcen:01011,write:00011,write_wait:00110,wait_temp:00101,dassert_wen:00100,assert_cen:00111,wait_write_ack:01000,wr_rec_period:01001,linear_flash_sync_rd:01100,read:01101,page_read:01110,deassert_oen:01111,wait_rddata_ack:10000";
  attribute KEEP of \FSM_sequential_crnt_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_crnt_state_reg[2]\ : label is "idle:00000,address_set:00001,address_rset:01010,deassert_cen:00010,deassert_rcen:01011,write:00011,write_wait:00110,wait_temp:00101,dassert_wen:00100,assert_cen:00111,wait_write_ack:01000,wr_rec_period:01001,linear_flash_sync_rd:01100,read:01101,page_read:01110,deassert_oen:01111,wait_rddata_ack:10000";
  attribute KEEP of \FSM_sequential_crnt_state_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_crnt_state_reg[3]\ : label is "idle:00000,address_set:00001,address_rset:01010,deassert_cen:00010,deassert_rcen:01011,write:00011,write_wait:00110,wait_temp:00101,dassert_wen:00100,assert_cen:00111,wait_write_ack:01000,wr_rec_period:01001,linear_flash_sync_rd:01100,read:01101,page_read:01110,deassert_oen:01111,wait_rddata_ack:10000";
  attribute KEEP of \FSM_sequential_crnt_state_reg[3]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_crnt_state_reg[4]\ : label is "idle:00000,address_set:00001,address_rset:01010,deassert_cen:00010,deassert_rcen:01011,write:00011,write_wait:00110,wait_temp:00101,dassert_wen:00100,assert_cen:00111,wait_write_ack:01000,wr_rec_period:01001,linear_flash_sync_rd:01100,read:01101,page_read:01110,deassert_oen:01111,wait_rddata_ack:10000";
  attribute KEEP of \FSM_sequential_crnt_state_reg[4]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_1__0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_1__1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \PERBIT_GEN[7].FF_RST0_GEN.FDRE_i1_i_2\ : label is "soft_lutpair64";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\ : label is "FDR";
  attribute BOX_TYPE of \READ_COMPLETE_PIPE_GEN[1].READ_COMPLETE_PIPE\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \READ_COMPLETE_PIPE_GEN[1].READ_COMPLETE_PIPE\ : label is "FDR";
  attribute BOX_TYPE of \READ_COMPLETE_PIPE_GEN[2].READ_COMPLETE_PIPE\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \READ_COMPLETE_PIPE_GEN[2].READ_COMPLETE_PIPE\ : label is "FDR";
  attribute SOFT_HLUTNM of transaction_complete_reg_i_6 : label is "soft_lutpair64";
begin
  Bus2IP_RdReq_d1 <= \^bus2ip_rdreq_d1\;
  \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ <= \^datawidth_match_gen.addr_cnt_i_reg[0]\;
  \FSM_sequential_crnt_state_reg[1]_0\ <= \^fsm_sequential_crnt_state_reg[1]_0\;
  \FSM_sequential_crnt_state_reg[1]_1\ <= \^fsm_sequential_crnt_state_reg[1]_1\;
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1\;
  \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\ <= \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\;
  \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\(0) <= \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\(0);
  \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ <= \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\;
  Write_req_addr_ack_cmb <= \^write_req_addr_ack_cmb\;
  cycle_cnt_en <= \^cycle_cnt_en\;
  enable_cs_cmb126_out <= \^enable_cs_cmb126_out\;
  \mem_a_int_reg[31]\ <= \^mem_a_int_reg[31]\;
  new_page <= \^new_page\;
  next_state1 <= \^next_state1\;
  \out\(1 downto 0) <= \^out\(1 downto 0);
  pr_idle <= \^pr_idle\;
  read_break_reg_d1 <= \^read_break_reg_d1\;
  read_data_en_cmb <= \^read_data_en_cmb\;
  read_req_ack_cmb <= \^read_req_ack_cmb\;
  tpacc_cnt_en <= \^tpacc_cnt_en\;
  trd_cnt_en <= \^trd_cnt_en\;
  twr_cnt_en <= \^twr_cnt_en\;
  twr_rec_cnt_en_int <= \^twr_rec_cnt_en_int\;
  wlast_reg <= \^wlast_reg\;
\ADDRESS_STORE_GEN[0].ADDRESS_REG_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^mem_a_int_reg[31]\,
      I1 => \ADDRESS_STORE_GEN[0].ADDRESS_REG_i_2_n_0\,
      I2 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_3_n_0\,
      O => data_strobe_c
    );
\ADDRESS_STORE_GEN[0].ADDRESS_REG_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => crnt_state(3),
      I1 => crnt_state_reg(4),
      I2 => Write_req_data_ack_cmb13_out,
      I3 => crnt_state(2),
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \ADDRESS_STORE_GEN[0].ADDRESS_REG_i_2_n_0\
    );
Bus2IP_Mem_CS_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => temp_bus2ip_cs,
      Q => p_0_in_0(0),
      R => SR(0)
    );
Bus2IP_Mem_CS_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in_0(0),
      Q => p_0_in_0(1),
      R => SR(0)
    );
Bus2IP_RdReq_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2Mem_RdReq,
      Q => \^bus2ip_rdreq_d1\,
      R => SR(0)
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555554545554"
    )
        port map (
      I0 => \mem_oen_reg[0]_i_2_n_0\,
      I1 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_2_n_0\,
      I2 => crnt_state_reg(4),
      I3 => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_5_n_0\,
      I4 => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_6_n_0\,
      I5 => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_7_n_0\,
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I1 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I2 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I3 => crnt_state(2),
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \^datawidth_match_gen.addr_cnt_i_reg[0]\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => crnt_state(2),
      I1 => crnt_state(3),
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_5_n_0\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFDFD3FFFFDFDF"
    )
        port map (
      I0 => read_req_ack_cmb42_out,
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      I4 => single_transaction,
      I5 => bus2Mem_RdReq,
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_6_n_0\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \^out\(1),
      I1 => crnt_state(2),
      I2 => \^out\(0),
      I3 => crnt_state(3),
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_7_n_0\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010FFFF00100010"
    )
        port map (
      I0 => \PERBIT_GEN[4].MULT_AND_i1_i_3__0_n_0\,
      I1 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I2 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I3 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I4 => \FSM_sequential_crnt_state_reg[1]_2\,
      I5 => \^fsm_sequential_crnt_state_reg[1]_0\,
      O => addr_cnt_ce
    );
\FSM_sequential_crnt_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77773F3355550000"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[1]_i_6_n_0\,
      I1 => \FSM_sequential_crnt_state[3]_i_4_n_0\,
      I2 => \FSM_sequential_crnt_state[0]_i_2_n_0\,
      I3 => crnt_state(2),
      I4 => crnt_state_reg(4),
      I5 => \FSM_sequential_crnt_state[0]_i_3_n_0\,
      O => \FSM_sequential_crnt_state[0]_i_1_n_0\
    );
\FSM_sequential_crnt_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D3F3D0D0F3F3F0F0"
    )
        port map (
      I0 => tpacc_end,
      I1 => \^out\(0),
      I2 => \^out\(1),
      I3 => new_page_d1,
      I4 => bus2Mem_RdReq,
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      O => \FSM_sequential_crnt_state[0]_i_2_n_0\
    );
\FSM_sequential_crnt_state[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFEFEFEFEFE"
    )
        port map (
      I0 => \FSM_sequential_crnt_state_reg[0]_1\,
      I1 => \FSM_sequential_crnt_state[0]_i_5_n_0\,
      I2 => crnt_state(3),
      I3 => crnt_state(2),
      I4 => \^out\(1),
      I5 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      O => \FSM_sequential_crnt_state[0]_i_3_n_0\
    );
\FSM_sequential_crnt_state[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000C000EEEE"
    )
        port map (
      I0 => next_state186_out,
      I1 => \^out\(1),
      I2 => s_axi_mem_wvalid,
      I3 => pend_wrreq_reg_1,
      I4 => crnt_state(2),
      I5 => \^out\(0),
      O => \FSM_sequential_crnt_state[0]_i_5_n_0\
    );
\FSM_sequential_crnt_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0DDFDFFFFDDFD"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[1]_i_2_n_0\,
      I1 => \FSM_sequential_crnt_state[1]_i_3_n_0\,
      I2 => \^fsm_sequential_crnt_state_reg[1]_0\,
      I3 => \FSM_sequential_crnt_state[1]_i_4_n_0\,
      I4 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I5 => \FSM_sequential_crnt_state[1]_i_6_n_0\,
      O => \FSM_sequential_crnt_state[1]_i_1_n_0\
    );
\FSM_sequential_crnt_state[1]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0033202300032023"
    )
        port map (
      I0 => Bus2IP_RdReq_d1_reg_0,
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => bus2Mem_RdReq,
      I4 => trd_end,
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      O => \FSM_sequential_crnt_state[1]_i_10_n_0\
    );
\FSM_sequential_crnt_state[1]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAEAEAEAAAAAAAA"
    )
        port map (
      I0 => transaction_complete_reg_i_4_n_0,
      I1 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I2 => next_state186_out,
      I3 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      I4 => bus2Mem_RdReq,
      I5 => transaction_complete_reg,
      O => \FSM_sequential_crnt_state[1]_i_11_n_0\
    );
\FSM_sequential_crnt_state[1]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBABBBABA"
    )
        port map (
      I0 => wlast_reg_i_5_n_0,
      I1 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I2 => wlast_reg_i_4_n_0,
      I3 => \FSM_sequential_crnt_state[1]_i_14_n_0\,
      I4 => bus2ip_wr_req_reg_reg_0,
      I5 => s_axi_mem_wvalid,
      O => \^next_state1\
    );
\FSM_sequential_crnt_state[1]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      O => \FSM_sequential_crnt_state[1]_i_14_n_0\
    );
\FSM_sequential_crnt_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEFEFEFEEEEEEEE"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[2]_i_4_n_0\,
      I1 => \FSM_sequential_crnt_state[3]_i_3_n_0\,
      I2 => \^out\(1),
      I3 => \mem_a_int[31]_i_2_n_0\,
      I4 => next_state10_out,
      I5 => \FSM_sequential_crnt_state[1]_i_8_n_0\,
      O => \FSM_sequential_crnt_state[1]_i_2_n_0\
    );
\FSM_sequential_crnt_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000BFBC"
    )
        port map (
      I0 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      I4 => crnt_state(2),
      O => \FSM_sequential_crnt_state[1]_i_3_n_0\
    );
\FSM_sequential_crnt_state[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000D5555555"
    )
        port map (
      I0 => \^fsm_sequential_crnt_state_reg[1]_1\,
      I1 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I2 => new_page_d1,
      I3 => tpacc_end,
      I4 => bus2Mem_RdReq,
      I5 => \FSM_sequential_crnt_state[1]_i_10_n_0\,
      O => \FSM_sequential_crnt_state[1]_i_4_n_0\
    );
\FSM_sequential_crnt_state[1]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => crnt_state(3),
      I1 => crnt_state_reg(4),
      O => \FSM_sequential_crnt_state[1]_i_5_n_0\
    );
\FSM_sequential_crnt_state[1]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      I2 => crnt_state(2),
      O => \FSM_sequential_crnt_state[1]_i_6_n_0\
    );
\FSM_sequential_crnt_state[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1F1F1F1FFFFFFF1"
    )
        port map (
      I0 => temp_bus2ip_cs,
      I1 => pend_wrreq_reg_1,
      I2 => transaction_complete_reg_i_5_n_0,
      I3 => \FSM_sequential_crnt_state[1]_i_11_n_0\,
      I4 => transaction_complete_reg_i_2_n_0,
      I5 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      O => next_state10_out
    );
\FSM_sequential_crnt_state[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDFFFFFFFFFF"
    )
        port map (
      I0 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I1 => \^out\(0),
      I2 => \^next_state1\,
      I3 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I4 => single_transaction,
      I5 => pend_wrreq_reg_1,
      O => \FSM_sequential_crnt_state[1]_i_8_n_0\
    );
\FSM_sequential_crnt_state[1]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      O => \^fsm_sequential_crnt_state_reg[1]_1\
    );
\FSM_sequential_crnt_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5003530053035303"
    )
        port map (
      I0 => read_complete_d_4,
      I1 => \FSM_sequential_crnt_state[2]_i_2_n_0\,
      I2 => crnt_state_reg(4),
      I3 => crnt_state(2),
      I4 => \FSM_sequential_crnt_state[2]_i_3_n_0\,
      I5 => crnt_state(3),
      O => \FSM_sequential_crnt_state[2]_i_1_n_0\
    );
\FSM_sequential_crnt_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFEFF0EF"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[2]_i_4_n_0\,
      I1 => \FSM_sequential_crnt_state[2]_i_5_n_0\,
      I2 => crnt_state(2),
      I3 => \FSM_sequential_crnt_state[2]_i_3_n_0\,
      I4 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I5 => crnt_state(3),
      O => \FSM_sequential_crnt_state[2]_i_2_n_0\
    );
\FSM_sequential_crnt_state[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      O => \FSM_sequential_crnt_state[2]_i_3_n_0\
    );
\FSM_sequential_crnt_state[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^out\(1),
      I1 => s_axi_mem_wvalid,
      I2 => pend_wrreq_reg,
      I3 => bus2ip_wrreq_i,
      O => \FSM_sequential_crnt_state[2]_i_4_n_0\
    );
\FSM_sequential_crnt_state[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000EFEC"
    )
        port map (
      I0 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\,
      I1 => \^out\(0),
      I2 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I3 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I4 => \^out\(1),
      I5 => \mem_a_int[31]_i_2_n_0\,
      O => \FSM_sequential_crnt_state[2]_i_5_n_0\
    );
\FSM_sequential_crnt_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0022A022AAAAAAAA"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[3]_i_2_n_0\,
      I1 => \FSM_sequential_crnt_state[3]_i_3_n_0\,
      I2 => crnt_state(3),
      I3 => crnt_state_reg(4),
      I4 => read_complete_d_4,
      I5 => \FSM_sequential_crnt_state[3]_i_4_n_0\,
      O => \FSM_sequential_crnt_state[3]_i_1_n_0\
    );
\FSM_sequential_crnt_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEEEEFFEEEEEEE"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[3]_i_5_n_0\,
      I1 => crnt_state(3),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => crnt_state(2),
      I5 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      O => \FSM_sequential_crnt_state[3]_i_2_n_0\
    );
\FSM_sequential_crnt_state[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      O => \FSM_sequential_crnt_state[3]_i_3_n_0\
    );
\FSM_sequential_crnt_state[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAB00"
    )
        port map (
      I0 => crnt_state(2),
      I1 => \FSM_sequential_crnt_state_reg[0]_0\,
      I2 => \^out\(1),
      I3 => crnt_state(3),
      I4 => crnt_state_reg(4),
      O => \FSM_sequential_crnt_state[3]_i_4_n_0\
    );
\FSM_sequential_crnt_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080AA0000"
    )
        port map (
      I0 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\,
      I1 => single_transaction,
      I2 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I3 => pend_wrreq_reg_1,
      I4 => crnt_state(2),
      I5 => \^out\(1),
      O => \FSM_sequential_crnt_state[3]_i_5_n_0\
    );
\FSM_sequential_crnt_state[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7444444444444444"
    )
        port map (
      I0 => read_complete_d_4,
      I1 => crnt_state_reg(4),
      I2 => crnt_state(2),
      I3 => crnt_state(3),
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \FSM_sequential_crnt_state[4]_i_1_n_0\
    );
\FSM_sequential_crnt_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state[0]_i_1_n_0\,
      Q => \^out\(0),
      R => SR(0)
    );
\FSM_sequential_crnt_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state[1]_i_1_n_0\,
      Q => \^out\(1),
      R => SR(0)
    );
\FSM_sequential_crnt_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state[2]_i_1_n_0\,
      Q => crnt_state(2),
      R => SR(0)
    );
\FSM_sequential_crnt_state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state[3]_i_1_n_0\,
      Q => crnt_state(3),
      R => SR(0)
    );
\FSM_sequential_crnt_state_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_crnt_state[4]_i_1_n_0\,
      Q => crnt_state_reg(4),
      R => SR(0)
    );
\FSM_sequential_emc_addr_ps[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000A80000"
    )
        port map (
      I0 => bus2ip_wr_req_cmb0,
      I1 => s_axi_mem_awburst(0),
      I2 => s_axi_mem_awburst(1),
      I3 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I4 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I5 => \^enable_cs_cmb126_out\,
      O => \FSM_sequential_emc_addr_ps_reg[2]\
    );
\PERBIT_GEN[0].XORCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^trd_cnt_en\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(3),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[0].XORCY_i1_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^tpacc_cnt_en\,
      I1 => tpacc_cnt(0),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_4\
    );
\PERBIT_GEN[0].XORCY_i1_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      I1 => twph_cnt(0),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_6\
    );
\PERBIT_GEN[0].XORCY_i1_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_cnt_en\,
      I1 => p_0_in(0),
      O => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_16\
    );
\PERBIT_GEN[0].XORCY_i1_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(14),
      O => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[10].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(4),
      O => \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[11].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(3),
      O => \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[12].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(2),
      O => \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[13].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(1),
      O => \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[14].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(0),
      O => \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[15].MULT_AND_i1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \FSM_sequential_crnt_state_reg[0]_0\,
      I1 => \^out\(1),
      I2 => crnt_state(2),
      I3 => crnt_state_reg(4),
      I4 => crnt_state(3),
      O => \^twr_rec_cnt_en_int\
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFD0D0FFD0"
    )
        port map (
      I0 => bus2Mem_RdReq,
      I1 => \axi_trans_size_reg_reg[1]\(0),
      I2 => \^cycle_cnt_en\,
      I3 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_2_n_0\,
      I4 => crnt_state_reg(4),
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_3_n_0\,
      O => CE
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001005100000041"
    )
        port map (
      I0 => crnt_state(3),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      I3 => \^out\(1),
      I4 => \mem_a_int[31]_i_2_n_0\,
      I5 => addr_cnt_rst_cmb,
      O => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_2_n_0\
    );
\PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00200000AAAAAAAA"
    )
        port map (
      I0 => \^fsm_sequential_crnt_state_reg[1]_0\,
      I1 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      I2 => bus2Mem_RdReq,
      I3 => \^out\(0),
      I4 => \^out\(1),
      I5 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2_n_0\,
      O => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_3_n_0\
    );
\PERBIT_GEN[1].MULT_AND_i1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEFAAEAAAAAAAAAA"
    )
        port map (
      I0 => \^datawidth_match_gen.addr_cnt_i_reg[0]\,
      I1 => cycle_cnt_en_cmb37_out,
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => cycle_cnt_en_cmb38_out,
      I5 => \^fsm_sequential_crnt_state_reg[1]_0\,
      O => \^cycle_cnt_en\
    );
\PERBIT_GEN[1].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^trd_cnt_en\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(2),
      O => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      I1 => twph_cnt(1),
      O => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\
    );
\PERBIT_GEN[1].MUXCY_i1_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(13),
      O => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[1].MUXCY_i1_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^tpacc_cnt_en\,
      I1 => tpacc_cnt(1),
      O => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\
    );
\PERBIT_GEN[1].MUXCY_i1_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^twr_cnt_en\,
      I1 => p_0_in(1),
      O => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_2\
    );
\PERBIT_GEN[2].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^trd_cnt_en\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(1),
      O => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[2].MUXCY_i1_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^tpacc_cnt_en\,
      I1 => tpacc_cnt(2),
      O => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_3\
    );
\PERBIT_GEN[2].MUXCY_i1_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      I1 => twph_cnt(2),
      O => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_8\
    );
\PERBIT_GEN[2].MUXCY_i1_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_cnt_en\,
      I1 => p_0_in(2),
      O => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_15\
    );
\PERBIT_GEN[2].MUXCY_i1_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(12),
      O => \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[3].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^trd_cnt_en\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(0),
      O => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\
    );
\PERBIT_GEN[3].MUXCY_i1_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^tpacc_cnt_en\,
      I1 => tpacc_cnt(3),
      O => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_2\
    );
\PERBIT_GEN[3].MUXCY_i1_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_cnt_en\,
      I1 => p_0_in(3),
      O => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_14\
    );
\PERBIT_GEN[3].MUXCY_i1_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(11),
      O => \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[3].MUXCY_i1_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      I1 => twph_cnt(3),
      O => \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000002FFFFFFFF"
    )
        port map (
      I0 => crnt_state(3),
      I1 => crnt_state_reg(4),
      I2 => crnt_state(2),
      I3 => \^out\(1),
      I4 => \^out\(0),
      I5 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\,
      O => CE_5
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => twph_load,
      I1 => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      O => CE_10
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000008FFFFFFFF"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => read_complete_d_4,
      I2 => crnt_state(3),
      I3 => \^out\(0),
      I4 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_2_n_0\,
      I5 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_3\,
      O => CE_11
    );
\PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^out\(1),
      I1 => crnt_state(2),
      O => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_2_n_0\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF22F22222"
    )
        port map (
      I0 => \^fsm_sequential_crnt_state_reg[1]_0\,
      I1 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2__0_n_0\,
      I2 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      I3 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I4 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I5 => \^trd_cnt_en\,
      O => CE_0
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0D000000"
    )
        port map (
      I0 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2_n_0\,
      I1 => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\,
      I2 => crnt_state_reg(4),
      I3 => crnt_state(2),
      I4 => crnt_state(3),
      I5 => \^tpacc_cnt_en\,
      O => CE_1
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => twph_load,
      I1 => \^twr_cnt_en\,
      O => CE_12
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFDFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      I2 => bus2Mem_RdReq,
      I3 => trd_end,
      I4 => cycle_cnt(0),
      I5 => cycle_cnt(1),
      O => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2_n_0\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F30FF3FFFBFFFBFF"
    )
        port map (
      I0 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I1 => trd_end,
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_5_n_0\,
      I5 => bus2Mem_RdReq,
      O => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2__0_n_0\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000F0044"
    )
        port map (
      I0 => \^out\(0),
      I1 => next_state186_out,
      I2 => pend_wrreq_reg_2,
      I3 => \^out\(1),
      I4 => crnt_state(2),
      I5 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      O => twph_load
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^out\(0),
      I1 => crnt_state(2),
      I2 => \^out\(1),
      O => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => new_page_d1,
      I1 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      O => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_5_n_0\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000740000000000"
    )
        port map (
      I0 => trd_end,
      I1 => \^out\(0),
      I2 => bus2Mem_RdReq,
      I3 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\,
      I4 => crnt_state_reg(4),
      I5 => crnt_state(3),
      O => \^trd_cnt_en\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => crnt_state(3),
      I1 => crnt_state(2),
      I2 => crnt_state_reg(4),
      I3 => \^out\(1),
      I4 => \^out\(0),
      I5 => tpacc_end,
      O => \^tpacc_cnt_en\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => crnt_state(2),
      I1 => \^out\(1),
      I2 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I3 => \^out\(0),
      I4 => crnt_state(3),
      I5 => crnt_state_reg(4),
      O => \^twr_cnt_en\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404045504040404"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I1 => \PERBIT_GEN[4].MULT_AND_i1_i_2_n_0\,
      I2 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I3 => \PERBIT_GEN[4].MULT_AND_i1_i_3__0_n_0\,
      I4 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I5 => bus2ip_wr_req_reg_reg,
      O => \^perbit_gen[0].ff_rst0_gen.fdre_i1\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      O => \PERBIT_GEN[4].MULT_AND_i1_i_2_n_0\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => crnt_state(2),
      I1 => \^out\(1),
      O => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\
    );
\PERBIT_GEN[4].MULT_AND_i1_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      O => \PERBIT_GEN[4].MULT_AND_i1_i_3__0_n_0\
    );
\PERBIT_GEN[4].MUXCY_i1_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^tpacc_cnt_en\,
      I1 => tpacc_cnt(4),
      O => S
    );
\PERBIT_GEN[4].MUXCY_i1_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      I1 => twph_cnt(4),
      O => S_9
    );
\PERBIT_GEN[4].MUXCY_i1_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^twr_cnt_en\,
      I1 => p_0_in(4),
      O => S_13
    );
\PERBIT_GEN[4].MUXCY_i1_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(10),
      O => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[5].MUXCY_i1_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(9),
      O => \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[6].MUXCY_i1_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(8),
      O => \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[7].FF_RST0_GEN.FDRE_i1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"D"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => ip2bus_addrack,
      O => CE_17
    );
\PERBIT_GEN[7].MULT_AND_i1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAABAAAAAAAA"
    )
        port map (
      I0 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_i_3_n_0\,
      I1 => \^out\(1),
      I2 => crnt_state(2),
      I3 => \^out\(0),
      I4 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I5 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      O => \^read_req_ack_cmb\
    );
\PERBIT_GEN[7].MUXCY_i1_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(7),
      O => \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[8].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(6),
      O => \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\
    );
\PERBIT_GEN[9].MUXCY_i1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(5),
      O => \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000002"
    )
        port map (
      I0 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_2_n_0\,
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_3_n_0\,
      I2 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_4_n_0\,
      I3 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_5_n_0\,
      I4 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_6_n_0\,
      I5 => SR(0),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFA2FFFFFFFFFFFF"
    )
        port map (
      I0 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I1 => crnt_state(3),
      I2 => crnt_state_reg(4),
      I3 => crnt_state(2),
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_10_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA000000005504"
    )
        port map (
      I0 => crnt_state(2),
      I1 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\(0),
      I2 => next_state186_out,
      I3 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_11_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF20"
    )
        port map (
      I0 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\(0),
      I1 => read_complete_d_4,
      I2 => crnt_state_reg(4),
      I3 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_26_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_13_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5DFF5D00"
    )
        port map (
      I0 => \^out\(0),
      I1 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I2 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\,
      I3 => \^out\(1),
      I4 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_28_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_14_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1555FFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => bus2ip_wrreq_i,
      I2 => pend_wrreq_reg,
      I3 => s_axi_mem_wvalid,
      I4 => \^out\(1),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_16_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000D1F300000000"
    )
        port map (
      I0 => bus2Mem_RdReq,
      I1 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      I2 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\,
      I3 => \^new_page\,
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_17_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0FFFFBFB00000"
    )
        port map (
      I0 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_31_n_0\,
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_32_n_0\,
      I2 => crnt_state(2),
      I3 => \^fsm_sequential_crnt_state_reg[1]_1\,
      I4 => crnt_state(3),
      I5 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_33_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_18_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000050145104"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => crnt_state(3),
      I2 => \^out\(0),
      I3 => \^out\(1),
      I4 => crnt_state(2),
      I5 => read_complete_d_4,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_19_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F00000F0FB000B"
    )
        port map (
      I0 => crnt_state(3),
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_7_n_0\,
      I2 => crnt_state_reg(4),
      I3 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_8_n_0\,
      I4 => read_complete_d_4,
      I5 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_9_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_2_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFFFFFEFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => next_state174_out,
      I2 => bus2Mem_RdReq,
      I3 => temp_bus2ip_cs,
      I4 => bus2ip_wr_req_reg_reg,
      I5 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_34_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_21_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAEAAAA"
    )
        port map (
      I0 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_35_n_0\,
      I1 => crnt_state_reg(3),
      I2 => next_state181_out,
      I3 => next_state186_out,
      I4 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_22_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5EAE5EAE5E0E5EAE"
    )
        port map (
      I0 => crnt_state(2),
      I1 => \FSM_sequential_crnt_state_reg[0]_0\,
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      I5 => crnt_state_reg(3),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_23_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A0A080E"
    )
        port map (
      I0 => crnt_state(3),
      I1 => crnt_state(2),
      I2 => crnt_state_reg(4),
      I3 => \^out\(0),
      I4 => \^out\(1),
      O => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_26\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"006000E0"
    )
        port map (
      I0 => \^out\(1),
      I1 => crnt_state(2),
      I2 => crnt_state(3),
      I3 => crnt_state_reg(4),
      I4 => \^out\(0),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_26_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41414114"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => \^out\(1),
      I2 => crnt_state(2),
      I3 => \^out\(0),
      I4 => crnt_state(3),
      O => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1101010101010101"
    )
        port map (
      I0 => \^out\(0),
      I1 => next_state186_out,
      I2 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\,
      I3 => bus2Mem_RdReq,
      I4 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\,
      I5 => temp_bus2ip_cs,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_28_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000DDFD"
    )
        port map (
      I0 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_10_n_0\,
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_11_n_0\,
      I2 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_1\,
      I3 => \PERBIT_GEN[4].MULT_AND_i1_i_3__0_n_0\,
      I4 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I5 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_13_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_3_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF4FFF4F4F4FF"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_40_n_0\,
      I2 => transaction_complete_reg_i_5_n_0,
      I3 => temp_bus2ip_cs,
      I4 => pend_wrreq_reg_1,
      I5 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_3\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_30_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_31\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D1"
    )
        port map (
      I0 => bus2Mem_RdReq,
      I1 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      I2 => crnt_state_reg(0),
      I3 => \^out\(0),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_31_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBAAFBFFAAAAAAAA"
    )
        port map (
      I0 => \^out\(1),
      I1 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I2 => bus2Mem_RdReq,
      I3 => trd_end,
      I4 => read_break_reg,
      I5 => \^out\(0),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_32_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E4FFFFE5E40000"
    )
        port map (
      I0 => \^out\(1),
      I1 => \mem_a_int[31]_i_2_n_0\,
      I2 => \^out\(0),
      I3 => \FSM_sequential_emc_addr_ps_reg[2]_0\,
      I4 => crnt_state(2),
      I5 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_43_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_33_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"040400000000FF00"
    )
        port map (
      I0 => single_transaction,
      I1 => pend_wrreq_reg_1,
      I2 => \^next_state1\,
      I3 => crnt_state_reg(3),
      I4 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I5 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_34_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_35\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00007F0000000000"
    )
        port map (
      I0 => s_axi_mem_wvalid,
      I1 => pend_wrreq_reg,
      I2 => bus2ip_wrreq_i,
      I3 => crnt_state(2),
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_35_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_36\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45444440"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => crnt_state(2),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => crnt_state(3),
      O => crnt_state_reg(3)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101510151515151"
    )
        port map (
      I0 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_14_n_0\,
      I2 => crnt_state(2),
      I3 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_15_n_0\,
      I4 => \^out\(1),
      I5 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_16_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_4_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAEAAAA"
    )
        port map (
      I0 => transaction_complete_reg_i_2_n_0,
      I1 => transaction_complete_reg,
      I2 => next_state181_out,
      I3 => next_state186_out,
      I4 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I5 => transaction_complete_reg_i_4_n_0,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_40_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_41\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000C3E4"
    )
        port map (
      I0 => crnt_state(2),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => crnt_state(3),
      I4 => crnt_state_reg(4),
      O => crnt_state_reg(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00FFFFFFFF0300"
    )
        port map (
      I0 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I1 => next_state186_out,
      I2 => next_state181_out,
      I3 => crnt_state_reg(0),
      I4 => \^out\(0),
      I5 => \^out\(1),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_43_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F0F0F22222222"
    )
        port map (
      I0 => crnt_state_reg(0),
      I1 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I2 => next_state174_out,
      I3 => bus2ip_wrreq_i,
      I4 => pend_wrreq_reg,
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_2\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBAA"
    )
        port map (
      I0 => \^twr_rec_cnt_en_int\,
      I1 => \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_3_n_0\,
      I2 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_17_n_0\,
      I3 => \^fsm_sequential_crnt_state_reg[1]_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_5_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02C0020000000000"
    )
        port map (
      I0 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_2\,
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => crnt_state(2),
      I4 => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\,
      I5 => crnt_state_reg(4),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_7_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFD0FFD0"
    )
        port map (
      I0 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_21_n_0\,
      I1 => \mem_a_int[31]_i_2_n_0\,
      I2 => \^perbit_gen[0].ff_rst1_gen.fdse_i1_0\,
      I3 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_22_n_0\,
      I4 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_23_n_0\,
      I5 => crnt_state(3),
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_8_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080800080008000"
    )
        port map (
      I0 => crnt_state(3),
      I1 => crnt_state(2),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => crnt_state_reg(4),
      I5 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_9_n_0\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_15\: unisim.vcomponents.MUXF7
     port map (
      I0 => pend_wrreq_reg_0,
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_30_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_15_n_0\,
      S => \^out\(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_18_n_0\,
      I1 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_19_n_0\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]_i_6_n_0\,
      S => crnt_state_reg(4)
    );
\READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_complete_cmb,
      Q => read_complete_d_6,
      R => SR(0)
    );
\READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00020000AAAAAAAA"
    )
        port map (
      I0 => \^fsm_sequential_crnt_state_reg[1]_0\,
      I1 => bus2Mem_RdReq,
      I2 => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      I3 => \^out\(0),
      I4 => \^out\(1),
      I5 => \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_3_n_0\,
      O => read_complete_cmb
    );
\READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF702F7A2"
    )
        port map (
      I0 => \^out\(0),
      I1 => read_break_reg,
      I2 => trd_end,
      I3 => bus2Mem_RdReq,
      I4 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      I5 => \^out\(1),
      O => \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE_i_3_n_0\
    );
\READ_COMPLETE_PIPE_GEN[1].READ_COMPLETE_PIPE\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_complete_d_6,
      Q => read_complete_d_5,
      R => SR(0)
    );
\READ_COMPLETE_PIPE_GEN[2].READ_COMPLETE_PIPE\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_complete_d_5,
      Q => read_complete_d_4,
      R => SR(0)
    );
addr_sm_ns_IDLE_cmb_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0202020000000000"
    )
        port map (
      I0 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I1 => crnt_state_reg(4),
      I2 => crnt_state(3),
      I3 => s_axi_mem_awburst(1),
      I4 => s_axi_mem_awburst(0),
      I5 => bus2ip_wr_req_cmb0,
      O => enable_cs_cmb0
    );
addr_sm_ns_IDLE_cmb_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A80000A8A80000"
    )
        port map (
      I0 => \^pr_idle\,
      I1 => s_axi_mem_arburst(1),
      I2 => s_axi_mem_arburst(0),
      I3 => rw_flag_reg,
      I4 => s_axi_mem_arvalid,
      I5 => s_axi_mem_awvalid,
      O => \^enable_cs_cmb126_out\
    );
\bus2ip_addr_i[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00A80000"
    )
        port map (
      I0 => bus2ip_wr_req_cmb0,
      I1 => s_axi_mem_awburst(0),
      I2 => s_axi_mem_awburst(1),
      I3 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I4 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I5 => \^enable_cs_cmb126_out\,
      O => store_addr_info_cmb
    );
\mem_a_int[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001001"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => crnt_state(3),
      I2 => \^out\(0),
      I3 => crnt_state(2),
      I4 => \^out\(1),
      I5 => \mem_a_int[31]_i_2_n_0\,
      O => \^mem_a_int_reg[31]\
    );
\mem_a_int[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
        port map (
      I0 => \^out\(0),
      I1 => pend_wrreq_reg,
      I2 => bus2ip_wrreq_i,
      I3 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_3\,
      O => \mem_a_int[31]_i_2_n_0\
    );
\mem_ce_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE2AC4FFFE0000"
    )
        port map (
      I0 => crnt_state(3),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => crnt_state(2),
      I4 => crnt_state_reg(4),
      I5 => \mem_ce_reg[0]_i_2_n_0\,
      O => Mem_CE_int
    );
\mem_ce_reg[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55FF5DFDF5FF55FD"
    )
        port map (
      I0 => crnt_state(3),
      I1 => Bus2IP_RdReq_emc,
      I2 => \^out\(0),
      I3 => Bus2IP_RdReq_d1_reg_0,
      I4 => \^out\(1),
      I5 => crnt_state(2),
      O => \mem_ce_reg[0]_i_2_n_0\
    );
\mem_cen_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001D53B0001FFFF"
    )
        port map (
      I0 => crnt_state(3),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => crnt_state(2),
      I4 => crnt_state_reg(4),
      I5 => \mem_ce_reg[0]_i_2_n_0\,
      O => \mem_cen_reg_reg[0]\
    );
\mem_dq_t_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555114700000000"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => \^out\(1),
      I2 => crnt_state(2),
      I3 => \^out\(0),
      I4 => crnt_state(3),
      I5 => mem_dqt_t_d,
      O => \mem_dq_t_reg_reg[0]\(0)
    );
mem_dqt_t_d_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001BBEF"
    )
        port map (
      I0 => crnt_state(3),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      I3 => \^out\(1),
      I4 => crnt_state_reg(4),
      O => mem_WEN_cmb
    );
\mem_oen_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0500510155555555"
    )
        port map (
      I0 => \mem_oen_reg[0]_i_2_n_0\,
      I1 => Bus2IP_RdReq_emc,
      I2 => \^out\(0),
      I3 => Bus2IP_RdReq_d1_reg_0,
      I4 => \^out\(1),
      I5 => \^fsm_sequential_crnt_state_reg[1]_0\,
      O => \mem_oen_reg_reg[0]\
    );
\mem_oen_reg[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => \^out\(1),
      I2 => crnt_state(2),
      I3 => \^out\(0),
      I4 => crnt_state(3),
      O => \mem_oen_reg[0]_i_2_n_0\
    );
\mem_oen_reg[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => crnt_state(2),
      I2 => crnt_state(3),
      O => \^fsm_sequential_crnt_state_reg[1]_0\
    );
mem_rnw_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001EAEF"
    )
        port map (
      I0 => crnt_state(3),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      I3 => \^out\(1),
      I4 => crnt_state_reg(4),
      O => mem_RNW_cmb
    );
new_page_d1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"05030500"
    )
        port map (
      I0 => new_page_d1_i_2_n_0,
      I1 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I2 => crnt_state_reg(4),
      I3 => crnt_state(3),
      I4 => new_page_d1,
      O => \^new_page\
    );
new_page_d1_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"50FF50DF"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      I3 => new_page_d1,
      I4 => tpacc_end,
      O => new_page_d1_i_2_n_0
    );
new_page_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^new_page\,
      Q => new_page_d1,
      R => SR(0)
    );
pend_rdreq_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => bus2ip_burst_reg,
      I1 => \^read_req_ack_cmb\,
      I2 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\,
      O => pend_rdreq_reg
    );
read_ack_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_ack_cmb,
      Q => read_ack,
      R => SR(0)
    );
read_break_reg_d1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7070707070737070"
    )
        port map (
      I0 => read_break_reg_d1_i_2_n_0,
      I1 => read_break_reg_d1_i_3_n_0,
      I2 => \^read_break_reg_d1\,
      I3 => \FSM_sequential_crnt_state[3]_i_3_n_0\,
      I4 => \^bus2ip_rdreq_d1\,
      I5 => \FSM_sequential_emc_addr_ps_reg[2]_1\,
      O => read_break_reg
    );
read_break_reg_d1_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF01"
    )
        port map (
      I0 => \^out\(1),
      I1 => crnt_state(2),
      I2 => \^out\(0),
      I3 => crnt_state_reg(4),
      I4 => crnt_state(3),
      O => read_break_reg_d1_i_2_n_0
    );
read_break_reg_d1_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => crnt_state(3),
      O => read_break_reg_d1_i_3_n_0
    );
read_break_reg_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_break_reg,
      Q => \^read_break_reg_d1\,
      R => SR(0)
    );
read_data_en_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00800A8000800080"
    )
        port map (
      I0 => \^fsm_sequential_crnt_state_reg[1]_0\,
      I1 => trd_end,
      I2 => \^out\(0),
      I3 => \^out\(1),
      I4 => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\,
      I5 => tpacc_end,
      O => \^read_data_en_cmb\
    );
read_data_en_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^read_data_en_cmb\,
      Q => read_data_en,
      R => SR(0)
    );
rw_flag_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5FFFFFF0C000000"
    )
        port map (
      I0 => s_axi_mem_awvalid,
      I1 => s_axi_mem_arvalid,
      I2 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I3 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      I4 => addr_sm_ps_IDLE_reg,
      I5 => rw_flag_reg,
      O => rw_flag_reg_reg
    );
s_axi_mem_awready_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^out\(1),
      I1 => crnt_state(2),
      I2 => \^out\(0),
      I3 => crnt_state_reg(4),
      I4 => crnt_state(3),
      O => \^pr_idle\
    );
s_axi_mem_wready_INST_0_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^write_req_addr_ack_cmb\,
      O => Write_req_data_ack_cmb
    );
s_axi_mem_wready_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \ADDRESS_STORE_GEN[0].ADDRESS_REG_i_2_n_0\,
      I1 => \^out\(0),
      I2 => single_transaction,
      I3 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\,
      I4 => p_85_in,
      I5 => s_axi_mem_wready_INST_0_i_5_n_0,
      O => \^write_req_addr_ack_cmb\
    );
s_axi_mem_wready_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \^out\(1),
      I1 => crnt_state(2),
      I2 => crnt_state_reg(4),
      I3 => crnt_state(3),
      O => s_axi_mem_wready_INST_0_i_5_n_0
    );
transaction_complete_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF11111110"
    )
        port map (
      I0 => crnt_state(3),
      I1 => crnt_state_reg(4),
      I2 => transaction_complete_reg_i_2_n_0,
      I3 => transaction_complete_reg_i_3_n_0,
      I4 => transaction_complete_reg_i_4_n_0,
      I5 => transaction_complete_reg_i_5_n_0,
      O => transaction_complete
    );
transaction_complete_reg_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA28"
    )
        port map (
      I0 => transaction_complete_reg,
      I1 => \^out\(0),
      I2 => \^out\(1),
      I3 => crnt_state(2),
      O => transaction_complete_reg_i_2_n_0
    );
transaction_complete_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00002AAA00000000"
    )
        port map (
      I0 => transaction_complete_reg,
      I1 => bus2Mem_RdReq,
      I2 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\,
      I3 => temp_bus2ip_cs,
      I4 => next_state186_out,
      I5 => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_4__0_n_0\,
      O => transaction_complete_reg_i_3_n_0
    );
transaction_complete_reg_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000088880800"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => p_0_in_0(0),
      I3 => p_0_in_0(1),
      I4 => transaction_complete_reg,
      I5 => crnt_state(2),
      O => transaction_complete_reg_i_4_n_0
    );
transaction_complete_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFB080000"
    )
        port map (
      I0 => transaction_complete_reg_i_6_n_0,
      I1 => crnt_state(2),
      I2 => \^out\(0),
      I3 => transaction_complete_reg,
      I4 => crnt_state(3),
      I5 => crnt_state_reg(4),
      O => transaction_complete_reg_i_5_n_0
    );
transaction_complete_reg_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => p_0_in_0(1),
      I2 => transaction_complete_reg,
      O => transaction_complete_reg_i_6_n_0
    );
transaction_complete_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => transaction_complete,
      Q => transaction_complete_reg,
      R => SR(0)
    );
transaction_done_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000033B8"
    )
        port map (
      I0 => read_complete_d_4,
      I1 => crnt_state_reg(4),
      I2 => transaction_done_cmb17_out,
      I3 => crnt_state(3),
      I4 => \^out\(0),
      I5 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_i_2_n_0\,
      O => transaction_done_cmb
    );
transaction_done_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => transaction_done_cmb,
      Q => transaction_done_i,
      R => SR(0)
    );
wlast_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000FF80"
    )
        port map (
      I0 => bus2ip_wr_req_reg_reg_0,
      I1 => \^out\(1),
      I2 => wlast_reg_i_3_n_0,
      I3 => wlast_reg_i_4_n_0,
      I4 => \FSM_sequential_crnt_state[1]_i_5_n_0\,
      I5 => wlast_reg_i_5_n_0,
      O => wlast
    );
wlast_reg_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => crnt_state(2),
      I1 => \^out\(0),
      O => wlast_reg_i_3_n_0
    );
wlast_reg_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5540AA800000AA80"
    )
        port map (
      I0 => crnt_state(2),
      I1 => s_axi_mem_wvalid,
      I2 => s_axi_mem_wlast,
      I3 => \^wlast_reg\,
      I4 => \^out\(1),
      I5 => \^out\(0),
      O => wlast_reg_i_4_n_0
    );
wlast_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00EB00FE00AF00"
    )
        port map (
      I0 => crnt_state_reg(4),
      I1 => \^out\(0),
      I2 => crnt_state(2),
      I3 => \^wlast_reg\,
      I4 => crnt_state(3),
      I5 => \^out\(1),
      O => wlast_reg_i_5_n_0
    );
wlast_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => wlast,
      Q => \^wlast_reg\,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_mem_steer is
  port (
    \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mem_dqt_t_d : out STD_LOGIC;
    \mem_dq_o_reg_reg[0]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    data_strobe_c : in STD_LOGIC;
    \bus2ip_data_reg_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    readreq_th_reset : in STD_LOGIC;
    read_ack : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    read_data_en : in STD_LOGIC;
    mem_WEN_cmb : in STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    bus2ip_reset_reg : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end design_1_axi_emc_0_0_mem_steer;

architecture STRUCTURE of design_1_axi_emc_0_0_mem_steer is
  signal A : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \DATA_STORE_GEN[0].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[10].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[11].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[12].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[13].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[14].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[15].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[16].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[17].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[18].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[19].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[1].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[20].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[21].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[22].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[23].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[24].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[25].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[26].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[27].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[28].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[29].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[2].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[30].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[31].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[3].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[4].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[5].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[6].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[7].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[8].WRDATA_REG__0\ : STD_LOGIC;
  signal \DATA_STORE_GEN[9].WRDATA_REG__0\ : STD_LOGIC;
  signal addr_cnt_d1 : STD_LOGIC_VECTOR ( 0 to 1 );
  signal mux4_out : STD_LOGIC_VECTOR ( 6 downto 4 );
  signal read_ack_d_4 : STD_LOGIC;
  signal read_data_en_d_3 : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[0].RDACK_PIPE_ASYNC\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[0].RDACK_PIPE_ASYNC\ : label is "FDR";
  attribute BOX_TYPE of \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC\ : label is "FDR";
  attribute BOX_TYPE of \DATA_STORE_GEN[0].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[10].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[11].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[12].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[13].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[14].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[15].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[16].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[17].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[18].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[19].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[1].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[20].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[21].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[22].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[23].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[24].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[25].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[26].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[27].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[28].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[29].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[2].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[30].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[31].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[3].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[4].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[5].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[6].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[7].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[8].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \DATA_STORE_GEN[9].WRDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[0].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[1].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[2].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[3].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[4].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[5].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[6].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[0].RDDATA_BYTE_GEN[7].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[0].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[1].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[2].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[3].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[4].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[5].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[6].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[1].RDDATA_BYTE_GEN[7].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[0].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[1].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[2].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[3].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[4].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[5].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[6].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[2].RDDATA_BYTE_GEN[7].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[0].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[1].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[2].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[3].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[4].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[5].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[6].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_GEN[3].RDDATA_BYTE_GEN[7].RDDATA_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.RDDATA_EN_GEN_ASYNC[0].RDDATA_EN_REG_ASYNC\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.RDDATA_EN_GEN_ASYNC[0].RDDATA_EN_REG_ASYNC\ : label is "FDR";
begin
\ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[0].RDACK_PIPE_ASYNC\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_ack,
      Q => read_ack_d_4,
      R => readreq_th_reset
    );
\ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_ack_d_4,
      Q => \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\,
      R => readreq_th_reset
    );
\DATA_STORE_GEN[0].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(7),
      Q => \DATA_STORE_GEN[0].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[10].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(13),
      Q => \DATA_STORE_GEN[10].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[11].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(12),
      Q => \DATA_STORE_GEN[11].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[12].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(11),
      Q => \DATA_STORE_GEN[12].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[13].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(10),
      Q => \DATA_STORE_GEN[13].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[14].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(9),
      Q => \DATA_STORE_GEN[14].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[15].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(8),
      Q => \DATA_STORE_GEN[15].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[16].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(23),
      Q => \DATA_STORE_GEN[16].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[17].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(22),
      Q => \DATA_STORE_GEN[17].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[18].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(21),
      Q => \DATA_STORE_GEN[18].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[19].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(20),
      Q => \DATA_STORE_GEN[19].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[1].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(6),
      Q => \DATA_STORE_GEN[1].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[20].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(19),
      Q => \DATA_STORE_GEN[20].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[21].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(18),
      Q => \DATA_STORE_GEN[21].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[22].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(17),
      Q => \DATA_STORE_GEN[22].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[23].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(16),
      Q => \DATA_STORE_GEN[23].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[24].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(31),
      Q => \DATA_STORE_GEN[24].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[25].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(30),
      Q => \DATA_STORE_GEN[25].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[26].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(29),
      Q => \DATA_STORE_GEN[26].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[27].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(28),
      Q => \DATA_STORE_GEN[27].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[28].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(27),
      Q => \DATA_STORE_GEN[28].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[29].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(26),
      Q => \DATA_STORE_GEN[29].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[2].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(5),
      Q => \DATA_STORE_GEN[2].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[30].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(25),
      Q => \DATA_STORE_GEN[30].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[31].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(24),
      Q => \DATA_STORE_GEN[31].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[3].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(4),
      Q => \DATA_STORE_GEN[3].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[4].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(3),
      Q => \DATA_STORE_GEN[4].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[5].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(2),
      Q => \DATA_STORE_GEN[5].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[6].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(1),
      Q => \DATA_STORE_GEN[6].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[7].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(0),
      Q => \DATA_STORE_GEN[7].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[8].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(15),
      Q => \DATA_STORE_GEN[8].WRDATA_REG__0\,
      R => SR(0)
    );
\DATA_STORE_GEN[9].WRDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => \bus2ip_data_reg_reg[31]\(14),
      Q => \DATA_STORE_GEN[9].WRDATA_REG__0\,
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[0].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(15),
      Q => D(31),
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[0].RDDATA_REG_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => A(0),
      I1 => A(1),
      I2 => read_data_en_d_3,
      O => mux4_out(6)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[1].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(14),
      Q => D(30),
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[2].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(13),
      Q => D(29),
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[3].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(12),
      Q => D(28),
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[4].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(11),
      Q => D(27),
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[5].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(10),
      Q => D(26),
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[6].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(9),
      Q => D(25),
      R => SR(0)
    );
\RDDATA_GEN[0].RDDATA_BYTE_GEN[7].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(8),
      Q => D(24),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[0].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(7),
      Q => D(23),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[1].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(6),
      Q => D(22),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[2].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(5),
      Q => D(21),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[3].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(4),
      Q => D(20),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[4].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(3),
      Q => D(19),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[5].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(2),
      Q => D(18),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[6].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(1),
      Q => D(17),
      R => SR(0)
    );
\RDDATA_GEN[1].RDDATA_BYTE_GEN[7].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(6),
      D => Q(0),
      Q => D(16),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[0].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(15),
      Q => D(15),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[0].RDDATA_REG_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => A(1),
      I1 => A(0),
      I2 => read_data_en_d_3,
      O => mux4_out(4)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[1].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(14),
      Q => D(14),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[2].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(13),
      Q => D(13),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[3].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(12),
      Q => D(12),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[4].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(11),
      Q => D(11),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[5].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(10),
      Q => D(10),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[6].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(9),
      Q => D(9),
      R => SR(0)
    );
\RDDATA_GEN[2].RDDATA_BYTE_GEN[7].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(8),
      Q => D(8),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[0].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(7),
      Q => D(7),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[1].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(6),
      Q => D(6),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[2].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(5),
      Q => D(5),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[3].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(4),
      Q => D(4),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[4].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(3),
      Q => D(3),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[5].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(2),
      Q => D(2),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[6].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(1),
      Q => D(1),
      R => SR(0)
    );
\RDDATA_GEN[3].RDDATA_BYTE_GEN[7].RDDATA_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => mux4_out(4),
      D => Q(0),
      Q => D(0),
      R => SR(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.RDDATA_EN_GEN_ASYNC[0].RDDATA_EN_REG_ASYNC\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => read_data_en,
      Q => read_data_en_d_3,
      R => SR(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      Q => addr_cnt_d1(0),
      R => bus2ip_reset_reg(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      Q => addr_cnt_d1(1),
      R => bus2ip_reset_reg(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_cnt_d1(0),
      Q => A(1),
      R => bus2ip_reset_reg(0)
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_cnt_d1(1),
      Q => A(0),
      R => bus2ip_reset_reg(0)
    );
\mem_dq_o_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[0].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[16].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(15)
    );
\mem_dq_o_reg[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[10].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[26].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(5)
    );
\mem_dq_o_reg[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[11].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[27].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(4)
    );
\mem_dq_o_reg[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[12].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[28].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(3)
    );
\mem_dq_o_reg[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[13].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[29].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(2)
    );
\mem_dq_o_reg[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[14].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[30].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(1)
    );
\mem_dq_o_reg[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[15].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[31].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(0)
    );
\mem_dq_o_reg[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[1].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[17].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(14)
    );
\mem_dq_o_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[2].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[18].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(13)
    );
\mem_dq_o_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[3].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[19].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(12)
    );
\mem_dq_o_reg[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[4].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[20].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(11)
    );
\mem_dq_o_reg[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[5].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[21].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(10)
    );
\mem_dq_o_reg[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[6].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[22].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(9)
    );
\mem_dq_o_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[7].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[23].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(8)
    );
\mem_dq_o_reg[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[8].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[24].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(7)
    );
\mem_dq_o_reg[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0E02"
    )
        port map (
      I0 => \DATA_STORE_GEN[9].WRDATA_REG__0\,
      I1 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0),
      I2 => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1),
      I3 => \DATA_STORE_GEN[25].WRDATA_REG__0\,
      O => \mem_dq_o_reg_reg[0]\(6)
    );
mem_dqt_t_d_reg: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => mem_WEN_cmb,
      Q => mem_dqt_t_d,
      S => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_addr_counter_mux is
  port (
    read_ack_reg_reg : out STD_LOGIC;
    read_ack_reg_reg_0 : out STD_LOGIC;
    \ADDRESS_STORE_GEN[0].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[1].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[2].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[3].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[4].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[5].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[6].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[7].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[8].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[9].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[10].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[11].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[12].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[13].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[14].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[15].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[16].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[17].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[18].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[19].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[20].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[21].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[22].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[23].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[24].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[25].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[26].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[27].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[28].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[29].ADDRESS_REG__0\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[0]\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    read_data_en_reg_reg : out STD_LOGIC;
    read_req_ack_cmb42_out : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]_0\ : out STD_LOGIC;
    read_ack_cmb : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    addr_cnt_rst_cmb : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : out STD_LOGIC;
    \mem_ben_reg_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Cycle_cnt_en_int : in STD_LOGIC;
    S_0 : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    data_strobe_c : in STD_LOGIC;
    bus2ip_addr_temp : in STD_LOGIC_VECTOR ( 29 downto 0 );
    bus2ip_ben_fixed : in STD_LOGIC_VECTOR ( 0 to 3 );
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[2]\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    pend_wrreq_reg : in STD_LOGIC;
    single_transaction : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC;
    tpacc_end : in STD_LOGIC;
    new_page : in STD_LOGIC;
    bus2Mem_RdReq : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]\ : in STD_LOGIC;
    trd_end : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]\ : in STD_LOGIC;
    bus2ip_wr_req_reg_reg : in STD_LOGIC;
    read_data_en_cmb : in STD_LOGIC;
    mem_WEN_cmb : in STD_LOGIC;
    pend_wrreq_reg_0 : in STD_LOGIC;
    bus2ip_wrreq_i : in STD_LOGIC;
    \bus2ip_BE_reg_reg[0]\ : in STD_LOGIC;
    Type_of_xfer : in STD_LOGIC;
    \bus2ip_BE_reg_reg[3]\ : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[4]\ : in STD_LOGIC;
    addr_cnt_ce : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[4]_0\ : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]_0\ : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[2]_0\ : in STD_LOGIC
  );
end design_1_axi_emc_0_0_addr_counter_mux;

architecture STRUCTURE of design_1_axi_emc_0_0_addr_counter_mux is
  signal \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\ : STD_LOGIC;
  signal \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bus2ip_ben_int : STD_LOGIC_VECTOR ( 0 to 3 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[0].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[10].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[11].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[12].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[13].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[14].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[15].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[16].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[17].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[18].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[19].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[1].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[20].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[21].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[22].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[23].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[24].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[25].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[26].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[27].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[28].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[29].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[2].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[3].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[4].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[5].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[6].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[7].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[8].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ADDRESS_STORE_GEN[9].ADDRESS_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \BEN_STORE_GEN[0].BEN_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \BEN_STORE_GEN[1].BEN_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \BEN_STORE_GEN[2].BEN_REG\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \BEN_STORE_GEN[3].BEN_REG\ : label is "PRIMITIVE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mem_ben_reg[0]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \mem_ben_reg[1]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \mem_qwen_reg[0]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \mem_qwen_reg[1]_i_1\ : label is "soft_lutpair62";
begin
  \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]\ <= \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\;
  \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\(0) <= \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0);
\ADDRESS_STORE_GEN[0].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(29),
      Q => \ADDRESS_STORE_GEN[0].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[10].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(19),
      Q => \ADDRESS_STORE_GEN[10].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[11].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(18),
      Q => \ADDRESS_STORE_GEN[11].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[12].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(17),
      Q => \ADDRESS_STORE_GEN[12].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[13].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(16),
      Q => \ADDRESS_STORE_GEN[13].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[14].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(15),
      Q => \ADDRESS_STORE_GEN[14].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[15].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(14),
      Q => \ADDRESS_STORE_GEN[15].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[16].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(13),
      Q => \ADDRESS_STORE_GEN[16].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[17].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(12),
      Q => \ADDRESS_STORE_GEN[17].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[18].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(11),
      Q => \ADDRESS_STORE_GEN[18].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[19].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(10),
      Q => \ADDRESS_STORE_GEN[19].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[1].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(28),
      Q => \ADDRESS_STORE_GEN[1].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[20].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(9),
      Q => \ADDRESS_STORE_GEN[20].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[21].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(8),
      Q => \ADDRESS_STORE_GEN[21].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[22].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(7),
      Q => \ADDRESS_STORE_GEN[22].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[23].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(6),
      Q => \ADDRESS_STORE_GEN[23].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[24].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(5),
      Q => \ADDRESS_STORE_GEN[24].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[25].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(4),
      Q => \ADDRESS_STORE_GEN[25].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[26].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(3),
      Q => \ADDRESS_STORE_GEN[26].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[27].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(2),
      Q => \ADDRESS_STORE_GEN[27].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[28].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(1),
      Q => \ADDRESS_STORE_GEN[28].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[29].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(0),
      Q => \ADDRESS_STORE_GEN[29].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[2].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(27),
      Q => \ADDRESS_STORE_GEN[2].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[3].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(26),
      Q => \ADDRESS_STORE_GEN[3].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[4].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(25),
      Q => \ADDRESS_STORE_GEN[4].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[5].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(24),
      Q => \ADDRESS_STORE_GEN[5].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[6].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(23),
      Q => \ADDRESS_STORE_GEN[6].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[7].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(22),
      Q => \ADDRESS_STORE_GEN[7].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[8].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(21),
      Q => \ADDRESS_STORE_GEN[8].ADDRESS_REG__0\,
      R => SR(0)
    );
\ADDRESS_STORE_GEN[9].ADDRESS_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_addr_temp(20),
      Q => \ADDRESS_STORE_GEN[9].ADDRESS_REG__0\,
      R => SR(0)
    );
\BEN_STORE_GEN[0].BEN_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_ben_fixed(0),
      Q => bus2ip_ben_int(0),
      R => SR(0)
    );
\BEN_STORE_GEN[1].BEN_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_ben_fixed(1),
      Q => bus2ip_ben_int(1),
      R => SR(0)
    );
\BEN_STORE_GEN[2].BEN_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_ben_fixed(2),
      Q => bus2ip_ben_int(2),
      R => SR(0)
    );
\BEN_STORE_GEN[3].BEN_REG\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => data_strobe_c,
      D => bus2ip_ben_fixed(3),
      Q => bus2ip_ben_int(3),
      R => SR(0)
    );
\DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I\: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized0\
     port map (
      CE => CE,
      Cycle_cnt_en_int => Cycle_cnt_en_int,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]_0\,
      \FSM_sequential_crnt_state_reg[0]\ => \FSM_sequential_crnt_state_reg[0]\,
      \FSM_sequential_crnt_state_reg[1]\ => \FSM_sequential_crnt_state_reg[1]\,
      \FSM_sequential_crnt_state_reg[2]\ => \FSM_sequential_crnt_state_reg[2]\,
      \FSM_sequential_emc_addr_ps_reg[2]\ => \FSM_sequential_emc_addr_ps_reg[2]\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\,
      SR(0) => SR(0),
      S_0 => S_0,
      addr_cnt_rst_cmb => addr_cnt_rst_cmb,
      bus2Mem_RdReq => bus2Mem_RdReq,
      bus2ip_wr_req_reg_reg => bus2ip_wr_req_reg_reg,
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      new_page => new_page,
      \out\(0) => \out\(0),
      pend_wrreq_reg => pend_wrreq_reg,
      pend_wrreq_reg_0 => pend_wrreq_reg_0,
      read_ack_cmb => read_ack_cmb,
      read_ack_reg_reg => read_ack_reg_reg,
      read_ack_reg_reg_0 => read_ack_reg_reg_0,
      read_data_en_cmb => read_data_en_cmb,
      read_data_en_reg_reg => read_data_en_reg_reg,
      read_req_ack_cmb42_out => read_req_ack_cmb42_out,
      s_axi_aclk => s_axi_aclk,
      single_transaction => single_transaction,
      tpacc_end => tpacc_end,
      trd_end => trd_end
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1111331322220020"
    )
        port map (
      I0 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0),
      I1 => \FSM_sequential_crnt_state_reg[4]\,
      I2 => \FSM_sequential_crnt_state_reg[4]_0\,
      I3 => \FSM_sequential_crnt_state_reg[1]_0\,
      I4 => \FSM_sequential_crnt_state_reg[2]_0\,
      I5 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\,
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_1_n_0\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"400040FF40FF4000"
    )
        port map (
      I0 => \bus2ip_BE_reg_reg[0]\,
      I1 => Type_of_xfer,
      I2 => \bus2ip_BE_reg_reg[3]\,
      I3 => \FSM_sequential_crnt_state_reg[4]\,
      I4 => addr_cnt_ce,
      I5 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0),
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_1_n_0\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DATAWIDTH_MATCH_GEN.addr_cnt_i[0]_i_1_n_0\,
      Q => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\,
      R => SR(0)
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_1_n_0\,
      Q => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0),
      R => SR(0)
    );
\mem_ben_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CDFD"
    )
        port map (
      I0 => bus2ip_ben_int(0),
      I1 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\,
      I2 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0),
      I3 => bus2ip_ben_int(2),
      O => \mem_ben_reg_reg[0]\(1)
    );
\mem_ben_reg[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CDFD"
    )
        port map (
      I0 => bus2ip_ben_int(1),
      I1 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\,
      I2 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0),
      I3 => bus2ip_ben_int(3),
      O => \mem_ben_reg_reg[0]\(0)
    );
\mem_qwen_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAEBF"
    )
        port map (
      I0 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\,
      I1 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0),
      I2 => bus2ip_ben_int(2),
      I3 => bus2ip_ben_int(0),
      I4 => mem_WEN_cmb,
      O => D(1)
    );
\mem_qwen_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAEBF"
    )
        port map (
      I0 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[0]\,
      I1 => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]_0\(0),
      I2 => bus2ip_ben_int(3),
      I3 => bus2ip_ben_int(1),
      I4 => mem_WEN_cmb,
      O => D(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_counters is
  port (
    p_0_in : out STD_LOGIC_VECTOR ( 0 to 4 );
    twph_cnt : out STD_LOGIC_VECTOR ( 0 to 4 );
    read_data_en_reg_reg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    tpacc_cnt : out STD_LOGIC_VECTOR ( 0 to 4 );
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC_VECTOR ( 14 downto 0 );
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ : out STD_LOGIC;
    trd_end : out STD_LOGIC;
    tpacc_end : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[0]\ : out STD_LOGIC;
    \PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]_0\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    p_85_in : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\ : out STD_LOGIC;
    cycle_cnt_en_cmb38_out : out STD_LOGIC;
    cycle_cnt_en_cmb37_out : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]_0\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ : out STD_LOGIC;
    twr_cnt_en : in STD_LOGIC;
    S : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[3]\ : in STD_LOGIC;
    S_0 : in STD_LOGIC;
    \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_1\ : in STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_2\ : in STD_LOGIC;
    CE_3 : in STD_LOGIC;
    CE_4 : in STD_LOGIC;
    trd_cnt_en : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_5\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_6\ : in STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_8\ : in STD_LOGIC;
    CE_9 : in STD_LOGIC;
    tpacc_cnt_en : in STD_LOGIC;
    S_10 : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_11\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_12\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_13\ : in STD_LOGIC;
    CE_14 : in STD_LOGIC;
    twr_rec_cnt_en_int : in STD_LOGIC;
    \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_1\ : in STD_LOGIC;
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\ : in STD_LOGIC;
    CE_15 : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    bus2Mem_RdReq : in STD_LOGIC;
    next_state1 : in STD_LOGIC;
    pend_wrreq_reg : in STD_LOGIC;
    bus2ip_wrreq_i : in STD_LOGIC;
    single_transaction : in STD_LOGIC;
    pend_wrreq_reg_0 : in STD_LOGIC;
    crnt_state_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC;
    temp_bus2ip_cs : in STD_LOGIC
  );
end design_1_axi_emc_0_0_counters;

architecture STRUCTURE of design_1_axi_emc_0_0_counters is
  signal \^datawidth_match_gen.addr_cnt_i_reg[0]_0\ : STD_LOGIC;
  signal \^tpacc_end\ : STD_LOGIC;
begin
  \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]_0\ <= \^datawidth_match_gen.addr_cnt_i_reg[0]_0\;
  tpacc_end <= \^tpacc_end\;
THZCNT_I: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized2\
     port map (
      CE_15 => CE_15,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ => \^datawidth_match_gen.addr_cnt_i_reg[0]_0\,
      SR(0) => SR(0),
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      \out\(0) => \out\(0),
      p_85_in => p_85_in,
      pend_wrreq_reg => pend_wrreq_reg,
      pend_wrreq_reg_0 => pend_wrreq_reg_0,
      s_axi_aclk => s_axi_aclk
    );
TLZCNT_I: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized2_0\
     port map (
      CE_4 => CE_4,
      \FSM_sequential_crnt_state_reg[1]\ => \FSM_sequential_crnt_state_reg[1]\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\,
      SR(0) => SR(0),
      s_axi_aclk => s_axi_aclk,
      temp_bus2ip_cs => temp_bus2ip_cs
    );
TPACCCNT_I: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized1\
     port map (
      CE_14 => CE_14,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_13\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_13\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_12\ => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_12\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_11\ => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_11\,
      \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\ => \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\,
      SR(0) => SR(0),
      S_10 => S_10,
      cycle_cnt_en_cmb38_out => cycle_cnt_en_cmb38_out,
      read_data_en_reg_reg => tpacc_cnt(4),
      read_data_en_reg_reg_0 => tpacc_cnt(3),
      read_data_en_reg_reg_1 => tpacc_cnt(2),
      read_data_en_reg_reg_2 => tpacc_cnt(1),
      read_data_en_reg_reg_3 => tpacc_cnt(0),
      s_axi_aclk => s_axi_aclk,
      tpacc_cnt_en => tpacc_cnt_en,
      tpacc_end => \^tpacc_end\
    );
TRDCNT_I: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized1_1\
     port map (
      CE_9 => CE_9,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_8\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_8\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\ => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_6\ => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_6\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_5\ => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_5\,
      SR(0) => SR(0),
      bus2Mem_RdReq => bus2Mem_RdReq,
      cycle_cnt_en_cmb37_out => cycle_cnt_en_cmb37_out,
      \out\(1 downto 0) => \out\(1 downto 0),
      read_data_en_reg_reg => read_data_en_reg_reg(2),
      read_data_en_reg_reg_0 => read_data_en_reg_reg(0),
      read_data_en_reg_reg_1 => read_data_en_reg_reg(1),
      read_data_en_reg_reg_2(0) => read_data_en_reg_reg(3),
      s_axi_aclk => s_axi_aclk,
      tpacc_end => \^tpacc_end\,
      trd_cnt_en => trd_cnt_en,
      trd_end => trd_end
    );
TWPHCNT_I: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized2_2\
     port map (
      CE_3 => CE_3,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ => \^datawidth_match_gen.addr_cnt_i_reg[0]_0\,
      \FSM_sequential_crnt_state_reg[0]\ => \FSM_sequential_crnt_state_reg[0]\,
      \FSM_sequential_crnt_state_reg[3]\ => \FSM_sequential_crnt_state_reg[3]\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => twph_cnt(0),
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_2\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_2\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ => twph_cnt(1),
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\ => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1_0\ => twph_cnt(2),
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_1\ => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_1\,
      \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1_0\ => twph_cnt(3),
      \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1_1\ => \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ => twph_cnt(4),
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\,
      SR(0) => SR(0),
      S_0 => S_0,
      crnt_state_reg(0) => crnt_state_reg(0),
      next_state1 => next_state1,
      pend_wrreq_reg => pend_wrreq_reg_0,
      s_axi_aclk => s_axi_aclk,
      single_transaction => single_transaction
    );
TWRCNT_I: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized1_3\
     port map (
      CE => CE,
      \FSM_sequential_crnt_state_reg[1]\ => \FSM_sequential_crnt_state_reg[1]_0\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      S => S,
      SR(0) => SR(0),
      p_0_in(0 to 4) => p_0_in(0 to 4),
      s_axi_aclk => s_axi_aclk,
      twr_cnt_en => twr_cnt_en
    );
T_WRREC_CNT_I: entity work.\design_1_axi_emc_0_0_ld_arith_reg__parameterized3\
     port map (
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\(14 downto 0) => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(14 downto 0),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\ => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\,
      \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_1\,
      \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1_0\ => \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\,
      SR(0) => SR(0),
      \out\(0) => \out\(0),
      s_axi_aclk => s_axi_aclk,
      twr_rec_cnt_en_int => twr_rec_cnt_en_int
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_ipic_if is
  port (
    burst_cnt_i : out STD_LOGIC_VECTOR ( 0 to 7 );
    ip2bus_rdack : out STD_LOGIC;
    pend_rdreq : out STD_LOGIC;
    pend_wrreq_reg_0 : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]\ : out STD_LOGIC;
    pend_rdreq_reg_0 : out STD_LOGIC;
    next_state186_out : out STD_LOGIC;
    wlast_reg_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ip2bus_addrack : in STD_LOGIC;
    S : in STD_LOGIC;
    \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    reset_fifo : in STD_LOGIC;
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    IP2Bus_RdAck0 : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    \FSM_sequential_crnt_state_reg[4]\ : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    bus2ip_wrreq_i : in STD_LOGIC;
    next_state1 : in STD_LOGIC;
    single_transaction : in STD_LOGIC;
    \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    temp_bus2ip_cs : in STD_LOGIC;
    s_axi_mem_wvalid : in STD_LOGIC;
    s_axi_mem_wlast : in STD_LOGIC;
    wlast_reg : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end design_1_axi_emc_0_0_ipic_if;

architecture STRUCTURE of design_1_axi_emc_0_0_ipic_if is
  signal \^fsm_sequential_crnt_state_reg[1]\ : STD_LOGIC;
  signal \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_39_n_0\ : STD_LOGIC;
  signal \^pend_wrreq_reg_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_39\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of s_axi_mem_wready_INST_0_i_7 : label is "soft_lutpair63";
begin
  \FSM_sequential_crnt_state_reg[1]\ <= \^fsm_sequential_crnt_state_reg[1]\;
  pend_wrreq_reg_0 <= \^pend_wrreq_reg_0\;
BURST_CNT: entity work.design_1_axi_emc_0_0_ld_arith_reg
     port map (
      CE => CE,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\,
      S => S,
      burst_cnt_i(0 to 7) => burst_cnt_i(0 to 7),
      ip2bus_addrack => ip2bus_addrack,
      pend_rdreq_reg => pend_rdreq_reg_0,
      reset_fifo => reset_fifo,
      s_axi_aclk => s_axi_aclk
    );
\IP2Bus_Data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(31),
      Q => Q(31),
      R => SR(0)
    );
\IP2Bus_Data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(21),
      Q => Q(21),
      R => SR(0)
    );
\IP2Bus_Data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(20),
      Q => Q(20),
      R => SR(0)
    );
\IP2Bus_Data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(19),
      Q => Q(19),
      R => SR(0)
    );
\IP2Bus_Data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(18),
      Q => Q(18),
      R => SR(0)
    );
\IP2Bus_Data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(17),
      Q => Q(17),
      R => SR(0)
    );
\IP2Bus_Data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(16),
      Q => Q(16),
      R => SR(0)
    );
\IP2Bus_Data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(15),
      Q => Q(15),
      R => SR(0)
    );
\IP2Bus_Data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(14),
      Q => Q(14),
      R => SR(0)
    );
\IP2Bus_Data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(13),
      Q => Q(13),
      R => SR(0)
    );
\IP2Bus_Data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(12),
      Q => Q(12),
      R => SR(0)
    );
\IP2Bus_Data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(30),
      Q => Q(30),
      R => SR(0)
    );
\IP2Bus_Data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(11),
      Q => Q(11),
      R => SR(0)
    );
\IP2Bus_Data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(10),
      Q => Q(10),
      R => SR(0)
    );
\IP2Bus_Data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(9),
      Q => Q(9),
      R => SR(0)
    );
\IP2Bus_Data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(8),
      Q => Q(8),
      R => SR(0)
    );
\IP2Bus_Data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(7),
      Q => Q(7),
      R => SR(0)
    );
\IP2Bus_Data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(6),
      Q => Q(6),
      R => SR(0)
    );
\IP2Bus_Data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(5),
      Q => Q(5),
      R => SR(0)
    );
\IP2Bus_Data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(4),
      Q => Q(4),
      R => SR(0)
    );
\IP2Bus_Data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(3),
      Q => Q(3),
      R => SR(0)
    );
\IP2Bus_Data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(2),
      Q => Q(2),
      R => SR(0)
    );
\IP2Bus_Data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(29),
      Q => Q(29),
      R => SR(0)
    );
\IP2Bus_Data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(1),
      Q => Q(1),
      R => SR(0)
    );
\IP2Bus_Data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(0),
      Q => Q(0),
      R => SR(0)
    );
\IP2Bus_Data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(28),
      Q => Q(28),
      R => SR(0)
    );
\IP2Bus_Data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(27),
      Q => Q(27),
      R => SR(0)
    );
\IP2Bus_Data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(26),
      Q => Q(26),
      R => SR(0)
    );
\IP2Bus_Data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(25),
      Q => Q(25),
      R => SR(0)
    );
\IP2Bus_Data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(24),
      Q => Q(24),
      R => SR(0)
    );
\IP2Bus_Data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(23),
      Q => Q(23),
      R => SR(0)
    );
\IP2Bus_Data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(22),
      Q => Q(22),
      R => SR(0)
    );
IP2Bus_RdAck_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => IP2Bus_RdAck0,
      Q => ip2bus_rdack,
      R => SR(0)
    );
\PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^pend_wrreq_reg_0\,
      I1 => bus2ip_wrreq_i,
      I2 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\,
      I3 => temp_bus2ip_cs,
      O => next_state186_out
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAA0000FCFCFCFC"
    )
        port map (
      I0 => \^fsm_sequential_crnt_state_reg[1]\,
      I1 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I2 => \FSM_sequential_crnt_state_reg[4]\,
      I3 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\,
      I4 => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_39_n_0\,
      I5 => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\
    );
\RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_39\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF7FF"
    )
        port map (
      I0 => \^pend_wrreq_reg_0\,
      I1 => bus2ip_wrreq_i,
      I2 => next_state1,
      I3 => \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\,
      I4 => single_transaction,
      O => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1[0]_i_39_n_0\
    );
pend_rdreq_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      Q => pend_rdreq,
      R => SR(0)
    );
pend_wrreq_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\,
      Q => \^pend_wrreq_reg_0\,
      R => SR(0)
    );
s_axi_mem_wready_INST_0_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^pend_wrreq_reg_0\,
      I1 => bus2ip_wrreq_i,
      O => \^fsm_sequential_crnt_state_reg[1]\
    );
wlast_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => bus2ip_wrreq_i,
      I1 => \^pend_wrreq_reg_0\,
      I2 => s_axi_mem_wvalid,
      I3 => s_axi_mem_wlast,
      I4 => wlast_reg,
      O => wlast_reg_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_srl_fifo_rbu_f is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_mem_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg[1]\ : out STD_LOGIC;
    rst_rdce_cmb : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \MEM_DECODE_GEN[0].rdce_out_i_reg[0]\ : out STD_LOGIC;
    s_axi_mem_rvalid : out STD_LOGIC;
    Bus2IP_RdReq_d1_reg : out STD_LOGIC;
    \bus2ip_BE_reg_reg[0]\ : out STD_LOGIC;
    enable_rdce_cmb : out STD_LOGIC;
    s_axi_mem_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bus2ip_reset : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_rnw : in STD_LOGIC;
    ip2bus_addrack : in STD_LOGIC;
    enable_cs_cmb : in STD_LOGIC;
    s_axi_mem_rready : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \burst_data_cnt_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \burst_data_cnt_reg[2]\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ip2bus_rdack : in STD_LOGIC;
    last_data_cmb0 : in STD_LOGIC;
    \burst_data_cnt_reg[6]\ : in STD_LOGIC;
    \burst_data_cnt_reg[7]_0\ : in STD_LOGIC;
    enable_cs_cmb126_out : in STD_LOGIC;
    last_len_cmb : in STD_LOGIC;
    rd_fifo_wr_en : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 0 to 32 )
  );
end design_1_axi_emc_0_0_srl_fifo_rbu_f;

architecture STRUCTURE of design_1_axi_emc_0_0_srl_fifo_rbu_f is
  signal CNTR_INCR_DECR_ADDN_F_I_n_0 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_1 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_12 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_13 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_14 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_15 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_16 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_17 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_18 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_2 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_3 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_4 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_5 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_6 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal fifo_full_p1 : STD_LOGIC;
  signal rd_fifo_full : STD_LOGIC;
  signal \^rst_rdce_cmb\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_4\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \MEM_DECODE_GEN[0].rdce_out_i[0]_i_4\ : label is "soft_lutpair41";
begin
  Q(0) <= \^q\(0);
  rst_rdce_cmb <= \^rst_rdce_cmb\;
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000058580848"
    )
        port map (
      I0 => \out\(0),
      I1 => ip2bus_rdack,
      I2 => \out\(1),
      I3 => last_data_cmb0,
      I4 => rd_fifo_full,
      I5 => \out\(2),
      O => \^rst_rdce_cmb\
    );
\BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \^rst_rdce_cmb\,
      I1 => ip2bus_addrack,
      I2 => enable_cs_cmb,
      O => \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg[1]\
    );
Bus2IP_RdReq_d1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF0000AB00AA00"
    )
        port map (
      I0 => rd_fifo_full,
      I1 => \burst_data_cnt_reg[6]\,
      I2 => \burst_data_cnt_reg[7]_0\,
      I3 => \out\(1),
      I4 => ip2bus_rdack,
      I5 => \out\(0),
      O => Bus2IP_RdReq_d1_reg
    );
CNTR_INCR_DECR_ADDN_F_I: entity work.design_1_axi_emc_0_0_cntr_incr_decr_addn_f
     port map (
      A(1) => CNTR_INCR_DECR_ADDN_F_I_n_12,
      A(0) => CNTR_INCR_DECR_ADDN_F_I_n_13,
      E(0) => E(0),
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\(0) => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\(0),
      Q(7) => CNTR_INCR_DECR_ADDN_F_I_n_0,
      Q(6) => CNTR_INCR_DECR_ADDN_F_I_n_1,
      Q(5) => CNTR_INCR_DECR_ADDN_F_I_n_2,
      Q(4) => CNTR_INCR_DECR_ADDN_F_I_n_3,
      Q(3) => CNTR_INCR_DECR_ADDN_F_I_n_4,
      Q(2) => CNTR_INCR_DECR_ADDN_F_I_n_5,
      Q(1) => CNTR_INCR_DECR_ADDN_F_I_n_6,
      Q(0) => \^q\(0),
      addr(1) => CNTR_INCR_DECR_ADDN_F_I_n_14,
      addr(0) => CNTR_INCR_DECR_ADDN_F_I_n_15,
      \burst_data_cnt_reg[2]\ => \burst_data_cnt_reg[2]\,
      \burst_data_cnt_reg[7]\(3 downto 0) => \burst_data_cnt_reg[7]\(3 downto 0),
      bus2ip_reset => bus2ip_reset,
      enable_cs_cmb => enable_cs_cmb,
      enable_cs_cmb126_out => enable_cs_cmb126_out,
      enable_rdce_cmb => enable_rdce_cmb,
      fifo_full_p1 => fifo_full_p1,
      last_len_cmb => last_len_cmb,
      \out\(2 downto 0) => \out\(2 downto 0),
      s_axi_aclk => s_axi_aclk,
      \s_axi_mem_rdata[14]\(2) => CNTR_INCR_DECR_ADDN_F_I_n_16,
      \s_axi_mem_rdata[14]\(1) => CNTR_INCR_DECR_ADDN_F_I_n_17,
      \s_axi_mem_rdata[14]\(0) => CNTR_INCR_DECR_ADDN_F_I_n_18,
      s_axi_mem_rready => s_axi_mem_rready,
      s_axi_mem_rvalid => s_axi_mem_rvalid
    );
DYNSHREG_F_I: entity work.design_1_axi_emc_0_0_dynshreg_f
     port map (
      A(1) => CNTR_INCR_DECR_ADDN_F_I_n_12,
      A(0) => CNTR_INCR_DECR_ADDN_F_I_n_13,
      \INFERRED_GEN.cnt_i_reg[2]_rep\(2) => CNTR_INCR_DECR_ADDN_F_I_n_16,
      \INFERRED_GEN.cnt_i_reg[2]_rep\(1) => CNTR_INCR_DECR_ADDN_F_I_n_17,
      \INFERRED_GEN.cnt_i_reg[2]_rep\(0) => CNTR_INCR_DECR_ADDN_F_I_n_18,
      Q(7) => CNTR_INCR_DECR_ADDN_F_I_n_0,
      Q(6) => CNTR_INCR_DECR_ADDN_F_I_n_1,
      Q(5) => CNTR_INCR_DECR_ADDN_F_I_n_2,
      Q(4) => CNTR_INCR_DECR_ADDN_F_I_n_3,
      Q(3) => CNTR_INCR_DECR_ADDN_F_I_n_4,
      Q(2) => CNTR_INCR_DECR_ADDN_F_I_n_5,
      Q(1) => CNTR_INCR_DECR_ADDN_F_I_n_6,
      Q(0) => \^q\(0),
      addr(1) => CNTR_INCR_DECR_ADDN_F_I_n_14,
      addr(0) => CNTR_INCR_DECR_ADDN_F_I_n_15,
      bus2ip_rnw => bus2ip_rnw,
      \in\(0 to 32) => \in\(0 to 32),
      rd_fifo_wr_en => rd_fifo_wr_en,
      s_axi_aclk => s_axi_aclk,
      s_axi_mem_rdata(31 downto 0) => s_axi_mem_rdata(31 downto 0),
      s_axi_mem_rresp(0) => s_axi_mem_rresp(0)
    );
FIFO_Full_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => fifo_full_p1,
      Q => rd_fifo_full,
      R => bus2ip_reset
    );
\MEM_DECODE_GEN[0].rdce_out_i[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \^rst_rdce_cmb\,
      O => \MEM_DECODE_GEN[0].rdce_out_i_reg[0]\
    );
\PERBIT_GEN[7].MULT_AND_i1_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAAAE"
    )
        port map (
      I0 => rd_fifo_full,
      I1 => ip2bus_rdack,
      I2 => \burst_data_cnt_reg[7]\(2),
      I3 => \burst_data_cnt_reg[7]\(0),
      I4 => \burst_data_cnt_reg[7]_0\,
      I5 => \out\(0),
      O => \bus2ip_BE_reg_reg[0]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_EMC is
  port (
    burst_cnt_i : out STD_LOGIC_VECTOR ( 0 to 7 );
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    cycle_cnt : out STD_LOGIC_VECTOR ( 0 to 1 );
    \ADDRESS_STORE_GEN[0].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[1].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[2].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[3].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[4].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[5].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[6].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[7].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[8].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[9].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[10].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[11].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[12].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[13].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[14].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[15].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[16].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[17].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[18].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[19].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[20].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[21].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[22].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[23].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[24].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[25].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[26].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[27].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[28].ADDRESS_REG__0\ : out STD_LOGIC;
    \ADDRESS_STORE_GEN[29].ADDRESS_REG__0\ : out STD_LOGIC;
    \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ : out STD_LOGIC;
    mem_wen : out STD_LOGIC;
    ip2bus_rdack : out STD_LOGIC;
    transaction_done_i : out STD_LOGIC;
    Bus2IP_RdReq_d1 : out STD_LOGIC;
    read_break_reg_d1 : out STD_LOGIC;
    mem_cen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_oen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_rpn : out STD_LOGIC;
    mem_ce : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_rnw : out STD_LOGIC;
    pend_rdreq : out STD_LOGIC;
    pend_wrreq : out STD_LOGIC;
    twph_end : out STD_LOGIC;
    \mem_a_int_reg[31]\ : out STD_LOGIC;
    cycle_cnt_en : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[1]\ : out STD_LOGIC;
    eqOp4_in : out STD_LOGIC;
    read_req_ack_cmb : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[0]\ : out STD_LOGIC;
    bus2Mem_WrReq : out STD_LOGIC;
    cycle_End : out STD_LOGIC;
    Write_req_addr_ack_cmb : out STD_LOGIC;
    pr_idle : out STD_LOGIC;
    eqOp1_in : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    enable_cs_cmb126_out : out STD_LOGIC;
    enable_cs_cmb0 : out STD_LOGIC;
    pend_rdreq_reg : out STD_LOGIC;
    store_addr_info_cmb : out STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]\ : out STD_LOGIC;
    rw_flag_reg_reg : out STD_LOGIC;
    Write_req_data_ack_cmb : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mem_dq_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_dq_t : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_qwen : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mem_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ip2bus_addrack : in STD_LOGIC;
    S : in STD_LOGIC;
    \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : in STD_LOGIC;
    reset_fifo : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Cycle_cnt_en_int : in STD_LOGIC;
    S_0 : in STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ : in STD_LOGIC;
    bus2ip_addr_temp : in STD_LOGIC_VECTOR ( 29 downto 0 );
    bus2ip_ben_fixed : in STD_LOGIC_VECTOR ( 0 to 3 );
    \bus2ip_data_reg_reg[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    readreq_th_reset : in STD_LOGIC;
    temp_bus2ip_cs : in STD_LOGIC;
    IP2Bus_RdAck0 : in STD_LOGIC;
    bus2Mem_RdReq : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ : in STD_LOGIC;
    Bus2IP_RdReq_emc : in STD_LOGIC;
    Bus2IP_RdReq_d1_reg : in STD_LOGIC;
    s_axi_mem_wvalid : in STD_LOGIC;
    bus2ip_wrreq_i : in STD_LOGIC;
    \axi_trans_size_reg_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    next_state181_out : in STD_LOGIC;
    transaction_done_cmb17_out : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ : in STD_LOGIC;
    single_transaction : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_2\ : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_3\ : in STD_LOGIC;
    next_state174_out : in STD_LOGIC;
    Write_req_data_ack_cmb13_out : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]_0\ : in STD_LOGIC;
    s_axi_mem_wlast : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_4\ : in STD_LOGIC;
    \FSM_sequential_emc_addr_ps_reg[2]_1\ : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_5\ : in STD_LOGIC;
    s_axi_mem_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rw_flag_reg : in STD_LOGIC;
    s_axi_mem_arvalid : in STD_LOGIC;
    s_axi_mem_awvalid : in STD_LOGIC;
    s_axi_mem_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    bus2ip_wr_req_cmb0 : in STD_LOGIC;
    bus2ip_burst_reg : in STD_LOGIC;
    addr_sm_ps_IDLE_reg : in STD_LOGIC;
    \bus2ip_BE_reg_reg[0]\ : in STD_LOGIC;
    Type_of_xfer : in STD_LOGIC;
    \bus2ip_BE_reg_reg[3]\ : in STD_LOGIC;
    mem_dq_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rdclk : in STD_LOGIC
  );
end design_1_axi_emc_0_0_EMC;

architecture STRUCTURE of design_1_axi_emc_0_0_EMC is
  signal ADDR_COUNTER_MUX_I_n_32 : STD_LOGIC;
  signal ADDR_COUNTER_MUX_I_n_33 : STD_LOGIC;
  signal ADDR_COUNTER_MUX_I_n_34 : STD_LOGIC;
  signal ADDR_COUNTER_MUX_I_n_36 : STD_LOGIC;
  signal ADDR_COUNTER_MUX_I_n_41 : STD_LOGIC;
  signal ADDR_COUNTER_MUX_I_n_44 : STD_LOGIC;
  signal \BURST_CNT/CE\ : STD_LOGIC;
  signal COUNTERS_I_n_34 : STD_LOGIC;
  signal COUNTERS_I_n_38 : STD_LOGIC;
  signal COUNTERS_I_n_39 : STD_LOGIC;
  signal COUNTERS_I_n_42 : STD_LOGIC;
  signal COUNTERS_I_n_46 : STD_LOGIC;
  signal COUNTERS_I_n_49 : STD_LOGIC;
  signal COUNTERS_I_n_50 : STD_LOGIC;
  signal \DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/CE\ : STD_LOGIC;
  signal \^fsm_sequential_crnt_state_reg[0]\ : STD_LOGIC;
  signal \^fsm_sequential_crnt_state_reg[1]\ : STD_LOGIC;
  signal IO_REGISTERS_I_n_10 : STD_LOGIC;
  signal IO_REGISTERS_I_n_11 : STD_LOGIC;
  signal IO_REGISTERS_I_n_12 : STD_LOGIC;
  signal IO_REGISTERS_I_n_13 : STD_LOGIC;
  signal IO_REGISTERS_I_n_14 : STD_LOGIC;
  signal IO_REGISTERS_I_n_15 : STD_LOGIC;
  signal IO_REGISTERS_I_n_16 : STD_LOGIC;
  signal IO_REGISTERS_I_n_17 : STD_LOGIC;
  signal IO_REGISTERS_I_n_18 : STD_LOGIC;
  signal IO_REGISTERS_I_n_19 : STD_LOGIC;
  signal IO_REGISTERS_I_n_20 : STD_LOGIC;
  signal IO_REGISTERS_I_n_21 : STD_LOGIC;
  signal IO_REGISTERS_I_n_6 : STD_LOGIC;
  signal IO_REGISTERS_I_n_7 : STD_LOGIC;
  signal IO_REGISTERS_I_n_8 : STD_LOGIC;
  signal IO_REGISTERS_I_n_9 : STD_LOGIC;
  signal IPIC_IF_I_n_11 : STD_LOGIC;
  signal IPIC_IF_I_n_13 : STD_LOGIC;
  signal IPIC_IF_I_n_15 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_1 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_11 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_12 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_13 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_14 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_15 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_17 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_18 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_19 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_20 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_21 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_22 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_23 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_24 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_25 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_26 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_27 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_28 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_29 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_30 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_31 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_32 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_37 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_38 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_45 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_51 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_70 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_80 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_81 : STD_LOGIC;
  signal MEM_STATE_MACHINE_I_n_82 : STD_LOGIC;
  signal Mem_BEN_int : STD_LOGIC_VECTOR ( 0 to 1 );
  signal Mem_CE_int : STD_LOGIC;
  signal Mem_DQ_O_int : STD_LOGIC_VECTOR ( 0 to 15 );
  signal \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\ : STD_LOGIC;
  signal \THZCNT_I/CE\ : STD_LOGIC;
  signal \TLZCNT_I/CE\ : STD_LOGIC;
  signal \TPACCCNT_I/CE\ : STD_LOGIC;
  signal \TPACCCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TPACCCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TPACCCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TPACCCNT_I/S\ : STD_LOGIC;
  signal \TRDCNT_I/CE\ : STD_LOGIC;
  signal \TRDCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TRDCNT_I/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TRDCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TRDCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TWPHCNT_I/CE\ : STD_LOGIC;
  signal \TWPHCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TWPHCNT_I/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TWPHCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TWPHCNT_I/S\ : STD_LOGIC;
  signal \TWRCNT_I/CE\ : STD_LOGIC;
  signal \TWRCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TWRCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TWRCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \TWRCNT_I/S\ : STD_LOGIC;
  signal addr_cnt_ce : STD_LOGIC;
  signal addr_cnt_rst_cmb : STD_LOGIC;
  signal \^bus2mem_wrreq\ : STD_LOGIC;
  signal crnt_state_reg : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \^cycle_end\ : STD_LOGIC;
  signal \^cycle_cnt\ : STD_LOGIC_VECTOR ( 0 to 1 );
  signal cycle_cnt_en_cmb37_out : STD_LOGIC;
  signal cycle_cnt_en_cmb38_out : STD_LOGIC;
  signal data_strobe_c : STD_LOGIC;
  signal \^eqop1_in\ : STD_LOGIC;
  signal \^eqop4_in\ : STD_LOGIC;
  signal mem2Bus_Data : STD_LOGIC_VECTOR ( 0 to 31 );
  signal mem_RNW_cmb : STD_LOGIC;
  signal mem_WEN_cmb : STD_LOGIC;
  signal mem_dq_t_int : STD_LOGIC_VECTOR ( 15 to 15 );
  signal mem_dqt_t_d : STD_LOGIC;
  signal mem_qwen_int : STD_LOGIC_VECTOR ( 0 to 1 );
  signal new_page : STD_LOGIC;
  signal next_state1 : STD_LOGIC;
  signal next_state186_out : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 4 );
  signal p_85_in : STD_LOGIC;
  signal \^pend_wrreq\ : STD_LOGIC;
  signal read_ack : STD_LOGIC;
  signal read_ack_cmb : STD_LOGIC;
  signal read_data_en : STD_LOGIC;
  signal read_data_en_cmb : STD_LOGIC;
  signal read_req_ack_cmb42_out : STD_LOGIC;
  signal tpacc_cnt : STD_LOGIC_VECTOR ( 0 to 4 );
  signal tpacc_cnt_en : STD_LOGIC;
  signal tpacc_end : STD_LOGIC;
  signal trd_cnt : STD_LOGIC_VECTOR ( 0 to 3 );
  signal trd_cnt_en : STD_LOGIC;
  signal trd_end : STD_LOGIC;
  signal twph_cnt : STD_LOGIC_VECTOR ( 0 to 4 );
  signal \^twph_end\ : STD_LOGIC;
  signal twr_cnt_en : STD_LOGIC;
  signal twr_rec_cnt : STD_LOGIC_VECTOR ( 0 to 14 );
  signal twr_rec_cnt_en_int : STD_LOGIC;
  signal wlast_reg : STD_LOGIC;
begin
  \FSM_sequential_crnt_state_reg[0]\ <= \^fsm_sequential_crnt_state_reg[0]\;
  \FSM_sequential_crnt_state_reg[1]\ <= \^fsm_sequential_crnt_state_reg[1]\;
  \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ <= \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\;
  bus2Mem_WrReq <= \^bus2mem_wrreq\;
  cycle_End <= \^cycle_end\;
  cycle_cnt(0 to 1) <= \^cycle_cnt\(0 to 1);
  eqOp1_in <= \^eqop1_in\;
  eqOp4_in <= \^eqop4_in\;
  \out\(0) <= \^out\(0);
  pend_wrreq <= \^pend_wrreq\;
  twph_end <= \^twph_end\;
ADDR_COUNTER_MUX_I: entity work.design_1_axi_emc_0_0_addr_counter_mux
     port map (
      \ADDRESS_STORE_GEN[0].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[0].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[10].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[10].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[11].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[11].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[12].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[12].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[13].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[13].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[14].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[14].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[15].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[15].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[16].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[16].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[17].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[17].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[18].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[18].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[19].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[19].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[1].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[1].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[20].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[20].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[21].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[21].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[22].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[22].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[23].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[23].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[24].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[24].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[25].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[25].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[26].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[26].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[27].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[27].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[28].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[28].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[29].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[29].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[2].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[2].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[3].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[3].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[4].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[4].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[5].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[5].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[6].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[6].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[7].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[7].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[8].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[8].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[9].ADDRESS_REG__0\ => \ADDRESS_STORE_GEN[9].ADDRESS_REG__0\,
      CE => \DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/CE\,
      Cycle_cnt_en_int => Cycle_cnt_en_int,
      D(1) => mem_qwen_int(0),
      D(0) => mem_qwen_int(1),
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]_0\ => \^cycle_end\,
      \FSM_sequential_crnt_state_reg[0]\ => ADDR_COUNTER_MUX_I_n_32,
      \FSM_sequential_crnt_state_reg[1]\ => MEM_STATE_MACHINE_I_n_38,
      \FSM_sequential_crnt_state_reg[1]_0\ => COUNTERS_I_n_34,
      \FSM_sequential_crnt_state_reg[2]\ => MEM_STATE_MACHINE_I_n_37,
      \FSM_sequential_crnt_state_reg[2]_0\ => MEM_STATE_MACHINE_I_n_45,
      \FSM_sequential_crnt_state_reg[4]\ => MEM_STATE_MACHINE_I_n_11,
      \FSM_sequential_crnt_state_reg[4]_0\ => MEM_STATE_MACHINE_I_n_14,
      \FSM_sequential_emc_addr_ps_reg[2]\ => \FSM_sequential_emc_addr_ps_reg[2]_1\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_2\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ => ADDR_COUNTER_MUX_I_n_44,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ => ADDR_COUNTER_MUX_I_n_33,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => \^fsm_sequential_crnt_state_reg[0]\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ => \^twph_end\,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[0]\ => ADDR_COUNTER_MUX_I_n_41,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => ADDR_COUNTER_MUX_I_n_36,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\(0) => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\,
      SR(0) => SR(0),
      S_0 => S_0,
      Type_of_xfer => Type_of_xfer,
      addr_cnt_ce => addr_cnt_ce,
      addr_cnt_rst_cmb => addr_cnt_rst_cmb,
      bus2Mem_RdReq => bus2Mem_RdReq,
      \bus2ip_BE_reg_reg[0]\ => \bus2ip_BE_reg_reg[0]\,
      \bus2ip_BE_reg_reg[3]\ => \bus2ip_BE_reg_reg[3]\,
      bus2ip_addr_temp(29 downto 0) => bus2ip_addr_temp(29 downto 0),
      bus2ip_ben_fixed(0 to 3) => bus2ip_ben_fixed(0 to 3),
      bus2ip_wr_req_reg_reg => MEM_STATE_MACHINE_I_n_70,
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      data_strobe_c => data_strobe_c,
      mem_WEN_cmb => mem_WEN_cmb,
      \mem_ben_reg_reg[0]\(1) => Mem_BEN_int(0),
      \mem_ben_reg_reg[0]\(0) => Mem_BEN_int(1),
      new_page => new_page,
      \out\(0) => \^out\(0),
      pend_wrreq_reg => \^bus2mem_wrreq\,
      pend_wrreq_reg_0 => \^pend_wrreq\,
      read_ack_cmb => read_ack_cmb,
      read_ack_reg_reg => \^cycle_cnt\(1),
      read_ack_reg_reg_0 => \^cycle_cnt\(0),
      read_data_en_cmb => read_data_en_cmb,
      read_data_en_reg_reg => ADDR_COUNTER_MUX_I_n_34,
      read_req_ack_cmb42_out => read_req_ack_cmb42_out,
      s_axi_aclk => s_axi_aclk,
      single_transaction => single_transaction,
      tpacc_end => tpacc_end,
      trd_end => trd_end
    );
COUNTERS_I: entity work.design_1_axi_emc_0_0_counters
     port map (
      CE => \TWRCNT_I/CE\,
      CE_14 => \TPACCCNT_I/CE\,
      CE_15 => \THZCNT_I/CE\,
      CE_3 => \TWPHCNT_I/CE\,
      CE_4 => \TLZCNT_I/CE\,
      CE_9 => \TRDCNT_I/CE\,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ => COUNTERS_I_n_34,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]_0\ => \^twph_end\,
      \FSM_sequential_crnt_state_reg[0]\ => \^fsm_sequential_crnt_state_reg[0]\,
      \FSM_sequential_crnt_state_reg[1]\ => \^fsm_sequential_crnt_state_reg[1]\,
      \FSM_sequential_crnt_state_reg[1]_0\ => COUNTERS_I_n_49,
      \FSM_sequential_crnt_state_reg[3]\ => MEM_STATE_MACHINE_I_n_31,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_4\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ => \^eqop1_in\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \^eqop4_in\,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(14) => twr_rec_cnt(0),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(13) => twr_rec_cnt(1),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(12) => twr_rec_cnt(2),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(11) => twr_rec_cnt(3),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(10) => twr_rec_cnt(4),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(9) => twr_rec_cnt(5),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(8) => twr_rec_cnt(6),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(7) => twr_rec_cnt(7),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(6) => twr_rec_cnt(8),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(5) => twr_rec_cnt(9),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(4) => twr_rec_cnt(10),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(3) => twr_rec_cnt(11),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(2) => twr_rec_cnt(12),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(1) => twr_rec_cnt(13),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\(0) => twr_rec_cnt(14),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\ => COUNTERS_I_n_39,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\ => MEM_STATE_MACHINE_I_n_17,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \TWRCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_13\ => \TPACCCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_2\ => \TWPHCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_8\ => \TRDCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_27,
      \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_28,
      \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_29,
      \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_30,
      \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_15,
      \PERBIT_GEN[15].FF_RST1_GEN.FDSE_i1\ => COUNTERS_I_n_38,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => \^cycle_end\,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_82,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ => MEM_STATE_MACHINE_I_n_80,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_1\ => MEM_STATE_MACHINE_I_n_18,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \TWPHCNT_I/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\ => \TRDCNT_I/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_19,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \TWRCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_1\ => \TWPHCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_12\ => \TPACCCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_6\ => \TRDCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].FF_RST0_GEN.FDRE_i1\ => MEM_STATE_MACHINE_I_n_81,
      \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_20,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \TWRCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_11\ => \TPACCCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_5\ => \TRDCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_21,
      \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_22,
      \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_23,
      \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_24,
      \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_25,
      \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_26,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => COUNTERS_I_n_42,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ => COUNTERS_I_n_50,
      \READ_COMPLETE_PIPE_GEN[0].READ_COMPLETE_PIPE\ => COUNTERS_I_n_46,
      S => \TWRCNT_I/S\,
      SR(0) => SR(0),
      S_0 => \TWPHCNT_I/S\,
      S_10 => \TPACCCNT_I/S\,
      bus2Mem_RdReq => bus2Mem_RdReq,
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      crnt_state_reg(0) => crnt_state_reg(2),
      cycle_cnt_en_cmb37_out => cycle_cnt_en_cmb37_out,
      cycle_cnt_en_cmb38_out => cycle_cnt_en_cmb38_out,
      next_state1 => next_state1,
      \out\(1) => MEM_STATE_MACHINE_I_n_1,
      \out\(0) => \^out\(0),
      p_0_in(0 to 4) => p_0_in(0 to 4),
      p_85_in => p_85_in,
      pend_wrreq_reg => \^pend_wrreq\,
      pend_wrreq_reg_0 => \^bus2mem_wrreq\,
      read_data_en_reg_reg(3) => trd_cnt(0),
      read_data_en_reg_reg(2) => trd_cnt(1),
      read_data_en_reg_reg(1) => trd_cnt(2),
      read_data_en_reg_reg(0) => trd_cnt(3),
      s_axi_aclk => s_axi_aclk,
      single_transaction => single_transaction,
      temp_bus2ip_cs => temp_bus2ip_cs,
      tpacc_cnt(0 to 4) => tpacc_cnt(0 to 4),
      tpacc_cnt_en => tpacc_cnt_en,
      tpacc_end => tpacc_end,
      trd_cnt_en => trd_cnt_en,
      trd_end => trd_end,
      twph_cnt(0 to 4) => twph_cnt(0 to 4),
      twr_cnt_en => twr_cnt_en,
      twr_rec_cnt_en_int => twr_rec_cnt_en_int
    );
IO_REGISTERS_I: entity work.design_1_axi_emc_0_0_io_registers
     port map (
      \BEN_STORE_GEN[0].BEN_REG\(1) => Mem_BEN_int(0),
      \BEN_STORE_GEN[0].BEN_REG\(0) => Mem_BEN_int(1),
      D(15) => Mem_DQ_O_int(0),
      D(14) => Mem_DQ_O_int(1),
      D(13) => Mem_DQ_O_int(2),
      D(12) => Mem_DQ_O_int(3),
      D(11) => Mem_DQ_O_int(4),
      D(10) => Mem_DQ_O_int(5),
      D(9) => Mem_DQ_O_int(6),
      D(8) => Mem_DQ_O_int(7),
      D(7) => Mem_DQ_O_int(8),
      D(6) => Mem_DQ_O_int(9),
      D(5) => Mem_DQ_O_int(10),
      D(4) => Mem_DQ_O_int(11),
      D(3) => Mem_DQ_O_int(12),
      D(2) => Mem_DQ_O_int(13),
      D(1) => Mem_DQ_O_int(14),
      D(0) => Mem_DQ_O_int(15),
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1) => mem_qwen_int(0),
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0) => mem_qwen_int(1),
      \FSM_sequential_crnt_state_reg[3]\ => MEM_STATE_MACHINE_I_n_12,
      \FSM_sequential_crnt_state_reg[4]\(0) => mem_dq_t_int(15),
      Mem_CE_int => Mem_CE_int,
      Q(15) => IO_REGISTERS_I_n_6,
      Q(14) => IO_REGISTERS_I_n_7,
      Q(13) => IO_REGISTERS_I_n_8,
      Q(12) => IO_REGISTERS_I_n_9,
      Q(11) => IO_REGISTERS_I_n_10,
      Q(10) => IO_REGISTERS_I_n_11,
      Q(9) => IO_REGISTERS_I_n_12,
      Q(8) => IO_REGISTERS_I_n_13,
      Q(7) => IO_REGISTERS_I_n_14,
      Q(6) => IO_REGISTERS_I_n_15,
      Q(5) => IO_REGISTERS_I_n_16,
      Q(4) => IO_REGISTERS_I_n_17,
      Q(3) => IO_REGISTERS_I_n_18,
      Q(2) => IO_REGISTERS_I_n_19,
      Q(1) => IO_REGISTERS_I_n_20,
      Q(0) => IO_REGISTERS_I_n_21,
      SR(0) => SR(0),
      bus2ip_rd_req_reg_reg => MEM_STATE_MACHINE_I_n_13,
      mem_RNW_cmb => mem_RNW_cmb,
      mem_WEN_cmb => mem_WEN_cmb,
      mem_ben(1 downto 0) => mem_ben(1 downto 0),
      mem_ce(0) => mem_ce(0),
      mem_cen(0) => mem_cen(0),
      mem_dq_i(15 downto 0) => mem_dq_i(15 downto 0),
      mem_dq_o(15 downto 0) => mem_dq_o(15 downto 0),
      mem_dq_t(15 downto 0) => mem_dq_t(15 downto 0),
      mem_oen(0) => mem_oen(0),
      mem_qwen(1 downto 0) => mem_qwen(1 downto 0),
      mem_rnw => mem_rnw,
      mem_rpn => mem_rpn,
      mem_wen => mem_wen,
      rdclk => rdclk,
      s_axi_aclk => s_axi_aclk
    );
IPIC_IF_I: entity work.design_1_axi_emc_0_0_ipic_if
     port map (
      CE => \BURST_CNT/CE\,
      D(31) => mem2Bus_Data(0),
      D(30) => mem2Bus_Data(1),
      D(29) => mem2Bus_Data(2),
      D(28) => mem2Bus_Data(3),
      D(27) => mem2Bus_Data(4),
      D(26) => mem2Bus_Data(5),
      D(25) => mem2Bus_Data(6),
      D(24) => mem2Bus_Data(7),
      D(23) => mem2Bus_Data(8),
      D(22) => mem2Bus_Data(9),
      D(21) => mem2Bus_Data(10),
      D(20) => mem2Bus_Data(11),
      D(19) => mem2Bus_Data(12),
      D(18) => mem2Bus_Data(13),
      D(17) => mem2Bus_Data(14),
      D(16) => mem2Bus_Data(15),
      D(15) => mem2Bus_Data(16),
      D(14) => mem2Bus_Data(17),
      D(13) => mem2Bus_Data(18),
      D(12) => mem2Bus_Data(19),
      D(11) => mem2Bus_Data(20),
      D(10) => mem2Bus_Data(21),
      D(9) => mem2Bus_Data(22),
      D(8) => mem2Bus_Data(23),
      D(7) => mem2Bus_Data(24),
      D(6) => mem2Bus_Data(25),
      D(5) => mem2Bus_Data(26),
      D(4) => mem2Bus_Data(27),
      D(3) => mem2Bus_Data(28),
      D(2) => mem2Bus_Data(29),
      D(1) => mem2Bus_Data(30),
      D(0) => mem2Bus_Data(31),
      \FSM_sequential_crnt_state_reg[1]\ => \^bus2mem_wrreq\,
      \FSM_sequential_crnt_state_reg[4]\ => MEM_STATE_MACHINE_I_n_32,
      IP2Bus_RdAck0 => IP2Bus_RdAck0,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_5\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => \^cycle_end\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ => \^twph_end\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ => \^eqop1_in\,
      \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\,
      Q(31 downto 0) => Q(31 downto 0),
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => IPIC_IF_I_n_11,
      S => S,
      SR(0) => SR(0),
      burst_cnt_i(0 to 7) => burst_cnt_i(0 to 7),
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      ip2bus_addrack => ip2bus_addrack,
      ip2bus_rdack => ip2bus_rdack,
      next_state1 => next_state1,
      next_state186_out => next_state186_out,
      pend_rdreq => pend_rdreq,
      pend_rdreq_reg_0 => IPIC_IF_I_n_13,
      pend_wrreq_reg_0 => \^pend_wrreq\,
      reset_fifo => reset_fifo,
      s_axi_aclk => s_axi_aclk,
      s_axi_mem_wlast => s_axi_mem_wlast,
      s_axi_mem_wvalid => s_axi_mem_wvalid,
      single_transaction => single_transaction,
      temp_bus2ip_cs => temp_bus2ip_cs,
      wlast_reg => wlast_reg,
      wlast_reg_reg => IPIC_IF_I_n_15
    );
MEM_STATE_MACHINE_I: entity work.design_1_axi_emc_0_0_mem_state_machine
     port map (
      Bus2IP_RdReq_d1 => Bus2IP_RdReq_d1,
      Bus2IP_RdReq_d1_reg_0 => Bus2IP_RdReq_d1_reg,
      Bus2IP_RdReq_emc => Bus2IP_RdReq_emc,
      CE => \DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/CE\,
      CE_0 => \TRDCNT_I/CE\,
      CE_1 => \TPACCCNT_I/CE\,
      CE_10 => \TWPHCNT_I/CE\,
      CE_11 => \THZCNT_I/CE\,
      CE_12 => \TWRCNT_I/CE\,
      CE_17 => \BURST_CNT/CE\,
      CE_5 => \TLZCNT_I/CE\,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\ => MEM_STATE_MACHINE_I_n_45,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]\ => MEM_STATE_MACHINE_I_n_11,
      \FSM_sequential_crnt_state_reg[0]_0\ => COUNTERS_I_n_38,
      \FSM_sequential_crnt_state_reg[0]_1\ => ADDR_COUNTER_MUX_I_n_32,
      \FSM_sequential_crnt_state_reg[1]_0\ => MEM_STATE_MACHINE_I_n_14,
      \FSM_sequential_crnt_state_reg[1]_1\ => MEM_STATE_MACHINE_I_n_38,
      \FSM_sequential_crnt_state_reg[1]_2\ => COUNTERS_I_n_34,
      \FSM_sequential_emc_addr_ps_reg[2]\ => \FSM_sequential_emc_addr_ps_reg[2]\,
      \FSM_sequential_emc_addr_ps_reg[2]_0\ => ADDR_COUNTER_MUX_I_n_36,
      \FSM_sequential_emc_addr_ps_reg[2]_1\ => \FSM_sequential_emc_addr_ps_reg[2]_0\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_2\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_3\,
      Mem_CE_int => Mem_CE_int,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ => MEM_STATE_MACHINE_I_n_31,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => ADDR_COUNTER_MUX_I_n_34,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ => ADDR_COUNTER_MUX_I_n_33,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_17,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_0\ => MEM_STATE_MACHINE_I_n_37,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_1\ => MEM_STATE_MACHINE_I_n_80,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_2\ => MEM_STATE_MACHINE_I_n_82,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(14) => twr_rec_cnt(0),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(13) => twr_rec_cnt(1),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(12) => twr_rec_cnt(2),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(11) => twr_rec_cnt(3),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(10) => twr_rec_cnt(4),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(9) => twr_rec_cnt(5),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(8) => twr_rec_cnt(6),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(7) => twr_rec_cnt(7),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(6) => twr_rec_cnt(8),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(5) => twr_rec_cnt(9),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(4) => twr_rec_cnt(10),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(3) => twr_rec_cnt(11),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(2) => twr_rec_cnt(12),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(1) => twr_rec_cnt(13),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_3\(0) => twr_rec_cnt(14),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_4\ => COUNTERS_I_n_49,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(3) => trd_cnt(0),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(2) => trd_cnt(1),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(1) => trd_cnt(2),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1_5\(0) => trd_cnt(3),
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \TRDCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_16\ => \TWRCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_4\ => \TPACCCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_6\ => \TWPHCNT_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[10].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_27,
      \PERBIT_GEN[11].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_28,
      \PERBIT_GEN[12].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_29,
      \PERBIT_GEN[13].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_30,
      \PERBIT_GEN[14].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_15,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => \^fsm_sequential_crnt_state_reg[1]\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ => \^cycle_end\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_1\ => IPIC_IF_I_n_13,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_18,
      \PERBIT_GEN[1].FF_RST1_GEN.FDSE_i1_0\ => COUNTERS_I_n_46,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \TRDCNT_I/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg_7\ => \TWPHCNT_I/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].FF_RST0_GEN.FDRE_i1\ => MEM_STATE_MACHINE_I_n_81,
      \PERBIT_GEN[2].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_19,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \TRDCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_15\ => \TWRCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_3\ => \TPACCCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg_8\ => \TWPHCNT_I/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_20,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \TRDCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_14\ => \TWRCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg_2\ => \TPACCCNT_I/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1\ => \^twph_end\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_0\ => \^eqop4_in\,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_1\ => COUNTERS_I_n_42,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_2\ => COUNTERS_I_n_50,
      \PERBIT_GEN[4].FF_RST0_GEN.FDRE_i1_3\ => \^eqop1_in\,
      \PERBIT_GEN[4].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_21,
      \PERBIT_GEN[5].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_22,
      \PERBIT_GEN[6].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_23,
      \PERBIT_GEN[7].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_24,
      \PERBIT_GEN[8].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_25,
      \PERBIT_GEN[9].FF_RST1_GEN.FDSE_i1\ => MEM_STATE_MACHINE_I_n_26,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\(0) => crnt_state_reg(2),
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ => MEM_STATE_MACHINE_I_n_32,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\(0) => MEM_STATE_MACHINE_I_n_51,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_2\ => MEM_STATE_MACHINE_I_n_70,
      S => \TPACCCNT_I/S\,
      SR(0) => SR(0),
      S_13 => \TWRCNT_I/S\,
      S_9 => \TWPHCNT_I/S\,
      Write_req_addr_ack_cmb => Write_req_addr_ack_cmb,
      Write_req_data_ack_cmb => Write_req_data_ack_cmb,
      Write_req_data_ack_cmb13_out => Write_req_data_ack_cmb13_out,
      addr_cnt_ce => addr_cnt_ce,
      addr_cnt_rst_cmb => addr_cnt_rst_cmb,
      addr_sm_ps_IDLE_reg => addr_sm_ps_IDLE_reg,
      \axi_trans_size_reg_reg[1]\(0) => \axi_trans_size_reg_reg[1]\(0),
      bus2Mem_RdReq => bus2Mem_RdReq,
      bus2ip_burst_reg => bus2ip_burst_reg,
      bus2ip_wr_req_cmb0 => bus2ip_wr_req_cmb0,
      bus2ip_wr_req_reg_reg => ADDR_COUNTER_MUX_I_n_44,
      bus2ip_wr_req_reg_reg_0 => IPIC_IF_I_n_15,
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      cycle_cnt(0 to 1) => \^cycle_cnt\(0 to 1),
      cycle_cnt_en => cycle_cnt_en,
      cycle_cnt_en_cmb37_out => cycle_cnt_en_cmb37_out,
      cycle_cnt_en_cmb38_out => cycle_cnt_en_cmb38_out,
      data_strobe_c => data_strobe_c,
      enable_cs_cmb0 => enable_cs_cmb0,
      enable_cs_cmb126_out => enable_cs_cmb126_out,
      ip2bus_addrack => ip2bus_addrack,
      mem_RNW_cmb => mem_RNW_cmb,
      mem_WEN_cmb => mem_WEN_cmb,
      \mem_a_int_reg[31]\ => \mem_a_int_reg[31]\,
      \mem_cen_reg_reg[0]\ => MEM_STATE_MACHINE_I_n_12,
      \mem_dq_t_reg_reg[0]\(0) => mem_dq_t_int(15),
      mem_dqt_t_d => mem_dqt_t_d,
      \mem_oen_reg_reg[0]\ => MEM_STATE_MACHINE_I_n_13,
      new_page => new_page,
      next_state1 => next_state1,
      next_state174_out => next_state174_out,
      next_state181_out => next_state181_out,
      next_state186_out => next_state186_out,
      \out\(1) => MEM_STATE_MACHINE_I_n_1,
      \out\(0) => \^out\(0),
      p_0_in(0 to 4) => p_0_in(0 to 4),
      p_85_in => p_85_in,
      pend_rdreq_reg => pend_rdreq_reg,
      pend_wrreq_reg => \^pend_wrreq\,
      pend_wrreq_reg_0 => IPIC_IF_I_n_11,
      pend_wrreq_reg_1 => \^bus2mem_wrreq\,
      pend_wrreq_reg_2 => COUNTERS_I_n_39,
      pr_idle => pr_idle,
      read_ack => read_ack,
      read_ack_cmb => read_ack_cmb,
      read_break_reg_d1 => read_break_reg_d1,
      read_data_en => read_data_en,
      read_data_en_cmb => read_data_en_cmb,
      read_req_ack_cmb => read_req_ack_cmb,
      read_req_ack_cmb42_out => read_req_ack_cmb42_out,
      rw_flag_reg => rw_flag_reg,
      rw_flag_reg_reg => rw_flag_reg_reg,
      s_axi_aclk => s_axi_aclk,
      s_axi_mem_arburst(1 downto 0) => s_axi_mem_arburst(1 downto 0),
      s_axi_mem_arvalid => s_axi_mem_arvalid,
      s_axi_mem_awburst(1 downto 0) => s_axi_mem_awburst(1 downto 0),
      s_axi_mem_awvalid => s_axi_mem_awvalid,
      s_axi_mem_wlast => s_axi_mem_wlast,
      s_axi_mem_wvalid => s_axi_mem_wvalid,
      single_transaction => single_transaction,
      store_addr_info_cmb => store_addr_info_cmb,
      temp_bus2ip_cs => temp_bus2ip_cs,
      tpacc_cnt(0 to 4) => tpacc_cnt(0 to 4),
      tpacc_cnt_en => tpacc_cnt_en,
      tpacc_end => tpacc_end,
      transaction_done_cmb17_out => transaction_done_cmb17_out,
      transaction_done_i => transaction_done_i,
      trd_cnt_en => trd_cnt_en,
      trd_end => trd_end,
      twph_cnt(0 to 4) => twph_cnt(0 to 4),
      twr_cnt_en => twr_cnt_en,
      twr_rec_cnt_en_int => twr_rec_cnt_en_int,
      wlast_reg => wlast_reg
    );
MEM_STEER_I: entity work.design_1_axi_emc_0_0_mem_steer
     port map (
      \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ => \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\,
      D(31) => mem2Bus_Data(0),
      D(30) => mem2Bus_Data(1),
      D(29) => mem2Bus_Data(2),
      D(28) => mem2Bus_Data(3),
      D(27) => mem2Bus_Data(4),
      D(26) => mem2Bus_Data(5),
      D(25) => mem2Bus_Data(6),
      D(24) => mem2Bus_Data(7),
      D(23) => mem2Bus_Data(8),
      D(22) => mem2Bus_Data(9),
      D(21) => mem2Bus_Data(10),
      D(20) => mem2Bus_Data(11),
      D(19) => mem2Bus_Data(12),
      D(18) => mem2Bus_Data(13),
      D(17) => mem2Bus_Data(14),
      D(16) => mem2Bus_Data(15),
      D(15) => mem2Bus_Data(16),
      D(14) => mem2Bus_Data(17),
      D(13) => mem2Bus_Data(18),
      D(12) => mem2Bus_Data(19),
      D(11) => mem2Bus_Data(20),
      D(10) => mem2Bus_Data(21),
      D(9) => mem2Bus_Data(22),
      D(8) => mem2Bus_Data(23),
      D(7) => mem2Bus_Data(24),
      D(6) => mem2Bus_Data(25),
      D(5) => mem2Bus_Data(26),
      D(4) => mem2Bus_Data(27),
      D(3) => mem2Bus_Data(28),
      D(2) => mem2Bus_Data(29),
      D(1) => mem2Bus_Data(30),
      D(0) => mem2Bus_Data(31),
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(1) => ADDR_COUNTER_MUX_I_n_41,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[0]\(0) => \^rddata_path_mux_gen.async_addr_cnt_gen.addr_cnt_d1_reg[1]\,
      Q(15) => IO_REGISTERS_I_n_6,
      Q(14) => IO_REGISTERS_I_n_7,
      Q(13) => IO_REGISTERS_I_n_8,
      Q(12) => IO_REGISTERS_I_n_9,
      Q(11) => IO_REGISTERS_I_n_10,
      Q(10) => IO_REGISTERS_I_n_11,
      Q(9) => IO_REGISTERS_I_n_12,
      Q(8) => IO_REGISTERS_I_n_13,
      Q(7) => IO_REGISTERS_I_n_14,
      Q(6) => IO_REGISTERS_I_n_15,
      Q(5) => IO_REGISTERS_I_n_16,
      Q(4) => IO_REGISTERS_I_n_17,
      Q(3) => IO_REGISTERS_I_n_18,
      Q(2) => IO_REGISTERS_I_n_19,
      Q(1) => IO_REGISTERS_I_n_20,
      Q(0) => IO_REGISTERS_I_n_21,
      SR(0) => SR(0),
      \bus2ip_data_reg_reg[31]\(31 downto 0) => \bus2ip_data_reg_reg[31]\(31 downto 0),
      bus2ip_reset_reg(0) => MEM_STATE_MACHINE_I_n_51,
      data_strobe_c => data_strobe_c,
      mem_WEN_cmb => mem_WEN_cmb,
      \mem_dq_o_reg_reg[0]\(15) => Mem_DQ_O_int(0),
      \mem_dq_o_reg_reg[0]\(14) => Mem_DQ_O_int(1),
      \mem_dq_o_reg_reg[0]\(13) => Mem_DQ_O_int(2),
      \mem_dq_o_reg_reg[0]\(12) => Mem_DQ_O_int(3),
      \mem_dq_o_reg_reg[0]\(11) => Mem_DQ_O_int(4),
      \mem_dq_o_reg_reg[0]\(10) => Mem_DQ_O_int(5),
      \mem_dq_o_reg_reg[0]\(9) => Mem_DQ_O_int(6),
      \mem_dq_o_reg_reg[0]\(8) => Mem_DQ_O_int(7),
      \mem_dq_o_reg_reg[0]\(7) => Mem_DQ_O_int(8),
      \mem_dq_o_reg_reg[0]\(6) => Mem_DQ_O_int(9),
      \mem_dq_o_reg_reg[0]\(5) => Mem_DQ_O_int(10),
      \mem_dq_o_reg_reg[0]\(4) => Mem_DQ_O_int(11),
      \mem_dq_o_reg_reg[0]\(3) => Mem_DQ_O_int(12),
      \mem_dq_o_reg_reg[0]\(2) => Mem_DQ_O_int(13),
      \mem_dq_o_reg_reg[0]\(1) => Mem_DQ_O_int(14),
      \mem_dq_o_reg_reg[0]\(0) => Mem_DQ_O_int(15),
      mem_dqt_t_d => mem_dqt_t_d,
      read_ack => read_ack,
      read_data_en => read_data_en,
      readreq_th_reset => readreq_th_reset,
      s_axi_aclk => s_axi_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_axi_emc_native_interface is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    addr_sm_ps_IDLE_reg : out STD_LOGIC;
    Type_of_xfer : out STD_LOGIC;
    bus2ip_addr_temp : out STD_LOGIC_VECTOR ( 29 downto 0 );
    temp_bus2ip_cs : out STD_LOGIC;
    s_axi_mem_bvalid : out STD_LOGIC;
    Bus2IP_RdReq_emc : out STD_LOGIC;
    rw_flag_reg : out STD_LOGIC;
    s_axi_mem_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_wrreq_i : out STD_LOGIC;
    bus2ip_burst_reg : out STD_LOGIC;
    ip2bus_addrack : out STD_LOGIC;
    \axi_trans_size_reg_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    bus2Mem_RdReq : out STD_LOGIC;
    S : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[3]\ : out STD_LOGIC;
    \FSM_sequential_crnt_state_reg[2]\ : out STD_LOGIC;
    next_state174_out : out STD_LOGIC;
    single_transaction : out STD_LOGIC;
    s_axi_mem_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_mem_wready : out STD_LOGIC;
    s_axi_mem_arready : out STD_LOGIC;
    s_axi_mem_awready : out STD_LOGIC;
    bus2ip_wr_req_cmb0 : out STD_LOGIC;
    transaction_done_cmb17_out : out STD_LOGIC;
    next_state181_out : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ : out STD_LOGIC;
    Write_req_data_ack_cmb13_out : out STD_LOGIC;
    \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\ : out STD_LOGIC;
    readreq_th_reset : out STD_LOGIC;
    IP2Bus_RdAck0 : out STD_LOGIC;
    \mem_oen_reg_reg[0]\ : out STD_LOGIC;
    read_break_reg_d1_reg : out STD_LOGIC;
    Cycle_cnt_en_int : out STD_LOGIC;
    S_0 : out STD_LOGIC;
    \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : out STD_LOGIC;
    \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ : out STD_LOGIC;
    s_axi_mem_rvalid : out STD_LOGIC;
    s_axi_mem_rlast : out STD_LOGIC;
    reset_fifo : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]\ : out STD_LOGIC;
    \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]_0\ : out STD_LOGIC;
    bus2ip_ben_fixed : out STD_LOGIC_VECTOR ( 0 to 3 );
    \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ : out STD_LOGIC;
    pend_rdreq_reg : out STD_LOGIC;
    pend_wrreq_reg : out STD_LOGIC;
    s_axi_mem_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \DATA_STORE_GEN[24].WRDATA_REG\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bus2ip_reset : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    addr_sm_ps_IDLE_reg_reg_0 : in STD_LOGIC;
    s_axi_mem_bready : in STD_LOGIC;
    s_axi_mem_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cycle_cnt_en : in STD_LOGIC;
    cycle_cnt : in STD_LOGIC_VECTOR ( 0 to 1 );
    ip2bus_rdack : in STD_LOGIC;
    pend_wrreq : in STD_LOGIC;
    cycle_End : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ : in STD_LOGIC;
    bus2Mem_WrReq : in STD_LOGIC;
    twph_end : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_mem_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_rready : in STD_LOGIC;
    s_axi_mem_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_mem_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_wvalid : in STD_LOGIC;
    pr_idle : in STD_LOGIC;
    s_axi_mem_arvalid : in STD_LOGIC;
    s_axi_mem_awvalid : in STD_LOGIC;
    eqOp4_in : in STD_LOGIC;
    eqOp1_in : in STD_LOGIC;
    \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ : in STD_LOGIC;
    pend_rdreq : in STD_LOGIC;
    \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ : in STD_LOGIC;
    Bus2IP_RdReq_d1 : in STD_LOGIC;
    read_break_reg_d1 : in STD_LOGIC;
    burst_cnt_i : in STD_LOGIC_VECTOR ( 0 to 7 );
    read_req_ack_cmb : in STD_LOGIC;
    Write_req_addr_ack_cmb : in STD_LOGIC;
    enable_cs_cmb126_out : in STD_LOGIC;
    enable_cs_cmb0 : in STD_LOGIC;
    s_axi_mem_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Write_req_data_ack_cmb : in STD_LOGIC;
    transaction_done_i : in STD_LOGIC;
    bus2ip_burst_reg_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    store_addr_info_cmb : in STD_LOGIC;
    rw_flag_reg_reg_0 : in STD_LOGIC
  );
end design_1_axi_emc_0_0_axi_emc_native_interface;

architecture STRUCTURE of design_1_axi_emc_0_0_axi_emc_native_interface is
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_10 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_16 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_2 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_3 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_4 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_41 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_42 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_46 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_47 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_5 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_51 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_52 : STD_LOGIC;
  signal AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_6 : STD_LOGIC;
  signal AXI_EMC_ADDR_GEN_INSTANCE_I_n_38 : STD_LOGIC;
  signal AXI_EMC_ADDR_GEN_INSTANCE_I_n_40 : STD_LOGIC;
  signal AXI_EMC_ADDR_GEN_INSTANCE_I_n_42 : STD_LOGIC;
  signal Bus2IP_RdReq_d1_i_3_n_0 : STD_LOGIC;
  signal Bus2IP_RdReq_d1_i_4_n_0 : STD_LOGIC;
  signal \^bus2ip_rdreq_emc\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[1]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[1]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_emc_addr_ps_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \LEN_GEN_32.derived_len_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \LEN_GEN_32.derived_len_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \LEN_GEN_32.derived_len_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \LEN_GEN_32.derived_len_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[1].MUXCY_i1_i_2_n_0\ : STD_LOGIC;
  signal \PERBIT_GEN[7].MULT_AND_i1_i_5_n_0\ : STD_LOGIC;
  signal RDATA_FIFO_I_n_0 : STD_LOGIC;
  signal RDATA_FIFO_I_n_2 : STD_LOGIC;
  signal RDATA_FIFO_I_n_4 : STD_LOGIC;
  signal RDATA_FIFO_I_n_5 : STD_LOGIC;
  signal RDATA_FIFO_I_n_7 : STD_LOGIC;
  signal RDATA_FIFO_I_n_8 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^type_of_xfer\ : STD_LOGIC;
  signal Type_of_xfer_cmb : STD_LOGIC;
  signal addr_2_cmb : STD_LOGIC;
  signal addr_3_cmb : STD_LOGIC;
  signal addr_4_cmb : STD_LOGIC;
  signal addr_5_cmb : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_10_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_17_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_18_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_19_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_1_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_20_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_2_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_4_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_5_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_7_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_i_8_n_0 : STD_LOGIC;
  signal addr_sm_ns_IDLE_cmb_n_0 : STD_LOGIC;
  signal addr_sm_ps_idle_cmb : STD_LOGIC;
  signal \axi_trans_size_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \axi_trans_size_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal axi_trans_size_reg_int : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^axi_trans_size_reg_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \burst_addr_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \burst_addr_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \burst_addr_cnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \burst_addr_cnt[6]_i_2_n_0\ : STD_LOGIC;
  signal \burst_addr_cnt[7]_i_3_n_0\ : STD_LOGIC;
  signal \burst_addr_cnt[7]_i_5_n_0\ : STD_LOGIC;
  signal \burst_addr_cnt_reg__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \burst_addr_cnt_reg__1\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal burst_data_cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \burst_data_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \burst_data_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \burst_data_cnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \burst_data_cnt[6]_i_2_n_0\ : STD_LOGIC;
  signal \burst_data_cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \burst_data_cnt[7]_i_4_n_0\ : STD_LOGIC;
  signal burst_length_cmb : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \bus2ip_BE_reg1__1\ : STD_LOGIC;
  signal \bus2ip_BE_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \bus2ip_BE_reg[3]_i_6_n_0\ : STD_LOGIC;
  signal \^bus2ip_addr_temp\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \^bus2ip_burst_reg\ : STD_LOGIC;
  signal bus2ip_burst_reg_i_1_n_0 : STD_LOGIC;
  signal bus2ip_burstlength : STD_LOGIC_VECTOR ( 0 to 7 );
  signal bus2ip_data_reg0 : STD_LOGIC;
  signal bus2ip_rnw : STD_LOGIC;
  signal \^bus2ip_wr_req_cmb0\ : STD_LOGIC;
  signal bus2ip_wr_req_reg_i_1_n_0 : STD_LOGIC;
  signal \^bus2ip_wrreq_i\ : STD_LOGIC;
  signal data : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal derived_burst_reg : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \derived_burst_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \derived_burst_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal derived_len_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal derived_size_reg : STD_LOGIC;
  signal \derived_size_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \derived_size_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \derived_size_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal emc_addr_ns : STD_LOGIC_VECTOR ( 0 to 0 );
  signal emc_addr_ps : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of emc_addr_ps : signal is "yes";
  signal enable_cs_cmb : STD_LOGIC;
  signal enable_rdce_cmb : STD_LOGIC;
  signal \^ip2bus_addrack\ : STD_LOGIC;
  signal last_addr0 : STD_LOGIC;
  signal last_data_acked : STD_LOGIC;
  signal last_data_acked_i_1_n_0 : STD_LOGIC;
  signal last_data_cmb0 : STD_LOGIC;
  signal last_len_cmb : STD_LOGIC;
  signal \^next_state174_out\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in1_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \rd_data_count[7]_i_3_n_0\ : STD_LOGIC;
  signal \rd_data_count_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rd_fifo_data_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rd_fifo_wr_en : STD_LOGIC;
  signal rnw_cmb : STD_LOGIC;
  signal rnw_cmb0 : STD_LOGIC;
  signal rst_rdce_cmb : STD_LOGIC;
  signal \^rw_flag_reg\ : STD_LOGIC;
  signal \^s_axi_mem_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_mem_bvalid\ : STD_LOGIC;
  signal s_axi_mem_bvalid_reg_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_mem_wready\ : STD_LOGIC;
  signal temp_bus2ip_be : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \BEN_STORE_GEN[0].BEN_REG_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \BEN_STORE_GEN[2].BEN_REG_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \BEN_STORE_GEN[3].BEN_REG_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of Bus2IP_RdReq_d1_i_3 : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_3\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \FSM_sequential_emc_addr_ps[2]_i_5\ : label is "soft_lutpair43";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_emc_addr_ps_reg[0]\ : label is "idle:000,rd:010,rd_last:001,wr:011,wr_wait:100,wr_last:101,resp:110";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_emc_addr_ps_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_emc_addr_ps_reg[1]\ : label is "idle:000,rd:010,rd_last:001,wr:011,wr_wait:100,wr_last:101,resp:110";
  attribute KEEP of \FSM_sequential_emc_addr_ps_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_emc_addr_ps_reg[2]\ : label is "idle:000,rd:010,rd_last:001,wr:011,wr_wait:100,wr_last:101,resp:110";
  attribute KEEP of \FSM_sequential_emc_addr_ps_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM of \LEN_GEN_32.derived_len_reg[3]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \PERBIT_GEN[1].MUXCY_i1_i_2\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of addr_sm_ns_IDLE_cmb_i_10 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of addr_sm_ns_IDLE_cmb_i_19 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \axi_trans_size_reg[0]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \burst_addr_cnt[2]_i_2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \burst_addr_cnt[5]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \burst_addr_cnt[6]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \burst_addr_cnt[7]_i_3\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \burst_addr_cnt[7]_i_5\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \burst_data_cnt[3]_i_2\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \burst_data_cnt[5]_i_2\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \burst_data_cnt[7]_i_4\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \burstlength_reg[5]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \burstlength_reg[6]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \burstlength_reg[7]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \bus2ip_BE_reg[2]_i_3\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \bus2ip_BE_reg[3]_i_3\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \bus2ip_BE_reg[3]_i_6\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \derived_burst_reg[1]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \derived_size_reg[0]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \derived_size_reg[1]_i_2\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \rd_data_count[0]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \rd_data_count[1]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of s_axi_mem_bvalid_reg_i_1 : label is "soft_lutpair42";
begin
  Bus2IP_RdReq_emc <= \^bus2ip_rdreq_emc\;
  SR(0) <= \^sr\(0);
  Type_of_xfer <= \^type_of_xfer\;
  \axi_trans_size_reg_reg[1]_0\(0) <= \^axi_trans_size_reg_reg[1]_0\(0);
  bus2ip_addr_temp(29 downto 0) <= \^bus2ip_addr_temp\(29 downto 0);
  bus2ip_burst_reg <= \^bus2ip_burst_reg\;
  bus2ip_wr_req_cmb0 <= \^bus2ip_wr_req_cmb0\;
  bus2ip_wrreq_i <= \^bus2ip_wrreq_i\;
  ip2bus_addrack <= \^ip2bus_addrack\;
  next_state174_out <= \^next_state174_out\;
  rw_flag_reg <= \^rw_flag_reg\;
  s_axi_mem_bresp(0) <= \^s_axi_mem_bresp\(0);
  s_axi_mem_bvalid <= \^s_axi_mem_bvalid\;
  s_axi_mem_wready <= \^s_axi_mem_wready\;
AXI_EMC_ADDRESS_DECODE_INSTANCE_I: entity work.design_1_axi_emc_0_0_axi_emc_address_decode
     port map (
      \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ => \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\,
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[2]\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_2,
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[2]_0\ => \^bus2ip_addr_temp\(0),
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[3]\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_4,
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[3]_0\ => \^bus2ip_addr_temp\(1),
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[4]\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_5,
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[4]_0\ => \^bus2ip_addr_temp\(2),
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[5]\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_6,
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[5]_0\ => \^bus2ip_addr_temp\(3),
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.bus2ip_addr_i_reg[6]\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_3,
      Bus2IP_Mem_CS_d1_reg => temp_bus2ip_cs,
      Bus2IP_RdReq_d1 => Bus2IP_RdReq_d1,
      Bus2IP_RdReq_d1_reg => bus2Mem_RdReq,
      Bus2IP_RdReq_d1_reg_0 => single_transaction,
      Bus2IP_RdReq_emc => \^bus2ip_rdreq_emc\,
      Cycle_cnt_en_int => Cycle_cnt_en_int,
      D(3 downto 0) => burst_length_cmb(3 downto 0),
      E(0) => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      FIFO_Full_reg => RDATA_FIFO_I_n_7,
      FIFO_Full_reg_0 => RDATA_FIFO_I_n_8,
      \FSM_sequential_crnt_state_reg[0]\(0) => \out\(0),
      \FSM_sequential_crnt_state_reg[2]\ => \FSM_sequential_crnt_state_reg[2]\,
      \FSM_sequential_crnt_state_reg[3]\ => \FSM_sequential_crnt_state_reg[3]\,
      \FSM_sequential_emc_addr_ps_reg[0]\ => RDATA_FIFO_I_n_5,
      \FSM_sequential_emc_addr_ps_reg[0]_0\ => \FSM_sequential_emc_addr_ps[1]_i_4_n_0\,
      \FSM_sequential_emc_addr_ps_reg[0]_1\ => \FSM_sequential_emc_addr_ps[1]_i_5_n_0\,
      \FSM_sequential_emc_addr_ps_reg[1]\(1) => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_51,
      \FSM_sequential_emc_addr_ps_reg[1]\(0) => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_52,
      \FSM_sequential_emc_addr_ps_reg[1]_0\ => \FSM_sequential_emc_addr_ps[0]_i_2_n_0\,
      \FSM_sequential_emc_addr_ps_reg[1]_1\ => addr_sm_ns_IDLE_cmb_i_8_n_0,
      \INFERRED_GEN.cnt_i_reg[0]\(0) => RDATA_FIFO_I_n_0,
      \INFERRED_GEN.cnt_i_reg[3]_rep__0\(0) => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_10,
      IP2Bus_RdAck0 => IP2Bus_RdAck0,
      \LEN_GEN_32.derived_len_reg_reg[3]\(3 downto 0) => derived_len_reg(3 downto 0),
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ => \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ => \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ => \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ => \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\,
      Q(1 downto 0) => derived_burst_reg(1 downto 0),
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\ => \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\,
      S => S,
      S_0 => S_0,
      Write_req_addr_ack_cmb => Write_req_addr_ack_cmb,
      Write_req_data_ack_cmb => Write_req_data_ack_cmb,
      Write_req_data_ack_cmb13_out => Write_req_data_ack_cmb13_out,
      addr_2_cmb => addr_2_cmb,
      addr_3_cmb => addr_3_cmb,
      addr_4_cmb => addr_4_cmb,
      addr_5_cmb => addr_5_cmb,
      addr_sm_ps_idle_cmb => addr_sm_ps_idle_cmb,
      axi_trans_size_reg_int(0) => axi_trans_size_reg_int(0),
      \axi_trans_size_reg_reg[1]\ => \^axi_trans_size_reg_reg[1]_0\(0),
      burst_cnt_i(0 to 7) => burst_cnt_i(0 to 7),
      \burstlength_reg_reg[2]\ => \PERBIT_GEN[7].MULT_AND_i1_i_5_n_0\,
      \burstlength_reg_reg[7]\(7) => bus2ip_burstlength(0),
      \burstlength_reg_reg[7]\(6) => bus2ip_burstlength(1),
      \burstlength_reg_reg[7]\(5) => bus2ip_burstlength(2),
      \burstlength_reg_reg[7]\(4) => bus2ip_burstlength(3),
      \burstlength_reg_reg[7]\(3) => bus2ip_burstlength(4),
      \burstlength_reg_reg[7]\(2) => bus2ip_burstlength(5),
      \burstlength_reg_reg[7]\(1) => bus2ip_burstlength(6),
      \burstlength_reg_reg[7]\(0) => bus2ip_burstlength(7),
      bus2Mem_WrReq => bus2Mem_WrReq,
      \bus2ip_BE_reg1__1\ => \bus2ip_BE_reg1__1\,
      \bus2ip_BE_reg_reg[0]\ => \^ip2bus_addrack\,
      \bus2ip_BE_reg_reg[0]_0\(0) => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_16,
      bus2ip_burst_reg => \^bus2ip_burst_reg\,
      bus2ip_burst_reg_reg => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_41,
      bus2ip_burst_reg_reg_0 => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_42,
      bus2ip_burst_reg_reg_1 => bus2ip_burst_reg_reg_0,
      bus2ip_rd_req_reg_reg => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_47,
      bus2ip_reset => bus2ip_reset,
      bus2ip_wr_req_reg_reg => \^bus2ip_wrreq_i\,
      cycle_End => cycle_End,
      cycle_cnt(0 to 1) => cycle_cnt(0 to 1),
      cycle_cnt_en => cycle_cnt_en,
      emc_addr_ns(0) => emc_addr_ns(0),
      enable_cs_cmb => enable_cs_cmb,
      enable_rdce_cmb => enable_rdce_cmb,
      eqOp1_in => eqOp1_in,
      eqOp4_in => eqOp4_in,
      \in\(0) => rd_fifo_data_in(0),
      ip2bus_rdack => ip2bus_rdack,
      last_addr0 => last_addr0,
      last_data_cmb0 => last_data_cmb0,
      last_len_cmb => last_len_cmb,
      \mem_oen_reg_reg[0]\ => \mem_oen_reg_reg[0]\,
      next_state174_out => \^next_state174_out\,
      next_state181_out => next_state181_out,
      \out\(2 downto 0) => emc_addr_ps(2 downto 0),
      pend_rdreq => pend_rdreq,
      pend_rdreq_reg => pend_rdreq_reg,
      pend_wrreq => pend_wrreq,
      pend_wrreq_reg => pend_wrreq_reg,
      rd_fifo_wr_en => rd_fifo_wr_en,
      read_break_reg_d1 => read_break_reg_d1,
      read_break_reg_d1_reg => read_break_reg_d1_reg,
      read_req_ack_cmb => read_req_ack_cmb,
      readreq_th_reset => readreq_th_reset,
      reset_fifo => reset_fifo,
      rnw_cmb => rnw_cmb,
      rnw_cmb0 => rnw_cmb0,
      rst_rdce_cmb => rst_rdce_cmb,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_mem_arlen(7 downto 0) => s_axi_mem_arlen(7 downto 0),
      s_axi_mem_awlen(7 downto 0) => s_axi_mem_awlen(7 downto 0),
      s_axi_mem_bresp(0) => \^s_axi_mem_bresp\(0),
      \s_axi_mem_bresp_reg_reg[1]\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_46,
      s_axi_mem_bvalid_reg_reg => \FSM_sequential_emc_addr_ps[1]_i_2_n_0\,
      s_axi_mem_bvalid_reg_reg_0 => addr_sm_ns_IDLE_cmb_i_19_n_0,
      s_axi_mem_wvalid => s_axi_mem_wvalid,
      transaction_done_cmb17_out => transaction_done_cmb17_out,
      transaction_done_i => transaction_done_i,
      twph_end => twph_end,
      type_of_xfer_reg_reg => \PERBIT_GEN[1].MUXCY_i1_i_2_n_0\,
      type_of_xfer_reg_reg_0 => \^type_of_xfer\
    );
AXI_EMC_ADDR_GEN_INSTANCE_I: entity work.design_1_axi_emc_0_0_axi_emc_addr_gen
     port map (
      \ADDRESS_STORE_GEN[26].ADDRESS_REG\ => \^bus2ip_addr_temp\(3),
      \ADDRESS_STORE_GEN[27].ADDRESS_REG\ => \^bus2ip_addr_temp\(2),
      \ADDRESS_STORE_GEN[28].ADDRESS_REG\ => \^bus2ip_addr_temp\(1),
      \ADDRESS_STORE_GEN[29].ADDRESS_REG\ => \^bus2ip_addr_temp\(0),
      E(0) => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_3,
      \FSM_sequential_emc_addr_ps_reg[0]\ => RDATA_FIFO_I_n_2,
      Q(1) => \derived_size_reg_reg_n_0_[1]\,
      Q(0) => \derived_size_reg_reg_n_0_[0]\,
      SR(0) => \^sr\(0),
      addr_2_cmb => addr_2_cmb,
      addr_3_cmb => addr_3_cmb,
      addr_4_cmb => addr_4_cmb,
      addr_5_cmb => addr_5_cmb,
      \burst_addr_cnt_reg[7]\ => AXI_EMC_ADDR_GEN_INSTANCE_I_n_38,
      \burst_addr_cnt_reg[7]_0\(7 downto 1) => \burst_addr_cnt_reg__1\(7 downto 1),
      \burst_addr_cnt_reg[7]_0\(0) => \burst_addr_cnt_reg__0\(0),
      \burst_data_cnt_reg[4]\ => AXI_EMC_ADDR_GEN_INSTANCE_I_n_40,
      \burst_data_cnt_reg[7]\(7 downto 0) => burst_data_cnt(7 downto 0),
      bus2ip_addr_temp(25 downto 0) => \^bus2ip_addr_temp\(29 downto 4),
      bus2ip_rnw => bus2ip_rnw,
      bus2ip_wr_req_reg_reg => \^bus2ip_wr_req_cmb0\,
      \derived_burst_reg_reg[1]\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_2,
      \derived_burst_reg_reg[1]_0\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_4,
      \derived_burst_reg_reg[1]_1\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_5,
      \derived_burst_reg_reg[1]_2\ => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_6,
      enable_cs_cmb => enable_cs_cmb,
      ip2bus_addrack => \^ip2bus_addrack\,
      last_addr0 => last_addr0,
      last_data_acked => last_data_acked,
      last_data_cmb0 => last_data_cmb0,
      \out\(2 downto 0) => emc_addr_ps(2 downto 0),
      p_1_in => p_1_in,
      \rd_data_count_reg[4]\ => AXI_EMC_ADDR_GEN_INSTANCE_I_n_42,
      \rd_data_count_reg[7]\(7 downto 0) => \rd_data_count_reg__0\(7 downto 0),
      rnw_cmb => rnw_cmb,
      rnw_cmb0 => rnw_cmb0,
      rst_rdce_cmb => rst_rdce_cmb,
      rw_flag_reg_reg => \^rw_flag_reg\,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_mem_araddr(31 downto 0) => s_axi_mem_araddr(31 downto 0),
      s_axi_mem_arvalid => s_axi_mem_arvalid,
      s_axi_mem_awaddr(31 downto 0) => s_axi_mem_awaddr(31 downto 0),
      s_axi_mem_awvalid => s_axi_mem_awvalid,
      s_axi_mem_rready => s_axi_mem_rready,
      s_axi_mem_wvalid => s_axi_mem_wvalid,
      store_addr_info_cmb => store_addr_info_cmb
    );
\BEN_STORE_GEN[0].BEN_REG_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^type_of_xfer\,
      I1 => temp_bus2ip_be(0),
      O => bus2ip_ben_fixed(0)
    );
\BEN_STORE_GEN[1].BEN_REG_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^type_of_xfer\,
      I1 => temp_bus2ip_be(1),
      O => bus2ip_ben_fixed(1)
    );
\BEN_STORE_GEN[2].BEN_REG_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^type_of_xfer\,
      I1 => temp_bus2ip_be(2),
      O => bus2ip_ben_fixed(2)
    );
\BEN_STORE_GEN[3].BEN_REG_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^type_of_xfer\,
      I1 => temp_bus2ip_be(3),
      O => bus2ip_ben_fixed(3)
    );
Bus2IP_RdReq_d1_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => burst_data_cnt(6),
      I1 => burst_data_cnt(4),
      O => Bus2IP_RdReq_d1_i_3_n_0
    );
Bus2IP_RdReq_d1_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => burst_data_cnt(7),
      I1 => burst_data_cnt(5),
      I2 => burst_data_cnt(3),
      I3 => burst_data_cnt(1),
      I4 => burst_data_cnt(0),
      I5 => burst_data_cnt(2),
      O => Bus2IP_RdReq_d1_i_4_n_0
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => temp_bus2ip_be(0),
      I1 => temp_bus2ip_be(1),
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]\
    );
\DATAWIDTH_MATCH_GEN.addr_cnt_i[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => temp_bus2ip_be(3),
      I1 => temp_bus2ip_be(2),
      O => \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]_0\
    );
\FSM_sequential_crnt_state[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => temp_bus2ip_be(2),
      I1 => temp_bus2ip_be(3),
      I2 => temp_bus2ip_be(0),
      I3 => temp_bus2ip_be(1),
      I4 => \burst_addr_cnt[2]_i_2_n_0\,
      I5 => addr_sm_ns_IDLE_cmb_i_20_n_0,
      O => \^next_state174_out\
    );
\FSM_sequential_emc_addr_ps[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD00F0FDFD00000"
    )
        port map (
      I0 => Write_req_data_ack_cmb,
      I1 => s_axi_mem_wvalid,
      I2 => emc_addr_ps(1),
      I3 => p_1_in,
      I4 => emc_addr_ps(0),
      I5 => \FSM_sequential_emc_addr_ps[0]_i_4_n_0\,
      O => \FSM_sequential_emc_addr_ps[0]_i_2_n_0\
    );
\FSM_sequential_emc_addr_ps[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555CCC00000"
    )
        port map (
      I0 => last_len_cmb,
      I1 => \^bus2ip_wr_req_cmb0\,
      I2 => s_axi_mem_awburst(0),
      I3 => s_axi_mem_awburst(1),
      I4 => pr_idle,
      I5 => enable_cs_cmb126_out,
      O => \FSM_sequential_emc_addr_ps[0]_i_4_n_0\
    );
\FSM_sequential_emc_addr_ps[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => s_axi_mem_bready,
      I1 => \^s_axi_mem_bvalid\,
      I2 => emc_addr_ps(0),
      O => \FSM_sequential_emc_addr_ps[1]_i_2_n_0\
    );
\FSM_sequential_emc_addr_ps[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8F00"
    )
        port map (
      I0 => \FSM_sequential_emc_addr_ps[1]_i_6_n_0\,
      I1 => s_axi_mem_wvalid,
      I2 => Write_req_data_ack_cmb,
      I3 => emc_addr_ps(0),
      I4 => p_1_in,
      O => \FSM_sequential_emc_addr_ps[1]_i_4_n_0\
    );
\FSM_sequential_emc_addr_ps[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => last_len_cmb,
      I1 => store_addr_info_cmb,
      I2 => emc_addr_ps(0),
      O => \FSM_sequential_emc_addr_ps[1]_i_5_n_0\
    );
\FSM_sequential_emc_addr_ps[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => \burst_addr_cnt_reg__0\(0),
      I1 => \burst_addr_cnt_reg__1\(1),
      I2 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_38,
      I3 => \burst_addr_cnt_reg__1\(3),
      I4 => \burst_addr_cnt_reg__1\(2),
      I5 => \burst_addr_cnt_reg__1\(7),
      O => \FSM_sequential_emc_addr_ps[1]_i_6_n_0\
    );
\FSM_sequential_emc_addr_ps[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20202020000F0000"
    )
        port map (
      I0 => Write_req_data_ack_cmb,
      I1 => \FSM_sequential_emc_addr_ps[2]_i_5_n_0\,
      I2 => emc_addr_ps(1),
      I3 => last_len_cmb,
      I4 => rw_flag_reg_reg_0,
      I5 => emc_addr_ps(0),
      O => \FSM_sequential_emc_addr_ps[2]_i_3_n_0\
    );
\FSM_sequential_emc_addr_ps[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0F0F0F707F7F7F"
    )
        port map (
      I0 => s_axi_mem_bready,
      I1 => \^s_axi_mem_bvalid\,
      I2 => emc_addr_ps(1),
      I3 => last_addr0,
      I4 => s_axi_mem_wvalid,
      I5 => emc_addr_ps(0),
      O => \FSM_sequential_emc_addr_ps[2]_i_4_n_0\
    );
\FSM_sequential_emc_addr_ps[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF00"
    )
        port map (
      I0 => addr_sm_ns_IDLE_cmb_i_20_n_0,
      I1 => \burst_addr_cnt_reg__1\(1),
      I2 => \burst_addr_cnt_reg__0\(0),
      I3 => s_axi_mem_wvalid,
      O => \FSM_sequential_emc_addr_ps[2]_i_5_n_0\
    );
\FSM_sequential_emc_addr_ps_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_52,
      Q => emc_addr_ps(0),
      R => \^sr\(0)
    );
\FSM_sequential_emc_addr_ps_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_51,
      Q => emc_addr_ps(1),
      R => \^sr\(0)
    );
\FSM_sequential_emc_addr_ps_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_sequential_emc_addr_ps_reg[2]_i_2_n_0\,
      Q => emc_addr_ps(2),
      R => \^sr\(0)
    );
\FSM_sequential_emc_addr_ps_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \FSM_sequential_emc_addr_ps[2]_i_3_n_0\,
      I1 => \FSM_sequential_emc_addr_ps[2]_i_4_n_0\,
      O => \FSM_sequential_emc_addr_ps_reg[2]_i_2_n_0\,
      S => emc_addr_ps(2)
    );
\LEN_GEN_32.derived_len_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => \derived_size_reg[0]_i_1_n_0\,
      I1 => burst_length_cmb(2),
      I2 => burst_length_cmb(1),
      I3 => p_0_in1_in,
      I4 => burst_length_cmb(0),
      O => \LEN_GEN_32.derived_len_reg[0]_i_1_n_0\
    );
\LEN_GEN_32.derived_len_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => \derived_size_reg[0]_i_1_n_0\,
      I1 => burst_length_cmb(3),
      I2 => burst_length_cmb(2),
      I3 => p_0_in1_in,
      I4 => burst_length_cmb(1),
      O => \LEN_GEN_32.derived_len_reg[1]_i_1_n_0\
    );
\LEN_GEN_32.derived_len_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8FFB800B800B800"
    )
        port map (
      I0 => s_axi_mem_arlen(2),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(2),
      I3 => p_0_in1_in,
      I4 => \derived_size_reg[0]_i_1_n_0\,
      I5 => burst_length_cmb(3),
      O => \LEN_GEN_32.derived_len_reg[2]_i_1_n_0\
    );
\LEN_GEN_32.derived_len_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCA000A0"
    )
        port map (
      I0 => s_axi_mem_awlen(3),
      I1 => s_axi_mem_arlen(3),
      I2 => s_axi_mem_awsize(1),
      I3 => rnw_cmb,
      I4 => s_axi_mem_arsize(1),
      O => \LEN_GEN_32.derived_len_reg[3]_i_1_n_0\
    );
\LEN_GEN_32.derived_len_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => \LEN_GEN_32.derived_len_reg[0]_i_1_n_0\,
      Q => derived_len_reg(0),
      R => '0'
    );
\LEN_GEN_32.derived_len_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => \LEN_GEN_32.derived_len_reg[1]_i_1_n_0\,
      Q => derived_len_reg(1),
      R => '0'
    );
\LEN_GEN_32.derived_len_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => \LEN_GEN_32.derived_len_reg[2]_i_1_n_0\,
      Q => derived_len_reg(2),
      R => '0'
    );
\LEN_GEN_32.derived_len_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => \LEN_GEN_32.derived_len_reg[3]_i_1_n_0\,
      Q => derived_len_reg(3),
      R => '0'
    );
\PERBIT_GEN[1].MUXCY_i1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8A8A800"
    )
        port map (
      I0 => \^type_of_xfer\,
      I1 => temp_bus2ip_be(3),
      I2 => temp_bus2ip_be(2),
      I3 => temp_bus2ip_be(1),
      I4 => temp_bus2ip_be(0),
      O => \PERBIT_GEN[1].MUXCY_i1_i_2_n_0\
    );
\PERBIT_GEN[7].MULT_AND_i1_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => bus2ip_burstlength(5),
      I1 => bus2ip_burstlength(4),
      I2 => bus2ip_burstlength(3),
      I3 => bus2ip_burstlength(2),
      I4 => bus2ip_burstlength(0),
      I5 => bus2ip_burstlength(1),
      O => \PERBIT_GEN[7].MULT_AND_i1_i_5_n_0\
    );
RDATA_FIFO_I: entity work.design_1_axi_emc_0_0_srl_fifo_rbu_f
     port map (
      \BUS2IP_ADDR_GEN_DATA_WDTH_32.internal_count_reg[1]\ => RDATA_FIFO_I_n_2,
      Bus2IP_RdReq_d1_reg => RDATA_FIFO_I_n_7,
      E(0) => RDATA_FIFO_I_n_4,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\(0) => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_10,
      \MEM_DECODE_GEN[0].rdce_out_i_reg[0]\ => RDATA_FIFO_I_n_5,
      Q(0) => RDATA_FIFO_I_n_0,
      \burst_data_cnt_reg[2]\ => AXI_EMC_ADDR_GEN_INSTANCE_I_n_40,
      \burst_data_cnt_reg[6]\ => Bus2IP_RdReq_d1_i_3_n_0,
      \burst_data_cnt_reg[7]\(3 downto 0) => burst_data_cnt(7 downto 4),
      \burst_data_cnt_reg[7]_0\ => Bus2IP_RdReq_d1_i_4_n_0,
      \bus2ip_BE_reg_reg[0]\ => RDATA_FIFO_I_n_8,
      bus2ip_reset => bus2ip_reset,
      bus2ip_rnw => bus2ip_rnw,
      enable_cs_cmb => enable_cs_cmb,
      enable_cs_cmb126_out => enable_cs_cmb126_out,
      enable_rdce_cmb => enable_rdce_cmb,
      \in\(0) => Q(7),
      \in\(1) => Q(6),
      \in\(2) => Q(5),
      \in\(3) => Q(4),
      \in\(4) => Q(3),
      \in\(5) => Q(2),
      \in\(6) => Q(1),
      \in\(7) => Q(0),
      \in\(8) => Q(15),
      \in\(9) => Q(14),
      \in\(10) => Q(13),
      \in\(11) => Q(12),
      \in\(12) => Q(11),
      \in\(13) => Q(10),
      \in\(14) => Q(9),
      \in\(15) => Q(8),
      \in\(16) => Q(23),
      \in\(17) => Q(22),
      \in\(18) => Q(21),
      \in\(19) => Q(20),
      \in\(20) => Q(19),
      \in\(21) => Q(18),
      \in\(22) => Q(17),
      \in\(23) => Q(16),
      \in\(24) => Q(31),
      \in\(25) => Q(30),
      \in\(26) => Q(29),
      \in\(27) => Q(28),
      \in\(28) => Q(27),
      \in\(29) => Q(26),
      \in\(30) => Q(25),
      \in\(31) => Q(24),
      \in\(32) => rd_fifo_data_in(0),
      ip2bus_addrack => \^ip2bus_addrack\,
      ip2bus_rdack => ip2bus_rdack,
      last_data_cmb0 => last_data_cmb0,
      last_len_cmb => last_len_cmb,
      \out\(2 downto 0) => emc_addr_ps(2 downto 0),
      rd_fifo_wr_en => rd_fifo_wr_en,
      rst_rdce_cmb => rst_rdce_cmb,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_mem_rdata(31 downto 0) => s_axi_mem_rdata(31 downto 0),
      s_axi_mem_rready => s_axi_mem_rready,
      s_axi_mem_rresp(0) => s_axi_mem_rresp(0),
      s_axi_mem_rvalid => s_axi_mem_rvalid
    );
addr_sm_ns_IDLE_cmb: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003000000030505"
    )
        port map (
      I0 => addr_sm_ns_IDLE_cmb_i_1_n_0,
      I1 => addr_sm_ns_IDLE_cmb_i_2_n_0,
      I2 => emc_addr_ns(0),
      I3 => addr_sm_ns_IDLE_cmb_i_4_n_0,
      I4 => emc_addr_ps(2),
      I5 => addr_sm_ns_IDLE_cmb_i_5_n_0,
      O => addr_sm_ns_IDLE_cmb_n_0
    );
addr_sm_ns_IDLE_cmb_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFD00F0FDFD00000"
    )
        port map (
      I0 => Write_req_data_ack_cmb,
      I1 => s_axi_mem_wvalid,
      I2 => emc_addr_ps(1),
      I3 => p_1_in,
      I4 => emc_addr_ps(0),
      I5 => addr_sm_ns_IDLE_cmb_i_7_n_0,
      O => addr_sm_ns_IDLE_cmb_i_1_n_0
    );
addr_sm_ns_IDLE_cmb_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA2FFFF"
    )
        port map (
      I0 => s_axi_mem_wvalid,
      I1 => \burst_addr_cnt_reg__0\(0),
      I2 => \burst_addr_cnt_reg__1\(1),
      I3 => addr_sm_ns_IDLE_cmb_i_20_n_0,
      I4 => Write_req_data_ack_cmb,
      O => addr_sm_ns_IDLE_cmb_i_10_n_0
    );
addr_sm_ns_IDLE_cmb_i_17: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => s_axi_mem_awlen(3),
      I1 => s_axi_mem_arlen(3),
      I2 => s_axi_mem_awlen(2),
      I3 => rnw_cmb,
      I4 => s_axi_mem_arlen(2),
      O => addr_sm_ns_IDLE_cmb_i_17_n_0
    );
addr_sm_ns_IDLE_cmb_i_18: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => s_axi_mem_awlen(0),
      I1 => s_axi_mem_arlen(0),
      I2 => s_axi_mem_awlen(1),
      I3 => rnw_cmb,
      I4 => s_axi_mem_arlen(1),
      O => addr_sm_ns_IDLE_cmb_i_18_n_0
    );
addr_sm_ns_IDLE_cmb_i_19: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^s_axi_mem_bvalid\,
      I1 => s_axi_mem_bready,
      O => addr_sm_ns_IDLE_cmb_i_19_n_0
    );
addr_sm_ns_IDLE_cmb_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F7F7F70"
    )
        port map (
      I0 => \^s_axi_mem_bvalid\,
      I1 => s_axi_mem_bready,
      I2 => emc_addr_ps(1),
      I3 => s_axi_mem_wvalid,
      I4 => emc_addr_ps(0),
      O => addr_sm_ns_IDLE_cmb_i_2_n_0
    );
addr_sm_ns_IDLE_cmb_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \burst_addr_cnt_reg__1\(7),
      I1 => \burst_addr_cnt_reg__1\(2),
      I2 => \burst_addr_cnt_reg__1\(3),
      I3 => \burst_addr_cnt_reg__1\(6),
      I4 => \burst_addr_cnt_reg__1\(4),
      I5 => \burst_addr_cnt_reg__1\(5),
      O => addr_sm_ns_IDLE_cmb_i_20_n_0
    );
addr_sm_ns_IDLE_cmb_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F707F7F7F7F7F7F"
    )
        port map (
      I0 => \^s_axi_mem_bvalid\,
      I1 => s_axi_mem_bready,
      I2 => emc_addr_ps(1),
      I3 => emc_addr_ps(0),
      I4 => s_axi_mem_wvalid,
      I5 => last_addr0,
      O => addr_sm_ns_IDLE_cmb_i_4_n_0
    );
addr_sm_ns_IDLE_cmb_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444400000300"
    )
        port map (
      I0 => addr_sm_ns_IDLE_cmb_i_10_n_0,
      I1 => emc_addr_ps(1),
      I2 => last_len_cmb,
      I3 => enable_cs_cmb0,
      I4 => enable_cs_cmb126_out,
      I5 => emc_addr_ps(0),
      O => addr_sm_ns_IDLE_cmb_i_5_n_0
    );
addr_sm_ns_IDLE_cmb_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFF00010000"
    )
        port map (
      I0 => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_42,
      I1 => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_41,
      I2 => addr_sm_ns_IDLE_cmb_i_17_n_0,
      I3 => addr_sm_ns_IDLE_cmb_i_18_n_0,
      I4 => enable_cs_cmb126_out,
      I5 => enable_cs_cmb0,
      O => addr_sm_ns_IDLE_cmb_i_7_n_0
    );
addr_sm_ns_IDLE_cmb_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0A0A0CFC0C0C0"
    )
        port map (
      I0 => addr_sm_ns_IDLE_cmb_i_10_n_0,
      I1 => p_1_in,
      I2 => emc_addr_ps(1),
      I3 => last_len_cmb,
      I4 => store_addr_info_cmb,
      I5 => emc_addr_ps(0),
      O => addr_sm_ns_IDLE_cmb_i_8_n_0
    );
addr_sm_ps_IDLE_reg_reg: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_sm_ns_IDLE_cmb_n_0,
      Q => addr_sm_ps_IDLE_reg,
      S => \^sr\(0)
    );
\axi_trans_size_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F780"
    )
        port map (
      I0 => rnw_cmb,
      I1 => enable_cs_cmb,
      I2 => s_axi_mem_arsize(0),
      I3 => axi_trans_size_reg_int(0),
      O => \axi_trans_size_reg[0]_i_1_n_0\
    );
\axi_trans_size_reg[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F780"
    )
        port map (
      I0 => rnw_cmb,
      I1 => enable_cs_cmb,
      I2 => s_axi_mem_arsize(1),
      I3 => \^axi_trans_size_reg_reg[1]_0\(0),
      O => \axi_trans_size_reg[1]_i_1_n_0\
    );
\axi_trans_size_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \axi_trans_size_reg[0]_i_1_n_0\,
      Q => axi_trans_size_reg_int(0),
      R => \^sr\(0)
    );
\axi_trans_size_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \axi_trans_size_reg[1]_i_1_n_0\,
      Q => \^axi_trans_size_reg_reg[1]_0\(0),
      R => \^sr\(0)
    );
\burst_addr_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F5C53505"
    )
        port map (
      I0 => \burst_addr_cnt_reg__0\(0),
      I1 => rnw_cmb,
      I2 => enable_cs_cmb,
      I3 => s_axi_mem_awlen(0),
      I4 => s_axi_mem_arlen(0),
      O => \p_0_in__0\(0)
    );
\burst_addr_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACFFAC00AC00ACFF"
    )
        port map (
      I0 => s_axi_mem_arlen(1),
      I1 => s_axi_mem_awlen(1),
      I2 => rnw_cmb,
      I3 => enable_cs_cmb,
      I4 => \burst_addr_cnt_reg__0\(0),
      I5 => \burst_addr_cnt_reg__1\(1),
      O => \p_0_in__0\(1)
    );
\burst_addr_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACACACACFF0000FF"
    )
        port map (
      I0 => s_axi_mem_arlen(2),
      I1 => s_axi_mem_awlen(2),
      I2 => rnw_cmb,
      I3 => \burst_addr_cnt[2]_i_2_n_0\,
      I4 => \burst_addr_cnt_reg__1\(2),
      I5 => enable_cs_cmb,
      O => \p_0_in__0\(2)
    );
\burst_addr_cnt[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \burst_addr_cnt_reg__0\(0),
      I1 => \burst_addr_cnt_reg__1\(1),
      O => \burst_addr_cnt[2]_i_2_n_0\
    );
\burst_addr_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFFFEAAAB"
    )
        port map (
      I0 => \burst_addr_cnt[3]_i_2_n_0\,
      I1 => \burst_addr_cnt_reg__1\(1),
      I2 => \burst_addr_cnt_reg__0\(0),
      I3 => \burst_addr_cnt_reg__1\(2),
      I4 => \burst_addr_cnt_reg__1\(3),
      I5 => enable_cs_cmb,
      O => \p_0_in__0\(3)
    );
\burst_addr_cnt[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => s_axi_mem_arlen(3),
      I1 => s_axi_mem_awlen(3),
      I2 => enable_cs_cmb,
      I3 => rnw_cmb,
      O => \burst_addr_cnt[3]_i_2_n_0\
    );
\burst_addr_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACFFAC00AC00ACFF"
    )
        port map (
      I0 => s_axi_mem_arlen(4),
      I1 => s_axi_mem_awlen(4),
      I2 => rnw_cmb,
      I3 => enable_cs_cmb,
      I4 => \burst_addr_cnt[7]_i_5_n_0\,
      I5 => \burst_addr_cnt_reg__1\(4),
      O => \p_0_in__0\(4)
    );
\burst_addr_cnt[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAFEAB"
    )
        port map (
      I0 => \burst_addr_cnt[5]_i_2_n_0\,
      I1 => \burst_addr_cnt[7]_i_5_n_0\,
      I2 => \burst_addr_cnt_reg__1\(4),
      I3 => \burst_addr_cnt_reg__1\(5),
      I4 => enable_cs_cmb,
      O => \p_0_in__0\(5)
    );
\burst_addr_cnt[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => s_axi_mem_arlen(5),
      I1 => s_axi_mem_awlen(5),
      I2 => enable_cs_cmb,
      I3 => rnw_cmb,
      O => \burst_addr_cnt[5]_i_2_n_0\
    );
\burst_addr_cnt[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFFFEAAAB"
    )
        port map (
      I0 => \burst_addr_cnt[6]_i_2_n_0\,
      I1 => \burst_addr_cnt_reg__1\(5),
      I2 => \burst_addr_cnt_reg__1\(4),
      I3 => \burst_addr_cnt[7]_i_5_n_0\,
      I4 => \burst_addr_cnt_reg__1\(6),
      I5 => enable_cs_cmb,
      O => \p_0_in__0\(6)
    );
\burst_addr_cnt[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => s_axi_mem_arlen(6),
      I1 => s_axi_mem_awlen(6),
      I2 => enable_cs_cmb,
      I3 => rnw_cmb,
      O => \burst_addr_cnt[6]_i_2_n_0\
    );
\burst_addr_cnt[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAFEAB"
    )
        port map (
      I0 => \burst_addr_cnt[7]_i_3_n_0\,
      I1 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_38,
      I2 => \burst_addr_cnt[7]_i_5_n_0\,
      I3 => \burst_addr_cnt_reg__1\(7),
      I4 => enable_cs_cmb,
      O => \p_0_in__0\(7)
    );
\burst_addr_cnt[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A0C0"
    )
        port map (
      I0 => s_axi_mem_arlen(7),
      I1 => s_axi_mem_awlen(7),
      I2 => enable_cs_cmb,
      I3 => rnw_cmb,
      O => \burst_addr_cnt[7]_i_3_n_0\
    );
\burst_addr_cnt[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \burst_addr_cnt_reg__1\(3),
      I1 => \burst_addr_cnt_reg__1\(2),
      I2 => \burst_addr_cnt_reg__1\(1),
      I3 => \burst_addr_cnt_reg__0\(0),
      O => \burst_addr_cnt[7]_i_5_n_0\
    );
\burst_addr_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(0),
      Q => \burst_addr_cnt_reg__0\(0),
      R => '0'
    );
\burst_addr_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(1),
      Q => \burst_addr_cnt_reg__1\(1),
      R => '0'
    );
\burst_addr_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(2),
      Q => \burst_addr_cnt_reg__1\(2),
      R => '0'
    );
\burst_addr_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(3),
      Q => \burst_addr_cnt_reg__1\(3),
      R => '0'
    );
\burst_addr_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(4),
      Q => \burst_addr_cnt_reg__1\(4),
      R => '0'
    );
\burst_addr_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(5),
      Q => \burst_addr_cnt_reg__1\(5),
      R => '0'
    );
\burst_addr_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(6),
      Q => \burst_addr_cnt_reg__1\(6),
      R => '0'
    );
\burst_addr_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_15,
      D => \p_0_in__0\(7),
      Q => \burst_addr_cnt_reg__1\(7),
      R => '0'
    );
\burst_data_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F5C53505"
    )
        port map (
      I0 => burst_data_cnt(0),
      I1 => rnw_cmb,
      I2 => enable_cs_cmb,
      I3 => s_axi_mem_awlen(0),
      I4 => s_axi_mem_arlen(0),
      O => p_2_in(0)
    );
\burst_data_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACFFAC00AC00ACFF"
    )
        port map (
      I0 => s_axi_mem_arlen(1),
      I1 => s_axi_mem_awlen(1),
      I2 => rnw_cmb,
      I3 => enable_cs_cmb,
      I4 => burst_data_cnt(0),
      I5 => burst_data_cnt(1),
      O => p_2_in(1)
    );
\burst_data_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACACACACFF0000FF"
    )
        port map (
      I0 => s_axi_mem_arlen(2),
      I1 => s_axi_mem_awlen(2),
      I2 => rnw_cmb,
      I3 => \burst_data_cnt[2]_i_2_n_0\,
      I4 => burst_data_cnt(2),
      I5 => enable_cs_cmb,
      O => p_2_in(2)
    );
\burst_data_cnt[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => burst_data_cnt(0),
      I1 => burst_data_cnt(1),
      O => \burst_data_cnt[2]_i_2_n_0\
    );
\burst_data_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACFFAC00AC00ACFF"
    )
        port map (
      I0 => s_axi_mem_arlen(3),
      I1 => s_axi_mem_awlen(3),
      I2 => rnw_cmb,
      I3 => enable_cs_cmb,
      I4 => \burst_data_cnt[3]_i_2_n_0\,
      I5 => burst_data_cnt(3),
      O => p_2_in(3)
    );
\burst_data_cnt[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => burst_data_cnt(1),
      I1 => burst_data_cnt(0),
      I2 => burst_data_cnt(2),
      O => \burst_data_cnt[3]_i_2_n_0\
    );
\burst_data_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACFFAC00AC00ACFF"
    )
        port map (
      I0 => s_axi_mem_arlen(4),
      I1 => s_axi_mem_awlen(4),
      I2 => rnw_cmb,
      I3 => enable_cs_cmb,
      I4 => burst_data_cnt(4),
      I5 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_40,
      O => p_2_in(4)
    );
\burst_data_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACFFAC00AC00ACFF"
    )
        port map (
      I0 => s_axi_mem_arlen(5),
      I1 => s_axi_mem_awlen(5),
      I2 => rnw_cmb,
      I3 => enable_cs_cmb,
      I4 => \burst_data_cnt[5]_i_2_n_0\,
      I5 => burst_data_cnt(5),
      O => p_2_in(5)
    );
\burst_data_cnt[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => burst_data_cnt(4),
      I1 => burst_data_cnt(3),
      I2 => burst_data_cnt(1),
      I3 => burst_data_cnt(0),
      I4 => burst_data_cnt(2),
      O => \burst_data_cnt[5]_i_2_n_0\
    );
\burst_data_cnt[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACFFAC00AC00ACFF"
    )
        port map (
      I0 => s_axi_mem_arlen(6),
      I1 => s_axi_mem_awlen(6),
      I2 => rnw_cmb,
      I3 => enable_cs_cmb,
      I4 => \burst_data_cnt[6]_i_2_n_0\,
      I5 => burst_data_cnt(6),
      O => p_2_in(6)
    );
\burst_data_cnt[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => burst_data_cnt(2),
      I1 => burst_data_cnt(0),
      I2 => burst_data_cnt(1),
      I3 => burst_data_cnt(3),
      I4 => burst_data_cnt(4),
      I5 => burst_data_cnt(5),
      O => \burst_data_cnt[6]_i_2_n_0\
    );
\burst_data_cnt[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => ip2bus_rdack,
      I1 => last_data_cmb0,
      I2 => enable_cs_cmb,
      O => \burst_data_cnt[7]_i_1_n_0\
    );
\burst_data_cnt[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACACACACFF0000FF"
    )
        port map (
      I0 => s_axi_mem_arlen(7),
      I1 => s_axi_mem_awlen(7),
      I2 => rnw_cmb,
      I3 => \burst_data_cnt[7]_i_4_n_0\,
      I4 => burst_data_cnt(7),
      I5 => enable_cs_cmb,
      O => p_2_in(7)
    );
\burst_data_cnt[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => burst_data_cnt(5),
      I1 => burst_data_cnt(4),
      I2 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_40,
      I3 => burst_data_cnt(6),
      O => \burst_data_cnt[7]_i_4_n_0\
    );
\burst_data_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(0),
      Q => burst_data_cnt(0),
      R => \^sr\(0)
    );
\burst_data_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(1),
      Q => burst_data_cnt(1),
      R => \^sr\(0)
    );
\burst_data_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(2),
      Q => burst_data_cnt(2),
      R => \^sr\(0)
    );
\burst_data_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(3),
      Q => burst_data_cnt(3),
      R => \^sr\(0)
    );
\burst_data_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(4),
      Q => burst_data_cnt(4),
      R => \^sr\(0)
    );
\burst_data_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(5),
      Q => burst_data_cnt(5),
      R => \^sr\(0)
    );
\burst_data_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(6),
      Q => burst_data_cnt(6),
      R => \^sr\(0)
    );
\burst_data_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \burst_data_cnt[7]_i_1_n_0\,
      D => p_2_in(7),
      Q => burst_data_cnt(7),
      R => \^sr\(0)
    );
\burstlength_reg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(4),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(4),
      O => data(4)
    );
\burstlength_reg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(5),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(5),
      O => data(5)
    );
\burstlength_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(6),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(6),
      O => data(6)
    );
\burstlength_reg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arlen(7),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awlen(7),
      O => data(7)
    );
\burstlength_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => burst_length_cmb(0),
      Q => bus2ip_burstlength(7),
      R => \^sr\(0)
    );
\burstlength_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => burst_length_cmb(1),
      Q => bus2ip_burstlength(6),
      R => \^sr\(0)
    );
\burstlength_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => burst_length_cmb(2),
      Q => bus2ip_burstlength(5),
      R => \^sr\(0)
    );
\burstlength_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => burst_length_cmb(3),
      Q => bus2ip_burstlength(4),
      R => \^sr\(0)
    );
\burstlength_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => data(4),
      Q => bus2ip_burstlength(3),
      R => \^sr\(0)
    );
\burstlength_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => data(5),
      Q => bus2ip_burstlength(2),
      R => \^sr\(0)
    );
\burstlength_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => data(6),
      Q => bus2ip_burstlength(1),
      R => \^sr\(0)
    );
\burstlength_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => data(7),
      Q => bus2ip_burstlength(0),
      R => \^sr\(0)
    );
\bus2ip_BE_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABAAABABAAAAAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[0]_i_2_n_0\,
      I1 => \bus2ip_BE_reg1__1\,
      I2 => enable_cs_cmb,
      I3 => \derived_size_reg_reg_n_0_[0]\,
      I4 => temp_bus2ip_be(2),
      I5 => temp_bus2ip_be(3),
      O => \bus2ip_BE_reg[0]_i_1_n_0\
    );
\bus2ip_BE_reg[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEAAEEAAEEFAEEAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[3]_i_5_n_0\,
      I1 => s_axi_mem_wstrb(0),
      I2 => \bus2ip_BE_reg[2]_i_3_n_0\,
      I3 => \bus2ip_BE_reg1__1\,
      I4 => enable_cs_cmb,
      I5 => s_axi_mem_araddr(1),
      O => \bus2ip_BE_reg[0]_i_2_n_0\
    );
\bus2ip_BE_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABAAABABAAAAAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[1]_i_2_n_0\,
      I1 => \bus2ip_BE_reg1__1\,
      I2 => enable_cs_cmb,
      I3 => \derived_size_reg_reg_n_0_[0]\,
      I4 => temp_bus2ip_be(3),
      I5 => temp_bus2ip_be(0),
      O => \bus2ip_BE_reg[1]_i_1_n_0\
    );
\bus2ip_BE_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEAAEEAAEEFAEEAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[3]_i_5_n_0\,
      I1 => s_axi_mem_wstrb(1),
      I2 => enable_cs_cmb,
      I3 => \bus2ip_BE_reg1__1\,
      I4 => \bus2ip_BE_reg[3]_i_6_n_0\,
      I5 => s_axi_mem_araddr(1),
      O => \bus2ip_BE_reg[1]_i_2_n_0\
    );
\bus2ip_BE_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABAAABABAAAAAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[2]_i_2_n_0\,
      I1 => \bus2ip_BE_reg1__1\,
      I2 => enable_cs_cmb,
      I3 => \derived_size_reg_reg_n_0_[0]\,
      I4 => temp_bus2ip_be(0),
      I5 => temp_bus2ip_be(1),
      O => \bus2ip_BE_reg[2]_i_1_n_0\
    );
\bus2ip_BE_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFAEEAAEEAAEEAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[3]_i_5_n_0\,
      I1 => s_axi_mem_wstrb(2),
      I2 => \bus2ip_BE_reg[2]_i_3_n_0\,
      I3 => \bus2ip_BE_reg1__1\,
      I4 => enable_cs_cmb,
      I5 => s_axi_mem_araddr(1),
      O => \bus2ip_BE_reg[2]_i_2_n_0\
    );
\bus2ip_BE_reg[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E2FF"
    )
        port map (
      I0 => s_axi_mem_awsize(0),
      I1 => rnw_cmb,
      I2 => s_axi_mem_arsize(0),
      I3 => s_axi_mem_araddr(0),
      O => \bus2ip_BE_reg[2]_i_3_n_0\
    );
\bus2ip_BE_reg[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABAAABABAAAAAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[3]_i_4_n_0\,
      I1 => \bus2ip_BE_reg1__1\,
      I2 => enable_cs_cmb,
      I3 => \derived_size_reg_reg_n_0_[0]\,
      I4 => temp_bus2ip_be(1),
      I5 => temp_bus2ip_be(2),
      O => \bus2ip_BE_reg[3]_i_2_n_0\
    );
\bus2ip_BE_reg[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => rnw_cmb,
      I1 => s_axi_mem_wvalid,
      I2 => \^s_axi_mem_wready\,
      O => \bus2ip_BE_reg1__1\
    );
\bus2ip_BE_reg[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFAEEAAEEAAEEAA"
    )
        port map (
      I0 => \bus2ip_BE_reg[3]_i_5_n_0\,
      I1 => s_axi_mem_wstrb(3),
      I2 => enable_cs_cmb,
      I3 => \bus2ip_BE_reg1__1\,
      I4 => \bus2ip_BE_reg[3]_i_6_n_0\,
      I5 => s_axi_mem_araddr(1),
      O => \bus2ip_BE_reg[3]_i_4_n_0\
    );
\bus2ip_BE_reg[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E200E200FF0000"
    )
        port map (
      I0 => s_axi_mem_awsize(1),
      I1 => rnw_cmb,
      I2 => s_axi_mem_arsize(1),
      I3 => \bus2ip_BE_reg1__1\,
      I4 => \derived_size_reg_reg_n_0_[1]\,
      I5 => enable_cs_cmb,
      O => \bus2ip_BE_reg[3]_i_5_n_0\
    );
\bus2ip_BE_reg[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => s_axi_mem_araddr(0),
      I1 => s_axi_mem_awsize(0),
      I2 => rnw_cmb,
      I3 => s_axi_mem_arsize(0),
      O => \bus2ip_BE_reg[3]_i_6_n_0\
    );
\bus2ip_BE_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_16,
      D => \bus2ip_BE_reg[0]_i_1_n_0\,
      Q => temp_bus2ip_be(0),
      R => \^sr\(0)
    );
\bus2ip_BE_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_16,
      D => \bus2ip_BE_reg[1]_i_1_n_0\,
      Q => temp_bus2ip_be(1),
      R => \^sr\(0)
    );
\bus2ip_BE_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_16,
      D => \bus2ip_BE_reg[2]_i_1_n_0\,
      Q => temp_bus2ip_be(2),
      R => \^sr\(0)
    );
\bus2ip_BE_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_16,
      D => \bus2ip_BE_reg[3]_i_2_n_0\,
      Q => temp_bus2ip_be(3),
      R => \^sr\(0)
    );
bus2ip_burst_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88A08800"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => last_len_cmb,
      I2 => \^bus2ip_burst_reg\,
      I3 => enable_cs_cmb,
      I4 => last_data_cmb0,
      O => bus2ip_burst_reg_i_1_n_0
    );
bus2ip_burst_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_burst_reg_i_1_n_0,
      Q => \^bus2ip_burst_reg\,
      R => '0'
    );
\bus2ip_data_reg[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_mem_wvalid,
      I1 => \^s_axi_mem_wready\,
      O => bus2ip_data_reg0
    );
\bus2ip_data_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(0),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(0),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(10),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(10),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(11),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(11),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(12),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(12),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(13),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(13),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(14),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(14),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(15),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(15),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(16),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(16),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(17),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(17),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(18),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(18),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(19),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(19),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(1),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(1),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(20),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(20),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(21),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(21),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(22),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(22),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(23),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(23),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(24),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(24),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(25),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(25),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(26),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(26),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(27),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(27),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(28),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(28),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(29),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(29),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(2),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(2),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(30),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(30),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(31),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(31),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(3),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(3),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(4),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(4),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(5),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(5),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(6),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(6),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(7),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(7),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(8),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(8),
      R => \^sr\(0)
    );
\bus2ip_data_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => bus2ip_data_reg0,
      D => s_axi_mem_wdata(9),
      Q => \DATA_STORE_GEN[24].WRDATA_REG\(9),
      R => \^sr\(0)
    );
bus2ip_rd_req_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_47,
      Q => \^bus2ip_rdreq_emc\,
      R => \^sr\(0)
    );
bus2ip_wr_req_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF5FFFFC0F5000FC"
    )
        port map (
      I0 => Write_req_data_ack_cmb,
      I1 => \^bus2ip_wr_req_cmb0\,
      I2 => emc_addr_ps(2),
      I3 => emc_addr_ps(1),
      I4 => emc_addr_ps(0),
      I5 => \^bus2ip_wrreq_i\,
      O => bus2ip_wr_req_reg_i_1_n_0
    );
bus2ip_wr_req_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_wr_req_reg_i_1_n_0,
      Q => \^bus2ip_wrreq_i\,
      R => \^sr\(0)
    );
\derived_burst_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arburst(0),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awburst(0),
      O => \derived_burst_reg[0]_i_1_n_0\
    );
\derived_burst_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arburst(1),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awburst(1),
      O => \derived_burst_reg[1]_i_1_n_0\
    );
\derived_burst_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => derived_size_reg,
      D => \derived_burst_reg[0]_i_1_n_0\,
      Q => derived_burst_reg(0),
      R => '0'
    );
\derived_burst_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => derived_size_reg,
      D => \derived_burst_reg[1]_i_1_n_0\,
      Q => derived_burst_reg(1),
      R => '0'
    );
\derived_size_reg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arsize(0),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awsize(0),
      O => \derived_size_reg[0]_i_1_n_0\
    );
\derived_size_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => enable_cs_cmb,
      O => derived_size_reg
    );
\derived_size_reg[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_mem_arsize(1),
      I1 => rnw_cmb,
      I2 => s_axi_mem_awsize(1),
      O => p_0_in1_in
    );
\derived_size_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => derived_size_reg,
      D => \derived_size_reg[0]_i_1_n_0\,
      Q => \derived_size_reg_reg_n_0_[0]\,
      R => '0'
    );
\derived_size_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => derived_size_reg,
      D => p_0_in1_in,
      Q => \derived_size_reg_reg_n_0_[1]\,
      R => '0'
    );
last_data_acked_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000ABFFAAAA"
    )
        port map (
      I0 => last_data_acked,
      I1 => \rd_data_count[7]_i_3_n_0\,
      I2 => \rd_data_count_reg__0\(7),
      I3 => last_data_cmb0,
      I4 => ip2bus_rdack,
      I5 => addr_sm_ps_idle_cmb,
      O => last_data_acked_i_1_n_0
    );
last_data_acked_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => last_data_acked_i_1_n_0,
      Q => last_data_acked,
      R => '0'
    );
\rd_data_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => s_axi_mem_arlen(0),
      I1 => enable_cs_cmb,
      I2 => \rd_data_count_reg__0\(0),
      O => p_0_in(0)
    );
\rd_data_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => \rd_data_count_reg__0\(1),
      I1 => \rd_data_count_reg__0\(0),
      I2 => enable_cs_cmb,
      I3 => s_axi_mem_arlen(1),
      O => p_0_in(1)
    );
\rd_data_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA900A9"
    )
        port map (
      I0 => \rd_data_count_reg__0\(2),
      I1 => \rd_data_count_reg__0\(0),
      I2 => \rd_data_count_reg__0\(1),
      I3 => enable_cs_cmb,
      I4 => s_axi_mem_arlen(2),
      O => p_0_in(2)
    );
\rd_data_count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA90000AAA9"
    )
        port map (
      I0 => \rd_data_count_reg__0\(3),
      I1 => \rd_data_count_reg__0\(1),
      I2 => \rd_data_count_reg__0\(0),
      I3 => \rd_data_count_reg__0\(2),
      I4 => enable_cs_cmb,
      I5 => s_axi_mem_arlen(3),
      O => p_0_in(3)
    );
\rd_data_count[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_42,
      I1 => \rd_data_count_reg__0\(4),
      I2 => enable_cs_cmb,
      I3 => s_axi_mem_arlen(4),
      O => p_0_in(4)
    );
\rd_data_count[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFC900C9"
    )
        port map (
      I0 => \rd_data_count_reg__0\(4),
      I1 => \rd_data_count_reg__0\(5),
      I2 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_42,
      I3 => enable_cs_cmb,
      I4 => s_axi_mem_arlen(5),
      O => p_0_in(5)
    );
\rd_data_count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0E10000F0E1"
    )
        port map (
      I0 => \rd_data_count_reg__0\(5),
      I1 => \rd_data_count_reg__0\(4),
      I2 => \rd_data_count_reg__0\(6),
      I3 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_42,
      I4 => enable_cs_cmb,
      I5 => s_axi_mem_arlen(6),
      O => p_0_in(6)
    );
\rd_data_count[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC3"
    )
        port map (
      I0 => s_axi_mem_arlen(7),
      I1 => \rd_data_count[7]_i_3_n_0\,
      I2 => \rd_data_count_reg__0\(7),
      I3 => enable_cs_cmb,
      O => p_0_in(7)
    );
\rd_data_count[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_42,
      I1 => \rd_data_count_reg__0\(6),
      I2 => \rd_data_count_reg__0\(4),
      I3 => \rd_data_count_reg__0\(5),
      O => \rd_data_count[7]_i_3_n_0\
    );
\rd_data_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(0),
      Q => \rd_data_count_reg__0\(0),
      R => \^sr\(0)
    );
\rd_data_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(1),
      Q => \rd_data_count_reg__0\(1),
      R => \^sr\(0)
    );
\rd_data_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(2),
      Q => \rd_data_count_reg__0\(2),
      R => \^sr\(0)
    );
\rd_data_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(3),
      Q => \rd_data_count_reg__0\(3),
      R => \^sr\(0)
    );
\rd_data_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(4),
      Q => \rd_data_count_reg__0\(4),
      R => \^sr\(0)
    );
\rd_data_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(5),
      Q => \rd_data_count_reg__0\(5),
      R => \^sr\(0)
    );
\rd_data_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(6),
      Q => \rd_data_count_reg__0\(6),
      R => \^sr\(0)
    );
\rd_data_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => RDATA_FIFO_I_n_4,
      D => p_0_in(7),
      Q => \rd_data_count_reg__0\(7),
      R => \^sr\(0)
    );
rnw_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => rnw_cmb,
      Q => bus2ip_rnw,
      R => \^sr\(0)
    );
rw_flag_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_sm_ps_IDLE_reg_reg_0,
      Q => \^rw_flag_reg\,
      R => \^sr\(0)
    );
s_axi_mem_arready_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000080800000"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => pr_idle,
      I2 => addr_sm_ps_idle_cmb,
      I3 => \^rw_flag_reg\,
      I4 => s_axi_mem_arvalid,
      I5 => s_axi_mem_awvalid,
      O => s_axi_mem_arready
    );
s_axi_mem_awready_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => pr_idle,
      I2 => emc_addr_ps(2),
      I3 => emc_addr_ps(0),
      I4 => emc_addr_ps(1),
      I5 => \^bus2ip_wr_req_cmb0\,
      O => s_axi_mem_awready
    );
\s_axi_mem_bresp_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => AXI_EMC_ADDRESS_DECODE_INSTANCE_I_n_46,
      Q => \^s_axi_mem_bresp\(0),
      R => '0'
    );
s_axi_mem_bvalid_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000022F2"
    )
        port map (
      I0 => \^s_axi_mem_bvalid\,
      I1 => s_axi_mem_bready,
      I2 => Write_req_data_ack_cmb,
      I3 => last_addr0,
      I4 => addr_sm_ps_idle_cmb,
      O => s_axi_mem_bvalid_reg_i_1_n_0
    );
s_axi_mem_bvalid_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_mem_bvalid_reg_i_1_n_0,
      Q => \^s_axi_mem_bvalid\,
      R => '0'
    );
s_axi_mem_rlast_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => last_data_acked,
      I1 => \rd_data_count_reg__0\(7),
      I2 => AXI_EMC_ADDR_GEN_INSTANCE_I_n_42,
      I3 => \rd_data_count_reg__0\(6),
      I4 => \rd_data_count_reg__0\(4),
      I5 => \rd_data_count_reg__0\(5),
      O => s_axi_mem_rlast
    );
s_axi_mem_wready_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"404040400F0A0A0A"
    )
        port map (
      I0 => emc_addr_ps(2),
      I1 => Write_req_data_ack_cmb,
      I2 => emc_addr_ps(1),
      I3 => \^bus2ip_wr_req_cmb0\,
      I4 => pr_idle,
      I5 => emc_addr_ps(0),
      O => \^s_axi_mem_wready\
    );
type_of_xfer_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFEFEFE0"
    )
        port map (
      I0 => s_axi_mem_arburst(1),
      I1 => s_axi_mem_arburst(0),
      I2 => rnw_cmb,
      I3 => s_axi_mem_awburst(1),
      I4 => s_axi_mem_awburst(0),
      O => Type_of_xfer_cmb
    );
type_of_xfer_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => enable_cs_cmb,
      D => Type_of_xfer_cmb,
      Q => \^type_of_xfer\,
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0_axi_emc is
  port (
    s_axi_mem_bvalid : out STD_LOGIC;
    s_axi_mem_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_wready : out STD_LOGIC;
    mem_wen : out STD_LOGIC;
    mem_dq_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_dq_t : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_cen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_oen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_qwen : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mem_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mem_rpn : out STD_LOGIC;
    mem_ce : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_rnw : out STD_LOGIC;
    mem_a : out STD_LOGIC_VECTOR ( 30 downto 0 );
    s_axi_mem_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_mem_arready : out STD_LOGIC;
    s_axi_mem_awready : out STD_LOGIC;
    s_axi_mem_rvalid : out STD_LOGIC;
    s_axi_mem_rlast : out STD_LOGIC;
    s_axi_mem_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_mem_bready : in STD_LOGIC;
    s_axi_mem_wvalid : in STD_LOGIC;
    s_axi_mem_arsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_mem_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_wlast : in STD_LOGIC;
    s_axi_mem_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mem_dq_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rdclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_mem_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_rready : in STD_LOGIC;
    s_axi_mem_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_mem_awsize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_arvalid : in STD_LOGIC;
    s_axi_mem_awvalid : in STD_LOGIC;
    s_axi_mem_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end design_1_axi_emc_0_0_axi_emc;

architecture STRUCTURE of design_1_axi_emc_0_0_axi_emc is
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[0].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[10].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[11].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[12].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[13].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[14].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[15].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[16].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[17].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[18].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[19].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[1].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[20].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[21].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[22].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[23].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[24].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[25].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[26].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[27].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[28].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[29].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[2].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[3].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[4].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[5].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[6].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[7].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[8].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[9].ADDRESS_REG__0\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/Cycle_cnt_en_int\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/S\ : STD_LOGIC;
  signal \ADDR_COUNTER_MUX_I/cycle_cnt\ : STD_LOGIC_VECTOR ( 0 to 1 );
  signal AXI_EMC_NATIVE_INTERFACE_I_n_0 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_45 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_46 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_56 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_57 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_59 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_62 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_63 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_76 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_77 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_82 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_83 : STD_LOGIC;
  signal AXI_EMC_NATIVE_INTERFACE_I_n_84 : STD_LOGIC;
  signal Bus2IP_RdReq_emc : STD_LOGIC;
  signal \COUNTERS_I/eqOp1_in\ : STD_LOGIC;
  signal \COUNTERS_I/eqOp4_in\ : STD_LOGIC;
  signal EMC_CTRL_I_n_55 : STD_LOGIC;
  signal EMC_CTRL_I_n_57 : STD_LOGIC;
  signal EMC_CTRL_I_n_60 : STD_LOGIC;
  signal EMC_CTRL_I_n_66 : STD_LOGIC;
  signal EMC_CTRL_I_n_69 : STD_LOGIC;
  signal EMC_CTRL_I_n_71 : STD_LOGIC;
  signal EMC_CTRL_I_n_72 : STD_LOGIC;
  signal EMC_CTRL_I_n_8 : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ : STD_LOGIC;
  signal \IPIC_IF_I/BURST_CNT/S\ : STD_LOGIC;
  signal \IPIC_IF_I/IP2Bus_RdAck0\ : STD_LOGIC;
  signal \IPIC_IF_I/burst_cnt_i\ : STD_LOGIC_VECTOR ( 0 to 7 );
  signal \IPIC_IF_I/pend_rdreq\ : STD_LOGIC;
  signal \IPIC_IF_I/pend_wrreq\ : STD_LOGIC;
  signal \IPIC_IF_I/reset_fifo\ : STD_LOGIC;
  signal \MEM_STATE_MACHINE_I/Bus2IP_RdReq_d1\ : STD_LOGIC;
  signal \MEM_STATE_MACHINE_I/Write_req_addr_ack_cmb\ : STD_LOGIC;
  attribute MAX_FANOUT : string;
  attribute MAX_FANOUT of \MEM_STATE_MACHINE_I/Write_req_addr_ack_cmb\ : signal is "30";
  attribute RTL_MAX_FANOUT : string;
  attribute RTL_MAX_FANOUT of \MEM_STATE_MACHINE_I/Write_req_addr_ack_cmb\ : signal is "found";
  signal \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb\ : STD_LOGIC;
  attribute MAX_FANOUT of \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb\ : signal is "30";
  attribute RTL_MAX_FANOUT of \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb\ : signal is "found";
  signal \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb13_out\ : STD_LOGIC;
  signal \MEM_STATE_MACHINE_I/next_state174_out\ : STD_LOGIC;
  signal \MEM_STATE_MACHINE_I/next_state181_out\ : STD_LOGIC;
  signal \MEM_STATE_MACHINE_I/read_break_reg_d1\ : STD_LOGIC;
  signal \MEM_STATE_MACHINE_I/read_req_ack_cmb\ : STD_LOGIC;
  attribute MAX_FANOUT of \MEM_STATE_MACHINE_I/read_req_ack_cmb\ : signal is "30";
  attribute RTL_MAX_FANOUT of \MEM_STATE_MACHINE_I/read_req_ack_cmb\ : signal is "found";
  signal \MEM_STATE_MACHINE_I/transaction_done_cmb17_out\ : STD_LOGIC;
  signal \MEM_STEER_I/ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ : STD_LOGIC;
  signal \MEM_STEER_I/readreq_th_reset\ : STD_LOGIC;
  signal Type_of_xfer : STD_LOGIC;
  signal addr_sm_ps_IDLE_reg : STD_LOGIC;
  signal axi_trans_size_reg_int : STD_LOGIC_VECTOR ( 1 to 1 );
  signal bus2Mem_RdReq : STD_LOGIC;
  signal bus2Mem_WrReq : STD_LOGIC;
  signal bus2ip_addr_temp : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal bus2ip_ben_fixed : STD_LOGIC_VECTOR ( 0 to 3 );
  signal bus2ip_burst_reg : STD_LOGIC;
  signal bus2ip_reset : STD_LOGIC;
  signal bus2ip_wr_req_cmb0 : STD_LOGIC;
  signal bus2ip_wrreq_i : STD_LOGIC;
  signal cycle_End : STD_LOGIC;
  signal cycle_cnt_en : STD_LOGIC;
  signal enable_cs_cmb0 : STD_LOGIC;
  signal enable_cs_cmb126_out : STD_LOGIC;
  signal ip2bus_addrack : STD_LOGIC;
  signal ip2bus_data : STD_LOGIC_VECTOR ( 0 to 31 );
  signal ip2bus_rdack : STD_LOGIC;
  signal pr_idle : STD_LOGIC;
  signal rw_flag_reg : STD_LOGIC;
  signal single_transaction : STD_LOGIC;
  signal store_addr_info_cmb : STD_LOGIC;
  signal temp_bus2ip_cs : STD_LOGIC;
  signal temp_bus2ip_data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal transaction_done_i : STD_LOGIC;
  signal twph_end : STD_LOGIC;
  attribute IOB : string;
  attribute IOB of \mem_a_int_reg[10]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[11]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[12]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[13]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[14]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[15]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[16]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[17]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[18]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[19]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[1]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[20]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[21]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[22]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[23]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[24]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[25]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[26]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[27]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[28]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[29]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[2]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[30]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[31]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[3]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[4]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[5]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[6]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[7]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[8]\ : label is "TRUE";
  attribute IOB of \mem_a_int_reg[9]\ : label is "TRUE";
begin
AXI_EMC_NATIVE_INTERFACE_I: entity work.design_1_axi_emc_0_0_axi_emc_native_interface
     port map (
      \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ => \MEM_STEER_I/ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\,
      Bus2IP_RdReq_d1 => \MEM_STATE_MACHINE_I/Bus2IP_RdReq_d1\,
      Bus2IP_RdReq_emc => Bus2IP_RdReq_emc,
      Cycle_cnt_en_int => \ADDR_COUNTER_MUX_I/Cycle_cnt_en_int\,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]\ => AXI_EMC_NATIVE_INTERFACE_I_n_76,
      \DATAWIDTH_MATCH_GEN.addr_cnt_i_reg[1]_0\ => AXI_EMC_NATIVE_INTERFACE_I_n_77,
      \DATA_STORE_GEN[24].WRDATA_REG\(31 downto 0) => temp_bus2ip_data(31 downto 0),
      \FSM_sequential_crnt_state_reg[2]\ => AXI_EMC_NATIVE_INTERFACE_I_n_46,
      \FSM_sequential_crnt_state_reg[3]\ => AXI_EMC_NATIVE_INTERFACE_I_n_45,
      IP2Bus_RdAck0 => \IPIC_IF_I/IP2Bus_RdAck0\,
      \PERBIT_GEN[0].FF_RST1_GEN.FDSE_i1\ => AXI_EMC_NATIVE_INTERFACE_I_n_82,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \ADDR_COUNTER_MUX_I/DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1\ => EMC_CTRL_I_n_60,
      \PERBIT_GEN[1].FF_RST0_GEN.FDRE_i1_0\ => EMC_CTRL_I_n_57,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\,
      Q(31) => ip2bus_data(0),
      Q(30) => ip2bus_data(1),
      Q(29) => ip2bus_data(2),
      Q(28) => ip2bus_data(3),
      Q(27) => ip2bus_data(4),
      Q(26) => ip2bus_data(5),
      Q(25) => ip2bus_data(6),
      Q(24) => ip2bus_data(7),
      Q(23) => ip2bus_data(8),
      Q(22) => ip2bus_data(9),
      Q(21) => ip2bus_data(10),
      Q(20) => ip2bus_data(11),
      Q(19) => ip2bus_data(12),
      Q(18) => ip2bus_data(13),
      Q(17) => ip2bus_data(14),
      Q(16) => ip2bus_data(15),
      Q(15) => ip2bus_data(16),
      Q(14) => ip2bus_data(17),
      Q(13) => ip2bus_data(18),
      Q(12) => ip2bus_data(19),
      Q(11) => ip2bus_data(20),
      Q(10) => ip2bus_data(21),
      Q(9) => ip2bus_data(22),
      Q(8) => ip2bus_data(23),
      Q(7) => ip2bus_data(24),
      Q(6) => ip2bus_data(25),
      Q(5) => ip2bus_data(26),
      Q(4) => ip2bus_data(27),
      Q(3) => ip2bus_data(28),
      Q(2) => ip2bus_data(29),
      Q(1) => ip2bus_data(30),
      Q(0) => ip2bus_data(31),
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => AXI_EMC_NATIVE_INTERFACE_I_n_56,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_0\ => AXI_EMC_NATIVE_INTERFACE_I_n_57,
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]_1\ => AXI_EMC_NATIVE_INTERFACE_I_n_59,
      S => \ADDR_COUNTER_MUX_I/DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/S\,
      SR(0) => AXI_EMC_NATIVE_INTERFACE_I_n_0,
      S_0 => \IPIC_IF_I/BURST_CNT/S\,
      Type_of_xfer => Type_of_xfer,
      Write_req_addr_ack_cmb => \MEM_STATE_MACHINE_I/Write_req_addr_ack_cmb\,
      Write_req_data_ack_cmb => \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb\,
      Write_req_data_ack_cmb13_out => \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb13_out\,
      addr_sm_ps_IDLE_reg => addr_sm_ps_IDLE_reg,
      addr_sm_ps_IDLE_reg_reg_0 => EMC_CTRL_I_n_72,
      \axi_trans_size_reg_reg[1]_0\(0) => axi_trans_size_reg_int(1),
      burst_cnt_i(0 to 7) => \IPIC_IF_I/burst_cnt_i\(0 to 7),
      bus2Mem_RdReq => bus2Mem_RdReq,
      bus2Mem_WrReq => bus2Mem_WrReq,
      bus2ip_addr_temp(29 downto 0) => bus2ip_addr_temp(31 downto 2),
      bus2ip_ben_fixed(0 to 3) => bus2ip_ben_fixed(0 to 3),
      bus2ip_burst_reg => bus2ip_burst_reg,
      bus2ip_burst_reg_reg_0 => EMC_CTRL_I_n_69,
      bus2ip_reset => bus2ip_reset,
      bus2ip_wr_req_cmb0 => bus2ip_wr_req_cmb0,
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      cycle_End => cycle_End,
      cycle_cnt(0 to 1) => \ADDR_COUNTER_MUX_I/cycle_cnt\(0 to 1),
      cycle_cnt_en => cycle_cnt_en,
      enable_cs_cmb0 => enable_cs_cmb0,
      enable_cs_cmb126_out => enable_cs_cmb126_out,
      eqOp1_in => \COUNTERS_I/eqOp1_in\,
      eqOp4_in => \COUNTERS_I/eqOp4_in\,
      ip2bus_addrack => ip2bus_addrack,
      ip2bus_rdack => ip2bus_rdack,
      \mem_oen_reg_reg[0]\ => AXI_EMC_NATIVE_INTERFACE_I_n_62,
      next_state174_out => \MEM_STATE_MACHINE_I/next_state174_out\,
      next_state181_out => \MEM_STATE_MACHINE_I/next_state181_out\,
      \out\(0) => EMC_CTRL_I_n_8,
      pend_rdreq => \IPIC_IF_I/pend_rdreq\,
      pend_rdreq_reg => AXI_EMC_NATIVE_INTERFACE_I_n_83,
      pend_wrreq => \IPIC_IF_I/pend_wrreq\,
      pend_wrreq_reg => AXI_EMC_NATIVE_INTERFACE_I_n_84,
      pr_idle => pr_idle,
      read_break_reg_d1 => \MEM_STATE_MACHINE_I/read_break_reg_d1\,
      read_break_reg_d1_reg => AXI_EMC_NATIVE_INTERFACE_I_n_63,
      read_req_ack_cmb => \MEM_STATE_MACHINE_I/read_req_ack_cmb\,
      readreq_th_reset => \MEM_STEER_I/readreq_th_reset\,
      reset_fifo => \IPIC_IF_I/reset_fifo\,
      rw_flag_reg => rw_flag_reg,
      rw_flag_reg_reg_0 => EMC_CTRL_I_n_71,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_mem_araddr(31 downto 0) => s_axi_mem_araddr(31 downto 0),
      s_axi_mem_arburst(1 downto 0) => s_axi_mem_arburst(1 downto 0),
      s_axi_mem_arlen(7 downto 0) => s_axi_mem_arlen(7 downto 0),
      s_axi_mem_arready => s_axi_mem_arready,
      s_axi_mem_arsize(1 downto 0) => s_axi_mem_arsize(1 downto 0),
      s_axi_mem_arvalid => s_axi_mem_arvalid,
      s_axi_mem_awaddr(31 downto 0) => s_axi_mem_awaddr(31 downto 0),
      s_axi_mem_awburst(1 downto 0) => s_axi_mem_awburst(1 downto 0),
      s_axi_mem_awlen(7 downto 0) => s_axi_mem_awlen(7 downto 0),
      s_axi_mem_awready => s_axi_mem_awready,
      s_axi_mem_awsize(1 downto 0) => s_axi_mem_awsize(1 downto 0),
      s_axi_mem_awvalid => s_axi_mem_awvalid,
      s_axi_mem_bready => s_axi_mem_bready,
      s_axi_mem_bresp(0) => s_axi_mem_bresp(0),
      s_axi_mem_bvalid => s_axi_mem_bvalid,
      s_axi_mem_rdata(31 downto 0) => s_axi_mem_rdata(31 downto 0),
      s_axi_mem_rlast => s_axi_mem_rlast,
      s_axi_mem_rready => s_axi_mem_rready,
      s_axi_mem_rresp(0) => s_axi_mem_rresp(0),
      s_axi_mem_rvalid => s_axi_mem_rvalid,
      s_axi_mem_wdata(31 downto 0) => s_axi_mem_wdata(31 downto 0),
      s_axi_mem_wready => s_axi_mem_wready,
      s_axi_mem_wstrb(3 downto 0) => s_axi_mem_wstrb(3 downto 0),
      s_axi_mem_wvalid => s_axi_mem_wvalid,
      single_transaction => single_transaction,
      store_addr_info_cmb => store_addr_info_cmb,
      temp_bus2ip_cs => temp_bus2ip_cs,
      transaction_done_cmb17_out => \MEM_STATE_MACHINE_I/transaction_done_cmb17_out\,
      transaction_done_i => transaction_done_i,
      twph_end => twph_end
    );
EMC_CTRL_I: entity work.design_1_axi_emc_0_0_EMC
     port map (
      \ADDRESS_STORE_GEN[0].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[0].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[10].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[10].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[11].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[11].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[12].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[12].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[13].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[13].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[14].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[14].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[15].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[15].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[16].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[16].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[17].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[17].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[18].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[18].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[19].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[19].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[1].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[1].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[20].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[20].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[21].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[21].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[22].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[22].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[23].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[23].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[24].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[24].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[25].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[25].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[26].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[26].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[27].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[27].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[28].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[28].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[29].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[29].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[2].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[2].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[3].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[3].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[4].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[4].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[5].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[5].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[6].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[6].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[7].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[7].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[8].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[8].ADDRESS_REG__0\,
      \ADDRESS_STORE_GEN[9].ADDRESS_REG__0\ => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[9].ADDRESS_REG__0\,
      \ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\ => \MEM_STEER_I/ASYNC_MEM_RDACK_GEN.RDACK_PIPE_GEN_ASYNC[1].RDACK_PIPE_ASYNC__0\,
      Bus2IP_RdReq_d1 => \MEM_STATE_MACHINE_I/Bus2IP_RdReq_d1\,
      Bus2IP_RdReq_d1_reg => AXI_EMC_NATIVE_INTERFACE_I_n_62,
      Bus2IP_RdReq_emc => Bus2IP_RdReq_emc,
      Cycle_cnt_en_int => \ADDR_COUNTER_MUX_I/Cycle_cnt_en_int\,
      \FSM_sequential_crnt_state_reg[0]\ => EMC_CTRL_I_n_60,
      \FSM_sequential_crnt_state_reg[1]\ => EMC_CTRL_I_n_57,
      \FSM_sequential_emc_addr_ps_reg[2]\ => EMC_CTRL_I_n_71,
      \FSM_sequential_emc_addr_ps_reg[2]_0\ => AXI_EMC_NATIVE_INTERFACE_I_n_63,
      \FSM_sequential_emc_addr_ps_reg[2]_1\ => AXI_EMC_NATIVE_INTERFACE_I_n_59,
      IP2Bus_RdAck0 => \IPIC_IF_I/IP2Bus_RdAck0\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => AXI_EMC_NATIVE_INTERFACE_I_n_83,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ => AXI_EMC_NATIVE_INTERFACE_I_n_84,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ => AXI_EMC_NATIVE_INTERFACE_I_n_82,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_2\ => AXI_EMC_NATIVE_INTERFACE_I_n_45,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_3\ => AXI_EMC_NATIVE_INTERFACE_I_n_46,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_4\ => AXI_EMC_NATIVE_INTERFACE_I_n_56,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_5\ => AXI_EMC_NATIVE_INTERFACE_I_n_57,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg_1\ => \ADDR_COUNTER_MUX_I/DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/PERBIT_GEN[0].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[1].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[2].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[3].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[4].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[5].Q_I_GEN_SUB.q_i_ns_reg\,
      \PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\ => \IPIC_IF_I/BURST_CNT/PERBIT_GEN[6].Q_I_GEN_SUB.q_i_ns_reg\,
      Q(31) => ip2bus_data(0),
      Q(30) => ip2bus_data(1),
      Q(29) => ip2bus_data(2),
      Q(28) => ip2bus_data(3),
      Q(27) => ip2bus_data(4),
      Q(26) => ip2bus_data(5),
      Q(25) => ip2bus_data(6),
      Q(24) => ip2bus_data(7),
      Q(23) => ip2bus_data(8),
      Q(22) => ip2bus_data(9),
      Q(21) => ip2bus_data(10),
      Q(20) => ip2bus_data(11),
      Q(19) => ip2bus_data(12),
      Q(18) => ip2bus_data(13),
      Q(17) => ip2bus_data(14),
      Q(16) => ip2bus_data(15),
      Q(15) => ip2bus_data(16),
      Q(14) => ip2bus_data(17),
      Q(13) => ip2bus_data(18),
      Q(12) => ip2bus_data(19),
      Q(11) => ip2bus_data(20),
      Q(10) => ip2bus_data(21),
      Q(9) => ip2bus_data(22),
      Q(8) => ip2bus_data(23),
      Q(7) => ip2bus_data(24),
      Q(6) => ip2bus_data(25),
      Q(5) => ip2bus_data(26),
      Q(4) => ip2bus_data(27),
      Q(3) => ip2bus_data(28),
      Q(2) => ip2bus_data(29),
      Q(1) => ip2bus_data(30),
      Q(0) => ip2bus_data(31),
      \RDDATA_PATH_MUX_GEN.ASYNC_ADDR_CNT_GEN.addr_cnt_d1_reg[1]\ => EMC_CTRL_I_n_66,
      S => \IPIC_IF_I/BURST_CNT/S\,
      SR(0) => bus2ip_reset,
      S_0 => \ADDR_COUNTER_MUX_I/DATAWIDTH_MATCH_GEN.CYCLE_END_CNTR_I/S\,
      Type_of_xfer => Type_of_xfer,
      Write_req_addr_ack_cmb => \MEM_STATE_MACHINE_I/Write_req_addr_ack_cmb\,
      Write_req_data_ack_cmb => \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb\,
      Write_req_data_ack_cmb13_out => \MEM_STATE_MACHINE_I/Write_req_data_ack_cmb13_out\,
      addr_sm_ps_IDLE_reg => addr_sm_ps_IDLE_reg,
      \axi_trans_size_reg_reg[1]\(0) => axi_trans_size_reg_int(1),
      burst_cnt_i(0 to 7) => \IPIC_IF_I/burst_cnt_i\(0 to 7),
      bus2Mem_RdReq => bus2Mem_RdReq,
      bus2Mem_WrReq => bus2Mem_WrReq,
      \bus2ip_BE_reg_reg[0]\ => AXI_EMC_NATIVE_INTERFACE_I_n_76,
      \bus2ip_BE_reg_reg[3]\ => AXI_EMC_NATIVE_INTERFACE_I_n_77,
      bus2ip_addr_temp(29 downto 0) => bus2ip_addr_temp(31 downto 2),
      bus2ip_ben_fixed(0 to 3) => bus2ip_ben_fixed(0 to 3),
      bus2ip_burst_reg => bus2ip_burst_reg,
      \bus2ip_data_reg_reg[31]\(31 downto 0) => temp_bus2ip_data(31 downto 0),
      bus2ip_wr_req_cmb0 => bus2ip_wr_req_cmb0,
      bus2ip_wrreq_i => bus2ip_wrreq_i,
      cycle_End => cycle_End,
      cycle_cnt(0 to 1) => \ADDR_COUNTER_MUX_I/cycle_cnt\(0 to 1),
      cycle_cnt_en => cycle_cnt_en,
      enable_cs_cmb0 => enable_cs_cmb0,
      enable_cs_cmb126_out => enable_cs_cmb126_out,
      eqOp1_in => \COUNTERS_I/eqOp1_in\,
      eqOp4_in => \COUNTERS_I/eqOp4_in\,
      ip2bus_addrack => ip2bus_addrack,
      ip2bus_rdack => ip2bus_rdack,
      \mem_a_int_reg[31]\ => EMC_CTRL_I_n_55,
      mem_ben(1 downto 0) => mem_ben(1 downto 0),
      mem_ce(0) => mem_ce(0),
      mem_cen(0) => mem_cen(0),
      mem_dq_i(15 downto 0) => mem_dq_i(15 downto 0),
      mem_dq_o(15 downto 0) => mem_dq_o(15 downto 0),
      mem_dq_t(15 downto 0) => mem_dq_t(15 downto 0),
      mem_oen(0) => mem_oen(0),
      mem_qwen(1 downto 0) => mem_qwen(1 downto 0),
      mem_rnw => mem_rnw,
      mem_rpn => mem_rpn,
      mem_wen => mem_wen,
      next_state174_out => \MEM_STATE_MACHINE_I/next_state174_out\,
      next_state181_out => \MEM_STATE_MACHINE_I/next_state181_out\,
      \out\(0) => EMC_CTRL_I_n_8,
      pend_rdreq => \IPIC_IF_I/pend_rdreq\,
      pend_rdreq_reg => EMC_CTRL_I_n_69,
      pend_wrreq => \IPIC_IF_I/pend_wrreq\,
      pr_idle => pr_idle,
      rdclk => rdclk,
      read_break_reg_d1 => \MEM_STATE_MACHINE_I/read_break_reg_d1\,
      read_req_ack_cmb => \MEM_STATE_MACHINE_I/read_req_ack_cmb\,
      readreq_th_reset => \MEM_STEER_I/readreq_th_reset\,
      reset_fifo => \IPIC_IF_I/reset_fifo\,
      rw_flag_reg => rw_flag_reg,
      rw_flag_reg_reg => EMC_CTRL_I_n_72,
      s_axi_aclk => s_axi_aclk,
      s_axi_mem_arburst(1 downto 0) => s_axi_mem_arburst(1 downto 0),
      s_axi_mem_arvalid => s_axi_mem_arvalid,
      s_axi_mem_awburst(1 downto 0) => s_axi_mem_awburst(1 downto 0),
      s_axi_mem_awvalid => s_axi_mem_awvalid,
      s_axi_mem_wlast => s_axi_mem_wlast,
      s_axi_mem_wvalid => s_axi_mem_wvalid,
      single_transaction => single_transaction,
      store_addr_info_cmb => store_addr_info_cmb,
      temp_bus2ip_cs => temp_bus2ip_cs,
      transaction_done_cmb17_out => \MEM_STATE_MACHINE_I/transaction_done_cmb17_out\,
      transaction_done_i => transaction_done_i,
      twph_end => twph_end
    );
bus2ip_reset_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => AXI_EMC_NATIVE_INTERFACE_I_n_0,
      Q => bus2ip_reset,
      R => '0'
    );
\mem_a_int_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[21].ADDRESS_REG__0\,
      Q => mem_a(9),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[20].ADDRESS_REG__0\,
      Q => mem_a(10),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[19].ADDRESS_REG__0\,
      Q => mem_a(11),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[18].ADDRESS_REG__0\,
      Q => mem_a(12),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[17].ADDRESS_REG__0\,
      Q => mem_a(13),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[16].ADDRESS_REG__0\,
      Q => mem_a(14),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[15].ADDRESS_REG__0\,
      Q => mem_a(15),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[14].ADDRESS_REG__0\,
      Q => mem_a(16),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[13].ADDRESS_REG__0\,
      Q => mem_a(17),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[12].ADDRESS_REG__0\,
      Q => mem_a(18),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => EMC_CTRL_I_n_66,
      Q => mem_a(0),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[11].ADDRESS_REG__0\,
      Q => mem_a(19),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[10].ADDRESS_REG__0\,
      Q => mem_a(20),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[9].ADDRESS_REG__0\,
      Q => mem_a(21),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[8].ADDRESS_REG__0\,
      Q => mem_a(22),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[7].ADDRESS_REG__0\,
      Q => mem_a(23),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[6].ADDRESS_REG__0\,
      Q => mem_a(24),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[5].ADDRESS_REG__0\,
      Q => mem_a(25),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[4].ADDRESS_REG__0\,
      Q => mem_a(26),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[3].ADDRESS_REG__0\,
      Q => mem_a(27),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[2].ADDRESS_REG__0\,
      Q => mem_a(28),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[29].ADDRESS_REG__0\,
      Q => mem_a(1),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[1].ADDRESS_REG__0\,
      Q => mem_a(29),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[0].ADDRESS_REG__0\,
      Q => mem_a(30),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[28].ADDRESS_REG__0\,
      Q => mem_a(2),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[27].ADDRESS_REG__0\,
      Q => mem_a(3),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[26].ADDRESS_REG__0\,
      Q => mem_a(4),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[25].ADDRESS_REG__0\,
      Q => mem_a(5),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[24].ADDRESS_REG__0\,
      Q => mem_a(6),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[23].ADDRESS_REG__0\,
      Q => mem_a(7),
      R => EMC_CTRL_I_n_55
    );
\mem_a_int_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => rdclk,
      CE => '1',
      D => \ADDR_COUNTER_MUX_I/ADDRESS_STORE_GEN[22].ADDRESS_REG__0\,
      Q => mem_a(8),
      R => EMC_CTRL_I_n_55
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_emc_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    rdclk : in STD_LOGIC;
    s_axi_mem_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_mem_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_awlock : in STD_LOGIC;
    s_axi_mem_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_mem_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_mem_awvalid : in STD_LOGIC;
    s_axi_mem_awready : out STD_LOGIC;
    s_axi_mem_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_mem_wlast : in STD_LOGIC;
    s_axi_mem_wvalid : in STD_LOGIC;
    s_axi_mem_wready : out STD_LOGIC;
    s_axi_mem_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_bvalid : out STD_LOGIC;
    s_axi_mem_bready : in STD_LOGIC;
    s_axi_mem_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_mem_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_mem_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_arlock : in STD_LOGIC;
    s_axi_mem_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_mem_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_mem_arvalid : in STD_LOGIC;
    s_axi_mem_arready : out STD_LOGIC;
    s_axi_mem_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_mem_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_mem_rlast : out STD_LOGIC;
    s_axi_mem_rvalid : out STD_LOGIC;
    s_axi_mem_rready : in STD_LOGIC;
    mem_dq_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_dq_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_dq_t : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mem_a : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mem_ce : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_cen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_oen : out STD_LOGIC_VECTOR ( 0 to 0 );
    mem_wen : out STD_LOGIC;
    mem_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mem_qwen : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mem_rpn : out STD_LOGIC;
    mem_adv_ldn : out STD_LOGIC;
    mem_lbon : out STD_LOGIC;
    mem_cken : out STD_LOGIC;
    mem_rnw : out STD_LOGIC;
    mem_cre : out STD_LOGIC;
    mem_wait : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_axi_emc_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_axi_emc_0_0 : entity is "design_1_axi_emc_0_0,axi_emc,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_axi_emc_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_axi_emc_0_0 : entity is "axi_emc,Vivado 2017.4";
end design_1_axi_emc_0_0;

architecture STRUCTURE of design_1_axi_emc_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^mem_a\ : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \^s_axi_mem_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_mem_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute x_interface_info : string;
  attribute x_interface_info of mem_adv_ldn : signal is "xilinx.com:interface:emc:1.0 EMC_INTF ADV_LDN";
  attribute x_interface_info of mem_cken : signal is "xilinx.com:interface:emc:1.0 EMC_INTF CLKEN";
  attribute x_interface_info of mem_cre : signal is "xilinx.com:interface:emc:1.0 EMC_INTF CRE";
  attribute x_interface_info of mem_lbon : signal is "xilinx.com:interface:emc:1.0 EMC_INTF LBON";
  attribute x_interface_info of mem_rnw : signal is "xilinx.com:interface:emc:1.0 EMC_INTF RNW";
  attribute x_interface_info of mem_rpn : signal is "xilinx.com:interface:emc:1.0 EMC_INTF RPN";
  attribute x_interface_info of mem_wen : signal is "xilinx.com:interface:emc:1.0 EMC_INTF WEN";
  attribute max_fanout : string;
  attribute max_fanout of rdclk : signal is "10000";
  attribute sigis : string;
  attribute sigis of rdclk : signal is "Clk";
  attribute x_interface_info of rdclk : signal is "xilinx.com:signal:clock:1.0 rdclk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of rdclk : signal is "XIL_INTERFACENAME rdclk, ASSOCIATED_BUSIF EMC_INTF, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1";
  attribute max_fanout of s_axi_aclk : signal is "10000";
  attribute sigis of s_axi_aclk : signal is "Clk";
  attribute x_interface_info of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute x_interface_parameter of s_axi_aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF s_axi_mem:s_axi_reg, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1";
  attribute max_fanout of s_axi_aresetn : signal is "10000";
  attribute sigis of s_axi_aresetn : signal is "Rst";
  attribute x_interface_info of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute x_interface_parameter of s_axi_aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW";
  attribute x_interface_info of s_axi_mem_arlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARLOCK";
  attribute x_interface_info of s_axi_mem_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARREADY";
  attribute x_interface_info of s_axi_mem_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARVALID";
  attribute x_interface_info of s_axi_mem_awlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWLOCK";
  attribute x_interface_info of s_axi_mem_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWREADY";
  attribute x_interface_info of s_axi_mem_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWVALID";
  attribute x_interface_info of s_axi_mem_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM BREADY";
  attribute x_interface_info of s_axi_mem_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM BVALID";
  attribute x_interface_info of s_axi_mem_rlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM RLAST";
  attribute x_interface_info of s_axi_mem_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM RREADY";
  attribute x_interface_info of s_axi_mem_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM RVALID";
  attribute x_interface_info of s_axi_mem_wlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM WLAST";
  attribute x_interface_info of s_axi_mem_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM WREADY";
  attribute x_interface_info of s_axi_mem_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM WVALID";
  attribute x_interface_info of mem_a : signal is "xilinx.com:interface:emc:1.0 EMC_INTF ADDR";
  attribute x_interface_info of mem_ben : signal is "xilinx.com:interface:emc:1.0 EMC_INTF BEN";
  attribute x_interface_info of mem_ce : signal is "xilinx.com:interface:emc:1.0 EMC_INTF CE";
  attribute x_interface_info of mem_cen : signal is "xilinx.com:interface:emc:1.0 EMC_INTF CE_N";
  attribute x_interface_info of mem_dq_i : signal is "xilinx.com:interface:emc:1.0 EMC_INTF DQ_I";
  attribute x_interface_parameter of mem_dq_i : signal is "XIL_INTERFACENAME EMC_INTF, BOARD.ASSOCIATED_PARAM EMC_BOARD_INTERFACE";
  attribute x_interface_info of mem_dq_o : signal is "xilinx.com:interface:emc:1.0 EMC_INTF DQ_O";
  attribute x_interface_info of mem_dq_t : signal is "xilinx.com:interface:emc:1.0 EMC_INTF DQ_T";
  attribute x_interface_info of mem_oen : signal is "xilinx.com:interface:emc:1.0 EMC_INTF OEN";
  attribute x_interface_info of mem_qwen : signal is "xilinx.com:interface:emc:1.0 EMC_INTF QWEN";
  attribute x_interface_info of mem_wait : signal is "xilinx.com:interface:emc:1.0 EMC_INTF WAIT";
  attribute x_interface_info of s_axi_mem_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARADDR";
  attribute x_interface_info of s_axi_mem_arburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARBURST";
  attribute x_interface_info of s_axi_mem_arcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARCACHE";
  attribute x_interface_info of s_axi_mem_arlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARLEN";
  attribute x_interface_info of s_axi_mem_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARPROT";
  attribute x_interface_info of s_axi_mem_arsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM ARSIZE";
  attribute x_interface_info of s_axi_mem_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWADDR";
  attribute x_interface_parameter of s_axi_mem_awaddr : signal is "XIL_INTERFACENAME S_AXI_MEM, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 4, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute x_interface_info of s_axi_mem_awburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWBURST";
  attribute x_interface_info of s_axi_mem_awcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWCACHE";
  attribute x_interface_info of s_axi_mem_awlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWLEN";
  attribute x_interface_info of s_axi_mem_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWPROT";
  attribute x_interface_info of s_axi_mem_awsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM AWSIZE";
  attribute x_interface_info of s_axi_mem_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM BRESP";
  attribute x_interface_info of s_axi_mem_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM RDATA";
  attribute x_interface_info of s_axi_mem_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM RRESP";
  attribute x_interface_info of s_axi_mem_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM WDATA";
  attribute x_interface_info of s_axi_mem_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI_MEM WSTRB";
begin
  mem_a(31 downto 1) <= \^mem_a\(31 downto 1);
  mem_a(0) <= \<const0>\;
  mem_adv_ldn <= \<const0>\;
  mem_cken <= \<const0>\;
  mem_lbon <= \<const0>\;
  s_axi_mem_bresp(1) <= \^s_axi_mem_bresp\(1);
  s_axi_mem_bresp(0) <= \<const0>\;
  s_axi_mem_rresp(1) <= \^s_axi_mem_rresp\(1);
  s_axi_mem_rresp(0) <= \<const0>\;
  mem_cre <= 'Z';
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.design_1_axi_emc_0_0_axi_emc
     port map (
      mem_a(30 downto 0) => \^mem_a\(31 downto 1),
      mem_ben(1 downto 0) => mem_ben(1 downto 0),
      mem_ce(0) => mem_ce(0),
      mem_cen(0) => mem_cen(0),
      mem_dq_i(15 downto 0) => mem_dq_i(15 downto 0),
      mem_dq_o(15 downto 0) => mem_dq_o(15 downto 0),
      mem_dq_t(15 downto 0) => mem_dq_t(15 downto 0),
      mem_oen(0) => mem_oen(0),
      mem_qwen(1 downto 0) => mem_qwen(1 downto 0),
      mem_rnw => mem_rnw,
      mem_rpn => mem_rpn,
      mem_wen => mem_wen,
      rdclk => rdclk,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_mem_araddr(31 downto 0) => s_axi_mem_araddr(31 downto 0),
      s_axi_mem_arburst(1 downto 0) => s_axi_mem_arburst(1 downto 0),
      s_axi_mem_arlen(7 downto 0) => s_axi_mem_arlen(7 downto 0),
      s_axi_mem_arready => s_axi_mem_arready,
      s_axi_mem_arsize(1 downto 0) => s_axi_mem_arsize(1 downto 0),
      s_axi_mem_arvalid => s_axi_mem_arvalid,
      s_axi_mem_awaddr(31 downto 0) => s_axi_mem_awaddr(31 downto 0),
      s_axi_mem_awburst(1 downto 0) => s_axi_mem_awburst(1 downto 0),
      s_axi_mem_awlen(7 downto 0) => s_axi_mem_awlen(7 downto 0),
      s_axi_mem_awready => s_axi_mem_awready,
      s_axi_mem_awsize(1 downto 0) => s_axi_mem_awsize(1 downto 0),
      s_axi_mem_awvalid => s_axi_mem_awvalid,
      s_axi_mem_bready => s_axi_mem_bready,
      s_axi_mem_bresp(0) => \^s_axi_mem_bresp\(1),
      s_axi_mem_bvalid => s_axi_mem_bvalid,
      s_axi_mem_rdata(31 downto 0) => s_axi_mem_rdata(31 downto 0),
      s_axi_mem_rlast => s_axi_mem_rlast,
      s_axi_mem_rready => s_axi_mem_rready,
      s_axi_mem_rresp(0) => \^s_axi_mem_rresp\(1),
      s_axi_mem_rvalid => s_axi_mem_rvalid,
      s_axi_mem_wdata(31 downto 0) => s_axi_mem_wdata(31 downto 0),
      s_axi_mem_wlast => s_axi_mem_wlast,
      s_axi_mem_wready => s_axi_mem_wready,
      s_axi_mem_wstrb(3 downto 0) => s_axi_mem_wstrb(3 downto 0),
      s_axi_mem_wvalid => s_axi_mem_wvalid
    );
end STRUCTURE;
