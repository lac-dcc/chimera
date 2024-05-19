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



module jelly_gpio
        #(
            parameter   WB_ADR_WIDTH   = 2,
            parameter   WB_DAT_WIDTH   = 32,
            parameter   WB_SEL_WIDTH   = (WB_DAT_WIDTH / 8),
            parameter   PORT_WIDTH     = 8,
            parameter   INIT_DIRECTION = 0,
            parameter   INIT_OUTPUT    = 0,
            parameter   DIRECTION_MASK = 0
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // port
            input   wire    [PORT_WIDTH-1:0]    port_i,
            output  wire    [PORT_WIDTH-1:0]    port_o,
            output  wire    [PORT_WIDTH-1:0]    port_t,
            
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
    localparam  GPIO_ADR_DIRECTION = 2'b00;
    localparam  GPIO_ADR_INPUT     = 2'b01;
    localparam  GPIO_ADR_OUTPUT    = 2'b10;
    
    
    // control
    reg     [PORT_WIDTH-1:0]    reg_direction;
    reg     [PORT_WIDTH-1:0]    reg_output;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_direction <= INIT_DIRECTION;
            reg_output    <= INIT_OUTPUT;
        end
        else begin
            // direction
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == GPIO_ADR_DIRECTION) ) begin
                reg_direction <= ((reg_direction & DIRECTION_MASK) | (s_wb_dat_i[PORT_WIDTH-1:0] & ~DIRECTION_MASK));
            end
            
            // output
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == GPIO_ADR_OUTPUT) ) begin
                reg_output <= s_wb_dat_i[PORT_WIDTH-1:0];
            end
        end
    end
    
    assign port_o = reg_output;
    assign port_t = ~reg_direction;
    
    always @* begin
        case ( s_wb_adr_i )
        GPIO_ADR_DIRECTION: begin   s_wb_dat_o <= reg_direction;            end
        GPIO_ADR_INPUT:     begin   s_wb_dat_o <= port_i;                   end
        GPIO_ADR_OUTPUT:    begin   s_wb_dat_o <= reg_output;               end
        default:            begin   s_wb_dat_o <= {WB_DAT_WIDTH{1'b0}};     end
        endcase
    end
    
    assign s_wb_ack_o = s_wb_stb_i;
    
endmodule



`default_nettype wire


// end of file
