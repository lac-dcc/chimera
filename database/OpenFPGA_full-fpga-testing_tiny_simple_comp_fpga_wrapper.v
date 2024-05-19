// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module simple_comp
(
    a_in, b_in, c_in,
    d_out,
    clock, rst, rdy
);

    input [15:0] a_in;
    input [15:0] b_in;
    input [15:0] c_in;

    input clock;
    input rst;

    output [15:0] d_out;

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

    assign d_out[2] = fpga_top_out[8];
    assign d_out[3] = fpga_top_out[11];
    assign d_out[4] = fpga_top_out[22];
    assign d_out[5] = fpga_top_out[33];
    assign d_out[6] = fpga_top_out[39];
    assign d_out[14] = fpga_bot_out[3];
    assign d_out[15] = fpga_bot_out[7];
    assign d_out[12] = fpga_bot_out[10];
    assign d_out[9] = fpga_bot_out[24];
    assign d_out[8] = fpga_bot_out[25];
    assign d_out[10] = fpga_bot_out[33];
    assign d_out[13] = fpga_left_out[10];
    assign d_out[1] = fpga_left_out[22];
    assign d_out[11] = fpga_right_out[8];
    assign d_out[0] = fpga_right_out[9];
    assign d_out[7] = fpga_right_out[22];
    assign fpga_top_in[0] = a_in[0];
    assign fpga_top_in[1] = 1'b0;
    assign fpga_top_in[2] = 1'b0;
    assign fpga_top_in[3] = a_in[2];
    assign fpga_top_in[4] = b_in[0];
    assign fpga_top_in[5] = 1'b0;
    assign fpga_top_in[6] = b_in[1];
    assign fpga_top_in[7] = 1'b0;
    assign fpga_top_in[8] = 1'b0;
    assign fpga_top_in[9] = 1'b0;
    assign fpga_top_in[10] = 1'b0;
    assign fpga_top_in[11] = 1'b0;
    assign fpga_top_in[12] = c_in[2];
    assign fpga_top_in[13] = c_in[1];
    assign fpga_top_in[14] = 1'b0;
    assign fpga_top_in[15] = c_in[0];
    assign fpga_top_in[16] = a_in[3];
    assign fpga_top_in[17] = a_in[4];
    assign fpga_top_in[18] = a_in[1];
    assign fpga_top_in[19] = b_in[2];
    assign fpga_top_in[20] = b_in[3];
    assign fpga_top_in[21] = 1'b0;
    assign fpga_top_in[22] = 1'b0;
    assign fpga_top_in[23] = b_in[4];
    assign fpga_top_in[24] = 1'b0;
    assign fpga_top_in[25] = c_in[4];
    assign fpga_top_in[26] = c_in[7];
    assign fpga_top_in[27] = 1'b0;
    assign fpga_top_in[28] = c_in[5];
    assign fpga_top_in[29] = 1'b0;
    assign fpga_top_in[30] = 1'b0;
    assign fpga_top_in[31] = c_in[3];
    assign fpga_top_in[32] = 1'b0;
    assign fpga_top_in[33] = 1'b0;
    assign fpga_top_in[34] = 1'b0;
    assign fpga_top_in[35] = 1'b0;
    assign fpga_top_in[36] = 1'b0;
    assign fpga_top_in[37] = 1'b0;
    assign fpga_top_in[38] = 1'b0;
    assign fpga_top_in[39] = 1'b0;
    assign fpga_bot_in[0] = c_in[15];
    assign fpga_bot_in[1] = c_in[13];
    assign fpga_bot_in[2] = 1'b0;
    assign fpga_bot_in[3] = 1'b0;
    assign fpga_bot_in[4] = c_in[14];
    assign fpga_bot_in[5] = 1'b0;
    assign fpga_bot_in[6] = a_in[12];
    assign fpga_bot_in[7] = 1'b0;
    assign fpga_bot_in[8] = 1'b0;
    assign fpga_bot_in[9] = c_in[12];
    assign fpga_bot_in[10] = 1'b0;
    assign fpga_bot_in[11] = 1'b0;
    assign fpga_bot_in[12] = 1'b0;
    assign fpga_bot_in[13] = 1'b0;
    assign fpga_bot_in[14] = 1'b0;
    assign fpga_bot_in[15] = 1'b0;
    assign fpga_bot_in[16] = c_in[10];
    assign fpga_bot_in[17] = 1'b0;
    assign fpga_bot_in[18] = c_in[11];
    assign fpga_bot_in[19] = 1'b0;
    assign fpga_bot_in[20] = c_in[8];
    assign fpga_bot_in[21] = 1'b0;
    assign fpga_bot_in[22] = 1'b0;
    assign fpga_bot_in[23] = 1'b0;
    assign fpga_bot_in[24] = 1'b0;
    assign fpga_bot_in[25] = 1'b0;
    assign fpga_bot_in[26] = a_in[11];
    assign fpga_bot_in[27] = 1'b0;
    assign fpga_bot_in[28] = b_in[8];
    assign fpga_bot_in[29] = b_in[11];
    assign fpga_bot_in[30] = a_in[8];
    assign fpga_bot_in[31] = 1'b0;
    assign fpga_bot_in[32] = 1'b0;
    assign fpga_bot_in[33] = 1'b0;
    assign fpga_bot_in[34] = c_in[9];
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
    assign fpga_left_in[8] = a_in[13];
    assign fpga_left_in[9] = b_in[13];
    assign fpga_left_in[10] = 1'b0;
    assign fpga_left_in[11] = 1'b0;
    assign fpga_left_in[12] = 1'b0;
    assign fpga_left_in[13] = 1'b0;
    assign fpga_left_in[14] = 1'b0;
    assign fpga_left_in[15] = b_in[12];
    assign fpga_left_in[16] = a_in[14];
    assign fpga_left_in[17] = a_in[15];
    assign fpga_left_in[18] = 1'b0;
    assign fpga_left_in[19] = b_in[14];
    assign fpga_left_in[20] = 1'b0;
    assign fpga_left_in[21] = 1'b0;
    assign fpga_left_in[22] = 1'b0;
    assign fpga_left_in[23] = b_in[15];
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
    assign fpga_right_in[0] = 1'b0;
    assign fpga_right_in[1] = a_in[9];
    assign fpga_right_in[2] = 1'b0;
    assign fpga_right_in[3] = 1'b0;
    assign fpga_right_in[4] = 1'b0;
    assign fpga_right_in[5] = b_in[9];
    assign fpga_right_in[6] = 1'b0;
    assign fpga_right_in[7] = 1'b0;
    assign fpga_right_in[8] = 1'b0;
    assign fpga_right_in[9] = 1'b0;
    assign fpga_right_in[10] = 1'b0;
    assign fpga_right_in[11] = a_in[10];
    assign fpga_right_in[12] = rst;
    assign fpga_right_in[13] = 1'b0;
    assign fpga_right_in[14] = c_in[6];
    assign fpga_right_in[15] = b_in[10];
    assign fpga_right_in[16] = 1'b0;
    assign fpga_right_in[17] = 1'b0;
    assign fpga_right_in[18] = 1'b0;
    assign fpga_right_in[19] = 1'b0;
    assign fpga_right_in[20] = 1'b0;
    assign fpga_right_in[21] = 1'b0;
    assign fpga_right_in[22] = 1'b0;
    assign fpga_right_in[23] = 1'b0;
    assign fpga_right_in[24] = b_in[5];
    assign fpga_right_in[25] = 1'b0;
    assign fpga_right_in[26] = a_in[5];
    assign fpga_right_in[27] = 1'b0;
    assign fpga_right_in[28] = 1'b0;
    assign fpga_right_in[29] = a_in[7];
    assign fpga_right_in[30] = 1'b0;
    assign fpga_right_in[31] = b_in[7];
    assign fpga_right_in[32] = 1'b0;
    assign fpga_right_in[33] = 1'b0;
    assign fpga_right_in[34] = 1'b0;
    assign fpga_right_in[35] = 1'b0;
    assign fpga_right_in[36] = a_in[6];
    assign fpga_right_in[37] = 1'b0;
    assign fpga_right_in[38] = 1'b0;
    assign fpga_right_in[39] = b_in[6];


    reg ff_en;
    integer in_f;

    integer read_status;    initial begin
       in_f = $fopen("simple_comp.bs", "r");
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

