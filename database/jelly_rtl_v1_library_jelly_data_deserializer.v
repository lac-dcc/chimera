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



// serializer
module jelly_data_deserializer
        #(
            parameter   NUM         = 16,
            parameter   DATA_WIDTH  = 8,
            parameter   S_REGS      = 0
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            endian,
            
            input   wire    [DATA_WIDTH-1:0]        s_data,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            output  wire    [NUM*DATA_WIDTH-1:0]    m_data,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [NUM*DATA_WIDTH-1:0]    ff_s_data;
    wire                            ff_s_valid;
    wire                            ff_s_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (0)
            )
        i_pipeline_insert_ff_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (ff_s_data),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    
    localparam  COUNTER_WIDTH = NUM <=       2 ?  1 :
                                NUM <=       4 ?  2 :
                                NUM <=       8 ?  3 :
                                NUM <=      16 ?  4 :
                                NUM <=      32 ?  5 :
                                NUM <=      64 ?  6 :
                                NUM <=     128 ?  7 :
                                NUM <=     256 ?  8 :
                                NUM <=     512 ?  9 :
                                NUM <=    1024 ? 10 :
                                NUM <=    2048 ? 11 :
                                NUM <=    4096 ? 12 :
                                NUM <=    8192 ? 13 :
                                NUM <=   16384 ? 14 :
                                NUM <=   32768 ? 15 :
                                NUM <=   65536 ? 16 :
                                NUM <=  131072 ? 17 :
                                NUM <=  262144 ? 18 :
                                NUM <=  524288 ? 19 :
                                NUM <= 1048576 ? 20 :
                                NUM <= 2097152 ? 21 :
                                NUM <= 4194304 ? 22 :
                                NUM <= 8388608 ? 23 : 24;
    
    
    reg     [COUNTER_WIDTH-1:0]     reg_count;
    reg     [NUM*DATA_WIDTH-1:0]    reg_data;
    reg                             reg_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_count <= {COUNTER_WIDTH{1'b0}};
            reg_data  <= {DATA_WIDTH{1'bx}};
            reg_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( m_ready ) begin
                reg_valid <= 1'b0;
            end
            
            if ( ff_s_valid & ff_s_ready ) begin
                if ( endian ) begin
                    reg_data                                   <= (reg_data << NUM);
                    reg_data[      0*DATA_WIDTH +: DATA_WIDTH] <= ff_s_data;
                end
                else begin
                    reg_data                                   <= (reg_data >> NUM);
                    reg_data[(NUM-1)*DATA_WIDTH +: DATA_WIDTH] <= ff_s_data;
                end
                
                reg_count <= reg_count + 1'b1;
                if ( reg_count == (NUM-1) ) begin
                    reg_count <= {COUNTER_WIDTH{1'b0}};
                    reg_valid <= 1'b1;
                end
            end
        end
    end
    
    assign ff_s_ready = (!m_valid || m_ready);
    
    assign m_data     = reg_data;
    assign m_valid    = reg_valid;
    
    
endmodule



`default_nettype wire


// end of file
