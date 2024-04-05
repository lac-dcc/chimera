//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

`include "fwd_width_adapter.v"


`ifdef ICARUS_VERILOG
`define localparam parameter
`else /* For Vivado */
`define localparam localparam
`endif

module fwd_width_adapter_tb # (
    parameter MEM_WIDTH = 64,
    parameter FWD_WIDTH = 32,
    parameter MEM_ADDR_WIDTH = 9,
    parameter FWD_ADDR_WIDTH = 10,
    parameter MEM_LAT = 3
) ();

    reg clk = 0;
    
    //Interface to forwarder
    reg [FWD_ADDR_WIDTH-1:0] fwd_addr = 0;
    wire [FWD_WIDTH-1:0] fwd_rd_data;
    
    //Interface to packet mem
    wire [MEM_ADDR_WIDTH-1:0] mem_addr;
    wire [MEM_WIDTH-1:0] mem_rd_data;
    wire mem_rd_data_vld;
    
    reg rd_en = 0;
    always @(posedge clk) rd_en <= $random;
    
    integer fd, dummy, i;
    
    initial begin
        $dumpfile("fwd_width_adapter.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        //Controlled test
        for (i = 0; i < 16; i = i + 1) begin
            @(posedge clk);
            if(rd_en) begin
                fwd_addr <= i;
            end else begin
                i = i - 1;
            end
        end
        
        //Fuzz test
        repeat(40) begin
            @(posedge clk);
            fwd_addr <= $random;
        end
        
        #1000 $finish;
    end
    
    always #5 clk <= ~clk;

    fwd_width_adapter # (
		.MEM_WIDTH(MEM_WIDTH),
		.FWD_WIDTH(FWD_WIDTH),
		.MEM_ADDR_WIDTH(MEM_ADDR_WIDTH),
		.FWD_ADDR_WIDTH(FWD_ADDR_WIDTH),
		.MEM_LAT(MEM_LAT)
    ) DUT (
		.clk(clk),
        
        //Interface to forwarder
		.fwd_addr(fwd_addr),
		.fwd_rd_data(fwd_rd_data),
        
        //Interface to packet mem
		.mem_addr(mem_addr),
		.mem_rd_data(mem_rd_data)
    );
    
    fakemem # (
        .ADDR_WIDTH(MEM_ADDR_WIDTH),
        .DATA_WIDTH(MEM_WIDTH),
        .MEM_LAT(MEM_LAT)
    ) phony (
        .clk(clk),
        
        .addr(mem_addr),
        .rd_en(rd_en),
        
        .data(mem_rd_data),
        .data_vld(mem_rd_data_vld)
    );

endmodule

module fakemem # (
    parameter ADDR_WIDTH = 9,
    parameter DATA_WIDTH = 64,
    parameter MEM_LAT = 1
) (
    input wire clk,
    
    input wire [ADDR_WIDTH - 1:0] addr,
    input wire rd_en,
    
    output wire [DATA_WIDTH -1:0] data,
    output wire data_vld
);
    
    `localparam MEM_DEPTH = 2**ADDR_WIDTH * DATA_WIDTH;
    reg [0: MEM_DEPTH -1] mem;
    genvar i;
generate for (i = 0; i < MEM_DEPTH/8; i = i + 1) begin
    initial mem[8*(i+1) -1 -: 8] = i & 8'hFF;
end endgenerate
    
    //Delay rd_en to produce data_vld signal
    reg rd_en_r[0: MEM_LAT -1];
    always @(posedge clk) rd_en_r[0] <= rd_en;
generate for (i = 1; i < MEM_LAT; i = i + 1) begin
    always @(posedge clk) rd_en_r[i] <= rd_en_r[i - 1];
end endgenerate
    
    //Pretend to be memory with the proper latency
    reg [DATA_WIDTH -1:0] data_r[0: MEM_LAT - 1];
    always @(posedge clk) data_r[0] <= mem[DATA_WIDTH*(addr+1)-1 -: DATA_WIDTH];
generate for (i = 1; i < MEM_LAT; i = i + 1) begin
    always @(posedge clk) data_r[i] <= data_r[i - 1];
end endgenerate
    
    //Assign outputs
    assign data = data_r[MEM_LAT - 1];
    assign data_vld = rd_en_r[MEM_LAT - 1];
    
endmodule

`undef localparam
