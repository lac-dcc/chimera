`timescale 1ns/1ns
module testbench;

  localparam CLK_FREQ = 500000,
                WIDTH = 8;
  
  reg        clk;
  reg        rst_n;
  reg        echo;
  wire       trig;
  wire [7:0] distance;
  
  hcsr04
   #(
     .clk_freq ( CLK_FREQ ),
     .width    ( WIDTH    )
    )
  hc_dut
    (
     .clk      ( clk      ),
     .rst_n    ( rst_n    ),
     .echo     ( echo     ),
     .trig     ( trig     ),
     .distance ( distance )
    );

  initial begin
    clk = 1'b0;
    forever
      #10 clk = !clk;
  end

  task request(input integer del,input integer dur);
    // int del,dur
    @(negedge trig) begin
      #(del) echo = 1'b1;
      #(dur) echo = 1'b0;
    end
  endtask // request
  

  initial begin
    $dumpvars();
    
    rst_n     = 1'b1;
    echo      = 1'b0;

    #14 rst_n = 1'b0;
    #12 rst_n = 1'b1;
    request(9000,5000);
    request(4000,8888);
    
    #30000
    
    $finish;
    
  end
endmodule // testbench
