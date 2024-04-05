// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_cbuf.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CBUF.h
    `define CBUF_BANK_RAM_CASE2
    `define CBUF_NO_SUPPORT_READ_JUMPING
//ram case could be 0/1/2/3/4/5  0:1ram/bank; 1:1*2ram/bank; 2:2*1ram/bank; 3:2*2ram/bank  4:4*1ram/bank  5:4*2ram/bank
`define CDMA2CBUF_DEBUG_PRINT //open debug print
`include "simulate_x_tick.vh"
module NV_NVDLA_cbuf (
   nvdla_core_clk //|< i
  ,nvdla_core_rstn //|< i
//port 0 for data, 1 for weight
//: for(my $i=0; $i<2 ; $i++){
//: print qq(
//: ,cdma2buf_wr_addr${i} //|< i
//: ,cdma2buf_wr_data${i} //|< i
//: ,cdma2buf_wr_en${i} //|< i
//: ,cdma2buf_wr_sel${i} //|< i
//: )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,cdma2buf_wr_addr0 //|< i
,cdma2buf_wr_data0 //|< i
,cdma2buf_wr_en0 //|< i
,cdma2buf_wr_sel0 //|< i

,cdma2buf_wr_addr1 //|< i
,cdma2buf_wr_data1 //|< i
,cdma2buf_wr_en1 //|< i
,cdma2buf_wr_sel1 //|< i

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,pwrbus_ram_pd //|< i
  ,sc2buf_dat_rd_addr //|< i
  ,sc2buf_dat_rd_en //|< i
  ,sc2buf_dat_rd_shift //|< i
  ,sc2buf_dat_rd_next1_en //< i
  ,sc2buf_dat_rd_next1_addr //< i
  ,sc2buf_dat_rd_data //|> o
  ,sc2buf_dat_rd_valid //|> o
  ,sc2buf_wt_rd_addr //|< i
  ,sc2buf_wt_rd_en //|< i
  ,sc2buf_wt_rd_data //|> o
  ,sc2buf_wt_rd_valid //|> o
  `ifdef CBUF_WEIGHT_COMPRESSED
  ,sc2buf_wmb_rd_addr //|< i
  ,sc2buf_wmb_rd_en //|< i
  ,sc2buf_wmb_rd_data //|> o
  ,sc2buf_wmb_rd_valid //|> o
  `endif
  );
input nvdla_core_clk;
input nvdla_core_rstn;
input [31:0] pwrbus_ram_pd;
//: for(my $i=0; $i<2 ; $i++) {
//: print qq(
//: input[13 -1:0] cdma2buf_wr_addr${i}; //|< i
//: input[512/2 -1:0] cdma2buf_wr_data${i}; //|< i
//: input cdma2buf_wr_en${i}; //|< i
//: input[2 -1:0] cdma2buf_wr_sel${i}; //|< i
//: )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

input[13 -1:0] cdma2buf_wr_addr0; //|< i
input[512/2 -1:0] cdma2buf_wr_data0; //|< i
input cdma2buf_wr_en0; //|< i
input[2 -1:0] cdma2buf_wr_sel0; //|< i

input[13 -1:0] cdma2buf_wr_addr1; //|< i
input[512/2 -1:0] cdma2buf_wr_data1; //|< i
input cdma2buf_wr_en1; //|< i
input[2 -1:0] cdma2buf_wr_sel1; //|< i

//| eperl: generated_end (DO NOT EDIT ABOVE)
input sc2buf_dat_rd_en; /* data valid */
input [13 -1:0] sc2buf_dat_rd_addr;
input [10 -1:0] sc2buf_dat_rd_shift; //|< i
input sc2buf_dat_rd_next1_en; //< i
input [13 -1:0] sc2buf_dat_rd_next1_addr; //< i
output sc2buf_dat_rd_valid; /* data valid */
output [512 -1:0] sc2buf_dat_rd_data;
input sc2buf_wt_rd_en; /* data valid */
input [13 -1:0] sc2buf_wt_rd_addr;
output sc2buf_wt_rd_valid; /* data valid */
output [512 -1:0] sc2buf_wt_rd_data;
`ifdef CBUF_WEIGHT_COMPRESSED
input sc2buf_wmb_rd_en; /* data valid */
input [13 -1:0] sc2buf_wmb_rd_addr;
output sc2buf_wmb_rd_valid; /* data valid */
output [512 -1:0] sc2buf_wmb_rd_data;
`endif
`ifndef SYNTHESIS
`ifdef CDMA2CBUF_DEBUG_PRINT
`ifdef VERILATOR
`else
reg cdma2cbuf_data_begin, cdma2cbuf_wt_begin;
integer data_file, wt_file;
initial begin
    assign cdma2cbuf_wt_begin=0;
    assign cdma2cbuf_data_begin=0;
    @(negedge cdma2buf_wr_en1) assign cdma2cbuf_wt_begin=1;
    @(negedge cdma2buf_wr_en0) assign cdma2cbuf_data_begin=1;
    data_file = $fopen("cdma2cbuf_data_rtl.dat");
    wt_file = $fopen("cdma2cbuf_weight_rtl.dat");
    if(cdma2cbuf_data_begin & cdma2cbuf_wt_begin) begin
        forever @(posedge nvdla_core_clk) begin
            if(cdma2buf_wr_en0) begin
                $fwrite(data_file,"%h\n",cdma2buf_wr_data0);
            end
            if (cdma2buf_wr_en1) begin
                $fwrite(wt_file,"%h\n",cdma2buf_wr_data1);
            end
        end
    end
