// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_RT_cmac_a2cacc.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CMAC.h
module NV_NVDLA_RT_cmac_a2cacc (
   nvdla_core_clk
  ,nvdla_core_rstn
  ,mac2accu_src_pvld
  ,mac2accu_src_mask
  ,mac2accu_src_mode
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: ,mac2accu_src_data${i} )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,mac2accu_src_data0 
,mac2accu_src_data1 
,mac2accu_src_data2 
,mac2accu_src_data3 
,mac2accu_src_data4 
,mac2accu_src_data5 
,mac2accu_src_data6 
,mac2accu_src_data7 
,mac2accu_src_data8 
,mac2accu_src_data9 
,mac2accu_src_data10 
,mac2accu_src_data11 
,mac2accu_src_data12 
,mac2accu_src_data13 
,mac2accu_src_data14 
,mac2accu_src_data15 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,mac2accu_src_pd
  ,mac2accu_dst_pvld
  ,mac2accu_dst_mask
  ,mac2accu_dst_mode
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: ,mac2accu_dst_data${i} )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,mac2accu_dst_data0 
,mac2accu_dst_data1 
,mac2accu_dst_data2 
,mac2accu_dst_data3 
,mac2accu_dst_data4 
,mac2accu_dst_data5 
,mac2accu_dst_data6 
,mac2accu_dst_data7 
,mac2accu_dst_data8 
,mac2accu_dst_data9 
,mac2accu_dst_data10 
,mac2accu_dst_data11 
,mac2accu_dst_data12 
,mac2accu_dst_data13 
,mac2accu_dst_data14 
,mac2accu_dst_data15 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,mac2accu_dst_pd
  );
input nvdla_core_clk;
input nvdla_core_rstn;
input mac2accu_src_pvld; /* data valid */
input [32/2 -1:0] mac2accu_src_mask;
input mac2accu_src_mode;
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: input [22 -1:0] mac2accu_src_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

input [22 -1:0] mac2accu_src_data0; 
input [22 -1:0] mac2accu_src_data1; 
input [22 -1:0] mac2accu_src_data2; 
input [22 -1:0] mac2accu_src_data3; 
input [22 -1:0] mac2accu_src_data4; 
input [22 -1:0] mac2accu_src_data5; 
input [22 -1:0] mac2accu_src_data6; 
input [22 -1:0] mac2accu_src_data7; 
input [22 -1:0] mac2accu_src_data8; 
input [22 -1:0] mac2accu_src_data9; 
input [22 -1:0] mac2accu_src_data10; 
input [22 -1:0] mac2accu_src_data11; 
input [22 -1:0] mac2accu_src_data12; 
input [22 -1:0] mac2accu_src_data13; 
input [22 -1:0] mac2accu_src_data14; 
input [22 -1:0] mac2accu_src_data15; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
input [8:0] mac2accu_src_pd;
output mac2accu_dst_pvld; /* data valid */
output [32/2 -1:0] mac2accu_dst_mask;
output mac2accu_dst_mode;
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: output [22 -1:0] mac2accu_dst_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

