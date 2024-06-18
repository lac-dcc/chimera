// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module vga_test_tb;

   reg clk;
   reg rst;
   
   wire [7:0] r;
   wire [7:0] g;
   wire [7:0] b;
   wire       hsync;    // active low
   wire       vsync;    // active low
   wire       blank;    // active low
   wire       outclk; 
      
   always
     begin
        clk <= 'b1;
        #5;
        clk <= 'b0;
        #5;
     end

   vga_test dut (
                 .clk(clk),
                 .rst(rst),
                 .r(r),
                 .g(g),
                 .b(b),
                 .hsync(hsync),
                 .vsync(vsync),
                 .blank(blank),
                 .outclk(outclk)
                 );
   initial
     begin
        $dumpvars;
        rst <= 'b0;
        repeat (5)
          @(posedge clk);
        rst <= 'b1;
        #100000000;
        
        $finish;
     end
endmodule
