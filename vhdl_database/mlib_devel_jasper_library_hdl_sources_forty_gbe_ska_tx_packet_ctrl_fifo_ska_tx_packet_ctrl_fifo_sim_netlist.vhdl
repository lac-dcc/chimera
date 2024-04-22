-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.1 (lin64) Build 2580384 Sat Jun 29 08:04:45 MDT 2019
-- Date        : Thu Jul 16 19:30:16 2020
-- Host        : adam-cm running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/aisaacson/work/git_work/ska-sa/wes/mlib_devel/jasper_library/test_models/skarab_fgbe/myproj/myproj.srcs/sources_1/ip/ska_tx_packet_ctrl_fifo/ska_tx_packet_ctrl_fifo_sim_netlist.vhdl
-- Design      : ska_tx_packet_ctrl_fifo
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_xpm_cdc_gray is
  port (
    src_clk : in STD_LOGIC;
    src_in_bin : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dest_clk : in STD_LOGIC;
    dest_out_bin : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is 2;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is "xpm_cdc_gray";
  attribute REG_OUTPUT : integer;
  attribute REG_OUTPUT of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is 1;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is 0;
  attribute SIM_LOSSLESS_GRAY_CHK : integer;
  attribute SIM_LOSSLESS_GRAY_CHK of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is 0;
  attribute WIDTH : integer;
  attribute WIDTH of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is 7;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is "TRUE";
  attribute xpm_cdc : string;
  attribute xpm_cdc of ska_tx_packet_ctrl_fifo_xpm_cdc_gray : entity is "GRAY";
end ska_tx_packet_ctrl_fifo_xpm_cdc_gray;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_xpm_cdc_gray is
  signal async_path : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal binval : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \dest_graysync_ff[0]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \dest_graysync_ff[0]\ : signal is "true";
  attribute async_reg : string;
  attribute async_reg of \dest_graysync_ff[0]\ : signal is "true";
  attribute xpm_cdc of \dest_graysync_ff[0]\ : signal is "GRAY";
  signal \dest_graysync_ff[1]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute RTL_KEEP of \dest_graysync_ff[1]\ : signal is "true";
  attribute async_reg of \dest_graysync_ff[1]\ : signal is "true";
  attribute xpm_cdc of \dest_graysync_ff[1]\ : signal is "GRAY";
  signal gray_enc : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \dest_graysync_ff_reg[0][0]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][0]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][1]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][1]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][1]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][2]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][2]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][2]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][3]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][3]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][3]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][4]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][4]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][4]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][5]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][5]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][5]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][6]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][6]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][6]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][0]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][0]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][0]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][1]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][1]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][1]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][2]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][2]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][2]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][3]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][3]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][3]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][4]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][4]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][4]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][5]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][5]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][5]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][6]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][6]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][6]\ : label is "GRAY";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \src_gray_ff[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \src_gray_ff[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \src_gray_ff[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \src_gray_ff[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \src_gray_ff[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \src_gray_ff[5]_i_1\ : label is "soft_lutpair5";
begin
\dest_graysync_ff_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(0),
      Q => \dest_graysync_ff[0]\(0),
      R => '0'
    );
\dest_graysync_ff_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(1),
      Q => \dest_graysync_ff[0]\(1),
      R => '0'
    );
\dest_graysync_ff_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(2),
      Q => \dest_graysync_ff[0]\(2),
      R => '0'
    );
\dest_graysync_ff_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(3),
      Q => \dest_graysync_ff[0]\(3),
      R => '0'
    );
\dest_graysync_ff_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(4),
      Q => \dest_graysync_ff[0]\(4),
      R => '0'
    );
\dest_graysync_ff_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(5),
      Q => \dest_graysync_ff[0]\(5),
      R => '0'
    );
\dest_graysync_ff_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(6),
      Q => \dest_graysync_ff[0]\(6),
      R => '0'
    );
\dest_graysync_ff_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(0),
      Q => \dest_graysync_ff[1]\(0),
      R => '0'
    );
\dest_graysync_ff_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(1),
      Q => \dest_graysync_ff[1]\(1),
      R => '0'
    );
\dest_graysync_ff_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(2),
      Q => \dest_graysync_ff[1]\(2),
      R => '0'
    );
\dest_graysync_ff_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(3),
      Q => \dest_graysync_ff[1]\(3),
      R => '0'
    );
\dest_graysync_ff_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(4),
      Q => \dest_graysync_ff[1]\(4),
      R => '0'
    );
\dest_graysync_ff_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(5),
      Q => \dest_graysync_ff[1]\(5),
      R => '0'
    );
\dest_graysync_ff_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(6),
      Q => \dest_graysync_ff[1]\(6),
      R => '0'
    );
\dest_out_bin_ff[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(0),
      I1 => binval(1),
      O => binval(0)
    );
\dest_out_bin_ff[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(1),
      I1 => \dest_graysync_ff[1]\(3),
      I2 => \dest_graysync_ff[1]\(5),
      I3 => \dest_graysync_ff[1]\(6),
      I4 => \dest_graysync_ff[1]\(4),
      I5 => \dest_graysync_ff[1]\(2),
      O => binval(1)
    );
\dest_out_bin_ff[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(2),
      I1 => \dest_graysync_ff[1]\(4),
      I2 => \dest_graysync_ff[1]\(6),
      I3 => \dest_graysync_ff[1]\(5),
      I4 => \dest_graysync_ff[1]\(3),
      O => binval(2)
    );
\dest_out_bin_ff[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(3),
      I1 => \dest_graysync_ff[1]\(5),
      I2 => \dest_graysync_ff[1]\(6),
      I3 => \dest_graysync_ff[1]\(4),
      O => binval(3)
    );
\dest_out_bin_ff[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(4),
      I1 => \dest_graysync_ff[1]\(6),
      I2 => \dest_graysync_ff[1]\(5),
      O => binval(4)
    );
\dest_out_bin_ff[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(5),
      I1 => \dest_graysync_ff[1]\(6),
      O => binval(5)
    );
\dest_out_bin_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(0),
      Q => dest_out_bin(0),
      R => '0'
    );
\dest_out_bin_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(1),
      Q => dest_out_bin(1),
      R => '0'
    );
\dest_out_bin_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(2),
      Q => dest_out_bin(2),
      R => '0'
    );
\dest_out_bin_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(3),
      Q => dest_out_bin(3),
      R => '0'
    );
\dest_out_bin_ff_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(4),
      Q => dest_out_bin(4),
      R => '0'
    );
\dest_out_bin_ff_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(5),
      Q => dest_out_bin(5),
      R => '0'
    );
\dest_out_bin_ff_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[1]\(6),
      Q => dest_out_bin(6),
      R => '0'
    );
\src_gray_ff[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(1),
      I1 => src_in_bin(0),
      O => gray_enc(0)
    );
\src_gray_ff[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(2),
      I1 => src_in_bin(1),
      O => gray_enc(1)
    );
\src_gray_ff[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(3),
      I1 => src_in_bin(2),
      O => gray_enc(2)
    );
\src_gray_ff[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(4),
      I1 => src_in_bin(3),
      O => gray_enc(3)
    );
\src_gray_ff[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(5),
      I1 => src_in_bin(4),
      O => gray_enc(4)
    );
\src_gray_ff[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(6),
      I1 => src_in_bin(5),
      O => gray_enc(5)
    );
\src_gray_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(0),
      Q => async_path(0),
      R => '0'
    );
\src_gray_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(1),
      Q => async_path(1),
      R => '0'
    );
\src_gray_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(2),
      Q => async_path(2),
      R => '0'
    );
\src_gray_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(3),
      Q => async_path(3),
      R => '0'
    );
\src_gray_ff_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(4),
      Q => async_path(4),
      R => '0'
    );
\src_gray_ff_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(5),
      Q => async_path(5),
      R => '0'
    );
\src_gray_ff_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in_bin(6),
      Q => async_path(6),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ is
  port (
    src_clk : in STD_LOGIC;
    src_in_bin : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dest_clk : in STD_LOGIC;
    dest_out_bin : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is 2;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is "xpm_cdc_gray";
  attribute REG_OUTPUT : integer;
  attribute REG_OUTPUT of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is 1;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is 0;
  attribute SIM_LOSSLESS_GRAY_CHK : integer;
  attribute SIM_LOSSLESS_GRAY_CHK of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is 0;
  attribute WIDTH : integer;
  attribute WIDTH of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is 7;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is "TRUE";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ : entity is "GRAY";
end \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\;

architecture STRUCTURE of \ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\ is
  signal async_path : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal binval : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \dest_graysync_ff[0]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \dest_graysync_ff[0]\ : signal is "true";
  attribute async_reg : string;
  attribute async_reg of \dest_graysync_ff[0]\ : signal is "true";
  attribute xpm_cdc of \dest_graysync_ff[0]\ : signal is "GRAY";
  signal \dest_graysync_ff[1]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute RTL_KEEP of \dest_graysync_ff[1]\ : signal is "true";
  attribute async_reg of \dest_graysync_ff[1]\ : signal is "true";
  attribute xpm_cdc of \dest_graysync_ff[1]\ : signal is "GRAY";
  signal gray_enc : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \dest_graysync_ff_reg[0][0]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][0]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][1]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][1]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][1]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][2]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][2]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][2]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][3]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][3]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][3]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][4]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][4]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][4]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][5]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][5]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][5]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[0][6]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[0][6]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[0][6]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][0]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][0]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][0]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][1]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][1]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][1]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][2]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][2]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][2]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][3]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][3]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][3]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][4]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][4]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][4]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][5]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][5]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][5]\ : label is "GRAY";
  attribute ASYNC_REG_boolean of \dest_graysync_ff_reg[1][6]\ : label is std.standard.true;
  attribute KEEP of \dest_graysync_ff_reg[1][6]\ : label is "true";
  attribute XPM_CDC of \dest_graysync_ff_reg[1][6]\ : label is "GRAY";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \src_gray_ff[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \src_gray_ff[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \src_gray_ff[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \src_gray_ff[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \src_gray_ff[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \src_gray_ff[5]_i_1\ : label is "soft_lutpair2";
begin
\dest_graysync_ff_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(0),
      Q => \dest_graysync_ff[0]\(0),
      R => '0'
    );
\dest_graysync_ff_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(1),
      Q => \dest_graysync_ff[0]\(1),
      R => '0'
    );
\dest_graysync_ff_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(2),
      Q => \dest_graysync_ff[0]\(2),
      R => '0'
    );
\dest_graysync_ff_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(3),
      Q => \dest_graysync_ff[0]\(3),
      R => '0'
    );
\dest_graysync_ff_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(4),
      Q => \dest_graysync_ff[0]\(4),
      R => '0'
    );
\dest_graysync_ff_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(5),
      Q => \dest_graysync_ff[0]\(5),
      R => '0'
    );
\dest_graysync_ff_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path(6),
      Q => \dest_graysync_ff[0]\(6),
      R => '0'
    );
\dest_graysync_ff_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(0),
      Q => \dest_graysync_ff[1]\(0),
      R => '0'
    );
\dest_graysync_ff_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(1),
      Q => \dest_graysync_ff[1]\(1),
      R => '0'
    );
\dest_graysync_ff_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(2),
      Q => \dest_graysync_ff[1]\(2),
      R => '0'
    );
\dest_graysync_ff_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(3),
      Q => \dest_graysync_ff[1]\(3),
      R => '0'
    );
\dest_graysync_ff_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(4),
      Q => \dest_graysync_ff[1]\(4),
      R => '0'
    );
\dest_graysync_ff_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(5),
      Q => \dest_graysync_ff[1]\(5),
      R => '0'
    );
\dest_graysync_ff_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[0]\(6),
      Q => \dest_graysync_ff[1]\(6),
      R => '0'
    );
\dest_out_bin_ff[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(0),
      I1 => binval(1),
      O => binval(0)
    );
\dest_out_bin_ff[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(1),
      I1 => \dest_graysync_ff[1]\(3),
      I2 => \dest_graysync_ff[1]\(5),
      I3 => \dest_graysync_ff[1]\(6),
      I4 => \dest_graysync_ff[1]\(4),
      I5 => \dest_graysync_ff[1]\(2),
      O => binval(1)
    );
\dest_out_bin_ff[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(2),
      I1 => \dest_graysync_ff[1]\(4),
      I2 => \dest_graysync_ff[1]\(6),
      I3 => \dest_graysync_ff[1]\(5),
      I4 => \dest_graysync_ff[1]\(3),
      O => binval(2)
    );
\dest_out_bin_ff[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(3),
      I1 => \dest_graysync_ff[1]\(5),
      I2 => \dest_graysync_ff[1]\(6),
      I3 => \dest_graysync_ff[1]\(4),
      O => binval(3)
    );
\dest_out_bin_ff[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(4),
      I1 => \dest_graysync_ff[1]\(6),
      I2 => \dest_graysync_ff[1]\(5),
      O => binval(4)
    );
\dest_out_bin_ff[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dest_graysync_ff[1]\(5),
      I1 => \dest_graysync_ff[1]\(6),
      O => binval(5)
    );
\dest_out_bin_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(0),
      Q => dest_out_bin(0),
      R => '0'
    );
\dest_out_bin_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(1),
      Q => dest_out_bin(1),
      R => '0'
    );
\dest_out_bin_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(2),
      Q => dest_out_bin(2),
      R => '0'
    );
\dest_out_bin_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(3),
      Q => dest_out_bin(3),
      R => '0'
    );
\dest_out_bin_ff_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(4),
      Q => dest_out_bin(4),
      R => '0'
    );
\dest_out_bin_ff_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => binval(5),
      Q => dest_out_bin(5),
      R => '0'
    );
\dest_out_bin_ff_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \dest_graysync_ff[1]\(6),
      Q => dest_out_bin(6),
      R => '0'
    );
\src_gray_ff[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(1),
      I1 => src_in_bin(0),
      O => gray_enc(0)
    );
\src_gray_ff[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(2),
      I1 => src_in_bin(1),
      O => gray_enc(1)
    );
\src_gray_ff[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(3),
      I1 => src_in_bin(2),
      O => gray_enc(2)
    );
\src_gray_ff[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(4),
      I1 => src_in_bin(3),
      O => gray_enc(3)
    );
\src_gray_ff[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(5),
      I1 => src_in_bin(4),
      O => gray_enc(4)
    );
\src_gray_ff[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => src_in_bin(6),
      I1 => src_in_bin(5),
      O => gray_enc(5)
    );
\src_gray_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(0),
      Q => async_path(0),
      R => '0'
    );
\src_gray_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(1),
      Q => async_path(1),
      R => '0'
    );
\src_gray_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(2),
      Q => async_path(2),
      R => '0'
    );
\src_gray_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(3),
      Q => async_path(3),
      R => '0'
    );