output [22 -1:0] mac2accu_dst_data0; 
output [22 -1:0] mac2accu_dst_data1; 
output [22 -1:0] mac2accu_dst_data2; 
output [22 -1:0] mac2accu_dst_data3; 
output [22 -1:0] mac2accu_dst_data4; 
output [22 -1:0] mac2accu_dst_data5; 
output [22 -1:0] mac2accu_dst_data6; 
output [22 -1:0] mac2accu_dst_data7; 
output [22 -1:0] mac2accu_dst_data8; 
output [22 -1:0] mac2accu_dst_data9; 
output [22 -1:0] mac2accu_dst_data10; 
output [22 -1:0] mac2accu_dst_data11; 
output [22 -1:0] mac2accu_dst_data12; 
output [22 -1:0] mac2accu_dst_data13; 
output [22 -1:0] mac2accu_dst_data14; 
output [22 -1:0] mac2accu_dst_data15; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
output [8:0] mac2accu_dst_pd;
wire mac2accu_pvld_d0 = mac2accu_src_pvld;
wire [8:0] mac2accu_pd_d0 = mac2accu_src_pd;
wire [32/2 -1:0] mac2accu_mask_d0 = mac2accu_src_mask;
wire mac2accu_mode_d0 = mac2accu_src_mode;
//: my $delay = 2;
//: my $i;
//: my $j;
//: my $k;
//: my $kk=32/2;
//: my $jj=22;
//: for($k = 0; $k <32/2; $k ++) {
//: print "assign mac2accu_data${k}_d0 = mac2accu_src_data${k};\n";
//: }
//:
//: for($i = 0; $i < $delay; $i ++) {
//: $j = $i + 1;
//: &eperl::flop("-q mac2accu_pvld_d${j} -d mac2accu_pvld_d${i}");
//: &eperl::flop("-wid 9 -q mac2accu_pd_d${j} -en mac2accu_pvld_d${i} -d  mac2accu_pd_d${i}");
//: &eperl::flop("-q mac2accu_mode_d${j} -en mac2accu_pvld_d${i} -d  mac2accu_mode_d${i}");
//: &eperl::flop("-wid ${kk} -q mac2accu_mask_d${j} -d mac2accu_mask_d${i}");
//: for($k = 0; $k < 32/2; $k ++) {
//: &eperl::flop("-wid ${jj} -q mac2accu_data${k}_d${j} -en mac2accu_mask_d${i}[${k}] -d  mac2accu_data${k}_d${i}");
//: }
//: }
//:
//: $i = $delay;
//: print "assign mac2accu_dst_pvld = mac2accu_pvld_d${i};\n";
//: print "assign mac2accu_dst_pd = mac2accu_pd_d${i};\n";
//: print "assign mac2accu_dst_mask = mac2accu_mask_d${i};\n";
//: print "assign mac2accu_dst_mode = mac2accu_mode_d${i};\n";
//: for($k = 0; $k <32/2; $k ++) {
//: print "assign mac2accu_dst_data${k} = mac2accu_data${k}_d${i};\n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
assign mac2accu_data0_d0 = mac2accu_src_data0;
assign mac2accu_data1_d0 = mac2accu_src_data1;
assign mac2accu_data2_d0 = mac2accu_src_data2;
assign mac2accu_data3_d0 = mac2accu_src_data3;
assign mac2accu_data4_d0 = mac2accu_src_data4;
assign mac2accu_data5_d0 = mac2accu_src_data5;
assign mac2accu_data6_d0 = mac2accu_src_data6;
assign mac2accu_data7_d0 = mac2accu_src_data7;
assign mac2accu_data8_d0 = mac2accu_src_data8;
assign mac2accu_data9_d0 = mac2accu_src_data9;
assign mac2accu_data10_d0 = mac2accu_src_data10;
assign mac2accu_data11_d0 = mac2accu_src_data11;
assign mac2accu_data12_d0 = mac2accu_src_data12;
assign mac2accu_data13_d0 = mac2accu_src_data13;
assign mac2accu_data14_d0 = mac2accu_src_data14;
assign mac2accu_data15_d0 = mac2accu_src_data15;
reg  mac2accu_pvld_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pvld_d1 <= 'b0;
   end else begin
       mac2accu_pvld_d1 <= mac2accu_pvld_d0;
   end
