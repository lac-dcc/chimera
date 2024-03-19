// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CACC_calculator.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CACC.h
module NV_NVDLA_CACC_calculator (
   nvdla_core_clk //|< i
  ,nvdla_core_rstn //|< i
  ,abuf_rd_data //|< i
  ,accu_ctrl_pd //|< i
  ,accu_ctrl_ram_valid //|< i
  ,accu_ctrl_valid //|< i
  ,cfg_in_en_mask //|< i
  ,cfg_is_wg //|< i
  ,cfg_truncate //|< i
//: for(my $i=0; $i<32/2 ; $i++){
//: print qq(
//: ,mac_a2accu_data${i} //|< i )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,mac_a2accu_data0 //|< i 
,mac_a2accu_data1 //|< i 
,mac_a2accu_data2 //|< i 
,mac_a2accu_data3 //|< i 
,mac_a2accu_data4 //|< i 
,mac_a2accu_data5 //|< i 
,mac_a2accu_data6 //|< i 
,mac_a2accu_data7 //|< i 
,mac_a2accu_data8 //|< i 
,mac_a2accu_data9 //|< i 
,mac_a2accu_data10 //|< i 
,mac_a2accu_data11 //|< i 
,mac_a2accu_data12 //|< i 
,mac_a2accu_data13 //|< i 
,mac_a2accu_data14 //|< i 
,mac_a2accu_data15 //|< i 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,mac_a2accu_mask //|< i
  ,mac_a2accu_mode //|< i
  ,mac_a2accu_pvld //|< i
//: for(my $i=0; $i<32/2 ; $i++){
//: print qq(
//: ,mac_b2accu_data${i} //|< i )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,mac_b2accu_data0 //|< i 
,mac_b2accu_data1 //|< i 
,mac_b2accu_data2 //|< i 
,mac_b2accu_data3 //|< i 
,mac_b2accu_data4 //|< i 
,mac_b2accu_data5 //|< i 
,mac_b2accu_data6 //|< i 
,mac_b2accu_data7 //|< i 
,mac_b2accu_data8 //|< i 
,mac_b2accu_data9 //|< i 
,mac_b2accu_data10 //|< i 
,mac_b2accu_data11 //|< i 
,mac_b2accu_data12 //|< i 
,mac_b2accu_data13 //|< i 
,mac_b2accu_data14 //|< i 
,mac_b2accu_data15 //|< i 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,mac_b2accu_mask //|< i
  ,mac_b2accu_mode //|< i
  ,mac_b2accu_pvld //|< i
  ,nvdla_cell_clk //|< i
  ,abuf_wr_addr //|> o
  ,abuf_wr_data //|> o
  ,abuf_wr_en //|> o
  ,dlv_data //|> o
  ,dlv_mask //|> o
  ,dlv_pd //|> o
  ,dlv_valid //|> o
  ,dp2reg_sat_count //|> o
  );
input nvdla_cell_clk;
input nvdla_core_clk;
input nvdla_core_rstn;
input [34*32 -1:0] abuf_rd_data;
input [12:0] accu_ctrl_pd;
input accu_ctrl_ram_valid;
input accu_ctrl_valid;
input cfg_in_en_mask;
input cfg_is_wg;
input [4:0] cfg_truncate;
//: for(my $i=0; $i<32/2 ; $i++){
//: print qq(
//: input [22 -1:0] mac_a2accu_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

input [22 -1:0] mac_a2accu_data0; 
input [22 -1:0] mac_a2accu_data1; 
input [22 -1:0] mac_a2accu_data2; 
input [22 -1:0] mac_a2accu_data3; 
input [22 -1:0] mac_a2accu_data4; 
input [22 -1:0] mac_a2accu_data5; 
input [22 -1:0] mac_a2accu_data6; 
input [22 -1:0] mac_a2accu_data7; 
input [22 -1:0] mac_a2accu_data8; 
input [22 -1:0] mac_a2accu_data9; 
input [22 -1:0] mac_a2accu_data10; 
input [22 -1:0] mac_a2accu_data11; 
input [22 -1:0] mac_a2accu_data12; 
input [22 -1:0] mac_a2accu_data13; 
input [22 -1:0] mac_a2accu_data14; 
input [22 -1:0] mac_a2accu_data15; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
input [32/2-1:0] mac_a2accu_mask;
input mac_a2accu_mode;
input mac_a2accu_pvld;
//: for(my $i=0; $i<32/2 ; $i++){
//: print qq(
//: input [22 -1:0] mac_b2accu_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

