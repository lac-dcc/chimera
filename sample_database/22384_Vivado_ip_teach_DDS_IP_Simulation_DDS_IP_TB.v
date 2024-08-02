// This program was cloned from: https://github.com/EatFruitWang/Vivado_ip_teach
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 王俊雄
// 
// Create Date: 2023/07/19 15:19:04
// Design Name: DDS_IP_TEST
// Module Name: DDS_IP_TB
// Tool Versions: V1.0
// Description: 
// 此檔案為測試檔，使用vivado 2021.1.1，晶片選擇xc7z020clg484-1，DDS_IP版本為6.0，設定參數參考我的教學網站。
// Revision:
// V1.0 創建檔案
//////////////////////////////////////////////////////////////////////////////////


module DDS_IP_TB();
reg clk;
reg rst_n;
wire signed [15:0] sin_out;
wire signed [15:0] cos_out;
wire tvalid;
initial begin
    clk   = 1'b0;
    rst_n = 1'b0;
end
always #5 clk = ~clk;
always @(posedge clk)
begin
    rst_n <= #10 1'b1;
end
//計數器，用於驗證輸出一個週期的訊號是否為設定值
reg [13:0] count;
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n || !tvalid)
    begin
        count <= 'd1;
    end
    else
    begin
        count <= (count == 'd9362) ? 'd1 : count + 1'b1;
    end
end
dds_compiler_0 dds1(.aclk(clk),
                    .aresetn(rst_n),
                    .m_axis_data_tvalid(tvalid),
                    .m_axis_data_tdata({sin_out,cos_out}));
endmodule
