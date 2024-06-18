// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

`timescale 1ns/1ns

module TopLevelTB();
    
    

    reg clk, rst, forwardEn;




    TopLevel tl(
        .clock(clk), .rst(rst) , .forwardEn(forwardEn)
    );

    always #5 clk = ~clk;

    initial begin
        {clk, rst} = 2'b01;
        forwardEn = 1'b1;
        #10 rst = 1'b0;
        #30000 $stop;
    end
endmodule
