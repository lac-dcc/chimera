// This program was cloned from: https://github.com/DemirMahmut/RISCV_Single_Cycle_Processor
// License: MIT License

`include "Single_Cycle_Top.v"

module Single_Cycle_Top_Tb ();
    
    reg clk=1'b1,rst;

    Single_Cycle_Top Single_Cycle_Top(
                                .clk(clk),
                                .rst(rst)
    );

    initial begin
        $dumpfile("Single_Cycle.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #5;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #10;

        rst <=1'b1;
        #5000;
        $finish;
    end
endmodule