/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: lcd_ctrl.v
 *  Purpose:  LCD data consumer module. Integrates SPI interface, LCD
 *            initialization ROM, OSD (On Screen Display) multiplexer.
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


module lcd_ctrl #
(
    parameter   integer LCD_CLK_HZ = 0,
    parameter   [15:0]  TRANSPARENT_PIX_COLOR = 16'hFFFF
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_RSTIF RST" *)
    input   wire    s_axis_aresetn,

    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS_IMG:S_AXIS_OSD, ASSOCIATED_RESET s_axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_CLKIF CLK" *)
    input   wire    s_axis_aclk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_IMG, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TDATA"  *)  input   wire    [31:0]  s_axis_img_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TVALID" *)  input   wire            s_axis_img_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TREADY" *)  output  reg             s_axis_img_tready = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_IMG TUSER"  *)  input   wire            s_axis_img_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_OSD, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 2, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OSD TDATA"  *)  input   wire    [15:0]  s_axis_osd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OSD TVALID" *)  input   wire            s_axis_osd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OSD TREADY" *)  output  reg             s_axis_osd_tready = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OSD TUSER"  *)  input   wire    [1:0]   s_axis_osd_tuser,
    
    output  wire    lcd_spi_scl,
    output  wire    lcd_spi_sda,
    output  reg     lcd_resetn = 1'b0
);

/*----------------------------------------------------------------------------------*/

    localparam  LCD_INIT_ROM_CMD_ADDR = 6'h00;
    localparam  LCD_INIT_ROM_CMD_SIZE = 8'd56;
    
    localparam  NEW_FRAME_ROM_CMD_ADDR = 6'h38;
    localparam  NEW_FRAME_ROM_CMD_SIZE = 8'd11;
    
    localparam  LCD_REG_ADDR  = 2'b00,
                LCD_DAT_BYTE  = 2'b01,
                LCD_CMD_DELAY = 2'b10,
                LCD_CMD_RESET = 2'b11;
    
    localparam  CMD  = 1'b0,
                DATA = 1'b1;
                
    localparam  TIMER_MS_DELAY = LCD_CLK_HZ / 1000;