\src_gray_ff_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(4),
      Q => async_path(4),
      R => '0'
    );
\src_gray_ff_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => gray_enc(5),
      Q => async_path(5),
      R => '0'
    );
\src_gray_ff_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in_bin(6),
      Q => async_path(6),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_dmem is
  port (
    \gpr1.dout_i_reg[63]_0\ : out STD_LOGIC_VECTOR ( 63 downto 0 );
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    \gpr1.dout_i_reg[0]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \gpr1.dout_i_reg[0]_1\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gpr1.dout_i_reg[63]_1\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_dmem : entity is "dmem";
end ska_tx_packet_ctrl_fifo_dmem;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_dmem is
  signal RAM_reg_0_63_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_30_32_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_30_32_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_30_32_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_33_35_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_33_35_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_33_35_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_36_38_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_36_38_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_36_38_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_39_41_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_39_41_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_39_41_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_42_44_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_42_44_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_42_44_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_45_47_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_45_47_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_45_47_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_48_50_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_48_50_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_48_50_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_51_53_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_51_53_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_51_53_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_54_56_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_54_56_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_54_56_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_57_59_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_57_59_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_57_59_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_60_62_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_60_62_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_60_62_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_63_63_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_0_63_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_0_63_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_0_63_9_11_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_0_2_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_0_2_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_0_2_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_12_14_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_12_14_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_12_14_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_15_17_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_15_17_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_15_17_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_18_20_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_18_20_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_18_20_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_21_23_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_21_23_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_21_23_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_24_26_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_24_26_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_24_26_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_27_29_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_27_29_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_27_29_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_30_32_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_30_32_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_30_32_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_33_35_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_33_35_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_33_35_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_36_38_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_36_38_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_36_38_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_39_41_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_39_41_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_39_41_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_3_5_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_3_5_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_3_5_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_42_44_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_42_44_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_42_44_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_45_47_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_45_47_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_45_47_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_48_50_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_48_50_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_48_50_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_51_53_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_51_53_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_51_53_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_54_56_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_54_56_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_54_56_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_57_59_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_57_59_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_57_59_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_60_62_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_60_62_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_60_62_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_63_63_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_6_8_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_6_8_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_6_8_n_2 : STD_LOGIC;
  signal RAM_reg_64_127_9_11_n_0 : STD_LOGIC;
  signal RAM_reg_64_127_9_11_n_1 : STD_LOGIC;
  signal RAM_reg_64_127_9_11_n_2 : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_30_32_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_33_35_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_36_38_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_39_41_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_42_44_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_45_47_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_48_50_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_51_53_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_54_56_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_57_59_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_60_62_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_63_63_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_30_32_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_33_35_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_36_38_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_39_41_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_42_44_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_45_47_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_48_50_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_51_53_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_54_56_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_57_59_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_60_62_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_63_63_SPO_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED : STD_LOGIC;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_0_2 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg_0_63_0_2 : label is 8192;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg_0_63_0_2 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg_0_63_0_2 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg_0_63_0_2 : label is 63;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg_0_63_0_2 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg_0_63_0_2 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg_0_63_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_12_14 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_12_14 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_12_14 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_12_14 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_12_14 : label is 63;
  attribute ram_offset of RAM_reg_0_63_12_14 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_12_14 : label is 12;
  attribute ram_slice_end of RAM_reg_0_63_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_15_17 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_15_17 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_15_17 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_15_17 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_15_17 : label is 63;
  attribute ram_offset of RAM_reg_0_63_15_17 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_15_17 : label is 15;
  attribute ram_slice_end of RAM_reg_0_63_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_18_20 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_18_20 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_18_20 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_18_20 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_18_20 : label is 63;
  attribute ram_offset of RAM_reg_0_63_18_20 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_18_20 : label is 18;
  attribute ram_slice_end of RAM_reg_0_63_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_21_23 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_21_23 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_21_23 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_21_23 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_21_23 : label is 63;
  attribute ram_offset of RAM_reg_0_63_21_23 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_21_23 : label is 21;
  attribute ram_slice_end of RAM_reg_0_63_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_24_26 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_24_26 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_24_26 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_24_26 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_24_26 : label is 63;
  attribute ram_offset of RAM_reg_0_63_24_26 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_24_26 : label is 24;
  attribute ram_slice_end of RAM_reg_0_63_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_27_29 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_27_29 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_27_29 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_27_29 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_27_29 : label is 63;
  attribute ram_offset of RAM_reg_0_63_27_29 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_27_29 : label is 27;
  attribute ram_slice_end of RAM_reg_0_63_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_30_32 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_30_32 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_30_32 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_30_32 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_30_32 : label is 63;
  attribute ram_offset of RAM_reg_0_63_30_32 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_30_32 : label is 30;
  attribute ram_slice_end of RAM_reg_0_63_30_32 : label is 32;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_33_35 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_33_35 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_33_35 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_33_35 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_33_35 : label is 63;
  attribute ram_offset of RAM_reg_0_63_33_35 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_33_35 : label is 33;
  attribute ram_slice_end of RAM_reg_0_63_33_35 : label is 35;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_36_38 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_36_38 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_36_38 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_36_38 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_36_38 : label is 63;
  attribute ram_offset of RAM_reg_0_63_36_38 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_36_38 : label is 36;
  attribute ram_slice_end of RAM_reg_0_63_36_38 : label is 38;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_39_41 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_39_41 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_39_41 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_39_41 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_39_41 : label is 63;
  attribute ram_offset of RAM_reg_0_63_39_41 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_39_41 : label is 39;
  attribute ram_slice_end of RAM_reg_0_63_39_41 : label is 41;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_3_5 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_3_5 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_3_5 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_3_5 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_3_5 : label is 63;
  attribute ram_offset of RAM_reg_0_63_3_5 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_3_5 : label is 3;
  attribute ram_slice_end of RAM_reg_0_63_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_42_44 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_42_44 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_42_44 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_42_44 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_42_44 : label is 63;
  attribute ram_offset of RAM_reg_0_63_42_44 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_42_44 : label is 42;
  attribute ram_slice_end of RAM_reg_0_63_42_44 : label is 44;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_45_47 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_45_47 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_45_47 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_45_47 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_45_47 : label is 63;
  attribute ram_offset of RAM_reg_0_63_45_47 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_45_47 : label is 45;
  attribute ram_slice_end of RAM_reg_0_63_45_47 : label is 47;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_48_50 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_48_50 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_48_50 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_48_50 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_48_50 : label is 63;
  attribute ram_offset of RAM_reg_0_63_48_50 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_48_50 : label is 48;
  attribute ram_slice_end of RAM_reg_0_63_48_50 : label is 50;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_51_53 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_51_53 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_51_53 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_51_53 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_51_53 : label is 63;
  attribute ram_offset of RAM_reg_0_63_51_53 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_51_53 : label is 51;
  attribute ram_slice_end of RAM_reg_0_63_51_53 : label is 53;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_54_56 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_54_56 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_54_56 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_54_56 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_54_56 : label is 63;
  attribute ram_offset of RAM_reg_0_63_54_56 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_54_56 : label is 54;
  attribute ram_slice_end of RAM_reg_0_63_54_56 : label is 56;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_57_59 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_57_59 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_57_59 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_57_59 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_57_59 : label is 63;
  attribute ram_offset of RAM_reg_0_63_57_59 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_57_59 : label is 57;
  attribute ram_slice_end of RAM_reg_0_63_57_59 : label is 59;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_60_62 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_60_62 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_60_62 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_60_62 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_60_62 : label is 63;
  attribute ram_offset of RAM_reg_0_63_60_62 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_60_62 : label is 60;
  attribute ram_slice_end of RAM_reg_0_63_60_62 : label is 62;
  attribute ram_addr_begin of RAM_reg_0_63_63_63 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_63_63 : label is 63;
  attribute ram_offset of RAM_reg_0_63_63_63 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_63_63 : label is 63;
  attribute ram_slice_end of RAM_reg_0_63_63_63 : label is 63;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_6_8 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_6_8 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_6_8 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_6_8 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_6_8 : label is 63;
  attribute ram_offset of RAM_reg_0_63_6_8 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_6_8 : label is 6;
  attribute ram_slice_end of RAM_reg_0_63_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_0_63_9_11 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_0_63_9_11 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_0_63_9_11 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_0_63_9_11 : label is 0;
  attribute ram_addr_end of RAM_reg_0_63_9_11 : label is 63;
  attribute ram_offset of RAM_reg_0_63_9_11 : label is 0;
  attribute ram_slice_begin of RAM_reg_0_63_9_11 : label is 9;
  attribute ram_slice_end of RAM_reg_0_63_9_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_0_2 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_0_2 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_0_2 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_0_2 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_0_2 : label is 127;
  attribute ram_offset of RAM_reg_64_127_0_2 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_0_2 : label is 0;
  attribute ram_slice_end of RAM_reg_64_127_0_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_12_14 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_12_14 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_12_14 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_12_14 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_12_14 : label is 127;
  attribute ram_offset of RAM_reg_64_127_12_14 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_12_14 : label is 12;
  attribute ram_slice_end of RAM_reg_64_127_12_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_15_17 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_15_17 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_15_17 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_15_17 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_15_17 : label is 127;
  attribute ram_offset of RAM_reg_64_127_15_17 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_15_17 : label is 15;
  attribute ram_slice_end of RAM_reg_64_127_15_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_18_20 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_18_20 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_18_20 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_18_20 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_18_20 : label is 127;
  attribute ram_offset of RAM_reg_64_127_18_20 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_18_20 : label is 18;
  attribute ram_slice_end of RAM_reg_64_127_18_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_21_23 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_21_23 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_21_23 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_21_23 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_21_23 : label is 127;
  attribute ram_offset of RAM_reg_64_127_21_23 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_21_23 : label is 21;
  attribute ram_slice_end of RAM_reg_64_127_21_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_24_26 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_24_26 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_24_26 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_24_26 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_24_26 : label is 127;
  attribute ram_offset of RAM_reg_64_127_24_26 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_24_26 : label is 24;
  attribute ram_slice_end of RAM_reg_64_127_24_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_27_29 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_27_29 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_27_29 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_27_29 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_27_29 : label is 127;
  attribute ram_offset of RAM_reg_64_127_27_29 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_27_29 : label is 27;
  attribute ram_slice_end of RAM_reg_64_127_27_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_30_32 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_30_32 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_30_32 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_30_32 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_30_32 : label is 127;
  attribute ram_offset of RAM_reg_64_127_30_32 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_30_32 : label is 30;
  attribute ram_slice_end of RAM_reg_64_127_30_32 : label is 32;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_33_35 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_33_35 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_33_35 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_33_35 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_33_35 : label is 127;
  attribute ram_offset of RAM_reg_64_127_33_35 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_33_35 : label is 33;
  attribute ram_slice_end of RAM_reg_64_127_33_35 : label is 35;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_36_38 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_36_38 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_36_38 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_36_38 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_36_38 : label is 127;
  attribute ram_offset of RAM_reg_64_127_36_38 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_36_38 : label is 36;
  attribute ram_slice_end of RAM_reg_64_127_36_38 : label is 38;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_39_41 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_39_41 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_39_41 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_39_41 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_39_41 : label is 127;
  attribute ram_offset of RAM_reg_64_127_39_41 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_39_41 : label is 39;
  attribute ram_slice_end of RAM_reg_64_127_39_41 : label is 41;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_3_5 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_3_5 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_3_5 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_3_5 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_3_5 : label is 127;
  attribute ram_offset of RAM_reg_64_127_3_5 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_3_5 : label is 3;
  attribute ram_slice_end of RAM_reg_64_127_3_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_42_44 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_42_44 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_42_44 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_42_44 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_42_44 : label is 127;
  attribute ram_offset of RAM_reg_64_127_42_44 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_42_44 : label is 42;
  attribute ram_slice_end of RAM_reg_64_127_42_44 : label is 44;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_45_47 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_45_47 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_45_47 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_45_47 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_45_47 : label is 127;
  attribute ram_offset of RAM_reg_64_127_45_47 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_45_47 : label is 45;
  attribute ram_slice_end of RAM_reg_64_127_45_47 : label is 47;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_48_50 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_48_50 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_48_50 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_48_50 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_48_50 : label is 127;
  attribute ram_offset of RAM_reg_64_127_48_50 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_48_50 : label is 48;
  attribute ram_slice_end of RAM_reg_64_127_48_50 : label is 50;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_51_53 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_51_53 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_51_53 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_51_53 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_51_53 : label is 127;
  attribute ram_offset of RAM_reg_64_127_51_53 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_51_53 : label is 51;
  attribute ram_slice_end of RAM_reg_64_127_51_53 : label is 53;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_54_56 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_54_56 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_54_56 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_54_56 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_54_56 : label is 127;
  attribute ram_offset of RAM_reg_64_127_54_56 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_54_56 : label is 54;
  attribute ram_slice_end of RAM_reg_64_127_54_56 : label is 56;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_57_59 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_57_59 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_57_59 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_57_59 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_57_59 : label is 127;
  attribute ram_offset of RAM_reg_64_127_57_59 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_57_59 : label is 57;
  attribute ram_slice_end of RAM_reg_64_127_57_59 : label is 59;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_60_62 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_60_62 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_60_62 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_60_62 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_60_62 : label is 127;
  attribute ram_offset of RAM_reg_64_127_60_62 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_60_62 : label is 60;
  attribute ram_slice_end of RAM_reg_64_127_60_62 : label is 62;
  attribute ram_addr_begin of RAM_reg_64_127_63_63 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_63_63 : label is 127;
  attribute ram_offset of RAM_reg_64_127_63_63 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_63_63 : label is 63;
  attribute ram_slice_end of RAM_reg_64_127_63_63 : label is 63;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_6_8 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_6_8 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_6_8 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_6_8 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_6_8 : label is 127;
  attribute ram_offset of RAM_reg_64_127_6_8 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_6_8 : label is 6;
  attribute ram_slice_end of RAM_reg_64_127_6_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg_64_127_9_11 : label is "";
  attribute RTL_RAM_BITS of RAM_reg_64_127_9_11 : label is 8192;
  attribute RTL_RAM_NAME of RAM_reg_64_127_9_11 : label is "inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gdm.dm_gen.dm/RAM";
  attribute ram_addr_begin of RAM_reg_64_127_9_11 : label is 64;
  attribute ram_addr_end of RAM_reg_64_127_9_11 : label is 127;
  attribute ram_offset of RAM_reg_64_127_9_11 : label is 0;
  attribute ram_slice_begin of RAM_reg_64_127_9_11 : label is 9;
  attribute ram_slice_end of RAM_reg_64_127_9_11 : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gpr1.dout_i[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \gpr1.dout_i[10]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \gpr1.dout_i[11]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gpr1.dout_i[12]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gpr1.dout_i[13]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \gpr1.dout_i[14]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \gpr1.dout_i[15]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \gpr1.dout_i[16]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \gpr1.dout_i[17]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gpr1.dout_i[18]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gpr1.dout_i[19]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \gpr1.dout_i[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \gpr1.dout_i[20]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \gpr1.dout_i[21]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \gpr1.dout_i[22]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \gpr1.dout_i[23]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gpr1.dout_i[24]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \gpr1.dout_i[25]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \gpr1.dout_i[26]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \gpr1.dout_i[27]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gpr1.dout_i[28]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gpr1.dout_i[29]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \gpr1.dout_i[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \gpr1.dout_i[30]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \gpr1.dout_i[31]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \gpr1.dout_i[32]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \gpr1.dout_i[33]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gpr1.dout_i[34]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gpr1.dout_i[35]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \gpr1.dout_i[36]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \gpr1.dout_i[37]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gpr1.dout_i[38]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gpr1.dout_i[39]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \gpr1.dout_i[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gpr1.dout_i[40]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \gpr1.dout_i[41]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \gpr1.dout_i[42]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \gpr1.dout_i[43]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \gpr1.dout_i[44]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \gpr1.dout_i[45]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \gpr1.dout_i[46]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \gpr1.dout_i[47]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \gpr1.dout_i[48]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \gpr1.dout_i[49]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \gpr1.dout_i[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \gpr1.dout_i[50]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \gpr1.dout_i[51]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \gpr1.dout_i[52]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \gpr1.dout_i[53]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \gpr1.dout_i[54]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \gpr1.dout_i[55]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gpr1.dout_i[56]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gpr1.dout_i[57]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gpr1.dout_i[58]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gpr1.dout_i[59]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gpr1.dout_i[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gpr1.dout_i[60]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gpr1.dout_i[61]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \gpr1.dout_i[62]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \gpr1.dout_i[63]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \gpr1.dout_i[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \gpr1.dout_i[7]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \gpr1.dout_i[8]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \gpr1.dout_i[9]_i_1\ : label is "soft_lutpair15";
begin
RAM_reg_0_63_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_0_63_0_2_n_0,
      DOB => RAM_reg_0_63_0_2_n_1,
      DOC => RAM_reg_0_63_0_2_n_2,
      DOD => NLW_RAM_reg_0_63_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_0_63_12_14_n_0,
      DOB => RAM_reg_0_63_12_14_n_1,
      DOC => RAM_reg_0_63_12_14_n_2,
      DOD => NLW_RAM_reg_0_63_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_0_63_15_17_n_0,
      DOB => RAM_reg_0_63_15_17_n_1,
      DOC => RAM_reg_0_63_15_17_n_2,
      DOD => NLW_RAM_reg_0_63_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_0_63_18_20_n_0,
      DOB => RAM_reg_0_63_18_20_n_1,
      DOC => RAM_reg_0_63_18_20_n_2,
      DOD => NLW_RAM_reg_0_63_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_0_63_21_23_n_0,
      DOB => RAM_reg_0_63_21_23_n_1,
      DOC => RAM_reg_0_63_21_23_n_2,
      DOD => NLW_RAM_reg_0_63_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_0_63_24_26_n_0,
      DOB => RAM_reg_0_63_24_26_n_1,
      DOC => RAM_reg_0_63_24_26_n_2,
      DOD => NLW_RAM_reg_0_63_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_0_63_27_29_n_0,
      DOB => RAM_reg_0_63_27_29_n_1,
      DOC => RAM_reg_0_63_27_29_n_2,
      DOD => NLW_RAM_reg_0_63_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_30_32: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(30),
      DIB => din(31),
      DIC => din(32),
      DID => '0',
      DOA => RAM_reg_0_63_30_32_n_0,
      DOB => RAM_reg_0_63_30_32_n_1,
      DOC => RAM_reg_0_63_30_32_n_2,
      DOD => NLW_RAM_reg_0_63_30_32_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_33_35: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(33),
      DIB => din(34),
      DIC => din(35),
      DID => '0',
      DOA => RAM_reg_0_63_33_35_n_0,
      DOB => RAM_reg_0_63_33_35_n_1,
      DOC => RAM_reg_0_63_33_35_n_2,
      DOD => NLW_RAM_reg_0_63_33_35_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_36_38: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(36),
      DIB => din(37),
      DIC => din(38),
      DID => '0',
      DOA => RAM_reg_0_63_36_38_n_0,
      DOB => RAM_reg_0_63_36_38_n_1,
      DOC => RAM_reg_0_63_36_38_n_2,
      DOD => NLW_RAM_reg_0_63_36_38_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_39_41: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(39),
      DIB => din(40),
      DIC => din(41),
      DID => '0',
      DOA => RAM_reg_0_63_39_41_n_0,
      DOB => RAM_reg_0_63_39_41_n_1,
      DOC => RAM_reg_0_63_39_41_n_2,
      DOD => NLW_RAM_reg_0_63_39_41_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_0_63_3_5_n_0,
      DOB => RAM_reg_0_63_3_5_n_1,
      DOC => RAM_reg_0_63_3_5_n_2,
      DOD => NLW_RAM_reg_0_63_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_42_44: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(42),
      DIB => din(43),
      DIC => din(44),
      DID => '0',
      DOA => RAM_reg_0_63_42_44_n_0,
      DOB => RAM_reg_0_63_42_44_n_1,
      DOC => RAM_reg_0_63_42_44_n_2,
      DOD => NLW_RAM_reg_0_63_42_44_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_45_47: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(45),
      DIB => din(46),
      DIC => din(47),
      DID => '0',
      DOA => RAM_reg_0_63_45_47_n_0,
      DOB => RAM_reg_0_63_45_47_n_1,
      DOC => RAM_reg_0_63_45_47_n_2,
      DOD => NLW_RAM_reg_0_63_45_47_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_48_50: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(48),
      DIB => din(49),
      DIC => din(50),
      DID => '0',
      DOA => RAM_reg_0_63_48_50_n_0,
      DOB => RAM_reg_0_63_48_50_n_1,
      DOC => RAM_reg_0_63_48_50_n_2,
      DOD => NLW_RAM_reg_0_63_48_50_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_51_53: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(51),
      DIB => din(52),
      DIC => din(53),
      DID => '0',
      DOA => RAM_reg_0_63_51_53_n_0,
      DOB => RAM_reg_0_63_51_53_n_1,
      DOC => RAM_reg_0_63_51_53_n_2,
      DOD => NLW_RAM_reg_0_63_51_53_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_54_56: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(54),
      DIB => din(55),
      DIC => din(56),
      DID => '0',
      DOA => RAM_reg_0_63_54_56_n_0,
      DOB => RAM_reg_0_63_54_56_n_1,
      DOC => RAM_reg_0_63_54_56_n_2,
      DOD => NLW_RAM_reg_0_63_54_56_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_57_59: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(57),
      DIB => din(58),
      DIC => din(59),
      DID => '0',
      DOA => RAM_reg_0_63_57_59_n_0,
      DOB => RAM_reg_0_63_57_59_n_1,
      DOC => RAM_reg_0_63_57_59_n_2,
      DOD => NLW_RAM_reg_0_63_57_59_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_60_62: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(60),
      DIB => din(61),
      DIC => din(62),
      DID => '0',
      DOA => RAM_reg_0_63_60_62_n_0,
      DOB => RAM_reg_0_63_60_62_n_1,
      DOC => RAM_reg_0_63_60_62_n_2,
      DOD => NLW_RAM_reg_0_63_60_62_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_63_63: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gpr1.dout_i_reg[0]_1\(0),
      A1 => \gpr1.dout_i_reg[0]_1\(1),
      A2 => \gpr1.dout_i_reg[0]_1\(2),
      A3 => \gpr1.dout_i_reg[0]_1\(3),
      A4 => \gpr1.dout_i_reg[0]_1\(4),
      A5 => \gpr1.dout_i_reg[0]_1\(5),
      D => din(63),
      DPO => RAM_reg_0_63_63_63_n_0,
      DPRA0 => Q(0),
      DPRA1 => Q(1),
      DPRA2 => Q(2),
      DPRA3 => Q(3),
      DPRA4 => Q(4),
      DPRA5 => Q(5),
      SPO => NLW_RAM_reg_0_63_63_63_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_0_63_6_8_n_0,
      DOB => RAM_reg_0_63_6_8_n_1,
      DOC => RAM_reg_0_63_6_8_n_2,
      DOD => NLW_RAM_reg_0_63_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_0_63_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_0_63_9_11_n_0,
      DOB => RAM_reg_0_63_9_11_n_1,
      DOC => RAM_reg_0_63_9_11_n_2,
      DOD => NLW_RAM_reg_0_63_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[0]_0\
    );
RAM_reg_64_127_0_2: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(0),
      DIB => din(1),
      DIC => din(2),
      DID => '0',
      DOA => RAM_reg_64_127_0_2_n_0,
      DOB => RAM_reg_64_127_0_2_n_1,
      DOC => RAM_reg_64_127_0_2_n_2,
      DOD => NLW_RAM_reg_64_127_0_2_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_12_14: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(12),
      DIB => din(13),
      DIC => din(14),
      DID => '0',
      DOA => RAM_reg_64_127_12_14_n_0,
      DOB => RAM_reg_64_127_12_14_n_1,
      DOC => RAM_reg_64_127_12_14_n_2,
      DOD => NLW_RAM_reg_64_127_12_14_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_15_17: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(15),
      DIB => din(16),
      DIC => din(17),
      DID => '0',
      DOA => RAM_reg_64_127_15_17_n_0,
      DOB => RAM_reg_64_127_15_17_n_1,
      DOC => RAM_reg_64_127_15_17_n_2,
      DOD => NLW_RAM_reg_64_127_15_17_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_18_20: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(18),
      DIB => din(19),
      DIC => din(20),
      DID => '0',
      DOA => RAM_reg_64_127_18_20_n_0,
      DOB => RAM_reg_64_127_18_20_n_1,
      DOC => RAM_reg_64_127_18_20_n_2,
      DOD => NLW_RAM_reg_64_127_18_20_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_21_23: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(21),
      DIB => din(22),
      DIC => din(23),
      DID => '0',
      DOA => RAM_reg_64_127_21_23_n_0,
      DOB => RAM_reg_64_127_21_23_n_1,
      DOC => RAM_reg_64_127_21_23_n_2,
      DOD => NLW_RAM_reg_64_127_21_23_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_24_26: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(24),
      DIB => din(25),
      DIC => din(26),
      DID => '0',
      DOA => RAM_reg_64_127_24_26_n_0,
      DOB => RAM_reg_64_127_24_26_n_1,
      DOC => RAM_reg_64_127_24_26_n_2,
      DOD => NLW_RAM_reg_64_127_24_26_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_27_29: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(27),
      DIB => din(28),
      DIC => din(29),
      DID => '0',
      DOA => RAM_reg_64_127_27_29_n_0,
      DOB => RAM_reg_64_127_27_29_n_1,
      DOC => RAM_reg_64_127_27_29_n_2,
      DOD => NLW_RAM_reg_64_127_27_29_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_30_32: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(30),
      DIB => din(31),
      DIC => din(32),
      DID => '0',
      DOA => RAM_reg_64_127_30_32_n_0,
      DOB => RAM_reg_64_127_30_32_n_1,
      DOC => RAM_reg_64_127_30_32_n_2,
      DOD => NLW_RAM_reg_64_127_30_32_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_33_35: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(33),
      DIB => din(34),
      DIC => din(35),
      DID => '0',
      DOA => RAM_reg_64_127_33_35_n_0,
      DOB => RAM_reg_64_127_33_35_n_1,
      DOC => RAM_reg_64_127_33_35_n_2,
      DOD => NLW_RAM_reg_64_127_33_35_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_36_38: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(36),
      DIB => din(37),
      DIC => din(38),
      DID => '0',
      DOA => RAM_reg_64_127_36_38_n_0,
      DOB => RAM_reg_64_127_36_38_n_1,
      DOC => RAM_reg_64_127_36_38_n_2,
      DOD => NLW_RAM_reg_64_127_36_38_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_39_41: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(39),
      DIB => din(40),
      DIC => din(41),
      DID => '0',
      DOA => RAM_reg_64_127_39_41_n_0,
      DOB => RAM_reg_64_127_39_41_n_1,
      DOC => RAM_reg_64_127_39_41_n_2,
      DOD => NLW_RAM_reg_64_127_39_41_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_3_5: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(3),
      DIB => din(4),
      DIC => din(5),
      DID => '0',
      DOA => RAM_reg_64_127_3_5_n_0,
      DOB => RAM_reg_64_127_3_5_n_1,
      DOC => RAM_reg_64_127_3_5_n_2,
      DOD => NLW_RAM_reg_64_127_3_5_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_42_44: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(42),
      DIB => din(43),
      DIC => din(44),
      DID => '0',
      DOA => RAM_reg_64_127_42_44_n_0,
      DOB => RAM_reg_64_127_42_44_n_1,
      DOC => RAM_reg_64_127_42_44_n_2,
      DOD => NLW_RAM_reg_64_127_42_44_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_45_47: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(45),
      DIB => din(46),
      DIC => din(47),
      DID => '0',
      DOA => RAM_reg_64_127_45_47_n_0,
      DOB => RAM_reg_64_127_45_47_n_1,
      DOC => RAM_reg_64_127_45_47_n_2,
      DOD => NLW_RAM_reg_64_127_45_47_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_48_50: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(48),
      DIB => din(49),
      DIC => din(50),
      DID => '0',
      DOA => RAM_reg_64_127_48_50_n_0,
      DOB => RAM_reg_64_127_48_50_n_1,
      DOC => RAM_reg_64_127_48_50_n_2,
      DOD => NLW_RAM_reg_64_127_48_50_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_51_53: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(51),
      DIB => din(52),
      DIC => din(53),
      DID => '0',
      DOA => RAM_reg_64_127_51_53_n_0,
      DOB => RAM_reg_64_127_51_53_n_1,
      DOC => RAM_reg_64_127_51_53_n_2,
      DOD => NLW_RAM_reg_64_127_51_53_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_54_56: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(54),
      DIB => din(55),
      DIC => din(56),
      DID => '0',
      DOA => RAM_reg_64_127_54_56_n_0,
      DOB => RAM_reg_64_127_54_56_n_1,
      DOC => RAM_reg_64_127_54_56_n_2,
      DOD => NLW_RAM_reg_64_127_54_56_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_57_59: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(57),
      DIB => din(58),
      DIC => din(59),
      DID => '0',
      DOA => RAM_reg_64_127_57_59_n_0,
      DOB => RAM_reg_64_127_57_59_n_1,
      DOC => RAM_reg_64_127_57_59_n_2,
      DOD => NLW_RAM_reg_64_127_57_59_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_60_62: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(60),
      DIB => din(61),
      DIC => din(62),
      DID => '0',
      DOA => RAM_reg_64_127_60_62_n_0,
      DOB => RAM_reg_64_127_60_62_n_1,
      DOC => RAM_reg_64_127_60_62_n_2,
      DOD => NLW_RAM_reg_64_127_60_62_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_63_63: unisim.vcomponents.RAM64X1D
     port map (
      A0 => \gpr1.dout_i_reg[0]_1\(0),
      A1 => \gpr1.dout_i_reg[0]_1\(1),
      A2 => \gpr1.dout_i_reg[0]_1\(2),
      A3 => \gpr1.dout_i_reg[0]_1\(3),
      A4 => \gpr1.dout_i_reg[0]_1\(4),
      A5 => \gpr1.dout_i_reg[0]_1\(5),
      D => din(63),
      DPO => RAM_reg_64_127_63_63_n_0,
      DPRA0 => Q(0),
      DPRA1 => Q(1),
      DPRA2 => Q(2),
      DPRA3 => Q(3),
      DPRA4 => Q(4),
      DPRA5 => Q(5),
      SPO => NLW_RAM_reg_64_127_63_63_SPO_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_6_8: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(6),
      DIB => din(7),
      DIC => din(8),
      DID => '0',
      DOA => RAM_reg_64_127_6_8_n_0,
      DOB => RAM_reg_64_127_6_8_n_1,
      DOC => RAM_reg_64_127_6_8_n_2,
      DOD => NLW_RAM_reg_64_127_6_8_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
RAM_reg_64_127_9_11: unisim.vcomponents.RAM64M
     port map (
      ADDRA(5 downto 0) => Q(5 downto 0),
      ADDRB(5 downto 0) => Q(5 downto 0),
      ADDRC(5 downto 0) => Q(5 downto 0),
      ADDRD(5 downto 0) => \gpr1.dout_i_reg[0]_1\(5 downto 0),
      DIA => din(9),
      DIB => din(10),
      DIC => din(11),
      DID => '0',
      DOA => RAM_reg_64_127_9_11_n_0,
      DOB => RAM_reg_64_127_9_11_n_1,
      DOC => RAM_reg_64_127_9_11_n_2,
      DOD => NLW_RAM_reg_64_127_9_11_DOD_UNCONNECTED,
      WCLK => wr_clk,
      WE => \gpr1.dout_i_reg[63]_1\
    );
\gpr1.dout_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_0_2_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_0_2_n_0,
      O => p_0_out(0)
    );
\gpr1.dout_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_9_11_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_9_11_n_1,
      O => p_0_out(10)
    );
\gpr1.dout_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_9_11_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_9_11_n_2,
      O => p_0_out(11)
    );
\gpr1.dout_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_12_14_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_12_14_n_0,
      O => p_0_out(12)
    );
\gpr1.dout_i[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_12_14_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_12_14_n_1,
      O => p_0_out(13)
    );
\gpr1.dout_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_12_14_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_12_14_n_2,
      O => p_0_out(14)
    );
\gpr1.dout_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_15_17_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_15_17_n_0,
      O => p_0_out(15)
    );
\gpr1.dout_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_15_17_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_15_17_n_1,
      O => p_0_out(16)
    );
\gpr1.dout_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_15_17_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_15_17_n_2,
      O => p_0_out(17)
    );
