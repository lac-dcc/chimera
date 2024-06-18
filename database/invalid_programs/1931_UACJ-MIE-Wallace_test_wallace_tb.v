// This program was cloned from: https://github.com/HHRB98/UACJ-MIE-Wallace
// License: Apache License 2.0

`timescale 1ns / 100ps
`include "tt_um_wallace_hhrb98.v"
module wallace_tb;
// Inputs
reg [3:0] A;
reg [3:0] B;                    
// Outputs
wire [7:0] prod;
// Instantiate
wallace DUT (
.A(A),
.B(B),
.prod(prod)
);
integer write_data;
integer i;
time t;
initial begin
write_data = $fopen("wallace_tb_output.txt","w");
$dumpfile("wallace_tb.vcd");
$dumpvars(0,wallace_tb);
//$timeformat(-9, 2, " ns", 10);

for (i = 0; i < 255; i = i + 1) begin
        {A,B} = i; #20; t = $time;
        $fdisplay(write_data, "Time: %t\tA = %d\tB = %d\tProduct = %d", t, A, B, prod); //CICLO FOR PARA MOSTRAR TODAS LAS COMBINACIONES POSIBLES
    end

// Close output file
$fclose(write_data);

// End of simulation
$display("Test completed");
end
endmodule