module simple_comp
(
    a_in, b_in, c_in,
    d_out,
    clock, rst, rdy
);

    input [15:0] a_in;
    input [15:0] b_in;
    input [15:0] c_in;

    input clock;
    input rst;

    output [15:0] d_out;

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

    assign d_out[2] = fpga_top_out[8];
    assign d_out[3] = fpga_top_out[11];
    assign d_out[4] = fpga_top_out[22];
    assign d_out[5] = fpga_top_out[33];
    assign d_out[6] = fpga_top_out[39];
    assign d_out[14] = fpga_bot_out[3];
    assign d_out[15] = fpga_bot_out[7];
    assign d_out[12] = fpga_bot_out[10];
    assign d_out[9] = fpga_bot_out[24];
    assign d_out[8] = fpga_bot_out[25];
    assign d_out[10] = fpga_bot_out[33];
    assign d_out[13] = fpga_left_out[10];
    assign d_out[1] = fpga_left_out[22];
    assign d_out[11] = fpga_right_out[8];
    assign d_out[0] = fpga_right_out[9];
    assign d_out[7] = fpga_right_out[22];
    assign fpga_top_in[0] = a_in[0];
    assign fpga_top_in[1] = 1'b0;
    assign fpga_top_in[2] = 1'b0;
    assign fpga_top_in[3] = a_in[2];
    assign fpga_top_in[4] = b_in[0];
    assign fpga_top_in[5] = 1'b0;
    assign fpga_top_in[6] = b_in[1];
    assign fpga_top_in[7] = 1'b0;
    assign fpga_top_in[8] = 1'b0;
    assign fpga_top_in[9] = 1'b0;
    assign fpga_top_in[10] = 1'b0;
    assign fpga_top_in[11] = 1'b0;
    assign fpga_top_in[12] = c_in[2];
    assign fpga_top_in[13] = c_in[1];
    assign fpga_top_in[14] = 1'b0;
    assign fpga_top_in[15] = c_in[0];
    assign fpga_top_in[16] = a_in[3];
    assign fpga_top_in[17] = a_in[4];
    assign fpga_top_in[18] = a_in[1];
    assign fpga_top_in[19] = b_in[2];
    assign fpga_top_in[20] = b_in[3];
    assign fpga_top_in[21] = 1'b0;
    assign fpga_top_in[22] = 1'b0;
    assign fpga_top_in[23] = b_in[4];
    assign fpga_top_in[24] = 1'b0;
    assign fpga_top_in[25] = c_in[4];
    assign fpga_top_in[26] = c_in[7];
    assign fpga_top_in[27] = 1'b0;
    assign fpga_top_in[28] = c_in[5];
    assign fpga_top_in[29] = 1'b0;
    assign fpga_top_in[30] = 1'b0;
    assign fpga_top_in[31] = c_in[3];
    assign fpga_top_in[32] = 1'b0;
    assign fpga_top_in[33] = 1'b0;
    assign fpga_top_in[34] = 1'b0;
    assign fpga_top_in[35] = 1'b0;
    assign fpga_top_in[36] = 1'b0;
    assign fpga_top_in[37] = 1'b0;
    assign fpga_top_in[38] = 1'b0;
    assign fpga_top_in[39] = 1'b0;
    assign fpga_bot_in[0] = c_in[15];
    assign fpga_bot_in[1] = c_in[13];
    assign fpga_bot_in[2] = 1'b0;
    assign fpga_bot_in[3] = 1'b0;
    assign fpga_bot_in[4] = c_in[14];
    assign fpga_bot_in[5] = 1'b0;
    assign fpga_bot_in[6] = a_in[12];
    assign fpga_bot_in[7] = 1'b0;
    assign fpga_bot_in[8] = 1'b0;
    assign fpga_bot_in[9] = c_in[12];
    assign fpga_bot_in[10] = 1'b0;
    assign fpga_bot_in[11] = 1'b0;
    assign fpga_bot_in[12] = 1'b0;
    assign fpga_bot_in[13] = 1'b0;
    assign fpga_bot_in[14] = 1'b0;
    assign fpga_bot_in[15] = 1'b0;
    assign fpga_bot_in[16] = c_in[10];
    assign fpga_bot_in[17] = 1'b0;
    assign fpga_bot_in[18] = c_in[11];
    assign fpga_bot_in[19] = 1'b0;
    assign fpga_bot_in[20] = c_in[8];
    assign fpga_bot_in[21] = 1'b0;
    assign fpga_bot_in[22] = 1'b0;
    assign fpga_bot_in[23] = 1'b0;
    assign fpga_bot_in[24] = 1'b0;
    assign fpga_bot_in[25] = 1'b0;
    assign fpga_bot_in[26] = a_in[11];
    assign fpga_bot_in[27] = 1'b0;
    assign fpga_bot_in[28] = b_in[8];
    assign fpga_bot_in[29] = b_in[11];
    assign fpga_bot_in[30] = a_in[8];
    assign fpga_bot_in[31] = 1'b0;
    assign fpga_bot_in[32] = 1'b0;
    assign fpga_bot_in[33] = 1'b0;
    assign fpga_bot_in[34] = c_in[9];
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
    assign fpga_left_in[8] = a_in[13];
    assign fpga_left_in[9] = b_in[13];
    assign fpga_left_in[10] = 1'b0;
    assign fpga_left_in[11] = 1'b0;
    assign fpga_left_in[12] = 1'b0;
    assign fpga_left_in[13] = 1'b0;
    assign fpga_left_in[14] = 1'b0;
    assign fpga_left_in[15] = b_in[12];
    assign fpga_left_in[16] = a_in[14];
    assign fpga_left_in[17] = a_in[15];
    assign fpga_left_in[18] = 1'b0;
    assign fpga_left_in[19] = b_in[14];
    assign fpga_left_in[20] = 1'b0;
    assign fpga_left_in[21] = 1'b0;
    assign fpga_left_in[22] = 1'b0;
    assign fpga_left_in[23] = b_in[15];
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
    assign fpga_right_in[0] = 1'b0;
    assign fpga_right_in[1] = a_in[9];
    assign fpga_right_in[2] = 1'b0;
    assign fpga_right_in[3] = 1'b0;
    assign fpga_right_in[4] = 1'b0;
    assign fpga_right_in[5] = b_in[9];
    assign fpga_right_in[6] = 1'b0;
    assign fpga_right_in[7] = 1'b0;
    assign fpga_right_in[8] = 1'b0;
    assign fpga_right_in[9] = 1'b0;
    assign fpga_right_in[10] = 1'b0;
    assign fpga_right_in[11] = a_in[10];
    assign fpga_right_in[12] = rst;
    assign fpga_right_in[13] = 1'b0;
    assign fpga_right_in[14] = c_in[6];
    assign fpga_right_in[15] = b_in[10];
    assign fpga_right_in[16] = 1'b0;
    assign fpga_right_in[17] = 1'b0;
    assign fpga_right_in[18] = 1'b0;
    assign fpga_right_in[19] = 1'b0;
    assign fpga_right_in[20] = 1'b0;
    assign fpga_right_in[21] = 1'b0;
    assign fpga_right_in[22] = 1'b0;
    assign fpga_right_in[23] = 1'b0;
    assign fpga_right_in[24] = b_in[5];
    assign fpga_right_in[25] = 1'b0;
    assign fpga_right_in[26] = a_in[5];
    assign fpga_right_in[27] = 1'b0;
    assign fpga_right_in[28] = 1'b0;
    assign fpga_right_in[29] = a_in[7];
    assign fpga_right_in[30] = 1'b0;
    assign fpga_right_in[31] = b_in[7];
    assign fpga_right_in[32] = 1'b0;
    assign fpga_right_in[33] = 1'b0;
    assign fpga_right_in[34] = 1'b0;
    assign fpga_right_in[35] = 1'b0;
    assign fpga_right_in[36] = a_in[6];
    assign fpga_right_in[37] = 1'b0;
    assign fpga_right_in[38] = 1'b0;
    assign fpga_right_in[39] = b_in[6];


    reg ff_en;
    integer in_f;

    integer read_status;    initial begin
       in_f = $fopen("simple_comp.bs", "r");
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
