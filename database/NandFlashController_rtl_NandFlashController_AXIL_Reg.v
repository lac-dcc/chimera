// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

/*

Copyright (c) 2018 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * AXI4-Lite RAM
 */
module NandFlashController_AXIL_Reg #
(
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 16,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Extra pipeline register on output
    parameter PIPELINE_OUTPUT = 0
)
(
    input  wire                   clk,
    input  wire                   rst,
    
    input  wire [ADDR_WIDTH-1:0]  s_axil_awaddr ,
    input  wire [2:0]             s_axil_awprot ,
    input  wire                   s_axil_awvalid,
    output wire                   s_axil_awready,
    input  wire [DATA_WIDTH-1:0]  s_axil_wdata  ,
    input  wire [STRB_WIDTH-1:0]  s_axil_wstrb  ,
    input  wire                   s_axil_wvalid ,
    output wire                   s_axil_wready ,
    output wire [1:0]             s_axil_bresp  ,
    output wire                   s_axil_bvalid ,
    input  wire                   s_axil_bready ,
    input  wire [ADDR_WIDTH-1:0]  s_axil_araddr ,
    input  wire [2:0]             s_axil_arprot ,
    input  wire                   s_axil_arvalid,
    output wire                   s_axil_arready,
    output wire [DATA_WIDTH-1:0]  s_axil_rdata  ,
    output wire [1:0]             s_axil_rresp  ,
    output wire                   s_axil_rvalid ,
    input  wire                   s_axil_rready ,

    output wire                   oAxilValid  ,
    output wire [5:0]             oDelayTapLoad,

    output wire [31:0]            oCommand    ,
    output wire                   oCommandValid,
    output wire [31:0]            oAddress    ,
    output wire [15:0]            oLength     ,
    input  wire                   iCommandFail,
    
    output wire [31:0]            oDMARAddress,
    output wire [31:0]            oDMAWAddress,

    input  wire [31:0]            iNFCStatus  ,
    input  wire [31:0]            iNandRBStatus
);
    reg                   rAxilValid  = 0;
    reg [5:0]             rDelayTapLoad =0 ;
    reg [31:0]            rCommand       ;
    reg                   rCommandValid  ;
    reg [31:0]            rAddress       ;
    reg [15:0]            rLength        ;
    
    reg [31:0]            rDMARAddress   ;
    reg [31:0]            rDMAWAddress   ;
    
    reg [31:0]            rFeature       ;

parameter VALID_ADDR_WIDTH = ADDR_WIDTH - $clog2(STRB_WIDTH);
parameter WORD_WIDTH = STRB_WIDTH;
parameter WORD_SIZE = DATA_WIDTH/WORD_WIDTH;

reg mem_wr_en;
reg mem_rd_en;

