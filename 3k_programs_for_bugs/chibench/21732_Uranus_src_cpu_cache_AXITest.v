// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module AXITest(
    input clk,
    input rst,
    // AXI interface
    output [3:0]  arid,
    output [31:0] araddr,
    output [7:0]  arlen,
    output [2:0]  arsize,
    output [1:0]  arburst,
    output [1:0]  arlock,
    output [3:0]  arcache,
    output [2:0]  arprot,
    output        arvalid,
    input         arready,
    // ---
    input  [3:0]  rid,
    input  [31:0] rdata,
    input  [1:0]  rresp,
    input         rlast,
    input         rvalid,
    output        rready,
    // ---
    output [3:0]  awid,
    output [31:0] awaddr,
    output [7:0]  awlen,
    output [2:0]  awsize,
    output [1:0]  awburst,
    output [1:0]  awlock,
    output [3:0]  awcache,
    output [2:0]  awprot,
    output        awvalid,
    input         awready,
    // ---
    output [3:0]  wid,
    output [31:0] wdata,
    output [3:0]  wstrb,
    output        wlast,
    output        wvalid,
    input         wready,
    // ---
    input  [3:0]  bid,
    input  [1:0]  bresp,
    input         bvalid,
    output        bready,
    // other
    input en,
    input write_en,
    input [31:0] addr,
    input [31:0] data_in,
    output ready,
    output [31:0] data_out
);

    reg[31:0] mem[16:0];
    reg[7:0] index;

    // AXI
    reg[31:0] axi_raddr, axi_waddr, axi_wdata;
    reg axi_ren, axi_wen, axi_wvalid;
    assign araddr = axi_raddr;
    assign arlen = 8'b00001111;
    assign arvalid = axi_ren;
    assign awaddr = axi_waddr;
    assign awlen = 8'b00001111;
    assign awvalid = axi_wen;
    assign wdata = axi_wdata;
    assign wlast = axi_wvalid && index == awlen + 1;
    assign wvalid = axi_wvalid;
    // constant
    assign arid = 4'b0;
    assign arsize = 3'b010;
    assign arburst = 2'b01;
    assign arlock = 2'b0;
    assign arcache = 4'b0;
    assign arprot = 3'b0;
    assign rready = 1'b1;
    assign awid = 4'b0;
    assign awsize = 3'b010;
    assign awburst = 2'b01;
    assign awlock = 2'b0;
    assign awcache = 4'b0;
    assign awprot = 3'b0;
    assign wid = 4'b0;
    assign wstrb = 4'b1111;
    assign bready = 1'b1;

    reg[2:0] state, next_state;

    parameter kStateIdle = 0, kStateRAddr = 1, kStateRData = 2,
            kStateWAddr = 3, kStateWData = 4;

    assign data_out = mem[0];
    assign ready = state == kStateIdle;

    always @(posedge clk) begin
        if (!rst) begin
            state <= kStateIdle;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            kStateIdle: begin
                if (en && !write_en) begin
                    next_state <= kStateRAddr;
                end
                else if (en && write_en) begin
                    next_state <= kStateWAddr;
                end
                else begin
                    next_state <= kStateIdle;
                end
            end
            kStateRAddr: begin
                next_state <= arready ? kStateRData : kStateRAddr;
            end
            kStateRData: begin
                next_state <= rlast ? kStateIdle : kStateRData;
            end
            kStateWAddr: begin
                next_state <= awready ? kStateWData : kStateWAddr;
            end
            kStateWData: begin
                next_state <= wlast ? kStateIdle : kStateWData;
            end
            default: next_state <= kStateIdle;
        endcase
    end

    always @(posedge clk) begin
        if (!rst) begin
            axi_raddr <= 0;
            axi_ren <= 0;
            axi_waddr <= 0;
            axi_wen <= 0;
            axi_wdata <= 0;
            axi_wvalid <= 0;
            index <= 0;
        end
        else begin
            case (state)
                kStateIdle: begin
                    axi_raddr <= 0;
                    axi_ren <= 0;
                    axi_waddr <= 0;
                    axi_wen <= 0;
                    axi_wdata <= 0;
                    axi_wvalid <= 0;
                    index <= 0;
                end
                kStateRAddr: begin
                    axi_raddr <= addr;
                    axi_ren <= 1;
                    axi_waddr <= 0;
                    axi_wen <= 0;
                    axi_wdata <= 0;
                    axi_wvalid <= 0;
                    index <= 0;
                end
                kStateRData: begin
                    axi_raddr <= 0;
                    axi_ren <= 0;
                    axi_waddr <= 0;
                    axi_wen <= 0;
                    axi_wdata <= 0;
                    axi_wvalid <= 0;
                    if (rvalid) begin
                        index <= index + 1;
                        mem[index] <= rdata;
                    end
                    else begin
                        index <= index;
                    end
                end
                kStateWAddr: begin
                    axi_raddr <= 0;
                    axi_ren <= 0;
                    axi_waddr <= addr;
                    axi_wen <= 1;
                    axi_wdata <= 0;
                    axi_wvalid <= 0;
                    index <= 0;
                    // memory input for test
                    mem[0] <= data_in;
                    mem[1] <= data_in;
                    mem[2] <= data_in;
                end
                kStateWData: begin
                    axi_raddr <= 0;
                    axi_ren <= 0;
                    axi_waddr <= 0;
                    axi_wen <= 0;
                    if (wready && !wlast) begin
                        axi_wvalid <= 1;
                        axi_wdata <= mem[index];
                        index <= index + 1;
                    end
                    else begin
                        axi_wvalid <= 0;
                    end
                end
                default:;
            endcase
        end
    end

endmodule // AXITest
