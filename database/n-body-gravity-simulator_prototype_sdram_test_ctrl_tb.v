// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module ctrl_tb;
   
   reg clk;    // clk in from PLL = 100 MHz  
   reg rst;    // CAS signal delay is 2 clocks
   reg switch;
   wire [12:0] addr;
   wire [15:0] dq;
   wire [1:0]  ba;
   wire        ldqm;
   wire        udqm;
   wire        ras_n;
   wire        cas_n;
   wire        cke;
   wire        outclk;
   wire        we_n;
   wire        cs_n;
   wire        hex1;
   wire        hex2;


   ctrl dut (
             .clk(clk),    // clk in from PLL = 100 MHz  
             //.rst(rst),    // CAS signal delay is 2 clocks
             .switch(switch),
             .addr(),
             .dq(),
             .ba(),
             .ldqm(),
             .udqm(),
             .ras_n(),
             .cas_n(),
             .cke(cke),
             .outclk(),
             .we_n(),
             .cs_n(cs_n),
             .hex1(),
             .hex2()
             );
   
   always
     begin
        clk <= 'b0;
        #5;
        clk <= 'b1;
        #5;
     end

   initial
     begin
        $dumpvars;
        //rst <= 'b0;
        switch <= 'b0;
        
        repeat (5)
          @(posedge clk);

        //rst <= 'b1;

        repeat (5)
          @(posedge clk);
        
        switch <= 'b1;
        
        #200000;
        
        $finish;
     end

     

endmodule
