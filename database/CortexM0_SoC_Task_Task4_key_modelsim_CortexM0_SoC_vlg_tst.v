// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

`timescale 1 ps/ 1 ps
module CortexM0_SoC_vlg_tst();

reg clk;
reg RSTn;
reg[3:0] col;
                        
CortexM0_SoC i1 (
    .clk(clk),
    .RSTn(RSTn),
    .col(col)
);

initial begin                                                  
    clk = 0;
    RSTn=0;
    #100
    RSTn=1;
    #100
    col = 4'b0001;
    #100000
    col = 4'b0000;

end  
    
always begin                                                  
    #5 clk = ~clk;
end       

endmodule