\gpr1.dout_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_18_20_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_18_20_n_0,
      O => p_0_out(18)
    );
\gpr1.dout_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_18_20_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_18_20_n_1,
      O => p_0_out(19)
    );
\gpr1.dout_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_0_2_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_0_2_n_1,
      O => p_0_out(1)
    );
\gpr1.dout_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_18_20_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_18_20_n_2,
      O => p_0_out(20)
    );
\gpr1.dout_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_21_23_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_21_23_n_0,
      O => p_0_out(21)
    );
\gpr1.dout_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_21_23_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_21_23_n_1,
      O => p_0_out(22)
    );
\gpr1.dout_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_21_23_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_21_23_n_2,
      O => p_0_out(23)
    );
\gpr1.dout_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_24_26_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_24_26_n_0,
      O => p_0_out(24)
    );
\gpr1.dout_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_24_26_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_24_26_n_1,
      O => p_0_out(25)
    );
\gpr1.dout_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_24_26_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_24_26_n_2,
      O => p_0_out(26)
    );
\gpr1.dout_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_27_29_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_27_29_n_0,
      O => p_0_out(27)
    );
\gpr1.dout_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_27_29_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_27_29_n_1,
      O => p_0_out(28)
    );
\gpr1.dout_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_27_29_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_27_29_n_2,
      O => p_0_out(29)
    );
