// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 使能信号控制的使能时钟，优点是保持一个时钟信号，减少跨时钟域的情况
//
// 设计使得每 20 个 100MHz 的时钟周期等效分频一次，实现系统功能

module enfreq(
    input               clk,
    input               rst,
    output reg [3:0]    syscnt
);

parameter DIVCNT_MAX = 5'd19;

reg[4:0]    divcnt;
reg         clk_en;

/////////////////////////////////////////
// 对主时钟做 20 分频计数
////////////////////////////////////////
always@(posedge clk or negedge rst)
begin
    if(!rst) begin
        divcnt <= 0;
    end
    else if(divcnt < DIVCNT_MAX) begin
        divcnt <= divcnt + 1'b1;
    end
    else begin
        divcnt <= 'b0;
    end
end

////////////////////////////////////////////
// 在每 20 个主时钟脉冲产生 1 个高脉冲信号（高时间为时钟的一个周期）
///////////////////////////////////////////
always@(posedge clk or negedge rst)
begin
    if(!rst) begin
        clk_en <= 0;
    end
    else if(divcnt == DIVCNT_MAX) begin
        clk_en <= 1'b1;
    end
    else begin
        clk_en <= clk_en;
    end
end

////////////////////////////////////////////////////
// 使用时钟使能信号进行系统计数，这是该时钟下需要实现的功能，
// syscnt 每计数 15 次重新开始计数
///////////////////////////////////////////////////
always@(posedge clk or negedge rst)
begin
    if(!rst) begin
        syscnt <= 0;
    end
    else if(clk_en == 1'b1) begin
        syscnt <= syscnt + 1'b1;
    end
    else begin
        syscnt <= syscnt;
    end
end

endmodule