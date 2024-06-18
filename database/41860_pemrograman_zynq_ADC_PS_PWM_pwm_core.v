// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module pwm_core
    (
        input wire        clk,
        input wire        rst_n,
        input wire [31:0] pwm_value,
        output reg        pwm_out
    );
    
    reg [31:0] cnt_reg;
    
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            cnt_reg <= 0;
            pwm_out <= 0;
        end
        else if (cnt_reg == 100-pwm_value-1) // Set PWM value
        begin
            cnt_reg <= cnt_reg + 1;
            pwm_out <= 1;
        end
        else if (cnt_reg < 100-1) // 100MHz / 100 = 1MHz
        begin
            cnt_reg <= cnt_reg + 1;
        end
        else if (cnt_reg == 100-1) // Reset counter
        begin
            cnt_reg <= 0;
            pwm_out <= 0;
        end
    end
    
endmodule
