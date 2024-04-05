//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
bhand_tb.v

A testbench for the buffered handshake
*/

`ifdef FROM_BHAND
`include "bhand.v"
`else /* For Vivado */
`include "bpf_defs.vh"
`endif

`define DATA_WIDTH 8
`define COUNT_WIDTH 4
`define ENABLE_COUNT 1

module bhand_tb;
	reg clk;    
    reg rst;
    reg [`DATA_WIDTH-1:0] idata;
    reg idata_vld;
    wire idata_rdy;
    wire [`DATA_WIDTH-1:0] odata;
    wire odata_vld;
    reg odata_rdy;
    
    reg [`COUNT_WIDTH-1:0] icount;
    wire [`COUNT_WIDTH-1:0] ocount;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("bhand.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        rst <= 0;
        idata <= 0;
        idata_vld <= 0;
        odata_rdy <= 0;
        icount <= 0;
        
        fd = $fopen("bhand_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        
        while ($fgetc(fd) != "\n") begin
            if ($feof(fd)) begin
                $display("Error: file is in incorrect format");
                $finish;
            end
        end
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        
        #0.01
        dummy = $fscanf(fd, "%x%b%b%b", idata, idata_vld, odata_rdy, rst);
    end

    bhand # (
        .DATA_WIDTH(`DATA_WIDTH),
        .COUNT_WIDTH(`COUNT_WIDTH),
        .ENABLE_COUNT(`ENABLE_COUNT)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .idata(idata),
        .idata_vld(idata_vld),
        .idata_rdy(idata_rdy),
        .odata(odata),
        .odata_vld(odata_vld),
        .odata_rdy(odata_rdy),
        .icount(icount),
        .ocount(ocount)
    );

endmodule
