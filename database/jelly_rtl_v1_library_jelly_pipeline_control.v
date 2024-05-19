// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// pipeline control
module jelly_pipeline_control
        #(
            parameter   PIPELINE_STAGES   = 2,
            parameter   S_DATA_WIDTH      = 8,
            parameter   M_DATA_WIDTH      = 8,
            parameter   AUTO_VALID        = 0,
            parameter   INIT_DATA         = {M_DATA_WIDTH{1'bx}},
            parameter   MASTER_IN_REGS    = 1,
            parameter   MASTER_OUT_REGS   = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            // slave port
            input   wire    [S_DATA_WIDTH-1:0]      s_data,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            // master port
            output  wire    [M_DATA_WIDTH-1:0]      m_data,
            output  wire                            m_valid,
            input   wire                            m_ready,
            
            // internal
            output  wire    [PIPELINE_STAGES-1:0]   stage_cke,
            output  wire    [PIPELINE_STAGES-1:0]   stage_valid,
            input   wire    [PIPELINE_STAGES-1:0]   next_valid,
            output  wire    [S_DATA_WIDTH-1:0]      src_data,
            output  wire                            src_valid,
            input   wire    [M_DATA_WIDTH-1:0]      sink_data,
            output  wire                            buffered
        );
    
    
    // auto valid control
    genvar                          j;
    wire    [PIPELINE_STAGES-1:0]   tmp_next_valid;
    generate
    if ( AUTO_VALID ) begin
        assign tmp_next_valid[0] = stage_cke[0] ? src_valid : stage_valid[0];
        for ( j = 1; j < PIPELINE_STAGES; j = j+1 ) begin : valid_loop
            assign tmp_next_valid[j] = stage_cke[j] ? stage_valid[j-1] : stage_valid[j];
        end
    end
    else begin
        for ( j = 0; j < PIPELINE_STAGES; j = j+1 ) begin : valid_loop
            assign tmp_next_valid[j] = stage_cke[j] ? next_valid[j] :  stage_valid[j];
        end
    end
    endgenerate
    
    
    generate
    if ( MASTER_IN_REGS ) begin
        // CKEをFF打ち
        
        // cke
        integer                         i;
        wire                            sink_ready_next;
        reg     [PIPELINE_STAGES-1:0]   reg_cke,     next_cke;
        reg                             reg_s_ready, next_s_ready;
        always @* begin
            next_cke[PIPELINE_STAGES-1] = (sink_ready_next || !tmp_next_valid[PIPELINE_STAGES-1]);
            for ( i = PIPELINE_STAGES-2; i >= 0; i = i-1 ) begin
                next_cke[i] = (next_cke[i+1] || !tmp_next_valid[i]);
            end
            next_s_ready = next_cke[0];
        end
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_cke     <= {PIPELINE_STAGES{1'b1}};
                reg_s_ready <= 1'b1;
            end
            else if ( cke ) begin
                reg_cke     <= next_cke;
                reg_s_ready <= next_s_ready;
            end
        end
        
        // valid
        reg     [PIPELINE_STAGES-1:0]   reg_valid;
        always @(posedge clk) begin
            for ( i = 0; i < PIPELINE_STAGES; i = i+1 ) begin
                if ( reset ) begin
                    reg_valid[i] <= 1'b0;
                end
                else if ( cke && reg_cke[i] ) begin
                    reg_valid[i] <= tmp_next_valid[i];
                end
            end
        end
        
        // slave port
        assign s_ready = reg_s_ready;
        
        // master port
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (M_DATA_WIDTH),
                    .SLAVE_REGS     (1'b1),
                    .MASTER_REGS    (MASTER_OUT_REGS),
                    .INIT_DATA      (INIT_DATA)
                )
            i_pipeline_insert_ff
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         (sink_data),
                    .s_valid        (stage_valid[PIPELINE_STAGES-1]),
                    .s_ready        (),
                    
                    .m_data         (m_data),
                    .m_valid        (m_valid),
                    .m_ready        (m_ready),
                    
                    .buffered       (buffered),
                    .s_ready_next   (sink_ready_next)
                );
        
        // internal
        assign stage_cke   = reg_cke & {PIPELINE_STAGES{cke}};
        assign stage_valid = reg_valid;
        
        assign src_data    = s_data;
        assign src_valid   = s_valid;
    end
    else begin
        // CKEを組み合わせ生成
        
        // master port
        wire    ff_valid;
        wire    ff_ready;
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (M_DATA_WIDTH),
                    .SLAVE_REGS     (1'b0),
                    .MASTER_REGS    (MASTER_OUT_REGS),
                    .INIT_DATA      (INIT_DATA)
                )
            i_pipeline_insert_ff
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         (sink_data),
                    .s_valid        (ff_valid),
                    .s_ready        (ff_ready),
                    
                    .m_data         (m_data),
                    .m_valid        (m_valid),
                    .m_ready        (m_ready),
                    
                    .buffered       (buffered),
                    .s_ready_next   ()
                );
        assign ff_valid = stage_valid[PIPELINE_STAGES-1];
        
        
        // cke
        assign stage_cke[PIPELINE_STAGES-1] = ((!ff_valid || ff_ready) && cke);
        for ( j = 0; j < PIPELINE_STAGES-1; j = j+1 ) begin : cke_loop
            assign stage_cke[j] = ((!stage_valid[j] || stage_cke[j+1]) && cke);
        end
        
        assign s_ready = stage_cke[0];
        
        // valid
        integer                         i;
        reg     [PIPELINE_STAGES-1:0]   reg_valid;
        always @(posedge clk) begin
            for ( i = 0; i < PIPELINE_STAGES; i = i+1 ) begin
                if ( reset ) begin
                    reg_valid[i] <= 1'b0;
                end
                else if ( cke ) begin
                    reg_valid[i] <= tmp_next_valid[i];
                end
            end
        end
        
        assign stage_valid = reg_valid;
        
        
        // internal
        assign src_data    = s_data;
        assign src_valid   = s_valid;
        
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