end
`endif
`endif
`endif
//////////step1:write handle
//decode write address to sram
//: my $bank_slice= "12:9"; #address part for select bank
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: my $kmod2 = $k%2;
//: my $kmod4 = $k%4;
//: for(my $i=0; $i<2 ; $i++){
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire bank${j}_ram${k}_wr${i}_en_d0 = cdma2buf_wr_en${i}&&(cdma2buf_wr_addr${i}[${bank_slice}]==${j}) &&(cdma2buf_wr_sel${i}[${k}]==1'b1); );
//: }
//: if(2==1){
//: print qq(
//: wire bank${j}_ram${k}_wr${i}_en_d0 = cdma2buf_wr_en${i}&&(cdma2buf_wr_addr${i}[${bank_slice}]==${j})&&(cdma2buf_wr_addr${i}[0]==${k}); );
//: }
//: if(2==3){
//: print qq(
//: wire bank${j}_ram${k}_wr${i}_en_d0 = cdma2buf_wr_en${i}&&(cdma2buf_wr_addr${i}[${bank_slice}]==${j})&&(cdma2buf_wr_addr${i}[0]==${k})&&(cdma2buf_wr_sel${i}[${kmod2}]==1'b1 ); );
//: }
//: if(2==5){
//: print qq(
//: wire bank${j}_ram${k}_wr${i}_en_d0 = cdma2buf_wr_en${i}&&(cdma2buf_wr_addr${i}[${bank_slice}]==${j})&&(cdma2buf_wr_addr${i}[0]==${k})&&(cdma2buf_wr_sel${i}[${kmod4}]==1'b1 ); );
//: }
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire bank0_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==0) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank0_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==0) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank0_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==0) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank0_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==0) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank1_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==1) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank1_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==1) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank1_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==1) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank1_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==1) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank2_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==2) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank2_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==2) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank2_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==2) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank2_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==2) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank3_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==3) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank3_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==3) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank3_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==3) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank3_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==3) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank4_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==4) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank4_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==4) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank4_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==4) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank4_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==4) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank5_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==5) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank5_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==5) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank5_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==5) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank5_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==5) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank6_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==6) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank6_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==6) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank6_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==6) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank6_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==6) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank7_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==7) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank7_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==7) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank7_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==7) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank7_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==7) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank8_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==8) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank8_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==8) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank8_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==8) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank8_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==8) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank9_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==9) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank9_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==9) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank9_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==9) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank9_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==9) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank10_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==10) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank10_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==10) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank10_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==10) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank10_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==10) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank11_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==11) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank11_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==11) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank11_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==11) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank11_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==11) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank12_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==12) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank12_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==12) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank12_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==12) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank12_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==12) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank13_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==13) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank13_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==13) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank13_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==13) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank13_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==13) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank14_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==14) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank14_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==14) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank14_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==14) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank14_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==14) &&(cdma2buf_wr_sel1[1]==1'b1); 
wire bank15_ram0_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==15) &&(cdma2buf_wr_sel0[0]==1'b1); 
wire bank15_ram0_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==15) &&(cdma2buf_wr_sel1[0]==1'b1); 
wire bank15_ram1_wr0_en_d0 = cdma2buf_wr_en0&&(cdma2buf_wr_addr0[12:9]==15) &&(cdma2buf_wr_sel0[1]==1'b1); 
wire bank15_ram1_wr1_en_d0 = cdma2buf_wr_en1&&(cdma2buf_wr_addr1[12:9]==15) &&(cdma2buf_wr_sel1[1]==1'b1); 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//generate sram write en
//: my $t1="";
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: for(my $i=0; $i<2; $i++){
//: ${t1} .= "bank${j}_ram${k}_wr${i}_en_d0 |";
//: }
//: print "wire bank${j}_ram${k}_wr_en_d0  = ${t1}"."1'b0; \n";
//: $t1="";
//: &eperl::flop("-q bank${j}_ram${k}_wr_en_d1 -d bank${j}_ram${k}_wr_en_d0");
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire bank0_ram0_wr_en_d0  = bank0_ram0_wr0_en_d0 |bank0_ram0_wr1_en_d0 |1'b0; 
reg  bank0_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank0_ram0_wr_en_d1 <= bank0_ram0_wr_en_d0;
   end
end
wire bank0_ram1_wr_en_d0  = bank0_ram1_wr0_en_d0 |bank0_ram1_wr1_en_d0 |1'b0; 
reg  bank0_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank0_ram1_wr_en_d1 <= bank0_ram1_wr_en_d0;
   end
end
wire bank1_ram0_wr_en_d0  = bank1_ram0_wr0_en_d0 |bank1_ram0_wr1_en_d0 |1'b0; 
reg  bank1_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank1_ram0_wr_en_d1 <= bank1_ram0_wr_en_d0;
   end
end
wire bank1_ram1_wr_en_d0  = bank1_ram1_wr0_en_d0 |bank1_ram1_wr1_en_d0 |1'b0; 
reg  bank1_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank1_ram1_wr_en_d1 <= bank1_ram1_wr_en_d0;
   end
end
wire bank2_ram0_wr_en_d0  = bank2_ram0_wr0_en_d0 |bank2_ram0_wr1_en_d0 |1'b0; 
reg  bank2_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank2_ram0_wr_en_d1 <= bank2_ram0_wr_en_d0;
   end
end
wire bank2_ram1_wr_en_d0  = bank2_ram1_wr0_en_d0 |bank2_ram1_wr1_en_d0 |1'b0; 
reg  bank2_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank2_ram1_wr_en_d1 <= bank2_ram1_wr_en_d0;
   end
end
wire bank3_ram0_wr_en_d0  = bank3_ram0_wr0_en_d0 |bank3_ram0_wr1_en_d0 |1'b0; 
reg  bank3_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank3_ram0_wr_en_d1 <= bank3_ram0_wr_en_d0;
   end
end
wire bank3_ram1_wr_en_d0  = bank3_ram1_wr0_en_d0 |bank3_ram1_wr1_en_d0 |1'b0; 
reg  bank3_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank3_ram1_wr_en_d1 <= bank3_ram1_wr_en_d0;
   end
end
wire bank4_ram0_wr_en_d0  = bank4_ram0_wr0_en_d0 |bank4_ram0_wr1_en_d0 |1'b0; 
reg  bank4_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank4_ram0_wr_en_d1 <= bank4_ram0_wr_en_d0;
   end
end
wire bank4_ram1_wr_en_d0  = bank4_ram1_wr0_en_d0 |bank4_ram1_wr1_en_d0 |1'b0; 
reg  bank4_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank4_ram1_wr_en_d1 <= bank4_ram1_wr_en_d0;
   end
end
wire bank5_ram0_wr_en_d0  = bank5_ram0_wr0_en_d0 |bank5_ram0_wr1_en_d0 |1'b0; 
reg  bank5_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank5_ram0_wr_en_d1 <= bank5_ram0_wr_en_d0;
   end
end
wire bank5_ram1_wr_en_d0  = bank5_ram1_wr0_en_d0 |bank5_ram1_wr1_en_d0 |1'b0; 
reg  bank5_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank5_ram1_wr_en_d1 <= bank5_ram1_wr_en_d0;
   end
end
wire bank6_ram0_wr_en_d0  = bank6_ram0_wr0_en_d0 |bank6_ram0_wr1_en_d0 |1'b0; 
reg  bank6_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank6_ram0_wr_en_d1 <= bank6_ram0_wr_en_d0;
   end
end
wire bank6_ram1_wr_en_d0  = bank6_ram1_wr0_en_d0 |bank6_ram1_wr1_en_d0 |1'b0; 
reg  bank6_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank6_ram1_wr_en_d1 <= bank6_ram1_wr_en_d0;
   end
end
wire bank7_ram0_wr_en_d0  = bank7_ram0_wr0_en_d0 |bank7_ram0_wr1_en_d0 |1'b0; 
reg  bank7_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank7_ram0_wr_en_d1 <= bank7_ram0_wr_en_d0;
   end
end
wire bank7_ram1_wr_en_d0  = bank7_ram1_wr0_en_d0 |bank7_ram1_wr1_en_d0 |1'b0; 
reg  bank7_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank7_ram1_wr_en_d1 <= bank7_ram1_wr_en_d0;
   end
end
wire bank8_ram0_wr_en_d0  = bank8_ram0_wr0_en_d0 |bank8_ram0_wr1_en_d0 |1'b0; 
reg  bank8_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank8_ram0_wr_en_d1 <= bank8_ram0_wr_en_d0;
   end
end
wire bank8_ram1_wr_en_d0  = bank8_ram1_wr0_en_d0 |bank8_ram1_wr1_en_d0 |1'b0; 
reg  bank8_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank8_ram1_wr_en_d1 <= bank8_ram1_wr_en_d0;
   end
end
wire bank9_ram0_wr_en_d0  = bank9_ram0_wr0_en_d0 |bank9_ram0_wr1_en_d0 |1'b0; 
reg  bank9_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank9_ram0_wr_en_d1 <= bank9_ram0_wr_en_d0;
   end
end
wire bank9_ram1_wr_en_d0  = bank9_ram1_wr0_en_d0 |bank9_ram1_wr1_en_d0 |1'b0; 
reg  bank9_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank9_ram1_wr_en_d1 <= bank9_ram1_wr_en_d0;
   end
end
wire bank10_ram0_wr_en_d0  = bank10_ram0_wr0_en_d0 |bank10_ram0_wr1_en_d0 |1'b0; 
reg  bank10_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank10_ram0_wr_en_d1 <= bank10_ram0_wr_en_d0;
   end
end
wire bank10_ram1_wr_en_d0  = bank10_ram1_wr0_en_d0 |bank10_ram1_wr1_en_d0 |1'b0; 
reg  bank10_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank10_ram1_wr_en_d1 <= bank10_ram1_wr_en_d0;
   end
end
wire bank11_ram0_wr_en_d0  = bank11_ram0_wr0_en_d0 |bank11_ram0_wr1_en_d0 |1'b0; 
reg  bank11_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank11_ram0_wr_en_d1 <= bank11_ram0_wr_en_d0;
   end
end
wire bank11_ram1_wr_en_d0  = bank11_ram1_wr0_en_d0 |bank11_ram1_wr1_en_d0 |1'b0; 
reg  bank11_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank11_ram1_wr_en_d1 <= bank11_ram1_wr_en_d0;
   end
end
wire bank12_ram0_wr_en_d0  = bank12_ram0_wr0_en_d0 |bank12_ram0_wr1_en_d0 |1'b0; 
reg  bank12_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank12_ram0_wr_en_d1 <= bank12_ram0_wr_en_d0;
   end
end
wire bank12_ram1_wr_en_d0  = bank12_ram1_wr0_en_d0 |bank12_ram1_wr1_en_d0 |1'b0; 
reg  bank12_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank12_ram1_wr_en_d1 <= bank12_ram1_wr_en_d0;
   end
end
wire bank13_ram0_wr_en_d0  = bank13_ram0_wr0_en_d0 |bank13_ram0_wr1_en_d0 |1'b0; 
reg  bank13_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank13_ram0_wr_en_d1 <= bank13_ram0_wr_en_d0;
   end
end
wire bank13_ram1_wr_en_d0  = bank13_ram1_wr0_en_d0 |bank13_ram1_wr1_en_d0 |1'b0; 
reg  bank13_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank13_ram1_wr_en_d1 <= bank13_ram1_wr_en_d0;
   end
end
wire bank14_ram0_wr_en_d0  = bank14_ram0_wr0_en_d0 |bank14_ram0_wr1_en_d0 |1'b0; 
reg  bank14_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank14_ram0_wr_en_d1 <= bank14_ram0_wr_en_d0;
   end
end
wire bank14_ram1_wr_en_d0  = bank14_ram1_wr0_en_d0 |bank14_ram1_wr1_en_d0 |1'b0; 
reg  bank14_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank14_ram1_wr_en_d1 <= bank14_ram1_wr_en_d0;
   end
end
wire bank15_ram0_wr_en_d0  = bank15_ram0_wr0_en_d0 |bank15_ram0_wr1_en_d0 |1'b0; 
reg  bank15_ram0_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_wr_en_d1 <= 'b0;
   end else begin
       bank15_ram0_wr_en_d1 <= bank15_ram0_wr_en_d0;
   end
end
wire bank15_ram1_wr_en_d0  = bank15_ram1_wr0_en_d0 |bank15_ram1_wr1_en_d0 |1'b0; 
reg  bank15_ram1_wr_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_wr_en_d1 <= 'b0;
   end else begin
       bank15_ram1_wr_en_d1 <= bank15_ram1_wr_en_d0;
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
// 1 pipe for timing
//: my $kk=13;
//: my $jj=512/2;
//: for(my $i=0; $i<2 ; $i++){
//: &eperl::flop("-wid ${kk} -q cdma2buf_wr_addr${i}_d1 -d cdma2buf_wr_addr${i}");
//: &eperl::flop("-wid ${jj} -norst -q cdma2buf_wr_data${i}_d1 -d cdma2buf_wr_data${i}");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg [12:0] cdma2buf_wr_addr0_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       cdma2buf_wr_addr0_d1 <= 'b0;
   end else begin
       cdma2buf_wr_addr0_d1 <= cdma2buf_wr_addr0;
   end
end
reg [255:0] cdma2buf_wr_data0_d1;
always @(posedge nvdla_core_clk) begin
       cdma2buf_wr_data0_d1 <= cdma2buf_wr_data0;
end
reg [12:0] cdma2buf_wr_addr1_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       cdma2buf_wr_addr1_d1 <= 'b0;
   end else begin
       cdma2buf_wr_addr1_d1 <= cdma2buf_wr_addr1;
   end
end
reg [255:0] cdma2buf_wr_data1_d1;
always @(posedge nvdla_core_clk) begin
       cdma2buf_wr_data1_d1 <= cdma2buf_wr_data1;
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
//generate bank write en
//: my $t1="";
//: for(my $i=0; $i<2; $i++){
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2; $k++){
//: $t1 .= "bank${j}_ram${k}_wr${i}_en_d0 |";
//: }
//: print "wire bank${j}_wr${i}_en_d0 = ${t1}"."1'b0; \n";
//: &eperl::flop("-q bank${j}_wr${i}_en_d1 -d bank${j}_wr${i}_en_d0");
//: $t1="";
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire bank0_wr0_en_d0 = bank0_ram0_wr0_en_d0 |bank0_ram1_wr0_en_d0 |1'b0; 
reg  bank0_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_wr0_en_d1 <= 'b0;
   end else begin
       bank0_wr0_en_d1 <= bank0_wr0_en_d0;
   end
end
wire bank1_wr0_en_d0 = bank1_ram0_wr0_en_d0 |bank1_ram1_wr0_en_d0 |1'b0; 
reg  bank1_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_wr0_en_d1 <= 'b0;
   end else begin
       bank1_wr0_en_d1 <= bank1_wr0_en_d0;
   end
end
wire bank2_wr0_en_d0 = bank2_ram0_wr0_en_d0 |bank2_ram1_wr0_en_d0 |1'b0; 
reg  bank2_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_wr0_en_d1 <= 'b0;
   end else begin
       bank2_wr0_en_d1 <= bank2_wr0_en_d0;
   end
end
wire bank3_wr0_en_d0 = bank3_ram0_wr0_en_d0 |bank3_ram1_wr0_en_d0 |1'b0; 
reg  bank3_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_wr0_en_d1 <= 'b0;
   end else begin
       bank3_wr0_en_d1 <= bank3_wr0_en_d0;
   end
end
wire bank4_wr0_en_d0 = bank4_ram0_wr0_en_d0 |bank4_ram1_wr0_en_d0 |1'b0; 
reg  bank4_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_wr0_en_d1 <= 'b0;
   end else begin
       bank4_wr0_en_d1 <= bank4_wr0_en_d0;
   end
end
wire bank5_wr0_en_d0 = bank5_ram0_wr0_en_d0 |bank5_ram1_wr0_en_d0 |1'b0; 
reg  bank5_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_wr0_en_d1 <= 'b0;
   end else begin
       bank5_wr0_en_d1 <= bank5_wr0_en_d0;
   end
end
wire bank6_wr0_en_d0 = bank6_ram0_wr0_en_d0 |bank6_ram1_wr0_en_d0 |1'b0; 
reg  bank6_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_wr0_en_d1 <= 'b0;
   end else begin
       bank6_wr0_en_d1 <= bank6_wr0_en_d0;
   end
end
wire bank7_wr0_en_d0 = bank7_ram0_wr0_en_d0 |bank7_ram1_wr0_en_d0 |1'b0; 
reg  bank7_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_wr0_en_d1 <= 'b0;
   end else begin
       bank7_wr0_en_d1 <= bank7_wr0_en_d0;
   end
end
wire bank8_wr0_en_d0 = bank8_ram0_wr0_en_d0 |bank8_ram1_wr0_en_d0 |1'b0; 
reg  bank8_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_wr0_en_d1 <= 'b0;
   end else begin
       bank8_wr0_en_d1 <= bank8_wr0_en_d0;
   end
end
wire bank9_wr0_en_d0 = bank9_ram0_wr0_en_d0 |bank9_ram1_wr0_en_d0 |1'b0; 
reg  bank9_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_wr0_en_d1 <= 'b0;
   end else begin
       bank9_wr0_en_d1 <= bank9_wr0_en_d0;
   end
end
wire bank10_wr0_en_d0 = bank10_ram0_wr0_en_d0 |bank10_ram1_wr0_en_d0 |1'b0; 
reg  bank10_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_wr0_en_d1 <= 'b0;
   end else begin
       bank10_wr0_en_d1 <= bank10_wr0_en_d0;
   end
end
wire bank11_wr0_en_d0 = bank11_ram0_wr0_en_d0 |bank11_ram1_wr0_en_d0 |1'b0; 
reg  bank11_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_wr0_en_d1 <= 'b0;
   end else begin
       bank11_wr0_en_d1 <= bank11_wr0_en_d0;
   end
end
wire bank12_wr0_en_d0 = bank12_ram0_wr0_en_d0 |bank12_ram1_wr0_en_d0 |1'b0; 
reg  bank12_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_wr0_en_d1 <= 'b0;
   end else begin
       bank12_wr0_en_d1 <= bank12_wr0_en_d0;
   end
end
wire bank13_wr0_en_d0 = bank13_ram0_wr0_en_d0 |bank13_ram1_wr0_en_d0 |1'b0; 
reg  bank13_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_wr0_en_d1 <= 'b0;
   end else begin
       bank13_wr0_en_d1 <= bank13_wr0_en_d0;
   end
end
wire bank14_wr0_en_d0 = bank14_ram0_wr0_en_d0 |bank14_ram1_wr0_en_d0 |1'b0; 
reg  bank14_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_wr0_en_d1 <= 'b0;
   end else begin
       bank14_wr0_en_d1 <= bank14_wr0_en_d0;
   end
end
wire bank15_wr0_en_d0 = bank15_ram0_wr0_en_d0 |bank15_ram1_wr0_en_d0 |1'b0; 
reg  bank15_wr0_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_wr0_en_d1 <= 'b0;
   end else begin
       bank15_wr0_en_d1 <= bank15_wr0_en_d0;
   end
end
wire bank0_wr1_en_d0 = bank0_ram0_wr1_en_d0 |bank0_ram1_wr1_en_d0 |1'b0; 
reg  bank0_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_wr1_en_d1 <= 'b0;
   end else begin
       bank0_wr1_en_d1 <= bank0_wr1_en_d0;
   end
end
wire bank1_wr1_en_d0 = bank1_ram0_wr1_en_d0 |bank1_ram1_wr1_en_d0 |1'b0; 
reg  bank1_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_wr1_en_d1 <= 'b0;
   end else begin
       bank1_wr1_en_d1 <= bank1_wr1_en_d0;
   end
end
wire bank2_wr1_en_d0 = bank2_ram0_wr1_en_d0 |bank2_ram1_wr1_en_d0 |1'b0; 
reg  bank2_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_wr1_en_d1 <= 'b0;
   end else begin
       bank2_wr1_en_d1 <= bank2_wr1_en_d0;
   end
end
wire bank3_wr1_en_d0 = bank3_ram0_wr1_en_d0 |bank3_ram1_wr1_en_d0 |1'b0; 
reg  bank3_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_wr1_en_d1 <= 'b0;
   end else begin
       bank3_wr1_en_d1 <= bank3_wr1_en_d0;
   end
end
wire bank4_wr1_en_d0 = bank4_ram0_wr1_en_d0 |bank4_ram1_wr1_en_d0 |1'b0; 
reg  bank4_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_wr1_en_d1 <= 'b0;
   end else begin
       bank4_wr1_en_d1 <= bank4_wr1_en_d0;
   end
end
wire bank5_wr1_en_d0 = bank5_ram0_wr1_en_d0 |bank5_ram1_wr1_en_d0 |1'b0; 
reg  bank5_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_wr1_en_d1 <= 'b0;
   end else begin
       bank5_wr1_en_d1 <= bank5_wr1_en_d0;
   end
end
wire bank6_wr1_en_d0 = bank6_ram0_wr1_en_d0 |bank6_ram1_wr1_en_d0 |1'b0; 
reg  bank6_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_wr1_en_d1 <= 'b0;
   end else begin
       bank6_wr1_en_d1 <= bank6_wr1_en_d0;
   end
end
wire bank7_wr1_en_d0 = bank7_ram0_wr1_en_d0 |bank7_ram1_wr1_en_d0 |1'b0; 
reg  bank7_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_wr1_en_d1 <= 'b0;
   end else begin
       bank7_wr1_en_d1 <= bank7_wr1_en_d0;
   end
end
wire bank8_wr1_en_d0 = bank8_ram0_wr1_en_d0 |bank8_ram1_wr1_en_d0 |1'b0; 
reg  bank8_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_wr1_en_d1 <= 'b0;
   end else begin
       bank8_wr1_en_d1 <= bank8_wr1_en_d0;
   end
end
wire bank9_wr1_en_d0 = bank9_ram0_wr1_en_d0 |bank9_ram1_wr1_en_d0 |1'b0; 
reg  bank9_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_wr1_en_d1 <= 'b0;
   end else begin
       bank9_wr1_en_d1 <= bank9_wr1_en_d0;
   end
end
wire bank10_wr1_en_d0 = bank10_ram0_wr1_en_d0 |bank10_ram1_wr1_en_d0 |1'b0; 
reg  bank10_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_wr1_en_d1 <= 'b0;
   end else begin
       bank10_wr1_en_d1 <= bank10_wr1_en_d0;
   end
end
wire bank11_wr1_en_d0 = bank11_ram0_wr1_en_d0 |bank11_ram1_wr1_en_d0 |1'b0; 
reg  bank11_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_wr1_en_d1 <= 'b0;
   end else begin
       bank11_wr1_en_d1 <= bank11_wr1_en_d0;
   end
end
wire bank12_wr1_en_d0 = bank12_ram0_wr1_en_d0 |bank12_ram1_wr1_en_d0 |1'b0; 
reg  bank12_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_wr1_en_d1 <= 'b0;
   end else begin
       bank12_wr1_en_d1 <= bank12_wr1_en_d0;
   end
end
wire bank13_wr1_en_d0 = bank13_ram0_wr1_en_d0 |bank13_ram1_wr1_en_d0 |1'b0; 
reg  bank13_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_wr1_en_d1 <= 'b0;
   end else begin
       bank13_wr1_en_d1 <= bank13_wr1_en_d0;
   end
end
wire bank14_wr1_en_d0 = bank14_ram0_wr1_en_d0 |bank14_ram1_wr1_en_d0 |1'b0; 
reg  bank14_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_wr1_en_d1 <= 'b0;
   end else begin
       bank14_wr1_en_d1 <= bank14_wr1_en_d0;
   end
end
wire bank15_wr1_en_d0 = bank15_ram0_wr1_en_d0 |bank15_ram1_wr1_en_d0 |1'b0; 
reg  bank15_wr1_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_wr1_en_d1 <= 'b0;
   end else begin
       bank15_wr1_en_d1 <= bank15_wr1_en_d0;
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
//generate bank write addr/data
//: my $t1="";
//: my $d1="";
//: my $kk= 13;
//: my $jj= 512/2;
//: for(my $j=0; $j<16 ; $j++){
//: for(my $i=0; $i<2; $i++){
//: $t1 .="({${kk}{bank${j}_wr${i}_en_d1}}&cdma2buf_wr_addr${i}_d1)|";
//: $d1 .="({${jj}{bank${j}_wr${i}_en_d1}}&cdma2buf_wr_data${i}_d1)|";
//: }
//: my $t2 .="{${kk}{1'b0}}";
//: my $d2 .="{${jj}{1'b0}}";
//: print "wire [${kk}-1:0] bank${j}_wr_addr_d1 = ${t1}${t2}; \n";
//: print "wire [${jj}-1:0] bank${j}_wr_data_d1 = ${d1}${d2}; \n";
//: $t1="";
//: $d1="";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire [13-1:0] bank0_wr_addr_d1 = ({13{bank0_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank0_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank0_wr_data_d1 = ({256{bank0_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank0_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank1_wr_addr_d1 = ({13{bank1_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank1_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank1_wr_data_d1 = ({256{bank1_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank1_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank2_wr_addr_d1 = ({13{bank2_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank2_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank2_wr_data_d1 = ({256{bank2_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank2_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank3_wr_addr_d1 = ({13{bank3_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank3_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank3_wr_data_d1 = ({256{bank3_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank3_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank4_wr_addr_d1 = ({13{bank4_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank4_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank4_wr_data_d1 = ({256{bank4_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank4_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank5_wr_addr_d1 = ({13{bank5_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank5_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank5_wr_data_d1 = ({256{bank5_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank5_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank6_wr_addr_d1 = ({13{bank6_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank6_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank6_wr_data_d1 = ({256{bank6_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank6_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank7_wr_addr_d1 = ({13{bank7_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank7_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank7_wr_data_d1 = ({256{bank7_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank7_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank8_wr_addr_d1 = ({13{bank8_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank8_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank8_wr_data_d1 = ({256{bank8_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank8_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank9_wr_addr_d1 = ({13{bank9_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank9_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank9_wr_data_d1 = ({256{bank9_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank9_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank10_wr_addr_d1 = ({13{bank10_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank10_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank10_wr_data_d1 = ({256{bank10_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank10_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank11_wr_addr_d1 = ({13{bank11_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank11_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank11_wr_data_d1 = ({256{bank11_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank11_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank12_wr_addr_d1 = ({13{bank12_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank12_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank12_wr_data_d1 = ({256{bank12_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank12_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank13_wr_addr_d1 = ({13{bank13_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank13_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank13_wr_data_d1 = ({256{bank13_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank13_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank14_wr_addr_d1 = ({13{bank14_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank14_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank14_wr_data_d1 = ({256{bank14_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank14_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 
wire [13-1:0] bank15_wr_addr_d1 = ({13{bank15_wr0_en_d1}}&cdma2buf_wr_addr0_d1)|({13{bank15_wr1_en_d1}}&cdma2buf_wr_addr1_d1)|{13{1'b0}}; 
wire [256-1:0] bank15_wr_data_d1 = ({256{bank15_wr0_en_d1}}&cdma2buf_wr_data0_d1)|({256{bank15_wr1_en_d1}}&cdma2buf_wr_data1_d1)|{256{1'b0}}; 

//| eperl: generated_end (DO NOT EDIT ABOVE)
//map bank to sram.
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire[9 -1:0] bank${j}_ram${k}_wr_addr_d1 = bank${j}_wr_addr_d1[9 -1:0];
//: wire[512/2 -1:0] bank${j}_ram${k}_wr_data_d1 = bank${j}_wr_data_d1;
//: )
//: }
//: if((2==1)||(2==3)||(2==5)){
//: print qq(
//: wire[9 -1:0] bank${j}_ram${k}_wr_addr_d1 = bank${j}_wr_addr_d1[9:1];
//: wire[512/2 -1:0] bank${j}_ram${k}_wr_data_d1 = bank${j}_wr_data_d1;
//: )
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire[9 -1:0] bank0_ram0_wr_addr_d1 = bank0_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank0_ram0_wr_data_d1 = bank0_wr_data_d1;

wire[9 -1:0] bank0_ram1_wr_addr_d1 = bank0_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank0_ram1_wr_data_d1 = bank0_wr_data_d1;

wire[9 -1:0] bank1_ram0_wr_addr_d1 = bank1_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank1_ram0_wr_data_d1 = bank1_wr_data_d1;

wire[9 -1:0] bank1_ram1_wr_addr_d1 = bank1_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank1_ram1_wr_data_d1 = bank1_wr_data_d1;

wire[9 -1:0] bank2_ram0_wr_addr_d1 = bank2_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank2_ram0_wr_data_d1 = bank2_wr_data_d1;

wire[9 -1:0] bank2_ram1_wr_addr_d1 = bank2_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank2_ram1_wr_data_d1 = bank2_wr_data_d1;

wire[9 -1:0] bank3_ram0_wr_addr_d1 = bank3_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank3_ram0_wr_data_d1 = bank3_wr_data_d1;

wire[9 -1:0] bank3_ram1_wr_addr_d1 = bank3_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank3_ram1_wr_data_d1 = bank3_wr_data_d1;

wire[9 -1:0] bank4_ram0_wr_addr_d1 = bank4_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank4_ram0_wr_data_d1 = bank4_wr_data_d1;

wire[9 -1:0] bank4_ram1_wr_addr_d1 = bank4_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank4_ram1_wr_data_d1 = bank4_wr_data_d1;

wire[9 -1:0] bank5_ram0_wr_addr_d1 = bank5_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank5_ram0_wr_data_d1 = bank5_wr_data_d1;

wire[9 -1:0] bank5_ram1_wr_addr_d1 = bank5_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank5_ram1_wr_data_d1 = bank5_wr_data_d1;

wire[9 -1:0] bank6_ram0_wr_addr_d1 = bank6_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank6_ram0_wr_data_d1 = bank6_wr_data_d1;

wire[9 -1:0] bank6_ram1_wr_addr_d1 = bank6_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank6_ram1_wr_data_d1 = bank6_wr_data_d1;

wire[9 -1:0] bank7_ram0_wr_addr_d1 = bank7_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank7_ram0_wr_data_d1 = bank7_wr_data_d1;

wire[9 -1:0] bank7_ram1_wr_addr_d1 = bank7_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank7_ram1_wr_data_d1 = bank7_wr_data_d1;

wire[9 -1:0] bank8_ram0_wr_addr_d1 = bank8_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank8_ram0_wr_data_d1 = bank8_wr_data_d1;

wire[9 -1:0] bank8_ram1_wr_addr_d1 = bank8_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank8_ram1_wr_data_d1 = bank8_wr_data_d1;

wire[9 -1:0] bank9_ram0_wr_addr_d1 = bank9_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank9_ram0_wr_data_d1 = bank9_wr_data_d1;

wire[9 -1:0] bank9_ram1_wr_addr_d1 = bank9_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank9_ram1_wr_data_d1 = bank9_wr_data_d1;

wire[9 -1:0] bank10_ram0_wr_addr_d1 = bank10_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank10_ram0_wr_data_d1 = bank10_wr_data_d1;

wire[9 -1:0] bank10_ram1_wr_addr_d1 = bank10_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank10_ram1_wr_data_d1 = bank10_wr_data_d1;

wire[9 -1:0] bank11_ram0_wr_addr_d1 = bank11_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank11_ram0_wr_data_d1 = bank11_wr_data_d1;

wire[9 -1:0] bank11_ram1_wr_addr_d1 = bank11_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank11_ram1_wr_data_d1 = bank11_wr_data_d1;

wire[9 -1:0] bank12_ram0_wr_addr_d1 = bank12_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank12_ram0_wr_data_d1 = bank12_wr_data_d1;

wire[9 -1:0] bank12_ram1_wr_addr_d1 = bank12_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank12_ram1_wr_data_d1 = bank12_wr_data_d1;

wire[9 -1:0] bank13_ram0_wr_addr_d1 = bank13_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank13_ram0_wr_data_d1 = bank13_wr_data_d1;

wire[9 -1:0] bank13_ram1_wr_addr_d1 = bank13_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank13_ram1_wr_data_d1 = bank13_wr_data_d1;

wire[9 -1:0] bank14_ram0_wr_addr_d1 = bank14_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank14_ram0_wr_data_d1 = bank14_wr_data_d1;

wire[9 -1:0] bank14_ram1_wr_addr_d1 = bank14_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank14_ram1_wr_data_d1 = bank14_wr_data_d1;

wire[9 -1:0] bank15_ram0_wr_addr_d1 = bank15_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank15_ram0_wr_data_d1 = bank15_wr_data_d1;

wire[9 -1:0] bank15_ram1_wr_addr_d1 = bank15_wr_addr_d1[9 -1:0];
wire[512/2 -1:0] bank15_ram1_wr_data_d1 = bank15_wr_data_d1;

//| eperl: generated_end (DO NOT EDIT ABOVE)
// 1 pipe before write to sram, for timing
//: my $kk=9;
//: my $jj=512/2;
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: &eperl::flop("-q bank${j}_ram${k}_wr_en_d2 -d bank${j}_ram${k}_wr_en_d1");
//: &eperl::flop("-wid ${kk} -q bank${j}_ram${k}_wr_addr_d2 -d bank${j}_ram${k}_wr_addr_d1");
//: &eperl::flop("-wid ${jj} -norst -q bank${j}_ram${k}_wr_data_d2 -d bank${j}_ram${k}_wr_data_d1");
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  bank0_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank0_ram0_wr_en_d2 <= bank0_ram0_wr_en_d1;
   end
end
reg [8:0] bank0_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank0_ram0_wr_addr_d2 <= bank0_ram0_wr_addr_d1;
   end
end
reg [255:0] bank0_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank0_ram0_wr_data_d2 <= bank0_ram0_wr_data_d1;
end
reg  bank0_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank0_ram1_wr_en_d2 <= bank0_ram1_wr_en_d1;
   end
end
reg [8:0] bank0_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank0_ram1_wr_addr_d2 <= bank0_ram1_wr_addr_d1;
   end
end
reg [255:0] bank0_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank0_ram1_wr_data_d2 <= bank0_ram1_wr_data_d1;
end
reg  bank1_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank1_ram0_wr_en_d2 <= bank1_ram0_wr_en_d1;
   end
end
reg [8:0] bank1_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank1_ram0_wr_addr_d2 <= bank1_ram0_wr_addr_d1;
   end
end
reg [255:0] bank1_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank1_ram0_wr_data_d2 <= bank1_ram0_wr_data_d1;
end
reg  bank1_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank1_ram1_wr_en_d2 <= bank1_ram1_wr_en_d1;
   end
end
reg [8:0] bank1_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank1_ram1_wr_addr_d2 <= bank1_ram1_wr_addr_d1;
   end
end
reg [255:0] bank1_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank1_ram1_wr_data_d2 <= bank1_ram1_wr_data_d1;
end
reg  bank2_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank2_ram0_wr_en_d2 <= bank2_ram0_wr_en_d1;
   end
end
reg [8:0] bank2_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank2_ram0_wr_addr_d2 <= bank2_ram0_wr_addr_d1;
   end
end
reg [255:0] bank2_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank2_ram0_wr_data_d2 <= bank2_ram0_wr_data_d1;
end
reg  bank2_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank2_ram1_wr_en_d2 <= bank2_ram1_wr_en_d1;
   end
end
reg [8:0] bank2_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank2_ram1_wr_addr_d2 <= bank2_ram1_wr_addr_d1;
   end
end
reg [255:0] bank2_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank2_ram1_wr_data_d2 <= bank2_ram1_wr_data_d1;
end
reg  bank3_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank3_ram0_wr_en_d2 <= bank3_ram0_wr_en_d1;
   end
end
reg [8:0] bank3_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank3_ram0_wr_addr_d2 <= bank3_ram0_wr_addr_d1;
   end
end
reg [255:0] bank3_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank3_ram0_wr_data_d2 <= bank3_ram0_wr_data_d1;
end
reg  bank3_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank3_ram1_wr_en_d2 <= bank3_ram1_wr_en_d1;
   end
end
reg [8:0] bank3_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank3_ram1_wr_addr_d2 <= bank3_ram1_wr_addr_d1;
   end
end
reg [255:0] bank3_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank3_ram1_wr_data_d2 <= bank3_ram1_wr_data_d1;
end
reg  bank4_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank4_ram0_wr_en_d2 <= bank4_ram0_wr_en_d1;
   end
end
reg [8:0] bank4_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank4_ram0_wr_addr_d2 <= bank4_ram0_wr_addr_d1;
   end
end
reg [255:0] bank4_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank4_ram0_wr_data_d2 <= bank4_ram0_wr_data_d1;
end
reg  bank4_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank4_ram1_wr_en_d2 <= bank4_ram1_wr_en_d1;
   end
end
reg [8:0] bank4_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank4_ram1_wr_addr_d2 <= bank4_ram1_wr_addr_d1;
   end
end
reg [255:0] bank4_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank4_ram1_wr_data_d2 <= bank4_ram1_wr_data_d1;
end
reg  bank5_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank5_ram0_wr_en_d2 <= bank5_ram0_wr_en_d1;
   end
end
reg [8:0] bank5_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank5_ram0_wr_addr_d2 <= bank5_ram0_wr_addr_d1;
   end
end
reg [255:0] bank5_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank5_ram0_wr_data_d2 <= bank5_ram0_wr_data_d1;
end
reg  bank5_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank5_ram1_wr_en_d2 <= bank5_ram1_wr_en_d1;
   end
end
reg [8:0] bank5_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank5_ram1_wr_addr_d2 <= bank5_ram1_wr_addr_d1;
   end
end
reg [255:0] bank5_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank5_ram1_wr_data_d2 <= bank5_ram1_wr_data_d1;
end
reg  bank6_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank6_ram0_wr_en_d2 <= bank6_ram0_wr_en_d1;
   end
end
reg [8:0] bank6_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank6_ram0_wr_addr_d2 <= bank6_ram0_wr_addr_d1;
   end
end
reg [255:0] bank6_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank6_ram0_wr_data_d2 <= bank6_ram0_wr_data_d1;
end
reg  bank6_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank6_ram1_wr_en_d2 <= bank6_ram1_wr_en_d1;
   end
end
reg [8:0] bank6_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank6_ram1_wr_addr_d2 <= bank6_ram1_wr_addr_d1;
   end
end
reg [255:0] bank6_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank6_ram1_wr_data_d2 <= bank6_ram1_wr_data_d1;
end
reg  bank7_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank7_ram0_wr_en_d2 <= bank7_ram0_wr_en_d1;
   end
end
reg [8:0] bank7_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank7_ram0_wr_addr_d2 <= bank7_ram0_wr_addr_d1;
   end
end
reg [255:0] bank7_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank7_ram0_wr_data_d2 <= bank7_ram0_wr_data_d1;
end
reg  bank7_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank7_ram1_wr_en_d2 <= bank7_ram1_wr_en_d1;
   end
end
reg [8:0] bank7_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank7_ram1_wr_addr_d2 <= bank7_ram1_wr_addr_d1;
   end
end
reg [255:0] bank7_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank7_ram1_wr_data_d2 <= bank7_ram1_wr_data_d1;
end
reg  bank8_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank8_ram0_wr_en_d2 <= bank8_ram0_wr_en_d1;
   end
end
reg [8:0] bank8_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank8_ram0_wr_addr_d2 <= bank8_ram0_wr_addr_d1;
   end
end
reg [255:0] bank8_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank8_ram0_wr_data_d2 <= bank8_ram0_wr_data_d1;
end
reg  bank8_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank8_ram1_wr_en_d2 <= bank8_ram1_wr_en_d1;
   end
end
reg [8:0] bank8_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank8_ram1_wr_addr_d2 <= bank8_ram1_wr_addr_d1;
   end
end
reg [255:0] bank8_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank8_ram1_wr_data_d2 <= bank8_ram1_wr_data_d1;
end
reg  bank9_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank9_ram0_wr_en_d2 <= bank9_ram0_wr_en_d1;
   end
end
reg [8:0] bank9_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank9_ram0_wr_addr_d2 <= bank9_ram0_wr_addr_d1;
   end
end
reg [255:0] bank9_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank9_ram0_wr_data_d2 <= bank9_ram0_wr_data_d1;
end
reg  bank9_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank9_ram1_wr_en_d2 <= bank9_ram1_wr_en_d1;
   end
end
reg [8:0] bank9_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank9_ram1_wr_addr_d2 <= bank9_ram1_wr_addr_d1;
   end
end
reg [255:0] bank9_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank9_ram1_wr_data_d2 <= bank9_ram1_wr_data_d1;
end
reg  bank10_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank10_ram0_wr_en_d2 <= bank10_ram0_wr_en_d1;
   end
end
reg [8:0] bank10_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank10_ram0_wr_addr_d2 <= bank10_ram0_wr_addr_d1;
   end
end
reg [255:0] bank10_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank10_ram0_wr_data_d2 <= bank10_ram0_wr_data_d1;
end
reg  bank10_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank10_ram1_wr_en_d2 <= bank10_ram1_wr_en_d1;
   end
end
reg [8:0] bank10_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank10_ram1_wr_addr_d2 <= bank10_ram1_wr_addr_d1;
   end
end
reg [255:0] bank10_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank10_ram1_wr_data_d2 <= bank10_ram1_wr_data_d1;
end
reg  bank11_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank11_ram0_wr_en_d2 <= bank11_ram0_wr_en_d1;
   end
end
reg [8:0] bank11_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank11_ram0_wr_addr_d2 <= bank11_ram0_wr_addr_d1;
   end
end
reg [255:0] bank11_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank11_ram0_wr_data_d2 <= bank11_ram0_wr_data_d1;
end
reg  bank11_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank11_ram1_wr_en_d2 <= bank11_ram1_wr_en_d1;
   end
end
reg [8:0] bank11_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank11_ram1_wr_addr_d2 <= bank11_ram1_wr_addr_d1;
   end
end
reg [255:0] bank11_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank11_ram1_wr_data_d2 <= bank11_ram1_wr_data_d1;
end
reg  bank12_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank12_ram0_wr_en_d2 <= bank12_ram0_wr_en_d1;
   end
end
reg [8:0] bank12_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank12_ram0_wr_addr_d2 <= bank12_ram0_wr_addr_d1;
   end
end
reg [255:0] bank12_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank12_ram0_wr_data_d2 <= bank12_ram0_wr_data_d1;
end
reg  bank12_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank12_ram1_wr_en_d2 <= bank12_ram1_wr_en_d1;
   end
end
reg [8:0] bank12_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank12_ram1_wr_addr_d2 <= bank12_ram1_wr_addr_d1;
   end
end
reg [255:0] bank12_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank12_ram1_wr_data_d2 <= bank12_ram1_wr_data_d1;
end
reg  bank13_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank13_ram0_wr_en_d2 <= bank13_ram0_wr_en_d1;
   end
end
reg [8:0] bank13_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank13_ram0_wr_addr_d2 <= bank13_ram0_wr_addr_d1;
   end
end
reg [255:0] bank13_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank13_ram0_wr_data_d2 <= bank13_ram0_wr_data_d1;
end
reg  bank13_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank13_ram1_wr_en_d2 <= bank13_ram1_wr_en_d1;
   end
end
reg [8:0] bank13_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank13_ram1_wr_addr_d2 <= bank13_ram1_wr_addr_d1;
   end
end
reg [255:0] bank13_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank13_ram1_wr_data_d2 <= bank13_ram1_wr_data_d1;
end
reg  bank14_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank14_ram0_wr_en_d2 <= bank14_ram0_wr_en_d1;
   end
end
reg [8:0] bank14_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank14_ram0_wr_addr_d2 <= bank14_ram0_wr_addr_d1;
   end
end
reg [255:0] bank14_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank14_ram0_wr_data_d2 <= bank14_ram0_wr_data_d1;
end
reg  bank14_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank14_ram1_wr_en_d2 <= bank14_ram1_wr_en_d1;
   end
end
reg [8:0] bank14_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank14_ram1_wr_addr_d2 <= bank14_ram1_wr_addr_d1;
   end
end
reg [255:0] bank14_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank14_ram1_wr_data_d2 <= bank14_ram1_wr_data_d1;
end
reg  bank15_ram0_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_wr_en_d2 <= 'b0;
   end else begin
       bank15_ram0_wr_en_d2 <= bank15_ram0_wr_en_d1;
   end
end
reg [8:0] bank15_ram0_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_wr_addr_d2 <= 'b0;
   end else begin
       bank15_ram0_wr_addr_d2 <= bank15_ram0_wr_addr_d1;
   end
end
reg [255:0] bank15_ram0_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank15_ram0_wr_data_d2 <= bank15_ram0_wr_data_d1;
end
reg  bank15_ram1_wr_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_wr_en_d2 <= 'b0;
   end else begin
       bank15_ram1_wr_en_d2 <= bank15_ram1_wr_en_d1;
   end
end
reg [8:0] bank15_ram1_wr_addr_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_wr_addr_d2 <= 'b0;
   end else begin
       bank15_ram1_wr_addr_d2 <= bank15_ram1_wr_addr_d1;
   end
end
reg [255:0] bank15_ram1_wr_data_d2;
always @(posedge nvdla_core_clk) begin
       bank15_ram1_wr_data_d2 <= bank15_ram1_wr_data_d1;
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
//////////////////////step2: read data handle
//decode read data address to sram.
wire sc2buf_dat_rd_en0 = sc2buf_dat_rd_en;
wire sc2buf_dat_rd_en1 = sc2buf_dat_rd_en & sc2buf_dat_rd_next1_en;
wire[13 -1:0] sc2buf_dat_rd_addr0 = sc2buf_dat_rd_addr;
wire[13 -1:0] sc2buf_dat_rd_addr1 = sc2buf_dat_rd_next1_addr;
//: my $bank_slice= "12:9"; #address part for select bank
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: my $kdiv2 = int($k/2);
//: my $kdiv4 = int($k/4);
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire bank${j}_ram${k}_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[${bank_slice}]==${j}); );
//: }
//: for(my $i=0; $i<2; $i++){
//: if(2==1){
//: print qq(
//: wire bank${j}_ram${k}_data_rd${i}_en = sc2buf_dat_rd_en${i}&&(sc2buf_dat_rd_addr${i}[${bank_slice}]==${j})&&(sc2buf_dat_rd_addr${i}[0]==${k}); );
//: }
//: if(2==3){
//: print qq(
//: wire bank${j}_ram${k}_data_rd${i}_en = sc2buf_dat_rd_en${i}&&(sc2buf_dat_rd_addr${i}[${bank_slice}]==${j})&&(sc2buf_dat_rd_addr${i}[0]==${kdiv2}); );
//: }
//: if(2==5){
//: print qq(
//: wire bank${j}_ram${k}_data_rd${i}_en = sc2buf_dat_rd_en${i}&&(sc2buf_dat_rd_addr${i}[${bank_slice}]==${j})&&(sc2buf_dat_rd_addr${i}[0]==${kdiv4}); );
//: }
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire bank0_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==0); 
wire bank0_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==0); 
wire bank1_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==1); 
wire bank1_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==1); 
wire bank2_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==2); 
wire bank2_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==2); 
wire bank3_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==3); 
wire bank3_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==3); 
wire bank4_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==4); 
wire bank4_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==4); 
wire bank5_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==5); 
wire bank5_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==5); 
wire bank6_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==6); 
wire bank6_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==6); 
wire bank7_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==7); 
wire bank7_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==7); 
wire bank8_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==8); 
wire bank8_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==8); 
wire bank9_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==9); 
wire bank9_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==9); 
wire bank10_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==10); 
wire bank10_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==10); 
wire bank11_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==11); 
wire bank11_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==11); 
wire bank12_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==12); 
wire bank12_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==12); 
wire bank13_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==13); 
wire bank13_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==13); 
wire bank14_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==14); 
wire bank14_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==14); 
wire bank15_ram0_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==15); 
wire bank15_ram1_data_rd_en = sc2buf_dat_rd_en&&(sc2buf_dat_rd_addr[12:9]==15); 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sram data read address.
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire [9 -1:0] bank${j}_ram${k}_data_rd_addr = {9{bank${j}_ram${k}_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); );
//: }
//: for(my $i=0; $i<2; $i++){
//: if((2==1)||(2==3)||(2==5)){
//: print qq(
//: wire [9 -1:0] bank${j}_ram${k}_data_rd${i}_addr = {9{bank${j}_ram${k}_data_rd${i}_en}}&(sc2buf_dat_rd_addr${i}[9:1]); );
//: }
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [9 -1:0] bank0_ram0_data_rd_addr = {9{bank0_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank0_ram1_data_rd_addr = {9{bank0_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank1_ram0_data_rd_addr = {9{bank1_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank1_ram1_data_rd_addr = {9{bank1_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank2_ram0_data_rd_addr = {9{bank2_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank2_ram1_data_rd_addr = {9{bank2_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank3_ram0_data_rd_addr = {9{bank3_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank3_ram1_data_rd_addr = {9{bank3_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank4_ram0_data_rd_addr = {9{bank4_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank4_ram1_data_rd_addr = {9{bank4_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank5_ram0_data_rd_addr = {9{bank5_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank5_ram1_data_rd_addr = {9{bank5_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank6_ram0_data_rd_addr = {9{bank6_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank6_ram1_data_rd_addr = {9{bank6_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank7_ram0_data_rd_addr = {9{bank7_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank7_ram1_data_rd_addr = {9{bank7_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank8_ram0_data_rd_addr = {9{bank8_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank8_ram1_data_rd_addr = {9{bank8_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank9_ram0_data_rd_addr = {9{bank9_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank9_ram1_data_rd_addr = {9{bank9_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank10_ram0_data_rd_addr = {9{bank10_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank10_ram1_data_rd_addr = {9{bank10_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank11_ram0_data_rd_addr = {9{bank11_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank11_ram1_data_rd_addr = {9{bank11_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank12_ram0_data_rd_addr = {9{bank12_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank12_ram1_data_rd_addr = {9{bank12_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank13_ram0_data_rd_addr = {9{bank13_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank13_ram1_data_rd_addr = {9{bank13_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank14_ram0_data_rd_addr = {9{bank14_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank14_ram1_data_rd_addr = {9{bank14_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank15_ram0_data_rd_addr = {9{bank15_ram0_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
wire [9 -1:0] bank15_ram1_data_rd_addr = {9{bank15_ram1_data_rd_en}}&(sc2buf_dat_rd_addr[9 -1:0]); 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//add flop for sram data read en
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: if((2==0)||(2==2)||(2==4)){
//: &eperl::flop("-q bank${j}_ram${k}_data_rd_en_d1 -d  bank${j}_ram${k}_data_rd_en");
//: &eperl::flop("-q bank${j}_ram${k}_data_rd_en_d2 -d  bank${j}_ram${k}_data_rd_en_d1");
//: }
//: for(my $i=0; $i<2; $i++){
//: if((2==1)||(2==3)||(2==5)){
//: &eperl::flop("-q bank${j}_ram${k}_data_rd${i}_en_d1 -d bank${j}_ram${k}_data_rd${i}_en");
//: &eperl::flop("-q bank${j}_ram${k}_data_rd${i}_en_d2 -d bank${j}_ram${k}_data_rd${i}_en_d1");
//: }
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  bank0_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank0_ram0_data_rd_en_d1 <= bank0_ram0_data_rd_en;
   end
end
reg  bank0_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank0_ram0_data_rd_en_d2 <= bank0_ram0_data_rd_en_d1;
   end
end
reg  bank0_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank0_ram1_data_rd_en_d1 <= bank0_ram1_data_rd_en;
   end
end
reg  bank0_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank0_ram1_data_rd_en_d2 <= bank0_ram1_data_rd_en_d1;
   end
end
reg  bank1_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank1_ram0_data_rd_en_d1 <= bank1_ram0_data_rd_en;
   end
end
reg  bank1_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank1_ram0_data_rd_en_d2 <= bank1_ram0_data_rd_en_d1;
   end
end
reg  bank1_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank1_ram1_data_rd_en_d1 <= bank1_ram1_data_rd_en;
   end
end
reg  bank1_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank1_ram1_data_rd_en_d2 <= bank1_ram1_data_rd_en_d1;
   end
end
reg  bank2_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank2_ram0_data_rd_en_d1 <= bank2_ram0_data_rd_en;
   end
end
reg  bank2_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank2_ram0_data_rd_en_d2 <= bank2_ram0_data_rd_en_d1;
   end
end
reg  bank2_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank2_ram1_data_rd_en_d1 <= bank2_ram1_data_rd_en;
   end
end
reg  bank2_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank2_ram1_data_rd_en_d2 <= bank2_ram1_data_rd_en_d1;
   end
end
reg  bank3_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank3_ram0_data_rd_en_d1 <= bank3_ram0_data_rd_en;
   end
end
reg  bank3_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank3_ram0_data_rd_en_d2 <= bank3_ram0_data_rd_en_d1;
   end
end
reg  bank3_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank3_ram1_data_rd_en_d1 <= bank3_ram1_data_rd_en;
   end
end
reg  bank3_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank3_ram1_data_rd_en_d2 <= bank3_ram1_data_rd_en_d1;
   end
end
reg  bank4_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank4_ram0_data_rd_en_d1 <= bank4_ram0_data_rd_en;
   end
end
reg  bank4_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank4_ram0_data_rd_en_d2 <= bank4_ram0_data_rd_en_d1;
   end
end
reg  bank4_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank4_ram1_data_rd_en_d1 <= bank4_ram1_data_rd_en;
   end
end
reg  bank4_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank4_ram1_data_rd_en_d2 <= bank4_ram1_data_rd_en_d1;
   end
end
reg  bank5_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank5_ram0_data_rd_en_d1 <= bank5_ram0_data_rd_en;
   end
end
reg  bank5_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank5_ram0_data_rd_en_d2 <= bank5_ram0_data_rd_en_d1;
   end
end
reg  bank5_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank5_ram1_data_rd_en_d1 <= bank5_ram1_data_rd_en;
   end
end
reg  bank5_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank5_ram1_data_rd_en_d2 <= bank5_ram1_data_rd_en_d1;
   end
end
reg  bank6_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank6_ram0_data_rd_en_d1 <= bank6_ram0_data_rd_en;
   end
end
reg  bank6_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank6_ram0_data_rd_en_d2 <= bank6_ram0_data_rd_en_d1;
   end
end
reg  bank6_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank6_ram1_data_rd_en_d1 <= bank6_ram1_data_rd_en;
   end
end
reg  bank6_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank6_ram1_data_rd_en_d2 <= bank6_ram1_data_rd_en_d1;
   end
end
reg  bank7_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank7_ram0_data_rd_en_d1 <= bank7_ram0_data_rd_en;
   end
end
reg  bank7_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank7_ram0_data_rd_en_d2 <= bank7_ram0_data_rd_en_d1;
   end
end
reg  bank7_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank7_ram1_data_rd_en_d1 <= bank7_ram1_data_rd_en;
   end
end
reg  bank7_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank7_ram1_data_rd_en_d2 <= bank7_ram1_data_rd_en_d1;
   end
end
reg  bank8_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank8_ram0_data_rd_en_d1 <= bank8_ram0_data_rd_en;
   end
end
reg  bank8_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank8_ram0_data_rd_en_d2 <= bank8_ram0_data_rd_en_d1;
   end
end
reg  bank8_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank8_ram1_data_rd_en_d1 <= bank8_ram1_data_rd_en;
   end
end
reg  bank8_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank8_ram1_data_rd_en_d2 <= bank8_ram1_data_rd_en_d1;
   end
end
reg  bank9_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank9_ram0_data_rd_en_d1 <= bank9_ram0_data_rd_en;
   end
end
reg  bank9_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank9_ram0_data_rd_en_d2 <= bank9_ram0_data_rd_en_d1;
   end
end
reg  bank9_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank9_ram1_data_rd_en_d1 <= bank9_ram1_data_rd_en;
   end
end
reg  bank9_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank9_ram1_data_rd_en_d2 <= bank9_ram1_data_rd_en_d1;
   end
end
reg  bank10_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank10_ram0_data_rd_en_d1 <= bank10_ram0_data_rd_en;
   end
end
reg  bank10_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank10_ram0_data_rd_en_d2 <= bank10_ram0_data_rd_en_d1;
   end
end
reg  bank10_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank10_ram1_data_rd_en_d1 <= bank10_ram1_data_rd_en;
   end
end
reg  bank10_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank10_ram1_data_rd_en_d2 <= bank10_ram1_data_rd_en_d1;
   end
end
reg  bank11_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank11_ram0_data_rd_en_d1 <= bank11_ram0_data_rd_en;
   end
end
reg  bank11_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank11_ram0_data_rd_en_d2 <= bank11_ram0_data_rd_en_d1;
   end
end
reg  bank11_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank11_ram1_data_rd_en_d1 <= bank11_ram1_data_rd_en;
   end
end
reg  bank11_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank11_ram1_data_rd_en_d2 <= bank11_ram1_data_rd_en_d1;
   end
end
reg  bank12_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank12_ram0_data_rd_en_d1 <= bank12_ram0_data_rd_en;
   end
end
reg  bank12_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank12_ram0_data_rd_en_d2 <= bank12_ram0_data_rd_en_d1;
   end
end
reg  bank12_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank12_ram1_data_rd_en_d1 <= bank12_ram1_data_rd_en;
   end
end
reg  bank12_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank12_ram1_data_rd_en_d2 <= bank12_ram1_data_rd_en_d1;
   end
end
reg  bank13_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank13_ram0_data_rd_en_d1 <= bank13_ram0_data_rd_en;
   end
end
reg  bank13_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank13_ram0_data_rd_en_d2 <= bank13_ram0_data_rd_en_d1;
   end
end
reg  bank13_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank13_ram1_data_rd_en_d1 <= bank13_ram1_data_rd_en;
   end
end
reg  bank13_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank13_ram1_data_rd_en_d2 <= bank13_ram1_data_rd_en_d1;
   end
end
reg  bank14_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank14_ram0_data_rd_en_d1 <= bank14_ram0_data_rd_en;
   end
end
reg  bank14_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank14_ram0_data_rd_en_d2 <= bank14_ram0_data_rd_en_d1;
   end
end
reg  bank14_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank14_ram1_data_rd_en_d1 <= bank14_ram1_data_rd_en;
   end
end
reg  bank14_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank14_ram1_data_rd_en_d2 <= bank14_ram1_data_rd_en_d1;
   end
end
reg  bank15_ram0_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_data_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram0_data_rd_en_d1 <= bank15_ram0_data_rd_en;
   end
end
reg  bank15_ram0_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_data_rd_en_d2 <= 'b0;
   end else begin
       bank15_ram0_data_rd_en_d2 <= bank15_ram0_data_rd_en_d1;
   end
end
reg  bank15_ram1_data_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_data_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram1_data_rd_en_d1 <= bank15_ram1_data_rd_en;
   end
end
reg  bank15_ram1_data_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_data_rd_en_d2 <= 'b0;
   end else begin
       bank15_ram1_data_rd_en_d2 <= bank15_ram1_data_rd_en_d1;
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sram data read valid.
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire bank${j}_ram${k}_data_rd_valid = bank${j}_ram${k}_data_rd_en_d2; )
//: }
//: for(my $i=0; $i<2; $i++){
//: if((2==1)||(2==3)||(2==5)){
//: print qq(
//: wire bank${j}_ram${k}_data_rd${i}_valid = bank${j}_ram${k}_data_rd${i}_en_d2; )
//: }
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire bank0_ram0_data_rd_valid = bank0_ram0_data_rd_en_d2; 
wire bank0_ram1_data_rd_valid = bank0_ram1_data_rd_en_d2; 
wire bank1_ram0_data_rd_valid = bank1_ram0_data_rd_en_d2; 
wire bank1_ram1_data_rd_valid = bank1_ram1_data_rd_en_d2; 
wire bank2_ram0_data_rd_valid = bank2_ram0_data_rd_en_d2; 
wire bank2_ram1_data_rd_valid = bank2_ram1_data_rd_en_d2; 
wire bank3_ram0_data_rd_valid = bank3_ram0_data_rd_en_d2; 
wire bank3_ram1_data_rd_valid = bank3_ram1_data_rd_en_d2; 
wire bank4_ram0_data_rd_valid = bank4_ram0_data_rd_en_d2; 
wire bank4_ram1_data_rd_valid = bank4_ram1_data_rd_en_d2; 
wire bank5_ram0_data_rd_valid = bank5_ram0_data_rd_en_d2; 
wire bank5_ram1_data_rd_valid = bank5_ram1_data_rd_en_d2; 
wire bank6_ram0_data_rd_valid = bank6_ram0_data_rd_en_d2; 
wire bank6_ram1_data_rd_valid = bank6_ram1_data_rd_en_d2; 
wire bank7_ram0_data_rd_valid = bank7_ram0_data_rd_en_d2; 
wire bank7_ram1_data_rd_valid = bank7_ram1_data_rd_en_d2; 
wire bank8_ram0_data_rd_valid = bank8_ram0_data_rd_en_d2; 
wire bank8_ram1_data_rd_valid = bank8_ram1_data_rd_en_d2; 
wire bank9_ram0_data_rd_valid = bank9_ram0_data_rd_en_d2; 
wire bank9_ram1_data_rd_valid = bank9_ram1_data_rd_en_d2; 
wire bank10_ram0_data_rd_valid = bank10_ram0_data_rd_en_d2; 
wire bank10_ram1_data_rd_valid = bank10_ram1_data_rd_en_d2; 
wire bank11_ram0_data_rd_valid = bank11_ram0_data_rd_en_d2; 
wire bank11_ram1_data_rd_valid = bank11_ram1_data_rd_en_d2; 
wire bank12_ram0_data_rd_valid = bank12_ram0_data_rd_en_d2; 
wire bank12_ram1_data_rd_valid = bank12_ram1_data_rd_en_d2; 
wire bank13_ram0_data_rd_valid = bank13_ram0_data_rd_en_d2; 
wire bank13_ram1_data_rd_valid = bank13_ram1_data_rd_en_d2; 
wire bank14_ram0_data_rd_valid = bank14_ram0_data_rd_en_d2; 
wire bank14_ram1_data_rd_valid = bank14_ram1_data_rd_en_d2; 
wire bank15_ram0_data_rd_valid = bank15_ram0_data_rd_en_d2; 
wire bank15_ram1_data_rd_valid = bank15_ram1_data_rd_en_d2; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sc data read valid.
//: my $t1="";
//: my $t2="";
//: if((2==0)||(2==2)||(2==4)){
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: $t1 .= "bank${j}_ram${k}_data_rd_valid|";
//: }
//: }
//: print "wire [0:0] sc2buf_dat_rd_valid_w = $t1"."1'b0; \n";
//: }
//: if((2==1)||(2==3)||(2==5)){
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: $t1 .= "bank${j}_ram${k}_data_rd0_valid|";
//: $t2 .= "bank${j}_ram${k}_data_rd1_valid|";
//: }
//: }
//: print "wire sc2buf_dat_rd_valid0 = ${t1}"."1'b0; \n";
//: print "wire sc2buf_dat_rd_valid1 = ${t2}"."1'b0; \n";
//: print "wire [0:0] sc2buf_dat_rd_valid_w = sc2buf_dat_rd_valid0 || sc2buf_dat_rd_valid1; \n";
//: }
//: &eperl::retime("-O sc2buf_dat_rd_valid -i sc2buf_dat_rd_valid_w -stage 4 -clk nvdla_core_clk");
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: print qq(
//: wire [512/2 -1:0] bank${j}_ram${k}_rd_data; );
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire [0:0] sc2buf_dat_rd_valid_w = bank0_ram0_data_rd_valid|bank0_ram1_data_rd_valid|bank1_ram0_data_rd_valid|bank1_ram1_data_rd_valid|bank2_ram0_data_rd_valid|bank2_ram1_data_rd_valid|bank3_ram0_data_rd_valid|bank3_ram1_data_rd_valid|bank4_ram0_data_rd_valid|bank4_ram1_data_rd_valid|bank5_ram0_data_rd_valid|bank5_ram1_data_rd_valid|bank6_ram0_data_rd_valid|bank6_ram1_data_rd_valid|bank7_ram0_data_rd_valid|bank7_ram1_data_rd_valid|bank8_ram0_data_rd_valid|bank8_ram1_data_rd_valid|bank9_ram0_data_rd_valid|bank9_ram1_data_rd_valid|bank10_ram0_data_rd_valid|bank10_ram1_data_rd_valid|bank11_ram0_data_rd_valid|bank11_ram1_data_rd_valid|bank12_ram0_data_rd_valid|bank12_ram1_data_rd_valid|bank13_ram0_data_rd_valid|bank13_ram1_data_rd_valid|bank14_ram0_data_rd_valid|bank14_ram1_data_rd_valid|bank15_ram0_data_rd_valid|bank15_ram1_data_rd_valid|1'b0; 
reg  sc2buf_dat_rd_valid_w_d1;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_valid_w_d1 <= sc2buf_dat_rd_valid_w;
end

reg  sc2buf_dat_rd_valid_w_d2;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_valid_w_d2 <= sc2buf_dat_rd_valid_w_d1;
end

reg  sc2buf_dat_rd_valid_w_d3;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_valid_w_d3 <= sc2buf_dat_rd_valid_w_d2;
end

reg  sc2buf_dat_rd_valid_w_d4;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_valid_w_d4 <= sc2buf_dat_rd_valid_w_d3;
end

wire  sc2buf_dat_rd_valid;
assign sc2buf_dat_rd_valid = sc2buf_dat_rd_valid_w_d4;


wire [512/2 -1:0] bank0_ram0_rd_data; 
wire [512/2 -1:0] bank0_ram1_rd_data; 
wire [512/2 -1:0] bank1_ram0_rd_data; 
wire [512/2 -1:0] bank1_ram1_rd_data; 
wire [512/2 -1:0] bank2_ram0_rd_data; 
wire [512/2 -1:0] bank2_ram1_rd_data; 
wire [512/2 -1:0] bank3_ram0_rd_data; 
wire [512/2 -1:0] bank3_ram1_rd_data; 
wire [512/2 -1:0] bank4_ram0_rd_data; 
wire [512/2 -1:0] bank4_ram1_rd_data; 
wire [512/2 -1:0] bank5_ram0_rd_data; 
wire [512/2 -1:0] bank5_ram1_rd_data; 
wire [512/2 -1:0] bank6_ram0_rd_data; 
wire [512/2 -1:0] bank6_ram1_rd_data; 
wire [512/2 -1:0] bank7_ram0_rd_data; 
wire [512/2 -1:0] bank7_ram1_rd_data; 
wire [512/2 -1:0] bank8_ram0_rd_data; 
wire [512/2 -1:0] bank8_ram1_rd_data; 
wire [512/2 -1:0] bank9_ram0_rd_data; 
wire [512/2 -1:0] bank9_ram1_rd_data; 
wire [512/2 -1:0] bank10_ram0_rd_data; 
wire [512/2 -1:0] bank10_ram1_rd_data; 
wire [512/2 -1:0] bank11_ram0_rd_data; 
wire [512/2 -1:0] bank11_ram1_rd_data; 
wire [512/2 -1:0] bank12_ram0_rd_data; 
wire [512/2 -1:0] bank12_ram1_rd_data; 
wire [512/2 -1:0] bank13_ram0_rd_data; 
wire [512/2 -1:0] bank13_ram1_rd_data; 
wire [512/2 -1:0] bank14_ram0_rd_data; 
wire [512/2 -1:0] bank14_ram1_rd_data; 
wire [512/2 -1:0] bank15_ram0_rd_data; 
wire [512/2 -1:0] bank15_ram1_rd_data; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sc data read bank output data.
//: my $t1="";
//: my $kk=512;
//: if(2==0){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_data_rd_data = bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd_valid}}; );
//: }
//: }
//: if(2==1){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_data_rd0_data = (bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd0_valid}})|
//: (bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd0_valid}});
//: wire [${kk}-1:0] bank${j}_data_rd1_data = (bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd1_valid}})|
//: (bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd1_valid}});
//: );
//: }
//: }
//: if(2==2){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_data_rd_data = {bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd_valid}}};
//: );
//: }
//: }
//: if(2==3){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_data_rd0_data = {bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd0_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd0_valid}}}|
//: {bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_data_rd0_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_data_rd0_valid}}};
//: wire [${kk}-1:0] bank${j}_data_rd1_data = {bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd1_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd1_valid}}}|
//: {bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_data_rd1_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_data_rd1_valid}}};
//: );
//: }
//: }
//: if(2==4){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_data_rd_data = {bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_data_rd_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_data_rd_valid}},
//: bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd_valid}}};
//: );
//: }
//: }
//: if(2==5){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_data_rd0_data = {
//: bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_data_rd0_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_data_rd0_valid}},
//: bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd0_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd0_valid}}}|
//: {bank${j}_ram7_rd_data&{512/2{bank${j}_ram7_data_rd0_valid}},
//: bank${j}_ram6_rd_data&{512/2{bank${j}_ram6_data_rd0_valid}},
//: bank${j}_ram5_rd_data&{512/2{bank${j}_ram5_data_rd0_valid}},
//: bank${j}_ram4_rd_data&{512/2{bank${j}_ram4_data_rd0_valid}}};
//: wire [${kk}-1:0] bank${j}_data_rd1_data = {
//: bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_data_rd1_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_data_rd1_valid}},
//: bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_data_rd1_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_data_rd1_valid}}}|
//: {bank${j}_ram7_rd_data&{512/2{bank${j}_ram7_data_rd1_valid}},
//: bank${j}_ram6_rd_data&{512/2{bank${j}_ram6_data_rd1_valid}},
//: bank${j}_ram5_rd_data&{512/2{bank${j}_ram5_data_rd1_valid}},
//: bank${j}_ram4_rd_data&{512/2{bank${j}_ram4_data_rd1_valid}}};
//: );
//: }
//: }
//: my $kk=10;
//: &eperl::retime("-O sc2buf_dat_rd_shift_5T -i sc2buf_dat_rd_shift -wid ${kk} -stage 5 -clk nvdla_core_clk");
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [512-1:0] bank0_data_rd_data = {bank0_ram1_rd_data&{512/2{bank0_ram1_data_rd_valid}},
bank0_ram0_rd_data&{512/2{bank0_ram0_data_rd_valid}}};

wire [512-1:0] bank1_data_rd_data = {bank1_ram1_rd_data&{512/2{bank1_ram1_data_rd_valid}},
bank1_ram0_rd_data&{512/2{bank1_ram0_data_rd_valid}}};

wire [512-1:0] bank2_data_rd_data = {bank2_ram1_rd_data&{512/2{bank2_ram1_data_rd_valid}},
bank2_ram0_rd_data&{512/2{bank2_ram0_data_rd_valid}}};

wire [512-1:0] bank3_data_rd_data = {bank3_ram1_rd_data&{512/2{bank3_ram1_data_rd_valid}},
bank3_ram0_rd_data&{512/2{bank3_ram0_data_rd_valid}}};

wire [512-1:0] bank4_data_rd_data = {bank4_ram1_rd_data&{512/2{bank4_ram1_data_rd_valid}},
bank4_ram0_rd_data&{512/2{bank4_ram0_data_rd_valid}}};

wire [512-1:0] bank5_data_rd_data = {bank5_ram1_rd_data&{512/2{bank5_ram1_data_rd_valid}},
bank5_ram0_rd_data&{512/2{bank5_ram0_data_rd_valid}}};

wire [512-1:0] bank6_data_rd_data = {bank6_ram1_rd_data&{512/2{bank6_ram1_data_rd_valid}},
bank6_ram0_rd_data&{512/2{bank6_ram0_data_rd_valid}}};

wire [512-1:0] bank7_data_rd_data = {bank7_ram1_rd_data&{512/2{bank7_ram1_data_rd_valid}},
bank7_ram0_rd_data&{512/2{bank7_ram0_data_rd_valid}}};

wire [512-1:0] bank8_data_rd_data = {bank8_ram1_rd_data&{512/2{bank8_ram1_data_rd_valid}},
bank8_ram0_rd_data&{512/2{bank8_ram0_data_rd_valid}}};

wire [512-1:0] bank9_data_rd_data = {bank9_ram1_rd_data&{512/2{bank9_ram1_data_rd_valid}},
bank9_ram0_rd_data&{512/2{bank9_ram0_data_rd_valid}}};

wire [512-1:0] bank10_data_rd_data = {bank10_ram1_rd_data&{512/2{bank10_ram1_data_rd_valid}},
bank10_ram0_rd_data&{512/2{bank10_ram0_data_rd_valid}}};

wire [512-1:0] bank11_data_rd_data = {bank11_ram1_rd_data&{512/2{bank11_ram1_data_rd_valid}},
bank11_ram0_rd_data&{512/2{bank11_ram0_data_rd_valid}}};

wire [512-1:0] bank12_data_rd_data = {bank12_ram1_rd_data&{512/2{bank12_ram1_data_rd_valid}},
bank12_ram0_rd_data&{512/2{bank12_ram0_data_rd_valid}}};

wire [512-1:0] bank13_data_rd_data = {bank13_ram1_rd_data&{512/2{bank13_ram1_data_rd_valid}},
bank13_ram0_rd_data&{512/2{bank13_ram0_data_rd_valid}}};

wire [512-1:0] bank14_data_rd_data = {bank14_ram1_rd_data&{512/2{bank14_ram1_data_rd_valid}},
bank14_ram0_rd_data&{512/2{bank14_ram0_data_rd_valid}}};

wire [512-1:0] bank15_data_rd_data = {bank15_ram1_rd_data&{512/2{bank15_ram1_data_rd_valid}},
bank15_ram0_rd_data&{512/2{bank15_ram0_data_rd_valid}}};
reg [10-1:0] sc2buf_dat_rd_shift_d1;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_shift_d1[10-1:0] <= sc2buf_dat_rd_shift[10-1:0];
end

reg [10-1:0] sc2buf_dat_rd_shift_d2;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_shift_d2[10-1:0] <= sc2buf_dat_rd_shift_d1[10-1:0];
end

reg [10-1:0] sc2buf_dat_rd_shift_d3;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_shift_d3[10-1:0] <= sc2buf_dat_rd_shift_d2[10-1:0];
end

reg [10-1:0] sc2buf_dat_rd_shift_d4;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_shift_d4[10-1:0] <= sc2buf_dat_rd_shift_d3[10-1:0];
end

reg [10-1:0] sc2buf_dat_rd_shift_d5;
always @(posedge nvdla_core_clk) begin
        sc2buf_dat_rd_shift_d5[10-1:0] <= sc2buf_dat_rd_shift_d4[10-1:0];
end

wire [10-1:0] sc2buf_dat_rd_shift_5T;
assign sc2buf_dat_rd_shift_5T = sc2buf_dat_rd_shift_d5;


//| eperl: generated_end (DO NOT EDIT ABOVE)
// pipe solution. for timing concern, 4 level pipe.
//: my $kk=512;
//: if((2==0)||(2==2)||(2==4)){
//: for (my $i=0; $i<16; $i++){
//: &eperl::flop("-wid ${kk} -norst -q l1group${i}_data_rd_data   -d bank${i}_data_rd_data");
//: }
//:
//: for (my $i=0; $i<16/4; $i++){
//: my $ni=$i*4;
//: my $nii=$i*4+1;
//: my $niii=$i*4+2;
//: my $niiii=$i*4+3;
//: print qq(
//: wire [${kk}-1:0] l2group${i}_data_rd_data_w = l1group${ni}_data_rd_data | l1group${nii}_data_rd_data | l1group${niii}_data_rd_data | l1group${niiii}_data_rd_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l2group${i}_data_rd_data   -d l2group${i}_data_rd_data_w");
//: }
//:
//: for (my $i=0; $i<16/16; $i++){
//: my $ni=$i*4;
//: my $nii=$i*4+1;
//: my $niii=$i*4+2;
//: my $niiii=$i*4+3;
//: print qq(
//: wire [${kk}-1:0] l3group${i}_data_rd_data_w = l2group${ni}_data_rd_data | l2group${nii}_data_rd_data | l2group${niii}_data_rd_data | l2group${niiii}_data_rd_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l3group${i}_data_rd_data   -d l3group${i}_data_rd_data_w");
//: }
//:
//: if(16==16){
//: &eperl::flop("-wid ${kk} -norst -q l4group_data_rd_data   -d l3group0_data_rd_data");
//: }
//: if(16==32) {
//: print qq(
//: wire [${kk}-1:0] l4group_data_rd_data_w = l3group0_data_rd_data | l3group1_data_rd_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l4group_data_rd_data   -d l4group_data_rd_data_w");
//: }
//: print "wire[${kk}-1:0] sc2buf_dat_rd_data = l4group_data_rd_data[${kk}-1:0]; \n";
//: }
//:
//:
//: my $kk=512;
//: if((2==1)||(2==3)||(2==5)){
//: for (my $i=0; $i<16; $i++){
//: &eperl::flop("-wid ${kk} -norst -q l1group${i}_data_rd0_data   -d bank${i}_data_rd0_data");
//: &eperl::flop("-wid ${kk} -norst -q l1group${i}_data_rd1_data   -d bank${i}_data_rd1_data");
//: }
//:
//: for (my $i=0; $i<16/4; $i++){
//: my $ni=$i*4;
//: my $nii=$i*4+1;
//: my $niii=$i*4+2;
//: my $niiii=$i*4+3;
//: print qq(
//: wire [${kk}-1:0] l2group${i}_data_rd0_data_w = l1group${ni}_data_rd0_data | l1group${nii}_data_rd0_data | l1group${niii}_data_rd0_data | l1group${niiii}_data_rd0_data;
//: wire [${kk}-1:0] l2group${i}_data_rd1_data_w = l1group${ni}_data_rd1_data | l1group${nii}_data_rd1_data | l1group${niii}_data_rd1_data | l1group${niiii}_data_rd1_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l2group${i}_data_rd0_data   -d l2group${i}_data_rd0_data_w");
//: &eperl::flop("-wid ${kk} -norst -q l2group${i}_data_rd1_data   -d l2group${i}_data_rd1_data_w");
//: }
//:
//: for (my $i=0; $i<16/16; $i++){
//: my $ni=$i*4;
//: my $nii=$i*4+1;
//: my $niii=$i*4+2;
//: my $niiii=$i*4+3;
//: print qq(
//: wire [${kk}-1:0] l3group${i}_data_rd0_data_w = l2group${ni}_data_rd0_data | l2group${nii}_data_rd0_data | l2group${niii}_data_rd0_data | l2group${niiii}_data_rd0_data;
//: wire [${kk}-1:0] l3group${i}_data_rd1_data_w = l2group${ni}_data_rd1_data | l2group${nii}_data_rd1_data | l2group${niii}_data_rd1_data | l2group${niiii}_data_rd1_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l3group${i}_data_rd0_data   -d l3group${i}_data_rd0_data_w");
//: &eperl::flop("-wid ${kk} -norst -q l3group${i}_data_rd1_data   -d l3group${i}_data_rd1_data_w");
//: }
//:
//: if(16==16){
//: print qq(
//: wire [${kk}-1:0] l4group_data_rd0_data = l3group0_data_rd0_data;
//: wire [${kk}-1:0] l4group_data_rd1_data = l3group0_data_rd1_data;
//: );
//: }
//: if(16==32) {
//: print qq(
//: wire [${kk}-1:0] l4group_data_rd0_data = l3group0_data_rd0_data | l3group1_data_rd0_data;
//: wire [${kk}-1:0] l4group_data_rd1_data = l3group0_data_rd1_data | l3group1_data_rd1_data;
//: );
//: }
//: print qq(
//: wire [${kk}*2-1:0] l4group_data_rd_data_w = {l4group_data_rd1_data,l4group_data_rd0_data}>>{sc2buf_dat_rd_shift_5T,3'b0};
//: );
//: &eperl::flop("-wid ${kk} -norst -q l4group_data_rd_data   -d l4group_data_rd_data_w[${kk}-1:0]");
//: print "wire[${kk}-1:0] sc2buf_dat_rd_data = l4group_data_rd_data[${kk}-1:0]; \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg [511:0] l1group0_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group0_data_rd_data <= bank0_data_rd_data;
end
reg [511:0] l1group1_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group1_data_rd_data <= bank1_data_rd_data;
end
reg [511:0] l1group2_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group2_data_rd_data <= bank2_data_rd_data;
end
reg [511:0] l1group3_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group3_data_rd_data <= bank3_data_rd_data;
end
reg [511:0] l1group4_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group4_data_rd_data <= bank4_data_rd_data;
end
reg [511:0] l1group5_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group5_data_rd_data <= bank5_data_rd_data;
end
reg [511:0] l1group6_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group6_data_rd_data <= bank6_data_rd_data;
end
reg [511:0] l1group7_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group7_data_rd_data <= bank7_data_rd_data;
end
reg [511:0] l1group8_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group8_data_rd_data <= bank8_data_rd_data;
end
reg [511:0] l1group9_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group9_data_rd_data <= bank9_data_rd_data;
end
reg [511:0] l1group10_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group10_data_rd_data <= bank10_data_rd_data;
end
reg [511:0] l1group11_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group11_data_rd_data <= bank11_data_rd_data;
end
reg [511:0] l1group12_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group12_data_rd_data <= bank12_data_rd_data;
end
reg [511:0] l1group13_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group13_data_rd_data <= bank13_data_rd_data;
end
reg [511:0] l1group14_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group14_data_rd_data <= bank14_data_rd_data;
end
reg [511:0] l1group15_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group15_data_rd_data <= bank15_data_rd_data;
end

wire [512-1:0] l2group0_data_rd_data_w = l1group0_data_rd_data | l1group1_data_rd_data | l1group2_data_rd_data | l1group3_data_rd_data;
reg [511:0] l2group0_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group0_data_rd_data <= l2group0_data_rd_data_w;
end

wire [512-1:0] l2group1_data_rd_data_w = l1group4_data_rd_data | l1group5_data_rd_data | l1group6_data_rd_data | l1group7_data_rd_data;
reg [511:0] l2group1_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group1_data_rd_data <= l2group1_data_rd_data_w;
end

wire [512-1:0] l2group2_data_rd_data_w = l1group8_data_rd_data | l1group9_data_rd_data | l1group10_data_rd_data | l1group11_data_rd_data;
reg [511:0] l2group2_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group2_data_rd_data <= l2group2_data_rd_data_w;
end

wire [512-1:0] l2group3_data_rd_data_w = l1group12_data_rd_data | l1group13_data_rd_data | l1group14_data_rd_data | l1group15_data_rd_data;
reg [511:0] l2group3_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group3_data_rd_data <= l2group3_data_rd_data_w;
end

wire [512-1:0] l3group0_data_rd_data_w = l2group0_data_rd_data | l2group1_data_rd_data | l2group2_data_rd_data | l2group3_data_rd_data;
reg [511:0] l3group0_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l3group0_data_rd_data <= l3group0_data_rd_data_w;
end
reg [511:0] l4group_data_rd_data;
always @(posedge nvdla_core_clk) begin
       l4group_data_rd_data <= l3group0_data_rd_data;
end
wire[512-1:0] sc2buf_dat_rd_data = l4group_data_rd_data[512-1:0]; 

//| eperl: generated_end (DO NOT EDIT ABOVE)
////get sc data read data. no pipe
////: my $t1="";
////: my $t2="";
////: my $kk=CBUF_RD_PORT_WIDTH;
////: if((CBUF_BANK_RAM_CASE==0)||(CBUF_BANK_RAM_CASE==2)||(CBUF_BANK_RAM_CASE==4)){
////:     for(my $j=0; $j<CBUF_BANK_NUMBER ; $j++){
////:         $t1 .= "bank${j}_data_rd_data|";    
////:     }
////: print "wire[${kk}-1:0] sc2buf_dat_rd_data =".${t1}."{${kk}{1'b0}}; \n";
////: }
////:     
////: if((CBUF_BANK_RAM_CASE==1)|(CBUF_BANK_RAM_CASE==3)||(CBUF_BANK_RAM_CASE==5)){
////:     for(my $j=0; $j<CBUF_BANK_NUMBER ; $j++){
////:         $t1 .= "bank${j}_data_rd0_data|";    
////:         $t2 .= "bank${j}_data_rd1_data|";    
////:     }
////: print "wire[${kk}-1:0] sc2buf_dat_rd_data0 =".${t1}."{${kk}{1'b0}}; \n";
////: print "wire[${kk}-1:0] sc2buf_dat_rd_data1 =".${t2}."{${kk}{1'b0}}; \n";
////: }
////:
//wire[512*2-1:0] sc2buf_dat_rd_data_temp = {sc2buf_dat_rd_data1,sc2buf_dat_rd_data0} >> {sc2buf_dat_rd_shift_5T,3'b0};
//wire[512 -1:0] sc2buf_dat_rd_data = sc2buf_dat_rd_data_temp[512 -1:0];
/////////////////////step3: read weight handle
//decode read weight address to sram.
//: my $bank_slice= "12:9"; #address part for select bank
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: my $kdiv2 = int($k/2);
//: my $kdiv4 = int($k/4);
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire bank${j}_ram${k}_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[${bank_slice}]==${j}); )
//: }
//: if(2==1){
//: print qq(
//: wire bank${j}_ram${k}_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[${bank_slice}]==${j})&&(sc2buf_wt_rd_addr[0]==${k}); )
//: }
//: if(2==3){
//: print qq(
//: wire bank${j}_ram${k}_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[${bank_slice}]==${j})&&(sc2buf_wt_rd_addr[0]==${kdiv2}); )
//: }
//: if(2==5){
//: print qq(
//: wire bank${j}_ram${k}_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[${bank_slice}]==${j})&&(sc2buf_wt_rd_addr[0]==${kdiv4}); )
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire bank0_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==0); 
wire bank0_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==0); 
wire bank1_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==1); 
wire bank1_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==1); 
wire bank2_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==2); 
wire bank2_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==2); 
wire bank3_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==3); 
wire bank3_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==3); 
wire bank4_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==4); 
wire bank4_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==4); 
wire bank5_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==5); 
wire bank5_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==5); 
wire bank6_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==6); 
wire bank6_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==6); 
wire bank7_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==7); 
wire bank7_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==7); 
wire bank8_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==8); 
wire bank8_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==8); 
wire bank9_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==9); 
wire bank9_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==9); 
wire bank10_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==10); 
wire bank10_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==10); 
wire bank11_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==11); 
wire bank11_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==11); 
wire bank12_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==12); 
wire bank12_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==12); 
wire bank13_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==13); 
wire bank13_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==13); 
wire bank14_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==14); 
wire bank14_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==14); 
wire bank15_ram0_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==15); 
wire bank15_ram1_wt_rd_en = sc2buf_wt_rd_en&&(sc2buf_wt_rd_addr[12:9]==15); 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sram weight read address.
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire [9 -1:0] bank${j}_ram${k}_wt_rd_addr = {9{bank${j}_ram${k}_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); )
//: }
//: if((2==1)||(2==3)||(2==5)){
//: print qq(
//: wire [9 -1:0] bank${j}_ram${k}_wt_rd_addr = {9{bank${j}_ram${k}_wt_rd_en}}&(sc2buf_wt_rd_addr[9:1]); )
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [9 -1:0] bank0_ram0_wt_rd_addr = {9{bank0_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank0_ram1_wt_rd_addr = {9{bank0_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank1_ram0_wt_rd_addr = {9{bank1_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank1_ram1_wt_rd_addr = {9{bank1_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank2_ram0_wt_rd_addr = {9{bank2_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank2_ram1_wt_rd_addr = {9{bank2_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank3_ram0_wt_rd_addr = {9{bank3_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank3_ram1_wt_rd_addr = {9{bank3_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank4_ram0_wt_rd_addr = {9{bank4_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank4_ram1_wt_rd_addr = {9{bank4_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank5_ram0_wt_rd_addr = {9{bank5_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank5_ram1_wt_rd_addr = {9{bank5_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank6_ram0_wt_rd_addr = {9{bank6_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank6_ram1_wt_rd_addr = {9{bank6_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank7_ram0_wt_rd_addr = {9{bank7_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank7_ram1_wt_rd_addr = {9{bank7_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank8_ram0_wt_rd_addr = {9{bank8_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank8_ram1_wt_rd_addr = {9{bank8_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank9_ram0_wt_rd_addr = {9{bank9_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank9_ram1_wt_rd_addr = {9{bank9_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank10_ram0_wt_rd_addr = {9{bank10_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank10_ram1_wt_rd_addr = {9{bank10_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank11_ram0_wt_rd_addr = {9{bank11_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank11_ram1_wt_rd_addr = {9{bank11_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank12_ram0_wt_rd_addr = {9{bank12_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank12_ram1_wt_rd_addr = {9{bank12_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank13_ram0_wt_rd_addr = {9{bank13_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank13_ram1_wt_rd_addr = {9{bank13_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank14_ram0_wt_rd_addr = {9{bank14_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank14_ram1_wt_rd_addr = {9{bank14_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank15_ram0_wt_rd_addr = {9{bank15_ram0_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
wire [9 -1:0] bank15_ram1_wt_rd_addr = {9{bank15_ram1_wt_rd_en}}&(sc2buf_wt_rd_addr[9 -1:0]); 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//add flop for sram weight read en
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: &eperl::flop("-q bank${j}_ram${k}_wt_rd_en_d1 -d  bank${j}_ram${k}_wt_rd_en");
//: &eperl::flop("-q bank${j}_ram${k}_wt_rd_en_d2 -d  bank${j}_ram${k}_wt_rd_en_d1");
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  bank0_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank0_ram0_wt_rd_en_d1 <= bank0_ram0_wt_rd_en;
   end
end
reg  bank0_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank0_ram0_wt_rd_en_d2 <= bank0_ram0_wt_rd_en_d1;
   end
end
reg  bank0_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank0_ram1_wt_rd_en_d1 <= bank0_ram1_wt_rd_en;
   end
end
reg  bank0_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank0_ram1_wt_rd_en_d2 <= bank0_ram1_wt_rd_en_d1;
   end
end
reg  bank1_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank1_ram0_wt_rd_en_d1 <= bank1_ram0_wt_rd_en;
   end
end
reg  bank1_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank1_ram0_wt_rd_en_d2 <= bank1_ram0_wt_rd_en_d1;
   end
end
reg  bank1_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank1_ram1_wt_rd_en_d1 <= bank1_ram1_wt_rd_en;
   end
end
reg  bank1_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank1_ram1_wt_rd_en_d2 <= bank1_ram1_wt_rd_en_d1;
   end
end
reg  bank2_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank2_ram0_wt_rd_en_d1 <= bank2_ram0_wt_rd_en;
   end
end
reg  bank2_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank2_ram0_wt_rd_en_d2 <= bank2_ram0_wt_rd_en_d1;
   end
end
reg  bank2_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank2_ram1_wt_rd_en_d1 <= bank2_ram1_wt_rd_en;
   end
end
reg  bank2_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank2_ram1_wt_rd_en_d2 <= bank2_ram1_wt_rd_en_d1;
   end
end
reg  bank3_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank3_ram0_wt_rd_en_d1 <= bank3_ram0_wt_rd_en;
   end
end
reg  bank3_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank3_ram0_wt_rd_en_d2 <= bank3_ram0_wt_rd_en_d1;
   end
end
reg  bank3_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank3_ram1_wt_rd_en_d1 <= bank3_ram1_wt_rd_en;
   end
end
reg  bank3_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank3_ram1_wt_rd_en_d2 <= bank3_ram1_wt_rd_en_d1;
   end
end
reg  bank4_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank4_ram0_wt_rd_en_d1 <= bank4_ram0_wt_rd_en;
   end
end
reg  bank4_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank4_ram0_wt_rd_en_d2 <= bank4_ram0_wt_rd_en_d1;
   end
end
reg  bank4_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank4_ram1_wt_rd_en_d1 <= bank4_ram1_wt_rd_en;
   end
end
reg  bank4_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank4_ram1_wt_rd_en_d2 <= bank4_ram1_wt_rd_en_d1;
   end
end
reg  bank5_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank5_ram0_wt_rd_en_d1 <= bank5_ram0_wt_rd_en;
   end
end
reg  bank5_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank5_ram0_wt_rd_en_d2 <= bank5_ram0_wt_rd_en_d1;
   end
end
reg  bank5_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank5_ram1_wt_rd_en_d1 <= bank5_ram1_wt_rd_en;
   end
end
reg  bank5_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank5_ram1_wt_rd_en_d2 <= bank5_ram1_wt_rd_en_d1;
   end
end
reg  bank6_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank6_ram0_wt_rd_en_d1 <= bank6_ram0_wt_rd_en;
   end
end
reg  bank6_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank6_ram0_wt_rd_en_d2 <= bank6_ram0_wt_rd_en_d1;
   end
end
reg  bank6_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank6_ram1_wt_rd_en_d1 <= bank6_ram1_wt_rd_en;
   end
end
reg  bank6_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank6_ram1_wt_rd_en_d2 <= bank6_ram1_wt_rd_en_d1;
   end
end
reg  bank7_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank7_ram0_wt_rd_en_d1 <= bank7_ram0_wt_rd_en;
   end
end
reg  bank7_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank7_ram0_wt_rd_en_d2 <= bank7_ram0_wt_rd_en_d1;
   end
end
reg  bank7_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank7_ram1_wt_rd_en_d1 <= bank7_ram1_wt_rd_en;
   end
end
reg  bank7_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank7_ram1_wt_rd_en_d2 <= bank7_ram1_wt_rd_en_d1;
   end
end
reg  bank8_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank8_ram0_wt_rd_en_d1 <= bank8_ram0_wt_rd_en;
   end
end
reg  bank8_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank8_ram0_wt_rd_en_d2 <= bank8_ram0_wt_rd_en_d1;
   end
end
reg  bank8_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank8_ram1_wt_rd_en_d1 <= bank8_ram1_wt_rd_en;
   end
end
reg  bank8_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank8_ram1_wt_rd_en_d2 <= bank8_ram1_wt_rd_en_d1;
   end
end
reg  bank9_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank9_ram0_wt_rd_en_d1 <= bank9_ram0_wt_rd_en;
   end
end
reg  bank9_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank9_ram0_wt_rd_en_d2 <= bank9_ram0_wt_rd_en_d1;
   end
end
reg  bank9_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank9_ram1_wt_rd_en_d1 <= bank9_ram1_wt_rd_en;
   end
end
reg  bank9_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank9_ram1_wt_rd_en_d2 <= bank9_ram1_wt_rd_en_d1;
   end
end
reg  bank10_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank10_ram0_wt_rd_en_d1 <= bank10_ram0_wt_rd_en;
   end
end
reg  bank10_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank10_ram0_wt_rd_en_d2 <= bank10_ram0_wt_rd_en_d1;
   end
end
reg  bank10_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank10_ram1_wt_rd_en_d1 <= bank10_ram1_wt_rd_en;
   end
end
reg  bank10_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank10_ram1_wt_rd_en_d2 <= bank10_ram1_wt_rd_en_d1;
   end
end
reg  bank11_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank11_ram0_wt_rd_en_d1 <= bank11_ram0_wt_rd_en;
   end
end
reg  bank11_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank11_ram0_wt_rd_en_d2 <= bank11_ram0_wt_rd_en_d1;
   end
end
reg  bank11_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank11_ram1_wt_rd_en_d1 <= bank11_ram1_wt_rd_en;
   end
end
reg  bank11_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank11_ram1_wt_rd_en_d2 <= bank11_ram1_wt_rd_en_d1;
   end
end
reg  bank12_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank12_ram0_wt_rd_en_d1 <= bank12_ram0_wt_rd_en;
   end
end
reg  bank12_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank12_ram0_wt_rd_en_d2 <= bank12_ram0_wt_rd_en_d1;
   end
end
reg  bank12_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank12_ram1_wt_rd_en_d1 <= bank12_ram1_wt_rd_en;
   end
end
reg  bank12_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank12_ram1_wt_rd_en_d2 <= bank12_ram1_wt_rd_en_d1;
   end
end
reg  bank13_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank13_ram0_wt_rd_en_d1 <= bank13_ram0_wt_rd_en;
   end
end
reg  bank13_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank13_ram0_wt_rd_en_d2 <= bank13_ram0_wt_rd_en_d1;
   end
end
reg  bank13_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank13_ram1_wt_rd_en_d1 <= bank13_ram1_wt_rd_en;
   end
end
reg  bank13_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank13_ram1_wt_rd_en_d2 <= bank13_ram1_wt_rd_en_d1;
   end
end
reg  bank14_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank14_ram0_wt_rd_en_d1 <= bank14_ram0_wt_rd_en;
   end
end
reg  bank14_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank14_ram0_wt_rd_en_d2 <= bank14_ram0_wt_rd_en_d1;
   end
end
reg  bank14_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank14_ram1_wt_rd_en_d1 <= bank14_ram1_wt_rd_en;
   end
end
reg  bank14_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank14_ram1_wt_rd_en_d2 <= bank14_ram1_wt_rd_en_d1;
   end
end
reg  bank15_ram0_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_wt_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram0_wt_rd_en_d1 <= bank15_ram0_wt_rd_en;
   end
end
reg  bank15_ram0_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_wt_rd_en_d2 <= 'b0;
   end else begin
       bank15_ram0_wt_rd_en_d2 <= bank15_ram0_wt_rd_en_d1;
   end
end
reg  bank15_ram1_wt_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_wt_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram1_wt_rd_en_d1 <= bank15_ram1_wt_rd_en;
   end
end
reg  bank15_ram1_wt_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_wt_rd_en_d2 <= 'b0;
   end else begin
       bank15_ram1_wt_rd_en_d2 <= bank15_ram1_wt_rd_en_d1;
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sram weight read valid.
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: print qq(
//: wire bank${j}_ram${k}_wt_rd_valid = bank${j}_ram${k}_wt_rd_en_d2; )
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire bank0_ram0_wt_rd_valid = bank0_ram0_wt_rd_en_d2; 
wire bank0_ram1_wt_rd_valid = bank0_ram1_wt_rd_en_d2; 
wire bank1_ram0_wt_rd_valid = bank1_ram0_wt_rd_en_d2; 
wire bank1_ram1_wt_rd_valid = bank1_ram1_wt_rd_en_d2; 
wire bank2_ram0_wt_rd_valid = bank2_ram0_wt_rd_en_d2; 
wire bank2_ram1_wt_rd_valid = bank2_ram1_wt_rd_en_d2; 
wire bank3_ram0_wt_rd_valid = bank3_ram0_wt_rd_en_d2; 
wire bank3_ram1_wt_rd_valid = bank3_ram1_wt_rd_en_d2; 
wire bank4_ram0_wt_rd_valid = bank4_ram0_wt_rd_en_d2; 
wire bank4_ram1_wt_rd_valid = bank4_ram1_wt_rd_en_d2; 
wire bank5_ram0_wt_rd_valid = bank5_ram0_wt_rd_en_d2; 
wire bank5_ram1_wt_rd_valid = bank5_ram1_wt_rd_en_d2; 
wire bank6_ram0_wt_rd_valid = bank6_ram0_wt_rd_en_d2; 
wire bank6_ram1_wt_rd_valid = bank6_ram1_wt_rd_en_d2; 
wire bank7_ram0_wt_rd_valid = bank7_ram0_wt_rd_en_d2; 
wire bank7_ram1_wt_rd_valid = bank7_ram1_wt_rd_en_d2; 
wire bank8_ram0_wt_rd_valid = bank8_ram0_wt_rd_en_d2; 
wire bank8_ram1_wt_rd_valid = bank8_ram1_wt_rd_en_d2; 
wire bank9_ram0_wt_rd_valid = bank9_ram0_wt_rd_en_d2; 
wire bank9_ram1_wt_rd_valid = bank9_ram1_wt_rd_en_d2; 
wire bank10_ram0_wt_rd_valid = bank10_ram0_wt_rd_en_d2; 
wire bank10_ram1_wt_rd_valid = bank10_ram1_wt_rd_en_d2; 
wire bank11_ram0_wt_rd_valid = bank11_ram0_wt_rd_en_d2; 
wire bank11_ram1_wt_rd_valid = bank11_ram1_wt_rd_en_d2; 
wire bank12_ram0_wt_rd_valid = bank12_ram0_wt_rd_en_d2; 
wire bank12_ram1_wt_rd_valid = bank12_ram1_wt_rd_en_d2; 
wire bank13_ram0_wt_rd_valid = bank13_ram0_wt_rd_en_d2; 
wire bank13_ram1_wt_rd_valid = bank13_ram1_wt_rd_en_d2; 
wire bank14_ram0_wt_rd_valid = bank14_ram0_wt_rd_en_d2; 
wire bank14_ram1_wt_rd_valid = bank14_ram1_wt_rd_en_d2; 
wire bank15_ram0_wt_rd_valid = bank15_ram0_wt_rd_en_d2; 
wire bank15_ram1_wt_rd_valid = bank15_ram1_wt_rd_en_d2; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sc weight read valid.
//: my $t1="";
//: for(my $j=0; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: $t1 .= "bank${j}_ram${k}_wt_rd_valid|";
//: }
//: }
//: print "wire [0:0] sc2buf_wt_rd_valid_w ="."${t1}"."1'b0 ;\n";
//: &eperl::retime("-O sc2buf_wt_rd_valid -i sc2buf_wt_rd_valid_w -stage 4 -clk nvdla_core_clk");
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire [0:0] sc2buf_wt_rd_valid_w =bank0_ram0_wt_rd_valid|bank0_ram1_wt_rd_valid|bank1_ram0_wt_rd_valid|bank1_ram1_wt_rd_valid|bank2_ram0_wt_rd_valid|bank2_ram1_wt_rd_valid|bank3_ram0_wt_rd_valid|bank3_ram1_wt_rd_valid|bank4_ram0_wt_rd_valid|bank4_ram1_wt_rd_valid|bank5_ram0_wt_rd_valid|bank5_ram1_wt_rd_valid|bank6_ram0_wt_rd_valid|bank6_ram1_wt_rd_valid|bank7_ram0_wt_rd_valid|bank7_ram1_wt_rd_valid|bank8_ram0_wt_rd_valid|bank8_ram1_wt_rd_valid|bank9_ram0_wt_rd_valid|bank9_ram1_wt_rd_valid|bank10_ram0_wt_rd_valid|bank10_ram1_wt_rd_valid|bank11_ram0_wt_rd_valid|bank11_ram1_wt_rd_valid|bank12_ram0_wt_rd_valid|bank12_ram1_wt_rd_valid|bank13_ram0_wt_rd_valid|bank13_ram1_wt_rd_valid|bank14_ram0_wt_rd_valid|bank14_ram1_wt_rd_valid|bank15_ram0_wt_rd_valid|bank15_ram1_wt_rd_valid|1'b0 ;
reg  sc2buf_wt_rd_valid_w_d1;
always @(posedge nvdla_core_clk) begin
        sc2buf_wt_rd_valid_w_d1 <= sc2buf_wt_rd_valid_w;
end

reg  sc2buf_wt_rd_valid_w_d2;
always @(posedge nvdla_core_clk) begin
        sc2buf_wt_rd_valid_w_d2 <= sc2buf_wt_rd_valid_w_d1;
end

reg  sc2buf_wt_rd_valid_w_d3;
always @(posedge nvdla_core_clk) begin
        sc2buf_wt_rd_valid_w_d3 <= sc2buf_wt_rd_valid_w_d2;
end

reg  sc2buf_wt_rd_valid_w_d4;
always @(posedge nvdla_core_clk) begin
        sc2buf_wt_rd_valid_w_d4 <= sc2buf_wt_rd_valid_w_d3;
end

wire  sc2buf_wt_rd_valid;
assign sc2buf_wt_rd_valid = sc2buf_wt_rd_valid_w_d4;


//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sc weight read bank output data.
//: my $t1="";
//: my $kk=512;
//: if(2==0){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_wt_rd_data = bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_wt_rd_valid}}; );
//: }
//: }
//: if(2==1){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_wt_rd_data = (bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_wt_rd_valid}})|
//: (bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_wt_rd_valid}});
//: );
//: }
//: }
//: if(2==2){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_wt_rd_data = {bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_wt_rd_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_wt_rd_valid}}}; );
//: }
//: }
//: if(2==3){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_wt_rd_data = {bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_wt_rd_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_wt_rd_valid}}}|
//: {bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_wt_rd_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_wt_rd_valid}}};
//: );
//: }
//: }
//: if(2==4){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_wt_rd_data = {bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_wt_rd_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_wt_rd_valid}},
//: bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_wt_rd_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_wt_rd_valid}}};
//: );
//: }
//: }
//: if(2==5){
//: for(my $j=0; $j<16 ; $j++){
//: print qq(
//: wire [${kk}-1:0] bank${j}_wt_rd_data = {bank${j}_ram7_rd_data&{512/2{bank${j}_ram7_wt_rd_valid}},
//: bank${j}_ram6_rd_data&{512/2{bank${j}_ram6_wt_rd_valid}},
//: bank${j}_ram5_rd_data&{512/2{bank${j}_ram5_wt_rd_valid}},
//: bank${j}_ram4_rd_data&{512/2{bank${j}_ram4_wt_rd_valid}}}|
//: {bank${j}_ram3_rd_data&{512/2{bank${j}_ram3_wt_rd_valid}},
//: bank${j}_ram2_rd_data&{512/2{bank${j}_ram2_wt_rd_valid}},
//: bank${j}_ram1_rd_data&{512/2{bank${j}_ram1_wt_rd_valid}},
//: bank${j}_ram0_rd_data&{512/2{bank${j}_ram0_wt_rd_valid}}};
//: );
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [512-1:0] bank0_wt_rd_data = {bank0_ram1_rd_data&{512/2{bank0_ram1_wt_rd_valid}},
bank0_ram0_rd_data&{512/2{bank0_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank1_wt_rd_data = {bank1_ram1_rd_data&{512/2{bank1_ram1_wt_rd_valid}},
bank1_ram0_rd_data&{512/2{bank1_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank2_wt_rd_data = {bank2_ram1_rd_data&{512/2{bank2_ram1_wt_rd_valid}},
bank2_ram0_rd_data&{512/2{bank2_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank3_wt_rd_data = {bank3_ram1_rd_data&{512/2{bank3_ram1_wt_rd_valid}},
bank3_ram0_rd_data&{512/2{bank3_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank4_wt_rd_data = {bank4_ram1_rd_data&{512/2{bank4_ram1_wt_rd_valid}},
bank4_ram0_rd_data&{512/2{bank4_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank5_wt_rd_data = {bank5_ram1_rd_data&{512/2{bank5_ram1_wt_rd_valid}},
bank5_ram0_rd_data&{512/2{bank5_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank6_wt_rd_data = {bank6_ram1_rd_data&{512/2{bank6_ram1_wt_rd_valid}},
bank6_ram0_rd_data&{512/2{bank6_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank7_wt_rd_data = {bank7_ram1_rd_data&{512/2{bank7_ram1_wt_rd_valid}},
bank7_ram0_rd_data&{512/2{bank7_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank8_wt_rd_data = {bank8_ram1_rd_data&{512/2{bank8_ram1_wt_rd_valid}},
bank8_ram0_rd_data&{512/2{bank8_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank9_wt_rd_data = {bank9_ram1_rd_data&{512/2{bank9_ram1_wt_rd_valid}},
bank9_ram0_rd_data&{512/2{bank9_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank10_wt_rd_data = {bank10_ram1_rd_data&{512/2{bank10_ram1_wt_rd_valid}},
bank10_ram0_rd_data&{512/2{bank10_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank11_wt_rd_data = {bank11_ram1_rd_data&{512/2{bank11_ram1_wt_rd_valid}},
bank11_ram0_rd_data&{512/2{bank11_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank12_wt_rd_data = {bank12_ram1_rd_data&{512/2{bank12_ram1_wt_rd_valid}},
bank12_ram0_rd_data&{512/2{bank12_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank13_wt_rd_data = {bank13_ram1_rd_data&{512/2{bank13_ram1_wt_rd_valid}},
bank13_ram0_rd_data&{512/2{bank13_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank14_wt_rd_data = {bank14_ram1_rd_data&{512/2{bank14_ram1_wt_rd_valid}},
bank14_ram0_rd_data&{512/2{bank14_ram0_wt_rd_valid}}}; 
wire [512-1:0] bank15_wt_rd_data = {bank15_ram1_rd_data&{512/2{bank15_ram1_wt_rd_valid}},
bank15_ram0_rd_data&{512/2{bank15_ram0_wt_rd_valid}}}; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
// pipe solution. for timing concern, 4 level pipe.
//: my $kk=512;
//: for (my $i=0; $i<16; $i++){
//: &eperl::flop("-wid ${kk} -norst -q l1group${i}_wt_rd_data   -d bank${i}_wt_rd_data");
//: }
//:
//: for (my $i=0; $i<16/4; $i++){
//: my $ni=$i*4;
//: my $nii=$i*4+1;
//: my $niii=$i*4+2;
//: my $niiii=$i*4+3;
//: print qq(
//: wire [${kk}-1:0] l2group${i}_wt_rd_data_w = l1group${ni}_wt_rd_data | l1group${nii}_wt_rd_data | l1group${niii}_wt_rd_data | l1group${niiii}_wt_rd_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l2group${i}_wt_rd_data   -d l2group${i}_wt_rd_data_w");
//: }
//:
//: for (my $i=0; $i<16/16; $i++){
//: my $ni=$i*4;
//: my $nii=$i*4+1;
//: my $niii=$i*4+2;
//: my $niiii=$i*4+3;
//: print qq(
//: wire [${kk}-1:0] l3group${i}_wt_rd_data_w = l2group${ni}_wt_rd_data | l2group${nii}_wt_rd_data | l2group${niii}_wt_rd_data | l2group${niiii}_wt_rd_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l3group${i}_wt_rd_data   -d l3group${i}_wt_rd_data_w");
//: }
//:
//: if(16==16){
//: &eperl::flop("-wid ${kk} -norst -q l4group_wt_rd_data   -d l3group0_wt_rd_data");
//: }
//: if(16==32) {
//: print qq(
//: wire [${kk}-1:0] l4group_wt_rd_data_w = l3group0_wt_rd_data | l3group1_wt_rd_data;
//: );
//: &eperl::flop("-wid ${kk} -norst -q l4group_wt_rd_data   -d l4group_wt_rd_data_w");
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg [511:0] l1group0_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group0_wt_rd_data <= bank0_wt_rd_data;
end
reg [511:0] l1group1_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group1_wt_rd_data <= bank1_wt_rd_data;
end
reg [511:0] l1group2_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group2_wt_rd_data <= bank2_wt_rd_data;
end
reg [511:0] l1group3_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group3_wt_rd_data <= bank3_wt_rd_data;
end
reg [511:0] l1group4_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group4_wt_rd_data <= bank4_wt_rd_data;
end
reg [511:0] l1group5_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group5_wt_rd_data <= bank5_wt_rd_data;
end
reg [511:0] l1group6_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group6_wt_rd_data <= bank6_wt_rd_data;
end
reg [511:0] l1group7_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group7_wt_rd_data <= bank7_wt_rd_data;
end
reg [511:0] l1group8_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group8_wt_rd_data <= bank8_wt_rd_data;
end
reg [511:0] l1group9_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group9_wt_rd_data <= bank9_wt_rd_data;
end
reg [511:0] l1group10_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group10_wt_rd_data <= bank10_wt_rd_data;
end
reg [511:0] l1group11_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group11_wt_rd_data <= bank11_wt_rd_data;
end
reg [511:0] l1group12_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group12_wt_rd_data <= bank12_wt_rd_data;
end
reg [511:0] l1group13_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group13_wt_rd_data <= bank13_wt_rd_data;
end
reg [511:0] l1group14_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group14_wt_rd_data <= bank14_wt_rd_data;
end
reg [511:0] l1group15_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l1group15_wt_rd_data <= bank15_wt_rd_data;
end

wire [512-1:0] l2group0_wt_rd_data_w = l1group0_wt_rd_data | l1group1_wt_rd_data | l1group2_wt_rd_data | l1group3_wt_rd_data;
reg [511:0] l2group0_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group0_wt_rd_data <= l2group0_wt_rd_data_w;
end

wire [512-1:0] l2group1_wt_rd_data_w = l1group4_wt_rd_data | l1group5_wt_rd_data | l1group6_wt_rd_data | l1group7_wt_rd_data;
reg [511:0] l2group1_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group1_wt_rd_data <= l2group1_wt_rd_data_w;
end

wire [512-1:0] l2group2_wt_rd_data_w = l1group8_wt_rd_data | l1group9_wt_rd_data | l1group10_wt_rd_data | l1group11_wt_rd_data;
reg [511:0] l2group2_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group2_wt_rd_data <= l2group2_wt_rd_data_w;
end

wire [512-1:0] l2group3_wt_rd_data_w = l1group12_wt_rd_data | l1group13_wt_rd_data | l1group14_wt_rd_data | l1group15_wt_rd_data;
reg [511:0] l2group3_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l2group3_wt_rd_data <= l2group3_wt_rd_data_w;
end

wire [512-1:0] l3group0_wt_rd_data_w = l2group0_wt_rd_data | l2group1_wt_rd_data | l2group2_wt_rd_data | l2group3_wt_rd_data;
reg [511:0] l3group0_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l3group0_wt_rd_data <= l3group0_wt_rd_data_w;
end
reg [511:0] l4group_wt_rd_data;
always @(posedge nvdla_core_clk) begin
       l4group_wt_rd_data <= l3group0_wt_rd_data;
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
wire[512 -1:0] sc2buf_wt_rd_data = l4group_wt_rd_data[512 -1:0];
////get sc weight read data.
////: my $t1="";
////: my $kk=CBUF_RD_PORT_WIDTH;
////: for(my $j=0; $j<CBUF_BANK_NUMBER ; $j++){
////:         $t1 .= "bank${j}_wt_rd_data|";    
////:     }
////: print "wire[${kk}-1:0] sc2buf_wt_rd_data =".${t1}."{${kk}{1'b0}}; \n";
/////////////////step4: read WMB handle
//decode read wmb address to sram.
//: my $bank_slice= "12:9"; #address part for select bank
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: for(my $j=16 -1; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: my $kdiv2 = int($k/2);
//: my $kdiv4 = int($k/4);
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire bank${j}_ram${k}_wmb_rd_en = sc2buf_wmb_rd_en&&(sc2buf_wmb_rd_addr[${bank_slice}]==${j}); )
//: }
//: if(2==1){
//: print qq(
//: wire bank${j}_ram${k}_wmb_rd_en = sc2buf_wmb_rd_en&&(sc2buf_wmb_rd_addr[${bank_slice}]==${j})&&(sc2buf_wmb_rd_addr[0]==${k}); )
//: }
//: if(2==3){
//: print qq(
//: wire bank${j}_ram${k}_wmb_rd_en = sc2buf_wmb_rd_en&&(sc2buf_wmb_rd_addr[${bank_slice}]==${j})&&(sc2buf_wmb_rd_addr[0]==${kdiv2}); )
//: }
//: if(2==5){
//: print qq(
//: wire bank${j}_ram${k}_wmb_rd_en = sc2buf_wmb_rd_en&&(sc2buf_wmb_rd_addr[${bank_slice}]==${j})&&(sc2buf_wmb_rd_addr[0]==${kdiv4}); )
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
`ifdef  CBUF_WEIGHT_COMPRESSED
wire bank15_ram0_wmb_rd_en = sc2buf_wmb_rd_en&&(sc2buf_wmb_rd_addr[12:9]==15); 
wire bank15_ram1_wmb_rd_en = sc2buf_wmb_rd_en&&(sc2buf_wmb_rd_addr[12:9]==15); 
//| eperl: generated_end (DO NOT EDIT ABOVE)
`endif
//get sram wmb read address.
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: for(my $j=16 -1; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: if((2==0)||(2==2)||(2==4)){
//: print qq(
//: wire [9 -1:0] bank${j}_ram${k}_wmb_rd_addr = {9{bank${j}_ram${k}_wmb_rd_en}}&(sc2buf_wmb_rd_addr[9 -1:0]); )
//: }
//: if((2==1)||(2==3)||(2==5)){
//: print qq(
//: wire [9 -1:0] bank${j}_ram${k}_wmb_rd_addr = {9{bank${j}_ram${k}_wmb_rd_en}}&(sc2buf_wmb_rd_addr[9:1]); )
//: }
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
`ifdef  CBUF_WEIGHT_COMPRESSED
wire [9 -1:0] bank15_ram0_wmb_rd_addr = {9{bank15_ram0_wmb_rd_en}}&(sc2buf_wmb_rd_addr[9 -1:0]); 
wire [9 -1:0] bank15_ram1_wmb_rd_addr = {9{bank15_ram1_wmb_rd_en}}&(sc2buf_wmb_rd_addr[9 -1:0]); 
//| eperl: generated_end (DO NOT EDIT ABOVE)
`endif
//add flop for sram wmb read en
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED \n";
//: for(my $j=16 -1; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: &eperl::flop("-q bank${j}_ram${k}_wmb_rd_en_d1 -d  bank${j}_ram${k}_wmb_rd_en");
//: &eperl::flop("-q bank${j}_ram${k}_wmb_rd_en_d2 -d  bank${j}_ram${k}_wmb_rd_en_d1");
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
`ifdef  CBUF_WEIGHT_COMPRESSED 
reg  bank15_ram0_wmb_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_wmb_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram0_wmb_rd_en_d1 <= bank15_ram0_wmb_rd_en;
   end
