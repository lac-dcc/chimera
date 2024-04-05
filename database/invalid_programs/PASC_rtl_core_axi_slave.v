// 
// Distributed under the MIT license.
// Copyright (c) 2017 Dave McCoy (dave.mccoy@cospandesign.com)
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// 

`include "axi_defines.v"

module axi_slave
    #(parameter DATA_WIDTH              = 32,
    parameter   MEMORY_MAP_SIZE         = 64 * 1024,
    parameter   STROBE_WIDTH            = (DATA_WIDTH / 8),
    parameter   AXI_ADDR_WIDTH          = $clog2(MEMORY_MAP_SIZE * 4),
    parameter   SLV_ADDR_WIDTH          = AXI_ADDR_WIDTH - $clog2(STROBE_WIDTH))
    
    (input                              s_axi_aclk,
    input                               s_axi_aresetn,

    //Write Address Channel
    input                               s_axi_awvalid,
    input       [AXI_ADDR_WIDTH - 1: 0] s_axi_awaddr,
    output  reg                         s_axi_awready,

    //Write Data Channel
    input                               s_axi_wvalid,
    input       [2:0]                   s_axi_awprot,
    input       [STROBE_WIDTH - 1:0]    s_axi_wstrb,
    input       [DATA_WIDTH - 1: 0]     s_axi_wdata,
    output  reg                         s_axi_wready,

    //Write Response Channel
    input                               s_axi_bready,
    output  reg                         s_axi_bvalid,
    output  reg [1:0]                   s_axi_bresp,

    //Read Address Channel
    input                               s_axi_arvalid,
    input       [AXI_ADDR_WIDTH - 1: 0] s_axi_araddr,
    output  reg                         s_axi_arready,

    //Read Data Channel
    input                               s_axi_rready,
    input       [2:0]                   s_axi_arprot,
    output  reg                         s_axi_rvalid,
    output  reg [1:0]                   s_axi_rresp,
    output  reg [DATA_WIDTH - 1: 0]     s_axi_rdata,


    //Unit Interface

    //Write Channel
    input                               unit_wack,
    input                               unit_invalid_waddr,
    output  reg                         unit_wen,
    output  reg [SLV_ADDR_WIDTH - 1: 0] unit_waddr,
    output  reg [DATA_WIDTH - 1: 0]     unit_wdata,

    //Read Channel
    input                               unit_rstrb,
    input                               unit_invalid_raddr,
    input       [DATA_WIDTH - 1: 0]     unit_rdata,
    output  reg                         unit_ren,
    output  reg [SLV_ADDR_WIDTH - 1: 0] unit_raddr);



    //local parameters
    localparam      WRITE_IDLE          = 2'h0;
    localparam      WRITE_WAIT          = 2'h1;
    localparam      WRITE_SENT_RESP     = 2'h2;

    localparam      READ_IDLE           = 2'h0;
    localparam      READ_WAIT           = 2'h1;
    localparam      READ_SENT_DATA      = 2'h2;

    //registes/wires
    reg   [1:0]                         state_write;
    reg   [1:0]                         state_read;

    //submodules
    //asynchronous logic


    //synchronous logic


    //Write channel implementation
    always @(posedge s_axi_aclk) begin
        if (s_axi_aresetn == 0) begin
            s_axi_wready            <=  0;
            s_axi_awready           <=  0;
            s_axi_bresp             <=  0;
            s_axi_bvalid            <=  0;
            unit_wen                <=  0;
            unit_waddr              <=  0;
            unit_wdata              <=  0;
            state_write             <=  WRITE_IDLE;
        end
        else begin
            case (state_write)
                WRITE_IDLE: begin
                    if (~s_axi_awready && ~s_axi_wready && s_axi_awvalid && s_axi_wvalid) begin
                        s_axi_awready       <=  1;
                        s_axi_wready        <=  1;
                        unit_wen            <=  1;
                        unit_wdata          <=  s_axi_wdata;
                        unit_waddr          <=  s_axi_awaddr[AXI_ADDR_WIDTH - 1: $clog2(STROBE_WIDTH)];
                        state_write         <=  WRITE_WAIT;
                    end
                    else begin
                        s_axi_awready       <=  0;
                        s_axi_wready        <=  0;
                    end
                end
                WRITE_WAIT: begin
                    s_axi_wready        <=  0;
                    s_axi_awready       <=  0;

                    if (unit_wack && ~s_axi_bvalid) begin
                        s_axi_bvalid        <=  1;
                        unit_wen            <=  0;
                        state_write         <=  WRITE_SENT_RESP;
                        
                        if (unit_invalid_waddr) begin
                            s_axi_bresp         <=  `AXI_RESP_DECERR;
                        end
                        else begin
                            s_axi_bresp         <=  `AXI_RESP_OKAY;
                        end
                    end
                end
                WRITE_SENT_RESP: begin
                    if (s_axi_bready && s_axi_bvalid) begin
                        s_axi_bvalid        <=  0;
                        state_write         <=  WRITE_IDLE;
                    end
                end
                default: begin
                    $display("AXI Lite Slave: Shouldn't have gotten here!");
                end
            endcase
        end
    end


    //Read channel implementation
    always @(posedge s_axi_aclk) begin
        if (s_axi_aresetn == 0) begin
            s_axi_arready           <=  0;
            s_axi_rvalid            <=  0;
            s_axi_rdata             <=  0;
            s_axi_rresp             <=  0;
            unit_ren                <=  0;
            unit_raddr              <=  0;
            state_read              <=  READ_IDLE;
        end
        else begin
            case (state_read)
                READ_IDLE: begin
                    if (~s_axi_arready && s_axi_arvalid) begin
                        s_axi_arready       <=  1;
                        unit_ren            <=  1;
                        unit_raddr          <=  s_axi_araddr[AXI_ADDR_WIDTH - 1: $clog2(STROBE_WIDTH)];
                        state_read          <=  READ_WAIT;
                    end
                end
                READ_WAIT: begin
                    s_axi_arready       <=  0;

                    if (unit_rstrb && ~s_axi_rvalid) begin
                        s_axi_rvalid        <=  1;
                        s_axi_rdata         <=  unit_rdata;
                        unit_ren            <=  0;
                        state_read          <=  READ_SENT_DATA;

                        if (unit_invalid_raddr) begin
                            s_axi_rresp         <=  `AXI_RESP_DECERR;
                        end
                        else begin
                            s_axi_rresp         <=  `AXI_RESP_OKAY;
                        end
                    end
                end
                READ_SENT_DATA: begin
                    if (s_axi_rready && s_axi_rvalid) begin
                        s_axi_rvalid        <=  0;
                        state_read          <=  READ_IDLE;
                    end
                end
                default: begin
                    $display("AXI Lite Slave: Shouldn't have gotten here!");
                end
            endcase
        end
    end
endmodule
