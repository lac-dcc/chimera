// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CDP_DP_mul.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CDP_define.h
///////////////////////////////////////////////////
//#ifdef NVDLA_FEATURE_DATA_TYPE_INT8
//#if ( NVDLA_CDP_THROUGHPUT  ==  8 )
//    #define LARGE_FIFO_RAM
//#endif
//#if ( NVDLA_CDP_THROUGHPUT == 1 )
//    #define SMALL_FIFO_RAM
//#endif
//#endif
module NV_NVDLA_CDP_DP_mul (
   nvdla_core_clk //|< i
  ,nvdla_core_rstn //|< i
//: my $k = 8;
//: foreach my $m (0..$k-1) {
//: print qq(
//: ,intp2mul_pd_$m
//: );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,intp2mul_pd_0

,intp2mul_pd_1

,intp2mul_pd_2

,intp2mul_pd_3

,intp2mul_pd_4

,intp2mul_pd_5

,intp2mul_pd_6

,intp2mul_pd_7

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,intp2mul_pvld //|< i
  ,mul2ocvt_prdy //|< i
  ,reg2dp_mul_bypass //|< i
  ,sync2mul_pd //|< i
  ,sync2mul_pvld //|< i
  ,intp2mul_prdy //|> o
  ,mul2ocvt_pd //|> o
  ,mul2ocvt_pvld //|> o
  ,sync2mul_prdy //|> o
  );
//////////////////////////////////////////////////////
input nvdla_core_clk;
input nvdla_core_rstn;
//: my $k = 8;
//: my $icvto=(8 +1);
//: foreach my $m (0..$k-1) {
//: print qq(
//: input [16:0] intp2mul_pd_$m;
//: );
//: }
//: print qq(
//: input [${k}*${icvto}-1:0] sync2mul_pd;
//: output [${k}*(${icvto}+16)-1:0] mul2ocvt_pd;
//: );
//| eperl: generated_beg (DO NOT EDIT BELOW)

input [16:0] intp2mul_pd_0;

input [16:0] intp2mul_pd_1;

input [16:0] intp2mul_pd_2;

input [16:0] intp2mul_pd_3;

input [16:0] intp2mul_pd_4;

input [16:0] intp2mul_pd_5;

input [16:0] intp2mul_pd_6;

input [16:0] intp2mul_pd_7;

input [8*9-1:0] sync2mul_pd;
output [8*(9+16)-1:0] mul2ocvt_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
input intp2mul_pvld;
input mul2ocvt_prdy;
input reg2dp_mul_bypass;
input sync2mul_pvld;
output intp2mul_prdy;
output mul2ocvt_pvld;
output sync2mul_prdy;
//////////////////////////////////////////////////////
reg mul_bypass_en;
wire [8*((8 +1)+16)-1:0] intp_out_ext;
wire [8*((8 +1)+16)-1:0] mul2ocvt_pd_f;
wire mul2ocvt_pvld_f;
wire mul_in_rdy;
wire mul_in_vld;
//: my $k = 8;
//: my $icvto=(8 +1);
//: foreach my $m (0..$k-1) {
//: print qq(
//: wire [(${icvto}+16)-1:0] mul_unit_pd_$m;
//: wire [${icvto}-1:0] mul_ina_pd_$m;
//: wire [15:0] mul_inb_pd_$m;
//: );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [(9+16)-1:0] mul_unit_pd_0;
wire [9-1:0] mul_ina_pd_0;
wire [15:0] mul_inb_pd_0;

wire [(9+16)-1:0] mul_unit_pd_1;
wire [9-1:0] mul_ina_pd_1;
wire [15:0] mul_inb_pd_1;

wire [(9+16)-1:0] mul_unit_pd_2;
wire [9-1:0] mul_ina_pd_2;
wire [15:0] mul_inb_pd_2;