end
reg  bank15_ram0_wmb_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_wmb_rd_en_d2 <= 'b0;
   end else begin
       bank15_ram0_wmb_rd_en_d2 <= bank15_ram0_wmb_rd_en_d1;
   end
end
reg  bank15_ram1_wmb_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_wmb_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram1_wmb_rd_en_d1 <= bank15_ram1_wmb_rd_en;
   end
end
reg  bank15_ram1_wmb_rd_en_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_wmb_rd_en_d2 <= 'b0;
   end else begin
       bank15_ram1_wmb_rd_en_d2 <= bank15_ram1_wmb_rd_en_d1;
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
`endif
//get sram wmb read valid.
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: for(my $j=16 -1; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: print qq(
//: wire bank${j}_ram${k}_wmb_rd_valid = bank${j}_ram${k}_wmb_rd_en_d2; )
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
`ifdef  CBUF_WEIGHT_COMPRESSED
wire bank15_ram0_wmb_rd_valid = bank15_ram0_wmb_rd_en_d2; 
wire bank15_ram1_wmb_rd_valid = bank15_ram1_wmb_rd_en_d2; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
`endif
//get sc wmb read valid.
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: my $t1="";
//: for(my $j=16 -1; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: $t1 .= "bank${j}_ram${k}_wmb_rd_valid|";
//: }
//: }
//: print " wire [0:0] sc2buf_wmb_rd_valid_w ="." ${t1}"."1'b0; \n";
//: &eperl::retime("-O sc2buf_wmb_rd_valid -i sc2buf_wmb_rd_valid_w -stage 4 -clk nvdla_core_clk");
//| eperl: generated_beg (DO NOT EDIT BELOW)
`ifdef  CBUF_WEIGHT_COMPRESSED wire [0:0] sc2buf_wmb_rd_valid_w = bank15_ram0_wmb_rd_valid|bank15_ram1_wmb_rd_valid|1'b0; 
reg  sc2buf_wmb_rd_valid_w_d1;
always @(posedge nvdla_core_clk) begin
        sc2buf_wmb_rd_valid_w_d1 <= sc2buf_wmb_rd_valid_w;
