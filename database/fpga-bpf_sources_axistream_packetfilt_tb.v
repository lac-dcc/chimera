//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
axistream_packetfilt_tb.v

Just forces the inst_addr, inst_data, and inst_rd_en ports to avoid dealing with
a simulation of AXI Lite
*/

`ifdef FROM_AXISTREAM_PACKETFILT
`include "axistream_packetfilt.v"
`define USING_ICARUS
`endif

`define CLOG2(x) (\
   (((x) <= 2) ? 1 : \
   (((x) <= 4) ? 2 : \
   (((x) <= 8) ? 3 : \
   (((x) <= 16) ? 4 : \
   (((x) <= 32) ? 5 : \
   (((x) <= 64) ? 6 : \
   (((x) <= 128) ? 7 : \
   (((x) <= 256) ? 8 : \
   (((x) <= 512) ? 9 : \
   (((x) <= 1024) ? 10 : \
   (((x) <= 2048) ? 11 : \
   (((x) <= 4096) ? 12 : \
   (((x) <= 8192) ? 13 : \
   (((x) <= 16384) ? 14 : \
   (((x) <= 32768) ? 15 : \
   (((x) <= 65536) ? 16 : \
   -1)))))))))))))))))


`define N                   4
`define PACKET_MEM_BYTES    2048
`define INST_MEM_DEPTH      512
`define SN_FWD_DATA_WIDTH   64
`define BUF_IN              1
`define BUF_OUT             1
`define PESS                1
`define ENABLE_BACKPRESSURE 1


`define KEEP_WIDTH (`SN_FWD_DATA_WIDTH/8)
`define CODE_ADDR_WIDTH (`CLOG2(`INST_MEM_DEPTH))
`define CODE_DATA_WIDTH 64

module axistream_packetfilt_tb;

    reg clk;
    reg rst;

    
    //AXI stream snoop interface
    reg [`SN_FWD_DATA_WIDTH-1:0] sn_TDATA = 0;
    reg [`KEEP_WIDTH-1:0] sn_TKEEP = 0;
    reg sn_TREADY = 0;
    wire sn_bp_TREADY;
    reg sn_TVALID = 0;
    reg sn_TLAST = 0;
    
    wire [15:0] num_packets_dropped;

    //AXI Stream forwarder interface
    wire [`SN_FWD_DATA_WIDTH-1:0] fwd_TDATA;
    wire [`KEEP_WIDTH-1:0] fwd_TKEEP;
    wire fwd_TLAST;
    wire fwd_TVALID;
    reg fwd_TREADY = 0;

    reg [`CODE_ADDR_WIDTH-1:0] inst_wr_addr = 0;
    reg [`CODE_DATA_WIDTH-1:0] inst_wr_data = 0;
    reg inst_wr_en = 0;   
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("axistream_packetfilt.vcd");
        $dumpvars;
        $dumplimit(5120000);
        
        clk <= 0;
        rst <= 0;
        force DUT.control_start = 1;
        
        fd = $fopen("axistream_packetfilt_drivers.mem", "r");
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
        dummy = $fscanf(fd, "%h%h%b%b%b%b%d%h%b",
            sn_TDATA,
            sn_TKEEP,
            sn_TREADY,
            sn_TVALID,
            sn_TLAST,
            fwd_TREADY,
            inst_wr_addr,
            inst_wr_data,
            inst_wr_en
        );
        
        force DUT.inst_wr_addr = inst_wr_addr;
        force DUT.inst_wr_data = inst_wr_data;
        force DUT.inst_wr_en = inst_wr_en;
        //$display("addr:%x data:%x en:%b", inst_wr_addr, inst_wr_data, inst_wr_en);
        
    end

    axistream_packetfilt # (
            .N                  (`N                 ),
            .PACKET_MEM_BYTES   (`PACKET_MEM_BYTES  ),
            .INST_MEM_DEPTH     (`INST_MEM_DEPTH    ),
            .SN_FWD_DATA_WIDTH  (`SN_FWD_DATA_WIDTH ),
            .BUF_IN             (`BUF_IN            ),
            .BUF_OUT            (`BUF_OUT           ),
            .PESS               (`PESS              ),
            .ENABLE_BACKPRESSURE(`ENABLE_BACKPRESSURE)
    ) DUT (
        .clk(clk),
        .rst(rst),


        //AXI stream snoop interface
        .sn_TDATA(sn_TDATA),
        .sn_TKEEP(sn_TKEEP),
        .sn_TREADY(sn_TREADY),
        .sn_bp_TREADY(sn_bp_TREADY),
        .sn_TVALID(sn_TVALID),
        .sn_TLAST(sn_TLAST),


        //AXI Stream forwarder interface
        .fwd_TDATA(fwd_TDATA),
        .fwd_TKEEP(fwd_TKEEP),
        .fwd_TLAST(fwd_TLAST),
        .fwd_TVALID(fwd_TVALID),
        .fwd_TREADY(fwd_TREADY),
        
        //Debug outputs
        .num_packets_dropped(num_packets_dropped)
    );


endmodule
