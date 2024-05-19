// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_integrator_bram_core
        #(
            parameter   COMPONENT_NUM = 3,
            parameter   DATA_WIDTH    = 8,
            parameter   RATE_WIDTH    = 4,
            parameter   TUSER_WIDTH   = 1,
            parameter   TDATA_WIDTH   = COMPONENT_NUM * DATA_WIDTH,
            parameter   X_WIDTH       = 10,
            parameter   Y_WIDTH       = 8,
            parameter   MAX_X_NUM     = (1 << X_WIDTH),
            parameter   MAX_Y_NUM     = (1 << Y_WIDTH),
            parameter   RAM_TYPE      = "block",
            parameter   FILLMEM       = 1,
            parameter   FILLMEM_DATA  = 0,
            parameter   ROUNDING      = 1,
            parameter   COMPACT       = 0,
            parameter   M_SLAVE_REGS  = 1,
            parameter   M_MASTER_REGS = 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire    [RATE_WIDTH-1:0]    param_rate,
            
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
    
    wire                        cke;
    
    
    // BRAM
    localparam  ADDR_WIDTH = Y_WIDTH + X_WIDTH;
    
    wire    [ADDR_WIDTH-1:0]    ram_rd_addr;
    wire    [TDATA_WIDTH-1:0]   ram_rd_dout;
    
    wire                        ram_wr_en;
    wire    [ADDR_WIDTH-1:0]    ram_wr_addr;
    wire    [TDATA_WIDTH-1:0]   ram_wr_din;
    
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (TDATA_WIDTH),
                .MEM_SIZE       ((1 << X_WIDTH)*MAX_Y_NUM),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1),
                .FILLMEM        (FILLMEM),
                .FILLMEM_DATA   (FILLMEM_DATA)
            )
        i_ram_simple_dualport
            (
                .wr_clk         (aclk),
                .wr_en          (ram_wr_en),
                .wr_addr        (ram_wr_addr),
                .wr_din         (ram_wr_din),
                
                .rd_clk         (aclk),
                .rd_en          (cke),
                .rd_regcke      (cke),
                .rd_addr        (ram_rd_addr),
                .rd_dout        (ram_rd_dout)
            );
    
    
    reg     [TUSER_WIDTH-1:0]       st0_tuser;
    reg                             st0_tlast;
    reg     [TDATA_WIDTH-1:0]       st0_tdata;
    reg                             st0_tvalid;
    
    reg     [X_WIDTH-1:0]           st1_x;
    reg     [Y_WIDTH-1:0]           st1_y;
    reg     [TUSER_WIDTH-1:0]       st1_tuser;
    reg                             st1_tlast;
    reg     [TDATA_WIDTH-1:0]       st1_tdata;
    reg                             st1_tvalid;
    
    reg     [X_WIDTH-1:0]           st2_x;
    reg     [Y_WIDTH-1:0]           st2_y;
    reg     [TUSER_WIDTH-1:0]       st2_tuser;
    reg                             st2_tlast;
    reg     [TDATA_WIDTH-1:0]       st2_tdata;
    reg                             st2_tvalid;
    
    reg     [X_WIDTH-1:0]           st3_x;
    reg     [Y_WIDTH-1:0]           st3_y;
    reg     [TUSER_WIDTH-1:0]       st3_tuser;
    reg                             st3_tlast;
    reg     [TDATA_WIDTH-1:0]       st3_tdata;
    wire    [TDATA_WIDTH-1:0]       st3_tprev;
    reg                             st3_tvalid;
    
    always @(posedge aclk) begin
        if ( cke ) begin
            // stage 0
            st0_tuser <= s_axi4s_tuser;
            st0_tlast <= s_axi4s_tlast;
            st0_tdata <= s_axi4s_tdata;
            
            // stage 1
            if ( st0_tvalid && st0_tuser[0] ) begin
                st1_x <= {X_WIDTH{1'b0}};
                st1_y <= {Y_WIDTH{1'b0}};
            end
            else begin
                if ( st1_tvalid ) begin
                    st1_x <= st1_x + 1'b1;
                    if ( st1_tlast ) begin
                        st1_x <= {X_WIDTH{1'b0}};
                        st1_y <= st1_y + 1'b1;
                    end
                end
            end
            st1_tuser <= st0_tuser;
            st1_tlast <= st0_tlast;
            st1_tdata <= st0_tdata;
            
            // stage2
            st2_x     <= st1_x;
            st2_y     <= st1_y;
            st2_tuser <= st1_tuser;
            st2_tlast <= st1_tlast;
            st2_tdata <= st1_tdata;
            
            // stage3
            st3_x     <= st2_x;
            st3_y     <= st2_y;
            st3_tuser <= st2_tuser;
            st3_tlast <= st2_tlast;
            st3_tdata <= st2_tdata;
        end
    end
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_tvalid  <= 1'b0;
            st1_tvalid  <= 1'b0;
            st2_tvalid  <= 1'b0;
            st3_tvalid  <= 1'b0;
        end
        else if ( cke ) begin
            st0_tvalid  <= s_axi4s_tvalid;
            st1_tvalid  <= st0_tvalid;
            st2_tvalid  <= st1_tvalid;
            st3_tvalid  <= st2_tvalid;
        end
    end
    
    assign st3_tprev   = ram_rd_dout;
    assign ram_rd_addr = {st1_y, st1_x};
    
    
    
    // interpolation
    wire    [X_WIDTH-1:0]           sum_x;
    wire    [Y_WIDTH-1:0]           sum_y;
    wire    [TUSER_WIDTH-1:0]       sum_tuser;
    wire                            sum_tlast;
    wire    [TDATA_WIDTH-1:0]       sum_tdata;
    wire                            sum_tvalid;
    
    jelly_linear_interpolation
            #(
                .USER_WIDTH         (TUSER_WIDTH+1+Y_WIDTH+X_WIDTH),
                .RATE_WIDTH         (RATE_WIDTH),
                .COMPONENT_NUM      (COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .DATA_SIGNED        (0),
                .ROUNDING           (ROUNDING),
                .COMPACT            (COMPACT),
                .BLENDING           (1)
            )
        i_linear_interpolation
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (cke),
                
                .s_user             ({st3_tuser, st3_tlast, st3_y, st3_x}),
                .s_rate             (param_rate),
                .s_data0            (st3_tdata),
                .s_data1            (st3_tprev),
                .s_valid            (st3_tvalid),
                
                .m_user             ({sum_tuser, sum_tlast, sum_y, sum_x}),
                .m_data             ({sum_tdata}),
                .m_valid            (sum_tvalid)
            );
    
    assign ram_wr_en   = sum_tvalid;
    assign ram_wr_addr = {sum_y, sum_x};
    assign ram_wr_din  = sum_tdata;
    
    // output
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
                
                .s_data             ({sum_tuser, sum_tlast, sum_tdata}),
                .s_valid            (sum_tvalid),
                .s_ready            (s_axi4s_tready),
                
                .m_data             ({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata}),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    assign cke = s_axi4s_tready && aclken;
    
    
endmodule



`default_nettype wire



// end of file
