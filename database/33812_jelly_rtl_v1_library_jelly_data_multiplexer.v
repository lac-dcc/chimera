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



// multiplexer
module jelly_data_multiplexer
        #(
            parameter   NUM        = 5,
            parameter   DATA_WIDTH = 8,
            parameter   S_REGS     = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            endian,
            
            input   wire    [NUM*DATA_WIDTH-1:0]    s_data,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            output  wire    [DATA_WIDTH-1:0]        m_data,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    localparam  SEL_WIDTH = NUM <=     2 ?  1 :
                            NUM <=     4 ?  2 :
                            NUM <=     8 ?  3 :
                            NUM <=    16 ?  4 :
                            NUM <=    32 ?  5 :
                            NUM <=    64 ?  6 :
                            NUM <=   128 ?  7 :
                            NUM <=   256 ?  8 :
                            NUM <=   512 ?  9 :
                            NUM <=  1024 ? 10 :
                            NUM <=  2048 ? 11 :
                            NUM <=  4096 ? 12 :
                            NUM <=  8192 ? 13 :
                            NUM <= 16384 ? 14 :
                            NUM <= 32768 ? 15 : 16;
    
    
    wire    [NUM*DATA_WIDTH-1:0]    ff_data;
    wire                            ff_valid;
    wire                            ff_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (NUM*DATA_WIDTH),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (S_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (ff_data),
                .m_valid        (ff_valid),
                .m_ready        (ff_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    wire    [DATA_WIDTH-1:0]        demux_data;
    
    reg     [SEL_WIDTH-1:0]         reg_sel;
    reg     [DATA_WIDTH-1:0]        reg_data;
    reg                             reg_valid;
    
    jelly_multiplexer
            #(
                .SEL_WIDTH      (SEL_WIDTH),
                .NUM            (NUM),
                .OUT_WIDTH      (DATA_WIDTH)
            )
        i_multiplexer
            (
                .endian         (endian),
                
                .sel            (reg_sel),
                .din            (ff_data),
                .dout           (demux_data)
            );
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_sel   <= {SEL_WIDTH{1'b0}};
            reg_data  <= {(NUM*DATA_WIDTH){1'bx}};
            reg_valid <= 1'b0;
        end
        else begin
            if ( cke && (!m_valid || m_ready) ) begin
                reg_valid <= 1'b0;
                
                if ( ff_valid ) begin
                    reg_sel  <= reg_sel + 1'b1;
                    if ( reg_sel == (NUM-1) ) begin
                        reg_sel  <= {SEL_WIDTH{1'b0}};
                    end
                    reg_data  <= demux_data;
                    reg_valid <= 1'b1;
                end
            end
        end
    end
    
    assign ff_ready = (m_ready && (reg_sel == (NUM-1)));
    
    assign m_data   = reg_data;
    assign m_valid  = reg_valid;
    
    
endmodule



`default_nettype wire


// end of file