input [22 -1:0] mac_b2accu_data0; 
input [22 -1:0] mac_b2accu_data1; 
input [22 -1:0] mac_b2accu_data2; 
input [22 -1:0] mac_b2accu_data3; 
input [22 -1:0] mac_b2accu_data4; 
input [22 -1:0] mac_b2accu_data5; 
input [22 -1:0] mac_b2accu_data6; 
input [22 -1:0] mac_b2accu_data7; 
input [22 -1:0] mac_b2accu_data8; 
input [22 -1:0] mac_b2accu_data9; 
input [22 -1:0] mac_b2accu_data10; 
input [22 -1:0] mac_b2accu_data11; 
input [22 -1:0] mac_b2accu_data12; 
input [22 -1:0] mac_b2accu_data13; 
input [22 -1:0] mac_b2accu_data14; 
input [22 -1:0] mac_b2accu_data15; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
input [32/2-1:0] mac_b2accu_mask;
input mac_b2accu_mode;
input mac_b2accu_pvld;
output [5 +1 -1:0] abuf_wr_addr;
output [34*32 -1:0] abuf_wr_data;
output abuf_wr_en;
output [32*32 -1:0] dlv_data;
output dlv_mask;
output [1:0] dlv_pd;
output dlv_valid;
output [31:0] dp2reg_sat_count;
// spyglass disable_block NoWidthInBasedNum-ML
// spyglass disable_block STARC-2.10.1.6
// unpack abuffer read data
//: my $kk=34;
//: for(my $i=0; $i<32 ; $i++){
//: print qq(
//: wire [${kk}-1:0] abuf_in_data_${i} = abuf_rd_data[($i+1)*${kk}-1:$i*${kk}]; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [34-1:0] abuf_in_data_0 = abuf_rd_data[(0+1)*34-1:0*34]; 
wire [34-1:0] abuf_in_data_1 = abuf_rd_data[(1+1)*34-1:1*34]; 
wire [34-1:0] abuf_in_data_2 = abuf_rd_data[(2+1)*34-1:2*34]; 
wire [34-1:0] abuf_in_data_3 = abuf_rd_data[(3+1)*34-1:3*34]; 
wire [34-1:0] abuf_in_data_4 = abuf_rd_data[(4+1)*34-1:4*34]; 
wire [34-1:0] abuf_in_data_5 = abuf_rd_data[(5+1)*34-1:5*34]; 
wire [34-1:0] abuf_in_data_6 = abuf_rd_data[(6+1)*34-1:6*34]; 
wire [34-1:0] abuf_in_data_7 = abuf_rd_data[(7+1)*34-1:7*34]; 
wire [34-1:0] abuf_in_data_8 = abuf_rd_data[(8+1)*34-1:8*34]; 
wire [34-1:0] abuf_in_data_9 = abuf_rd_data[(9+1)*34-1:9*34]; 
wire [34-1:0] abuf_in_data_10 = abuf_rd_data[(10+1)*34-1:10*34]; 
wire [34-1:0] abuf_in_data_11 = abuf_rd_data[(11+1)*34-1:11*34]; 
wire [34-1:0] abuf_in_data_12 = abuf_rd_data[(12+1)*34-1:12*34]; 
wire [34-1:0] abuf_in_data_13 = abuf_rd_data[(13+1)*34-1:13*34]; 
wire [34-1:0] abuf_in_data_14 = abuf_rd_data[(14+1)*34-1:14*34]; 
wire [34-1:0] abuf_in_data_15 = abuf_rd_data[(15+1)*34-1:15*34]; 
wire [34-1:0] abuf_in_data_16 = abuf_rd_data[(16+1)*34-1:16*34]; 
wire [34-1:0] abuf_in_data_17 = abuf_rd_data[(17+1)*34-1:17*34]; 
wire [34-1:0] abuf_in_data_18 = abuf_rd_data[(18+1)*34-1:18*34]; 
wire [34-1:0] abuf_in_data_19 = abuf_rd_data[(19+1)*34-1:19*34]; 
wire [34-1:0] abuf_in_data_20 = abuf_rd_data[(20+1)*34-1:20*34]; 
wire [34-1:0] abuf_in_data_21 = abuf_rd_data[(21+1)*34-1:21*34]; 
wire [34-1:0] abuf_in_data_22 = abuf_rd_data[(22+1)*34-1:22*34]; 
wire [34-1:0] abuf_in_data_23 = abuf_rd_data[(23+1)*34-1:23*34]; 
wire [34-1:0] abuf_in_data_24 = abuf_rd_data[(24+1)*34-1:24*34]; 
wire [34-1:0] abuf_in_data_25 = abuf_rd_data[(25+1)*34-1:25*34]; 
wire [34-1:0] abuf_in_data_26 = abuf_rd_data[(26+1)*34-1:26*34]; 
wire [34-1:0] abuf_in_data_27 = abuf_rd_data[(27+1)*34-1:27*34]; 
wire [34-1:0] abuf_in_data_28 = abuf_rd_data[(28+1)*34-1:28*34]; 
wire [34-1:0] abuf_in_data_29 = abuf_rd_data[(29+1)*34-1:29*34]; 
wire [34-1:0] abuf_in_data_30 = abuf_rd_data[(30+1)*34-1:30*34]; 
wire [34-1:0] abuf_in_data_31 = abuf_rd_data[(31+1)*34-1:31*34]; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//1T delay, the same T with data/mask
//: &eperl::flop("-wid 13 -q accu_ctrl_pd_d1 -en accu_ctrl_valid -d accu_ctrl_pd");
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg [12:0] accu_ctrl_pd_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       accu_ctrl_pd_d1 <= 'b0;
   end else begin
       if ((accu_ctrl_valid) == 1'b1) begin
           accu_ctrl_pd_d1 <= accu_ctrl_pd;
       // VCS coverage off
       end else if ((accu_ctrl_valid) == 1'b0) begin
       end else begin
           accu_ctrl_pd_d1 <= 'bx;
       // VCS coverage on
       end
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
wire calc_valid_in = (mac_b2accu_pvld | mac_a2accu_pvld);
// spyglass disable_block STARC05-3.3.1.4b
//: &eperl::retime("-stage 3 -o calc_valid -i calc_valid_in");
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  calc_valid_in_d1;
always @(posedge nvdla_core_clk) begin
        calc_valid_in_d1 <= calc_valid_in;
end

reg  calc_valid_in_d2;
always @(posedge nvdla_core_clk) begin
        calc_valid_in_d2 <= calc_valid_in_d1;
end

reg  calc_valid_in_d3;
always @(posedge nvdla_core_clk) begin
        calc_valid_in_d3 <= calc_valid_in_d2;
end

wire  calc_valid;
assign calc_valid = calc_valid_in_d3;


//| eperl: generated_end (DO NOT EDIT ABOVE)
// spyglass enable_block STARC05-3.3.1.4b
// unpack pd form abuffer control
wire [5:0] calc_addr = accu_ctrl_pd_d1[5:0];
wire [2:0] calc_mode = accu_ctrl_pd_d1[8:6];
wire calc_stripe_end = accu_ctrl_pd_d1[9];
wire calc_channel_end = accu_ctrl_pd_d1[10];
wire calc_layer_end = accu_ctrl_pd_d1[11];
wire calc_dlv_elem_mask = accu_ctrl_pd_d1[12];
//: my $kk=22;
//: for(my $i = 0; $i < 32/2; $i ++) {
//: print "wire [${kk}-1:0] calc_elem_${i} = mac_a2accu_data${i}; \n";
//: }
//: for(my $i = 32/2; $i < 32; $i ++) {
//: my $j = $i - 32/2;
//: print "wire [${kk}-1:0] calc_elem_${i} = mac_b2accu_data${j}; \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire [22-1:0] calc_elem_0 = mac_a2accu_data0; 
wire [22-1:0] calc_elem_1 = mac_a2accu_data1; 
wire [22-1:0] calc_elem_2 = mac_a2accu_data2; 
wire [22-1:0] calc_elem_3 = mac_a2accu_data3; 
wire [22-1:0] calc_elem_4 = mac_a2accu_data4; 
wire [22-1:0] calc_elem_5 = mac_a2accu_data5; 
wire [22-1:0] calc_elem_6 = mac_a2accu_data6; 
wire [22-1:0] calc_elem_7 = mac_a2accu_data7; 
wire [22-1:0] calc_elem_8 = mac_a2accu_data8; 
wire [22-1:0] calc_elem_9 = mac_a2accu_data9; 
wire [22-1:0] calc_elem_10 = mac_a2accu_data10; 
wire [22-1:0] calc_elem_11 = mac_a2accu_data11; 
wire [22-1:0] calc_elem_12 = mac_a2accu_data12; 
wire [22-1:0] calc_elem_13 = mac_a2accu_data13; 
wire [22-1:0] calc_elem_14 = mac_a2accu_data14; 
wire [22-1:0] calc_elem_15 = mac_a2accu_data15; 
wire [22-1:0] calc_elem_16 = mac_b2accu_data0; 
wire [22-1:0] calc_elem_17 = mac_b2accu_data1; 
wire [22-1:0] calc_elem_18 = mac_b2accu_data2; 
wire [22-1:0] calc_elem_19 = mac_b2accu_data3; 
wire [22-1:0] calc_elem_20 = mac_b2accu_data4; 
wire [22-1:0] calc_elem_21 = mac_b2accu_data5; 
wire [22-1:0] calc_elem_22 = mac_b2accu_data6; 
wire [22-1:0] calc_elem_23 = mac_b2accu_data7; 
wire [22-1:0] calc_elem_24 = mac_b2accu_data8; 
wire [22-1:0] calc_elem_25 = mac_b2accu_data9; 
wire [22-1:0] calc_elem_26 = mac_b2accu_data10; 
wire [22-1:0] calc_elem_27 = mac_b2accu_data11; 
wire [22-1:0] calc_elem_28 = mac_b2accu_data12; 
wire [22-1:0] calc_elem_29 = mac_b2accu_data13; 
wire [22-1:0] calc_elem_30 = mac_b2accu_data14; 
wire [22-1:0] calc_elem_31 = mac_b2accu_data15; 

//| eperl: generated_end (DO NOT EDIT ABOVE)
wire [32 -1:0] calc_in_mask = {mac_b2accu_mask, mac_a2accu_mask};
wire [32 -1:0] calc_op_en = calc_in_mask & {32{cfg_in_en_mask}};
wire [32 -1:0] calc_op1_vld = calc_in_mask & {32{cfg_in_en_mask & accu_ctrl_ram_valid}};
wire calc_dlv_valid = calc_valid & calc_channel_end;
wire calc_wr_en = calc_valid & (~calc_channel_end);
//: my $hh= 22-22;
//: my $pp= 34;
//: my $bb= 22;
//: for(my $i = 0; $i <32; $i ++) {
//: if($hh == 0) {
//: print qq(
//: wire [21:0]calc_op0_${i} = {calc_elem_${i}};
//: wire [${pp}-1:0] calc_op1_${i} = abuf_in_data_${i};
//: );
//: }
//: elsif($hh > 0) {
//: print qq(
//: wire [21:0]calc_op0_${i} = {{${hh}{calc_elem_${i}[${bb}-1]}},calc_elem_${i}};
//: wire [${pp}-1:0] calc_op1_${i} = abuf_in_data_${i};
//: );
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [21:0]calc_op0_0 = {calc_elem_0};
wire [34-1:0] calc_op1_0 = abuf_in_data_0;

wire [21:0]calc_op0_1 = {calc_elem_1};
wire [34-1:0] calc_op1_1 = abuf_in_data_1;

wire [21:0]calc_op0_2 = {calc_elem_2};
wire [34-1:0] calc_op1_2 = abuf_in_data_2;

wire [21:0]calc_op0_3 = {calc_elem_3};
wire [34-1:0] calc_op1_3 = abuf_in_data_3;

wire [21:0]calc_op0_4 = {calc_elem_4};
wire [34-1:0] calc_op1_4 = abuf_in_data_4;

wire [21:0]calc_op0_5 = {calc_elem_5};
wire [34-1:0] calc_op1_5 = abuf_in_data_5;

wire [21:0]calc_op0_6 = {calc_elem_6};
wire [34-1:0] calc_op1_6 = abuf_in_data_6;

wire [21:0]calc_op0_7 = {calc_elem_7};
wire [34-1:0] calc_op1_7 = abuf_in_data_7;

wire [21:0]calc_op0_8 = {calc_elem_8};
wire [34-1:0] calc_op1_8 = abuf_in_data_8;

wire [21:0]calc_op0_9 = {calc_elem_9};
wire [34-1:0] calc_op1_9 = abuf_in_data_9;

wire [21:0]calc_op0_10 = {calc_elem_10};
wire [34-1:0] calc_op1_10 = abuf_in_data_10;

wire [21:0]calc_op0_11 = {calc_elem_11};
wire [34-1:0] calc_op1_11 = abuf_in_data_11;

wire [21:0]calc_op0_12 = {calc_elem_12};
wire [34-1:0] calc_op1_12 = abuf_in_data_12;

wire [21:0]calc_op0_13 = {calc_elem_13};
wire [34-1:0] calc_op1_13 = abuf_in_data_13;

wire [21:0]calc_op0_14 = {calc_elem_14};
wire [34-1:0] calc_op1_14 = abuf_in_data_14;

wire [21:0]calc_op0_15 = {calc_elem_15};
wire [34-1:0] calc_op1_15 = abuf_in_data_15;

wire [21:0]calc_op0_16 = {calc_elem_16};
wire [34-1:0] calc_op1_16 = abuf_in_data_16;

wire [21:0]calc_op0_17 = {calc_elem_17};
wire [34-1:0] calc_op1_17 = abuf_in_data_17;

wire [21:0]calc_op0_18 = {calc_elem_18};
wire [34-1:0] calc_op1_18 = abuf_in_data_18;

wire [21:0]calc_op0_19 = {calc_elem_19};
wire [34-1:0] calc_op1_19 = abuf_in_data_19;

wire [21:0]calc_op0_20 = {calc_elem_20};
wire [34-1:0] calc_op1_20 = abuf_in_data_20;

wire [21:0]calc_op0_21 = {calc_elem_21};
wire [34-1:0] calc_op1_21 = abuf_in_data_21;

wire [21:0]calc_op0_22 = {calc_elem_22};
wire [34-1:0] calc_op1_22 = abuf_in_data_22;

wire [21:0]calc_op0_23 = {calc_elem_23};
wire [34-1:0] calc_op1_23 = abuf_in_data_23;

wire [21:0]calc_op0_24 = {calc_elem_24};
wire [34-1:0] calc_op1_24 = abuf_in_data_24;

wire [21:0]calc_op0_25 = {calc_elem_25};
wire [34-1:0] calc_op1_25 = abuf_in_data_25;

wire [21:0]calc_op0_26 = {calc_elem_26};
wire [34-1:0] calc_op1_26 = abuf_in_data_26;

wire [21:0]calc_op0_27 = {calc_elem_27};
wire [34-1:0] calc_op1_27 = abuf_in_data_27;

wire [21:0]calc_op0_28 = {calc_elem_28};
wire [34-1:0] calc_op1_28 = abuf_in_data_28;

wire [21:0]calc_op0_29 = {calc_elem_29};
wire [34-1:0] calc_op1_29 = abuf_in_data_29;

wire [21:0]calc_op0_30 = {calc_elem_30};
wire [34-1:0] calc_op1_30 = abuf_in_data_30;

wire [21:0]calc_op0_31 = {calc_elem_31};
wire [34-1:0] calc_op1_31 = abuf_in_data_31;

//| eperl: generated_end (DO NOT EDIT ABOVE)
// instance int8 adders
wire [32 -1:0] calc_fout_sat;
wire [32 -1:0] calc_pout_vld;
wire [32 -1:0] calc_fout_vld;
//: for(my $i = 0; $i <32; $i ++) {
//: print qq(
//: wire [34 -1:0] calc_pout_${i}_sum;
//: wire [32 -1:0] calc_fout_${i}_sum;
//: )
//: }
//: for(my $i = 0; $i <32; $i ++) {
//: print qq(
//: NV_NVDLA_CACC_CALC_int8 u_cell_int8_${i} (
//: .cfg_truncate (cfg_truncate) //|< w
//: ,.in_data (calc_op0_${i}) //|< r
//: ,.in_op (calc_op1_${i}) //|< r
//: ,.in_op_valid (calc_op1_vld[${i}]) //|< r
//: ,.in_sel (calc_dlv_valid) //|< r
//: ,.in_valid (calc_op_en[${i}]) //|< r
//: ,.out_final_data (calc_fout_${i}_sum) //|> w
//: ,.out_final_sat (calc_fout_sat[${i}]) //|> w
//: ,.out_final_valid (calc_fout_vld[${i}]) //|> w
//: ,.out_partial_data (calc_pout_${i}_sum) //|> w
//: ,.out_partial_valid (calc_pout_vld[${i}]) //|> w
//: ,.nvdla_core_clk (nvdla_cell_clk) //|< i
//: ,.nvdla_core_rstn (nvdla_core_rstn) //|< i
//: );
//: )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [34 -1:0] calc_pout_0_sum;
wire [32 -1:0] calc_fout_0_sum;

wire [34 -1:0] calc_pout_1_sum;
wire [32 -1:0] calc_fout_1_sum;

wire [34 -1:0] calc_pout_2_sum;
wire [32 -1:0] calc_fout_2_sum;

wire [34 -1:0] calc_pout_3_sum;
wire [32 -1:0] calc_fout_3_sum;

wire [34 -1:0] calc_pout_4_sum;
wire [32 -1:0] calc_fout_4_sum;

wire [34 -1:0] calc_pout_5_sum;
wire [32 -1:0] calc_fout_5_sum;

wire [34 -1:0] calc_pout_6_sum;
wire [32 -1:0] calc_fout_6_sum;

wire [34 -1:0] calc_pout_7_sum;
wire [32 -1:0] calc_fout_7_sum;

wire [34 -1:0] calc_pout_8_sum;
wire [32 -1:0] calc_fout_8_sum;

wire [34 -1:0] calc_pout_9_sum;
wire [32 -1:0] calc_fout_9_sum;

wire [34 -1:0] calc_pout_10_sum;
wire [32 -1:0] calc_fout_10_sum;

wire [34 -1:0] calc_pout_11_sum;
wire [32 -1:0] calc_fout_11_sum;

wire [34 -1:0] calc_pout_12_sum;
wire [32 -1:0] calc_fout_12_sum;

wire [34 -1:0] calc_pout_13_sum;
wire [32 -1:0] calc_fout_13_sum;

wire [34 -1:0] calc_pout_14_sum;
wire [32 -1:0] calc_fout_14_sum;

wire [34 -1:0] calc_pout_15_sum;
wire [32 -1:0] calc_fout_15_sum;

wire [34 -1:0] calc_pout_16_sum;
wire [32 -1:0] calc_fout_16_sum;

wire [34 -1:0] calc_pout_17_sum;
wire [32 -1:0] calc_fout_17_sum;

wire [34 -1:0] calc_pout_18_sum;
wire [32 -1:0] calc_fout_18_sum;

wire [34 -1:0] calc_pout_19_sum;
wire [32 -1:0] calc_fout_19_sum;

wire [34 -1:0] calc_pout_20_sum;
wire [32 -1:0] calc_fout_20_sum;

wire [34 -1:0] calc_pout_21_sum;
wire [32 -1:0] calc_fout_21_sum;

wire [34 -1:0] calc_pout_22_sum;
wire [32 -1:0] calc_fout_22_sum;

wire [34 -1:0] calc_pout_23_sum;
wire [32 -1:0] calc_fout_23_sum;

wire [34 -1:0] calc_pout_24_sum;
wire [32 -1:0] calc_fout_24_sum;

wire [34 -1:0] calc_pout_25_sum;
wire [32 -1:0] calc_fout_25_sum;

wire [34 -1:0] calc_pout_26_sum;
wire [32 -1:0] calc_fout_26_sum;

wire [34 -1:0] calc_pout_27_sum;
wire [32 -1:0] calc_fout_27_sum;

wire [34 -1:0] calc_pout_28_sum;
wire [32 -1:0] calc_fout_28_sum;

wire [34 -1:0] calc_pout_29_sum;
wire [32 -1:0] calc_fout_29_sum;

wire [34 -1:0] calc_pout_30_sum;
wire [32 -1:0] calc_fout_30_sum;

wire [34 -1:0] calc_pout_31_sum;
wire [32 -1:0] calc_fout_31_sum;

NV_NVDLA_CACC_CALC_int8 u_cell_int8_0 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_0) //|< r
,.in_op (calc_op1_0) //|< r
,.in_op_valid (calc_op1_vld[0]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[0]) //|< r
,.out_final_data (calc_fout_0_sum) //|> w
,.out_final_sat (calc_fout_sat[0]) //|> w
,.out_final_valid (calc_fout_vld[0]) //|> w
,.out_partial_data (calc_pout_0_sum) //|> w
,.out_partial_valid (calc_pout_vld[0]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_1 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_1) //|< r
,.in_op (calc_op1_1) //|< r
,.in_op_valid (calc_op1_vld[1]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[1]) //|< r
,.out_final_data (calc_fout_1_sum) //|> w
,.out_final_sat (calc_fout_sat[1]) //|> w
,.out_final_valid (calc_fout_vld[1]) //|> w
,.out_partial_data (calc_pout_1_sum) //|> w
,.out_partial_valid (calc_pout_vld[1]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_2 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_2) //|< r
,.in_op (calc_op1_2) //|< r
,.in_op_valid (calc_op1_vld[2]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[2]) //|< r
,.out_final_data (calc_fout_2_sum) //|> w
,.out_final_sat (calc_fout_sat[2]) //|> w
,.out_final_valid (calc_fout_vld[2]) //|> w
,.out_partial_data (calc_pout_2_sum) //|> w
,.out_partial_valid (calc_pout_vld[2]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_3 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_3) //|< r
,.in_op (calc_op1_3) //|< r
,.in_op_valid (calc_op1_vld[3]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[3]) //|< r
,.out_final_data (calc_fout_3_sum) //|> w
,.out_final_sat (calc_fout_sat[3]) //|> w
,.out_final_valid (calc_fout_vld[3]) //|> w
,.out_partial_data (calc_pout_3_sum) //|> w
,.out_partial_valid (calc_pout_vld[3]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_4 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_4) //|< r
,.in_op (calc_op1_4) //|< r
,.in_op_valid (calc_op1_vld[4]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[4]) //|< r
,.out_final_data (calc_fout_4_sum) //|> w
,.out_final_sat (calc_fout_sat[4]) //|> w
,.out_final_valid (calc_fout_vld[4]) //|> w
,.out_partial_data (calc_pout_4_sum) //|> w
,.out_partial_valid (calc_pout_vld[4]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_5 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_5) //|< r
,.in_op (calc_op1_5) //|< r
,.in_op_valid (calc_op1_vld[5]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[5]) //|< r
,.out_final_data (calc_fout_5_sum) //|> w
,.out_final_sat (calc_fout_sat[5]) //|> w
,.out_final_valid (calc_fout_vld[5]) //|> w
,.out_partial_data (calc_pout_5_sum) //|> w
,.out_partial_valid (calc_pout_vld[5]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_6 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_6) //|< r
,.in_op (calc_op1_6) //|< r
,.in_op_valid (calc_op1_vld[6]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[6]) //|< r
,.out_final_data (calc_fout_6_sum) //|> w
,.out_final_sat (calc_fout_sat[6]) //|> w
,.out_final_valid (calc_fout_vld[6]) //|> w
,.out_partial_data (calc_pout_6_sum) //|> w
,.out_partial_valid (calc_pout_vld[6]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_7 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_7) //|< r
,.in_op (calc_op1_7) //|< r
,.in_op_valid (calc_op1_vld[7]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[7]) //|< r
,.out_final_data (calc_fout_7_sum) //|> w
,.out_final_sat (calc_fout_sat[7]) //|> w
,.out_final_valid (calc_fout_vld[7]) //|> w
,.out_partial_data (calc_pout_7_sum) //|> w
,.out_partial_valid (calc_pout_vld[7]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_8 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_8) //|< r
,.in_op (calc_op1_8) //|< r
,.in_op_valid (calc_op1_vld[8]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[8]) //|< r
,.out_final_data (calc_fout_8_sum) //|> w
,.out_final_sat (calc_fout_sat[8]) //|> w
,.out_final_valid (calc_fout_vld[8]) //|> w
,.out_partial_data (calc_pout_8_sum) //|> w
,.out_partial_valid (calc_pout_vld[8]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_9 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_9) //|< r
,.in_op (calc_op1_9) //|< r
,.in_op_valid (calc_op1_vld[9]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[9]) //|< r
,.out_final_data (calc_fout_9_sum) //|> w
,.out_final_sat (calc_fout_sat[9]) //|> w
,.out_final_valid (calc_fout_vld[9]) //|> w
,.out_partial_data (calc_pout_9_sum) //|> w
,.out_partial_valid (calc_pout_vld[9]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_10 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_10) //|< r
,.in_op (calc_op1_10) //|< r
,.in_op_valid (calc_op1_vld[10]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[10]) //|< r
,.out_final_data (calc_fout_10_sum) //|> w
,.out_final_sat (calc_fout_sat[10]) //|> w
,.out_final_valid (calc_fout_vld[10]) //|> w
,.out_partial_data (calc_pout_10_sum) //|> w
,.out_partial_valid (calc_pout_vld[10]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_11 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_11) //|< r
,.in_op (calc_op1_11) //|< r
,.in_op_valid (calc_op1_vld[11]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[11]) //|< r
,.out_final_data (calc_fout_11_sum) //|> w
,.out_final_sat (calc_fout_sat[11]) //|> w
,.out_final_valid (calc_fout_vld[11]) //|> w
,.out_partial_data (calc_pout_11_sum) //|> w
,.out_partial_valid (calc_pout_vld[11]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_12 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_12) //|< r
,.in_op (calc_op1_12) //|< r
,.in_op_valid (calc_op1_vld[12]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[12]) //|< r
,.out_final_data (calc_fout_12_sum) //|> w
,.out_final_sat (calc_fout_sat[12]) //|> w
,.out_final_valid (calc_fout_vld[12]) //|> w
,.out_partial_data (calc_pout_12_sum) //|> w
,.out_partial_valid (calc_pout_vld[12]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_13 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_13) //|< r
,.in_op (calc_op1_13) //|< r
,.in_op_valid (calc_op1_vld[13]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[13]) //|< r
,.out_final_data (calc_fout_13_sum) //|> w
,.out_final_sat (calc_fout_sat[13]) //|> w
,.out_final_valid (calc_fout_vld[13]) //|> w
,.out_partial_data (calc_pout_13_sum) //|> w
,.out_partial_valid (calc_pout_vld[13]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_14 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_14) //|< r
,.in_op (calc_op1_14) //|< r
,.in_op_valid (calc_op1_vld[14]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[14]) //|< r
,.out_final_data (calc_fout_14_sum) //|> w
,.out_final_sat (calc_fout_sat[14]) //|> w
,.out_final_valid (calc_fout_vld[14]) //|> w
,.out_partial_data (calc_pout_14_sum) //|> w
,.out_partial_valid (calc_pout_vld[14]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_15 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_15) //|< r
,.in_op (calc_op1_15) //|< r
,.in_op_valid (calc_op1_vld[15]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[15]) //|< r
,.out_final_data (calc_fout_15_sum) //|> w
,.out_final_sat (calc_fout_sat[15]) //|> w
,.out_final_valid (calc_fout_vld[15]) //|> w
,.out_partial_data (calc_pout_15_sum) //|> w
,.out_partial_valid (calc_pout_vld[15]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_16 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_16) //|< r
,.in_op (calc_op1_16) //|< r
,.in_op_valid (calc_op1_vld[16]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[16]) //|< r
,.out_final_data (calc_fout_16_sum) //|> w
,.out_final_sat (calc_fout_sat[16]) //|> w
,.out_final_valid (calc_fout_vld[16]) //|> w
,.out_partial_data (calc_pout_16_sum) //|> w
,.out_partial_valid (calc_pout_vld[16]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_17 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_17) //|< r
,.in_op (calc_op1_17) //|< r
,.in_op_valid (calc_op1_vld[17]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[17]) //|< r
,.out_final_data (calc_fout_17_sum) //|> w
,.out_final_sat (calc_fout_sat[17]) //|> w
,.out_final_valid (calc_fout_vld[17]) //|> w
,.out_partial_data (calc_pout_17_sum) //|> w
,.out_partial_valid (calc_pout_vld[17]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_18 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_18) //|< r
,.in_op (calc_op1_18) //|< r
,.in_op_valid (calc_op1_vld[18]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[18]) //|< r
,.out_final_data (calc_fout_18_sum) //|> w
,.out_final_sat (calc_fout_sat[18]) //|> w
,.out_final_valid (calc_fout_vld[18]) //|> w
,.out_partial_data (calc_pout_18_sum) //|> w
,.out_partial_valid (calc_pout_vld[18]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_19 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_19) //|< r
,.in_op (calc_op1_19) //|< r
,.in_op_valid (calc_op1_vld[19]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[19]) //|< r
,.out_final_data (calc_fout_19_sum) //|> w
,.out_final_sat (calc_fout_sat[19]) //|> w
,.out_final_valid (calc_fout_vld[19]) //|> w
,.out_partial_data (calc_pout_19_sum) //|> w
,.out_partial_valid (calc_pout_vld[19]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_20 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_20) //|< r
,.in_op (calc_op1_20) //|< r
,.in_op_valid (calc_op1_vld[20]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[20]) //|< r
,.out_final_data (calc_fout_20_sum) //|> w
,.out_final_sat (calc_fout_sat[20]) //|> w
,.out_final_valid (calc_fout_vld[20]) //|> w
,.out_partial_data (calc_pout_20_sum) //|> w
,.out_partial_valid (calc_pout_vld[20]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_21 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_21) //|< r
,.in_op (calc_op1_21) //|< r
,.in_op_valid (calc_op1_vld[21]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[21]) //|< r
,.out_final_data (calc_fout_21_sum) //|> w
,.out_final_sat (calc_fout_sat[21]) //|> w
,.out_final_valid (calc_fout_vld[21]) //|> w
,.out_partial_data (calc_pout_21_sum) //|> w
,.out_partial_valid (calc_pout_vld[21]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_22 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_22) //|< r
,.in_op (calc_op1_22) //|< r
,.in_op_valid (calc_op1_vld[22]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[22]) //|< r
,.out_final_data (calc_fout_22_sum) //|> w
,.out_final_sat (calc_fout_sat[22]) //|> w
,.out_final_valid (calc_fout_vld[22]) //|> w
,.out_partial_data (calc_pout_22_sum) //|> w
,.out_partial_valid (calc_pout_vld[22]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_23 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_23) //|< r
,.in_op (calc_op1_23) //|< r
,.in_op_valid (calc_op1_vld[23]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[23]) //|< r
,.out_final_data (calc_fout_23_sum) //|> w
,.out_final_sat (calc_fout_sat[23]) //|> w
,.out_final_valid (calc_fout_vld[23]) //|> w
,.out_partial_data (calc_pout_23_sum) //|> w
,.out_partial_valid (calc_pout_vld[23]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_24 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_24) //|< r
,.in_op (calc_op1_24) //|< r
,.in_op_valid (calc_op1_vld[24]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[24]) //|< r
,.out_final_data (calc_fout_24_sum) //|> w
,.out_final_sat (calc_fout_sat[24]) //|> w
,.out_final_valid (calc_fout_vld[24]) //|> w
,.out_partial_data (calc_pout_24_sum) //|> w
,.out_partial_valid (calc_pout_vld[24]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_25 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_25) //|< r
,.in_op (calc_op1_25) //|< r
,.in_op_valid (calc_op1_vld[25]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[25]) //|< r
,.out_final_data (calc_fout_25_sum) //|> w
,.out_final_sat (calc_fout_sat[25]) //|> w
,.out_final_valid (calc_fout_vld[25]) //|> w
,.out_partial_data (calc_pout_25_sum) //|> w
,.out_partial_valid (calc_pout_vld[25]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_26 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_26) //|< r
,.in_op (calc_op1_26) //|< r
,.in_op_valid (calc_op1_vld[26]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[26]) //|< r
,.out_final_data (calc_fout_26_sum) //|> w
,.out_final_sat (calc_fout_sat[26]) //|> w
,.out_final_valid (calc_fout_vld[26]) //|> w
,.out_partial_data (calc_pout_26_sum) //|> w
,.out_partial_valid (calc_pout_vld[26]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_27 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_27) //|< r
,.in_op (calc_op1_27) //|< r
,.in_op_valid (calc_op1_vld[27]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[27]) //|< r
,.out_final_data (calc_fout_27_sum) //|> w
,.out_final_sat (calc_fout_sat[27]) //|> w
,.out_final_valid (calc_fout_vld[27]) //|> w
,.out_partial_data (calc_pout_27_sum) //|> w
,.out_partial_valid (calc_pout_vld[27]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_28 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_28) //|< r
,.in_op (calc_op1_28) //|< r
,.in_op_valid (calc_op1_vld[28]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[28]) //|< r
,.out_final_data (calc_fout_28_sum) //|> w
,.out_final_sat (calc_fout_sat[28]) //|> w
,.out_final_valid (calc_fout_vld[28]) //|> w
,.out_partial_data (calc_pout_28_sum) //|> w
,.out_partial_valid (calc_pout_vld[28]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_29 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_29) //|< r
,.in_op (calc_op1_29) //|< r
,.in_op_valid (calc_op1_vld[29]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[29]) //|< r
,.out_final_data (calc_fout_29_sum) //|> w
,.out_final_sat (calc_fout_sat[29]) //|> w
,.out_final_valid (calc_fout_vld[29]) //|> w
,.out_partial_data (calc_pout_29_sum) //|> w
,.out_partial_valid (calc_pout_vld[29]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_30 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_30) //|< r
,.in_op (calc_op1_30) //|< r
,.in_op_valid (calc_op1_vld[30]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[30]) //|< r
,.out_final_data (calc_fout_30_sum) //|> w
,.out_final_sat (calc_fout_sat[30]) //|> w
,.out_final_valid (calc_fout_vld[30]) //|> w
,.out_partial_data (calc_pout_30_sum) //|> w
,.out_partial_valid (calc_pout_vld[30]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

NV_NVDLA_CACC_CALC_int8 u_cell_int8_31 (
.cfg_truncate (cfg_truncate) //|< w
,.in_data (calc_op0_31) //|< r
,.in_op (calc_op1_31) //|< r
,.in_op_valid (calc_op1_vld[31]) //|< r
,.in_sel (calc_dlv_valid) //|< r
,.in_valid (calc_op_en[31]) //|< r
,.out_final_data (calc_fout_31_sum) //|> w
,.out_final_sat (calc_fout_sat[31]) //|> w
,.out_final_valid (calc_fout_vld[31]) //|> w
,.out_partial_data (calc_pout_31_sum) //|> w
,.out_partial_valid (calc_pout_vld[31]) //|> w
,.nvdla_core_clk (nvdla_cell_clk) //|< i
,.nvdla_core_rstn (nvdla_core_rstn) //|< i
);

//| eperl: generated_end (DO NOT EDIT ABOVE)
wire calc_valid_d0 = calc_valid;
wire calc_wr_en_d0 = calc_wr_en;
wire [5:0] calc_addr_d0 = calc_addr;
wire calc_dlv_valid_d0 = calc_dlv_valid;
wire calc_stripe_end_d0 = calc_stripe_end;
wire calc_layer_end_d0 = calc_layer_end;
// Latency pipeline to balance with calc cells, signal for both abuffer & dbuffer
//: my $start = 0;
//: for(my $i = $start; $i < $start + 2; $i ++) {
//: my $j = $i + 1;
//: &eperl::flop(" -q  calc_valid_d${j}  -d \"calc_valid_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop(" -q  calc_wr_en_d${j}  -d  \"calc_wr_en_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop("-wid 6 -q  calc_addr_d${j}  -en \"calc_valid_d${i}\" -d  \"calc_addr_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: }
//: my $pin = $start + 2;
//: print qq(
//: wire calc_valid_out = calc_valid_d${pin};
//: wire calc_wr_en_out = calc_wr_en_d${pin};
//: wire [5:0] calc_addr_out = calc_addr_d${pin};
//: );
//:
//: for(my $i = $start; $i < $start + 2; $i ++) {
//: my $j = $i + 1;
//: &eperl::flop(" -q  calc_dlv_valid_d${j}  -d \"calc_dlv_valid_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop(" -q  calc_stripe_end_d${j}  -en \"calc_dlv_valid_d${i}\" -d  \"calc_stripe_end_d${i}\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop(" -q  calc_layer_end_d${j}  -en \"calc_dlv_valid_d${i}\" -d  \"calc_layer_end_d${i} \" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: }
//: my $fin = $start + 2;
//: print qq(
//: wire calc_dlv_valid_out = calc_dlv_valid_d${fin};
//: wire calc_stripe_end_out = calc_stripe_end_d${fin};
//: wire calc_layer_end_out = calc_layer_end_d${fin};
//: );
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  calc_valid_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_valid_d1 <= 'b0;
   end else begin
       calc_valid_d1 <= calc_valid_d0;
   end
end
reg  calc_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_wr_en_d1 <= 'b0;
   end else begin
       calc_wr_en_d1 <= calc_wr_en_d0;
   end
end
reg [5:0] calc_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_addr_d1 <= 'b0;
   end else begin
       if ((calc_valid_d0) == 1'b1) begin
           calc_addr_d1 <= calc_addr_d0;
       // VCS coverage off
       end else if ((calc_valid_d0) == 1'b0) begin
       end else begin
           calc_addr_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  calc_valid_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_valid_d2 <= 'b0;
   end else begin
       calc_valid_d2 <= calc_valid_d1;
   end
end
reg  calc_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_wr_en_d2 <= 'b0;
   end else begin
       calc_wr_en_d2 <= calc_wr_en_d1;
   end
end
reg [5:0] calc_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_addr_d2 <= 'b0;
   end else begin
       if ((calc_valid_d1) == 1'b1) begin
           calc_addr_d2 <= calc_addr_d1;
       // VCS coverage off
       end else if ((calc_valid_d1) == 1'b0) begin
       end else begin
           calc_addr_d2 <= 'bx;
       // VCS coverage on
       end
   end
end

wire calc_valid_out = calc_valid_d2;
wire calc_wr_en_out = calc_wr_en_d2;
wire [5:0] calc_addr_out = calc_addr_d2;
reg  calc_dlv_valid_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_dlv_valid_d1 <= 'b0;
   end else begin
       calc_dlv_valid_d1 <= calc_dlv_valid_d0;
   end
end
reg  calc_stripe_end_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_stripe_end_d1 <= 'b0;
   end else begin
       if ((calc_dlv_valid_d0) == 1'b1) begin
           calc_stripe_end_d1 <= calc_stripe_end_d0;
       // VCS coverage off
       end else if ((calc_dlv_valid_d0) == 1'b0) begin
       end else begin
           calc_stripe_end_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  calc_layer_end_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_layer_end_d1 <= 'b0;
   end else begin
       if ((calc_dlv_valid_d0) == 1'b1) begin
           calc_layer_end_d1 <= calc_layer_end_d0 ;
       // VCS coverage off
       end else if ((calc_dlv_valid_d0) == 1'b0) begin
       end else begin
           calc_layer_end_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  calc_dlv_valid_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_dlv_valid_d2 <= 'b0;
   end else begin
       calc_dlv_valid_d2 <= calc_dlv_valid_d1;
   end
end
reg  calc_stripe_end_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_stripe_end_d2 <= 'b0;
   end else begin
       if ((calc_dlv_valid_d1) == 1'b1) begin
           calc_stripe_end_d2 <= calc_stripe_end_d1;
       // VCS coverage off
       end else if ((calc_dlv_valid_d1) == 1'b0) begin
       end else begin
           calc_stripe_end_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  calc_layer_end_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       calc_layer_end_d2 <= 'b0;
   end else begin
       if ((calc_dlv_valid_d1) == 1'b1) begin
           calc_layer_end_d2 <= calc_layer_end_d1 ;
       // VCS coverage off
       end else if ((calc_dlv_valid_d1) == 1'b0) begin
       end else begin
           calc_layer_end_d2 <= 'bx;
       // VCS coverage on
       end
   end
end

wire calc_dlv_valid_out = calc_dlv_valid_d2;
wire calc_stripe_end_out = calc_stripe_end_d2;
wire calc_layer_end_out = calc_layer_end_d2;

//| eperl: generated_end (DO NOT EDIT ABOVE)
// Gather of accumulator result
//: my $int8_out = 34;
//: my $final_out = 32;
//: for(my $i=0; $i <32; $i ++) {
//: print qq(
//: wire [${int8_out}-1:0] calc_pout_${i} = ({${int8_out}{calc_pout_vld[${i}]}} & calc_pout_${i}_sum););
//: }
//: for(my $i = 0; $i <32; $i ++) {
//: print qq(
//: wire [${final_out}-1:0] calc_fout_${i} = ({${final_out}{calc_fout_vld[${i}]}} & calc_fout_${i}_sum););
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [34-1:0] calc_pout_0 = ({34{calc_pout_vld[0]}} & calc_pout_0_sum);
wire [34-1:0] calc_pout_1 = ({34{calc_pout_vld[1]}} & calc_pout_1_sum);
wire [34-1:0] calc_pout_2 = ({34{calc_pout_vld[2]}} & calc_pout_2_sum);
wire [34-1:0] calc_pout_3 = ({34{calc_pout_vld[3]}} & calc_pout_3_sum);
wire [34-1:0] calc_pout_4 = ({34{calc_pout_vld[4]}} & calc_pout_4_sum);
wire [34-1:0] calc_pout_5 = ({34{calc_pout_vld[5]}} & calc_pout_5_sum);
wire [34-1:0] calc_pout_6 = ({34{calc_pout_vld[6]}} & calc_pout_6_sum);
wire [34-1:0] calc_pout_7 = ({34{calc_pout_vld[7]}} & calc_pout_7_sum);
wire [34-1:0] calc_pout_8 = ({34{calc_pout_vld[8]}} & calc_pout_8_sum);
wire [34-1:0] calc_pout_9 = ({34{calc_pout_vld[9]}} & calc_pout_9_sum);
wire [34-1:0] calc_pout_10 = ({34{calc_pout_vld[10]}} & calc_pout_10_sum);
wire [34-1:0] calc_pout_11 = ({34{calc_pout_vld[11]}} & calc_pout_11_sum);
wire [34-1:0] calc_pout_12 = ({34{calc_pout_vld[12]}} & calc_pout_12_sum);
wire [34-1:0] calc_pout_13 = ({34{calc_pout_vld[13]}} & calc_pout_13_sum);
wire [34-1:0] calc_pout_14 = ({34{calc_pout_vld[14]}} & calc_pout_14_sum);
wire [34-1:0] calc_pout_15 = ({34{calc_pout_vld[15]}} & calc_pout_15_sum);
wire [34-1:0] calc_pout_16 = ({34{calc_pout_vld[16]}} & calc_pout_16_sum);
wire [34-1:0] calc_pout_17 = ({34{calc_pout_vld[17]}} & calc_pout_17_sum);
wire [34-1:0] calc_pout_18 = ({34{calc_pout_vld[18]}} & calc_pout_18_sum);
wire [34-1:0] calc_pout_19 = ({34{calc_pout_vld[19]}} & calc_pout_19_sum);
wire [34-1:0] calc_pout_20 = ({34{calc_pout_vld[20]}} & calc_pout_20_sum);
wire [34-1:0] calc_pout_21 = ({34{calc_pout_vld[21]}} & calc_pout_21_sum);
wire [34-1:0] calc_pout_22 = ({34{calc_pout_vld[22]}} & calc_pout_22_sum);
wire [34-1:0] calc_pout_23 = ({34{calc_pout_vld[23]}} & calc_pout_23_sum);
wire [34-1:0] calc_pout_24 = ({34{calc_pout_vld[24]}} & calc_pout_24_sum);
wire [34-1:0] calc_pout_25 = ({34{calc_pout_vld[25]}} & calc_pout_25_sum);
wire [34-1:0] calc_pout_26 = ({34{calc_pout_vld[26]}} & calc_pout_26_sum);
wire [34-1:0] calc_pout_27 = ({34{calc_pout_vld[27]}} & calc_pout_27_sum);
wire [34-1:0] calc_pout_28 = ({34{calc_pout_vld[28]}} & calc_pout_28_sum);
wire [34-1:0] calc_pout_29 = ({34{calc_pout_vld[29]}} & calc_pout_29_sum);
wire [34-1:0] calc_pout_30 = ({34{calc_pout_vld[30]}} & calc_pout_30_sum);
wire [34-1:0] calc_pout_31 = ({34{calc_pout_vld[31]}} & calc_pout_31_sum);
wire [32-1:0] calc_fout_0 = ({32{calc_fout_vld[0]}} & calc_fout_0_sum);
wire [32-1:0] calc_fout_1 = ({32{calc_fout_vld[1]}} & calc_fout_1_sum);
wire [32-1:0] calc_fout_2 = ({32{calc_fout_vld[2]}} & calc_fout_2_sum);
wire [32-1:0] calc_fout_3 = ({32{calc_fout_vld[3]}} & calc_fout_3_sum);
wire [32-1:0] calc_fout_4 = ({32{calc_fout_vld[4]}} & calc_fout_4_sum);
wire [32-1:0] calc_fout_5 = ({32{calc_fout_vld[5]}} & calc_fout_5_sum);
wire [32-1:0] calc_fout_6 = ({32{calc_fout_vld[6]}} & calc_fout_6_sum);
wire [32-1:0] calc_fout_7 = ({32{calc_fout_vld[7]}} & calc_fout_7_sum);
wire [32-1:0] calc_fout_8 = ({32{calc_fout_vld[8]}} & calc_fout_8_sum);
wire [32-1:0] calc_fout_9 = ({32{calc_fout_vld[9]}} & calc_fout_9_sum);
wire [32-1:0] calc_fout_10 = ({32{calc_fout_vld[10]}} & calc_fout_10_sum);
wire [32-1:0] calc_fout_11 = ({32{calc_fout_vld[11]}} & calc_fout_11_sum);
wire [32-1:0] calc_fout_12 = ({32{calc_fout_vld[12]}} & calc_fout_12_sum);
wire [32-1:0] calc_fout_13 = ({32{calc_fout_vld[13]}} & calc_fout_13_sum);
wire [32-1:0] calc_fout_14 = ({32{calc_fout_vld[14]}} & calc_fout_14_sum);
wire [32-1:0] calc_fout_15 = ({32{calc_fout_vld[15]}} & calc_fout_15_sum);
wire [32-1:0] calc_fout_16 = ({32{calc_fout_vld[16]}} & calc_fout_16_sum);
wire [32-1:0] calc_fout_17 = ({32{calc_fout_vld[17]}} & calc_fout_17_sum);
wire [32-1:0] calc_fout_18 = ({32{calc_fout_vld[18]}} & calc_fout_18_sum);
wire [32-1:0] calc_fout_19 = ({32{calc_fout_vld[19]}} & calc_fout_19_sum);
wire [32-1:0] calc_fout_20 = ({32{calc_fout_vld[20]}} & calc_fout_20_sum);
wire [32-1:0] calc_fout_21 = ({32{calc_fout_vld[21]}} & calc_fout_21_sum);
wire [32-1:0] calc_fout_22 = ({32{calc_fout_vld[22]}} & calc_fout_22_sum);
wire [32-1:0] calc_fout_23 = ({32{calc_fout_vld[23]}} & calc_fout_23_sum);
wire [32-1:0] calc_fout_24 = ({32{calc_fout_vld[24]}} & calc_fout_24_sum);
wire [32-1:0] calc_fout_25 = ({32{calc_fout_vld[25]}} & calc_fout_25_sum);
wire [32-1:0] calc_fout_26 = ({32{calc_fout_vld[26]}} & calc_fout_26_sum);
wire [32-1:0] calc_fout_27 = ({32{calc_fout_vld[27]}} & calc_fout_27_sum);
wire [32-1:0] calc_fout_28 = ({32{calc_fout_vld[28]}} & calc_fout_28_sum);
wire [32-1:0] calc_fout_29 = ({32{calc_fout_vld[29]}} & calc_fout_29_sum);
wire [32-1:0] calc_fout_30 = ({32{calc_fout_vld[30]}} & calc_fout_30_sum);
wire [32-1:0] calc_fout_31 = ({32{calc_fout_vld[31]}} & calc_fout_31_sum);
//| eperl: generated_end (DO NOT EDIT ABOVE)
// to abuffer, 1 pipe
wire [34*32 -1:0] abuf_wr_data_w;
// spyglass disable_block STARC05-3.3.1.4b
//: my $kk=34*32;
//: my $jj=5 +1;
//: for(my $i = 0; $i < 32; $i ++) {
//: print qq (
//: assign abuf_wr_data_w[34*($i+1)-1:34*$i] = calc_pout_${i}; );
//: }
//: &eperl::flop(" -q  abuf_wr_en  -d \"calc_wr_en_out\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop("-wid ${jj} -q  abuf_wr_addr  -en \"calc_wr_en_out\" -d  \"calc_addr_out[${jj}-1:0]\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop("-wid ${kk} -q  abuf_wr_data  -en \"calc_wr_en_out\" -d  \"abuf_wr_data_w\" -clk nvdla_core_clk -norst");
//| eperl: generated_beg (DO NOT EDIT BELOW)

assign abuf_wr_data_w[34*(0+1)-1:34*0] = calc_pout_0; 
assign abuf_wr_data_w[34*(1+1)-1:34*1] = calc_pout_1; 
assign abuf_wr_data_w[34*(2+1)-1:34*2] = calc_pout_2; 
assign abuf_wr_data_w[34*(3+1)-1:34*3] = calc_pout_3; 
assign abuf_wr_data_w[34*(4+1)-1:34*4] = calc_pout_4; 
assign abuf_wr_data_w[34*(5+1)-1:34*5] = calc_pout_5; 
assign abuf_wr_data_w[34*(6+1)-1:34*6] = calc_pout_6; 
assign abuf_wr_data_w[34*(7+1)-1:34*7] = calc_pout_7; 
assign abuf_wr_data_w[34*(8+1)-1:34*8] = calc_pout_8; 
assign abuf_wr_data_w[34*(9+1)-1:34*9] = calc_pout_9; 
assign abuf_wr_data_w[34*(10+1)-1:34*10] = calc_pout_10; 
assign abuf_wr_data_w[34*(11+1)-1:34*11] = calc_pout_11; 
assign abuf_wr_data_w[34*(12+1)-1:34*12] = calc_pout_12; 
assign abuf_wr_data_w[34*(13+1)-1:34*13] = calc_pout_13; 
assign abuf_wr_data_w[34*(14+1)-1:34*14] = calc_pout_14; 
assign abuf_wr_data_w[34*(15+1)-1:34*15] = calc_pout_15; 
assign abuf_wr_data_w[34*(16+1)-1:34*16] = calc_pout_16; 
assign abuf_wr_data_w[34*(17+1)-1:34*17] = calc_pout_17; 
assign abuf_wr_data_w[34*(18+1)-1:34*18] = calc_pout_18; 
assign abuf_wr_data_w[34*(19+1)-1:34*19] = calc_pout_19; 
assign abuf_wr_data_w[34*(20+1)-1:34*20] = calc_pout_20; 
assign abuf_wr_data_w[34*(21+1)-1:34*21] = calc_pout_21; 
assign abuf_wr_data_w[34*(22+1)-1:34*22] = calc_pout_22; 
assign abuf_wr_data_w[34*(23+1)-1:34*23] = calc_pout_23; 
assign abuf_wr_data_w[34*(24+1)-1:34*24] = calc_pout_24; 
assign abuf_wr_data_w[34*(25+1)-1:34*25] = calc_pout_25; 
assign abuf_wr_data_w[34*(26+1)-1:34*26] = calc_pout_26; 
assign abuf_wr_data_w[34*(27+1)-1:34*27] = calc_pout_27; 
assign abuf_wr_data_w[34*(28+1)-1:34*28] = calc_pout_28; 
assign abuf_wr_data_w[34*(29+1)-1:34*29] = calc_pout_29; 
assign abuf_wr_data_w[34*(30+1)-1:34*30] = calc_pout_30; 
assign abuf_wr_data_w[34*(31+1)-1:34*31] = calc_pout_31; reg  abuf_wr_en;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       abuf_wr_en <= 'b0;
   end else begin
       abuf_wr_en <= calc_wr_en_out;
   end
end
reg [5:0] abuf_wr_addr;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       abuf_wr_addr <= 'b0;
   end else begin
       if ((calc_wr_en_out) == 1'b1) begin
           abuf_wr_addr <= calc_addr_out[6-1:0];
       // VCS coverage off
       end else if ((calc_wr_en_out) == 1'b0) begin
       end else begin
           abuf_wr_addr <= 'bx;
       // VCS coverage on
       end
   end
end
reg [1087:0] abuf_wr_data;
always @(posedge nvdla_core_clk) begin
       if ((calc_wr_en_out) == 1'b1) begin
           abuf_wr_data <= abuf_wr_data_w;
       // VCS coverage off
       end else if ((calc_wr_en_out) == 1'b0) begin
       end else begin
           abuf_wr_data <= 'bx;
       // VCS coverage on
       end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
// spyglass enable_block STARC05-3.3.1.4b
// to dbuffer, 1 pipe.
wire [32*32 -1:0] dlv_data_w;
// spyglass disable_block STARC05-3.3.1.4b
//: my $kk=32*32;
//: for(my $i = 0; $i < 32; $i ++) {
//: print qq(
//: assign dlv_data_w[32*($i+1)-1:32*$i] = calc_fout_${i};);
//: }
//:
//: &eperl::flop("-wid ${kk} -q  dlv_data  -en \"calc_dlv_valid_out\" -d  \"dlv_data_w\" -clk nvdla_core_clk -norst");
//: &eperl::flop(" -q  dlv_valid  -d \"calc_dlv_valid_out\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop(" -q  dlv_mask   -d  \"calc_dlv_valid_out\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop(" -q  dlv_stripe_end  -en \"calc_dlv_valid_out\" -d  \"calc_stripe_end_out\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop(" -q  dlv_layer_end  -en \"calc_dlv_valid_out\" -d  \"calc_layer_end_out\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//| eperl: generated_beg (DO NOT EDIT BELOW)

assign dlv_data_w[32*(0+1)-1:32*0] = calc_fout_0;
assign dlv_data_w[32*(1+1)-1:32*1] = calc_fout_1;
assign dlv_data_w[32*(2+1)-1:32*2] = calc_fout_2;
assign dlv_data_w[32*(3+1)-1:32*3] = calc_fout_3;
assign dlv_data_w[32*(4+1)-1:32*4] = calc_fout_4;
assign dlv_data_w[32*(5+1)-1:32*5] = calc_fout_5;
assign dlv_data_w[32*(6+1)-1:32*6] = calc_fout_6;
assign dlv_data_w[32*(7+1)-1:32*7] = calc_fout_7;
assign dlv_data_w[32*(8+1)-1:32*8] = calc_fout_8;
assign dlv_data_w[32*(9+1)-1:32*9] = calc_fout_9;
assign dlv_data_w[32*(10+1)-1:32*10] = calc_fout_10;
assign dlv_data_w[32*(11+1)-1:32*11] = calc_fout_11;
assign dlv_data_w[32*(12+1)-1:32*12] = calc_fout_12;
assign dlv_data_w[32*(13+1)-1:32*13] = calc_fout_13;
assign dlv_data_w[32*(14+1)-1:32*14] = calc_fout_14;
assign dlv_data_w[32*(15+1)-1:32*15] = calc_fout_15;
assign dlv_data_w[32*(16+1)-1:32*16] = calc_fout_16;
assign dlv_data_w[32*(17+1)-1:32*17] = calc_fout_17;
assign dlv_data_w[32*(18+1)-1:32*18] = calc_fout_18;
assign dlv_data_w[32*(19+1)-1:32*19] = calc_fout_19;
assign dlv_data_w[32*(20+1)-1:32*20] = calc_fout_20;
assign dlv_data_w[32*(21+1)-1:32*21] = calc_fout_21;
assign dlv_data_w[32*(22+1)-1:32*22] = calc_fout_22;
assign dlv_data_w[32*(23+1)-1:32*23] = calc_fout_23;
assign dlv_data_w[32*(24+1)-1:32*24] = calc_fout_24;
assign dlv_data_w[32*(25+1)-1:32*25] = calc_fout_25;
assign dlv_data_w[32*(26+1)-1:32*26] = calc_fout_26;
assign dlv_data_w[32*(27+1)-1:32*27] = calc_fout_27;
assign dlv_data_w[32*(28+1)-1:32*28] = calc_fout_28;
assign dlv_data_w[32*(29+1)-1:32*29] = calc_fout_29;
assign dlv_data_w[32*(30+1)-1:32*30] = calc_fout_30;
assign dlv_data_w[32*(31+1)-1:32*31] = calc_fout_31;reg [1023:0] dlv_data;
always @(posedge nvdla_core_clk) begin
       if ((calc_dlv_valid_out) == 1'b1) begin
           dlv_data <= dlv_data_w;
       // VCS coverage off
       end else if ((calc_dlv_valid_out) == 1'b0) begin
       end else begin
           dlv_data <= 'bx;
       // VCS coverage on
       end
end
reg  dlv_valid;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_valid <= 'b0;
   end else begin
       dlv_valid <= calc_dlv_valid_out;
   end
end
reg  dlv_mask;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_mask <= 'b0;
   end else begin
       dlv_mask <= calc_dlv_valid_out;
   end
end
reg  dlv_stripe_end;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_stripe_end <= 'b0;
   end else begin
       if ((calc_dlv_valid_out) == 1'b1) begin
           dlv_stripe_end <= calc_stripe_end_out;
       // VCS coverage off
       end else if ((calc_dlv_valid_out) == 1'b0) begin
       end else begin
           dlv_stripe_end <= 'bx;
       // VCS coverage on
       end
   end
end
reg  dlv_layer_end;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_layer_end <= 'b0;
   end else begin
       if ((calc_dlv_valid_out) == 1'b1) begin
           dlv_layer_end <= calc_layer_end_out;
       // VCS coverage off
       end else if ((calc_dlv_valid_out) == 1'b0) begin
       end else begin
           dlv_layer_end <= 'bx;
       // VCS coverage on
       end
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
// spyglass enable_block STARC05-3.3.1.4b
assign dlv_pd[0] = dlv_stripe_end ;
assign dlv_pd[1] = dlv_layer_end ;
// overflow count
reg dlv_sat_end_d1;
wire [32 -1:0] dlv_sat_bit = calc_fout_sat;
wire dlv_sat_end = calc_layer_end_out & calc_stripe_end_out;
wire dlv_sat_clr = calc_dlv_valid_out & ~dlv_sat_end & dlv_sat_end_d1;
//: my $kk= 32;
//: my $jj= 5;
//: &eperl::flop(" -q  dlv_sat_vld_d1  -d \"calc_dlv_valid_out\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop("-nodeclare  -q  dlv_sat_end_d1  -en \"calc_dlv_valid_out\" -d  \"dlv_sat_end\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 1");
//: &eperl::flop(" -wid ${kk} -q  dlv_sat_bit_d1  -en \"calc_dlv_valid_out\" -d  \"dlv_sat_bit\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: &eperl::flop(" -q  dlv_sat_clr_d1  -d \"dlv_sat_clr\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//: print "wire [${jj}-1:0] sat_sum = ";
//: for(my $i=0; $i<32 -1 ; $i++){
//: print "dlv_sat_bit_d1[${i}]+";
//: }
//: my $i=32 -1;
//: print "dlv_sat_bit_d1[${i}]; \n";
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  dlv_sat_vld_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_sat_vld_d1 <= 'b0;
   end else begin
       dlv_sat_vld_d1 <= calc_dlv_valid_out;
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_sat_end_d1 <= 1;
   end else begin
       if ((calc_dlv_valid_out) == 1'b1) begin
           dlv_sat_end_d1 <= dlv_sat_end;
       // VCS coverage off
       end else if ((calc_dlv_valid_out) == 1'b0) begin
       end else begin
           dlv_sat_end_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [31:0] dlv_sat_bit_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_sat_bit_d1 <= 'b0;
   end else begin
       if ((calc_dlv_valid_out) == 1'b1) begin
           dlv_sat_bit_d1 <= dlv_sat_bit;
       // VCS coverage off
       end else if ((calc_dlv_valid_out) == 1'b0) begin
       end else begin
           dlv_sat_bit_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  dlv_sat_clr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       dlv_sat_clr_d1 <= 'b0;
   end else begin
       dlv_sat_clr_d1 <= dlv_sat_clr;
   end
end
wire [5-1:0] sat_sum = dlv_sat_bit_d1[0]+dlv_sat_bit_d1[1]+dlv_sat_bit_d1[2]+dlv_sat_bit_d1[3]+dlv_sat_bit_d1[4]+dlv_sat_bit_d1[5]+dlv_sat_bit_d1[6]+dlv_sat_bit_d1[7]+dlv_sat_bit_d1[8]+dlv_sat_bit_d1[9]+dlv_sat_bit_d1[10]+dlv_sat_bit_d1[11]+dlv_sat_bit_d1[12]+dlv_sat_bit_d1[13]+dlv_sat_bit_d1[14]+dlv_sat_bit_d1[15]+dlv_sat_bit_d1[16]+dlv_sat_bit_d1[17]+dlv_sat_bit_d1[18]+dlv_sat_bit_d1[19]+dlv_sat_bit_d1[20]+dlv_sat_bit_d1[21]+dlv_sat_bit_d1[22]+dlv_sat_bit_d1[23]+dlv_sat_bit_d1[24]+dlv_sat_bit_d1[25]+dlv_sat_bit_d1[26]+dlv_sat_bit_d1[27]+dlv_sat_bit_d1[28]+dlv_sat_bit_d1[29]+dlv_sat_bit_d1[30]+dlv_sat_bit_d1[31]; 

//| eperl: generated_end (DO NOT EDIT ABOVE)
wire [31:0] sat_count_inc;
reg [31:0] sat_count;
wire sat_carry;
wire [31:0] sat_count_w;
wire sat_reg_en;
assign {sat_carry, sat_count_inc[31:0]} = sat_count + sat_sum;
assign sat_count_w = (dlv_sat_clr_d1) ? {24'b0, sat_sum} : sat_carry ? {32{1'b1}} : sat_count_inc;
assign sat_reg_en = dlv_sat_vld_d1 & ((|sat_sum) | dlv_sat_clr_d1);
//: &eperl::flop("-nodeclare -q  sat_count  -en \"sat_reg_en\" -d  \"sat_count_w\" -clk nvdla_core_clk -rst nvdla_core_rstn -rval 0");
//| eperl: generated_beg (DO NOT EDIT BELOW)
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sat_count <= 'b0;
   end else begin
       if ((sat_reg_en) == 1'b1) begin
           sat_count <= sat_count_w;
       // VCS coverage off
       end else if ((sat_reg_en) == 1'b0) begin
       end else begin
           sat_count <= 'bx;
       // VCS coverage on
       end
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
// spyglass enable_block NoWidthInBasedNum-ML
// spyglass enable_block STARC-2.10.1.6
assign dp2reg_sat_count = sat_count;
endmodule
