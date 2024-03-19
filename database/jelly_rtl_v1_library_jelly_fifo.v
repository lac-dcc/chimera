// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// FIFO
module jelly_fifo
        #(
            parameter   DATA_WIDTH = 8,
            parameter   PTR_WIDTH  = 10,
            parameter   DOUT_REGS  = 0,
            parameter   RAM_TYPE   = "block",
            parameter   LOW_DEALY  = 0
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire                        wr_en,
            input   wire    [DATA_WIDTH-1:0]    wr_data,
            
            input   wire                        rd_en,
            input   wire                        rd_regcke,
            output  wire    [DATA_WIDTH-1:0]    rd_data,
            
            output  wire                        full,
            output  wire                        empty,
            output  wire    [PTR_WIDTH:0]       free_count,
            output  wire    [PTR_WIDTH:0]       data_count
        );
    
    
    generate
    if ( LOW_DEALY && RAM_TYPE == "distributed" && PTR_WIDTH < 8 ) begin : blk_shifter
        jelly_fifo_shifter
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .PTR_WIDTH      (PTR_WIDTH),
                    .DOUT_REGS      (DOUT_REGS)
                )
            i_fifo_shifter
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .wr_en          (wr_en),
                    .wr_data        (wr_data),
                    
                    .rd_en          (rd_en),
                    .rd_regcke      (rd_regcke),
                    .rd_data        (rd_data),
                    
                    .full           (full),
                    .empty          (empty),
                    .free_count     (free_count),
                    .data_count     (data_count)
                );
    end
    else begin : blk_ram
        jelly_fifo_ram
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .PTR_WIDTH      (PTR_WIDTH),
                    .DOUT_REGS      (DOUT_REGS),
                    .RAM_TYPE       (RAM_TYPE),
                    .LOW_DEALY      (LOW_DEALY)
                )
            i_fifo_ram
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .wr_en          (wr_en),
                    .wr_data        (wr_data),
                    
                    .rd_en          (rd_en),
                    .rd_regcke      (rd_regcke),
                    .rd_data        (rd_data),
                    
                    .full           (full),
                    .empty          (empty),
                    .free_count     (free_count),
                    .data_count     (data_count)
                );
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
