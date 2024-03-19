// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_data_crossbar_simple
        #(
            parameter   S_NUM         = 4,
            parameter   S_ID_WIDTH    = 3,
            parameter   M_NUM         = 8,
            parameter   M_ID_WIDTH    = 3,
            parameter   DATA_WIDTH    = 32
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [S_NUM*M_ID_WIDTH-1:0]  s_id_to,
            input   wire    [S_NUM*DATA_WIDTH-1:0]  s_data,
            input   wire    [S_NUM-1:0]             s_valid,
            
            output  wire    [M_NUM*S_ID_WIDTH-1:0]  m_id_from,
            output  wire    [M_NUM*DATA_WIDTH-1:0]  m_data,
            output  wire    [M_NUM-1:0]             m_valid
        );
    
    genvar      i;
    
    integer     m, s;
    
    
    reg     [S_NUM*DATA_WIDTH-1:0]      st0_data;
    reg     [M_NUM*S_NUM-1:0]           st0_valid;
    wire    [M_NUM*S_ID_WIDTH-1:0]      st0_id;
    
    reg     [S_NUM*DATA_WIDTH-1:0]      st1_data;
    reg     [M_NUM*S_ID_WIDTH-1:0]      st1_id;
    reg     [M_NUM-1:0]                 st1_valid;
    
    reg     [M_NUM*S_ID_WIDTH-1:0]      st2_id;
    reg     [M_NUM*DATA_WIDTH-1:0]      st2_data;
    reg     [M_NUM-1:0]                 st2_valid;

    reg     [S_ID_WIDTH-1:0]            tmp_id;
    
    generate
    for ( i = 0; i < M_NUM; i = i+1 ) begin : loop_encoder
        jelly_bit_encoder
                #(
                    .DATA_WIDTH     (S_NUM),
                    .SEL_WIDTH      (S_ID_WIDTH),
                    .PRIORITYT      (0)
                )
            i_bit_encoder
                (
                    .in_data        (st0_valid[i*S_NUM      +: S_NUM]),
                    .out_sel        (st0_id   [i*S_ID_WIDTH +: S_ID_WIDTH])
                );  
    end
    endgenerate
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_data  <= {(S_NUM*DATA_WIDTH){1'bx}};
            st0_valid <= {(M_NUM*S_NUM){1'b0}};
            
            st1_id    <= {(M_NUM*S_ID_WIDTH){1'bx}};
            st1_data  <= {(S_NUM*DATA_WIDTH){1'bx}};
            st1_valid <= {M_NUM{1'b0}};
            
            st2_id    <= {(M_NUM*S_ID_WIDTH){1'bx}};
            st2_data  <= {(M_NUM*DATA_WIDTH){1'bx}};
            st2_valid <= {M_NUM{1'b0}};
        end
        else if ( cke ) begin
            // stage 0
            st0_data  <= s_data;
            st0_valid <= {(S_NUM*M_NUM){1'b0}};
            for ( s = 0; s < S_NUM; s = s+1 ) begin
                for ( m = 0; m < M_NUM; m = m+1 ) begin
                    if ( s_id_to[s*M_ID_WIDTH +: M_ID_WIDTH] == m ) begin
                        st0_valid[m*S_NUM+s] <= s_valid[s];
                    end
                end
            end
            
            
            // stage 1
            st1_data  <= st0_data;
            st1_id    <= st0_id;
            for ( m = 0; m < M_NUM; m = m+1 ) begin
                st1_valid[m] <= |st0_valid[m*S_NUM +: S_NUM];
            end
            /*
            st1_data  <= st0_data;
            st1_valid <= {M_NUM{1'b0}};
            for ( m = 0; m < M_NUM; m = m+1 ) begin
                tmp_id = {S_ID_WIDTH{1'bx}};
                for ( s = 0; s < S_NUM; s = s+1 ) begin
                    if ( st0_valid[m*S_NUM+s] ) begin
                        tmp_id        = s; 
                        st1_valid[m] <= 1'b1;
                    end
                end
                st1_id[m*S_ID_WIDTH +: S_ID_WIDTH] <= tmp_id;
            end
            */
            
            // stage 2
            st2_id <= st1_id;
            for ( m = 0; m < M_NUM; m = m+1 ) begin
                tmp_id = st1_id[m*S_ID_WIDTH +: S_ID_WIDTH];
                st2_data[m*DATA_WIDTH +: DATA_WIDTH] <= st1_data[tmp_id*DATA_WIDTH +: DATA_WIDTH];
            end
            st2_valid <= st1_valid;
        end
    end
    
    
    assign m_id_from = st2_id;
    assign m_data    = st2_data;
    assign m_valid   = st2_valid;
    
endmodule



`default_nettype wire


// end of file
