// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "fig11_58_wo_set.v"
module tb_circuit();
    reg x,CP;
    wire z;

    circuit uut(x,CP,z);

    initial CP=0;
    always #5 CP=~CP;

    initial begin
        $dumpfile("circuit_wo_set.vcd");
        $dumpvars(0, tb_circuit);

        x<=0;
        #10
        x<=1;
        #10
        $finish;
    end
endmodule