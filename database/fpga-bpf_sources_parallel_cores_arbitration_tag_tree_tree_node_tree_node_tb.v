//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
tree_node_tb.v

Wires up a few tree nodes together (some with, and some without ENABLE_DELAY) 
to see if it all works properly.

The first test is the combinational one:
         [node_root_combo]
             /       \
[node_left_combo] [node_right_combo]
TAGS = 1,2         TAGS = 3,4


The second test is the buffered one:
         [node_root_delay]
             /       \
[node_left_delay] [node_right_delay]
TAGS = 1,2         TAGS = 3,4


And the last test is a mixed one. The left and right nodes are combinational, 
but the root has a delay.
         [node_root_mixed]
             /       \
[node_left_mixed] [node_right_mixed]
TAGS = 1,2         TAGS = 3,4
*/

`ifdef FROM_TREE_NODE
`include "tree_node.v"
`endif

`define TAG_SZ 5

module tree_node_tb;
    reg clk;
    reg rst;
    wire [`TAG_SZ-1:0] combo_tag;
    wire combo_rdy;
    reg combo_ack;
    reg [3:0] combo_rdys;
    wire [3:0] combo_acks;
    
    wire [`TAG_SZ-1:0] delay_tag;
    reg delay_rdy;
    reg delay_ack;
    reg [3:0] delay_rdys;
    wire [3:0] delay_acks;
    
    wire [`TAG_SZ-1:0] mixed_tag;
    reg mixed_rdy;
    reg mixed_ack;
    reg [3:0] mixed_rdys;
    wire [3:0] mixed_acks;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("tree_node.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        rst <= 0;
        combo_ack <= 0;
        combo_rdys <= 0;
        delay_ack <= 0;
        delay_rdys <= 0;
        mixed_ack <= 0;
        mixed_rdys <= 0;
        
        fd = $fopen("tree_node_drivers.mem", "r");
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
        
        #200
        $finish;
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        
        //Try a simple test: fuzzing
        combo_rdys = $random; //Note use of blocking assignment
        combo_ack = $random;
        
        delay_rdys = combo_rdys;
        delay_ack = combo_ack;
        
        mixed_rdys = combo_rdys;
        mixed_ack = combo_ack;
        
        //#0.01
        //dummy = $fscanf(fd, "%F%O%R%M%A%T", /* list of variables */);
    end

    //Combo test
    wire [`TAG_SZ-1:0] node_left_combo_tag;
    wire node_left_combo_rdy;
    wire node_left_combo_ack;
    
    wire [`TAG_SZ-1:0] node_right_combo_tag;
    wire node_right_combo_rdy;
    wire node_right_combo_ack;
    
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(0)
    ) node_left_combo (
        .clk(clk),
        .rst(rst),
        .left_tag(5'd1),
        .left_rdy(combo_rdys[0]),
        .left_ack(combo_acks[0]),
        .right_tag(5'd2),
        .right_rdy(combo_rdys[1]),
        .right_ack(combo_acks[1]),
        .tag(node_left_combo_tag),
        .rdy(node_left_combo_rdy),
        .ack(node_left_combo_ack)
    );
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(0)
    ) node_right_combo (
        .clk(clk),
        .rst(rst),
        .left_tag(5'd3),
        .left_rdy(combo_rdys[2]),
        .left_ack(combo_acks[2]),
        .right_tag(5'd4),
        .right_rdy(combo_rdys[3]),
        .right_ack(combo_acks[3]),
        .tag(node_right_combo_tag),
        .rdy(node_right_combo_rdy),
        .ack(node_right_combo_ack)
    );
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(0)
    ) node_root_combo (
        .clk(clk),
        .rst(rst),
        .left_tag(node_left_combo_tag),
        .left_rdy(node_left_combo_rdy),
        .left_ack(node_left_combo_ack),
        .right_tag(node_right_combo_tag),
        .right_rdy(node_right_combo_rdy),
        .right_ack(node_right_combo_ack),
        .tag(combo_tag),
        .rdy(combo_rdy),
        .ack(combo_ack)
    );
    
    //Delay test
    //Don't worry, I used find+replace to change "combo" to "delay"
    wire [`TAG_SZ-1:0] node_left_delay_tag;
    wire node_left_delay_rdy;
    wire node_left_delay_ack;
    
    wire [`TAG_SZ-1:0] node_right_delay_tag;
    wire node_right_delay_rdy;
    wire node_right_delay_ack;
    
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(1)
    ) node_left_delay (
        .clk(clk),
        .rst(rst),
        .left_tag(5'd1),
        .left_rdy(delay_rdys[0]),
        .left_ack(delay_acks[0]),
        .right_tag(5'd2),
        .right_rdy(delay_rdys[1]),
        .right_ack(delay_acks[1]),
        .tag(node_left_delay_tag),
        .rdy(node_left_delay_rdy),
        .ack(node_left_delay_ack)
    );
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(1)
    ) node_right_delay (
        .clk(clk),
        .rst(rst),
        .left_tag(5'd3),
        .left_rdy(delay_rdys[2]),
        .left_ack(delay_acks[2]),
        .right_tag(5'd4),
        .right_rdy(delay_rdys[3]),
        .right_ack(delay_acks[3]),
        .tag(node_right_delay_tag),
        .rdy(node_right_delay_rdy),
        .ack(node_right_delay_ack)
    );
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(1)
    ) node_root_delay (
        .clk(clk),
        .rst(rst),
        .left_tag(node_left_delay_tag),
        .left_rdy(node_left_delay_rdy),
        .left_ack(node_left_delay_ack),
        .right_tag(node_right_delay_tag),
        .right_rdy(node_right_delay_rdy),
        .right_ack(node_right_delay_ack),
        .tag(delay_tag),
        .rdy(delay_rdy),
        .ack(delay_ack)
    );
    
    //Mixed test
    wire [`TAG_SZ-1:0] node_left_mixed_tag;
    wire node_left_mixed_rdy;
    wire node_left_mixed_ack;
    
    wire [`TAG_SZ-1:0] node_right_mixed_tag;
    wire node_right_mixed_rdy;
    wire node_right_mixed_ack;
    
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(1)
    ) node_left_mixed (
        .clk(clk),
        .rst(rst),
        .left_tag(5'd1),
        .left_rdy(mixed_rdys[0]),
        .left_ack(mixed_acks[0]),
        .right_tag(5'd2),
        .right_rdy(mixed_rdys[1]),
        .right_ack(mixed_acks[1]),
        .tag(node_left_mixed_tag),
        .rdy(node_left_mixed_rdy),
        .ack(node_left_mixed_ack)
    );
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(0)
    ) node_right_mixed (
        .clk(clk),
        .rst(rst),
        .left_tag(5'd3),
        .left_rdy(mixed_rdys[2]),
        .left_ack(mixed_acks[2]),
        .right_tag(5'd4),
        .right_rdy(mixed_rdys[3]),
        .right_ack(mixed_acks[3]),
        .tag(node_right_mixed_tag),
        .rdy(node_right_mixed_rdy),
        .ack(node_right_mixed_ack)
    );
    tree_node # (
        .TAG_SZ(`TAG_SZ),
        .ENABLE_DELAY(0)
    ) node_root_mixed (
        .clk(clk),
        .rst(rst),
        .left_tag(node_left_mixed_tag),
        .left_rdy(node_left_mixed_rdy),
        .left_ack(node_left_mixed_ack),
        .right_tag(node_right_mixed_tag),
        .right_rdy(node_right_mixed_rdy),
        .right_ack(node_right_mixed_ack),
        .tag(mixed_tag),
        .rdy(mixed_rdy),
        .ack(mixed_ack)
    );
endmodule