\gpr1.dout_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_0_2_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_0_2_n_2,
      O => p_0_out(2)
    );
\gpr1.dout_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_30_32_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_30_32_n_0,
      O => p_0_out(30)
    );
\gpr1.dout_i[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_30_32_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_30_32_n_1,
      O => p_0_out(31)
    );
\gpr1.dout_i[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_30_32_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_30_32_n_2,
      O => p_0_out(32)
    );
\gpr1.dout_i[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_33_35_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_33_35_n_0,
      O => p_0_out(33)
    );
\gpr1.dout_i[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_33_35_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_33_35_n_1,
      O => p_0_out(34)
    );
\gpr1.dout_i[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_33_35_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_33_35_n_2,
      O => p_0_out(35)
    );
\gpr1.dout_i[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_36_38_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_36_38_n_0,
      O => p_0_out(36)
    );
\gpr1.dout_i[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_36_38_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_36_38_n_1,
      O => p_0_out(37)
    );
\gpr1.dout_i[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_36_38_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_36_38_n_2,
      O => p_0_out(38)
    );
\gpr1.dout_i[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_39_41_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_39_41_n_0,
      O => p_0_out(39)
    );
\gpr1.dout_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_3_5_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_3_5_n_0,
      O => p_0_out(3)
    );
\gpr1.dout_i[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_39_41_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_39_41_n_1,
      O => p_0_out(40)
    );
\gpr1.dout_i[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_39_41_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_39_41_n_2,
      O => p_0_out(41)
    );
\gpr1.dout_i[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_42_44_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_42_44_n_0,
      O => p_0_out(42)
    );
\gpr1.dout_i[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_42_44_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_42_44_n_1,
      O => p_0_out(43)
    );
\gpr1.dout_i[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_42_44_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_42_44_n_2,
      O => p_0_out(44)
    );
\gpr1.dout_i[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_45_47_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_45_47_n_0,
      O => p_0_out(45)
    );
\gpr1.dout_i[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_45_47_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_45_47_n_1,
      O => p_0_out(46)
    );
\gpr1.dout_i[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_45_47_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_45_47_n_2,
      O => p_0_out(47)
    );
\gpr1.dout_i[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_48_50_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_48_50_n_0,
      O => p_0_out(48)
    );
\gpr1.dout_i[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_48_50_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_48_50_n_1,
      O => p_0_out(49)
    );
\gpr1.dout_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_3_5_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_3_5_n_1,
      O => p_0_out(4)
    );
\gpr1.dout_i[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_48_50_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_48_50_n_2,
      O => p_0_out(50)
    );
\gpr1.dout_i[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_51_53_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_51_53_n_0,
      O => p_0_out(51)
    );
\gpr1.dout_i[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_51_53_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_51_53_n_1,
      O => p_0_out(52)
    );
\gpr1.dout_i[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_51_53_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_51_53_n_2,
      O => p_0_out(53)
    );
\gpr1.dout_i[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_54_56_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_54_56_n_0,
      O => p_0_out(54)
    );
\gpr1.dout_i[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_54_56_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_54_56_n_1,
      O => p_0_out(55)
    );
\gpr1.dout_i[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_54_56_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_54_56_n_2,
      O => p_0_out(56)
    );
\gpr1.dout_i[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_57_59_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_57_59_n_0,
      O => p_0_out(57)
    );
\gpr1.dout_i[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_57_59_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_57_59_n_1,
      O => p_0_out(58)
    );
\gpr1.dout_i[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_57_59_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_57_59_n_2,
      O => p_0_out(59)
    );
\gpr1.dout_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_3_5_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_3_5_n_2,
      O => p_0_out(5)
    );
\gpr1.dout_i[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_60_62_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_60_62_n_0,
      O => p_0_out(60)
    );
\gpr1.dout_i[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_60_62_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_60_62_n_1,
      O => p_0_out(61)
    );
\gpr1.dout_i[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_60_62_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_60_62_n_2,
      O => p_0_out(62)
    );
\gpr1.dout_i[63]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_63_63_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_63_63_n_0,
      O => p_0_out(63)
    );
\gpr1.dout_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_6_8_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_6_8_n_0,
      O => p_0_out(6)
    );
\gpr1.dout_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_6_8_n_1,
      I1 => Q(6),
      I2 => RAM_reg_0_63_6_8_n_1,
      O => p_0_out(7)
    );
\gpr1.dout_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_6_8_n_2,
      I1 => Q(6),
      I2 => RAM_reg_0_63_6_8_n_2,
      O => p_0_out(8)
    );
\gpr1.dout_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => RAM_reg_64_127_9_11_n_0,
      I1 => Q(6),
      I2 => RAM_reg_0_63_9_11_n_0,
      O => p_0_out(9)
    );
\gpr1.dout_i_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(0),
      Q => \gpr1.dout_i_reg[63]_0\(0)
    );
\gpr1.dout_i_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(10),
      Q => \gpr1.dout_i_reg[63]_0\(10)
    );
\gpr1.dout_i_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(11),
      Q => \gpr1.dout_i_reg[63]_0\(11)
    );
\gpr1.dout_i_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(12),
      Q => \gpr1.dout_i_reg[63]_0\(12)
    );
\gpr1.dout_i_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(13),
      Q => \gpr1.dout_i_reg[63]_0\(13)
    );
\gpr1.dout_i_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(14),
      Q => \gpr1.dout_i_reg[63]_0\(14)
    );
\gpr1.dout_i_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(15),
      Q => \gpr1.dout_i_reg[63]_0\(15)
    );
\gpr1.dout_i_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(16),
      Q => \gpr1.dout_i_reg[63]_0\(16)
    );
\gpr1.dout_i_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(17),
      Q => \gpr1.dout_i_reg[63]_0\(17)
    );
\gpr1.dout_i_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(18),
      Q => \gpr1.dout_i_reg[63]_0\(18)
    );
\gpr1.dout_i_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(19),
      Q => \gpr1.dout_i_reg[63]_0\(19)
    );
\gpr1.dout_i_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(1),
      Q => \gpr1.dout_i_reg[63]_0\(1)
    );
\gpr1.dout_i_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(20),
      Q => \gpr1.dout_i_reg[63]_0\(20)
    );
\gpr1.dout_i_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(21),
      Q => \gpr1.dout_i_reg[63]_0\(21)
    );
\gpr1.dout_i_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(22),
      Q => \gpr1.dout_i_reg[63]_0\(22)
    );
\gpr1.dout_i_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(23),
      Q => \gpr1.dout_i_reg[63]_0\(23)
    );
\gpr1.dout_i_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(24),
      Q => \gpr1.dout_i_reg[63]_0\(24)
    );
\gpr1.dout_i_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(25),
      Q => \gpr1.dout_i_reg[63]_0\(25)
    );
\gpr1.dout_i_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(26),
      Q => \gpr1.dout_i_reg[63]_0\(26)
    );
\gpr1.dout_i_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(27),
      Q => \gpr1.dout_i_reg[63]_0\(27)
    );
\gpr1.dout_i_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(28),
      Q => \gpr1.dout_i_reg[63]_0\(28)
    );
\gpr1.dout_i_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(29),
      Q => \gpr1.dout_i_reg[63]_0\(29)
    );
\gpr1.dout_i_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(2),
      Q => \gpr1.dout_i_reg[63]_0\(2)
    );
\gpr1.dout_i_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(30),
      Q => \gpr1.dout_i_reg[63]_0\(30)
    );
\gpr1.dout_i_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(31),
      Q => \gpr1.dout_i_reg[63]_0\(31)
    );
\gpr1.dout_i_reg[32]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(32),
      Q => \gpr1.dout_i_reg[63]_0\(32)
    );
\gpr1.dout_i_reg[33]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(33),
      Q => \gpr1.dout_i_reg[63]_0\(33)
    );
\gpr1.dout_i_reg[34]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(34),
      Q => \gpr1.dout_i_reg[63]_0\(34)
    );
\gpr1.dout_i_reg[35]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(35),
      Q => \gpr1.dout_i_reg[63]_0\(35)
    );
\gpr1.dout_i_reg[36]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(36),
      Q => \gpr1.dout_i_reg[63]_0\(36)
    );
\gpr1.dout_i_reg[37]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(37),
      Q => \gpr1.dout_i_reg[63]_0\(37)
    );
\gpr1.dout_i_reg[38]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(38),
      Q => \gpr1.dout_i_reg[63]_0\(38)
    );
\gpr1.dout_i_reg[39]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(39),
      Q => \gpr1.dout_i_reg[63]_0\(39)
    );
\gpr1.dout_i_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(3),
      Q => \gpr1.dout_i_reg[63]_0\(3)
    );
\gpr1.dout_i_reg[40]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(40),
      Q => \gpr1.dout_i_reg[63]_0\(40)
    );
\gpr1.dout_i_reg[41]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(41),
      Q => \gpr1.dout_i_reg[63]_0\(41)
    );
\gpr1.dout_i_reg[42]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(42),
      Q => \gpr1.dout_i_reg[63]_0\(42)
    );
\gpr1.dout_i_reg[43]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(43),
      Q => \gpr1.dout_i_reg[63]_0\(43)
    );
\gpr1.dout_i_reg[44]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(44),
      Q => \gpr1.dout_i_reg[63]_0\(44)
    );
\gpr1.dout_i_reg[45]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(45),
      Q => \gpr1.dout_i_reg[63]_0\(45)
    );
\gpr1.dout_i_reg[46]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(46),
      Q => \gpr1.dout_i_reg[63]_0\(46)
    );
\gpr1.dout_i_reg[47]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(47),
      Q => \gpr1.dout_i_reg[63]_0\(47)
    );
\gpr1.dout_i_reg[48]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(48),
      Q => \gpr1.dout_i_reg[63]_0\(48)
    );
\gpr1.dout_i_reg[49]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(49),
      Q => \gpr1.dout_i_reg[63]_0\(49)
    );
\gpr1.dout_i_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(4),
      Q => \gpr1.dout_i_reg[63]_0\(4)
    );
\gpr1.dout_i_reg[50]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(50),
      Q => \gpr1.dout_i_reg[63]_0\(50)
    );
\gpr1.dout_i_reg[51]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(51),
      Q => \gpr1.dout_i_reg[63]_0\(51)
    );