wire [(9+16)-1:0] mul_unit_pd_3;
wire [9-1:0] mul_ina_pd_3;
wire [15:0] mul_inb_pd_3;

wire [(9+16)-1:0] mul_unit_pd_4;
wire [9-1:0] mul_ina_pd_4;
wire [15:0] mul_inb_pd_4;

wire [(9+16)-1:0] mul_unit_pd_5;
wire [9-1:0] mul_ina_pd_5;
wire [15:0] mul_inb_pd_5;

wire [(9+16)-1:0] mul_unit_pd_6;
wire [9-1:0] mul_ina_pd_6;
wire [15:0] mul_inb_pd_6;

wire [(9+16)-1:0] mul_unit_pd_7;
wire [9-1:0] mul_ina_pd_7;
wire [15:0] mul_inb_pd_7;

//| eperl: generated_end (DO NOT EDIT ABOVE)
wire [8 -1:0] mul_unit_rdy;
wire [8 -1:0] mul_unit_vld;
wire [8 -1:0] mul_vld;
wire [8 -1:0] mul_rdy;
///////////////////////////////////////////
//: my $k = 8*((8 +1)+16);
//: &eperl::pipe(" -wid $k -is -do mul2ocvt_pd -vo mul2ocvt_pvld -ri mul2ocvt_prdy -di mul2ocvt_pd_f -vi mul2ocvt_pvld_f -ro mul2ocvt_prdy_f ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
// Reg
reg mul2ocvt_prdy_f;
reg skid_flop_mul2ocvt_prdy_f;
reg skid_flop_mul2ocvt_pvld_f;
reg [200-1:0] skid_flop_mul2ocvt_pd_f;
reg pipe_skid_mul2ocvt_pvld_f;
reg [200-1:0] pipe_skid_mul2ocvt_pd_f;
// Wire
wire skid_mul2ocvt_pvld_f;
wire [200-1:0] skid_mul2ocvt_pd_f;
wire skid_mul2ocvt_prdy_f;
wire pipe_skid_mul2ocvt_prdy_f;
wire mul2ocvt_pvld;
wire [200-1:0] mul2ocvt_pd;
// Code
// SKID READY
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mul2ocvt_prdy_f <= 1'b1;
       skid_flop_mul2ocvt_prdy_f <= 1'b1;
   end else begin
       mul2ocvt_prdy_f <= skid_mul2ocvt_prdy_f;
       skid_flop_mul2ocvt_prdy_f <= skid_mul2ocvt_prdy_f;
   end
end

// SKID VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        skid_flop_mul2ocvt_pvld_f <= 1'b0;
    end else begin
        if (skid_flop_mul2ocvt_prdy_f) begin
            skid_flop_mul2ocvt_pvld_f <= mul2ocvt_pvld_f;
        end
   end
end
assign skid_mul2ocvt_pvld_f = (skid_flop_mul2ocvt_prdy_f) ? mul2ocvt_pvld_f : skid_flop_mul2ocvt_pvld_f;

// SKID DATA
always @(posedge nvdla_core_clk) begin
    if (skid_flop_mul2ocvt_prdy_f & mul2ocvt_pvld_f) begin
        skid_flop_mul2ocvt_pd_f[200-1:0] <= mul2ocvt_pd_f[200-1:0];
    end
end
assign skid_mul2ocvt_pd_f[200-1:0] = (skid_flop_mul2ocvt_prdy_f) ? mul2ocvt_pd_f[200-1:0] : skid_flop_mul2ocvt_pd_f[200-1:0];


// PIPE READY
assign skid_mul2ocvt_prdy_f = pipe_skid_mul2ocvt_prdy_f || !pipe_skid_mul2ocvt_pvld_f;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_skid_mul2ocvt_pvld_f <= 1'b0;
    end else begin
        if (skid_mul2ocvt_prdy_f) begin
            pipe_skid_mul2ocvt_pvld_f <= skid_mul2ocvt_pvld_f;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (skid_mul2ocvt_prdy_f && skid_mul2ocvt_pvld_f) begin
        pipe_skid_mul2ocvt_pd_f[200-1:0] <= skid_mul2ocvt_pd_f[200-1:0];
    end
