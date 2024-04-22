-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sat Jun  2 02:54:14 2018
-- Host        : hp-laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_MinerCoprocessor_0_0_stub.vhdl
-- Design      : design_1_MinerCoprocessor_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    readEnable : out STD_LOGIC;
    validData : out STD_LOGIC;
    allWordsSent : out STD_LOGIC;
    counterSlave : out STD_LOGIC_VECTOR ( 3 downto 0 );
    counterMaster : out STD_LOGIC_VECTOR ( 3 downto 0 );
    hashOut : out STD_LOGIC_VECTOR ( 255 downto 0 );
    tempHash : out STD_LOGIC_VECTOR ( 255 downto 0 );
    nonce : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mEnable : out STD_LOGIC;
    update : out STD_LOGIC;
    hashInputWord : out STD_LOGIC_VECTOR ( 287 downto 0 );
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "readEnable,validData,allWordsSent,counterSlave[3:0],counterMaster[3:0],hashOut[255:0],tempHash[255:0],nonce[31:0],mEnable,update,hashInputWord[287:0],m00_axis_tdata[31:0],m00_axis_tstrb[3:0],m00_axis_tlast,m00_axis_tvalid,m00_axis_tready,m00_axis_aclk,m00_axis_aresetn,s00_axis_tdata[31:0],s00_axis_tstrb[3:0],s00_axis_tlast,s00_axis_tvalid,s00_axis_tready,s00_axis_aclk,s00_axis_aresetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "MinerCoprocessor_v1_0,Vivado 2017.4";
begin
end;
