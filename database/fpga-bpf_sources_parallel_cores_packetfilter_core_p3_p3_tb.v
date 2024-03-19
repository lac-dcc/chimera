//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

`ifdef FROM_P3
`include "p3.v"
`endif

`define PACKMEM_ADDR_WIDTH 9
`define PACKMEM_DATA_WIDTH 64
`define BYTE_ADDR_WIDTH 12
`define INC_WIDTH 8
`define PLEN_WIDTH 32
`define BUF_IN 0
`define BUF_OUT 0
`define PESS 0

module p3_tb;

    reg clk;
    reg rst;
    reg [`PACKMEM_ADDR_WIDTH-1:0] sn_addr;
    reg [`PACKMEM_DATA_WIDTH-1:0] sn_wr_data;
    reg sn_wr_en;
    reg [`INC_WIDTH-1:0] sn_byte_inc;
    reg sn_done;
    wire rdy_for_sn;
    reg rdy_for_sn_ack; //Yeah, I'm ready for a snack
    reg [`BYTE_ADDR_WIDTH-1:0] byte_rd_addr;
    reg cpu_rd_en;
    reg [1:0] transfer_sz;
    wire [31:0] resized_mem_data;
    wire resized_mem_data_vld;
    wire [`PLEN_WIDTH-1:0] cpu_byte_len;
    reg cpu_acc;
    reg cpu_rej;
    wire rdy_for_cpu;
    reg rdy_for_cpu_ack;
    reg [`PACKMEM_ADDR_WIDTH-1:0] fwd_addr;
    reg fwd_rd_en;
    wire [`PACKMEM_DATA_WIDTH-1:0] fwd_rd_data;
    wire fwd_rd_data_vld;
    wire [`PLEN_WIDTH-1:0] fwd_byte_len;
    reg fwd_done;
    wire rdy_for_fwd;
    reg rdy_for_fwd_ack;
    
    integer fd, dummy;
    
    reg [31:0] MAX = 32'd8192;
    
    initial begin
        $dumpfile("p3.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        rst <= 0;
        
        sn_addr <= 0;
        sn_wr_data <= 0;
        sn_wr_en <= 0;
        sn_byte_inc <= 0;
        sn_done <= 0;
        rdy_for_sn_ack <= 0; //Yeah, I'm ready for a snack
        
        byte_rd_addr <= 0;
        cpu_rd_en <= 0;
        transfer_sz <= 0;
        cpu_acc <= 0;
        cpu_rej <= 0;
        rdy_for_cpu_ack <= 0;
        
        fwd_addr <= 0;
        fwd_rd_en <= 0;
        fwd_done <= 0;
        rdy_for_fwd_ack <= 0;
        
        fd = $fopen("p3_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        
        //Skip first line of comments, to a maximum of MAX chars
        while ($fgetc(fd) != "\n") begin
            MAX = MAX - 1;
        end
        
        if (MAX == 0) begin
            $display("Driver file is empty");
            $finish;
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
        
        dummy = $fscanf(fd, "%x%x%b%x%b%b",
            sn_addr,
            sn_wr_data,
            sn_wr_en,
            sn_byte_inc,
            sn_done,
            rdy_for_sn_ack
        );
        
        dummy = $fscanf(fd, "%x%b%b%b%b%b",
            byte_rd_addr,
            cpu_rd_en,
            transfer_sz,
            cpu_acc,
            cpu_rej,
            rdy_for_cpu_ack
        );
        
        dummy = $fscanf(fd, "%x%b%b%b",
            fwd_addr,
            fwd_rd_en,
            fwd_done,
            rdy_for_fwd_ack
        );
    end
    
    p3 # (
        .PACKMEM_ADDR_WIDTH(`PACKMEM_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(`PACKMEM_DATA_WIDTH),
        .INTERNAL_ADDR_WIDTH(`PACKMEM_ADDR_WIDTH + 1),
        .BYTE_ADDR_WIDTH(`BYTE_ADDR_WIDTH),
        .INC_WIDTH(`INC_WIDTH),
        .PLEN_WIDTH(`PLEN_WIDTH),
        .BUF_IN(`BUF_IN),
        .BUF_OUT(`BUF_OUT),
        .PESS(`PESS)
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
        .byte_rd_addr(byte_rd_addr),
        .cpu_rd_en(cpu_rd_en),
        .transfer_sz(transfer_sz),
        .resized_mem_data(resized_mem_data),
        .resized_mem_data_vld(resized_mem_data_vld),
        .cpu_byte_len(cpu_byte_len),
        .cpu_acc(cpu_acc),
        .cpu_rej(cpu_rej),
        .rdy_for_cpu(rdy_for_cpu),
        .rdy_for_cpu_ack(rdy_for_cpu_ack),
        .fwd_addr(fwd_addr),
        .fwd_rd_en(fwd_rd_en),
        .fwd_rd_data(fwd_rd_data),
        .fwd_rd_data_vld(fwd_rd_data_vld),
        .fwd_byte_len(fwd_byte_len),
        .fwd_done(fwd_done),
        .rdy_for_fwd(rdy_for_fwd),
        .rdy_for_fwd_ack(rdy_for_fwd_ack)
    );



endmodule
