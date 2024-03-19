// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CMAC_CORE_rt_out.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CMAC.h
module NV_NVDLA_CMAC_CORE_rt_out (
   nvdla_core_clk
  ,nvdla_wg_clk
  ,nvdla_core_rstn
  ,cfg_is_wg
  ,cfg_reg_en
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: ,out_data${i} )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,out_data0 
,out_data1 
,out_data2 
,out_data3 
,out_data4 
,out_data5 
,out_data6 
,out_data7 
,out_data8 
,out_data9 
,out_data10 
,out_data11 
,out_data12 
,out_data13 
,out_data14 
,out_data15 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,out_mask
  ,out_pd
  ,out_pvld
  ,dp2reg_done
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: ,mac2accu_data${i} )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,mac2accu_data0 
,mac2accu_data1 
,mac2accu_data2 
,mac2accu_data3 
,mac2accu_data4 
,mac2accu_data5 
,mac2accu_data6 
,mac2accu_data7 
,mac2accu_data8 
,mac2accu_data9 
,mac2accu_data10 
,mac2accu_data11 
,mac2accu_data12 
,mac2accu_data13 
,mac2accu_data14 
,mac2accu_data15 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,mac2accu_mask
  ,mac2accu_pd
  ,mac2accu_pvld
  );
input nvdla_core_clk;
input nvdla_wg_clk;
input nvdla_core_rstn;
input cfg_is_wg;
input cfg_reg_en;
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: input[22 -1:0] out_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

input[22 -1:0] out_data0; 
input[22 -1:0] out_data1; 
input[22 -1:0] out_data2; 
input[22 -1:0] out_data3; 
input[22 -1:0] out_data4; 
input[22 -1:0] out_data5; 
input[22 -1:0] out_data6; 
input[22 -1:0] out_data7; 
input[22 -1:0] out_data8; 
input[22 -1:0] out_data9; 
input[22 -1:0] out_data10; 
input[22 -1:0] out_data11; 
input[22 -1:0] out_data12; 
input[22 -1:0] out_data13; 
input[22 -1:0] out_data14; 
input[22 -1:0] out_data15; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
input [32/2 -1:0] out_mask;
input [8:0] out_pd;
input out_pvld;
output dp2reg_done;
//: for(my $i=0; $i<32/2; $i++){
//: print qq(
//: output[22 -1:0] mac2accu_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

output[22 -1:0] mac2accu_data0; 
output[22 -1:0] mac2accu_data1; 
output[22 -1:0] mac2accu_data2; 
output[22 -1:0] mac2accu_data3; 
output[22 -1:0] mac2accu_data4; 
output[22 -1:0] mac2accu_data5; 
output[22 -1:0] mac2accu_data6; 
output[22 -1:0] mac2accu_data7; 
output[22 -1:0] mac2accu_data8; 
output[22 -1:0] mac2accu_data9; 
output[22 -1:0] mac2accu_data10; 
output[22 -1:0] mac2accu_data11; 
output[22 -1:0] mac2accu_data12; 
output[22 -1:0] mac2accu_data13; 
output[22 -1:0] mac2accu_data14; 
output[22 -1:0] mac2accu_data15; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
output [32/2 -1:0] mac2accu_mask;
output [8:0] mac2accu_pd;
output mac2accu_pvld;
wire [32/2 -1:0] mac2accu_mask;
wire [8:0] mac2accu_pd;
wire mac2accu_pvld;
wire out_layer_done;
wire out_rt_done_d0;
//==========================================================
// Config logic
//==========================================================
//: &eperl::flop(" -q  \"cfg_reg_en_d1\"  -d \"cfg_reg_en\" -clk nvdla_core_clk -rst nvdla_core_rstn ");
//: &eperl::flop(" -q  \"cfg_is_wg_d1\"  -en \"cfg_reg_en\" -d  \"cfg_is_wg\" -clk nvdla_core_clk -rst nvdla_core_rstn ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  cfg_reg_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       cfg_reg_en_d1 <= 'b0;
   end else begin
       cfg_reg_en_d1 <= cfg_reg_en;
   end
