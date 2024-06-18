// This program was cloned from: https://github.com/xiaowuzxc/SparrowRV
// License: MIT License

module rstc (
    input wire clk,
    input wire hard_rst_n,  //硬件复位，低电平有效
    input wire soft_rst_en, //软件复位，高电平有效
    input wire jtag_rst_en, //JTAG复位，高电平有效
    output reg rst_n
);
reg [3:0] sys_rst_cnt = 4'h0;//系统复位计数器
reg hard_rst_r,hard_rst_en;

//复位计数
always @(posedge clk) begin
    hard_rst_r <= ~hard_rst_n;
    hard_rst_en <= hard_rst_r;
    if (jtag_rst_en | soft_rst_en | hard_rst_en) begin//若发生复位事件
        sys_rst_cnt <= 4'h0;
        rst_n <= 1'b0;
    end
    else begin//没有复位事件
        if(sys_rst_cnt == 4'hF) begin//复位完成
            sys_rst_cnt <= sys_rst_cnt;
            rst_n <= 1'b1;
        end
        else begin//复位中
            sys_rst_cnt <= sys_rst_cnt + 1;
            rst_n <= 1'b0;
        end
    end
end

endmodule