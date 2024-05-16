
//
// module: p_addsub_ftb
//
//  Formal checker for the correctness of the packed add/subtract module.
//
module p_addsub_ftb (

input clock,
input reset

);

reg  [31:0]  lhs     = $anyseq; // Left hand input
reg  [31:0]  rhs     = $anyseq; // Right hand input.
reg  [ 4:0]  pw      = $anyseq; // Pack width to operate on
wire         cin     = 1'b0;
reg          sub     = $anyseq; // Subtract if set, else add.

wire [31:0]  carry_out  ; // Output from DUT
wire [31:0]  result     ; // Output from DUT
wire [31:0]  expectation; // Output from Checker
wire [31:0]  carry_exp  ; // Output from Checker

wire         pw_32   = pw[0];
wire         pw_16   = pw[1];
wire         pw_8    = pw[2];
wire         pw_4    = pw[3];
wire         pw_2    = pw[4];

wire [4:0]   pw_sum  = pw_32 + pw_16 + pw_8 + pw_4 + pw_2;

always @(posedge clock) begin

    restrict(pw_sum == 1);

    if(pw_32) begin
        
        assert(result == expectation);

    end else if(pw_16) begin
        
        assert(result == expectation);

    end else if(pw_8 ) begin

        assert(result == expectation);

    end else if(pw_4 ) begin
        
        assert(result == expectation);

    end else if(pw_2 ) begin
        
        assert(result == expectation);

    end

end


