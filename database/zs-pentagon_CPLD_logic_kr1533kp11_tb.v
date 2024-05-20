// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 10 ps
`define TBASSERT_METHOD(TB_NAME) reg [512:0] tbassertLastPassed = ""; task TB_NAME(input condition, input [512:0] s); if (condition === 1'bx) $display("-Failed === x value: %-s", s); else if (condition == 0) $display("-Failed: %-s", s); else if (s != tbassertLastPassed) begin $display("Passed: %-s", s); tbassertLastPassed = s; end endtask

module kr1533kp11_tb;
`TBASSERT_METHOD(tbassert)

// DUT inputs
reg [3:0] A = 4'b0;
reg [3:0] B = 4'b0;
reg SA = 1'b0;
reg CS = 1'b1;

// DUT outputs
wire [3:0] Y;

// DUT
kr1533kp11 dut(
    .A(A),
    .B(B),
    .SA(SA), 
    .CS(CS),
    .Y(Y)
);

initial
begin
    $dumpfile("kr1533kp11_tb.vcd");
    $dumpvars;
    
    A = 4'hf;
    B = 4'h5;
    CS = 1'b0;
    SA = 1'b0;
    #2
    tbassert(Y == 4'hf, "Test 1");

    #1
    SA = 1'b1;
    #2
    tbassert(Y == 4'h5, "Test 2");
    #2
    CS = 1'b1;
    #2
    //tbassert(Y == 4'bz, "Test 3");
    $finish;
end

endmodule