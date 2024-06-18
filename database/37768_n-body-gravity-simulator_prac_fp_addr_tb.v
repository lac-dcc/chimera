// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module fp_addr_tb;
   reg [26:0] tst_first;
   reg [26:0] tst_second;
   reg        tst_clk;
   reg        tst_rst;
   
   wire [26:0] tst_out;
   
   fp_addr dut (
                .clk(tst_clk),
                .rst(tst_rst),
                .first(tst_first),
                .second(tst_second),
                .out(tst_out)
                );
   always
     begin
        tst_clk <= 'b1;
        #5;
        tst_clk <= 'b0;
        #5;
     end

   
   initial
     begin
        $dumpvars;
        
        tst_rst <= 'b0;
        tst_first  <= 27'b010000000010000000000000000;
        tst_second <= 27'b010000000010000000000000000;
        repeat (5)
          begin
             @ (posedge tst_clk);
          end
        tst_rst <= 'b1;
        
        // repeat (1)
        //   begin
        //      @ (posedge tst_clk);
        //   end
        // tst_first  <= 27'b010000000011000000000000000;
        // tst_second <= 27'b010000000010000000000000000;
        
        // repeat (1)
        //   begin
        //      @ (posedge tst_clk);
        //   end
        // tst_first  <= 27'b010000000110000000000000000;
        // tst_second <= 27'b010000000100000000000000000;

        repeat (1)
          begin
             @ (posedge tst_clk);
          end
        tst_first  <= 27'b010000001110000000000000000;
        tst_second <= 27'b010000000100000000000000000;
        #1000;
        
        $finish;
     end
   
endmodule