end

reg  sc2buf_wmb_rd_valid_w_d2;
always @(posedge nvdla_core_clk) begin
        sc2buf_wmb_rd_valid_w_d2 <= sc2buf_wmb_rd_valid_w_d1;
end

reg  sc2buf_wmb_rd_valid_w_d3;
always @(posedge nvdla_core_clk) begin
        sc2buf_wmb_rd_valid_w_d3 <= sc2buf_wmb_rd_valid_w_d2;
end

reg  sc2buf_wmb_rd_valid_w_d4;
always @(posedge nvdla_core_clk) begin
        sc2buf_wmb_rd_valid_w_d4 <= sc2buf_wmb_rd_valid_w_d3;
end

wire  sc2buf_wmb_rd_valid;
assign sc2buf_wmb_rd_valid = sc2buf_wmb_rd_valid_w_d4;


//| eperl: generated_end (DO NOT EDIT ABOVE)
`endif
//get sc wmb read data.
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: my $t1="";
//: my $t2="";
//: my $kk=512;
//: for(my $j=16 -1; $j<16 ; $j++){
//: for(my $k=0; $k<2 ; $k++){
//: if((2==0)||(2==2)||(2==4)){
//: $t1 .="{CBUF_RAM_WIDTH{bank${j}_ram${k}_wmb_rd_valid}} & bank${j}_ram${k}_wmb_rd_data ,";
//: }
//: }
//: }
//: print "wire[${kk}-1:0] sc2buf_wmb_rd_data ="."{"."${t1}"."}; \n";
//: for(my $j=16 -1; $j<16 ; $j++){
//: if(2==1){
//: $t1 .="{CBUF_RAM_WIDTH{bank${j}_ram0_wmb_rd_valid}} & bank${j}_ram0_wmb_rd_data";
//: $t2 .="{CBUF_RAM_WIDTH{bank${j}_ram1_wmb_rd_valid}} & bank${j}_ram1_wmb_rd_data";
//: }
//: if(2==3){
//: $t1 .="{{CBUF_RAM_WIDTH{bank${j}_ram1_wmb_rd_valid}} & bank${j}_ram1_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram0_wmb_rd_valid}} & bank${j}_ram0_wmb_rd_data}";
//: $t2 .="{{CBUF_RAM_WIDTH{bank${j}_ram3_wmb_rd_valid}} & bank${j}_ram3_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram2_wmb_rd_valid}} & bank${j}_ram2_wmb_rd_data}";
//: }
//: if(2==5){
//: $t1 .="{{CBUF_RAM_WIDTH{bank${j}_ram3_wmb_rd_valid}} & bank${j}_ram3_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram2_wmb_rd_valid}} & bank${j}_ram2_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram1_wmb_rd_valid}} & bank${j}_ram1_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram0_wmb_rd_valid}} & bank${j}_ram0_wmb_rd_data}";
//: $t2 .="{{CBUF_RAM_WIDTH{bank${j}_ram7_wmb_rd_valid}} & bank${j}_ram7_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram6_wmb_rd_valid}} & bank${j}_ram6_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram5_wmb_rd_valid}} & bank${j}_ram5_wmb_rd_data,{CBUF_RAM_WIDTH{bank${j}_ram4_wmb_rd_valid}} & bank${j}_ram4_wmb_rd_data}";
//: }
//: }
//: print "wire[${kk}-1:0] wmb_rd_data ="."(${t1})|(${t2}); \n";
//: &eperl::retime("-wid ${kk} -o sc2buf_wmb_rd_data -i wmb_rd_data -stage 4 -clk nvdla_core_clk");
//| eperl: generated_beg (DO NOT EDIT BELOW)
`ifdef  CBUF_WEIGHT_COMPRESSEDwire[512-1:0] sc2buf_wmb_rd_data ={{CBUF_RAM_WIDTH{bank15_ram0_wmb_rd_valid}} & bank15_ram0_wmb_rd_data ,{CBUF_RAM_WIDTH{bank15_ram1_wmb_rd_valid}} & bank15_ram1_wmb_rd_data ,}; 
wire[512-1:0] wmb_rd_data =({CBUF_RAM_WIDTH{bank15_ram0_wmb_rd_valid}} & bank15_ram0_wmb_rd_data ,{CBUF_RAM_WIDTH{bank15_ram1_wmb_rd_valid}} & bank15_ram1_wmb_rd_data ,)|(); 
reg [512-1:0] wmb_rd_data_d1;
always @(posedge nvdla_core_clk) begin
        wmb_rd_data_d1[512-1:0] <= wmb_rd_data[512-1:0];