end


// PIPE OUTPUT
assign pipe_skid_mul2ocvt_prdy_f = mul2ocvt_prdy;
assign mul2ocvt_pvld = pipe_skid_mul2ocvt_pvld_f;
assign mul2ocvt_pd = pipe_skid_mul2ocvt_pd_f;

//| eperl: generated_end (DO NOT EDIT ABOVE)
///////////////////////////////////////////////////////////////////
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
  if (!nvdla_core_rstn) begin
    mul_bypass_en <= 1'b0;
  end else begin
  mul_bypass_en <= reg2dp_mul_bypass == 1'h1;
  end
end
//interlock two path data
assign intp2mul_prdy = (mul_bypass_en ? mul2ocvt_prdy_f : mul_in_rdy) & sync2mul_pvld;
assign sync2mul_prdy = (mul_bypass_en ? mul2ocvt_prdy_f : mul_in_rdy) & intp2mul_pvld;
assign mul_in_vld = mul_bypass_en ? 1'b0 : (sync2mul_pvld & intp2mul_pvld);
assign mul_in_rdy = &mul_rdy;
//: my $k = 8;
//: foreach my $m (0..$k-1) {
//: print qq(
//: assign mul_vld[$m] = mul_in_vld
//: );
//: foreach my $i (0..$k-1) {
//: print qq(
//: & mul_rdy[$i]
//: );
//: }
//: print qq(
//: ;
//: );
//: }
//: my $k = 8;
//: foreach my $m (0..$k-1) {
//: print qq(
//: assign mul_inb_pd_$m = intp2mul_pd_${m}[15:0];
//: );
//: }
//: my $k = 8;
//: my $icvto=(8 +1);
//: foreach my $m (0..$k-1) {
//: print qq(
//: assign mul_ina_pd_$m = sync2mul_pd[$m*${icvto}+${icvto}-1:$m*${icvto}];
//: NV_NVDLA_CDP_DP_MUL_unit u_mul_unit$m (
//: .nvdla_core_clk (nvdla_core_clk)
//: ,.nvdla_core_rstn (nvdla_core_rstn)
//: ,.mul_vld (mul_vld[$m])
//: ,.mul_rdy (mul_rdy[$m])
//: ,.mul_ina_pd (mul_ina_pd_$m)
//: ,.mul_inb_pd (mul_inb_pd_$m)
//: ,.mul_unit_vld (mul_unit_vld[$m])
//: ,.mul_unit_rdy (mul_unit_rdy[$m])
//: ,.mul_unit_pd (mul_unit_pd_$m)
//: );
//: );
//: }
//: my $k = 8;
//: foreach my $m (0..$k-1) {
//: print qq(
//: assign mul_unit_rdy[$m] = mul2ocvt_prdy_f
//: );
//: foreach my $i (0..$k-1) {
//: print qq(
//: & mul_unit_vld[$i]
//: );
//: }
//: print qq(
//: ;
//: );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

assign mul_vld[0] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_vld[1] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_vld[2] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_vld[3] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_vld[4] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_vld[5] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_vld[6] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_vld[7] = mul_in_vld

& mul_rdy[0]

& mul_rdy[1]

& mul_rdy[2]

& mul_rdy[3]

& mul_rdy[4]

& mul_rdy[5]

& mul_rdy[6]

& mul_rdy[7]

;

assign mul_inb_pd_0 = intp2mul_pd_0[15:0];

assign mul_inb_pd_1 = intp2mul_pd_1[15:0];

assign mul_inb_pd_2 = intp2mul_pd_2[15:0];

assign mul_inb_pd_3 = intp2mul_pd_3[15:0];