end
reg [8:0] mac2accu_pd_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pd_d1 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d0) == 1'b1) begin
           mac2accu_pd_d1 <= mac2accu_pd_d0;
       // VCS coverage off
       end else if ((mac2accu_pvld_d0) == 1'b0) begin
       end else begin
           mac2accu_pd_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  mac2accu_mode_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mode_d1 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d0) == 1'b1) begin
           mac2accu_mode_d1 <= mac2accu_mode_d0;
       // VCS coverage off
       end else if ((mac2accu_pvld_d0) == 1'b0) begin
       end else begin
           mac2accu_mode_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [15:0] mac2accu_mask_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mask_d1 <= 'b0;
   end else begin
       mac2accu_mask_d1 <= mac2accu_mask_d0;
   end
end
reg [21:0] mac2accu_data0_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data0_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[0]) == 1'b1) begin
           mac2accu_data0_d1 <= mac2accu_data0_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[0]) == 1'b0) begin
       end else begin
           mac2accu_data0_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data1_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data1_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[1]) == 1'b1) begin
           mac2accu_data1_d1 <= mac2accu_data1_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[1]) == 1'b0) begin
       end else begin
           mac2accu_data1_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data2_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data2_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[2]) == 1'b1) begin
           mac2accu_data2_d1 <= mac2accu_data2_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[2]) == 1'b0) begin
       end else begin
           mac2accu_data2_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data3_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data3_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[3]) == 1'b1) begin
           mac2accu_data3_d1 <= mac2accu_data3_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[3]) == 1'b0) begin
       end else begin
           mac2accu_data3_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data4_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data4_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[4]) == 1'b1) begin
           mac2accu_data4_d1 <= mac2accu_data4_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[4]) == 1'b0) begin
       end else begin
           mac2accu_data4_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data5_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data5_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[5]) == 1'b1) begin
           mac2accu_data5_d1 <= mac2accu_data5_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[5]) == 1'b0) begin
       end else begin
           mac2accu_data5_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data6_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data6_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[6]) == 1'b1) begin
           mac2accu_data6_d1 <= mac2accu_data6_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[6]) == 1'b0) begin
       end else begin
           mac2accu_data6_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data7_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data7_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[7]) == 1'b1) begin
           mac2accu_data7_d1 <= mac2accu_data7_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[7]) == 1'b0) begin
       end else begin
           mac2accu_data7_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data8_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data8_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[8]) == 1'b1) begin
           mac2accu_data8_d1 <= mac2accu_data8_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[8]) == 1'b0) begin
       end else begin
           mac2accu_data8_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data9_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data9_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[9]) == 1'b1) begin
           mac2accu_data9_d1 <= mac2accu_data9_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[9]) == 1'b0) begin
       end else begin
           mac2accu_data9_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data10_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data10_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[10]) == 1'b1) begin
           mac2accu_data10_d1 <= mac2accu_data10_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[10]) == 1'b0) begin
       end else begin
           mac2accu_data10_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data11_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data11_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[11]) == 1'b1) begin
           mac2accu_data11_d1 <= mac2accu_data11_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[11]) == 1'b0) begin
       end else begin
           mac2accu_data11_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data12_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data12_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[12]) == 1'b1) begin
           mac2accu_data12_d1 <= mac2accu_data12_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[12]) == 1'b0) begin
       end else begin
           mac2accu_data12_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data13_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data13_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[13]) == 1'b1) begin
           mac2accu_data13_d1 <= mac2accu_data13_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[13]) == 1'b0) begin
       end else begin
           mac2accu_data13_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data14_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data14_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[14]) == 1'b1) begin
           mac2accu_data14_d1 <= mac2accu_data14_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[14]) == 1'b0) begin
       end else begin
           mac2accu_data14_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data15_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data15_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[15]) == 1'b1) begin
           mac2accu_data15_d1 <= mac2accu_data15_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[15]) == 1'b0) begin
       end else begin
           mac2accu_data15_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  mac2accu_pvld_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pvld_d2 <= 'b0;
   end else begin
       mac2accu_pvld_d2 <= mac2accu_pvld_d1;
   end
