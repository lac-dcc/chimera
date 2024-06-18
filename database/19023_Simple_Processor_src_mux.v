// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

/*
    Verilog does not support arrays in ports
*/
module MUX16_1_32(mux_input1,mux_input2,mux_input3,mux_input4,mux_input5,mux_input6,mux_input7,mux_input8,mux_input9,mux_input10,mux_input11,mux_input12,mux_input13,mux_input14,mux_input15,mux_input16,mux_out,select_lines);
    
    input  [31:0] mux_input1,mux_input2,mux_input3,mux_input4,mux_input5,mux_input6,mux_input7,mux_input8,mux_input9,mux_input10,mux_input11,mux_input12,mux_input13,mux_input14,mux_input15,mux_input16;
    wire [31:0] mux_input [15:0];
    assign mux_input[0] = mux_input1;
    assign mux_input[1] = mux_input2;
    assign mux_input[2] = mux_input3;
    assign mux_input[3] = mux_input4;
    assign mux_input[4] = mux_input5;
    assign mux_input[5] = mux_input6;
    assign mux_input[6] = mux_input7;
    assign mux_input[7] = mux_input8;
    assign mux_input[8] = mux_input9;
    assign mux_input[9] = mux_input10;
    assign mux_input[10] = mux_input11;
    assign mux_input[11] = mux_input12;
    assign mux_input[12] = mux_input13;
    assign mux_input[13] = mux_input14;
    assign mux_input[14] = mux_input15;
    assign mux_input[15] = mux_input16;
    output [31:0] mux_out;
    input [3:0] select_lines;
    genvar i;
    generate
    for (i=0;i<32;i=i+1) begin
        MUX16_1 mux({mux_input[0][i], mux_input[1][i], mux_input[2][i], mux_input[3][i], mux_input[4][i], mux_input[5][i], mux_input[6][i], mux_input[7][i], mux_input[8][i], mux_input[9][i], mux_input[10][i], mux_input[11][i], mux_input[12][i], mux_input[13][i], mux_input[14][i], mux_input[15][i]},mux_out[i],select_lines);
    end
    endgenerate
endmodule

module MUX16_1(mux_input,mux_out,select_lines);
    input [15:0] mux_input;
    output mux_out;
    input [3:0] select_lines;
    wire s0,s1,s2;
    wire [1:0] out;
    assign s0 = select_lines[3];
    MUX8_1 mux161(mux_input[15:8],out[0],select_lines[2:0]);
    MUX8_1 mux162(mux_input[7:0],out[1],select_lines[2:0]);
    MUX2_1 mux163(out,mux_out,s0);
endmodule

module MUX2_1(mux_input,mux_out,select_lines);
    input [1:0] mux_input;
    output mux_out;
    input select_lines;
    wire s0,s1,s2;
    not(s0,select_lines);
    and(s1,mux_input[0],s0);
    and(s2,mux_input[1],select_lines);
    or (mux_out,s1,s2);
endmodule
module MUX2_1_inv(mux_input,mux_out,select_lines);
    input [1:0] mux_input;
    output mux_out;
    input select_lines;
    wire s0,s1,s2;
    not(s0,select_lines);
    and(s1,mux_input[0],select_lines);
    and(s2,mux_input[1],s0);
    or (mux_out,s1,s2);
endmodule

module MUX4_1(mux_input,mux_out,select_lines);
    input [3:0] mux_input;
    output mux_out;
    input [1:0]select_lines;
    wire s0,s1;
    wire [1:0]out;
    assign s0 = select_lines[0];
    assign s1 = select_lines[1];
    MUX2_1_inv mux41(mux_input[3:2],out[0],s0);
    MUX2_1_inv mux42(mux_input[1:0],out[1],s0);
    MUX2_1 mux43(out,mux_out,s1);
    
endmodule

module MUX8_1(mux_input,mux_out,select_lines);
    input [7:0] mux_input;
    output mux_out;
    input [2:0] select_lines;
    wire s0,s1,s2;
    wire [1:0] out;
    assign s0 = select_lines[2];
    MUX4_1 mux81(mux_input[7:4],out[0],select_lines[1:0]);
    MUX4_1 mux82(mux_input[3:0],out[1],select_lines[1:0]);
    MUX2_1 mux83(out,mux_out,s0);
endmodule

