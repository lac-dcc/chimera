// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_integer_divider
        #(
            parameter   USER_WIDTH          = 0,
            parameter   S_DIVIDEND_WIDTH    = 16,
            parameter   S_DIVISOR_WIDTH     = 16,
            parameter   M_QUOTIENT_WIDTH    = S_DIVIDEND_WIDTH,
            parameter   M_REMAINDER_WIDTH   = S_DIVISOR_WIDTH,
            parameter   MASTER_IN_REGS      = 1,
            parameter   MASTER_OUT_REGS     = 1,
            parameter   DEVICE              = "RTL",
            parameter   NORMALIZE_REMAINDER = 1, 
            parameter   NORMALIZE_STAGES    = 1,
            
            parameter   USER_BITS           = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire            [USER_BITS-1:0]         s_user,
            input   wire    signed  [S_DIVIDEND_WIDTH-1:0]  s_dividend,
            input   wire    signed  [S_DIVISOR_WIDTH-1:0]   s_divisor,
            input   wire                                    s_valid,
            output  wire                                    s_ready,
            
            output  wire            [USER_BITS-1:0]         m_user,
            output  wire    signed  [M_QUOTIENT_WIDTH-1:0]  m_quotient,
            output  wire            [M_REMAINDER_WIDTH-1:0] m_remainder,
            output  wire                                    m_valid,
            input   wire                                    m_ready
        );
    
    
    localparam  N = M_QUOTIENT_WIDTH;
    
    
    // ----------------------------------------
    //  pipeline control
    // ----------------------------------------
    
    localparam  PIPELINE_STAGES = N + NORMALIZE_STAGES;
    
    wire            [PIPELINE_STAGES-1:0]       stage_cke;
    wire            [PIPELINE_STAGES-1:0]       stage_valid;
    
    
    wire            [USER_BITS-1:0]             src_user;
    wire    signed  [S_DIVIDEND_WIDTH-1:0]      src_dividend;
    wire    signed  [S_DIVISOR_WIDTH-1:0]       src_divisor;
    
    wire            [USER_BITS-1:0]             sink_user;
    wire    signed  [M_QUOTIENT_WIDTH-1:0]      sink_quotient;
    wire            [M_REMAINDER_WIDTH-1:0]     sink_remainder;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+S_DIVIDEND_WIDTH+S_DIVISOR_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+M_QUOTIENT_WIDTH+M_REMAINDER_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_user, s_dividend, s_divisor}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_quotient, m_remainder}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_dividend, src_divisor}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_quotient, sink_remainder}),
                .buffered           ()
            );
    
    
    // ----------------------------------------
    //  calcurate
    // ----------------------------------------
    
    wire            [USER_BITS-1:0]         first_user;
    wire    signed  [0:0]                   first_dividend;     // sign only
    wire    signed  [S_DIVISOR_WIDTH-1:0]   first_divisor;
    wire    signed  [M_QUOTIENT_WIDTH-1:0]  first_quotient;
    wire    signed  [M_REMAINDER_WIDTH-1:0] first_remainder;
    
    assign first_dividend                    = src_dividend[S_DIVIDEND_WIDTH-1];
    assign {first_remainder, first_quotient} = {{M_REMAINDER_WIDTH{src_dividend[S_DIVIDEND_WIDTH-1]}}, src_dividend};
    assign first_divisor                     = src_divisor;
    assign first_user                        = src_user;
    
    
    wire    [(N+1)*USER_BITS-1:0]           stages_user;
    wire    [(N+1)-1:0]                     stages_dividend;
    wire    [(N+1)*S_DIVISOR_WIDTH-1:0]     stages_divisor;
    wire    [(N+1)*M_QUOTIENT_WIDTH-1:0]    stages_quotient;
    wire    [(N+1)*M_REMAINDER_WIDTH-1:0]   stages_remainder;
    
    assign stages_user     [0*USER_BITS         +: USER_BITS]         = first_user;
    assign stages_dividend [0*1                 +: 1]                 = first_dividend;
    assign stages_divisor  [0*S_DIVISOR_WIDTH   +: S_DIVISOR_WIDTH]   = first_divisor;
    assign stages_quotient [0*M_QUOTIENT_WIDTH  +: M_QUOTIENT_WIDTH]  = first_quotient;
    assign stages_remainder[0*M_REMAINDER_WIDTH +: M_REMAINDER_WIDTH] = first_remainder;
    
    
    genvar  i;
    
    generate
    for ( i = 0; i < N; i = i+1 ) begin : loop_div
        wire            [USER_BITS-1:0]         in_user      = stages_user     [i*USER_BITS         +: USER_BITS];
        wire    signed  [0:0]                   in_dividend  = stages_dividend [i*1                 +: 1];
        wire    signed  [S_DIVISOR_WIDTH-1:0]   in_divisor   = stages_divisor  [i*S_DIVISOR_WIDTH   +: S_DIVISOR_WIDTH];
        wire    signed  [M_QUOTIENT_WIDTH-1:0]  in_quotient  = stages_quotient [i*M_QUOTIENT_WIDTH  +: M_QUOTIENT_WIDTH];
        wire    signed  [M_REMAINDER_WIDTH-1:0] in_remainder = stages_remainder[i*M_REMAINDER_WIDTH +: M_REMAINDER_WIDTH];
        
        
        wire    signed  [M_QUOTIENT_WIDTH-1:0]  tmp_quotient;
        wire    signed  [M_REMAINDER_WIDTH:0]   tmp_remainder;
        assign {tmp_remainder, tmp_quotient} = ({in_remainder, in_quotient} <<< 1);
        
        reg             [USER_BITS-1:0]         reg_user;
        reg     signed  [0:0]                   reg_dividend;
        reg     signed  [S_DIVISOR_WIDTH-1:0]   reg_divisor;
        reg     signed  [M_QUOTIENT_WIDTH-1:0]  reg_quotient;
        reg     signed  [M_REMAINDER_WIDTH-1:0] reg_remainder;
        
        always @(posedge clk) begin
            if ( stage_cke[i] ) begin
                reg_user      <= in_user;
                reg_dividend  <= in_dividend;
                reg_divisor   <= in_divisor;
                reg_quotient  <= tmp_quotient;
                
                if ( tmp_remainder[M_REMAINDER_WIDTH] == in_divisor[S_DIVISOR_WIDTH-1] ) begin
                    reg_remainder   <= tmp_remainder - in_divisor;
                    reg_quotient[0] <= 1'b1;
                end
                else begin
                    reg_remainder   <= tmp_remainder + in_divisor;
                    reg_quotient[0] <= 1'b0;
                end
            end
        end
        
        
        assign stages_user     [(i+1)*USER_BITS         +: USER_BITS]         = reg_user;
        assign stages_dividend [(i+1)*1                 +: 1]                 = reg_dividend;
        assign stages_divisor  [(i+1)*S_DIVISOR_WIDTH   +: S_DIVISOR_WIDTH]   = reg_divisor;
        assign stages_quotient [(i+1)*M_QUOTIENT_WIDTH  +: M_QUOTIENT_WIDTH]  = reg_quotient;
        assign stages_remainder[(i+1)*M_REMAINDER_WIDTH +: M_REMAINDER_WIDTH] = reg_remainder;
    end
    endgenerate

    wire            [USER_BITS-1:0]             last_user      = stages_user     [N*USER_BITS         +: USER_BITS];
    wire    signed  [0:0]                       last_dividend  = stages_dividend [N*1                 +: 1];
    wire    signed  [S_DIVISOR_WIDTH-1:0]       last_divisor   = stages_divisor  [N*S_DIVISOR_WIDTH   +: S_DIVISOR_WIDTH];
    wire    signed  [M_QUOTIENT_WIDTH-1:0]      last_quotient  = {stages_quotient[N*M_QUOTIENT_WIDTH  +: M_QUOTIENT_WIDTH], 1'b1};
    wire    signed  [M_REMAINDER_WIDTH-1:0]     last_remainder = stages_remainder[N*M_REMAINDER_WIDTH +: M_REMAINDER_WIDTH];
    
    generate
    if ( NORMALIZE_STAGES == 1 ) begin
        wire    signed  [M_QUOTIENT_WIDTH-1:0]      inc_quotient  = last_quotient  + 1;
        wire    signed  [M_QUOTIENT_WIDTH-1:0]      dec_quotient  = last_quotient  - 1;
        wire    signed  [M_REMAINDER_WIDTH-1:0]     inc_remainder = last_remainder + last_divisor;
        wire    signed  [M_REMAINDER_WIDTH-1:0]     dec_remainder = last_remainder - last_divisor;
        
        reg             [USER_BITS-1:0]             reg_user;
        reg     signed  [M_QUOTIENT_WIDTH-1:0]      reg_quotient;
        reg     signed  [M_REMAINDER_WIDTH-1:0]     reg_remainder;
        
        
        always @(posedge clk) begin
            if ( stage_cke[N] ) begin
                reg_user      <= last_user;
                reg_quotient  <= last_quotient;
                reg_remainder <= last_remainder;
                
                if ( NORMALIZE_REMAINDER ) begin
                    if ( last_remainder == last_divisor ) begin
                        reg_quotient  <= inc_quotient;
                        reg_remainder <= dec_remainder;
                    end
                    else if ( last_remainder == -last_divisor ) begin
                        reg_quotient  <= dec_quotient;
                        reg_remainder <= inc_remainder;
                    end
                    else if ( last_remainder != 0 ) begin
                        case ( {last_dividend[0], last_remainder[M_REMAINDER_WIDTH-1], last_divisor[S_DIVISOR_WIDTH-1]} )
                        3'b010: begin   reg_quotient <= dec_quotient; reg_remainder <= inc_remainder;   end
                        3'b011: begin   reg_quotient <= inc_quotient; reg_remainder <= dec_remainder;   end
                        3'b100: begin   reg_quotient <= inc_quotient; reg_remainder <= dec_remainder;   end
                        3'b101: begin   reg_quotient <= dec_quotient; reg_remainder <= inc_remainder;   end
                        default: ;
                        endcase
                    end
                end
                else begin
                    if ( last_remainder == last_divisor ) begin
                        reg_quotient  <= inc_quotient;
                        reg_remainder <= 0;
                    end
                    else if ( last_remainder == -last_divisor ) begin
                        reg_quotient  <= dec_quotient;
                        reg_remainder <= 0;
                    end
                end
            end
        end
        
        assign sink_user      = reg_user;
        assign sink_quotient  = reg_quotient;
        assign sink_remainder = reg_remainder;
    end
    else if (  NORMALIZE_STAGES == 2 ) begin
    
        reg             [USER_BITS-1:0]             st0_user;
        reg     signed  [M_QUOTIENT_WIDTH-1:0]      st0_quotient;
        reg     signed  [M_REMAINDER_WIDTH-1:0]     st0_remainder;
        reg     signed  [S_DIVISOR_WIDTH-1:0]       st0_divisor;
        reg                                         st0_correct;
        reg                                         st0_increment;
        
        reg             [USER_BITS-1:0]             st1_user;
        reg     signed  [M_QUOTIENT_WIDTH-1:0]      st1_quotient;
        reg     signed  [M_REMAINDER_WIDTH-1:0]     st1_remainder;

        always @(posedge clk) begin
            if ( stage_cke[N+0] ) begin
                st0_user          <= last_user;
                st0_quotient      <= last_quotient;
                st0_remainder     <= last_remainder;
                st0_divisor       <= 0;
                st0_correct       <= 0;
                st0_increment     <= 0;
                
                if ( last_remainder == last_divisor ) begin
                    st0_divisor   <= last_divisor;
                    st0_correct   <= 1'b1;
                    st0_increment <= 1'b1;
                end
                else if ( last_remainder == -last_divisor ) begin
                    st0_divisor   <= last_divisor;
                    st0_correct   <= 1'b1;
                    st0_increment <= 1'b0;
                end
                else if ( NORMALIZE_REMAINDER && last_remainder != 0 ) begin
                    case ( {last_dividend[0], last_remainder[M_REMAINDER_WIDTH-1], last_divisor[S_DIVISOR_WIDTH-1]} )
                    3'b010: begin   st0_divisor <= last_divisor; st0_correct <= 1'b1; st0_increment <= 1'b0;    end
                    3'b011: begin   st0_divisor <= last_divisor; st0_correct <= 1'b1; st0_increment <= 1'b1;    end
                    3'b100: begin   st0_divisor <= last_divisor; st0_correct <= 1'b1; st0_increment <= 1'b1;    end
                    3'b101: begin   st0_divisor <= last_divisor; st0_correct <= 1'b1; st0_increment <= 1'b0;    end
                    endcase
                end
            end
            
            if ( stage_cke[N+1] ) begin
                st1_user          <= st0_user;
                st1_quotient      <= st0_increment ? st0_quotient  + st0_correct : st0_quotient  - st0_correct;
                st1_remainder     <= st0_increment ? st0_remainder - st0_divisor : st0_remainder + st0_divisor;
            end
        end
        
        assign sink_user      = st1_user;
        assign sink_quotient  = st1_quotient;
        assign sink_remainder = st1_remainder;      
    end
    endgenerate
    
endmodule



`default_nettype wire



// end of file
