// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// shift right
module jelly_shift_pipeline
        #(
            parameter   SHIFT_WIDTH     = 8,
            parameter   DATA_WIDTH      = 48,
            parameter   STEP_BITS       = 4,
            
            parameter   ARITHMETIC      = 1,
            parameter   LEFT            = 0,
            
            parameter   USER_WIDTH      = 0,
            parameter   USER_BITS       = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   MASTER_IN_REGS  = 1,
            parameter   MASTER_OUT_REGS = 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [SHIFT_WIDTH-1:0]   s_shift,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    localparam  PIPELINE_STAGES = (SHIFT_WIDTH + (STEP_BITS-1)) / STEP_BITS;
    
    wire    [PIPELINE_STAGES-1:0]   stage_cke;
    wire    [PIPELINE_STAGES-1:0]   stage_valid;
    
    wire    [USER_BITS-1:0]         src_user;
    wire    [SHIFT_WIDTH-1:0]       src_shift;
    wire    [DATA_WIDTH-1:0]        src_data;
    
    wire    [USER_BITS-1:0]         sink_user;
    wire    [DATA_WIDTH-1:0]        sink_data;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+SHIFT_WIDTH+DATA_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+DATA_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_user, s_shift, s_data}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_data}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_shift, src_data}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_data}),
                .buffered           ()
            );
    
    wire    [SHIFT_WIDTH-1:0]   shift_mask = ((1 << STEP_BITS) - 1);
    
    
    reg     [PIPELINE_STAGES*USER_BITS-1:0]     reg_user;
    reg     [PIPELINE_STAGES*SHIFT_WIDTH-1:0]   reg_shift;
    reg     [PIPELINE_STAGES*DATA_WIDTH-1:0]    reg_data;

    integer                                     i;
    reg     [SHIFT_WIDTH-1:0]                   shift;
    
    always @(posedge clk) begin
        for ( i = 0; i < PIPELINE_STAGES; i = i+1 ) begin
            if ( stage_cke[i] ) begin
                if ( i == 0 ) begin
                    reg_user [i*USER_BITS   +: USER_BITS]    <= src_user;
                    reg_shift[i*SHIFT_WIDTH +: SHIFT_WIDTH]  <= (src_shift & ~shift_mask);
                    
                    shift = (src_shift & shift_mask);
                    if ( LEFT ) begin
                        reg_data[i*DATA_WIDTH +: DATA_WIDTH] <= (src_data << shift);
                    end
                    else begin
                        if ( ARITHMETIC ) begin
                            reg_data [i*DATA_WIDTH +: DATA_WIDTH] <= ($signed(src_data) >>> shift);
                        end
                        else begin
                            reg_data [i*DATA_WIDTH +: DATA_WIDTH] <= (src_data >> shift);
                        end
                    end
                end
                else begin
                    reg_user [i*USER_BITS   +: USER_BITS]   <= reg_user [(i-1)*USER_BITS   +: USER_BITS];
                    reg_shift[i*SHIFT_WIDTH +: SHIFT_WIDTH] <= (reg_shift[(i-1)*SHIFT_WIDTH +: SHIFT_WIDTH] & ~(shift_mask << (i*STEP_BITS)));
                    
                    shift = (reg_shift[(i-1)*SHIFT_WIDTH +: SHIFT_WIDTH] & (shift_mask << (i*STEP_BITS)));
                    if ( LEFT ) begin
                        reg_data[i*DATA_WIDTH +: DATA_WIDTH] <= (reg_data[(i-1)*DATA_WIDTH +: DATA_WIDTH] << shift);
                    end
                    else begin
                        if ( ARITHMETIC ) begin
                            reg_data [i*DATA_WIDTH +: DATA_WIDTH] <= ($signed(reg_data[(i-1)*DATA_WIDTH +: DATA_WIDTH]) >>> shift);
                        end
                        else begin
                            reg_data [i*DATA_WIDTH +: DATA_WIDTH] <= (reg_data[(i-1)*DATA_WIDTH +: DATA_WIDTH] >> shift);
                        end
                    end
                end
            end
        end
    end
    
    assign sink_user = reg_user[(PIPELINE_STAGES-1)*USER_BITS  +: USER_BITS];
    assign sink_data = reg_data[(PIPELINE_STAGES-1)*DATA_WIDTH +: DATA_WIDTH];
    
endmodule



`default_nettype wire



// end of file
