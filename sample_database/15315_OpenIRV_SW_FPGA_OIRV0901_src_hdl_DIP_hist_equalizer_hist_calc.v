// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: hist_calc.v
 *  Purpose:  Histogram calculation module for 14-bit pixel image.
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


module hist_calc
(
    input   wire            clk,
    input   wire            srst,
    
    input   wire            hist_upd,
    output  reg             hist_rdy = 1'b1,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [15:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  reg             s_axis_tready = 1'b1,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST"  *)  input   wire            s_axis_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire            s_axis_tuser,
    
    output  reg             ram_we   = 1'b0,
    output  reg     [13:0]  ram_addr = {14{1'b0}},
    output  reg     [17:0]  ram_din  = {18{1'b0}},
    input   wire    [17:0]  ram_dout
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire            pix_good = s_axis_tdata[15];
    wire    [13:0]  pix_data = s_axis_tdata[13:0];
    
    
    localparam  [2:0]   ST_RST            = 3'd0,
                        ST_ERASE_HIST     = 3'd1,
                        ST_WAIT_SOF       = 3'd2,
                        ST_WAIT_VALID_PIX = 3'd3,
                        ST_GET_HIST_BIN   = 3'd4,
                        ST_UPD_HIST_BIN   = 3'd5;
    
    reg         [2:0]   state = ST_RST;
    
    
    always @(posedge clk) begin
        if (srst) begin
            hist_rdy <= 1'b1;
            ram_we <= 1'b0;
            s_axis_tready <= 1'b1;
            state <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    s_axis_tready <= 1'b1;
                    
                    if (hist_upd) begin
                        hist_rdy <= 1'b0;
                        ram_we   <= 1'b1;
                        ram_din  <= {18{1'b0}};
                        ram_addr <= {14{1'b0}};
                        state    <= ST_ERASE_HIST;
                    end else begin
                        ram_we   <= 1'b0;
                        hist_rdy <= 1'b1;
                    end
                end
                
                ST_ERASE_HIST: begin
                    if (ram_addr < {14{1'b1}}) begin
                        ram_addr <= ram_addr + 1'b1;
                    end else begin
                        ram_we <= 1'b0;
                        state  <= ST_WAIT_SOF;
                    end
                end
                
                ST_WAIT_SOF: begin
                    if (s_axis_tvalid & s_axis_tuser) begin
                        s_axis_tready <= 1'b0;
                        state <= ST_WAIT_VALID_PIX;
                    end
                end
                
                ST_WAIT_VALID_PIX: begin
                    ram_we <= 1'b0;
                 
                    if (s_axis_tvalid & s_axis_tuser) begin
                        s_axis_tready <= 1'b1;
                        state <= ST_RST;
                    end else begin
                        if (s_axis_tvalid) begin
                            s_axis_tready <= 1'b1;
                            if (pix_good) begin
                                ram_addr <= pix_data;
                                state <= ST_GET_HIST_BIN;
                            end
                        end else begin
                            s_axis_tready <= 1'b0;
                        end
                    end
                end
                
                ST_GET_HIST_BIN: begin
                    s_axis_tready <= 1'b0;
                    state <= ST_UPD_HIST_BIN;
                end
                
                ST_UPD_HIST_BIN: begin
                    ram_we  <= 1'b1;
                    ram_din <= ram_dout + 1'b1;
                    state   <= ST_WAIT_VALID_PIX;
                end
                
                default: begin
                    state <= ST_RST;
                end
                
            endcase
        end
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
