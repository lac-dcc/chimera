// This program was cloned from: https://github.com/akita11/TD4
// License: MIT License

module td4_tb;
   reg clk, rst;
   wire [7:0] data;
   reg [3:0] port_i;
   wire cf;
   wire [3:0] addr, port_o;
   
   td4 i0(clk, rst, addr, data, cf, port_i, port_o);
   imem i1(addr, data);
   
   always #5 clk = ~clk;

   initial begin
      #0 clk = 0; rst = 0; port_i <= 4'h0;
      #10 rst = 1;
      #10 rst = 0;
      #100 $finish;
   end

   initial begin
//      $dumpfile("td4_tb.vcd");
//      $dumpvars(0, td4_tb);
   $monitor($stime, "clk=%b rst=%b addr=%2x data=%x cf=%b in=%x out=%x", clk, rst, addr, data, cf, port_i, port_o);
   end


endmodule
