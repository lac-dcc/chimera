
//
// Handles instructions:
//  - mul
//  - mulh
//  - mulhu
//  - mulhsu
//  - clmul
//  - clmulh
//
module xc_malu_mul (

input  wire [31:0]  rs1             ,
input  wire [31:0]  rs2             ,

input  wire [ 5:0]  count           ,
input  wire [63:0]  acc             ,
input  wire [31:0]  arg_0           ,

input  wire         carryless       ,

input  wire         pw_32           , // 32-bit width packed elements.
input  wire         pw_16           , // 16-bit width packed elements.
input  wire         pw_8            , //  8-bit width packed elements.
input  wire         pw_4            , //  4-bit width packed elements.
input  wire         pw_2            , //  2-bit width packed elements.

input  wire         lhs_sign        ,
input  wire         rhs_sign        ,

output wire [31:0]  padd_lhs        , // Packed adder left input
output wire [31:0]  padd_rhs        , // Packed adder right input
output wire         padd_sub        , // Packed adder subtract?
output wire         padd_cin        , // Packed adder carry in
output wire         padd_cen        , // Packed adder carry enable.

input  wire [32:0]  padd_cout       ,
input  wire [31:0]  padd_result     ,

output wire [63:0]  n_acc           ,
output wire [31:0]  n_arg_0         ,
output wire         ready           

);

assign ready             = count == {pw_32, pw_16, pw_8, pw_4, pw_2,1'b0};

wire          add_en     = arg_0[0];

wire          sub_last   = rs2[31] && count == 31 && rhs_sign && |rs1;

wire [32:0]   add_lhs    = {lhs_sign && acc[63], acc[63:32]};
wire [32:0]   add_rhs    = add_en ? {lhs_sign && rs1[31], rs1} : 0 ;

assign        padd_lhs   = add_lhs[31:0];
assign        padd_rhs   = add_rhs[31:0];
assign        padd_sub   = sub_last;

assign        padd_cin   = 1'b0;
assign        padd_cen   = !carryless;

wire          add_32     = carryless ? 1'b0 :
                           add_lhs[32] + 
                           add_rhs[32] +
                           sub_last    + padd_cout[31];

wire   [32:0] add_result = {add_32, padd_result};

assign n_acc             = {add_result, acc[31:1]};

assign n_arg_0           = {1'b0, arg_0[31:1]};

endmodule
