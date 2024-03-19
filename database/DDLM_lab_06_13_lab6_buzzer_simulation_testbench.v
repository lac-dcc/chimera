`timescale 1ns/1ns
module testbench;

  reg clk;
  reg rst_n;
  wire tone_freq;

  time start,stop;
  initial begin
    clk = 1'b0;
    forever
      #1 clk = !clk;
  end
  
  tone_gen
    #(
      .ref_clock     ( 50000000 ),
      .out_freq_x100 ( 50000    )
     )
  tone_dut
    (
     .clk       ( clk       ),
     .rst_n     ( rst_n     ),
     .tone_freq ( tone_freq )
    );

  task info;
    begin
      @(posedge tone_freq);
      start = $time;
      $display("@%0t\ttone_freq activate",$time);
      @(negedge tone_freq);
      stop = $time;
      $display("@%0t\ttone_freq deactive",$time);
      $display("----------Pulse duration = %0t----------\n",stop-start);
    end
  endtask // info
  


  initial begin
    $dumpvars();
    
    rst_n     = 1'b1;
   
    #11 rst_n = 1'b0;
    #11 rst_n = 1'b1;

    repeat(4)begin
      info;
    end
      
    #100 $finish;
   
  end
  
endmodule // testbench
