// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

//`include "M_MIPS_CPU.v"
`timescale 1ns/1ps

module TB_MIPS_CPU;
    //cpu testbench

    reg clk;
    reg res;
    M_MIPS_CPU MIPS_DUT(clk, res);

    // initial begin
    //     $dumpfile("MIPS_DUT.vcd");
    //     $dumpvars(0, MIPS_DUT);
    // end
    // always@(writedataM, aluoutM, memwriteM) begin
    //     if(writedataM) begin
    //         $display("----------------------------------------------------------");
    //         $display("Data is being written to Memory @%h: %h", aluoutM, memwriteM);
    //         $display("----------------------------------------------------------");
    //     end
    // end

    initial
    forever #5 clk = ~clk;

    initial begin

        clk = 0;
        res = 1;
        #10 res = 0;
		
        #500 $finish;

    end

endmodule
