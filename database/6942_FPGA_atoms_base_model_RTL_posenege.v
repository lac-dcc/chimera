// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 检测某一信号的上升沿和下降沿到来
//

module posenege(
    input       clk,
    input       rst,
    input       pulse,
    output      rise_edge,
    output      fall_edge
);

reg [1:0]   r_pulse;
wire        r_pulse1_invert;
wire        r_pulse1_invert1;

always@(posedge clk) begin
    if(!rst) begin
        r_pulse <= 2'b00;
    end
    else begin
        // 把0位赋值到第1位，而第0位由输入信号给出
        r_pulse[0] <= pulse;
        r_pulse[1] <= r_pulse[0];
        // 等效 r_pulse <= {r_pulse[0],pulse};
        
        // 输入激励信号的变化在最近的时钟上升沿能产生第一级的使能信号，我们操作这个信号为2位，第一级
        // 使能信号可以在第二个时钟上升沿拉起第二级使能信号，这样它们之间有一个时钟周期的差值可以用来
        // 用来指示输入激励信号已经发生了变化
    end
end

assign r_pulse1_invert = ~r_pulse[1];
assign r_pulse1_invert1 = ~r_pulse[0];
assign rise_edge = r_pulse[0] & r_pulse1_invert;
assign fall_edge = r_pulse[1] & r_pulse1_invert1;

endmodule