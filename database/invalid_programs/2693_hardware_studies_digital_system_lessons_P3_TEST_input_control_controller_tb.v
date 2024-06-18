// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ms/1ms
`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/controller.v"

module tb_;
    reg clk_tb, enablen;
    reg [9:0] keypad, i;
    integer count = 0;
    wire [3:0] digit;
    wire load, pgt_1hz;
    
    input_encoder dut (
    .clk(clk_tb), .enablen(enablen), .keypad(keypad),
    .load(load), .pgt_1hz(pgt_1hz), .digit(digit)
);

    localparam clk_period = 10;
    always #(clk_period/2) clk_tb=~clk_tb;

    initial
        begin
            $dumpfile("tb.vcd");
            $dumpvars(0, tb_);
                i = 10'b0000000000;
                clk_tb = 1'b1;
                keypad = 0;
                enablen = 1'b0;
                #3 enablen = 1'b1;
                i = 10'b0000000001;
                for (count = 0; count < 10; count = count+1) begin
                    #3 enablen = 1'b0;
                    keypad = i;
                    #2 enablen = 1'b1;
                    i = i << 1;
                end
            $finish();
        end

endmodule