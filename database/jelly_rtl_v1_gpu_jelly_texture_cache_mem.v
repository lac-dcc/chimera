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



module jelly_texture_cache_mem
        #(
            parameter   USER_WIDTH           = 1,
            parameter   COMPONENT_NUM        = 1,
            parameter   COMPONENT_DATA_WIDTH = 24,
            parameter   TBL_ADDR_WIDTH       = 6,
            parameter   TBL_MEM_SIZE         = (1 << TBL_ADDR_WIDTH),
            parameter   PIX_ADDR_WIDTH       = 4,
            parameter   S_DATA_SIZE          = 1,
            parameter   M_DATA_SIZE          = 0,
            parameter   RAM_TYPE             = "block",
            parameter   MASTER_REGS          = 1,
            
            // local
            parameter   S_DATA_WIDTH         = ((COMPONENT_NUM * COMPONENT_DATA_WIDTH) << S_DATA_SIZE),
            parameter   M_DATA_WIDTH         = ((COMPONENT_NUM * COMPONENT_DATA_WIDTH) << M_DATA_SIZE)
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            endian,
            
            output  wire                            busy,
            
            input   wire    [M_DATA_WIDTH-1:0]      param_blank_value,
            
            input   wire    [USER_WIDTH-1:0]        s_user,
            input   wire                            s_last,
            input   wire    [COMPONENT_NUM-1:0]     s_we,
            input   wire    [S_DATA_WIDTH-1:0]      s_wdata,
            input   wire    [TBL_ADDR_WIDTH-1:0]    s_tbl_addr,
            input   wire    [PIX_ADDR_WIDTH-1:0]    s_pix_addr,
            input   wire                            s_strb,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            output  wire    [USER_WIDTH-1:0]        m_user,
            output  wire                            m_last,
            output  wire    [M_DATA_WIDTH-1:0]      m_data,
            output  wire                            m_strb,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    localparam  MEM_ADDR_WIDTH    = PIX_ADDR_WIDTH - S_DATA_SIZE;
    localparam  SEL_WIDTH         = S_DATA_SIZE > M_DATA_SIZE ? S_DATA_SIZE - M_DATA_SIZE : 1;
    localparam  S_COMPONENT_WIDTH = (COMPONENT_DATA_WIDTH << S_DATA_SIZE);
    localparam  M_COMPONENT_WIDTH = (COMPONENT_DATA_WIDTH << M_DATA_SIZE);
    
    
    genvar                          i;
    
    
    //  cahce memory read
    wire                            cke;
    
    wire    [USER_WIDTH-1:0]        st0_user      = s_user;
    wire                            st0_last      = s_last;
    wire                            st0_strb      = s_strb;
    wire    [COMPONENT_NUM-1:0]     st0_we        = s_we;
    wire    [S_DATA_WIDTH-1:0]      st0_wdata     = s_wdata;
    wire    [TBL_ADDR_WIDTH-1:0]    st0_tbl_addr  = s_tbl_addr;
    wire    [MEM_ADDR_WIDTH-1:0]    st0_addr      = (s_pix_addr >> S_DATA_SIZE);    //({s_tbl_addr, s_pix_addr} >> S_DATA_SIZE);
    wire    [SEL_WIDTH-1:0]         st0_sel       = (s_pix_addr >> M_DATA_SIZE);    //({s_tbl_addr, s_pix_addr} >> M_DATA_SIZE);
    wire                            st0_valid     = s_valid;
    
    reg     [USER_WIDTH-1:0]        st1_user;
    reg                             st1_last;
    reg                             st1_strb;
    reg     [SEL_WIDTH-1:0]         st1_sel;
    reg                             st1_valid;
    
    reg     [USER_WIDTH-1:0]        st2_user;
    reg                             st2_last;
    reg                             st2_strb;
    reg     [SEL_WIDTH-1:0]         st2_sel;
    reg                             st2_valid;
    
    wire    [S_DATA_WIDTH-1:0]      mem_rdata;
    wire    [M_DATA_WIDTH-1:0]      read_data;
    
    reg     [USER_WIDTH-1:0]        st3_user;
    reg                             st3_last;
    reg                             st3_strb;
    reg     [M_DATA_WIDTH-1:0]      st3_data;
    reg                             st3_valid;
    
    
    generate
    for ( i = 0; i < COMPONENT_NUM; i = i+1 ) begin : mem_loop
        // CACHE-RAM
        jelly_ram_singleport
                #(
                    .ADDR_WIDTH         (TBL_ADDR_WIDTH + MEM_ADDR_WIDTH),
                    .MEM_SIZE           (TBL_MEM_SIZE << MEM_ADDR_WIDTH),
                    .DATA_WIDTH         (S_COMPONENT_WIDTH),
                    .RAM_TYPE           (RAM_TYPE),
                    .DOUT_REGS          (1)
                )
            i_ram_singleport
                (
                    .clk                (clk),
                    .en                 (cke),
                    .regcke             (cke),
                    
                    .we                 (st0_we[i]),
                    .addr               ({st0_tbl_addr, st0_addr}),
                    .din                (st0_wdata[S_COMPONENT_WIDTH*i +: S_COMPONENT_WIDTH]),
                    .dout               (mem_rdata[S_COMPONENT_WIDTH*i +: S_COMPONENT_WIDTH])
                );
        
        jelly_multiplexer
                #(
                    .SEL_WIDTH          (S_DATA_SIZE - M_DATA_SIZE),
                    .OUT_WIDTH          (M_COMPONENT_WIDTH)
                )
            i_multiplexer
                (
                    .endian             (endian),
                    .sel                (st2_sel),
                    .din                (mem_rdata[S_COMPONENT_WIDTH*i +: S_COMPONENT_WIDTH]),
                    .dout               (read_data[M_COMPONENT_WIDTH*i +: M_COMPONENT_WIDTH])
                );
    end
    endgenerate
    
    
    // pipeline
    always @(posedge clk) begin
        if ( reset ) begin
            st1_user   <= {USER_WIDTH{1'bx}};
            st1_last   <= 1'bx;
            st1_strb   <= 1'bx;
            st1_sel    <= {SEL_WIDTH{1'bx}};
            st1_valid  <= 1'b0;
            
            st2_user   <= {USER_WIDTH{1'bx}};
            st2_last   <= 1'bx;
            st2_strb   <= 1'bx;
            st2_sel    <= {SEL_WIDTH{1'bx}};
            st2_valid  <= 1'b0;
            
            st3_user   <= {USER_WIDTH{1'bx}};
            st3_last   <= 1'bx;
            st3_strb   <= 1'bx;
            st3_data   <= {M_DATA_WIDTH{1'bx}};
            st3_valid  <= 1'b0;
        end
        else if ( cke ) begin
            // stage1
            st1_user      <= st0_user;
            st1_last      <= st0_last;
            st1_strb      <= st0_strb;
            st1_sel       <= st0_sel;
            st1_valid     <= st0_valid;
            
            // stage2
            st2_user      <= st1_user;
            st2_last      <= st1_last;
            st2_strb      <= st1_strb;
            st2_sel       <= st1_sel;
            st2_valid     <= st1_valid;
            
            // stage3
            st3_user      <= st2_user;
            st3_last      <= st2_last;
            st3_strb      <= st2_strb;
            st3_data      <= st2_strb ? read_data : param_blank_value;
            st3_valid     <= st2_valid;
        end
    end
    
    
    // output
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (USER_WIDTH + 1 + 1 + M_DATA_WIDTH),
                .SLAVE_REGS         (1),
                .MASTER_REGS        (MASTER_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_data             ({st3_user, st3_last, st3_strb, st3_data}),
                .s_valid            (st3_valid),
                .s_ready            (cke),
                
                .m_data             ({m_user, m_last, m_strb, m_data}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    assign s_ready = cke;
    
    assign busy    = (!cke || st0_valid || st1_valid || st2_valid || st3_valid);
    
endmodule



`default_nettype wire


// end of file
