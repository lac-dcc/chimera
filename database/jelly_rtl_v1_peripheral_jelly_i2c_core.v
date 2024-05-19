// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// I2C
module jelly_i2c_core
        #(
            parameter                           DIVIDER_WIDTH = 16
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [DIVIDER_WIDTH-1:0] clk_dvider,
            
            output  wire                        i2c_scl_t,
            input   wire                        i2c_scl_i,
            output  wire                        i2c_sda_t,
            input   wire                        i2c_sda_i,
            
            input   wire                        cmd_start,
            input   wire                        cmd_stop,
            input   wire                        cmd_ack,
            input   wire                        cmd_nak,
            input   wire                        cmd_recv,
            input   wire                        cmd_send,
            
            output  wire    [7:0]               recv_data,
            input   wire    [7:0]               send_data,
            output  wire                        ack_status,
            
            output  wire                        busy
        );
    
    
    // state
    localparam  [2:0]   ST_START = 3'd0, ST_STOP = 3'd1, ST_ACK = 3'd2, ST_NAK = 3'd3, ST_SEND = 3'd4, ST_RECV = 3'd5;
    
    reg                             reg_busy;
    reg     [2:0]                   reg_state;
    reg     [5:0]                   reg_counter;
    
    // output register
    reg                             reg_sda_t;
    reg                             reg_scl_t;
    
    // input double latch
    reg                             reg_scl0_i;
    reg                             reg_sda0_i;
    reg                             reg_scl_i;
    reg                             reg_sda_i;

    // clock dvider
    reg     [DIVIDER_WIDTH-1:0]     reg_clk_counter;
    reg                             reg_clk_triger;
    
    
    // input double latch
    always @ (posedge clk) begin
        if ( reset ) begin
            reg_scl0_i <= 1'b1;
            reg_sda0_i <= 1'b1;
            reg_scl_i  <= 1'b1;
            reg_sda_i  <= 1'b1;
        end
        else begin
            reg_scl0_i <= i2c_scl_i;
            reg_sda0_i <= i2c_sda_i;
            reg_scl_i  <= reg_scl0_i;
            reg_sda_i  <= reg_sda0_i;
        end
    end
    
    // clock dvider
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_clk_counter <= 0;
            reg_clk_triger  <= 1'b0;
        end
        else begin
            if ( reg_busy ) begin
                if ( !(reg_scl_t == 1'b1 && reg_scl_i == 1'b0) ) begin
                    if ( reg_clk_counter == 0 ) begin
                        reg_clk_counter <= clk_dvider;
                        reg_clk_triger  <= 1'b1;
                    end
                    else begin
                        reg_clk_counter <= reg_clk_counter - 1'b1;
                        reg_clk_triger  <= 1'b0;                        
                    end
                end
                else begin
                    reg_clk_triger  <= 1'b0;
                end
            end
            else begin
                // idle
                reg_clk_counter <= clk_dvider;
                reg_clk_triger  <= 1'b0;
            end
        end
    end
    
    
    // state machine
    reg     [7:0]   reg_recv_data;
    reg     [7:0]   reg_send_data;
    reg             reg_ack_status;
    
    wire    [5:0]   next_counter;
    assign next_counter = reg_counter + 1'b1;
    
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_busy       <= 1'b0;
            reg_state      <= 3'bxxx;
            reg_counter    <= 0;
            reg_recv_data  <= 8'hxx;
            reg_send_data  <= 8'hxx;
            reg_ack_status <= 1'b0;
        end
        else begin
            if ( !reg_busy ) begin
                if      ( cmd_stop  ) begin reg_state <= ST_STOP;  reg_busy <= 1'b1; end
                else if ( cmd_start ) begin reg_state <= ST_START; reg_busy <= 1'b1; end
                else if ( cmd_ack   ) begin reg_state <= ST_ACK;   reg_busy <= 1'b1; end
                else if ( cmd_nak   ) begin reg_state <= ST_NAK;   reg_busy <= 1'b1; end
                else if ( cmd_recv  ) begin reg_state <= ST_RECV;  reg_busy <= 1'b1; end
                else if ( cmd_send  ) begin reg_state <= ST_SEND;  reg_busy <= 1'b1; end
                
                reg_send_data <= send_data;
                reg_counter   <= 6'd0;
            end
            else begin
                if ( reg_clk_triger ) begin
                    reg_counter <= next_counter;
                    case ( reg_state )
                    ST_START:   if ( next_counter[2] )                  reg_busy <= 1'b0;   // reg_counter == 3
                    ST_STOP:    if ( next_counter[2] )                  reg_busy <= 1'b0;   // reg_counter == 3
                    ST_ACK:     if ( next_counter[2] )                  reg_busy <= 1'b0;   // reg_counter == 3
                    ST_NAK:     if ( next_counter[2] )                  reg_busy <= 1'b0;   // reg_counter == 3
                    ST_SEND:    if ( next_counter[2] & reg_counter[5] ) reg_busy <= 1'b0;   // reg_counter == 35
                    ST_RECV:    if ( next_counter[5])                   reg_busy <= 1'b0;   // reg_counter == 31
                    default:                                            reg_busy <= 1'bx;
                    endcase
                    
                    if ( reg_counter[1:0] == 2'b01 && !reg_counter[5] ) begin
                        reg_recv_data <= {reg_recv_data[6:0], reg_sda_i};
                    end
                    if ( reg_counter[1:0] == 2'b11 ) begin
                        reg_send_data[7:0] <= {reg_send_data[6:0], 1'b1};
                    end
                    if ( reg_counter[5] && reg_counter[1:0] == 2'b01 ) begin
                        reg_ack_status <= reg_sda_i;
                    end
                end
            end
        end
    end
    
    // output
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_scl_t     <= 1'b1;
            reg_sda_t     <= 1'b1;
        end
        else begin
            if ( reg_busy ) begin
                case ( reg_state )
                ST_START:
                    case ( reg_counter[1:0] )
                    2'b00:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b1; end
                    2'b01:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b0; end
                    2'b10:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b0; end
                    2'b11:   begin reg_scl_t <= 1'b0;  reg_sda_t <= 1'b0; end
                    endcase
                
                ST_STOP:
                    case ( reg_counter[1:0] )
                    2'b00:   begin reg_scl_t <= 1'b0;  reg_sda_t <= 1'b0; end
                    2'b01:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b0; end
                    2'b10:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b0; end
                    2'b11:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b1; end
                    endcase

                ST_ACK:
                    case ( reg_counter[1:0] )
                    2'b00:   begin reg_scl_t <= 1'b0;  reg_sda_t <= 1'b0; end
                    2'b01:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b0; end
                    2'b10:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b0; end
                    2'b11:   begin reg_scl_t <= 1'b0;  reg_sda_t <= 1'b0; end
                    endcase
                
                ST_NAK:
                    case ( reg_counter[1:0] )
                    2'b00:   begin reg_scl_t <= 1'b0;  reg_sda_t <= 1'b1; end
                    2'b01:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b1; end
                    2'b10:   begin reg_scl_t <= 1'b1;  reg_sda_t <= 1'b1; end
                    2'b11:   begin reg_scl_t <= 1'b0;  reg_sda_t <= 1'b1; end
                    endcase

                ST_SEND:
                    case ( reg_counter[1:0] )
                    2'b00:   begin reg_scl_t <= 1'b0; reg_sda_t <= reg_send_data[7]; end
                    2'b01:   begin reg_scl_t <= 1'b1; reg_sda_t <= reg_send_data[7]; end
                    2'b10:   begin reg_scl_t <= 1'b1; reg_sda_t <= reg_send_data[7]; end
                    2'b11:   begin reg_scl_t <= 1'b0; reg_sda_t <= reg_send_data[7]; end
                    endcase
                
                ST_RECV:
                    case ( reg_counter[1:0] )
                    2'b00:   begin reg_scl_t <= 1'b0; reg_sda_t <= 1'b1; end
                    2'b01:   begin reg_scl_t <= 1'b1; reg_sda_t <= 1'b1; end
                    2'b10:   begin reg_scl_t <= 1'b1; reg_sda_t <= 1'b1; end
                    2'b11:   begin reg_scl_t <= 1'b0; reg_sda_t <= 1'b1; end
                    endcase
                
                default:
                    begin
                        reg_scl_t     <= 1'b1;
                        reg_sda_t     <= 1'b1;                      
                    end
                endcase
            end
        end
    end
    
    assign i2c_scl_t  = reg_scl_t;
    assign i2c_sda_t  = reg_sda_t;
    assign recv_data  = reg_recv_data;
    assign ack_status = reg_ack_status;
    assign busy       = reg_busy;
    
endmodule


`default_nettype wire


// end of file

