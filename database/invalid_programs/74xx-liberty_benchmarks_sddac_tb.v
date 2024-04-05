// Testbench for sddac.v
// Author: Niels A. Moseley

`include "constants.vams"

module tb;

reg  clk   = 0;
reg  rst_n = 0;
reg signed [15:0] sig = 0;
wire dac_out;

real    phase = 0.0;
integer fhandle;

// clock generation
always #1 clk=~clk;

// devices under test
sddac dut(clk, rst_n, sig, dac_out);

initial
begin
    $dumpfile("sddac.vcd");
    $dumpvars;

    fhandle = $fopen("sddac_out.txt","w");

    #4 rst_n = 1'b1;

    #526288 $finish;    // 2^18 + 1000 startup samples
end

always @(posedge clk)
begin
    if (rst_n == 1'b1)
    begin
        $fwrite(fhandle, "%d\n", dac_out);
        sig <= $sin(`M_TWO_PI*phase)*10000.0;
        phase <= phase + 0.001;
    end
end

endmodule
