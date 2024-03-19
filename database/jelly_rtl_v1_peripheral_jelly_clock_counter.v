// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//    64bit time counter
module jelly_clock_counter
        #(
            parameter                           WB_ADR_WIDTH  = 3,
            parameter                           WB_DAT_WIDTH  = 32,
            parameter                           WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
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
    localparam  CLOCK_COUNTER_ADR_CONTROL   = 3'b000;
    localparam  CLOCK_COUNTER_ADR_MONITOR_H = 3'b010;
    localparam  CLOCK_COUNTER_ADR_MONITOR_L = 3'b011;
    localparam  CLOCK_COUNTER_ADR_COUNTER_H = 3'b110;
    localparam  CLOCK_COUNTER_ADR_COUNTER_L = 3'b111;

    
    // control
    reg                 reg_copy_mon;
    reg                 reg_clear;
    
    reg     [63:0]      reg_counter;
    reg     [63:0]      reg_monitor;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_copy_mon <= 1'b0;
            reg_clear    <= 1'b0;
            
            reg_counter  <= 64'd0;
            reg_monitor  <= 64'd0;
        end
        else begin
            // control
            if ( s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0] & (s_wb_adr_i == CLOCK_COUNTER_ADR_CONTROL) ) begin
                reg_copy_mon <= s_wb_dat_i[0];
                reg_clear    <= s_wb_dat_i[7];
            end
            else begin
                reg_copy_mon <= 1'b0;       // auto clear;
                reg_clear    <= 1'b0;       // auto clear;
            end
            
            // counter
            if ( reg_clear ) begin
                reg_counter <= 64'd0;
            end
            else begin
                reg_counter <= reg_counter + 1;
            end
            
            // monitor
            if ( reg_copy_mon ) begin
                reg_monitor <= reg_counter;
            end
        end
    end
    
    always @* begin
        case ( s_wb_adr_i )
        CLOCK_COUNTER_ADR_CONTROL:      begin   s_wb_dat_o <= {reg_clear, 6'd0, reg_copy_mon};  end
        CLOCK_COUNTER_ADR_MONITOR_H:    begin   s_wb_dat_o <= reg_monitor[63:32];               end
        CLOCK_COUNTER_ADR_MONITOR_L:    begin   s_wb_dat_o <= reg_monitor[31:0];                end
        CLOCK_COUNTER_ADR_COUNTER_H:    begin   s_wb_dat_o <= reg_counter[63:32];               end
        CLOCK_COUNTER_ADR_COUNTER_L:    begin   s_wb_dat_o <= reg_counter[31:0];                end
        default:                        begin   s_wb_dat_o <= {WB_DAT_WIDTH{1'b0}};             end
        endcase
    end
    
    assign s_wb_ack_o = s_wb_stb_i;
    
endmodule


`default_nettype wire


//  end of file
