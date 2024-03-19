//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
tag_tree_tb.v

Mostly just to let me see if things are wired correctly. The testbench for 
tree_node already shows that a (correctly wired) tree works.
*/

`ifdef FROM_TAG_TREE
`include "tag_tree.v"
`endif

`define TAG_SZ 5
`define N1  1
`define N2  2
`define N3  4
`define N4  6
`define N5  8
`define N6  15
`define N7  16
`define N8  256

module tag_tree_tb;
    reg clk;
    reg rst;
    
    wire [`TAG_SZ-1:0] tag_1;
    wire rdy_1;
    reg ack_1;
    
    reg [`N1-1:0] rdy_in_1;
    wire [`N1-1:0] ack_out_1;
    
    
    wire [`TAG_SZ-1:0] tag_2;
    wire rdy_2;
    reg  ack_2;
    
    reg [`N2-1:0] rdy_in_2;
    wire [`N2-1:0] ack_out_2;
    
    
    wire [`TAG_SZ-1:0] tag_3;
    wire rdy_3;
    reg  ack_3;
    
    reg [`N3-1:0] rdy_in_3;
    wire [`N3-1:0] ack_out_3;
    
    
    wire [`TAG_SZ-1:0] tag_4;
    wire rdy_4;
    reg  ack_4;
    
    reg [`N4-1:0] rdy_in_4;
    wire [`N4-1:0] ack_out_4;
    
    
    wire [`TAG_SZ-1:0] tag_5;
    wire rdy_5;
    reg  ack_5;
    
    reg [`N5-1:0] rdy_in_5;
    wire [`N5-1:0] ack_out_5;
    
    
    wire [`TAG_SZ-1:0] tag_6;
    wire rdy_6;
    reg  ack_6;
    
    reg [`N6-1:0] rdy_in_6;
    wire [`N6-1:0] ack_out_6;
    
    
    wire [`TAG_SZ-1:0] tag_7;
    wire rdy_7;
    reg  ack_7;
    
    reg [`N7-1:0] rdy_in_7;
    wire [`N7-1:0] ack_out_7;
    
    
    wire [`TAG_SZ-1:0] tag_8;
    wire rdy_8;
    reg  ack_8;
    
    reg [`N8-1:0] rdy_in_8;
    wire [`N8-1:0] ack_out_8;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("tag_tree.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        rst <= 0;
        //Initial values for your other variables
        
        /*fd = $fopen("mymodule_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        
        while ($fgetc(fd) != "\n") begin
            if ($feof(fd)) begin
                $display("Error: file is in incorrect format");
                $finish;
            end
        end*/
        #300 $finish;
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        //if ($feof(fd)) begin
        //    $display("Reached end of drivers file");
        //    #20
        //    $finish;
        //end
        //
        //#0.01
        //dummy = $fscanf(fd, "%F%O%R%M%A%T", /* list of variables */);
        ack_1 = $random;
        rdy_in_1 = $random;
        
        ack_2 = $random;
        rdy_in_2 = $random;
        
        ack_3 = $random;
        rdy_in_3 = $random;
        
        ack_4 = $random;
        rdy_in_4 = $random;
        
        ack_5 = $random;
        rdy_in_5 = $random;
        
        ack_6 = $random;
        rdy_in_6 = $random;
        
        ack_7 = $random;
        rdy_in_7 = $random;
        
        ack_8 = $random;
        rdy_in_8 = $random;
    end

    tag_tree # (
        .N(`N1),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_1 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_1),
        .rdy(rdy_1),
        .ack(ack_1),
        
        .rdy_in(rdy_in_1),
        .ack_out(ack_out_1)
    );

    tag_tree # (
        .N(`N2),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_2 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_2),
        .rdy(rdy_2),
        .ack(ack_2),
        
        .rdy_in(rdy_in_2),
        .ack_out(ack_out_2)
    );

    tag_tree # (
        .N(`N3),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_4 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_3),
        .rdy(rdy_3),
        .ack(ack_3),
        
        .rdy_in(rdy_in_3),
        .ack_out(ack_out_3)
    );

    tag_tree # (
        .N(`N4),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_6 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_4),
        .rdy(rdy_4),
        .ack(ack_4),
        
        .rdy_in(rdy_in_4),
        .ack_out(ack_out_4)
    );

    tag_tree # (
        .N(`N5),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_8 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_5),
        .rdy(rdy_5),
        .ack(ack_5),
        
        .rdy_in(rdy_in_5),
        .ack_out(ack_out_5)
    );

    tag_tree # (
        .N(`N6),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_15 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_6),
        .rdy(rdy_6),
        .ack(ack_6),
        
        .rdy_in(rdy_in_6),
        .ack_out(ack_out_6)
    );

    tag_tree # (
        .N(`N7),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_16 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_7),
        .rdy(rdy_7),
        .ack(ack_7),
        
        .rdy_in(rdy_in_7),
        .ack_out(ack_out_7)
    );

    tag_tree # (
        .N(`N8),
        .TAG_SZ(`TAG_SZ),
        .DELAY_CONF(0) 
    ) tree_256 (
        .clk(clk),
        .rst(rst),
        
        .tag(tag_8),
        .rdy(rdy_8),
        .ack(ack_8),
        
        .rdy_in(rdy_in_8),
        .ack_out(ack_out_8)
    );


endmodule