\gpr1.dout_i_reg[52]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(52),
      Q => \gpr1.dout_i_reg[63]_0\(52)
    );
\gpr1.dout_i_reg[53]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(53),
      Q => \gpr1.dout_i_reg[63]_0\(53)
    );
\gpr1.dout_i_reg[54]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(54),
      Q => \gpr1.dout_i_reg[63]_0\(54)
    );
\gpr1.dout_i_reg[55]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(55),
      Q => \gpr1.dout_i_reg[63]_0\(55)
    );
\gpr1.dout_i_reg[56]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(56),
      Q => \gpr1.dout_i_reg[63]_0\(56)
    );
\gpr1.dout_i_reg[57]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(57),
      Q => \gpr1.dout_i_reg[63]_0\(57)
    );
\gpr1.dout_i_reg[58]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(58),
      Q => \gpr1.dout_i_reg[63]_0\(58)
    );
\gpr1.dout_i_reg[59]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(59),
      Q => \gpr1.dout_i_reg[63]_0\(59)
    );
\gpr1.dout_i_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(5),
      Q => \gpr1.dout_i_reg[63]_0\(5)
    );
\gpr1.dout_i_reg[60]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(60),
      Q => \gpr1.dout_i_reg[63]_0\(60)
    );
\gpr1.dout_i_reg[61]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(61),
      Q => \gpr1.dout_i_reg[63]_0\(61)
    );
\gpr1.dout_i_reg[62]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(62),
      Q => \gpr1.dout_i_reg[63]_0\(62)
    );
\gpr1.dout_i_reg[63]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(63),
      Q => \gpr1.dout_i_reg[63]_0\(63)
    );
\gpr1.dout_i_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(6),
      Q => \gpr1.dout_i_reg[63]_0\(6)
    );
\gpr1.dout_i_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(7),
      Q => \gpr1.dout_i_reg[63]_0\(7)
    );
\gpr1.dout_i_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(8),
      Q => \gpr1.dout_i_reg[63]_0\(8)
    );
\gpr1.dout_i_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => p_0_out(9),
      Q => \gpr1.dout_i_reg[63]_0\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_rd_bin_cntr is
  port (
    ram_empty_fb_i_reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \out\ : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    ram_empty_i_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 6 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_rd_bin_cntr : entity is "rd_bin_cntr";
end ska_tx_packet_ctrl_fifo_rd_bin_cntr;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_rd_bin_cntr is
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \gc0.count[6]_i_2_n_0\ : STD_LOGIC;
  signal \gras.rsts/comp0\ : STD_LOGIC;
  signal \gras.rsts/comp1\ : STD_LOGIC;
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ram_empty_i_i_4_n_0 : STD_LOGIC;
  signal ram_empty_i_i_5_n_0 : STD_LOGIC;
  signal ram_empty_i_i_6_n_0 : STD_LOGIC;
  signal ram_empty_i_i_7_n_0 : STD_LOGIC;
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gc0.count[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gc0.count[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gc0.count[6]_i_2\ : label is "soft_lutpair6";
begin
  Q(6 downto 0) <= \^q\(6 downto 0);
\gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_pntr_plus1(0),
      O => \plusOp__0\(0)
    );
\gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rd_pntr_plus1(0),
      I1 => rd_pntr_plus1(1),
      O => \plusOp__0\(1)
    );
\gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => rd_pntr_plus1(0),
      I1 => rd_pntr_plus1(1),
      I2 => rd_pntr_plus1(2),
      O => \plusOp__0\(2)
    );
\gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => rd_pntr_plus1(1),
      I1 => rd_pntr_plus1(0),
      I2 => rd_pntr_plus1(2),
      I3 => rd_pntr_plus1(3),
      O => \plusOp__0\(3)
    );
\gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => rd_pntr_plus1(2),
      I1 => rd_pntr_plus1(0),
      I2 => rd_pntr_plus1(1),
      I3 => rd_pntr_plus1(3),
      I4 => rd_pntr_plus1(4),
      O => \plusOp__0\(4)
    );
\gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => rd_pntr_plus1(3),
      I1 => rd_pntr_plus1(1),
      I2 => rd_pntr_plus1(0),
      I3 => rd_pntr_plus1(2),
      I4 => rd_pntr_plus1(4),
      I5 => rd_pntr_plus1(5),
      O => \plusOp__0\(5)
    );
\gc0.count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \gc0.count[6]_i_2_n_0\,
      I1 => rd_pntr_plus1(5),
      I2 => rd_pntr_plus1(6),
      O => \plusOp__0\(6)
    );
\gc0.count[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => rd_pntr_plus1(4),
      I1 => rd_pntr_plus1(2),
      I2 => rd_pntr_plus1(0),
      I3 => rd_pntr_plus1(1),
      I4 => rd_pntr_plus1(3),
      O => \gc0.count[6]_i_2_n_0\
    );
\gc0.count_d1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => rd_pntr_plus1(0),
      Q => \^q\(0)
    );
\gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => rd_pntr_plus1(1),
      Q => \^q\(1)
    );
\gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => rd_pntr_plus1(2),
      Q => \^q\(2)
    );
\gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => rd_pntr_plus1(3),
      Q => \^q\(3)
    );
\gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => rd_pntr_plus1(4),
      Q => \^q\(4)
    );
\gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => rd_pntr_plus1(5),
      Q => \^q\(5)
    );
\gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => rd_pntr_plus1(6),
      Q => \^q\(6)
    );
\gc0.count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      D => \plusOp__0\(0),
      PRE => rd_rst,
      Q => rd_pntr_plus1(0)
    );
\gc0.count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => \plusOp__0\(1),
      Q => rd_pntr_plus1(1)
    );
\gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => \plusOp__0\(2),
      Q => rd_pntr_plus1(2)
    );
\gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => \plusOp__0\(3),
      Q => rd_pntr_plus1(3)
    );
\gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => \plusOp__0\(4),
      Q => rd_pntr_plus1(4)
    );
\gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => \plusOp__0\(5),
      Q => rd_pntr_plus1(5)
    );
\gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => E(0),
      CLR => rd_rst,
      D => \plusOp__0\(6),
      Q => rd_pntr_plus1(6)
    );
ram_empty_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBBBBAAAAAAAA"
    )
        port map (
      I0 => \gras.rsts/comp0\,
      I1 => \out\,
      I2 => rd_en,
      I3 => ram_empty_i_reg(1),
      I4 => ram_empty_i_reg(0),
      I5 => \gras.rsts/comp1\,
      O => ram_empty_fb_i_reg
    );
ram_empty_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => ram_empty_i_i_4_n_0,
      I1 => \^q\(0),
      I2 => WR_PNTR_RD(0),
      I3 => \^q\(1),
      I4 => WR_PNTR_RD(1),
      I5 => ram_empty_i_i_5_n_0,
      O => \gras.rsts/comp0\
    );
ram_empty_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => ram_empty_i_i_6_n_0,
      I1 => rd_pntr_plus1(0),
      I2 => WR_PNTR_RD(0),
      I3 => rd_pntr_plus1(1),
      I4 => WR_PNTR_RD(1),
      I5 => ram_empty_i_i_7_n_0,
      O => \gras.rsts/comp1\
    );
ram_empty_i_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^q\(2),
      I1 => WR_PNTR_RD(2),
      I2 => \^q\(3),
      I3 => WR_PNTR_RD(3),
      O => ram_empty_i_i_4_n_0
    );
ram_empty_i_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \^q\(6),
      I1 => WR_PNTR_RD(6),
      I2 => WR_PNTR_RD(5),
      I3 => \^q\(5),
      I4 => WR_PNTR_RD(4),
      I5 => \^q\(4),
      O => ram_empty_i_i_5_n_0
    );
ram_empty_i_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => rd_pntr_plus1(2),
      I1 => WR_PNTR_RD(2),
      I2 => rd_pntr_plus1(3),
      I3 => WR_PNTR_RD(3),
      O => ram_empty_i_i_6_n_0
    );
ram_empty_i_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => rd_pntr_plus1(6),
      I1 => WR_PNTR_RD(6),
      I2 => WR_PNTR_RD(5),
      I3 => rd_pntr_plus1(5),
      I4 => WR_PNTR_RD(4),
      I5 => rd_pntr_plus1(4),
      O => ram_empty_i_i_7_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_rd_fwft is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    empty : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gpregsm1.curr_fwft_state_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_empty_fb_i_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    \gpr1.dout_i_reg[0]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_rd_fwft : entity is "rd_fwft";
end ska_tx_packet_ctrl_fifo_rd_fwft;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_rd_fwft is
  signal aempty_fwft_fb_i : STD_LOGIC;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of aempty_fwft_fb_i : signal is std.standard.true;
  signal aempty_fwft_i : STD_LOGIC;
  attribute DONT_TOUCH of aempty_fwft_i : signal is std.standard.true;
  signal aempty_fwft_i0 : STD_LOGIC;
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute DONT_TOUCH of curr_fwft_state : signal is std.standard.true;
  signal empty_fwft_fb_i : STD_LOGIC;
  attribute DONT_TOUCH of empty_fwft_fb_i : signal is std.standard.true;
  signal empty_fwft_fb_o_i : STD_LOGIC;
  attribute DONT_TOUCH of empty_fwft_fb_o_i : signal is std.standard.true;
  signal empty_fwft_fb_o_i0 : STD_LOGIC;
  signal empty_fwft_i : STD_LOGIC;
  attribute DONT_TOUCH of empty_fwft_i : signal is std.standard.true;
  signal empty_fwft_i0 : STD_LOGIC;
  signal next_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal user_valid : STD_LOGIC;
  attribute DONT_TOUCH of user_valid : signal is std.standard.true;
  attribute DONT_TOUCH of aempty_fwft_fb_i_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of aempty_fwft_fb_i_reg : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of aempty_fwft_fb_i_reg : label is "no";
  attribute DONT_TOUCH of aempty_fwft_i_reg : label is std.standard.true;
  attribute KEEP of aempty_fwft_i_reg : label is "yes";
  attribute equivalent_register_removal of aempty_fwft_i_reg : label is "no";
  attribute DONT_TOUCH of empty_fwft_fb_i_reg : label is std.standard.true;
  attribute KEEP of empty_fwft_fb_i_reg : label is "yes";
  attribute equivalent_register_removal of empty_fwft_fb_i_reg : label is "no";
  attribute DONT_TOUCH of empty_fwft_fb_o_i_reg : label is std.standard.true;
  attribute KEEP of empty_fwft_fb_o_i_reg : label is "yes";
  attribute equivalent_register_removal of empty_fwft_fb_o_i_reg : label is "no";
  attribute DONT_TOUCH of empty_fwft_i_reg : label is std.standard.true;
  attribute KEEP of empty_fwft_i_reg : label is "yes";
  attribute equivalent_register_removal of empty_fwft_i_reg : label is "no";
  attribute DONT_TOUCH of \gpregsm1.curr_fwft_state_reg[0]\ : label is std.standard.true;
  attribute KEEP of \gpregsm1.curr_fwft_state_reg[0]\ : label is "yes";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[0]\ : label is "no";
  attribute DONT_TOUCH of \gpregsm1.curr_fwft_state_reg[1]\ : label is std.standard.true;
  attribute KEEP of \gpregsm1.curr_fwft_state_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[1]\ : label is "no";
  attribute DONT_TOUCH of \gpregsm1.user_valid_reg\ : label is std.standard.true;
  attribute KEEP of \gpregsm1.user_valid_reg\ : label is "yes";
  attribute equivalent_register_removal of \gpregsm1.user_valid_reg\ : label is "no";
begin
  empty <= empty_fwft_i;
  \out\(1 downto 0) <= curr_fwft_state(1 downto 0);
aempty_fwft_fb_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFCB8000"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(0),
      I2 => curr_fwft_state(1),
      I3 => \gpr1.dout_i_reg[0]\,
      I4 => aempty_fwft_fb_i,
      O => aempty_fwft_i0
    );
aempty_fwft_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => aempty_fwft_i0,
      PRE => rd_rst,
      Q => aempty_fwft_fb_i
    );
aempty_fwft_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => aempty_fwft_i0,
      PRE => rd_rst,
      Q => aempty_fwft_i
    );
empty_fwft_fb_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F320"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(1),
      I2 => curr_fwft_state(0),
      I3 => empty_fwft_fb_i,
      O => empty_fwft_i0
    );
empty_fwft_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => rd_rst,
      Q => empty_fwft_fb_i
    );
empty_fwft_fb_o_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F320"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(1),
      I2 => curr_fwft_state(0),
      I3 => empty_fwft_fb_o_i,
      O => empty_fwft_fb_o_i0
    );
empty_fwft_fb_o_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => empty_fwft_fb_o_i0,
      PRE => rd_rst,
      Q => empty_fwft_fb_o_i
    );
empty_fwft_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => rd_rst,
      Q => empty_fwft_i
    );
\gc0.count_d1[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4555"
    )
        port map (
      I0 => \gpr1.dout_i_reg[0]\,
      I1 => rd_en,
      I2 => curr_fwft_state(1),
      I3 => curr_fwft_state(0),
      O => ram_empty_fb_i_reg(0)
    );
\goreg_dm.dout_i[63]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => curr_fwft_state(1),
      I1 => curr_fwft_state(0),
      I2 => rd_en,
      O => \gpregsm1.curr_fwft_state_reg[1]_0\(0)
    );
\gpr1.dout_i[63]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F7"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => curr_fwft_state(1),
      I2 => rd_en,
      I3 => \gpr1.dout_i_reg[0]\,
      O => E(0)
    );
\gpregsm1.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => curr_fwft_state(1),
      I1 => rd_en,
      I2 => curr_fwft_state(0),
      O => next_fwft_state(0)
    );
\gpregsm1.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20FF"
    )
        port map (
      I0 => curr_fwft_state(1),
      I1 => rd_en,
      I2 => curr_fwft_state(0),
      I3 => \gpr1.dout_i_reg[0]\,
      O => next_fwft_state(1)
    );
\gpregsm1.curr_fwft_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => rd_rst,
      D => next_fwft_state(0),
      Q => curr_fwft_state(0)
    );
\gpregsm1.curr_fwft_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => rd_rst,
      D => next_fwft_state(1),
      Q => curr_fwft_state(1)
    );
