// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 对脉冲信号在使能信号为高时计数，其中脉冲信号为 4 路，以模块化思路呈现
//

module top_counter(
    input               clk,
    input               rst,
    input       [3:0]   pulse,
    input               en_count,
    output      [15:0]   count1,
    output      [15:0]   count2,
    output      [15:0]   count3,
    output      [15:0]   count4
);

// 连接 pulse[0] 的计数模块
counterfour counter_check1(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse[0]),
    .en_count   (en_count),
    .count      (count1)
);

// 连接 pulse[1] 的计数模块
counterfour counter_check2(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse[1]),
    .en_count   (en_count),
    .count      (count2)
);

// 连接 pulse[2] 的计数模块
counterfour counter_check3(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse[2]),
    .en_count   (en_count),
    .count      (count3)
);

// 连接 pulse[3] 的计数模块
counterfour counter_check4(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse[3]),
    .en_count   (en_count),
    .count      (count4)
);

endmodule