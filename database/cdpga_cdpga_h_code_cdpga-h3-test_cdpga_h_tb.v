`timescale 1 ns / 1 ps

`define frequency 25000000 //(Hz)
`define cycle (1000000000.0/`frequency) //clock period (nS)


module cdpga_h_tb;

reg clk;
wire [19:0] out;

initial
begin
    clk = 0;
    #2000000;
    $finish;
end

always #(`cycle/2.0) clk = ~clk;


cdpga_h cdpga_h_m(
    .clk(clk),
    .out(out)
);

initial begin
    $dumpfile("cdpga_h.vcd");
    $dumpvars();
end

endmodule