/*----------------------------------------------------------------------------------*/

    reg     oddr_cen  = 1'b0;
    
    reg     [17:0]  lcd_sda_reg = {18{1'b0}}; 
    
    reg     [4:0]   bit_cnt = 5'd0;
    reg             last_pix = 1'b0;
    
    reg     [6:0]   cmd_cnt   = 7'd0;
    reg     [7:0]   cmd_delay = 8'd0;
    
    reg     [6:0]   cmd_rom_addr = 7'd0;
    wire    [9:0]   cmd_rom_dq;
    
    reg     [31:0]  timer_ms = {32{1'b0}};
    reg             timer_ms_hit = 1'b0;
    
    wire            img_eof = s_axis_img_tuser;
    wire            osd_eof = s_axis_osd_tuser[1];
    
/*----------------------------------------------------------------------------------*/

    localparam  [2:0]   ST_WR_CMD_0            = 3'd0,
                        ST_WR_CMD_1            = 3'd1,
                        ST_WR_CMD_2            = 3'd2,
                        ST_WR_CMD_3            = 3'd3,
                        ST_WR_CMD_4            = 3'd4,
                        ST_WR_CMD_5            = 3'd5,
                        ST_WR_CMD_DONE         = 3'd6,
                        FSM_WR_CMD_RESET_STATE = ST_WR_CMD_0;
    
    reg         [2:0]   wr_cmd_state = FSM_WR_CMD_RESET_STATE;
    wire                wr_cmd_done  = (wr_cmd_state == ST_WR_CMD_DONE);

    task wr_cmd;
        input   [6:0]   start_rom_addr;
        input   [7:0]   cmd_size;
    begin
        case (wr_cmd_state)
            
            ST_WR_CMD_0: begin
                cmd_cnt      <= 7'd1;
                cmd_rom_addr <= start_rom_addr;
                wr_cmd_state <= ST_WR_CMD_2;
            end
            
            ST_WR_CMD_1: begin
                if (cmd_cnt != cmd_size) begin
                    cmd_cnt      <= cmd_cnt + 1'b1;
                    cmd_rom_addr <= cmd_rom_addr + 1'b1;
                    wr_cmd_state <= ST_WR_CMD_2;
                end else begin
                    wr_cmd_state <= ST_WR_CMD_DONE;
                end
            end
            
            ST_WR_CMD_2: begin
                /* ROM single cycle latency */
                wr_cmd_state <= ST_WR_CMD_3;
            end
            
            ST_WR_CMD_3: begin
                case (cmd_rom_dq[9:8])
                    LCD_REG_ADDR: begin
                        oddr_cen     <= 1'b1;
                        bit_cnt      <= 5'd0;
                        lcd_sda_reg  <= {CMD, cmd_rom_dq[7:0], {9{1'b0}}};
                        wr_cmd_state <= ST_WR_CMD_4;
                    end
                    
                    LCD_DAT_BYTE: begin
                        oddr_cen     <= 1'b1;
                        bit_cnt      <= 5'd0;
                        lcd_sda_reg  <= {DATA, cmd_rom_dq[7:0], {9{1'b0}}};
                        wr_cmd_state <= ST_WR_CMD_4;
                    end
                    
                    LCD_CMD_DELAY: begin
                        cmd_delay    <= 8'd0;
                        wr_cmd_state <= ST_WR_CMD_5;
                    end
                    
                    LCD_CMD_RESET: begin
                        lcd_resetn <= ~cmd_rom_dq[0];
                        wr_cmd_state <= ST_WR_CMD_1;
                    end
                endcase
            end
            
            ST_WR_CMD_4: begin
                if (bit_cnt != 5'd8) begin
                    bit_cnt <= bit_cnt + 1'b1;
                    lcd_sda_reg  <= {lcd_sda_reg[16:0], lcd_sda_reg[17]};
                end else begin
                    oddr_cen     <= 1'b0;
                    wr_cmd_state <= ST_WR_CMD_1;
                end
            end
            
            ST_WR_CMD_5: begin
                if (cmd_delay != cmd_rom_dq[7:0]) begin
                    if (timer_ms_hit) begin
                        cmd_delay <= cmd_delay + 1'b1;
                    end
                end else begin
                    wr_cmd_state <= ST_WR_CMD_1;
                end
            end
            
            ST_WR_CMD_DONE: begin
                wr_cmd_state <= FSM_WR_CMD_RESET_STATE;
            end
            
            default: begin
                wr_cmd_state <= FSM_WR_CMD_RESET_STATE;
            end
        endcase
    end
    endtask

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    localparam  [1:0]   ST_FILL_SCREEN_0            = 2'd0,
                        ST_FILL_SCREEN_1            = 2'd1,
                        ST_FILL_SCREEN_2            = 2'd2,
                        ST_FILL_SCREEN_DONE         = 2'd3,
                        FSM_FILL_SCREEN_RESET_STATE = ST_FILL_SCREEN_0;
    
    reg         [1:0]   fill_screen_state = FSM_FILL_SCREEN_RESET_STATE;
    wire                fill_screen_done  = (fill_screen_state == ST_FILL_SCREEN_DONE);

    task fill_screen;
    begin
        case (fill_screen_state)
            
            ST_FILL_SCREEN_0: begin
                last_pix          <= 1'b0;
                s_axis_img_tready <= 1'b0;
                s_axis_osd_tready <= 1'b0;
                fill_screen_state <= ST_FILL_SCREEN_1;
            end
            
            ST_FILL_SCREEN_1: begin
                if (~last_pix) begin
                    if (s_axis_img_tvalid & s_axis_osd_tvalid) begin
                        last_pix          <= img_eof & osd_eof;
                        s_axis_img_tready <= 1'b1;
                        s_axis_osd_tready <= 1'b1;
                        oddr_cen          <= 1'b1;
                        bit_cnt           <= 5'd0;
                        lcd_sda_reg       <= (s_axis_osd_tdata == TRANSPARENT_PIX_COLOR)? {DATA, s_axis_img_tdata[15:8], DATA, s_axis_img_tdata[7:0]} :
                                                                                          {DATA, s_axis_osd_tdata[15:8], DATA, s_axis_osd_tdata[7:0]};
                        fill_screen_state <= ST_FILL_SCREEN_2;
                    end else begin
                        oddr_cen <= 1'b0;
                    end
                end else begin
                    oddr_cen <= 1'b0;
                    fill_screen_state <= ST_FILL_SCREEN_DONE;
                end
            end
            
            ST_FILL_SCREEN_2: begin
                s_axis_img_tready <= 1'b0;
                s_axis_osd_tready <= 1'b0;
            
                if (bit_cnt != 5'd16) begin
                    bit_cnt <= bit_cnt + 1'b1;
                end else begin
                    fill_screen_state <= ST_FILL_SCREEN_1;
                end
            
                lcd_sda_reg <= {lcd_sda_reg[16:0], lcd_sda_reg[17]};
            end
            
            ST_FILL_SCREEN_DONE: begin
                fill_screen_state <= FSM_FILL_SCREEN_RESET_STATE;
            end
            
        endcase
    end
    endtask

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    task local_rst;
    begin
        wr_cmd_state      <= FSM_WR_CMD_RESET_STATE;
        fill_screen_state <= FSM_FILL_SCREEN_RESET_STATE;
        
        s_axis_img_tready <= 1'b0;
        s_axis_osd_tready <= 1'b0;
        
        oddr_cen <= 1'b0;
        last_pix <= 1'b0;
        lcd_resetn <= 1'b0;
    end
    endtask

/*-------------------------------------------------------------------------------------------------------------------------------------*/
                        
    localparam  [2:0]   ST_RESET         = 3'd0,
                        ST_LCD_INIT      = 3'd1,
                        ST_IMG_SYNC      = 3'd2,
                        ST_OSD_SYNC      = 3'd3,
                        ST_WAIT_VSYNC    = 3'd4,
                        ST_SET_START_POS = 3'd5,
                        ST_FILL_SCREEN   = 3'd6;
                        
    reg         [2:0]   state = ST_RESET;
    
    
    always @(posedge s_axis_aclk) begin
        if (~s_axis_aresetn) begin
            local_rst();
            state <= ST_RESET;
        end else begin
            case (state)
                ST_RESET: begin
                    local_rst();
                    state <= ST_LCD_INIT;
                end
                
                ST_LCD_INIT: begin
                    wr_cmd(LCD_INIT_ROM_CMD_ADDR, LCD_INIT_ROM_CMD_SIZE);
                    state <= (wr_cmd_done)? ST_IMG_SYNC : state;
                end
                
                ST_IMG_SYNC: begin
                    if (s_axis_img_tvalid & s_axis_img_tready & img_eof) begin
                        s_axis_img_tready <= 1'b0;
                        state <= ST_OSD_SYNC;
                    end else begin
                        s_axis_img_tready <= 1'b1;
                    end
                end
                
                ST_OSD_SYNC: begin
                    if (s_axis_osd_tvalid & s_axis_osd_tready & osd_eof) begin
                        s_axis_osd_tready <= 1'b0;
                        state <= ST_WAIT_VSYNC;
                    end else begin
                        s_axis_osd_tready <= 1'b1;
                    end
                end
                
                ST_WAIT_VSYNC: begin
                    // Wait for tearing strobe here?
                    state <= ST_SET_START_POS;
                end
                
                ST_SET_START_POS: begin
                    wr_cmd(NEW_FRAME_ROM_CMD_ADDR, NEW_FRAME_ROM_CMD_SIZE);
                    state <= (wr_cmd_done)? ST_FILL_SCREEN : state;
                end
                
                ST_FILL_SCREEN: begin
                    fill_screen();
                    state <= (fill_screen_done)? ST_WAIT_VSYNC : state;
                end
                
                default: begin
                    state <= ST_RESET;
                end
            endcase
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    always @(posedge s_axis_aclk) begin
        if (~s_axis_aresetn) begin
            timer_ms <= {32{1'b0}};
        end else begin
            if (timer_ms == TIMER_MS_DELAY) begin
                timer_ms <= {32{1'b0}};
                timer_ms_hit <= 1'b1;
            end else begin
                timer_ms <= timer_ms + 1'b1;
                timer_ms_hit <= 1'b0;
            end
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    /* -----------------------------------------------------
     * ROM 64 x 10 bit
     * -----------------------------------------------------
     * 1. LCD register address:
     *     cmd[9:8] = 2'h0
     *     cmd[7:0] = 8'hxx - LCD register address value
     * 
     * 2. LCD data value:
     *     cmd[9:8] = 2'h1
     *     cmd[7:0] = 8'hxx - LCD register data value
     * 
     * 3. DELAY command:
     *     cmd[9:8] = 2'h2
     *     cmd[7:0] = 8'hxx - delay value in ms
     * 
     * 3. LCD reset pin command:
     *     cmd[9:8] = 2'h3
     *     cmd[7:0] = 8'bxxxx_xxx0 - release reset pin
     *                8'bxxxx_xxx1 - assert reset pin
     * -----------------------------------------------------
     */
    
    rom128xN #
    (
        .OUTPUT_REG ( "TRUE" ),
        .DATA_WIDTH ( 10     ),
        
        .INIT_ROM_00    ( 10'h3_01 ),   // assert LCD reset pin
        .INIT_ROM_01    ( 10'h2_0A ),   // delay 10ms
        .INIT_ROM_02    ( 10'h3_00 ),   // release LCD reset pin
        .INIT_ROM_03    ( 10'h2_78 ),   // delay 120ms
        .INIT_ROM_04    ( 10'h0_c8 ),   // EXTC
        .INIT_ROM_05    ( 10'h1_FF ),   //
        .INIT_ROM_06    ( 10'h1_93 ),   //
        .INIT_ROM_07    ( 10'h1_42 ),   //
        .INIT_ROM_08    ( 10'h0_36 ),   // Memory Access Control
        .INIT_ROM_09    ( 10'h1_c8 ),   //
        .INIT_ROM_0A    ( 10'h0_3A ),   // Pixel Format Set
        .INIT_ROM_0B    ( 10'h1_55 ),   //
        .INIT_ROM_0C    ( 10'h0_C0 ),   // Power Control 1
        .INIT_ROM_0D    ( 10'h1_10 ),   //
        .INIT_ROM_0E    ( 10'h1_10 ),   //
        .INIT_ROM_0F    ( 10'h0_C1 ),   // Power Control 2
        .INIT_ROM_10    ( 10'h1_36 ),   //
        .INIT_ROM_11    ( 10'h0_C5 ),   // VCOM Control 1
        .INIT_ROM_12    ( 10'h1_C3 ),   //
        .INIT_ROM_13    ( 10'h0_E0 ),   // Positive Gamma Correction
        .INIT_ROM_14    ( 10'h1_00 ),   //
        .INIT_ROM_15    ( 10'h1_05 ),   //
        .INIT_ROM_16    ( 10'h1_08 ),   //
        .INIT_ROM_17    ( 10'h1_02 ),   //
        .INIT_ROM_18    ( 10'h1_1A ),   //
        .INIT_ROM_19    ( 10'h1_0C ),   //
        .INIT_ROM_1A    ( 10'h1_42 ),   //
        .INIT_ROM_1B    ( 10'h1_7A ),   //
        .INIT_ROM_1C    ( 10'h1_54 ),   //
        .INIT_ROM_1D    ( 10'h1_08 ),   //
        .INIT_ROM_1E    ( 10'h1_0D ),   //
        .INIT_ROM_1F    ( 10'h1_0C ),   //
        .INIT_ROM_20    ( 10'h1_23 ),   //
        .INIT_ROM_21    ( 10'h1_25 ),   //
        .INIT_ROM_22    ( 10'h1_0F ),   //
        .INIT_ROM_23    ( 10'h0_E1 ),   // Negative Gamma Correction
        .INIT_ROM_24    ( 10'h1_00 ),   //
        .INIT_ROM_25    ( 10'h1_29 ),   //
        .INIT_ROM_26    ( 10'h1_2F ),   //
        .INIT_ROM_27    ( 10'h1_03 ),   //
        .INIT_ROM_28    ( 10'h1_0F ),   //
        .INIT_ROM_29    ( 10'h1_05 ),   //
        .INIT_ROM_2A    ( 10'h1_42 ),   //
        .INIT_ROM_2B    ( 10'h1_55 ),   //
        .INIT_ROM_2C    ( 10'h1_53 ),   //
        .INIT_ROM_2D    ( 10'h1_06 ),   //
        .INIT_ROM_2E    ( 10'h1_0F ),   //
        .INIT_ROM_2F    ( 10'h1_0C ),   //
        .INIT_ROM_30    ( 10'h1_38 ),   //
        .INIT_ROM_31    ( 10'h1_3A ),   //
        .INIT_ROM_32    ( 10'h1_0F ),   //
        .INIT_ROM_33    ( 10'h0_35 ),   // Tearing Effect Line ON
        .INIT_ROM_34    ( 10'h1_00 ),   //
        .INIT_ROM_35    ( 10'h0_11 ),   // Sleep Out
        .INIT_ROM_36    ( 10'h2_78 ),   // delay 120ms
        .INIT_ROM_37    ( 10'h0_29 ),   // Display ON
        
        // Address_set(X1, Y1, X2, Y2) = (0, 0, 239, 319)
        .INIT_ROM_38    ( 10'h0_2A ),   // Column Address Set (Y1, Y2)
        .INIT_ROM_39    ( 10'h1_00 ),   //
        .INIT_ROM_3A    ( 10'h1_00 ),   //
        .INIT_ROM_3B    ( 10'h1_01 ),   //
        .INIT_ROM_3C    ( 10'h1_3F ),   //
        .INIT_ROM_3D    ( 10'h0_2B ),   // Page Address Set (X1, X2)
        .INIT_ROM_3E    ( 10'h1_00 ),   //
        .INIT_ROM_3F    ( 10'h1_00 ),   //
        .INIT_ROM_40    ( 10'h1_00 ),   //
        .INIT_ROM_41    ( 10'h1_EF ),   //
        .INIT_ROM_42    ( 10'h0_2C )    // Memory Write
    )
    lcd_cmd_rom
    (
        .clk  ( s_axis_aclk  ),
        .cen  ( 1'b1         ),
        .addr ( cmd_rom_addr ),
        .dout ( cmd_rom_dq   )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg oddr_cen_sync = 1'b0;
    
    always @(negedge s_axis_aclk) begin
        oddr_cen_sync <= oddr_cen;
    end
    
    
    ODDR #
    (
        .DDR_CLK_EDGE   ( "OPPOSITE_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0            ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "ASYNC"         )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_clk
    (
        .Q  ( lcd_spi_scl   ),  // 1-bit DDR output
        .C  ( s_axis_aclk   ),  // 1-bit clock input
        .CE ( oddr_cen_sync ),  // 1-bit clock enable input
        .D1 ( oddr_cen_sync ),  // 1-bit data input (positive edge)
        .D2 ( 1'b0          ),  // 1-bit data input (negative edge)
        .R  ( 1'b0          ),  // 1-bit reset
        .S  ( 1'b0          )   // 1-bit set
    );
    
    
    ODDR #
    (
        .DDR_CLK_EDGE   ( "OPPOSITE_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0            ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "ASYNC"         )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_dat
    (
        .Q  ( lcd_spi_sda     ),    // 1-bit DDR output
        .C  ( s_axis_aclk     ),    // 1-bit clock input
        .CE ( oddr_cen        ),    // 1-bit clock enable input
        .D1 ( lcd_sda_reg[17] ),    // 1-bit data input (positive edge)
        .D2 ( lcd_sda_reg[17] ),    // 1-bit data input (negative edge)
        .R  ( 1'b0            ),    // 1-bit reset
        .S  ( 1'b0            )     // 1-bit set
    );
    
endmodule


/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
