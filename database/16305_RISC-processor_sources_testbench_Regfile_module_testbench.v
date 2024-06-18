// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns / 1ps

module Regfile_module_testbench;

    reg clk_i;

    reg  [4 : 0]     ra_i;
    reg  [4 : 0]     rb_i;
    reg  [4 : 0]     rc_i;

    reg  werf_i;
    reg  ra2sel_i;

    reg  [31 : 0]    wd_i;

    wire [31 : 0]    rd1_o;
    wire [31 : 0]    rd2_o;

    RegfileModule reg_file_module_instance_0 (
        .clk_i(clk_i),
        .ra_i(ra_i),
        .rb_i(rb_i),
        .rc_i(rc_i),
        .werf_i(werf_i),
        .ra2sel_i(ra2sel_i),
        .wd_i(wd_i),
        .rd1_o(rd1_o),
        .rd2_o(rd2_o)
    );

    reg [4 : 0] address = 5'h00000;
    integer i = 0;

    initial begin
        clk_i = 0;

        for (i = 0; i < 32; i = i + 1) begin 
            ra_i = address;
            rb_i = address;
            rc_i = address + 5'h00001;
            ra2sel_i = 1'b0;
            werf_i = 1;
            wd_i = 32'hDEADC0DE + i[31 : 0];

            #5 clk_i = ~clk_i;
            #5 clk_i = ~clk_i;  
            address = address + 5'h00001;      
        end

        address = 5'h00000;
        i = 0;

        #100
        
        for (i = 0; i < 32; i = i + 1) begin 
            ra_i = address;
            rb_i = address;
            rc_i = address + 5'h00001;
            ra2sel_i = 1'b1;
            werf_i = 1;
            wd_i = 32'hDEADC0DE + i[31 : 0];

            #5 clk_i = ~clk_i;
            #5 clk_i = ~clk_i;  
            address = address + 5'h00001;      
        end

        #100
        
        for (i = 0; i < 32; i = i + 1) begin 
            ra_i = address;
            rb_i = address;
            rc_i = address + 5'h00001;
            ra2sel_i = 1'b1;
            werf_i = 0;
            wd_i = 32'hDEADC0DE + i[31 : 0];

            #5 clk_i = ~clk_i;
            #5 clk_i = ~clk_i;  
            address = address + 5'h00001;      
        end

    end

endmodule
