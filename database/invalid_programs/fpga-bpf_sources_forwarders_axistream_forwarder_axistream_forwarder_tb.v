//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
axistream_forwarder_tb.v

Simple testbench for the forwarder
*/

`include "axistream_forwarder.v"

`define SN_FWD_ADDR_WIDTH   8
`define SN_FWD_DATA_WIDTH   64
`define PLEN_WIDTH          32
        
module axistream_forwarder_tb;
    reg clk;
    reg rst = 0;
    
    //AXI Stream interface
    wire [`SN_FWD_DATA_WIDTH-1:0] fwd_TDATA;
    wire [`SN_FWD_DATA_WIDTH/8-1:0] fwd_TKEEP;
    wire fwd_TLAST;
    wire fwd_TVALID;
    reg fwd_TREADY = 1;
    
    //Interface to parallel_cores
    wire [`SN_FWD_ADDR_WIDTH-1:0] fwd_addr;
    wire fwd_rd_en;
    reg [`SN_FWD_DATA_WIDTH-1:0] fwd_rd_data = 0;
    //reg fwd_rd_data_vld = 0;
    wire fwd_rd_data_vld;
    reg [`PLEN_WIDTH-1:0] fwd_byte_len = 'd40;
    
    wire fwd_done;
    reg rdy_for_fwd = 1;
    wire rdy_for_fwd_ack;
    
    integer fd, dummy;
    
    
    //Very simple model of the filter memory
    `define LATENCY 4
    wire [`LATENCY-1:0] delayed_rd_en;
    assign delayed_rd_en[0] = fwd_rd_en;
    always @(posedge clk) begin
        fwd_rd_data <= {$random, $random};
    end
    genvar i;
    for (i = 1; i < `LATENCY; i = i + 1) begin
        reg delayed = 0;
        always @(posedge clk) begin
            delayed <= delayed_rd_en[i - 1];
        end
        assign delayed_rd_en[i] = delayed;
    end
    assign fwd_rd_data_vld = delayed_rd_en[`LATENCY - 1];
    
    always @(posedge clk) begin
        if (fwd_done) begin
            fwd_byte_len <= 16 + ($random & 32'b111111);
        end
    end
    
    always @(posedge clk) begin
        fwd_TREADY <= $random;
    end
    
    initial begin
        $dumpfile("axistream_forwarder.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        
        fd = $fopen("axistream_forwarder_drivers.mem", "r");
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
        
        #600
        $finish;
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        
        //#0.01
        //dummy = $fscanf(fd, "%F%O%R%M%A%T", /* list of variables */);
    end

    axistream_forwarder # (
        .SN_FWD_ADDR_WIDTH(`SN_FWD_ADDR_WIDTH),
        .SN_FWD_DATA_WIDTH(`SN_FWD_DATA_WIDTH),
        .PLEN_WIDTH(`PLEN_WIDTH)
    ) DUT (
        .clk(clk),
        .rst(rst),

        //AXI Stream interface
        .fwd_TDATA(fwd_TDATA),
        .fwd_TKEEP(fwd_TKEEP),
        .fwd_TLAST(fwd_TLAST),
        .fwd_TVALID(fwd_TVALID),
        .fwd_TREADY(fwd_TREADY),

        //Interface to parallel_cores
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
