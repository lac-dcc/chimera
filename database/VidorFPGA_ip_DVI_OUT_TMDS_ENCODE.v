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

module TMDS_ENCODE
(
  input            iCLK,
  input      [1:0] iCTL,
  input            iBLANK,
  input      [7:0] iDATA,
  output reg [9:0] oDATA
);

wire [8:0] wXORED_DATA;
wire [8:0] wXNORED_DATA;
reg  [8:0] rDATA_WORD;
wire [3:0] wONE_COUNT;
wire [3:0] wZERO_COUNT;
reg  [3:0] rD9_ONE_COUNT,rD9_ZERO_COUNT;
reg  [4:0] rBIAS;
reg  [1:0] rCTL;
reg        rBLANK;

assign  wXORED_DATA  = {1'b1,(iDATA ^ {wXORED_DATA[6:0],1'b0})};
assign  wXNORED_DATA = {1'b0,(iDATA ^~ {wXNORED_DATA[6:0],1'b0})};
assign  wONE_COUNT  = {3'b0,iDATA[0]}+
                      {3'b0,iDATA[1]}+
                      {3'b0,iDATA[2]}+
                      {3'b0,iDATA[3]}+
                      {3'b0,iDATA[4]}+
                      {3'b0,iDATA[5]}+
                      {3'b0,iDATA[6]}+
                      {3'b0,iDATA[7]};


always @(posedge iCLK)
begin
  // first pipe stage
  rCTL <= iCTL;
  rBLANK <= iBLANK;
  
  if ((wONE_COUNT>4) || ((wONE_COUNT==4) && (iDATA[0]==0)))
  begin
    rDATA_WORD <= wXNORED_DATA;
    rD9_ONE_COUNT <= 
                 {3'b0,wXNORED_DATA[0]}+
                 {3'b0,wXNORED_DATA[1]}+
                 {3'b0,wXNORED_DATA[2]}+
                 {3'b0,wXNORED_DATA[3]}+
                 {3'b0,wXNORED_DATA[4]}+
                 {3'b0,wXNORED_DATA[5]}+
                 {3'b0,wXNORED_DATA[6]}+
                 {3'b0,wXNORED_DATA[7]};
    rD9_ZERO_COUNT <= 8-
                 {3'b0,wXNORED_DATA[0]}-
                 {3'b0,wXNORED_DATA[1]}-
                 {3'b0,wXNORED_DATA[2]}-
                 {3'b0,wXNORED_DATA[3]}-
                 {3'b0,wXNORED_DATA[4]}-
                 {3'b0,wXNORED_DATA[5]}-
                 {3'b0,wXNORED_DATA[6]}-
                 {3'b0,wXNORED_DATA[7]};

  end else begin
    rDATA_WORD <= wXORED_DATA;
    rD9_ONE_COUNT <= 
                 {3'b0,wXORED_DATA[0]}+
                 {3'b0,wXORED_DATA[1]}+
                 {3'b0,wXORED_DATA[2]}+
                 {3'b0,wXORED_DATA[3]}+
                 {3'b0,wXORED_DATA[4]}+
                 {3'b0,wXORED_DATA[5]}+
                 {3'b0,wXORED_DATA[6]}+
                 {3'b0,wXORED_DATA[7]};
    rD9_ZERO_COUNT <= 8-
                 {3'b0,wXORED_DATA[0]}-
                 {3'b0,wXORED_DATA[1]}-
                 {3'b0,wXORED_DATA[2]}-
                 {3'b0,wXORED_DATA[3]}-
                 {3'b0,wXORED_DATA[4]}-
                 {3'b0,wXORED_DATA[5]}-
                 {3'b0,wXORED_DATA[6]}-
                 {3'b0,wXORED_DATA[7]};
  end
  // second pipe stage
  if (rBLANK)
  begin
    case (rCTL)
      0: oDATA <= 10'b1101010100;
      1: oDATA <= 10'b0010101011;
      2: oDATA <= 10'b0101010100;
      3: oDATA <= 10'b1010101011;
    endcase
    rBIAS <=5'd0;
  end else begin
    if ((rBIAS==0) || (rD9_ONE_COUNT==rD9_ZERO_COUNT))
    begin
      if (rDATA_WORD[8]) begin
        oDATA<= {2'b01,rDATA_WORD[7:0]};
        rBIAS<=rBIAS+rD9_ONE_COUNT-rD9_ZERO_COUNT;
      end else begin
        oDATA<= {2'b10,~rDATA_WORD[7:0]};
        rBIAS<=rBIAS-rD9_ONE_COUNT+rD9_ZERO_COUNT;
      end
    end else if (!rBIAS[4] && (rD9_ONE_COUNT>rD9_ZERO_COUNT) || 
                  rBIAS[4] && (rD9_ONE_COUNT<rD9_ZERO_COUNT)  ) begin
      oDATA<= {1'b1,rDATA_WORD[8],~rDATA_WORD[7:0]};
      rBIAS<=rBIAS+{rDATA_WORD[8],1'b0}+rD9_ZERO_COUNT-rD9_ONE_COUNT;
    end else begin
      oDATA<= {1'b0,rDATA_WORD};
      rBIAS<=rBIAS-{~rDATA_WORD[8], 1'b0}+rD9_ONE_COUNT-rD9_ZERO_COUNT;
    end
  end
  
end

endmodule