// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module multi_consumer_tb();

    reg clock, rst;
    reg [15:0] d_in;
    wire [15:0] d_out_1, d_out_2, d_out_4, d_out_7;

    initial
    begin
        $display($time, " << Starting the Simulation >>");
    
        d_in = 16'b0;

        #30
        d_in = 16'hffff;

        #20
        d_in = 16'h00ff;

        #20
        d_in = 16'h0000;

        #40
        $display($time, " << Simulation Complete >>");
    end

    initial
    begin
        $monitor($time, ", clock = %b, rst = %b, d_in = %h, d_out_1 = %h, d_out_2 = %h d_out_4 = %h d_out_7 = %h",
                           clock, rst, d_in, d_out_1, d_out_2, d_out_4, d_out_7);
    end

    initial
    begin
        clock = 1'b1;
        rst = 1'b1;
        #20 rst = 1'b0;
    end

    always
    begin
        #10 clock = ~clock;
    end

    // multi_consumer DUT
    multi_consumer dut ( .d_in(d_in),
                         .d_out_1(d_out_1),
                         .d_out_2(d_out_2),
                         .d_out_4(d_out_4),
                         .d_out_7(d_out_7),
                         .clock(clock),
                         .rst(rst)
                        );

endmodule
