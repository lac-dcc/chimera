// This program was cloned from: https://github.com/metr0jw/Spiking-Neural-Network-on-FPGA
// License: MIT License

`timescale 1ns / 100ps
`include "leaky_integrate_fire.v"
module tb_leaky_integrate_fire;
    reg             clk;
    reg             reset_n;
    reg             spike_in_0, spike_in_1, spike_in_2, spike_in_3, spike_in_4, spike_in_5, spike_in_6, spike_in_7;
    reg     [7:0]   weight_0, weight_1, weight_2, weight_3, weight_4, weight_5, weight_6, weight_7;
    reg     [7:0]   memb_potential_in;
    reg     [7:0]   threshold;
    reg     [7:0]   leak_value;
    reg     [3:0]   tref;

    wire    [7:0]   memb_potential_out;
    wire            spike_out;

    parameter STEP = 10;


    leaky_integrate_fire uut (
        .clk(clk), .reset_n(reset_n),
        .spike_in({spike_in_7, spike_in_6, spike_in_5, spike_in_4, spike_in_3, spike_in_2, spike_in_1, spike_in_0}),
        .weight({weight_7, weight_6, weight_5, weight_4, weight_3, weight_2, weight_1, weight_0}),
        .memb_potential_in(memb_potential_in), .threshold(threshold), .leak_value(leak_value), .tref(tref),
        .memb_potential_out(memb_potential_out), .spike_out(spike_out)
    );

    always #(STEP/2) clk = ~clk;
    initial begin
        $dumpfile("tb_leaky_integrate_fire.vcd");
        $dumpvars(0, tb_leaky_integrate_fire);
        clk = 1'b0; reset_n = 1'b1; #1;
        reset_n = 1'b0; #1; reset_n = 1'b1; #1;
        memb_potential_in = 8'h00; threshold = 8'h10; leak_value = 8'h1; tref = 4'h2;
        weight_0 = 8'h01; weight_1 = 8'h02; weight_2 = 8'h03; weight_3 = 8'h04; weight_4 = 8'h05; weight_5 = 8'h06; weight_6 = 8'h07; weight_7 = 8'h08;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;

        // Test 1
        spike_in_0 = 1'b1; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b1; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b1; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b1; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out;

        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out;
        spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out;

        // Test 2
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b1; spike_in_2 = 1'b1; spike_in_3 = 1'b1; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b0; spike_in_6 = 1'b0; spike_in_7 = 1'b0; #STEP
        memb_potential_in = memb_potential_out; #STEP
        memb_potential_in = memb_potential_out; #STEP
        memb_potential_in = memb_potential_out; #STEP

        // Test 3
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; spike_in_0 = 1'b0; spike_in_1 = 1'b0; spike_in_2 = 1'b0; spike_in_3 = 1'b0; spike_in_4 = 1'b0; spike_in_5 = 1'b1; spike_in_6 = 1'b1; spike_in_7 = 1'b1; #STEP
        memb_potential_in = memb_potential_out; #STEP

        $finish;
    end

endmodule
