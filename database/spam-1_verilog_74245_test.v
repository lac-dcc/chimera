// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off UNOPTFLAT


`include "../lib/assertion.v"
`include "./hct74245.v"
`timescale 1ns/1ns

module tb();

    logic dir;
    logic nOE=0;

    logic [7:0] Vb;
    logic [7:0] Va;
  
    tri [7:0] A;
    tri [7:0] B;

    assign B=Vb;
    assign A=Va;

    localparam AB=1;
    localparam BA=0;

    hct74245 #(.LOG(1), .NAME("buf245MuxX")) buf245MuxX(.A(A), .B(B), .dir, .nOE(nOE));

    always @*
        $display("%9t", $time, " => dir=%1b", dir, " nOE=%1b", nOE, " Va=%8b", Va, " Vb=%8b ", Vb, " A=%8b ", A," B=%8b ", B);
     
    time timer;

    initial begin
      $display("test initial values");

      Va='x;
      Vb='x;
      dir = AB; // a->b
      nOE = 1;
      #2 // not enough time to stabilise
      `equals(A, 8'bxxxxxxxx, "OE disable");
      `equals(B , 8'bxxxxxxxx, "OE disable");
      ////////////////////////////////

      Va=8'bzzzzzzzz;
      Vb=8'bzzzzzzzz;

      #100      
      $display("test output disabled");
      dir = AB; // a->b
      nOE = 1;
      #30
      `equals(A, 8'bzzzzzzzz, "OE disable A->B");
      `equals(B , 8'bzzzzzzzz, "OE disable A->B");

      #30
      `equals(A, 8'bzzzzzzzz, "OE disable A->B");
      `equals(B , 8'bzzzzzzzz, "OE disable A->B");

      $display("test output enabled a->b but A=Z");
      Va=8'bzzzzzz10;
      Vb=8'bzzzzzzzz;
      dir = AB; // a->b
      nOE = 0;
      #30
      `equals(A, 8'bzzzzzz10, "OE disable A->B");
      `equals(B , 8'bzzzzzz10, "OE disable A->B");


      ////////////////////////////////
      #100      
      $display("test that when OE is disabled that other drivers can assert");
      
      nOE = 1;
      Va=8'b11111111;
      Vb=8'b10xz10xz;
      #31
       `equals(A, 8'b11111111, "OE disable");
       `equals(B , 8'b10xz10xz, "OE disable");

      ////////////////////////////////
      
      #100      
      $display("check timing for enable output");
      dir = AB; // a->b
      nOE = 1;
      Va=8'b11111111;
      Vb=8'bzzzzzzzz; // avoid contention

      #50 // settle
      nOE = 0; // REENABLE

      // check that the timings in the chip actually work
      `ASSERT_TOOK(B === 8'b11111111, buf245MuxX.PD_OE)
      
      
      #100      
      // necessary to setup A as Z before next timing test
      $display("switch dir and value while enabled");
      dir = AB; // a->b
      nOE = 0;
      Va=8'bzzzzzzzz; // avoid contention
      #100
      nOE = 0;
      Vb=8'b10101011;
      dir = AB; // a-b
      #100
      Vb=8'b10101010;
      dir = BA; // b->a

      `ASSERT_TOOK(A === 8'b10101010, buf245MuxX.PD_DIR)

      
      #100      
      $display("switch value while enabled");
      timer=$time;
      dir = BA; // b->a
      nOE = 0;
      #100
      Va=8'bzzzzzzzz; // avoid contention
      Vb=8'b00000000;

      `ASSERT_TOOK( A === 8'b00000000, buf245MuxX.PD_TRANS)
      
      ////////////////////////////////
      
      #100      
      $display($time, "switch dir while enabled");
      nOE = 0;
      Va=8'b00000000;
      Vb=8'bzzzzzzzz;
      #100

      dir = AB; // a->b

      `ASSERT_TOOK( B === 8'b00000000, buf245MuxX.PD_DIR)
      
      #100      
      $display("switch to value while enabled");
      dir = AB; // a->b
      nOE = 0;
      #100 
      Va=8'b11111111;
      Vb=8'bzzzzzzzz;
      
      `ASSERT_TOOK( B === 8'b11111111, buf245MuxX.PD_TRANS)

    end

endmodule : tb

