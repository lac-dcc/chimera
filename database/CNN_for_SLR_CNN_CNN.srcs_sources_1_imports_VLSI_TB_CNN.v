`timescale 1ns / 1ps

module TB_CNN;
    reg clk;
    reg reset;
    wire signed [39:0] CNN_output;
    wire write_strobe;
    
    CNN uut( .clk(clk), .reset(reset), .CNN_output(CNN_output), .write_strobe(write_strobe));
    
    always #5 clk = ~clk;
    
    initial begin
    clk = 0;
    reset = 0;
    #50;
    reset = 1;
    #10;
    reset = 0;
    
    #400000;
    reset = 1;
    #10;
    reset = 0;
    end
    

endmodule