//
// DUT Instantiation
//
p_addsub i_p_addsub (
.lhs   (lhs   ), // Left hand input
.rhs   (rhs   ), // Right hand input.
.pw    (pw    ), // Pack width to operate on
.sub   (sub   ), // Subtract if set, else add.
.cin   (cin   ), //
.c_en  (1'b1  ), //
.c_out (c_out ), // Carry out bits
.result(result)  // Result of the operation
);

//
// Checker Instantiation
//
fml_p_addsub_checker i_p_addsub_checker (
.lhs        (lhs         ), // Left hand input
.rhs        (rhs         ), // Right hand input.
.pw         (pw          ), // Pack width to operate on
.sub        (sub         ), // Subtract if set, else add.
.expectation(expectation )  // Result of the operation
);


endmodule


//
// module: fml_p_addsub_checker
//
//  Checker module, which produces a reference output for the given
//  inputs against which an implementaiton of the p_addsub function can
//  be checked.
//
module fml_p_addsub_checker (

input  wire [31:0]  lhs             , // Left hand input
input  wire [31:0]  rhs             , // Right hand input.

input  wire [ 4:0]  pw              , // Pack width to operate on
input  wire         sub             , // Subtract if set, else add.

output reg  [31:0]  expectation       // Result of the operation

);

wire [31:0]  result           ; // Result of the operation
reg          check            ; // Perform a check?

wire         pw_32   = pw[0];
wire         pw_16   = pw[1];
wire         pw_8    = pw[2];
wire         pw_4    = pw[3];
wire         pw_2    = pw[4];

wire [31:0]  exp_add_32     = lhs + rhs;

wire [15:0]  exp_add_16_0   = lhs[15: 0] + rhs[15: 0];
wire [15:0]  exp_add_16_1   = lhs[31:16] + rhs[31:16];
wire [31:0]  exp_add_16     = {exp_add_16_1, exp_add_16_0};

wire [ 7:0]  exp_add_8_0    = lhs[ 7: 0] + rhs[ 7: 0];
wire [ 7:0]  exp_add_8_1    = lhs[15: 8] + rhs[15: 8];
wire [ 7:0]  exp_add_8_2    = lhs[24:16] + rhs[24:16];
wire [ 7:0]  exp_add_8_3    = lhs[31:24] + rhs[31:24];
wire [31:0]  exp_add_8      = {exp_add_8_3, exp_add_8_2,
                               exp_add_8_1, exp_add_8_0};

wire [ 3:0]  exp_add_4_0    = lhs[ 3: 0] + rhs[ 3: 0];
wire [ 3:0]  exp_add_4_1    = lhs[ 7: 4] + rhs[ 7: 4];
wire [ 3:0]  exp_add_4_2    = lhs[11: 8] + rhs[11: 8];
wire [ 3:0]  exp_add_4_3    = lhs[15:12] + rhs[15:12];
wire [ 3:0]  exp_add_4_4    = lhs[19:16] + rhs[19:16];
wire [ 3:0]  exp_add_4_5    = lhs[23:20] + rhs[23:20];
wire [ 3:0]  exp_add_4_6    = lhs[27:24] + rhs[27:24];
wire [ 3:0]  exp_add_4_7    = lhs[31:28] + rhs[31:28];
wire [31:0]  exp_add_4      = {exp_add_4_7, exp_add_4_6,
                               exp_add_4_5, exp_add_4_4,
                               exp_add_4_3, exp_add_4_2,
                               exp_add_4_1, exp_add_4_0};

wire [ 1:0]  exp_add_2_0    = lhs[ 1: 0] + rhs[ 1: 0];
wire [ 1:0]  exp_add_2_1    = lhs[ 3: 2] + rhs[ 3: 2];
wire [ 1:0]  exp_add_2_2    = lhs[ 5: 4] + rhs[ 5: 4];
wire [ 1:0]  exp_add_2_3    = lhs[ 7: 6] + rhs[ 7: 6];
wire [ 1:0]  exp_add_2_4    = lhs[ 9: 8] + rhs[ 9: 8];
wire [ 1:0]  exp_add_2_5    = lhs[11:10] + rhs[11:10];
wire [ 1:0]  exp_add_2_6    = lhs[13:12] + rhs[13:12];
wire [ 1:0]  exp_add_2_7    = lhs[15:14] + rhs[15:14];
wire [ 1:0]  exp_add_2_8    = lhs[17:16] + rhs[17:16];
wire [ 1:0]  exp_add_2_9    = lhs[19:18] + rhs[19:18];
wire [ 1:0]  exp_add_2_10   = lhs[21:20] + rhs[21:20];
wire [ 1:0]  exp_add_2_11   = lhs[23:22] + rhs[23:22];
wire [ 1:0]  exp_add_2_12   = lhs[25:24] + rhs[25:24];
wire [ 1:0]  exp_add_2_13   = lhs[27:26] + rhs[27:26];
wire [ 1:0]  exp_add_2_14   = lhs[29:28] + rhs[29:28];
wire [ 1:0]  exp_add_2_15   = lhs[31:30] + rhs[31:30];
wire [31:0]  exp_add_2      = {exp_add_2_15, exp_add_2_14,
                               exp_add_2_13, exp_add_2_12,
                               exp_add_2_11, exp_add_2_10,
                               exp_add_2_9 , exp_add_2_8 ,
                               exp_add_2_7 , exp_add_2_6 ,
                               exp_add_2_5 , exp_add_2_4 ,
                               exp_add_2_3 , exp_add_2_2 ,
                               exp_add_2_1 , exp_add_2_0 };

wire [31:0]  exp_sub_32     = lhs - rhs;

wire [15:0]  exp_sub_16_0   = lhs[15: 0] - rhs[15: 0];
wire [15:0]  exp_sub_16_1   = lhs[31:16] - rhs[31:16];
wire [31:0]  exp_sub_16     = {exp_sub_16_1, exp_sub_16_0};

wire [ 7:0]  exp_sub_8_0    = lhs[ 7: 0] - rhs[ 7: 0];
wire [ 7:0]  exp_sub_8_1    = lhs[15: 8] - rhs[15: 8];
wire [ 7:0]  exp_sub_8_2    = lhs[24:16] - rhs[24:16];
wire [ 7:0]  exp_sub_8_3    = lhs[31:24] - rhs[31:24];
wire [31:0]  exp_sub_8      = {exp_sub_8_3, exp_sub_8_2,
                               exp_sub_8_1, exp_sub_8_0};

wire [ 3:0]  exp_sub_4_0    = lhs[ 3: 0] - rhs[ 3: 0];
wire [ 3:0]  exp_sub_4_1    = lhs[ 7: 4] - rhs[ 7: 4];
wire [ 3:0]  exp_sub_4_2    = lhs[11: 8] - rhs[11: 8];
wire [ 3:0]  exp_sub_4_3    = lhs[15:12] - rhs[15:12];
wire [ 3:0]  exp_sub_4_4    = lhs[19:16] - rhs[19:16];
wire [ 3:0]  exp_sub_4_5    = lhs[23:20] - rhs[23:20];
wire [ 3:0]  exp_sub_4_6    = lhs[27:24] - rhs[27:24];
wire [ 3:0]  exp_sub_4_7    = lhs[31:28] - rhs[31:28];
wire [31:0]  exp_sub_4      = {exp_sub_4_7, exp_sub_4_6,
                               exp_sub_4_5, exp_sub_4_4,
                               exp_sub_4_3, exp_sub_4_2,
                               exp_sub_4_1, exp_sub_4_0};

wire [ 1:0]  exp_sub_2_0    = lhs[ 1: 0] - rhs[ 1: 0];
wire [ 1:0]  exp_sub_2_1    = lhs[ 3: 2] - rhs[ 3: 2];
wire [ 1:0]  exp_sub_2_2    = lhs[ 5: 4] - rhs[ 5: 4];
wire [ 1:0]  exp_sub_2_3    = lhs[ 7: 6] - rhs[ 7: 6];
wire [ 1:0]  exp_sub_2_4    = lhs[ 9: 8] - rhs[ 9: 8];
wire [ 1:0]  exp_sub_2_5    = lhs[11:10] - rhs[11:10];
wire [ 1:0]  exp_sub_2_6    = lhs[13:12] - rhs[13:12];
wire [ 1:0]  exp_sub_2_7    = lhs[15:14] - rhs[15:14];
wire [ 1:0]  exp_sub_2_8    = lhs[17:16] - rhs[17:16];
wire [ 1:0]  exp_sub_2_9    = lhs[19:18] - rhs[19:18];
wire [ 1:0]  exp_sub_2_10   = lhs[21:20] - rhs[21:20];
wire [ 1:0]  exp_sub_2_11   = lhs[23:22] - rhs[23:22];
wire [ 1:0]  exp_sub_2_12   = lhs[25:24] - rhs[25:24];
wire [ 1:0]  exp_sub_2_13   = lhs[27:26] - rhs[27:26];
wire [ 1:0]  exp_sub_2_14   = lhs[29:28] - rhs[29:28];
wire [ 1:0]  exp_sub_2_15   = lhs[31:30] - rhs[31:30];
wire [31:0]  exp_sub_2      = {exp_sub_2_15, exp_sub_2_14,
                               exp_sub_2_13, exp_sub_2_12,
                               exp_sub_2_11, exp_sub_2_10,
                               exp_sub_2_9 , exp_sub_2_8 ,
                               exp_sub_2_7 , exp_sub_2_6 ,
                               exp_sub_2_5 , exp_sub_2_4 ,
                               exp_sub_2_3 , exp_sub_2_2 ,
                               exp_sub_2_1 , exp_sub_2_0 };
    
always @(*) begin

    expectation = 0;

    if(pw_32) begin
        
        expectation = sub ? exp_sub_32 : exp_add_32;

    end else if(pw_16) begin
        
        expectation = sub ? exp_sub_16 : exp_add_16;

    end else if(pw_8 ) begin

        expectation = sub ? exp_sub_8  : exp_add_8 ;

    end else if(pw_4 ) begin
        
        expectation = sub ? exp_sub_4  : exp_add_4 ;

    end else if(pw_2 ) begin
        
        expectation = sub ? exp_sub_2  : exp_add_2 ;

    end
end

endmodule

