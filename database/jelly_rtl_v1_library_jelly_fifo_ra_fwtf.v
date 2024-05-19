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



// FIFO (First-Word Fall-Through mode)
module jelly_fifo_ra_fwtf
        #(
            parameter   USER_WIDTH     = 1,
            parameter   DATA_WIDTH     = 8,
            parameter   ADDR_WIDTH     = 9,
            parameter   DOUT_REGS      = 1,
            parameter   RAM_TYPE       = "block",
            parameter   MASTER_REGS    = 1,
            parameter   FIFO_PTR_WIDTH = (ADDR_WIDTH + 1)
        )
        (
            // system
            input   wire                            reset,
            input   wire                            clk,
            
            // write
            input   wire    [ADDR_WIDTH-1:0]        s_write_addr,
            input   wire    [DATA_WIDTH-1:0]        s_write_data,
            input   wire                            s_write_valid,
            output  wire                            s_write_ready,
            
            output  wire    [FIFO_PTR_WIDTH-1:0]    write_ptr,
            input   wire    [FIFO_PTR_WIDTH-1:0]    write_ptr_next,
            input   wire                            write_ptr_update,
            
            // read
            input   wire    [USER_WIDTH-1:0]        s_read_user,
            input   wire    [ADDR_WIDTH-1:0]        s_read_addr,
            input   wire                            s_read_valid,
            output  wire                            s_read_ready,
            
            output  wire    [USER_WIDTH-1:0]        m_read_user,
            output  wire    [DATA_WIDTH-1:0]        m_read_data,
            output  wire                            m_read_valid,
            input   wire                            m_read_ready,
            output  wire    [FIFO_PTR_WIDTH-1:0]    m_read_data_count,
            
            output  wire    [FIFO_PTR_WIDTH-1:0]    read_ptr,
            input   wire    [FIFO_PTR_WIDTH-1:0]    read_ptr_next,
            input   wire                            read_ptr_update,
            
            // status
            output  wire                            fifo_full,
            output  wire                            fifo_empty,
            output  wire    [FIFO_PTR_WIDTH-1:0]    fifo_free_count,
            output  wire    [FIFO_PTR_WIDTH-1:0]    fifo_data_count,
            
            output  wire                            next_fifo_full,
            output  wire                            next_fifo_empty,
            output  wire    [FIFO_PTR_WIDTH-1:0]    next_fifo_free_count,
            output  wire    [FIFO_PTR_WIDTH-1:0]    next_fifo_data_count
        );
    
    //  FIFO
    wire                        fifo_rd_en;
    wire    [ADDR_WIDTH-1:0]    fifo_rd_addr;
    wire                        fifo_rd_regcke;
    wire    [DATA_WIDTH-1:0]    fifo_rd_data;
    
    jelly_fifo_ra
            #(
                .DATA_WIDTH         (DATA_WIDTH),
                .ADDR_WIDTH         (ADDR_WIDTH),
                .DOUT_REGS          (DOUT_REGS),
                .RAM_TYPE           (RAM_TYPE)
            )
        i_fifo_ra
            (
                .reset              (reset),
                .clk                (clk),
                
                .wr_en              (!fifo_full),
                .wr_we              (s_write_valid),
                .wr_addr            (s_write_addr),
                .wr_data            (s_write_data),
                
                .wr_ptr             (write_ptr),
                .wr_ptr_next        (write_ptr_next),
                .wr_ptr_update      (write_ptr_update),
                
                .rd_en              (fifo_rd_en),
                .rd_regcke          (fifo_rd_regcke),
                .rd_addr            (fifo_rd_addr),
                .rd_data            (fifo_rd_data),
                
                .rd_ptr             (read_ptr),
                .rd_ptr_next        (read_ptr_next),
                .rd_ptr_update      (read_ptr_update),
                
                .full               (fifo_full),
                .empty              (fifo_empty),
                .free_count         (fifo_free_count),
                .data_count         (fifo_data_count),
                
                .next_full          (next_fifo_full),
                .next_empty         (next_fifo_empty),
                .next_free_count    (next_fifo_free_count),
                .next_data_count    (next_fifo_data_count)
            );
    
    assign s_write_ready = !fifo_full;
    
    
    // read (master port)
    jelly_fifo_ra_read_fwtf
            #(
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (DATA_WIDTH),
                .ADDR_WIDTH         (ADDR_WIDTH),
                .DOUT_REGS          (DOUT_REGS),
                .MASTER_REGS        (MASTER_REGS)
            )
        i_fifo_ra_read_fwtf
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_user             (s_read_user),
                .s_addr             (s_read_addr),
                .s_valid            (s_read_valid),
                .s_ready            (s_read_ready),
                
                .rd_en              (fifo_rd_en),
                .rd_regcke          (fifo_rd_regcke),
                .rd_addr            (fifo_rd_addr),
                .rd_data            (fifo_rd_data),
                .rd_empty           (fifo_empty),
                .rd_count           (fifo_data_count),
                
                .m_user             (m_read_user),
                .m_data             (m_read_data),
                .m_valid            (m_read_valid),
                .m_ready            (m_read_ready),
                .m_count            (m_read_data_count)
            );
    
    
endmodule


`default_nettype wire


// end of file
