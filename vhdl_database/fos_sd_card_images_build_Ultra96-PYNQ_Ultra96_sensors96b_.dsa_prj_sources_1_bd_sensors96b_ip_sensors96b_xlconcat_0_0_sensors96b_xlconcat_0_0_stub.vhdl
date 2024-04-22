-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Thu Jun  6 17:09:05 2019
-- Host        : joe-ubu-vm running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/joe/Ultra96-PYNQ/Ultra96/sensors96b/sensors96b/sensors96b.srcs/sources_1/bd/sensors96b/ip/sensors96b_xlconcat_0_0/sensors96b_xlconcat_0_0_stub.vhdl
-- Design      : sensors96b_xlconcat_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sensors96b_xlconcat_0_0 is
  Port ( 
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end sensors96b_xlconcat_0_0;

architecture stub of sensors96b_xlconcat_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "In0[0:0],dout[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlconcat_v2_1_1_xlconcat,Vivado 2018.2";
begin
end;
