//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

`ifdef FROM_MUXES
`include "muxes.v"
`endif

`define ADDR_WIDTH 9
`define DATA_WIDTH 64
`define INC_WIDTH 8
`define PLEN_WIDTH 32 

module muxes_tb;
    
    reg clk;
    
    reg [`ADDR_WIDTH-1:0] sn_addr;
    reg [`DATA_WIDTH-1:0] sn_data;
    reg [`INC_WIDTH-1:0] sn_bytes_inc;
    reg sn_wr_en;
    
    reg [`ADDR_WIDTH-1:0] cpu_addr;
    wire [`DATA_WIDTH-1:0] cpu_data;
    wire cpu_data_vld;
    reg cpu_rd_en;
    wire [`PLEN_WIDTH-1:0] cpu_len;
    reg cpu_reset_len;
    
    reg [`ADDR_WIDTH-1:0] fwd_addr;
    wire [`DATA_WIDTH-1:0] fwd_data;
    wire fwd_data_vld;
    reg fwd_rd_en;
    wire [`PLEN_WIDTH-1:0] fwd_len;
    reg fwd_reset_len;
    
    wire [`ADDR_WIDTH-1:0] ping_addr;
    wire [`DATA_WIDTH-1:0] ping_wr_data;
    reg [`DATA_WIDTH-1:0] ping_rd_data;
    reg ping_rd_data_vld;
    wire ping_rd_en;
    wire [`INC_WIDTH-1:0] ping_bytes_inc;
    wire ping_reset_len;
    wire ping_wr_en;
    reg [`PLEN_WIDTH-1:0] ping_len;
    
    wire [`ADDR_WIDTH-1:0] pang_addr;
    wire [`DATA_WIDTH-1:0] pang_wr_data;
    reg [`DATA_WIDTH-1:0] pang_rd_data;
    reg pang_rd_data_vld;
    wire pang_rd_en;
    wire [`INC_WIDTH-1:0] pang_bytes_inc;
    wire pang_reset_len;
    wire pang_wr_en;
    reg [`PLEN_WIDTH-1:0] pang_len;
    
    wire [`ADDR_WIDTH-1:0] pong_addr;
    wire [`DATA_WIDTH-1:0] pong_wr_data;
    reg [`DATA_WIDTH-1:0] pong_rd_data;
    reg pong_rd_data_vld;
    wire pong_rd_en;
    wire [`INC_WIDTH-1:0] pong_bytes_inc;
    wire pong_reset_len;
    wire pong_wr_en;
    reg [`PLEN_WIDTH-1:0] pong_len;
    
    reg [1:0] sn_sel;
    reg [1:0] cpu_sel;
    reg [1:0] fwd_sel;
    
    reg [1:0] ping_sel;
    reg [1:0] pang_sel;
    reg [1:0] pong_sel;
    
    integer fd;
    integer dummy;

    initial begin
        $dumpfile("muxes.vcd");
        $dumpvars;
        $dumplimit(1024000);
        
        clk <= 0;
        sn_addr <= 0;
        sn_data <= 0;
        sn_bytes_inc <= 0;
        sn_wr_en <= 0;
        
        cpu_addr <= 0;
        cpu_rd_en <= 0;
        cpu_reset_len <= 0;
        
        fwd_addr <= 0;
        fwd_rd_en <= 0;
        fwd_reset_len <= 0;
        
        ping_rd_data <= 0;
        ping_len <= 0;
        
        pang_rd_data <= 0;
        pang_len <= 0;
        
        pong_rd_data <= 0;
        pong_len <= 0;
        
        sn_sel <= 2'b10;
        cpu_sel <= 2'b00;
        fwd_sel <= 2'b11;
        
        ping_sel <= 2'b00;
        pang_sel <= 2'b01;
        pong_sel <= 2'b11;
        
        fd = $fopen("muxes_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open driver file");
            $finish;
        end
        
        while ($fgetc(fd) != "\n") begin end //Skip first line of comments
        
        #100
        sn_sel <= 2'b11;
        cpu_sel <= 2'b01;
        fwd_sel <= 2'b00;
        
        ping_sel <= 2'b10;
        pang_sel <= 2'b00;
        pong_sel <= 2'b01;
        
        #200
        $display("Quitting...");
        $finish;
    end

    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        ping_rd_data <= {$random, $random};
        ping_rd_data_vld <= $random;
        pang_rd_data <= {$random, $random};
        pang_rd_data_vld <= $random;
        pong_rd_data <= {$random, $random};
        pong_rd_data_vld <= $random;
        
        sn_addr <= $random;
        sn_data <= {$random, $random};
        cpu_reset_len <= $random;
        fwd_reset_len <= $random;
        cpu_addr <= $random;
        fwd_addr <= $random;
    end
    

    muxes # (
        .ADDR_WIDTH(`ADDR_WIDTH),
        .DATA_WIDTH(`DATA_WIDTH),
        .INC_WIDTH(`INC_WIDTH),
        .PLEN_WIDTH(`PLEN_WIDTH)
    ) DUT (
        //Inputs
        //Format is {addr, wr_data, wr_en, bytes_inc}
        .from_sn({sn_addr, sn_data, sn_wr_en, sn_bytes_inc}),
        //Format is {addr, reset_sig, rd_en}
        .from_cpu({cpu_addr, cpu_reset_len, cpu_rd_en}),
        .from_fwd({fwd_addr, fwd_reset_len, fwd_rd_en}),
        //Format is {rd_data, rd_data_vld, packet_len}
        .from_ping({ping_rd_data, ping_rd_data_vld, ping_len}),
        .from_pang({pang_rd_data, pang_rd_data_vld, pang_len}),
        .from_pong({pong_rd_data, pong_rd_data_vld, pong_len}),
        
        //Outputs
        //Nothing to output to snooper
        //Format is {rd_data, rd_data_vld, packet_len}
        .to_cpu({cpu_data, cpu_data_vld, cpu_len}),
        .to_fwd({fwd_data, fwd_data_vld, fwd_len}),
        //Format here is {addr, wr_data, wr_en, bytes_inc, reset_sig, rd_en}
        .to_ping({ping_addr, ping_wr_data, ping_wr_en, ping_bytes_inc, ping_reset_len, ping_rd_en}),
        .to_pang({pang_addr, pang_wr_data, pang_wr_en, pang_bytes_inc, pang_reset_len, pang_rd_en}),
        .to_pong({pong_addr, pong_wr_data, pong_wr_en, pong_bytes_inc, pong_reset_len, pong_rd_en}),
        
        //Selects
        .sn_sel(sn_sel),
        .cpu_sel(cpu_sel),
        .fwd_sel(fwd_sel),
        
        .ping_sel(ping_sel),
        .pang_sel(pang_sel),
        .pong_sel(pong_sel)
    );


endmodule
