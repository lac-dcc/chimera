// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ms/1ms
`include "./digital_system_lessons/P3/LVL1/LVL2/timer/controller.v"

module tb_;
    reg clk_tb, rst, enablen, load;
    reg [3:0] in;
    wire [3:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens;
    wire finished;

    timer dut (
    .clk(clk_tb), .rst(rst), .enablen(enablen), .load(load), .in(in),
    .out_second_unit(out_second_unit), .out_second_tens(out_second_tens),
    .out_minute_unit(out_minute_unit), .out_minute_tens(out_minute_tens),
    .finished(finished) 
);
    localparam clk_period = 1000;
    always #(clk_period/2) clk_tb=~clk_tb;

    initial
        begin
            $dumpfile("tb.vcd");
            $dumpvars(0, tb_);
                clk_tb = 1'b1;
                in = 4'b0001;
                #3 load = 1'b1;
                #5 in = 4'b0010;
                #3 load = 1'b0;
                enablen = 1'b0;
                load = 1'b1;
                #10 load = 1'b0;

        #13000 $finish();        
        end

endmodule