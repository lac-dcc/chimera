// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// no handshake and no conflict
module jelly_data_joint_simple
        #(
            parameter   NUM         = 16,
            parameter   ID_WIDTH    = 4,
            parameter   DATA_WIDTH  = 32
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [NUM*DATA_WIDTH-1:0]    s_data,
            input   wire    [NUM-1:0]               s_valid,
            
            output  wire    [ID_WIDTH-1:0]          m_id,
            output  wire    [DATA_WIDTH-1:0]        m_data,
            output  wire                            m_valid
        );
    
    
    integer                         i;
    
    reg     [NUM*DATA_WIDTH-1:0]    st0_data;
    reg     [ID_WIDTH-1:0]          st0_id;
    reg                             st0_valid;
    
    reg     [ID_WIDTH-1:0]          st1_id;
    reg     [DATA_WIDTH-1:0]        st1_data;
    reg                             st1_valid;
    
    always @(posedge clk) begin
        if ( cke ) begin
            // stage 0
            st0_data <= s_data;
            st0_id <= {ID_WIDTH{1'bx}};
            for ( i = 0; i < NUM; i = i+1 ) begin
                // parallel_case, full_case
                if ( s_valid == ({{(NUM-1){1'b0}}, 1'b1} << i) ) begin
                    st0_id <= i;
                end
            end
            
            
            // stage 1
            st1_data <= st0_data[st0_id*DATA_WIDTH +: DATA_WIDTH];
            st1_id   <= st0_id;
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_valid <= 1'b0;
            st1_valid <= 1'b0;
        end
        else if ( cke ) begin
            st0_valid <= |s_valid;
            st1_valid <= st0_valid;
        end
    end
    
    assign m_id    = st1_id;
    assign m_data  = st1_data;
    assign m_valid = st1_valid;
    
endmodule



`default_nettype wire


// end of file