\gpregsm1.user_valid_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      CLR => rd_rst,
      D => next_fwft_state(0),
      Q => user_valid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_rd_status_flags_as is
  port (
    \out\ : out STD_LOGIC;
    ram_empty_i_reg_0 : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_rd_status_flags_as : entity is "rd_status_flags_as";
end ska_tx_packet_ctrl_fifo_rd_status_flags_as;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_rd_status_flags_as is
  signal ram_empty_fb_i : STD_LOGIC;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of ram_empty_fb_i : signal is std.standard.true;
  signal ram_empty_i : STD_LOGIC;
  attribute DONT_TOUCH of ram_empty_i : signal is std.standard.true;
  attribute DONT_TOUCH of ram_empty_fb_i_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of ram_empty_fb_i_reg : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_empty_fb_i_reg : label is "no";
  attribute DONT_TOUCH of ram_empty_i_reg : label is std.standard.true;
  attribute KEEP of ram_empty_i_reg : label is "yes";
  attribute equivalent_register_removal of ram_empty_i_reg : label is "no";
begin
  \out\ <= ram_empty_fb_i;
ram_empty_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => ram_empty_i_reg_0,
      PRE => rd_rst,
      Q => ram_empty_fb_i
    );
ram_empty_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => ram_empty_i_reg_0,
      PRE => rd_rst,
      Q => ram_empty_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_reset_blk_ramfifo is
  port (
    \out\ : out STD_LOGIC;
    \grstd1.grst_full.grst_f.rst_d3_reg_0\ : out STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_reset_blk_ramfifo : entity is "reset_blk_ramfifo";
end ska_tx_packet_ctrl_fifo_reset_blk_ramfifo;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_reset_blk_ramfifo is
  signal rst_d1 : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_d1 : signal is "true";
  attribute msgon : string;
  attribute msgon of rst_d1 : signal is "true";
  signal rst_d2 : STD_LOGIC;
  attribute async_reg of rst_d2 : signal is "true";
  attribute msgon of rst_d2 : signal is "true";
  signal rst_d3 : STD_LOGIC;
  attribute async_reg of rst_d3 : signal is "true";
  attribute msgon of rst_d3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "yes";
  attribute msgon of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is std.standard.true;
  attribute KEEP of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "yes";
  attribute msgon of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is std.standard.true;
  attribute KEEP of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "yes";
  attribute msgon of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "true";
begin
  \grstd1.grst_full.grst_f.rst_d3_reg_0\ <= rst_d3;
  \out\ <= rst_d2;
\grstd1.grst_full.grst_f.rst_d1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => wr_rst,
      Q => rst_d1
    );
\grstd1.grst_full.grst_f.rst_d2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rst_d1,
      PRE => wr_rst,
      Q => rst_d2
    );
\grstd1.grst_full.grst_f.rst_d3_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rst_d2,
      PRE => wr_rst,
      Q => rst_d3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_wr_bin_cntr is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \gic0.gc0.count_d1_reg[6]_0\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \gic0.gc0.count_d2_reg[6]_0\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_wr_bin_cntr : entity is "wr_bin_cntr";
end ska_tx_packet_ctrl_fifo_wr_bin_cntr;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_wr_bin_cntr is
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \gic0.gc0.count[6]_i_2_n_0\ : STD_LOGIC;
  signal \^gic0.gc0.count_d1_reg[6]_0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gic0.gc0.count[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gic0.gc0.count[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gic0.gc0.count[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gic0.gc0.count[6]_i_2\ : label is "soft_lutpair8";
begin
  Q(6 downto 0) <= \^q\(6 downto 0);
  \gic0.gc0.count_d1_reg[6]_0\(6 downto 0) <= \^gic0.gc0.count_d1_reg[6]_0\(6 downto 0);
\gic0.gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \plusOp__1\(0)
    );
\gic0.gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \plusOp__1\(1)
    );
\gic0.gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \plusOp__1\(2)
    );
\gic0.gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \plusOp__1\(3)
    );
\gic0.gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \plusOp__1\(4)
    );
\gic0.gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \plusOp__1\(5)
    );
\gic0.gc0.count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \gic0.gc0.count[6]_i_2_n_0\,
      I1 => \^q\(5),
      I2 => \^q\(6),
      O => \plusOp__1\(6)
    );
\gic0.gc0.count[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => \gic0.gc0.count[6]_i_2_n_0\
    );
\gic0.gc0.count_d1_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \^q\(0),
      PRE => wr_rst,
      Q => \^gic0.gc0.count_d1_reg[6]_0\(0)
    );
\gic0.gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^q\(1),
      Q => \^gic0.gc0.count_d1_reg[6]_0\(1)
    );
\gic0.gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^q\(2),
      Q => \^gic0.gc0.count_d1_reg[6]_0\(2)
    );
\gic0.gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^q\(3),
      Q => \^gic0.gc0.count_d1_reg[6]_0\(3)
    );
\gic0.gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^q\(4),
      Q => \^gic0.gc0.count_d1_reg[6]_0\(4)
    );
\gic0.gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^q\(5),
      Q => \^gic0.gc0.count_d1_reg[6]_0\(5)
    );
\gic0.gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^q\(6),
      Q => \^gic0.gc0.count_d1_reg[6]_0\(6)
    );
\gic0.gc0.count_d2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^gic0.gc0.count_d1_reg[6]_0\(0),
      Q => \gic0.gc0.count_d2_reg[6]_0\(0)
    );
\gic0.gc0.count_d2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^gic0.gc0.count_d1_reg[6]_0\(1),
      Q => \gic0.gc0.count_d2_reg[6]_0\(1)
    );
\gic0.gc0.count_d2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^gic0.gc0.count_d1_reg[6]_0\(2),
      Q => \gic0.gc0.count_d2_reg[6]_0\(2)
    );
\gic0.gc0.count_d2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^gic0.gc0.count_d1_reg[6]_0\(3),
      Q => \gic0.gc0.count_d2_reg[6]_0\(3)
    );
\gic0.gc0.count_d2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^gic0.gc0.count_d1_reg[6]_0\(4),
      Q => \gic0.gc0.count_d2_reg[6]_0\(4)
    );
\gic0.gc0.count_d2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^gic0.gc0.count_d1_reg[6]_0\(5),
      Q => \gic0.gc0.count_d2_reg[6]_0\(5)
    );
\gic0.gc0.count_d2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \^gic0.gc0.count_d1_reg[6]_0\(6),
      Q => \gic0.gc0.count_d2_reg[6]_0\(6)
    );
\gic0.gc0.count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \plusOp__1\(0),
      Q => \^q\(0)
    );
\gic0.gc0.count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      D => \plusOp__1\(1),
      PRE => wr_rst,
      Q => \^q\(1)
    );
\gic0.gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \plusOp__1\(2),
      Q => \^q\(2)
    );
\gic0.gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \plusOp__1\(3),
      Q => \^q\(3)
    );
\gic0.gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \plusOp__1\(4),
      Q => \^q\(4)
    );
\gic0.gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \plusOp__1\(5),
      Q => \^q\(5)
    );
\gic0.gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => E(0),
      CLR => wr_rst,
      D => \plusOp__1\(6),
      Q => \^q\(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_wr_handshaking_flags is
  port (
    overflow : out STD_LOGIC;
    \gof.gof1.overflow_i_reg_0\ : in STD_LOGIC;
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_wr_handshaking_flags : entity is "wr_handshaking_flags";
end ska_tx_packet_ctrl_fifo_wr_handshaking_flags;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_wr_handshaking_flags is
begin
\gof.gof1.overflow_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gof.gof1.overflow_i_reg_0\,
      Q => overflow,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_wr_pf_as is
  port (
    prog_full : out STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gdiff.diff_pntr_pad_reg[7]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    wr_clk : in STD_LOGIC;
    \gpf1.prog_full_i_reg_0\ : in STD_LOGIC;
    \gpf1.prog_full_i_reg_1\ : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    wr_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_wr_pf_as : entity is "wr_pf_as";
end ska_tx_packet_ctrl_fifo_wr_pf_as;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_wr_pf_as is
  signal diff_pntr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \gpf1.prog_full_i_i_1_n_0\ : STD_LOGIC;
  signal \gpf1.prog_full_i_i_2_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal \^prog_full\ : STD_LOGIC;
  signal \NLW_plusOp_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  prog_full <= \^prog_full\;
\gdiff.diff_pntr_pad_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => wr_rst,
      D => plusOp(1),
      Q => diff_pntr(0)
    );
\gdiff.diff_pntr_pad_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => wr_rst,
      D => plusOp(2),
      Q => diff_pntr(1)
    );
\gdiff.diff_pntr_pad_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => wr_rst,
      D => plusOp(3),
      Q => diff_pntr(2)
    );
\gdiff.diff_pntr_pad_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => wr_rst,
      D => plusOp(4),
      Q => diff_pntr(3)
    );
\gdiff.diff_pntr_pad_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => wr_rst,
      D => plusOp(5),
      Q => diff_pntr(4)
    );
\gdiff.diff_pntr_pad_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => wr_rst,
      D => plusOp(6),
      Q => diff_pntr(5)
    );
\gdiff.diff_pntr_pad_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      CLR => wr_rst,
      D => plusOp(7),
      Q => diff_pntr(6)
    );
\gpf1.prog_full_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF004000000040"
    )
        port map (
      I0 => \gpf1.prog_full_i_i_2_n_0\,
      I1 => diff_pntr(2),
      I2 => diff_pntr(3),
      I3 => \gpf1.prog_full_i_reg_1\,
      I4 => \out\,
      I5 => \^prog_full\,
      O => \gpf1.prog_full_i_i_1_n_0\
    );
\gpf1.prog_full_i_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"777FFFFF"
    )
        port map (
      I0 => diff_pntr(5),
      I1 => diff_pntr(4),
      I2 => diff_pntr(1),
      I3 => diff_pntr(0),
      I4 => diff_pntr(6),
      O => \gpf1.prog_full_i_i_2_n_0\
    );
\gpf1.prog_full_i_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gpf1.prog_full_i_i_1_n_0\,
      PRE => \gpf1.prog_full_i_reg_0\,
      Q => \^prog_full\
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => E(0),
      DI(3 downto 0) => Q(3 downto 0),
      O(3 downto 0) => plusOp(4 downto 1),
      S(3 downto 0) => S(3 downto 0)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3 downto 2) => \NLW_plusOp_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => Q(5 downto 4),
      O(3) => \NLW_plusOp_carry__0_O_UNCONNECTED\(3),
      O(2 downto 0) => plusOp(7 downto 5),
      S(3) => '0',
      S(2 downto 0) => \gdiff.diff_pntr_pad_reg[7]_0\(2 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_wr_status_flags_as is
  port (
    full : out STD_LOGIC;
    \out\ : out STD_LOGIC;
    ram_full_fb_i_reg_0 : out STD_LOGIC;
    ram_full_fb_i_reg_1 : out STD_LOGIC;
    ram_full_fb_i_reg_2 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_full_fb_i_reg_3 : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    ram_full_fb_i_reg_4 : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    RAM_reg_64_127_0_2 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_wr_status_flags_as : entity is "wr_status_flags_as";
end ska_tx_packet_ctrl_fifo_wr_status_flags_as;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_wr_status_flags_as is
  signal ram_full_fb_i : STD_LOGIC;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of ram_full_fb_i : signal is std.standard.true;
  signal ram_full_i : STD_LOGIC;
  attribute DONT_TOUCH of ram_full_i : signal is std.standard.true;
  attribute DONT_TOUCH of ram_full_fb_i_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of ram_full_fb_i_reg : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_full_fb_i_reg : label is "no";
  attribute DONT_TOUCH of ram_full_i_reg : label is std.standard.true;
  attribute KEEP of ram_full_i_reg : label is "yes";
  attribute equivalent_register_removal of ram_full_i_reg : label is "no";
begin
  full <= ram_full_i;
  \out\ <= ram_full_fb_i;
RAM_reg_0_63_0_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => ram_full_fb_i,
      I1 => wr_en,
      I2 => RAM_reg_64_127_0_2(0),
      O => ram_full_fb_i_reg_0
    );
RAM_reg_64_127_0_2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => ram_full_fb_i,
      I1 => wr_en,
      I2 => RAM_reg_64_127_0_2(0),
      O => ram_full_fb_i_reg_1
    );
\gic0.gc0.count_d1[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => wr_en,
      I1 => ram_full_fb_i,
      O => E(0)
    );
\gof.gof1.overflow_i_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ram_full_fb_i,
      I1 => wr_en,
      O => ram_full_fb_i_reg_2
    );
ram_full_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => ram_full_fb_i_reg_3,
      PRE => ram_full_fb_i_reg_4,
      Q => ram_full_fb_i
    );
ram_full_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => ram_full_fb_i_reg_3,
      PRE => ram_full_fb_i_reg_4,
      Q => ram_full_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_clk_x_pntrs is
  port (
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \dest_out_bin_ff_reg[6]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ram_full_fb_i_reg : out STD_LOGIC;
    WR_PNTR_RD : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \out\ : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    ram_full_fb_i_reg_0 : in STD_LOGIC;
    ram_full_i_i_2_0 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_clk : in STD_LOGIC;
    \src_gray_ff_reg[6]\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_clk : in STD_LOGIC;
    \src_gray_ff_reg[6]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_clk_x_pntrs : entity is "clk_x_pntrs";
end ska_tx_packet_ctrl_fifo_clk_x_pntrs;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_clk_x_pntrs is
  signal \gntv_or_sync_fifo.gl0.wr/gwas.wsts/comp1\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr/gwas.wsts/comp2\ : STD_LOGIC;
  signal p_25_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ram_full_i_i_4_n_0 : STD_LOGIC;
  signal ram_full_i_i_5_n_0 : STD_LOGIC;
  signal ram_full_i_i_6_n_0 : STD_LOGIC;
  signal ram_full_i_i_7_n_0 : STD_LOGIC;
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of rd_pntr_cdc_inst : label is 2;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of rd_pntr_cdc_inst : label is 0;
  attribute REG_OUTPUT : integer;
  attribute REG_OUTPUT of rd_pntr_cdc_inst : label is 1;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of rd_pntr_cdc_inst : label is 0;
  attribute SIM_LOSSLESS_GRAY_CHK : integer;
  attribute SIM_LOSSLESS_GRAY_CHK of rd_pntr_cdc_inst : label is 0;
  attribute VERSION : integer;
  attribute VERSION of rd_pntr_cdc_inst : label is 0;
  attribute WIDTH : integer;
  attribute WIDTH of rd_pntr_cdc_inst : label is 7;
  attribute XPM_CDC : string;
  attribute XPM_CDC of rd_pntr_cdc_inst : label is "GRAY";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of rd_pntr_cdc_inst : label is "TRUE";
  attribute DEST_SYNC_FF of wr_pntr_cdc_inst : label is 2;
  attribute INIT_SYNC_FF of wr_pntr_cdc_inst : label is 0;
  attribute REG_OUTPUT of wr_pntr_cdc_inst : label is 1;
  attribute SIM_ASSERT_CHK of wr_pntr_cdc_inst : label is 0;
  attribute SIM_LOSSLESS_GRAY_CHK of wr_pntr_cdc_inst : label is 0;
  attribute VERSION of wr_pntr_cdc_inst : label is 0;
  attribute WIDTH of wr_pntr_cdc_inst : label is 7;
  attribute XPM_CDC of wr_pntr_cdc_inst : label is "GRAY";
  attribute XPM_MODULE of wr_pntr_cdc_inst : label is "TRUE";
begin
\plusOp_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_25_out(6),
      I1 => Q(6),
      O => \dest_out_bin_ff_reg[6]\(2)
    );
