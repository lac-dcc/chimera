// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

`timescale 1 ps/ 1 ps
module CortexM0_SoC_vlg_tst();

reg clk;
reg RSTn;
                        
CortexM0_SoC i1 (
    .clk(clk),
    .RSTn(RSTn)
);

initial begin                                                  
    clk = 0;
    RSTn=0;
    #100
    RSTn=1;

end  
    
always begin                                                  
    #10 clk = ~clk;
end       

endmodule