reg s_axil_awready_reg = 1'b0, s_axil_awready_next;
reg s_axil_wready_reg = 1'b0, s_axil_wready_next;
reg s_axil_bvalid_reg = 1'b0, s_axil_bvalid_next;
reg s_axil_arready_reg = 1'b0, s_axil_arready_next;
reg [DATA_WIDTH-1:0] s_axil_rdata_reg = {DATA_WIDTH{1'b0}}, s_axil_rdata_next;
reg s_axil_rvalid_reg = 1'b0, s_axil_rvalid_next;
reg [DATA_WIDTH-1:0] s_axil_rdata_pipe_reg = {DATA_WIDTH{1'b0}};
reg s_axil_rvalid_pipe_reg = 1'b0;

// (* RAM_STYLE="BLOCK" *)
// reg [DATA_WIDTH-1:0] mem[(2**VALID_ADDR_WIDTH)-1:0];

wire [VALID_ADDR_WIDTH-1:0] s_axil_awaddr_valid = s_axil_awaddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
wire [VALID_ADDR_WIDTH-1:0] s_axil_araddr_valid = s_axil_araddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);

assign s_axil_awready = s_axil_awready_reg;
assign s_axil_wready = s_axil_wready_reg;
assign s_axil_bresp = 2'b00;
assign s_axil_bvalid = s_axil_bvalid_reg;
assign s_axil_arready = s_axil_arready_reg;
assign s_axil_rdata = PIPELINE_OUTPUT ? s_axil_rdata_pipe_reg : s_axil_rdata_reg;
assign s_axil_rresp = 2'b00;
assign s_axil_rvalid = PIPELINE_OUTPUT ? s_axil_rvalid_pipe_reg : s_axil_rvalid_reg;

// integer i, j;

// initial begin
//     // two nested loops for smaller number of iterations per loop
//     // workaround for synthesizer complaints about large loop counts
//     for (i = 0; i < 2**VALID_ADDR_WIDTH; i = i + 2**(VALID_ADDR_WIDTH/2)) begin
//         for (j = i; j < i + 2**(VALID_ADDR_WIDTH/2); j = j + 1) begin
//             mem[j] = 0;
//         end
//     end
// end

always @* begin
    mem_wr_en = 1'b0;

    s_axil_awready_next = 1'b0;
    s_axil_wready_next = 1'b0;
    s_axil_bvalid_next = s_axil_bvalid_reg && !s_axil_bready;

    if (s_axil_awvalid && s_axil_wvalid && (!s_axil_bvalid || s_axil_bready) && (!s_axil_awready && !s_axil_wready)) begin
        s_axil_awready_next = 1'b1;
        s_axil_wready_next = 1'b1;
        s_axil_bvalid_next = 1'b1;

        mem_wr_en = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        s_axil_awready_reg <= 1'b0;
        s_axil_wready_reg <= 1'b0;
        s_axil_bvalid_reg <= 1'b0;
    end else begin
        s_axil_awready_reg <= s_axil_awready_next;
        s_axil_wready_reg <= s_axil_wready_next;
        s_axil_bvalid_reg <= s_axil_bvalid_next;
    end

    // for (i = 0; i < WORD_WIDTH; i = i + 1) begin
    //     if (mem_wr_en && s_axil_wstrb[i]) begin
    //         mem[s_axil_awaddr_valid][WORD_SIZE*i +: WORD_SIZE] <= s_axil_wdata[WORD_SIZE*i +: WORD_SIZE];
    //     end
    // end
    if (rst) begin
        rCommand      <= 0;
        rCommandValid <= 0;
        rAddress      <= 0;
        rLength       <= 0;
        rDMARAddress  <= 0;
        rDMAWAddress  <= 0;
        rFeature      <= 0;
        rAxilValid    <= 0;
    end
    if (mem_wr_en) begin
        if (s_axil_awaddr_valid[7:0] == 8'd0) begin
            rCommand      <= s_axil_wdata;
            rCommandValid <= 1;
        end else if (s_axil_awaddr_valid[7:0] == 8'd1) begin
            rAddress <= s_axil_wdata;
        end else if (s_axil_awaddr_valid[7:0] == 8'd2) begin
            rLength <= s_axil_wdata[15:0];
        end else if (s_axil_awaddr_valid[7:0] == 8'd3) begin
            rDMARAddress <= s_axil_wdata;
        end else if (s_axil_awaddr_valid[7:0] == 8'd4) begin
            rDMAWAddress <= s_axil_wdata;
        end else if (s_axil_awaddr_valid[7:0] == 8'd5) begin
            rFeature <= s_axil_wdata;
        end else if (s_axil_awaddr_valid[7:0] == 8'd9) begin
            rDelayTapLoad <= s_axil_wdata[5:0];
        end
        rAxilValid <= 1;
    end else begin
        rAxilValid    <= 0;
        rCommandValid <= 0;
    end
end

always @* begin
    mem_rd_en = 1'b0;

    s_axil_arready_next = 1'b0;
    s_axil_rvalid_next = s_axil_rvalid_reg && !(s_axil_rready || (PIPELINE_OUTPUT && !s_axil_rvalid_pipe_reg));

    if (s_axil_arvalid && (!s_axil_rvalid || s_axil_rready || (PIPELINE_OUTPUT && !s_axil_rvalid_pipe_reg)) && (!s_axil_arready)) begin
        s_axil_arready_next = 1'b1;
        s_axil_rvalid_next = 1'b1;

        mem_rd_en = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        s_axil_arready_reg <= 1'b0;
        s_axil_rvalid_reg <= 1'b0;
        s_axil_rvalid_pipe_reg <= 1'b0;
    end else begin
        s_axil_arready_reg <= s_axil_arready_next;
        s_axil_rvalid_reg <= s_axil_rvalid_next;

        if (!s_axil_rvalid_pipe_reg || s_axil_rready) begin
            s_axil_rvalid_pipe_reg <= s_axil_rvalid_reg;
        end
    end
    if (mem_rd_en) begin
        if (s_axil_araddr_valid[7:0] == 8'd0) begin
            s_axil_rdata_reg <= rCommand;
        end else if (s_axil_araddr_valid[7:0] == 8'd1) begin
            s_axil_rdata_reg <= rAddress;
        end else if (s_axil_araddr_valid[7:0] == 8'd2) begin
            s_axil_rdata_reg <= {16'd0, rLength};
        end else if (s_axil_araddr_valid[7:0] == 8'd3) begin
            s_axil_rdata_reg <= rDMARAddress;
        end else if (s_axil_araddr_valid[7:0] == 8'd4) begin
            s_axil_rdata_reg <= rDMAWAddress;
        end else if (s_axil_araddr_valid[7:0] == 8'd5) begin
            // s_axil_rdata_reg <= rFeature;
        end else if (s_axil_araddr_valid[7:0] == 8'd6) begin
            s_axil_rdata_reg <= {31'd0, iCommandFail};
        end else if (s_axil_araddr_valid[7:0] == 8'd7) begin
            s_axil_rdata_reg <= iNFCStatus;
        end else if (s_axil_araddr_valid[7:0] == 8'd8) begin
            s_axil_rdata_reg <= iNandRBStatus;
        end else begin
            s_axil_rdata_reg <= 0;
        end
        // s_axil_rdata_reg <= mem[s_axil_araddr_valid];
    end

    if (!s_axil_rvalid_pipe_reg || s_axil_rready) begin
        s_axil_rdata_pipe_reg <= s_axil_rdata_reg;
    end
end
    
    assign oAxilValid    = rAxilValid   ;
    assign oDelayTapLoad = rDelayTapLoad;
    assign oCommand      = rCommand     ;
    assign oCommandValid = rCommandValid;
    assign oAddress      = rAddress     ;
    assign oLength       = rLength      ;
    assign oDMARAddress  = rDMARAddress ;
    assign oDMAWAddress  = rDMAWAddress ;

endmodule
