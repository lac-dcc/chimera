// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License



//
// module: p_mul_checker
//
//  Results checker for the pmul module.
//
module p_mul_checker (

input           mul_l   ,
input           mul_h   ,
input           clmul   ,
input  [4:0]    pw      ,

input  [31:0]   crs1    ,
input  [31:0]   crs2    ,

output [31:0]   result  ,
output [31:0]   result_hi

);

//
// One-hot pack width wires
wire pw_32 = pw[0];
wire pw_16 = pw[1];
wire pw_8  = pw[2];
wire pw_4  = pw[3];
wire pw_2  = pw[4];

// Accumulator Register.
reg [63:0] acc;

assign result =
    mul_l   ? acc[31: 0]    :
    mul_h   ? acc[63:32]    :
              0             ;

assign result_hi = acc[63:32];

//
// 32-bit carryless multiply function.
function [63:0] clmul_ref;
    input [31:0] lhs;
    input [31:0] rhs;
    input [ 5:0] len;

    reg [63:0] result;
    integer i;
    result = rhs[0] ? lhs : 0; 
    for(i = 1; i < len; i = i + 1) begin
        
        result = result ^ (rhs[i] ? lhs<<i : 32'b0);

    end

    clmul_ref = result;

endfunction

// Modular multiplication
wire [31:0] psum_16_1 = crs1[31:16] * crs2[31:16];
wire [31:0] psum_16_0 = crs1[15: 0] * crs2[15: 0];

wire [15:0] psum_8_3  = crs1[31:24] * crs2[31:24];
wire [15:0] psum_8_2  = crs1[23:16] * crs2[23:16];
wire [15:0] psum_8_1  = crs1[15: 8] * crs2[15: 8];
wire [15:0] psum_8_0  = crs1[ 7: 0] * crs2[ 7: 0];

wire [ 7:0] psum_4_7  = crs1[31:28] * crs2[31:28];
wire [ 7:0] psum_4_6  = crs1[27:24] * crs2[27:24];
wire [ 7:0] psum_4_5  = crs1[23:20] * crs2[23:20];
wire [ 7:0] psum_4_4  = crs1[19:16] * crs2[19:16];
wire [ 7:0] psum_4_3  = crs1[15:12] * crs2[15:12];
wire [ 7:0] psum_4_2  = crs1[11: 8] * crs2[11: 8];
wire [ 7:0] psum_4_1  = crs1[ 7: 4] * crs2[ 7: 4];
wire [ 7:0] psum_4_0  = crs1[ 3: 0] * crs2[ 3: 0];

wire [ 3:0] psum_2_15 = crs1[31:30] * crs2[31:30];
wire [ 3:0] psum_2_14 = crs1[29:28] * crs2[29:28];
wire [ 3:0] psum_2_13 = crs1[27:26] * crs2[27:26];
wire [ 3:0] psum_2_12 = crs1[25:24] * crs2[25:24];
wire [ 3:0] psum_2_11 = crs1[23:22] * crs2[23:22];
wire [ 3:0] psum_2_10 = crs1[21:20] * crs2[21:20];
wire [ 3:0] psum_2_9  = crs1[19:18] * crs2[19:18];
wire [ 3:0] psum_2_8  = crs1[17:16] * crs2[17:16];
wire [ 3:0] psum_2_7  = crs1[15:14] * crs2[15:14];
wire [ 3:0] psum_2_6  = crs1[13:12] * crs2[13:12];
wire [ 3:0] psum_2_5  = crs1[11:10] * crs2[11:10];
wire [ 3:0] psum_2_4  = crs1[ 9: 8] * crs2[ 9: 8];
wire [ 3:0] psum_2_3  = crs1[ 7: 6] * crs2[ 7: 6];
wire [ 3:0] psum_2_2  = crs1[ 5: 4] * crs2[ 5: 4];
wire [ 3:0] psum_2_1  = crs1[ 3: 2] * crs2[ 3: 2];
wire [ 3:0] psum_2_0  = crs1[ 1: 0] * crs2[ 1: 0];

// Carryless multiplication
wire [31:0] csum_16_1 = clmul_ref(crs1[31:16], crs2[31:16],16);
wire [31:0] csum_16_0 = clmul_ref(crs1[15: 0], crs2[15: 0],16);

wire [15:0] csum_8_3  = clmul_ref(crs1[31:24], crs2[31:24], 8);
wire [15:0] csum_8_2  = clmul_ref(crs1[23:16], crs2[23:16], 8);
wire [15:0] csum_8_1  = clmul_ref(crs1[15: 8], crs2[15: 8], 8);
wire [15:0] csum_8_0  = clmul_ref(crs1[ 7: 0], crs2[ 7: 0], 8);

wire [ 7:0] csum_4_7  = clmul_ref(crs1[31:28], crs2[31:28], 4);
wire [ 7:0] csum_4_6  = clmul_ref(crs1[27:24], crs2[27:24], 4);
wire [ 7:0] csum_4_5  = clmul_ref(crs1[23:20], crs2[23:20], 4);
wire [ 7:0] csum_4_4  = clmul_ref(crs1[19:16], crs2[19:16], 4);
wire [ 7:0] csum_4_3  = clmul_ref(crs1[15:12], crs2[15:12], 4);
wire [ 7:0] csum_4_2  = clmul_ref(crs1[11: 8], crs2[11: 8], 4);
wire [ 7:0] csum_4_1  = clmul_ref(crs1[ 7: 4], crs2[ 7: 4], 4);
wire [ 7:0] csum_4_0  = clmul_ref(crs1[ 3: 0], crs2[ 3: 0], 4);

wire [ 3:0] csum_2_15 = clmul_ref(crs1[31:30], crs2[31:30], 2);
wire [ 3:0] csum_2_14 = clmul_ref(crs1[29:28], crs2[29:28], 2);
wire [ 3:0] csum_2_13 = clmul_ref(crs1[27:26], crs2[27:26], 2);
wire [ 3:0] csum_2_12 = clmul_ref(crs1[25:24], crs2[25:24], 2);
wire [ 3:0] csum_2_11 = clmul_ref(crs1[23:22], crs2[23:22], 2);
wire [ 3:0] csum_2_10 = clmul_ref(crs1[21:20], crs2[21:20], 2);
wire [ 3:0] csum_2_9  = clmul_ref(crs1[19:18], crs2[19:18], 2);
wire [ 3:0] csum_2_8  = clmul_ref(crs1[17:16], crs2[17:16], 2);
wire [ 3:0] csum_2_7  = clmul_ref(crs1[15:14], crs2[15:14], 2);
wire [ 3:0] csum_2_6  = clmul_ref(crs1[13:12], crs2[13:12], 2);
wire [ 3:0] csum_2_5  = clmul_ref(crs1[11:10], crs2[11:10], 2);
wire [ 3:0] csum_2_4  = clmul_ref(crs1[ 9: 8], crs2[ 9: 8], 2);
wire [ 3:0] csum_2_3  = clmul_ref(crs1[ 7: 6], crs2[ 7: 6], 2);
wire [ 3:0] csum_2_2  = clmul_ref(crs1[ 5: 4], crs2[ 5: 4], 2);
wire [ 3:0] csum_2_1  = clmul_ref(crs1[ 3: 2], crs2[ 3: 2], 2);
wire [ 3:0] csum_2_0  = clmul_ref(crs1[ 1: 0], crs2[ 1: 0], 2);

always @(*) begin

    acc = 0;

    if(pw_32) begin

        if(clmul) begin

            acc = clmul_ref(crs1,crs2,32);

        end else begin

            acc = crs1 * crs2;

        end

    end
    
    if(pw_16) begin

        if(clmul) begin
            
            acc = {csum_16_1[31:16], csum_16_0[31:16], 
                   csum_16_1[15: 0], csum_16_0[15: 0]};

        end else begin

            acc = {psum_16_1[31:16], psum_16_0[31:16], 
                   psum_16_1[15: 0], psum_16_0[15: 0]};

        end

    end
    
    if(pw_8) begin

        if(clmul) begin
            
            acc = {
                csum_8_3[15:8],csum_8_2[15:8],csum_8_1[15:8],csum_8_0[15:8],
                csum_8_3[ 7:0],csum_8_2[ 7:0],csum_8_1[ 7:0],csum_8_0[ 7:0]
            };

        end else begin

            acc = {
                psum_8_3[15:8],psum_8_2[15:8],psum_8_1[15:8],psum_8_0[15:8],
                psum_8_3[ 7:0],psum_8_2[ 7:0],psum_8_1[ 7:0],psum_8_0[ 7:0]
            };

        end

    end
    
    if(pw_4) begin

        if(clmul) begin
            
            acc = {
                csum_4_7[7:4],csum_4_6[7:4],csum_4_5[7:4],csum_4_4[7:4],
                csum_4_3[7:4],csum_4_2[7:4],csum_4_1[7:4],csum_4_0[7:4],
                csum_4_7[3:0],csum_4_6[3:0],csum_4_5[3:0],csum_4_4[3:0],
                csum_4_3[3:0],csum_4_2[3:0],csum_4_1[3:0],csum_4_0[3:0]
            };

        end else begin

            acc = {
                psum_4_7[7:4],psum_4_6[7:4],psum_4_5[7:4],psum_4_4[7:4],
                psum_4_3[7:4],psum_4_2[7:4],psum_4_1[7:4],psum_4_0[7:4],
                psum_4_7[3:0],psum_4_6[3:0],psum_4_5[3:0],psum_4_4[3:0],
                psum_4_3[3:0],psum_4_2[3:0],psum_4_1[3:0],psum_4_0[3:0]
            };

        end

    end
    
    if(pw_2) begin

        if(clmul) begin
            
            acc = {
                csum_2_15[3:2],csum_2_14[3:2],csum_2_13[3:2],csum_2_12[3:2],
                csum_2_11[3:2],csum_2_10[3:2],csum_2_9 [3:2],csum_2_8 [3:2],
                csum_2_7 [3:2],csum_2_6 [3:2],csum_2_5 [3:2],csum_2_4 [3:2],
                csum_2_3 [3:2],csum_2_2 [3:2],csum_2_1 [3:2],csum_2_0 [3:2],
                csum_2_15[1:0],csum_2_14[1:0],csum_2_13[1:0],csum_2_12[1:0],
                csum_2_11[1:0],csum_2_10[1:0],csum_2_9 [1:0],csum_2_8 [1:0],
                csum_2_7 [1:0],csum_2_6 [1:0],csum_2_5 [1:0],csum_2_4 [1:0],
                csum_2_3 [1:0],csum_2_2 [1:0],csum_2_1 [1:0],csum_2_0 [1:0]
            };

        end else begin

            acc = {
                psum_2_15[3:2],psum_2_14[3:2],psum_2_13[3:2],psum_2_12[3:2],
                psum_2_11[3:2],psum_2_10[3:2],psum_2_9 [3:2],psum_2_8 [3:2],
                psum_2_7 [3:2],psum_2_6 [3:2],psum_2_5 [3:2],psum_2_4 [3:2],
                psum_2_3 [3:2],psum_2_2 [3:2],psum_2_1 [3:2],psum_2_0 [3:2],
                psum_2_15[1:0],psum_2_14[1:0],psum_2_13[1:0],psum_2_12[1:0],
                psum_2_11[1:0],psum_2_10[1:0],psum_2_9 [1:0],psum_2_8 [1:0],
                psum_2_7 [1:0],psum_2_6 [1:0],psum_2_5 [1:0],psum_2_4 [1:0],
                psum_2_3 [1:0],psum_2_2 [1:0],psum_2_1 [1:0],psum_2_0 [1:0]
            };

        end

    end

end


endmodule