assign mul_inb_pd_4 = intp2mul_pd_4[15:0];

assign mul_inb_pd_5 = intp2mul_pd_5[15:0];

assign mul_inb_pd_6 = intp2mul_pd_6[15:0];

assign mul_inb_pd_7 = intp2mul_pd_7[15:0];

assign mul_ina_pd_0 = sync2mul_pd[0*9+9-1:0*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit0 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[0])
,.mul_rdy (mul_rdy[0])
,.mul_ina_pd (mul_ina_pd_0)
,.mul_inb_pd (mul_inb_pd_0)
,.mul_unit_vld (mul_unit_vld[0])
,.mul_unit_rdy (mul_unit_rdy[0])
,.mul_unit_pd (mul_unit_pd_0)
);

assign mul_ina_pd_1 = sync2mul_pd[1*9+9-1:1*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit1 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[1])
,.mul_rdy (mul_rdy[1])
,.mul_ina_pd (mul_ina_pd_1)
,.mul_inb_pd (mul_inb_pd_1)
,.mul_unit_vld (mul_unit_vld[1])
,.mul_unit_rdy (mul_unit_rdy[1])
,.mul_unit_pd (mul_unit_pd_1)
);

assign mul_ina_pd_2 = sync2mul_pd[2*9+9-1:2*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit2 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[2])
,.mul_rdy (mul_rdy[2])
,.mul_ina_pd (mul_ina_pd_2)
,.mul_inb_pd (mul_inb_pd_2)
,.mul_unit_vld (mul_unit_vld[2])
,.mul_unit_rdy (mul_unit_rdy[2])
,.mul_unit_pd (mul_unit_pd_2)
);

assign mul_ina_pd_3 = sync2mul_pd[3*9+9-1:3*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit3 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[3])
,.mul_rdy (mul_rdy[3])
,.mul_ina_pd (mul_ina_pd_3)
,.mul_inb_pd (mul_inb_pd_3)
,.mul_unit_vld (mul_unit_vld[3])
,.mul_unit_rdy (mul_unit_rdy[3])
,.mul_unit_pd (mul_unit_pd_3)
);

assign mul_ina_pd_4 = sync2mul_pd[4*9+9-1:4*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit4 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[4])
,.mul_rdy (mul_rdy[4])
,.mul_ina_pd (mul_ina_pd_4)
,.mul_inb_pd (mul_inb_pd_4)
,.mul_unit_vld (mul_unit_vld[4])
,.mul_unit_rdy (mul_unit_rdy[4])
,.mul_unit_pd (mul_unit_pd_4)
);

assign mul_ina_pd_5 = sync2mul_pd[5*9+9-1:5*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit5 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[5])
,.mul_rdy (mul_rdy[5])
,.mul_ina_pd (mul_ina_pd_5)
,.mul_inb_pd (mul_inb_pd_5)
,.mul_unit_vld (mul_unit_vld[5])
,.mul_unit_rdy (mul_unit_rdy[5])
,.mul_unit_pd (mul_unit_pd_5)
);

assign mul_ina_pd_6 = sync2mul_pd[6*9+9-1:6*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit6 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[6])
,.mul_rdy (mul_rdy[6])
,.mul_ina_pd (mul_ina_pd_6)
,.mul_inb_pd (mul_inb_pd_6)
,.mul_unit_vld (mul_unit_vld[6])
,.mul_unit_rdy (mul_unit_rdy[6])
,.mul_unit_pd (mul_unit_pd_6)
);

assign mul_ina_pd_7 = sync2mul_pd[7*9+9-1:7*9];
NV_NVDLA_CDP_DP_MUL_unit u_mul_unit7 (
.nvdla_core_clk (nvdla_core_clk)
,.nvdla_core_rstn (nvdla_core_rstn)
,.mul_vld (mul_vld[7])
,.mul_rdy (mul_rdy[7])
,.mul_ina_pd (mul_ina_pd_7)
,.mul_inb_pd (mul_inb_pd_7)
,.mul_unit_vld (mul_unit_vld[7])
,.mul_unit_rdy (mul_unit_rdy[7])
,.mul_unit_pd (mul_unit_pd_7)
);

