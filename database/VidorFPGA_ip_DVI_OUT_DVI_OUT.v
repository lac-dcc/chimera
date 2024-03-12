/*
* Copyright 2018 ARDUINO SA (http://www.arduino.cc/)
* This file is part of Vidor IP.
* Copyright (c) 2018
* Authors: Dario Pennisi
*
* This software is released under:
* The GNU General Public License, which covers the main part of 
* Vidor IP
* The terms of this license can be found at:
* https://www.gnu.org/licenses/gpl-3.0.en.html
*
* You can be released from the requirements of the above licenses by purchasing
* a commercial license. Buying such a license is mandatory if you want to modify or
* otherwise use the software for commercial activities involving the Arduino
* software without disclosing the source code of your own applications. To purchase
* a commercial license, send an email to license@arduino.cc.
*
*/

module DVI_OUT
(
  input        iPCLK,
  input        iSCLK,

  input  [7:0] iRED,
  input  [7:0] iGRN,
  input  [7:0] iBLU,
  input        iHS,
  input        iVS,
  input        iDE,

  output [2:0] oDVI_DATA /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */,
  output       oDVI_CLK  /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */
);

wire [9:0] wTMDS_RED,wTMDS_GRN,wTMDS_BLU;
reg  [9:0] rSH_RED,rSH_GRN,rSH_BLU,rSH_CLK;

TMDS_ENCODE blu_inst
(
  .iCLK(iPCLK),
  .iCTL({iVS,iHS}),
  .iBLANK(!iDE),
  .iDATA(iBLU),
  .oDATA(wTMDS_BLU)
);

TMDS_ENCODE grn_inst
(
  .iCLK(iPCLK),
  .iCTL({iVS,iHS}),
  .iBLANK(!iDE),
  .iDATA(iGRN),
  .oDATA(wTMDS_GRN)
);

TMDS_ENCODE red_inst
(
  .iCLK(iPCLK),
  .iCTL({iVS,iHS}),
  .iBLANK(!iDE),
  .iDATA(iRED),
  .oDATA(wTMDS_RED)
);

initial rSH_CLK <= 10'b0000011111;

always @(posedge iSCLK)
begin
  if (rSH_CLK==10'b0000011111)
  begin
    rSH_RED<= wTMDS_RED;
    rSH_GRN<= wTMDS_GRN;
    rSH_BLU<= wTMDS_BLU;
  end
  else begin
    rSH_RED<= {2'b0,rSH_RED[9:2]};
    rSH_GRN<= {2'b0,rSH_GRN[9:2]};
    rSH_BLU<= {2'b0,rSH_BLU[9:2]};
  end
  rSH_CLK <= {rSH_CLK[1:0],rSH_CLK[9:2]};
end

  altddio_out ddio_inst (
        .dataout ({oDVI_CLK,oDVI_DATA}),
        .outclock (iSCLK),
        .datain_h ({rSH_CLK[0],rSH_RED[0],rSH_GRN[0],rSH_BLU[0]}),
        .datain_l ({rSH_CLK[1],rSH_RED[1],rSH_GRN[1],rSH_BLU[1]}),
        .aclr (1'b0),
        .aset (1'b0),
        .outclocken (1'b1),
        .sclr (1'b0),
        .sset (1'b0));
  defparam
    ddio_inst.intended_device_family = "Cyclone 10 LP",
    ddio_inst.invert_input_clocks = "OFF",
    ddio_inst.lpm_hint = "UNUSED",
    ddio_inst.lpm_type = "altddio_out",
    ddio_inst.power_up_high = "OFF",
    ddio_inst.width = 4;

endmodule