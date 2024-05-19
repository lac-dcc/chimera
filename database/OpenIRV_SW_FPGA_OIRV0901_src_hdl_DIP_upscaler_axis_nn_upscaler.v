// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_nn_upscaler.v
 *  Purpose:  Simple nearest neighbor upscaling AXI4-Stream module 
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


module axis_nn_upscaler #
(
    parameter   IMG_RES_X = 0
)
(
    input   wire            axis_aresetn,
    input   wire            axis_aclk,
    
    input   wire    [7:0]   s_axis_tdata,
    input   wire            s_axis_tvalid,
    output  reg             s_axis_tready   = 1'b0,
    input   wire            s_axis_tlast,
    input   wire            s_axis_tuser,
    
    output  reg     [7:0]   m_axis_tdata    = 8'h00,
    output  reg             m_axis_tvalid   = 1'b0,
    input   wire            m_axis_tready,
    output  reg             m_axis_tlast    = 1'b0,
    output  reg             m_axis_tuser    = 1'b0      // eof
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    /* Checking input parameters */
    generate
        if (IMG_RES_X == 0) begin
            //INVALID_PARAMETER invalid_parameter_msg();
            initial begin
                $error("Invalid parameter!");
            end
        end
    endgenerate

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    /*
     *       original           upscaled
     *        m x n             2m x 2n
     *
     *                      1 1 2 2 3 3 4 4
     *       1 2 3 4        1 1 2 2 3 3 4 4
     *       5 6 7 8  --->  5 5 6 6 7 7 8 8
     *       9 A B C        5 5 6 6 7 7 8 8
     *                      9 9 A A B B C C
     *                      9 9 A A B B C C
     */    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg             tlast_temp = 1'b0;
    reg             tuser_temp = 1'b0;
    
    reg             fifo_m_axis_tready = 1'b0;
    wire            fifo_m_axis_tvalid;
    wire    [7:0]   fifo_m_axis_tdata;
    wire            fifo_m_axis_tlast;
    wire            fifo_m_axis_tuser;

    reg     [15:0]  x_cnt = 16'd0;
    
    localparam  [2:0]   ST_RST               = 3'd0,
                        ST_GET_STREAM_PIX    = 3'd1,
                        ST_COPY_STREAM_PIX_0 = 3'd2,
                        ST_COPY_STREAM_PIX_1 = 3'd3,
                        ST_GET_FIFO_PIX      = 3'd4,
                        ST_COPY_FIFO_PIX_0   = 3'd5,
                        ST_COPY_FIFO_PIX_1   = 3'd6;
                        
    reg         [2:0]   state = ST_RST;
    
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn) begin
            x_cnt <= 16'd0;
            s_axis_tready <= 1'b0;
            m_axis_tvalid <= 1'b0;
            fifo_m_axis_tready <= 1'b0;
            state         <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    x_cnt <= 16'd0;
                    m_axis_tvalid <= 1'b0;
                    fifo_m_axis_tready <= 1'b0;
                    
                    if (s_axis_tvalid) begin
                        s_axis_tready <= 1'b1;
                        state <= ST_GET_STREAM_PIX;
                    end else begin
                        s_axis_tready <= 1'b0;
                    end
                end
                
                ST_GET_STREAM_PIX: begin
                    if (s_axis_tvalid) begin
                        x_cnt <= x_cnt + 1'b1;
                        s_axis_tready <= 1'b0;
                        m_axis_tvalid <= 1'b1;
                        m_axis_tlast  <= 1'b0;
                        m_axis_tuser  <= 1'b0;
                        m_axis_tdata  <= s_axis_tdata;
                        state <= ST_COPY_STREAM_PIX_0;
                    end
                end
                
                ST_COPY_STREAM_PIX_0: begin
                    if (m_axis_tready) begin
                        m_axis_tvalid <= 1'b1;
                        m_axis_tlast  <= 1'b0;
                        m_axis_tuser  <= 1'b0;
                        state <= ST_COPY_STREAM_PIX_1;
                    end
                end
                
                ST_COPY_STREAM_PIX_1: begin
                    if (m_axis_tready) begin
                        m_axis_tvalid <= 1'b0;
                        if (x_cnt == IMG_RES_X) begin
                            x_cnt <= 16'd0;
                            fifo_m_axis_tready <= 1'b1;
                            state <= ST_GET_FIFO_PIX;
                        end else begin
                            s_axis_tready <= 1'b1;
                            state <= ST_GET_STREAM_PIX;
                        end
                    end
                end
                
                ST_GET_FIFO_PIX: begin
                    if (fifo_m_axis_tvalid) begin
                        x_cnt <= x_cnt + 1'b1;
                        fifo_m_axis_tready <= 1'b0;
                        tuser_temp    <= fifo_m_axis_tuser;
                        m_axis_tvalid <= 1'b1;
                        m_axis_tlast  <= 1'b0;
                        m_axis_tuser  <= 1'b0;
                        m_axis_tdata  <= fifo_m_axis_tdata;
                        state <= ST_COPY_FIFO_PIX_0;
                    end
                end
                
                ST_COPY_FIFO_PIX_0: begin
                    if (m_axis_tready) begin
                        m_axis_tvalid <= 1'b1;
                        m_axis_tlast  <= (x_cnt == IMG_RES_X)? 1'b1 : 1'b0;
                        m_axis_tuser  <= tuser_temp;
                        state <= ST_COPY_FIFO_PIX_1;
                    end
                end
                
                ST_COPY_FIFO_PIX_1: begin
                    if (m_axis_tready) begin
                        m_axis_tvalid <= 1'b0;
                        if (x_cnt == IMG_RES_X) begin
                            x_cnt <= 16'd0;
                            s_axis_tready <= 1'b1;
                            state <= ST_GET_STREAM_PIX;
                        end else begin
                            fifo_m_axis_tready <= 1'b1;
                            state <= ST_GET_FIFO_PIX;
                        end
                    end
                end
            endcase
        end
    end
    
    
    AXIS_FIFO_1K_X8 AXIS_FIFO_1K_X8_inst
    (
        .s_aclk         (axis_aclk),                  // input wire s_axis_aclk
        .s_aresetn      (axis_aresetn),                // input wire s_aresetn
        
        .s_axis_tvalid  (s_axis_tvalid & s_axis_tready),  // input wire s_axis_tvalid
        .s_axis_tready  (),                     // output wire s_axis_tready
        .s_axis_tdata   (s_axis_tdata),         // input wire [7 : 0] s_axis_tdata
        .s_axis_tlast   (s_axis_tlast),         // input wire s_axis_tlast
        .s_axis_tuser   (s_axis_tuser),         // input wire [0 : 0] s_axis_tuser
        
        .m_axis_tvalid  (fifo_m_axis_tvalid),   // output wire m_axis_tvalid
        .m_axis_tready  (fifo_m_axis_tready),   // input wire m_axis_tready
        .m_axis_tdata   (fifo_m_axis_tdata),    // output wire [7 : 0] m_axis_tdata
        .m_axis_tlast   (fifo_m_axis_tlast),    // output wire m_axis_tlast
        .m_axis_tuser   (fifo_m_axis_tuser),    // output wire [0 : 0] m_axis_tuser
        
        .wr_rst_busy    (),                     // output wire wr_rst_busy
        .rd_rst_busy    ()                      // output wire rd_rst_busy
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