assign mul_unit_rdy[0] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

assign mul_unit_rdy[1] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

assign mul_unit_rdy[2] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

assign mul_unit_rdy[3] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

assign mul_unit_rdy[4] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

assign mul_unit_rdy[5] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

assign mul_unit_rdy[6] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

assign mul_unit_rdy[7] = mul2ocvt_prdy_f

& mul_unit_vld[0]

& mul_unit_vld[1]

& mul_unit_vld[2]

& mul_unit_vld[3]

& mul_unit_vld[4]

& mul_unit_vld[5]

& mul_unit_vld[6]

& mul_unit_vld[7]

;

//| eperl: generated_end (DO NOT EDIT ABOVE)
///////////////////
//NaN propagation for mul_bypass condition
///////////////////
assign intp_out_ext = {
//: my $icvto=(8 +1);
//: my $k = 8;
//: if($k > 1) {
//: foreach my $m (0..$k-2) {
//: my $i = $k -$m -1;
//: print "{{(${icvto}+16-17){intp2mul_pd_${i}[16]}}, intp2mul_pd_${i}[16:0]},";
//: }
//: }
//: print "{{(${icvto}+16-17){intp2mul_pd_0[16]}}, intp2mul_pd_0[16:0]}};  \n";
//:
//: print "assign mul2ocvt_pd_f = mul_bypass_en ? intp_out_ext : { ";
//: if($k > 1) {
//: foreach my $m (0..$k-2) {
//: my $i = $k -$m -1;
//: print "mul_unit_pd_$i,";
//: }
//: }
//: print " mul_unit_pd_0};  \n";
//| eperl: generated_beg (DO NOT EDIT BELOW)
{{(9+16-17){intp2mul_pd_7[16]}}, intp2mul_pd_7[16:0]},{{(9+16-17){intp2mul_pd_6[16]}}, intp2mul_pd_6[16:0]},{{(9+16-17){intp2mul_pd_5[16]}}, intp2mul_pd_5[16:0]},{{(9+16-17){intp2mul_pd_4[16]}}, intp2mul_pd_4[16:0]},{{(9+16-17){intp2mul_pd_3[16]}}, intp2mul_pd_3[16:0]},{{(9+16-17){intp2mul_pd_2[16]}}, intp2mul_pd_2[16:0]},{{(9+16-17){intp2mul_pd_1[16]}}, intp2mul_pd_1[16:0]},{{(9+16-17){intp2mul_pd_0[16]}}, intp2mul_pd_0[16:0]}};  
assign mul2ocvt_pd_f = mul_bypass_en ? intp_out_ext : { mul_unit_pd_7,mul_unit_pd_6,mul_unit_pd_5,mul_unit_pd_4,mul_unit_pd_3,mul_unit_pd_2,mul_unit_pd_1, mul_unit_pd_0};  

//| eperl: generated_end (DO NOT EDIT ABOVE)
//output select
assign mul2ocvt_pvld_f = mul_bypass_en ? (sync2mul_pvld & intp2mul_pvld) : (&mul_unit_vld);
// ///////////////////////////////////////////
//
// //: my $k = NVDLA_CDP_THROUGHPUT*(NVDLA_CDP_ICVTO_BWPE+16);
// //: &eperl::pipe(" -wid $k -is -do mul2ocvt_pd -vo mul2ocvt_pvld -ri mul2ocvt_prdy -di mul2ocvt_pd_f -vi mul2ocvt_pvld_f -ro mul2ocvt_prdy_f ");
//
///////////////////////////////////////////
endmodule // NV_NVDLA_CDP_DP_mul
