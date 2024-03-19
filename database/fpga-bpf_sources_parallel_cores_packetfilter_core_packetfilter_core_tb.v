//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
testbench_template.v

Replace innards with desired logic
*/

`ifdef FROM_PACKETFILTER_CORE
`include "packetfilter_core.v"
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


`define PACKET_MEM_BYTES    2048
`define INST_MEM_DEPTH      512
`define PACKMEM_DATA_WIDTH   64
`define BUF_IN              0
`define BUF_OUT             0
`define PESS                0

module packetfilter_core_tb;

    parameter CODE_ADDR_WIDTH = `CLOG2(`INST_MEM_DEPTH);
    parameter CODE_DATA_WIDTH = 64;
    
    parameter BYTE_ADDR_WIDTH = `CLOG2(`PACKET_MEM_BYTES);
    parameter PACKMEM_ADDR_WIDTH = BYTE_ADDR_WIDTH - `CLOG2(`PACKMEM_DATA_WIDTH/8);
    
    parameter INC_WIDTH = `CLOG2(`PACKMEM_DATA_WIDTH/8)+1;
    
    parameter PLEN_WIDTH = 32;

    reg clk;
    reg rst;
    reg [PACKMEM_ADDR_WIDTH-1:0] sn_addr;
    reg [`PACKMEM_DATA_WIDTH-1:0] sn_wr_data;
    reg sn_wr_en;
    reg [INC_WIDTH-1:0] sn_byte_inc;
    reg sn_done;
    wire rdy_for_sn;
    reg rdy_for_sn_ack; //Yeah, I'm ready for a snack
    reg [PACKMEM_ADDR_WIDTH-1:0] fwd_addr;
    reg fwd_rd_en;
    wire [`PACKMEM_DATA_WIDTH-1:0] fwd_rd_data;
    wire fwd_rd_data_vld;
    wire [PLEN_WIDTH-1:0] fwd_byte_len;
    reg fwd_done;
    wire rdy_for_fwd;
    reg rdy_for_fwd_ack;
    reg [CODE_ADDR_WIDTH-1:0] inst_wr_addr;
    reg [CODE_DATA_WIDTH-1:0] inst_wr_data;
    reg inst_wr_en;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("packetfilter_core.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        rst <= 1;
        
        //fd = $fopen("counting_drivers.mem", "r");
        fd = $fopen("packetfilter_core_drivers.mem", "r");
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
        dummy = $fscanf(fd, "%b%h%h%b%h%h%b%h%b%b%h%b%b%b", 
            rst,
            
            inst_wr_addr,
            inst_wr_data,
            inst_wr_en,
            
            sn_addr,
            sn_wr_data,
            sn_wr_en,
            sn_byte_inc,
            sn_done,
            rdy_for_sn_ack,
            
            fwd_addr,
            fwd_rd_en,
            fwd_done,
            rdy_for_fwd_ack
        );
    end

    
    packetfilter_core # (
        .PACKET_MEM_BYTES  (`PACKET_MEM_BYTES ),
        .INST_MEM_DEPTH    (`INST_MEM_DEPTH   ),
        .PACKMEM_DATA_WIDTH (`PACKMEM_DATA_WIDTH),
        .BUF_IN            (`BUF_IN           ),
        .BUF_OUT           (`BUF_OUT          ),
        .PESS              (`PESS             )
    ) DUT (
        .clk(clk),
        .rst(rst),
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        .rdy_for_sn(rdy_for_sn),
        .rdy_for_sn_ack(rdy_for_sn_ack),
        .fwd_addr(fwd_addr),
        .fwd_rd_en(fwd_rd_en),
        .fwd_rd_data(fwd_rd_data),
        .fwd_rd_data_vld(fwd_rd_data_vld),
        .fwd_byte_len(fwd_byte_len),
        .fwd_done(fwd_done),
        .rdy_for_fwd(rdy_for_fwd),
        .rdy_for_fwd_ack(rdy_for_fwd_ack),
        .inst_wr_addr(inst_wr_addr),
        .inst_wr_data(inst_wr_data),
        .inst_wr_en(inst_wr_en)
    );



endmodule
