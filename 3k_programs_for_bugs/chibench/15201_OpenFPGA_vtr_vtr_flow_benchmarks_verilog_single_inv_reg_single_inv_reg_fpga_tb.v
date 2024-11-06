// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module single_inv_reg_tb();

    reg clock, rst;
    reg d_in; 
    wire d_out;
    wire rdy;

    initial
    begin
        $display($time, " << Starting the Simulation >>");
        
        d_in = 1'b0;

        wait ( rdy == 1'b1 )
            begin
                d_in = 1'b0;
            end

        #30
        d_in = 1'b1;

        #20
        d_in = 1'b0;

        #40
        $display($time, " << Simulation Complete >>");
        $finish;
    end

    initial
    begin
        $monitor($time, ", clock = %b, rst = %b, d_in = %b, d_out = %b", 
                         clock,      rst,      d_in,      d_out);
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

    // single_inv_reg DUT
    single_inv_reg dut ( .d_in(d_in),
                     .d_out(d_out),
                     .clock(clock),
                     .rst(rst),
                     .rdy(rdy)
                   );

endmodule
