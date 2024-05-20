// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module risc_V_TB();
    reg clk, reset;
    
    RISC_V_Pipelined_Processor RISC (clk, reset);
    initial
    begin  
        clk = 0;
        reset = 1;
        
        #20
        reset = 0;    
    end
    always
        #5 clk = ~clk;
        
endmodule
