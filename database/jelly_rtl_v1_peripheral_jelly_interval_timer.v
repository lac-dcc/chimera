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


//    Timer
module jelly_interval_timer
        #(
            parameter WB_ADR_WIDTH  = 2,
            parameter WB_DAT_WIDTH  = 32,
            parameter WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8),
            parameter IRQ_LEVEL     = 0
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // irq
            output  reg                         interrupt_req,
            
            // control port (wishbone)
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  reg     [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o
        );
    
    // register address
    localparam  INTERVAL_TIMER_ADR_CONTROL = 2'b00;
    localparam  INTERVAL_TIMER_ADR_COMPARE = 2'b01;
    localparam  INTERVAL_TIMER_ADR_COUNTER = 2'b11;
    
    
    // control
    reg                 reg_enable;
    reg                 reg_clear;
    reg     [31:0]      reg_counter;
    reg     [31:0]      reg_compare;
    
    wire                compare_match;
    assign compare_match = (reg_counter == reg_compare);
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_enable    <= 1'b0;
            reg_clear     <= 1'b0;
            reg_counter   <= 0;
            reg_compare   <= 50000 - 1;
            interrupt_req <= 1'b0;
        end
        else begin
            // control
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == INTERVAL_TIMER_ADR_CONTROL) ) begin
                reg_enable <= s_wb_dat_i[0];
                reg_clear  <= s_wb_dat_i[1];
            end
            else begin
                reg_clear  <= 1'b0;     // auto clear;
            end
            
            // compare
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == INTERVAL_TIMER_ADR_COMPARE) ) begin
                reg_compare <= s_wb_dat_i;
            end
            
            // counter
            if ( compare_match | reg_clear ) begin
                reg_counter <= 0;
            end
            else if ( reg_enable ) begin
                reg_counter <= reg_counter + 1'b1;
            end
            
            // interrupt
            if ( compare_match ) begin
                interrupt_req <= reg_enable;
            end
            else begin
                if ( IRQ_LEVEL && &s_wb_stb_i && (s_wb_adr_i == INTERVAL_TIMER_ADR_CONTROL) ) begin
                    interrupt_req <= 1'b0;
                end
                else if ( !IRQ_LEVEL ) begin
                    interrupt_req <= 1'b0;
                end
            end
        end
    end
    
    always @* begin
        s_wb_dat_o = {WB_DAT_WIDTH{1'b0}};
        case ( s_wb_adr_i )
        INTERVAL_TIMER_ADR_CONTROL: begin   s_wb_dat_o = {29'd0, interrupt_req, reg_clear, reg_enable};  end
        INTERVAL_TIMER_ADR_COMPARE: begin   s_wb_dat_o = reg_compare;                             end
        INTERVAL_TIMER_ADR_COUNTER: begin   s_wb_dat_o = reg_counter;                             end
        default:                    begin   s_wb_dat_o = {WB_DAT_WIDTH{1'b0}};                    end
        endcase
    end
    
    assign s_wb_ack_o = s_wb_stb_i;
    
endmodule


`default_nettype wire


//  end of file
