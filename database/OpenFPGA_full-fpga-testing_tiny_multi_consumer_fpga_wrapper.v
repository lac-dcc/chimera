// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module multi_consumer
(
    d_in,
    d_out_1, d_out_2, d_out_4, d_out_7,
    clock, rst, rdy
);

    input clock;
    input rst;

    input [15:0] d_in;

    output [15:0] d_out_1, d_out_2, d_out_4, d_out_7;

    output reg rdy;
    wire [39:0]fpga_top_in;
    wire [39:0] fpga_top_out;
    wire [39:0] fpga_bot_in;
    wire [39:0] fpga_bot_out;
    wire [39:0] fpga_left_in;
    wire [39:0] fpga_left_out;
    wire [39:0] fpga_right_in;
    wire [39:0] fpga_right_out;
    reg [223:0] fpga_configs_in;
    reg [42:0] fpga_configs_en;

    assign d_out_4[15] = fpga_top_out[7];
    assign d_out_1[14] = fpga_top_out[8];
    assign d_out_7[14] = fpga_top_out[15];
    assign d_out_4[0] = fpga_top_out[16];
    assign d_out_1[15] = fpga_top_out[17];
    assign d_out_2[15] = fpga_top_out[18];
    assign d_out_2[0] = fpga_top_out[20];
    assign d_out_4[11] = fpga_top_out[22];
    assign d_out_4[13] = fpga_top_out[24];
    assign d_out_2[9] = fpga_top_out[25];
    assign d_out_7[15] = fpga_top_out[26];
    assign d_out_2[12] = fpga_top_out[27];
    assign d_out_4[10] = fpga_top_out[28];
    assign d_out_4[9] = fpga_top_out[29];
    assign d_out_1[3] = fpga_top_out[30];
    assign d_out_7[13] = fpga_top_out[31];
    assign d_out_1[0] = fpga_bot_out[3];
    assign d_out_1[7] = fpga_bot_out[4];
    assign d_out_4[8] = fpga_bot_out[6];
    assign d_out_7[0] = fpga_bot_out[7];
    assign d_out_2[11] = fpga_bot_out[9];
    assign d_out_4[12] = fpga_bot_out[10];
    assign d_out_2[10] = fpga_bot_out[11];
    assign d_out_1[10] = fpga_bot_out[12];
    assign d_out_4[7] = fpga_bot_out[13];
    assign d_out_2[7] = fpga_bot_out[14];
    assign d_out_4[6] = fpga_bot_out[15];
    assign d_out_7[10] = fpga_bot_out[21];
    assign d_out_2[4] = fpga_bot_out[33];
    assign d_out_4[4] = fpga_bot_out[37];
    assign d_out_1[6] = fpga_bot_out[38];
    assign d_out_1[4] = fpga_bot_out[39];
    assign d_out_7[8] = fpga_left_out[4];
    assign d_out_7[9] = fpga_left_out[6];
    assign d_out_1[8] = fpga_left_out[9];
    assign d_out_2[8] = fpga_left_out[10];
    assign d_out_7[7] = fpga_left_out[22];
    assign d_out_2[13] = fpga_left_out[24];
    assign d_out_1[12] = fpga_left_out[25];
    assign d_out_4[14] = fpga_left_out[26];
    assign d_out_7[12] = fpga_left_out[28];
    assign d_out_7[1] = fpga_left_out[29];
    assign d_out_1[1] = fpga_left_out[31];
    assign d_out_1[13] = fpga_left_out[33];
    assign d_out_2[14] = fpga_left_out[37];
    assign d_out_7[5] = fpga_right_out[2];
    assign d_out_4[1] = fpga_right_out[8];
    assign d_out_1[5] = fpga_right_out[9];
    assign d_out_2[6] = fpga_right_out[10];
    assign d_out_2[5] = fpga_right_out[11];
    assign d_out_1[9] = fpga_right_out[12];
    assign d_out_4[5] = fpga_right_out[13];
    assign d_out_7[4] = fpga_right_out[14];
    assign d_out_7[6] = fpga_right_out[15];
    assign d_out_2[1] = fpga_right_out[16];
    assign d_out_7[2] = fpga_right_out[18];
    assign d_out_1[2] = fpga_right_out[20];
    assign d_out_7[11] = fpga_right_out[24];
    assign d_out_2[2] = fpga_right_out[25];
    assign d_out_2[3] = fpga_right_out[26];
    assign d_out_1[11] = fpga_right_out[28];
    assign d_out_4[2] = fpga_right_out[29];
    assign d_out_4[3] = fpga_right_out[30];
    assign d_out_7[3] = fpga_right_out[31];
    assign fpga_top_in[0] = 1'b0;
    assign fpga_top_in[1] = 1'b0;
    assign fpga_top_in[2] = 1'b0;
    assign fpga_top_in[3] = 1'b0;
    assign fpga_top_in[4] = 1'b0;
    assign fpga_top_in[5] = 1'b0;
    assign fpga_top_in[6] = 1'b0;
    assign fpga_top_in[7] = 1'b0;
    assign fpga_top_in[8] = 1'b0;
    assign fpga_top_in[9] = 1'b0;
    assign fpga_top_in[10] = 1'b0;
    assign fpga_top_in[11] = 1'b0;
    assign fpga_top_in[12] = d_in[13];
    assign fpga_top_in[13] = 1'b0;
    assign fpga_top_in[14] = 1'b0;
    assign fpga_top_in[15] = 1'b0;
    assign fpga_top_in[16] = 1'b0;
    assign fpga_top_in[17] = 1'b0;
    assign fpga_top_in[18] = 1'b0;
    assign fpga_top_in[19] = d_in[15];
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
    assign fpga_top_in[39] = d_in[11];
    assign fpga_bot_in[0] = d_in[7];
    assign fpga_bot_in[1] = 1'b0;
    assign fpga_bot_in[2] = 1'b0;
    assign fpga_bot_in[3] = 1'b0;
    assign fpga_bot_in[4] = 1'b0;
    assign fpga_bot_in[5] = 1'b0;
    assign fpga_bot_in[6] = 1'b0;
    assign fpga_bot_in[7] = 1'b0;
    assign fpga_bot_in[8] = d_in[1];
    assign fpga_bot_in[9] = 1'b0;
    assign fpga_bot_in[10] = 1'b0;
    assign fpga_bot_in[11] = 1'b0;
    assign fpga_bot_in[12] = 1'b0;
    assign fpga_bot_in[13] = 1'b0;
    assign fpga_bot_in[14] = 1'b0;
    assign fpga_bot_in[15] = 1'b0;
    assign fpga_bot_in[16] = d_in[12];
    assign fpga_bot_in[17] = 1'b0;
    assign fpga_bot_in[18] = 1'b0;
    assign fpga_bot_in[19] = 1'b0;
    assign fpga_bot_in[20] = 1'b0;
    assign fpga_bot_in[21] = 1'b0;
    assign fpga_bot_in[22] = 1'b0;
    assign fpga_bot_in[23] = 1'b0;
    assign fpga_bot_in[24] = d_in[9];
    assign fpga_bot_in[25] = d_in[4];
    assign fpga_bot_in[26] = d_in[10];
    assign fpga_bot_in[27] = d_in[3];
    assign fpga_bot_in[28] = d_in[2];
    assign fpga_bot_in[29] = d_in[5];
    assign fpga_bot_in[30] = d_in[8];
    assign fpga_bot_in[31] = d_in[6];
    assign fpga_bot_in[32] = 1'b0;
    assign fpga_bot_in[33] = 1'b0;
    assign fpga_bot_in[34] = 1'b0;
    assign fpga_bot_in[35] = 1'b0;
    assign fpga_bot_in[36] = 1'b0;
    assign fpga_bot_in[37] = 1'b0;
    assign fpga_bot_in[38] = 1'b0;
    assign fpga_bot_in[39] = 1'b0;
    assign fpga_left_in[0] = 1'b0;
    assign fpga_left_in[1] = 1'b0;
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
    assign fpga_left_in[27] = d_in[0];
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
    assign fpga_left_in[39] = d_in[14];
    assign fpga_right_in[0] = 1'b0;
    assign fpga_right_in[1] = 1'b0;
    assign fpga_right_in[2] = 1'b0;
    assign fpga_right_in[3] = 1'b0;
    assign fpga_right_in[4] = 1'b0;
    assign fpga_right_in[5] = 1'b0;
    assign fpga_right_in[6] = 1'b0;
    assign fpga_right_in[7] = 1'b0;
    assign fpga_right_in[8] = 1'b0;
    assign fpga_right_in[9] = 1'b0;
    assign fpga_right_in[10] = 1'b0;
    assign fpga_right_in[11] = 1'b0;
    assign fpga_right_in[12] = 1'b0;
    assign fpga_right_in[13] = 1'b0;
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
    assign fpga_right_in[27] = 1'b0;
    assign fpga_right_in[28] = 1'b0;
    assign fpga_right_in[29] = 1'b0;
    assign fpga_right_in[30] = 1'b0;
    assign fpga_right_in[31] = 1'b0;
    assign fpga_right_in[32] = 1'b0;
    assign fpga_right_in[33] = 1'b0;
    assign fpga_right_in[34] = 1'b0;
    assign fpga_right_in[35] = 1'b0;
    assign fpga_right_in[36] = 1'b0;
    assign fpga_right_in[37] = 1'b0;
    assign fpga_right_in[38] = 1'b0;
    assign fpga_right_in[39] = 1'b0;


    reg ff_en;
    integer in_f;

    integer read_status;    initial begin
       in_f = $fopen("multi_consumer.bs", "r");
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

