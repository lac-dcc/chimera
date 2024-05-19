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



// Interrupt controller
module jelly_irc
        #(
            parameter FACTOR_ID_WIDTH = 2,
            parameter FACTOR_NUM      = (1 << FACTOR_ID_WIDTH),
            parameter PRIORITY_WIDTH  = 3,
            
            parameter WB_ADR_WIDTH    = 16,
            parameter WB_DAT_WIDTH    = 32,
            parameter WB_SEL_WIDTH    = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // interrupt
            input   wire    [FACTOR_NUM-1:0]    in_interrupt,
            
            // connect for cpu
            output  wire                        cpu_irq,
            input   wire                        cpu_irq_ack,
            
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
    localparam  IRC_ADR_ENABLE        = 0;
    localparam  IRC_ADR_MASK          = 1;
    localparam  IRC_ADR_REQ_FACTOR_ID = 2;
    localparam  IRC_ADR_REQ_PRIORITY  = 3;
    localparam  IRC_ADR_FACTOR_NUM    = 4;
    localparam  IRC_ADR_PRIORITY_MAX  = 5;
    localparam  IRC_ADR_FACTOR_BASE   = 8;  
    
    // control register
    reg                             reg_enable;
    reg     [PRIORITY_WIDTH-1:0]    reg_mask;
    reg     [PRIORITY_WIDTH-1:0]    reg_req_priority;
    reg     [FACTOR_ID_WIDTH-1:0]   reg_req_factor_id;
    
    
    // -----------------------------
    //  recive request
    // -----------------------------

    reg                             prev_enable;
    reg     [PRIORITY_WIDTH-1:0]    recv_priority;
    reg     [FACTOR_ID_WIDTH-2:0]   recv_factor_id;
    
    wire    [FACTOR_NUM-1:0]        factor_request_send;
    wire                            request_recv;
    assign request_recv = (factor_request_send == {FACTOR_NUM{1'b1}});
    
    localparam  PACKET_WIDTH = (PRIORITY_WIDTH + FACTOR_ID_WIDTH);
    reg     [PACKET_WIDTH:0]        recv_counter;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            prev_enable       <= 1'b0;
            recv_priority     <= {PRIORITY_WIDTH{1'bx}};
            recv_factor_id    <= {(FACTOR_ID_WIDTH-1){1'bx}};
            reg_req_priority  <= {PRIORITY_WIDTH{1'b1}};
            reg_req_factor_id <= {PRIORITY_WIDTH{1'b0}};            
            recv_counter      <= {{PACKET_WIDTH-1{1'b0}}, 1'b1};
        end
        else begin
            prev_enable <= reg_enable;
            if ( reg_enable ) begin
                // posedge reg_enable
                if ( !prev_enable ) begin
                    reg_req_priority <= {PRIORITY_WIDTH{1'b1}};
                end
                
                // state counter
                recv_counter <= {recv_counter[PACKET_WIDTH-1:0], recv_counter[PACKET_WIDTH]};
                
                // packet receive
                {recv_priority, recv_factor_id} <= {recv_priority, recv_factor_id, request_recv};
                
                // recive end
                if ( recv_counter[PACKET_WIDTH] ) begin
                    {reg_req_priority, reg_req_factor_id} <= {recv_priority, recv_factor_id, request_recv};
                end
            end
            else begin
                recv_counter <= {{PACKET_WIDTH-1{1'b0}}, 1'b1};
            end
        end
    end
    
    assign cpu_irq = reg_enable & prev_enable & (reg_req_priority < reg_mask);
    
    
    
    // -----------------------------
    //  factors
    // -----------------------------
    
    wire    [(WB_DAT_WIDTH*FACTOR_NUM)-1:0]     factor_wb_dat_o;
    
    generate
    genvar  i;
    for ( i = FACTOR_NUM - 1; i >= 0; i = i - 1 ) begin : factor
        wire    [FACTOR_ID_WIDTH-1:0]   f_factor_id;
        assign f_factor_id = i;
        
        wire    [WB_DAT_WIDTH-1:0]      f_wb_dat_o;
        jelly_irc_factor
                #(
                    .FACTOR_ID_WIDTH    (FACTOR_ID_WIDTH),
                    .PRIORITY_WIDTH     (PRIORITY_WIDTH),
                    .WB_DAT_WIDTH       (WB_DAT_WIDTH)
                )
            i_irc_factor
                (
                    .reset          (reset),
                    .clk            (clk),

                    .factor_id      (f_factor_id),
                    
                    .in_interrupt   (in_interrupt[i]),
                    
                    .reqest_reset   (~reg_enable),
                    .reqest_start   (recv_counter[0]),
                    .reqest_send    (factor_request_send[i]),
                    .reqest_sense   (request_recv),
                    
                    .s_wb_adr_i     (s_wb_adr_i[1:0]),
                    .s_wb_dat_o     (f_wb_dat_o),
                    .s_wb_dat_i     (s_wb_dat_i),
                    .s_wb_we_i      (s_wb_we_i),
                    .s_wb_sel_i     (s_wb_sel_i),
                    .s_wb_stb_i     (s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:2] == (i + (IRC_ADR_FACTOR_BASE >> 2)))),
                    .s_wb_ack_o     ()
                );
        
        if ( i == (FACTOR_NUM - 1) ) begin
            assign factor_wb_dat_o[WB_DAT_WIDTH*(i+1)-1:WB_DAT_WIDTH*i] = f_wb_dat_o;
        end
        else begin
            assign factor_wb_dat_o[WB_DAT_WIDTH*(i+1)-1:WB_DAT_WIDTH*i] = f_wb_dat_o | factor_wb_dat_o[WB_DAT_WIDTH*(i+2)-1:WB_DAT_WIDTH*(i+1)];
        end
    end
    endgenerate
    
    

    // -----------------------------
    //  register access
    // -----------------------------
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_enable <= 1'b0;
            reg_mask   <= {PRIORITY_WIDTH{1'b1}};
        end
        else begin
            // enable
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == IRC_ADR_ENABLE) ) begin
                reg_enable <= s_wb_dat_i;
            end
            
            // mask
            if ( s_wb_stb_i & s_wb_we_i & (s_wb_adr_i == IRC_ADR_MASK) ) begin
                reg_mask <= s_wb_dat_i;
            end
        end
    end
    
    always @ * begin
        case ( s_wb_adr_i )
        IRC_ADR_ENABLE:         begin   s_wb_dat_o <= reg_enable;                           end
        IRC_ADR_MASK:           begin   s_wb_dat_o <= reg_mask;                             end
        IRC_ADR_REQ_FACTOR_ID:  begin   s_wb_dat_o <= reg_req_factor_id;                    end
        IRC_ADR_REQ_PRIORITY:   begin   s_wb_dat_o <= reg_req_priority;                     end
        IRC_ADR_FACTOR_NUM:     begin   s_wb_dat_o <= FACTOR_NUM;                           end
        IRC_ADR_PRIORITY_MAX:   begin   s_wb_dat_o <= (1 << PRIORITY_WIDTH) - 1;            end
        default:                begin   s_wb_dat_o <= factor_wb_dat_o[WB_DAT_WIDTH-1:0];    end
        endcase
    end
    
    assign s_wb_ack_o = s_wb_stb_i;
    
endmodule



`default_nettype wire


// end of file