end
reg [8:0] mac2accu_pd_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pd_d2 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d1) == 1'b1) begin
           mac2accu_pd_d2 <= mac2accu_pd_d1;
       // VCS coverage off
       end else if ((mac2accu_pvld_d1) == 1'b0) begin
       end else begin
           mac2accu_pd_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  mac2accu_mode_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mode_d2 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d1) == 1'b1) begin
           mac2accu_mode_d2 <= mac2accu_mode_d1;
       // VCS coverage off
       end else if ((mac2accu_pvld_d1) == 1'b0) begin
       end else begin
           mac2accu_mode_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [15:0] mac2accu_mask_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mask_d2 <= 'b0;
   end else begin
       mac2accu_mask_d2 <= mac2accu_mask_d1;
   end
end
reg [21:0] mac2accu_data0_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data0_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[0]) == 1'b1) begin
           mac2accu_data0_d2 <= mac2accu_data0_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[0]) == 1'b0) begin
       end else begin
           mac2accu_data0_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data1_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data1_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[1]) == 1'b1) begin
           mac2accu_data1_d2 <= mac2accu_data1_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[1]) == 1'b0) begin
       end else begin
           mac2accu_data1_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data2_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data2_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[2]) == 1'b1) begin
           mac2accu_data2_d2 <= mac2accu_data2_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[2]) == 1'b0) begin
       end else begin
           mac2accu_data2_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data3_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data3_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[3]) == 1'b1) begin
           mac2accu_data3_d2 <= mac2accu_data3_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[3]) == 1'b0) begin
       end else begin
           mac2accu_data3_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data4_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data4_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[4]) == 1'b1) begin
           mac2accu_data4_d2 <= mac2accu_data4_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[4]) == 1'b0) begin
       end else begin
           mac2accu_data4_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data5_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data5_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[5]) == 1'b1) begin
           mac2accu_data5_d2 <= mac2accu_data5_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[5]) == 1'b0) begin
       end else begin
           mac2accu_data5_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data6_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data6_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[6]) == 1'b1) begin
           mac2accu_data6_d2 <= mac2accu_data6_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[6]) == 1'b0) begin
       end else begin
           mac2accu_data6_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data7_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data7_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[7]) == 1'b1) begin
           mac2accu_data7_d2 <= mac2accu_data7_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[7]) == 1'b0) begin
       end else begin
           mac2accu_data7_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data8_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data8_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[8]) == 1'b1) begin
           mac2accu_data8_d2 <= mac2accu_data8_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[8]) == 1'b0) begin
       end else begin
           mac2accu_data8_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data9_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data9_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[9]) == 1'b1) begin
           mac2accu_data9_d2 <= mac2accu_data9_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[9]) == 1'b0) begin
       end else begin
           mac2accu_data9_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data10_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data10_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[10]) == 1'b1) begin
           mac2accu_data10_d2 <= mac2accu_data10_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[10]) == 1'b0) begin
       end else begin
           mac2accu_data10_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data11_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data11_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[11]) == 1'b1) begin
           mac2accu_data11_d2 <= mac2accu_data11_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[11]) == 1'b0) begin
       end else begin
           mac2accu_data11_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data12_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data12_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[12]) == 1'b1) begin
           mac2accu_data12_d2 <= mac2accu_data12_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[12]) == 1'b0) begin
       end else begin
           mac2accu_data12_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data13_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data13_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[13]) == 1'b1) begin
           mac2accu_data13_d2 <= mac2accu_data13_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[13]) == 1'b0) begin
       end else begin
           mac2accu_data13_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data14_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data14_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[14]) == 1'b1) begin
           mac2accu_data14_d2 <= mac2accu_data14_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[14]) == 1'b0) begin
       end else begin
           mac2accu_data14_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] mac2accu_data15_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data15_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[15]) == 1'b1) begin
           mac2accu_data15_d2 <= mac2accu_data15_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[15]) == 1'b0) begin
       end else begin
           mac2accu_data15_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
assign mac2accu_dst_pvld = mac2accu_pvld_d2;
assign mac2accu_dst_pd = mac2accu_pd_d2;
assign mac2accu_dst_mask = mac2accu_mask_d2;
assign mac2accu_dst_mode = mac2accu_mode_d2;
assign mac2accu_dst_data0 = mac2accu_data0_d2;
assign mac2accu_dst_data1 = mac2accu_data1_d2;
assign mac2accu_dst_data2 = mac2accu_data2_d2;
assign mac2accu_dst_data3 = mac2accu_data3_d2;
assign mac2accu_dst_data4 = mac2accu_data4_d2;
assign mac2accu_dst_data5 = mac2accu_data5_d2;
assign mac2accu_dst_data6 = mac2accu_data6_d2;
assign mac2accu_dst_data7 = mac2accu_data7_d2;
assign mac2accu_dst_data8 = mac2accu_data8_d2;
assign mac2accu_dst_data9 = mac2accu_data9_d2;
assign mac2accu_dst_data10 = mac2accu_data10_d2;
assign mac2accu_dst_data11 = mac2accu_data11_d2;
assign mac2accu_dst_data12 = mac2accu_data12_d2;
assign mac2accu_dst_data13 = mac2accu_data13_d2;
assign mac2accu_dst_data14 = mac2accu_data14_d2;
assign mac2accu_dst_data15 = mac2accu_data15_d2;

//| eperl: generated_end (DO NOT EDIT ABOVE)
endmodule
