// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

`timescale  1ns/1ns
module video_sampling_tb ();

  reg       clk;
  reg       rd_clk;
  reg       rst;
  reg       de_in;
  reg       vs_in;
  reg       rd_valid;
  reg [15:0] rgb565_in;

  parameter RED = 16'hF800, //红色
    ORANGE = 16'hFC00, //橙色
    YELLOW = 16'hFFE0, //黄色
    GREEN = 16'h07E0;  //绿色            四色彩带

  initial begin
    clk       <= 1'b1;
    rd_clk    <= 1'b1;
    rst       <= 1'b0;
    vs_in     <= 1'b0;
    de_in     <= 1'b0;
    rd_valid  <=1'b0;
    rgb565_in <= 16'd0;
    #28
    rst       <= 1'b1;
    rd_valid  <=1'b1;
    vs_in <= 1'b1;
    #(14*20);
    vs_in <= 1'b0;
  end
integer i;
integer j;

  initial begin
    for (i = 1; i <= 720; i = i + 1) begin
      row_task();
    end
  end

  always #10 clk = ~clk;           // 50m
  always #7 rd_clk = ~rd_clk;     // 大约74.25

  // 定义发送一行图像数据的任务
  task row_task();
    begin
        #(14*200);
        de_in <= 1'b1;
        for(j=0;j<1280;j=j+1) begin
         rgb565_in <= rgb565_in+16'b1;
         #(14);
         if(j==1040)begin
          rd_valid <=1'b0;
         end
         else if(j==1050)begin
          rd_valid <=1'b1;
         end
        end
        rgb565_in <= 16'd0;
        de_in <= 1'b0;
         
//         rgb565_in = RED;
//         #(1280*14*0.25);
//         rgb565_in = ORANGE;
//         #(1280*14*0.25);
//         rgb565_in = YELLOW;
//         #(1280*14*0.25);
//         rgb565_in = GREEN;
//         #(1280*14*0.25);
//         de_in = 1'b0;
//         #(14*50);
    end
  endtask
reg grs_n;
GTP_GRS GRS_INST(
.GRS_N (grs_n)
);

  video_sampling video_sampling_inst(
    .clk(rd_clk),
    .rd_clk(clk),
    .rst(rst),
    .de_in(de_in),
    .vs_in(vs_in),
    .rgb565_in(rgb565_in),
    .rd_valid(rd_valid)
  );

endmodule
