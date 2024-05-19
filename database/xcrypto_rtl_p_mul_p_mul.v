// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


//
// module: p_mul
//
//  Implements the packed multiply and carryless multiply instructions.
//  Uses a dedicated instance of p_addsub.
//
//  For area-optimised designs which share resources, consider using the
//  p_mul_core module, which exposes it's interface to the p_addsub module.
//
module p_mul (

input           clock   ,
input           resetn  ,

input           valid   ,
output [ 0:0]   ready   ,

input           mul_l   ,
input           mul_h   ,
input           clmul   ,
input  [4:0]    pw      ,

input  [31:0]   crs1    ,
input  [31:0]   crs2    ,

output [31:0]   result

);

wire [31:0]   padd_lhs    ; // Left hand input
wire [31:0]   padd_rhs    ; // Right hand input.

wire [ 4:0]   padd_pw     ; // Pack width to operate on
wire [ 0:0]   padd_sub    ; // Subtract if set, else add.

wire [32:0]   padd_carry  ; // Carry bits
wire [31:0]   padd_result ; // Result of the operation

//
// Instance of the packed multipler core module
p_mul_core i_p_mul_core(
.clock      (clock      ),
.resetn     (resetn     ),
.valid      (valid      ), // Input is valid
.ready      (ready      ), // Output is ready
.mul_l      (mul_l      ), // Low half of result?
.mul_h      (mul_h      ), // High half of result?
.clmul      (clmul      ), // Do a carryless multiply?
.pw         (pw         ), // Pack width specifier
.crs1       (crs1       ), // Source register 1
.crs2       (crs2       ), // Source register 2
.result     (result     ), // [Carryless] multiply result
.padd_lhs   (padd_lhs   ), // Left hand input
.padd_rhs   (padd_rhs   ), // Right hand input.
.padd_pw    (padd_pw    ), // Pack width to operate on
.padd_sub   (padd_sub   ), // Subtract if set, else add.
.padd_carry (padd_carry ), // Carry bits
.padd_result(padd_result)  // Result of the operation
);

//
// Packed adder instance
p_addsub i_paddsub (
.lhs    (padd_lhs   ), // Left hand input
.rhs    (padd_rhs   ), // Right hand input.
.pw     (padd_pw    ), // Pack width to operate on
.sub    (padd_sub   ), // Subtract if set, else add.
.c_out  (padd_carry ), // Carry out
.result (padd_result)  // Result of the operation
);

endmodule


//
// module: p_mul_core
//
//  Core functionality of the multiplier that cannot be shared by other
//  blocks. Exposes an external interface which expects to be connected
//  to the p_addsub module.
//
module p_mul_core (

input              clock       ,
input              resetn      ,

input              valid       , // Input is valid
output      [ 0:0] ready       , // Output is ready

input              mul_l       , // Low half of result?
input              mul_h       , // High half of result?
input              clmul       , // Do a carryless multiply?
input       [4:0]  pw          , // Pack width specifier

input       [31:0] crs1        , // Source register 1
input       [31:0] crs2        , // Source register 2

output wire [31:0] result      , // [Carryless] multiply result

output wire [31:0] padd_lhs    , // Left hand input
output wire [31:0] padd_rhs    , // Right hand input.

output wire [ 4:0] padd_pw     , // Pack width to operate on
output wire [ 0:0] padd_sub    , // Subtract if set, else add.

input       [32:0] padd_carry  , // Carry bits
input       [31:0] padd_result   // Result of the operation

);


reg  [63:0] psum        ; // Current partial sum
wire [63:0] n_psum      ; // Next partial sum