end
reg  cfg_is_wg_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       cfg_is_wg_d1 <= 'b0;
   end else begin
       if ((cfg_reg_en) == 1'b1) begin
           cfg_is_wg_d1 <= cfg_is_wg;
       // VCS coverage off
       end else if ((cfg_reg_en) == 1'b0) begin
       end else begin
           cfg_is_wg_d1 <= 'bx;
       // VCS coverage on
       end
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
//==========================================================
// Output retiming
//==========================================================
assign out_layer_done = out_pd[8] &
                            out_pd[6] &
                            out_pvld;
//: my $kk = 32/2;
//: my $jj = 22;
//: print "wire             out_rt_pvld_d0 = out_pvld;\n";
//: print "wire [$kk-1:0]   out_rt_mask_d0 = out_mask;\n";
//: print "wire [8:0]       out_rt_pd_d0   = out_pd;\n";
//: for(my $k = 0; $k < $kk; $k ++) {
//: print "wire [${jj}-1:0]    out_rt_data${k}_d0 =  out_data${k};\n";
//: }
//: my $latency = 2;
//: my $kk = 32/2;
//: my $res_width = 22;
//: for(my $i = 0; $i < $latency; $i ++) {
//: my $j = $i + 1;
//: &eperl::flop(" -q  out_rt_pvld_d${j}  -d \"out_rt_pvld_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn ");
//: &eperl::flop(" -q  out_rt_mask_d${j}  -d \"out_rt_mask_d${i}\" -wid $kk -clk nvdla_core_clk -rst nvdla_core_rstn ");
//: &eperl::flop("-wid 9 -q  out_rt_pd_d${j}  -en \"out_rt_pvld_d${i}\" -d  \"out_rt_pd_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn");
//: for(my $k = 0; $k < $kk; $k ++) {
//: &eperl::flop("-norst -wid $res_width  -q out_rt_data${k}_d${j} -en \"out_rt_mask_d${i}[${k}]\" -d  \"out_rt_data${k}_d${i}\" -clk nvdla_core_clk");
//: }
//: }
//:
//: my $i = $latency;
//: print "assign    mac2accu_pvld = out_rt_pvld_d${i};\n";
//: print "assign    mac2accu_mask = out_rt_mask_d${i};\n";
//: print "assign    mac2accu_pd = out_rt_pd_d${i};\n";
//: my $kk = 32/2;
//: for(my $k = 0; $k < $kk; $k ++) {
//: print "assign    mac2accu_data${k} = out_rt_data${k}_d${i};\n";
//: }
//:
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire             out_rt_pvld_d0 = out_pvld;
wire [16-1:0]   out_rt_mask_d0 = out_mask;
wire [8:0]       out_rt_pd_d0   = out_pd;
wire [22-1:0]    out_rt_data0_d0 =  out_data0;
wire [22-1:0]    out_rt_data1_d0 =  out_data1;
wire [22-1:0]    out_rt_data2_d0 =  out_data2;
wire [22-1:0]    out_rt_data3_d0 =  out_data3;
wire [22-1:0]    out_rt_data4_d0 =  out_data4;
wire [22-1:0]    out_rt_data5_d0 =  out_data5;
wire [22-1:0]    out_rt_data6_d0 =  out_data6;
wire [22-1:0]    out_rt_data7_d0 =  out_data7;
wire [22-1:0]    out_rt_data8_d0 =  out_data8;
wire [22-1:0]    out_rt_data9_d0 =  out_data9;
wire [22-1:0]    out_rt_data10_d0 =  out_data10;
wire [22-1:0]    out_rt_data11_d0 =  out_data11;
wire [22-1:0]    out_rt_data12_d0 =  out_data12;
wire [22-1:0]    out_rt_data13_d0 =  out_data13;
wire [22-1:0]    out_rt_data14_d0 =  out_data14;
wire [22-1:0]    out_rt_data15_d0 =  out_data15;
reg  out_rt_pvld_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_pvld_d1 <= 'b0;
   end else begin
       out_rt_pvld_d1 <= out_rt_pvld_d0;
   end
end
reg [15:0] out_rt_mask_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_mask_d1 <= 'b0;
   end else begin
       out_rt_mask_d1 <= out_rt_mask_d0;
   end
end
reg [8:0] out_rt_pd_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_pd_d1 <= 'b0;
   end else begin
       if ((out_rt_pvld_d0) == 1'b1) begin
           out_rt_pd_d1 <= out_rt_pd_d0;
       // VCS coverage off
       end else if ((out_rt_pvld_d0) == 1'b0) begin
       end else begin
           out_rt_pd_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] out_rt_data0_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[0]) == 1'b1) begin
           out_rt_data0_d1 <= out_rt_data0_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[0]) == 1'b0) begin
       end else begin
           out_rt_data0_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data1_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[1]) == 1'b1) begin
           out_rt_data1_d1 <= out_rt_data1_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[1]) == 1'b0) begin
       end else begin
           out_rt_data1_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data2_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[2]) == 1'b1) begin
           out_rt_data2_d1 <= out_rt_data2_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[2]) == 1'b0) begin
       end else begin
           out_rt_data2_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data3_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[3]) == 1'b1) begin
           out_rt_data3_d1 <= out_rt_data3_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[3]) == 1'b0) begin
       end else begin
           out_rt_data3_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data4_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[4]) == 1'b1) begin
           out_rt_data4_d1 <= out_rt_data4_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[4]) == 1'b0) begin
       end else begin
           out_rt_data4_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data5_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[5]) == 1'b1) begin
           out_rt_data5_d1 <= out_rt_data5_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[5]) == 1'b0) begin
       end else begin
           out_rt_data5_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data6_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[6]) == 1'b1) begin
           out_rt_data6_d1 <= out_rt_data6_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[6]) == 1'b0) begin
       end else begin
           out_rt_data6_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data7_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[7]) == 1'b1) begin
           out_rt_data7_d1 <= out_rt_data7_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[7]) == 1'b0) begin
       end else begin
           out_rt_data7_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data8_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[8]) == 1'b1) begin
           out_rt_data8_d1 <= out_rt_data8_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[8]) == 1'b0) begin
       end else begin
           out_rt_data8_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data9_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[9]) == 1'b1) begin
           out_rt_data9_d1 <= out_rt_data9_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[9]) == 1'b0) begin
       end else begin
           out_rt_data9_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data10_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[10]) == 1'b1) begin
           out_rt_data10_d1 <= out_rt_data10_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[10]) == 1'b0) begin
       end else begin
           out_rt_data10_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data11_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[11]) == 1'b1) begin
           out_rt_data11_d1 <= out_rt_data11_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[11]) == 1'b0) begin
       end else begin
           out_rt_data11_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data12_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[12]) == 1'b1) begin
           out_rt_data12_d1 <= out_rt_data12_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[12]) == 1'b0) begin
       end else begin
           out_rt_data12_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data13_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[13]) == 1'b1) begin
           out_rt_data13_d1 <= out_rt_data13_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[13]) == 1'b0) begin
       end else begin
           out_rt_data13_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data14_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[14]) == 1'b1) begin
           out_rt_data14_d1 <= out_rt_data14_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[14]) == 1'b0) begin
       end else begin
           out_rt_data14_d1 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data15_d1;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d0[15]) == 1'b1) begin
           out_rt_data15_d1 <= out_rt_data15_d0;
       // VCS coverage off
       end else if ((out_rt_mask_d0[15]) == 1'b0) begin
       end else begin
           out_rt_data15_d1 <= 'bx;
       // VCS coverage on
       end
end
reg  out_rt_pvld_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_pvld_d2 <= 'b0;
   end else begin
       out_rt_pvld_d2 <= out_rt_pvld_d1;
   end
end
reg [15:0] out_rt_mask_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_mask_d2 <= 'b0;
   end else begin
       out_rt_mask_d2 <= out_rt_mask_d1;
   end
end
reg [8:0] out_rt_pd_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_pd_d2 <= 'b0;
   end else begin
       if ((out_rt_pvld_d1) == 1'b1) begin
           out_rt_pd_d2 <= out_rt_pd_d1;
       // VCS coverage off
       end else if ((out_rt_pvld_d1) == 1'b0) begin
       end else begin
           out_rt_pd_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [21:0] out_rt_data0_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[0]) == 1'b1) begin
           out_rt_data0_d2 <= out_rt_data0_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[0]) == 1'b0) begin
       end else begin
           out_rt_data0_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data1_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[1]) == 1'b1) begin
           out_rt_data1_d2 <= out_rt_data1_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[1]) == 1'b0) begin
       end else begin
           out_rt_data1_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data2_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[2]) == 1'b1) begin
           out_rt_data2_d2 <= out_rt_data2_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[2]) == 1'b0) begin
       end else begin
           out_rt_data2_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data3_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[3]) == 1'b1) begin
           out_rt_data3_d2 <= out_rt_data3_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[3]) == 1'b0) begin
       end else begin
           out_rt_data3_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data4_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[4]) == 1'b1) begin
           out_rt_data4_d2 <= out_rt_data4_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[4]) == 1'b0) begin
       end else begin
           out_rt_data4_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data5_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[5]) == 1'b1) begin
           out_rt_data5_d2 <= out_rt_data5_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[5]) == 1'b0) begin
       end else begin
           out_rt_data5_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data6_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[6]) == 1'b1) begin
           out_rt_data6_d2 <= out_rt_data6_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[6]) == 1'b0) begin
       end else begin
           out_rt_data6_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data7_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[7]) == 1'b1) begin
           out_rt_data7_d2 <= out_rt_data7_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[7]) == 1'b0) begin
       end else begin
           out_rt_data7_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data8_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[8]) == 1'b1) begin
           out_rt_data8_d2 <= out_rt_data8_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[8]) == 1'b0) begin
       end else begin
           out_rt_data8_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data9_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[9]) == 1'b1) begin
           out_rt_data9_d2 <= out_rt_data9_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[9]) == 1'b0) begin
       end else begin
           out_rt_data9_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data10_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[10]) == 1'b1) begin
           out_rt_data10_d2 <= out_rt_data10_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[10]) == 1'b0) begin
       end else begin
           out_rt_data10_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data11_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[11]) == 1'b1) begin
           out_rt_data11_d2 <= out_rt_data11_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[11]) == 1'b0) begin
       end else begin
           out_rt_data11_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data12_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[12]) == 1'b1) begin
           out_rt_data12_d2 <= out_rt_data12_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[12]) == 1'b0) begin
       end else begin
           out_rt_data12_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data13_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[13]) == 1'b1) begin
           out_rt_data13_d2 <= out_rt_data13_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[13]) == 1'b0) begin
       end else begin
           out_rt_data13_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data14_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[14]) == 1'b1) begin
           out_rt_data14_d2 <= out_rt_data14_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[14]) == 1'b0) begin
       end else begin
           out_rt_data14_d2 <= 'bx;
       // VCS coverage on
       end
