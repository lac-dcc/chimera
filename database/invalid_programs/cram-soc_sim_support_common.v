// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

/////////// test bench boilerplate
// build a reference clock
reg clk12;
initial clk12 = 1'b1;
always #41.6666 clk12 = ~clk12;

wire success;
wire done;
wire [31:0] report;

// termination condition upon success
always @(*) begin
    if (done == 1'b1) begin
        #500;
        $dumpflush;
        $dumpoff;
        $finish;
    end
end

initial begin
    $dumpfile("ci.vcd");
    // $dumpvars(0, dut); will dump *everything*
    $dumpvars(0, success);
    $dumpvars(0, done);
    $dumpvars(0, report);
end
