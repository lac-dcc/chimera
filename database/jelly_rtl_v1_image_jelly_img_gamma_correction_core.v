// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_gamma_correction_core
        #(
            parameter   S_DATA_WIDTH = 8,
            parameter   M_DATA_WIDTH = 8,
            parameter   RAM_TYPE     = "block"
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        enable,
            
            input   wire                        mem_clk,
            input   wire                        mem_en,
            input   wire    [S_DATA_WIDTH-1:0]  mem_addr,
            input   wire    [M_DATA_WIDTH-1:0]  mem_din,
            
            input   wire    [S_DATA_WIDTH-1:0]  s_data,
            
            output  wire    [M_DATA_WIDTH-1:0]  m_data
        );
    
    
    // table
    wire    [M_DATA_WIDTH-1:0]  mem_dout;
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (S_DATA_WIDTH),
                .DATA_WIDTH     (M_DATA_WIDTH),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1)
            )
        i_ram_simple_dualport
            (
                .wr_clk         (mem_clk),
                .wr_en          (mem_en),
                .wr_addr        (mem_addr),
                .wr_din         (mem_din),
                
                .rd_clk         (clk),
                .rd_en          (cke),
                .rd_regcke      (cke),
                .rd_addr        (s_data),
                .rd_dout        (mem_dout)
            );
    
    reg     [S_DATA_WIDTH-1:0]  st0_data;
    reg     [S_DATA_WIDTH-1:0]  st1_data;
    reg     [M_DATA_WIDTH-1:0]  st2_data;
    always @(posedge clk) begin
        if ( cke ) begin
            st0_data <= s_data;
            st1_data <= st0_data;
            
            if ( enable ) begin
                st2_data <= mem_dout;
            end
            else begin
                if ( M_DATA_WIDTH > S_DATA_WIDTH ) begin
                    st2_data <= (st1_data << (M_DATA_WIDTH - S_DATA_WIDTH)) | (st1_data >> S_DATA_WIDTH);
                end
                else begin
                    st2_data <= (st1_data >> (S_DATA_WIDTH - M_DATA_WIDTH));
                end
           end
        end
    end
    
    assign m_data = st2_data;
    
endmodule


`default_nettype wire


// end of file
