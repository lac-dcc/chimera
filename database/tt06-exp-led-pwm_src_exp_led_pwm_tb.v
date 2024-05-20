// This program was cloned from: https://github.com/spiff42/tt06-exp-led-pwm
// License: Apache License 2.0

`default_nettype none `timescale 1ns / 1ps

// Test bench
// usage:
// iverilog exp_led_pwm_tb.v tt_um_spiff42_exp_led_pwm.v pwm_chan.v ramp_gen.v && ./a.out
// gtkwave tb.vcd &
module exp_led_pwm_tb ();
    reg clk;
    reg ena;
    reg rst_n;
    reg [7:0] ui_in;

    initial
    begin
        $dumpfile("tb.vcd");
        $dumpvars(0, exp_led_pwm_tb);
        ena = 0;
        clk = 0;
        rst_n = 1;
        ui_in = 128;
        #(10);
        rst_n = 0;
        #(5);
        ena = 1;
        #(25);
        rst_n = 1;
        #(656000);
        ui_in = 16;
        #(656000);
        $finish;
    end

    // Generate clock
    always #(5)
        if (ena) clk <= ~clk;

    tt_um_spiff42_exp_led_pwm dut (
        .ui_in(ui_in),
        .uo_out(),
        .uio_in(8'h00),
        .uio_out(),
        .uio_oe(),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

endmodule