// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 使用 generate 语句生成对 16 路脉冲信号的计数
//

module top_counter_16(
    input               clk,
    input               rst,
    input       [15:0]   pulse,
    input               en_count,
    output      [15:0]   count1,
    output      [15:0]   count2,
    output      [15:0]   count3,
    output      [15:0]   count4,
    output      [15:0]   count5,
    output      [15:0]   count6,
    output      [15:0]   count7,
    output      [15:0]   count8,
    output      [15:0]   count9,
    output      [15:0]   counta,
    output      [15:0]   countb,
    output      [15:0]   countc,
    output      [15:0]   countd,
    output      [15:0]   counte,
    output      [15:0]   countf,
    output      [15:0]   countg
);

wire [15:0]  pulse_cnt[15:0];        // 定义一个二维数组，前者表示位宽，后者表示信号个数

genvar i;

generate
    for(i=0;i<16;i=i+1) begin
        counter_16 counter_check(
            .clk        (clk),
            .rst        (rst),
            .pulse      (pulse[i]),
            .en_count   (en_count),
            .count      (pulse_cnt[i])
        );
    end
endgenerate

assign count1 = pulse_cnt[0];
assign count2 = pulse_cnt[1];
assign count3 = pulse_cnt[2];
assign count4 = pulse_cnt[3];
assign count5 = pulse_cnt[4];
assign count6 = pulse_cnt[5];
assign count7 = pulse_cnt[6];
assign count8 = pulse_cnt[7];
assign count9 = pulse_cnt[8];
assign counta = pulse_cnt[9];
assign countb = pulse_cnt[10];
assign countc = pulse_cnt[11];
assign countd = pulse_cnt[12];
assign counte = pulse_cnt[13];
assign countf = pulse_cnt[14];
assign countg = pulse_cnt[15];

endmodule