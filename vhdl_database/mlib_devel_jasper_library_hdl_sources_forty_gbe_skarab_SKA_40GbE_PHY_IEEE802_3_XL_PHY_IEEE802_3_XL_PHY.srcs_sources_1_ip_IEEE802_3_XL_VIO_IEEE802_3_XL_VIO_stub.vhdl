-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.1 (lin64) Build 2580384 Sat Jun 29 08:04:45 MDT 2019
-- Date        : Mon Jul 15 17:23:36 2019
-- Host        : casper1 running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/hpw1/work/tutorials_devel/vivado_2018/skarab/tut_intro/skarab_tut_intro/myproj/myproj.srcs/sources_1/ip/IEEE802_3_XL_VIO/IEEE802_3_XL_VIO_stub.vhdl
-- Design      : IEEE802_3_XL_VIO
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IEEE802_3_XL_VIO is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in8 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in9 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in10 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in11 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in12 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in13 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in14 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in15 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end IEEE802_3_XL_VIO;

architecture stub of IEEE802_3_XL_VIO is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[3:0],probe_in1[3:0],probe_in2[3:0],probe_in3[3:0],probe_in4[0:0],probe_in5[15:0],probe_in6[31:0],probe_in7[31:0],probe_in8[31:0],probe_in9[31:0],probe_in10[3:0],probe_in11[3:0],probe_in12[3:0],probe_in13[3:0],probe_in14[31:0],probe_in15[31:0],probe_out0[0:0],probe_out1[0:0],probe_out2[0:0],probe_out3[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2019.1.1";
begin
end;
