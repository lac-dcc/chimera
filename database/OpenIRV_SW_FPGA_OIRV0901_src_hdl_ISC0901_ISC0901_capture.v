/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: ISC0901_capture.v
 *  Purpose:  ISC0901 data capturing module.
 *
 *            NOTE: there is no documentation for this sensor in public domain.
 *            That's why all sensor and module parameters, IO names, timings, 
 *            principles of working, absolutely everything is discovered from 
 *            scratch, i.e. there can be some mistakes and obscurities.
 *            Keep calm and have fun =)
 *
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


module ISC0901_capture
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire    rstn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS_BIAS:S_AXIS_CMD:M_AXIS_IMG:M_AXIS_RTEMP, ASSOCIATED_RESET rstn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire    clk,
    
    /* Sensor interface */
    output  wire    sensor_clk_fwd, 
    output  wire    sensor_cmd,      
    output  wire    sensor_bias,    
    input   wire    sensor_data_odd,
    input   wire    sensor_data_even,
    
    /* Auxiliary control output */
    output  reg     fifo_aresetn = 1'b1,
    output  reg     sof = 1'b0,
    output  wire    eol,
    
    /* Sensor bias data stream */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_BIAS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_BIAS TDATA"  *)     input   wire    [31:0]  s_axis_bias_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_BIAS TVALID" *)     input   wire            s_axis_bias_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_BIAS TREADY" *)     output  reg             s_axis_bias_tready = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_BIAS TLAST"  *)     input   wire            s_axis_bias_tlast,
    
    /* Sensor command stream*/
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_CMD, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CMD TDATA"  *)      input   wire    [31:0]  s_axis_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CMD TVALID" *)      input   wire            s_axis_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CMD TREADY" *)      output  reg             s_axis_cmd_tready = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CMD TLAST"  *)      input   wire            s_axis_cmd_tlast,
    
    /* Captured sensor data stream */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_IMG, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TDATA"  *)      output  wire    [31:0]  m_axis_img_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TVALID" *)      output  wire            m_axis_img_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TREADY" *)      input   wire            m_axis_img_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TLAST"  *)      output  wire            m_axis_img_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG TUSER"  *)      output  wire            m_axis_img_tuser,
    
    /* Captured sensor data stream */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_RTEMP, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RTEMP TDATA"  *)    output  wire    [31:0]  m_axis_rtemp_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RTEMP TVALID" *)    output  wire            m_axis_rtemp_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RTEMP TREADY" *)    input   wire            m_axis_rtemp_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RTEMP TLAST"  *)    output  wire            m_axis_rtemp_tlast
);
    
    localparam  SENSOR_RES_X   = 336;
    localparam  SENSOR_RES_Y   = 256;
    localparam  BITS_PER_PIXEL = 14;
    localparam  FRAME_PERIOD   = 1228500;   // Clock cycles at 73.636MHz
    localparam  LINE_PERIOD    = 4676;      // Clock cycles at 73.636MHz
    localparam  EXTRA_LINE_NUM = 3;         // Some meaningless 3 lines at the beginning of each new frame, that do not reflect image content, probably pipeline garbage???
    localparam  LINE_NUM       = (SENSOR_RES_Y + EXTRA_LINE_NUM);
    
    localparam  FULL_ROW_TICS  = (((SENSOR_RES_X / 2) + 1) * BITS_PER_PIXEL);    // Full row duration including 14-bit preamble (14'b10101010101010) at the beginning of each line (+1)
    
    localparam  CMD_SIZE          = 20;                 // Command size in bytes
    localparam  CMD_VEC_LEN       = CMD_SIZE * 8 + 16;  // Total command word length including 16-bit preamble
    localparam  CMD_VEC_PREAMBLE  = 16'h3fc0;           // Command preamble (Interesting: 0x3f = ~0xc0)
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [13:0]  pixel_odd  = {14{1'b0}};
    reg     [13:0]  pixel_even = {14{1'b0}};
    
    reg     [31:0]  frame_tc = {32{1'b0}};
    reg     [15:0]  line_tc  = {16{1'b0}};
    reg     [8:0]   line_cnt = {9{1'b0}};
    reg             line_last = 1'b0;
    
    reg             cmd_valid_wnd   = 1'b0;
    reg             line_valid_wnd  = 1'b0;
    reg             rtemp_valid     = 1'b0;
    
    reg     [3:0]   pixel_tc        = 4'h0;
    reg             pixel_valid     = 1'b0;
    reg     [7:0]   pixel_num       = 8'h00;
    reg             pixel_last      = 1'b0;
    reg             pixel_visible   = 1'b0;
    
    reg             bias_valid_wnd  = 1'b0;
    reg     [4:0]   quad_bias_rd_tc = 5'd1;
    reg             quad_bias_load  = 1'b0;
    
    wire            data_valid_wnd = line_valid_wnd & (line_cnt >= EXTRA_LINE_NUM) & (line_tc > (BITS_PER_PIXEL + 1));
    wire            ext_valid_wnd  = line_valid_wnd & (line_cnt >= 0) & (line_cnt < EXTRA_LINE_NUM) & (line_tc > (BITS_PER_PIXEL + 1));
    
    always @(posedge clk) begin
        if (~rstn) begin
            frame_tc  <= {32{1'b0}};
            line_tc   <= {16{1'b0}};
            line_cnt  <= {9{1'b0}};
            line_last <= 1'b0;
            
            sof          <= 1'b0;
            fifo_aresetn <= 1'b0;
            
            cmd_valid_wnd  <= 1'b0;
            line_valid_wnd <= 1'b0;
            rtemp_valid    <= 1'b0;
            
            pixel_tc       <= 4'h0;
            pixel_valid    <= 1'b0;
            pixel_num      <= 8'h00;
            pixel_last     <= 1'b0;
            pixel_visible  <= 1'b0;
            
            bias_valid_wnd     <= 1'b0;
            quad_bias_rd_tc    <= 5'd1;
            s_axis_bias_tready <= 1'b0;
            quad_bias_load     <= 1'b0;
        end else begin
        
            /* Frame counter */
            if (frame_tc == FRAME_PERIOD - 1) begin
                frame_tc <= {32{1'b0}};
            end else begin
                frame_tc <= frame_tc + 1'b1;
            end
            
            /* Line counter */
            if (frame_tc > 32'd201) begin
                if (line_tc == LINE_PERIOD - 1) begin
                    line_tc <= {16{1'b0}};
                    if (line_cnt < LINE_NUM) begin
                        line_cnt <= line_cnt + 1'b1;
                    end
                end else begin
                    line_tc <= line_tc + 1'b1;
                end
            end else begin
                line_tc <= {16{1'b0}};
                line_cnt <= {9{1'b0}};
            end
            
            /* Line valid window */
            if ((line_tc > 0) && (line_tc <= FULL_ROW_TICS) && (line_cnt < LINE_NUM)) begin
                line_valid_wnd <= 1'b1;
            end else begin
                line_valid_wnd <= 1'b0;
            end
            
            line_last <= (line_cnt == (LINE_NUM - 1));
            
            /* Bias valid window */
            bias_valid_wnd <= line_valid_wnd & (line_cnt < (LINE_NUM - EXTRA_LINE_NUM)) & (line_tc < (BITS_PER_PIXEL * (SENSOR_RES_X / 2) + 2));
            
            /* Bias read strobe */
            if (bias_valid_wnd) begin
                if (quad_bias_rd_tc == 5'd27) begin      // load new bias for 4 pixels each 28 tics
                    quad_bias_rd_tc <= {5{1'b0}};
                end else begin
                    quad_bias_rd_tc <= quad_bias_rd_tc + 1'b1;
                end
                
                if (quad_bias_rd_tc == 5'd26) begin
                    s_axis_bias_tready <= 1'b1;
                end else begin
                    s_axis_bias_tready <= 1'b0;
                end
                
                quad_bias_load <= s_axis_bias_tready;
                
            end else begin
                quad_bias_rd_tc <= 5'd1;
                s_axis_bias_tready <= 1'b0;
            end
            
            /* Command valid window */
            cmd_valid_wnd <= (frame_tc < CMD_VEC_LEN)? 1'b1 : 1'b0;
            
            /* Valid pixel and valid last pixel in line */
            if (data_valid_wnd | ext_valid_wnd) begin
                if (pixel_tc == 4'd13) begin
                    pixel_tc    <= 4'h0;
                    pixel_valid <= 1'b1;
                    
                    pixel_num <= pixel_num + 1'b1;  
                    if (pixel_num == (SENSOR_RES_X / 2 - 1)) begin    // assert "last" signal for AXI4-Stream at the end of the line
                        pixel_last <= 1'b1;
                    end else begin
                        pixel_last <= 1'b0;
                    end
                    
                end else begin
                    pixel_tc    <= pixel_tc + 1'b1;
                    pixel_valid <= 1'b0;
                    pixel_last  <= 1'b0;
                end
            end else begin
                pixel_tc    <= 4'b0;
                pixel_valid <= 1'b0;
                pixel_num   <= 8'b0;
                pixel_last  <= 1'b0;
            end
            
            /* Separates visible pixels from extended */
            pixel_visible <= data_valid_wnd;
            
            /* Row temperature valid strobe */
            rtemp_valid <= (line_tc == ((SENSOR_RES_X / 2 + 2) * BITS_PER_PIXEL + 1)) & (line_cnt >= 0) & (line_cnt < LINE_NUM);
            
            /* Start Of Frame strobe */
            sof <= (frame_tc == 32'd1222000)? 1'b1 : 1'b0;
            
            /* FIFO reset strobe */
            fifo_aresetn <= ((frame_tc > 32'd1221800) && (frame_tc < 32'd1221900))? 1'b0 : 1'b1;
        end
    end
    
    
    /* End Of Line strobe */
    assign  eol = rtemp_valid;
    
    assign  m_axis_img_tdata  = {2'b00, pixel_odd, 2'b00, pixel_even};
    assign  m_axis_img_tvalid = pixel_valid & pixel_visible;
    assign  m_axis_img_tlast  = pixel_last;
    assign  m_axis_img_tuser  = pixel_last & line_last;
    
    assign  m_axis_rtemp_tdata  = {2'b00, pixel_odd, 2'b00, pixel_even};
    assign  m_axis_rtemp_tvalid = rtemp_valid;
    assign  m_axis_rtemp_tlast  = 1'b1;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    /* 
     * Data is coming out of the sensor over two single ended lines.
     * Odd pixels are coming from the one line, even pixels - from another.
     * Each 14-bit pixel (odd and even) comes from the sensor LSB first.
     */
    
    always @(posedge clk) begin
        if (~rstn) begin
            pixel_odd  <= {14{1'b0}};
            pixel_even <= {14{1'b0}};
        end else begin
            pixel_odd  <= {sensor_data_odd,  pixel_odd[13:1]};
            pixel_even <= {sensor_data_even, pixel_even[13:1]};
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    /* 
     * Sensor pixel bias value is 7-bit long, but only 6 bits are significant.
     * Current values are sent LSB first. 
     */
    
    reg     [27:0]  quad_bias = {28{1'b0}};
    
    always @(posedge clk) begin
        if (bias_valid_wnd) begin
            if (quad_bias_load) begin
                quad_bias <= {
                                s_axis_bias_tdata[29:24], 1'b0, 
                                s_axis_bias_tdata[21:16], 1'b0, 
                                s_axis_bias_tdata[13:8],  1'b0, 
                                s_axis_bias_tdata[5:0],   1'b0
                             };
            end else begin
                quad_bias <= {quad_bias[0], quad_bias[27:1]};
            end
        end else begin
            quad_bias <= {
                            s_axis_bias_tdata[29:24], 1'b0, 
                            s_axis_bias_tdata[21:16], 1'b0, 
                            s_axis_bias_tdata[13:8],  1'b0, 
                            s_axis_bias_tdata[5:0],   1'b0
                         };
        end
    end
    
    assign  sensor_bias = quad_bias[0];
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [CMD_SIZE * 8 - 1:0]    cmd = {CMD_SIZE * 8{1'b0}};
    reg                             cmd_valid = 1'b0;
    
    localparam  [1:0]   ST_RESET = 2'd0,
                        ST_IDLE  = 2'd1,
                        ST_LOAD  = 2'd2;
    reg         [1:0]   state    = ST_RESET;
    
    /* AXI4-Stream command word reception FSM */
    always @(posedge clk) begin
        if (~rstn) begin
            s_axis_cmd_tready <= 1'b0;
            cmd_valid <= 1'b0;
            state <= ST_RESET;
        end else begin
            case (state)
                ST_RESET: begin
                    s_axis_cmd_tready <= 1'b0;
                    cmd_valid <= 1'b0;
                    state <= ST_IDLE;
                end
                
                ST_IDLE: begin
                    if (s_axis_cmd_tvalid) begin
                        s_axis_cmd_tready <= 1'b1;
                        cmd_valid <= 1'b0;
                        state <= ST_LOAD;
                    end
                end
                
                ST_LOAD: begin
                    if (s_axis_cmd_tvalid) begin
                        cmd <= {s_axis_cmd_tdata, cmd[CMD_SIZE * 8 - 1:32]};
                       
                        if (s_axis_cmd_tlast) begin
                            s_axis_cmd_tready <= 1'b0;
                            cmd_valid <= 1'b1;
                            state <= ST_IDLE;
                        end
                    end
                end
                
                default: begin
                    state <= ST_RESET;
                end
            endcase
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/ 
    
    reg     [CMD_VEC_LEN - 1:0] sensor_cmd_shreg = {CMD_VEC_PREAMBLE, {CMD_SIZE * 8{1'b0}}};
    
    /* Sensor command word updating process */
    always @(posedge clk) begin
        if (~rstn) begin
            sensor_cmd_shreg <= {CMD_VEC_PREAMBLE, {CMD_SIZE * 8{1'b0}}};
        end else begin
            if (cmd_valid_wnd) begin
                sensor_cmd_shreg <= {sensor_cmd_shreg[CMD_VEC_LEN - 2:0], sensor_cmd_shreg[CMD_VEC_LEN - 1]};
            end else begin
                if (cmd_valid) begin
                    sensor_cmd_shreg <= {CMD_VEC_PREAMBLE, cmd};
                end
            end
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    /* 
     * Forwarded clock (sensor_clk_fwd) is a full copy of the internal system clock (clk).
     * Sensor is working at the falling clock edge.
     *                              ______          ______          ______          ______        
     *                             /      \        /      \        /      \        /      \       
     *  clk / sensor_clk_fwd: ____/        \______/        \______/        \______/        \______
     *                        ____  ______________  ______________  ______________  ______________
     *                            \/              \/              \/              \/              
     *            sensor_cmd: ____/\______________/\______________/\______________/\______________
     *                        ____________  ______________  ______________  ______________  ______
     *                                    \/              \/              \/              \/      
     *       Sensor data odd: ____________/\______________/\______________/\______________/\______
     *                        ____________  ______________  ______________  ______________  ______
     *                                    \/              \/              \/              \/      
     *      Sensor data even: ____________/\______________/\______________/\______________/\______
     */
    
    
    /* Sensor clock buffer */
    ODDR #
    (
        .DDR_CLK_EDGE   ( "SAME_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0        ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "SYNC"      )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_sensor_clk_fwd
    (
        .Q  ( sensor_clk_fwd ),     // 1-bit DDR output
        .C  ( clk            ),     // 1-bit clock input
        .CE ( rstn        ),     // 1-bit clock enable input
        .D1 ( 1'b1           ),     // 1-bit data input (positive edge)
        .D2 ( 1'b0           ),     // 1-bit data input (negative edge)
        .R  ( 1'b0           ),     // 1-bit reset
        .S  ( 1'b0           )      // 1-bit set
    );
    
    
    /* Sensor data buffer */
    ODDR #
    (
        .DDR_CLK_EDGE   ( "SAME_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0        ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "SYNC"      )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_sensor_data_fwd
    (
        .Q  ( sensor_cmd                        ),  // 1-bit DDR output
        .C  ( clk                               ),  // 1-bit clock input
        .CE ( rstn                           ),  // 1-bit clock enable input
        .D1 ( sensor_cmd_shreg[CMD_VEC_LEN - 1] ),  // 1-bit data input (positive edge)
        .D2 ( sensor_cmd_shreg[CMD_VEC_LEN - 1] ),  // 1-bit data input (negative edge)
        .R  ( 1'b0                              ),  // 1-bit reset
        .S  ( 1'b0                              )   // 1-bit set
    );

    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
