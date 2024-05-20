// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module pwm_core_tb();
    localparam T = 10;

    reg clk;
    reg rst_n;
    reg [31:0] pwm_value;
    wire pwm_out;
    
    pwm_core dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .pwm_value(pwm_value),
        .pwm_out(pwm_out)
    );
    
    always
    begin
        clk = 0;
        #(T/2);
        clk = 1;
        #(T/2);
    end
    
    initial
    begin
        pwm_value = 90;
    
        rst_n = 0;
        #(T);
        rst_n = 1;
        #(T);
    end

endmodule
