//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
axistream_snooper.v

*/

`include "axistream_snooper.v"

`define SN_FWD_DATA_WIDTH   64
`define SN_FWD_ADDR_WIDTH   9
`define INC_WIDTH           3
`define PESS                0

module testbench_template;

    parameter KEEP_WIDTH = `SN_FWD_DATA_WIDTH/8;
    
    reg clk;
    reg rst;
    reg [`SN_FWD_DATA_WIDTH-1:0] sn_TDATA;
    reg [KEEP_WIDTH-1:0] sn_TKEEP;
    reg sn_TREADY;
    wire sn_bp_TREADY;
    reg sn_TVALID;
    reg sn_TLAST;
    wire [`SN_FWD_ADDR_WIDTH-1:0] sn_addr;
    wire [`SN_FWD_DATA_WIDTH-1:0] sn_wr_data;
    wire sn_wr_en;
    wire [`INC_WIDTH-1:0] sn_byte_inc;
    wire sn_done;
    //reg sn_done_ack;
    reg rdy_for_sn;
    wire rdy_for_sn_ack; //Yeah; I'm ready for a snack
    
    wire packet_dropped_inc;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("axistream_snooper.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        rst <= 0;
        
        sn_TDATA <= 0;
        sn_TKEEP <= 0;
        sn_TREADY <= 0;
        sn_TVALID <= 0;
        sn_TLAST <= 0;
        
        rdy_for_sn <= 0;
        
        fd = $fopen("axistream_snooper_drivers.mem", "r");
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
        dummy = $fscanf(fd, "%h%h%b%b%b%b", 
            sn_TDATA,
            sn_TKEEP,
            sn_TREADY,
            sn_TVALID,
            sn_TLAST,
            rdy_for_sn
        );
    end

    axistream_snooper # (
        .SN_FWD_DATA_WIDTH(`SN_FWD_DATA_WIDTH),
        .SN_FWD_ADDR_WIDTH(`SN_FWD_ADDR_WIDTH),
        .SN_INC_WIDTH     (`INC_WIDTH        ),
        .PESS             (`PESS             ),
        .ENABLE_BACKPRESSURE(1)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .sn_TDATA(sn_TDATA),
        .sn_TKEEP(sn_TKEEP),
        .sn_TREADY(sn_TREADY),
        .sn_bp_TREADY(sn_bp_TREADY),
        .sn_TVALID(sn_TVALID),
        .sn_TLAST(sn_TLAST),
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        //.sn_done_ack(sn_done_ack),
        .rdy_for_sn(rdy_for_sn),
        .rdy_for_sn_ack(rdy_for_sn_ack), //Yeah, I'm ready for a snack
        .packet_dropped_inc(packet_dropped_inc)
    );



endmodule
