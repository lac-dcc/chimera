// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module wide_inv_reg
(
    d_in,
    d_out,
    clock,
    rst,
    rdy
);
    input clock;
    input rst;
    input [31:0] d_in;

    output [31:0] d_out;

    output reg rdy;
    wire [63:0]fpga_top_in;
    wire [63:0] fpga_top_out;
    wire [63:0] fpga_bot_in;
    wire [63:0] fpga_bot_out;
    wire [63:0] fpga_left_in;
    wire [63:0] fpga_left_out;
    wire [63:0] fpga_right_in;
    wire [63:0] fpga_right_out;
    reg [319:0] fpga_configs_in;
    reg [171:0] fpga_configs_en;

    assign d_out[5] = fpga_bot_out[8];
    assign d_out[11] = fpga_bot_out[12];
    assign d_out[10] = fpga_bot_out[13];
    assign d_out[15] = fpga_bot_out[14];
    assign d_out[31] = fpga_left_out[0];
    assign d_out[30] = fpga_left_out[2];
    assign d_out[29] = fpga_left_out[6];
    assign d_out[12] = fpga_left_out[7];
    assign d_out[19] = fpga_left_out[56];
    assign d_out[22] = fpga_left_out[57];
    assign d_out[21] = fpga_left_out[60];
    assign d_out[20] = fpga_left_out[62];
    assign d_out[18] = fpga_right_out[0];
    assign d_out[16] = fpga_right_out[1];
    assign d_out[17] = fpga_right_out[4];
    assign d_out[8] = fpga_right_out[7];
    assign d_out[4] = fpga_right_out[11];
    assign d_out[6] = fpga_right_out[12];
    assign d_out[9] = fpga_right_out[14];
    assign d_out[7] = fpga_right_out[15];
    assign d_out[28] = fpga_right_out[24];
    assign d_out[27] = fpga_right_out[25];
    assign d_out[26] = fpga_right_out[26];
    assign d_out[14] = fpga_right_out[29];
    assign d_out[1] = fpga_right_out[32];
    assign d_out[2] = fpga_right_out[33];
    assign d_out[0] = fpga_right_out[34];
    assign d_out[3] = fpga_right_out[35];
    assign d_out[13] = fpga_right_out[42];
    assign d_out[23] = fpga_right_out[43];
    assign d_out[24] = fpga_right_out[44];
    assign d_out[25] = fpga_right_out[45];
    assign fpga_top_in[0] = 1'b0;
    assign fpga_top_in[1] = 1'b0;
    assign fpga_top_in[2] = 1'b0;
    assign fpga_top_in[3] = d_in[20];
    assign fpga_top_in[4] = 1'b0;
    assign fpga_top_in[5] = 1'b0;
    assign fpga_top_in[6] = 1'b0;
    assign fpga_top_in[7] = d_in[21];
    assign fpga_top_in[8] = 1'b0;
    assign fpga_top_in[9] = 1'b0;
    assign fpga_top_in[10] = 1'b0;
    assign fpga_top_in[11] = 1'b0;
    assign fpga_top_in[12] = 1'b0;
    assign fpga_top_in[13] = 1'b0;
    assign fpga_top_in[14] = 1'b0;
    assign fpga_top_in[15] = 1'b0;
    assign fpga_top_in[16] = 1'b0;
    assign fpga_top_in[17] = 1'b0;
    assign fpga_top_in[18] = 1'b0;
    assign fpga_top_in[19] = 1'b0;
    assign fpga_top_in[20] = 1'b0;
    assign fpga_top_in[21] = 1'b0;
    assign fpga_top_in[22] = 1'b0;
    assign fpga_top_in[23] = 1'b0;
    assign fpga_top_in[24] = 1'b0;
    assign fpga_top_in[25] = 1'b0;
    assign fpga_top_in[26] = 1'b0;
    assign fpga_top_in[27] = 1'b0;
    assign fpga_top_in[28] = 1'b0;
    assign fpga_top_in[29] = 1'b0;
    assign fpga_top_in[30] = 1'b0;
    assign fpga_top_in[31] = 1'b0;
    assign fpga_top_in[32] = 1'b0;
    assign fpga_top_in[33] = 1'b0;
    assign fpga_top_in[34] = 1'b0;
    assign fpga_top_in[35] = 1'b0;
    assign fpga_top_in[36] = 1'b0;
    assign fpga_top_in[37] = 1'b0;
    assign fpga_top_in[38] = 1'b0;
    assign fpga_top_in[39] = 1'b0;
    assign fpga_top_in[40] = 1'b0;
    assign fpga_top_in[41] = 1'b0;
    assign fpga_top_in[42] = 1'b0;
    assign fpga_top_in[43] = 1'b0;
    assign fpga_top_in[44] = 1'b0;
    assign fpga_top_in[45] = 1'b0;
    assign fpga_top_in[46] = 1'b0;
    assign fpga_top_in[47] = 1'b0;
    assign fpga_top_in[48] = 1'b0;
    assign fpga_top_in[49] = 1'b0;
    assign fpga_top_in[50] = 1'b0;
    assign fpga_top_in[51] = 1'b0;
    assign fpga_top_in[52] = 1'b0;
    assign fpga_top_in[53] = 1'b0;
    assign fpga_top_in[54] = 1'b0;
    assign fpga_top_in[55] = 1'b0;
    assign fpga_top_in[56] = 1'b0;
    assign fpga_top_in[57] = 1'b0;
    assign fpga_top_in[58] = 1'b0;
    assign fpga_top_in[59] = 1'b0;
    assign fpga_top_in[60] = 1'b0;
    assign fpga_top_in[61] = 1'b0;
    assign fpga_top_in[62] = 1'b0;
    assign fpga_top_in[63] = 1'b0;
    assign fpga_bot_in[0] = d_in[31];
    assign fpga_bot_in[1] = 1'b0;
    assign fpga_bot_in[2] = 1'b0;
    assign fpga_bot_in[3] = d_in[12];
    assign fpga_bot_in[4] = 1'b0;
    assign fpga_bot_in[5] = d_in[30];
    assign fpga_bot_in[6] = d_in[11];
    assign fpga_bot_in[7] = 1'b0;
    assign fpga_bot_in[8] = 1'b0;
    assign fpga_bot_in[9] = d_in[5];
    assign fpga_bot_in[10] = d_in[15];
    assign fpga_bot_in[11] = rst;
    assign fpga_bot_in[12] = 1'b0;
    assign fpga_bot_in[13] = 1'b0;
    assign fpga_bot_in[14] = 1'b0;
    assign fpga_bot_in[15] = d_in[10];
    assign fpga_bot_in[16] = 1'b0;
    assign fpga_bot_in[17] = 1'b0;
    assign fpga_bot_in[18] = 1'b0;
    assign fpga_bot_in[19] = 1'b0;
    assign fpga_bot_in[20] = 1'b0;
    assign fpga_bot_in[21] = 1'b0;
    assign fpga_bot_in[22] = 1'b0;
    assign fpga_bot_in[23] = 1'b0;
    assign fpga_bot_in[24] = 1'b0;
    assign fpga_bot_in[25] = 1'b0;
    assign fpga_bot_in[26] = 1'b0;
    assign fpga_bot_in[27] = 1'b0;
    assign fpga_bot_in[28] = 1'b0;
    assign fpga_bot_in[29] = 1'b0;
    assign fpga_bot_in[30] = 1'b0;
    assign fpga_bot_in[31] = 1'b0;
    assign fpga_bot_in[32] = 1'b0;
    assign fpga_bot_in[33] = 1'b0;
    assign fpga_bot_in[34] = 1'b0;
    assign fpga_bot_in[35] = 1'b0;
    assign fpga_bot_in[36] = 1'b0;
    assign fpga_bot_in[37] = 1'b0;
    assign fpga_bot_in[38] = 1'b0;
    assign fpga_bot_in[39] = 1'b0;
    assign fpga_bot_in[40] = 1'b0;
    assign fpga_bot_in[41] = 1'b0;
    assign fpga_bot_in[42] = 1'b0;
    assign fpga_bot_in[43] = 1'b0;
    assign fpga_bot_in[44] = 1'b0;
    assign fpga_bot_in[45] = 1'b0;
    assign fpga_bot_in[46] = 1'b0;
    assign fpga_bot_in[47] = 1'b0;
    assign fpga_bot_in[48] = 1'b0;
    assign fpga_bot_in[49] = 1'b0;
    assign fpga_bot_in[50] = 1'b0;
    assign fpga_bot_in[51] = 1'b0;
    assign fpga_bot_in[52] = 1'b0;
    assign fpga_bot_in[53] = 1'b0;
    assign fpga_bot_in[54] = 1'b0;
    assign fpga_bot_in[55] = 1'b0;
    assign fpga_bot_in[56] = d_in[17];
    assign fpga_bot_in[57] = 1'b0;
    assign fpga_bot_in[58] = d_in[16];
    assign fpga_bot_in[59] = 1'b0;
    assign fpga_bot_in[60] = 1'b0;
    assign fpga_bot_in[61] = 1'b0;
    assign fpga_bot_in[62] = d_in[8];
    assign fpga_bot_in[63] = d_in[18];
    assign fpga_left_in[0] = 1'b0;
    assign fpga_left_in[1] = d_in[29];
    assign fpga_left_in[2] = 1'b0;
    assign fpga_left_in[3] = 1'b0;
    assign fpga_left_in[4] = 1'b0;
    assign fpga_left_in[5] = 1'b0;
    assign fpga_left_in[6] = 1'b0;
    assign fpga_left_in[7] = 1'b0;
    assign fpga_left_in[8] = 1'b0;
    assign fpga_left_in[9] = 1'b0;
    assign fpga_left_in[10] = 1'b0;
    assign fpga_left_in[11] = 1'b0;
    assign fpga_left_in[12] = 1'b0;
    assign fpga_left_in[13] = 1'b0;
    assign fpga_left_in[14] = 1'b0;
    assign fpga_left_in[15] = 1'b0;
    assign fpga_left_in[16] = 1'b0;
    assign fpga_left_in[17] = 1'b0;
    assign fpga_left_in[18] = 1'b0;
    assign fpga_left_in[19] = 1'b0;
    assign fpga_left_in[20] = 1'b0;
    assign fpga_left_in[21] = 1'b0;
    assign fpga_left_in[22] = 1'b0;
    assign fpga_left_in[23] = 1'b0;
    assign fpga_left_in[24] = 1'b0;
    assign fpga_left_in[25] = 1'b0;
    assign fpga_left_in[26] = 1'b0;
    assign fpga_left_in[27] = 1'b0;
    assign fpga_left_in[28] = 1'b0;
    assign fpga_left_in[29] = 1'b0;
    assign fpga_left_in[30] = 1'b0;
    assign fpga_left_in[31] = 1'b0;
    assign fpga_left_in[32] = 1'b0;
    assign fpga_left_in[33] = 1'b0;
    assign fpga_left_in[34] = 1'b0;
    assign fpga_left_in[35] = 1'b0;
    assign fpga_left_in[36] = 1'b0;
    assign fpga_left_in[37] = 1'b0;
    assign fpga_left_in[38] = 1'b0;
    assign fpga_left_in[39] = 1'b0;
    assign fpga_left_in[40] = 1'b0;
    assign fpga_left_in[41] = 1'b0;
    assign fpga_left_in[42] = 1'b0;
    assign fpga_left_in[43] = 1'b0;
    assign fpga_left_in[44] = 1'b0;
    assign fpga_left_in[45] = 1'b0;
    assign fpga_left_in[46] = 1'b0;
    assign fpga_left_in[47] = 1'b0;
    assign fpga_left_in[48] = 1'b0;
    assign fpga_left_in[49] = 1'b0;
    assign fpga_left_in[50] = 1'b0;
    assign fpga_left_in[51] = 1'b0;
    assign fpga_left_in[52] = 1'b0;
    assign fpga_left_in[53] = 1'b0;
    assign fpga_left_in[54] = 1'b0;
    assign fpga_left_in[55] = 1'b0;
    assign fpga_left_in[56] = 1'b0;
    assign fpga_left_in[57] = 1'b0;
    assign fpga_left_in[58] = d_in[22];
    assign fpga_left_in[59] = d_in[19];
    assign fpga_left_in[60] = 1'b0;
    assign fpga_left_in[61] = 1'b0;
    assign fpga_left_in[62] = 1'b0;
    assign fpga_left_in[63] = 1'b0;
    assign fpga_right_in[0] = 1'b0;
    assign fpga_right_in[1] = 1'b0;
    assign fpga_right_in[2] = 1'b0;
    assign fpga_right_in[3] = 1'b0;
    assign fpga_right_in[4] = 1'b0;
    assign fpga_right_in[5] = 1'b0;
    assign fpga_right_in[6] = 1'b0;
    assign fpga_right_in[7] = 1'b0;
    assign fpga_right_in[8] = d_in[4];
    assign fpga_right_in[9] = d_in[9];
    assign fpga_right_in[10] = d_in[7];
    assign fpga_right_in[11] = 1'b0;
    assign fpga_right_in[12] = 1'b0;
    assign fpga_right_in[13] = d_in[6];
    assign fpga_right_in[14] = 1'b0;
    assign fpga_right_in[15] = 1'b0;
    assign fpga_right_in[16] = 1'b0;
    assign fpga_right_in[17] = 1'b0;
    assign fpga_right_in[18] = 1'b0;
    assign fpga_right_in[19] = 1'b0;
    assign fpga_right_in[20] = 1'b0;
    assign fpga_right_in[21] = 1'b0;
    assign fpga_right_in[22] = 1'b0;
    assign fpga_right_in[23] = 1'b0;
    assign fpga_right_in[24] = 1'b0;
    assign fpga_right_in[25] = 1'b0;
    assign fpga_right_in[26] = 1'b0;
    assign fpga_right_in[27] = d_in[28];
    assign fpga_right_in[28] = d_in[27];
    assign fpga_right_in[29] = 1'b0;
    assign fpga_right_in[30] = d_in[14];
    assign fpga_right_in[31] = d_in[26];
    assign fpga_right_in[32] = 1'b0;
    assign fpga_right_in[33] = 1'b0;
    assign fpga_right_in[34] = 1'b0;
    assign fpga_right_in[35] = 1'b0;
    assign fpga_right_in[36] = d_in[3];
    assign fpga_right_in[37] = d_in[2];
    assign fpga_right_in[38] = d_in[1];
    assign fpga_right_in[39] = d_in[0];
    assign fpga_right_in[40] = d_in[13];
    assign fpga_right_in[41] = d_in[25];
    assign fpga_right_in[42] = 1'b0;
    assign fpga_right_in[43] = 1'b0;
    assign fpga_right_in[44] = 1'b0;
    assign fpga_right_in[45] = 1'b0;
    assign fpga_right_in[46] = d_in[23];
    assign fpga_right_in[47] = d_in[24];
    assign fpga_right_in[48] = 1'b0;
    assign fpga_right_in[49] = 1'b0;
    assign fpga_right_in[50] = 1'b0;
    assign fpga_right_in[51] = 1'b0;
    assign fpga_right_in[52] = 1'b0;
    assign fpga_right_in[53] = 1'b0;
    assign fpga_right_in[54] = 1'b0;
    assign fpga_right_in[55] = 1'b0;
    assign fpga_right_in[56] = 1'b0;
    assign fpga_right_in[57] = 1'b0;
    assign fpga_right_in[58] = 1'b0;
    assign fpga_right_in[59] = 1'b0;
    assign fpga_right_in[60] = 1'b0;
    assign fpga_right_in[61] = 1'b0;
    assign fpga_right_in[62] = 1'b0;
    assign fpga_right_in[63] = 1'b0;


    reg ff_en;
    integer in_f;

    integer read_status;    initial begin
       in_f = $fopen("wide_inv_reg.bs", "r");
       fpga_configs_in = 1'b0;
       ff_en = 1'b0;
       rdy = 1'b0;
       fpga_configs_en = 1'b1;
    end

    initial begin
        repeat (10) @ (posedge clock);
        while ( ! $feof(in_f)) begin
        @ (posedge clock);
        read_status = $fscanf(in_f, "%b\n", fpga_configs_in);
        @ (posedge clock);
        fpga_configs_en = fpga_configs_en << 1;
        end
        repeat (10) @ (posedge clock);
        $fclose(in_f);
        #100 ff_en = 1'b1;
        #100 rdy = 1'b1;
    end

    fpga fpag_dut (
        .top_in(fpga_top_in),
        .bot_in(fpga_bot_in),
        .left_in(fpga_left_in),
        .right_in(fpga_right_in),
        .top_out(fpga_top_out),
        .bot_out(fpga_bot_out),
        .left_out(fpga_left_out),
        .right_out(fpga_right_out),
        .ff_en(ff_en),
        .configs_en(fpga_configs_en),
        .configs_in(fpga_configs_in),
        .clock(clock),
        .rst(rst)
    );

