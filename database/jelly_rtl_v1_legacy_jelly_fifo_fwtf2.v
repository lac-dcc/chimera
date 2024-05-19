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



// FIFO (First-Word Fall-Through mode)
module jelly_fifo_fwtf2
        #(
            parameter   DATA_WIDTH  = 8,
            parameter   PTR_WIDTH   = 10,
            parameter   DOUT_REGS   = 0,
            parameter   RAM_TYPE    = "block",
            parameter   MASTER_REGS = 1
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // slave
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            output  wire    [PTR_WIDTH:0]       s_free_count,
            
            // master
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready,
            output  wire    [PTR_WIDTH:0]       m_data_count
        );
    
    
    
    wire    [PTR_WIDTH:0]       write_ptr;
    
    wire                        s_read_ready;
    
    wire    [PTR_WIDTH:0]       read_ptr;
    
    wire                        fifo_full;
    wire                        fifo_empty;
    wire    [PTR_WIDTH:0]       fifo_free_count;
    wire    [PTR_WIDTH:0]       fifo_data_count;
    
    
    jelly_fifo_ra_fwtf
            #(
                .DATA_WIDTH         (DATA_WIDTH),
                .ADDR_WIDTH         (PTR_WIDTH),
                .DOUT_REGS          (DOUT_REGS),
                .RAM_TYPE           (RAM_TYPE),
                .MASTER_REGS        (MASTER_REGS)
            )
        i_fifo_ra_fwtf
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_write_addr       (write_ptr),
                .s_write_data       (s_data),
                .s_write_valid      (s_valid),
                .s_write_ready      (s_ready),
                
                .write_ptr          (write_ptr),
                .write_ptr_next     (write_ptr + 1'b1),
                .write_ptr_update   (s_valid & s_ready),
                
                
                .s_read_addr        (read_ptr),
                .s_read_valid       (!fifo_empty),
                .s_read_ready       (s_read_ready),
                
                .m_read_data        (m_data),
                .m_read_valid       (m_valid),
                .m_read_ready       (m_ready),
                .m_read_data_count  (m_data_count),
                                     
                .read_ptr           (read_ptr),
                .read_ptr_next      (read_ptr + 1'b1),
                .read_ptr_update    (!fifo_empty && s_read_ready),
                                     
                .fifo_full          (fifo_full),
                .fifo_empty         (fifo_empty),
                .fifo_free_count    (fifo_free_count),
                .fifo_data_count    (fifo_data_count)
            );
    
    assign s_free_count = fifo_free_count;
    
    
endmodule


`default_nettype wire


// end of file