reg  [ 5:0] count       ; // Number of steps executed so far.
wire [ 5:0] n_count     = count + 1;
wire [ 5:0] m_count     = {pw[0],pw[1],pw[2],pw[3],pw[4], 1'b0};
wire        finish      = valid && count == m_count;

assign      ready       = finish;

//
// One-hot pack width wires
wire pw_32 = pw[0];
wire pw_16 = pw[1];
wire pw_8  = pw[2];
wire pw_4  = pw[3];
wire pw_2  = pw[4];

// Mask for adding 32-bit values
wire [31:0] addm_32     = {32{crs2[count[4:0]]}};

// Mask for adding 16-bit values
wire [15:0] addm_16_0   = {16{crs2[count[3:0] +  0]}};
wire [15:0] addm_16_1   = {16{crs2[count[3:0] + 16]}};
wire [31:0] addm_16     = {addm_16_1, addm_16_0};

// Mask for adding 8-bit values
wire [ 7:0] addm_8_0    = {8{crs2[count[2:0] +  0]}};
wire [ 7:0] addm_8_1    = {8{crs2[count[2:0] +  8]}};
wire [ 7:0] addm_8_2    = {8{crs2[count[2:0] + 16]}};
wire [ 7:0] addm_8_3    = {8{crs2[count[2:0] + 24]}};
wire [31:0] addm_8      = {addm_8_3, addm_8_2,addm_8_1, addm_8_0};

// Mask for adding 4-bit values
wire [ 3:0] addm_4_0    = {4{crs2[count[1:0] +  0]}};
wire [ 3:0] addm_4_1    = {4{crs2[count[1:0] +  4]}};
wire [ 3:0] addm_4_2    = {4{crs2[count[1:0] +  8]}};
wire [ 3:0] addm_4_3    = {4{crs2[count[1:0] + 12]}};
wire [ 3:0] addm_4_4    = {4{crs2[count[1:0] + 16]}};
wire [ 3:0] addm_4_5    = {4{crs2[count[1:0] + 20]}};
wire [ 3:0] addm_4_6    = {4{crs2[count[1:0] + 24]}};
wire [ 3:0] addm_4_7    = {4{crs2[count[1:0] + 28]}};
wire [31:0] addm_4      = {addm_4_7, addm_4_6,addm_4_5, addm_4_4,
                           addm_4_3, addm_4_2,addm_4_1, addm_4_0};

// Mask for adding 2-bit values
wire [ 1:0] addm_2_0    = {2{crs2[count[  0] +  0]}};
wire [ 1:0] addm_2_1    = {2{crs2[count[  0] +  2]}};
wire [ 1:0] addm_2_2    = {2{crs2[count[  0] +  4]}};
wire [ 1:0] addm_2_3    = {2{crs2[count[  0] +  6]}};
wire [ 1:0] addm_2_4    = {2{crs2[count[  0] +  8]}};
wire [ 1:0] addm_2_5    = {2{crs2[count[  0] + 10]}};
wire [ 1:0] addm_2_6    = {2{crs2[count[  0] + 12]}};
wire [ 1:0] addm_2_7    = {2{crs2[count[  0] + 14]}};
wire [ 1:0] addm_2_8    = {2{crs2[count[  0] + 16]}};
wire [ 1:0] addm_2_9    = {2{crs2[count[  0] + 18]}};
wire [ 1:0] addm_2_10   = {2{crs2[count[  0] + 20]}};
wire [ 1:0] addm_2_11   = {2{crs2[count[  0] + 22]}};
wire [ 1:0] addm_2_12   = {2{crs2[count[  0] + 24]}};
wire [ 1:0] addm_2_13   = {2{crs2[count[  0] + 26]}};
wire [ 1:0] addm_2_14   = {2{crs2[count[  0] + 28]}};
wire [ 1:0] addm_2_15   = {2{crs2[count[  0] + 30]}};
wire [31:0] addm_2      = {addm_2_15, addm_2_14, addm_2_13, addm_2_12, 
                           addm_2_11, addm_2_10, addm_2_9 , addm_2_8 ,
                           addm_2_7 , addm_2_6 , addm_2_5 , addm_2_4 ,
                           addm_2_3 , addm_2_2 , addm_2_1 , addm_2_0 };

// Mask for the right hand packed adder input.
wire [31:0] padd_mask   =   {32{pw_32}} & addm_32   |
                            {32{pw_16}} & addm_16   |
                            {32{pw_8 }} & addm_8    |
                            {32{pw_4 }} & addm_4    |
                            {32{pw_2 }} & addm_2    ;

// Inputs to the packed adder

wire [31:0] padd_lhs_32 =  psum[63:32];

wire [31:0] padd_lhs_16 = {psum[63:48], psum[31:16]};

wire [31:0] padd_lhs_8  =
    {psum[63:56], psum[47:40], psum[31:24], psum[15:8]};

wire [31:0] padd_lhs_4  = 
    {psum[63:60], psum[55:52], psum[47:44], psum[39:36], 
     psum[31:28], psum[23:20], psum[15:12], psum[ 7: 4]};

wire [31:0] padd_lhs_2  =
    {psum[63:62], psum[59:58], psum[55:54], psum[51:50], 
     psum[47:46], psum[43:42], psum[39:38], psum[35:34], 
     psum[31:30], psum[27:26], psum[23:22], psum[19:18], 
     psum[15:14], psum[11:10], psum[ 7: 6], psum[ 3: 2]};

assign padd_lhs    = 
    {32{pw_32}} & padd_lhs_32 |
    {32{pw_16}} & padd_lhs_16 |
    {32{pw_8 }} & padd_lhs_8  |
    {32{pw_4 }} & padd_lhs_4  |
    {32{pw_2 }} & padd_lhs_2  ;

assign padd_rhs    = crs1 & padd_mask;

assign        padd_pw     = pw;
assign        padd_sub    = 1'b0;

// Result of the packed addition operation
wire [31:0] cadd_result ; // GF addition result.
wire [31:0] cadd_carry  = 32'b0; //

assign cadd_result = padd_lhs ^ padd_rhs;

wire [31:0] add_result =  clmul ? cadd_result : padd_result      ;
wire [31:0] add_carry  =  clmul ? cadd_carry  : padd_carry[31:0] ;

wire [63:0] n_psum_32 = {add_carry[31],add_result,psum[31:1]};

wire [63:0] n_psum_16 = {add_carry[31],add_result[31:16],psum[47:33], 
                         add_carry[15],add_result[15: 0],psum[15:1 ]};

wire [63:0] n_psum_8  = {add_carry[31],add_result[31:24],psum[55:49], 
                         add_carry[23],add_result[23:16],psum[39:33], 
                         add_carry[15],add_result[15: 8],psum[23:17], 
                         add_carry[ 7],add_result[ 7: 0],psum[ 7: 1]};

wire [63:0] n_psum_4  = {add_carry[31],add_result[31:28],psum[59:57], 
                         add_carry[27],add_result[27:24],psum[51:49], 
                         add_carry[23],add_result[23:20],psum[43:41], 
                         add_carry[19],add_result[19:16],psum[35:33], 
                         add_carry[15],add_result[15:12],psum[27:25], 
                         add_carry[11],add_result[11: 8],psum[19:17], 
                         add_carry[ 7],add_result[ 7: 4],psum[11: 9], 
                         add_carry[ 3],add_result[ 3: 0],psum[ 3: 1]};

wire [63:0] n_psum_2  = {add_carry[31],add_result[31:30],psum[61], 
                         add_carry[29],add_result[29:28],psum[57], 
                         add_carry[27],add_result[27:26],psum[53], 
                         add_carry[25],add_result[25:24],psum[49], 
                         add_carry[23],add_result[23:22],psum[45], 
                         add_carry[21],add_result[21:20],psum[41], 
                         add_carry[19],add_result[19:18],psum[37], 
                         add_carry[17],add_result[17:16],psum[33], 
                         add_carry[15],add_result[15:14],psum[29], 
                         add_carry[13],add_result[13:12],psum[25], 
                         add_carry[11],add_result[11:10],psum[21], 
                         add_carry[ 9],add_result[ 9: 8],psum[17], 
                         add_carry[ 7],add_result[ 7: 6],psum[13], 
                         add_carry[ 5],add_result[ 5: 4],psum[ 9], 
                         add_carry[ 3],add_result[ 3: 2],psum[ 5], 
                         add_carry[ 1],add_result[ 1: 0],psum[ 1]};

assign n_psum = 
    {64{pw_32}} & n_psum_32 |
    {64{pw_16}} & n_psum_16 |
    {64{pw_8 }} & n_psum_8  |
    {64{pw_4 }} & n_psum_4  |
    {64{pw_2 }} & n_psum_2  ;

wire [31:0] intermediate = psum >> (32-count);

wire [31:0] result_32 = mul_h ? padd_lhs_32 : psum[31:0];

wire [31:0] result_16 = mul_h ? padd_lhs_16 : {psum[47:32],psum[15:0]};

wire [31:0] result_8  = mul_h ? padd_lhs_8  : 
    {psum[55:48],psum[ 39:32],psum[23:16],psum[ 7:0]};

wire [31:0] result_4  = mul_h ? padd_lhs_4  : 
    {psum[59:56], psum[51:48], psum[43:40], psum[35:32],
     psum[27:24], psum[19:16], psum[11: 8], psum[ 3: 0]};

wire [31:0] result_2  = mul_h ? padd_lhs_2  : 
    {psum[61:60], psum[57:56], psum[53:52], psum[49:48], 
     psum[45:44], psum[41:40], psum[37:36], psum[33:32], 
     psum[29:28], psum[25:24], psum[21:20], psum[17:16], 
     psum[13:12], psum[ 9: 8], psum[ 5: 4], psum[ 1: 0]};

assign result = 
    {32{pw_32}} & result_32 |
    {32{pw_16}} & result_16 |
    {32{pw_8 }} & result_8  |
    {32{pw_4 }} & result_4  |
    {32{pw_2 }} & result_2  ;

//
// Update the count register.
always @(posedge clock) begin
    if(!resetn) begin
        count <= 0;
    end else if(valid && !finish) begin
        count <= n_count;
    end else if(valid &&  finish) begin
        count <= 0;
    end else if(!valid) begin
        count <= 0;
    end
end

//
// Update the partial sum register
always @(posedge clock) begin
    if(!resetn) begin
        psum <= 0;
    end else if(valid && !finish) begin
        psum <= n_psum;
    end else if(valid &&  finish) begin
        psum <= 0;
    end else if(!valid) begin
        psum <= 0;
    end
end

endmodule
