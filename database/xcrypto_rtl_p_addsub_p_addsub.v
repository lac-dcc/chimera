
//
// module: p_addsub
//
//  Implemented packed addition/subtraction for 32-bit 2s complement values.
//
module p_addsub (

input  wire [31:0]  lhs             , // Left hand input
input  wire [31:0]  rhs             , // Right hand input.

input  wire [ 4:0]  pw              , // Pack width to operate on
input  wire [ 0:0]  cin             , // Carry in bit.
input  wire [ 0:0]  sub             , // Subtract if set, else add.

input  wire         c_en            , // Carry enable bits.
output wire [32:0]  c_out           , // Carry bits
output wire [31:0]  result            // Result of the operation

);

//
// One-hot pack width wires
wire pw_32 = pw[0];
wire pw_16 = pw[1];
wire pw_8  = pw[2];
wire pw_4  = pw[3];
wire pw_2  = pw[4];

// Carry bit masks
(*keep*)
    /* verilator lint_off UNOPTFLAT */
wire [31:0] carry_mask;
wire [32:0] carry_chain;
/* verilator lint_on UNOPTFLAT */

assign c_out[32] = carry_chain[32];

// Carry in IFF subtracting or forcing a carry in.
assign      carry_chain[0] = sub || cin;

// Invert RHS iff subtracting.
wire [31:0] rhs_m          = sub ? ~rhs : rhs;

//
// Generate the carry mask bits.
assign carry_mask[ 0] = c_en && 1'b1;
assign carry_mask[ 1] = c_en && !pw_2;
assign carry_mask[ 2] = c_en && 1'b1;
assign carry_mask[ 3] = c_en && !pw_2 && !pw_4;
assign carry_mask[ 4] = c_en && 1'b1;
assign carry_mask[ 5] = c_en && !pw_2;
assign carry_mask[ 6] = c_en && 1'b1;
assign carry_mask[ 7] = c_en && !pw_2 && !pw_4 && !pw_8;
assign carry_mask[ 8] = c_en && 1'b1;
assign carry_mask[ 9] = c_en && !pw_2;
assign carry_mask[10] = c_en && 1'b1;
assign carry_mask[11] = c_en && !pw_2 && !pw_4;
assign carry_mask[12] = c_en && 1'b1;
assign carry_mask[13] = c_en && !pw_2;
assign carry_mask[14] = c_en && 1'b1;
assign carry_mask[15] = c_en && !pw_2 && !pw_4 && !pw_8 && !pw_16;
assign carry_mask[16] = c_en && 1'b1;
assign carry_mask[17] = c_en && !pw_2;
assign carry_mask[18] = c_en && 1'b1;
assign carry_mask[19] = c_en && !pw_2 && !pw_4;
assign carry_mask[20] = c_en && 1'b1;
assign carry_mask[21] = c_en && !pw_2;
assign carry_mask[22] = c_en && 1'b1;
assign carry_mask[23] = c_en && !pw_2 && !pw_4 && !pw_8;
assign carry_mask[24] = c_en && 1'b1;
assign carry_mask[25] = c_en && !pw_2;
assign carry_mask[26] = c_en && 1'b1;
assign carry_mask[27] = c_en && !pw_2 && !pw_4;
assign carry_mask[28] = c_en && 1'b1;
assign carry_mask[29] = c_en && !pw_2;
assign carry_mask[30] = c_en && 1'b1;
assign carry_mask[31] = c_en && !pw_2 && !pw_4 && !pw_8 && !pw_16;

//
// Generate full adders, where carry in for each one is masked by
// the corresponding carry mask bit.
genvar i;
generate for(i = 0; i < 32; i = i + 1) begin

    wire   c_in     = carry_chain[i];

    wire   carry    = (lhs[i] && rhs_m[i]) || (c_in && (lhs[i]^rhs_m[i]));
    assign c_out[i] = carry;
    
    wire   force_carry = sub && (
        (i == 15 && pw_16) ||  
        (i ==  7 && pw_8 ) ||
        (i == 15 && pw_8 ) ||
        (i == 23 && pw_8 ) ||
        (i ==  3 && pw_4 ) ||
        (i ==  7 && pw_4 ) ||
        (i == 11 && pw_4 ) ||
        (i == 15 && pw_4 ) ||
        (i == 19 && pw_4 ) ||
        (i == 23 && pw_4 ) ||
        (i == 27 && pw_4 ) ||
        (i ==  1 && pw_2 ) ||
        (i ==  3 && pw_2 ) ||
        (i ==  5 && pw_2 ) ||
        (i ==  7 && pw_2 ) ||
        (i ==  9 && pw_2 ) ||
        (i == 11 && pw_2 ) ||
        (i == 13 && pw_2 ) ||
        (i == 15 && pw_2 ) ||
        (i == 17 && pw_2 ) ||
        (i == 19 && pw_2 ) ||
        (i == 21 && pw_2 ) ||
        (i == 23 && pw_2 ) ||
        (i == 25 && pw_2 ) ||
        (i == 27 && pw_2 ) ||
        (i == 29 && pw_2 ) );

    assign carry_chain[i+1] = (carry && carry_mask[i]) || force_carry;

    assign result[i] = lhs[i] ^ rhs_m[i] ^ c_in;

end endgenerate

endmodule
