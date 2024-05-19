// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



module jelly_wishbone_logger
        #(
            parameter   ADR_WIDTH      = 12,
            parameter   DAT_SIZE       = 2,     // 2^n (0:8bit, 1:16bit, 2:32bit ...)
            parameter   DAT_WIDTH      = (8 << DAT_SIZE),
            parameter   SEL_WIDTH      = (DAT_WIDTH / 8),
            parameter   WRITE_LOG_FILE = "",
            parameter   READ_LOG_FILE  = "",
            parameter   DISPLAY        = 1,
            parameter   MESSAGE        = "[wishbone]"
        )
        (
            // system
            input   wire                        clk,
            input   wire                        reset,
            
            // wishbone
            input   wire    [ADR_WIDTH-1:0]     wb_adr_o,
            input   wire    [DAT_WIDTH-1:0]     wb_dat_o,
            input   wire    [DAT_WIDTH-1:0]     wb_dat_i,
            input   wire                        wb_we_o,
            input   wire    [SEL_WIDTH-1:0]     wb_sel_o,
            input   wire                        wb_stb_o,
            input   wire                        wb_ack_i            
        );
    
    
    integer                     file;
    
    initial begin
        if ( WRITE_LOG_FILE != "" ) begin
            file = $fopen(WRITE_LOG_FILE);
            $fclose(file);
        end
        if ( READ_LOG_FILE != "" ) begin
            file = $fopen(READ_LOG_FILE);
            $fclose(file);
        end
    end
    
    always @(posedge clk) begin
        if ( !reset ) begin
            // write
            if ( wb_stb_o & wb_we_o & wb_ack_i ) begin
                if ( DISPLAY ) begin
                    $display("w %h %h %h %d %s", wb_adr_o, wb_dat_o, wb_sel_o, $time, MESSAGE);
                end
                if ( WRITE_LOG_FILE != "" ) begin
                    file = $fopen(WRITE_LOG_FILE, "a");
                    $fdisplay(file, "w %h %h %h %d %s", wb_adr_o, wb_dat_o, wb_sel_o, $time, MESSAGE);
                    $fclose(file);
                end
            end
            
            // read
            if ( wb_stb_o & !wb_we_o & wb_ack_i ) begin
                if ( DISPLAY ) begin
                    $display("r %h %h %h %d %s", wb_adr_o, wb_dat_i, wb_sel_o, $time, MESSAGE);
                end
                if ( READ_LOG_FILE != "" ) begin
                    file = $fopen(READ_LOG_FILE, "a");
                    $fdisplay(file, "r %h %h %h %d %s", wb_adr_o, wb_dat_i, wb_sel_o, $time, MESSAGE);
                    $fclose(file);
                end
            end
            
        end
    end
    
endmodule


// end of file
