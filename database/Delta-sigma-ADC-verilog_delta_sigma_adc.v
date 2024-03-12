/************************************************************************************
*   Name         :Delta sigma ADC
*   Description  :2阶Delta sigma ADC,Generate PDM audio,din的采样率 应该比clk慢N倍,
*                 N量化位数,N=32,64,128,256...,32bit以上时人耳听不出区别
*   Interface    :N/A
*   Origin       :190811
*   Author       :helrori2011@gmail.com
*   Reference    :https://www.cnblogs.com/sci-dev/p/10428042.html
************************************************************************************/
module delta_sigma_adc
#(
    parameter W = 16//输入位宽
)
(
    input   wire                clk     ,
    input   wire                rst_n   ,

    input   wire signed [W-1:0] din     ,//signed analog signal
    output  reg                 dout     //PDM signal
);
wire signed [W-1:0]adc1b_max = {1'b0,{(W-1){1'b1}}};
wire signed [W-1:0]adc1b_min = {1'b1,{(W-1){1'b0}}};
wire signed [W-1:0]adc1b_out = (dout == 1'b1)?adc1b_max:
                               (dout == 1'b0)?adc1b_min:
                               'bx;                    
reg  signed   [W*2-1:0]inte0,inte1;
wire signed   [W*2-1:0]diff0  =   din     -   adc1b_out;
wire signed   [W*2-1:0]rd0    =   diff0   +   inte0;
wire signed   [W*2-1:0]diff1  =   rd0     -   adc1b_out;
wire signed   [W*2-1:0]rd1    =   diff1   +   inte1;
wire          comp            =   (rd1 > 0)?1'b1:1'b0;
always@(posedge clk or negedge rst_n)begin
    if ( !rst_n ) begin
        dout    <= 1'b0;
        inte0   <=  'b0;
        inte1   <=  'b0;
    end else begin
        dout    <= comp;
        inte0   <= rd0;
        inte1   <= rd1;
    end
end
endmodule

