
//
// module: xc_sha3
//
//  Implements the specialised sha3 indexing functions.
//  - All of the f_* inputs must be 1-hot.
//
module xc_sha3 (

input  wire [31:0] rs1      , // Input source register 1
input  wire [31:0] rs2      , // Input source register 2
input  wire [ 1:0] shamt    , // Post-Shift Amount

// One hot function select wires
input  wire        f_xy     , // xc.sha3.xy instruction function
input  wire        f_x1     , // xc.sha3.x1 instruction function
input  wire        f_x2     , // xc.sha3.x2 instruction function
input  wire        f_x4     , // xc.sha3.x4 instruction function
input  wire        f_yx     , // xc.sha3.yx instruction function

output wire [31:0] result     //

);

wire [2:0] in_x         = rs1[2:0];
wire [2:0] in_y         = rs2[2:0];

/* verilator lint_off WIDTH */

wire [4:0] in_x_plus    = in_x + {f_x4,f_x2,f_x1};
wire [6:0] in_y_plus    = {in_x, 1'b0} + {{2'b00,in_y,1'b0} + in_y};

wire [4:0] lut_in_lhs   = f_yx ? in_y       : in_x_plus ;
wire [6:0] lut_in_rhs   = f_yx ? in_y_plus  : in_y      ;

wire [2:0] lut_out_lhs  = lut_in_lhs % 5;
wire [2:0] lut_out_rhs  = lut_in_rhs % 5;

wire [4:0] sum_rhs      = {lut_out_rhs,2'b00} + lut_out_rhs;

wire [4:0] result_sum   = lut_out_lhs + sum_rhs;

wire [5:0] shf_1        = shamt[0] ? {result_sum,1'b0} : {1'b0, result_sum};
wire [7:0] shf_2        = shamt[1] ? {shf_1,2'b0     } : {2'b0, shf_1     };

/* verilator lint_on WIDTH */

assign result           = {24'b0,shf_2};


endmodule
