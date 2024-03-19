`timescale 1ns/1ns

module testbench;

  localparam W = 4;
  
  reg              clk;
  reg              rst_n;
  reg              enable;
  wire [W - 1 : 0] gray;
  integer          en_time;
  
  gray_cnt #(.WIDTH(W))
  g_cnt
    (
     // Outputs
     .gray   (gray[W - 1:0]  ),
     // Inputs
     .clk    ( clk           ),
     .rst_n  ( rst_n         ),
     .enable ( enable        )
     );

  initial begin
    clk = 1'b0;
    forever
      #5 clk = !clk;
  end


  initial begin
    $dumpvars();
    
    rst_n  = 1'b1;
    enable = 1'b0;
    //-----Reset----- 
    #13 rst_n = 1'b0;
    #10 rst_n = 1'b1;
    //---------------

    repeat(5) begin
      en_time = $urandom%(30)+10;
      begin
        #11 enable        = 1'b1;
        #(en_time) enable = 1'b0;
      end
    end
    #30 $finish;
  end

endmodule // testbench
