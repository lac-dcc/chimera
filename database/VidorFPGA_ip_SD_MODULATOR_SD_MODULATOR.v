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

module SD_MODULATOR #(
  parameter pBITS=24,
  parameter pINTERP_BITS =5
) 
(
  input             iCLK,
  input [pBITS-1:0] iDATA,
  output reg        oSTROBE,
  output            oDAC
);

reg [pBITS-1:0]              rDATA,
                             rDDATA;
reg [pBITS+pINTERP_BITS-1:0] rINT_DATA;
reg [pINTERP_BITS-1:0]       rCNT;
reg [pBITS:0]                rACC;

assign oDAC = rACC[pBITS];

always @(posedge iCLK)
begin

  rCNT<=rCNT+1;
  oSTROBE<=0;
  // perform linear interpolation between samples
  if (rCNT==0) begin
    oSTROBE<=1;
    rDATA  <= iDATA;
    rDDATA <= rDATA;
    rINT_DATA<={rDATA,{pINTERP_BITS{1'b0}} };
  end else begin
    rINT_DATA<=rINT_DATA+{{pINTERP_BITS{1'b0}},rDATA}-{{pINTERP_BITS{1'b0}},rDDATA};
  end

  rACC <= {1'b0,rACC[pBITS-1:0]}+rINT_DATA[pBITS+pINTERP_BITS-1:pINTERP_BITS];

end

endmodule
