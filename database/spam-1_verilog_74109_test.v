// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "hct74109.v" 
`include "../lib/assertion.v"
`timescale 1ns/1ns

module test;
   reg j;
   reg _k;
   reg clk=0;

   reg _sd=1, _rd=1;

   wire qS, _qS;
   wire qR, _qR;
   wire q, _q;
 
   // expected PD of device
   parameter PD=17;

    // must be longer than PD of device else malfunction
   parameter CLK_T=PD+1;

   parameter TEST_INTERVAL=CLK_T * 10;

   initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);
   end

   //always  #CLK_T clk = !clk;
   task clk_pulse;
   begin
        clk = 0;
        #CLK_T 
        clk = 1;
        #CLK_T 
        clk = 1; // repeat setting=1 otherwise syntax error cos can't have a delay as last item
   end
   endtask

 
   hct74109  jkForceSet ( .j(j),
                  ._k(_k),
                  .clk(clk),
                  ._sd(1'b0),
                  ._rd(1'b1),
                  .q(qS),
                  ._q(_qS)
    );

   hct74109  jkForceReset ( .j(j),
                  ._k(_k),
                  .clk(clk),
                  ._sd(1'b1),
                  ._rd(1'b0),
                  .q(qR),
                  ._q(_qR)
    );

   hct74109  jkVariable ( .j(j),
                  ._k(_k),
                  .clk(clk),
                  ._sd(_sd),
                  ._rd(_rd),
                  .q(q),
                  ._q(_q)
    );
 
   initial begin
            // hold
      #TEST_INTERVAL 
        $display("testing initial state set");
        clk_pulse();
        `Equals(qS, 1'b1)

            // hold
      #TEST_INTERVAL 
        $display("testing initial state reset");
        clk_pulse();
        `Equals(qR, 1'b0)

            // hold
      #TEST_INTERVAL 
        $display("hold mode");
        j <= 0;
        _k <= 1;

        clk_pulse();
        `Equals(q, 1'bx) // stays as X       
        clk_pulse();
        `Equals(q, 1'bx)
        clk_pulse();
        `Equals(q, 1'bx)
 
        // load reset Q=L
      #TEST_INTERVAL 
        $display("reset mode");
        j <= 0;
        _k <= 0;

        clk_pulse();
        `Equals(q, 1'b0)
        clk_pulse();
        `Equals(q, 1'b0)

        $display("reset mode - async set");
        _sd<=0;
        #PD // NOT CLOCK
        `Equals(q, 1'b1)
        _sd<=1;

        // load set Q=H
      #TEST_INTERVAL 
        $display("load mode");
        j <= 1;
        _k <= 1;

        clk_pulse();
        `Equals(q, 1'b1)
        clk_pulse();
        `Equals(q, 1'b1)
        clk_pulse();
        `Equals(q, 1'b1)

        $display("load mode - async set");
        _rd<=0;
        #PD // NOT CLOCK
        `Equals(q, 1'b0)
        _rd<=1;


        // toggle
      #TEST_INTERVAL 
        $display("toggle mode");
        j <= 1;
        _k <= 0;

        // expect inital state of 0 as last test did a async reset
        `Equals(q, 1'b0)
        clk_pulse();
        `Equals(q, 1'b1)
        clk_pulse();
        `Equals(q, 1'b0)

      #TEST_INTERVAL $finish;
   end
 
`ifndef verilator
   initial
      $monitor ($time, " TEST   clk ", clk, " j %0d _k %0d q %0d", j, _k, q);
`endif
endmodule  
 

