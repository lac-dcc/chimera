// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License

module tb;
  wire zcan;
  wire [1:0]s;
  reg _clk,_rst,c5,c10,temp;
  reg [15:0] data;
  //integer i ;
  vending_machine vm(c5,c10,_clk,_rst,zcan,s);
  initial begin _clk = 0; end
  always #10 _clk = ~_clk;
  initial fork
    $dumpfile("test_bench.vcd");
    $dumpvars(1,tb);
    $monitor("time =%0d \tclk=%0b  c5=%0b,c10=%0b,y_out=%0b",$time,_clk,c5,c10,zcan);
    _rst = 0;
    #15 _rst = 1;
    data = 16'b1010101100011101;
    //i=0;
    #400 $finish;
    join
  	always @(posedge _clk) begin
    data <= data>>1;
      temp = #10 data[0];
    //i=i+1;
    if(temp == 1'b1)begin
      c5  = 1;
      c10 = 0;
    end
    else begin
      c10 =1;
      c5  =0;
    end
  end
endmodule