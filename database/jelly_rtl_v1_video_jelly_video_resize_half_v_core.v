// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
// 
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_resize_half_v_core
        #(
            parameter   TUSER_WIDTH   = 1,
            parameter   COMPONENT_NUM = 3,
            parameter   DATA_WIDTH    = 8,
            parameter   TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH,
            parameter   MAX_X_NUM     = 4096,
            parameter   RAM_TYPE      = MAX_X_NUM > 128 ? "block" : "distributed",
            parameter   M_SLAVE_REGS  = 1,
            parameter   M_MASTER_REGS = 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        param_enable,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    localparam  X_WIDTH = MAX_X_NUM <=     2 ?  1 :
                          MAX_X_NUM <=     4 ?  2 :
                          MAX_X_NUM <=     8 ?  3 :
                          MAX_X_NUM <=    16 ?  4 :
                          MAX_X_NUM <=    32 ?  5 :
                          MAX_X_NUM <=    64 ?  6 :
                          MAX_X_NUM <=   128 ?  7 :
                          MAX_X_NUM <=   256 ?  8 :
                          MAX_X_NUM <=   512 ?  9 :
                          MAX_X_NUM <=  1024 ? 10 :
                          MAX_X_NUM <=  2048 ? 11 :
                          MAX_X_NUM <=  4096 ? 12 :
                          MAX_X_NUM <=  8192 ? 13 :
                          MAX_X_NUM <= 16384 ? 14 :
                          MAX_X_NUM <= 32768 ? 15 : 16;
    
    
    wire                            cke;
    
    
    
    integer                     i;
    
    reg     [X_WIDTH-1:0]       st0_x;
    reg     [TUSER_WIDTH-1:0]   st0_tuser;
    reg                         st0_tlast;
    reg     [TDATA_WIDTH-1:0]   st0_tdata;
    reg                         st0_tvalid;
    
    reg                         st1_y;
    reg     [TUSER_WIDTH-1:0]   st1_tuser;
    reg                         st1_tlast;
    reg     [TDATA_WIDTH-1:0]   st1_tdata;
    reg                         st1_tvalid;
    
    reg                         st2_y;
    reg     [TUSER_WIDTH-1:0]   st2_tuser;
    reg                         st2_tlast;
    reg     [TDATA_WIDTH-1:0]   st2_tdata;
    wire    [TDATA_WIDTH-1:0]   st2_tdata_prev;
    reg                         st2_tvalid;
    
    reg     [TUSER_WIDTH-1:0]   st3_tuser;
    reg                         st3_tlast;
    reg     [TDATA_WIDTH-1:0]   st3_tdata;
    reg                         st3_tvalid;
    wire                        st3_tready;
    
    
    jelly_ram_singleport
            #(
                .ADDR_WIDTH         (X_WIDTH),
                .DATA_WIDTH         (TDATA_WIDTH),
                .MEM_SIZE           (MAX_X_NUM),
                .RAM_TYPE           (RAM_TYPE),
                .DOUT_REGS          (1),
                .MODE               ("READ_FIRST")
            )
        i_ram_singleport
            (
                .clk                (aclk),
                .en                 (cke),
                .regcke             (cke),
                .we                 (st0_tvalid),
                .addr               (st0_x),
                .din                (st0_tdata),
                .dout               (st2_tdata_prev)
            );
    
    
    always @(posedge aclk) begin
        if ( aclken && cke ) begin
            // stage 0
            st0_tuser  <= s_axi4s_tuser;
            st0_tlast  <= s_axi4s_tlast;
            st0_tdata  <= s_axi4s_tdata;
            st0_x      <= st0_x + st0_tvalid;
            if ( st0_tlast && st0_tvalid ) begin
                st0_x <= 0;
            end
            if ( s_axi4s_tuser[0] && s_axi4s_tvalid ) begin
                st0_x <= 0;
            end
            
            
            // stage 1
            st1_tuser <= st0_tuser;
            st1_tlast <= st0_tlast;
            st1_tdata <= st0_tdata;
            
            
            // stage 2
            st2_tuser <= st1_tuser;
            st2_tlast <= st1_tlast;
            st2_tdata <= st1_tdata;
            st2_y     <= st2_y + (st2_tvalid & st2_tlast);
            if ( st1_tuser[0] && st1_tvalid ) begin
                st2_y <= 0;
            end
            
            
            // stage 3
            st3_tuser    <= st2_tuser;
            st3_tuser[0] <= st3_tuser[0];
            if ( st3_tvalid) begin
                st3_tuser[0] <= 1'b0;
            end
            if ( st2_tuser[0] && st2_tvalid ) begin
                st3_tuser[0] <= 1'b1;
            end
            st3_tlast    <= st2_tlast;
            st3_tdata    <= st2_tdata;
            if ( param_enable ) begin
                for ( i = 0; i < COMPONENT_NUM; i = i+1 ) begin
                    st3_tdata[i*DATA_WIDTH +: DATA_WIDTH] <=
                            (({1'b0, st2_tdata_prev[i*DATA_WIDTH +: DATA_WIDTH]} + {1'b0, st2_tdata[i*DATA_WIDTH +: DATA_WIDTH]}) >> 1);
                end
            end
        end
    end
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_tvalid <= 1'b0;
            st1_tvalid <= 1'b0;
            st2_tvalid <= 1'b0;
            st3_tvalid <= 1'b0;
        end
        else if ( aclken && s_axi4s_tready ) begin
            st0_tvalid <= s_axi4s_tvalid;
            st1_tvalid <= st0_tvalid;
            st2_tvalid <= st1_tvalid;
            st3_tvalid <= st2_tvalid && (!param_enable || st2_y);
        end
    end
    
    assign cke = (!st3_tvalid || st3_tready);
    
    assign s_axi4s_tready = cke;
    
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (TUSER_WIDTH+1+TDATA_WIDTH),
                .SLAVE_REGS         (M_SLAVE_REGS),
                .MASTER_REGS        (M_MASTER_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (aclken),
                
                .s_data             ({st3_tuser, st3_tlast, st3_tdata}),
                .s_valid            (st3_tvalid),
                .s_ready            (st3_tready),
                
                .m_data             ({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata}),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
endmodule



`default_nettype wire



// end of file
