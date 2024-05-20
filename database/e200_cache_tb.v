// This program was cloned from: https://github.com/123xnc/e200_cache
// License: Apache License 2.0

module tb_cache;
reg   clk = 0;
reg   rst = 0;
reg   rst_cpu = 0;



initial
    begin
        rst = 1;
        clk = 1;
        rst_cpu = 0;
        #20;
        rst = 0;
        #20
        rst_cpu = 1;

    end


always begin
    #(10) clk = ~clk;

end 

cpu_top cpu(clk, rst, rst_cpu);


endmodule