\plusOp_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_25_out(5),
      I1 => Q(5),
      O => \dest_out_bin_ff_reg[6]\(1)
    );
\plusOp_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_25_out(4),
      I1 => Q(4),
      O => \dest_out_bin_ff_reg[6]\(0)
    );
plusOp_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_25_out(3),
      I1 => Q(3),
      O => S(3)
    );
plusOp_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_25_out(2),
      I1 => Q(2),
      O => S(2)
    );
plusOp_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_25_out(1),
      I1 => Q(1),
      O => S(1)
    );
plusOp_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_25_out(0),
      I1 => Q(0),
      O => S(0)
    );
ram_full_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF20"
    )
        port map (
      I0 => \gntv_or_sync_fifo.gl0.wr/gwas.wsts/comp2\,
      I1 => \out\,
      I2 => wr_en,
      I3 => \gntv_or_sync_fifo.gl0.wr/gwas.wsts/comp1\,
      I4 => ram_full_fb_i_reg_0,
      O => ram_full_fb_i_reg
    );
ram_full_i_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => ram_full_i_i_4_n_0,
      I1 => p_25_out(0),
      I2 => ram_full_i_i_2_0(0),
      I3 => p_25_out(1),
      I4 => ram_full_i_i_2_0(1),
      I5 => ram_full_i_i_5_n_0,
      O => \gntv_or_sync_fifo.gl0.wr/gwas.wsts/comp2\
    );
ram_full_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000082000082"
    )
        port map (
      I0 => ram_full_i_i_6_n_0,
      I1 => p_25_out(0),
      I2 => Q(0),
      I3 => p_25_out(1),
      I4 => Q(1),
      I5 => ram_full_i_i_7_n_0,
      O => \gntv_or_sync_fifo.gl0.wr/gwas.wsts/comp1\
    );
ram_full_i_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_25_out(2),
      I1 => ram_full_i_i_2_0(2),
      I2 => p_25_out(3),
      I3 => ram_full_i_i_2_0(3),
      O => ram_full_i_i_4_n_0
    );
ram_full_i_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => p_25_out(6),
      I1 => ram_full_i_i_2_0(6),
      I2 => ram_full_i_i_2_0(5),
      I3 => p_25_out(5),
      I4 => ram_full_i_i_2_0(4),
      I5 => p_25_out(4),
      O => ram_full_i_i_5_n_0
    );
ram_full_i_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => p_25_out(2),
      I1 => Q(2),
      I2 => p_25_out(3),
      I3 => Q(3),
      O => ram_full_i_i_6_n_0
    );
ram_full_i_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => p_25_out(6),
      I1 => Q(6),
      I2 => Q(5),
      I3 => p_25_out(5),
      I4 => Q(4),
      I5 => p_25_out(4),
      O => ram_full_i_i_7_n_0
    );
rd_pntr_cdc_inst: entity work.ska_tx_packet_ctrl_fifo_xpm_cdc_gray
     port map (
      dest_clk => wr_clk,
      dest_out_bin(6 downto 0) => p_25_out(6 downto 0),
      src_clk => rd_clk,
      src_in_bin(6 downto 0) => \src_gray_ff_reg[6]_0\(6 downto 0)
    );
wr_pntr_cdc_inst: entity work.\ska_tx_packet_ctrl_fifo_xpm_cdc_gray__2\
     port map (
      dest_clk => rd_clk,
      dest_out_bin(6 downto 0) => WR_PNTR_RD(6 downto 0),
      src_clk => wr_clk,
      src_in_bin(6 downto 0) => \src_gray_ff_reg[6]\(6 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_memory is
  port (
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    \gpr1.dout_i_reg[0]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \gpr1.dout_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \gpr1.dout_i_reg[63]\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    \goreg_dm.dout_i_reg[63]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_memory : entity is "memory";
end ska_tx_packet_ctrl_fifo_memory;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_memory is
  signal dout_i : STD_LOGIC_VECTOR ( 63 downto 0 );
begin
\gdm.dm_gen.dm\: entity work.ska_tx_packet_ctrl_fifo_dmem
     port map (
      E(0) => E(0),
      Q(6 downto 0) => Q(6 downto 0),
      din(63 downto 0) => din(63 downto 0),
      \gpr1.dout_i_reg[0]_0\ => \gpr1.dout_i_reg[0]\,
      \gpr1.dout_i_reg[0]_1\(5 downto 0) => \gpr1.dout_i_reg[0]_0\(5 downto 0),
      \gpr1.dout_i_reg[63]_0\(63 downto 0) => dout_i(63 downto 0),
      \gpr1.dout_i_reg[63]_1\ => \gpr1.dout_i_reg[63]\,
      rd_clk => rd_clk,
      rd_rst => rd_rst,
      wr_clk => wr_clk
    );
\goreg_dm.dout_i_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(0),
      Q => dout(0)
    );
\goreg_dm.dout_i_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(10),
      Q => dout(10)
    );
\goreg_dm.dout_i_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(11),
      Q => dout(11)
    );
\goreg_dm.dout_i_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(12),
      Q => dout(12)
    );
\goreg_dm.dout_i_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(13),
      Q => dout(13)
    );
\goreg_dm.dout_i_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(14),
      Q => dout(14)
    );
\goreg_dm.dout_i_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(15),
      Q => dout(15)
    );
\goreg_dm.dout_i_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(16),
      Q => dout(16)
    );
\goreg_dm.dout_i_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(17),
      Q => dout(17)
    );
\goreg_dm.dout_i_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(18),
      Q => dout(18)
    );
\goreg_dm.dout_i_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(19),
      Q => dout(19)
    );
\goreg_dm.dout_i_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(1),
      Q => dout(1)
    );
\goreg_dm.dout_i_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(20),
      Q => dout(20)
    );
\goreg_dm.dout_i_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(21),
      Q => dout(21)
    );
\goreg_dm.dout_i_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(22),
      Q => dout(22)
    );
\goreg_dm.dout_i_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(23),
      Q => dout(23)
    );
\goreg_dm.dout_i_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(24),
      Q => dout(24)
    );
\goreg_dm.dout_i_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(25),
      Q => dout(25)
    );
\goreg_dm.dout_i_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(26),
      Q => dout(26)
    );
\goreg_dm.dout_i_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(27),
      Q => dout(27)
    );
\goreg_dm.dout_i_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(28),
      Q => dout(28)
    );
\goreg_dm.dout_i_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(29),
      Q => dout(29)
    );
\goreg_dm.dout_i_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(2),
      Q => dout(2)
    );
\goreg_dm.dout_i_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(30),
      Q => dout(30)
    );
\goreg_dm.dout_i_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(31),
      Q => dout(31)
    );
\goreg_dm.dout_i_reg[32]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(32),
      Q => dout(32)
    );
\goreg_dm.dout_i_reg[33]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(33),
      Q => dout(33)
    );
\goreg_dm.dout_i_reg[34]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(34),
      Q => dout(34)
    );
\goreg_dm.dout_i_reg[35]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(35),
      Q => dout(35)
    );
\goreg_dm.dout_i_reg[36]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(36),
      Q => dout(36)
    );
\goreg_dm.dout_i_reg[37]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(37),
      Q => dout(37)
    );
\goreg_dm.dout_i_reg[38]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(38),
      Q => dout(38)
    );
\goreg_dm.dout_i_reg[39]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(39),
      Q => dout(39)
    );
\goreg_dm.dout_i_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(3),
      Q => dout(3)
    );
\goreg_dm.dout_i_reg[40]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(40),
      Q => dout(40)
    );
\goreg_dm.dout_i_reg[41]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(41),
      Q => dout(41)
    );
\goreg_dm.dout_i_reg[42]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(42),
      Q => dout(42)
    );
\goreg_dm.dout_i_reg[43]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(43),
      Q => dout(43)
    );
\goreg_dm.dout_i_reg[44]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(44),
      Q => dout(44)
    );
\goreg_dm.dout_i_reg[45]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(45),
      Q => dout(45)
    );
\goreg_dm.dout_i_reg[46]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(46),
      Q => dout(46)
    );
\goreg_dm.dout_i_reg[47]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(47),
      Q => dout(47)
    );
\goreg_dm.dout_i_reg[48]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(48),
      Q => dout(48)
    );
\goreg_dm.dout_i_reg[49]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(49),
      Q => dout(49)
    );
\goreg_dm.dout_i_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(4),
      Q => dout(4)
    );
\goreg_dm.dout_i_reg[50]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(50),
      Q => dout(50)
    );
\goreg_dm.dout_i_reg[51]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(51),
      Q => dout(51)
    );
\goreg_dm.dout_i_reg[52]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(52),
      Q => dout(52)
    );
\goreg_dm.dout_i_reg[53]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(53),
      Q => dout(53)
    );
\goreg_dm.dout_i_reg[54]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(54),
      Q => dout(54)
    );
\goreg_dm.dout_i_reg[55]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(55),
      Q => dout(55)
    );
\goreg_dm.dout_i_reg[56]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(56),
      Q => dout(56)
    );
\goreg_dm.dout_i_reg[57]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(57),
      Q => dout(57)
    );
\goreg_dm.dout_i_reg[58]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(58),
      Q => dout(58)
    );
\goreg_dm.dout_i_reg[59]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(59),
      Q => dout(59)
    );
\goreg_dm.dout_i_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(5),
      Q => dout(5)
    );
\goreg_dm.dout_i_reg[60]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(60),
      Q => dout(60)
    );
\goreg_dm.dout_i_reg[61]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(61),
      Q => dout(61)
    );
\goreg_dm.dout_i_reg[62]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(62),
      Q => dout(62)
    );
\goreg_dm.dout_i_reg[63]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(63),
      Q => dout(63)
    );
\goreg_dm.dout_i_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(6),
      Q => dout(6)
    );
\goreg_dm.dout_i_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(7),
      Q => dout(7)
    );
\goreg_dm.dout_i_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(8),
      Q => dout(8)
    );
