/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: bram_port_demux.v
 *  Purpose:  Custom BRAM demux. Allows to connect separate BRAMs to
 *            a single AXI BRAM controller.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module bram_port_demux
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_IN, MEM_SIZE 32768, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN CLK"   *)     input   wire            bram_in_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN EN "   *)     input   wire            bram_in_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN RST"   *)     input   wire            bram_in_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN WE"    *)     input   wire    [3:0]   bram_in_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN ADDR"  *)     input   wire    [31:0]  bram_in_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN DIN"   *)     input   wire    [31:0]  bram_in_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_IN DOUT"  *)     output  reg     [31:0]  bram_in_rdata,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_OUT_0, MEM_SIZE 4096, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_0 CLK"   *)  output  wire            bram_out_0_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_0 EN "   *)  output  reg             bram_out_0_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_0 RST"   *)  output  wire            bram_out_0_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_0 WE"    *)  output  wire    [3:0]   bram_out_0_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_0 ADDR"  *)  output  wire    [31:0]  bram_out_0_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_0 DIN"   *)  output  wire    [31:0]  bram_out_0_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_0 DOUT"  *)  input   wire    [31:0]  bram_out_0_rdata,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_OUT_1, MEM_SIZE 4096, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_1 CLK"   *)  output  wire            bram_out_1_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_1 EN "   *)  output  reg             bram_out_1_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_1 RST"   *)  output  wire            bram_out_1_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_1 WE"    *)  output  wire    [3:0]   bram_out_1_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_1 ADDR"  *)  output  wire    [31:0]  bram_out_1_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_1 DIN"   *)  output  wire    [31:0]  bram_out_1_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_1 DOUT"  *)  input   wire    [31:0]  bram_out_1_rdata,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_OUT_2, MEM_SIZE 4096, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_2 CLK"   *)  output  wire            bram_out_2_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_2 EN "   *)  output  reg             bram_out_2_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_2 RST"   *)  output  wire            bram_out_2_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_2 WE"    *)  output  wire    [3:0]   bram_out_2_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_2 ADDR"  *)  output  wire    [31:0]  bram_out_2_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_2 DIN"   *)  output  wire    [31:0]  bram_out_2_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_2 DOUT"  *)  input   wire    [31:0]  bram_out_2_rdata,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_OUT_3, MEM_SIZE 4096, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_3 CLK"   *)  output  wire            bram_out_3_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_3 EN "   *)  output  reg             bram_out_3_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_3 RST"   *)  output  wire            bram_out_3_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_3 WE"    *)  output  wire    [3:0]   bram_out_3_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_3 ADDR"  *)  output  wire    [31:0]  bram_out_3_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_3 DIN"   *)  output  wire    [31:0]  bram_out_3_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_3 DOUT"  *)  input   wire    [31:0]  bram_out_3_rdata,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_OUT_4, MEM_SIZE 4096, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_4 CLK"   *)  output  wire            bram_out_4_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_4 EN "   *)  output  reg             bram_out_4_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_4 RST"   *)  output  wire            bram_out_4_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_4 WE"    *)  output  wire    [3:0]   bram_out_4_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_4 ADDR"  *)  output  wire    [31:0]  bram_out_4_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_4 DIN"   *)  output  wire    [31:0]  bram_out_4_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_OUT_4 DOUT"  *)  input   wire    [31:0]  bram_out_4_rdata
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    assign  bram_out_0_clk   = bram_in_clk;
    assign  bram_out_0_rst   = bram_in_rst;
    assign  bram_out_0_we    = bram_in_we;
    assign  bram_out_0_addr  = bram_in_addr;
    assign  bram_out_0_wdata = bram_in_wdata;
    
    assign  bram_out_1_clk   = bram_in_clk;
    assign  bram_out_1_rst   = bram_in_rst;
    assign  bram_out_1_we    = bram_in_we;
    assign  bram_out_1_addr  = bram_in_addr;
    assign  bram_out_1_wdata = bram_in_wdata;
    
    assign  bram_out_2_clk   = bram_in_clk;
    assign  bram_out_2_rst   = bram_in_rst;
    assign  bram_out_2_we    = bram_in_we;
    assign  bram_out_2_addr  = bram_in_addr;
    assign  bram_out_2_wdata = bram_in_wdata;
    
    assign  bram_out_3_clk   = bram_in_clk;
    assign  bram_out_3_rst   = bram_in_rst;
    assign  bram_out_3_we    = bram_in_we;
    assign  bram_out_3_addr  = bram_in_addr;
    assign  bram_out_3_wdata = bram_in_wdata;
    
    assign  bram_out_4_clk   = bram_in_clk;
    assign  bram_out_4_rst   = bram_in_rst;
    assign  bram_out_4_we    = bram_in_we;
    assign  bram_out_4_addr  = bram_in_addr;
    assign  bram_out_4_wdata = bram_in_wdata;
    
    
    always @(*) begin
        case (bram_in_addr[14:12])
            3'd0: begin
                bram_in_rdata = bram_out_0_rdata;
                bram_out_0_ena = bram_in_ena;
                bram_out_1_ena = 1'b0;
                bram_out_2_ena = 1'b0;
                bram_out_3_ena = 1'b0;
                bram_out_4_ena = 1'b0;
            end
            
            3'd1: begin
                bram_in_rdata = bram_out_1_rdata;
                bram_out_0_ena = 1'b0;
                bram_out_1_ena = bram_in_ena;
                bram_out_2_ena = 1'b0;
                bram_out_3_ena = 1'b0;
                bram_out_4_ena = 1'b0;
            end
            
            3'd2: begin
                bram_in_rdata = bram_out_2_rdata;
                bram_out_0_ena = 1'b0;
                bram_out_1_ena = 1'b0;
                bram_out_2_ena = bram_in_ena;
                bram_out_3_ena = 1'b0;
                bram_out_4_ena = 1'b0;
            end
            
            3'd3: begin
                bram_in_rdata = bram_out_3_rdata;
                bram_out_0_ena = 1'b0;
                bram_out_1_ena = 1'b0;
                bram_out_2_ena = 1'b0;
                bram_out_3_ena = bram_in_ena;
                bram_out_4_ena = 1'b0;
            end
            
            3'd4: begin
                bram_in_rdata = bram_out_4_rdata;
                bram_out_0_ena = 1'b0;
                bram_out_1_ena = 1'b0;
                bram_out_2_ena = 1'b0;
                bram_out_3_ena = 1'b0;
                bram_out_4_ena = bram_in_ena;
            end
            
            default: begin
                bram_in_rdata = 32'hABADC0DE;
                bram_out_0_ena = 1'b0;
                bram_out_1_ena = 1'b0;
                bram_out_2_ena = 1'b0;
                bram_out_3_ena = 1'b0;
                bram_out_4_ena = 1'b0;
            end
            
        endcase
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
