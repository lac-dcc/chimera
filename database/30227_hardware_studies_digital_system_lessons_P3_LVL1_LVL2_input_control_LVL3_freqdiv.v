// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

// clk -> 100hz ; clk100 -> 1hz
module freqdiv (
    input clk, 
    output reg clk100_
);
    parameter tfm = 2500000;
    reg [24:0] count = 0;
    initial clk100_ = 1'b1;
    
    always @(posedge clk) begin
        count = count + 1;
        if(count == (tfm+1)) begin
            count = 1;
            clk100_ = ~clk100_;
        end
    end
endmodule

// clk -> 50Mhz ; clk50m -> 1hz
module freqdiv50M (
    input clk, 
    output reg clk100
);
    parameter tfm = 25000000;
    reg [24:0] count = 0;
    initial clk100 = 1'b1;
    
    always @(posedge clk) begin
        count = count + 1;
        if(count == (tfm+1)) begin
            count = 1;
            clk100 = ~clk100;
        end
    end
endmodule
