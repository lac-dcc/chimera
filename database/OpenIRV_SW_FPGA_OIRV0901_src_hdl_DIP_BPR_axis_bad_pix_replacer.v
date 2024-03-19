/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_bad_pix_replacer.v
 *  Purpose:  Bad pixel replacer AXI4-Stream top module.
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


module axis_bad_pix_replacer #
(
    parameter   IMG_RES_X = 336,
    parameter   IMG_RES_Y = 256
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axis_aclk,
    
    input   wire            bypass,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [31:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  wire            s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST"  *)  input   wire            s_axis_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire            s_axis_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA"  *)  output  wire    [15:0]  m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)  output  wire            m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)  input   wire            m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST"  *)  output  wire            m_axis_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER"  *)  output  wire            m_axis_tuser
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire    [15:0]  m_axis_wcd_tdata;
    wire            m_axis_wcd_tvalid;
    wire            m_axis_wcd_tready;
    wire            m_axis_wcd_tlast;
    wire    [1:0]   m_axis_wcd_tuser;


    AXIS_WC_4_TO_2 AXIS_WC_4_TO_2_inst
    (
        .aclk           ( axis_aclk              ),     // input wire aclk
        .aresetn        ( axis_aresetn           ),     // input wire aresetn
        
        .s_axis_tvalid  ( s_axis_tvalid          ),     // input wire s_axis_tvalid
        .s_axis_tready  ( s_axis_tready          ),     // output wire s_axis_tready
        .s_axis_tdata   ( s_axis_tdata           ),     // input wire [31 : 0] s_axis_tdata
        .s_axis_tlast   ( s_axis_tlast           ),     // input wire s_axis_tlast
        .s_axis_tuser   ( {s_axis_tuser, 3'b000} ),     // input wire [3 : 0] s_axis_tuser
        
        .m_axis_tvalid  ( m_axis_wcd_tvalid      ),     // output wire m_axis_tvalid
        .m_axis_tready  ( m_axis_wcd_tready      ),     // input wire m_axis_tready
        .m_axis_tdata   ( m_axis_wcd_tdata       ),     // output wire [15 : 0] m_axis_tdata
        .m_axis_tlast   ( m_axis_wcd_tlast       ),     // output wire m_axis_tlast
        .m_axis_tuser   ( m_axis_wcd_tuser       )      // output wire [1 : 0] m_axis_tuser
    );

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [15:0]  brd_axis_m_tdata;
    wire            brd_axis_m_tready;
    wire            brd_axis_m_tvalid;
    wire            brd_axis_m_tlast;
    wire    [1:0]   brd_axis_m_tuser;
    
    /*
     *  Incoming 16-bit word structure:
     *  m_axis_wcd_tdata[15]   - good pixel flag
     *  m_axis_wcd_tdata[14]   - not used, reserved
     *  m_axis_wcd_tdata[13:0] - 14-bit pixel data
     */
    
    axis_img_border_gen #
    (
        .IMG_RES_X       ( IMG_RES_X ),
        .IMG_RES_Y       ( IMG_RES_Y ),
        .BORDER_PIX_MASK ( 16'h0000  ),
        .DATA_PIX_MASK   ( 16'h4000  )
    )
    axis_img_border_gen_inst
    (
        .axis_aclk      ( axis_aclk           ),
        .axis_aresetn   ( axis_aresetn        ),
        
        .s_axis_tdata   ( m_axis_wcd_tdata    ),
        .s_axis_tvalid  ( m_axis_wcd_tvalid   ),
        .s_axis_tready  ( m_axis_wcd_tready   ),
        .s_axis_tlast   ( m_axis_wcd_tlast    ),
        .s_axis_tuser   ( m_axis_wcd_tuser[1] ),
        
        .m_axis_tdata   ( brd_axis_m_tdata    ),
        .m_axis_tvalid  ( brd_axis_m_tvalid   ),
        .m_axis_tready  ( brd_axis_m_tready   ),
        .m_axis_tlast   ( brd_axis_m_tlast    ),
        .m_axis_tuser   ( brd_axis_m_tuser    )     // TUSER[0] is EOF strobe, while TUSER[1] is a new "TLAST" strobe for border pixels
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    reg     line_0_ena = 1'b0;
    reg     line_1_ena = 1'b0;
    reg     line_2_ena = 1'b0;
    
    reg     [16*9 - 1:0]    matrix_3x3       = {16*9{1'b0}};
    reg                     matrix_3x3_valid = 1'b0;
    reg     [1:0]           matrix_3x3_last  = 2'b00;
    reg     [1:0]           matrix_3x3_user  = 2'b00;
    wire                    matrix_3x3_ready;
    
    wire    [15:0]  line_0_axis_m_tdata;
    wire            line_0_axis_m_tready;
    wire            line_0_axis_m_tvalid;
    wire            line_0_axis_m_tlast;
    wire    [1:0]   line_0_axis_m_tuser;
    
    wire    [15:0]  line_1_axis_m_tdata;
    wire            line_1_axis_m_tready;
    wire            line_1_axis_m_tvalid;
    wire            line_1_axis_m_tlast;
    wire    [1:0]   line_1_axis_m_tuser;
    
    wire    [15:0]  line_2_axis_m_tdata;
    wire            line_2_axis_m_tready = line_2_ena;
    wire            line_2_axis_m_tvalid;
    wire            line_2_axis_m_tlast;
    wire    [1:0]   line_2_axis_m_tuser;
    
    wire    [15:0]  fixed_pix_m_axis_tdata;
    wire            fixed_pix_m_axis_tvalid;
    wire            fixed_pix_m_axis_tready;
    wire            fixed_pix_m_axis_tlast;
    wire            fixed_pix_m_axis_tuser;
    
    
    AXIS_FIFO_2K_X16 AXIS_FIFO_2K_X16_bpr_line_0
    (
        .s_aclk         ( axis_aclk            ),               // input s_aclk
        .s_aresetn      ( axis_aresetn         ),               // input s_aresetn
        .s_axis_tvalid  ( brd_axis_m_tvalid    ),               // input s_axis_tvalid
        .s_axis_tready  ( brd_axis_m_tready    ),               // output s_axis_tready
        .s_axis_tdata   ( brd_axis_m_tdata     ),               // input [15 : 0] s_axis_tdata
        .s_axis_tlast   ( brd_axis_m_tlast     ),               // input s_axis_tlast
        .s_axis_tuser   ( brd_axis_m_tuser     ),               // input [1 : 0] s_axis_tuser
        
        .m_axis_tvalid  ( line_0_axis_m_tvalid ),               // output m_axis_tvalid
        .m_axis_tready  ( line_0_axis_m_tready & line_0_ena),   // input m_axis_tready
        .m_axis_tdata   ( line_0_axis_m_tdata  ),               // output [15 : 0] m_axis_tdata
        .m_axis_tlast   ( line_0_axis_m_tlast  ),               // output m_axis_tlast
        .m_axis_tuser   ( line_0_axis_m_tuser  ),               // output [0 : 0] m_axis_tuser
        
        .wr_rst_busy    ( /*-------NC-------*/ ),               // output wire wr_rst_busy
        .rd_rst_busy    ( /*-------NC-------*/ )                // output wire rd_rst_busy
    );
    
    
    AXIS_FIFO_2K_X16 AXIS_FIFO_2K_X16_bpr_line_1
    (
        .s_aclk         ( axis_aclk            ),               // input s_aclk
        .s_aresetn      ( axis_aresetn         ),               // input s_aresetn
        .s_axis_tvalid  ( line_0_axis_m_tvalid & line_0_ena),   // input s_axis_tvalid
        .s_axis_tready  ( line_0_axis_m_tready ),               // output s_axis_tready
        .s_axis_tdata   ( line_0_axis_m_tdata  ),               // input [15 : 0] s_axis_tdata
        .s_axis_tlast   ( line_0_axis_m_tlast  ),               // input s_axis_tlast
        .s_axis_tuser   ( line_0_axis_m_tuser  ),               // input [1 : 0] s_axis_tuser
        
        .m_axis_tvalid  ( line_1_axis_m_tvalid ),               // output m_axis_tvalid
        .m_axis_tready  ( line_1_axis_m_tready & line_1_ena),   // input m_axis_tready
        .m_axis_tdata   ( line_1_axis_m_tdata  ),               // output [15 : 0] m_axis_tdata
        .m_axis_tlast   ( line_1_axis_m_tlast  ),               // output m_axis_tlast
        .m_axis_tuser   ( line_1_axis_m_tuser  ),               // output [1 : 0] m_axis_tuser
        
        .wr_rst_busy    ( /*-------NC-------*/ ),               // output wire wr_rst_busy
        .rd_rst_busy    ( /*-------NC-------*/ )                // output wire rd_rst_busy
    );
    
    
    AXIS_FIFO_2K_X16 AXIS_FIFO_2K_X16_bpr_line_2
    (
        .s_aclk         ( axis_aclk            ),               // input s_aclk
        .s_aresetn      ( axis_aresetn         ),               // input s_aresetn
        .s_axis_tvalid  ( line_1_axis_m_tvalid & line_1_ena),   // input s_axis_tvalid
        .s_axis_tready  ( line_1_axis_m_tready ),               // output s_axis_tready
        .s_axis_tdata   ( line_1_axis_m_tdata  ),               // input [15 : 0] s_axis_tdata
        .s_axis_tlast   ( line_1_axis_m_tlast  ),               // input s_axis_tlast
        .s_axis_tuser   ( line_1_axis_m_tuser  ),               // input [1 : 0] s_axis_tuser
        
        .m_axis_tvalid  ( line_2_axis_m_tvalid ),               // output m_axis_tvalid
        .m_axis_tready  ( line_2_axis_m_tready ),               // input m_axis_tready
        .m_axis_tdata   ( line_2_axis_m_tdata  ),               // output [15 : 0] m_axis_tdata
        .m_axis_tlast   ( line_2_axis_m_tlast  ),               // output m_axis_tlast
        .m_axis_tuser   ( line_2_axis_m_tuser  ),               // output [1 : 0] m_axis_tuser
        
        .wr_rst_busy    ( /*-------NC-------*/ ),               // output wire wr_rst_busy
        .rd_rst_busy    ( /*-------NC-------*/ )                // output wire rd_rst_busy
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [1:0]   ST_RST             = 2'd0,
                        ST_FILL_PIPELINE   = 2'd1,
                        ST_GET_PIX_COLUMN  = 2'd2,
                        ST_SEND_PIX_MATRIX = 2'd3;
    
    reg         [1:0]   state = ST_RST;
    
    
    reg     first_row_passed = 1'b0;
    
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn) begin
            line_0_ena <= 1'b0;
            line_1_ena <= 1'b0;
            line_2_ena <= 1'b0;
            matrix_3x3_valid <= 1'b0;
            first_row_passed <= 1'b0;
            state      <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    line_0_ena <= 1'b1;
                    line_1_ena <= 1'b1;
                    line_2_ena <= 1'b0;
                    matrix_3x3_valid <= 1'b0;
                    first_row_passed <= 1'b0;
                    state <= ST_FILL_PIPELINE;      // TODO: wait for frame start?
                end
                
                ST_FILL_PIPELINE: begin
                    // Line 1 FIFO contains complete row if we pass 2 rows for the 1th and 2nd FIFO
                    if (line_0_axis_m_tvalid & line_0_axis_m_tready & line_0_axis_m_tuser[1]) begin
                        first_row_passed <= 1'b1;
                        line_0_ena <= (first_row_passed)? 1'b0 : 1'b1;
                    end
                    
                    // Line 2 FIFO contains complete row
                    if (line_1_axis_m_tvalid & line_1_axis_m_tready & line_1_axis_m_tuser[1]) begin
                        line_1_ena <= 1'b0;
                    end
                    
                    if (~line_0_ena & ~line_1_ena) begin
                        state <= ST_GET_PIX_COLUMN;
                    end
                end
                
                ST_GET_PIX_COLUMN: begin
                    if (line_0_axis_m_tvalid) begin
                        line_0_ena <= 1'b1;
                        line_1_ena <= 1'b1;
                        line_2_ena <= 1'b1;
                        
                        matrix_3x3_last  <= {matrix_3x3_last[0], line_1_axis_m_tlast};
                        matrix_3x3_user  <= {matrix_3x3_user[0], line_1_axis_m_tuser[0]};
                        matrix_3x3_valid <= 1'b1;
                        matrix_3x3 <=   {
                                            line_2_axis_m_tdata, matrix_3x3[16*9 - 1 : 16*7],   // 16*9 - 1 : 16*6
                                            line_1_axis_m_tdata, matrix_3x3[16*6 - 1 : 16*4],   // 16*6 - 1 : 16*3
                                            line_0_axis_m_tdata, matrix_3x3[16*3 - 1 : 16*1]    // 16*3 - 1 : 0   
                                        };
                        
                        state <= ST_SEND_PIX_MATRIX;
                    end
                end
                
                ST_SEND_PIX_MATRIX: begin
                    line_0_ena <= 1'b0;
                    line_1_ena <= 1'b0;
                    line_2_ena <= 1'b0;
                    
                    if (matrix_3x3_ready) begin
                        matrix_3x3_valid <= 1'b0;
                        state <= ST_GET_PIX_COLUMN;
                    end
                end
                
            endcase
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    axis_bpr_3x3_interpol axis_bpr_3x3_interpol_inst
    (
        .axis_aclk      ( axis_aclk               ), 
        .axis_aresetn   ( axis_aresetn            ), 
        .bypass         ( bypass                  ), 
        
        .s_axis_tdata   ( matrix_3x3              ), 
        .s_axis_tvalid  ( matrix_3x3_valid        ), 
        .s_axis_tready  ( matrix_3x3_ready        ), 
        .s_axis_tlast   ( matrix_3x3_last[1]      ), 
        .s_axis_tuser   ( matrix_3x3_user[1]      ), 
        
        .m_axis_tdata   ( fixed_pix_m_axis_tdata  ), 
        .m_axis_tvalid  ( fixed_pix_m_axis_tvalid ), 
        .m_axis_tready  ( fixed_pix_m_axis_tready ), 
        .m_axis_tlast   ( fixed_pix_m_axis_tlast  ),
        .m_axis_tuser   ( fixed_pix_m_axis_tuser  )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    axis_img_border_remover #
    (
        .BYPASS_BIT_MASK ( 16'h4000 )
    )
    axis_img_border_remover_inst
    (
        .axis_aclk      ( axis_aclk               ), 
        .axis_aresetn   ( axis_aresetn            ), 
        
        .s_axis_tdata   ( fixed_pix_m_axis_tdata  ), 
        .s_axis_tvalid  ( fixed_pix_m_axis_tvalid ), 
        .s_axis_tready  ( fixed_pix_m_axis_tready ), 
        .s_axis_tlast   ( fixed_pix_m_axis_tlast  ), 
        .s_axis_tuser   ( fixed_pix_m_axis_tuser  ), 
        
        .m_axis_tdata   ( m_axis_tdata            ), 
        .m_axis_tvalid  ( m_axis_tvalid           ), 
        .m_axis_tready  ( m_axis_tready           ), 
        .m_axis_tlast   ( m_axis_tlast            ),
        .m_axis_tuser   ( m_axis_tuser            )
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
