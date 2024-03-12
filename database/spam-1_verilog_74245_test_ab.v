// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off UNOPTFLAT


`include "../lib/assertion.v"
`include "./hct74245.v"
`timescale 1ns/1ns

module test_ba();

    tri [7:0] A;
    tri [7:0] B;

    logic [7:0] Vb;
    logic [7:0] Va;
  
    logic nOE=0;

    assign B=Vb;
    assign A=Va;

    // swap these to test other direction
    hct74245ba buf245(.A(B), .B(A), .nOE);
    //hct74245ab buf245(.A, .B, .nOE);

    always @*
        $display("%9t", $time, " nOE=%1b", nOE, " Va=%8b", Va, " Vb=%8b ", Vb, " A=%8b ", A," B=%8b ", B);
     
    time timer;

    initial begin
      $display("test initial values");

      Va='x;
      Vb='x;
      nOE = 1;
      #2 // not enough time to stabilise
      `equals(A, 8'bxxxxxxxx, "OE disable");
      `equals(B , 8'bxxxxxxxx, "OE disable");
      ////////////////////////////////

      Va=8'bzzzzzzzz;
      Vb=8'bzzzzzzzz;

      #100      
      $display("test output disabled");
      nOE = 1;
      #30
      `equals(A, 8'bzzzzzzzz, "OE disable A->B");
      `equals(B , 8'bzzzzzzzz, "OE disable A->B");

      $display("test output enabled a->b but B=Z");
      Va=8'bzzzzzz10;
      Vb=8'bzzzzzzzz;
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
      nOE = 1;
      Va=8'b11111111;
      Vb=8'bzzzzzzzz; // avoid contention

      #50 // settle
      nOE = 0; // REENABLE

      // check that the timings in the chip actually work
      `ASSERT_TOOK(B === 8'b11111111, buf245.inner.PD_OE)
      
      #100      
      $display("change value while enabled");
      Va=8'b10101010;
      Vb=8'bzzzzzzzz; // avoid contention

      // check that the timings in the chip actually work
      `ASSERT_TOOK(B === 8'b10101010, buf245.inner.PD_TRANS)

    end

endmodule : test_ba

// verilator lint_on ASSIGNDLY
// verilator lint_on STMTDLY
// verilator lint_on UNOPTFLAT
