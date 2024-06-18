// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 设计一个可配置参数（包括周期，高电平时间，周期数）的 PWM 模块
//
// 占空比等于高电平时间除以周期
module pwm_prim(
    input               clk,
    input               rst,
    input               i_en,
    input       [31:0]  i_period,
    input       [31:0]  i_high,
    input       [15:0]  i_times,
    output reg          o_pwm
);

reg  [1:0]  r_en;
reg         r_en_cnt;
reg  [31:0] r_period_cnt;
reg  [15:0] r_times_cnt;
wire        w_pos_en;
wire        w_neg_en;
wire        w_end;


// 产生使能信号上升沿和下降沿标志位
always@(posedge clk) begin
    if(!rst) begin
        r_en <= 'b0;
    end
    else begin
        r_en <= {r_en[0],i_en};
    end
end
assign w_pos_en = r_en[0] & ~r_en[1];
assign w_neg_en = r_en[1] & ~r_en[0];


// 产生 pwm 信号需要结束产生时的标志位
assign w_end = (r_period_cnt == (i_period-1'b1)) && (r_times_cnt == (i_times-1'b1));


// 产生内部计数器的有效信号
always@(posedge clk) begin
    if(!rst) begin
        r_en_cnt <= 'b0;
    end
    else if(i_en == 1'b0) begin
        r_en_cnt <= 'b0;
    end
    else if(w_pos_en) begin
        r_en_cnt <= 1'b1;
    end
    else if(w_end) begin
        r_en_cnt <= 1'b0;
    end
    else begin
        r_en_cnt <= r_en_cnt;
    end
end


// 周期计数
always@(posedge clk) begin
    if(!r_en_cnt) begin
        r_period_cnt <= 'b0;
    end
    else if(r_period_cnt < (i_period-1)) begin
        r_period_cnt <= r_period_cnt+1'b1;
    end
    else begin
        r_period_cnt <= 'b0;
    end
end


// 次数计数
always@(posedge clk) begin
    if(!r_en_cnt) begin
        r_times_cnt <= 'b0;
    end
    else if(r_period_cnt == (i_period-1)) begin
        r_times_cnt <= r_times_cnt + 1'b1;
    end
    else begin
        r_times_cnt <= 'b0;
    end
end


// 输出 pwm 波形
always@(posedge clk) begin
    if((r_period_cnt > 32'b0) && (r_period_cnt <= i_high)) begin
        o_pwm <= 1'b1;
    end
    else begin
        o_pwm <= 'b0;
    end
end

endmodule