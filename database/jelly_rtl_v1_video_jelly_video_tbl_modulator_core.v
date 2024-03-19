// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_tbl_modulator_core
        #(
            parameter   TUSER_WIDTH   = 1,
            parameter   TDATA_WIDTH   = 8,
            parameter   ADDR_WIDTH    = 6,
            parameter   MEM_SIZE      = (1 << ADDR_WIDTH),
            parameter   RAM_TYPE      = "distributed",
            parameter   FILLMEM_DATA  = 127,
            parameter   M_SLAVE_REGS  = 1,
            parameter   M_MASTER_REGS = 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire    [ADDR_WIDTH-1:0]    param_end,
            input   wire                        param_inv,
            
            input   wire                        wr_clk,
            input   wire                        wr_en,
            input   wire    [ADDR_WIDTH-1:0]    wr_addr,
            input   wire    [TDATA_WIDTH-1:0]   wr_din,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [0:0]               m_axi4s_tbinary,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    wire                            cke;
    
    // table
    wire    [ADDR_WIDTH-1:0]        rd_addr;
    wire    [TDATA_WIDTH-1:0]       rd_dout;
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (TDATA_WIDTH),
                .MEM_SIZE       (MEM_SIZE),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1),
                
                .FILLMEM        (1),
                .FILLMEM_DATA   (FILLMEM_DATA)
            )
        i_ram_simple_dualport
            (
                .wr_clk         (wr_clk),
                .wr_en          (wr_en),
                .wr_addr        (wr_addr),
                .wr_din         (wr_din),
                
                .rd_clk         (aclk),
                .rd_en          (cke),
                .rd_regcke      (cke),
                .rd_addr        (rd_addr),
                .rd_dout        (rd_dout)
            );
    
    
    // control
    reg     [TUSER_WIDTH-1:0]       st0_tuser;
    reg                             st0_tlast;
    reg     [TDATA_WIDTH-1:0]       st0_tdata;
    reg                             st0_tvalid;
    
    reg     [ADDR_WIDTH-1:0]        st1_addr;
    reg     [TUSER_WIDTH-1:0]       st1_tuser;
    reg                             st1_tlast;
    reg     [TDATA_WIDTH-1:0]       st1_tdata;
    reg                             st1_tvalid;
    
    reg     [TUSER_WIDTH-1:0]       st2_tuser;
    reg                             st2_tlast;
    reg     [TDATA_WIDTH-1:0]       st2_tdata;
    reg                             st2_tvalid;
    
    wire    [TDATA_WIDTH-1:0]       st3_th;
    reg     [TUSER_WIDTH-1:0]       st3_tuser;
    reg                             st3_tlast;
    reg     [TDATA_WIDTH-1:0]       st3_tdata;
    reg                             st3_tvalid;
    
    reg     [TUSER_WIDTH-1:0]       st4_tuser;
    reg                             st4_tlast;
    reg     [0:0]                   st4_tbinary;
    reg     [TDATA_WIDTH-1:0]       st4_tdata;
    reg                             st4_tvalid;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_tuser   <= {TUSER_WIDTH{1'bx}};
            st0_tlast   <= 1'bx;
            st0_tdata   <= {TDATA_WIDTH{1'bx}};
            st0_tvalid  <= 1'b0;
            
            st1_addr    <= {ADDR_WIDTH{1'bx}};
            st1_tuser   <= {TUSER_WIDTH{1'bx}};
            st1_tlast   <= 1'bx;
            st1_tdata   <= {TDATA_WIDTH{1'bx}};
            st1_tvalid  <= 1'b0;
            
            st2_tuser   <= {TUSER_WIDTH{1'bx}};
            st2_tlast   <= 1'bx;
            st2_tdata   <= {TDATA_WIDTH{1'bx}};
            st2_tvalid  <= 1'b0;
            
            st3_tuser   <= {TUSER_WIDTH{1'bx}};
            st3_tlast   <= 1'bx;
            st3_tdata   <= {TDATA_WIDTH{1'bx}};
            st3_tvalid  <= 1'b0;
            
            st4_tuser   <= {TUSER_WIDTH{1'bx}};
            st4_tlast   <= 1'bx;
            st4_tdata   <= {TDATA_WIDTH{1'bx}};
            st4_tbinary <= 1'bx;
            st4_tvalid  <= 1'b0;
        end
        else if ( cke ) begin
            // stage 0
            st0_tuser   <= s_axi4s_tuser;
            st0_tlast   <= s_axi4s_tlast;
            st0_tdata   <= s_axi4s_tdata;
            st0_tvalid  <= s_axi4s_tvalid;
            
            // stage 1
            if ( st0_tvalid && st0_tuser[0] ) begin
                if ( st1_addr != param_end ) begin
                    st1_addr <= st1_addr + 1'b1;
                end
                else begin
                    st1_addr <= {ADDR_WIDTH{1'b0}};
                end
            end
            st1_tuser  <= st0_tuser;
            st1_tlast  <= st0_tlast;
            st1_tdata  <= st0_tdata;
            st1_tvalid <= st0_tvalid;
            
            // stage 2
            st2_tuser  <= st1_tuser;
            st2_tlast  <= st1_tlast;
            st2_tdata  <= st1_tdata;
            st2_tvalid <= st1_tvalid;
            
            // stage 3
            st3_tuser  <= st2_tuser;
            st3_tlast  <= st2_tlast;
            st3_tdata  <= st2_tdata;
            st3_tvalid <= st2_tvalid;
            
            // stage 4
            st4_tuser  <= st3_tuser;
            st4_tlast  <= st3_tlast;
            st4_tdata  <= st3_tdata;
            st4_tvalid <= st3_tvalid;
            if ( st3_tdata > st3_th ) begin
                st4_tbinary <= 1'b1 ^ param_inv;
            end
            else begin
                st4_tbinary <= 1'b0 ^ param_inv;
            end
        end
    end
    
    assign rd_addr = st1_addr;
    assign st3_th  = rd_dout;
    
    
    // output
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (TUSER_WIDTH+1+1+TDATA_WIDTH),
                .SLAVE_REGS         (M_SLAVE_REGS),
                .MASTER_REGS        (M_MASTER_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (aclken),
                
                .s_data             ({st4_tuser, st4_tlast, st4_tbinary, st4_tdata}),
                .s_valid            (st4_tvalid),
                .s_ready            (s_axi4s_tready),
                
                .m_data             ({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tbinary, m_axi4s_tdata}),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    assign cke = s_axi4s_tready && aclken;
    
    
endmodule


`default_nettype wire


// end of file
