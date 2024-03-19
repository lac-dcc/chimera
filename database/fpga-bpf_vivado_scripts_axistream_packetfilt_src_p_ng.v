//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
p_ng.v
------
One of the ping/pang/pong buffers.

This core has several parameters, which will influence the schedule:
    BUF_IN: if true, inputs are buffered for a cycle
    BUF_OUT: if true, outputs are buffered for a cycle


CONVENTIONS
-----------
x_i means "internal x"
x_r meand "registered x"
Modules are structured as:
    forward declarations and localparams
    input buffering (if necessary)
    actual logic (which may have internal buffering)
    output buffering (if necessary
*/
`ifdef FROM_CONTROLLER
`include "../../../../generic/dp_bram/dp_bram.v"
`elsif FROM_P_NG
`include "../../../../generic/dp_bram/dp_bram.v"
`elsif FROM_BPFCPU
`include "../../../generic/dp_bram/dp_bram.v"
`elsif FROM_P3
`include "../../../generic/dp_bram/dp_bram.v"
`elsif FROM_PACKETFILTER_CORE
`include "../../generic/dp_bram/dp_bram.v"
`elsif FROM_PARALLEL_CORES
`include "../generic/dp_bram/dp_bram.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "generic/dp_bram/dp_bram.v"
`else /* For Vivado */
`endif


//The actual module we're after is here
module p_ng # (
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 64,
    parameter INC_WIDTH = 8,
    parameter PLEN_WIDTH = 32,
    //parameters controlling addition of pessmistic registers
    parameter BUF_IN = 0,
    parameter BUF_OUT = 0
) (
    input wire clk,
    input wire rst, //Note: does not actually change the stored memory
    input wire rd_en, //@0
    input wire wr_en, //@0
    input wire [ADDR_WIDTH-1:0] addr, //@0
    input wire [DATA_WIDTH-1:0] idata, //@0
    input wire [INC_WIDTH-1:0] byte_inc, //@0
    output wire [DATA_WIDTH-1:0] odata, //@1 + BUF_IN + BUF_OUT
    output wire odata_vld,
    output wire [PLEN_WIDTH-1:0] byte_length //@1 + BUF_IN + BUF_OUT
);

    //Width of each port is half the total width
    localparam PORT_WIDTH = (DATA_WIDTH>>1);


    //Real quick, let's get the length logic out of the way:
`ifndef ICARUS_VERILOG
    (* dont_touch = "true" *)
`endif
    reg [31:0] byte_length_i = 0;
    always @(posedge clk) begin
        if (!rst) begin
            if (wr_en) begin
                byte_length_i <= byte_length_i + byte_inc;
            end else begin
                byte_length_i <= byte_length_i;
            end
        end else begin
            byte_length_i <= 0;
        end
    end
    
    assign byte_length = byte_length_i;
    
    /************************************/
    /**Forward-declare internal signals**/
    /************************************/
    wire rd_en_i;
    wire wr_en_i; 
    wire [ADDR_WIDTH-1:0] addr_i; 
    wire [DATA_WIDTH-1:0] idata_i;
    wire [DATA_WIDTH-1:0] odata_i;
    reg odata_vld_i;
    
    /***************************************/
    /**Assign internal signals from inputs**/
    /***************************************/
    
    //Select whether the inputs are buffered or not
generate
    if (BUF_IN) begin
        reg rd_en_r = 0;                     
        reg wr_en_r = 0;                     
        reg [ADDR_WIDTH-1:0] addr_r = 0;
        reg [DATA_WIDTH-1:0] idata_r = 0;
        
        always @(posedge clk) begin
            if (!rst) begin
                wr_en_r <= wr_en;
            end else begin
                wr_en_r <= 0;
            end
            rd_en_r <= rd_en;
            addr_r <= addr;
            idata_r <= idata;
        end
        
        assign rd_en_i = rd_en_r;
        assign wr_en_i = wr_en_r;
        assign addr_i = addr_r;
        assign idata_i = idata_r;
        
    end else begin
        assign rd_en_i = rd_en;
        assign wr_en_i = wr_en;
        assign addr_i = addr;
        assign idata_i = idata;
    end
endgenerate

    /****************/
    /**Do the logic**/
    /****************/

    wire [ADDR_WIDTH-1:0] addrb;
    assign addrb = addr_i + 1;

    //Now instantiate the BRAM
    dp_bram # (
        .ADDR_WIDTH(ADDR_WIDTH),
        .PORT_WIDTH(PORT_WIDTH)
    ) mem (
        .clk(clk),
        
        .en(rd_en_i || wr_en_i), //@0
        
        .addra(addr_i), //@0
        .addrb(addrb), //@0

        .dia(idata_i[DATA_WIDTH-1:PORT_WIDTH]), //@0
        .dib(idata_i[PORT_WIDTH-1:0]), //@0
        .wr_ena(wr_en_i), //@0
        .wr_enb(wr_en_i), //@0
        
        .doa(odata_i[DATA_WIDTH-1:PORT_WIDTH]), //@1
        .dob(odata_i[PORT_WIDTH-1:0]) //@1
    );
    
    //BRAM has a latency of one cycle
    always @(posedge clk) begin
        if (rst) begin
            odata_vld_i <= 0;
        end else begin
            odata_vld_i <= rd_en_i;
        end
    end
    
    /****************************************/
    /**Assign outputs from internal signals**/
    /****************************************/
    
    //Select whether the outputs are buffered or not
generate
    if (BUF_OUT) begin
        reg [DATA_WIDTH-1:0] odata_r = 0;
        reg odata_vld_r = 0;
        
        always @(posedge clk) begin
            if (!rst) begin
                odata_vld_r <= odata_vld_i;
            end else begin
                odata_vld_r <= 0;
            end
            odata_r <= odata_i;
        end
        
        assign odata = odata_r;
        assign odata_vld = odata_vld_r;
        
    end else begin
        assign odata = odata_i;
        assign odata_vld = odata_vld_i;
    end
endgenerate

endmodule
