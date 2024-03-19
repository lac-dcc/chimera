// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


// I2C
module jelly_i2c
        #(
            parameter                           DIVIDER_WIDTH = 16,
            parameter                           DIVIDER_INIT  = 2000,
            
            parameter                           WB_ADR_WIDTH  = 3,
            parameter                           WB_DAT_WIDTH  = 32,
            parameter                           WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // I2C
            output  wire                        i2c_scl_t,
            input   wire                        i2c_scl_i,
            output  wire                        i2c_sda_t,
            input   wire                        i2c_sda_i,
            
            // WISHBONE
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            output  wire                        irq
        );

    // register define
    localparam  I2C_STATUS    = 3'b000;
    localparam  I2C_CONTROL   = 3'b001;
    localparam  I2C_SEND      = 3'b010;
    localparam  I2C_RECV      = 3'b011;
    localparam  I2C_DIVIDER   = 3'b100;

    localparam  CONTROL_START = 0;
    localparam  CONTROL_STOP  = 1;
    localparam  CONTROL_ACK   = 2;
    localparam  CONTROL_NAK   = 3;
    localparam  CONTROL_RECV  = 4;
    
    
    // -------------------------
    //   Core
    // -------------------------
            
    reg     [DIVIDER_WIDTH-1:0] clk_dvider;
    wire                        cmd_start;
    wire                        cmd_stop;
    wire                        cmd_ack;
    wire                        cmd_nak;
    wire                        cmd_recv;
    wire                        cmd_send;
    wire    [7:0]               recv_data;
    wire    [7:0]               send_data;
    wire                        ack_status;
    wire                        busy;
    
    jelly_i2c_core
            #(
                .DIVIDER_WIDTH      (DIVIDER_WIDTH)
            )
        i_i2c_core
            (
                .reset              (reset),
                .clk                (clk),
                
                .clk_dvider         (clk_dvider),
                
                .i2c_scl_t          (i2c_scl_t),
                .i2c_scl_i          (i2c_scl_i),
                .i2c_sda_t          (i2c_sda_t),
                .i2c_sda_i          (i2c_sda_i),
                
                .cmd_start          (cmd_start),
                .cmd_stop           (cmd_stop),
                .cmd_ack            (cmd_ack),
                .cmd_nak            (cmd_nak),
                .cmd_recv           (cmd_recv),
                .cmd_send           (cmd_send),
                .recv_data          (recv_data),
                .send_data          (send_data),
                .ack_status         (ack_status),
                
                .busy               (busy)
            );
    
    // -------------------------
    //  register
    // -------------------------

    always @(posedge clk) begin
        if ( reset ) begin
            clk_dvider <= DIVIDER_INIT;
        end
        else begin
            if ( (s_wb_adr_i == I2C_DIVIDER) & s_wb_stb_i & s_wb_we_i ) begin
                clk_dvider <= s_wb_dat_i;
            end
        end
    end
    
    assign cmd_start   = (s_wb_adr_i == I2C_CONTROL) & s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0] & s_wb_dat_i[CONTROL_START];
    assign cmd_stop    = (s_wb_adr_i == I2C_CONTROL) & s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0] & s_wb_dat_i[CONTROL_STOP];
    assign cmd_ack     = (s_wb_adr_i == I2C_CONTROL) & s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0] & s_wb_dat_i[CONTROL_ACK]; 
    assign cmd_nak     = (s_wb_adr_i == I2C_CONTROL) & s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0] & s_wb_dat_i[CONTROL_NAK];
    assign cmd_recv    = (s_wb_adr_i == I2C_CONTROL) & s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0] & s_wb_dat_i[CONTROL_RECV];
    assign cmd_send    = (s_wb_adr_i == I2C_SEND)    & s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0];
    assign send_data   = s_wb_dat_i[7:0];
    
    assign s_wb_dat_o  = (s_wb_adr_i == I2C_STATUS)  ? {i2c_scl_i, i2c_sda_i, i2c_scl_t, i2c_sda_t, ack_status, 2'b00, busy} :
                         (s_wb_adr_i == I2C_RECV)    ? recv_data  :
                         (s_wb_adr_i == I2C_DIVIDER) ? clk_dvider : 0;
    
    assign s_wb_ack_o  = s_wb_stb_i;
    
    assign irq         = ~busy;
    
endmodule


`default_nettype wire

// end of file