end

reg [512-1:0] wmb_rd_data_d2;
always @(posedge nvdla_core_clk) begin
        wmb_rd_data_d2[512-1:0] <= wmb_rd_data_d1[512-1:0];
end

reg [512-1:0] wmb_rd_data_d3;
always @(posedge nvdla_core_clk) begin
        wmb_rd_data_d3[512-1:0] <= wmb_rd_data_d2[512-1:0];
end

reg [512-1:0] wmb_rd_data_d4;
always @(posedge nvdla_core_clk) begin
        wmb_rd_data_d4[512-1:0] <= wmb_rd_data_d3[512-1:0];
end

wire [512-1:0] sc2buf_wmb_rd_data;
assign sc2buf_wmb_rd_data = wmb_rd_data_d4;


//| eperl: generated_end (DO NOT EDIT ABOVE)
`endif
//get sram read en, data_rd0/data_rd1/weight/wmb
//: if ((2==0)|(2==2)|(2==4)){
//: for (my $i=0; $i<16 -1; $i++){
//: for (my $j=0; $j<2; $j++){
//: print qq(
//: wire bank${i}_ram${j}_rd_en = bank${i}_ram${j}_data_rd_en|bank${i}_ram${j}_wt_rd_en;
//: );
//: }
//: }
//: my $i=16 -1;
//: for (my $j=0; $j<2; $j++){
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: print qq(
//: wire bank${i}_ram${j}_rd_en = bank${i}_ram${j}_data_rd_en|bank${i}_ram${j}_wt_rd_en|bank${i}_ram${j}_wmb_rd_en;
//: `else
//: wire bank${i}_ram${j}_rd_en = bank${i}_ram${j}_data_rd_en|bank${i}_ram${j}_wt_rd_en;
//: `endif
//: );
//: }
//: }
//:
//: if ((2==1)||(2==3)||(2==5)){
//: for (my $i=0; $i<16 -1; $i++){
//: for (my $j=0; $j<2; $j++){
//: print qq(
//: wire bank${i}_ram${j}_rd_en = bank${i}_ram${j}_data_rd0_en|bank${i}_ram${j}_data_rd1_en|bank${i}_ram${j}_wt_rd_en;
//: );
//: }
//: }
//: my $i=16 -1;
//: for (my $j=0; $j<2; $j++){
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: print qq(
//: wire bank${i}_ram${j}_rd_en = bank${i}_ram${j}_data_rd0_en|bank${i}_ram${j}_data_rd1_en|bank${i}_ram${j}_wt_rd_en|bank${i}_ram${j}_wmb_rd_en;
//: `else
//: wire bank${i}_ram${j}_rd_en = bank${i}_ram${j}_data_rd0_en|bank${i}_ram${j}_data_rd1_en|bank${i}_ram${j}_wt_rd_en;
//: `endif
//: );
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire bank0_ram0_rd_en = bank0_ram0_data_rd_en|bank0_ram0_wt_rd_en;

wire bank0_ram1_rd_en = bank0_ram1_data_rd_en|bank0_ram1_wt_rd_en;

wire bank1_ram0_rd_en = bank1_ram0_data_rd_en|bank1_ram0_wt_rd_en;

wire bank1_ram1_rd_en = bank1_ram1_data_rd_en|bank1_ram1_wt_rd_en;

wire bank2_ram0_rd_en = bank2_ram0_data_rd_en|bank2_ram0_wt_rd_en;

wire bank2_ram1_rd_en = bank2_ram1_data_rd_en|bank2_ram1_wt_rd_en;

wire bank3_ram0_rd_en = bank3_ram0_data_rd_en|bank3_ram0_wt_rd_en;

wire bank3_ram1_rd_en = bank3_ram1_data_rd_en|bank3_ram1_wt_rd_en;

wire bank4_ram0_rd_en = bank4_ram0_data_rd_en|bank4_ram0_wt_rd_en;

wire bank4_ram1_rd_en = bank4_ram1_data_rd_en|bank4_ram1_wt_rd_en;

wire bank5_ram0_rd_en = bank5_ram0_data_rd_en|bank5_ram0_wt_rd_en;

wire bank5_ram1_rd_en = bank5_ram1_data_rd_en|bank5_ram1_wt_rd_en;

wire bank6_ram0_rd_en = bank6_ram0_data_rd_en|bank6_ram0_wt_rd_en;

wire bank6_ram1_rd_en = bank6_ram1_data_rd_en|bank6_ram1_wt_rd_en;

wire bank7_ram0_rd_en = bank7_ram0_data_rd_en|bank7_ram0_wt_rd_en;

wire bank7_ram1_rd_en = bank7_ram1_data_rd_en|bank7_ram1_wt_rd_en;

wire bank8_ram0_rd_en = bank8_ram0_data_rd_en|bank8_ram0_wt_rd_en;

wire bank8_ram1_rd_en = bank8_ram1_data_rd_en|bank8_ram1_wt_rd_en;

wire bank9_ram0_rd_en = bank9_ram0_data_rd_en|bank9_ram0_wt_rd_en;

wire bank9_ram1_rd_en = bank9_ram1_data_rd_en|bank9_ram1_wt_rd_en;

wire bank10_ram0_rd_en = bank10_ram0_data_rd_en|bank10_ram0_wt_rd_en;

wire bank10_ram1_rd_en = bank10_ram1_data_rd_en|bank10_ram1_wt_rd_en;

wire bank11_ram0_rd_en = bank11_ram0_data_rd_en|bank11_ram0_wt_rd_en;

wire bank11_ram1_rd_en = bank11_ram1_data_rd_en|bank11_ram1_wt_rd_en;

wire bank12_ram0_rd_en = bank12_ram0_data_rd_en|bank12_ram0_wt_rd_en;

wire bank12_ram1_rd_en = bank12_ram1_data_rd_en|bank12_ram1_wt_rd_en;

wire bank13_ram0_rd_en = bank13_ram0_data_rd_en|bank13_ram0_wt_rd_en;

wire bank13_ram1_rd_en = bank13_ram1_data_rd_en|bank13_ram1_wt_rd_en;

wire bank14_ram0_rd_en = bank14_ram0_data_rd_en|bank14_ram0_wt_rd_en;

wire bank14_ram1_rd_en = bank14_ram1_data_rd_en|bank14_ram1_wt_rd_en;
`ifdef  CBUF_WEIGHT_COMPRESSED
wire bank15_ram0_rd_en = bank15_ram0_data_rd_en|bank15_ram0_wt_rd_en|bank15_ram0_wmb_rd_en;
`else
wire bank15_ram0_rd_en = bank15_ram0_data_rd_en|bank15_ram0_wt_rd_en;
`endif
`ifdef  CBUF_WEIGHT_COMPRESSED
wire bank15_ram1_rd_en = bank15_ram1_data_rd_en|bank15_ram1_wt_rd_en|bank15_ram1_wmb_rd_en;
`else
wire bank15_ram1_rd_en = bank15_ram1_data_rd_en|bank15_ram1_wt_rd_en;
`endif

//| eperl: generated_end (DO NOT EDIT ABOVE)
//get sram read addr, data_rd0/data_rd1/weight/wmb
//: my $kk=9;
//: if ((2==0)|(2==2)|(2==4)){
//: for (my $i=0; $i<16 -1; $i++){
//: for (my $j=0; $j<2; $j++){
//: print qq(
//: wire[${kk}-1:0] bank${i}_ram${j}_rd_addr = {${kk}{bank${i}_ram${j}_data_rd_en}}&bank${i}_ram${j}_data_rd_addr|
//: {${kk}{bank${i}_ram${j}_wt_rd_en}}&bank${i}_ram${j}_wt_rd_addr;
//: );
//: }
//: }
//: my $i=16 -1;
//: for (my $j=0; $j<2; $j++){
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: print qq(
//: wire[${kk}-1:0] bank${i}_ram${j}_rd_addr = {${kk}{bank${i}_ram${j}_data_rd_en}}&bank${i}_ram${j}_data_rd_addr|
//: {${kk}{bank${i}_ram${j}_wt_rd_en}}&bank${i}_ram${j}_wt_rd_addr|
//: {${kk}{bank${i}_ram${j}_wmb_rd_en}}&bank${i}_ram${j}_wmb_rd_addr;
//: `else
//: wire[${kk}-1:0] bank${i}_ram${j}_rd_addr = {${kk}{bank${i}_ram${j}_data_rd_en}}&bank${i}_ram${j}_data_rd_addr|
//: {${kk}{bank${i}_ram${j}_wt_rd_en}}&bank${i}_ram${j}_wt_rd_addr;
//: `endif
//: );
//: }
//: }
//:
//: if ((2==1)||(2==3)||(2==5)){
//: for (my $i=0; $i<16 -1; $i++){
//: for (my $j=0; $j<2; $j++){
//: print qq(
//: wire[${kk}-1:0] bank${i}_ram${j}_rd_addr = {${kk}{bank${i}_ram${j}_data_rd0_en}}&bank${i}_ram${j}_data_rd0_addr|
//: {${kk}{bank${i}_ram${j}_data_rd1_en}}&bank${i}_ram${j}_data_rd1_addr|
//: {${kk}{bank${i}_ram${j}_wt_rd_en}}&bank${i}_ram${j}_wt_rd_addr;
//: );
//: }
//: }
//: my $i=16 -1;
//: for (my $j=0; $j<2; $j++){
//: print "`ifdef  CBUF_WEIGHT_COMPRESSED";
//: print qq(
//: wire[${kk}-1:0] bank${i}_ram${j}_rd_addr = {${kk}{bank${i}_ram${j}_data_rd0_en}}&bank${i}_ram${j}_data_rd0_addr|
//: {${kk}{bank${i}_ram${j}_data_rd1_en}}&bank${i}_ram${j}_data_rd1_addr|
//: {${kk}{bank${i}_ram${j}_wt_rd_en}}&bank${i}_ram${j}_wt_rd_addr|
//: {${kk}{bank${i}_ram${j}_wmb_rd_en}}&bank${i}_ram${j}_wmb_rd_addr;
//: `else
//: wire[${kk}-1:0] bank${i}_ram${j}_rd_addr = {${kk}{bank${i}_ram${j}_data_rd0_en}}&bank${i}_ram${j}_data_rd0_addr|
//: {${kk}{bank${i}_ram${j}_data_rd1_en}}&bank${i}_ram${j}_data_rd1_addr|
//: {${kk}{bank${i}_ram${j}_wt_rd_en}}&bank${i}_ram${j}_wt_rd_addr;
//: `endif
//: );
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire[9-1:0] bank0_ram0_rd_addr = {9{bank0_ram0_data_rd_en}}&bank0_ram0_data_rd_addr|
{9{bank0_ram0_wt_rd_en}}&bank0_ram0_wt_rd_addr;

wire[9-1:0] bank0_ram1_rd_addr = {9{bank0_ram1_data_rd_en}}&bank0_ram1_data_rd_addr|
{9{bank0_ram1_wt_rd_en}}&bank0_ram1_wt_rd_addr;

wire[9-1:0] bank1_ram0_rd_addr = {9{bank1_ram0_data_rd_en}}&bank1_ram0_data_rd_addr|
{9{bank1_ram0_wt_rd_en}}&bank1_ram0_wt_rd_addr;

wire[9-1:0] bank1_ram1_rd_addr = {9{bank1_ram1_data_rd_en}}&bank1_ram1_data_rd_addr|
{9{bank1_ram1_wt_rd_en}}&bank1_ram1_wt_rd_addr;

wire[9-1:0] bank2_ram0_rd_addr = {9{bank2_ram0_data_rd_en}}&bank2_ram0_data_rd_addr|
{9{bank2_ram0_wt_rd_en}}&bank2_ram0_wt_rd_addr;

wire[9-1:0] bank2_ram1_rd_addr = {9{bank2_ram1_data_rd_en}}&bank2_ram1_data_rd_addr|
{9{bank2_ram1_wt_rd_en}}&bank2_ram1_wt_rd_addr;

wire[9-1:0] bank3_ram0_rd_addr = {9{bank3_ram0_data_rd_en}}&bank3_ram0_data_rd_addr|
{9{bank3_ram0_wt_rd_en}}&bank3_ram0_wt_rd_addr;

wire[9-1:0] bank3_ram1_rd_addr = {9{bank3_ram1_data_rd_en}}&bank3_ram1_data_rd_addr|
{9{bank3_ram1_wt_rd_en}}&bank3_ram1_wt_rd_addr;

wire[9-1:0] bank4_ram0_rd_addr = {9{bank4_ram0_data_rd_en}}&bank4_ram0_data_rd_addr|
{9{bank4_ram0_wt_rd_en}}&bank4_ram0_wt_rd_addr;

wire[9-1:0] bank4_ram1_rd_addr = {9{bank4_ram1_data_rd_en}}&bank4_ram1_data_rd_addr|
{9{bank4_ram1_wt_rd_en}}&bank4_ram1_wt_rd_addr;

wire[9-1:0] bank5_ram0_rd_addr = {9{bank5_ram0_data_rd_en}}&bank5_ram0_data_rd_addr|
{9{bank5_ram0_wt_rd_en}}&bank5_ram0_wt_rd_addr;

wire[9-1:0] bank5_ram1_rd_addr = {9{bank5_ram1_data_rd_en}}&bank5_ram1_data_rd_addr|
{9{bank5_ram1_wt_rd_en}}&bank5_ram1_wt_rd_addr;

wire[9-1:0] bank6_ram0_rd_addr = {9{bank6_ram0_data_rd_en}}&bank6_ram0_data_rd_addr|
{9{bank6_ram0_wt_rd_en}}&bank6_ram0_wt_rd_addr;

wire[9-1:0] bank6_ram1_rd_addr = {9{bank6_ram1_data_rd_en}}&bank6_ram1_data_rd_addr|
{9{bank6_ram1_wt_rd_en}}&bank6_ram1_wt_rd_addr;

wire[9-1:0] bank7_ram0_rd_addr = {9{bank7_ram0_data_rd_en}}&bank7_ram0_data_rd_addr|
{9{bank7_ram0_wt_rd_en}}&bank7_ram0_wt_rd_addr;

wire[9-1:0] bank7_ram1_rd_addr = {9{bank7_ram1_data_rd_en}}&bank7_ram1_data_rd_addr|
{9{bank7_ram1_wt_rd_en}}&bank7_ram1_wt_rd_addr;

wire[9-1:0] bank8_ram0_rd_addr = {9{bank8_ram0_data_rd_en}}&bank8_ram0_data_rd_addr|
{9{bank8_ram0_wt_rd_en}}&bank8_ram0_wt_rd_addr;

wire[9-1:0] bank8_ram1_rd_addr = {9{bank8_ram1_data_rd_en}}&bank8_ram1_data_rd_addr|
{9{bank8_ram1_wt_rd_en}}&bank8_ram1_wt_rd_addr;

wire[9-1:0] bank9_ram0_rd_addr = {9{bank9_ram0_data_rd_en}}&bank9_ram0_data_rd_addr|
{9{bank9_ram0_wt_rd_en}}&bank9_ram0_wt_rd_addr;

wire[9-1:0] bank9_ram1_rd_addr = {9{bank9_ram1_data_rd_en}}&bank9_ram1_data_rd_addr|
{9{bank9_ram1_wt_rd_en}}&bank9_ram1_wt_rd_addr;

wire[9-1:0] bank10_ram0_rd_addr = {9{bank10_ram0_data_rd_en}}&bank10_ram0_data_rd_addr|
{9{bank10_ram0_wt_rd_en}}&bank10_ram0_wt_rd_addr;

wire[9-1:0] bank10_ram1_rd_addr = {9{bank10_ram1_data_rd_en}}&bank10_ram1_data_rd_addr|
{9{bank10_ram1_wt_rd_en}}&bank10_ram1_wt_rd_addr;

wire[9-1:0] bank11_ram0_rd_addr = {9{bank11_ram0_data_rd_en}}&bank11_ram0_data_rd_addr|
{9{bank11_ram0_wt_rd_en}}&bank11_ram0_wt_rd_addr;

wire[9-1:0] bank11_ram1_rd_addr = {9{bank11_ram1_data_rd_en}}&bank11_ram1_data_rd_addr|
{9{bank11_ram1_wt_rd_en}}&bank11_ram1_wt_rd_addr;

wire[9-1:0] bank12_ram0_rd_addr = {9{bank12_ram0_data_rd_en}}&bank12_ram0_data_rd_addr|
{9{bank12_ram0_wt_rd_en}}&bank12_ram0_wt_rd_addr;

wire[9-1:0] bank12_ram1_rd_addr = {9{bank12_ram1_data_rd_en}}&bank12_ram1_data_rd_addr|
{9{bank12_ram1_wt_rd_en}}&bank12_ram1_wt_rd_addr;

wire[9-1:0] bank13_ram0_rd_addr = {9{bank13_ram0_data_rd_en}}&bank13_ram0_data_rd_addr|
{9{bank13_ram0_wt_rd_en}}&bank13_ram0_wt_rd_addr;

wire[9-1:0] bank13_ram1_rd_addr = {9{bank13_ram1_data_rd_en}}&bank13_ram1_data_rd_addr|
{9{bank13_ram1_wt_rd_en}}&bank13_ram1_wt_rd_addr;

wire[9-1:0] bank14_ram0_rd_addr = {9{bank14_ram0_data_rd_en}}&bank14_ram0_data_rd_addr|
{9{bank14_ram0_wt_rd_en}}&bank14_ram0_wt_rd_addr;

wire[9-1:0] bank14_ram1_rd_addr = {9{bank14_ram1_data_rd_en}}&bank14_ram1_data_rd_addr|
{9{bank14_ram1_wt_rd_en}}&bank14_ram1_wt_rd_addr;
`ifdef  CBUF_WEIGHT_COMPRESSED
wire[9-1:0] bank15_ram0_rd_addr = {9{bank15_ram0_data_rd_en}}&bank15_ram0_data_rd_addr|
{9{bank15_ram0_wt_rd_en}}&bank15_ram0_wt_rd_addr|
{9{bank15_ram0_wmb_rd_en}}&bank15_ram0_wmb_rd_addr;
`else
wire[9-1:0] bank15_ram0_rd_addr = {9{bank15_ram0_data_rd_en}}&bank15_ram0_data_rd_addr|
{9{bank15_ram0_wt_rd_en}}&bank15_ram0_wt_rd_addr;
`endif
`ifdef  CBUF_WEIGHT_COMPRESSED
wire[9-1:0] bank15_ram1_rd_addr = {9{bank15_ram1_data_rd_en}}&bank15_ram1_data_rd_addr|
{9{bank15_ram1_wt_rd_en}}&bank15_ram1_wt_rd_addr|
{9{bank15_ram1_wmb_rd_en}}&bank15_ram1_wmb_rd_addr;
`else
wire[9-1:0] bank15_ram1_rd_addr = {9{bank15_ram1_data_rd_en}}&bank15_ram1_data_rd_addr|
{9{bank15_ram1_wt_rd_en}}&bank15_ram1_wt_rd_addr;
`endif

//| eperl: generated_end (DO NOT EDIT ABOVE)
// add 1 pipe for sram read control signal.
//: my $kk=9;
//: for(my $i=0; $i<16 ; $i++){
//: for(my $j=0; $j<2 ; $j++){
//: &eperl::flop("-q bank${i}_ram${j}_rd_en_d1 -d bank${i}_ram${j}_rd_en");
//: &eperl::flop("-wid ${kk} -q bank${i}_ram${j}_rd_addr_d1 -d bank${i}_ram${j}_rd_addr");
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg  bank0_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank0_ram0_rd_en_d1 <= bank0_ram0_rd_en;
   end
end
reg [8:0] bank0_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank0_ram0_rd_addr_d1 <= bank0_ram0_rd_addr;
   end
end
reg  bank0_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank0_ram1_rd_en_d1 <= bank0_ram1_rd_en;
   end
end
reg [8:0] bank0_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank0_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank0_ram1_rd_addr_d1 <= bank0_ram1_rd_addr;
   end
end
reg  bank1_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank1_ram0_rd_en_d1 <= bank1_ram0_rd_en;
   end
end
reg [8:0] bank1_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank1_ram0_rd_addr_d1 <= bank1_ram0_rd_addr;
   end
end
reg  bank1_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank1_ram1_rd_en_d1 <= bank1_ram1_rd_en;
   end
end
reg [8:0] bank1_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank1_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank1_ram1_rd_addr_d1 <= bank1_ram1_rd_addr;
   end
end
reg  bank2_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank2_ram0_rd_en_d1 <= bank2_ram0_rd_en;
   end
end
reg [8:0] bank2_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank2_ram0_rd_addr_d1 <= bank2_ram0_rd_addr;
   end
end
reg  bank2_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank2_ram1_rd_en_d1 <= bank2_ram1_rd_en;
   end
end
reg [8:0] bank2_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank2_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank2_ram1_rd_addr_d1 <= bank2_ram1_rd_addr;
   end
end
reg  bank3_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank3_ram0_rd_en_d1 <= bank3_ram0_rd_en;
   end
end
reg [8:0] bank3_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank3_ram0_rd_addr_d1 <= bank3_ram0_rd_addr;
   end
end
reg  bank3_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank3_ram1_rd_en_d1 <= bank3_ram1_rd_en;
   end
end
reg [8:0] bank3_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank3_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank3_ram1_rd_addr_d1 <= bank3_ram1_rd_addr;
   end
end
reg  bank4_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank4_ram0_rd_en_d1 <= bank4_ram0_rd_en;
   end
end
reg [8:0] bank4_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank4_ram0_rd_addr_d1 <= bank4_ram0_rd_addr;
   end
end
reg  bank4_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank4_ram1_rd_en_d1 <= bank4_ram1_rd_en;
   end
end
reg [8:0] bank4_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank4_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank4_ram1_rd_addr_d1 <= bank4_ram1_rd_addr;
   end
end
reg  bank5_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank5_ram0_rd_en_d1 <= bank5_ram0_rd_en;
   end
end
reg [8:0] bank5_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank5_ram0_rd_addr_d1 <= bank5_ram0_rd_addr;
   end
end
reg  bank5_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank5_ram1_rd_en_d1 <= bank5_ram1_rd_en;
   end
end
reg [8:0] bank5_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank5_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank5_ram1_rd_addr_d1 <= bank5_ram1_rd_addr;
   end
end
reg  bank6_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank6_ram0_rd_en_d1 <= bank6_ram0_rd_en;
   end
end
reg [8:0] bank6_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank6_ram0_rd_addr_d1 <= bank6_ram0_rd_addr;
   end
end
reg  bank6_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank6_ram1_rd_en_d1 <= bank6_ram1_rd_en;
   end
end
reg [8:0] bank6_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank6_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank6_ram1_rd_addr_d1 <= bank6_ram1_rd_addr;
   end
end
reg  bank7_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank7_ram0_rd_en_d1 <= bank7_ram0_rd_en;
   end
end
reg [8:0] bank7_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank7_ram0_rd_addr_d1 <= bank7_ram0_rd_addr;
   end
end
reg  bank7_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank7_ram1_rd_en_d1 <= bank7_ram1_rd_en;
   end
end
reg [8:0] bank7_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank7_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank7_ram1_rd_addr_d1 <= bank7_ram1_rd_addr;
   end
end
reg  bank8_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank8_ram0_rd_en_d1 <= bank8_ram0_rd_en;
   end
end
reg [8:0] bank8_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank8_ram0_rd_addr_d1 <= bank8_ram0_rd_addr;
   end
end
reg  bank8_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank8_ram1_rd_en_d1 <= bank8_ram1_rd_en;
   end
end
reg [8:0] bank8_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank8_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank8_ram1_rd_addr_d1 <= bank8_ram1_rd_addr;
   end
end
reg  bank9_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank9_ram0_rd_en_d1 <= bank9_ram0_rd_en;
   end
end
reg [8:0] bank9_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank9_ram0_rd_addr_d1 <= bank9_ram0_rd_addr;
   end
end
reg  bank9_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank9_ram1_rd_en_d1 <= bank9_ram1_rd_en;
   end
end
reg [8:0] bank9_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank9_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank9_ram1_rd_addr_d1 <= bank9_ram1_rd_addr;
   end
end
reg  bank10_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank10_ram0_rd_en_d1 <= bank10_ram0_rd_en;
   end
end
reg [8:0] bank10_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank10_ram0_rd_addr_d1 <= bank10_ram0_rd_addr;
   end
end
reg  bank10_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank10_ram1_rd_en_d1 <= bank10_ram1_rd_en;
   end
end
reg [8:0] bank10_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank10_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank10_ram1_rd_addr_d1 <= bank10_ram1_rd_addr;
   end
end
reg  bank11_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank11_ram0_rd_en_d1 <= bank11_ram0_rd_en;
   end
end
reg [8:0] bank11_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank11_ram0_rd_addr_d1 <= bank11_ram0_rd_addr;
   end
end
reg  bank11_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank11_ram1_rd_en_d1 <= bank11_ram1_rd_en;
   end
end
reg [8:0] bank11_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank11_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank11_ram1_rd_addr_d1 <= bank11_ram1_rd_addr;
   end
end
reg  bank12_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank12_ram0_rd_en_d1 <= bank12_ram0_rd_en;
   end
end
reg [8:0] bank12_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank12_ram0_rd_addr_d1 <= bank12_ram0_rd_addr;
   end
end
reg  bank12_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank12_ram1_rd_en_d1 <= bank12_ram1_rd_en;
   end
end
reg [8:0] bank12_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank12_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank12_ram1_rd_addr_d1 <= bank12_ram1_rd_addr;
   end
end
reg  bank13_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank13_ram0_rd_en_d1 <= bank13_ram0_rd_en;
   end
end
reg [8:0] bank13_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank13_ram0_rd_addr_d1 <= bank13_ram0_rd_addr;
   end
end
reg  bank13_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank13_ram1_rd_en_d1 <= bank13_ram1_rd_en;
   end
end
reg [8:0] bank13_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank13_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank13_ram1_rd_addr_d1 <= bank13_ram1_rd_addr;
   end
end
reg  bank14_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank14_ram0_rd_en_d1 <= bank14_ram0_rd_en;
   end
end
reg [8:0] bank14_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank14_ram0_rd_addr_d1 <= bank14_ram0_rd_addr;
   end
end
reg  bank14_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank14_ram1_rd_en_d1 <= bank14_ram1_rd_en;
   end
end
reg [8:0] bank14_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank14_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank14_ram1_rd_addr_d1 <= bank14_ram1_rd_addr;
   end
end
reg  bank15_ram0_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram0_rd_en_d1 <= bank15_ram0_rd_en;
   end
end
reg [8:0] bank15_ram0_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram0_rd_addr_d1 <= 'b0;
   end else begin
       bank15_ram0_rd_addr_d1 <= bank15_ram0_rd_addr;
   end
end
reg  bank15_ram1_rd_en_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_rd_en_d1 <= 'b0;
   end else begin
       bank15_ram1_rd_en_d1 <= bank15_ram1_rd_en;
   end
end
reg [8:0] bank15_ram1_rd_addr_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       bank15_ram1_rd_addr_d1 <= 'b0;
   end else begin
       bank15_ram1_rd_addr_d1 <= bank15_ram1_rd_addr;
   end
end

//| eperl: generated_end (DO NOT EDIT ABOVE)
//instance SRAM.
//: my $dep= 512;
//: my $wid= 512/2;
//: for (my $i=0; $i<16; $i++){
//: for (my $j=0; $j<2; $j++){
//: print qq(
//: nv_ram_rws_${dep}x${wid} u_cbuf_ram_bank${i}_ram${j} (
//: .clk (nvdla_core_clk) //|< i
//: ,.ra (bank${i}_ram${j}_rd_addr_d1[9 -1:0]) //|< r
//: ,.re (bank${i}_ram${j}_rd_en_d1) //|< r
//: ,.dout (bank${i}_ram${j}_rd_data) //|> w
//: ,.wa (bank${i}_ram${j}_wr_addr_d2[9 -1:0]) //|< r
//: ,.we (bank${i}_ram${j}_wr_en_d2) //|< r
//: ,.di (bank${i}_ram${j}_wr_data_d2) //|< r
//: ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
//: );
//: );
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

nv_ram_rws_512x256 u_cbuf_ram_bank0_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank0_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank0_ram0_rd_en_d1) //|< r
,.dout (bank0_ram0_rd_data) //|> w
,.wa (bank0_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank0_ram0_wr_en_d2) //|< r
,.di (bank0_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank0_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank0_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank0_ram1_rd_en_d1) //|< r
,.dout (bank0_ram1_rd_data) //|> w
,.wa (bank0_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank0_ram1_wr_en_d2) //|< r
,.di (bank0_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank1_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank1_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank1_ram0_rd_en_d1) //|< r
,.dout (bank1_ram0_rd_data) //|> w
,.wa (bank1_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank1_ram0_wr_en_d2) //|< r
,.di (bank1_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank1_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank1_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank1_ram1_rd_en_d1) //|< r
,.dout (bank1_ram1_rd_data) //|> w
,.wa (bank1_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank1_ram1_wr_en_d2) //|< r
,.di (bank1_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank2_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank2_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank2_ram0_rd_en_d1) //|< r
,.dout (bank2_ram0_rd_data) //|> w
,.wa (bank2_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank2_ram0_wr_en_d2) //|< r
,.di (bank2_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank2_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank2_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank2_ram1_rd_en_d1) //|< r
,.dout (bank2_ram1_rd_data) //|> w
,.wa (bank2_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank2_ram1_wr_en_d2) //|< r
,.di (bank2_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank3_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank3_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank3_ram0_rd_en_d1) //|< r
,.dout (bank3_ram0_rd_data) //|> w
,.wa (bank3_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank3_ram0_wr_en_d2) //|< r
,.di (bank3_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank3_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank3_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank3_ram1_rd_en_d1) //|< r
,.dout (bank3_ram1_rd_data) //|> w
,.wa (bank3_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank3_ram1_wr_en_d2) //|< r
,.di (bank3_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank4_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank4_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank4_ram0_rd_en_d1) //|< r
,.dout (bank4_ram0_rd_data) //|> w
,.wa (bank4_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank4_ram0_wr_en_d2) //|< r
,.di (bank4_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank4_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank4_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank4_ram1_rd_en_d1) //|< r
,.dout (bank4_ram1_rd_data) //|> w
,.wa (bank4_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank4_ram1_wr_en_d2) //|< r
,.di (bank4_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank5_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank5_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank5_ram0_rd_en_d1) //|< r
,.dout (bank5_ram0_rd_data) //|> w
,.wa (bank5_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank5_ram0_wr_en_d2) //|< r
,.di (bank5_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank5_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank5_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank5_ram1_rd_en_d1) //|< r
,.dout (bank5_ram1_rd_data) //|> w
,.wa (bank5_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank5_ram1_wr_en_d2) //|< r
,.di (bank5_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank6_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank6_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank6_ram0_rd_en_d1) //|< r
,.dout (bank6_ram0_rd_data) //|> w
,.wa (bank6_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank6_ram0_wr_en_d2) //|< r
,.di (bank6_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank6_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank6_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank6_ram1_rd_en_d1) //|< r
,.dout (bank6_ram1_rd_data) //|> w
,.wa (bank6_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank6_ram1_wr_en_d2) //|< r
,.di (bank6_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank7_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank7_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank7_ram0_rd_en_d1) //|< r
,.dout (bank7_ram0_rd_data) //|> w
,.wa (bank7_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank7_ram0_wr_en_d2) //|< r
,.di (bank7_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank7_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank7_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank7_ram1_rd_en_d1) //|< r
,.dout (bank7_ram1_rd_data) //|> w
,.wa (bank7_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank7_ram1_wr_en_d2) //|< r
,.di (bank7_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank8_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank8_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank8_ram0_rd_en_d1) //|< r
,.dout (bank8_ram0_rd_data) //|> w
,.wa (bank8_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank8_ram0_wr_en_d2) //|< r
,.di (bank8_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank8_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank8_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank8_ram1_rd_en_d1) //|< r
,.dout (bank8_ram1_rd_data) //|> w
,.wa (bank8_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank8_ram1_wr_en_d2) //|< r
,.di (bank8_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank9_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank9_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank9_ram0_rd_en_d1) //|< r
,.dout (bank9_ram0_rd_data) //|> w
,.wa (bank9_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank9_ram0_wr_en_d2) //|< r
,.di (bank9_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank9_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank9_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank9_ram1_rd_en_d1) //|< r
,.dout (bank9_ram1_rd_data) //|> w
,.wa (bank9_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank9_ram1_wr_en_d2) //|< r
,.di (bank9_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank10_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank10_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank10_ram0_rd_en_d1) //|< r
,.dout (bank10_ram0_rd_data) //|> w
,.wa (bank10_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank10_ram0_wr_en_d2) //|< r
,.di (bank10_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank10_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank10_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank10_ram1_rd_en_d1) //|< r
,.dout (bank10_ram1_rd_data) //|> w
,.wa (bank10_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank10_ram1_wr_en_d2) //|< r
,.di (bank10_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank11_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank11_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank11_ram0_rd_en_d1) //|< r
,.dout (bank11_ram0_rd_data) //|> w
,.wa (bank11_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank11_ram0_wr_en_d2) //|< r
,.di (bank11_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank11_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank11_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank11_ram1_rd_en_d1) //|< r
,.dout (bank11_ram1_rd_data) //|> w
,.wa (bank11_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank11_ram1_wr_en_d2) //|< r
,.di (bank11_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank12_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank12_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank12_ram0_rd_en_d1) //|< r
,.dout (bank12_ram0_rd_data) //|> w
,.wa (bank12_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank12_ram0_wr_en_d2) //|< r
,.di (bank12_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank12_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank12_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank12_ram1_rd_en_d1) //|< r
,.dout (bank12_ram1_rd_data) //|> w
,.wa (bank12_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank12_ram1_wr_en_d2) //|< r
,.di (bank12_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank13_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank13_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank13_ram0_rd_en_d1) //|< r
,.dout (bank13_ram0_rd_data) //|> w
,.wa (bank13_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank13_ram0_wr_en_d2) //|< r
,.di (bank13_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank13_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank13_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank13_ram1_rd_en_d1) //|< r
,.dout (bank13_ram1_rd_data) //|> w
,.wa (bank13_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank13_ram1_wr_en_d2) //|< r
,.di (bank13_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank14_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank14_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank14_ram0_rd_en_d1) //|< r
,.dout (bank14_ram0_rd_data) //|> w
,.wa (bank14_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank14_ram0_wr_en_d2) //|< r
,.di (bank14_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank14_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank14_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank14_ram1_rd_en_d1) //|< r
,.dout (bank14_ram1_rd_data) //|> w
,.wa (bank14_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank14_ram1_wr_en_d2) //|< r
,.di (bank14_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank15_ram0 (
.clk (nvdla_core_clk) //|< i
,.ra (bank15_ram0_rd_addr_d1[9 -1:0]) //|< r
,.re (bank15_ram0_rd_en_d1) //|< r
,.dout (bank15_ram0_rd_data) //|> w
,.wa (bank15_ram0_wr_addr_d2[9 -1:0]) //|< r
,.we (bank15_ram0_wr_en_d2) //|< r
,.di (bank15_ram0_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

nv_ram_rws_512x256 u_cbuf_ram_bank15_ram1 (
.clk (nvdla_core_clk) //|< i
,.ra (bank15_ram1_rd_addr_d1[9 -1:0]) //|< r
,.re (bank15_ram1_rd_en_d1) //|< r
,.dout (bank15_ram1_rd_data) //|> w
,.wa (bank15_ram1_wr_addr_d2[9 -1:0]) //|< r
,.we (bank15_ram1_wr_en_d2) //|< r
,.di (bank15_ram1_wr_data_d2) //|< r
,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
);

//| eperl: generated_end (DO NOT EDIT ABOVE)
endmodule
