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



// no handshake swith
module jelly_data_switch_simple
        #(
            parameter   NUM         = 16,
            parameter   ID_WIDTH    = 4,
            parameter   DATA_WIDTH  = 32,
            parameter   USE_M_READY = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [ID_WIDTH-1:0]          s_id,
            input   wire    [DATA_WIDTH-1:0]        s_data,
            input   wire                            s_valid,
            
            output  wire    [NUM*DATA_WIDTH-1:0]    m_data,
            output  wire    [NUM-1:0]               m_valid
        );
    
    
    // -----------------------------------------
    //  switch
    // -----------------------------------------
    
    reg     [NUM-1:0]           reg_valid;
    reg     [DATA_WIDTH-1:0]    reg_data;
    
    integer                     i;
    
    always @(posedge clk) begin
        if ( cke ) begin
            reg_data <= s_data;
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_valid <= {NUM{1'b0}};
        end
        else if( cke ) begin
            reg_valid <= {NUM{1'b0}};
            for ( i = 0; i < NUM; i = i+1 ) begin
                if ( s_id == i ) begin
                    reg_valid[i] <= s_valid;
                end
            end
        end
    end
        
    assign m_data  = {NUM{reg_data}};
    assign m_valid = reg_valid;
    
endmodule



`default_nettype wire


// end of file
