`default_nettype none
module tlbConverter(

//  input wire[70:0] tlbEntries[0:15],

  input wire[85:0] tlbEntry0,
  input wire[85:0] tlbEntry1,
  input wire[85:0] tlbEntry2,
  input wire[85:0] tlbEntry3,
  input wire[85:0] tlbEntry4,
  input wire[85:0] tlbEntry5,
  input wire[85:0] tlbEntry6,
  input wire[85:0] tlbEntry7,
  input wire[85:0] tlbEntry8,
  input wire[85:0] tlbEntry9,
  input wire[85:0] tlbEntry10,
  input wire[85:0] tlbEntry11,
  input wire[85:0] tlbEntry12,
  input wire[85:0] tlbEntry13,
  input wire[85:0] tlbEntry14,
  input wire[85:0] tlbEntry15,

  output wire[31:0] phyAddr,
  input wire[31:0] virtAddr,
  output wire miss,
  input wire[7:0] nowASID,
  output wire valid,
  output reg[3:0] matchWhich,
  output wire dirt,
  output wire bypassCache
);

wire[15:0] matched;
wire[85:0] tlbEntries[0:15];

wire[23:0] PFN;


assign tlbEntries[0]=tlbEntry0;
assign tlbEntries[1]=tlbEntry1;
assign tlbEntries[2]=tlbEntry2;
assign tlbEntries[3]=tlbEntry3;
assign tlbEntries[4]=tlbEntry4;
assign tlbEntries[5]=tlbEntry5;
assign tlbEntries[6]=tlbEntry6;
assign tlbEntries[7]=tlbEntry7;
assign tlbEntries[8]=tlbEntry8;
assign tlbEntries[9]=tlbEntry9;
assign tlbEntries[10]=tlbEntry10;
assign tlbEntries[11]=tlbEntry11;
assign tlbEntries[12]=tlbEntry12;
assign tlbEntries[13]=tlbEntry13;
assign tlbEntries[14]=tlbEntry14;
assign tlbEntries[15]=tlbEntry15;


wire[2:0] cacheFlag;

assign PFN[23:0] = virtAddr[12] ? tlbEntries[matchWhich][51:28] : tlbEntries[matchWhich][25:2];
assign dirt = virtAddr[12] ? tlbEntries[matchWhich][27] : tlbEntries[matchWhich][1];
assign valid = virtAddr[12] ? tlbEntries[matchWhich][26] : tlbEntries[matchWhich][0];
assign cacheFlag = virtAddr[12] ? tlbEntries[matchWhich][82:80] : tlbEntries[matchWhich][85:83];

assign bypassCache = (cacheFlag == 2);

assign miss = matched == 16'd0;

assign phyAddr[11:0] = virtAddr[11:0];
assign phyAddr[31:12] = PFN[19:0];

//generate begin
//  genvar i;
//  for(i = 0; i < 16 ; i=i+1) begin
//    assign matched[i] = tlbEntries[i][70:52] == virtAddr[31:13] &&
//                                      ^ Vpn2
//     (tlbEntries[i][79:72] == nowASID || tlbEntries[i][71]);
//                    ^ASID                               ^G
//  end
//end
//endgenerate

//generated

assign matched[0] = tlbEntries[0][70:52] == virtAddr[31:13] &&
 (tlbEntries[0][79:72] == nowASID || tlbEntries[0][71]);
assign matched[1] = tlbEntries[1][70:52] == virtAddr[31:13] &&
 (tlbEntries[1][79:72] == nowASID || tlbEntries[1][71]);
assign matched[2] = tlbEntries[2][70:52] == virtAddr[31:13] &&
 (tlbEntries[2][79:72] == nowASID || tlbEntries[2][71]);
assign matched[3] = tlbEntries[3][70:52] == virtAddr[31:13] &&
 (tlbEntries[3][79:72] == nowASID || tlbEntries[3][71]);
assign matched[4] = tlbEntries[4][70:52] == virtAddr[31:13] &&
 (tlbEntries[4][79:72] == nowASID || tlbEntries[4][71]);
assign matched[5] = tlbEntries[5][70:52] == virtAddr[31:13] &&
 (tlbEntries[5][79:72] == nowASID || tlbEntries[5][71]);
assign matched[6] = tlbEntries[6][70:52] == virtAddr[31:13] &&
 (tlbEntries[6][79:72] == nowASID || tlbEntries[6][71]);
assign matched[7] = tlbEntries[7][70:52] == virtAddr[31:13] &&
 (tlbEntries[7][79:72] == nowASID || tlbEntries[7][71]);
assign matched[8] = tlbEntries[8][70:52] == virtAddr[31:13] &&
 (tlbEntries[8][79:72] == nowASID || tlbEntries[8][71]);
assign matched[9] = tlbEntries[9][70:52] == virtAddr[31:13] &&
 (tlbEntries[9][79:72] == nowASID || tlbEntries[9][71]);
assign matched[10] = tlbEntries[10][70:52] == virtAddr[31:13] &&
 (tlbEntries[10][79:72] == nowASID || tlbEntries[10][71]);
assign matched[11] = tlbEntries[11][70:52] == virtAddr[31:13] &&
 (tlbEntries[11][79:72] == nowASID || tlbEntries[11][71]);
assign matched[12] = tlbEntries[12][70:52] == virtAddr[31:13] &&
 (tlbEntries[12][79:72] == nowASID || tlbEntries[12][71]);
assign matched[13] = tlbEntries[13][70:52] == virtAddr[31:13] &&
 (tlbEntries[13][79:72] == nowASID || tlbEntries[13][71]);
assign matched[14] = tlbEntries[14][70:52] == virtAddr[31:13] &&
 (tlbEntries[14][79:72] == nowASID || tlbEntries[14][71]);
assign matched[15] = tlbEntries[15][70:52] == virtAddr[31:13] &&
 (tlbEntries[15][79:72] == nowASID || tlbEntries[15][71]);

//endgenerated

always @(*) begin
  if(matched[0]) begin
    matchWhich <= 4'd0;
  end else if(matched[1]) begin
    matchWhich <= 4'd1;
  end else if(matched[2]) begin
    matchWhich <= 4'd2;
  end else if(matched[3]) begin
    matchWhich <= 4'd3;
  end else if(matched[4]) begin
    matchWhich <= 4'd4;
  end else if(matched[5]) begin
    matchWhich <= 4'd5;
  end else if(matched[6]) begin
    matchWhich <= 4'd6;
  end else if(matched[7]) begin
    matchWhich <= 4'd7;
  end else if(matched[8]) begin
    matchWhich <= 4'd8;
  end else if(matched[9]) begin
    matchWhich <= 4'd9;
  end else if(matched[10]) begin
    matchWhich <= 4'd10;
  end else if(matched[11]) begin
    matchWhich <= 4'd11;
  end else if(matched[12]) begin
    matchWhich <= 4'd12;
  end else if(matched[13]) begin
    matchWhich <= 4'd13;
  end else if(matched[14]) begin
    matchWhich <= 4'd14;
  end else if(matched[15]) begin
    matchWhich <= 4'd15;
  end else begin
    matchWhich <= 4'd0;
  end
end
endmodule
