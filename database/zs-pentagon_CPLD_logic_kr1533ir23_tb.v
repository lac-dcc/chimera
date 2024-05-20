// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 10 ps
`define TBASSERT_METHOD(TB_NAME) reg [512:0] tbassertLastPassed = ""; task TB_NAME(input condition, input [512:0] s); if (condition === 1'bx) $display("-Failed === x value: %-s", s); else if (condition == 0) $display("-Failed: %-s", s); else if (s != tbassertLastPassed) begin $display("Passed: %-s", s); tbassertLastPassed = s; end endtask

module kr1533ir23_tb;
`TBASSERT_METHOD(tbassert)

// DUT inputs
reg [7:0] D = 8'b0;
reg C = 1'b0;
reg OEn = 1'b0;

// DUT outputs
wire [7:0] Q;

// DUT
kr1533ir23 dut(
    .D(D),
    .Q(Q),
    .C(C), 
    .OEn(OEn)
);

initial
begin
    $dumpfile("kr1533ir23_tb.vcd");
    $dumpvars;
    
    C = 1'b0;
    #1
    D = 8'h55;
    #10
    C = 1'b1;
    #2
    tbassert(Q == 8'h55, "Test 1");

    C = 1'b0;
    #1
    D = 8'haa;
    #10
    C = 1'b1;
    #2
    tbassert(Q == 8'haa, "Test 2");

    C = 1'b0;
    #2
    #20
    OEn = 1'b1;
    #20
    tbassert(Q == 8'bz, "Test 3");

    $finish;
end

endmodule