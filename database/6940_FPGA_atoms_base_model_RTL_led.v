// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

/////////////////////////////////////////////////
// 该模块实现了将 8 个按钮控制对应 8 个 LED 灯的功能
/////////////////////////////////////////////////

module led(
  input              clk,
  input              rst,
  input       [7:0]  key,
  output reg  [7:0]  led
);

// 设置消抖需要延迟的时间单位
parameter CLK_PULSE = 10;

reg  [7:0]  key_reg;
reg  [7:0]  key_reg_out;
reg  [3:0]  count;
reg         flag;

// 用于直接存储按键值
always@(posedge clk or negedge rst) begin
    if(!rst) key_reg <= 0;        // PDS 在 rst 为 null 时会对该信号报错
    else key_reg <= key;
end

// 用于产生计数信号
always@(posedge clk or negedge rst) begin
    if(!rst) count <= 0;
    else count <= count + 1;
end

// 用于产生标志位
always@(posedge clk or negedge rst) begin
    if(!rst) flag <= 0;
    else begin
        if(count == CLK_PULSE-1) begin
            flag <= 1'b1;
        end
        else begin
            if(count == 0) flag <= 1'b0;
            else flag <= flag;
        end
    end
end

// 在标志位有效时，存储该状态下的按键值
always@(posedge clk or negedge rst) begin
  if(!rst)begin
    key_reg_out <= 8'b0;
  end
  else begin
    if(flag == 1'b1) begin
      key_reg_out <= key_reg;
    end
    else key_reg_out <= key_reg_out;
  end
end

// 点亮 LED 灯
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        led <= 8'b0;
    end else begin
        if (flag) begin
            led <= key_reg_out;
        end
    end
end


endmodule