\goreg_dm.dout_i_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \goreg_dm.dout_i_reg[63]_0\(0),
      CLR => rd_rst,
      D => dout_i(9),
      Q => dout(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_rd_logic is
  port (
    empty : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gpregsm1.curr_fwft_state_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    WR_PNTR_RD : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_rd_logic : entity is "rd_logic";
end ska_tx_packet_ctrl_fifo_rd_logic;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_rd_logic is
  signal \gr1.gr1_int.rfwft_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_2_out : STD_LOGIC;
  signal p_8_out : STD_LOGIC;
  signal rpntr_n_0 : STD_LOGIC;
begin
\gr1.gr1_int.rfwft\: entity work.ska_tx_packet_ctrl_fifo_rd_fwft
     port map (
      E(0) => E(0),
      empty => empty,
      \gpr1.dout_i_reg[0]\ => p_2_out,
      \gpregsm1.curr_fwft_state_reg[1]_0\(0) => \gpregsm1.curr_fwft_state_reg[1]\(0),
      \out\(1) => \gr1.gr1_int.rfwft_n_0\,
      \out\(0) => p_0_in(0),
      ram_empty_fb_i_reg(0) => p_8_out,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst => rd_rst
    );
\gras.rsts\: entity work.ska_tx_packet_ctrl_fifo_rd_status_flags_as
     port map (
      \out\ => p_2_out,
      ram_empty_i_reg_0 => rpntr_n_0,
      rd_clk => rd_clk,
      rd_rst => rd_rst
    );
rpntr: entity work.ska_tx_packet_ctrl_fifo_rd_bin_cntr
     port map (
      E(0) => p_8_out,
      Q(6 downto 0) => Q(6 downto 0),
      WR_PNTR_RD(6 downto 0) => WR_PNTR_RD(6 downto 0),
      \out\ => p_2_out,
      ram_empty_fb_i_reg => rpntr_n_0,
      ram_empty_i_reg(1) => \gr1.gr1_int.rfwft_n_0\,
      ram_empty_i_reg(0) => p_0_in(0),
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst => rd_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_wr_logic is
  port (
    full : out STD_LOGIC;
    \out\ : out STD_LOGIC;
    overflow : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full : out STD_LOGIC;
    ram_full_fb_i_reg : out STD_LOGIC;
    \gic0.gc0.count_d2_reg[6]\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    ram_full_fb_i_reg_0 : out STD_LOGIC;
    \gic0.gc0.count_reg[6]\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    ram_full_fb_i_reg_1 : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    ram_full_fb_i_reg_2 : in STD_LOGIC;
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \gdiff.diff_pntr_pad_reg[7]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    wr_en : in STD_LOGIC;
    \gpf1.prog_full_i_reg\ : in STD_LOGIC;
    wr_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_wr_logic : entity is "wr_logic";
end ska_tx_packet_ctrl_fifo_wr_logic;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_wr_logic is
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^gic0.gc0.count_d2_reg[6]\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \gwas.wsts_n_4\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC;
  signal p_20_out : STD_LOGIC;
begin
  Q(6 downto 0) <= \^q\(6 downto 0);
  \gic0.gc0.count_d2_reg[6]\(6 downto 0) <= \^gic0.gc0.count_d2_reg[6]\(6 downto 0);
  \out\ <= \^out\;
\gwas.gpf.wrpf\: entity work.ska_tx_packet_ctrl_fifo_wr_pf_as
     port map (
      E(0) => p_20_out,
      Q(5 downto 0) => \^q\(5 downto 0),
      S(3 downto 0) => S(3 downto 0),
      \gdiff.diff_pntr_pad_reg[7]_0\(2 downto 0) => \gdiff.diff_pntr_pad_reg[7]\(2 downto 0),
      \gpf1.prog_full_i_reg_0\ => ram_full_fb_i_reg_2,
      \gpf1.prog_full_i_reg_1\ => \gpf1.prog_full_i_reg\,
      \out\ => \^out\,
      prog_full => prog_full,
      wr_clk => wr_clk,
      wr_rst => wr_rst
    );
\gwas.wsts\: entity work.ska_tx_packet_ctrl_fifo_wr_status_flags_as
     port map (
      E(0) => p_20_out,
      RAM_reg_64_127_0_2(0) => \^gic0.gc0.count_d2_reg[6]\(6),
      full => full,
      \out\ => \^out\,
      ram_full_fb_i_reg_0 => ram_full_fb_i_reg,
      ram_full_fb_i_reg_1 => ram_full_fb_i_reg_0,
      ram_full_fb_i_reg_2 => \gwas.wsts_n_4\,
      ram_full_fb_i_reg_3 => ram_full_fb_i_reg_1,
      ram_full_fb_i_reg_4 => ram_full_fb_i_reg_2,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
\gwhf.whf\: entity work.ska_tx_packet_ctrl_fifo_wr_handshaking_flags
     port map (
      \gof.gof1.overflow_i_reg_0\ => \gwas.wsts_n_4\,
      overflow => overflow,
      wr_clk => wr_clk
    );
wpntr: entity work.ska_tx_packet_ctrl_fifo_wr_bin_cntr
     port map (
      E(0) => p_20_out,
      Q(6 downto 0) => \gic0.gc0.count_reg[6]\(6 downto 0),
      \gic0.gc0.count_d1_reg[6]_0\(6 downto 0) => \^q\(6 downto 0),
      \gic0.gc0.count_d2_reg[6]_0\(6 downto 0) => \^gic0.gc0.count_d2_reg[6]\(6 downto 0),
      wr_clk => wr_clk,
      wr_rst => wr_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_fifo_generator_ramfifo is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    overflow : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_en : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_fifo_generator_ramfifo : entity is "fifo_generator_ramfifo";
end ska_tx_packet_ctrl_fifo_fifo_generator_ramfifo;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_fifo_generator_ramfifo is
  signal \gntv_or_sync_fifo.gcx.clkx_n_0\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_1\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_2\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_3\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_4\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_5\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_6\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gcx.clkx_n_7\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_1\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_11\ : STD_LOGIC;
  signal \gntv_or_sync_fifo.gl0.wr_n_19\ : STD_LOGIC;
  signal p_0_out_0 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_13_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_14_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_24_out : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_6_out : STD_LOGIC;
  signal ram_rd_en_i : STD_LOGIC;
  signal rst_full_ff_i : STD_LOGIC;
  signal rst_full_gen_i : STD_LOGIC;
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 6 downto 0 );
begin
\gntv_or_sync_fifo.gcx.clkx\: entity work.ska_tx_packet_ctrl_fifo_clk_x_pntrs
     port map (
      Q(6 downto 0) => p_14_out(6 downto 0),
      S(3) => \gntv_or_sync_fifo.gcx.clkx_n_0\,
      S(2) => \gntv_or_sync_fifo.gcx.clkx_n_1\,
      S(1) => \gntv_or_sync_fifo.gcx.clkx_n_2\,
      S(0) => \gntv_or_sync_fifo.gcx.clkx_n_3\,
      WR_PNTR_RD(6 downto 0) => p_24_out(6 downto 0),
      \dest_out_bin_ff_reg[6]\(2) => \gntv_or_sync_fifo.gcx.clkx_n_4\,
      \dest_out_bin_ff_reg[6]\(1) => \gntv_or_sync_fifo.gcx.clkx_n_5\,
      \dest_out_bin_ff_reg[6]\(0) => \gntv_or_sync_fifo.gcx.clkx_n_6\,
      \out\ => \gntv_or_sync_fifo.gl0.wr_n_1\,
      ram_full_fb_i_reg => \gntv_or_sync_fifo.gcx.clkx_n_7\,
      ram_full_fb_i_reg_0 => rst_full_gen_i,
      ram_full_i_i_2_0(6 downto 0) => wr_pntr_plus2(6 downto 0),
      rd_clk => rd_clk,
      \src_gray_ff_reg[6]\(6 downto 0) => p_13_out(6 downto 0),
      \src_gray_ff_reg[6]_0\(6 downto 0) => p_0_out_0(6 downto 0),
      wr_clk => wr_clk,
      wr_en => wr_en
    );
\gntv_or_sync_fifo.gl0.rd\: entity work.ska_tx_packet_ctrl_fifo_rd_logic
     port map (
      E(0) => ram_rd_en_i,
      Q(6 downto 0) => p_0_out_0(6 downto 0),
      WR_PNTR_RD(6 downto 0) => p_24_out(6 downto 0),
      empty => empty,
      \gpregsm1.curr_fwft_state_reg[1]\(0) => p_6_out,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst => rd_rst
    );
\gntv_or_sync_fifo.gl0.wr\: entity work.ska_tx_packet_ctrl_fifo_wr_logic
     port map (
      Q(6 downto 0) => p_14_out(6 downto 0),
      S(3) => \gntv_or_sync_fifo.gcx.clkx_n_0\,
      S(2) => \gntv_or_sync_fifo.gcx.clkx_n_1\,
      S(1) => \gntv_or_sync_fifo.gcx.clkx_n_2\,
      S(0) => \gntv_or_sync_fifo.gcx.clkx_n_3\,
      full => full,
      \gdiff.diff_pntr_pad_reg[7]\(2) => \gntv_or_sync_fifo.gcx.clkx_n_4\,
      \gdiff.diff_pntr_pad_reg[7]\(1) => \gntv_or_sync_fifo.gcx.clkx_n_5\,
      \gdiff.diff_pntr_pad_reg[7]\(0) => \gntv_or_sync_fifo.gcx.clkx_n_6\,
      \gic0.gc0.count_d2_reg[6]\(6 downto 0) => p_13_out(6 downto 0),
      \gic0.gc0.count_reg[6]\(6 downto 0) => wr_pntr_plus2(6 downto 0),
      \gpf1.prog_full_i_reg\ => rst_full_gen_i,
      \out\ => \gntv_or_sync_fifo.gl0.wr_n_1\,
      overflow => overflow,
      prog_full => prog_full,
      ram_full_fb_i_reg => \gntv_or_sync_fifo.gl0.wr_n_11\,
      ram_full_fb_i_reg_0 => \gntv_or_sync_fifo.gl0.wr_n_19\,
      ram_full_fb_i_reg_1 => \gntv_or_sync_fifo.gcx.clkx_n_7\,
      ram_full_fb_i_reg_2 => rst_full_ff_i,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst => wr_rst
    );
\gntv_or_sync_fifo.mem\: entity work.ska_tx_packet_ctrl_fifo_memory
     port map (
      E(0) => ram_rd_en_i,
      Q(6 downto 0) => p_0_out_0(6 downto 0),
      din(63 downto 0) => din(63 downto 0),
      dout(63 downto 0) => dout(63 downto 0),
      \goreg_dm.dout_i_reg[63]_0\(0) => p_6_out,
      \gpr1.dout_i_reg[0]\ => \gntv_or_sync_fifo.gl0.wr_n_11\,
      \gpr1.dout_i_reg[0]_0\(5 downto 0) => p_13_out(5 downto 0),
      \gpr1.dout_i_reg[63]\ => \gntv_or_sync_fifo.gl0.wr_n_19\,
      rd_clk => rd_clk,
      rd_rst => rd_rst,
      wr_clk => wr_clk
    );
rstblk: entity work.ska_tx_packet_ctrl_fifo_reset_blk_ramfifo
     port map (
      \grstd1.grst_full.grst_f.rst_d3_reg_0\ => rst_full_gen_i,
      \out\ => rst_full_ff_i,
      wr_clk => wr_clk,
      wr_rst => wr_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_fifo_generator_top is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    overflow : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_en : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_fifo_generator_top : entity is "fifo_generator_top";
end ska_tx_packet_ctrl_fifo_fifo_generator_top;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_fifo_generator_top is
begin
\grf.rf\: entity work.ska_tx_packet_ctrl_fifo_fifo_generator_ramfifo
     port map (
      din(63 downto 0) => din(63 downto 0),
      dout(63 downto 0) => dout(63 downto 0),
      empty => empty,
      full => full,
      overflow => overflow,
      prog_full => prog_full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst => rd_rst,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst => wr_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4_synth is
  port (
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    overflow : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_en : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4_synth : entity is "fifo_generator_v13_2_4_synth";
end ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4_synth;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4_synth is
begin
\gconvfifo.rf\: entity work.ska_tx_packet_ctrl_fifo_fifo_generator_top
     port map (
      din(63 downto 0) => din(63 downto 0),
      dout(63 downto 0) => dout(63 downto 0),
      empty => empty,
      full => full,
      overflow => overflow,
      prog_full => prog_full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst => rd_rst,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst => wr_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 6 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 7;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 64;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "virtex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 127;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 126;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 7;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 128;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 7;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 7;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 128;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 7;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 : entity is "fifo_generator_v13_2_4";
end ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const1>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(3) <= \<const0>\;
  m_axis_tuser(2) <= \<const0>\;
  m_axis_tuser(1) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  prog_empty <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  s_axis_tready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  valid <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4_synth
     port map (
      din(63 downto 0) => din(63 downto 0),
      dout(63 downto 0) => dout(63 downto 0),
      empty => empty,
      full => full,
      overflow => overflow,
      prog_full => prog_full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_rst => rd_rst,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst => wr_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ska_tx_packet_ctrl_fifo is
  port (
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    full : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_full : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ska_tx_packet_ctrl_fifo : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ska_tx_packet_ctrl_fifo : entity is "ska_tx_packet_ctrl_fifo,fifo_generator_v13_2_4,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of ska_tx_packet_ctrl_fifo : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of ska_tx_packet_ctrl_fifo : entity is "fifo_generator_v13_2_4,Vivado 2019.1.1";
end ska_tx_packet_ctrl_fifo;

architecture STRUCTURE of ska_tx_packet_ctrl_fifo is
  signal NLW_U0_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_U0_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of U0 : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of U0 : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of U0 : label is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of U0 : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of U0 : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of U0 : label is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of U0 : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of U0 : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of U0 : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of U0 : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of U0 : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of U0 : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of U0 : label is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 7;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 64;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of U0 : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of U0 : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of U0 : label is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of U0 : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of U0 : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of U0 : label is 64;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of U0 : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of U0 : label is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of U0 : label is 1;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of U0 : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of U0 : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of U0 : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of U0 : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of U0 : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of U0 : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of U0 : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of U0 : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of U0 : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of U0 : label is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of U0 : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of U0 : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of U0 : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of U0 : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of U0 : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of U0 : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of U0 : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of U0 : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of U0 : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of U0 : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of U0 : label is 1;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of U0 : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of U0 : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of U0 : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of U0 : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of U0 : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of U0 : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of U0 : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of U0 : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of U0 : label is 2;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of U0 : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of U0 : label is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of U0 : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of U0 : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of U0 : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of U0 : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of U0 : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of U0 : label is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of U0 : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of U0 : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of U0 : label is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of U0 : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of U0 : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 127;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 126;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of U0 : label is 1;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of U0 : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of U0 : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of U0 : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 7;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 128;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 7;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of U0 : label is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of U0 : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of U0 : label is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of U0 : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of U0 : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of U0 : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of U0 : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of U0 : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of U0 : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of U0 : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of U0 : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of U0 : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of U0 : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of U0 : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of U0 : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of U0 : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of U0 : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of U0 : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of U0 : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of U0 : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of U0 : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of U0 : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of U0 : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 7;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 128;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of U0 : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of U0 : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of U0 : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of U0 : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of U0 : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 7;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of U0 : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of U0 : label is 1;
  attribute x_interface_info : string;
  attribute x_interface_info of empty : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY";
  attribute x_interface_info of full : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL";
  attribute x_interface_info of rd_clk : signal is "xilinx.com:signal:clock:1.0 read_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of rd_clk : signal is "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of rd_en : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN";
  attribute x_interface_info of wr_clk : signal is "xilinx.com:signal:clock:1.0 write_clk CLK";
  attribute x_interface_parameter of wr_clk : signal is "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of wr_en : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN";
  attribute x_interface_info of din : signal is "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA";
  attribute x_interface_info of dout : signal is "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA";
begin
U0: entity work.ska_tx_packet_ctrl_fifo_fifo_generator_v13_2_4
     port map (
      almost_empty => NLW_U0_almost_empty_UNCONNECTED,
      almost_full => NLW_U0_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_U0_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_U0_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_U0_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_U0_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_U0_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_U0_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_U0_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_U0_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_U0_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_U0_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_U0_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_U0_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_U0_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_U0_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_U0_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_U0_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_U0_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_U0_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_U0_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_U0_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_U0_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_U0_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_U0_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_U0_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_U0_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_U0_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_U0_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_U0_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_U0_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_U0_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_U0_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_U0_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_U0_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_U0_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_U0_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_U0_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_U0_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_U0_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_U0_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_U0_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_U0_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_U0_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_U0_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_U0_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_U0_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_U0_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_U0_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_U0_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_U0_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_U0_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_U0_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_U0_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_U0_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_U0_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => '0',
      data_count(6 downto 0) => NLW_U0_data_count_UNCONNECTED(6 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(63 downto 0) => din(63 downto 0),
      dout(63 downto 0) => dout(63 downto 0),
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_U0_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_U0_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_U0_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_U0_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_U0_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_U0_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_U0_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_U0_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_U0_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_U0_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_U0_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_U0_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_U0_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_U0_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_U0_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_U0_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_U0_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_U0_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_U0_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_U0_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_U0_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_U0_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_U0_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_U0_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_U0_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_U0_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_U0_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_U0_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_U0_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_U0_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_U0_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_U0_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => NLW_U0_m_axis_tdata_UNCONNECTED(7 downto 0),
      m_axis_tdest(0) => NLW_U0_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_U0_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => NLW_U0_m_axis_tkeep_UNCONNECTED(0),
      m_axis_tlast => NLW_U0_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(0) => NLW_U0_m_axis_tstrb_UNCONNECTED(0),
      m_axis_tuser(3 downto 0) => NLW_U0_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_U0_m_axis_tvalid_UNCONNECTED,
      overflow => overflow,
      prog_empty => NLW_U0_prog_empty_UNCONNECTED,
      prog_empty_thresh(6 downto 0) => B"0000000",
      prog_empty_thresh_assert(6 downto 0) => B"0000000",
      prog_empty_thresh_negate(6 downto 0) => B"0000000",
      prog_full => prog_full,
      prog_full_thresh(6 downto 0) => B"0000000",
      prog_full_thresh_assert(6 downto 0) => B"0000000",
      prog_full_thresh_negate(6 downto 0) => B"0000000",
      rd_clk => rd_clk,
      rd_data_count(6 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(6 downto 0),
      rd_en => rd_en,
      rd_rst => rd_rst,
      rd_rst_busy => NLW_U0_rd_rst_busy_UNCONNECTED,
      rst => '0',
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(0) => '0',
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(0) => '0',
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_U0_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_U0_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7 downto 0) => B"00000000",
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => '0',
      s_axis_tlast => '0',
      s_axis_tready => NLW_U0_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(0) => '0',
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_U0_underflow_UNCONNECTED,
      valid => NLW_U0_valid_UNCONNECTED,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(6 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(6 downto 0),
      wr_en => wr_en,
      wr_rst => wr_rst,
      wr_rst_busy => NLW_U0_wr_rst_busy_UNCONNECTED
    );
end STRUCTURE;
