// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


//
// module: xc_malu_long
//
//  Module responsible for handline atomic parts of the multi-precision
//  arithmetic instructions.
//
// 
// xc.madd.3
// - acc <= r1  + r2 + r3[0]
// 
// xc.msub.3
// - acc[31:0] <= r1  - r2
// - acc[31:0] <= acc[31:0] - r3[0]
// 
// xc.macc
// - {carry, acc[31:0]} <= r2 + r3; acc[63:32] <= r1
// - acc[63:32] <= acc[63:32] + carry;
// 
// xc.mmul.3
// - acc <= rs1 * rs2
// - {carry, acc[31:0]} <= acc[31:0] + r3; 
// - acc[63:32] <= acc[63:32] + carry;
// 
//
module xc_malu_long (

input  wire [31:0]  rs1             , //
input  wire [31:0]  rs2             , //
input  wire [31:0]  rs3             , //

input  wire         fsm_init        ,
input  wire         fsm_mdr         ,
input  wire         fsm_msub_1      ,
input  wire         fsm_macc_1      ,
input  wire         fsm_mmul_1      ,
input  wire         fsm_mmul_2      ,
input  wire         fsm_done        ,

input  wire [63:0]  acc             ,
input  wire [ 0:0]  carry           ,
input  wire [ 5:0]  count           ,

output wire [31:0]  padd_lhs        , // Left hand input
output wire [31:0]  padd_rhs        , // Right hand input.
output wire         padd_cin        , // Carry in bit.
output wire [ 0:0]  padd_sub        , // Subtract if set, else add.

input       [32:0]  padd_cout       , // Carry bits
input       [31:0]  padd_result     , // Result of the operation

input  wire         uop_madd        , //
input  wire         uop_msub        , //
input  wire         uop_macc        , //
input  wire         uop_mmul        , //

output wire         n_carry         ,
output wire [63:0]  n_acc           ,
output wire [63:0]  result          ,
output wire         ready           

);


//
// xc.msub

wire [32:0] msub_lhs_0 = {1'b0,rs1};
wire [32:0] msub_lhs_1 = acc[32:0];

wire [32:0] msub_rhs_0 = {1'b0,rs2};
wire [32:0] msub_rhs_1 = {32'b0, rs3[0]};

wire [32:0] msub_lhs   = fsm_msub_1 ? msub_lhs_1 : msub_lhs_0;
wire [32:0] msub_rhs   = fsm_msub_1 ? msub_rhs_1 : msub_rhs_0;

// TODO: Re-use the padd interface.
wire [32:0] sub_result = $unsigned(msub_lhs) - 
                         $unsigned(msub_rhs) ;

//
// xc.macc

wire [31:0] macc_lhs_0 = rs2;
wire [31:0] macc_lhs_1 = rs1;

wire [31:0] macc_rhs_0 = rs3;
wire [31:0] macc_rhs_1 = {31'b0, carry};

wire [31:0] macc_lhs   = fsm_init ? macc_lhs_0 : macc_lhs_1;
wire [31:0] macc_rhs   = fsm_init ? macc_rhs_0 : macc_rhs_1;

wire [63:0] macc_acc_0 = {acc[63:32]    , padd_result  };
wire [63:0] macc_acc_1 = {padd_result   , acc[31:0]    };
wire [63:0] macc_n_acc = fsm_macc_1 ? macc_acc_1 : macc_acc_0;

//
// xc.mmul

wire [31:0] mmul_lhs_0 = rs3;
wire [31:0] mmul_lhs_1 = acc[63:32];

wire [31:0] mmul_rhs_0 = acc[31:0];
wire [31:0] mmul_rhs_1 = {31'b0, carry};

wire [31:0] mmul_lhs   = fsm_mmul_2 ? mmul_lhs_0 : mmul_lhs_1;
wire [31:0] mmul_rhs   = fsm_mmul_2 ? mmul_rhs_0 : mmul_rhs_1;

wire [63:0] mmul_acc_0 = {acc[63:32]    , padd_result  };
wire [63:0] mmul_acc_1 = {padd_result   , acc[31:0]    };
wire [63:0] mmul_n_acc = fsm_mmul_2 ? mmul_acc_0 : mmul_acc_1;

//
// padd signal selection
// -----------------------------------------------------

assign padd_lhs     = {32{uop_madd}} & rs1      |
                      {32{uop_macc}} & macc_lhs |
                      {32{uop_mmul}} & mmul_lhs ;

assign padd_rhs     = {32{uop_madd}} & rs2      |
                      {32{uop_macc}} & macc_rhs |
                      {32{uop_mmul}} & mmul_rhs ;

assign padd_sub     = 1'b0;

assign padd_cin     = uop_madd  && rs3[0]               ;

assign n_carry      = padd_cout[32]                 ;

assign n_acc        = {64{uop_madd}} & {acc[63:32], padd_result} |
                      {64{uop_msub}} & {31'b0, sub_result      } |
                      {64{uop_macc}} & {macc_n_acc             } |
                      {64{uop_mmul}} & {mmul_n_acc             } ;

wire   result_acc   = uop_msub || uop_macc || uop_mmul;

assign result       = {64{uop_madd}} & {31'b0, padd_cout[31], padd_result} |
                      {64{result_acc}} & {acc                            } ;

assign ready        = uop_madd;

endmodule
