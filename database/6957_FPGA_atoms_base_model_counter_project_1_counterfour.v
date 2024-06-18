// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 定义一个脉冲计数器，当使能信号为高时，计数器对脉冲信号进行计数，否则
// 清零
//

module counterfour(
    input               clk,
    input               rst,
    input               pulse,
    input               en_count,
    output reg [15:0]   count
);

wire    rise_edge;
wire    fall_edge;

reg [1:0]   r_pulse;
//reg [15:0]  cnt;


//
// 脉冲边沿检测
//
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

// assign r_pulse1_invert = ~r_pulse[1];
// assign r_pulse1_invert1 = ~r_pulse[0];
assign rise_edge = r_pulse[0] & ~r_pulse[1];
assign fall_edge = r_pulse[1] & ~r_pulse[0];


//
// 脉冲信号计数
//
always@(posedge clk) begin
    if(!rst) begin
        count <= 0;
    end
    else begin
        if(en_count) begin
            if(rise_edge) begin
                count <= count+1;
            end
            else begin
                count <= count;
            end
        end
        else begin
            count <= 'b0;
        end
    end
end 

endmodule
