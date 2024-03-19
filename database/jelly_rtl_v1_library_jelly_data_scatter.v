// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_data_scatter
        #(
            parameter   PORT_NUM       = 4,
            parameter   DATA_WIDTH     = 32,
            parameter   LINE_SIZE      = 640,
            parameter   UNIT_SIZE      = (LINE_SIZE + (PORT_NUM-1)) / PORT_NUM,
            parameter   FIFO_PTR_WIDTH = 6,
            parameter   FIFO_RAM_TYPE  = "distributed",
            parameter   S_REGS         = 1,
            parameter   M_REGS         = 1,
            parameter   INTERNAL_REGS  = (PORT_NUM > 32)
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            
            input   wire    [DATA_WIDTH-1:0]            s_data,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            output  wire    [PORT_NUM*DATA_WIDTH-1:0]   m_data,
            output  wire    [PORT_NUM-1:0]              m_valid,
            input   wire    [PORT_NUM-1:0]              m_ready
        );
    
    localparam  SEL_WIDTH        = PORT_NUM  <=     2 ?  1 :
                                   PORT_NUM  <=     4 ?  2 :
                                   PORT_NUM  <=     8 ?  3 :
                                   PORT_NUM  <=    16 ?  4 :
                                   PORT_NUM  <=    32 ?  5 :
                                   PORT_NUM  <=    64 ?  6 :
                                   PORT_NUM  <=   128 ?  7 :
                                   PORT_NUM  <=   256 ?  8 :
                                   PORT_NUM  <=   512 ?  9 :
                                   PORT_NUM  <=  1024 ? 10 :
                                   PORT_NUM  <=  2048 ? 11 : 12;
    
    localparam  UNIT_COUNT_WIDTH = UNIT_SIZE <=     2 ?  1 :
                                   UNIT_SIZE <=     4 ?  2 :
                                   UNIT_SIZE <=     8 ?  3 :
                                   UNIT_SIZE <=    16 ?  4 :
                                   UNIT_SIZE <=    32 ?  5 :
                                   UNIT_SIZE <=    64 ?  6 :
                                   UNIT_SIZE <=   128 ?  7 :
                                   UNIT_SIZE <=   256 ?  8 :
                                   UNIT_SIZE <=   512 ?  9 :
                                   UNIT_SIZE <=  1024 ? 10 :
                                   UNIT_SIZE <=  2048 ? 11 :
                                   UNIT_SIZE <=  4096 ? 12 :
                                   UNIT_SIZE <=  8192 ? 13 :
                                   UNIT_SIZE <= 16384 ? 14 :
                                   UNIT_SIZE <= 32768 ? 15 : 16;
    
    localparam  LINE_COUNT_WIDTH = LINE_SIZE <=     2 ?  1 :
                                   LINE_SIZE <=     4 ?  2 :
                                   LINE_SIZE <=     8 ?  3 :
                                   LINE_SIZE <=    16 ?  4 :
                                   LINE_SIZE <=    32 ?  5 :
                                   LINE_SIZE <=    64 ?  6 :
                                   LINE_SIZE <=   128 ?  7 :
                                   LINE_SIZE <=   256 ?  8 :
                                   LINE_SIZE <=   512 ?  9 :
                                   LINE_SIZE <=  1024 ? 10 :
                                   LINE_SIZE <=  2048 ? 11 :
                                   LINE_SIZE <=  4096 ? 12 :
                                   LINE_SIZE <=  8192 ? 13 :
                                   LINE_SIZE <= 16384 ? 14 :
                                   LINE_SIZE <= 32768 ? 15 : 16;
    
    
    genvar      i;
    
    generate
    if ( PORT_NUM < 2 ) begin : blk_bypass
        assign m_data  = s_data;
        assign m_valid = s_valid;
        assign s_ready = m_ready;
    end
    else begin : blk_scatter
        
        // insert FF
        wire    [DATA_WIDTH-1:0]    s_ff_data;
        wire                        s_ff_valid;
        wire                        s_ff_ready;
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .SLAVE_REGS     (S_REGS),
                    .MASTER_REGS    (S_REGS)
                )
            i_pipeline_insert_ff
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (1'b1),
                    
                    .s_data         (s_data),
                    .s_valid        (s_valid),
                    .s_ready        (s_ready),
                    
                    .m_data         (s_ff_data),
                    .m_valid        (s_ff_valid),
                    .m_ready        (s_ff_ready),
                    
                    .buffered       (),
                    .s_ready_next   ()
                );
        
        // selector
        reg     [SEL_WIDTH-1:0]         reg_sel;
        reg     [UNIT_COUNT_WIDTH-1:0]  reg_unit_count;
        reg     [LINE_COUNT_WIDTH-1:0]  reg_line_count;
        
        wire    [PORT_NUM-1:0]          fifo_valid;
        wire    [PORT_NUM-1:0]          fifo_ready;
        
        assign s_ff_ready = fifo_ready[reg_sel];
        assign fifo_valid = ({{(PORT_NUM-1){1'b0}}, s_ff_valid} << reg_sel);
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_sel        <= {SEL_WIDTH{1'b0}};
                reg_unit_count <= {UNIT_COUNT_WIDTH{1'b0}};
                reg_line_count <= {LINE_COUNT_WIDTH{1'b0}};
            end
            else begin
                if ( s_ff_valid && s_ff_ready ) begin
                    reg_unit_count <= reg_unit_count + 1'b1;
                    reg_line_count <= reg_line_count + 1'b1;
                    
                    if ( reg_unit_count == (UNIT_SIZE-1) ) begin
                        reg_sel        <= reg_sel + 1'b1;
                        reg_unit_count <= {UNIT_COUNT_WIDTH{1'b0}};
                    end
                    
                    if ( reg_line_count == LINE_SIZE - 1) begin
                        reg_sel        <= {SEL_WIDTH{1'b0}};
                        reg_unit_count <= {UNIT_COUNT_WIDTH{1'b0}};
                        reg_line_count <= {LINE_COUNT_WIDTH{1'b0}};
                    end
                end
            end
        end
        
        // FIFO
        for ( i = 0; i < PORT_NUM; i = i+1 ) begin : loop_fifo
            wire    [DATA_WIDTH-1:0]    fifo_ff_data;
            wire                        fifo_ff_valid;
            wire                        fifo_ff_ready;
            
            jelly_pipeline_insert_ff
                    #(
                        .DATA_WIDTH     (DATA_WIDTH),
                        .SLAVE_REGS     (INTERNAL_REGS),
                        .MASTER_REGS    (INTERNAL_REGS)
                    )
                i_pipeline_insert_ff
                    (
                        .reset          (reset),
                        .clk            (clk),
                        .cke            (1'b1),
                        
                        .s_data         (s_ff_data),
                        .s_valid        (fifo_valid[i]),
                        .s_ready        (fifo_ready[i]),
                        
                        .m_data         (fifo_ff_data),
                        .m_valid        (fifo_ff_valid),
                        .m_ready        (fifo_ff_ready),
                        
                        .buffered       (),
                        .s_ready_next   ()
                    );
            
            
            jelly_fifo_fwtf
                    #(
                        .DATA_WIDTH     (DATA_WIDTH),
                        .PTR_WIDTH      (FIFO_PTR_WIDTH),
                        .DOUT_REGS      (0),
                        .RAM_TYPE       (FIFO_RAM_TYPE),
                        .MASTER_REGS    (M_REGS)
                    )
                i_fifo_fwtf
                    (
                        .reset          (reset),
                        .clk            (clk),
                        
                        .s_data         (fifo_ff_data),
                        .s_valid        (fifo_ff_valid),
                        .s_ready        (fifo_ff_ready),
                        .s_free_count   (),
                        
                        .m_data         (m_data[i*DATA_WIDTH +: DATA_WIDTH]),
                        .m_valid        (m_valid[i]),
                        .m_ready        (m_ready[i]),
                        .m_data_count   ()
                    );
        end
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
