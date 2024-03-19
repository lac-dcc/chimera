//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

`ifdef FROM_CPU_ADAPTER
`include "cpu_adapter.v"
`endif

`define BYTE_ADDR_WIDTH 12
`define ADDR_WIDTH 10
`define DATA_WIDTH (2**(`BYTE_ADDR_WIDTH - `ADDR_WIDTH + 1)*8)


module cpu_adapter_tb;
    reg clk;
    reg rst;
    
    reg [`BYTE_ADDR_WIDTH-1:0] byte_rd_addr;
    reg cpu_rd_en;
    reg [1:0] transfer_sz;
    wire rd_en;
    wire [`ADDR_WIDTH-1:0] word_rd_addra;
    reg [`DATA_WIDTH-1:0] bigword;
    reg bigword_vld;
    wire [31:0] resized_mem_data;
    wire resized_mem_data_vld;

    integer fd;
    integer dummy;

    initial begin
        $dumpfile("cpu_adapter.vcd");
        $dumpvars;
        $dumplimit(1024000);
            
        clk <= 0;
        rst <= 0;
        byte_rd_addr <= 'hd;
        cpu_rd_en <= 0;
        transfer_sz <= 0;
        bigword <= 0;
        
        fd = $fopen("cpu_adapter_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        while($fgetc(fd) != "\n") begin end //Skip first line of comments
        
        #2000 $finish;
    end

    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        #0.01
        dummy = $fscanf(fd, "%h%b%b%h%b", byte_rd_addr, cpu_rd_en, transfer_sz, bigword, bigword_vld);
    end
    
    cpu_adapter # (
        .BYTE_ADDR_WIDTH(`BYTE_ADDR_WIDTH), 
        .ADDR_WIDTH(`ADDR_WIDTH),
        .BUF_IN(1),
        .BUF_OUT(1),
        .PESS(1)
    ) DUT (
        .clk(clk),
        .rst(rst),
        
        .byte_rd_addr(byte_rd_addr), 
        .cpu_rd_en(cpu_rd_en), 
        .transfer_sz(transfer_sz), 
        
        .rd_en(rd_en), 
        .word_rd_addra(word_rd_addra), 
        
        .bigword(bigword),
        .bigword_vld(bigword_vld),
        .resized_mem_data(resized_mem_data),
        .resized_mem_data_vld(resized_mem_data_vld)
    );

endmodule
