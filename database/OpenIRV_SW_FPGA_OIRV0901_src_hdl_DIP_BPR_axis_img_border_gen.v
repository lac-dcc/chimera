/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_img_border_gen.v
 *  Purpose:  AXI4-Stream image border generation module. Adds a single pixel
 *            width boarder to the incoming image stream. This boarder allows
 *            to simplify any 3x3 matrix based image processing at the edges
 *            and corners.
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


module axis_img_border_gen #
(
    parameter   IMG_RES_X = 336,
    parameter   IMG_RES_Y = 256,
    parameter   BORDER_PIX_MASK = 16'h0000,
    parameter   DATA_PIX_MASK = 16'h0000
)
(
    input   wire            axis_aclk,
    input   wire            axis_aresetn,
    
    input   wire    [15:0]  s_axis_tdata,
    input   wire            s_axis_tvalid,
    output  wire            s_axis_tready,
    input   wire            s_axis_tlast,
    input   wire            s_axis_tuser,
    
    output  wire    [15:0]  m_axis_tdata,
    output  wire            m_axis_tvalid,
    input   wire            m_axis_tready,
    output  wire            m_axis_tlast,
    output  wire    [1:0]   m_axis_tuser
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg             axis_bypass     = 1'b0;
    reg             border_valid    = 1'b0;
    reg             border_pix_last = 1'b0;
    
    assign  m_axis_tdata  = (axis_bypass)? (s_axis_tdata | DATA_PIX_MASK) : BORDER_PIX_MASK;
    assign  m_axis_tvalid = (axis_bypass)? s_axis_tvalid : border_valid;
    assign  m_axis_tlast  = (axis_bypass)? s_axis_tlast  : 1'b0;
    assign  s_axis_tready = (axis_bypass)? m_axis_tready : 1'b0;
    assign  m_axis_tuser  = {border_pix_last, s_axis_tuser};
    
    reg     [15:0]  x_cnt = 16'd0;
    reg     [15:0]  y_cnt = 16'd0;
    
    
    localparam  [2:0]   ST_RST            = 3'd0,
                        ST_ROW_FIRST_PIX  = 3'd1,
                        ST_SEL_ROW_TYPE   = 3'd2,
                        ST_BORDER_ROW     = 3'd3,
                        ST_DATA_ROW       = 3'd4,
                        ST_ROW_LAST_PIX   = 3'd5;
                        
    reg         [2:0]   state = ST_RST;
    
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn) begin
            x_cnt           <= 16'd0;
            y_cnt           <= 16'd0;
            axis_bypass     <= 1'b0;
            border_valid    <= 1'b0;
            border_pix_last <= 1'b0;
            state           <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    x_cnt           <= 16'd0;
                    y_cnt           <= 16'd0;
                    axis_bypass     <= 1'b0;
                    border_valid    <= 1'b0;
                    border_pix_last <= 1'b0;
                    state           <= ST_ROW_FIRST_PIX;    // wait for frame start?
                end
                
                ST_ROW_FIRST_PIX: begin
                    axis_bypass     <= 1'b0;
                    border_valid    <= 1'b1;
                    border_pix_last <= 1'b0;
                    state           <= ST_SEL_ROW_TYPE;
                end
                
                ST_SEL_ROW_TYPE: begin
                    if (m_axis_tready) begin
                        x_cnt <= 16'd0;
                        if ((y_cnt == 16'd0) || (y_cnt == (IMG_RES_Y + 1))) begin
                            axis_bypass     <= 1'b0;
                            border_valid    <= 1'b1;
                            border_pix_last <= 1'b0;
                            state <= ST_BORDER_ROW;
                        end else begin
                            axis_bypass     <= 1'b1;
                            border_valid    <= 1'b0;
                            border_pix_last <= 1'b0;
                            state <= ST_DATA_ROW;
                        end
                    end
                end
                
                ST_BORDER_ROW: begin
                    if (m_axis_tready) begin
                        x_cnt <= x_cnt + 1'b1;
                        if (x_cnt == (IMG_RES_X - 1)) begin
                            axis_bypass     <= 1'b0;
                            border_valid    <= 1'b1;
                            border_pix_last <= 1'b1;
                            x_cnt <= 16'd0;
                            state <= ST_ROW_LAST_PIX;
                        end
                    end
                end
                
                
                ST_DATA_ROW: begin
                    if (m_axis_tvalid & m_axis_tready) begin
                        x_cnt <= x_cnt + 1'b1;
                        if (x_cnt == (IMG_RES_X - 1)) begin
                            axis_bypass     <= 1'b0;
                            border_valid    <= 1'b1;
                            border_pix_last <= 1'b1;
                            x_cnt <= 16'd0;
                            state <= ST_ROW_LAST_PIX;
                        end
                    end
                end
                
                ST_ROW_LAST_PIX: begin
                    if (m_axis_tready) begin
                        x_cnt <= 16'd0;
                        axis_bypass     <= 1'b0;
                        border_valid    <= 1'b0;
                        border_pix_last <= 1'b0;
                        if (y_cnt == (IMG_RES_Y + 1)) begin
                            state <= ST_RST;
                        end else begin
                            y_cnt <= y_cnt + 1'b1;
                            state <= ST_ROW_FIRST_PIX;
                        end
                    end
                end
            endcase
        end
    end
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
