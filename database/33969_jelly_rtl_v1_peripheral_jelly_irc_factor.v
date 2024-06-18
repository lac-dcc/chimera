// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_irc_factor
        #(
            parameter FACTOR_ID_WIDTH = 2,
            parameter PRIORITY_WIDTH  = 3,
            
            parameter WB_ADR_WIDTH    = 2,
            parameter WB_DAT_WIDTH    = 32,
            parameter WB_SEL_WIDTH    = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire    [FACTOR_ID_WIDTH-1:0]   factor_id,
            
            // interrupt
            input   wire                            in_interrupt,
            
            // request
            input   wire                            reqest_reset,
            input   wire                            reqest_start,
            output  wire                            reqest_send,
            input   wire                            reqest_sense,
            
            // control port (wishbone)
            input   wire    [1:0]                   s_wb_adr_i,
            output  reg     [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o
        );
    
    localparam  PACKET_WIDTH    = PRIORITY_WIDTH + FACTOR_ID_WIDTH;
    
    // registers
    reg                             reg_enable;
    reg                             reg_pending;
    reg     [PRIORITY_WIDTH-1:0]    reg_priority;
    
    // interrupt
    wire                            interrupt_assert;
    assign interrupt_assert = reg_pending & reg_enable;
    
    
    // request send
    reg     [PACKET_WIDTH-1:0]      send_packet;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            send_packet  <= {PACKET_WIDTH{1'b1}};
        end
        else begin
            if ( reqest_reset | (reqest_send != reqest_sense) ) begin
                send_packet <= {PACKET_WIDTH{1'b1}};
            end
            else begin
                if ( interrupt_assert & reqest_start ) begin
                    send_packet  <= {reg_priority, factor_id};
                end
                else begin
                    send_packet  <= {send_packet, 1'b1};
                end
            end
        end
    end
    
    assign reqest_send = send_packet[PACKET_WIDTH-1];
    
    
    // registers
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_enable    <= 1'b0;
            reg_pending   <= 1'b0;
            reg_priority  <= {PRIORITY_WIDTH{1'b0}};
        end
        else begin
            // enable
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == 0) ) begin
                reg_enable <= s_wb_dat_i[0];
            end
            
            // pending
            if ( in_interrupt ) begin
                reg_pending <= 1'b1;
            end
            else if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == 1) ) begin
                reg_pending <= s_wb_dat_i[0];
            end
            
            // priority
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == 3) ) begin
                reg_priority <= s_wb_dat_i;
            end
        end
    end
    
    
    // s_wb_dat_o
    always @* begin
        if ( s_wb_stb_i ) begin
            case ( s_wb_adr_i[1:0] )
            2'b00:      s_wb_dat_o <= reg_enable;           // enable
            2'b01:      s_wb_dat_o <= reg_pending;      // pending
            2'b10:      s_wb_dat_o <= in_interrupt;     // status
            2'b11:      s_wb_dat_o <= reg_priority;     // priority
            default:    s_wb_dat_o <= {WB_DAT_WIDTH{1'b0}};
            endcase
        end
        else begin
            s_wb_dat_o <= {WB_DAT_WIDTH{1'b0}};
        end
    end
    
    assign s_wb_ack_o = s_wb_stb_i;
    
endmodule



`default_nettype wire


// end of file

