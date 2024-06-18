// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

`timescale  1ns/1ns
module axi_interconnect_wr_tb (
    
);

reg           clk;
reg           rst;
reg           channel1_rready;
reg [255:0]    channel1_data;
reg           frame_end_flag_1;

reg           channel2_rready;
reg [255:0]   channel2_data;
reg           frame_end_flag_2;

reg           channel3_rready;
reg [255:0]   channel3_data;
reg           frame_end_flag_3;

reg           channel4_rready;
reg [255:0]   channel4_data;
reg           frame_end_flag_4;

reg           channel5_rready;
reg [255:0]   channel5_data;
reg           frame_end_flag_5;

reg           axi_awready;
reg           axi_wlast;
reg           axi_wready;

initial begin
    clk  = 1'b1;
    rst <= 1'b0;
    axi_wlast <= 1'b0;
    channel1_rready <= 1'b0;
    channel2_rready <= 1'b0;
    channel3_rready <= 1'b0;
    channel4_rready <= 1'b0;
    channel5_rready <= 1'b0;
    axi_awready     <= 1'b0;
    axi_wready      <= 1'b0;
    frame_end_flag_1<= 1'b0;
    frame_end_flag_2<= 1'b0;
    frame_end_flag_3<= 1'b0;
    frame_end_flag_4<= 1'b0;
    frame_end_flag_5<= 1'b0;
    #20
    rst <= 1'b1;
    #20
    channel1_rready <=1'b1;  //当buff区够一次突发读写时，channel1_rready拉高，这里模拟拉高，等待一拍axi_awvalid拉高，等待axi_awready空闲回应（握手）
    #40
    axi_awready     <=1'b1;  //模拟axi_awready回应（写地址握手成功），这时，等待一拍axi_wr_en拉高，再等待一拍axi_wvalid拉高（写数据请求），等待axi_wready空闲回应
    #100
    axi_wready      <=1'b1;  //模拟axi_wready回应（握手成功），等待一拍开始数据长度计数burst_len_count（通过burst_len_count计数信号，生成buff区读取地址，读取buff区的数据），同时生成axi_awaddr的首地址
    #(16*20)
    axi_wlast       <=1'b1;  //模拟axi接收到最后一个数据，拉高一个时钟周期，此时，状态机跳转到ch2_wait,一个通道储存完毕
    #20
    axi_wlast       <=1'b0;


    #(200)
    channel2_rready <=1'b1;
    #40
    axi_awready     <=1'b1;
    #100
    axi_wready      <=1'b1;
    #(16*20)
    axi_wlast       <=1'b1;
    #20
    axi_wlast       <=1'b0;

    #(200)
    channel3_rready <=1'b1;
    #40
    axi_awready     <=1'b1;
    #100
    axi_wready      <=1'b1;
    #(16*20)
    axi_wlast       <=1'b1;
    #20
    axi_wlast       <=1'b0;

    #(200)
    channel4_rready <=1'b1;
    #40
    axi_awready     <=1'b1;
    #100
    axi_wready      <=1'b1;
    #(16*20)
    axi_wlast       <=1'b1;
    #20
    axi_wlast       <=1'b0; 

    #(200)
    channel5_rready <=1'b1;
    #40
    axi_awready     <=1'b1;
    #100
    axi_wready      <=1'b1;
    #(16*20)
    axi_wlast       <=1'b1;
    #20
    axi_wlast       <=1'b0; 
    #200
    channel1_rready <=1'b1;
    #40
    axi_awready     <=1'b1;
    #100
    axi_wready      <=1'b1;
    #(16*20)
    axi_wlast       <=1'b1;
    #20
    axi_wlast       <=1'b0;
end

always #10 clk = ~clk;
axi_interconnect_wr axi_interconnect_wr_inst(
    .clk(clk),
    .rst(rst),
    .channel1_rready(channel1_rready),
    .frame_end_flag_1(frame_end_flag_1),
    .channel2_rready(channel2_rready),
    .frame_end_flag_2(frame_end_flag_2),
    .channel3_rready(channel3_rready),
    .frame_end_flag_3(frame_end_flag_3),
    .channel4_rready(channel4_rready),
    .frame_end_flag_4(frame_end_flag_4),
    .channel5_rready(channel5_rready),
    .frame_end_flag_5(frame_end_flag_5),
    .axi_awready(axi_awready),
    .axi_wlast(axi_wlast),
    .axi_wready(axi_wready)
   
);
reg grs_n;
GTP_GRS GRS_INST(
.GRS_N (grs_n)
);
endmodule