// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License

module tb;
  wire unlc;
  wire [2:0]st;
  reg clk,rst,b0,b1,temp;
  reg [15:0] data;
  //integer i ;
  lock lc(b0,b1,clk,rst,unlc,st);
  initial begin clk = 0; end
  always #10 clk = ~clk;
  initial fork
    $dumpfile("test_bench.vcd");
    $dumpvars(1,tb);
    $monitor("time=%0d,clk=%0b,x0=%0b,x1=%0b,y_out=%0b",$time,clk,b0,b1,unlc);
    rst = 0;
    #15 rst = 1;
    data = 16'b1101011010101101;
    //i=0;
    #400 $finish;
    join
  always @(posedge clk) begin
    data <= data>>1;
    temp = #10 data[0];
    //i=i+1;
    if(temp == 1'b1)begin
      b1 = 1;
      b0 = 0;
    end
    else begin
      b0=1;
      b1=0;
    end
  end
endmodule