// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_unsigned_alpha_blend
        #(
            parameter   ALPHA_WIDTH = 8,
            parameter   DATA_WIDTH  = 8,
            parameter   USER_WIDTH  = 0,
            parameter   M_REGS      = 1,
            
            // local
            parameter   USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [ALPHA_WIDTH-1:0]   s_alpha,
            input   wire    [DATA_WIDTH-1:0]    s_data0,
            input   wire    [DATA_WIDTH-1:0]    s_data1,
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    localparam  PIPELINE_STAGES = 3;
    
    wire    [PIPELINE_STAGES-1:0]   stage_cke;
    wire    [PIPELINE_STAGES-1:0]   stage_valid;
    
    wire    [ALPHA_WIDTH-1:0]       src_alpha;
    wire    [DATA_WIDTH-1:0]        src_data0;
    wire    [DATA_WIDTH-1:0]        src_data1;
    wire    [USER_BITS-1:0]         src_user;
    
    wire    [DATA_WIDTH-1:0]        sink_data;
    wire    [USER_BITS-1:0]         sink_user;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+DATA_WIDTH+DATA_WIDTH+ALPHA_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+DATA_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (0),
                .MASTER_OUT_REGS    (M_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_user, s_data1, s_data0, s_alpha}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_data}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_data1, src_data0, src_alpha}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_data}),
                .buffered           ()
            );
    
    
    integer                                 i;
    reg     [DATA_WIDTH-1:0]                st0_data1;
    reg     [DATA_WIDTH-1:0]                st0_data0;
    reg     [ALPHA_WIDTH+DATA_WIDTH-1:0]    st0_alpha0;
    reg     [ALPHA_WIDTH+DATA_WIDTH-1:0]    st0_alpha1;
    reg     [USER_BITS-1:0]                 st0_user;
    
    reg     [DATA_WIDTH*2+ALPHA_WIDTH-1:0]  st1_data1;
    reg     [DATA_WIDTH*2+ALPHA_WIDTH-1:0]  st1_data0;
    reg     [USER_BITS-1:0]                 st1_user;
    
    reg     [DATA_WIDTH-1:0]                st2_data;
    reg     [USER_BITS-1:0]                 st2_user;
    
    always @(posedge clk) begin
        // stage 0
        if ( stage_cke[0] ) begin
            for ( i = 0; i < ALPHA_WIDTH+DATA_WIDTH; i = i+1 ) begin
                st0_alpha0[i] <=  src_alpha[(256*ALPHA_WIDTH + i - DATA_WIDTH) % ALPHA_WIDTH];
                st0_alpha1[i] <= ~src_alpha[(256*ALPHA_WIDTH + i - DATA_WIDTH) % ALPHA_WIDTH];
            end
            st0_data0 <= src_data0;
            st0_data1 <= src_data1;
            st0_user  <= src_user;
        end
        
        // stage 1
        if ( stage_cke[1] ) begin
            st1_data0 <= st0_data0 * st0_alpha0;
            st1_data1 <= st0_data1 * st0_alpha1;
            st1_user  <= st0_user;
        end
        
        // stage 2
        if ( stage_cke[2] ) begin
            st2_data <= (st1_data0 + st1_data1 + (1 << (DATA_WIDTH+ALPHA_WIDTH-1))) >> (DATA_WIDTH+ALPHA_WIDTH);
            st2_user <= st1_user;
        end
    end
    
    assign sink_data = st2_data;
    assign sink_user = st2_user;
    
    
endmodule



`default_nettype wire



// end of file
