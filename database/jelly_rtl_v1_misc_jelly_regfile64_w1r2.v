// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// register file with RAM64X1D
module jelly_regfile64_w1r2
        #(
            parameter   DATA_WIDTH  = 32,
            parameter   WRITE_FIRST = 1,
            parameter   ZERO_REGS   = 0,
            parameter   DEVICE      = "RTL"
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        wr_en,
            input   wire    [5:0]               wr_addr,
            input   wire    [DATA_WIDTH-1:0]    wr_data,
            
            input   wire    [5:0]               rd0_addr,
            output  reg     [DATA_WIDTH-1:0]    rd0_data,
            
            input   wire    [5:0]               rd1_addr,
            output  reg     [DATA_WIDTH-1:0]    rd1_data
        );
    
    wire    [DATA_WIDTH-1:0]    ram_data0;
    wire    [DATA_WIDTH-1:0]    ram_data1;
    
    jelly_ram64x1d_w1r2
            #(
                .WIDTH      (DATA_WIDTH),
                .DEVICE     (DEVICE)
            )
        i_ram64x1d_w1r2
            (
                .clk        (clk),
                
                .wr_en      (wr_en & cke),
                .wr_addr    (wr_addr),
                .wr_data    (wr_data),
                
                .rd0_addr   (rd0_addr),
                .rd0_data   (ram_data0),
                
                .rd1_addr   (rd1_addr),
                .rd1_data   (ram_data1)
            );
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            rd0_data <= {DATA_WIDTH{1'b0}};
            rd1_data <= {DATA_WIDTH{1'b0}};
        end
        else if ( cke ) begin
            rd0_data <= ram_data0;
            rd1_data <= ram_data1;
            
            if ( WRITE_FIRST ) begin
                if ( wr_en && wr_addr == rd0_addr ) begin
                    rd0_data <= wr_data;
                end
                
                if ( wr_en && wr_addr == rd1_addr ) begin
                    rd1_data <= wr_data;
                end
            end
            
            if ( ZERO_REGS ) begin
                if ( rd0_addr == 5'd0 ) begin
                    rd0_data <= {DATA_WIDTH{1'b0}};
                end
                
                if ( rd1_addr == 5'd0 ) begin
                    rd1_data <= {DATA_WIDTH{1'b0}};
                end
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
