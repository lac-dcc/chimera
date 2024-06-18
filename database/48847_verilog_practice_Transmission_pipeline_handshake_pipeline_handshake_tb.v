// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module pipeline_handshake_tb();

reg clk,rstn;

always #5 clk = ~clk;

reg valid_i,ready_i;
wire ready_o,valid_o;

reg [7:0] a2,a3,a4,b2,b3,b4,c1,c2,c3,c4;
wire [19:0] result;

initial begin
  clk   <= 1'b0;
  rstn  <= 1'b0;
  ready_i <= 1'b1;
  valid_i <= 1'b0;
  #20
  rstn <= 1'b1;
  #45
  ready_i <= 1; valid_i <= 1;   //流水线工作状态
  a2 <= 8'd2; a3 <= 8'd2; a4 <= 8'd2;
  b2 <= 8'd2; b3 <= 8'd2; b4 <= 8'd2;
  c1 <= 8'd2; c2 <= 8'd2; c3 <= 8'd2; c4 <= 8'd2;
  #10
  a2 <= 8'd3; a3 <= 8'd3; a4 <= 8'd3;
  b2 <= 8'd3; b3 <= 8'd3; b4 <= 8'd3;
  c1 <= 8'd3; c2 <= 8'd3; c3 <= 8'd3; c4 <= 8'd3;
  #10
  ready_i <= 1; valid_i <= 0;   //流水线上游断流
  a2 <= 8'd4; a3 <= 8'd4; a4 <= 8'd4;
  b2 <= 8'd4; b3 <= 8'd4; b4 <= 8'd4;
  c1 <= 8'd4; c2 <= 8'd4; c3 <= 8'd4; c4 <= 8'd4;
  #30
  a2 <= 8'd5; a3 <= 8'd5; a4 <= 8'd5;
  b2 <= 8'd5; b3 <= 8'd5; b4 <= 8'd5;
  c1 <= 8'd5; c2 <= 8'd5; c3 <= 8'd5; c4 <= 8'd5;
  #10
  ready_i <= 0; valid_i <= 1;   //流水线下游反压
  a2 <= 8'd6; a3 <= 8'd6; a4 <= 8'd6;
  b2 <= 8'd6; b3 <= 8'd6; b4 <= 8'd6;
  c1 <= 8'd6; c2 <= 8'd6; c3 <= 8'd6; c4 <= 8'd6;
  #30
  a2 <= 8'd7; a3 <= 8'd7; a4 <= 8'd7;
  b2 <= 8'd7; b3 <= 8'd7; b4 <= 8'd7;
  c1 <= 8'd7; c2 <= 8'd7; c3 <= 8'd7; c4 <= 8'd7;
  #10
  ready_i <= 1; valid_i <= 0;   //数据传输完毕
  a2 <= 8'd8; a3 <= 8'd8; a4 <= 8'd8;
  b2 <= 8'd8; b3 <= 8'd8; b4 <= 8'd8;
  c1 <= 8'd8; c2 <= 8'd8; c3 <= 8'd8; c4 <= 8'd8;
  #100
  $finish;
end

pipeline_handshake u_pipeline_handshake(
  .clk      (clk)     ,
  .rstn     (rstn)    ,
  .a2(a2),.a3(a3)     ,
  .a4(a4),.b2(b2)     ,
  .b3(b3),.b4(b4)     ,
  .c1(c1),.c2(c2)     ,
  .c3(c3),.c4(c4)     ,
  .result   (result)  ,
  .ready_i  (ready_i) ,
  .ready_o  (ready_o) ,
  .valid_i  (valid_i) ,
  .valid_o  (valid_o)

);

// fsdb dump
initial begin
  $fsdbDumpfile("pipeline_handshake_tb.fsdb");
  $fsdbDumpvars(0, pipeline_handshake_tb);
end

endmodule