end
reg [21:0] out_rt_data15_d2;
always @(posedge nvdla_core_clk) begin
       if ((out_rt_mask_d1[15]) == 1'b1) begin
           out_rt_data15_d2 <= out_rt_data15_d1;
       // VCS coverage off
       end else if ((out_rt_mask_d1[15]) == 1'b0) begin
       end else begin
           out_rt_data15_d2 <= 'bx;
       // VCS coverage on
       end
end
assign    mac2accu_pvld = out_rt_pvld_d2;
assign    mac2accu_mask = out_rt_mask_d2;
assign    mac2accu_pd = out_rt_pd_d2;
assign    mac2accu_data0 = out_rt_data0_d2;
assign    mac2accu_data1 = out_rt_data1_d2;
assign    mac2accu_data2 = out_rt_data2_d2;
assign    mac2accu_data3 = out_rt_data3_d2;
assign    mac2accu_data4 = out_rt_data4_d2;
assign    mac2accu_data5 = out_rt_data5_d2;
assign    mac2accu_data6 = out_rt_data6_d2;
assign    mac2accu_data7 = out_rt_data7_d2;
assign    mac2accu_data8 = out_rt_data8_d2;
assign    mac2accu_data9 = out_rt_data9_d2;
assign    mac2accu_data10 = out_rt_data10_d2;
assign    mac2accu_data11 = out_rt_data11_d2;
assign    mac2accu_data12 = out_rt_data12_d2;
assign    mac2accu_data13 = out_rt_data13_d2;
assign    mac2accu_data14 = out_rt_data14_d2;
assign    mac2accu_data15 = out_rt_data15_d2;

//| eperl: generated_end (DO NOT EDIT ABOVE)
// get layer done signal
assign out_rt_done_d0 = out_layer_done;
//: my $latency = 2 + 1;
//: for(my $i = 0; $i < $latency; $i ++) {
//: my $j = $i + 1;
//: &eperl::flop(" -q  out_rt_done_d${j}  -d \"out_rt_done_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn ");
//: };
//: my $h = $latency;
//: print "assign dp2reg_done = out_rt_done_d${h};\n";
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  out_rt_done_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_done_d1 <= 'b0;
   end else begin
       out_rt_done_d1 <= out_rt_done_d0;
   end
end
reg  out_rt_done_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_done_d2 <= 'b0;
   end else begin
       out_rt_done_d2 <= out_rt_done_d1;
   end
end
reg  out_rt_done_d3;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       out_rt_done_d3 <= 'b0;
   end else begin
       out_rt_done_d3 <= out_rt_done_d2;
   end
end
assign dp2reg_done = out_rt_done_d3;

//| eperl: generated_end (DO NOT EDIT ABOVE)
endmodule
