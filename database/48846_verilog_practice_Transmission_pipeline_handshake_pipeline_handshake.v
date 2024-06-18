// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module pipeline_handshake(
  input                 clk                     ,
  input                 rstn                    ,
  input         [7:0]   a2,a3,a4,b2,b3,b4       ,
  input         [7:0]   c1,c2,c3,c4             ,
  output  reg   [19:0]  result                  ,

  input                 ready_i                 ,
  input                 valid_i                 ,
  output                ready_o                 ,
  output                valid_o                 
);

wire ready_r1,ready_r2;
reg valid_r1,valid_r2,valid_r3;
reg [7:0] a1,b1;
reg [7:0] a2_r1,a3_r1,a4_r1,b2_r1,b3_r1,b4_r1;

reg [15:0] temp1,temp2,temp3,temp4;

//pipeline stage 1
assign ready_o = ~valid_r1 || ready_r1;
always @(posedge clk)begin
  if(!rstn)begin
    valid_r1 <= 1'b0;
  end
  else if(ready_o)begin    //如果本级准备好了，则将上一级的valid信号传递过来
    valid_r1 <= valid_i;
  end
end

always @(posedge clk)begin
  if(ready_o && valid_i)begin //输入数据ready_valid信号同时拉高时，数据有效并传入
    a1 <= c1 + c2;
    b1 <= c3 + c4;
    a2_r1 <= a2; a3_r1 <= a3; a4_r1 <= a4; //数据进来打一拍到第二级流水
    b2_r1 <= b2; b3_r1 <= b3; b4_r1 <= b4;
  end
end


//pipeline stage 2
assign ready_r1 = ~valid_r2 || ready_r2;
always @(posedge clk)begin
  if(!rstn)begin
    valid_r2 <= 1'b0;
  end
  else if(ready_r1)begin   //如果本级准备好了，则将上一级的valid信号传递过来
    valid_r2 <= valid_r1;
  end
end
always @(posedge clk)begin
  if(ready_r1 && valid_r1)begin
    temp1 <= a1    * b1;
    temp2 <= a2_r1 * b2_r1;
    temp3 <= a3_r1 * b3_r1;
    temp4 <= a4_r1 * b4_r1;
  end
end

//pipeline stage 3
assign ready_r2 = ~valid_r3 || ready_i;
always @(posedge clk)begin
  if(!rstn)begin
    valid_r3 <= 1'b0;
  end
  else if(ready_r2)begin
    valid_r3 <= valid_r2;
  end
end

always @(posedge clk)begin
  if(ready_r2 && valid_r2)begin
    result <= temp1 + temp2 + temp3 + temp4;
  end
end

assign valid_o = valid_r3;

endmodule
