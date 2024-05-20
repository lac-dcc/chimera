// This program was cloned from: https://github.com/sspku-mzj/Verilog_Module
// License: Apache License 2.0

`timescale  1ns/1ns
module async_fifo_tb;

    parameter WIDTH = 16;
    parameter DEPTH = 8;

    reg i_wclk, i_wrst_n, i_push;
    reg i_rclk, i_rrst_n, i_pop;

    reg     [WIDTH-1:0] i_wdata;

    wire                o_full, o_empty;
    
    wire    [WIDTH-1:0] o_rdata;   

    initial begin
        i_wclk = 1'b0;
        forever begin
            #25 i_wclk = ~i_wclk;
        end
    end

    initial begin
        i_rclk = 1'b0;
        forever begin
            #30 i_rclk = ~i_rclk;
        end
    end

    initial begin
        i_push  = 1'b0;
        i_pop   = 1'b0;
        i_wrst_n= 1'b1;
        i_rrst_n= 1'b1;

        #10
        i_wrst_n= 1'b0;
        i_rrst_n= 1'b0;

        #20
        i_wrst_n = 1'b1;
        i_rrst_n = 1'b1;

        @(negedge i_wclk)
            i_wdata = {$random} % 30;
            i_push = 1;
        
        repeat(1) begin
            @(negedge i_wclk)
                i_wdata = {$random} % 30;
        end

        @(negedge i_wclk)
            i_push = 1'b0;
        
        @(negedge i_rclk)
            i_pop = 1'b1;
        
        //repeat(1) begin
            @(negedge i_rclk)
        //end

        @(negedge i_rclk)
            i_pop = 1'b0;
        
        #150

        @(negedge i_wclk)
            i_push = 1'b1;
            i_wdata = {$random} % 30;
        
        repeat(15) begin
            @(negedge i_wclk)
                i_wdata = {$random} % 30;
        end

        @(negedge i_wclk)
            i_push = 1'b0;

        #50
        $finish;
        
    end
    async_fifo async_fifo(
        .i_wclk(i_wclk),
        .i_rclk(i_rclk),
        .i_wrst_n(i_wrst_n),
        .i_rrst_n(i_rrst_n),
        .i_wdata(i_wdata),
        .i_push(i_push),
        .i_pop(i_pop),
        .o_full(o_full),
        .o_empty(o_empty),
        .o_rdata(o_rdata)
    );
endmodule