endmodule
// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module wide_inv_reg
(
    d_in,
    d_out,
    clock,
    rst,
    rdy
);
    input clock;
    input rst;
    input [31:0] d_in;

    output [31:0] d_out;

    output reg rdy;
    wire [63:0]fpga_top_in;
    wire [63:0] fpga_top_out;
    wire [63:0] fpga_bot_in;
    wire [63:0] fpga_bot_out;
    wire [63:0] fpga_left_in;
    wire [63:0] fpga_left_out;
    wire [63:0] fpga_right_in;
    wire [63:0] fpga_right_out;
    reg [319:0] fpga_configs_in;
    reg [171:0] fpga_configs_en;

    assign d_out[5] = fpga_bot_out[8];
    assign d_out[11] = fpga_bot_out[12];
    assign d_out[10] = fpga_bot_out[13];
    assign d_out[15] = fpga_bot_out[14];
    assign d_out[31] = fpga_left_out[0];
    assign d_out[30] = fpga_left_out[2];
    assign d_out[29] = fpga_left_out[6];
    assign d_out[12] = fpga_left_out[7];
    assign d_out[19] = fpga_left_out[56];
    assign d_out[22] = fpga_left_out[57];
    assign d_out[21] = fpga_left_out[60];
    assign d_out[20] = fpga_left_out[62];
    assign d_out[18] = fpga_right_out[0];
    assign d_out[16] = fpga_right_out[1];
    assign d_out[17] = fpga_right_out[4];
    assign d_out[8] = fpga_right_out[7];
    assign d_out[4] = fpga_right_out[11];
    assign d_out[6] = fpga_right_out[12];
    assign d_out[9] = fpga_right_out[14];
    assign d_out[7] = fpga_right_out[15];
    assign d_out[28] = fpga_right_out[24];
    assign d_out[27] = fpga_right_out[25];
    assign d_out[26] = fpga_right_out[26];
    assign d_out[14] = fpga_right_out[29];
    assign d_out[1] = fpga_right_out[32];
    assign d_out[2] = fpga_right_out[33];
    assign d_out[0] = fpga_right_out[34];
    assign d_out[3] = fpga_right_out[35];
    assign d_out[13] = fpga_right_out[42];
    assign d_out[23] = fpga_right_out[43];
    assign d_out[24] = fpga_right_out[44];
    assign d_out[25] = fpga_right_out[45];
    assign fpga_top_in[0] = 1'b0;
    assign fpga_top_in[1] = 1'b0;
    assign fpga_top_in[2] = 1'b0;
    assign fpga_top_in[3] = d_in[20];
    assign fpga_top_in[4] = 1'b0;
    assign fpga_top_in[5] = 1'b0;
    assign fpga_top_in[6] = 1'b0;
    assign fpga_top_in[7] = d_in[21];
    assign fpga_top_in[8] = 1'b0;
    assign fpga_top_in[9] = 1'b0;
    assign fpga_top_in[10] = 1'b0;
    assign fpga_top_in[11] = 1'b0;
    assign fpga_top_in[12] = 1'b0;
    assign fpga_top_in[13] = 1'b0;
    assign fpga_top_in[14] = 1'b0;
    assign fpga_top_in[15] = 1'b0;
    assign fpga_top_in[16] = 1'b0;
    assign fpga_top_in[17] = 1'b0;
    assign fpga_top_in[18] = 1'b0;
    assign fpga_top_in[19] = 1'b0;
    assign fpga_top_in[20] = 1'b0;
    assign fpga_top_in[21] = 1'b0;
    assign fpga_top_in[22] = 1'b0;
    assign fpga_top_in[23] = 1'b0;
    assign fpga_top_in[24] = 1'b0;
    assign fpga_top_in[25] = 1'b0;
    assign fpga_top_in[26] = 1'b0;
    assign fpga_top_in[27] = 1'b0;
    assign fpga_top_in[28] = 1'b0;
    assign fpga_top_in[29] = 1'b0;
    assign fpga_top_in[30] = 1'b0;
    assign fpga_top_in[31] = 1'b0;
    assign fpga_top_in[32] = 1'b0;
    assign fpga_top_in[33] = 1'b0;
    assign fpga_top_in[34] = 1'b0;
    assign fpga_top_in[35] = 1'b0;
    assign fpga_top_in[36] = 1'b0;
    assign fpga_top_in[37] = 1'b0;
    assign fpga_top_in[38] = 1'b0;
    assign fpga_top_in[39] = 1'b0;
    assign fpga_top_in[40] = 1'b0;
    assign fpga_top_in[41] = 1'b0;
    assign fpga_top_in[42] = 1'b0;
    assign fpga_top_in[43] = 1'b0;
    assign fpga_top_in[44] = 1'b0;
    assign fpga_top_in[45] = 1'b0;
    assign fpga_top_in[46] = 1'b0;
    assign fpga_top_in[47] = 1'b0;
    assign fpga_top_in[48] = 1'b0;
    assign fpga_top_in[49] = 1'b0;
    assign fpga_top_in[50] = 1'b0;
    assign fpga_top_in[51] = 1'b0;
    assign fpga_top_in[52] = 1'b0;
    assign fpga_top_in[53] = 1'b0;
    assign fpga_top_in[54] = 1'b0;
    assign fpga_top_in[55] = 1'b0;
    assign fpga_top_in[56] = 1'b0;
    assign fpga_top_in[57] = 1'b0;
    assign fpga_top_in[58] = 1'b0;
    assign fpga_top_in[59] = 1'b0;
    assign fpga_top_in[60] = 1'b0;
    assign fpga_top_in[61] = 1'b0;
    assign fpga_top_in[62] = 1'b0;
    assign fpga_top_in[63] = 1'b0;
    assign fpga_bot_in[0] = d_in[31];
    assign fpga_bot_in[1] = 1'b0;
    assign fpga_bot_in[2] = 1'b0;
    assign fpga_bot_in[3] = d_in[12];
    assign fpga_bot_in[4] = 1'b0;
    assign fpga_bot_in[5] = d_in[30];
    assign fpga_bot_in[6] = d_in[11];
    assign fpga_bot_in[7] = 1'b0;
    assign fpga_bot_in[8] = 1'b0;
    assign fpga_bot_in[9] = d_in[5];
    assign fpga_bot_in[10] = d_in[15];
    assign fpga_bot_in[11] = rst;
    assign fpga_bot_in[12] = 1'b0;
    assign fpga_bot_in[13] = 1'b0;
    assign fpga_bot_in[14] = 1'b0;
    assign fpga_bot_in[15] = d_in[10];
    assign fpga_bot_in[16] = 1'b0;
    assign fpga_bot_in[17] = 1'b0;
    assign fpga_bot_in[18] = 1'b0;
    assign fpga_bot_in[19] = 1'b0;
    assign fpga_bot_in[20] = 1'b0;
    assign fpga_bot_in[21] = 1'b0;
    assign fpga_bot_in[22] = 1'b0;
    assign fpga_bot_in[23] = 1'b0;
    assign fpga_bot_in[24] = 1'b0;
    assign fpga_bot_in[25] = 1'b0;
    assign fpga_bot_in[26] = 1'b0;
    assign fpga_bot_in[27] = 1'b0;
    assign fpga_bot_in[28] = 1'b0;
    assign fpga_bot_in[29] = 1'b0;
    assign fpga_bot_in[30] = 1'b0;
    assign fpga_bot_in[31] = 1'b0;
    assign fpga_bot_in[32] = 1'b0;
    assign fpga_bot_in[33] = 1'b0;
    assign fpga_bot_in[34] = 1'b0;
    assign fpga_bot_in[35] = 1'b0;
    assign fpga_bot_in[36] = 1'b0;
    assign fpga_bot_in[37] = 1'b0;
    assign fpga_bot_in[38] = 1'b0;
    assign fpga_bot_in[39] = 1'b0;
    assign fpga_bot_in[40] = 1'b0;
    assign fpga_bot_in[41] = 1'b0;
    assign fpga_bot_in[42] = 1'b0;
    assign fpga_bot_in[43] = 1'b0;
    assign fpga_bot_in[44] = 1'b0;
    assign fpga_bot_in[45] = 1'b0;
    assign fpga_bot_in[46] = 1'b0;
    assign fpga_bot_in[47] = 1'b0;
    assign fpga_bot_in[48] = 1'b0;
    assign fpga_bot_in[49] = 1'b0;
    assign fpga_bot_in[50] = 1'b0;
    assign fpga_bot_in[51] = 1'b0;
    assign fpga_bot_in[52] = 1'b0;
    assign fpga_bot_in[53] = 1'b0;
    assign fpga_bot_in[54] = 1'b0;
    assign fpga_bot_in[55] = 1'b0;
    assign fpga_bot_in[56] = d_in[17];
    assign fpga_bot_in[57] = 1'b0;
    assign fpga_bot_in[58] = d_in[16];
    assign fpga_bot_in[59] = 1'b0;
    assign fpga_bot_in[60] = 1'b0;
    assign fpga_bot_in[61] = 1'b0;
    assign fpga_bot_in[62] = d_in[8];
    assign fpga_bot_in[63] = d_in[18];
    assign fpga_left_in[0] = 1'b0;
    assign fpga_left_in[1] = d_in[29];
    assign fpga_left_in[2] = 1'b0;
    assign fpga_left_in[3] = 1'b0;
    assign fpga_left_in[4] = 1'b0;
    assign fpga_left_in[5] = 1'b0;
    assign fpga_left_in[6] = 1'b0;
    assign fpga_left_in[7] = 1'b0;
    assign fpga_left_in[8] = 1'b0;
    assign fpga_left_in[9] = 1'b0;
    assign fpga_left_in[10] = 1'b0;
    assign fpga_left_in[11] = 1'b0;
    assign fpga_left_in[12] = 1'b0;
    assign fpga_left_in[13] = 1'b0;
    assign fpga_left_in[14] = 1'b0;
    assign fpga_left_in[15] = 1'b0;
    assign fpga_left_in[16] = 1'b0;
    assign fpga_left_in[17] = 1'b0;
    assign fpga_left_in[18] = 1'b0;
    assign fpga_left_in[19] = 1'b0;
    assign fpga_left_in[20] = 1'b0;
    assign fpga_left_in[21] = 1'b0;
    assign fpga_left_in[22] = 1'b0;
    assign fpga_left_in[23] = 1'b0;
    assign fpga_left_in[24] = 1'b0;
    assign fpga_left_in[25] = 1'b0;
    assign fpga_left_in[26] = 1'b0;
    assign fpga_left_in[27] = 1'b0;
    assign fpga_left_in[28] = 1'b0;
    assign fpga_left_in[29] = 1'b0;
    assign fpga_left_in[30] = 1'b0;
    assign fpga_left_in[31] = 1'b0;
    assign fpga_left_in[32] = 1'b0;
    assign fpga_left_in[33] = 1'b0;
    assign fpga_left_in[34] = 1'b0;
    assign fpga_left_in[35] = 1'b0;
    assign fpga_left_in[36] = 1'b0;
    assign fpga_left_in[37] = 1'b0;
    assign fpga_left_in[38] = 1'b0;
    assign fpga_left_in[39] = 1'b0;
    assign fpga_left_in[40] = 1'b0;
    assign fpga_left_in[41] = 1'b0;
    assign fpga_left_in[42] = 1'b0;
    assign fpga_left_in[43] = 1'b0;
    assign fpga_left_in[44] = 1'b0;
    assign fpga_left_in[45] = 1'b0;
    assign fpga_left_in[46] = 1'b0;
    assign fpga_left_in[47] = 1'b0;
    assign fpga_left_in[48] = 1'b0;
    assign fpga_left_in[49] = 1'b0;
    assign fpga_left_in[50] = 1'b0;
    assign fpga_left_in[51] = 1'b0;
    assign fpga_left_in[52] = 1'b0;
    assign fpga_left_in[53] = 1'b0;
    assign fpga_left_in[54] = 1'b0;
    assign fpga_left_in[55] = 1'b0;
    assign fpga_left_in[56] = 1'b0;
    assign fpga_left_in[57] = 1'b0;
    assign fpga_left_in[58] = d_in[22];
    assign fpga_left_in[59] = d_in[19];
    assign fpga_left_in[60] = 1'b0;
    assign fpga_left_in[61] = 1'b0;
    assign fpga_left_in[62] = 1'b0;
    assign fpga_left_in[63] = 1'b0;
    assign fpga_right_in[0] = 1'b0;
    assign fpga_right_in[1] = 1'b0;
    assign fpga_right_in[2] = 1'b0;
    assign fpga_right_in[3] = 1'b0;
    assign fpga_right_in[4] = 1'b0;
    assign fpga_right_in[5] = 1'b0;
    assign fpga_right_in[6] = 1'b0;
    assign fpga_right_in[7] = 1'b0;
    assign fpga_right_in[8] = d_in[4];
    assign fpga_right_in[9] = d_in[9];
    assign fpga_right_in[10] = d_in[7];
    assign fpga_right_in[11] = 1'b0;
    assign fpga_right_in[12] = 1'b0;
    assign fpga_right_in[13] = d_in[6];
    assign fpga_right_in[14] = 1'b0;
    assign fpga_right_in[15] = 1'b0;
    assign fpga_right_in[16] = 1'b0;
    assign fpga_right_in[17] = 1'b0;
    assign fpga_right_in[18] = 1'b0;
    assign fpga_right_in[19] = 1'b0;
    assign fpga_right_in[20] = 1'b0;
    assign fpga_right_in[21] = 1'b0;
    assign fpga_right_in[22] = 1'b0;
    assign fpga_right_in[23] = 1'b0;
    assign fpga_right_in[24] = 1'b0;
    assign fpga_right_in[25] = 1'b0;
    assign fpga_right_in[26] = 1'b0;
    assign fpga_right_in[27] = d_in[28];
    assign fpga_right_in[28] = d_in[27];
    assign fpga_right_in[29] = 1'b0;
    assign fpga_right_in[30] = d_in[14];
    assign fpga_right_in[31] = d_in[26];
    assign fpga_right_in[32] = 1'b0;
    assign fpga_right_in[33] = 1'b0;
    assign fpga_right_in[34] = 1'b0;
    assign fpga_right_in[35] = 1'b0;
    assign fpga_right_in[36] = d_in[3];
    assign fpga_right_in[37] = d_in[2];
    assign fpga_right_in[38] = d_in[1];
    assign fpga_right_in[39] = d_in[0];
    assign fpga_right_in[40] = d_in[13];
    assign fpga_right_in[41] = d_in[25];
    assign fpga_right_in[42] = 1'b0;
    assign fpga_right_in[43] = 1'b0;
    assign fpga_right_in[44] = 1'b0;
    assign fpga_right_in[45] = 1'b0;
    assign fpga_right_in[46] = d_in[23];
    assign fpga_right_in[47] = d_in[24];
    assign fpga_right_in[48] = 1'b0;
    assign fpga_right_in[49] = 1'b0;
    assign fpga_right_in[50] = 1'b0;
    assign fpga_right_in[51] = 1'b0;
    assign fpga_right_in[52] = 1'b0;
    assign fpga_right_in[53] = 1'b0;
    assign fpga_right_in[54] = 1'b0;
    assign fpga_right_in[55] = 1'b0;
    assign fpga_right_in[56] = 1'b0;
    assign fpga_right_in[57] = 1'b0;
    assign fpga_right_in[58] = 1'b0;
    assign fpga_right_in[59] = 1'b0;
    assign fpga_right_in[60] = 1'b0;
    assign fpga_right_in[61] = 1'b0;
    assign fpga_right_in[62] = 1'b0;
    assign fpga_right_in[63] = 1'b0;


    reg ff_en;
    integer in_f;

    integer read_status;    initial begin
       in_f = $fopen("wide_inv_reg.bs", "r");
       fpga_configs_in = 1'b0;
       ff_en = 1'b0;
       rdy = 1'b0;
       fpga_configs_en = 1'b1;
    end

    initial begin
        repeat (10) @ (posedge clock);
        while ( ! $feof(in_f)) begin
        @ (posedge clock);
        read_status = $fscanf(in_f, "%b\n", fpga_configs_in);
        @ (posedge clock);
        fpga_configs_en = fpga_configs_en << 1;
        end
        repeat (10) @ (posedge clock);
        $fclose(in_f);
        #100 ff_en = 1'b1;
        #100 rdy = 1'b1;
    end

    fpga fpag_dut (
        .top_in(fpga_top_in),
        .bot_in(fpga_bot_in),
        .left_in(fpga_left_in),
        .right_in(fpga_right_in),
        .top_out(fpga_top_out),
        .bot_out(fpga_bot_out),
        .left_out(fpga_left_out),
        .right_out(fpga_right_out),
        .ff_en(ff_en),
        .configs_en(fpga_configs_en),
        .configs_in(fpga_configs_in),
        .clock(clock),
        .rst(rst)
    );

endmodule
