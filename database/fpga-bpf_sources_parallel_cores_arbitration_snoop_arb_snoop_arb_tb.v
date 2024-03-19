//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
snoop_arb_tb.v

Does a simple test of the snoop arbitration. For now, I've left the tag tree as
combinational because it's easier to understand the outputs.

TODO: create an (understandable) testbench for non-combo tag_tree

NOTE: assumes that packetfilt_cores never go unready in the middle of a packet
TODO: Figure out the best place to add logic if ready drops in the middle, if 
      at all
*/

`ifdef FROM_SNOOP_ARB
`include "snoop_arb.v"
`endif

`define SN_ADDR_WIDTH   8
`define DATA_WIDTH      64
`define INC_WIDTH       8
`define N               4
`define TAG_SZ          5
`define DELAY_CONF      1

module snoop_arb_tb;
	reg clk;
    reg rst;
    
    //Interface to snooper
    reg [`SN_ADDR_WIDTH-1:0] addr;
    reg [`DATA_WIDTH-1:0] wr_data;
    reg wr_en;
    reg [`INC_WIDTH-1:0] byte_inc;
    reg done;
    reg ack;
    
    wire rdy;
    
    //Interface to packetfilter_cores
    reg [`N-1:0] rdy_for_sn;
    
    wire [`SN_ADDR_WIDTH-1:0] sn_addr;
    wire [`DATA_WIDTH-1:0] sn_wr_data;
    wire [`N-1:0] sn_wr_en;
    wire [`INC_WIDTH-1:0] sn_byte_inc;
    wire [`N-1:0] sn_done;
    wire [`N-1:0] rdy_for_sn_ack; 
    wire [`N-1-1:0] param_debug;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("snoop_arb.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;    
        rst <= 0;
        addr <= 0;
        wr_data <= 0;
        wr_en <= 0;
        byte_inc <= 0;
        done <= 0;
        ack <= 0;
        rdy_for_sn <= 0;
        
        fd = $fopen("snoop_arb_drivers.mem", "r");
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
        dummy = $fscanf(fd, "%b%b%b", rdy_for_sn, done, ack);
        addr = $random;
        wr_data = {$random, $random};
        wr_en = $random;
        byte_inc = $random & `INC_WIDTH'b1111;
    end

    snoop_arb # (
        .PACKMEM_ADDR_WIDTH (`SN_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH    (`DATA_WIDTH   ),
        .INC_WIDTH     (`INC_WIDTH    ),
        .N             (`N            ),
        .TAG_SZ        (`TAG_SZ       ),
        .DELAY_CONF    (`DELAY_CONF   ),
        .PESS(0)
    ) DUT (
        .clk(clk),
        .rst(rst),
            
        //Interface to snooper
        .addr(addr),
        .wr_data(wr_data),
        .wr_en(wr_en),
        .byte_inc(byte_inc),
        .done(done),
        .ack(ack),
        
        .rdy(rdy),
            
        //Interface to packetfilter_cores
        .rdy_for_sn(rdy_for_sn),
            
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        .rdy_for_sn_ack(rdy_for_sn_ack)
    );

endmodule
