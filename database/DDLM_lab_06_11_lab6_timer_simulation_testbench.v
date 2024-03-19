//Testbench for timer
`timescale 1ns/1ns
module testbench;
  
  reg        clk;
  reg        rst_n;
  wire [7:0] seconds;
  wire [7:0] minuts;

  // Select slow 
  localparam clk_sim = 50;
  
  timer #(.ref_clock(clk_sim)) t1
   (
    .clk     ( clk     ),
    .rst_n   ( rst_n   ),
    .seconds ( seconds ),
    .minuts  ( minuts  )
    );
  
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end

  
  initial begin
    $dumpvars();
    
    rst_n = 1'b1;
    #14 rst_n = 1'b0;
    #23 rst_n = 1'b1;
    wait(minuts == 8'd59)
     #4000
    $finish;
  end
  
  endmodule // testbench
