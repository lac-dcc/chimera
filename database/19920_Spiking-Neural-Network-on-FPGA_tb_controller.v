// This program was cloned from: https://github.com/metr0jw/Spiking-Neural-Network-on-FPGA
// License: MIT License

`timescale 1ns / 100ps
module tb_controller;
    reg                 clk, reset_n;
    reg         [7:0]   input_spike;

    wire        [7:0]   output_spike;

    parameter           STEP = 10;

    controller uut_controller (
        .clk(clk), .reset_n(reset_n),
        .input_spike(input_spike),
        .output_spike(output_spike)
    );

    always #(STEP/2) clk = ~clk;
    
    initial
    begin
        $dumpfile("tb_controller.vcd");
        $dumpvars(0, tb_controller);
        clk = 0; reset_n = 1; input_spike = 8'b00000000;
        #1 reset_n = 0;
        #2 reset_n = 1;
        
        #STEP input_spike = 8'b11111111;
        #STEP input_spike = 8'b00000000;
        #STEP input_spike = 8'b11111111;
        #STEP input_spike = 8'b00000000;
        #STEP
        $finish;
    end

endmodule