module multi_consumer
(
    d_in,
    d_out_1, d_out_2, d_out_4, d_out_7,
    clock, rst, rdy
);

    input clock;
    input rst;

    input [15:0] d_in;

    output [15:0] d_out_1, d_out_2, d_out_4, d_out_7;

    output reg rdy;
    wire [39:0]fpga_top_in;
    wire [39:0] fpga_top_out;
    wire [39:0] fpga_bot_in;
    wire [39:0] fpga_bot_out;
    wire [39:0] fpga_left_in;
    wire [39:0] fpga_left_out;
    wire [39:0] fpga_right_in;
    wire [39:0] fpga_right_out;
    reg [223:0] fpga_configs_in;
    reg [42:0] fpga_configs_en;

    assign d_out_4[15] = fpga_top_out[7];
    assign d_out_1[14] = fpga_top_out[8];
    assign d_out_7[14] = fpga_top_out[15];
    assign d_out_4[0] = fpga_top_out[16];
    assign d_out_1[15] = fpga_top_out[17];
    assign d_out_2[15] = fpga_top_out[18];
    assign d_out_2[0] = fpga_top_out[20];
    assign d_out_4[11] = fpga_top_out[22];
    assign d_out_4[13] = fpga_top_out[24];
    assign d_out_2[9] = fpga_top_out[25];
    assign d_out_7[15] = fpga_top_out[26];
    assign d_out_2[12] = fpga_top_out[27];
    assign d_out_4[10] = fpga_top_out[28];
    assign d_out_4[9] = fpga_top_out[29];
    assign d_out_1[3] = fpga_top_out[30];
    assign d_out_7[13] = fpga_top_out[31];
    assign d_out_1[0] = fpga_bot_out[3];
    assign d_out_1[7] = fpga_bot_out[4];
    assign d_out_4[8] = fpga_bot_out[6];
    assign d_out_7[0] = fpga_bot_out[7];
    assign d_out_2[11] = fpga_bot_out[9];
    assign d_out_4[12] = fpga_bot_out[10];
    assign d_out_2[10] = fpga_bot_out[11];
    assign d_out_1[10] = fpga_bot_out[12];
    assign d_out_4[7] = fpga_bot_out[13];
    assign d_out_2[7] = fpga_bot_out[14];
    assign d_out_4[6] = fpga_bot_out[15];
    assign d_out_7[10] = fpga_bot_out[21];
    assign d_out_2[4] = fpga_bot_out[33];
    assign d_out_4[4] = fpga_bot_out[37];
    assign d_out_1[6] = fpga_bot_out[38];
    assign d_out_1[4] = fpga_bot_out[39];
    assign d_out_7[8] = fpga_left_out[4];
    assign d_out_7[9] = fpga_left_out[6];
    assign d_out_1[8] = fpga_left_out[9];
    assign d_out_2[8] = fpga_left_out[10];
    assign d_out_7[7] = fpga_left_out[22];
    assign d_out_2[13] = fpga_left_out[24];
    assign d_out_1[12] = fpga_left_out[25];
    assign d_out_4[14] = fpga_left_out[26];
    assign d_out_7[12] = fpga_left_out[28];
    assign d_out_7[1] = fpga_left_out[29];
    assign d_out_1[1] = fpga_left_out[31];
    assign d_out_1[13] = fpga_left_out[33];
    assign d_out_2[14] = fpga_left_out[37];
    assign d_out_7[5] = fpga_right_out[2];
    assign d_out_4[1] = fpga_right_out[8];
    assign d_out_1[5] = fpga_right_out[9];
    assign d_out_2[6] = fpga_right_out[10];
    assign d_out_2[5] = fpga_right_out[11];
    assign d_out_1[9] = fpga_right_out[12];
    assign d_out_4[5] = fpga_right_out[13];
    assign d_out_7[4] = fpga_right_out[14];
    assign d_out_7[6] = fpga_right_out[15];
    assign d_out_2[1] = fpga_right_out[16];
    assign d_out_7[2] = fpga_right_out[18];
    assign d_out_1[2] = fpga_right_out[20];
    assign d_out_7[11] = fpga_right_out[24];
    assign d_out_2[2] = fpga_right_out[25];
    assign d_out_2[3] = fpga_right_out[26];
    assign d_out_1[11] = fpga_right_out[28];
    assign d_out_4[2] = fpga_right_out[29];
    assign d_out_4[3] = fpga_right_out[30];
    assign d_out_7[3] = fpga_right_out[31];
    assign fpga_top_in[0] = 1'b0;
    assign fpga_top_in[1] = 1'b0;
    assign fpga_top_in[2] = 1'b0;
    assign fpga_top_in[3] = 1'b0;
    assign fpga_top_in[4] = 1'b0;
    assign fpga_top_in[5] = 1'b0;
    assign fpga_top_in[6] = 1'b0;
    assign fpga_top_in[7] = 1'b0;
    assign fpga_top_in[8] = 1'b0;
    assign fpga_top_in[9] = 1'b0;
    assign fpga_top_in[10] = 1'b0;
    assign fpga_top_in[11] = 1'b0;
    assign fpga_top_in[12] = d_in[13];
    assign fpga_top_in[13] = 1'b0;
    assign fpga_top_in[14] = 1'b0;
    assign fpga_top_in[15] = 1'b0;
    assign fpga_top_in[16] = 1'b0;
    assign fpga_top_in[17] = 1'b0;
    assign fpga_top_in[18] = 1'b0;
    assign fpga_top_in[19] = d_in[15];
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
    assign fpga_top_in[39] = d_in[11];
    assign fpga_bot_in[0] = d_in[7];
    assign fpga_bot_in[1] = 1'b0;
    assign fpga_bot_in[2] = 1'b0;
    assign fpga_bot_in[3] = 1'b0;
    assign fpga_bot_in[4] = 1'b0;
    assign fpga_bot_in[5] = 1'b0;
    assign fpga_bot_in[6] = 1'b0;
    assign fpga_bot_in[7] = 1'b0;
    assign fpga_bot_in[8] = d_in[1];
    assign fpga_bot_in[9] = 1'b0;
    assign fpga_bot_in[10] = 1'b0;
    assign fpga_bot_in[11] = 1'b0;
    assign fpga_bot_in[12] = 1'b0;
    assign fpga_bot_in[13] = 1'b0;
    assign fpga_bot_in[14] = 1'b0;
    assign fpga_bot_in[15] = 1'b0;
    assign fpga_bot_in[16] = d_in[12];
    assign fpga_bot_in[17] = 1'b0;
    assign fpga_bot_in[18] = 1'b0;
    assign fpga_bot_in[19] = 1'b0;
    assign fpga_bot_in[20] = 1'b0;
    assign fpga_bot_in[21] = 1'b0;
    assign fpga_bot_in[22] = 1'b0;
    assign fpga_bot_in[23] = 1'b0;
    assign fpga_bot_in[24] = d_in[9];
    assign fpga_bot_in[25] = d_in[4];
    assign fpga_bot_in[26] = d_in[10];
    assign fpga_bot_in[27] = d_in[3];
    assign fpga_bot_in[28] = d_in[2];
    assign fpga_bot_in[29] = d_in[5];
    assign fpga_bot_in[30] = d_in[8];
    assign fpga_bot_in[31] = d_in[6];
    assign fpga_bot_in[32] = 1'b0;
    assign fpga_bot_in[33] = 1'b0;
    assign fpga_bot_in[34] = 1'b0;
    assign fpga_bot_in[35] = 1'b0;
    assign fpga_bot_in[36] = 1'b0;
    assign fpga_bot_in[37] = 1'b0;
    assign fpga_bot_in[38] = 1'b0;
    assign fpga_bot_in[39] = 1'b0;
    assign fpga_left_in[0] = 1'b0;
    assign fpga_left_in[1] = 1'b0;
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
    assign fpga_left_in[27] = d_in[0];
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
    assign fpga_left_in[39] = d_in[14];
    assign fpga_right_in[0] = 1'b0;
    assign fpga_right_in[1] = 1'b0;
    assign fpga_right_in[2] = 1'b0;
    assign fpga_right_in[3] = 1'b0;
    assign fpga_right_in[4] = 1'b0;
    assign fpga_right_in[5] = 1'b0;
    assign fpga_right_in[6] = 1'b0;
    assign fpga_right_in[7] = 1'b0;
    assign fpga_right_in[8] = 1'b0;
    assign fpga_right_in[9] = 1'b0;
    assign fpga_right_in[10] = 1'b0;
    assign fpga_right_in[11] = 1'b0;
    assign fpga_right_in[12] = 1'b0;
    assign fpga_right_in[13] = 1'b0;
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
    assign fpga_right_in[27] = 1'b0;
    assign fpga_right_in[28] = 1'b0;
    assign fpga_right_in[29] = 1'b0;
    assign fpga_right_in[30] = 1'b0;
    assign fpga_right_in[31] = 1'b0;
    assign fpga_right_in[32] = 1'b0;
    assign fpga_right_in[33] = 1'b0;
    assign fpga_right_in[34] = 1'b0;
    assign fpga_right_in[35] = 1'b0;
    assign fpga_right_in[36] = 1'b0;
    assign fpga_right_in[37] = 1'b0;
    assign fpga_right_in[38] = 1'b0;
    assign fpga_right_in[39] = 1'b0;


    reg ff_en;
    integer in_f;

    integer read_status;    initial begin
       in_f = $fopen("multi_consumer.bs", "r");
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
